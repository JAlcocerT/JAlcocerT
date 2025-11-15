---
title: "SelfHosting Updates - Oct 2025"
date: 2025-10-19T01:20:21+01:00
draft: false
tags: ["SFTPGo x Syncthing","WebDav and Link Analytics","File Sync Tools","P2P Recap","XMRig Benchmark"]
description: 'Best tools for organizing homelab files.'
url: 'selfhosted-apps-oct-2025'
---


**TL;DR**

For a strong homelab, we need backups and proper file management...

+++ Internet Speed Test & Web Analytics with MySpeed and Lunalytics [here](#faq)

**Intro**

During mar25 we saw how to get running few [sync tools](https://jalcocert.github.io/JAlcocerT/sync-file-tools/).

Later on June, I expanded Traefik https knowledge, and separaredly [Nextcloud](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#third-party-cloud-nc-backup).

In [Sept25](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-sept-2025/#hello-again-firebat): I combined NC + Traefik https + Tailscale - which is a lovely setup.

But just in case you dont want to mess with databases, lets see some other **Filebrowser alternatives** and FTPs:

> Yea, im kind of alergic to DBs for HomeLab setups

## Files Files Files

The unexpected happens.

<!-- 
https://www.youtube.com/watch?v=PaPotS8GSpc 
-->

{{< youtube "PaPotS8GSpc" >}}


So lets make sure that we take care of our files.

And I saw few projects lately to see files, like we saw [here](https://jalcocert.github.io/JAlcocerT/events-photo-galleries/):

1. https://github.com/vikramsoni2/nextExplorer

> Web based File Explorer 

2. https://github.com/kyantech/Palmr

>  🌴 Palmr. is an open-source file-sharing platform focused on privacy and security. It enables users to upload, manage, and share files with features like password protection, custom links, and access control without tracking or limitations. Designed for seamless and secure sharing.

3. https://github.com/Sync-in/server

>  Sync-in Server · Secure, open-source platform for file storage, sharing, collaboration, and syncing. 


3. Nextcloud or Immich: 

Just in case that you got that interesting Standard Google offer 200 GB for ~40$/year or your [Google AI Pro with 2TB trial](https://support.google.com/pixelphone/answer/13529884?hl=en#zippy=%2Cpixel-pro-pixel-pro-xl-pixel-pro-fold) has just ended...


```sh
docker exec -it <your-nextcloud-container-name> rm /var/www/html/config/config.php
# Then, exit and restart the container
docker exec -u www-data <your-nextcloud-container-name> php /var/www/html/occ config:list system | grep trusted_domains -A 10
docker exec -u www-data nextcloud php /var/www/html/occ config:system:get trusted_domains
#docker exec -u www-data nextcloud php /var/www/html/occ config:system:set trusted_domains 4 --value="mynewdomain.example.com"
docker exec -u www-data nextcloud php /var/www/html/occ config:system:get trusted_domains
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/immich" title="Immich | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nextcloud" title="Nextcloud | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Immich has been recently updated: https://github.com/immich-app/immich/releases/tag/v2.2.0

And If you dont want **Nextcloud** (despite having a [photo feature](https://nextcloud.com/blog/how-we-got-to-the-new-nextcloud-photos/?ref=selfh.st)) nor Immich...for your latest [photo/video](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/) workflows...

Neither pay for google photos: https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper

You can get away with [Immich respecting your files structure](https://www.youtube.com/watch?v=aY47XEm8mF4), or you could just use PiGallery. 

Which has also been recently upgraded: https://github.com/bpatrik/pigallery2/releases/tag/3.0.0


Read-only access is recommended for both.

Whats cool about Immich is that it has some projects around https://github.com/Nasogaa/immich-drop

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/immich" title="Immich | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pigallery" title="PiGallery | Docker Config 🐋 ↗" >}}
{{< /cards >}}

> > I covered those in previous posts

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#immich" title="Selfhosting Immich" image="/blog_img/selfh/Photo/immich-map.png" subtitle="Spring Y25 Post - Immich Setup" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-management-tools/#pigallery" title="Selfhosting PiGallery" image="/blog_img/selfh/Photo/PiGallery-MAP.png" subtitle="Photo Tools Post - PiGallery" >}}
{{< /cards >}}

<!-- ![PiGallery Map Feature ](/blog_img/selfh/Photo/PiGallery-MAP.png) -->


4. With **Local Send** I got ~4MB/s transfer speed from an iphone to a tablet.

```sh
flatpak install flathub org.localsend.localsend_app
##ps aux --sort=-%mem | grep localsend
```

5. We also have [Pairdrop](https://pairdrop.net/): https://github.com/schlagmichdoch/PairDrop

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pairdrop" title="PairDrop | Docker Config 🐋 ↗" >}}
{{< /cards >}}

> PairDrop: Transfer Files Cross-Platform. No Setup, No Signup. 

6. Would SCP or FTP be faster instead?

With SCP I got ~9mb/s:

![SCP Speed](/blog_img/selfh/HomeLab/scp.png)

I got up to 4mb/s with Wifi:

![SFTP Transfer Speed](/blog_img/selfh/HomeLab/sftp.png)




### Syncthing x SFTPGo

You can get creative with rsync, cron and so on.

But...

A combination of **Syncthing** and **SFTPGo** can be used together to achieve automated file exchange, leveraging the strengths of each tool, although they are fundamentally different.

Syncthing is a **decentralized, peer-to-peer (P2P)** continuous file synchronization tool.

Whereas SFTPGo is a **centralized SFTP server** (that also supports other protocols like FTP/S and WebDAV) with powerful file management and automation features.


{{< details title="More about the Syncthing and SFTPGo Setup... 📌" closed="true" >}}


The primary way to use them together is to set up **Syncthing to sync files to a local directory that SFTPGo uses as a storage backend** (a "virtual folder").

1.  **Syncthing handles synchronization:** Syncthing runs on your client devices (laptops, desktops, phones) and continuously syncs files in real-time to a dedicated folder on your central server. This uses Syncthing's efficient P2P protocol, which is excellent for real-time syncing between devices that are all running the Syncthing software.

2.  **SFTPGo provides access:** SFTPGo runs on the central server, using the same local Syncthing folder as a data source for its users. This allows external users or systems to access those synchronized files using a standard, secure protocol like **SFTP** (or FTP/S, WebDAV, HTTPS via its WebClient).

This setup solves a common Syncthing limitation: providing access to files via a standard server protocol to clients that are **not** running Syncthing.

It's important to understand the different purposes of each tool:

| Feature | Syncthing (Continuous Sync) | **SFTPGo** (Secure File Server) |
| :--- | :--- | :--- |
| **Core Function** | **Continuous, real-time file synchronization** between multiple trusted devices (P2P). | **Secure file access and transfer** using standard protocols (SFTP, FTP/S, etc.) to a central server. |
| **Architecture** | Decentralized (no central server required for P2P sync). | Centralized server architecture. |
| **Protocol** | Custom, secure, encrypted P2P protocol (not SFTP). | Standard protocols: **SFTP**, FTP/S, HTTPS, WebDAV. |
| **File Management** | Focuses on keeping folders identical across peers. | Provides advanced **user management, access controls, quotas, and automation** (Event Manager, webhooks). |
| **Primary Use** | Keeping your own set of devices in sync, or collaborating with a defined set of trusted peers. | Providing secure file exchange for multiple external users/partners, often with granular permissions. |


{{< /details >}}

Syncthing doesn't natively support SFTP as a sync destination.

**SFTPGo** is what brings the SFTP server capability to the shared folder.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#p2p" title="P2P Tools during Summer 25 | Post" image="/blog_img/selfh/media/qbit.png" subtitle="As P2P as it gets | QBittorrent" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/sftp-go" title="SFTPGo | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}

Make sure to have the [data drive mounted properly](#traefik-x-rpi4-x-x300), like: `/mnt/data2tb/testftp`

Remember to create an user (after you created the admin via ): http://jalcocert-x300-1:8011/web/admin/users


```sh
sftp -P 2022 jalcocert@192.168.1.2
```

GNOME Files → Connect to Server:

```sh
#SFTP: sftp://<user>[localhost:2022](cci:4://file://localhost:2022:0:0-0:0)
sftp://<username>@192.168.1.2:2022 #sftp://jalcocert@192.168.1.2:2022
```

![alt text](/blog_img/selfh/HomeLab/sftp-files-zorin.png)

If you want a WebDAV connection, you can use the Nextcloud setup seen last summer:

```txt
dav://reisikei@192.168.1.11:8080/remote.php/webdav
davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav
davs://your_nc_user@nextcloud.jalcocertech.com/remote.php/webdav
```

![NextCloud Traefik DAVS Connection](/blog_img/selfh/media/NC-traefik/davs.png)



<!-- 
![Qbittorrent UI](/blog_img/selfh/media/qbit.png) 
-->


{{< details title="Transmission vs QBittorrent... 📌" closed="true" >}}


Choosing between **Transmission** and **qBittorrent** for [P2P](https://jalcocert.github.io/JAlcocerT/how-to-torrent-with-a-raspberry/) depends on your priorities, as both are popular, free, open-source, and cross-platform (Windows, macOS, Linux) BitTorrent clients.

1. User Interface and Simplicity

| Client | Characteristics | Best For |
| :--- | :--- | :--- |
| **Transmission** | **Minimalist and sleek.** Designed to be lightweight and blend in well with the native operating system environment, especially on macOS and Linux (like Ubuntu, where it's often the default). It has fewer features on the main interface, prioritizing simplicity. | Users who prefer a **simple, clean interface** and just want a client that "just works" with minimal fuss or advanced options. |
| **qBittorrent** | **Feature-rich and traditional.** Often compared to the older versions of uTorrent (before it became ad-heavy). Its interface is more reminiscent of a classic torrent client, offering a comprehensive view of settings and torrent statistics. | Users who prefer a **more traditional, functional, and detailed interface** with many options visible. |

2. Features and Functionality
| Feature | Transmission | qBittorrent |
| :--- | :--- | :--- |
| **Built-in Search Engine** | No (Relies on external tools/plugins) | **Yes** (Integrated search engine with installable Python plugins) |
| **RSS Feed Support** | No (Relies on third-party tools/scripts) | **Yes** (Built-in RSS feed reader and downloader) |
| **Advanced Control** | Good for basic control, but advanced options are often hidden or require the web interface/third-party apps. | **Excellent**—offers more granular control over torrents, trackers, and peers (e.g., advanced content prioritization). |
| **Lightweight/Resource Usage** | **Very lightweight** and has a low memory/CPU footprint, making it ideal for low-power devices like a Raspberry Pi or NAS. | **Lightweight**, but generally uses more memory and CPU than Transmission, especially when handling a large number of torrents. |
| **Daemon/Headless Use** | **Excellent.** Designed for running as a background service (daemon) and easy remote control via a Web UI or remote apps. | Good, includes a Web UI for remote access but is not as inherently built for headless use as Transmission. |

3. Performance and Stability

* **Performance:** Performance is generally competitive. Some users report slightly faster speeds with qBittorrent, particularly with complex or multiple simultaneous downloads, but others find Transmission equally fast for basic needs.

* **Stability:** Both are generally stable. Transmission has had historical security incidents (though resolved), and its design means it tends to use fewer resources, which can aid stability on weaker hardware. qBittorrent is well-regarded for its stability, even under a heavy load of thousands of torrents.

| Choose **Transmission** If... | Choose **qBittorrent** If... |
| :--- | :--- |
| You value a **minimalist, simple, and native-feeling UI** (especially on Mac/Linux). | You need **advanced features** like a built-in search engine or RSS downloader. |
| You are running the client on a **low-power device** (e.g., NAS, Raspberry Pi) or need a very low resource footprint. | You want **fine-grained control** and **more detailed statistics** over your torrents. |
| You primarily want a client that is **easy to set up** for basic downloading and seeding. | You are accustomed to a **traditional torrent client layout** (like older uTorrent). |

Choosing between **Transmission** and **qBittorrent** depends on your priorities, as both are popular, free, open-source, and cross-platform (Windows, macOS, Linux) BitTorrent clients.

1. User Interface and Simplicity

| Client | Characteristics | Best For |
| :--- | :--- | :--- |
| **Transmission** | **Minimalist and sleek.** Designed to be lightweight and blend in well with the native operating system environment, especially on macOS and Linux (like Ubuntu, where it's often the default). It has fewer features on the main interface, prioritizing simplicity. | Users who prefer a **simple, clean interface** and just want a client that "just works" with minimal fuss or advanced options. |
| **qBittorrent** | **Feature-rich and traditional.** Often compared to the older versions of uTorrent (before it became ad-heavy). Its interface is more reminiscent of a classic torrent client, offering a comprehensive view of settings and torrent statistics. | Users who prefer a **more traditional, functional, and detailed interface** with many options visible. |

2. Features and Functionality

| Feature | Transmission | qBittorrent |
| :--- | :--- | :--- |
| **Built-in Search Engine** | No (Relies on external tools/plugins) | **Yes** (Integrated search engine with installable Python plugins) |
| **RSS Feed Support** | No (Relies on third-party tools/scripts) | **Yes** (Built-in RSS feed reader and downloader) |
| **Advanced Control** | Good for basic control, but advanced options are often hidden or require the web interface/third-party apps. | **Excellent**—offers more granular control over torrents, trackers, and peers (e.g., advanced content prioritization). |
| **Lightweight/Resource Usage** | **Very lightweight** and has a low memory/CPU footprint, making it ideal for low-power devices like a Raspberry Pi or NAS. | **Lightweight**, but generally uses more memory and CPU than Transmission, especially when handling a large number of torrents. |
| **Daemon/Headless Use** | **Excellent.** Designed for running as a background service (daemon) and easy remote control via a Web UI or remote apps. | Good, includes a Web UI for remote access but is not as inherently built for headless use as Transmission. |

3. Performance and Stability

* **Performance:** Performance is generally competitive. Some users report slightly faster speeds with qBittorrent, particularly with complex or multiple simultaneous downloads, but others find Transmission equally fast for basic needs.
* **Stability:** Both are generally stable. Transmission has had historical security incidents (though resolved), and its design means it tends to use fewer resources, which can aid stability on weaker hardware. qBittorrent is well-regarded for its stability, even under a heavy load of thousands of torrents.


| Choose **Transmission** If... | Choose **qBittorrent** If... |
| :--- | :--- |
| You value a **minimalist, simple, and native-feeling UI** (especially on Mac/Linux). | You need **advanced features** like a built-in search engine or RSS downloader. |
| You are running the client on a **low-power device** (e.g., NAS, Raspberry Pi) or need a very low resource footprint. | You want **fine-grained control** and **more detailed statistics** over your torrents. |
| You primarily want a client that is **easy to set up** for basic downloading and seeding. | You are accustomed to a **traditional torrent client layout** (like older uTorrent). |

{{< /details >}}

### RClone x ProtonDrive

If you got running your Nextcloud and want to backup your data folder, you could try with **rclone sync towards ProtonDrive**:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/rclone" title="Rclone with Docker 🐋 ↗" >}}
{{< /cards >}}


### Backup websites

If you like some post, you can always do some quick script to get a copy, like [this](https://github.com/JAlcocerT/ebook-ideas/tree/master/x-html-md-notes-from-websites).

Also there are some projects to backup websites, like:

1. [ArchiveBox](https://github.com/ArchiveBox/ArchiveBox)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/archivebox" title="TinyAuth | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}

>  MIT | 🗃 Open source self-hosted web archiving. Takes URLs/browser history/bookmarks/Pocket/Pinboard/etc., saves HTML, JS, PDFs, media, and more... 

2. You could also use https://github.com/dvcoolarun/web2pdf

```sh
git clone https://github.com/dvcoolarun/web2pdf.git
cd web2pdf && docker build -t web2pdf .
docker run -it --rm -v $(pwd):/app web2pdf
```

>  🔄 CLI to convert Webpages to PDFs 🚀 

{{< callout type="warning" >}}
I tried these 2 at [ebook-ideas](https://github.com/JAlcocerT/ebook-ideas) `x-web-to-pdf` and `x-web-goclone`
{{< /callout >}}

---

## Conclusions

I have added here: https://github.com/JAlcocerT/Docker/tree/main/SelfH

The docker stack im using right now :)

You can start with just a Pi SBC and a SSD drive:

![Pi Home Server](/blog_img/hardware/pi-homeserver.jpg)

To backup your emails, you could always try a Gmail -> Protonmail Sync: https://proton.me/support/switch-from-gmail-to-proton

And later continue with any of these tools:

<!-- https://www.youtube.com/watch?v=OOxzP1JvfQk -->

{{< youtube "OOxzP1JvfQk" >}}

If you've got recently a miniPC, you can do some [benchmarks](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/) to the performance.


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-benchmarks" title="Benchmarks | Script ↗" >}}
{{< /cards >}}

```sh
#htop
sudo apt install btop
btop
#lazydocker
#sudo docker stats
#docker stats --no-stream --format "{{.Name}}\t{{.CPUPerc}}" | head -n -1 | sort -nrk 2
```

![alt text](/blog_img/selfh/HomeLab/btop-networkspeed.png)

```sh
sudo apt update && sudo apt install -y speedtest-cli
speedtest --simple
#speedtest --list
```

And if you have read the recent [Crypto with AI](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) post, you can see how people get creative and **benchmark** based on crypto mining performance: https://xmrig.com/benchmark

[Some people](https://www.reddit.com/r/MoneroMining/comments/p3bzzb/is_it_worth_to_mine_xmr/) also use it for mining.

But it wont pay off when taking into cosideration the electricity costs.

Anyways, you can do a quick **XMR benchmark** on your mini PC:

* https://github.com/xmrig/xmrig
  * https://github.com/metal3d/docker-xmrig
  * https://miningpoolstats.stream/monero

>  RandomX, KawPow, CryptoNight and GhostRider unified CPU/GPU miner and RandomX benchmark 

> > Its an interesting project anyways, configurable via JSON for that alternative CPU benchmark


<!-- https://www.youtube.com/watch?v=lu0k59y5z3E -->

{{< youtube "lu0k59y5z3E" >}}


I also got to know a **new browser**, [Helium](https://github.com/imputnet/helium): 

```sh 
wget -P ~/Applications https://github.com/imputnet/helium-linux/releases/download/0.5.7.1/Helium-0.5.7.1-x86_64.AppImage

#With `CTRL+ALT+C` it gets really compact!
#With `CTRL+H`, it opens your synced tab
#flatpak install flathub app.zen_browser.zen
```

> Private, fast, and honest web browser

> > The Chromium-based web browser made for people, with love. Best privacy by default, unbiased ad-blocking, no bloat and no noise.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/neko-browser" title="See also - Neko Browser | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Privacy won, *for now*:

<!-- 
https://www.youtube.com/live/t0Uk9eC146E?si=S9ruQrOgRa-DK_Ze 
-->

{{< youtube "t0Uk9eC146E" >}}

### More stuff Lately

1. If you are experiencing **router restarts**, make sure that your homelab will have a **static local ip**.

Identify the vendor of the [macs connected](https://it-tools.tech/mac-address-lookup) like `ASRock Incorporation`, then make an IP reservation on your router.

> It should be among your CM settings, near the advanced ones like `NAT Forwarding`

> > You can also use duckdns or the traefik+tailscale IP way

Probably having a VPS as compute backup is not a bad idea.

And **[hetzner](https://accounts.hetzner.com/login)** has been leveling up their game: https://docs.hetzner.com/

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-hetzner-vps-setup" title="Hetzner VPS Setup | Script ↗" >}}
{{< /cards >}}

> [CX23](https://www.hetzner.com/cloud/) > CX22 in performance?

> > Pay only for the hours you use, if you have a server for less than a month. No minimum contract period required!

Spinning **Traefik is easier than ever**: *see how to do it for any VPS*

```sh
#git clone https://github.com/JAlcocerT/Home-Lab.git
#cd traefik
#sudo docker compose up -d
cd ./traefik
chmod +x setup-traefik.sh
#cp .env.sample .env
./setup-traefik.sh
```

> Was it easy right?

> > Say thanks to **the power of repetition**, as I made it recently for the [x300](#x300), a [Pi4](#pi4) and the [Firebat](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-sept-2025/#hello-again-firebat)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/traefik/docker-compose.vps.yml" title="Traefik x VPS Setup | Script ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-benchmarks" title="Benchmarks | Scripts ↗" >}}
{{< /cards >}}


2. **Termix** has a [desktop app](https://docs.termix.site/install#connector) now:

```sh
#wget -P ~/Applications 
#wget https://github.com/Termix-SSH/Termix/releases/download/release-1.7.3-tag/Termix-Linux-Portable-1.7.3.zip
unzip Termix-Linux-Portable-1.7.3.zip
unzip Termix-Linux-Portable.zip -d Termix-App
#cd
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/termix" title="Termix | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/fresh-rss" title="FreshRSS | Docker Config 🐋 ↗" >}}
{{< /cards >}}

3. FreshRSS and Matrix: *If you are also tired of big tech infra failing...*

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/matrix-conduit" title="Matrix Conduit server | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/matrix-synapse" title="Matrix Server 🐋 ↗" >}}
{{< /cards >}}

![Matrix Server via Conduit](/blog_img/selfh/HomeLab/conduit.png)

```sh
# sudo apt update  
# sudo apt install liferea  

# sudo apt update  
# sudo apt install quiterss  
```

An **RSS** is always good to be uptodate with [outages, like the *recent AWS* one](https://health.aws.amazon.com/health/status):

Also, apps like [signal might be secure by design](https://jalcocert.github.io/JAlcocerT/homelab-security/#privacy-apps), at least for now.

But that does not mean that they are not still centralized ans **subject to fail** when their infrastructure is not in place:

{{< tweet user="elonmusk" id="1980342034318962881" >}}

<!-- https://x.com/elonmusk/status/1980342034318962881 -->

With **thunderbird** you can connect to both, plus have a local mail client:

```sh
sudo apt update  
sudo apt install thunderbird

# wget https://proton.me/download/mail/linux/1.9.0/ProtonMail-desktop-beta.deb
# sudo dpkg -i ProtonMail-desktop-beta.deb
# sudo apt-get install -f
```

4. Talking about desktops apps see this youtube *and social media downloader*: https://github.com/aandrew-me/ytDownloader

> GPL 3/0 |  Desktop App for downloading Videos and Audios from hundreds of sites 

```sh
#choco install ytdownloader
sudo snap install ytdownloader
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/metube" title="Metube | HomeLab Docker Config 🐋 ↗" >}}
{{< /cards >}}

> Access it `http://jalcocert-x300-1:8081/`

> > Or if you have [traefik setup](#traefik-x-rpi4-x-x300) `https://tube.x300.jalcocert.com`

5. **Jellyfin and Gonic** are great companios for a [media server stack](https://github.com/JAlcocerT/Docker/blob/main/Media/Z_MEDIA_docker-compose.yml):

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gonic" title="Gonic | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin Media Server Tools 🐋 ↗" >}}
{{< /cards >}}

![Gonic music server](/blog_img/selfh/HomeLab/gonic.png)

> Go visit them at `http://jalcocert-x300-1:4747/` and `http://jalcocert-x300-1:8096`

Notice that with Gonic you can also add podcasts via their RSS feed, like in the [astropod](https://github.com/manuelernestog/astropod) theme that provides `https://getastropod.netlify.app/rss.xml`

You have cool desktop clients: [Sonixd](https://github.com/jeffvli/sonixd/releases/tag/v0.15.5)

![Sonixd](/blog_img/selfh/HomeLab/gonic-sonixd.png)


And even a newer: https://github.com/jeffvli/feishin

>  GPL 3.0 | A modern self-hosted music player. 

Which can be used via **AppImageLauncher**:

```sh
#winget install sonixd
wget -P ~/Applications https://github.com/jeffvli/sonixd/releases/download/v0.15.5/Sonixd-0.15.5-linux-x86_64.AppImage
#sonixd

#See also Euphonica: https://github.com/htkhiem/euphonica
#flatpak install https://dl.flathub.org/repo/appstream/io.github.htkhiem.Euphonica.flatpakref
```

6. I have added the **programmatic DNS updater** from [waiting to landing](https://github.com/JAlcocerT/waiting-to-landing), benchmarks and quick setup scripts to HomeLab repo.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/cloudflare-dns-updater.py" title="Cloudflare DNS API Py Script ↗" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/porkbun-domains.py" title="Porkbun API Py Script ↗" >}}
{{< /cards >}}

And have brought them to the Home-Lab repo for proper maintenance:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-dns-scripts" title="Cloudflare x Porkbun DNS API Py Scripts ↗" >}}
{{< /cards >}}


### I was also exploring these file tools

For event photo galleries, I was also having a look...

**Whats required** for photos for events?

1. Filebrowser and [Filebrowser Quantum](https://github.com/gtsteffaniak/filebrowser)

* https://github.com/filebrowser/filebrowser: *This one is tested *in production* as seen [here](https://jalcocert.github.io/JAlcocerT/software-for-weddings)*

* I was interested into the custom branding for the Wedding project and tinkered with it https://filebrowser.org/configuration/custom-branding 
> Apache v2 | 📂 Web File Browser


![Filebrowser Quantum](/blog_img/web/filebrowser-hugo/filebrowser-quantum-login.png)

![alt text](/blog_img/web/filebrowser-hugo/filebrowser-quantum-users.png)


2. PicPeak

* https://github.com/the-luap/picpeak

> **MIT** | 🚀 Self-hosted photo sharing platform for photographers & events. Open-source alternative to PicDrop/Scrapbook with time-limited galleries, password protection, custom branding & no monthly fees. Built with React + Node.js 📸

Which can be deployed as per: https://github.com/the-luap/picpeak/blob/main/DEPLOYMENT_GUIDE.md

3. How about some wetransfer alternative? See [transferzip](https://transfer.zip/) https://github.com/robinkarlberg/transfer.zip-web

> agpl 3.0 | A self-hostable complete **file-sharing solution** that focuses on reliability, security and ease of use.

4. https://github.com/cloudreve/Cloudreve

Cloudreve can help you build a self-hosted file management service that is both suitable for private and public use, with support for multiple storage providers and virtual file systems to provide a flexible file management experience.

> GPL3/0 | 🌩 Self-hosted file management and sharing system, supports multiple storage providers

5. https://codeberg.org/shroff/phylum

> Self-hosted cloud file storage with offline-first web and native clients


6. Palmr https://github.com/kyantech/Palmr

 🌴 Palmr. is an open-source file-sharing platform focused on privacy and security. It enables users to upload, manage, and share files with features like password protection, custom links, and access control without tracking or limitations. Designed for seamless and secure sharing, Palmr. is completely free. 

<!-- https://www.youtube.com/watch?v=Z-zmXoA26Eo -->

{{< youtube "Z-zmXoA26Eo" >}}


7. https://github.com/error311/FileRise

<!-- https://www.youtube.com/watch?v=t8p222fxVL0 -->

{{< youtube "t8p222fxVL0" >}}


### Traefik x Rpi4 x x300

Remember that for backups on an **external drive reliably** to `/mnt/data2tb`:

```sh
df -h | egrep '^Filesystem|^/dev/sda2|^/dev/nvme'
#sudo apt install -y exfatprogs exfat-fuse
sudo mkdir -p /mnt/data2tb

sudo mount -t exfat -o uid=$(id -u),gid=$(id -g),umask=022 /dev/nvme0n1p1 /mnt/data2tb
df -h | grep data2tb
#Persist across reboots (fstab)
#UUID=C000-03BC  /mnt/data2tb  exfat  defaults,uid=1000,gid=1000,umask=022,nofail,x-systemd.device-timeout=5  0  0
#/dev/disk/by-uuid/abcd-4567-1234-abcd-abcd / ext4 defaults 0 1
sudo mount -a
```

Media x Traefik: https://github.com/JAlcocerT/Home-Lab/blob/main/z-homelab-setup/evolution/1025media_docker-compose.yml

#### Traefik x x300 Homelab

Get your API Token (key) with `edit zone DNS` permissions: https://dash.cloudflare.com/profile/api-tokens

```sh
#git clone https://github.com/JAlcocerT/Home-Lab.git


#cd traefik
cp .env.sample .env #add your cloudflare token there and your email, optionally the zoneID for programmatic DNS updates
cp cf-token.sample cf-token ###add JUST your cloudflare token there

source .env #https://dash.cloudflare.com/profile/api-tokens #with edit zone DNS permissions
#verify the token
curl "https://api.cloudflare.com/client/v4/user/tokens/verify" \
     -H "Authorization: Bearer $cf_token"

# Get zone ID via CLI instead of UI (OPTIONAL - only required for programmatic DNS updates)
curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=jalcocertech.com" \
  -H "Authorization: Bearer $cf_token" \
  -H "Content-Type: application/json" | jq -r '.result[0].id'
```

Remember that this is how the directory should look:

{{< filetree/container >}}
  {{< filetree/folder name="config" >}}
    {{< filetree/file name="acme.json" >}}
    {{< filetree/file name="config.yml - Automatically created" >}}
    {{< filetree/file name="traefik.yml" >}}
    {{< /filetree/folder >}}
  {{< filetree/file name="docker-compose.x300.yaml" >}}
  {{< filetree/file name=".env" >}}
  {{< filetree/file name="cf-token" >}}
{{< /filetree/container >}}


{{< callout type="info" >}}
The **only DNS to modify** is the one for Traefik (before we spin the container), the rest is done automatically as per the labels!
{{< /callout >}}

![Cloudflare DNS pointing to Tailscale IP Address](/blog_img/selfh/HomeLab/dns/traefik-homelab-dns.png)

So I added these A type DNS *(only)* records: `x300.jalcocertech.com` and `*.x300.jalcocertech.com` to point to my x300 private IP address.

![cf DNS setup with traefik](/blog_img/selfh/HomeLab/dns-traefik.png)

```sh
#python3 cf-dns-updater.py
dig +short x300.jalcocertech.com A
ping x300.jalcocertech.com
nslookup x300.jalcocertech.com
```

![Changing Cloudflare DNS via Python script](/blog_img/selfh/https/traefik-firebat/cf-dns-python.png)


Then just **spin Traefik**:

```sh
docker compose -f docker-compose.x300.yml up -d
#sudo docker logs traefik ###No log line matching the '' filter ✅
#docker-compose -f docker-compose.x300.yml stop
```

And here it is: https://x300.jalcocertech.com/dashboard/#/

**DONT do**

Connect portainer to traefik network:

```sh
docker network connect traefik_traefik-proxy portainer
#docker exec -it traefik wget -qO- http://portainer:9000/api/system/status
```

**Do** Remember that there are 2 ways to bring services to works with Traefik and https:


1. Tweak the compose files for traefik like so: *see [Termix example](https://github.com/JAlcocerT/Home-Lab/blob/main/termix/docker-compose.traefik.yml)*

Each line has to be tweaked: `"traefik.http.routers.CHANGETHISNAME!!!.middlewares=termix-https-redirect"`

```yml
services:
  termix:
    ports:
      - "8090:8080"
    networks:
      - traefik_traefik-proxy
    labels:
      - "traefik.enable=true"
      - "traefik.docker.network=proxy"
      - "traefik.http.routers.termix.entrypoints=http"
      - "traefik.http.routers.termix.rule=Host(`termix.x300.jalcocertech.com`)" #Tweak this with your subdomain
      - "traefik.http.middlewares.termix-https-redirect.redirectscheme.scheme=https"
      - "traefik.http.routers.termix.middlewares=termix-https-redirect"
      - "traefik.http.routers.termix-secure.entrypoints=https"
      - "traefik.http.routers.termix-secure.rule=Host(`termix.x300.jalcocertech.com`)" #Tweak this with your subdomain
      - "traefik.http.routers.termix-secure.tls=true"
      - "traefik.http.routers.termix-secure.tls.certresolver=cloudflare"
      - "traefik.http.routers.termix-secure.service=termix" #change this to your service name
      - "traefik.http.services.termix.loadbalancer.server.port=8080" #it has to be the container port!!!
networks:
  traefik_traefik-proxy:
    external: true
```

2. Tweak the config files for traefik like so: *see FreshRSS example*

https://github.com/JAlcocerT/Home-Lab/blob/main/traefik/config/config.x300sample.yaml#L31


```yml
#....
  routers: #for external services (outside the traefik network)
    portainer:
      entryPoints:
        - "https"
      rule: "Host(`portainer.x300.jalcocertech.com`)"
      middlewares:
        - default-security-headers
        - https-redirectscheme
      tls: {}
      service: portainer

  services:
    portainer:
      loadBalancer:
        servers:
          - url: "http://portainer:9000" #or simply using the container name plus host port
        passHostHeader: true
```

* Example with Traefik network, Termix: *This one doesnt need any tweak to `./config/config.yaml`* ✅ 

https://github.com/JAlcocerT/Home-Lab/blob/main/termix/docker-compose.traefik.yml

```sh
#cd to homelab root
sudo docker compose -f ./termix/docker-compose.traefik.yml up -d
#docker inspect termix --format '{{json .NetworkSettings.Networks}}' | jq #
#ping termix.x300.jalcocertech.com
```

See how these DNS have been edited by Traefik automatically:

```sh
#dig +short traefik-docker.jimsgarage.co.uk A
dig +short termix.x300.jalcocertech.com A
ping termix.x300.jalcocertech.com
nslookup termix.x300.jalcocertech.com
```

* Example without Traefik network, Portainer/FreshRSS: *these will work with the original compose plus the config and a Traefik restart* ✅ 

https://github.com/JAlcocerT/Home-Lab/blob/main/fresh-rss/docker-compose.yml
https://github.com/JAlcocerT/Home-Lab/blob/main/traefik/config/config.x300sample.yaml#L31

```sh
#docker inspect freshrss --format '{{json .NetworkSettings.Networks}}' | jq #
#docker inspect portainer --format '{{json .NetworkSettings.Networks}}' | jq #
dig +short freshrss.x300.jalcocertech.com A
dig +short portainer.x300.jalcocertech.com A
#sudo docker restart traefik
```

> These records were also set automatically by Traefik!

#### Traefik x Pi4

Connect to the same wifi with your laptop:

```sh
ip route | grep default
nmap -sn 192.168.0.0/24
arp -a #
#ip neighbor
```

Then try Ips randomly, or use: https://it-tools.tech/mac-address-lookup

And get the vendor info:

```
Raspberry Pi Trading Ltd
Maurice Wilkes Building, Cowley Road
Cambridge CB4 0DS
United Kingdom
```

Then just login via SSH: *as you are connected to the same Cable Modem, with the Home-private IP*

```sh
ssh reisipi@192.168.0.233
```

Once again, remember to set proper tailscale expiry not to loose access when you are far from home!

```sh
tailscale status
#ping jalcocert-x300-1
```

![alt text](/blog_img/selfh/HomeLab/tailscale-expiry.png)

Optionally: activate back your pi as a possible exit node

```sh
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
sudo tailscale up --advertise-exit-node 
```

And via tailscale UI just configure:

![alt text](/blog_img/selfh/HomeLab/tailscale-exit.png)


And check that everything is working: 

```sh
#df -h
#btop
sudo apt update && sudo apt install -y speedtest-cli
```

> You should be able to connect via your https://termix.x300.jalcocertech.com/ now!

![alt text](/blog_img/selfh/HomeLab/termix-traefik.png)

Make these network tests if you want:

```sh
speedtest-cli
speedtest --simple
```

As everything is working, you can just get Traefik to do htps quickly for Nextcloud.

But first, get [tabby terminal](https://github.com/Eugeny/tabby/releases/tag/v1.0.228) on your laptop:

```sh
wget -P ~/Applications https://github.com/Eugeny/tabby/releases/download/v1.0.228/tabby-1.0.228-linux-x64.AppImage
#tabby
```

Then just:

![Tabby Terminal looking at htop and sftp file structure](/blog_img/selfh/HomeLab/tabby-terminal.png)

```sh
#nano ~/.ssh/config
#Host Pi4
#  HostName 100.100.100.7
#  User reisipi
```

You can optionally make sure that your Pi accepts vscode/windsurf connection:

```sh
#rm -rf ~/.vscode-server
#rm -rf ~/.windsurf-server
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Anyways:

```sh
git clone https://github.com/JAlcocerT/Home-Lab.git

#python3 cf-dns-updater.py #Point the DNS for Traefik first!
dig +short wal.jalcocertech.com A
ping wal.jalcocertech.com
nslookup wal.jalcocertech.com

cp docker-compose.x300.yml docker-compose.wal.yml
#nano docker-compose.wal.yml #place the correct subdomains

##echo $(htpasswd -nB admin) | sed -e s/\\$/\\$\\$/g
#cp .env.sample .env
#cp cf-token.sample cf-token

#docker compose -f docker-compose.wal.yml up -d
sudo docker logs traefik
sudo docker network ls
```

![alt text](/blog_img/selfh/traefik-admin-login.png)

> As simple as that! https://wal.jalcocertech.com/dashboard/#/

```sh
#sudo docker stats traefik
CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT   MEM %     NET I/O          BLOCK I/O     PIDS
1234abcd   traefik   0.00%     0B / 0B             0.00%     128kB / 1.37MB   16.4kB / 0B   10
```

As i was having Nextcloud running already, I decided to go with the config way of adding it to Traefik:

```sh
cd config
nano config.yaml
sudo docker restart traefik
ping portainer.wal.jalcocertech.com

docker network connect traefik_traefik-proxy portainer
#docker exec -it traefik wget -qO- http://portainer:9000/api/system/status
#docker inspect portainer --format '{{json .NetworkSettings.Networks}}' | jq

ping adguardhome.wal.jalcocertech.com
#sudo docker logs adguardhome
```

![Using Adguard via Traefik for https](/blog_img/selfh/HomeLab/dns/adguard.png)

![Adguard Home DNS Servers via container](/blog_img/selfh/HomeLab/dns/adguardhome-dns-servers.png)

https://github.com/JAlcocerT/Home-Lab/blob/main/adguardhome/docker-compose.traefik.yml
https://github.com/JAlcocerT/Home-Lab/blob/main/traefik/docker-compose.wal.yml



---

## FAQ

See if you got some duplicates:

```sh
#sudo apt install -y fdupes
fdupes -rS /mnt/data2tb #List duplicates with sizes:
```

**More Selfhosted resources** *These are new from this post*

1. https://tom-doerr.github.io/repo_posts/

{{< tweet user="tom_doerr" id="1979894065400263086" >}}

<!-- 
https://x.com/tom_doerr/status/1979894065400263086?

* https://libreselfhosted.com/project/fluxbb/
* https://awesome-docker-compose.com/apps/photo-server/pigallery-2

 -->

**Selfhosted resources:** *you should know already*

* https://www.open-source-tools.com/metube
* Some [forums](https://forocoches.com/foro/showthread.php?t=7806376&page=48) or [reddit](https://www.reddit.com/r/selfhosted/)

* From the creator of https://github.com/Lissy93/networking-toolbox and https://github.com/Lissy93/portainer-templates

> MIT | 🛜 All-in-one offline-first networking tools and utilities

>> MIT | 🚢 500+ 1-click Portainer app templates

* https://github.com/Lissy93/awesome-privacy




### Monitoring For HomeLab

I discovered about **Peekaping**: https://github.com/0xfurai/peekaping/

![Peekaping Monitoring](/blog_img/Monitoring/peekaping.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/peekaping" title="Peekaping  Homelab Monitoring | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Provides a very quick **monitoring + status pages** for your homelab: `http://192.168.1.2:8383/status/mora`

![Peekaping Status Pages Example](/blog_img/Monitoring/peekaping-status-pages-monitoring.png)

> **MIT** | Open Source Uptime Kuma Alternative

> > Probably a must have for your VPS!

With quickly integrations to your **website's posts**: https://docs.peekaping.com/badges

```html
<p>
    <img src="https://your-peekaping-instance.com/api/v1/badge/api-monitor/status" alt="API Status" />
</p>
```

As I have it running locally: `http://192.168.1.2:8383/monitors` these are rendered via `hugo server`


![My Local Service Status](http://192.168.1.2:8383/api/v1/badge/1e12dabc-e962-4cd7-b808-ee08c994ec53/status)

Badge Type,Description,Markdown Code
Uptime (30-day),Shows uptime percentage for the last 720 hours.,![Uptime (30d)](http://192.168.1.2:8383/api/v1/badge/1e12dabc-e962-4cd7-b808-ee08c994ec53/uptime/720)
Average Ping,Displays the average response time over the last 24 hours (default).,![Avg Ping](http://192.168.1.2:8383/api/v1/badge/1e12dabc-e962-4cd7-b808-ee08c994ec53/ping)
Certificate Expiry,Shows how many days until the SSL certificate expires (for HTTPS monitors).,![Cert Expiry](http://192.168.1.2:8383/api/v1/badge/04c91562-ba36-4ab2-872c-b4e6daf4067e/cert-exp)
Latest Response,Shows the most recent response time measurement.,![Latest Response](http://192.168.1.2:8383/api/v1/badge/1e12dabc-e962-4cd7-b808-ee08c994ec53/response)

I think that it can be good to think how to integrate Peekaping with these notification services: `http://192.168.1.2:8383/notification-channels/new`

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/gotify/" title="Gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ntfy/" title="Ntfy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/Monitoring/peekaping-notifications.png)

We also have the good old **Grafana, configured for Monitoring**:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/#grafana" title="Grafana and NetData" image="/blog_img/iot/grafana.png" subtitle="Grafana x HOMELAB" >}}
{{< /cards >}}

<!-- GrafanaPrometheusNodeExp.JPG -->

Or, a quick monitoring dashboard with **NetData**: [SelfHost NetData with Docker](https://fossengineer.com/selfhosting-server-monitoring-with-netdata-and-docker/)


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/netdata" title="Net-Data Monitoring | Docker Config 🐋 ↗" >}}
{{< /cards >}}


They remodel recently the dockerhub image: https://hub.docker.com/r/netdata/netdata/

![Netdata Updated UI](/blog_img/selfh/HomeLab/netdata.png)

```sh
#docker stats
#htop
sudo docker stats multichat
#btop
```

I Got to know also about: https://github.com/operacle/checkcle/

> MIT |  CheckCle is a **self-hosted, open-source monitoring platform** for seamless, real-time full-stack systems, applications, and infrastructure. 

> > It provides real-time uptime monitoring, distributed checks, incident tracking, and alerts. All deployable anywhere. 

But we already covered similar tools:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/tianji" title="Tianji | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/beszel" title="Beszel | Docker Config 🐋 ↗" >}}
{{< /cards >}}

1. **Beszel**: Web Analytics and Monitoring!

![Beszel Deployed to VPS](/blog_img/Monitoring/beszel-hetzner.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/" title="Beszel Setup" image="/blog_img/Monitoring/beszel-addmonitor.png" subtitle="Monitoring with Beszel" >}}
{{< /cards >}}

2. **Tianji**: which I covered [here](https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#tianji)


![MySpeed Internet Speed Test](/blog_img/selfh/HomeLab/myspeed.png)

3. Uptime Kuma and **Kener**: *bringing status pages to your server*

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener Status Pages | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/beszel" title="Beszel | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![Uptime Kuma Status Pages](/blog_img/selfh/HomeLab/uptimekuma-statuspages.png)

![Kener Status Pages](/blog_img/selfh/HomeLab/statuspages/kener-setup.png)