---
title: "Technology Setup for a Trip"
date: 2025-02-11
draft: false
tags: ["AI"]
description: "Software and Hardware setup before trips or vacations. Tech Travel Setup."
summary: 'Software and Hardware setup before trips or vacations'
url: 'tech-for-a-trip'
---


### Software Setup

{{< callout type="info" >}}
For easier setup (specially for servers), you can benefit of being familiar with [containers](#what-about-containers) 
{{< /callout >}}

> For content creation, you can have a look to **[ubuntu studio](https://ubuntustudio.org/)** with tools like gimp or digikam

#### Communication

You can setup a Matrix Server and then install [Element as Chat app](https://jalcocert.github.io/Linux/docs/privacy/android/#my-fav-android-apps)


{{< callout type="info" >}}
You can also try Telegram or **Signal** 💻 
{{< /callout >}}

#### VPNs

{{< callout type="info" >}}
Proper **[DNS](https://jalcocert.github.io/Linux/docs/debian/linux_vpn_setup/#dns-what) Setup** is also a good travel companion 
{{< /callout >}}

##### Wireguard

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="Wireguard (wg-easy) Server" image="/blog_img/hardware/wifi_eth.jpg" subtitle="VPS and Wiregaurd VPN" >}}
{{< /cards >}}

##### Tailscale


{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/Linux/docs/debian/linux_vpn_setup/#tailscale" title="TailScale Setup" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/raspberry-pi-networking/" title="Wifi2Eth with Wireguard" >}}
{{< /cards >}}


{{< details title="Quick Tailscale Server Setup for Travelling 📌" closed="true" >}}

```sh
curl -fsSL https://tailscale.com/install.sh | sh
# sudo apt-get install apt-transport-https &&
# curl -fsSL https://pkgs.tailscale.com/stable/raspbian/buster.gpg | sudo apt-key add - &&
# curl -fsSL https://pkgs.tailscale.com/stable/raspbian/buster.list | sudo tee /etc/apt/sources.list.d/tailscale.list &&
# sudo apt-get update &&
# sudo apt-get install tailscale &&
sudo tailscale up
tailscale ip -4 #get the ip 

#sudo tailscale logout
#sudo tailscale down
```

Make this device available as exit node:

```sh
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf &&
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf &&
sudo sysctl -p /etc/sysctl.conf &&
sudo tailscale down

sudo tailscale up --advertise-exit-node
```

This required a **final action on tailscale web UI**.

{{< /details >}}

{{< callout type="info" >}}
Which you can combine with [Mullvad](https://jalcocert.github.io/Linux/docs/debian/linux_vpn_setup/#mullvad) 💻 
{{< /callout >}}

#### Trip Planner


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Trip Planner Post" image="https://github.com/JAlcocerT/Py_Trip_Planner/raw/main/images/trip-planner-main-graph.png" subtitle="Weather Trends with Python" >}}
  {{< card link="https://github.com/JAlcocerT/Py_Trip_Planner" title="Go Pro Telemetry EDA" image="/blog_img/apps/gh-jalcocert.svg" subtitle="EDA Metadata Extraction at PyRouteTracker" >}}
{{< /cards >}}
  
<!-- 

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Trip Planner Post" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Weather Trends with Python" >}}
  {{< card link="https://github.com/JAlcocerT/Py_Trip_Planner" title="Go Pro Telemetry EDA" image="/blog_img/apps/gh-jalcocert.svg" subtitle="EDA Metadata Extraction at PyRouteTracker" >}}
{{< /cards >}}


![Trip Planner Graph](https://github.com/JAlcocerT/Py_Trip_Planner/raw/main/images/trip-planner-main-graph.png) 
-->

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-adventurelog/" title="How to Setuo AdventureLog with Containers" >}}
  {{< card link="https://fossengineer.com/selfhosting-airtrail/" title="Selfhosting AirTrail" >}}
{{< /cards >}}


{{< details title="Quick Trip Planner Deployment 📌" closed="true" >}}



{{< /details >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="RE Calculator - Post"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="Job Offers and CV Creation" >}}
{{< /cards >}}

### Maps

You can install **Organic Maps** as Android app, but also in Linux:

```sh
flatpak install flathub app.organicmaps.desktop #https://flathub.org/apps/app.organicmaps.desktop
```

To record your **routes as GPX**

1. https://github.com/OpenTracksApp/OpenTracks

> OpenTracks is a sport tracking application that completely respects your privacy.

2. https://github.com/jonasoreland/runnerup

> A open source run tracker


3. https://codeberg.org/jannis/FitoTrack

> FitoTrack - A privacy oriented fitness tracker for Android


And they can be combined with **FitTrackee**

* https://github.com/SamR1/FitTrackee

> AGPL 3.0 | Self-hosted **outdoor activity tracker** 🚴

4. https://github.com/IoTechCrafts/AdventureLog

>  Self-hostable travel tracker and trip planner. 


### BackUps

#### Nextcloud

If you will be recording at 4K, you will need **back up space**.

Here it comes **Nextcloud as a backup solution**, as it has clients for desktop/web/android/ios.

> I also like Syncthing but it does not have ios app

Get one of these connected to your SBCs at home and you are ready:


![DockerHub Multi-Arch Image](/blog_img/hardware/crucial-1tb-ssd.jpg)


{{< details title="Quick NextCloud Server Container Deployment 📌" closed="true" >}}

NC together with [MariaDB Compose](https://github.com/JAlcocerT/Docker/blob/main/Backups/NextCloud/nc_mariadb.yml)

```yml
version: '2'

# volumes:
#   nextcloud:
#   db:

services:
  nextclouddb:
    image: linuxserver/mariadb:10.11.8
    restart: always
    container_name: nextclouddb
    volumes:
      - /home/Docker/nextcloud/db:/var/lib/mysql
    environment:
      - MYSQL_INITDB_SKIP_TZINFO=1
      - MYSQL_ROOT_PASSWORD=rootpass
      - MYSQL_PASSWORD=ncpass
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
#    networks: ["nginx_nginx_network"] #optional 

  nextcloudapp:
    image: nextcloud:30.0.0 #latest
    container_name: nextcloud
    restart: always
    ports:
      - 8035:80
    links:
      - nextclouddb
    volumes:
      - /home/Docker/nextcloud/html:/var/www/html
    environment:
      - MYSQL_PASSWORD=ncpass
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db
      - NEXTCLOUD_TRUSTED_DOMAINS= http://orangepi5.blablabla.ts.net:8035 #http://0.0.0.0:8050 #https://nextcloud.yourduckdnsubdomain.duckdns.org/
#    networks: ["nginx_nginx_network"] #optional 
 
# networks: #optional
#   nginx_nginx_network: #optional
#     external: true #optional
```

{{< /details >}}

{{< callout type="info" >}}
Setup [Nextcloud as Docker container](https://github.com/JAlcocerT/Docker/tree/main/Backups/NextCloud) 
{{< /callout >}}

#### Other Image Center Backups

1. Lychee
2. Piwigo
3. [Photoview](https://fossengineer.com/selfhosting-Photoview-docker/)
4. Ente, PhotoPrism, Immich...

...you can see them covered at [this post](https://github.com/JAlcocerT/photo-management-tools)


### Hardware Setup


![Travel pack](/blog_img/hardware/travel-pakc.jpg)

Remember that a [VPS Setup](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#other-clouds) or [some SBCs](https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/) at home would be good companions.

![Single Board Computers vs Thinkpad x13](/blog_img/hardware/sbcs-x13.jpg)

To bring with you, a [compact laptop](https://jalcocert.github.io/JAlcocerT/laptop-lenovo-thinkpad-x13-benchmark/) can also be interesting.

> This one is **~1.2kg**, a tablet can be ~500g


#### Action Cam

<!--
![DJI Osmo Action 5 Pro](/blog_img/hardware/dji_oa5pro.jpg) 
-->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/" title="About DJi Oa5 Pro" image="/blog_img/hardware/dji_oa5pro.jpg" subtitle="Learning more about this action camera" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#video-editing-101/" title="Video Workflow" image="/blog_img/hardware/x300.jpg" subtitle="With the Asrock x300" >}}
{{< /cards >}}

Some people bring their drons.

But [my DJI Tello dron](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/) is more a 101 tool to get started with dron flying while doing some Python test on it.

> [I saw some people mounting](https://www.youtube.com/shorts/myz4ujPcQ10) **action cameras on their drons** with some adjustments.



#### SmartPhone

I am very happy with the [**Android** Pixel 8 Pro](https://jalcocert.github.io/JAlcocerT/pixel-8-pro-tricks/)

> Maybe some backup?

#### Router

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tplink-archer-mr200-router-review/" title="TPLink MR200" image="/blog_img/hardware/TPLink4G-OpenSpeedTest.png" subtitle="4G Home Router Review" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/" title="Travel Router Setup" image="/blog_img/hardware/GL-MT3000-pwd.png" subtitle="GL-MT3000 review and VPN Setup" >}}
{{< /cards >}}


You can also get one of these **portable 4G usb router** (and bring a **sim adapter**):

![4g router](/blog_img/hardware/portable-4g-router.jpg)

{{< callout type="warning" >}}
Not all esims on your phone allow you to use them as Hotspot 
{{< /callout >}}


> Ive been experimenting with the travel router around and...

If you need to **login to a hotel network**, where credentials (**user/pass**) are required, this will prompt:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/" title="TailScale Setup with the MT3000" >}}
{{< /cards >}}


{{< callout type="warning" >}}
Can’t access the internet via the repeated hotspot. Try to enter **Login Mode for Public Hotspots** to fix the issue. Note this mode **will pause VPNs and custom DNS** until it leave, which may cause data leaks to the provider of the hotspot (e.g., hotel/mall). 
{{< /callout >}}

![Wifi Login UI on MT3000](/blog_img/hardware/travel-router-loginwifi.png)


---

## FAQ

### Sharing Expenses with Spliit

If you are not aware of **Spliit** for sharing expenses with others:

* https://github.com/spliit-app/spliit

> MIT | Spliit is a free and **open-source alternative to Splitwise**, aimed at simplifying expense sharing among friends and family.


{{< details title="Spliit | Travel expenses 📌" closed="true" >}}

It addresses the need for a user-friendly platform to manage shared expenses without the hassle of ads or fees.

**Key Features**:

- Create and share groups for expense tracking.
- Add detailed expenses with descriptions.
- Display balances within groups.
- Create reimbursement expenses.
- Progressive Web App (PWA) functionality.
- Option to split expenses unevenly.
- Ability to upload images and scan receipts for expenses.
- Future features may include recurring expenses and import from Splitwise.

Technology Stack:

1. **Next.js** for web application framework.
2. **TailwindCSS** for styling.
3. **Prisma** for database access.
4. **Vercel** for hosting.

Local Development:

- Clone the repository and set up a local PostgreSQL server.
- Follow setup instructions to run the application locally or in a Docker container.

{{< /details >}}


Spliit offers a robust solution for managing shared expenses and simplifies the process for users. 

Its an fantastic project to have a look to.

In my opinion its *just missing* the possibility to add different currencies.

The good thing?

You can get a [`.json` report to analyze](https://jalcocert.github.io/JAlcocerT/guide-python-PySpark/#faq) later what has been going during the trip.


{{< callout type="info" >}}
A sample `ipynb` nb is waiting for you [here](https://github.com/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/spliit_analyzer.ipynb) 
{{< /callout >}}

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/spliit_analyzer.ipynb)

### What about containers?

[Containers](https://fossengineer.com/understanding-containers-for-selfhosting/) are great for SelfHosting.

And you can see how simple is to get [up and running with **docker and Portainer**](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/):

{{< youtube "ox3IsWH-o7g" >}}

<!-- https://www.youtube.com/shorts/ox3IsWH-o7g -->

No wonder why Container is one of my favourite technologies to use for app reliability!

### More Cool Software

Thanks to this sites, I get to know more cool apps:

1. https://openalternative.co/self-hosted
* https://github.com/piotrkulpinski/openalternative

> Which can be seen also as an **awsome Astro project!**

2. https://alternateoss.com/
3. https://youmightnotneed.co/