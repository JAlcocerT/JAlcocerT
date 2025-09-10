---
title: "Social Media Automation | PostIZ"
date: 2025-07-03T19:20:21+01:00
draft: false
description: 'Programatic posting on SM.'
tags: ["Youtube Shorts","Social Media"]
url: social-media-automation
---


**TL;DR**

Setup PostIZ and forget about *loosing time* with social media posts.

Focus on creating.


**Intro**

We can create a lot supported by AI.

But the more content gets created, the harder to get the attention of people who might be interested into such content.

- [Shoutify](https://github.com/TechSquidTV/Shoutify)


---


1. Postiz-App - https://github.com/gitroomhq/postiz-app
    * https://docs.postiz.com/introduction
    
> 📨 The ultimate **social media scheduling tool**, with a bunch of AI 🤖 and Apache 2.0!

I got working PostIZ recently, together with Traefik, both as containers and locally accesible: https://postiz.jalcocertech.com/launches

* https://docs.postiz.com/reverse-proxies/traefik
* You could also install it as part of [Coolify](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/#coolify) or similar PaaS, like [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas): https://coolify.io/docs/services/postiz

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Postiz" title="PostIZ Container | Docker Configs 🐋✅ ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik" title="Traefik Container | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#how-to-setup-postiz" title="PostIZ Setup | Post" image="/blog_img/selfh/links/postiz-channels.png" subtitle="Writting about Streamlit PoC with PyGWalker" >}}
{{< /cards >}}

Do the setup for the platforms you need: https://docs.postiz.com/providers/youtube

{{< callout type="info" >}}
[PostIZ also has MCP](https://postiz.jalcocertech.com/settings): Connect your MCP client to Postiz to schedule your posts faster!
{{< /callout >}}

You will get something like:

```txt
https://postiz.jalcocertech.com/api/mcp/some_id_here/sse
```

2. [Zapier](https://zapier.com/app/home)

* Canva seems to have it too

* [IFTTT](https://ifttt.com/plans)

3. **N8N** AI Automation - https://n8n.io/workflows/2950-ai-powered-social-media-content-generator-and-publisher/

[N8N with ollama video](https://www.youtube.com/watch?v=VDuA5xbkEjo)

4. Active Pieces - https://github.com/activepieces/activepieces

> Your friendliest open source AI automation tool ✨ Workflow automation tool 200+ integration / Enterprise automation tool / Zapier Alternative


5. MultiNotify: https://github.com/ethanocurtis/MultiNotify *in case that you want to get ideas for animations from reddit posts*

> MIT | A lightweight, open‑source Discord bot that **monitors a subreddit for new posts** (optionally filtered by flair) and automatically send them to Discord, Mattermost, Slack, or other services via webhook, with optional DM notifications.

