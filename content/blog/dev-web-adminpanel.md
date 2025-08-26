---
title: "Admin Panels for Websites | Testing Manifest "
date: 2025-08-30
tags: ["AI","Authentication"]
description: "Admin Panels and Manifest (Portable Backend as yaml file)"
url: 'admin-panels-for-websites'
draft: false
---

Ive been exploring few authentications method lately.

Some people claim that ads + onboarding + paywall is your source of revenue as a SaaS indie creator.

{{< tweet user="SinaSinry" id="1951606811829604488" >}}

<!-- 
https://x.com/SinaSinry/status/1951606811829604488?t=jRvoxV9sxOPDvFHh89HF5w&s=35 -->

> The ARR/MRR retention must be another topic, *I guess*

And suddendly, I have found an interesting solution (that its vibe-code friendly!): [Manifest](#manifest)

## Manifest

* https://github.com/mnfst/manifest
    * https://manifest.build/
    * https://manifest.build/docs
        * https://manifest.build/docs/astro

> **MIT** | A backend for modern workflow. 🦚 Code or vibe-code your backend in seconds with Manifest.

<!-- https://www.youtube.com/watch?v=BceJdw2W6GU -->

{{< youtube "BceJdw2W6GU" >}}


**Why manifest**

Manifest is an Open Source, portable backend that fits into 1 YAML file. Easy for both humans and LLMs to generate and validate.

Host it on any server that can run NodeJS.

Manifest comes with essential features like auth and custom logic, and a built-in admin panel.

Manifest fits great in those type of projects:

1. 🛠️ Rapid prototyping: POCs and MVPs | Turning any entity into an authenticated user is as simple as adding a authenticable: true line to your backend file.
2. 🧩 Micro services: notification, payment, logging, file services...
3. 🏭 CRUD-heavy apps: mobile apps, directories, PIMs, E-shops
4. 🌐 Headless CMS: dynamic corporate websites, portfolios, blogs...

### Manifest 101

This sounds great for quick PoCs:

* https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker

![Streamlit PyGWalker Rendered Map with locations](/blog_img/apps/streamlit/st_pygwalker_map.png)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

But how to **get started with Manifest**?


```sh
npx create-manifest@latest  --windsurf
```

### Manifest UseCases

#### Headless CMS

Via Flask, you can make a quick webapp to allow users to edit specific fields of your SSG Themes.

---

## Others

### AdminJS

https://adminjs.co/

> Open-Source Admin Panel for your Node.js Application

https://github.com/SoftwareBrothers/adminjs

AdminJS is an admin panel for apps written in node.js

https://docs.adminjs.co/installation/getting-started

https://docs.adminjs.co/basics/authentication

### Tailadmin

https://tailadmin.com/

### Open Admin

* https://open-admin.org/
* https://github.com/open-admin-org/open-admin

### Flask Dahobards

* https://appseed.us/admin-dashboards/open-source/
* https://github.com/app-generator/flask-argon-dashboard


###  NGX Admin

https://github.com/akveo/ngx-admin

## Authentication

* https://github.com/voidauth/voidauth

> Agpl v3 | An Easy to Use and Self-Host Single Sign-On Provider 🐈‍⬛🔒

### Authentication with Logto

I have been tinkering with LogTo via:

The 3 Bodies post and app.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


---

## Conclusions


---

## FAQ

### Password Protected Static Routes with NGINX 