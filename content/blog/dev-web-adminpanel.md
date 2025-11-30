---
title: "Admin Panels for Websites | Manifest vs PB"
date: 2025-11-29T10:20:21+01:00
tags: ["SaaS","Authentication","Simple BackEnd"]
description: "Admin Panels and Manifest (Portable Backend as yaml file)"
url: 'admin-panels-for-websites'
draft: false
---

**Tl;DR**

Is it possible to have something better than Streamlit and Pocketbase for the quickest data visualization  / SaaS PoC and backend ever?

**Intro**

Ive been exploring few authentications method earlier this year.

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/" title="Authentication | Docs ↗" >}}
{{< /cards >}}

And suddendly, I have found an interesting tool

That its also vibe-code friendly!: [Manifest](#manifest)

**On this post**: 

I want to compare how Manifest compares to Pocketbase as selfhosted BaaS solution and as **admin panel**


## Manifest

* https://github.com/mnfst/manifest
    * https://manifest.build/
    * https://manifest.build/docs
        * https://manifest.build/docs/astro

> **MIT** | A backend for modern workflow. 🦚 Code or vibe-code your backend in seconds with Manifest.

<!-- https://www.youtube.com/watch?v=BceJdw2W6GU -->

{{< youtube "BceJdw2W6GU" >}}


**Why manifest**

Manifest is an Open Source, **portable backend** that fits into 1 YAML file. 

Easy for both humans and LLMs to generate and validate.

Host it on any server that can run NodeJS.

Manifest comes with **essential features** like auth and custom logic, and a built-in admin panel.

Manifest fits great in those type of projects:

1. 🛠️ Rapid prototyping: POCs and MVPs | Turning any entity into an authenticated user is as simple as adding a authenticable: true line to your backend file.
2. 🧩 Micro services: notification, payment, logging, file services...
3. 🏭 CRUD-heavy apps: mobile apps, directories, PIMs, E-shops
4. 🌐 Headless CMS: dynamic corporate websites, portfolios, blogs...

### Manifest 101

This sounds great for **quick PoCs**: *let them be on Python Streamlit*

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker" title="Streamlit PoC Post" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Streamlit PyGWalker Rendered Map with locations..." >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

*Or with NextJS*:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-driven-presentations/" title="NextJS SliDev" image="/blog_img/DA/ppt/slidev-editor.png" subtitle="Tinkering with NextJS ToastUI and SliDev ppts..." >}}
{{< /cards >}}


But how to **get started with Manifest**?

```sh
npx create-manifest@latest  --windsurf
```

### Manifest UseCases

#### Headless CMS

Via Flask, you can make a [quick CMS for SSGs webapp](https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/) to allow users to edit specific fields of lets say, your Astro Themes...

But after all that work to put a custom setup, your clients might come back with questions like `I dont understand what the upload image button is supossed to do`:


https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/#flaskcms-x-quick-auth

![Uploading real estate photos via Flask](/blog_img/web/moi-realestate/flask-cms-simpe-login.png)

With vibe coding, is easy to get lost into the leaves of a cool UI:

![Flask Web App as CMS](/blog_img/web/morita-flask/flask-cf-ui.png)

So these kind of projects that aimed to be the [custom CMS editors of a pool of astro/hugo ssgs](https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/) and get paid...maybe 100$ are not worth *beside the learnings.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/WebGenerAItor" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
  {{< card link="https://github.com/JAlcocerT/WebifAI" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

Because of that, I started to put together this kind of high level docs, based on my learnings:

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-cms-101/" title="Web CMSs| Docs ↗" >}}
{{< /cards >}}

That on the future, will be transformed into proper web/ook for a DIY proposal, else a PaaS proposal that brings any [WP/Ghost/no code website builder](https://jalcocert.github.io/JAlcocerT/no-code-websites/) to live.

- The DIY + read is free - making things so easy than anyone + time spent can do it
- The DIY + PaaS is paid for servers and stuff - people get to configure it

{{< cards >}}
  {{< card link="https://cal.com/jalcocertech/consulting" title="Tech Consulting" image="/blog_img/email/cal-email-stripe.png" subtitle="This is the DWY - Accounting for my time opportunity cost" >}}
  {{< card link="https://cal.com/jalcocertech/consulting" title="JAlcocerTech Custom Solutions" image="/blog_img/email/cal-email-stripe.png" subtitle="This DFY I have to refine it though" >}}
{{< /cards >}}








Or as I did recently with **NextJS**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-i18/" title="MultiLanguage with Astro POST" image="/blog_img/web/nextjs-astro-editor/toastui-nextjs-1.png" subtitle="Toast UI working with NextJS" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-journal-theme/" title="Journaling with Astro POST" image="/blog_img/web/nextjs-admin/journal-nextjs-admin-reactmd.png" subtitle="NextJS Reactmd editing astro sphere theme" >}} 
  {{< card link="https://github.com/JAlcocerT/sell-your-ebook/tree/main/config-editor" title="Astro SSG to publish your PDF ebook" image="/blog_img/entrepre/product/ebook-flask.png" subtitle="Flask CMS Editor for Ebook Landing via JSON" >}}
{{< /cards >}}





---

## Conclusions


Some people claim that **ads + proper onboarding + paywall** is your source of revenue as a SaaS indie creator.

{{< tweet user="SinaSinry" id="1951606811829604488" >}}

And creating an admin panel is simple in theory.

But in practice... *See this quick admin panel [fastapi sqlite based from the last audio post](https://jalcocert.github.io/JAlcocerT/audio-recap/#conclusions)*

<!-- 
https://x.com/SinaSinry/status/1951606811829604488?t=jRvoxV9sxOPDvFHh89HF5w&s=35 -->

> The ARR/MRR retention must be another topic, *I guess*


### Manifest vs PocketBase

Ive [discovered PB this year](https://jalcocert.github.io/JAlcocerT/pocketbase/) and its uses cases have been great so far.


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/manifest" title="Manifest | Portable Backend as YAML | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="PocketBase | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Including the providing [authentication for statically deployed SSGs via CF Workers](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/) with CSR

And the [PB SMTP email integration](https://jalcocert.github.io/JAlcocerT/email-verification-pocketbase/).

So the question is clear: *Which of these 2 is better to build SaaS PoCs?*



---

## FAQ

### Other OSS Admin Panels

* https://github.com/ColorlibHQ/AdminLTE

> MT | AdminLTE - Free admin dashboard template based on Bootstrap 5

* https://github.com/incluud/accessible-astro-dashboard

> MIT | An Accessible **Admin Dashboard Theme for Astro** with a login page and a dashboard overview. Includes accessibility features such as landmarks, better focus-outline and skip-links navigation.

* https://github.com/SoftwareBrothers/adminjs
  * https://adminjs.co/

> Open-Source Admin Panel for your Node.js Application


* https://docs.adminjs.co/installation/getting-started
* https://docs.adminjs.co/basics/authentication


* https://tailadmin.com/

> MIT | Free and Open-source Tailwind CSS Dashboard Admin Template that comes with all essential dashboard UI components, pages and elements


* https://open-admin.org/
  * https://github.com/open-admin-org/open-admin

> MIT | open-admin forked from z-song/laravel-ladmin (PHP). Removing jquery, now based on Bootstrap5, vanilla JS 

* https://github.com/app-generator/flask-argon-dashboard

* https://github.com/akveo/ngx-admin

> Customizable admin dashboard template based on Angular 10+