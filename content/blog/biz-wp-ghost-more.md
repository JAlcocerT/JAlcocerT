---
title: "Spinning Webs - WPs, Ghost,..."
date: 2025-03-04
draft: false
description: 'Websites for all. Without the code.'
url: 'no-code-websites'
---

**Enough Code.**

Lets see some *no code* websites that you can use at a Home Server/VPS.

> [One Stack deploy them all with Dockge **here**](https://github.com/JAlcocerT/Docker/blob/main/Z_Dockge/stacks/Webs/Compose.yaml)

### Just Get Wordpress

No time for tinkering with web dev stuff?

Just get a **wordpress going**.

{{< callout type="info" >}}
See the docker container **config files [here](https://github.com/JAlcocerT/Docker/tree/main/Web)**
{{< /callout >}}

{{< details title="Wordpress Docker Compose for VPS 📌" closed="true" >}}

```yml
services: ##for ubuntu
  wordpress:
    image: wordpress:php7.4-apache #wordpress:php7.1-apache
    container_name: wordpress
    ports:
      - 8082:80
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: root
      WORDPRESS_DB_NAME: wordpress
    links:
      - mysql:mysql
    restart: always
    networks:
      - nginx_default #allow communication with the nginx service  
      - wp

  mysql:
    image: mysql:8.0.13
    container_name: wordpressdb
    command: --default-authentication-plugin=mysql_native_password
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - ~/Docker/wordpress/mysql-data:/var/lib/mysql
      #- mysql-data:/var/lib/mysql # Use the named volume
    restart: always
    networks:
      - wp #allow communication with the nginx service  
    
networks:
  wp:
  nginx_default:
    external: true

volumes:
  mysql-data: # Define the named volume
```

{{< /details >}}

{{< callout type="info" >}}
See [WP Docker Compose](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/Wordpress%20RPi%20Docker%20compose.yml)
{{< /callout >}}

> Site will be ready at `subdomain.jalcocertech.com` and for the user `subdomain.jalcocertech.com/wp-admin` 

### Wordpress Alternatives

You can also try these.

#### Ghost

1. [Ghost](https://fossengineer.com/selfhosting-ghost-docker/) with this [dockerhub image](https://hub.docker.com/_/ghost/tags)


{{< details title="Ghost Docker Compose for VPS 📌" closed="true" >}}

```yml
services:
  ghost:
    image: ghost:5-alpine
    container_name: ghostcontainer
    environment:
      database__client: mysql
      database__connection__host: dbghost
      database__connection__user: ghostuser
      database__connection__password: ghost_db_pass
      database__connection__database: ghost_database
      url: http://ghostcontainer:2368
    restart: always
    ports:
      - 2368:2368
    networks:
      - ghost_network
      - nginx_default
    volumes:
      - ghost_data:/var/lib/ghost/content
    depends_on:
      - dbghost

  dbghost:
    container_name: ghostcontainerdb
    image: mariadb:10.5 #mysql (but MariaDB is open source)
    restart: always
    environment:
      MYSQL_DATABASE: ghost_database
      MYSQL_USER: ghostuser
      MYSQL_PASSWORD: ghost_db_pass
      MYSQL_ROOT_PASSWORD: ubabuuuHaGba6nhX #Change this one!
    ports:
      - 3306:3306
    networks:
      - ghost_network
    volumes:
      - db_ghost_data:/var/lib/mysql

volumes:
  ghost_data:
  db_ghost_data:

networks:
  ghost_network:
  nginx_default:
    external: true  
```

{{< /details >}}

{{< callout type="info" >}}
See [Ghost Docker **Compose**](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/Ghost_Docker-compose.yaml)
{{< /callout >}}

> The Site will be ready at `subdomain.jalcocertech.com` and for the creator `subdomain.jalcocertech.com/ghost` 

<!-- 
https://www.youtube.com/watch?v=gJxhx5wEAzA
 -->

{{< youtube "gJxhx5wEAzA" >}}

#### InstantLand

2. [Instant Land](https://instant-land.cybrarist.com/installation/portainer.html)

> GPL3.0 | Create, Copy, Modify landing pages for all your needs 


{{< details title="InstantLand Docker Compose for VPS 📌" closed="true" >}}

```sh
git clone https://github.com/Cybrarist/InstantLand
sudo docker-compose up -d #
```

```yml
networks:
  instant-land: # Define the network here
    driver: bridge # Optional, but good practice to be explicit
```

{{< /details >}}


#### WriteFreely

3. https://github.com/writefreely/writefreely

> aGPL3 | A clean, Markdown-based publishing platform made for writers. Write together and build a community. Does NOT provide a clear container for SelfHost.

#### Nikola

4. https://github.com/getnikola/nikola

* https://themes.getnikola.com/
  * https://themes.getnikola.com/v8/canterville/ Which is based on [Casper for HUGO](https://github.com/vjeantet/hugo-theme-casper/)!

> MIT | A static website and blog generator

#### Zola

5. Zola https://www.getzola.org/themes/zola-grayscale/

* https://www.getzola.org/themes/
* https://www.getzola.org/documentation/getting-started/installation/


```yml
services:
  zola:
    image: ghcr.io/getzola/zola:v0.17.2  # Specify the latest version
    volumes:
      - .:/app
    ports:
      - "1111:1111"
    command: "serve --interface 0.0.0.0"
```

## Conclusions

To sell to the masses, **you need a cool UI** for the users to manage their stuff and make it scalable.

{{< callout type="info" >}}
If you are looking for a [LinkTree Alternative, see LinkStack](https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/)
{{< /callout >}}


<!-- 
* Weddings...
* bodas.net

http://divephiphiisland.com/ -->

<!-- * Proposed: bogusiabachata.pro -->
<!-- 
ecommerce
https://polkabikes.pl/ -->

<!-- More ppl to help - future CLIENTS

* you dont need to pay for wordpress themes, its already there and it works
  * https://generatepress.com/pricing/

* Pablo Couto - https://www.buildingfuturecapital.com/

https://web-check.xyz/check/https%3A%2F%2Fwww.buildingfuturecapital.com%2F

Registry Expiry Date - 26 April 2025

https://quadscadiz.com/

* Sofia - zofienkagram
  * https://wnba.pl/ - another wordpress (good looking)
  * monika ciolkowska - monikacio
    * https://monikaciolkowska.portfoliobox.net/
    * Using the low tier without domain of https://www.portfoliobox.net/pricing (46$/y)
      * Interesting section with a table comparing services and faq (go below)

* Gym Trainer - https://trenujswiadomie.pl/kokpit/

* ecommerce - https://outficik.pl/

---

To try Astro+Ghost headlessCMS as described 
https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/#gatsby

-->
---

### Competitors

* **Menu websites at ~500 eur/year**
  * http://cartalia.org/
    * http://ukelele.cartalia.org/
  * https://www.upmenu.com/pricing/
* https://www.covermanager.com/en
* https://www.mojstolik.pl/dla-restauracji

* Hosting Costs:
  * https://banahosting.com/web-hosting ~5eur/month
  * https://webtolearn.pl/cennik ~20eur/month

* Customer management systems
  * https://wakems.com/index.php
  * https://clubspeed.com/pricing/

* Custom websites
  * https://zeon.studio/estimate-project
  * https://hormigasenlanube.com/
  * https://lyk-website.pl/brief/

* More competitors
  * Taplink
  * bento.me
  * https://getallmylinks.com/
  * https://subscribepage.io/listy#