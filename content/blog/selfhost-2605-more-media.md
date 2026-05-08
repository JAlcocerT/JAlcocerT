---
title: "Selfhosted Media"
date: 2026-05-09T23:20:21+01:00
draft: false
tags: ["Self-Hosting","Audiobooks vs Podcasts","FFmpeg x Prowlarr","Codex"]
description: 'Organizing my Computer via agents.'
url: 'selfhosting-media'
---

https://github.com/transmute-app/transmute

{{< callout type="warning" >}}
Make sure to understand [file types](https://github.com/JAlcocerT/Home-Lab/blob/main/file-format.md)!
{{< /callout >}}

> MIT, Self hosted file converter for images, video, audio, json, excel and more. Supports over 2,000 conversions! 

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/#video-as-a-code" title="Video Docs Section with consolidated info ↗" >}}
{{< /cards >}}

https://github.com/frederikemmer/MediaLyze

Self-hosted media library analysis for large video collections 

https://github.com/ashim-hq/ashim

A Self Hosted Image Manipulator - 45+ tools, local AI, and pipelines in a single Docker container. No cloud, no telemetry. Your images never leave your machine. 

https://github.com/stirling-image/stirling-image

https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#immich
![Immich UI](/blog_img/selfh/Photo/immich.png)

https://jalcocert.github.io/JAlcocerT/image-backup-tools/#nc-vs-immich
![alt text](/blog_img/selfh/media/NC-traefik/nc-32.png)


https://jalcocert.github.io/JAlcocerT/image-backup-tools/#cf-waf-vs-zero-trust-access



![alt text](/blog_img/selfh/Jellyfin/prowlarr-qbittorrent.png)

![MeTube UI](/blog_img/selfh/HomeLab/metube.png)


https://jalcocert.github.io/JAlcocerT/image-backup-tools/#how-to-detect-duplicates-files-in-the-system

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/vert" title="Vert | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mazanoke" title="Mazanoke Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nextcloud" title="NextCloud | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/immich" title="Immich Docker Config 🐋 ↗" >}}
{{< /cards >}}

**TL;DR**

Despite google giving 5TB now: Is there a reliable way not to loose photos for good?

+++ Can I use [CLI agents to order my media](#codex-x-ordering-my-media)?

**Intro**

Time to have a realiable selfhosted cold storage around nextcloud, tailscale and my old 2200G with 4TB HDD :)

I know, you might be already familiar with **PairDrop**

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pairdrop" title="PairDrop | Docker Config 🐋 ↗" >}}
{{< /cards >}}

## Music Media

https://github.com/BernardoGiordano/rewind

https://github.com/Fingel/gelly

>  A native, lightweight music client for Jellyfin and Subsonic. Built with Rust and GTK. 🦀🐧 

## Video Media

Im sure that you are already using qb and prowlarr at `6011` and `9696`.

And that you know how to quickly join your videos via FFMPEG:

```sh
sudo docker compose -f ./z-homelab-setup/evolution/2602_docker-compose.yml up -d prowlarr
#ffmpeg for oa5!
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4 #original audio
#Get-ChildItem -Filter "*.MP4" | ForEach-Object { "file '$($_.Name)'" } | Set-Content file_list.txt
#ffmpeg -f concat -safe 0 -i file_list.txt -c copy output.mp4
```

You can create your own torrent of your joined `.MP4` with:

```sh

```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/qbittorrent" title="QBittorrent Docker Config 🐋 ↗" >}}
{{< /cards >}}


<!-- 
https://blog.bartzz.com/setting-up-secure-transmission-torrent-with-vpn-using-docker/

https://www.nodinrogers.com/post/2021-12-10-transmission-in-docker-with-openvpn/
<https://www.youtube.com/watch?v=5y1z_I_HnoA&t=208s>

https://blog.bartzz.com/how-to-route-docker-container-through-another-container/

-->


Because this it not intended for you to use go to `wolfmax4k`, nor visiting [Anna](https://open-slum.pages.dev/).

### IPTV

* https://github.com/ardoviniandrea/ViniPlay

> A powerful, self-hosted IPTV player with a modern web interface.

## Non Video Media

But what if you record yourself doing podcast or audiobooks?

How could you share that?

Well, you got astro themes like this one:

That it has a public RSS and people would get notified.

Also, you can use:

* https://github.com/Listenarrs/Listenarr

>  Listenarr automates audiobook collection management similar to Sonarr or Radarr, but for audiobooks. It can search, download, and organize your library automatically using metadata from Audible and other sources. 

* Audiobookshelf

Audiobookshelf is the top open-source recommendation for self-hosted audiobook listening and streaming. 

It goes beyond basic MP3 players like Navidrome by offering audiobook-specific features such as chapter navigation, per-user progress syncing, and multi-device support.

* https://github.com/TortugaPower/BookPlayer


### Code is also Media

With all that its going on around github lately: https://www.githubstatus.com/uptime

Ive decided to get a code sync to my HomeLab: *with Forgejo (codeberg) OSS model being > than gitea*

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gitea" title="Gitea | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/forgejo" title="Forgejo | Docker Config 🐋 ↗" >}}
{{< /cards >}}


---

## Conclusions



{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


### BackUps First!

#### My HomeLab Recently

Last months it was all about [this](https://jalcocert.github.io/JAlcocerT/oss-automatic-docs-and-tech-video/#what-ive-tried-recently) and [this](https://jalcocert.github.io/JAlcocerT/private-dns-with-docker/#faq).

* `https://haveibeenpwned.com/`

### Codex x Ordering My Media

1. [BAAAACK-ups](#backups-first)
2. Continue at your own risk!
3. 


```sh
codex
```

---



## FAQ

Youtube `https://piped.kavin.rocks/`