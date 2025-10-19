---
title: "SelfHosting Updates - Oct 2025"
date: 2025-10-18T01:20:21+01:00
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

If you dont want **Nextcloud** nor Immich...for your latest [photo/video](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/) workflows...


Neither pay for google photos: https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper

```sh
flatpak install flathub org.localsend.localsend_app
##ps aux --sort=-%mem | grep localsend
```

With local send I got 4MB/s transfer speed from an iphone to a tablet.

Would SCP or FTP be faster?

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


1. https://github.com/goclone-dev/goclone


> MIT |  Website Cloner - Utilizes powerful Go routines to clone websites to your computer within seconds. 

---

## Conclusions

You can start with a Pi SBC and a SSD drive:

![Pi Home Server](/blog_img/hardware/pi-homeserver.jpg)

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

---




---

## FAQ

**More Selfhosted resources**

1. https://tom-doerr.github.io/repo_posts/?s=35


{{< tweet user="tom_doerr" id="1979894065400263086" >}}

<!-- 
https://x.com/tom_doerr/status/1979894065400263086?

* https://libreselfhosted.com/project/fluxbb/
* https://awesome-docker-compose.com/apps/photo-server/pigallery-2

2.

 -->

**Selfhosted resources you should know already**



### SelfHosted WebAnalytics

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umami" title="Umami | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics" title="SelfHostable WebAnalytics Tools 🐋✅ ↗" >}}
{{< /cards >}}

![Cookies Meme](/blog_img/web/COOKIES.jpg)


https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#better-webanalytics



{{< cards >}}
  {{< card link="https://github.com/Litlyx/litlyx" title="Litlyx Repo" image="/blog_img/web/weban/littlyx-weban.png" subtitle="How Litlyx web analytics looks" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/" title="Litlyx Post Views Distribution" image="/blog_img/web/weban/litlyx.png" subtitle="How could this not relate with Pareto?" >}}
{{< /cards >}}

> Powerful Analytics Solution. Setup in 30 seconds. Display all your data on a Simple, AI-powered dashboard. Fully self-hostable and GDPR compliant. Alternative to Google Analytics, MixPanel, Plausible, Umami & Matomo.

![Web Analytics with LunaLytics](/blog_img/selfh/HomeLab/weban-lunalytics.png)

![Ebook Landing + Umami Web Analytics](/blog_img/entrepre/product/ebook-umami.png)



https://github.com/abegehr/chickadee

 Simple, privacy-focused web analytics you can self-host on Cloudflare. 

 https://github.com/benvinegar/counterscale

  Scalable web analytics you run yourself on Cloudflare 

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

To summarize, **Shlink** stands out as the self-hosted URL shortener with built-in QR code generation. For YOURLS, you can enable QR codes through community-developed plugins, while Kutt typically requires external QR code tools. This makes Shlink a strong candidate if QR code functionality is a priority alongside link shortening.[1][3][4]


### Monitoring For HomeLab


![Beszel Deployed to hetzner](/blog_img/Monitoring/beszel-hetzner.png)


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/" title="Beszel Setup" image="/blog_img/Monitoring/beszel-addmonitor.png" subtitle="Monitoring with Beszel" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#tianji



![MySpeed Internet Speed Test](/blog_img/selfh/HomeLab/myspeed.png)


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


### Grafana and NetData

GrafanaPrometheusNodeExp.JPG

https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/#grafana

[SelfHost NetData with Docker](https://fossengineer.com/selfhosting-server-monitoring-with-netdata-and-docker/)


* [Redis](https://www.youtube.com/watch?v=qucL1F2YEKE)
* SandStorm [SelfHost WebApps](https://docs.sandstorm.io/en/latest/)
