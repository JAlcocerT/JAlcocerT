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

And I saw few projects lately to see files, like we saw [here](https://jalcocert.github.io/JAlcocerT/events-photo-galleries/):

1. https://github.com/vikramsoni2/nextExplorer

> Web based File Explorer 

2. https://github.com/kyantech/Palmr

>  🌴 Palmr. is an open-source file-sharing platform focused on privacy and security. It enables users to upload, manage, and share files with features like password protection, custom links, and access control without tracking or limitations. Designed for seamless and secure sharing.

3. 

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

![SCP Speed](/blog_img/selfh/HomeLab/scp.png)

![SFTP Transfer Speed](/blog_img/selfh/HomeLab/sftp.png)

> Immich is cool and have some projects around https://github.com/Nasogaa/immich-drop

https://github.com/JAlcocerT/Home-Lab/tree/main/immich
{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#immich" title="Selfhosting Immich" image="/blog_img/selfh/Photo/immich-map.png" subtitle="Sring Y25 Post" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/photo-management-tools/#pigallery
![PiGallery Map Feature ](/blog_img/selfh/Photo/PiGallery-MAP.png)



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

https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#p2p
![Qbittorrent UI](/blog_img/selfh/media/qbit.png)


---

## Conclusions

You can start with a Pi SBC and a SSD drive:

![Pi Home Server](/blog_img/hardware/pi-homeserver.jpg)


https://www.youtube.com/watch?v=OOxzP1JvfQk


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

More Selfhosted resources

* https://libreselfhosted.com/project/fluxbb/
* https://awesome-docker-compose.com/apps/photo-server/pigallery-2



### SelfHosted WebAnalytics

https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#better-webanalytics

{{< cards >}}
  {{< card link="https://github.com/Litlyx/litlyx" title="Litlyx Repo" image="/blog_img/web/weban/littlyx-weban.png" subtitle="How Litlyx web analytics looks" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/" title="Litlyx Post Views Distribution" image="/blog_img/web/weban/litlyx.png" subtitle="How could this not relate with Pareto?" >}}
{{< /cards >}}

> Powerful Analytics Solution. Setup in 30 seconds. Display all your data on a Simple, AI-powered dashboard. Fully self-hostable and GDPR compliant. Alternative to Google Analytics, MixPanel, Plausible, Umami & Matomo.

![Web Analytics with LunaLytics](/blog_img/selfh/HomeLab/weban-lunalytics.png)

![Ebook Landing + Umami Web Analytics](/blog_img/entrepre/product/ebook-umami.png)


Link analytics solutions, like Kutt:

![SelfHosting Kutt](/blog_img/selfh/links/kutt-selfh.png)

![Kutt Links](/blog_img/selfh/links/kutt-link-creation.png)



### Monitoring For HomeLab

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/" title="Beszel Setup" image="/blog_img/Monitoring/beszel-addmonitor.png" subtitle="Monitoring with Beszel" >}}
{{< /cards >}}



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

### Grafana and NetData

GrafanaPrometheusNodeExp.JPG

https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/#grafana

[SelfHost NetData with Docker](https://fossengineer.com/selfhosting-server-monitoring-with-netdata-and-docker/)


* [Redis](https://www.youtube.com/watch?v=qucL1F2YEKE)
* SandStorm [SelfHost WebApps](https://docs.sandstorm.io/en/latest/)


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

This means yes, you can post new websites to monitor and retrieve their data using the API, but expect it to be experimental or unofficial.[3][1][2]

[1](https://github.com/louislam/uptime-kuma/wiki/API-Documentation)
[2](https://github.com/lucasheld/uptime-kuma-api)
[3](https://pypi.org/project/uptime-kuma-api/)
[4](https://uptime-kuma-api.readthedocs.io)
[6](https://www.home-assistant.io/integrations/uptime_kuma/)
[7](https://echoesofping.hashnode.dev/comprehensive-guide-to-installing-and-using-uptime-kuma-for-uptime-monitoring)
[19](https://app.readthedocs.org/projects/uptime-kuma-api/)
[20](https://github.com/louislam/uptime-kuma)

Here is a summary of the full setup to integrate your **self-hosted Uptime Kuma with a Jamstack** site like Astro securely and efficiently:

- **Uptime Kuma Self-Hosted:** Runs your uptime monitoring and exposes an internal API for adding monitors and retrieving status data.

- **API Security:**  
  - Restrict the Uptime Kuma API with proper authentication (tokens or keys).  
  - Use CORS to allow requests only from your trusted domains.

- **Middleware Layer:**  
  - Deploy a middleware proxy between Uptime Kuma and your Astro site to handle security and data processing.  
  - Cloudflare Workers are an excellent choice for middleware, providing edge deployment, secure token handling, CORS management, caching, and request/response transformation.

- **Astro Jamstack Site:**  
  - Your Astro site calls the middleware endpoint (Cloudflare Worker) rather than directly contacting Uptime Kuma.  
  - This can be done client-side (CSR) for dynamic updates or during build time for static rendering.  
  - The middleware fetches data from Uptime Kuma securely and returns only the necessary information to the site.

Benefits of This Setup

- Keeps API keys and tokens secure and away from the client.  
- Protects your Uptime Kuma API with domain-based CORS and authentication.  
- Enables efficient, low-latency data fetching from the edge.  
- Allows flexible data formatting and caching to optimize your site performance.  

This architecture ensures both **security** and **scalability** for showing Uptime Kuma monitoring data seamlessly in your Jamstack site.[1][2]

[1](https://github.com/louislam/uptime-kuma/wiki/API-Documentation)
[2](https://github.com/lucasheld/uptime-kuma-api)

Exactly. In this setup, the API keys are **not included in the static site code**. Instead:

- Your Astro component makes requests to the Cloudflare Workers middleware endpoint.
- The Cloudflare Worker holds and uses the API keys securely on the server/edge side.
- The Worker fetches the data from your Uptime Kuma API using the keys and returns only the relevant information to the component.
- This way, the API keys never get exposed to the client or shipped in the static files.
- The component can pull updated data on page load or dynamically via client-side rendering without risking key exposure.

This approach keeps your credentials safe while allowing your static site to display real-time or updated monitoring data via the middleware.[1][2]

[1](https://github.com/louislam/uptime-kuma/wiki/API-Documentation)
[2](https://github.com/lucasheld/uptime-kuma-api)