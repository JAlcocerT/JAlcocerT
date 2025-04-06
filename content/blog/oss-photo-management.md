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

...I soon required a lot of extra space.

> Literally in ~1year of use I created >200GB of data. Not counting the [OA5Pro](https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/) Videos.


## SelfHosted Photo Tools

Luckily, there are very cool tools to combine with our SBCs:

1. Lychee
2. [Piwigo](#piwigo)
3. [Photoview](#photoview)
4. [PiGallery2](#pigallery): *a self-hosted directory-first photo gallery website*
4. Ente, PhotoPrism, Immich...

* https://geekflare.com/consumer-tech/self-hosted-photo-backup-alternatives/

[![Star History Chart](https://api.star-history.com/svg?repos=bpatrik/pigallery2,xemle/home-gallery,photoview/photoview,Piwigo/Piwigo&,type=Date)](https://star-history.com/#bpatrik/pigallery2&xemle/home-gallery&photoview/photoview&Piwigo/Piwigo&Date)


{{< callout type="info" >}}
I have added a complete docker stack with these [Selfhostable photo tools **here**](https://github.com/JAlcocerT/Docker/blob/main/Z_Dockge/stacks/z_photo_backup/compose.yaml)
{{< /callout >}}


### Home Gallery

* https://github.com/xemle/home-gallery


[Home Gallery](https://noted.lol/home-gallery-a-simple-self-hosted-photo-gallery/)



### PhotoView

* https://github.com/photoview/photoview
  * https://photoview.github.io/

> aGPL3.0| Photo gallery for self-hosted personal servers 

* Respect the folders and pictures as you have them - Read-Only Policy.
  * You might need to play with the folder permissions `sudo chmod -R 777 /root/photoview2`
* EXIF Metadata
  * The metadata of images and videos is automatically extracted and shown in the sidebar.
  * It's also used to present images on a map. *See the tab on the left called PLACES*
* Video Support and Playback: *Ffmpeg is used under the hood to convert videos and optimize them for the web.*
* In theory, there is [ios App](https://apps.apple.com/in/app/photoview-media-gallery/id1578380271) that I could not get to work. No Android App. So consider it as a Web based project.

[Photoview](https://fossengineer.com/selfhosting-Photoview-docker/) can be configured with a [docker compose **configuration file 🐳**](https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/Photoview_docker-compose.yml)

![alt text](/blog_img/selfh/Photo/photoview.png)

> Create your user/pass + Your path is `/photos` as per the config file.

1. It respects the original folder structure *reads only*
2. Photoview requires a SQL DB, *like MariaDB* or MySQL.

Dont forget to go to settings and scan:

![alt text](/blog_img/selfh/Photo/PhotoView-Scan.png)

```sh
sudo docker stats 6f205c0dde8e #200mb for the UI
sudo docker stats 8a13d19b5820 #another 170 for the DB
```

### PiGallery

* https://github.com/bpatrik/pigallery2
  * https://hub.docker.com/r/bpatrik/pigallery2/tags/

> MIT | A fast directory-first photo gallery website, with rich UI, optimized for running on low resource servers (especially on raspberry pi)


1. Web Based. Lightweight and **no DB required**
* See the pictures on its web UI. Videos in theory as well, but I could not get them running
2. Supports [GPX](https://jalcocert.github.io/JAlcocerT/geospatial-data/) - *See Photos on a Map!*
3. Simple. Read-only. Shows what you have that's it. No gallery changes (photo delete, rotate, enhance, tag...)

**Why do I love PiGallery2**?

* Simplicity: Works perfectly connected to Syncthing/Filebrowser.

```sh
sudo docker stats pigallery2 #~190mb for 66GB data
#du -h --max-depth=1 #see folder size
```

* Yet powerful Photo Details:

![alt text](/blog_img/selfh/Photo/PiGallery-PhotoInfo.png)

* The MAP feature is lovely...

![alt text](/blog_img/selfh/Photo/PiGallery-MAP.png)

> Pretty cool if you have tinkered with [video telemetry](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9)


{{< callout type="info" >}}
See PiGalleryv2 config file [here 🐳](https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/PiGallery_docker-compose.yml)
{{< /callout >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/" title="Adventures!" image="/blog_img/selfh/Photo/PiGallery2-MapZoom.png" subtitle="PiGallery2 is the perfect companion for Travellers!" >}}
  {{< card link="https://github.com/JAlcocerT/pigallery2" title="PiGallery2 Fork" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Could not resist to fork this project!" >}}
{{< /cards >}}



### PiwiGo

* https://github.com/Piwigo/Piwigo
  * https://piwigo.org/

> GPL2.0 | Manage your photos with Piwigo, a full featured open source photo gallery application for the web. Star us on Github! More than 200 plugins and themes available. Join us and contribute!



{{< callout type="info" >}}
See PiwiGo config file [here 🐳](https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/Piwigo_Docker-compose.yml)
{{< /callout >}}

Make this match your docker config:

![alt text](/blog_img/selfh/Photo/Piwigo-setup.png)

And we are ready:

![alt text](/blog_img/selfh/Photo/piwigo_setup.png)


<!-- 
https://www.youtube.com/watch?v=hIGibqdSo6c 
-->

{{< youtube "hIGibqdSo6c" >}}


With pretty cool [features](https://piwigo.org/features):

* Piwigo brings mobile apps for [android](https://play.google.com/store/apps/details?id=com.piwigo.piwigo_ng) and iOS - https://piwigo.org/mobile-applicationshttps://piwigo.org/mobile-applications
  * Allows non-administrator users to also send photos to Piwigo.
  
### Immich

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Media/Photo/Immich_Docker-Compose.yml" title="Immich Config File 🐳 ↗"  >}}
{{< /cards >}}


> The key here is the *really cool* mobile App (Android/iOS)

### PhotoPrism

### Chevereto

* https://fossengineer.com/selfhosting-chevereto-docker/
* https://v4-docs.chevereto.com/guides/docker/
* https://hub.docker.com/r/linuxserver/chevereto

---

## Interesting BackUp Software

https://jalcocert.github.io/RPi/posts/selfhosting-with-docker/#several-apps---raspberry-pi-media-server

### Nextcloud

Nextcloud can do much more than just photo management.

And you can [selfhost NC with docker 🐳](https://github.com/JAlcocerT/Docker/tree/main/Backups/NextCloud)

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

---

## Conclusions

If you are looking for a **Photo Gallery** as a blog:

{{< cards >}}

  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/#other-photo-gallery-themes" title="Photo Gallery Project" image="/blog_img/web/whilecycling2.png" subtitle="Creating a Photo Gallery with HUGO" >}}
{{< /cards >}}

<!-- ![alt text](/blog_img/web/whilecycling2.png) -->

Basically using:

1. HUGO Theme Gallery
2. Astro Musee: even simpler, just place the photos under `./src/assets/images/original`


{{< cards >}}
  {{< card link="https://www.beyondajourney.com/" title="Diamond Bike" image="https://cyclingthere.com/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp" subtitle="Stories with this MTB" >}}
{{< /cards >}}

### Lately...

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

### Tools for Photos

1. https://github.com/danielgatis/rembg

> MIT | Rembg is a tool to remove images background


2. [UpScayl](https://github.com/upscayl/upscayl)

#### Cold Storage

For example, [Amazon Glacier](https://www.geeksforgeeks.org/what-is-amazon-glacier/)

* https://aws.amazon.com/s3/storage-classes/glacier/