---
title: "Using APIs to write content"
date: 2025-09-06T08:20:21+01:00
draft: false
tags: ["Ghost","Web","Wordpress"]
description: '.'
url: 'automating-ghost-and-wordpress'
---




## FAQ

### Ghost Setup

They recently released v6: 

* https://github.com/TryGhost/Ghost/releases/tag/v6.0.0
* https://hub.docker.com/layers/library/ghost/6/images/sha256-9b517233be94c4e3d7e56ea267a65b920d9fcf049e1d20d500e222b3b5b1be53

> **MIT** |  Independent technology for modern publishing, memberships, subscriptions and newsletters. 

{{< cards cols="1" >}}
  {{< card link="https://github.com/TryGhost/Ghost?ref=fossengineer.com" title="Ghost | Source Code ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ghost" title="Ghost | Docker Config 🐋 ↗" >}}
{{< /cards >}}


```sh
#cd ghost
echo -e "MYSQL_DATABASE=ghost\nMYSQL_USER=ghostuser\nMYSQL_PASSWORD=$(openssl rand -base64 32)\nMYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)" > .env
docker compose up -d #Grist will be at 
```

### Wordpress Setup



{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wordpress" title="Wordpress | Docker Config 🐋 ↗" >}}
{{< /cards >}}


```sh
#cd wordpress
export GRIST_SESSION_SECRET=$(openssl rand -base64 32)
docker compose up -d #Grist will be at 
```