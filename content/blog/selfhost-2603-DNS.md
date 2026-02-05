---
title: "Improving a HomeLab Privacy with OSS DNS"
date: 2026-03-01T23:20:21+01:00
draft: false
tags: ["Self-Hosting x ProtonDrive","Pihole x UnboundDNS","DNS as Distributed DB","Privacy x Euria"]
description: 'How to change DNS Servers and why it matters. Portainer to Homepage-Lite.'
url: 'private-dns-with-docker'
---

httpie

reqable

emqx 

**Tl;DR**

Pros tend to say `its always DNS`


**Intro**

AdguardHome is a good starter for any homelab.

But DNS is a rabbithole of its own.

https://github.com/TechnitiumSoftware/DnsServer

> agpl 3 | Technitium DNS Server

<!-- Interested to discover similar services that you can self-host with Docker? - Check this out:

* {{< gist jalcocert 302f787db6f6d75e978674e0e18d1185
"Docker-Security-ConfigFiles">}}
* <https://fossengineer.com/tags/self-hosting/> -->

<!-- ### Choosing a DNS for PiHole

* Unbound
* Bind9
* Other resolvers:
    * Quad9
    * CLoudflare/Google... -->

<!-- * How to use Raspberry Pi as WIFI **A**ccess **P**oint: https://jalcocert.github.io/RPi/posts/rpi-raspap/
* How to use a RPi as a Wifi 2 Ethernet + VPN: https://jalcocert.github.io/RPi/posts/rpi-wifi-ethernet-bridge/ -->

<!-- ### Best DNS to use with PiHole -->

<!-- 
## Pihole regexp
https://github.com/mmotti/pihole-regex
https://avoidthehack.com/best-pihole-blocklists
https://github.com/mmotti/pihole-regex -->

<!-- 
## Wireshark - Checking which adds are going through
https://docs.linuxserver.io/images/docker-wireshark/

 -->


link checker https://github.com/JAlcocerT/JAlcocerT/actions/runs/20968565017/job/60265649025

https://www.youtube.com/watch?v=U9NgRShXFgk

* [Redis](https://www.youtube.com/watch?v=qucL1F2YEKE)
* SandStorm [SelfHost WebApps](https://docs.sandstorm.io/en/latest/)

{{< details title="DNS challenge | PorkBun 📌" closed="true" >}}



{{< /details >}}

**Cloudflare alternatives?**

* https://github.com/rapiz1/rathole

> A lightweight and high-performance reverse proxy for NAT traversal, written in Rust. An alternative to frp and ngrok.

* https://noted.lol/cgnat-and-rathole/

```sh
dig guideventuretour.com
```

https://jalcocert.github.io/JAlcocerT/web-domain-basics/

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/listmonk/listmonk-api-py/Ebook-cover-SSGs.pdf" title="Get an ebook with all Data Analytics concepts you need" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Learn the concepts and tools to land a job in D&A" >}}
{{< /cards >}}

Wireguard Server
<!-- Tailscale -->

<https://jalcocert.github.io/RPi/projects/rpi_wifi_ethernet_bridge/>

RPi DHCP Server

url: 'selfhosting-PiHole-docker'

https://radar.cloudflare.com/dns



<!-- 
https://awweso.me/dns/ -->


<!-- 
 https://hub.docker.com/r/pihole/pihole
 
 DNSMASQ_LISTENING
 
 https://github.com/pi-hole/docker-pi-hole/?tab=readme-ov-file#environment-variables
     -->

<!-- {{< gist jalcocert 302f787db6f6d75e978674e0e18d1185
"Docker-Security-Pihole.yml">}} -->



#### PiHole

This service has been with my [for a while](https://jalcocert.github.io/RPi/posts/selfh-internet-better/).

But now *PiHole is reloaded* with its **v6**.

> Replacing any v5 image (2024.07.0 and earlier) with a v6 image will result in updated configuration files.

> > These changes are irreversible.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/DNS" title="DNS Config Files 🐳 ↗"  >}}
  {{< card link="https://github.com/JamesTurland/JimsGarage/blob/main/Piholev6/docker-compose.yaml" title="PiHole v6 Config File 🐳 ↗"  >}}  
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=mnry95ay0Bk -->

{{< youtube "mnry95ay0Bk" >}}

> If you are looking for other Selfhosted DNS, see: GoAdblock

https://blog.foxxmd.dev/posts/redundant-lan-dns/

Pi-Hole can even be running into lower power SBCs

{{< youtube "IapRcHzIFZ0" >}}


https://awesome-docker-compose.com/apps/dns

<!-- https://www.youtube.com/@TokinPrivacy/videos

Cybersecurity for Beginners: Basic Skills
https://www.youtube.com/watch?v=aRbKFCY4tjE -->


https://github.com/plaintextpackets/netprobe_lite
Simple internet performance tester written in Python



* quad9
* cloudflare
* adguar
* google
* PiDNS - url: 'selfhosting-PiHole-docker'

* https://www.dnsleaktest.com/
* https://www.techradar.com/news/best-dns-server

Verify DNS Server Functionality:

Test if the DNS server is reachable and functioning properly. You can ping the DNS server:

```sh
ping 192.168.3.1
```

If the ping is successful, try using a direct DNS query to see if DNS resolution is working:

```sh
dig @192.168.3.1 google.com
```

If dig is not installed, you can install it using `sudo apt-get install dnsutils`

<!-- 
Is Your VPN Leaking?
https://www.youtube.com/watch?v=GxVIa3eDdnM -->



##

https://0xerr0r.github.io/blocky/latest/?ref=selfh.st

https://github.com/0xERR0R/blocky

 Fast and lightweight DNS proxy as ad-blocker for local network with many features 

> Blocky is a DNS proxy and ad-blocker for the local network **written in Go** with following features:

{{< dropdown_docker title="Really, Just Get Docker 🐋" closed="true" >}}

https://github.com/getdnsapi/stubby

## Stubby DNS

DNS over TLS

https://www.youtube.com/watch?v=VCTiR_Ny4Sc


### DNSCrypt

https://github.com/DNSCrypt/dnscrypt-proxy

## Unbound DNS

## Pi-Hole DNS

PiHole + Wireguard - https://www.youtube.com/watch?v=R29YBmYxXAk

https://www.youtube.com/watch?v=-5Fwyl73C7g

## Bind9

https://hub.docker.com/r/ubuntu/bind9#!

https://www.youtube.com/watch?v=4IuNKK2y49s

> CÓMO configurar tu DNS - Configuración de BIND [Parte 1]


https://www.youtube.com/watch?v=syzwLwE3Xq4

https://www.youtube.com/watch?v=syzwLwE3Xq4&t=745s
> You want a real DNS Server at home? (bind9 + docker)


## CoreDNS

It is great for Docker: https://www.youtube.com/watch?v=tE9YjEV1T4E

---

## Conclusions

Im sure that you are already using qb and prowlarr at `6011` and `9696`.

How to **test your ad-blocks?**

* https://d3ward.github.io/toolz/ and https://d3ward.github.io/toolz/adblock.html


* NetBird - wireguard based
* Netmaker  - https://www.netmaker.io
* Tailscale or Headscale


If you are concerned about privacy and the use of LLMs, consider:

* [Proton](#proton-for-all) Apps, like [LumoAI](https://lumo.proton.me/u/0/)
* `https://euria.infomaniak.com/`
* Go with Ollama x Goose fully local :)

### From Portainer to homepage-lite

I got issues with Portainer couple of times.

So, gave a shot to HomePage-Lite: *I like that it can be configured via yaml :)*

```sh
#git clone https://github.com/JAlcocerT/Home-Lab
#cd ~/Home-Lab/homepage-lite
#sudo docker compose up -d

##cd ~/Home-Lab
#git pull
#sudo docker compose -f ./z-homelab-setup/evolution/2602_docker-compose.yml up -d homepage-lite

docker ps -a | grep -i homepage-lite
#sudo docker stats homepage-lite
sudo docker compose -f ./z-homelab-setup/evolution/2602_docker-compose.yml logs -f homepage-lite
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/homepage-lite" title="HomePage Lite | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dockge" title="Dockge | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

### Proton for all?

Well, not for all as they dont have a proton drive linux desktop app....yet.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/rclone" title="Rclone | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/sftp-go" title="STFP-Go | HomeLab Config 🐳 ↗"  >}}
{{< /cards >}}

Dont confuse Rclone *which can help you sync local to ProtonDrive*, with rsync: *same that to [pull from weddings](https://youtu.be/h6-3X60QHR8)*

```sh
#sudo ncdu /mnt/data2tb/testftp
#du -sh * | sort -rn #du -sh * | sort -h
rsync -avzP jalcocert@192.168.1.2:/mnt/data2tb/testftp/DJI_20250117084726_0009_D.MP4 ~/Downloads/ #~15MB/s
rsync -avzP jalcocert@192.168.1.2:/mnt/data2tb/IoT ~/Downloads/ #~15MB/s
rsync -avzP jalcocert@192.168.1.2:/mnt/data2tb/2tbe ~/Downloads/ #~15MB/s
#ot back to the server
rsync -avzP /home/jalcocert/Downloads/Music/ jalcocert@192.168.1.2:/home/jalcocert/Desktop/YoutubeMusic #https://lucida.to/
```

They have managed to integrate several apps: *proton mail, authenticator, proton vpn...*

* https://github.com/orgs/protonpass/repositories
    * https://github.com/protonpass/proton-pass-common/releases

```sh
curl -LO https://proton.me/download/authenticator/linux/ProtonAuthenticator_1.0.0_amd64.deb
sudo dpkg -i ProtonAuthenticator_1.0.0_amd64.deb
sudo apt-get install -f
#rm ProtonAuthenticator_1.0.0_amd64.deb
```

* https://account.proton.me/u/0/vpn/vpn-apps
    * https://protonvpn.com/download-linux
    * https://github.com/ProtonVPN/proton-vpn-gtk-app

```sh
#https://protonvpn.com/support/official-linux-vpn-debian/
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
#echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -
sudo apt install proton-vpn-gnome-desktop
```

```sh
sudo apt update  
sudo apt install thunderbird

# wget https://proton.me/download/mail/linux/1.9.0/ProtonMail-desktop-beta.deb
# sudo dpkg -i ProtonMail-desktop-beta.deb
# sudo apt-get install -f
```

### Privacy and OS

How could I not mention this.

If you dont want random CPU spikes because someone has decided to record your screen 

Or that your hardware is too old to allow for browsing the web.

Just...*avoid been forced to generate electronical waste, try linux*

0. [ZorinOS](https://zorin.com/) - If you come from Windows, this is for you. *Zorin 18 requires >1.6GB of RAM*

1. [Lubuntu](https://cdimage.ubuntu.com/lubuntu/releases/noble/release/) - *It requires just ~700mb of RAM with UI*

2. Ubuntu if you want the same, but with GNOME :)

> You can have ubuntu without UI, if you plan to use your server's terminal only

3. If you want to say I use ARCH BTW. 

* [Garuda](https://garudalinux.org/editions)

> Mind the steep*er* learning curve.

4. A Gamer?

* SteamOS
* [CachyOS](https://cachyos.org/) 

Try with a VM: like gnome boxes

```sh
gnome-boxes
```

{{< callout type="info" >}}
Have a look to [Ventoy](https://github.com/ventoy/Ventoy) to create **ISO Multi-Boots**
{{< /callout >}}

Once you are done: *there are some goodies waiting for you [here](https://github.com/JAlcocerT/Home-Lab/tree/main/z-desktop-x-homelab), from [the old big list](https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/Ubuntu_installations_bash)*

```sh
##pkill -9 brave #brave was not behaving properly lately...
#flatpak install flathub app.zen_browser.zen
git clone https://github.com/JAlcocerT/Home-Lab

sudo ./z-benchmarks/Benchmark_101.sh
sudo ./z-benchmarks/Benchmark_101.sh

```

No longer using localsend, just pairdrop via web


{{< youtube "hTw9DBEksx4" >}}



--- 


## FAQ

1. https://github.com/hagezi/dns-blocklists
2. https://github.com/blacklanternsecurity/baddns

**Programmatic DNS updates**

* https://developers.cloudflare.com/api/resources/dns/
* https://github.com/cloudflare/cloudflare-python

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-dns-scripts" title="CF x Porkbun DNS API Py Scripts ↗" >}}
{{< /cards >}}




### Business OSS Driven

The year has just started and you might be motivated to finally launch your business.

<!-- tags: ["OSS for Business","Serverless-Invoices","Payments","BillaBear"] -->


Make sure to understand the licenses.

MIT, Apache v2 will work.

Some examples?

You can get around with open source for:

1. Creating Invoices: There are [several ways to](https://fossengineer.com/open-source-invoice-creator) do so, but I like the simplicity of serverless-invoices.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serverless-invoices" title="Serverless Invoices | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

Your invoices can be backed up with their PDF or just the JSON to save space.

* Remember about: https://jsonformatter.org/

2. Receiving payments: *Stripe API is great and simplify a lot of things.*

* https://github.com/BillaBear/billabear


#### Monitoring

So you are already having few SaaS.

Most of the sites are reciving no traffic.

But there is that idea taking over.

Is your VPS server fried already?

Figure that out with these OSS Monitoring Tools:

* Monitor your vendors
    * https://pingbot.dev/#pricing

Monitoring for your servers, vendors, and infrastructure.

#### Chats

Just see this dedicated post.


#### Project Management

If you are already a [BA](https://jalcocert.github.io/JAlcocerT/business-analytics-skills/)/PM and are very mindful about your [time](https://jalcocert.github.io/JAlcocerT/time-management-data-analytics/) and creation proper project docs like [BRD's](https://jalcocert.github.io/JAlcocerT/brd-vs-frd-for-data-analytics/)

* Project management and issue tracking for everyone - https://github.com/makeplane/plane
    * https://github.com/makeplane/plane?tab=AGPL-3.0-1-ov-file#readme

>  🔥 🔥 🔥 Open Source JIRA, Linear and Asana Alternative. Plane helps you track your issues, epics, and product roadmaps in the simplest way possible. 

* https://github.com/nfoert/cardie - GPL 3.0

> An open source business card designer and sharing platform

#### Billing

There will come a time to invoice someone.

Why not doing [billing with OSS](https://fossengineer.com/open-source-invoice-creator/) as well?

* Lago - https://github.com/getlago/lago?tab=AGPL-3.0-1-ov-file#readme

> Open Source Metering and Usage Based Billing API ⭐️ Consumption tracking, Subscription management, Pricing iterations, Payment orchestration & Revenue analytics


#### Business Cards

* https://github.com/kyaustad/cardyo

>  A simple URL based **digital business card creation** and sharing system 


### Browsers

1. Librewolf vs Zen
2. Chromium vs brave vs Hellium vs Tor browser

TightVNC
Remote Ripple VNC Viewer

**Extensions**

* Kanban board with our bookmarks: <https://github.com/d3ward/b2ntp>
    Again, awsome job of <https://d3ward.github.io/about.html>
* ublock origin
* bitwarden

**Add-ons**

* Privacy Badger
* https everywhere
* ublock origin

### How can I Check my DNS?

https://dnsprivacy.org/dns_privacy_daemon_-_stubby/

### ControlD (Windscribe DNS)


### Other Free Tools for monitoring Internet


* Monitoring Internet quality
* Wireshark
* PiHole

https://docs.linuxserver.io/images/docker-wireshark/

### Interesting Security Tools

* 2fas - https://github.com/twofas/2fas-android
* Proton Auth

### What do I like to bring to my HomeLab?

HomeLab Essentials - https://jalcocert.github.io/JAlcocerT/docs/selfhosting/

1. Container UI's 🐳: [Portainer](https://github.com/JAlcocerT/Home-Lab/tree/main/portainer), Rancher, Dockge...

2. Syncing 🐳: [Syncthing](https://github.com/JAlcocerT/Home-Lab/tree/main/syncthing)

3. Tools 🐳: [IT-Tools](https://github.com/JAlcocerT/Home-Lab/tree/main/it-tools), CosmosServer, [OmniTools](https://github.com/JAlcocerT/Home-Lab/tree/main/omni-tools)

4. [Webs 🐳](https://github.com/JAlcocerT/Docker/tree/main/Web/CMS): Wordpress, Ghost, LinkInBio selfhosted alternatives...

> Wrote a post about the most popular CMS's [here](https://jalcocert.github.io/JAlcocerT/no-code-websites/) and about LinkStack [here](https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/#selfhosted-solutions-for-linkinbio)

> > And Web Analytics like https://github.com/rybbit-io/rybbit

5. Productivity Tools 🐳: Get [proper focus](https://jalcocert.github.io/JAlcocerT/tools-to-improve-focus/)

6. [GenAI Tools 🐳](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen) 

7. [HTTPs Tools](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/): via proxies like NGINX, Traefik or tunneling solutions like Cloudflare Tunnels ...

> I also enjoyed [DuckDNS](https://hub.docker.com/r/linuxserver/duckdns).

8. PaaS Tools, like [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/)

9. [Photo Tools](https://jalcocert.github.io/JAlcocerT/photo-management-tools/)

> The docker related files are [here 🐳](https://github.com/JAlcocerT/Docker/tree/main/Backups/Photos)

10. [SSGs](https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-astro) combined with a headlessCMS and [selfhosted static server](https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-static-hosting) 🐳 