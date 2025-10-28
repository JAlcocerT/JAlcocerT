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

Just in case that you got that interesting Standard Google offer 200 GB for ~40$/año or your [Google AI Pro with 2TB trial](https://support.google.com/pixelphone/answer/13529884?hl=en#zippy=%2Cpixel-pro-pixel-pro-xl-pixel-pro-fold) has just ended...


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

If you dont want **Nextcloud** nor Immich...for your latest [photo/video](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/) workflows...


Neither pay for google photos: https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper

4. With **Local Send** I got ~4MB/s transfer speed from an iphone to a tablet.

```sh
flatpak install flathub org.localsend.localsend_app
##ps aux --sort=-%mem | grep localsend
```

5. We also have [Pairdrop](https://pairdrop.net/): https://github.com/schlagmichdoch/PairDrop

> PairDrop: Transfer Files Cross-Platform. No Setup, No Signup. 

6. Would SCP or FTP be faster instead?

![SCP Speed](/blog_img/selfh/HomeLab/scp.png)

![SFTP Transfer Speed](/blog_img/selfh/HomeLab/sftp.png)


> Immich is also cool and have some projects around https://github.com/Nasogaa/immich-drop

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/immich" title="Immich | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pigallery" title="PiGallery | Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#immich" title="Selfhosting Immich" image="/blog_img/selfh/Photo/immich-map.png" subtitle="Spring Y25 Post - Immich Setup" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-management-tools/#pigallery" title="Selfhosting PiGallery" image="/blog_img/selfh/Photo/PiGallery-MAP.png" subtitle="Photo Tools Post - PiGallery" >}}
{{< /cards >}}

<!-- ![PiGallery Map Feature ](/blog_img/selfh/Photo/PiGallery-MAP.png) -->



### Syncthing x SFTPGo

You can get creative with rsync, cron and so on.

But...

A combination of **Syncthing** and **SFTPGo** can be used together to achieve automated file exchange, leveraging the strengths of each tool, although they are fundamentally different.

Syncthing is a **decentralized, peer-to-peer (P2P)** continuous file synchronization tool, whereas SFTPGo is a **centralized SFTP server** (that also supports other protocols like FTP/S and WebDAV) with powerful file management and automation features.


{{< details title="More about the Syncthing and SFTPGo Setup... 📌" closed="true" >}}


The primary way to use them together is to set up **Syncthing to sync files to a local directory that SFTPGo uses as a storage backend** (a "virtual folder").

1.  **Syncthing handles synchronization:** Syncthing runs on your client devices (laptops, desktops, phones) and continuously syncs files in real-time to a dedicated folder on your central server. This uses Syncthing's efficient P2P protocol, which is excellent for real-time syncing between devices that are all running the Syncthing software.

2.  **SFTPGo provides access:** SFTPGo runs on the central server, using the same local Syncthing folder as a data source for its users. This allows external users or systems to access those synchronized files using a standard, secure protocol like **SFTP** (or FTP/S, WebDAV, HTTPS via its WebClient).

This setup solves a common Syncthing limitation: providing access to files via a standard server protocol to clients that are **not** running Syncthing.

It's important to understand the different purposes of each tool:

| Feature | Syncthing (Continuous Sync) | SFTPGo (Secure File Server) |
| :--- | :--- | :--- |
| **Core Function** | **Continuous, real-time file synchronization** between multiple trusted devices (P2P). | **Secure file access and transfer** using standard protocols (SFTP, FTP/S, etc.) to a central server. |
| **Architecture** | Decentralized (no central server required for P2P sync). | Centralized server architecture. |
| **Protocol** | Custom, secure, encrypted P2P protocol (not SFTP). | Standard protocols: **SFTP**, FTP/S, HTTPS, WebDAV. |
| **File Management** | Focuses on keeping folders identical across peers. | Provides advanced **user management, access controls, quotas, and automation** (Event Manager, webhooks). |
| **Primary Use** | Keeping your own set of devices in sync, or collaborating with a defined set of trusted peers. | Providing secure file exchange for multiple external users/partners, often with granular permissions. |


{{< /details >}}

Syncthing doesn't natively support SFTP as a sync destination.

SFTPGo is what brings the SFTP server capability to the shared folder.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#p2p" title="P2P Tools during Summer 25 | Post" image="/blog_img/selfh/media/qbit.png" subtitle="As P2P as it gets | QBittorrent" >}}
{{< /cards >}}

<!-- 
![Qbittorrent UI](/blog_img/selfh/media/qbit.png) -->


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

And if you have read the recent [Crypto with AI](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) post, you can see how people get creative and benchmark based on crypto mining performance: https://xmrig.com/benchmark

[Some people](https://www.reddit.com/r/MoneroMining/comments/p3bzzb/is_it_worth_to_mine_xmr/) also use it for mining.

But it wont pay off when taking into cosideration the electricity costs.

Anyways, you can do a quick **XMR benchmark** on your mini PC:

* https://github.com/xmrig/xmrig

>  RandomX, KawPow, CryptoNight and GhostRider unified CPU/GPU miner and RandomX benchmark 

> > Its an interesting project anyways, configurable via JSON for that alternative CPU benchmark


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

And **hetzner** has been leveling up their game:



2. **Termix** has a [desktop app](https://docs.termix.site/install#connector) now:

```sh
wget https://github.com/Termix-SSH/Termix/releases/download/release-1.7.3-tag/Termix-Linux-Portable-1.7.3.zip
unzip Termix-Linux-Portable-1.7.3.zip
unzip Termix-Linux-Portable.zip -d Termix-App
cd 
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

```sh
#choco install ytdownloader
sudo snap install ytdownloader
```

5. Jellyfin and Gonic are great

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gonic" title="Gonic | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin Media Server Tools 🐋 ↗" >}}
{{< /cards >}}


6. I have added the **programmatic DNS updater** from [waiting to landing](https://github.com/JAlcocerT/waiting-to-landing), benchmarks and quick setup scripts to HomeLab repo.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/cloudflare-dns-updater.py" title="Cloudflare DNS API Py Script ↗" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/porkbun-domains.py" title="Porkbun API Py Script ↗" >}}
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

6. Palmr https://github.com/kyantech/Palmr

 🌴 Palmr. is an open-source file-sharing platform focused on privacy and security. It enables users to upload, manage, and share files with features like password protection, custom links, and access control without tracking or limitations. Designed for seamless and secure sharing, Palmr. is completely free. 

<!-- https://www.youtube.com/watch?v=Z-zmXoA26Eo -->

{{< youtube "Z-zmXoA26Eo" >}}


7. https://github.com/error311/FileRise

<!-- https://www.youtube.com/watch?v=t8p222fxVL0 -->

{{< youtube "t8p222fxVL0" >}}


---

## FAQ

**More Selfhosted resources** *These are new from this post*

1. https://tom-doerr.github.io/repo_posts/

{{< tweet user="tom_doerr" id="1979894065400263086" >}}

<!-- 
https://x.com/tom_doerr/status/1979894065400263086?

* https://libreselfhosted.com/project/fluxbb/
* https://awesome-docker-compose.com/apps/photo-server/pigallery-2

2.

 -->

**Selfhosted resources:** *you should know already*

* https://www.open-source-tools.com/metube
* Some [forums](https://forocoches.com/foro/showthread.php?t=7806376&page=48) or [reddit](https://www.reddit.com/r/selfhosted/)

* From the creator of https://github.com/Lissy93/networking-toolbox and https://github.com/Lissy93/portainer-templates

> MIT | 🛜 All-in-one offline-first networking tools and utilities

>> MIT | 🚢 500+ 1-click Portainer app templates

* https://github.com/Lissy93/awesome-privacy



### SelfHosted WebAnalytics

Umami should be one of those **HomeLab essentials** tools to consider.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umami" title="Umami | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics" title="SelfHostable WebAnalytics Tools 🐋✅ ↗" >}}
{{< /cards >}}

<!-- ![Cookies Meme](/blog_img/web/COOKIES.jpg) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#better-webanalytics" title="Better web Analytics from 0525" image="/blog_img/web/COOKIES.jpg" subtitle="Post views distribution" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://github.com/Litlyx/litlyx" title="Litlyx Repo" image="/blog_img/web/weban/littlyx-weban.png" subtitle="How Litlyx web analytics looks" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/" title="Litlyx Post Views Distribution" image="/blog_img/web/weban/litlyx.png" subtitle="How could this not relate with Pareto?" >}}
{{< /cards >}}

> Powerful Analytics Solution. Setup in 30 seconds. Display all your data on a Simple, AI-powered dashboard. Fully self-hostable and GDPR compliant. Alternative to Google Analytics, MixPanel, Plausible, Umami & Matomo.

![Web Analytics with LunaLytics](/blog_img/selfh/HomeLab/weban-lunalytics.png)

![Ebook Landing + Umami Web Analytics](/blog_img/entrepre/product/ebook-umami.png)


See also:

1. https://github.com/abegehr/chickadee

 > Simple, privacy-focused web analytics you can self-host on Cloudflare. 

2. https://github.com/benvinegar/counterscale

 > Scalable web analytics you run yourself on Cloudflare 

3. Dashflare - https://github.com/jorgelbg/dashflare

>  🕵🏼‍♀️ Open Source and privacy-focused analytics solution. 📊 Advanced monitoring for your website behind Cloudflare 



#### Link Analytics

Some url shorteners will bring you analytics and QR as well: https://github.com/738/awesome-url-shortener?tab=readme-ov-file#self-hosting-opensource



See https://github.com/738/awesome-url-shortener?tab=readme-ov-file#self-hosting-opensource

Link analytics solutions, like Kutt: `https://kutt.it/`

![SelfHosting Kutt](/blog_img/selfh/links/kutt-selfh.png)

![Kutt Links](/blog_img/selfh/links/kutt-link-creation.png)



For the QR part, you know that we have few solutions...

1. https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/QR_Gen.py

2. [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)

3. 

There are several open-source self-hostable link shortener tools you can consider, each with its unique features:

1. **Shlink**: A PHP-based link shortener that supports generating unique short codes or custom slugs. It collects anonymized visit stats and geolocates visitors. It offers a REST API, CLI tools, and Docker support for easy deployment. It uses modern technologies like Mezzio and Symfony and is MIT licensed.[1][3]

2. **Kutt**: A modern, free, and open-source URL shortener with features like custom domains, custom URLs, password protection, link expiration, private statistics, and an admin dashboard. It has a RESTful API and can be easily installed using Docker Compose.[5]

3. **YOURLS**: A well-established PHP-based URL shortener with features such as bookmarklets, developer API, detailed stats including referrers and geo-location, and extensibility through dozens of plugins. It is free, open source, and easy to self-host.[10]

4. **Shrink.io (shrtn.io)**: A lightweight, privacy-focused URL shortener using SQLite by default (so no database server is required) and deployable via Docker. It emphasizes ease of use, privacy, and developer-friendly features.[6]

5. Other notable mentions from a curated list include Polr, Lstu, Blink, and goshorly—all open source with various programming languages and features.[4][8]

These options provide scalable, customizable, and self-hostable link shortening solutions that you can deploy either via Docker or direct installation depending on your infrastructure and preferences.

For ease and feature richness, Shlink, Kutt, and YOURLS are highly recommended starting points for a self-hosted URL shortener.[1][5][10]

Among the popular open-source self-hosted link shorteners mentioned, some do offer QR code capabilities either built-in or through extensions/plugins:

1. **Shlink**: Provides built-in QR code generation for short URLs. When you create a short URL using Shlink, it can generate a corresponding QR code that you can share or embed. This is part of its feature set, making it convenient for print or mobile scanning use cases.[1][2]

2. **Kutt**: While Kutt does not include native QR code generation in its core, there are third-party tools or browser extensions available that can generate QR codes for any URL, including Kutt short links. Some community forks or plugins might add this feature. Officially, out-of-the-box QR codes are not a core feature.[3]

3. **YOURLS**: YOURLS does not include native QR code generation by default, but there are several plugins created by the community that add QR code functionality to YOURLS short URLs. This extensibility allows you to add QR generation if needed.[4]

4. Other lesser-known tools like Blink or Polr may have QR features built-in or via plugins, but the top three mentioned mostly rely on either built-in Shlink support or plugins for YOURLS for QR capabilities.[5][6]

To summarize, **Shlink** stands out as the self-hosted URL shortener with built-in QR code generation. 

For YOURLS, you can enable QR codes through community-developed plugins, while Kutt typically requires external QR code tools. 

This makes Shlink a strong candidate if QR code functionality is a priority alongside link shortening.


### Monitoring For HomeLab


Grafana and NetData

GrafanaPrometheusNodeExp.JPG

https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/#grafana

[SelfHost NetData with Docker](https://fossengineer.com/selfhosting-server-monitoring-with-netdata-and-docker/)


* [Redis](https://www.youtube.com/watch?v=qucL1F2YEKE)
* SandStorm [SelfHost WebApps](https://docs.sandstorm.io/en/latest/)


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

> MIT |  CheckCle is a **self-hosted, open-source monitoring platform** for seamless, real-time full-stack systems, applications, and infrastructure. It provides real-time uptime monitoring, distributed checks, incident tracking, and alerts. All deployable anywhere. 

But we already covered similar tools:

1. **Beszel**: Web Analytics and Monitoring!

![Beszel Deployed to VPS](/blog_img/Monitoring/beszel-hetzner.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/" title="Beszel Setup" image="/blog_img/Monitoring/beszel-addmonitor.png" subtitle="Monitoring with Beszel" >}}
{{< /cards >}}

2. **Tianji**: which I covered [here](https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#tianji)


![MySpeed Internet Speed Test](/blog_img/selfh/HomeLab/myspeed.png)

3. Uptime Kuma and **Kener**: *bringing status pages to your server*

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/beszel" title="Beszel | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![Uptime Kuma Status Pages](/blog_img/selfh/HomeLab/uptimekuma-statuspages.png)

![Kener Status Pages](/blog_img/selfh/HomeLab/statuspages/kener-setup.png)


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener Status Pages | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### Uptime Kuma API

Yes, Uptime Kuma does provide an API, but it is primarily an internal API designed for the application's own use and is not officially supported for third-party integrations. 

It offers a `Socket.io` real-time communication API after authentication and some RESTful API endpoints for tasks like push monitors, status badges, and public status page data.

Using the API (especially through unofficial wrappers like the Python wrapper "uptime-kuma-api"), you can programmatically add new monitors (websites or services) and retrieve some monitoring data.

For example, you can create a new HTTP monitor by specifying the type, name, and URL via the API.[2][3]

The API allows you to:

- Post new websites or services to monitor.
- Retrieve their status and monitoring data.
- Access real-time updates through Socket.io.
- Get status badges or integrate with Prometheus metrics.
  
However, the official API is somewhat limited and not guaranteed to be stable or fully documented for external use, so use it with caution.

In summary:

- You can add monitors programmatically.
- You can retrieve monitoring data (status, alerts).
- The API is mostly internal and unofficial but functional.
- There are third-party wrappers to help interact with it.