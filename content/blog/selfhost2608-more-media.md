---
title: "Frigate - Cam with object detection"
date: 2026-08-01T23:20:21+01:00
draft: false
tags: ["Self-Hosting","Audiobooks vs Podcasts","FFmpeg x Prowlarr"]
description: 'Computer'
url: 'selfhosting-more-media'
---




## Video Media

Im sure that you are already using qb and prowlarr at `6011` and `9696`.

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

