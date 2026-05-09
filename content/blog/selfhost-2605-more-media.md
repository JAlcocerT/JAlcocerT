---
title: "Selfhosted Media"
date: 2026-05-10T00:20:21+01:00
draft: false
tags: ["Self-Hosting","Audiobooks vs Podcasts","FFmpeg x Prowlarr","Codex"]
description: 'Organizing my media server with agents. Code too with forgejo.'
url: 'selfhosting-media'
---

**TL;DR**

Despite google giving 5TB now: Is there a reliable way not to loose photos for good?

+++ Can I use [CLI agents to order my media](#codex-x-ordering-my-media)?

```sh
#codex #5.5 made a great job
df -hT
```

**Intro**

Time to have a realiable selfhosted cold storage around nextcloud, tailscale and my old 2200G with 4TB HDD :)

Or just...

do some space to spin agents like crazy, have forgejo going and tmux to see how each project goes by


You can [try gram](https://codeberg.org/GramEditor/gram/releases/) to eat less ram: *which code is in forgejo/codeberg btw*

```sh
cd /tmp
curl -fLO https://codeberg.org/GramEditor/gram/releases/download/1.2.1/gram_1.2.1-1_x86_64.deb
#npm install -g opencode-ai
```

I know, you might be already familiar with **PairDrop**

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pairdrop" title="PairDrop | Docker Config 🐋 ↗" >}}
{{< /cards >}}

## Music Media

https://github.com/BernardoGiordano/rewind

https://github.com/Fingel/gelly

>  A native, lightweight music client for Jellyfin and Subsonic. Built with Rust and GTK. 🦀🐧 

### Podcasts or Transcripts

```sh
cd /poc/yt-distil

```


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

### Jellyfin and QBit

Because you will want to move those action cam videos:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/qbittorrent" title="QBittorrent Docker Config 🐋 ↗" >}}
{{< /cards >}}

And share them with your friends :)

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

```sh
git clone /home-lab
cd home-lab/forgejo
#make list-github-repos #make help
make migrate-repo REPO_OWNER=JAlcocerT REPO_NAME=eda-f1                                    
```

![alt text](/blog_img/selfh/forgejo.png)

> http://localhost:3034/user/sign_up


Wanna get ready for agents 24/7 in the Pi?


```sh
# See all existing users                                        
make list-users
# Create a new non-admin user (will be forced to change password on first login)                                                                                                                                                            
make create-user NEW_USER=hermesagent NEW_USER_EMAIL=alice@example.com NEW_USER_PASSWORD=changeme123
# Grant write access to a specific repo (can push, cannot delete or change settings)                                                                                                                                                        
make add-collaborator NEW_USER=alice REPO_OWNER=JAlcocerT REPO_NAME=eda-f1
make list-user-repos NEW_USER=hermesagent
```

---

## Others


* https://github.com/transmute-app/transmute

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

---

## Conclusions

```sh
docker ps -a --filter status=exited --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'
```


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
#codex
```

---

## FAQ




### How to NextCloud


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nextcloud" title="NextCloud | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/immich" title="Immich Docker Config 🐋 ↗" >}}
{{< /cards >}}

Last month I was doing by hand some maintainance [via CLIs to nextcloud](https://jalcocert.github.io/JAlcocerT/oss-automatic-docs-and-tech-video/#faq)

![NCDU tool to check disk space](/blog_img/selfh/HomeLab/ncdu-nextcloud.png)


### How to Immich

I was using Immich wrong:

* `/data/compose/14/library`  -> mounted into immich_server as /usr/src/app/upload
* `/data/compose/14/postgres` -> mounted into immich_postgres as /var/lib/postgresql/data

  Breakdown:

  50G   /data/compose/14/library/upload
  6.8G  /data/compose/14/library/encoded-video
  669M  /data/compose/14/library/thumbs
  314M  /data/compose/14/library/backups

Go to: http://192.168.1.2:2283/map#12.43/36.33211/-6.14777

![alt text](/blog_img/selfh/media/immich.png)

![alt text](/blog_img/selfh/media/immich2.png)

```sh
docker stop immich_server immich_machine_learning immich_postgres immich_redis
docker ps -a --filter name=immich --format 'table {{.Names}}\t{{.Status}}'
```

I didnt like the immich makes strange paths inside: /mnt/data2tb/immich/library/upload

Immich stores files in an app-managed layout, not a human folder layout.

  Example:

  /mnt/data2tb/immich/library/upload/<user-id>/<hash folders>/<asset-id>.jpg
  /mnt/data2tb/immich/library/thumbs/<user-id>/...
  /mnt/data2tb/immich/library/encoded-video/<user-id>/...

  That is normal for Immich. It uses UUIDs, hash-like subfolders, thumbnails, encoded video copies, metadata, and a Postgres database to know what each file actually is. The folder
  names are optimized for the app, not for browsing manually.

  Nextcloud feels different because it exposes a user-facing filesystem:

  nextcloud/data/<user>/files/Photos/...
  nextcloud/data/<user>/files/Documents/...

  So Nextcloud’s storage mirrors what users see in the web UI. Immich’s storage is closer to an internal media database: the UI, albums, dates, people, locations, and search come from
  its database and generated assets, not from nice folder names.

  Short version: Nextcloud is file-first. Immich is photo-library-first.

So i said bye to immich:

```sh
sudo rm -rf /data/compose/14
```

### How to SFTP GO

docker ps -a --filter name=sftp --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'


---

Baseline

  1. Automatic security updates
     On Ubuntu/Debian, use unattended-upgrades for OS security patches.

     sudo apt install unattended-upgrades
     sudo dpkg-reconfigure unattended-upgrades

     Good for: kernel/security patches, OpenSSL, SSH, system packages.

  2. Firewall with UFW
     Default-deny inbound, allow only what you actually use.

     Typical:

     sudo ufw default deny incoming
     sudo ufw default allow outgoing
     sudo ufw allow ssh
     sudo ufw enable
     sudo ufw status verbose

     Then only expose needed service ports, for example Nextcloud via reverse proxy ports 80/443, not every container port.

  3. SSH hardening
     Use keys, disable password login if possible.

     In /etc/ssh/sshd_config:

     PasswordAuthentication no
     PermitRootLogin no
     PubkeyAuthentication yes

     Then:

     sudo systemctl reload ssh

  4. Fail2ban or CrowdSec
     Useful if SSH or web services are internet-facing.

     Simple option:

     sudo apt install fail2ban
     sudo systemctl enable --now fail2ban

  5. Reverse proxy only
     Expose only Traefik/Nginx Proxy Manager/Caddy to the internet. Keep app containers internal unless they must be public.
  6. Backups
     Security includes recovery. For your setup, I’d especially back up:

     Nextcloud config
     Nextcloud database
     Nextcloud user data
     Docker compose files
     Reverse proxy config/certs

  7. Docker hygiene
     Avoid running random containers as privileged. Prefer:

     no privileged: true unless required
     pinned image tags where practical
     bind mounts only where needed
     no Docker socket exposed to web apps

  8. Separate public vs private services
     Public:

     Nextcloud
     maybe landing pages
     reverse proxy

     Portainer
     databases
     dashboards
     Home Assistant admin
     file managers
     SSH

  9. VPN for admin access
     Tailscale, WireGuard, or NetBird is usually better than exposing admin panels publicly.
  10. Monitoring
     At minimum:

  df -h
  docker ps
  systemctl --failed

  Longer term, Uptime Kuma or Beszel are nice lightweight options.

  For your case, I’d do this order:

  1. Enable unattended security updates
  2. Configure UFW
  3. Confirm only 80/443/SSH are exposed
  4. Harden SSH
  5. Put admin tools behind VPN only
  6. Build a real Nextcloud backup routine


› do i need fail2ban if im exposing via cloudflare tunnels?


• Usually: less need, but not zero.

  If your public services are exposed only through Cloudflare Tunnel, then random internet clients are not directly hitting your home IP/ports. That greatly reduces the usefulness of
  Fail2ban on the homelab host, because attackers are connecting to Cloudflare, not directly to your server.

  You still may want Fail2ban if:

  SSH is exposed directly to the internet
  Nextcloud is also reachable by direct IP/port, not only tunnel
  you have local/LAN attackers or compromised LAN devices
  you expose anything outside the tunnel

  If everything public goes through Cloudflare Tunnel, I would prioritize Cloudflare-side controls instead:

  Cloudflare Access for admin apps
  WAF/security rules
  rate limiting for login paths
  country/IP restrictions if useful
  2FA on Cloudflare account
  no direct router port forwards to the homelab

  For your homelab, the better setup is:

  Public internet -> Cloudflare Tunnel -> selected apps
  Admin access -> Tailscale/WireGuard/VPN
  Router port forwards -> none, or only absolutely required
  SSH -> LAN/VPN only

  Then Fail2ban becomes optional rather than essential. It’s still fine to install, but it won’t see most Cloudflare-side attack traffic unless requests reach your service with real
  client IPs and your logs are configured accordingly.

 ---

 For a normal personal Google Drive account, you mainly need this:

  1. rclone installed on the server
  2. a Google account login in a browser
  3. an rclone remote config stored on the server

  The artifact rclone creates is usually:

  ~/.config/rclone/rclone.conf

  That file contains the Google Drive remote definition and OAuth token. Treat it like a secret.

  Typical setup:

  rclone config

  Then choose roughly:

  n) New remote
  name: gdrive
  storage: Google Drive
  client_id: leave blank
  client_secret: leave blank
  scope: drive
  root_folder_id: leave blank
  service_account_file: leave blank
  auto config: yes, if browser available

  After browser login, rclone saves credentials here:

  /home/jalcocert/.config/rclone/rclone.conf

  Test it:

  rclone lsd gdrive:
  rclone mkdir gdrive:homelab-backups
  rclone lsd gdrive:

  If the server has no browser/GUI, run:

  rclone config

  and when asked:

  Use auto config?
  n

  Then rclone gives you a URL. Open that URL on your laptop/desktop, sign in to Google, copy the token/code back into the server prompt.

  For backups, the only artifact you need to preserve is:

  ~/.config/rclone/rclone.conf

  If using restic, also preserve your restic repository password. Without it, the encrypted backup is unrecoverable.
