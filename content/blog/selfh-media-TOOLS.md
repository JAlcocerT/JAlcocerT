---
title: "How to make a Media Home Server with OSS"
date: 2023-11-29
draft: false
description: 'Using the OrangePi as Media Server with Jellyfin. With a look to the -arr stack.'
url: 'media-server-with-open-source'
---

1. [Jellyfin](#jellyfin)
2. emby
3. Plex
4. Kodi


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Media/Video" title="Jellyfin and others | Docker Configs 🐋 ↗" >}}
{{< /cards >}}


You can use all these tools [together with ...](#faq)

### Jellyfin

* https://github.com/jellyfin/jellyfin
  * https://github.com/jellyfin/jellyfin?tab=GPL-2.0-1-ov-file#readme

> The Free Software Media System

* https://jellyfin.org/docs/general/installation/container/

* Official Image: https://hub.docker.com/r/jellyfin/jellyfin
* LinuxServer Image: https://hub.docker.com/r/linuxserver/jellyfin

<!-- https://gitlab.com/Linuxserver.io/docker-jellyfin/container_registry
https://quay.io/repository/linuxserver.io/jellyfin
https://hub.docker.com/r/linuxserver/jellyfin
https://github.com/linuxserver/docker-jellyfin/pkgs/container/jellyfin -->

https://fleet.linuxserver.io/


{{< dropdown title="How to setup Jellyfin with Docker ⏬" closed="true" >}}

```yml
#version: '3.8'

services:
  jellyfin:
    image: lscr.io/linuxserver/jellyfin
    container_name: jellyfin
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Rome
    ports:
      - "8096:8096"
    volumes:
      - "~/Docker/Jellyfin:/config" #change it
      - "/home/youruserchangethis/Downloads:/data" #change it
```
{{< /dropdown >}}


* https://github.com/awesome-jellyfin/awesome-jellyfin

{{< dropdown title="Add-ons for Jellyfin ⏬" closed="true" >}}

* https://github.com/AECX/FinTube

Jellyfin Plugin to import directly from YT

* https://gitlab.com/Pixselious/youtube-backloader

{{< /dropdown >}}


---

## Conclusions

### Exploring the -arr Stack

{{< dropdown title="Chatarr ⏬" closed="true" >}}

https://github.com/staythepath/chatarr

> An OpenAI based chatbot with Radarr integration. Chat with the bot and click a movie title to add it to Radarr.

{{< /dropdown >}}

{{< dropdown title="Radarr ⏬" closed="true" >}}

https://github.com/Radarr/Radarr
https://github.com/Radarr/Radarr?tab=GPL-3.0-1-ov-file#readme

> Movie organizer/manager for usenet and torrent users.



{{< /dropdown >}}

{{< dropdown title="Sonarr ⏬" closed="true" >}}

* https://github.com/Sonarr/Sonarr
* https://github.com/Sonarr/Sonarr?tab=GPL-3.0-1-ov-file#readme

> Smart PVR for newsgroup and bittorrent users.


{{< /dropdown >}}


---

## FAQ

{{< dropdown title="Metube / JDownloader / qbit... ⏬" closed="true" >}}


```yml
version: '3.8'

services:
  qbittorrent:
    image: ghcr.io/linuxserver/qbittorrent
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Madrid
      - WEBUI_PORT=6011
    volumes:
      - "/home/Docker/qbittorrent/config:/config"
      - "/home/jalcocert/Downloads:/downloads"
    ports:
      - 6081:6881
      - 6081:6881/udp
      - 6011:6011  
    restart: unless-stopped

  metube:
    image: ghcr.io/alexta69/metube
    container_name: metube
    restart: unless-stopped
    ports:
      - "8081:8081"
    volumes:
      - "/home/jalcocert/Downloads:/downloads"

  jdownloader-2:
    image: jlesage/jdownloader-2
    container_name: jdownloader-2
    ports:
      - "5800:5800"
    volumes:
      - "/home/docker/jdownloader/appdata/jdownloader-2:/config:rw"
      - "/home/jalcocert/Downloads:/output:rw"

  radarr:
    image: lscr.io/linuxserver/radarr:latest
    container_name: radarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - "/home/Docker/radarr/config:/config"
    ports:
      - 7878:7878
    restart: unless-stopped

```

{{< /dropdown >}}

### Media Server with ARM64

* what is the MPP? is the MPP the GPU? I also know it has an NPU, but this sounds like a GPU kind of job.
  * Rockchip Media Process Platform.
  * On ARM processors the GPU is not responsible for video decoding. There’s a VPU for doing such things.

* https://github.com/jellyfin/jellyfin-ffmpeg/pull/318
* https://github.com/jellyfin/jellyfin-ffmpeg/releases/tag/v6.0.1-2

It needs at least v10.2:

```sh
docker pull jellyfin/jellyfin:10.9.8 #example below
```

* Example on how to activate it - https://akashrajpurohit.com/blog/setup-jellyfin-with-hardware-acceleration-on-orange-pi-5-rockchip-rk3558/
  
```sh
cat /sys/kernel/debug/rkrga/load #see how the GPU is doing
```

![jellyfin](/img/SelfHosting/Jellyfin/jellyfin-rockchip-mpp-hwa-enabledpng.png#center)

* Add full HWA pipeline for **Rockchip RK3588** platform allowing us to HW encoder (H264, HEVC) up to **1080p @ 480fps / 4k @ 120fps on RK3588**


4K UHD, or Ultra High Definition, is a resolution standard in digital cinema and computing that offers significantly higher image definition than 1080p HD (High Definition). 

The term "4K" refers to the horizontal resolution, which is approximately ~4,000 pixels.

![jellyfin](/img/SelfHosting/Jellyfin/jellyfin-rockchip-mpp.png#center)

Specifically, the standard resolution for 4K UHD is 3840 x 2160 pixels, which is exactly four times the pixel count of Full HD (1920 x 1080), resulting in sharper and more detailed images. 

* Standard Definition (SD):
  * 480p (720 x 480 pixels): Often referred to as SD, this is the standard resolution for DVD videos.
* High Definition (HD):
  * 720p (1280 x 720 pixels): Known as HD or HD Ready, it offers significantly better detail than SD.
  * 1080p (1920 x **1080** pixels): Also referred to as Full HD or FHD, this resolution is standard for Blu-ray discs and many HDTVs.

* Ultra High Definition (UHD):
  * 4K UHD (3840 x 2160 pixels): Often simply called 4K, this resolution provides four times the pixel count of 1080p.
  * 8K UHD (7680 x 4320 pixels): Known as 8K, it offers four times the pixels of 4K and sixteen times that of 1080p, providing extremely detailed images.

* Digital Cinema Initiatives (DCI) resolutions (used primarily in film production and digital cinema):
  * 2K (2048 x 1080 pixels): Slightly wider than 1080p, used mainly in digital movie projection.
  * 4K DCI (4096 x 2160 pixels): A professional cinema standard that is slightly wider than consumer 4K UHD.

* Wide Quad HD (WQHD):

* 1440p (2560 x **1440** pixels): Also known as QHD or Quad HD, this resolution is common in higher-end computer monitors and mobile devices, offering sharper images than 1080p.

![jellyfin](/img/SelfHosting/Jellyfin/jellyfin-rockchip-mpp-hwa-codecs.png#center)

### Ebooks

* Calibre
* https://gitlab.com/smoores/storyteller

### Other Containers

* https://github.com/IgnisDa/ryot

> GPL 3.0 | Ryot is a versatile platform that helps you effortlessly track and manage your media, fitness, and more. Say goodbye to manual tracking methods like Notion, Google Notes, and Excel.


1. Prowlarr 

#https://docs.linuxserver.io/images/docker-prowlarr/
#https://wiki.servarr.com/                                    # ---> SEEDBOX
#https://docs.linuxserver.io/images/docker-prowlarr/#usage

```yml
---
version: "2.1"
services:
  prowlarr:
    image: lscr.io/linuxserver/prowlarr:latest
    container_name: prowlarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/Docker/prowlarr/config:/config
    ports:
      - 9696:9696
    restart: unless-stopped
```

2. amule

```yml
#https://github.com/ngosang/docker-amule

---
version: "2.1"
services:
  amule:
    image: ngosang/amule
    container_name: amule
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - GUI_PWD=<fill_password>
      - WEBUI_PWD=<fill_password>
      - MOD_AUTO_RESTART_ENABLED=true
      - MOD_AUTO_RESTART_CRON=0 6 * * *
      - MOD_AUTO_SHARE_ENABLED=false
      - MOD_AUTO_SHARE_DIRECTORIES=/incoming;/my_movies
      - MOD_FIX_KAD_GRAPH_ENABLED=true
      - MOD_FIX_KAD_BOOTSTRAP_ENABLED=true
    ports:
      - "4711:4711" # web ui
      - "4712:4712" # remote gui, webserver, cmd ...
      - "4662:4662" # ed2k tcp
      - "4665:4665/udp" # ed2k global search udp (tcp port +3)
      - "4672:4672/udp" # ed2k udp
    volumes:
      - /home/Docker/aMule:/home/amule/.aMule
      - /home/Downloads/amule:/incoming
      - /home/Docker/temp/amule:/temp
    restart: unless-stopped
```