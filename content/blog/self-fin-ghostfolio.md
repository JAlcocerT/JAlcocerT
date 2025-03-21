---
title: "Personal Finances: GhostFolio and more"
date: 2025-12-15T23:20:21+01:00
draft: true
cover:
  image: "https://socialify.git.ci/ghostfolio/ghostfolio/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"
  alt: "Ghostfolio" # alt text
  caption: "Ghostfolio setup with docker." # display caption under cover
tags: ["Docker","Open Source Finances"]
description: ''
summary: ''
url: ''
---

AND MORE TOOLS IN THE FAQ

## Paisa

https://paisa.fyi/

## Actual Budget

https://actualbudget.org/
https://github.com/actualbudget/actual

> A local-first personal finance app


## firefly-iii

https://github.com/firefly-iii/firefly-iii/
https://mariushosting.com/how-to-install-firefly-iii-on-your-synology-nas/

https://www.youtube.com/watch?v=ru1LTUhFGjA

## Maybe

https://github.com/maybe-finance/maybe

 The OS for your personal finances 

## Ghostfolio

<https://ghostfol.io/>

https://github.com/ghostfolio/ghostfolio

https://mariushosting.com/how-to-install-ghostfolio-on-your-synology-nas/

https://ghostfol.io/en/features

{{< dropdown title="Pre-Requisites!! Just Get Docker 🐋" closed="true" >}}

Important step and quite recommended for any SelfHosting Project - [Get Docker Installed](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/)

It will be one command, this one, if you are in Linux:

```sh
apt-get update && sudo apt-get upgrade && curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh && docker version
```

{{< /dropdown >}}


```yml
version: "3.9"
services:
  ghostfolio-redis:
    image: redis
    container_name: Ghostfolio-REDIS
    hostname: ghostfolio-redis
    security_opt:
      - no-new-privileges:true
    healthcheck:
      test: ["CMD-SHELL", "redis-cli ping || exit 1"]
    user: 1026:100
    environment:
      - TZ=Europe/Bucharest
    volumes:
      - /volume1/docker/ghostfolio/redis:/data
    restart: always

  ghostfolio-db:
    image: postgres
    container_name: Ghostfolio-DB
    hostname: ghostfolio-db
    security_opt:
      - no-new-privileges:true
    healthcheck:
      test: ["CMD", "pg_isready", "-q", "-d", "ghostfoliodb", "-U", "ghostfoliouser"]
      timeout: 45s
      interval: 10s
      retries: 10
    user: 1026:100
    volumes:
      - /volume1/docker/ghostfolio/db:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=ghostfoliodb
      - POSTGRES_USER=ghostfoliouser
      - POSTGRES_PASSWORD=ghostfoliopass
    restart: always

  ghostfolio:
    image: ghostfolio/ghostfolio:latest
    container_name: Ghostfolio
    hostname: ghostfolio
    security_opt:
      - no-new-privileges:true
    user: 1026:100
    environment:
      - NODE_ENV=production
      - ACCESS_TOKEN_SALT=MariushostingMariushostingMari13
      - JWT_SECRET_KEY=MariushostingMariushostingMari13
      - REDIS_HOST=ghostfolio-redis
      - REDIS_PASSWORD=
      - REDIS_PORT=6379
      - DATABASE_URL=postgresql://ghostfoliouser:ghostfoliopass@ghostfolio-db:5432/ghostfoliodb?sslmode=prefer
    ports:
      - 8435:3333
    restart: always
    depends_on:
      ghostfolio-db:
        condition: service_started
      ghostfolio-redis:
        condition: service_healthy
```

---

## FAQ

### Other F/OSS Apps for Finance Management

* https://apps.nextcloud.com/apps/cospend
* Firefly 3
* https://github.com/jameskokoska/Cashew?tab=readme-ov-file
  * This application is available on the App Store, Google Play, GitHub and as a Web App (PWA).
  * Cashew is a full-fledged, feature-rich application designed to empower users in managing their finances effectively. Built using Flutter - with Drift's SQL package, and Firebase - this app offers a seamless and intuitive user experience across various devices. Development started in September 2021.

* https://github.com/spliit-app/spliit

>  Free and **Open Source Alternative to Splitwise**. Share expenses with your friends and family. 

* https://github.com/KayatoSan/Budget5S
https://github.com/KayatoSan/Budget5S?tab=AGPL-3.0-1-ov-file#readme
>  Budget5S aims to offer a free alternative to budget managers. 

* https://github.com/ellite/Wallos - Wallos: Open-Source Personal Subscription Tracker



> Wallos is a powerful, open-source, and self-hostable web application designed to empower you in managing your finances with ease. Say goodbye to complicated spreadsheets and expensive financial software – Wallos simplifies the process of tracking expenses and helps you gain better control over your financial life.

