---
title: "SelfHosting Updates - Oct 2025"
date: 2025-10-18T01:20:21+01:00
draft: false
tags: ["SFTPGo x Syncthing","WebDav","File Sync Tools","P2P Recap","XMRig Benchmark"]
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

But just in case you dont want to mess with databases, lets see some other Filebrowser alternatives and FTPs:

> Yea, im kind of alergic to DBs for HomeLab setups

## Files Files Files

And I saw few projects lately to see files:

* https://github.com/vikramsoni2/nextExplorer

> Web based File Explorer 


If you dont want **Nextcloud** nor Immich...for your latest [photo/video](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/) workflows...

```sh
docker exec -it <your-nextcloud-container-name> rm /var/www/html/config/config.php
# Then, exit and restart the container
docker exec -u www-data <your-nextcloud-container-name> php /var/www/html/occ config:list system | grep trusted_domains -A 10
docker exec -u www-data nextcloud php /var/www/html/occ config:system:get trusted_domains
#docker exec -u www-data nextcloud php /var/www/html/occ config:system:set trusted_domains 4 --value="mynewdomain.example.com"
docker exec -u www-data nextcloud php /var/www/html/occ config:system:get trusted_domains
```

```sh
flatpak install flathub org.localsend.localsend_app
##ps aux --sort=-%mem | grep localsend
```

With local send I got 4MB/s transfer speed from an iphone to a tablet.

Would SCP or FTP be faster?

![alt text](/blog_img/selfh/HomeLab/scp.png)

![alt text](/blog_img/selfh/HomeLab/sftp.png)

### Syncthing x SFTPGo

You can get creative with rsync, cron and so on.

But...

A combination of **Syncthing** and **SFTPGo** can be used together to achieve automated file exchange, leveraging the strengths of each tool, although they are fundamentally different.

Syncthing is a **decentralized, peer-to-peer (P2P)** continuous file synchronization tool, whereas SFTPGo is a **centralized SFTP server** (that also supports other protocols like FTP/S and WebDAV) with powerful file management and automation features.


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

Syncthing doesn't natively support SFTP as a sync destination. SFTPGo is what brings the SFTP server capability to the shared folder.

For a general overview of Syncthing, you can check out Sync Files Across All Your Devices With Syncthing.

---

## Conclusions

If you've got recently a miniPC, you can do some [benchmarks](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/) to the performance.

And if you have read the recent [Crypto with AI](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) post, you can see how people get creative and benchmark based on crypto mining performance: https://xmrig.com/benchmark


[Some people](https://www.reddit.com/r/MoneroMining/comments/p3bzzb/is_it_worth_to_mine_xmr/) also use it for mining.

But it wont pay off when taking into cosideration the electricity costs.

Anyways, you can do a quick **XMR benchmark** on your mini PC:

* https://github.com/xmrig/xmrig

>  RandomX, KawPow, CryptoNight and GhostRider unified CPU/GPU miner and RandomX benchmark 

> > Its an interesting project anyways, configurable via JSON for that alternative CPU benchmark


---



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


Conclusion: Which to Choose?

| Choose **Transmission** If... | Choose **qBittorrent** If... |
| :--- | :--- |
| You value a **minimalist, simple, and native-feeling UI** (especially on Mac/Linux). | You need **advanced features** like a built-in search engine or RSS downloader. |
| You are running the client on a **low-power device** (e.g., NAS, Raspberry Pi) or need a very low resource footprint. | You want **fine-grained control** and **more detailed statistics** over your torrents. |
| You primarily want a client that is **easy to set up** for basic downloading and seeding. | You are accustomed to a **traditional torrent client layout** (like older uTorrent). |


---

## FAQ

![MySpeed Internet Speed Test](/blog_img/selfh/HomeLab/myspeed.png)

![Web Analytics with LunaLytics](/blog_img/selfh/HomeLab/weban-lunalytics.png)