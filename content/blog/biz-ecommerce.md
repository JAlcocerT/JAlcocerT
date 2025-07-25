---
title: "Creating an e-Commerce"
date: 2025-12-23
draft: true
tags: ["dev"]
description: 'Creating an eCommerce. Drupal vs'
url: 'creating-ecommerce'
---

## Astro as Ecommerce

1. https://github.com/unfolding-io/nebulix

> CC | Nebulix, a Fast & Green Theme Based on Astro + [Static CMS](https://www.staticcms.org/docs/backends-overview) + Snipcart

2. https://github.com/CrystallizeAPI/dounut-astro

3. https://github.com/lloydjatkinson/astro-snipcart

> MIT | Allows for the creation of E-Commerce sites using the Astro framework and [Snipcart](https://snipcart.com/pricing). Start your e-commerce business in minutes!



## Streamlit as eCommerce

* https://github.com/streamlit/files-connection
* https://github.com/bleumink/streamlit-keycloak

## Selfhosted Ecommerce

### Drupal

```yml
version: "3.8"

services:
  database:
    image: mariadb:10.6
    volumes:
      - drupal_db_data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: your_root_password
      MYSQL_DATABASE: drupal
      MYSQL_USER: drupal_user
      MYSQL_PASSWORD: drupal_password
    ports:
      - "3006:3306" # Only needed for external access, remove for production
    restart: unless-stopped

  drupal:
    image: drupal:latest
    ports:
      - "8050:80"
    volumes:
      - drupal_site_data:/var/www/html/sites
      - drupal_modules_data:/var/www/html/modules
      - drupal_themes_data:/var/www/html/themes
    environment:
      DRUPAL_DB_HOST: database
      DRUPAL_DB_PORT: 3306
      DRUPAL_DB_NAME: drupal
      DRUPAL_DB_USER: drupal_user
      DRUPAL_DB_PASSWORD: drupal_password
    depends_on:
      - database
    restart: unless-stopped

volumes:
  drupal_db_data:
  drupal_site_data:
  drupal_modules_data:
  drupal_themes_data:
```

![Drupal Ecommerce Setup](/blog_img/biz/ecommerce/drupal.png)


---

### Competitors

* zezam.io
* https://sklepmakunki.pl/




<!-- * https://outficik.pl/
* https://outficik.pl/wp-login.php?redirect_to=https%3A%2F%2Foutficik.pl%2Fwp-admin%2F&reauth=1
https://www.instagram.com/outficik.secondhand/ -->



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

<!-- * Proposed: bogusiabachata.pro -->
<!-- 
https://issyinformatica.es/ -->

<!-- More ppl to help - future CLIENTS

* you dont need to pay for wordpress themes, its already there and it works
  * https://generatepress.com/pricing/

* Pablo Couto - https://www.buildingfuturecapital.com/

https://web-check.xyz/check/https%3A%2F%2Fwww.buildingfuturecapital.com%2F

Registry Expiry Date - 26 April 2025


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