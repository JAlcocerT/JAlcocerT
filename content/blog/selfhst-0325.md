---
title: "SelfHosting Updates - Spring 2025"
date: 2025-03-21T01:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Selfhosted Apps that simplify my workflow as of Spring 2025: Homarr, Immich'
url: 'selfhosted-apps-spring-2025'
---



## New SelfHosted Apps

But first, new Selfhosting ways, wit PODMAN:

```sh
sudo apt-get install python3-pip
pip3 install podman-compose
pip3 show podman-compose
```

```sh
nano ~/.bashrc  # Or nano ~/.zshrc
#add this at the end
export PATH="$PATH:$HOME/.local/bin"
```
Reload:
```sh
source ~/.bashrc   # Or source ~/.zshrc
```


```sh
#docker network create caddy
#podman network create caddy
#podman-compose up -d

podman run -d -p 8888:8000 -p 9999:9000 --name=portainerpodman --restart=always -v $XDG_RUNTIME_DIR/podman/podman.sock:/var/run/docker.sock -v portainerpodman_data:/data portainer/portainer-ce
```

![alt text](/blog_img/selfh/podman-network.png)


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

1. I Started to get https with **NGINX**

2. Then I tried **Caddy** with some of my AI projects last year

The good thing with Caddy, is that it will work as long as you have a good `Caddyfile` written and the DNS records set properly.

> http challenge will require portforwarding if you are behind a NAT, but with DNS Challenge we are good to go

**What do I like about Caddy**

Easy setup as per [JimsGarage Video](https://www.youtube.com/watch?v=ZOtUco5EwoI) and this post https://ugeek.github.io/blog/post/2023-10-05-caddy-certificado-https-autofirmado-red-local.html

{{< callout type="warning" >}}
Make sure to create the **A DNS Record** pointing to the Pi home address, like `pi-portainer.jalcocertech.xyz` before!
{{< /callout >}}


```sh
git clone https://github.com/JAlcocerT/Docker #I have followed his guide and make minor tweaks
cd Security/Proxy/Caddy

sudo docker network create caddy
sudo docker compose up -d #dont use the OLD docker-compose up -d

#docker network connect caddy portainer
```

The local addresses are treated specially, as *reserved IP*:

![alt text](/blog_img/selfh/https/caddy-cloudflare-dns.png)

Remember to configure this:

```sh
sudo nano /etc/hosts
#add the following
192.168.0.155 pi-portainer.jalcocertech.xyz
```

So that you are able to ping and communicate with your locally running service

```sh
ping pi-portainer.jalcocertech.xyz
# PING pi-portainer.jalcocertech.xyz (192.168.0.155) 56(84) bytes of data.
# 64 bytes from pi-portainer.jalcocertech.xyz (192.168.0.155): icmp_seq=1 ttl=64 time=7.31 ms
# 64 bytes from pi-portainer.jalcocertech.xyz (192.168.0.155): icmp_seq=2 ttl=64 time=11.1 ms
# 64 bytes from pi-portainer.jalcocertech.xyz (192.168.0.155): icmp_seq=3 ttl=64 time=25.5 ms
# ^C
# --- pi-portainer.jalcocertech.xyz ping statistics ---
# 3 packets transmitted, 3 received, 0% packet loss, time 2004ms
# rtt min/avg/max/mdev = 7.313/14.621/25.481/7.830 ms
```

![alt text](static/blog_img/selfh/https/caddy-https-cert.png)

The Caddy API its just amazing:

```sh
#sudo apt install jq
curl localhost:2019/config/ #you will see the current caddy config
#curl localhost:2019/config/ | jq .
```

And...you can do some automatic magic, and make new configurations to it via CLI.

{{< details title="More about Caddy 📌" closed="true" >}}



{{< /details >}}

> Thats great if you are planning to spin services automatically without your supervision!

3. **Traefik** has also been a great discovery lately, *thanks to Dokploy which brings it configured*

### Authentication

<!--
https://www.youtube.com/watch?v=ywQVe9ikcVI 
-->

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

Remember that it is possible to make business around open source.

Always check the licenses.

And remember to [create the proper invoice, also with F/OSS](https://fossengineer.com/open-source-invoice-creator/).

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

3. https://github.com/CorentinTh/it-tools

See it live: https://it-tools.tech/

> Collection of handy [online tools](https://www.xda-developers.com/best-utilities-in-it-tools/) for developers, with great UX.

4. [Fail2Ban](https://fossengineer.com/setup-fail2ban-with-docker/) Setup



<!--
 https://www.youtube.com/watch?v=UCsYWXEuvms 
 -->


#### PiHole

This has been with my for a while.

But now *its reloaded* with its **v6**.

If you are looking for other Selfhosted DNS, see: GoAdblock

<!-- https://www.youtube.com/watch?v=mnry95ay0Bk -->

{{< youtube "mnry95ay0Bk" >}}

#### NextCloud

Its a very intuitive way to backup your Smartphones:

![alt text](/blog_img/selfh/media/nextcloud-pixel8-sync.png)

> Respecting your folder order and avoiding the use of ML of immich

And you can always see what you have / modify stuff without taking space on your laptop:

![alt text](/blog_img/selfh/media/nc-dav-otherlocations.png)

See the bottom right, where you can add your [NC web Dav](https://docs.nextcloud.com/server/31/user_manual/en/files/access_webdav.html) path: `davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav` or `dav://your_nc_user@192.168.0.12:8080/remote.php/webdav`

{{< callout type="info" >}}
You can install it on mobile devices via [F-Droid or also Obtanium](https://jalcocert.github.io/JAlcocerT/pixel-8-pro-tricks/#android-apps-i-love) by using `https://github.com/nextcloud/android`
{{< /callout >}}

Or...use **SFTP-Go** as WebDav together with Syncthing: 

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sync-file-tools/#sftp-go" title="RE Streamlit App" image="/blog_img/selfh/media/sftpgo-webadmin.png" subtitle="SFTP-Go Setup" >}}
{{< /cards >}}


#### Youtube FE

There are more alternatives, like:

* https://github.com/christian-fei/my-yt

> Unlicensed | A clean and minimal youtube frontend, without all the ads and whistles





---



## Thanks to 

The TechHut:

{{< youtube "yUyxJr2xboI" >}}


https://www.youtube.com/watch?v=yUyxJr2xboI

### Outro

**Is my home Wifi secure enough?**

```sh
sudo aptitude update
sudo aptitude -y install wifite

sudo apt-get -y install wifite
```