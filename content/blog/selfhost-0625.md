---
title: "SelfHosting - 1st Half 2025 June "
date: 2025-06-01T01:20:21+01:00
draft: false
tags: ["HomeLab","Authentication"]
description: 'Programatic Https for all services and docker stacks'
url: 'selfhosted-apps-06-2025'
---

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