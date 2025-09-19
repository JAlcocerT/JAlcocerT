---
title: "How to Share OSS OS via Torrent [with VPNs]"
date: 2025-11-19
draft: false
tags: ["Networking","P2P","NordVPN","ProtonVPN","Mullvad","Wireguard","Tailscale","Gluetun"]
description: How to share Raspberry Pi OS (Bullseye) as Torrent with Qbitrorrent/Transmission and VPN.
url: how-to-torrent-with-a-raspberry
---


**TL;DR**

P2P is not just [about crypto](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) stuff, like:

* https://github.com/bisq-network/bisq

> A decentralized bitcoin exchange network

It can be a way to share with others what you found useful.

+++ and a chance to [get better with VPNs](#vpn-providers)

**Intro**

P2P is all about sharing.

And it can power also web3 websites [via IPFS + UD's](https://jalcocert.github.io/JAlcocerT/guide-web3/).

But this post is all about how to share open source software.

First of all: **Why sharing Raspberry Pi OS** via .torrent?

I got some incompatibility issues with [some **IoT Projects**](https://jalcocert.github.io/RPi/categories/iot-data-analytics/) and the latest Pi Images (bookworm, DEBIAN12).

![Two RPI's 4](/blog_img/hardware/RPi4_2_vs4gb.jpg)

So want to make sure that the projects that I place effort on will continue to work.

We can get Legacy images from [here](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-legacy)

But what if at some point they wont be available?

The raspberry team provides for each image a `.torrent` file so that any of us will become P2P keepers of the OS history.

{{< callout type="warning" >}}
Make sure that you **understand what you are sharing** via P2P. This is just a guide to allow you to share **Open Source Software** with others purely legally. Not for you to go and download The Simpsons or MrRobot.
{{< /callout >}}

## How to Setup Torrents for a Raspberry Pi

I have been collecting some [similar interesting Services to spin with Docker](https://github.com/JAlcocerT/Docker/tree/main/Media/P2P).

{{< callout type="info" >}}
We will need **Docker/Portainer** - So get ready with this [SelfHosting Script](https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh) as **described [here](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/)**
{{< /callout >}}

You have many alternatives, among them: QBittorrent, Transmission,...

### Qbittorrent with the Raspberry Pi

You need this **docker-compose config** file:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/qbittorrent" title="QBittorrent Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/transmission" title="Transmission Docker Config 🐋 ↗" >}}
{{< /cards >}}


> **Thanks to [this guide](https://fossengineer.com/selfhosting-qBittorrent-with-docker-and-VPN/)** and this [one](https://fossengineer.com/transmission-with-vpn-torrent/) for Transmission

### Transmission with the Pi

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/transmission" title="Transmission Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< callout type="info" >}}
When sharing content via P2P, you are **exposing your public IP**. You might want to [use a **VPN**](#how-to-torrent-with-a-vpn)
{{< /callout >}}


### How to Torrent with a VPN

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="Wireguard on a VPS" >}}
    {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="wgEasy on VPS" >}}
{{< /cards >}}

**Here I want to show you have to do it using the VPN you just setup**.

But you can do similarly with 3rd party VPNs: https://protonvpn.com/support/bittorrent-vpn/

Choose one and use your `wg0` network interface from the **wireguard client**:

Key Points to understand:

1. **`network_mode: "host"`**
   - This allows the container to share the host network stack directly, including the `wg0` interface.

2. **No Port Mapping**
   - When using `network_mode: "host"`, port mapping (`ports:`) is unnecessary since the container uses the host's network stack.

3. **Ensure `wg0` is Active**
   - Before starting the container, ensure that your WireGuard interface (`wg0`) is active and routes traffic properly. Use the following command to check:

```bash
wg show
```

4. **Routing Through WireGuard**
   - Verify that your host system routes the necessary traffic through the WireGuard tunnel. For example, you may need to ensure that the `qBittorrent` container traffic follows the correct `wg0` routing rules.

**Verify the Setup** After starting the container with `docker-compose up -d`:

1. Access the `qBittorrent` Web UI at `http://<host-ip>:6011`.
2. Verify the external IP of your `qBittorrent` traffic to confirm it uses the WireGuard tunnel:
   - Check your IP address via a tracker (e.g., [ipleak.net](https://ipleak.net)) or using the tracker settings in `qBittorrent`.

```sh
#docker exec -it qbittorrent sh
curl -sS https://ipinfo.io/json #the command to use
#wget -qO- https://ipinfo.io/json

#for windows you would use
#powershell -Command "(Invoke-WebRequest -Uri https://ipinfo.io/json).Content"
```

---

## Conclusions

So thats it for now.

You you can improve software availability and resilience all with **torrents and P2P**.

Kind of share your work, but with the sense of...share what you've saved?

For example, if you are keeping stored a copy of the F/OSS Debian ISO, you can share it with any other person interested to bring it to their PCs.

At least, **Ill keep a copy of Raspberry Pi OS (Debian 11)** for the Pi.

> Why that one? Because I use it for some IoT Projects

And probably some good [Armbian](https://www.armbian.com/orangepi-5/) for the [Orange Pi 5](https://jalcocert.github.io/RPi/posts/pi-vs-orange/)

{{< callout type="info" >}}
Sharing OSS OS images might seem trivial. But it can help smaller projects to get going!
{{< /callout >}}

---

## FAQ

#### VPN Providers

There are many VPN providers, I have tried these:

* [Mullvad](https://mullvad.net/en/account)
* [ProtonVPN](https://account.protonvpn.com)
    * [Downloads → WireGuard configuration](https://account.protonvpn.com/downloads#wireguard-configuration)
* NordVPN
* Windscribe
* Gluetun

{{< callout type="info" >}}
You can be your own VPN Provider: Get a [VPS+Setup Wireguard](https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/)
{{< /callout >}}


#### Setup a VPN with Wireguard on a VPS

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="Setup a VPS with Wireguard with wgEasy" >}}
{{< /cards >}}

#### How to use Gluetun

* Setup [Gluetun Container](https://fossengineer.com/gluetun-vpn-docker/)
    * https://github.com/qdm12/gluetun-wiki/blob/main/setup/options/wireguard.md

#### How to check IPs

* https://ipleak.net/

```sh
curl -sS https://ipinfo.io/json #the command to use
curl -sS http://ip-api.com/json/ #provides info about country, ISP, ...
curl -6 ifconfig.me #ipv6 info 
```