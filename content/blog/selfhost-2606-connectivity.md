---
title: "Selfhosted Connectivity"
date: 2026-06-01
draft: false
tags: ["HomeLab","TapMap"]
description: 'A homelab evaluation of WIFI metrics.'
url: 'home-lab-tools-for-iot'
---

**TL;DR**

https://github.com/olalie/tapmap?ref=selfh.st#docker-linux-host-only
https://olalie.github.io/tapmap/

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
[sudo] password for jalcocert: 
jalcocert@jalcocert:~ $   ! sudo iw dev wlan0 scan | grep -E "SSID|freq|signal" | head -40
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
jalcocert@jalcocert:~ $ 

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

nmap can't see Wi-Fi/RSSI data for other devices — it's an L3/L4 tool (IP, ports, services) and RSSI/band/noise are L1/L2 radio properties. There are three real paths to that information, with different
  tradeoffs:
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