---
title: "Selfhosted Connectivity"
date: 2026-06-17
draft: false
tags: ["HomeLab Open-Telemetry","TapMap vs PortMaster","Bind9 vs PiHole vs Technitum","WireShark","TR471","iroh"]
description: 'A homelab evaluation of WIFI metrics via EasyMesh and TR-181.'
url: 'selfhosted-connectivity'
---

**TL;DR**


```sh
git pull
make devices-remember ID=192.168.1.12 NAME=laptop TAGS=trusted
make devices-remember ID=192.168.1.13 NAME=appliance TAGS=iot
make devices-list
make snapshot
make devices-history


make wifi-watch SAMPLES=12 INTERVAL=5
```

```sh
sudo apt install iperf3
iperf3 -s -p 5205 #nano config.yaml
make performance
```

Home connectivity is not just "do I have internet?". 

For a useful homelab, I want repeatable ways to measure throughput, latency under load, Wi-Fi quality, LAN inventory, DNS behavior, and eventually TR-181/EasyMesh data from the router itself.

## Intro

Whether the uplink is 4G, coax, fiber, or Starlink, the home network becomes the base layer for everything else: self-hosted apps, backups, media, VPN, local AI services, and family communication.

This post is a cleanup of my June 2026 connectivity notes.

The thread started with a Raspberry Pi connected over Wi-Fi, a TR-471 speed test experiment, and a simple question: **what can I actually observe from inside my LAN, and what data only the router/AP can know?**

The short answer: a Pi can tell me a lot about its own link and the IP devices around it, but per-client Wi-Fi quality lives on the AP. That is where OpenWrt, TR-181, bbfdm, obuspa, and EasyMesh become interesting.

{{< cards cols="2" >}}
  {{< card link="https://github.com/BroadbandForum/obudpst" title="TR-471 Speed Test" subtitle="Broadband Forum UDP performance test tool" >}}
  {{< card link="https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/pi-connectivity" title="Pi Connectivity" subtitle="Connectivity checks inside hermesagent pushed to Github" >}}
{{< /cards >}}

## The Problem

I had several related but different questions mixed together:

- How good is the Pi's current Wi-Fi connection?
- Can I measure throughput and latency in a repeatable way?
- Can `nmap` or similar tools tell me Wi-Fi quality for other devices?
- What does TR-181 expose, and what does it need from the underlying device?
- Would OpenWrt on a Pi unlock useful BBF/TR-181 fields?
- Where do tools like Wireshark, Pi-hole, AdGuard, Unbound, TapMap, and LAN scanning fit?

Those questions belong in one connectivity post, but not as one giant paste of terminal logs. 

The reader needs the conclusion first, then the optional details.

## First Measurements

The Pi was connected to the `Piszymsiu` SSID with strong 5 GHz signal:

```bash
iwconfig wlan0
iw dev wlan0 link
```

The relevant readings were:

| Metric | Reading | Meaning |
|---|---:|---|
| Signal | about `-47` to `-50 dBm` | Excellent RSSI |
| Frequency | `5500 MHz` | 5 GHz, channel 100 |
| Link rate | `433.3 Mbit/s` | Wi-Fi 5 / 802.11ac, likely 80 MHz channel |
| Neighbor scan | lower 5 GHz was busier | Channel 100 looked like the cleaner choice |

The useful rule of thumb:

| RSSI | Quality |
|---:|---|
| `-30` to `-50 dBm` | Excellent |
| `-50` to `-60 dBm` | Good |
| `-60` to `-70 dBm` | Fair |
| below `-70 dBm` | Weak / unreliable |

The scan also showed the ISP gateway exposing multiple radios under the same SSID. In practice, the Pi was band-steered to the cleanest-looking 5 GHz radio.

{{< details title="Wi-Fi commands and sample readings" closed="true" >}}

```bash
iwconfig wlan0
iw dev wlan0 link
watch -n 1 'iwconfig wlan0 | grep Signal'
cat /proc/net/wireless
sudo iw dev wlan0 survey dump
sudo iw dev wlan0 scan | grep -E "SSID|freq|signal" | head -40
```

Sample link output:

```text
wlan0  IEEE 802.11  ESSID:"Piszymsiu"
       Link Quality=63/70  Signal level=-47 dBm

Connected to 2c:ec:f7:4b:b5:a8 (on wlan0)
    SSID: Piszymsiu
    freq: 5500.0
    signal: -49 dBm
    rx bitrate: 433.3 MBit/s
    tx bitrate: 433.3 MBit/s
```

Sample scan interpretation:

| SSID | Freq | Channel | Signal |
|---|---:|---:|---:|
| Piszymsiu | 5500 | 100 | -50 |
| Piszymsiu | 5180 | 36 | -54 |
| Piszymsiu | 2462 | 11 | -63 |
| GibInternet | 5180 | 36 | -56 |
| 5G-FELIKS | 5240 | 48 | -58 |
| Andaluzja_5G | 5220 | 44 | -89 |
| 5G-Vectra-WiFi-84D73A | 5200 | 40 | -83 |

`sudo iw dev wlan0 survey dump` is the command to look for channel noise. SNR is `signal - noise`; for example, `-49 dBm` signal and a typical `-95 dBm` noise floor gives about `46 dB` SNR.

{{< /details >}}

## TR-471 Throughput Testing

I also tested the Broadband Forum TR-471 style UDP speed test flow with `obudpst`.

```bash
# make server
make client SERVER=192.168.1.18
make client SERVER=192.168.1.18 ARGS="--json --client-name $(hostname)"
# make analyze-file FILE=result_jalcocert-x300.json
```

The key result: the run sustained about **118.75 Mbps upload** with no packet loss at the selected sustain rate, but latency rose sharply under load.

That points to a link that can move data, but still deserves QoS/AQM attention if interactive traffic matters.

{{< details title="TR-471 raw JSON result" closed="true" >}}

```json
{
  "timestamp": "2026-06-11T10:09:12Z",
  "client": "jalcocert-x300",
  "server": "192.168.1.18",
  "direction": "upload",
  "datagram_size": 1450,
  "phases": {
    "ramp_up": [
      {"rate_mbps": 1, "throughput_mbps": 1.0, "loss_pct": 0, "avg_latency_ms": 9.8, "verdict": "PASS"},
      {"rate_mbps": 2, "throughput_mbps": 2.0, "loss_pct": 0, "avg_latency_ms": 9.8, "verdict": "PASS"},
      {"rate_mbps": 5, "throughput_mbps": 5.0, "loss_pct": 0, "avg_latency_ms": 9.7, "verdict": "PASS"},
      {"rate_mbps": 10, "throughput_mbps": 10.0, "loss_pct": 0, "avg_latency_ms": 10.9, "verdict": "PASS"},
      {"rate_mbps": 20, "throughput_mbps": 20.0, "loss_pct": 0, "avg_latency_ms": 11.2, "verdict": "PASS"},
      {"rate_mbps": 50, "throughput_mbps": 50.0, "loss_pct": 0, "avg_latency_ms": 12.1, "verdict": "PASS"},
      {"rate_mbps": 100, "throughput_mbps": 99.99, "loss_pct": 0, "avg_latency_ms": 85.6, "verdict": "PASS"},
      {"rate_mbps": 200, "throughput_mbps": 123.46, "loss_pct": 38.27, "avg_latency_ms": 249.4, "verdict": "FAIL"}
    ],
    "refine": [
      {"rate_mbps": 150.0, "throughput_mbps": 121.36, "loss_pct": 19.09, "avg_latency_ms": 274.4, "verdict": "FAIL"},
      {"rate_mbps": 125.0, "throughput_mbps": 117.01, "loss_pct": 6.39, "avg_latency_ms": 261.7, "verdict": "FAIL"},
      {"rate_mbps": 112.5, "throughput_mbps": 112.5, "loss_pct": 0, "avg_latency_ms": 161.1, "verdict": "PASS"},
      {"rate_mbps": 118.8, "throughput_mbps": 118.75, "loss_pct": 0, "avg_latency_ms": 171.1, "verdict": "PASS"},
      {"rate_mbps": 121.9, "throughput_mbps": 120.51, "loss_pct": 1.11, "avg_latency_ms": 246.6, "verdict": "FAIL"}
    ],
    "sustain": {
      "rate_mbps": 118.8,
      "throughput_mbps": 118.75,
      "loss_pct": 0,
      "avg_latency_ms": 211.3
    }
  },
  "max_capacity_mbps": 118.8,
  "measured_mbps": 118.75,
  "packet_loss_pct": 0,
  "avg_latency_ms": 211.3,
  "_diagnostics": {
    "idle_latency_ms": 9.7,
    "loaded_latency_ms": 85.6,
    "saturation_rate_mbps": 100,
    "bufferbloat_ratio": 8.8,
    "est_buffer_formatted": "948.7 KB",
    "link_classification": "Fast Ethernet (100 Mbps) or 802.11n 2.4 GHz Wi-Fi - mild bufferbloat",
    "recommendations": [
      "Moderate bufferbloat - consider QoS or AQM tuning"
    ]
  }
}
```

Local result links from the lab:

- `http://192.168.1.2:3034/hermesagent/tr471-checks.git`
- `http://192.168.1.2:3034/hermesagent/tr471-checks/raw/commit/9b50679057e339b8b04bcfe0968bcd7acba13796/results.md`

{{< /details >}}

## TR-181: The Data Model I Want

TR-181 is the Broadband Forum data model for describing customer-premises network devices. 

It is the vocabulary; TR-069/CWMP and TR-369/USP are protocols that can speak that vocabulary.

Example paths:

```text
Device.DeviceInfo.ModelName
Device.WiFi.Radio.1.Channel
Device.WiFi.SSID.1.SSID
Device.WiFi.AccessPoint.1.AssociatedDevice.1.SignalStrength
Device.IP.Interface.1.IPv4Address.1.IPAddress
```

The important distinction:

| Layer | Role |
|---|---|
| TR-181 | Data model: standardized parameter tree |
| TR-069 / CWMP | Older ISP remote-management protocol |
| TR-369 / USP | Newer push-capable protocol using MQTT/WebSocket/STOMP |
| obuspa | Broadband Forum open-source USP Agent |
| bbfdm | Linux/OpenWrt mapper that populates TR-181 leaves from real system state |

My local `tr181-dump.sh` is not a real USP Agent. It is a pragmatic script that shapes Linux state into TR-181-like paths so I can inspect the model.

```bash
~/tr181-dump.sh
~/tr181-dump.sh --scan
~/tr181-dump.sh --filter Radio
```

Covered branches:

- `Device.DeviceInfo.*`
- `Device.Time.*`
- `Device.Ethernet.Interface.1.*`
- `Device.IP.Interface.{i}.*`
- `Device.DNS.Client.Server.{i}.*`
- `Device.WiFi.Radio.1.*`
- `Device.WiFi.SSID.1.*`
- `Device.WiFi.EndPoint.1.*`
- `Device.WiFi.NeighboringWiFiDiagnostic.Result.{i}.*` with `--scan`

{{< callout type="warning" >}}
The Pi can expose its own station-side Wi-Fi state. It cannot magically expose AP-side data for every client unless it is acting as the AP, or it can query the real AP/router.
{{< /callout >}}

## Why OpenWrt Matters

OpenWrt itself is not "TR-181 by default", but it has the right substrate: `uci`, `ubus`, `netifd`, `hostapd`, `dnsmasq`, firewall state, DHCP leases, and Wi-Fi association data.

With `bbfdm + obuspa`, that state can become a proper TR-181/USP surface.

| Scenario | What improves |
|---|---|
| Pi on Raspberry Pi OS as a Wi-Fi station | Only local station state, roughly what `tr181-dump.sh` can infer |
| Pi on OpenWrt as a Wi-Fi station | More properly typed device, firewall, DHCP, routing, and USP Agent state, but still no AP client RSSI |
| Pi on OpenWrt as an AP/router | Adds `Device.WiFi.AccessPoint.*` and associated-device RSSI |
| ISP router on stock firmware | Often has TR-069/TR-181 internally, but the ISP sees it, not me |
| Router/OpenWrt gateway with bbfdm + obuspa | Best case: LAN clients, DHCP, NAT, firewall, Wi-Fi clients, and maybe WAN line stats if hardware supports it |

The biggest jump is not just "Raspberry Pi OS to OpenWrt". The biggest jump is **station to AP/gateway**. The AP is the device that has the useful per-client Wi-Fi truth.

## Seeing Other Devices' Wi-Fi Quality

`nmap` cannot tell me RSSI, band, bitrate, or noise for other devices. It works at IP/service level. Wi-Fi quality is a radio-layer property.

There are three real paths:

| Path | What it gives |
|---|---|
| Ask the AP/router | The best answer: per-client RSSI, band, bitrate, association state |
| Sniff from the Pi in monitor mode | What the Pi hears, useful proxy, not the AP's actual view |
| Ask each client | Accurate for that one client, but does not scale to phones/IoT |

For LAN inventory, `nmap` and ARP tools still matter:

```bash
sudo nmap -sn 192.168.1.0/24
sudo arp-scan --interface=wlan0 --localnet
ip neigh show
```

For AP-side Wi-Fi state on OpenWrt:

```bash
iwinfo phy0-ap0 assoclist
hostapd_cli all_sta
obuspa -c get Device.WiFi.AccessPoint.*.AssociatedDevice.*.SignalStrength
```

For monitor mode on a Pi 4, the onboard Broadcom radio needs `nexmon` for proper monitor mode. In practice, a separate USB Wi-Fi adapter is cleaner because one radio cannot comfortably stay connected and sniff at the same time.

## LAN Check

I also generated a LAN inventory for `192.168.1.0/24`. This is useful for the device inventory side of connectivity, but it does not prove anything about Wi-Fi signal.

The scan found 11 active hosts. A few devices were worth identifying more carefully: unknown IoT vendors, ESP32-style devices, randomized MACs, and the ISP gateway.

{{< details title="LAN inventory notes" closed="true" >}}

```text
LAN Check - 192.168.1.0/24
Date: 2026-05-18
Host: Raspberry Pi (192.168.1.18 on wlan0)
Method: ARP-based discovery and OUI lookup. No port scanning performed.
```

| IP | Vendor | Likely device |
|---|---|---|
| `.1` | Shenzhen SDMC Technology | Gateway/router |
| `.2` | ASRock Incorporation | Desktop PC |
| `.3` | TP-Link Systems Inc | TP-Link device |
| `.5` | Raspberry Pi Trading Ltd | Raspberry Pi |

Hosts worth a closer look:

1. `.11` Sichuan AI-Link - likely IoT ODM device.
2. `.12` Espressif - probably ESP32 or a smart device.
3. `.9` SJIT - uncommon OEM.
4. `.1` SDMC gateway - check firmware, remote admin, UPnP, WPS, credentials.
5. `.17` Versuni - smart appliance class.
6. `.3` TP-Link - verify firmware.
7. `.7` / `.16` randomized MACs - probably normal phones/laptops, but still identify them.

Targeted scan if needed:

```bash
sudo apt-get install -y nmap
sudo nmap -sV -sC -p- --script=safe 192.168.1.9 192.168.1.11 192.168.1.12 192.168.1.17
```

Network hygiene regardless of scan results:

- Put IoT on a guest network/VLAN when possible.
- Disable UPnP on the gateway.
- Disable WAN-side remote admin.
- Change default credentials.
- Use Pi-hole or AdGuard Home for DNS visibility.
- Diff `arp -an` periodically to spot new devices.

{{< /details >}}

## Wireshark, DNS, and TapMap

Connectivity debugging needs tools at different layers:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wireshark" title="Wireshark" subtitle="Packet capture and protocol inspection" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pihole" title="Pi-hole" subtitle="DNS-level visibility for the LAN" >}}
{{< /cards >}}

Wireshark is for packets and conversations: DNS failures, TCP resets, TLS handshakes, HTTP behavior, DHCP, mDNS, NTP, SMB, and `.pcap` captures.

DNS tools such as Pi-hole, AdGuard Home, and Unbound answer a different question: what names are devices resolving, and which clients are talking to which services?

TapMap is another useful local view for processes and traffic on the host:

```bash
docker run --rm \
  --network host \
  --pid host \
  -v ~/tapmap-data:/data \
  -e TAPMAP_IN_DOCKER=1 \
  olalie/tapmap:latest
```

Then open:

```text
http://localhost:8050/
```

{{< details title="Optional Wireshark setup and filters" closed="true" >}}

```bash
git clone /Home-Lab
cd .Home-Lab/z-homelab-setup/evolution
sudo docker compose -f 2605_docker-compose.yml up -d wireshark
```

Useful Wireshark filters:

```text
ip.addr == 192.168.1.50
tcp.port == 443
dns
http
```

Packet captures can contain sensitive metadata and sometimes application data. Treat saved `.pcap` files as confidential.

{{< /details >}}

## EasyMesh Direction

EasyMesh is interesting because it standardizes multi-AP coordination.

A controller coordinates one or more agents, and the mesh shares client metrics such as RSSI, capabilities, and load.

That matters for TR-181 because EasyMesh data can surface under paths such as:

```text
Device.WiFi.DataElements.*
```

Could I deploy an EasyMesh agent on a Pi? Yes, but the practical caveats are real:

- One radio is awkward because EasyMesh wants fronthaul and backhaul roles.
- A Pi 4 onboard Wi-Fi radio is not a great long-running AP.
- A USB Wi-Fi adapter makes the lab more realistic.
- A controller is still needed; for learning, the same OpenWrt/prplMesh box can run both controller and agent.
- Consumer mesh kits usually will not interoperate cleanly with a custom prplMesh lab.

The most useful lab setup would be:

1. Spare Pi or small router running OpenWrt.
2. USB Wi-Fi adapter acting as AP.
3. `bbfdm + obuspa` exposing TR-181/USP.
4. `prplMesh` running controller and agent roles.
5. Pi-hole/AdGuard providing DNS visibility.

## Self-Hosting Updates

These notes are not the core of the connectivity post, but they belong to the same maintenance window. I am keeping them collapsed so they remain findable without taking over the article.

{{< details title="Matrix, Nextcloud, rclone, and media restore notes" closed="true" >}}

Matrix Conduit:

```bash
cd ./Home-Lab/matrix-conduit
nano conduit.toml
docker compose up -d
curl -fsS https://what.everdomain.com/_matrix/client/versions
```

Nextcloud sync instance:

```bash
df -hT /mnt/data2tb /mnt/data1tb /mnt/backup2tb

sync_root="$(openssl rand -base64 24 | tr -d '=+/' | cut -c1-16)"
sync_pass="$(openssl rand -base64 24 | tr -d '=+/' | cut -c1-16)"

set_var() {
  key="$1"
  value="$2"
  if grep -q "^${key}=" .env; then
    sed -i "s|^${key}=.*|${key}=${value}|" .env
  else
    printf '\n%s=%s\n' "$key" "$value" >> .env
  fi
}

set_var MYSQL_ROOT_PASSWORD_SYNC "${sync_root}"
set_var MYSQL_PASSWORD_SYNC "${sync_pass}"
set_var MYSQL_DATABASE_SYNC "nextcloud_sync"
set_var MYSQL_USER_SYNC "nextcloud_sync"
set_var MYSQL_HOST_SYNC "nextclouddb-sync"
set_var NEXTCLOUD_TRUSTED_DOMAINS_SYNC "http://192.168.1.2:8069"

sudo docker compose -f 2605_docker-compose.yml up -d nextclouddb-sync nextcloud-app-sync
```

Cloudflare WAF reminder:

```bash
curl -X PATCH \
  "https://api.cloudflare.com/client/v4/zones/some/rulesets/thing/rules/secret" \
  -H "Authorization: Bearer $CF_AUTH_TOKEN" \
  -d '{
    "action": "block",
    "description": "allow countries",
    "enabled": true,
    "expression": "(http.host eq \"whatever.domain.com\" and not ip.src.country in {\"ES\" \"CH\"})",
    "id": "sth"
  }'
```

Rclone restore:

```bash
time rclone copy \
  "googledrive:x300-backup/data2tb/Z_BackUP_HD-SDD/Musica" \
  "/mnt/data2tb/restored/Z_BackUP_HD-SDD/Musica" \
  --progress

rclone copy \
  "googledrive:x300-backup/data2tb/Z_BackUP_HD-SDD/Z_FOTOS" \
  "/mnt/data2tb/restored/Z_BackUP_HD-SDD/Z_FOTOS" \
  --progress \
  --transfers 4 \
  --checkers 8

rclone check \
  "googledrive:x300-backup/data2tb/Z_BackUP_HD-SDD/Z_FOTOS" \
  "/mnt/data2tb/restored/Z_BackUP_HD-SDD/Z_FOTOS" \
  --one-way
```

Osmo/Jellyfin media copy:

```bash
mkdir -p ~/osmo-internal ~/osmo-sd
sudo mount /dev/sdc ~/osmo-internal
sudo mount /dev/sdd ~/osmo-sd

rsync -av --info=progress2 \
  --include='*/' \
  --include='*.MP4' \
  --include='*.mp4' \
  --exclude='*' \
  "$HOME/osmo-internal/" \
  "/home/jalcocert/Desktop/YoutubeVideos/OsmoAction/"

rsync -av --info=progress2 \
  --include='*/' \
  --include='*.MP4' \
  --include='*.mp4' \
  --exclude='*' \
  "$HOME/osmo-sd/" \
  "/home/jalcocert/Desktop/YoutubeVideos/OsmoAction/"
```

{{< /details >}}

## What I Learned

- The Pi's own Wi-Fi metrics are easy to collect with `iwconfig`, `iw`, and scan/survey commands.
- TR-471 style testing gives a better view than a simple speed test because it exposes loss and latency under load.
- `nmap` is useful for LAN inventory, not Wi-Fi quality.
- Per-client RSSI is AP-side truth. The router/AP is the device to query or replace.
- OpenWrt becomes much more valuable when the device is acting as AP/gateway, not merely as another Wi-Fi client.
- TR-181 is a useful schema, but it only becomes operationally rich when backed by real system state through something like `bbfdm`.

## What I Would Do Differently

I would separate future work into three smaller artifacts:

1. A repeatable `pi-connectivity` script for local Wi-Fi, DNS, LAN, and latency checks.
2. A router/AP lab note for OpenWrt, `bbfdm`, `obuspa`, and EasyMesh.
3. A monthly self-hosting update post for Matrix, Nextcloud, rclone, and media maintenance.

That split keeps the public post readable while still preserving the lab notebook trail.

## Durable Takeaways

- Connectivity observability starts at the LAN edge, but the richest Wi-Fi data lives on the AP.
- A Pi as a station is a good measurement client, not a full network observability source.
- TR-181 is most useful when a real agent maps it to live router state.
- DNS observability and packet capture solve different layers of the same home-network debugging problem.
- LAN inventory should be periodic, because self-hosted networks quietly accumulate devices.

## Conclusion

The current home network looks healthy from the Pi's point of view: strong 5 GHz RSSI, clean channel selection, and usable throughput.

The weak spot is observability, not raw connectivity.

The next serious step is not more ad hoc commands on the Pi. It is an AP/router-side lab: OpenWrt with `bbfdm`, `obuspa`, and possibly `prplMesh`, so the network can expose per-client Wi-Fi and LAN state through a standard model instead of scattered one-off checks.

```md
have a look to pi-connectivity and to tr471-vs-iperf3  wifi-tr181-notes.md and lan-check.md, do you think those repos and markdown provide some value for connectivity checks for a homelab?
```

```sh
cd /home/jalcocert/selfhosted-connectivity
make setup
make snapshot
make report
make server #http://192.168.1.18:8080/
```

Test this:

  cd /home/jalcocert/selfhosted-connectivity
  git pull
  make setup
make devices-init  selfhosted-connectivity devices init
make devices-list  selfhosted-connectivity devices list
  make snapshot
  make report
  sed -n '1,140p' data/reports/latest.md
  make server

  Then open:

  http://192.168.1.18:8080

  If devices.yaml already exists, devices init will refuse to overwrite it. Use this only if you want to reset it:


```sh
make performance
```

![alt text](/blog_img/data-experiments/connectivity-pi.png)

 git pull
  make setup
  make install-systemd-user
  make scheduler-status

  Run one scheduled snapshot immediately:

  make scheduler-run
  make scheduler-logs

  Default interval is 15 minutes. To install with a different interval:

  SELFHOSTED_CONNECTIVITY_INTERVAL=30min make install-systemd-user

  This uses systemctl --user, installs under ~/.config/systemd/user/, and does not require root.


```sh
git init && git add . && git commit -m "Initial commit: Starting " && gh repo create connectivity-checks --private --source=. --remote=origin --push
#git clone https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/pi-connectivity

#git clone

make install && make dev #requires .env.local
```

i have created this repo at forgejo for you, you have ssh access to it and can push the changes: http://192.168.1.2:3034/hermesagent/selfhosted-connectivity.git can we
  differenciate in features that the raspberry pi will be able to run (or the homelab where this project will be tested) versus the ones that it will be a server and a local client
  will need to interact with it?

---

## FAQ

### Selfhosted networking tools

1. https://github.com/n0-computer/iroh

>  IP addresses break, dial keys instead. Modular networking stack in Rust. 

2. [Wireshark](https://github.com/JAlcocerT/Home-Lab/tree/main/wireshark)

3. [Selfhosted DNS post](https://jalcocert.github.io/JAlcocerT/private-dns-with-docker/)

### Can `nmap` show Wi-Fi signal for other devices?

No. `nmap` works at the IP/service layer. RSSI, band, bitrate, and noise are radio-layer properties. Use the AP/router, monitor mode, or each client device.

### What is the difference between SSID and BSSID?

SSID is the network name. BSSID is the MAC address of a specific AP radio. One SSID can have several BSSIDs across bands, mesh nodes, or enterprise APs.

### Why does the AP know client RSSI better than the Pi?

RSSI is measured by the receiving radio. The Pi knows how loudly it hears the AP. The AP knows how loudly it hears each client. For client diagnostics, the AP-side number is usually the useful one.

### What is DFS, and why is channel 100 interesting?

DFS channels in 5 GHz are shared with radar systems. They can be less crowded, but the AP must move if radar is detected. Channel 100 was useful here because nearby lower 5 GHz channels looked busier.

### Would OpenWrt on the Pi add more TR-181 fields?

Yes, especially with `bbfdm + obuspa`, but the role matters. A Pi as a Wi-Fi station still cannot report AP-side client RSSI. A Pi or router acting as AP/gateway exposes much more useful network state.

### Can I run an EasyMesh agent?

Yes, with OpenWrt/prplMesh, but a practical lab wants at least one good USB Wi-Fi adapter and a controller. Running both controller and agent on the same lab box is fine for learning.

### Pi-hole, AdGuard, or Unbound?

They solve DNS visibility and resolution, not radio quality. Pi-hole or AdGuard Home are good for seeing what devices resolve. Unbound is useful when you want local recursive DNS behavior.

## Related Notes

- [Connectivity observability starts at the LAN edge](/notes/connectivity-observability-starts-at-the-lan-edge/)
- [Self-hosted servers need periodic inventory](/notes/self-hosted-servers-need-periodic-inventory/)
- [DNS is privacy infrastructure](/notes/dns-is-privacy-infrastructure/)
- [Backups are recovery design, not storage](/notes/backups-are-recovery-design-not-storage/)
- [Media servers need organization before more storage](/notes/media-servers-need-organization-before-more-storage/)

## References

- Broadband Forum: <https://www.broadband-forum.org/>
- TR-181 spec page: <https://www.broadband-forum.org/technical/download/TR-181_Issue-2.html>
- TR-369 / USP overview: <https://usp.technology/>
- obuspa: <https://github.com/BroadbandForum/obuspa>
- obudpst: <https://github.com/BroadbandForum/obudpst>
- bbfdm: <https://dev.iopsys.eu/iopsys/bbfdm>
- nexmon: <https://github.com/seemoo-lab/nexmon>
- OpenWrt: <https://openwrt.org/>
- prplMesh: <https://github.com/prplfoundation/prplMesh>
- TapMap: <https://github.com/olalie/tapmap>
- TapMap docs: <https://olalie.github.io/tapmap/>
- OpenWrt on Raspberry Pi: <https://raspberrytips.com/openwrt-on-raspberry-pi/>

## Raw Session Notes Archive

The article above is the cleaned version. 

This collapsed archive keeps the original raw session notes from the pre-cleanup Git version so the lab notebook material is still available without cluttering the main read.

{{< details title="Original raw session notes" closed="true" >}}

````md
---
title: "Selfhosted Connectivity"
date: 2026-06-11
draft: false
tags: ["HomeLab","TapMap vs PortMaster","Bind9 vs PiHole vs Technitum","WireShark","TR471"]
description: 'A homelab evaluation of WIFI metrics via EasyMesh and TR-181.'
url: 'selfhosted-connectivity'
---

**Tl;DR**

Tinkering with agents and OSS connectivity



adguard, Unbound, pihole...?

Ive been testing the TR471 BBF protocol for speedtests:

`http://192.168.1.2:3034/hermesagent/tr471-checks.git`

* https://github.com/BroadbandForum/obudpst
```sh
#make server
make client SERVER=192.168.1.18
make client SERVER=192.168.1.18 ARGS="--json --client-name $(hostname)"
#make analyze-file FILE=result_jalcocert-x300.json
```

I got some results: http://192.168.1.2:3034/hermesagent/tr471-checks/raw/commit/9b50679057e339b8b04bcfe0968bcd7acba13796/results.md

```json
{
  "timestamp": "2026-06-11T10:09:12Z",
  "client": "jalcocert-x300",
  "server": "192.168.1.18",
  "direction": "upload",
  "datagram_size": 1450,
  "phases": {
    "ramp_up": [
      {"rate_mbps": 1,     "throughput_mbps": 1.0,     "loss_pct": 0,      "avg_latency_ms": 9.8,   "verdict": "PASS"},
      {"rate_mbps": 2,     "throughput_mbps": 2.0,     "loss_pct": 0,      "avg_latency_ms": 9.8,   "verdict": "PASS"},
      {"rate_mbps": 5,     "throughput_mbps": 5.0,     "loss_pct": 0,      "avg_latency_ms": 9.7,   "verdict": "PASS"},
      {"rate_mbps": 10,    "throughput_mbps": 10.0,    "loss_pct": 0,      "avg_latency_ms": 10.9,  "verdict": "PASS"},
      {"rate_mbps": 20,    "throughput_mbps": 20.0,    "loss_pct": 0,      "avg_latency_ms": 11.2,  "verdict": "PASS"},
      {"rate_mbps": 50,    "throughput_mbps": 50.0,    "loss_pct": 0,      "avg_latency_ms": 12.1,  "verdict": "PASS"},
      {"rate_mbps": 100,   "throughput_mbps": 99.99,   "loss_pct": 0,      "avg_latency_ms": 85.6,  "verdict": "PASS"},
      {"rate_mbps": 200,   "throughput_mbps": 123.46,  "loss_pct": 38.27,  "avg_latency_ms": 249.4, "verdict": "FAIL"}
    ],
    "refine": [
      {"rate_mbps": 150.0, "throughput_mbps": 121.36,  "loss_pct": 19.09,  "avg_latency_ms": 274.4, "verdict": "FAIL"},
      {"rate_mbps": 125.0, "throughput_mbps": 117.01,  "loss_pct": 6.39,   "avg_latency_ms": 261.7, "verdict": "FAIL"},
      {"rate_mbps": 112.5, "throughput_mbps": 112.5,   "loss_pct": 0,      "avg_latency_ms": 161.1, "verdict": "PASS"},
      {"rate_mbps": 118.8, "throughput_mbps": 118.75,  "loss_pct": 0,      "avg_latency_ms": 171.1, "verdict": "PASS"},
      {"rate_mbps": 121.9, "throughput_mbps": 120.51,  "loss_pct": 1.11,   "avg_latency_ms": 246.6, "verdict": "FAIL"}
    ],
    "sustain": {
      "rate_mbps": 118.8,
      "throughput_mbps": 118.75,
      "loss_pct": 0,
      "avg_latency_ms": 211.3
    }
  },
  "max_capacity_mbps": 118.8,
  "measured_mbps": 118.75,
  "packet_loss_pct": 0,
  "avg_latency_ms": 211.3,
  "_diagnostics": {
    "idle_latency_ms": 9.7,
    "loaded_latency_ms": 85.6,
    "saturation_rate_mbps": 100,
    "bufferbloat_ratio": 8.8,
    "est_buffer_bytes": 971520,
    "est_buffer_formatted": "948.7 KB",
    "ipdv_estimate_ms": 12.7,
    "link_classification": "Fast Ethernet (100 Mbps) or 802.11n 2.4 GHz Wi-Fi — mild bufferbloat",
    "recommendations": [
      "Moderate bufferbloat — consider QoS or AQM tuning"
    ]
  }
}

```

`http://192.168.1.2:3034/hermesagent/pi-connectivity`

https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/pi-connectivity

 `pi-connectivity`


git clone

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wireshark" title="Wireshark | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pihole" title="Pi Hole v6 | Docker Config 🐋 ↗" >}}
{{< /cards >}}



```sh
git clone /Home-Lab
cd .Home-Lab/z-homelab-setup/evolution
#/home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml
#printf '\nTERMIX_SALT=%s\n' "$(openssl rand -base64 24 | tr -d '=+/' | cut -c1-32)" >> .env
sudo docker compose -f 2605_docker-compose.yml up -d wireshark
#sudo docker compose -f ./z-homelab-setup/evolution/2605_docker-compose.yml up -d wireshark
```

Wireshark lets you inspect live network traffic and saved packet captures. Common uses:

  - Troubleshoot connectivity issues: DNS failures, TCP resets, timeouts, handshake problems.
  - See where a service is talking: which IPs, ports, and protocols it uses.
  - Inspect protocol behavior: HTTP, TLS, DHCP, DNS, SMB, mDNS, NTP, etc.
  - Compare “working” vs “broken” traffic when something on the host or LAN changes.
  - Capture packets to a .pcap file and analyze them later or share them with caution.

  A few practical things you can do right away:

  - Start a capture on your active interface and watch traffic live.
  - Filter by host or port, for example:
      - ip.addr == 192.168.1.50
      - tcp.port == 443
      - dns
      - http
  - Follow a conversation:
      - Right-click a packet, then Follow -> TCP Stream
  - Check DNS:
      - Look for delays, NXDOMAINs, or wrong answers.
  - Check TLS:
      - Verify which server name is being requested and whether the handshake completes.
  - Save a capture for later analysis.

  One caution:

  - Packet captures may include sensitive data, especially on unencrypted traffic or metadata around logins. Treat saved captures as confidential.

  If you want, I can give you:

  1. a set of Wireshark filters for common homelab troubleshooting, or
  2. a quick “how to capture traffic from the host/container” walkthrough for your setup.




https://github.com/JAlcocerT/Home-Lab/blob/main/z-homelab-setup/about-dns.md

https://www.youtube.com/watch?v=9buji0Vnbo0
https://www.youtube.com/watch?v=H-tPCwxdxpY

https://raspberrytips.com/openwrt-on-raspberry-pi/

  sudo apt install -y nmap arp-scan tcpdump

**TL;DR**

Wheter you have 4g, coax,fiber or starlink, you need proper connectivity at home.

http://192.168.1.2:3034/hermesagent/pi-connectivity

gosolar-spain
tmux new -s claude-gosolar-spain

sudo apt install libssl-dev libcurl4-openssl-dev libsqlite3-dev libz-dev autoconf automake libtool pkg-config libmosquitto-dev libwebsockets-dev mosquitto mosquitto-clients


```sh
#tmux new -s claude-pi
#tmux attach -t claude-pi #http://192.168.1.2:3034/hermesagent/pi-connectivity.git
#forgejo-home:hermesagent/pi-connectivity.git (which is 192.168.1.2:2235, user git, key ~/.ssh/id_ed25519_forgejo). It's currently empty —
claude --dangerously-skip-permissions
```


{{< callout type="warning" >}}
tr181-dump.sh
{{< /callout >}}

Saved at ~/wifi-tr181-notes.md (~9 KB). It covers:

  1. Reading your own Wi-Fi state (iwconfig, iw dev wlan0 link, survey, scan) with the RSSI / band / channel reference tables and your actual readings
  2. TR-181 + BBF + USP — what each is, how they relate (vocabulary vs grammar)
  3. The tr181-dump.sh script — what branches it covers, how to invoke it
  4. Why OpenWrt + bbfdm/obuspa unlocks more data, and the hardware-vs-OS tradeoff
  5. Seeing other devices' RSSI — the three paths, nmap's role and limits, monitor mode caveats on the Pi 4
  6. A quick-reference command block at the end
  7. Links to the relevant projects (BBF, obuspa, bbfdm, nexmon, OpenWrt)

  You now have two artifacts in ~: the runnable `tr181-dump.sh` and the reference `wifi-tr181-notes.md`.

* https://github.com/olalie/tapmap?ref=selfh.st#docker-linux-host-only
* https://olalie.github.io/tapmap/

```sh
docker run --rm \
--network host \
--pid host \
-v ~/tapmap-data:/data \
-e TAPMAP_IN_DOCKER=1 \
olalie/tapmap:latest
```

> `http://localhost:8050/`


What are the processes taking most cpu?

```sh
ps -eo pid,ppid,user,comm,%cpu,%mem --sort=-%cpu | head -n 11
```

**Intro**

### How good is your connection?

Bash(iwconfig 2>/dev/null | grep -E "ESSID|Signal|Quality")
  ⎿  wlan0     IEEE 802.11  ESSID:"Piszymsiu"         
               Link Quality=63/70  Signal level=-47 dBm

● Yes — your Pi is connected to "Piszymsiu" with RSSI = -47 dBm (Link Quality 63/70, which is excellent — anything above -50 dBm is a strong signal).

  A few ways to check it:

  iwconfig wlan0                          # quick one-shot  iw dev wlan0 link                       # more detail (bitrate, freq, etc.)
  watch -n 1 'iwconfig wlan0 | grep Signal'   # live monitor
  cat /proc/net/wireless                  # raw kernel values
  For reference:
  - -30 to -50 dBm → excellent  - -50 to -60 dBm → good  - -60 to -70 dBm → fair
  - < -70 dBm → weak / unreliable
✻ Cogitated for 10s


 Bash(iw dev wlan0 link)
  ⎿  Connected to 2c:ec:f7:4b:b5:a8 (on wlan0)
        SSID: Piszymsiu
        freq: 5500.0
     … +8 lines (ctrl+o to expand)

● You're on the 5 GHz band — frequency is 5500 MHz, which is channel 100 (UNII-2 Extended, DFS).

  Quick reference:
  - 2.4xx MHz → 2.4 GHz band  - 5xxx MHz → 5 GHz band
  - 6xxx MHz → 6 GHz (Wi-Fi 6E)
  
  Bitrate of 433 Mbit/s confirms it's an 802.11ac (Wi-Fi 5) link on an 80 MHz channel width.

  Bash(iw dev wlan0 station dump | grep -E "signal|noise|tx bitrate|rx bitrate"; echo "---"; iw dev wlan0 survey dump | grep -A 6 "in use")
  ⎿     signal:         -50 dBm
        tx bitrate:     433.3 MBit/s
        rx bitrate:     433.3 MBit/s
     ---

● Bash(sudo iw dev wlan0 survey dump 2>/dev/null | grep -A 8 "in use")
  ⎿  No matches found

● Bash(sudo iw dev wlan0 survey dump 2>&1 | head -40)
  ⎿  sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
     sudo: a password is required

● Bash(iw dev wlan0 survey dump 2>&1 | head -60)
  ⎿  (No output)

● Here's what I can confirm from the link info:

  Channel: 5500 MHz = Channel 100 (5 GHz band, 80 MHz wide → spans channels 100–112). This is a DFS channel (radar-shared with weather/military radar).
  Noise floor: the iw survey dump command (which reports noise in dBm per channel) needs root on this Pi. To see it, run interactively:

  ! sudo iw dev wlan0 survey dump
  You'll get output like:
  Survey data from wlan0
      frequency: 5500 MHz [in use]      noise: -95 dBm           ← this is what you want
      channel active time: ... 
      channel busy time: ...
      
  SNR (Signal-to-Noise Ratio) = signal − noise. With your -49 dBm signal and a typical -95 dBm noise floor, SNR ≈ 46 dB → excellent (>40 dB is essentially the ceiling, sustaining max bitrates).
  If you want, you can also see all nearby APs and their channels/signals with:
  ! sudo iw dev wlan0 scan | grep -E "SSID|freq|signal"

   ! sudo iw dev wlan0 survey dump | grep -A 6 "in use"

```sh
! sudo iw dev wlan0 scan | grep -E "SSID|freq|signal" | head -40
```

        freq: 5500.0
        signal: -50.00 dBm
        SSID: Piszymsiu
                 * center freq segment 1: 106
                 * center freq segment 2: 0
        freq: 5180.0
        signal: -54.00 dBm
        SSID: Piszymsiu
                 * center freq segment 1: 42
                 * center freq segment 2: 50
        freq: 2462.0
        signal: -63.00 dBm
        SSID: Piszymsiu
        freq: 5240.0
        signal: -58.00 dBm
        SSID: 5G-FELIKS
                 * center freq segment 1: 42
                 * center freq segment 2: 0
        freq: 5200.0
        signal: -83.00 dBm
        SSID: 5G-Vectra-WiFi-84D73A
                 * center freq segment 1: 42
                 * center freq segment 2: 0
        freq: 5180.0
        signal: -56.00 dBm
        SSID: GibInternet
                 * center freq segment 1: 42
                 * center freq segment 2: 0
        freq: 5180.0
        signal: -54.00 dBm
                 * center freq segment 1: 42
                 * center freq segment 2: 50
        freq: 5220.0
        signal: -89.00 dBm
        SSID: Andaluzja_5G
                 * center freq segment 1: 42
                 * center freq segment 2: 0
        freq: 2412.0
        signal: -55.00 dBm
        SSID: Bubu


Nice data. The survey grep returned nothing (likely because iw on your driver formats it slightly differently — try without the filter: ! sudo iw dev wlan0 survey dump), but the scan is very informative.

  Your AP "Piszymsiu" has 3 radios:
  ┌──────────┬─────────┬─────────────┬────────────────────────────┐
  │   Freq   │ Channel │    Band     │           Signal           │
  ├──────────┼─────────┼─────────────┼────────────────────────────┤
  │ 5500 MHz │ 100     │ 5 GHz (DFS) │ -50 dBm ← you're connected │
  ├──────────┼─────────┼─────────────┼────────────────────────────┤
  │ 5180 MHz │ 36      │ 5 GHz       │ -54 dBm                    │  ├──────────┼─────────┼─────────────┼────────────────────────────┤
  │ 2462 MHz │ 11      │ 2.4 GHz     │ -63 dBm                    │  └──────────┴─────────┴─────────────┴────────────────────────────┘

  Neighboring networks:
  ┌──────────────┬─────────┬─────────┬──────────────────────────┐  │     SSID     │ Channel │ Signal  │          Notes           │
  ├──────────────┼─────────┼─────────┼──────────────────────────┤  │ GibInternet  │ 36      │ -56 dBm │ overlaps your AP's ch 36 │
  ├──────────────┼─────────┼─────────┼──────────────────────────┤
  │ 5G-FELIKS    │ 48      │ -58 dBm │ nearby in 5 GHz low      │
  ├──────────────┼─────────┼─────────┼──────────────────────────┤
  │ Bubu         │ 1 (2.4) │ -55 dBm │ 2.4 GHz neighbor         │
  ├──────────────┼─────────┼─────────┼──────────────────────────┤  │ 5G-Vectra    │ 40      │ -83 dBm │ weak                     │
  ├──────────────┼─────────┼─────────┼──────────────────────────┤  │ Andaluzja_5G │ 44      │ -89 dBm │ very weak                │
  └──────────────┴─────────┴─────────┴──────────────────────────┘

  Takeaways:  - You're on channel 100, 80 MHz wide (spans 100–112) with no other AP anywhere near it — that's why you're hitting 433 Mbit/s cleanly.
  - The lower 5 GHz band (ch 36–48) is congested at your location — staying on ch 100 is the right choice.
  - Your AP's band-steering picked the best radio for the Pi.
  To also see the noise floor, try:
  ! sudo iw dev wlan0 survey dump
  (without the grep — paste the whole output and I'll pull the noise figure for channel 100)

 TR-181 is a standardized data model from the Broadband Forum (https://www.broadband-forum.org/) — specifically "TR-181: Device:2 Data Model for TR-069 Devices and USP Agents." It defines a hierarchical tree of
  parameters that describe and control a network device (router, ONT, set-top box, etc.).

  It's transported by:
  - TR-069 (CWMP) — older ISP remote-management protocol, used by an ACS server
  - TR-369 (USP) — newer replacement, MQTT/WebSocket-based

  Example paths (the same Wi-Fi data we've been looking at, but exposed as standardized parameters):
  Device.WiFi.Radio.1.OperatingFrequencyBand        → "5GHz"
  Device.WiFi.Radio.1.Channel                       → 100
  Device.WiFi.SSID.1.SSID                           → "Piszymsiu"  Device.WiFi.AccessPoint.1.AssociatedDevice.1.SignalStrength  → -50  ← RSSI
  Device.WiFi.AccessPoint.1.AssociatedDevice.1.MACAddress
  Device.DeviceInfo.SoftwareVersion
  Device.IP.Interface.1.IPv4Address.1.IPAddress
  
  Why it matters for you: ISPs (Vectra, Orange, etc. — the kind of equipment around you) use TR-181 over TR-069 to:
  - read your router's status (RSSI of connected devices, channel, errors)  - push config changes (Wi-Fi password, channel, firmware updates)
  - diagnose your line remotely

  So in essence: everything we just queried locally with iw and iwconfig is the same data your ISP can see on their side via TR-181 — just standardized into a vendor-neutral schema.

  If you want to play with it yourself, open-source agents that implement TR-181 include OpenWrt's easycwmp (https://github.com/pivasoftware/easycwmp) and obuspa (https://github.com/BroadbandForum/obuspa) (the BBF's  reference USP agent).

   What you've got now (at ~/tr181-dump.sh):

  - ./tr181-dump.sh — dump everything (no sudo needed)
  - ./tr181-dump.sh --scan — also adds Device.WiFi.NeighboringWiFiDiagnostic.Result.* from a Wi-Fi scan (will prompt for sudo)
  - ./tr181-dump.sh --filter Radio — only paths containing "Radio"

  Notable findings from the dump:
  - Pi 4B Rev 1.5, kernel 6.12.75, uptime ~4.7 days (403923s)  - eth0 unplugged; you're on Wi-Fi only  - Connected to Piszymsiu BSSID 2c:ec:f7:4b:b5:a8, 5 GHz ch 100 / 80 MHz, RSSI -48 dBm, 433.3 Mbit/s both ways
  - ~8.4 GB up / 1.66 GB down since boot, zero errors on wlan0 — healthy link
  - Tailscale interface up (100.101.108.118), Docker bridge present

  To grab neighbors too:
  ! ~/tr181-dump.sh --scan

   What you've got now (at ~/tr181-dump.sh):

  - ./tr181-dump.sh — dump everything (no sudo needed)
  - ./tr181-dump.sh --scan — also adds Device.WiFi.NeighboringWiFiDiagnostic.Result.* from a Wi-Fi scan (will prompt for sudo)
  - ./tr181-dump.sh --filter Radio — only paths containing "Radio"

  Notable findings from the dump:
  - Pi 4B Rev 1.5, kernel 6.12.75, uptime ~4.7 days (403923s)  - eth0 unplugged; you're on Wi-Fi only  - Connected to Piszymsiu BSSID 2c:ec:f7:4b:b5:a8, 5 GHz ch 100 / 80 MHz, RSSI -48 dBm, 433.3 Mbit/s both ways
  - ~8.4 GB up / 1.66 GB down since boot, zero errors on wlan0 — healthy link
  - Tailscale interface up (100.101.108.118), Docker bridge present

  To grab neighbors too:
  ! ~/tr181-dump.sh --scan

   BBF — Broadband Forum (broadband-forum.org (https://www.broadband-forum.org/))

  A non-profit industry consortium (ISPs, chipset vendors, router vendors, software vendors) that writes the standards for how broadband networks and customer-premises equipment are managed. Their specs are numbered  "TR-xxx" (Technical Reports). Key ones you've now touched:
  ┌────────┬───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
  │  Spec  │                                                      What it defines                                                      │
  ├────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ TR-069 │ CWMP — the older protocol an ISP uses to remotely manage your router (over SOAP/HTTPS, polled)                            │
  ├────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ TR-369 │ USP — the modern replacement for TR-069 (MQTT/WebSocket/STOMP, push-capable, supports IoT)                                │  ├────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ TR-181 │ The data model — the standardized tree of parameters (Device.WiFi.Radio.1.Channel, etc.) — used by both TR-069 and TR-369 │  ├────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ TR-143 │ Diagnostic tests (speedtest, ping, traceroute) — modeled as TR-181 parameters                                             │
  ├────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤  │ TR-157 │ Software module management (firmware/component install)                                                                   │
  └────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
  So: TR-181 is the vocabulary, TR-069 and TR-369 are two grammars for speaking it.

  ---  USP — User Services Platform

  The protocol defined in TR-369. It has two roles:

  - USP Agent — runs on the device (your router, ONT, set-top, or in this case the Pi). It owns the device's TR-181 data model and answers Get / Set / Operate / Add / Delete messages.
  - USP Controller — runs at the ISP, in a cloud service, or even on your phone. It sends those messages to the Agent.
  Communication between them goes through a Message Transfer Protocol (MTP) — usually MQTT, WebSocket, or STOMP — with TLS and certificate-based auth.
  A typical exchange:
  Controller → Agent:  Get Device.WiFi.SSID.*.SSID
  Agent → Controller:  Device.WiFi.SSID.1.SSID = "Piszymsiu"                       Device.WiFi.SSID.2.SSID = "Piszymsiu-Guest"
  Controller → Agent:  Set Device.WiFi.Radio.1.Channel = 36  Agent → Controller:  OK
  Why USP replaced TR-069:
  - TR-069 polls (the device asks the ACS "anything for me?" every ~hour) → slow
  - USP is push-capable (Controller sends a message and Agent acts now) → real-time
  - USP supports multiple Controllers (your ISP, and your own app, and a mesh-coordination Controller)
  - USP is designed for IoT scale — IPv6, low-bandwidth, low-power devices
  - USP uses Protocol Buffers (not the verbose SOAP/XML of TR-069)
  ---
  The reference Agent implementation: OB-USP-AGENT (obuspa)  
  BBF publishes the official open-source USP Agent: https://github.com/BroadbandForum/obuspa (written in C, "OB" = Open Broadband). When earlier I mentioned option B was "build obuspa from source" — that's the BBF
  reference Agent.

  It gives you a real Agent process that:

  1. Exposes a TR-181 data model
  2. Talks USP over MQTT/WebSocket to a Controller  3. Has a CLI (obuspa -c get Device.) for local inspection

  The catch I mentioned: out of the box its data model is mostly stubs. Real router firmwares (Vectra, Orange, AVM Fritz!Box, Sagemcom…) ship a fork of obuspa where they've written the C code that maps each TR-181  parameter to their actual hardware drivers. The tr181-dump.sh we just wrote is essentially a tiny, read-only, shell-based version of what that vendor-specific layer does — but in 200 lines instead of tens of thousands.

 Yes — substantially more, but it depends on which OpenWrt setup and what the device actually is (router vs station). Two orthogonal things matter:

  1. The agent + mapper stack (software that fills TR-181 paths from live system state)
  2. The hardware sources (what data even exists to map)
  
  ---
  1. OpenWrt is the natural home for serious TR-181 stacks
  Stock OpenWrt has no TR-181, but it has the right substrate for one — uci (config), ubus (IPC), netifd (interface abstraction), hostapd (Wi-Fi events). The Broadband Forum / iopsys / prpl ecosystems plug straight into
  those. Available as opkg packages:

  ┌──────────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐  │     Package      │                                                      What it adds                                                       │
  ├──────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ bbfdm            │ The mapping layer — populates real TR-181 values from uci/ubus/sysfs. Maintained by iopsys, used by ISPs in production. │
  ├──────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ bbf.dataelements │ Wi-Fi EasyMesh data elements (R2/R3)                                                                                    │  ├──────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ obuspa           │ The actual USP Agent (USP/MQTT/WebSocket) — sits on top of bbfdm                                                        │  ├──────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ easycwmp         │ TR-069/CWMP client (older protocol, same data model)                                                                    │
  ├──────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ prplmesh         │ Multi-AP mesh / EasyMesh agent                                                                                          │
  └──────────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

  With bbfdm + obuspa installed you'd actually run:
  obuspa -c get Device.
  …and see the full schema populated, including writable parameters.
  2. What you'd see that we don't see now

  Concrete examples that go from "empty/missing in our shell script" → "populated with real values":

  ┌─────────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────────────────────────────────────────────────┐  │                              Path                               │                                 Why it lights up on OpenWrt                                  │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤  │ Device.WiFi.AccessPoint.{i}.AssociatedDevice.{i}.SignalStrength │ Pi-as-AP via hostapd — every connected client's RSSI                                         │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Device.WiFi.AccessPoint.{i}.AssociatedDevice.{i}.Stats.*        │ Per-client byte/packet/retry counters from hostapd                                           │  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Device.Hosts.Host.{i}.*                                         │ Every LAN host (DHCP + ARP), with hostname, IP, MAC, lease time                              │  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Device.DHCPv4.Server.Pool.{i}.Client.{j}.*                      │ DHCP leases, served by dnsmasq                                                               │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Device.Firewall.Chain.{i}.Rule.{j}.*                            │ nftables rules as structured TR-181                                                          │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Device.NAT.PortMapping.{i}.*                                    │ Port-forwards from /etc/config/firewall                                                      │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Device.QoS.*                                                    │ SQM/cake settings                                                                            │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤  │ Device.Routing.Router.{i}.IPv4Forwarding.{j}.*                  │ Full routing table                                                                           │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤  │ Device.DSL.Line.* / Device.Optical.Interface.*                  │ WAN line stats — only if the device has DSL/GPON hardware                                    │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤  │ Device.Services.VoiceService.*                                  │ VoIP — only if there's an FXS port                                                           │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤  │ Device.PeriodicStatistics.*                                     │ Built-in time-series collection                                                              │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Device.* Operate methods                                        │ Reboot(), FactoryReset(), IPPing(), TraceRoute(), Download() (firmware) — actually invokable │
  ├─────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Writable params                                                 │ Set Device.WiFi.Radio.1.Channel=36 actually changes the channel                              │
  └─────────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────────────────────────────────────┘

  vs. our current shell script which is read-only and ~50 parameters.

  3. But the device matters more than the OS

  ┌──────────────────────────────────────────────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐  │                         Scenario                         │                                                                      TR-181 richness                                                                      │
  ├──────────────────────────────────────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ This Pi on Raspbian (station, no AP, no WAN modem)       │ What our script already shows                                                                                                                             │
  ├──────────────────────────────────────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ This Pi on OpenWrt + bbfdm (still station-only)          │ Better — proper Agent, writable params, Hosts/DHCP/firewall trees — but still no AccessPoint clients, no DSL, no GPON. The Pi's hardware ceiling caps it. │  ├──────────────────────────────────────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Pi 4 as OpenWrt AP (USB Wi-Fi dongle in AP mode + bbfdm) │ Big jump — WiFi.AccessPoint.*, associated-device RSSI, mesh metrics                                                                                       │  ├──────────────────────────────────────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ISP modem/router on stock OEM firmware                   │ Usually has TR-069 enabled (vendor-built obuspa fork), but locked — the ISP sees the data, you don't                                                      │
  ├──────────────────────────────────────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ISP modem/router on OpenWrt + bbfdm                      │ The gold standard — DSL/PON line stats, voice, NAT, full client visibility, you own the data                                                              │
  └──────────────────────────────────────────────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

  4. Practical recommendation
  If your interest is learning the schema and seeing it filled in properly → install OpenWrt on a spare router (even a cheap TP-Link), add bbfdm + obuspa. ~1 hour of work, no migration pain on your Pi.

  If your interest is monitoring your home network (clients, RSSI per device, line stats) → that data lives on your router, not your Pi. The Pi as a station can only see itself. Running OpenWrt + bbfdm on the box that's  actually the AP/gateway is where the goodies are.
  If you want, I can sketch what an OpenWrt install on a small router would look like, or extend the current Pi script with a few more interesting paths we can still pull locally (process table, Device.Users.User.*,  Device.X_BROADCOM_COM_NetworkProperties.*-style vendor extensions, etc.).
✻ Cogitated for 56s

nmap can't see Wi-Fi/RSSI data for other devices — it's an L3/L4 tool (IP, ports, services) and RSSI/band/noise are L1/L2 radio properties.

There are three real paths to that information, with different  tradeoffs:

  What nmap can do here
  It's still useful for the inventory half of the question — "what devices exist on my LAN":
  sudo nmap -sn 192.168.1.0/24                # ping/ARP sweep
  sudo arp-scan --interface=wlan0 --localnet  # faster, ARP-only
  ip neigh show                               # whatever the kernel already learned
  You'll get IPs, MACs, vendor names (from OUI). Zero radio info.

  ---
  Path 1 — Ask the AP (the only one with the truth)
  
  The AP is the only device that natively knows every client's RSSI, band, bitrate, and association duration. Two ways to extract it:
  ┌───────────────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
  │      Your router      │                                                                                  How to get it                                                                                  │  ├───────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤  │ ISP-provided (Vectra) │ Log into http://192.168.1.1, look for "Connected devices" / "Wi-Fi status". Usually shows band + signal bars; sometimes exact dBm. Locked-down UI — no SSH.                     │
  ├───────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ OpenWrt               │ SSH in and run iwinfo phy0-ap0 assoclist or hostapd_cli all_sta. Exact dBm per client. Or via TR-181: obuspa -c get Device.WiFi.AccessPoint.*.AssociatedDevice.*.SignalStrength │  └───────────────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
  This is the only path that gives you the RSSI the AP sees from each client — which is the operationally meaningful number.

  Path 2 — Sniff from the Pi in monitor mode

  Put the Pi's Wi-Fi into monitor mode and passively capture every frame in the air. You then see what the Pi hears of each device — not what their device hears of the AP, but a useful proxy if the Pi sits near the AP.

  The Pi 4's built-in Wi-Fi (BCM43455c0) needs the nexmon patched firmware for proper monitor mode:  - https://github.com/seemoo-lab/nexmon
  Then:
  sudo airmon-ng start wlan0
  sudo airodump-ng -c 100 --band a wlan0mon   # watch channel 100 (where your AP is)

  What you get per device per second:
  - BSSID it's associated with (→ which AP & SSID)  - Channel / band (the channel you're capturing on)
  - Power = RSSI the Pi receives
  - Frame rates, retries, encryption type, manufacturer

  Caveat: monitor mode means the Pi can't be a Wi-Fi client at the same time (single radio). You'd lose internet on wlan0 while sniffing. Workaround: a cheap USB Wi-Fi adapter with an Atheros/Ralink chipset (ALFA AWUS036  etc.) dedicated to monitor mode, keep wlan0 for normal use.
  Path 3 — Ask each client device (doesn't scale)

  Each device only knows its own RSSI to the AP. You'd need to SSH/agent into each one. Fine for a few Linux boxes (iw dev wlan0 link on each); not realistic for phones/IoT.

  ---  Noise floor: same story

  iw dev wlan0 survey dump only reports noise for the Pi's own radio. Other devices' noise floors are not visible to anyone but those devices (and the AP for its own channels). No protocol — TR-181 or otherwise — carries
  per-client noise from clients to neighbors.

  ---  My recommendation for your setup

  Your Vectra router is the bottleneck. Two pragmatic moves:

  1. Check the Vectra admin UI at http://192.168.1.1 first — it likely already shows per-device RSSI/band, just hidden in a "device list" page. Zero effort.
  2. If the UI is too limited and you want real numbers, the highest-leverage move is replacing or supplementing the Vectra router with an OpenWrt one. Then iwinfo + bbfdm give you everything: every client's RSSI, band,  capabilities, association history, in a queryable form.

  Monitor mode on the Pi is fun and educational, but it's a proxy measurement (what the Pi hears, not what the AP hears) — useful for surveys and detecting rogue devices, less useful for "is my kid's phone getting bad  Wi-Fi in their bedroom" (the answer to that lives on the AP).

  # Wi-Fi diagnostics & TR-181 on a Raspberry Pi — session notes

Notes from a session on a Raspberry Pi 4 Model B running Raspberry Pi OS,
connected as a Wi-Fi client (station) to a home ISP router.

---

## 1. Reading your own Wi-Fi state

### RSSI / signal strength

```bash
iwconfig wlan0
```
Sample output:
```
wlan0  IEEE 802.11  ESSID:"Piszymsiu"
       Link Quality=63/70  Signal level=-47 dBm
```

**RSSI reference table:**

| RSSI (dBm)      | Quality   |
|-----------------|-----------|
| -30 to -50      | Excellent |
| -50 to -60      | Good      |
| -60 to -70      | Fair      |
| < -70           | Weak / unreliable |

### Detailed link info (band, channel, bitrate, BSSID)

```bash
iw dev wlan0 link
```
Sample output:
```
Connected to 2c:ec:f7:4b:b5:a8 (on wlan0)
    SSID: Piszymsiu
    freq: 5500.0
    signal: -49 dBm
    rx bitrate: 433.3 MBit/s
    tx bitrate: 433.3 MBit/s
```

**Band from frequency:**

| Frequency       | Band             |
|-----------------|------------------|
| 2412 – 2484 MHz | 2.4 GHz          |
| 5170 – 5825 MHz | 5 GHz            |
| 5925 – 7125 MHz | 6 GHz (Wi-Fi 6E) |

**Frequency → channel (5 GHz):** `channel = (freq_MHz - 5000) / 5`
So `5500 MHz` = channel **100** (a DFS channel in UNII-2 Extended).

A bitrate of **433 Mbit/s** indicates 802.11ac (Wi-Fi 5) on an 80 MHz channel.

### Live monitoring

```bash
watch -n 1 'iwconfig wlan0 | grep Signal'
cat /proc/net/wireless           # raw kernel values
```

### Noise floor and SNR

```bash
sudo iw dev wlan0 survey dump
```
Reports per-channel `noise: -XX dBm`. **SNR = signal − noise**. With
`-49` signal and a typical `-95` noise floor, SNR ≈ 46 dB, which sustains
the maximum bitrate the link can support.

### Scan for neighboring APs

```bash
sudo iw dev wlan0 scan | grep -E "SSID|freq|signal" | head -40
```

Sample output interpretation (5 GHz neighborhood):

| SSID                 | Freq (MHz) | Channel | Signal |
|----------------------|------------|---------|--------|
| Piszymsiu            | 5500       | 100     | -50    |
| Piszymsiu            | 5180       | 36      | -54    |
| Piszymsiu            | 2462       | 11      | -63    |
| GibInternet          | 5180       | 36      | -56    |
| 5G-FELIKS            | 5240       | 48      | -58    |
| Andaluzja_5G         | 5220       | 44      | -89    |
| 5G-Vectra-WiFi-84D73A| 5200       | 40      | -83    |

Reading: the AP is tri-band (2.4 / 5-low / 5-high) and band-steered the Pi to the cleanest radio (channel 100, no neighbors in the 80 MHz block 100–112).

---

## 2. TR-181 — the standardized device data model

**TR-181** ("Device:2 Data Model for TR-069 Devices and USP Agents") is a
[Broadband Forum](https://www.broadband-forum.org/) specification. It
defines a hierarchical tree of parameters describing a network device:

```
Device.DeviceInfo.ModelName
Device.WiFi.Radio.1.Channel
Device.WiFi.SSID.1.SSID
Device.WiFi.AccessPoint.1.AssociatedDevice.1.SignalStrength
Device.IP.Interface.1.IPv4Address.1.IPAddress
```

TR-181 is the **vocabulary**. Two protocols speak it:

| Protocol | Name | Transport | Status |
|----------|------|-----------|--------|
| TR-069   | CWMP — CPE WAN Management Protocol | SOAP/HTTPS, polled | Older, still widely deployed |
| TR-369   | USP — User Services Platform | MQTT / WebSocket / STOMP, push-capable | Modern replacement |

USP is push-capable, multi-Controller, IPv6-native, uses Protocol Buffers,
and is designed for IoT scale.

### USP roles

- **USP Agent** — runs *on* the device. Owns the TR-181 model.
  Answers `Get` / `Set` / `Operate` / `Add` / `Delete`.
- **USP Controller** — runs at the ISP, a cloud service, or a local app.
  Sends those messages to Agents.

### Reference Agent: `obuspa`

The Broadband Forum publishes the open-source reference USP Agent:
[github.com/BroadbandForum/obuspa](https://github.com/BroadbandForum/obuspa)
("OB" = Open Broadband). It provides the framework — the data-model
tree, USP transport, local CLI — but most TR-181 leaves are stubs until
vendor code wires them to actual Linux state. Commercial routers (Vectra,
Sagemcom, AVM, etc.) ship a vendor fork with those mappings filled in.

---

## 3. Pragmatic local TR-181 dump (`~/tr181-dump.sh`)

A small bash script that queries live Linux state and emits the data
using TR-181 parameter paths. **Not** a real Agent — just data shaped
like TR-181 for inspection.

```bash
~/tr181-dump.sh                  # everything except scan
~/tr181-dump.sh --scan           # add NeighboringWiFiDiagnostic (sudo)
~/tr181-dump.sh --filter Radio   # only paths matching "Radio"
```

Covered branches:
- `Device.DeviceInfo.*` (model, kernel, serial, uptime, RAM)
- `Device.Time.*`
- `Device.Ethernet.Interface.1.*` + stats
- `Device.IP.Interface.{i}.*` with IPv4/IPv6 addresses
- `Device.DNS.Client.Server.{i}.*`
- `Device.WiFi.Radio.1.*` (band, channel, width, supported standards)
- `Device.WiFi.SSID.1.*` (SSID, BSSID, MAC, stats)
- `Device.WiFi.EndPoint.1.*` (signal strength, bitrates, profile)
- `Device.WiFi.NeighboringWiFiDiagnostic.Result.{i}.*` (with `--scan`)

---

## 4. Why OpenWrt unlocks far more TR-181 data

Stock OpenWrt has no TR-181 built in, but its substrate (`uci`, `ubus`,
`netifd`, `hostapd`) is what the modern TR-181 stacks plug into. Available
as opkg packages:

| Package         | Role |
|-----------------|------|
| **bbfdm**       | The mapper — fills TR-181 from `uci`/`ubus`/sysfs. Maintained by iopsys. |
| **bbf.dataelements** | Wi-Fi EasyMesh data elements (R2/R3). |
| **obuspa**      | USP Agent (USP/MQTT/WebSocket) — sits on top of bbfdm. |
| **easycwmp**    | TR-069/CWMP client. |
| **prplmesh**    | Multi-AP / EasyMesh agent. |

With `bbfdm + obuspa`, parameters that are empty on bare Raspbian get
populated and become writable:

| Path | Source |
|------|--------|
| `Device.WiFi.AccessPoint.{i}.AssociatedDevice.{i}.SignalStrength` | hostapd — RSSI of each connected client |
| `Device.Hosts.Host.{i}.*` | DHCP + ARP — every LAN host with hostname, IP, MAC |
| `Device.DHCPv4.Server.Pool.*.Client.*` | dnsmasq leases |
| `Device.Firewall.Chain.*.Rule.*` | nftables/uci firewall |
| `Device.NAT.PortMapping.*` | Port-forwards |
| `Device.QoS.*` | SQM/cake |
| `Device.Routing.Router.*.IPv4Forwarding.*` | Routing table |
| `Device.DSL.Line.*` / `Device.Optical.Interface.*` | DSL/PON line stats — *only if the device has that hardware* |
| `Device.PeriodicStatistics.*` | Built-in time-series |
| Operate methods | `Reboot()`, `FactoryReset()`, `IPPing()`, `TraceRoute()`, `Download()` — actually invokable |

**But hardware matters more than the OS.** A Pi running OpenWrt as a
station still has no DSL line, no GPON, no associated AP clients to
report on. The richest TR-181 surface lives on a device that is *the
router* and has real WAN hardware.

| Scenario | TR-181 surface |
|----------|----------------|
| Pi on Raspbian, station-only | ~what `tr181-dump.sh` shows |
| Pi on OpenWrt + bbfdm, still station-only | Same Wi-Fi data, but proper Agent, writable, full Hosts/DHCP/firewall trees |
| Pi on OpenWrt acting as an AP | Adds `WiFi.AccessPoint.*` and associated-device RSSI |
| ISP router on stock firmware | TR-069 enabled but locked — *the ISP* sees it, not you |
| ISP router on OpenWrt + bbfdm | The richest case — line stats, voice, NAT, full client visibility |

---

## 5. Seeing *other* devices' Wi-Fi state from the Pi

Key constraint: **RSSI, band, and noise are L1/L2 radio properties measured
per-radio.** No L3/L4 tool (nmap, ping, etc.) can read another device's
RSSI to its AP. Three real paths:

### Path 1 — Ask the AP (the only one with the truth)

The AP is the only device that knows every client's RSSI as the AP sees it.

| Router type | How |
|-------------|-----|
| ISP-provided (locked) | Admin UI at `http://192.168.1.1`, "Connected devices" page. Often just bars. |
| OpenWrt | `iwinfo phy0-ap0 assoclist` or `hostapd_cli all_sta` — exact dBm per client. Via TR-181: `obuspa -c get Device.WiFi.AccessPoint.*.AssociatedDevice.*.SignalStrength` |

### Path 2 — Sniff from the Pi in monitor mode

The Pi captures all frames in the air and reads RSSI **as the Pi hears
each device** (a proxy for the AP's view, useful if the Pi sits near the AP).

The Pi 4's built-in Wi-Fi (BCM43455c0) needs the **nexmon** patched firmware
for proper monitor mode: [github.com/seemoo-lab/nexmon](https://github.com/seemoo-lab/nexmon).

```bash
sudo airmon-ng start wlan0
sudo airodump-ng -c 100 --band a wlan0mon   # watch channel 100
```

Caveat: monitor mode disables the station role on the same radio — the
Pi loses Wi-Fi internet while sniffing. Workaround: a USB Wi-Fi adapter
(ALFA AWUS036 and similar) dedicated to monitor mode.

### Path 3 — Ask each client device

Each client knows only its own RSSI. Practical for a few Linux boxes
(`iw dev wlan0 link` on each), not realistic for phones/IoT.

### What `nmap` is and isn't good for here

| Want | Tool |
|------|------|
| Inventory of devices on the LAN (IP, MAC, vendor, OS) | `nmap -sn`, `arp-scan`, `ip neigh` |
| Per-device RSSI / band / noise | **Not nmap.** Ask the AP, or sniff in monitor mode. |

```bash
sudo nmap -sn 192.168.1.0/24                # ping/ARP sweep
sudo arp-scan --interface=wlan0 --localnet  # ARP-only, faster
ip neigh show                               # whatever the kernel already learned
```

### Noise floor for other devices

Same story: `iw dev wlan0 survey dump` only reports noise for the Pi's
own radio. There is no protocol — TR-181 or otherwise — that carries
per-client noise readings from other devices to neighbors.

---

## 6. Command quick reference

```bash
# Own Wi-Fi state
iwconfig wlan0
iw dev wlan0 link
iw dev wlan0 info
iw dev wlan0 station dump
cat /proc/net/wireless
sudo iw dev wlan0 survey dump

# Scan for neighbors
sudo iw dev wlan0 scan | grep -E "SSID|freq|signal"

# LAN inventory (no radio info)
sudo nmap -sn 192.168.1.0/24
sudo arp-scan --interface=wlan0 --localnet
ip neigh show

# TR-181 local dump
~/tr181-dump.sh
~/tr181-dump.sh --scan
~/tr181-dump.sh --filter Radio

# Monitor mode (requires nexmon on Pi 4)
sudo airmon-ng start wlan0
sudo airodump-ng -c 100 --band a wlan0mon
```

---

## 7. Reference links

- Broadband Forum: <https://www.broadband-forum.org/>
- TR-181 spec page: <https://www.broadband-forum.org/technical/download/TR-181_Issue-2.html>
- TR-369 / USP overview: <https://usp.technology/>
- obuspa (USP Agent): <https://github.com/BroadbandForum/obuspa>
- bbfdm (Linux→TR-181 mapper): <https://dev.iopsys.eu/iopsys/bbfdm>
- nexmon (Pi 4 monitor mode firmware): <https://github.com/seemoo-lab/nexmon>
- OpenWrt: <https://openwrt.org/>

---

 cat lan-check.md 


# LAN Check — 192.168.1.0/24

Date: 2026-05-18
Host: Raspberry Pi (`192.168.1.18` on wlan0)
Method: ARP-based discovery (ping sweep + `arp -an`) and OUI vendor lookup via `api.macvendors.com`. **No port scanning performed.**

## Network

- Subnet: `192.168.1.0/24`
- Gateway: `192.168.1.1`
- This host: `192.168.1.18` (wlan0), plus `100.101.108.118` (tailscale0) and `172.17.0.1` (docker0)

## Discovered devices

| IP    | MAC               | Vendor (OUI)                          | Likely device                                  |
|-------|-------------------|---------------------------------------|------------------------------------------------|
| .1    | 2c:ec:... | Shenzhen SDMC Technology              | Gateway/router (ISP CPE / set-top hybrid)      |
| .2    | 9c:6b:... | ASRock Incorporation                  | Desktop PC (motherboard)                       |
| .3    | 28:87:... | TP-Link Systems Inc                   | TP-Link device (router/AP/smart-plug/switch)   |
| .5    | 28:cd:... | Raspberry Pi Trading Ltd              | Raspberry Pi                      |

11 active hosts. Reverse DNS and NetBIOS lookups returned nothing.

## Hosts worth a closer look

Ranked by vendor reputation, not actual evidence of compromise.

1. **`.11` Sichuan AI-Link** — Chinese IoT ODM (common in cheap WiFi cameras / smart devices). Frequently phones home to opaque cloud endpoints, rarely patched. Identify it first.
2. **`.12` Espressif** — bare ESP32 MAC. Fine if intentionally deployed (Shelly, ESPHome, DIY); investigate if not recognized.
3. **`.9` SJIT** — uncommon OEM. Treat like unknown IoT until identified.
4. **`.1` SDMC gateway** — ISP boxes often ship with default admin creds and outdated firmware. Verify: firmware date, WAN-side admin disabled, UPnP off, WPS off.
5. **`.17` Versuni** — Philips appliance spinoff (kitchen/health appliance). Smart-appliance firmware quality is generally poor.
6. **`.3` TP-Link** — fine on current firmware; consumer line has had a steady stream of CVEs over the years.
7. **`.7` / `.16` randomized MACs** — normal for modern phones/laptops. Confirm both are accounted for (family devices) and not unknown.

## What this check cannot tell you

- Which devices have open services (Telnet, old SMB, exposed admin UIs)
- Firmware versions / known CVEs
- Default-credential exposure
- Whether any device is actively communicating with suspicious endpoints

A port scan is required for any of the above.

## Next steps

### 1. Identify the unknowns (no scanning needed)
- Check the router's DHCP client list (admin UI on `http://192.168.1.1`) — many gateways show hostnames the devices reported.
- Power-cycle suspected IoT one at a time and watch which IP drops off (`arp -an`) to map IP → physical device.

### 2. Targeted, low-risk port scan

Install nmap and scan only the unknowns / suspicious hosts:

```bash
sudo apt-get install -y nmap
sudo nmap -sV -sC -p- --script=safe 192.168.1.9 192.168.1.11 192.168.1.12 192.168.1.17
```

Why these flags:
- `-sV` service/version detection
- `-sC` default NSE scripts (informational)
- `-p-` all 65535 ports (IoT often hides admin on odd ports)
- `--script=safe` excludes intrusive/DoS-prone scripts

Risk: low. Cheap IoT devices *occasionally* hang under version probes and need a power cycle. Scan one host at a time and watch it.

### 3. Escalate only if needed
If `-sV` reveals an interesting service (e.g., old HTTP server, exposed Telnet/RTSP), then run vuln scripts against that specific port:

```bash
sudo nmap --script=vuln -p <port> <ip>
```

Avoid `--script=vuln` on every host blindly — some checks can crash unpatched embedded services or trigger credential lockouts.

### 4. Network hygiene regardless of scan results
- Put IoT on a separate VLAN / guest network if the router supports it (isolates `.11`, `.12`, `.17`, possibly `.9`).
- Disable UPnP on the gateway.
- Disable WAN-side remote admin on the gateway.
- Change default credentials on every smart device.
- Block outbound traffic from IoT to the internet where the device doesn't need it (router firewall rules).

### 5. Optional: ongoing monitoring
- `arp -an` weekly, diff against this baseline to spot new devices.
- Pi-hole or AdGuard Home as the LAN DNS resolver — gives visibility into what each IoT device is calling home to.


Wi-Fi and home networking

Q: **What is EasyMesh**? A Wi-Fi Alliance standard (originally 2018, currently R5) for multi-AP roaming inside a home. One "controller" AP coordinates several "agent" APs over a vendor-neutral protocol so a phone can hand off between them without dropping the connection. The agents share client metrics (RSSI, capability, load) with the controller, which decides when to steer a client to a better AP.

It rides on the older IEEE 1905.1 abstraction (a layer-2 control plane that spans Wi-Fi, Ethernet, MoCA, powerline). The data those agents and controller exchange is exposed in TR-181 under Device.WiFi.DataElements.* — so a USP Controller can read the **full mesh topology** + per-station metrics through the same channel it reads everything else. Reference impl: prplMesh (https://github.com/prplfoundation/prplMesh). A planned deeper note lives at notes/wifi-easymesh.md.

Q: SSID vs BSSID — what's the difference?

    SSID is the network name (the string you see in the Wi-Fi list).
    BSSID is the MAC of the AP's radio for that network. One SSID can have many BSSIDs: dual-band APs use different BSSIDs per band, mesh networks use one per node per band, and enterprise SSIDs span dozens of BSSIDs across a building.

In our snapshot, "Piszymsiu" has three BSSIDs (one per band on the ISP's tri-band gateway).

Q: Why does the AP know my RSSI better than I do? RSSI is asymmetric. The Pi measures the AP's signal as the Pi hears it; the AP measures the Pi's signal as the AP hears it. They're often within a few dB but they can differ wildly when the AP has more TX power than the client (typical). The AP also sees every other station on its radio — the Pi only sees itself. That's why Device.WiFi.AccessPoint.{i}.AssociatedDevice.{i}.SignalStrength exists only on the AP side of TR-181.

Q: What is DFS and why is channel 100 special? DFS (Dynamic Frequency Selection) channels in 5 GHz (52–144) are shared with weather/military radar. APs that use them must listen for radar pulses and vacate within seconds. Channels 100–144 (UNII-2 Extended) are wider and less crowded than the indoor-only UNII-1 (36–48), which is why the Pi was steered to channel 100 in our snapshot.

LAN discovery and MACs

Q: What is an OUI? Organizationally Unique Identifier — the first 24 bits of a MAC, assigned by the IEEE to manufacturers. 2c:ec:f7 → Shenzhen SDMC, 28:cd:c1 → Raspberry Pi Trading. The IEEE publishes the full mapping as a CSV. scripts/lan-inventory.sh looks them up via api.macvendors.com and caches results.

Q: Why do some MACs look "randomized"? Modern phones (iOS 14+, Android 10+) and many laptops join Wi-Fi networks with a locally administered MAC — the second-least- significant bit of the first byte is set to 1. The address is not in the IEEE OUI database because it's generated per-network by the client to defeat tracking. lan-inventory.sh detects this bit and labels these as *locally administered (randomized)* without hitting the OUI API.

Q: What does ARP-based discovery miss?

    Devices with no IP currently bound (sleeping, off, just-rebooted)
    Hosts that don't answer ICMP echo (some IoT firmware drops it)
    Hosts on a different VLAN / subnet
    Hosts that talk only IPv6

would the pi with openwrt have more dkb tr181 fields than it currently has? could i deploy one of those easymesh agents?                                                                                                                                                                               

● Short answer: yes to both, with caveats.

  More TR-181 fields on OpenWrt — how much more?

  Depends on what role the Pi plays.

  ┌────────────────────────────────────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────┐
  │                    Role                    │                                                                                What you'd gain vs Raspbian today                                                                                │                 What stays empty                 │
  ├────────────────────────────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────┤
  │ Pi as STA (still just a client) on OpenWrt │ Device.Hosts.Host.*, Device.Firewall.*, Device.NAT.*, Device.Routing.*, Device.DHCPv4.Client.* properly typed; a real USP Agent so leaves are writeable; LocalAgent.* for                       │ WiFi.AccessPoint.*, AssociatedDevice RSSI,       │
  │  + bbfdm + obuspa                          │ Controller/MTP/Subscription                                                                                                                                                                     │ DSL/PON/MoCA, Voice                              │    ────
  ├────────────────────────────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────┤
  │ Pi as AP/router (hostapd + dnsmasq,        │ All of the above, plus Device.WiFi.AccessPoint.* with config, Device.WiFi.AccessPoint.*.AssociatedDevice.*.SignalStrength for every client (the big one), Device.DHCPv4.Server.Pool.*.Client.*  │ DSL/PON line stats (no modem), MoCA, Voice       │
  │ OpenWrt as the gateway)                    │ from dnsmasq leases, Device.UPnP.*, Device.QoS.* if you wire SQM                                                                                                                                │                                                  │
  └────────────────────────────────────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────┘

  The jump from "Pi as STA on OpenWrt" → "Pi as AP on OpenWrt" is bigger than the jump from "Raspbian" → "OpenWrt as STA". The AP role is what unlocks per-client RSSI and the LAN client table — the things you'd actually want a Controller to read.

  Hardware caveat: the Pi 4's onboard Broadcom (BCM43455c0) supports AP mode under OpenWrt's brcmfmac driver but is single-stream Wi-Fi 5 and not very reliable as a long-running AP. A USB adapter from the hardware.md shortlist (ALFA AWUS036ACH / NHA) gives a much better AP experience. Cleanest   tup:
  setup: onboard radio = STA backhaul, USB radio = fronthaul AP.

  EasyMesh agent — yes, but think about radios + Controller

  Technically: opkg install prplmesh on OpenWrt/prplOS gets you a working EasyMesh R2/R3 Agent. The constraints:

  1. One radio is awkward. EasyMesh wants a fronthaul AP (clients connect here) and a backhaul (uplink to another node). Same radio can't do both well — beacons interfere with backhaul scans. The Pi 4's onboard radio is single-radio, single-stream. Realistic minimum: one Pi + one USB Wi-Fi       r,
  adapter, or two Pis.
  2. You need a Controller somewhere. Options:
    - Same Pi running both Controller and Agent — perfectly fine for learning. prplMesh supports it.
    - A second OpenWrt box acting as Controller, your Pi as Agent.
    - Your ISP gateway as Controller — only if it speaks EasyMesh and lets you enrol third-party agents. Most ISP gateways do not.
  3. No interop with consumer mesh kits. prplMesh ↔ Eero / Google / Plume is not a thing. You'd be building an all-prplMesh network.

  Most useful setup for this repo: a spare Pi (or USB SSD on the same Pi for dual-boot) with OpenWrt + USB Wi-Fi adapter as AP, running prplMesh in both Controller and Agent role, with bbfdm + obuspa exposing the whole thing as TR-181. That's the configuration that populates
  Device.WiFi.DataElements.* for real — and it's already on the roadmap as notes/openwrt-tr181-lab.md (Phase 3 of plan.md).

---

## Conclusions




### My SelfHosting Updates


#### Matrix Conduit

Connected to your family without big tech in between?

```sh
cd ./Home-Lab/matrix-conduit #matrix-conduit:6167
  nano conduit.toml
#  docker compose restart conduit
docker compose up -d
  curl -fsS https://what.everdomain.com/_matrix/client/versions
```

> `http://127.0.0.1:8448/_matrix/client/versions`

> > You can use this for: `https://hermes-agent.ai/integrations/matrix`


#### More Nextcloud 

Backups?

```sh
#odex resume 019e34cd-b4de-7ab3-9b11-2fd344315782
df -hT /mnt/data2tb /mnt/data1tb /mnt/backup2tb
```

Results:

Write speed: ~1.8 GB/s
Read speed:  ~3.1 GB/s

That is very good and consistent with an internal NVMe SSD.

```sh
#git clone /Home-Lab
#cd ./Home-Lab/z-homelab-setup/evolution
# cd /home/jalcocert/Home-Lab/z-homelab-setup/evolution && \
  #grep -q '^TERMIX_SALT=' .env || printf '\nTERMIX_SALT=%s\n' "$(openssl rand -base64 24 | tr -d '=+/' | cut -c1-32)" >> .env

sync_root="$(openssl rand -base64 24 | tr -d '=+/' | cut -c1-16)"
sync_pass="$(openssl rand -base64 24 | tr -d '=+/' | cut -c1-16)"

set_var() {
  key="$1"
  value="$2"
  if grep -q "^${key}=" .env; then
    sed -i "s|^${key}=.*|${key}=${value}|" .env
  else
    printf '\n%s=%s\n' "$key" "$value" >> .env
  fi
}

set_var MYSQL_ROOT_PASSWORD_SYNC "${sync_root}"
set_var MYSQL_PASSWORD_SYNC "${sync_pass}"
set_var MYSQL_DATABASE_SYNC "nextcloud_sync"
set_var MYSQL_USER_SYNC "nextcloud_sync"
set_var MYSQL_HOST_SYNC "nextclouddb-sync"
set_var NEXTCLOUD_TRUSTED_DOMAINS_SYNC "http://192.168.1.2:8069"

sudo docker compose -f 2605_docker-compose.yml up -d nextclouddb-sync nextcloud-app-sync
#cd /home/jalcocert/Home-Lab/z-homelab-setup/evolution && docker compose -f 2605_docker-compose.yml --env-file .env up -d nextclouddb-sync nextcloud-app-sync
#sudo docker compose -f ./z-homelab-setup/evolution/2605_docker-compose.yml up -d nextclouddb-sync nextcloud-app-sync
```

> `http://192.168.1.2:8069/` or `nextcloud-sync:80`

![alt text](/blog_img/selfh/cf-sec-rules.png)

{{< callout type="info" >}}
You can use cloudflare to just [expose your services to certain countries/ips](https://jalcocert.github.io/JAlcocerT/image-backup-tools/#cf-waf-vs-zero-trust-access)
{{< /callout >}}

* https://developers.cloudflare.com/waf/custom-rules/use-cases/allow-traffic-from-specific-countries/
* https://developers.cloudflare.com/waf/custom-rules/create-dashboard/

```sh
curl -X PATCH \ 
  "https://api.cloudflare.com/client/v4/zones/some/rulesets/thing/rules/secret" \
  -H "Authorization: Bearer $CF_AUTH_TOKEN" \
  -d '{
    "action": "block",
    "description": "allow countries",
    "enabled": true,
    "expression": "(http.host eq \"whatever.domain.com\" and not ip.src.country in {\"ES\" \"CH\"})",
    "id": "sth",
```

```sh
sudo apt install -y jmtpfs
```

```sh
mkdir -p "/mnt/data2tb/nextcloud/html/data/jesusalcocertech/files/pixel9"
rsync -av --info=progress2 \
  "$HOME/pixel-mtp/Internal shared storage/DCIM/Camera/" \
  "/mnt/data2tb/nextcloud/html/data/jesusalcocertech/files/pixel9/"

#Then scan Nextcloud:
docker exec -u 1000 nextcloud-sync php occ files:scan --path='jesusalcocertech/files/pixel9'  #1min and done
#  fusermount -u ~/pixel-mtp
```

#### Rclone to GDrive

```sh
time rclone copy \
    "googledrive:x300-backup/data2tb/Z_BackUP_HD-SDD/Musica" \
    "/mnt/data2tb/restored/Z_BackUP_HD-SDD/Musica" \
    --progress
# rclone size "googledrive:x300-backup/data2tb/Z_BackUP_HD-SDD/Musica"
```

```sh
#tmux new -s gcp-sync
rclone copy \
  "googledrive:x300-backup/data2tb/Z_BackUP_HD-SDD/Z_FOTOS" \
  "/mnt/data2tb/restored/Z_BackUP_HD-SDD/Z_FOTOS" \
  --progress \
  --transfers 4 \
  --checkers 8
```

Afterward verify:

```sh
  rclone check \
    "googledrive:x300-backup/data2tb/Z_BackUP_HD-SDD/Z_FOTOS" \
    "/mnt/data2tb/restored/Z_BackUP_HD-SDD/Z_FOTOS" \
    --one-way
```

And local size:

du -sh "/mnt/data2tb/restored/Z_BackUP_HD-SDD/Z_FOTOS"


  You can mount them like this:

mkdir -p ~/osmo-internal ~/osmo-sd

sudo mount /dev/sdc ~/osmo-internal
sudo mount /dev/sdd ~/osmo-sd

Then inspect:

ls ~/osmo-internal
ls ~/osmo-sd
du -h --max-depth=2 ~/osmo-internal ~/osmo-sd | sort -hr | head -50

When done:

sudo umount ~/osmo-internal
sudo umount ~/osmo-sd

```sh
docker inspect jellyfin --format '{{range .Mounts}}{{.Source}} -> {{.Destination}}{{println}}{{end}}'
#/home/jalcocert/osmo-internal/DCIM/DJI_001
#/home/jalcocert/osmo-sd/DCIM/DJI_001

mkdir -p "/home/jalcocert/Desktop/YoutubeVideos/OsmoAction/internal"
mkdir -p "/home/jalcocert/Desktop/YoutubeVideos/OsmoAction/sdcard"
```

Then copy:

```sh
rsync -av --info=progress2 \
    --include='*/' \
    --include='*.MP4' \
    --include='*.mp4' \
    --exclude='*' \
    "$HOME/osmo-internal/" \
    "/home/jalcocert/Desktop/YoutubeVideos/OsmoAction/"

rsync -av --info=progress2 \
    --include='*/' \
    --include='*.MP4' \
    --include='*.mp4' \
    --exclude='*' \
    "$HOME/osmo-sd/" \
    "/home/jalcocert/Desktop/YoutubeVideos/OsmoAction/"

# df -h | grep osmo
```
  
Then Jellyfin should see them under its existing `/data/tvshows` library after a library scan.


> Then I could see them via Jellyfin at `http://192.168.1.2:8096/web/`

---


## FAQ
````

{{< /details >}}


## FAQ

### RRSi vs SNR vs Bandwith

