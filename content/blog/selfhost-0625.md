---
title: "SelfHosting - 1st Half 2025 June "
date: 2025-06-01T01:20:21+01:00
draft: false
tags: ["HomeLab","Authentication"]
description: 'Programatic Https for all services and docker stacks'
url: 'selfhosted-apps-06-2025'
---

<!-- https://fossengineer.com/selfhosting-favourite-aug-2024/ -->

It was all about...[Traefik](https://fossengineer.com/selfhosting-traefik/) to get programatic https for homelab services!


While exploring [TinyAuth](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-x-tinyauth-x-flask), I revisited the Jims Garage guide on Traefik v3.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-jimgarage-v33" title="Tinkering with Traefik v3" image="/blog_img/selfh/https/Traefik-UI-https.png" subtitle="Together with TinyAuth as authentication" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#traefik-x-tinyauth-x-flask" title="TinyAuth x Traefik x Flask" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code with a Flask App working with the authentication middleware" >}}
{{< /cards >}}

It was also the time to set [a LogTo example](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#logto-authentication).

<!-- ![Traefik UI](/blog_img/selfh/https/Traefik-UI-https.png) -->


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH" title="Docker Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Collection of Docker Config Files - 0625 Edition" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="Home-Lab" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Ordered config files | Youtube Video friendly" >}}
{{< /cards >}}

**SelfHosting Resources**:

* https://openalternative.co/self-hosted
* https://devsuite.co/collections/open-source


## Improvements

### Nextcloud with Https

Getting Better at [sync file tools](https://jalcocert.github.io/JAlcocerT/sync-file-tools/)

All thanks to getting Traefik to work programatically!

So I just needed to get the domain DNS records accordingly:

```sh
nslookup nextcloud.jalcocertech.com
```


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/NextCloud/nc_mariadb.yml" title="NextCloud MariaDB | Config File 🐳 ↗"  >}}
    {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/NextCloud/nc_mariadb_traefik.yml" title="NextCloud x Traefik | Config File 🐳 ↗"  >}}
{{< /cards >}}


```sh
docker exec -it nextcloud /bin/bash
cd /var/www/html/config/
nano config.php

#docker exec -u www-data nextcloud php occ config:list system | grep trusted_domains -A 10
docker exec -u www-data nextcloud php /var/www/html/occ config:system:get trusted_domains #See how many you have, and put the next
docker exec -u www-data nextcloud php /var/www/html/occ config:system:set trusted_domains 2 --value="192.168.1.11"
docker exec -u www-data nextcloud php /var/www/html/occ config:system:set trusted_domains 3 --value="nextcloud.jalcocertech.com"
```

Going from this: https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#nextcloud

To this

> remember to use the [Android](https://play.google.com/store/apps/details?id=com.nextcloud.client&pli=1) or iOS app

https://jalcocert.github.io/JAlcocerT/sync-file-tools/#webdavs
https://docs.nextcloud.com/server/31/user_manual/en/files/access_webdav.html

```txt
dav://reisikei@192.168.1.11:8080/remote.php/webdav
davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav
davs://your_nc_user@nextcloud.jalcocertech.com/remote.php/webdav
```

{{< callout type="warning" >}}
When using WebDav the files are only on the server, not backed up on your device. I got a transfer speed of ~15mb/s via wifi.
{{< /callout >}}

You can also use the desktop app:

```sh
flatpak install flathub com.nextcloud.desktopclient.nextcloud
```

See the transfer speed with

```sh
sudo apt install nload
#ip a
nload wlp3s0
```

> Got a transfer speed of , compared to the ~60MB/s avg to ProtonDrive

#### Third Party Cloud NC Backup

Last month i tried protondrive with rclone https://github.com/JAlcocerT/Docker/tree/main/Backups#rclone

1. **ProtonDrive**

2. **Google Drive**

#### PortMaster and https


{{< callout type="info" >}}
If you are using portmaster, you might need to disable DNS config ->Enforce global/private-split view so that the nextcloud configured via Traefik and tailscale DSN will work
{{< /callout >}}

![Portmaster](/blog_img/selfh/https/portmaster-nc-https.png)

### The DNSs

Its all about the DNS.

And I saw on [this post](https://forocoches.com/foro//showthread.php?t=10372366) that there is an EU alternative to cloudflare, goodle, quad9 and many other DNS: https://www.joindns4.eu/for-public#resolver-options

https://www.youtube.com/watch?v=c3XMAz--_Us

### P2P

You can find [things to share](https://www.reddit.com/r/Piracy/comments/1c3cikj/where_to_torrent/)

### In Home Tools

1. Reubah
2. IT/Toos + OmniTools

...