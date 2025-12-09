---
title: "AI Chats with cool UIs are possible"
date: 2025-11-30T08:20:21+01:00
draft: false
tags: ["Astro SSR","Groq TPS","Web Analytics vs Link Analytics"]
url: 't3-like-chat'
description: 'Integrating Astro Chat Themes to AI API Keys versus T3. Consolidating BiP+Vibe Coding with AI Agents.'
---

**Tl;DR**

Ive been following theo in YT for some time now, t3 chat is amazing.

How hard is to do something similar on the surface?

+++

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/" title="BiP | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/#initial-prompts-for-success" title="Vibe Coding | Docs ↗" icon="book-open" >}}
{{< /cards >}}

**Intro**

The multichat or the Aissistant were cool.


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="MultiChat UI" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="How the final multichat UI looks like" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="Multichat" image="/blog_img/apps/ai-assistant.png" subtitle="Source Code for Streamlit Multichat" >}}
{{< /cards >}}

But streamlit does not allow for the kind of modern (and pixel tweak) chat interface we want.

One that...could be a brand signature.

This is where I want to try **Astro on SSR mode**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/" title="Authentication | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}

## A T3 Chat like interface

create a makefile with the commands to run this astro site locally


Why not applying these to a theme: *which kind of reminds me of t3.chat*: https://t3.chat

![T3 Chat UI](t3-chat-register-wall/blog_img/GenAI/t3.png)

* https://www.astrothemes.dev/theme/anse-app-chatgpt-demo/
* https://github.com/anse-app/chatgpt-demo

> MIT | Minimal web UI for ChatGPT.

* https://github.com/Marve10s/Astro-Vercel-SDK-AI-Chatbot which is also **MIT** and https://template-astro-vercel-sdk-ai-chatbo.vercel.app/

```sh
git clone https://github.com/Marve10s/Astro-Vercel-SDK-AI-Chatbot

```

In this case, the vibe coding journey starts from this repository, so no need for the initial prompt.

And on the recent [Audio with AI Post](https://jalcocert.github.io/JAlcocerT/audio-recap/), I was supposed to create a [Speech rater with FastAPI](https://github.com/JAlcocerT/py-speech-rater) that superseeds the [previous streamlit version](https://github.com/JAlcocerT/Streamlit-Speech).

But I got an improvement of [my yt audio workflow](https://jalcocert.github.io/JAlcocerT/audio-recap/#conclusions) instead.

The prep work was done anyways: SSG + FastAPI + Audio recording/storing/processing worked.

How about the rating part now?

Meaning: to somehow plug the AI/LLMs/Agents to do/check stuff


### About Cool Chat UIs

In theory, we can plug shadcn to streamlit...

Some might say that its all [about CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-web-code-css/).

* https://ui.shadcn.com/themes
  * https://github.com/ObservedObserver/streamlit-shadcn-ui






---

## Conclusions


### About AI API Endpoints



---

## FAQ


### SelfHostable Links

1. Lynx. But not the Lynx HUGO Theme.

* https://github.com/paoloronco/Lynx

> MIT |  Lynx is an open-source, self-hosted link manager that helps you gather all your digital touchpoints in a single page, with secure authentication and a fully customizable design. 

2. LinkStack. As seen [here](https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/#selfhosted-solutions-for-linkinbio) and [here](https://jalcocert.github.io/JAlcocerT/portfolio-website-for-social-media/)

![LinkStack UI](/blog_img/web/web-linkstack.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/linkstack" title="LinkStack | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### SelfHosted WebAnalytics

If the cloudflare web analytics is not enough for you:

![CF Web Analytics](/blog_img/web/filebrowser-hugo/cloudflare-hugo-analytics.png)

Every time I read the `selfh.st `newsletter I find a new web analytics tool trying to replace Umami.

* https://github.com/seuros/kaunta

> Privacy-focused analytics engine written in Go

* https://github.com/electerious/Ackee 

**But imo, Umami** should be one of those **HomeLab essentials** tools to consider.

<!-- ![Ebook Landing + Umami Web Analytics](/blog_img/entrepre/product/ebook-umami.png) -->

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umami" title="Umami | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics" title="SelfHostable WebAnalytics Tools 🐋✅ ↗" >}}
{{< /cards >}}

Because you can also [plug Umami to Flask web apps](https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#adding-umami-web-analytics-to-flask):

![Flask App with Umami Integration](/blog_img/entrepre/webify/flask-umami.png)


<!-- ![Cookies Meme](/blog_img/web/COOKIES.jpg) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#better-webanalytics" title="Better web Analytics from 0525" image="/blog_img/web/COOKIES.jpg" subtitle="Post views distribution" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://github.com/Litlyx/litlyx" title="Litlyx Repo" image="/blog_img/web/weban/littlyx-weban.png" subtitle="How Litlyx web analytics looks" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/" title="Litlyx Post Views Distribution" image="/blog_img/web/weban/litlyx.png" subtitle="How could this not relate with Pareto?" >}}
{{< /cards >}}

> Powerful Analytics Solution. Setup in 30 seconds. Display all your data on a Simple, AI-powered dashboard. 

> > Fully self-hostable and GDPR compliant. Alternative to Google Analytics, MixPanel, Plausible, Umami & Matomo.

![Web Analytics with LunaLytics](/blog_img/selfh/HomeLab/weban-lunalytics.png)



See also:

1. https://github.com/abegehr/chickadee

 > Simple, privacy-focused web analytics you can self-host on Cloudflare. 

2. https://github.com/benvinegar/counterscale

 > Scalable web analytics you run yourself on Cloudflare 

3. Dashflare - https://github.com/jorgelbg/dashflare

>  🕵🏼‍♀️ Open Source and privacy-focused analytics solution. 📊 Advanced monitoring for your website behind Cloudflare 



#### Link Analytics

Some [selfhosted url shorteners](https://fossengineer.com/selfhosted-open-source-url-shorteners/) will bring you analytics and QR as well.

See https://github.com/738/awesome-url-shortener?tab=readme-ov-file#self-hosting-opensource

Link analytics solutions, like Kutt: `https://kutt.it/`

![SelfHosting Kutt](/blog_img/selfh/links/kutt-selfh.png)

![Kutt Links](/blog_img/selfh/links/kutt-link-creation.png)

You can always check what is the shortened link pointing with: *yea, curl can do that!*

```sh
curl -sIL https://youtu.be/sGUjmyfof4Q?t=568  | grep location:
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/sink" title="Sink works on cloudflare!| Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/yourls" title="Yourls | Docker Config 🐋 ↗" >}}
{{< /cards >}}

> Configuring Sink Link shortener to work on cloudflare: https://fossengineer.com/sink-url-shortener-setup/


Many more will be coming, like https://github.com/alexcastrodev/shortener

| Project    | Ease of Self-Hosting | Notes                                                                                                               |
|-----------|-----------------------|---------------------------------------------------------------------------------------------------------------------|
| Dub.co    | Moderate              | Powerful link management but primarily a commercial platform, open source backend exists, may require more setup.  |
| Eastlake  | Easy                  | Cloudflare Worker-based, very lightweight, simple deployment via Cloudflare, good if you have Cloudflare experience. |
| Kutt.it   | Moderate              | Open source Node.js app, requires Node environment but well documented, Docker images available.                   |
| Lstu.fr   | Easy                  | Lightweight, written in OCaml, minimal dependencies, official instance available, simple setup.                    |
| Polr      | Easy to Moderate      | PHP/MySQL based, lightweight and popular, easy to deploy on typical LAMP stacks or Docker.                         |
| pygmy     | Moderate              | Python-based with analytics, moderate complexity but well structured for self-hosting.                             |
| reduced.to| Moderate              | Open source with analytics, requires standard web stack, some setup needed.                                        |
| san.aq    | Easy                  | Minimalistic API-based shortener, very simple tool for curl/HTTP API users.                                        |
| shlink    | Moderate              | PHP-based with rich features, requires some setup, Docker deployments exist.                                       |
| Sink      | Easy                  | Cloudflare-based like Eastlake, cloud-native simple deployment on Cloudflare platform.                             |
| YOURLS    | Easy                  | Most popular self-hosted URL shortener, PHP/MySQL based, simple installation, highly documented.                   |

For the **QR part**, you know that we have few solutions...

1. https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/QR_Gen.py

2. [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)


There are several open-source self-hostable link shortener tools you can consider, each with its unique features:

1. **Shlink**: A PHP-based link shortener that supports generating unique short codes or custom slugs. It collects anonymized visit stats and geolocates visitors. It offers a REST API, CLI tools, and Docker support for easy deployment. It uses modern technologies like Mezzio and Symfony and is MIT licensed.[1][3]

2. **Kutt**: A modern, free, and open-source URL shortener with features like custom domains, custom URLs, password protection, link expiration, private statistics, and an admin dashboard. It has a RESTful API and can be easily installed using Docker Compose.[5]

3. **YOURLS**: A well-established PHP-based URL shortener with features such as bookmarklets, developer API, detailed stats including referrers and geo-location, and extensibility through dozens of plugins. It is free, open source, and easy to self-host.[10]

4. **Shrink.io (shrtn.io)**: A lightweight, privacy-focused URL shortener using SQLite by default (so no database server is required) and deployable via Docker. It emphasizes ease of use, privacy, and developer-friendly features.[6]

5. Other notable mentions from a curated list include Polr, Lstu, Blink, and goshorly—all open source with various programming languages and features.[4][8]

For ease and feature richness, Shlink, Kutt, and YOURLS are highly recommended starting points for a self-hosted URL shortener.

Among the popular open-source self-hosted link shorteners mentioned, some do offer QR code capabilities either built-in or through extensions/plugins:

1. **Shlink**: Provides built-in QR code generation for short URLs. When you create a short URL using Shlink, it can generate a corresponding QR code that you can share or embed. This is part of its feature set, making it convenient for print or mobile scanning use cases.[1][2]

2. **Kutt**: While Kutt does not include native QR code generation in its core, there are third-party tools or browser extensions available that can generate QR codes for any URL, including Kutt short links. Some community forks or plugins might add this feature. Officially, out-of-the-box QR codes are not a core feature.[3]

3. **YOURLS**: YOURLS does not include native QR code generation by default, but there are several plugins created by the community that add QR code functionality to YOURLS short URLs. This extensibility allows you to add QR generation if needed.[4]

4. Other lesser-known tools like Blink or Polr may have QR features built-in or via plugins, but the top three mentioned mostly rely on either built-in Shlink support or plugins for YOURLS for QR capabilities.[5][6]

To summarize, **Shlink** stands out as the self-hosted URL shortener with built-in QR code generation. 

For YOURLS, you can enable QR codes through community-developed plugins, while Kutt typically requires external QR code tools. 

This makes Shlink a strong candidate if QR code functionality is a priority alongside link shortening.