---
title: "Tools for better Photo Management and BackUps"
date: 2025-03-08
draft: false
tags: ["OSS"]
description: 'Testing tools for Photo Management and better backup techniques.'
url: 'photo-management-tools'
---

After traveling and tinkering for a while with Photos and videos with [the Pixel 8 Pro](https://jalcocert.github.io/JAlcocerT/pixel-8-pro-tricks/)...


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/#backups" title="Tech for a Trip" image="/blog_img/hardware/travel-pakc.jpg" subtitle="Hardware & Softw setup for traveling" >}}
{{< /cards >}}



## SelfHosted Photo Tools

1. Lychee
2. Piwigo
3. [Photoview](#photoview)
4. PiGallery2: *a self-hosted directory-first photo gallery website*
4. Ente, PhotoPrism, Immich...

[![Star History Chart](https://api.star-history.com/svg?repos=bpatrik/pigallery2,caprover/caprover,zane-ops/zane-ops,rodyherrera/Quantum&,type=Date)](https://star-history.com/#bpatrik/pigallery2&caprover/caprover&rodyherrera/Quantum&zane-ops/zane-ops&Date)


{{< callout type="info" >}}
I have added a complete docker stack with these [Selfhostable photo tools **here**](https://github.com/JAlcocerT/Docker/blob/main/Z_Dockge/stacks/z_photo_backup/compose.yaml)
{{< /callout >}}


### Home Gallery


[Home Gallery](https://noted.lol/home-gallery-a-simple-self-hosted-photo-gallery/)


{{< cards >}}
  {{< card link="https://www.diamondback.com/" title="Diamond Bike" image="https://cyclingthere.com/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp" subtitle="Stories with this MTB" >}}
{{< /cards >}}

### PhotoView

[Photoview](https://fossengineer.com/selfhosting-Photoview-docker/) can be configured with a [docker compose **configuration file**](https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/Photoview_docker-compose.yml)


1. It respects the original folder structure *reads only*
2. Photoview requires a SQL DB, *like MariaDB* or MySQL.

### PiGallery

* https://github.com/bpatrik/pigallery2
  * https://hub.docker.com/r/bpatrik/pigallery2/tags/

> MIT | A fast directory-first photo gallery website, with rich UI, optimized for running on low resource servers (especially on raspberry pi)


1. Web Based. Lightweight and **no DB required**
2. Supports [GPX](https://jalcocert.github.io/JAlcocerT/geospatial-data/) - *See Photos on a Map!*
3. Simple. Read-only. Shows what you have that's it. No gallery changes (photo delete, rotate, enhance, tag...)

**Why do I love PiGallery2**?

* Simplicity: Works perfectly connected to Syncthing/Filebrowser.
* The MAP feature...

![alt text](/blog_img/selfh/PiGallery-MAP.png)

> Pretty cool if you have tinkered with [video telemetry](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9)


{{< callout type="info" >}}
See PiGalleryv2 config file [here 🐳](https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/PiGallery_docker-compose.yml)
{{< /callout >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/" title="PiGallery2 and Adventures" image="blog_img/selfh/PiGallery2-MapZoom.png" subtitle="PiGallery2 is perfect companion for Travellers!" >}}
  {{< card link="https://github.com/JAlcocerT/pigallery2" title="PiGallery2 Fork" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Could not resist to fork this project!" >}}
{{< /cards >}}



### PiwiGo

{{< callout type="info" >}}
See PiwiGo config file [here](https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/Piwigo_Docker-compose.yml)
{{< /callout >}}

With pretty cool [features](https://piwigo.org/features):


---

## Interesting BackUp Software

https://jalcocert.github.io/RPi/posts/selfhosting-with-docker/#several-apps---raspberry-pi-media-server

### Nextcloud

Nextcloud can do much more than just photo management.

And you can [selfhost NC with docker](https://github.com/JAlcocerT/Docker/tree/main/Backups/NextCloud)

<!--
![alt text](/blog_img/selfh/homelab-nextcloud.png) 
-->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/selfhosting-nextcloud/" title="NextCloud also works for Photos" image="/blog_img/selfh/homelab-nextcloud.png" subtitle="NC as a container with a Raspberry Pi" >}}
{{< /cards >}}

---


You can give it a try to [PhotoQT](https://photoqt.org/) or [digiKam](https://www.digikam.org/about/)

```sh
sudo apt install photoqt
```

## Lately...

I have learnt to **export photo frames** from a video ([with ffmpeg](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#quick-videos---ffmpeg-cli)).

Im still impressed that with ffmpeg I dont need to re-render videos, which makes joining them really fast.

{{< callout type="info" >}}
Everything **about videos**, is captured [here](https://github.com/JAlcocerT/YT-Video-Edition)
{{< /callout >}}

> PS: You can also export snapshots with Google photos, *at least at this moment*.

---

## FAQ

### Proper Photo BackUps

Im still in search of my peace of mind regarding backups:

1. Home SSD
2. Home HDD
3. Cloud

The typical **read and write speeds** for different interfaces are as follows:

| Interface | Read Speed (MB/s) | Write Speed (MB/s) |
|---|---|---|
| USB 3.0 | 60 | 30 |
| USB 3.1 Gen 1 | 5 | 5 |
| USB 3.1 Gen 2 | 10 | 10 |
| USB 3.2 Gen 1x1 | 20 | 20 |
| USB 3.2 Gen 2x2 | 40 | 40 |
| USB 4 | 40 | 40 |
| Thunderbolt 4 | 40 | 40 |
| SATA III | 600 | 600 |
| NVMe PCIe 3.0 x4 | 3500 | 3000 |
| NVMe PCIe 4.0 x4 | 7000 | 6000 |

I have been exploring also **NAS** as a reliable options for home backups.

Synlogy seems to be a good alternative, but...in my opinion its just a PC with couple of 3.5 bays.

Im exploring other options at this point.

> I'd just need the space and Linux with containers!


#### Cold Storage

For example, [Amazon Glacier](https://www.geeksforgeeks.org/what-is-amazon-glacier/)

* https://aws.amazon.com/s3/storage-classes/glacier/