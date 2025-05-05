---
title: "SelfHosting Updates - Spring 2025"
date: 2025-05-04T01:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Selfhosted Apps that simplify my workflow as of May 2025: Termix, Immich'
url: 'selfhosted-apps-may-2025'
---

Ive been following closely the newsletter from: https://selfh.st/icons/

And these have taken my attention: 

1. https://github.com/karakeep-app/karakeep

> aGPL |  A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search 

A replacement for raindrop....

2. https://github.com/vijeeshr/quickretro

> MIT |  A real-time app for conducting a remote sprint retrospective meeting 

Having retrospective is really important when working Agile...

3. https://github.com/formsmd/formsmd

> Apache v2 |  Developer-first, open source Typeform alternative (formerly known as Blocks.md) 

An interesting alternative also to formbricks

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/" title="SelfHosting 101 Script to get containers, tailscale and more ready to go! 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/dev-forms/" title="Forms | Post ↗" >}}
{{< /cards >}}

4. https://github.com/donaldzou/WGDashboard?ref=selfh.st

https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/
https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/


5. https://github.com/Bubka/2FAuth?ref=selfh.st

As I recently had some trouble with my phone...


6. https://github.com/besoeasy/file-drop?ref=selfh.st


filebrowser alternative!

7. BYOD, I mean bring your own music https://github.com/swingmx/swingmusic?ref=selfh.st

8. https://github.com/tiagorangel1/cap?ref=selfh.st

>  Cap is a lightweight, modern open-source CAPTCHA alternative designed using SHA-256 proof-of-work 

9. Wordpres...but static sites? https://github.com/nityam2007/StaticPress-Docker?ref=selfh.st

## New SelfH Apps


### Termix

Termix, not termux, its being great:

* https://github.com/LukeGus/Termix
  * https://github.com/LukeGus/Termix/wiki/Docker

> MIT |  Clientless web-based SSH terminal emulator that stores and manages your connection details 

<!-- https://www.youtube.com/watch?v=s15a-ysSQE0 -->

{{< youtube "s15a-ysSQE0" >}}

![alt text](/blog_img/selfh/termix-ui.png)

![alt text](/blog_img/selfh/termix-user.png)

```yml
services:
  termix:
    image: ghcr.io/lukegus/termix:latest
    container_name: termix
    restart: unless-stopped
    ports:
      - "8090:8080"
    volumes:
      - termix-data:/app/data
    environment:
      # Generate random salt here https://www.lastpass.com/features/password-generator (max 32 characters, include all characters for settings)
      SALT: "something_generated"
      PORT: "8080"

volumes:
  termix-data:
    driver: local
```

You can use it to manage devices on the same local network:

```sh
#arp -a
arp -a | grep "192.168.1" #filtered to avoid containers
#ip neigh
#nmap -sP 192.168.1.1/24 | grep "scan"
```

But also the ones via tailscale, even if they are outside your home network:

```sh
sudo tailscale status | grep -v "offline"
```

You can measure the temp of a distant Pi:

```sh
vcgencmd measure_temp pmic
```

### Publiteme

* https://github.com/MikeMather/publite.me

https://www.youtube.com/watch?v=yAJvbF-m5FM




### Recap from Spring 2025

I was covering recently nextcloud...

![alt text](/blog_img/selfh/nextcloud-untrusteddomain.png)

and found out about OpenCloud:

https://www.youtube.com/watch?v=Ud9FEmNOgLs

https://github.com/opencloud-eu/opencloud

> Apache v2 | This is the main repository of the OpenCloud server. It contains the golang codebase for the backend services.

### I needed recently...


* https://speed.cloudflare.com/


## Analytics Stuff

* https://github.com/chartbrew/chartbrew
* https://docs.chartbrew.com/deployment/run-on-docker#run-on-docker
* https://raw.githubusercontent.com/chartbrew/chartbrew/refs/heads/master/docker-compose.yml

>  Open-source web platform used to create live reporting dashboards from APIs, MongoDB, Firestore, MySQL, PostgreSQL, and more 📈📊 

Which resonates with my recent post: https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/

## Conclusions

* https://github.com/hollowpnt92/docker-port-viewer?ref=selfh.st
https://github.com/hollowpnt92/docker-port-viewer/blob/main/docker-compose.yml

```sh
docker run -d --name docker-socket-proxy -e CONTAINERS=1 -e POST=0 -e PUT=0 -e DELETE=0 -v /var/run/docker.sock:/var/run/docker.sock:ro tecnativa/docker-socket-proxy && docker run -d --name docker-port-viewer --link docker-socket-proxy -p 3003:80 hollowpnt/docker-port-viewer:latest
```

### Better WebAnalytics

Lately I tried littlyx, but I saw this cool post: https://jakubwolynko.eu/blog/202505-hosting-umami-on-vercel/

Also, https://github.com/Litlyx/litlyx which i discovered few months back


### Automated Projects Docs

Wouldnt it be great to have a project documentation automatically and AI generated?





{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/RepoReader" title="Repo Reader | Forked Project ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/#conclusions" title="Web Scrapping | Post ↗" >}}
{{< /cards >}}

I also tried with Firecrawl and OpenAI to give me some readme/ [sample posts](https://github.com/JAlcocerT/Scrap_Tools/blob/main/FireCrawl/Z_Scrap_GHRepo/z_sample_post.md) about a given project:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/RepoReader" title="Repo Reader | Forked Project ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools/tree/main/FireCrawl/Z_Scrap_GHRep" title="Firecrawl Scrap GH Repo | Project Files ↗" >}}
{{< /cards >}}



In the meantime I discovered that it is also possible to ask questions about a Web's content with LangChain, for example, a repository:

```py

```

<!-- https://github.com/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-chroma-web.ipynb
https://github.com/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-chroma-repo-readme.ipynb
 -->

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://github.com/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-chroma-repo-readme.ipynb)


{{< callout type="info" >}}
It uses a [local ChromaDB](https://pypi.org/project/langchain-chroma/), Local embedding model and the LLM of your taste, via `LangChail.LLM`: [Ollama](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Ollama), [OpenAI](https://python.langchain.com/api_reference/openai/llms/langchain_openai.llms.base.OpenAI.html#langchain_openai.llms.base.OpenAI)...
{{< /callout >}}


In many of these projects you will see [UV as package manager](https://jalcocert.github.io/JAlcocerT/using-langchain-with-pandas-df/#uv)