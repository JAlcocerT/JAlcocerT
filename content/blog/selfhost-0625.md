---
title: "SelfHosting - 1st Half 2025 "
date: 2025-06-30T01:20:21+01:00
draft: false
tags: ["HomeLab","Authentication","P2P","Traefik"]
description: 'Programatic Https for all services and docker stacks'
url: 'selfhosted-apps-06-2025'
---

<!-- https://fossengineer.com/selfhosting-favourite-aug-2024/ -->

People keep doing awsome stuff: this time with solar energy

<!-- https://www.youtube.com/watch?v=Alx_vwyksTw -->

{{< youtube "Alx_vwyksTw" >}}

But lately, it was all about...[Traefik](https://fossengineer.com/selfhosting-traefik/) to get [programatic https](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/) for homelab services!

While exploring [TinyAuth](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-x-tinyauth-x-flask), I revisited the Jims Garage guide on Traefik v3.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-jimgarage-v33" title="Tinkering with Traefik v3" image="/blog_img/selfh/https/Traefik-UI-https.png" subtitle="Together with TinyAuth as authentication" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-x-tinyauth-x-flask" title="TinyAuth x Traefik x Flask" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code with a Flask App working with the authentication middleware" >}}
{{< /cards >}}

It was also the time to set [a LogTo example](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#logto-authentication).

<!-- ![Traefik UI](/blog_img/selfh/https/Traefik-UI-https.png) -->

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH" title="Docker Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Collection of Docker Config Files - 0625 Edition" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="Home-Lab" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Ordered config files | Youtube Video friendly" >}}
{{< /cards >}}

**SelfHosting Resources**:

* https://openalternative.co/self-hosted
* https://devsuite.co/collections/open-source


## Improvements

### Nextcloud with Https

Getting Better at [sync file tools](https://jalcocert.github.io/JAlcocerT/sync-file-tools/)

All thanks to getting Traefik (traefik:v3.3) to work programatically!

So I just needed to get the domain DNS records accordingly:

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

Going from this: https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#nextcloud

To this

> remember to use the [Android](https://play.google.com/store/apps/details?id=com.nextcloud.client&pli=1) or iOS app

https://jalcocert.github.io/JAlcocerT/sync-file-tools/#webdavs

![alt text](/blog_img/selfh/media/nc-dav-otherlocations.png)

https://docs.nextcloud.com/server/31/user_manual/en/files/access_webdav.html

```txt
dav://reisikei@192.168.1.11:8080/remote.php/webdav
davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav
davs://your_nc_user@nextcloud.jalcocertech.com/remote.php/webdav
```

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

See the transfer speed with

```sh
sudo apt install nload
#ip a
nload wlp3s0
```

> Got a transfer speed of , compared to the ~60MB/s avg to ProtonDrive

You can now enable other devices or create accounts for your friends/family:

![nextcloud settings](/blog_img/selfh/media/nc-settings-sec.png)

#### Third Party Cloud NC Backup

Last month i tried protondrive with rclone https://github.com/JAlcocerT/Docker/tree/main/Backups#rclone

1. **ProtonDrive**

2. **Google Drive**

#### PortMaster and https

If you are using *portmaster*, you might need to disable DNS config -> Enforce global/private-split view

So that the nextcloud configured via Traefik and tailscale DSN will work

{{< callout type="info" >}}
PortMaster might give other incompatibilities with VPNs and so on (if you are using your laptop for work)
{{< /callout >}}

![Portmaster](/blog_img/selfh/https/portmaster-nc-https.png)

### The DNSs

Its all about the DNS.

And I saw on [this post](https://forocoches.com/foro//showthread.php?t=10372366) that there is an EU alternative to cloudflare, goodle, quad9 and many other DNS: https://www.joindns4.eu/for-public#resolver-options

Lately, I evne learnt how to modify Cloudflare DNS records via its API with a [Python script](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/flask_dnsupdater.py)

<!-- https://www.youtube.com/watch?v=c3XMAz--_Us -->

{{< youtube "c3XMAz--_Us" >}}

{{< youtube "6sznCZ7ttbI" >}}


<!-- https://www.youtube.com/watch?v=6sznCZ7ttbI -->

### Monitoring

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/" title="Beszel Setup" image="/blog_img/Monitoring/beszel-addmonitor.png" subtitle="Monitoring Tools Post | With Beszel 101 Setup" >}}
{{< /cards >}}

On that post I also talked about Tianji, which is something more than a Web Analytics tool.

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/setup-tianji-with-docker/" title="Tianji Setup 101 ↗" >}}
  {{< card link="https://fossengineer.com/selfhosting-netdata/" title="NetData Setup ↗" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/Selfhosting-Static-Webs-with-Apache-in-Docker" title="Static Sites x Apache Container 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Headless-CMS" title="Monitoring Tools with Docker 🐋 ↗" >}}
{{< /cards >}}


Grafana

Uptime Kuma

#### Internet Speed

* https://orb.net/docs/setup-sensor/docker
https://orb.net/

### P2P

You can find [things to share](https://www.reddit.com/r/Piracy/comments/1c3cikj/where_to_torrent/)



{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-qBittorrent-with-docker-and-VPN/" title="QBitTorrent Setup  ↗" >}}
{{< /cards >}}

![Qbittorrent](/blog_img/selfh/media/qbit.png)

![Qbit Login](/blog_img/selfh/media/qbit-admin.png)

### In Home Tools

1. Reubah: with background removal coming soon

![SelfHosting Reubah](/blog_img/selfh/Photo/reubah.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/#backups" title="Tech for a Trip" image="/blog_img/hardware/travel-pakc.jpg" subtitle="Hardware & Softw setup for traveling" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-management-tools/" title="Photo Tools" image="/blog_img/selfh/Photo/PiGallery-PhotoInfo.png" subtitle="PiGallery, PhotoView, Immich..." >}}
{{< /cards >}}

For more photo/video tricks, see also:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/" title="Photo & Video Tricks | Post ↗"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#quick-videos---ffmpeg-cli" title="Video FFMPEG CLI | Post 🐳 ↗"  >}}
{{< /cards >}}

2. IT/Toos + OmniTools


### HomeLab Diagrams

I was very surprised to find out that you can embed https://docs.excalidraw.com/docs/@excalidraw/excalidraw/integration into your websites!

A very interesting to share homelab diagrams with your friends/family.

You could also do the classic Mermaid inside a SliDev PPT https://sli.dev/features/mermaid

To have a rendered pdf with instructions how to access your selfhosted services

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/SSGs/SliDevJS" title="SliDev PPTs Containerized | Config File 🐳 ↗"  >}}
  {{< card link="https://fossengineer.com/selfhosting-excalidraw/" title="SelfHosting Excalidraw | Post 🐳 ↗"  >}}
{{< /cards >}}


---

## Conclusions

Termix has been great to manage couple of homelab devices.

```sh
http://192.168.1.11:8090/
```

Filebrowser dev has been abandoned and for me it was still a thing to combine it with PiGallery2.

But now we have filebrowser quantum!

Also, ive been tinkering a lot with authentication via Logto

With gemini CLI and similar vibe coding tools, its been much easier to spin new services:

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

Whats taking that much space?

```sh
#sudo du -ahx / | sort -rh | head -n 50
sudo du -ahx . | sort -rh | head -n 50 #from current folder and below
```

I want to clean old container stuff

```sh
docker builder prune
#docker system prune -a
docker volume prune
docker image prune -a
```

### SelfHosting Python Web Apps

Lately I have also been [tinkering with Python Web Apps](https://jalcocert.github.io/JAlcocerT/web-apps-with-python/)

So I have updated the docker-compose and Dockerfiles at:

https://github.com/JAlcocerT/Docker/tree/main/Dev/Python_apps


### Other

Link analytics solutions, like Kutt:

![alt text](/blog_img/selfh/links/kutt-selfh.png)

![alt text](/blog_img/selfh/links/kutt-link-creation.png)