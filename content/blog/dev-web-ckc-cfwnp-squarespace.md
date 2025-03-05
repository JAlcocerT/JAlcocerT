---
title: "Crafting a Website for Knitting. Blog and more. "
date: 2024-09-23
draft: false
tags: ["dev"]
summary: 'SquareSpace to Cloudflare. From Firebase and Google Domains to Web a with Cloudflare Pages'
url: 'squarespace-to-cloudflare-website'
---

Continue with the free option.

Now you need to go to the SquareSpace UI, select the domain and go to: `DNS` -> `Domain NameServers`.

Select `Use custom nameservers`, we will replace the `ns-cloud-b1.googledomains.com` and so on, with the ones that cloudflare assigns.

There will be 2 records, like: `fattouche.ns.cloudflare.com`

The CKC website is completed and visible at Cloudflare Pages: https://cozyknittingclub-web.pages.dev/

![Uptime Ira](/blog_img/web/success2-ckc/Cloudflare-SquareSpace-DNS.png)

![Uptime Ira](/blog_img/web/success2-ckc/Cloudflare-SquareSpace-DNSChange.png)

![Change the NameServer to Cloudflare Ones](/blog_img/web/success2-ckc/Cloudflare-SquareSpace-DNSChangeUpdate.png)

![alt text](/blog_img/web/success2-ckc/CKC-CFWnP-Github.png)

![alt text](/blog_img/web/success2-ckc/CKC-Deployed.png)

Once updated, we can **connect** the real domains with the build.

> You will need to point a **CNAME** DNS Record from @ to `cozyknittingclub-web.pages.dev` (They worked proxied and non proxied).

![alt text](/blog_img/web/success2-ckc/CF-WnP-DNS-CKC.png)

{{< callout type="info" >}}
Once connected, **the final result**: https://cozyknittingclub.com as per [repo](https://github.com/JAlcocerT/cozyknittingclub-web) 💻
{{< /callout >}}


### Proposed Themes

For this knitting site, I proposed to go with:

1. Astro Stablo

2. https://github.com/ouranoshong/astro-melody-starter

Which its similar to Visvrs ([AstroVerse](https://github.com/penboxlab/astroverse))

* [Astro Foxi](https://github.com/alexadark/foxi-astro)
    * https://github.com/oxygenna-themes/foxi-astro-theme
* [Pacamara](https://github.com/palmiak/pacamara-headless)
* [AllMyLinks](https://github.com/SofiDevO/allmylinks)