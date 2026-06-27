---
title: "Frigate - Cam with object detection"
date: 2026-08-01T23:20:21+01:00
draft: false
tags: ["Dashboards","NVR","Self-Hosting","Pi-Camera","Side-Quest26"]
description: 'Computer vision for HomeLabs.'
url: 'selfhosting-frigate'
---

**Tl;DR**

If you like computer vision and homelabs, you will enjoy this one :)

**Intro**

To tinker with Computer Vision, you could also use a Pi: *as I did [here](https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/)*

![Pi4 and the ov5647 camera](/blog_img/hardware/RPi4_2gb_cam.jpg)

> And there is a [repo where i tinkered with it](https://gitlab.com/fossengineer1/cv)

```sh
git clone https://github.com/JAlcocerT/RPi
cd ./RPi/Z_RPi_Cam
```

```sh
raspistill -o pico.jpg
#scp yourraspbiuser@192.168.0.232:/home/reisipi/pico.jpg . #copy it to windows CMD
```

Save Pictures Every 60s

Get the sample script at my [RPi Repo](https://github.com/JAlcocerT/RPi/tree/main/Z_RPi_Cam)!

```sh
mkdir -p ~/growth
nano capture_images.sh
./capture_images.sh
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/" title="Pi Camera" image="/blog_img/iot/pi-cam.jpg" subtitle="Try OpenCV and yolov8 with the Pi!" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/#how-to-control-dji-tello-with-python" title="DJi Tello 101" image="/blog_img/hardware/wifi_eth.jpg" subtitle="Get started with a cheap toy dron." >}}
{{< /cards >}}

+++ wanna see how your plants get water from the distance?

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/firebat-ak2-plus-minipc-review/" title="Raspberry Pi and IoT 101" image="/blog_img/iot/pis-esp-mlx.jpg" subtitle="SBCs can do many other things!" >}}
{{< /cards >}}


The **computer vision** is an interesting topic that I have just tinkered with superficially...*two years ago with [the Pi](https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/)*.

With plain python on [this repo](https://gitlab.com/fossengineer1/cv) and with the DJI Dron on this one: [DJI Tello Python](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/)

It kind of related to [the dji drone](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/) as well, as I also played with its camera.

And Im aware that there are dron deployed on fields even during the night with some sort of vision recognition.

But there are cool projects for computer vision that combine

```sh
sudo docker compose -f ./z-homelab-setup/evolution/2607_docker-compose.yml logs -f frigate
# NAMES      IMAGE                                    STATUS
# frigate    ghcr.io/blakeblackshear/frigate:stable   Exited (137) 2 days ago
# mediamtx   bluenviron/mediamtx:latest-rpi           Exited (0) 20 hours ago
```

> Change the default at: `http://192.168.1.18:5000/settings`

## Tools

Beyond the ,DIY' with the Pi camera.

### Frigate

* https://frigate.video/
  * https://github.com/blakeblackshear/frigate
  * https://docs.frigate.video/

> MIT | NVR with realtime local object detection for IP cameras

<https://www.youtube.com/watch?v=sCkswrK0G3I>

```sh
#ghcr.io/blakeblackshear/frigate:stable
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/frigate" title="Frigate | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```env
# GENERAL
DOCKER_MY_NETWORK=caddy_net
TZ=Europe/Bratislava

# FRIGATE
FRIGATE_RTSP_USER=admin
FRIGATE_RTSP_PASSWORD=dontlookatmekameras
# FRIGATE_MQTT_USER=
# FRIGATE_MQTT_PASSWORD=
```

### Others

https://tldraw.dev/

---

## Conclusions

{{< callout type="info" >}}
More about [**DNS** options here](https://github.com/JAlcocerT/Home-Lab/blob/main/z-homelab-setup/about-dns.md)
{{< /callout >}}

Perseverencia (el talento de los que no tenemos talento ) sin autocritica es worthless.

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://genbi.jalcocertech.com" title="Generative BI" image="/blog_img/web/astro/astro-datanova-animated-graph.png" subtitle="The insights that you could not afford to have until now" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


### Whats connected at home?

Here are the commands I used and what each told us.

  ip -o -4 addr show scope global

  Showed the IPv4 interfaces. Key result: the physical home LAN interface is enp2s0 with 192.168.1.2/24, so the home subnet is 192.168.1.0/24. It also showed many Docker bridge networks, which I excluded.

  ip neigh show

  Showed the kernel neighbor/ARP table across all interfaces. This revealed recently seen devices and their MAC addresses, but also included Docker/container networks.

  command -v nmap || command -v arp-scan || command -v avahi-browse || command -v ping

  Checked which discovery tools were installed. Result: nmap was available.

  nmap -sn 192.168.1.0/24

  Performed a local ping/ARP discovery scan of the home LAN. This found 9 live hosts:

  192.168.1.1
  192.168.1.2
  192.168.1.3
  192.168.1.5
  192.168.1.9
  192.168.1.10
  192.168.1.12
  192.168.1.17
  192.168.1.18

  ip neigh show dev enp2s0

  Filtered the neighbor table to only the physical LAN interface. This gave MAC addresses for the live LAN devices and excluded Docker bridges.

  getent hosts 192.168.1.1 192.168.1.2 192.168.1.3 192.168.1.5 192.168.1.9 192.168.1.10 192.168.1.12 192.168.1.17 192.168.1.18

  Tried reverse/local name lookup for the discovered IPs. Only 192.168.1.2 resolved, as jalcocert-x300, which is this machine.

  awk 'BEGIN{p["286BB4"];p["E4BC96"];p["28CDC1"];p["B0A732"];p["2887BA"];p["749779"];p["D83ADD"];p["2CECF7"];p["0A9D7B"]} $1 in p {print $1, substr($0,index($0,$2))}' /usr/share/nmap/nmap-mac-prefixes

  Looked up the MAC OUIs in Nmap’s local vendor database. This identified:

  2887BA -> TP-Link Limited
  28CDC1 -> Raspberry Pi Trading
  749779 -> Cloud Network Technology Singapore PTE.

  command -v avahi-browse
  command -v nbtscan

  Checked whether mDNS or NetBIOS hostname discovery tools were installed. They were not available, so I couldn’t use them to get friendlier device names.




---

## FAQ

### Integrating Frigate with Home Assistant

<https://www.scrypted.app/>
<https://homebridge.io/>
<https://www.home-assistant.io/>

### Frigate OSS Alternatives

* https://github.com/roflcoopter/viseron

> Self-hosted, **local only NVR and AI Computer Vision software**. With features such as object detection, motion detection, face recognition and more, it gives you the power to keep an eye on your home, office or any other place you want to monitor.

### Scrypted

### Other

* https://github.com/ispysoftware/iSpy

### Uptime Kuma x Gotify

Talking about monitoring...

how about getting notified when some service goes down?

https://github.com/BigBoot/AutoKuma

> MIT | AutoKuma is a utility that automates the creation of Uptime Kuma monitors based on Docker container labels. With AutoKuma, you can eliminate the need for manual monitor creation in the Uptime Kuma UI.