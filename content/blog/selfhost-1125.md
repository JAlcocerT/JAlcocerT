---
title: "SelfHosting done Easy with UmbrelOS - Nov 2025"
date: 2025-11-04T01:20:21+01:00
draft: false
tags: ["Web Analytics vs Link Analytics","Adventures x GPX"]
description: 'Measuring the More, better, new online performance.'
url: 'selfhosted-apps-nov-2025'
---

**TL;DR**


**Intro**


### Selfhosted Adventures

I tried recently umbrelOS (the latest1.4), but inside a container:

![alt text](/blog_img/selfh/umbrel-os/umbrel-signup.png)

![alt text](/blog_img/selfh/umbrel-os/umbrel-apps.png)

And one of the many apps that you can use out of the box is wanderer:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umbrel" title="Selfhosted Umbrel - Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wanderer" title="Selfhosted Wanderer - Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/selfh/umbrel-os/wanderer-gpx.png)

Which is great, because it syncs with Strava and Komoot:

![alt text](/blog_img/selfh/umbrel-os/wanderer-integrations.png)

Just in case you are concern

### SelfHosted WebAnalytics

Umami should be one of those **HomeLab essentials** tools to consider.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umami" title="Umami | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics" title="SelfHostable WebAnalytics Tools 🐋✅ ↗" >}}
{{< /cards >}}

<!-- ![Cookies Meme](/blog_img/web/COOKIES.jpg) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#better-webanalytics" title="Better web Analytics from 0525" image="/blog_img/web/COOKIES.jpg" subtitle="Post views distribution" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://github.com/Litlyx/litlyx" title="Litlyx Repo" image="/blog_img/web/weban/littlyx-weban.png" subtitle="How Litlyx web analytics looks" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/" title="Litlyx Post Views Distribution" image="/blog_img/web/weban/litlyx.png" subtitle="How could this not relate with Pareto?" >}}
{{< /cards >}}

> Powerful Analytics Solution. Setup in 30 seconds. Display all your data on a Simple, AI-powered dashboard. Fully self-hostable and GDPR compliant. Alternative to Google Analytics, MixPanel, Plausible, Umami & Matomo.

![Web Analytics with LunaLytics](/blog_img/selfh/HomeLab/weban-lunalytics.png)

![Ebook Landing + Umami Web Analytics](/blog_img/entrepre/product/ebook-umami.png)


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



For the **QR part**, you know that we have few solutions...

1. https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/QR_Gen.py

2. [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)

3. 

There are several open-source self-hostable link shortener tools you can consider, each with its unique features:

1. **Shlink**: A PHP-based link shortener that supports generating unique short codes or custom slugs. It collects anonymized visit stats and geolocates visitors. It offers a REST API, CLI tools, and Docker support for easy deployment. It uses modern technologies like Mezzio and Symfony and is MIT licensed.[1][3]

2. **Kutt**: A modern, free, and open-source URL shortener with features like custom domains, custom URLs, password protection, link expiration, private statistics, and an admin dashboard. It has a RESTful API and can be easily installed using Docker Compose.[5]

3. **YOURLS**: A well-established PHP-based URL shortener with features such as bookmarklets, developer API, detailed stats including referrers and geo-location, and extensibility through dozens of plugins. It is free, open source, and easy to self-host.[10]

4. **Shrink.io (shrtn.io)**: A lightweight, privacy-focused URL shortener using SQLite by default (so no database server is required) and deployable via Docker. It emphasizes ease of use, privacy, and developer-friendly features.[6]

5. Other notable mentions from a curated list include Polr, Lstu, Blink, and goshorly—all open source with various programming languages and features.[4][8]

These options provide scalable, customizable, and self-hostable link shortening solutions that you can deploy either via Docker or direct installation depending on your infrastructure and preferences.

For ease and feature richness, Shlink, Kutt, and YOURLS are highly recommended starting points for a self-hosted URL shortener.[1][5][10]

Among the popular open-source self-hosted link shorteners mentioned, some do offer QR code capabilities either built-in or through extensions/plugins:

1. **Shlink**: Provides built-in QR code generation for short URLs. When you create a short URL using Shlink, it can generate a corresponding QR code that you can share or embed. This is part of its feature set, making it convenient for print or mobile scanning use cases.[1][2]

2. **Kutt**: While Kutt does not include native QR code generation in its core, there are third-party tools or browser extensions available that can generate QR codes for any URL, including Kutt short links. Some community forks or plugins might add this feature. Officially, out-of-the-box QR codes are not a core feature.[3]

3. **YOURLS**: YOURLS does not include native QR code generation by default, but there are several plugins created by the community that add QR code functionality to YOURLS short URLs. This extensibility allows you to add QR generation if needed.[4]

4. Other lesser-known tools like Blink or Polr may have QR features built-in or via plugins, but the top three mentioned mostly rely on either built-in Shlink support or plugins for YOURLS for QR capabilities.[5][6]

To summarize, **Shlink** stands out as the self-hosted URL shortener with built-in QR code generation. 

For YOURLS, you can enable QR codes through community-developed plugins, while Kutt typically requires external QR code tools. 

This makes Shlink a strong candidate if QR code functionality is a priority alongside link shortening.


---

## Conclusions


### SteamOS

Recently there was a release of SteamOS: https://store.steampowered.com/steamos/

And they have launched a small console, that reminds me to the shape/form factor of my x300 (SFF).

Apparently, that OS is arch based, and I could not resist to try it.


---

## FAQ

### Gotify x Watchtower

Thanks to DbTech's video:


<!-- https://www.youtube.com/watch?v=mIVHxFrFKqQ -->

{{< youtube "mIVHxFrFKqQ" >}}


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/gotify/" title="Gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/watchtower/" title="Watchtower | Docker Config 🐋 ↗" >}}
{{< /cards >}}



{{< callout type="warning" >}}
I prefer Watchtower to send alerts on new images, rather than letting update them automatically. I had problems with a Nextcloud Update long back!
{{< /callout >}}

### Programmatic DNS updates

* https://developers.cloudflare.com/api/resources/dns/
* https://github.com/cloudflare/cloudflare-python

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-dns-scripts" title="Cloudflare x Porkbun DNS API Py Scripts ↗" >}}
{{< /cards >}}