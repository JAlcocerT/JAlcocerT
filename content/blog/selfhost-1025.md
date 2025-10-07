---
title: "SelfHosting Updates - Oct 2025"
date: 2025-10-20T01:20:21+01:00
draft: false
tags: ["SFTPGo","WebDav","Sync Tools","P2P Recap","Benchmark"]
description: ''
url: 'selfhosted-apps-oct-2025'
---


**TL;DR**


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


If you dont want Nextcloud nor Immich...for your latest [photo/video](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/) workflows...

```sh
flatpak install flathub org.localsend.localsend_app
```


## Conclusions

If you've got recently a miniPC, you can do some [benchmarks](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/) to the performance.

And if you have read the recent [Crypto with AI](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) post, you can see how people get creative and benchmark based on crypto mining performance: https://xmrig.com/benchmark


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