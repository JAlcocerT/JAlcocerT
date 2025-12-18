---
title: "What I've learnt about Websites"
date: 2024-09-04T10:20:21+01:00
draft: false
tags: ["dev"]
summary: 'Interesting stuff Ive learn along the way when trying to make better Websites. A Non-WebDev perspective.'
url: 'create-your-website'
---

I discovered static sites thanks to using first [Flexdashboards in R language](https://jalcocert.github.io/JAlcocerT/guide-r-flexdashboards-in-github-pages/).

These dashboards are consolidated into **"just" html information**, like static sites.

And you bet, they are **cool and functional**. 

Plus, they can be deployed as a static web.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/listmonk/listmonk-api-py/Ebook-cover-SSGs.pdf" title="Get an ebook to get started with Websites" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Stop being lazy and start building websites" >}}
{{< /cards >}}


**Icons and fonts?**

* https://github.com/pheralb/svgl
  * https://svgl.app/directory/database

> MIT | 🧩 A beautiful library with SVG logos. Built with Sveltekit & Tailwind CSS. 

* https://github.com/akveo/eva-icons

> MIT | A pack of more than 480 beautifully crafted Open Source icons. SVG, Sketch, Web Font and Animations support.

* https://fonts.google.com/


**Where to get Domains?**

If you are new and are just trying, you can get a `.fyi` or `.lol` TLD for few $.

* https://porkbun.com/api/json/v3/documentation#Domain%20Pricing
* Cloudflare domains...
* https://account.squarespace.com/
* https://developer.godaddy.com/getstarted
* Hostinger

![Buying a domain via Porkbun UI](/blog_img/dev/porkbun/4-porkbun-buy-ui.png)



<!-- * Where to get **Free SVGs for HUGO**:
  * https://www.svgrepo.com/svg/424489/adventure-journey-location
  * https://fontawesome.com/
    * https://fontawesome.com/search?q=triangle-exclamation&o=r&m=free

* How to choose proper HEX colors:
  * https://github.com/Toinane/colorpicker -  A mininal but complete colorpicker desktop app 
    * https://colorpicker.fr/app/ - you can try it online as well
  * https://github.com/eigenmiao/rickrack -  Generate harmonious colors freely. 
  * https://huey.design/

* https://colorpicker.fr/app/
* https://huey.design/
* https://leonardocolor.io/#
  * https://github.com/adobe/leonardo -  Generate colors based on a desired contrast ratio  - Apache v2
   -->

You can create **cool static websites** with these SSG frameworks below.

And also with [Remix](https://github.com/jacob-ebey/remix-ssg).

Which **frameworks**? 

* https://bestofjs.org/rankings/monthly/2025/1

I mean, with: HUGO, Astro, Gatsby, NodeJS, jekyll...

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101 ↗" >}}
{{< /cards >}}

```sh
npm run dev -- --host 0.0.0.0 --port 4321

npm run build
sudo npm run preview -- --host 0.0.0.0 --port 8080
npx serve -s dist -l 8080
sudo python3 -m http.server 80 --directory dist


hugo server --bind="0.0.0.0" --baseURL="http://192.168.1.11" --port=1313
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web" title="Web Related Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/StaticWebServer" title="Selfhosted Static Hosting - Docker Configs 🐋 ↗" >}}
{{< /cards >}}

You can also put Astro/HUGO inside a container as seen:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-astro" title="Astro SSG | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/WebGenerAItor/blob/main/docker-compose.yml" title="Selfhosted Static Hosting - Docker Configs 🐋 ↗" >}}
{{< /cards >}}


And if you are new to Websites, do it (The Web [Deployment](#select-the-deployment-method)) with [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/) to get a free subdomain with it.

> If you come from a Data Analytics domain and this sounds too far out of reach.

> > You are wrong. Specially with vibecoding.


## Features for Webs

**Features** that *most likely*, you will want on your Website:

0. **Pre-Requisites**: Fast and Secure (SSL, https)
1. Search: Pagefind, FuseJS,...
2. Scheduled Posts
3. Internationalization (i18n)
4. A CDN?
5. APIs: [Forms, Newsletters](https://jalcocert.github.io/JAlcocerT/blog/dev-forms/), email marketing...

{{< details title="How to get OpenGraph - OGImage right 📌" closed="true" >}}

See: https://blog.otterlord.dev/posts/dynamic-opengraph/

* As seen in [Web3Templates - Stablo Theme](https://github.com/IoTechCrafts/stablo-astro-SSG) or in [AstroVerse/VisVRS](https://github.com/IoTechCrafts/astroverse)
* For HUGO, [HUGO Theme Gallery](https://github.com/nicokaiser/hugo-theme-gallery) has OG done right
{{< /details >}}

{{< callout type="info" >}}
That make a website much cooler!
{{< /callout >}}


{{< details title="How to Include Search to SSGs 📌" closed="true" >}}

| **Description**                        | **Link**                                   |
|----------------------------------------|--------------------------------------------|
| PageFind with Astro      | [VisVRS/AstroVerse Example](https://github.com/IoTechCrafts/astroverse)    |
| FuseJS with Astro      | [AstroEngineeringBlog Example](https://github.com/EddyVinck/astro-engineering-blog)  or [celestial docs](https://github.com/HYP3R00T/CelestialDocs)  |
| FuseJS with HUGO      | [HUGO PaperMod](https://github.com/EddyVinck/astro-engineering-blog)    |


{{< /details >}}

And some **add-ons**:

1. Calendar meetings: see [cal.com](https://cal.com/jalcocertech/consulting)
2. Newsletters: see [mailerlite.com](https://www.mailerlite.com/invite/225babb421546)
3. Payments? Try stripe *which links with paypal, bank accounts, CC's*
4. Web Analytics - Id go for GDPR compliant and cookieless, [like: umami, tianji,...](https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics)
5. Uptime Monitoring
6. Chatbot with AI?
7. *Optional:* Social Contacts,...
8. All links up and running as per [Linkckchecker](https://github.com/IoTechCrafts/linkchecker)
---

## Deployments


{{% steps %}}

### Select a SSG

Choose the SSG (Hugo, Astro,...)

And find/create/tweak a theme you like!

### Tweak the Theme and Build

Tweak the theme so that it looks even better

> Make sure that the preview works!

### Local build and last check

```sh
#option1
cd public
python3 -m http.server 8099 #8000

#option2
npm install -g http-server
http-server -p 8000
```

### Select the Deployment Method

There are few [alternatives to **host a static website**](https://fossengineer.com/alternatives-for-hosting-static-websites/):

* [SelfHosting Static Websites](https://fossengineer.com/hosting-static-websites/)! 
  * [Firebase](https://fossengineer.com/hosting-with-firebase/)
  * [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/) or Gitlab Pages
  * Cloudflare: [CLI](https://fossengineer.com/hosting-with-cloudflare-pages/) or [CF connected to a GH Repo](https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages/#cloudflare-pages-vs-other-free-deployment-methods)
  * AWS S3 Buckets - https://blog.cavelab.dev/2021/08/deploying-hugo-blog-to-s3/
* Others: Vercel, Netlify,... See a [benchmark of **Static Hosting**](https://simplyexplained.com/blog/benchmarking-static-website-hosting-providers/)
  * Even the [IPFS/Web3 approach](https://jalcocert.github.io/JAlcocerT/guide-web3/)!

> In case that you would like to skip the hosting cost, you can look to `https://porkbun.com/products/webhosting/staticHosting`

You can have your own static deployment into a web server or use any of these *serverless static deployment*.

{{< details title="Free SSG Deployment - Firebase CLI, Cloudflare Wrangler CLI...📌" closed="true" >}}

1. With **Firebase**, the Free Tier allows for up to 10GB for ppl to download your content.

> Per month, and at least at the time of writing. This might (or not) change.

```sh
#npm install -g firebase-tools
#firebase login

firebase init #configure files for firebase hosting / public directory is normall public for HUGO and dist for Astro/nodes
firebase deploy #you will get something like -> https://jalcocertech.web.app/
```

2. You can also try with [Cloudflare **Workers and Pages**](https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages/#faq) or [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/).

Alternatively, you can use [Cloudflare wrangler CLI](https://fossengineer.com/hosting-with-cloudflare-pages/#cloudflare-pages-hosting-with-wrangler) to get your SSG hosted, also for free and a custom subdomain.


```sh
#npm run build
npx wrangler pages project create #ourika
#https://developers.cloudflare.com/pages/configuration/build-configuration/#framework-presets
npx wrangler pages deploy dist # deploy ./dist


#npx wrangler pages project list
#npx wrangler pages deployment list

#npx wrangler pages project delete your_project_name
```

{{< /details >}}

### Get Better at Webs

You can get away with [front-end](https://jalcocert.github.io/JAlcocerT/front-end-and-auth/) only, but to do cooler functionalities you will need some [back-end](https://jalcocert.github.io/JAlcocerT/backend-alternatives/) tricks.

1. An overview of [JS](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites) and [CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-web-code-css/) is always good!

2. **Web Analytics**: you have **several options**, like [Umami](https://fossengineer.com/selfhosting-umami-with-docker/) or Tianji *as alternatives to Google Analytics.*

{{% /steps %}}

{{< youtube OaQO5gSpE4g >}}
<!-- https://www.youtube.com/watch?v=OaQO5gSpE4g&pp=ygUXZnJlZWNvZGVjYW1wIGNzcyBjb3Vyc2U%3D -->




## Setup a Static CMS

There are [many CMS alternatives](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites)!

1. Payload - https://github.com/payloadcms/payload
2. KeyStatic CMS - *As seen with Mizar landing Theme*
3. TinaCMS
4. DIY CMS :)
5. Decap-CMS!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-cms-101/" title="CMS 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}

---

## FAQ

{{< details title="Enhancing a Website - Comments, CDN and Videos... 📌" closed="true" >}}

1. Comments -  https://blog.cavelab.dev/2022/01/comments-again/

2. CDN and Videos for your Website: https://github.com/orthdron/subatic - Extremely simple video hosting Site that scales with you

{{< /details >}}


{{< details title="How to Optimize Web Images - WebP 📌" closed="true" >}}

* https://simplyexplained.com/blog/implementing-webp-images-on-eleventy-site/

{{< /details >}}

* https://it-tools.tech/color-converter

{{< details title="Better Colors for your website | Branding Color selection 📌" closed="true" >}}

1. How to get the **HEX colors** of websites - [SmartColorPicker extension](https://chromewebstore.google.com/detail/smart-color-picker/ilifjbbjhbgkhgabebllmlcldfdgopfl?hl=en)

2. Explore HEX colors with [Color Picker Chrome extension](https://chromewebstore.google.com/detail/color-picker-chrome-exten/apldhonppojnaadpeoghllcjealkkmem?gad_source=1&gclid=Cj0KCQjwveK4BhD4ARIsAKy6pMKC6wDlkEkSh9SsQ9wirszcseVvgQ1BAuWXai5FtBzsS66YMrB65YsaAp95EALw_wcB)

3. https://github.com/eigenmiao/Rickrack

```sh
snap install rickrack
```

>  Generate harmonious colors freely on your desktop

4. https://colorpicker.fr/app/?ref=fossengineer.com

5. https://huey.design/?ref=fossengineer.com

6. https://leonardocolor.io?ref=fossengineer.com
 
* https://github.com/adobe/leonardo?ref=fossengineer.com
  * And can be use freely from: https://leonardocolor.io/theme.html#

> **Apache v2** | Generate colors based on a desired contrast ratio

7. See more [here](https://fossengineer.com/nextjs-ssg/#icons-for-nextjs)

{{< /details >}}

You need **markdown** for these SSGs. And there are cool **markdown tools**:

1. https://github.com/Cveinnt/LetsMarkdown.com

```sh
docker run --rm -dp 3030:3030 cveinnt/letsMarkdown
```

2. https://github.com/joemccann/dillinger

> MIT | The last Markdown editor, ever.


### Icons and FavIcons

For emojis and markdown icons:

* https://it-tools.tech/emoji-picker
* https://gist.github.com/rxaviers/7360908

For **regular ICONS**:

1. [Iconify](https://github.com/iconify/iconify) is a great place to start.

> MIT | Universal icon framework. One syntax for FontAwesome, Material Design Icons, DashIcons, Feather Icons, EmojiOne, Noto Emoji and many other open source icon sets ([over 150 icon sets and 200k icons](https://github.com/iconify/icon-sets)). SVG framework, React, Vue and Svelte components!

2.  https://github.com/pqoqubbw/icons

> MIT | beautifully crafted animated icons

3. https://github.com/lucide-icons/lucide

> ISC | Beautiful & consistent icon toolkit made by the community. Open-source project and a fork of Feather Icons.

4. https://github.com/tabler/tabler-icons

> MIT | A set of over 5800 free MIT-licensed high-quality SVG icons for you to use in your web projects.



4. Images for Web:
- [Unsplash](https://unsplash.com/)
- [Heroicons](https://heroicons.dev/)
- [Feathericons](https://feathericons.dev/?iconset=payments)


At the moment when you will need **proper FAVICONS**:


{{< details title="About favicons 📌" closed="true" >}}

As seen in the [withastro/starlight Theme](https://github.com/IoTechCrafts/starlight-SSG) or Pacamara

* https://mariushosting.com/how-to-install-favicon-downloader-on-your-synology-nas/
* https://github.com/seadfeng/favicon-downloader

{{< /details >}}

1. FavYcon - https://github.com/ruisaraiva19/favycon

> MIT |  Favycon - A favicon generator tool. Discovered thanks to this Hextra theme!

2.  Real Fav Icon Generator 😍 and place in the the proper folder (where the default icons are on your Theme).

3. Cool FavIcon with: https://favicon.io/favicon-converter/ - You can upload an image, then you will get the `favicon.ico` and other artifacts to make the web icons look amazing in any device.

**How to add favicons** to your SSG?

* Go to the theme folder
* Add a `./static` folder
* Add the files generated with the website

### Is my website performing well?

How about checking your new website against few tools:

{{< hextra/feature-grid >}}
 
{{< hextra/feature-card
  title="Google Speed Test"
  subtitle="Test the speed and performance with PageSpeed Insights."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://pagespeed.web.dev/"
>}}

{{< hextra/feature-card
  title="Website Carbon"
  subtitle="Website’s carbon footprint and environmental impact."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(142,53,74,0.15),hsla(0,0%,50%,0));"
  link="https://www.websitecarbon.com/"
>}}

{{< hextra/feature-card
  title="Web-Check"
  subtitle="Performance and uptime using Web-Check's analytics tool."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://web-check.xyz/"
>}}

{{< /hextra/feature-grid >}}

{{< cards cols="1" >}}
  {{< card link="https://trends.google.com/trends/" title="Whats Trendy on Google? ↗" >}}
  {{< card link="https://search.google.com/" title="How is your site SEO doing? Google Search ↗" >}}
{{< /cards >}}

![AI Trend in Google Search late 2025](/blog_img/GenAI/ai-trend.png)

![alt text](/blog_img/dev/google-search.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/linkchecker/" title="LinkChecker | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/webcheck/" title="WebCheck | Docker Config 🐋 ↗" >}}
{{< /cards >}}


1. https://pagespeed.web.dev/

See also https://search.google.com/search-console/


{{< details title="Check that the SiteMap Works 📌" closed="true" >}}

```sh
#curl -s https://example.com/sitemap.xml -o /dev/null -w "%{http_code}\n"
curl -s https://jalcocertech.com/sitemap.xml -o /dev/null -w "%{http_code}\n" #200 means its there!
curl -s https://cyclingthere.com/sitemap.xml -o /dev/null -w "%{http_code}\n"
curl -s https://cyclingthere.com/sitemap-index.xml -o /dev/null -w "%{http_code}\n" #its here!
curl -s https://iotechcrafts.com/sitemap.xml -o /dev/null -w "%{http_code}\n" 

curl -s https://fossengineer.com/sitemap.xml -o /dev/null -w "%{http_code}\n" #hugo paper mod has it

#optional - check robots.txt
curl -s https://jalcocertech.com/robots.txt | grep -i sitemap #look for sitemap direction
curl -s https://iotechcrafts.com/robots.txt | head -n 10 #see the first 10 lines

#example of path with robots
curl -s https://bachatafests.com/sitemap.xml -o /dev/null -w "%{http_code}\n"
curl -s https://bachatafests.com/robots.txt | head -n 10 #see the first 10 lines
curl -s https://bachatafests.com/robots.txt | grep -i sitemap #look for sitemap direction
curl -s https://bachatafests.com/sitemap_index.xml -o /dev/null -w "%{http_code}\n"
```

> Search for any **references to a sitemap URL** within the `robots.txt` file.

If found sth, you can use that URL to check for the sitemap instead!

{{< /details >}}


2. https://trends.google.es/trends/


{{< dropdown title="Notify Google/Bing about your Website Changes based on the sitemap 📌" closed="true" >}}

There are some **Interesting Search Engines** available:

* Ecosia.org / qwant.com / Brave / DuckDuckGo / ...
* [Whoogle/SearXNG](https://jalcocert.github.io/RPi/posts/selfh-internet-better/)
* Bing 

And for you to get traffic, you need SE to be aware of your awsomeness:

1. To ping **Google's engine** to review your site's sitemap:

```sh
curl "https://www.google.com/ping?sitemap=https://www.example.com/sitemap.xml"
```

2. Don't forget about **Bing Search** as well:

```sh
curl "https://www.bing.com/ping?sitemap=https://www.example.com/sitemap.xml"
``` 

It's worth to **try few of them**.

{{< /dropdown >}}

3. https://www.websitecarbon.com/

4. https://github.com/Lissy93/web-check
    * https://web-check.xyz/

> MIT | 🕵️‍♂️ All-in-one OSINT tool for analysing any website

5. See how a linkshortener works for your site

6. Does the site have **[Broken Links](https://fossengineer.com/nextjs-ssg/#do-i-got-any-broken-links)?**

```sh
#podman run --rm -it ghcr.io/linkchecker/linkchecker:latest --verbose https://jalcocert.github.io/JAlcocerT/ > linkchecker_output.txt
docker run --rm -it -u $(id -u):$(id -g) ghcr.io/linkchecker/linkchecker:latest --verbose https://www.example.com
```

You will get a summary in the end of the file with:

```txt
Statistics:
Downloaded: 26.0MB.
Content types: 234 image, 202 text, 0 video, 0 audio, 8 application, 0 mail and 2209 other.
URL lengths: min=14, max=880, avg=58.

That's it. 2653 links in 2653 URLs checked. [1;33m20 warnings found[0m. [1;31m24 errors found[0m.
Stopped checking at 2025-03-05 10:43:17+000 (3 minutes, 9 seconds)
```

> You can use [LinkChecker within a GHA workflow](https://github.com/JAlcocerT/JAlcocerT/blob/main/.github/workflows/pages.yaml#L57)



### Other Software to Create a Web Pages

Does all of this **sounds too complex** for the first website?

Learn web development basics or go for that wordpress.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/#is-my-website-performing-well" title="Web Performance | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/monitoring/" title="Monitoring | Docs ↗" icon="book-open" >}}
{{< /cards >}}

### The Small Web

A very interesting concept, for **[minimalistic](https://jalcocert.github.io/JAlcocerT/open-source-minimalist-websites/) sites**:

* https://erikjohannes.no/posts/20231122-places-to-discover-the-small-web/
* https://1mb.club/
* https://btxx.org/posts/bare/

I always enjoy finding this kind of blogs, with not many distractions and **pure content**:

* https://nav.al/existence

> I wish someday to get up to that point of quality.