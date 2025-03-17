---
title: "SelfHosting Updates - Spring 2025"
date: 2025-03-17T23:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Selfhosted Apps that simplify my workflow as of Spring 2025: Homarr, Immich'
url: 'selfhosted-apps-spring-2025'
---



## New SelfHosted Apps

### Homarr

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Media/Homarr_Docker-compose.yml" title="Config File 🐳 ↗"  >}}
{{< /cards >}}

**What I like about Homarr**

1. **Integrations** with other apps: Nextcloud, qbitrorrent, ...

![alt text](/blog_img/selfh/media/homarr-nc.png)

![alt text](/blog_img/selfh/media/homarr1.png)

2. Weather for location (and forecast)
3. Built in RSS Feed. [Example](https://feeds.feedburner.com/visualcapitalist)
4. Plays well with Home assistant

### Better HTTPs and SSL

1. I Started to get https with NGINX

2. Then I tried Caddy with some of my AI projects last year

The good thing with Caddy, is that it will work as long as you have a good Caddyfile written and the DNS records set properly.

3. Traefik has also been a great discovery lately

### Authentication

https://www.youtube.com/watch?v=ywQVe9ikcVI

{{< youtube "ywQVe9ikcVI" >}}

Forward Auth

### Immich

My previous go to solution with: Syncthing + PiGallery works perfectly.

But among all the Photo Tools I reviewed recently, Immich is the one I tried with the best mobile app experience.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Media/Photo/Immich_Docker-Compose.yml" title="Config File 🐳 ↗"  >}}
{{< /cards >}}

**What do I like about Immich**?

It provides a very similar experience to Google Photos.

1. Semantic Search and facial recognition

2. Fantastic [mobile apps](https://immich.app/docs/features/mobile-app): android/ios

3. Respects file folder structure ????

* https://immich.app/docs/features/libraries/

4. Also with Map Feature!

![alt text](/blog_img/selfh/Photo/immich-map.png)

![alt text](/blog_img/selfh/Photo/immich.png)

5. When you create a new user, they will be prompted to change their password during the first login

---

## Conclusions

### Keep Using

1. Media server: Kodi, Jellyfin? 

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Media/Video/kodi_docker_compose.yml" title="Kodi Config File 🐳↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Media/Video/jellyfin_docker-compose.yml" title="Jellyfin Config File 🐳 ↗" >}}
{{< /cards >}}

If you have a smart tv, probably those are already installed or you can add them

![alt text](/blog_img/selfh/media/jellyfin-smarttv.png)

![alt text](/blog_img/selfh/media/jellyfin1.png)

The main difference is that Kodi is a unified server+client application, Jellyfin has the server and the clients separated into different apps. 

Jellyfin will use the CPU, unless you do this trick: https://jellyfin.org/docs/general/administration/hardware-acceleration/amd/

Offline [video workflow](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/): Action cam -> Server -> Jellyfin -> SmartTV 

![alt text](/blog_img/selfh/media/jellyfin-cpu.png)

> See how the server (x300) was quite rev doing 1080p video

LocalSend and NewPipe are also interesting Android Apps to consider

2. Portainer vs Dockge

{{< youtube "UCsYWXEuvms" >}}


<!--
 https://www.youtube.com/watch?v=UCsYWXEuvms 
 -->


#### PiHole

This as been with my for a while.

But now *its reloaded* with its **v6**.

If you are looking for other Selfhosted DNS, see: GoAdblock

<!-- https://www.youtube.com/watch?v=mnry95ay0Bk -->

{{< youtube "mnry95ay0Bk" >}}


---



## Thanks to 

The TechHut:

{{< youtube "yUyxJr2xboI" >}}


https://www.youtube.com/watch?v=yUyxJr2xboI