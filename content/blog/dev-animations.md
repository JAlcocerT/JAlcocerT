---
title: "How to create cool Animations | Data in Motion"
date: 2025-07-04T18:20:21+01:00
draft: false
description: 'From Embedded Analytics into SSGs Websites to Data Driven Animations.'
tags: ["Animations","Python","Matplotlib","Youtube Shorts","Social Media"]
url: animations-as-a-code
---

Not long ago I was tinkering with [AI/BI Tools](https://jalcocert.github.io/JAlcocerT/ai-bi-tools/): ChartBrew, ChartDB, DB2Rest and Streamlit x PyGWalker

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker" title="AI BI Tools Post" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Writting about Streamlit PoC with PyGWalker" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

From there, I could not resist to **create this project**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/keystaticcms-astrodb/#animations" title="Tinkering with Animations | Post" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Posting to Twitter or Youtube those animations 101." >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Generating mp4 animations with Matplotlib and Python..." >}}
{{< /cards >}}

Sometime ago, I was exploring some [options to create video as a code](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#video-as-a-code)

I tried something on [**RemotionJS** on this repo](https://github.com/JAlcocerT/VideoEditingRemotion)

As always, there is a fireship cool video on [Remotion](https://github.com/remotion-dev/remotion):

But...it was not enough for me to get started with someting cool.

Maybe now this can be a thing, since we have [MCP](https://jalcocert.github.io/JAlcocerT/ai-understanding-mcp-framework/) + Windsurf or GeminiCLI [Configured with Git-MCP](https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli/#gemini-cli-x-mcp)

```json
{
  "mcpServers": {
    "gitmcp": {
      "serverUrl": "https://gitmcp.io/remotion-dev/remotion"
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

I created [this repo for putting *real life* videos together](https://github.com/JAlcocerT/YT-Video-Edition), as covered on [these posts](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/)

## Animations with Python

Is it even possible to create a full `.mp4` with code?

From Data to Streamlit to Animation to Video, is a topic that I tinkered [during the AIssistant, here](https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/Z_Tests/ST_AutomaticYTVideo).

Now, the concept I want to do is very simple:

1. Generate Code & Data driven animations
2. Use Python to pull the data
3. Use matplotlib for the final `.mp4` animations

Something very similar, but [with mechanisms](https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/#conclusions), can be done as well!

{{< youtube "2xMOxiRz6F4-g" >}}

## Animations x SSG

This year I also was playing around with Astro components:

```sh
npm install
#npm run dev
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

---

## Conclusions

### Embedded Analytics


---

## FAQ

### Social Media Automation


**Social Media Management Apps**

- [Shoutify](https://github.com/TechSquidTV/Shoutify)


Social Media can be simplified:

![Forocoches3kbmw](/blog_img/memes/ezoeazin.jpg)


1. Postiz-App - https://github.com/gitroomhq/postiz-app
    * https://docs.postiz.com/introduction
    
> 📨 The ultimate **social media scheduling tool**, with a bunch of AI 🤖 and Apache 2.0!

I got working PostIZ recently, together with Traefik, both as containers and locally accesible: https://postiz.jalcocertech.com/launches

* https://docs.postiz.com/reverse-proxies/traefik
* You could also install it as part of [Coolify](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/#coolify) or similar PaaS, like [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas): https://coolify.io/docs/services/postiz

{{< cards cols="1" >}}
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

* **N8N** AI Automation - https://n8n.io/workflows/2950-ai-powered-social-media-content-generator-and-publisher/

[N8N with ollama video](https://www.youtube.com/watch?v=VDuA5xbkEjo)

* Active Pieces - https://github.com/activepieces/activepieces

> Your friendliest open source AI automation tool ✨ Workflow automation tool 200+ integration / Enterprise automation tool / Zapier Alternative