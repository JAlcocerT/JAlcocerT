---
title: "Crafting a Website for Knitting. Blog and more. "
date: 2024-09-23
draft: false
tags: ["dev","SSG","Astro"]
descripton: 'SquareSpace to Cloudflare. From Firebase and Google Domains to Web a with Cloudflare Pages'
url: 'squarespace-to-cloudflare-website'
---

Continue with the free option.

Now you need to go to the **SquareSpace UI**, select the domain and go to: `DNS` -> `Domain NameServers`.

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

![Custom Domain CKC - DNS Records Working](/blog_img/web/success2-ckc/CF-WnP-DNS-CKC.png)

## CKC Conclusions

CozyKnittingClub website is updated!

{{< details title="Website Checks before delivery 📌" closed="true" >}}

Once deployed:

```sh
npm install
npm run dev
#npm run build
```

```sh
npm install -g http-server
http-server dist #http-server .vercel/output/static

# npm install -g serve #serve the built files with npm
# serve -s dist #http://localhost:3000
```

As per the [general webs checks docs](https://jalcocert.github.io/JAlcocerT/create-your-website/#is-my-website-performing-well).


1. Sitemap and Robots:

```sh
curl -s https://cozyknittingclub.com/sitemap.xml -o /dev/null -w "%{http_code}\n" #200, OK!
```

```sh
curl -s https://cozyknittingclub.com/robots.txt | head -n 10 #see the first 10 lines
```

2. Notify Search engines:

```sh
#curl "https://www.google.com/ping?sitemap=https://cozyknittingclub.com/sitemap.xml"
curl "https://www.bing.com/ping?sitemap=https://cozyknittingclub.com/sitemap.xml"
```

3. [WebCheck.xyz](https://web-check.xyz/check/https%3A%2F%2Fdm-real-estate.com%2F)

4. **DNS Config**: The site is accesible from the base domain name as well as the `www.` subdomain

{{< /details >}}

{{< callout type="info" >}}
Once connected, **the final result**: https://cozyknittingclub.com as per [repo](https://github.com/JAlcocerT/cozyknittingclub-web) 💻
{{< /callout >}}


### Proposed Themes

For this knitting site, I proposed to go with:

1. Astro Stablo

2. [Astro Foxi](https://github.com/alexadark/foxi-astro)
  
* https://github.com/oxygenna-themes/foxi-astro-theme

3. Others
* [Pacamara](https://github.com/palmiak/pacamara-headless)
* [AllMyLinks](https://github.com/SofiDevO/allmylinks)
* https://github.com/ouranoshong/astro-melody-starter

Which its similar to Visvrs ([AstroVerse](https://github.com/penboxlab/astroverse))

4. **The winner**: [Astro Minimma](https://github.com/iamnyasha/minimma)