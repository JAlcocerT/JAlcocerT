---
title: "Social Media Automation | PostIZ"
date: 2025-07-03T19:20:21+01:00
draft: false
description: 'Programatic posting on SM be like 🤯'
tags: ["Youtube Shorts","Social Media","APIfy","Scrapping"]
url: social-media-automation
---


**TL;DR**

Setup [PostIZ](#postiz) and forget about *loosing time* with social media posts.

Focus on creating.


**Intro**

We can create a lot *supported* by AI.

But the more content gets created, the harder to get the attention of people who might be interested into such content.

- [Shoutify](https://github.com/TechSquidTV/Shoutify)

Apps like PostIZ, n8n or growthchief...

* https://github.com/growchief/growchief

>  The Ultimate all-in social media automation (outreach) tool 🤖 


* The people should own the town square - Mastodon Blog https://blog.joinmastodon.org/2025/01/the-people-should-own-the-town-square/?ref=selfh.st

## PostIZ

Postiz helps you to manage all your social media accounts.

1. Postiz-App - https://github.com/gitroomhq/postiz-app
    * https://docs.postiz.com/introduction
    
> 📨 The ultimate **social media scheduling tool**, with a bunch of AI 🤖 and Apache 2.0!

I [got working PostIZ](https://github.com/JAlcocerT/Docker/tree/main/Business/Postiz) recently, together with [Traefik](https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik), both as containers and locally accesible: `https://postiz.jalcocertech.com/launches`

* https://docs.postiz.com/reverse-proxies/traefik
* You could also install it as part of [Coolify](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/#coolify) or similar PaaS, like [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas): https://coolify.io/docs/services/postiz


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Postiz" title="PostIZ Container | Docker Configs with Traefik 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/postiz" title="PostIZ HomeLab | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

We can also use PostIZ via cloudflare tunnels: `postiz:5000`


![POSITZ x Traefik DNS](/blog_img/selfh/postiz/postiz-dns-for-traefik.png)

```sh
git clone https://github.com/JAlcocerT/Home-Lab && cd postiz

cp .env.sample .env

#JWT_SECRET=$(openssl rand -base64 32)

cat <<EOL >> .env
JWT_SECRET=$(openssl rand -base64 32)
EOL

docker compose up -d
```

![PostIZ CF Tunnel](/blog_img/selfh/postiz/postiz-dns-cloudflaretunnel.png)


Once ready, go to `https://postiz.jalcocertech.com/settings`

And play around with PostIZ's API: https://docs.postiz.com/public-api

And also the [MCP integration](#positz-x-mcp).


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#how-to-setup-postiz" title="PostIZ Setup | Post" image="/blog_img/selfh/links/postiz-channels.png" subtitle="Writting about Streamlit PoC with PyGWalker" >}}
{{< /cards >}}

### PostIZ x n8n

* https://postiz.com/blog/use-postiz-with-n-8-n

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Positz x MCP

Aware of the power of [MCP](https://jalcocert.github.io/JAlcocerT/ai-understanding-mcp-framework/) already?


{{< callout type="info" >}}
[PostIZ also has **MCP**](https://postiz.jalcocertech.com/settings): Connect your MCP client to Postiz to schedule your posts faster!
{{< /callout >}}

You will get something like:

```txt
https://postiz.jalcocertech.com/api/mcp/some_id_here/sse
```

* https://mcpservers.org/servers/oculairmedia/postizz-MCP

Then, just tweak it to be:

```sh
docker run -p 3084:3084 --env-file .env --rm -it oculair/postiz-mcp:latest
```

```json
{
  "mcpServers": {
    "postiz": {
      "url": "http://localhost:3084/sse",
      "disabled": false,
      "alwaysAllow": []
    }
  }
}
```

### PostIZ x Platforms

1. Do the setup for the platforms you need: https://docs.postiz.com/providers/youtube

2. https://docs.postiz.com/providers/telegram

3. https://docs.postiz.com/providers/instagram


2. [Zapier](https://zapier.com/app/home)

* Canva seems to have it too

* [IFTTT](https://ifttt.com/plans)

3. **N8N** AI Automation - https://n8n.io/workflows/2950-ai-powered-social-media-content-generator-and-publisher/

[N8N with ollama video](https://www.youtube.com/watch?v=VDuA5xbkEjo)

4. Active Pieces - https://github.com/activepieces/activepieces

> Your friendliest open source AI automation tool ✨ Workflow automation tool 200+ integration / Enterprise automation tool / Zapier Alternative


5. MultiNotify: https://github.com/ethanocurtis/MultiNotify *in case that you want to get ideas for animations from reddit posts*

> MIT | A lightweight, open‑source Discord bot that **monitors a subreddit for new posts** (optionally filtered by flair) and automatically send them to Discord, Mattermost, Slack, or other services via webhook, with optional DM notifications.


---

## Conclusions

There are **people doing cool things** with marketing agencies.

They are implementing CRMs like `https://www.gohighlevel.com/`

> Building The Digital Marketing Engine

Also, `https://www.smartlead.ai/pricing` for cold emails.

> Powerful Automated Email Marketing that Drives Sales.

Even  `https://www.heyreach.io/`


> 10x your LinkedIn outbound. Unlimited senders, one fixed cost

> > Which can be used together with n8n: https://www.heyreach.io/n8n-templates

Last but not least: `https://www.similarweb.com`

> multidimensional approach to measuring online traffic and discovering what it means. 


### Scrapping Social Media

Cool marketing agencies are using: `https://apify.com/`. Apify is the largest ecosystem where developers build, deploy, and publish web scrapers, AI agents, and automation tools. We call them Actors.

* https://docs.apify.com/platform

> Your full‑stack platform for web scraping