#!/usr/bin/env bash
# tr181-dump.sh — Pull live Linux/Wi-Fi state and present it using
# TR-181 (Device:2) parameter paths. Not a real CWMP/USP agent —
# just data shaped like TR-181 for inspection and learning.
#
# Usage:
#   ./tr181-dump.sh                  # everything except the Wi-Fi scan
#   ./tr181-dump.sh --scan           # include NeighboringWiFiDiagnostic (needs sudo)
#   ./tr181-dump.sh --filter Radio   # only print paths matching "Radio"

set -u
WLAN="${WLAN:-wlan0}"
ETH="${ETH:-eth0}"
SCAN=0
FILTER=""
for a in "$@"; do
  case "$a" in
    --scan) SCAN=1 ;;
    --filter) shift; FILTER="${1:-}" ;;
    --filter=*) FILTER="${a#--filter=}" ;;
  esac
done

# -------- helpers --------
p() {  # print "Path = value" (skips if value empty)
  local path="$1" val="${2-}"
  [ -z "$val" ] && return
  if [ -n "$FILTER" ] && [[ "$path" != *"$FILTER"* ]]; then return; fi
  printf '%s = %s\n' "$path" "$val"
}

have() { command -v "$1" >/dev/null 2>&1; }

# -------- Device.DeviceInfo --------
p "Device.DeviceInfo.Manufacturer"    "Raspberry Pi Foundation"
p "Device.DeviceInfo.ModelName"       "$(tr -d '\0' </proc/device-tree/model 2>/dev/null)"
p "Device.DeviceInfo.SerialNumber"    "$(awk -F': ' '/Serial/{print $2}' /proc/cpuinfo)"
p "Device.DeviceInfo.HardwareVersion" "$(awk -F': ' '/Revision/{print $2}' /proc/cpuinfo)"
p "Device.DeviceInfo.SoftwareVersion" "$(uname -r)"
p "Device.DeviceInfo.UpTime"          "$(awk '{printf "%d", $1}' /proc/uptime)"
p "Device.DeviceInfo.ProcessorNumberOfEntries" "$(nproc)"
read -r mem_total mem_free <<<"$(awk '/MemTotal/{t=$2} /MemAvailable/{f=$2} END{print t" "f}' /proc/meminfo)"
p "Device.DeviceInfo.MemoryStatus.Total" "$mem_total"
p "Device.DeviceInfo.MemoryStatus.Free"  "$mem_free"

# -------- Device.Time --------
p "Device.Time.CurrentLocalTime" "$(date -Iseconds)"
p "Device.Time.LocalTimeZone"    "$(cat /etc/timezone 2>/dev/null)"

# -------- Device.Ethernet.Interface --------
if [ -d "/sys/class/net/$ETH" ]; then
  base="Device.Ethernet.Interface.1"
  oper=$(cat /sys/class/net/$ETH/operstate 2>/dev/null)
  [ "$oper" = "up" ] && status="Up" || status="Down"
  p "$base.Name"       "$ETH"
  p "$base.Status"     "$status"
  p "$base.MACAddress" "$(cat /sys/class/net/$ETH/address 2>/dev/null)"
  p "$base.MaxBitRate" "$(cat /sys/class/net/$ETH/speed 2>/dev/null)"
  p "$base.Stats.BytesSent"     "$(cat /sys/class/net/$ETH/statistics/tx_bytes 2>/dev/null)"
  p "$base.Stats.BytesReceived" "$(cat /sys/class/net/$ETH/statistics/rx_bytes 2>/dev/null)"
  p "$base.Stats.PacketsSent"     "$(cat /sys/class/net/$ETH/statistics/tx_packets 2>/dev/null)"
  p "$base.Stats.PacketsReceived" "$(cat /sys/class/net/$ETH/statistics/rx_packets 2>/dev/null)"
  p "$base.Stats.ErrorsSent"     "$(cat /sys/class/net/$ETH/statistics/tx_errors 2>/dev/null)"
  p "$base.Stats.ErrorsReceived" "$(cat /sys/class/net/$ETH/statistics/rx_errors 2>/dev/null)"
fi

# -------- Device.IP.Interface --------
idx=0
for iface in $(ls /sys/class/net/ | grep -v '^lo$'); do
  idx=$((idx+1))
  base="Device.IP.Interface.$idx"
  oper=$(cat /sys/class/net/$iface/operstate 2>/dev/null)
  [ "$oper" = "up" ] && status="Up" || status="Down"
  p "$base.Name"   "$iface"
  p "$base.Status" "$status"
  p "$base.MaxMTUSize" "$(cat /sys/class/net/$iface/mtu 2>/dev/null)"
  # IPv4
  j=0
  while read -r addr; do
    [ -z "$addr" ] && continue
    j=$((j+1))
    ip4="${addr%/*}"; mask="${addr#*/}"
    p "$base.IPv4Address.$j.IPAddress" "$ip4"
    p "$base.IPv4Address.$j.SubnetMask" "/$mask"
  done < <(ip -4 -o addr show dev "$iface" 2>/dev/null | awk '{print $4}')
  # IPv6
  j=0
  while read -r addr; do
    [ -z "$addr" ] && continue
    j=$((j+1))
    p "$base.IPv6Address.$j.IPAddress" "${addr%/*}"
    p "$base.IPv6Address.$j.Prefix"    "/${addr#*/}"
  done < <(ip -6 -o addr show dev "$iface" 2>/dev/null | awk '{print $4}')
done

# -------- Device.DNS --------
j=0
while read -r ns; do
  j=$((j+1))
  p "Device.DNS.Client.Server.$j.DNSServer" "$ns"
done < <(awk '/^nameserver/{print $2}' /etc/resolv.conf 2>/dev/null)

# -------- Device.WiFi --------
if [ -d "/sys/class/net/$WLAN" ] && have iw; then
  # Radio
  p "Device.WiFi.RadioNumberOfEntries" "1"
  rbase="Device.WiFi.Radio.1"
  p "$rbase.Name"   "$WLAN"
  p "$rbase.Enable" "true"

  # link info (only meaningful if connected)
  link_info=$(iw dev "$WLAN" link 2>/dev/null)
  info=$(iw dev "$WLAN" info 2>/dev/null)

  freq=$(echo "$link_info" | awk '/freq:/ {print $2; exit}')
  if [ -z "$freq" ]; then
    freq=$(echo "$info" | awk '/channel/ {gsub("\\(",""); print $2; exit}')
  fi
  # channel from freq
  if [ -n "$freq" ]; then
    f_int=${freq%.*}
    if   [ "$f_int" -lt 2500 ]; then band="2.4GHz"; ch=$(( (f_int - 2407) / 5 ));
    elif [ "$f_int" -lt 5925 ]; then band="5GHz";   ch=$(( (f_int - 5000) / 5 ));
    else band="6GHz"; ch=$(( (f_int - 5950) / 5 )); fi
    p "$rbase.OperatingFrequencyBand" "$band"
    p "$rbase.Channel" "$ch"
  fi
  # channel width
  width=$(echo "$info" | awk -F'width: ' '/width:/{print $2}' | head -n1 | tr -d ',' | awk '{print $1$2}')
  p "$rbase.CurrentOperatingChannelBandwidth" "$width"

  # supported standards via phy
  phy=$(echo "$info" | awk '/wiphy/ {print "phy"$2; exit}')
  if [ -n "$phy" ]; then
    stds=$(iw phy "$phy" info 2>/dev/null | awk '
      /VHT Capabilities/ {v=1}
      /HE Iftypes/       {h=1}
      /HT20|HT40/        {n=1}
      END {
        out="a/b/g"
        if (n) out=out"/n"
        if (v) out=out"/ac"
        if (h) out=out"/ax"
        print out
      }')
    p "$rbase.SupportedStandards" "$stds"
  fi

  # SSID + connection
  sbase="Device.WiFi.SSID.1"
  p "$sbase.Name" "$WLAN"
  p "$sbase.LowerLayers" "$rbase"
  p "$sbase.MACAddress" "$(cat /sys/class/net/$WLAN/address 2>/dev/null)"
  ssid=$(echo "$link_info"  | awk -F'SSID: ' '/SSID:/{print $2; exit}')
  bssid=$(echo "$link_info" | awk '/Connected to/{print $3; exit}')
  p "$sbase.SSID" "$ssid"
  p "$sbase.BSSID" "$bssid"
  [ -n "$ssid" ] && p "$sbase.Status" "Up" || p "$sbase.Status" "Down"

  # SSID stats
  p "$sbase.Stats.BytesSent"     "$(cat /sys/class/net/$WLAN/statistics/tx_bytes 2>/dev/null)"
  p "$sbase.Stats.BytesReceived" "$(cat /sys/class/net/$WLAN/statistics/rx_bytes 2>/dev/null)"
  p "$sbase.Stats.PacketsSent"     "$(cat /sys/class/net/$WLAN/statistics/tx_packets 2>/dev/null)"
  p "$sbase.Stats.PacketsReceived" "$(cat /sys/class/net/$WLAN/statistics/rx_packets 2>/dev/null)"
  p "$sbase.Stats.ErrorsSent"     "$(cat /sys/class/net/$WLAN/statistics/tx_errors 2>/dev/null)"
  p "$sbase.Stats.ErrorsReceived" "$(cat /sys/class/net/$WLAN/statistics/rx_errors 2>/dev/null)"

  # EndPoint (Pi is a station)
  ebase="Device.WiFi.EndPoint.1"
  p "$ebase.SSIDReference" "$sbase"
  p "$ebase.Status"        "$( [ -n "$ssid" ] && echo Connected || echo Disabled )"
  sig=$(echo "$link_info" | awk '/signal:/{print $2; exit}')
  txr=$(echo "$link_info" | awk '/tx bitrate:/{print $3; exit}')
  rxr=$(echo "$link_info" | awk '/rx bitrate:/{print $3; exit}')
  p "$ebase.Stats.SignalStrength"     "$sig"
  p "$ebase.Stats.LastDataDownlinkRate" "$rxr"
  p "$ebase.Stats.LastDataUplinkRate"   "$txr"
  p "$ebase.Profile.1.SSID"  "$ssid"
  p "$ebase.Profile.1.Location" "$bssid"

  # Neighboring scan
  if [ "$SCAN" = "1" ]; then
    echo "# (running scan — needs sudo, ~5s)" >&2
    scan=$(sudo iw dev "$WLAN" scan 2>/dev/null)
    if [ -n "$scan" ]; then
      i=0
      while IFS= read -r line; do
        case "$line" in
          BSS*) i=$((i+1)); nb="Device.WiFi.NeighboringWiFiDiagnostic.Result.$i"
                bssid_n=$(echo "$line" | awk '{print $2}' | cut -d'(' -f1)
                p "$nb.BSSID" "$bssid_n" ;;
          *freq:*)   p "$nb.OperatingFrequencyBand" "$(echo "$line" | awk '{print $2}')" ;;
          *signal:*) p "$nb.SignalStrength" "$(echo "$line" | awk '{print $2}')" ;;
          *SSID:*)   p "$nb.SSID" "$(echo "$line" | awk -F'SSID: ' '{print $2}')" ;;
        esac
      done <<<"$scan"
      p "Device.WiFi.NeighboringWiFiDiagnostic.ResultNumberOfEntries" "$i"
    fi
  fi
fi