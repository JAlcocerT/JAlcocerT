---
title: "Automatic Post creation for SSG Workflows"
date: 2025-09-06T15:20:21+01:00
draft: false
tags: ["Dev","n8n vs Gitea","Web","Markdown","Docker Networking"]
description: 'From n8n workflow to Gitea.'
url: 'n8n-and-gitea'
---


**TL;DR** 

Lately, I have been playing with Gitea's API.

It made me think how to combine Gitea as a source for SSG for website generation.

While the posts skeletons could be passed into a n8n workflow, with some openai LLMs / codex / whatever to shape them as per some input data.

Scrapping from a website, data formatting for real estate or events...you name it.

**Intro**



{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="CoquiTTS Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gitea" title="CoquiTTS Docker Config 🐋 ↗" >}}
{{< /cards >}}



## The Stack


This is very simple:

```sh
git clone https://github.com/JAlcocerT/Home-Lab
```


```sh
cd n8n
sudo docker-compose up -d
```

> Login via `http://192.168.1.11:5678/home/workflows`

Or just make your n8n public via CF Tunnels:

```sh
sudo docker network ls
#docker network ls | grep cloudflared_tunnel
#sudo docker ps | grep n8n
docker network connect cloudflared_tunnel n8n-n8n-1 #network -> container name
```

Verify:

```sh
#docker inspect n8n-n8n-1 --format '{{json .NetworkSettings.Networks}}' | jq
```

> Go to CF zero trust section and add as http `n8n-n8n-1:5678` as subdomain and enjoy `https://n8n.jalcocertech.com/home/workflows`


```sh
cd gitea
sudo docker-compose up -d

#sudo docker ps | grep gitea
docker network connect cloudflared_tunnel gitea #network -> container name
#docker inspect gitea --format '{{json .NetworkSettings.Networks}}' | jq
```

> Similarly, add the `gitea:3000` and enjoy your public gitea: `https://git.jalcocertech.com/`

{{< callout type="info" >}}
You can do a lot with **GITEA API**, as I covered [here](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/#gitea-101)
{{< /callout >}}




--- 

## Conclusions




---


## FAQ

