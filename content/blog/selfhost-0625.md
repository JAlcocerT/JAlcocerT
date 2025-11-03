---
title: "SelfHosting - 1st Half 2025 "
date: 2025-06-30T01:20:21+01:00
draft: false
tags: ["HomeLab","Authentication","P2P","Traefik https SSL","LazyDocker","Portmaster"]
description: 'Programatic HTTPs for all services and docker stacks running in your server.'
url: 'selfhosted-apps-06-2025'
---

<!-- https://fossengineer.com/selfhosting-favourite-aug-2024/ -->

Lately, it was all about...[Traefik](https://fossengineer.com/selfhosting-traefik/) to get [programatic https](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/) for homelab services!

While exploring [TinyAuth](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-x-tinyauth-x-flask), I revisited the Jims Garage guide on Traefik v3.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-jimgarage-v33" title="Tinkering with Traefik v3" image="/blog_img/selfh/https/Traefik-UI-https.png" subtitle="Together with TinyAuth as authentication" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-x-tinyauth-x-flask" title="TinyAuth x Traefik x Flask" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code with a Flask App working with the authentication middleware" >}}
{{< /cards >}}

It was also the time to set [a LogTo example](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#logto-authentication) which is an option to bring authentication capabilities to [your webapps](https://jalcocert.github.io/JAlcocerT/web-apps-with-python/).

<!-- ![Traefik UI](/blog_img/selfh/https/Traefik-UI-https.png) -->

**TL;DR**

Discovering [lazydocker](https://github.com/jesseduffield/lazydocker/releases) tool has been very interesting, together with Makefile and uv package manager.

```sh
#docker stats
sudo apt  install golang-go
go install github.com/jesseduffield/lazydocker@latest #another project using GoLanguage!
export PATH=$PATH:$(go env GOPATH)/bin
#docker stats --no-stream --format "{{.Name}}\t{{.CPUPerc}}" | head -n -1 | sort -nrk 2
```

Or just run **LazyDocker with a container** that *dissapears on exit*:

```sh
docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ~/.config/jesseduffield/lazydocker:/root/.config/jesseduffield/lazydocker \
  lazyteam/lazydocker
```

![LazyDocker UI](/blog_img/selfh/HomeLab/lazydocker.png)

* A better [NextCloud Setup](#nextcloud-with-https)
* Better [P2P Setup](#p2p) and [Monitoring](#monitoring): from apps to [internet speed](#internet-speed)
* Some interesting [In Home Tools](#in-home-tools)
* Mid year iteration (06/25) of the [Home Lab container Setup](#conclusions)

In the meantime...

People keep doing awsome stuff: *this time with **solar energy***

<!-- https://www.youtube.com/watch?v=Alx_vwyksTw -->

{{< youtube "Alx_vwyksTw" >}}

> I expect to write a post about solar panels *soon* (relating it with micro-controllers)


## Improvements

Better Backup and media management is always welcome in any homelab.

Ive been improving my [Nextcloud setup](#nextcloud-with-https), together with the [photo management tools](#in-home-tools).

Keeping my references for new ideas clear:

* https://github.com/awesome-selfhosted/awesome-selfhosted
* https://selfh.st/

### Nextcloud with Https

Getting Better at [sync file tools](https://jalcocert.github.io/JAlcocerT/sync-file-tools/)

* https://github.com/9001/copyparty/

> MIT | Portable file server with accelerated resumable uploads, dedup, WebDAV, FTP, TFTP, zeroconf, media indexer, thumbnails++ all in one file, no deps

But the big thing is to get **nextcloud to work with https out of the box.**

![alt text](/blog_img/selfh/media/NC-traefik/running.png)

All thanks to getting Traefik (traefik:v3.3) to work programatically!

So I just needed to get the domain **DNS records accordingly**:

```sh
nslookup nextcloud.jalcocertech.com
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/NextCloud/nc_mariadb.yml" title="NextCloud MariaDB | Config File 🐳 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/NextCloud/nc_mariadb_traefik.yml" title="NextCloud x Traefik | Config File 🐳 ↗"  >}}
{{< /cards >}}


```sh
docker exec -it nextcloud /bin/bash
cd /var/www/html/config/
nano config.php

#docker exec -u www-data nextcloud php occ config:list system | grep trusted_domains -A 10
docker exec -u www-data nextcloud php /var/www/html/occ config:system:get trusted_domains #See how many you have, and put the next
docker exec -u www-data nextcloud php /var/www/html/occ config:system:set trusted_domains 2 --value="192.168.1.11"
docker exec -u www-data nextcloud php /var/www/html/occ config:system:set trusted_domains 3 --value="nextcloud.jalcocertech.com"
```

![alt text](/blog_img/selfh/media/NC-traefik/trusted.png)

Going from this: https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#nextcloud

To this:

![alt text](/blog_img/selfh/media/NC-traefik/nc-https.png)

> remember to use the [Android](https://play.google.com/store/apps/details?id=com.nextcloud.client&pli=1) or iOS app

* https://jalcocert.github.io/JAlcocerT/sync-file-tools/#webdavs

![NextCloud WebDAV Zorin UI](/blog_img/selfh/media/nc-dav-otherlocations.png)

* https://docs.nextcloud.com/server/31/user_manual/en/files/access_webdav.html

```txt
dav://reisikei@192.168.1.11:8080/remote.php/webdav
davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav
davs://your_nc_user@nextcloud.jalcocertech.com/remote.php/webdav
```

![NextCloud Traefik DAVS Connection](/blog_img/selfh/media/NC-traefik/davs.png)

To setup **nextcloud leveraging the https of traefik**

![alt text](/blog_img/selfh/media/NC-traefik/cf-dns.png)

![alt text](/blog_img/selfh/media/NC-traefik/untrusted.png)

![alt text](/blog_img/selfh/media/NC-traefik/config-php.png)

{{< callout type="warning" >}}
When using WebDav the files are **only** on the server, not backed up on your device.
{{< /callout >}}

I got a transfer speed of ~15mb/s via wifi:

```sh
nload
#nload wlp3s0
```

You can also use the desktop app:

```sh
flatpak install flathub com.nextcloud.desktopclient.nextcloud
```

![alt text](/blog_img/selfh/media/NC-traefik/nc-app.png)

See the transfer speed with:

```sh
sudo apt install nload
#ip a
nload wlp3s0
```

> Got a transfer speed of , compared to the ~60MB/s avg to ProtonDrive

You can now enable other devices or create accounts for your friends/family:

![Nextcloud settings](/blog_img/selfh/media/nc-settings-sec.png)

#### Third Party Cloud NC Backup

Last month [on this post](https://jalcocert.github.io/JAlcocerT/os-for-nas/) I tried protondrive with rclone https://github.com/JAlcocerT/Docker/tree/main/Backups#rclone

You could try and backup your nextcloud data folder towards:

1. **ProtonDrive** https://rclone.org/protondrive/#configurations

2. **Google Drive** https://rclone.org/drive/ or https://rclone.org/googlephotos/

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/rclone" title="Rclone with Docker 🐋 ↗" >}}
{{< /cards >}}

#### PortMaster and https

If you are using *portmaster*, you might need to disable `DNS config -> Enforce global/private-split view`

So that the nextcloud configured via Traefik and tailscale DSN will work

{{< callout type="info" >}}
PortMaster might give other incompatibilities with VPNs and so on (if you are using your laptop for work)
{{< /callout >}}

![Portmaster](/blog_img/selfh/https/portmaster-nc-https.png)

### The DNSs

Its all about **the DNS**.

And I saw on [this post](https://forocoches.com/foro//showthread.php?t=10372366) that there is an EU alternative to cloudflare, goodle, quad9 and many other DNS: https://www.joindns4.eu/for-public#resolver-options

Lately, I evne learnt how to **modify Cloudflare DNS records via its API** with a [Python script](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/flask_dnsupdater.py)

<!-- https://www.youtube.com/watch?v=c3XMAz--_Us -->

{{< youtube "c3XMAz--_Us" >}}

{{< youtube "6sznCZ7ttbI" >}}


<!-- https://www.youtube.com/watch?v=6sznCZ7ttbI -->

### Monitoring

Beszel has been an interesting tools for monitoring:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/" title="Beszel Setup" image="/blog_img/Monitoring/beszel-addmonitor.png" subtitle="Monitoring Tools Post | With Beszel 101 Setup" >}}
{{< /cards >}}

On that post I also talked about **Tianji**, which is something more than a Web Analytics tool.

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/setup-tianji-with-docker/" title="Tianji Setup 101 ↗" >}}
  {{< card link="https://fossengineer.com/selfhosting-netdata/" title="NetData Setup ↗" >}}
{{< /cards >}}

You will need a website to monitor (and probably a headlessCMS)

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/Selfhosting-Static-Webs-with-Apache-in-Docker" title="Static Sites x Apache Container 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Headless-CMS" title="HeadLess Tools with Docker 🐋 ↗" >}}
{{< /cards >}}

* Grafana: *for monitoring or [IoT](https://jalcocert.github.io/RPi) projects*

![Grafana UI](/blog_img/selfh/HomeLab/Grafana.png)

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/selfh-grafana-monit/" title="Grafana Setup with a Pi 🐋 ↗" >}}
{{< /cards >}}

<!-- 
https://youtu.be/Uq5tZv6T3ko 
-->

{{< youtube "Uq5tZv6T3ko" >}}


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/IoT/Grafana" title="Grafana with Docker 🐋 ↗" >}}
  {{< card link="https://fossengineer.com/selfhosting-uptime-Kuma-docker/" title="Uptime Kuma ↗" >}}
{{< /cards >}}

To **Monitor LLMs and other Apps**, I also collected few OSS Tools: 

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/free-open-source-chat-bots/#foss-ai-monitoring-tools" title="OSS Monitoring|Post Section ↗" >}}
{{< /cards >}}

#### Internet Speed

I was writting about Server monitoring and internet speed tools [here](https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#internet-monitoring-tools).

I got to now a new interesting tool: https://github.com/orb-community/orb

* https://orb.net/docs/setup-sensor/docker
  * https://orb.net/

> MPL2 | Orb is a **dynamic network observability platform** with agent fleet orchestration and data pipelines with OpenTelemetry 

{{< callout type="info" >}}
Measure your Home Internet Speed with: [WYL and OpenSpeedTest/SpeedTest Tracker](https://jalcocert.github.io/RPi/posts/self-internet-monit/)
{{< /callout >}}

{{< details title="What's the ping and internet speed?" closed="true" >}}

```sh
apt-get install -y iputils-ping
```

```sh
sudo apt-get install speedtest-cli
speedtest-cli #speedtest-cli --simple
```

{{< /details >}}

### P2P

You can find [things to share](https://www.reddit.com/r/Piracy/comments/1c3cikj/where_to_torrent/)

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-qBittorrent-with-docker-and-VPN/" title="QBitTorrent Setup ↗" >}}
{{< /cards >}}

> Isnt it great when [people give *credits*?](https://www.vimoire.com/blog/2025-04-18/qBittorrent-web-UI-container-behind-a-VPN)?

> > In these kind of blogs you can find [interesting DIY stuff, like crypto monero](https://www.vimoire.com/blog/2025-02-01/Setting-up-local-XMR-mining-with-Monero-GUI)

![Qbittorrent UI](/blog_img/selfh/media/qbit.png)

This is how **qbittorrent's admin UI** looks like:

![Qbit Login](/blog_img/selfh/media/qbit-admin.png)

### In Home Tools

1. Reubah: Open source file converter *with img background removal coming soon*

![SelfHosting Reubah](/blog_img/selfh/Photo/reubah.png)

2. Tools Photo related and tech for trips:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/#backups" title="Tech for a Trip" image="/blog_img/hardware/travel-pakc.jpg" subtitle="Hardware & Softw setup for traveling" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-management-tools/" title="Photo Tools" image="/blog_img/selfh/Photo/PiGallery-PhotoInfo.png" subtitle="PiGallery, PhotoView, Immich..." >}}
{{< /cards >}}

For more photo/video tricks, see also:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/" title="Photo & Video Tricks | Post ↗"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#quick-videos---ffmpeg-cli" title="Video FFMPEG CLI | Post ↗"  >}}
{{< /cards >}}

3. IT/Toos + OmniTools

4. Specters: Some kind of ~ filebrowser, but better?

* https://github.com/Phantom8015/Specters

> MIT | A linux web interface

```sh
docker run -p 3001:3000 phantom8016/specters:latest
```

![Specters for HomeLab File Management](/blog_img/selfh/HomeLab/specters.png)

5. PortTracker: *if you like PortMaster, you might be interested on this*

![PortTracker UI](/blog_img/selfh/HomeLab/PortTracker.png)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH/PortTracker" title="PortTracker | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH/Specters" title="Specters | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}

### HomeLab Diagrams

I was very surprised to find out that you can embed https://docs.excalidraw.com/docs/@excalidraw/excalidraw/integration into your websites!

A very interesting to share homelab diagrams with your friends/family.

You could also do the classic Mermaid inside a SliDev PPT: https://sli.dev/features/mermaid

To have a rendered pdf with instructions how to access your selfhosted services

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/SSGs/SliDevJS" title="SliDev PPTs Containerized | Config File 🐳 ↗"  >}}
  {{< card link="https://fossengineer.com/selfhosting-excalidraw/" title="SelfHosting Excalidraw | Post 🐳 ↗"  >}}
{{< /cards >}}

---

## Conclusions

I have discovered **about lazydocker**:

```sh
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
lazydocker
```

> You can press `?` to see further commands, but basically you can just select a container and get exec it directly to it without writing docker CLI commands :)

>> for containers you can also look to podman desktop, [orbstack (paid)](https://orbstack.dev/pricing), 

And tmux has also been great:

```sh
sudo apt install tmux
#tmux
```

Termix, is another service that has also been great to manage couple of homelab devices:

![Using Specters via Termix](/blog_img/selfh/HomeLab/termix-specters.png)

```sh
http://192.168.1.11:8090
```

You have NextTerm as an alternative: https://noted.lol/nexterm/

If you will be connecting to remote computers, remember to:

1. Set proper expiry policy into your tailscale
2. Have a look to **RustDesk** as [Remote Desktop Solution](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#tools-for-selfhosters)

```sh
flatpak install flathub com.rustdesk.RustDesk
```

Filebrowser dev has been abandoned and for me it was still a thing to combine it with PiGallery2.

But now we have filebrowser quantum!

Also, Ive been tinkering a lot with authentication via Logto.

If you are looking for this **post edition's config files**:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH" title="Docker Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Collection of Docker Config Files - 0625 Edition 🐳 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="Home-Lab Github Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Ordered config files | Youtube Video friendly 🐳 ↗" >}}
{{< /cards >}}

**SelfHosting Resources**: If you want more inspiration

* https://openalternative.co/self-hosted
* https://devsuite.co/collections/open-source


With [gemini CLI](https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli/) and similar [vibe coding tools](https://jalcocert.github.io/JAlcocerT/vide-coding/), its been much easier to spin new services:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli" title="AI CLI Tools" image="/blog_img/GenAI/geminiCLI/gemini-mcp.png" subtitle="Tinkering with GeminiCLI | Post" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-x-tinyauth-x-flask" title="TinyAuth x Traefik x Flask" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code with a Flask App working with the authentication middleware" >}}
{{< /cards >}}

<!-- ![Gemini MCP Working](/blog_img/GenAI/geminiCLI/gemini-mcp.png) -->

People are still doing cool stuff with the Pis

<!-- https://www.youtube.com/watch?v=6Vf_zj4Ytxg -->

{{< youtube "6Vf_zj4Ytxg" >}}

---

## FAQ

### HomeLab Commands

1. Whats taking that much space?

```sh
#sudo du -ahx / | sort -rh | head -n 50
sudo du -ahx . | sort -rh | head -n 50 #from current folder and below
```

2. I want to clean old container stuff

```sh
docker builder prune
#docker system prune -a
docker volume prune
docker image prune -a
```