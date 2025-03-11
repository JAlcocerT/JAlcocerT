---
title: "What I've learnt about Websites"
date: 2024-09-04T10:20:21+01:00
draft: false
tags: ["dev"]
summary: 'Interesting stuff Ive learn along the way when trying to make better Websites. A Non-WebDev perspective.'
url: 'create-your-website'
---

You can create **cool static websites** with these SSG frameworks.

And also with [Remix](https://github.com/jacob-ebey/remix-ssg).

Which **frameworks**? 

* https://bestofjs.org/rankings/monthly/2025/1

I mean, with: HUGO, Astro, NodeJS, jekyll...

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101" >}}
{{< /cards >}}

And if you are new to Websites, do it (The Web [Deployment](#select-the-deployment-method)) with [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/) to get a free subdomain with it.

If you come from a Data Analytics domain and this sounds too far out of reach. You are wrong.

I discovered static sites thanks to using first [Flexdashboards in R language](https://jalcocert.github.io/JAlcocerT/guide-r-flexdashboards-in-github-pages/).

These dashboards are consolidated into **"just" html information**, like static sites.

And you bet, they are **cool and functional**.

## Features for Webs

**Features** that *most likely*, you will want on your Website:

0. **Pre-Requisites**: Fast and Secure (SSL, https)
1. Search: Pagefind, FuseJS,...
2. Scheduled Posts
3. Internationalization (i18n)
4. A CDN?
5. APIs: [Forms, Newsletters](https://jalcocert.github.io/JAlcocerT/blog/dev-forms/), email marketing...



{{< details title="How to get OpenGraph - OGImage right 📌" closed="true" >}}

* As seen in [Web3Templates - Stablo Theme](https://github.com/IoTechCrafts/stablo-astro-SSG) or in [AstroVerse/VisVRS](https://github.com/IoTechCrafts/astroverse)
* For HUGO, [HUGO Theme Gallery](https://github.com/nicokaiser/hugo-theme-gallery) has OG done right
{{< /details >}}

{{< callout type="info" >}}

{{< /callout >}}


{{< details title="How to Include Search to SSGs 📌" closed="true" >}}

| **Description**                        | **Link**                                   |
|----------------------------------------|--------------------------------------------|
| PageFind with Astro      | [VisVRS/AstroVerse Example](https://github.com/IoTechCrafts/astroverse)    |
| FuseJS with Astro      | [AstroEngineeringBlog Example](https://github.com/EddyVinck/astro-engineering-blog)    |
| FuseJS with HUGO      | [AstroEngineeringBlog Example](https://github.com/EddyVinck/astro-engineering-blog)    |
| Ghost                | [Compose Overview](https://docs.docker.com/compose/) |


{{< /details >}}

And some **add-ons**:

1. Calendar meetings: see [cal.com](https://cal.com/jalcocertech/consulting)
2. Newsletters: see [mailerlite.com](https://www.mailerlite.com/invite/225babb421546)
3. Payments? Try stripe *which links with paypal, bank accounts, CC's*
4. Web Analytics - Id go for GDPR compliant and cookieless, like: umami, tianji
5. Uptime Monitoring
6. Chatbot with AI?
7. *Optional:* Social Contacts,...

---

## Deployments


{{% steps %}}

### Select a SSG

Choose the SSG (Hugo, Astro,...)
And find/create a theme you like

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

* [Firebase](https://fossengineer.com/hosting-with-firebase/)
* [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/) or Gitlab Pages
* Cloudflare: [CLI](https://fossengineer.com/hosting-with-cloudflare-pages/) or [CF connected to a GH Repo](https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages/#cloudflare-pages-vs-other-free-deployment-methods)
* AWS S3 Buckets - https://blog.cavelab.dev/2021/08/deploying-hugo-blog-to-s3/
* Others: Vercel, Netlify,...
* [SelfHosting Static Websites](https://fossengineer.com/hosting-static-websites/)! 

> See a [benchmark of **Static Hosting**](https://simplyexplained.com/blog/benchmarking-static-website-hosting-providers/)

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

{{< /details >}}

### Get Better at Webs

1. An overview of JS and CSS is always good!

{{< cards cols="2" >}}
  {{< card link="https://roadmap.sh/frontend" title="Front End RoadMap" >}}
  {{< card link="https://roadmap.sh/backend" title="Back End RoadMap" >}}
{{< /cards >}}

{{< callout type="info" >}}
Some [**CSS**](https://jalcocert.github.io/JAlcocerT/blog/dev-css/) will do the Trick. As well as [**JS** libraries](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites) like: PhotoSwipe,...
{{< /callout >}}

https://stateofjs.com/en-US

2. **Web Analytics**: you have **several options**, like [Umami](https://fossengineer.com/selfhosting-umami-with-docker/) or Tianji *as alternatives to Google Analytics.*


{{% /steps %}}

{{< youtube OaQO5gSpE4g >}}
<!-- https://www.youtube.com/watch?v=OaQO5gSpE4g&pp=ygUXZnJlZWNvZGVjYW1wIGNzcyBjb3Vyc2U%3D -->


## Setup a Static CMS

There are [many CMS alternatives](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites)!

1. Payload - https://github.com/payloadcms/payload
2. KeyStatic CMS - *As seen with Mizar landing Theme*
3. TinaCMS - 

---

## FAQ

{{< details title="Enhancing a Website - Comments, CDN and Videos... 📌" closed="true" >}}

1. Comments -  https://blog.cavelab.dev/2022/01/comments-again/

2. CDN and Videos for your Website: https://github.com/orthdron/subatic - Extremely simple video hosting Site that scales with you

{{< /details >}}


{{< details title="How to Optimize Web Images - WebP 📌" closed="true" >}}

* https://simplyexplained.com/blog/implementing-webp-images-on-eleventy-site/

{{< /details >}}


{{< details title="Better Colors for your website 📌" closed="true" >}}

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
 
https://github.com/adobe/leonardo?ref=fossengineer.com - 

> Apache v2 | Generate colors based on a desired contrast ratio

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

For **regular ICONS**:

1. [Iconify](https://github.com/iconify/iconify) is a great place to start.

> MIT | Universal icon framework. One syntax for FontAwesome, Material Design Icons, DashIcons, Feather Icons, EmojiOne, Noto Emoji and many other open source icon sets ([over 150 icon sets and 200k icons](https://github.com/iconify/icon-sets)). SVG framework, React, Vue and Svelte components!

2.  https://github.com/pqoqubbw/icons

> MIT | beautifully crafted animated icons

3. https://github.com/lucide-icons/lucide

> ISC | Beautiful & consistent icon toolkit made by the community. Open-source project and a fork of Feather Icons.

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

1. https://pagespeed.web.dev/

See also https://search.google.com/search-console/


{{< details title="Check that the SiteMap Works 📌" closed="true" >}}

```sh
#curl -s https://example.com/sitemap.xml -o /dev/null -w "%{http_code}\n"
curl -s https://jalcocertech.xyz/sitemap.xml -o /dev/null -w "%{http_code}\n" #200 means its there!
curl -s https://cyclingthere.com/sitemap.xml -o /dev/null -w "%{http_code}\n"
curl -s https://cyclingthere.com/sitemap-index.xml -o /dev/null -w "%{http_code}\n" #its here!
curl -s https://iotechcrafts.com/sitemap.xml -o /dev/null -w "%{http_code}\n" 

curl -s https://fossengineer.com/sitemap.xml -o /dev/null -w "%{http_code}\n" #hugo paper mod has it

#optional - check robots.txt
curl -s https://jalcocertech.xyz/robots.txt | grep -i sitemap #look for sitemap direction
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

Not all the content is indexed in the same way across engines and you can miss valuable info.

{{< callout type="info" >}}
**Thanks to Ecosia** I could find how to add Web Analytics to the [Jekyll Chirpy Theme](https://jalcocert.github.io/JAlcocerT/raspberrypi-starting-guide/)!
{{< /callout >}}

{{< /dropdown >}}

3. https://www.websitecarbon.com/

4. https://github.com/Lissy93/web-check
    * https://web-check.xyz/

> MIT | 🕵️‍♂️ All-in-one OSINT tool for analysing any website

5. See how a linkshortener see your site: https://dub.co/

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

Then, Try with:

1. [Wordpress](https://fossengineer.com/selfhosting-wordpress-docker/) or [Ghost](https://fossengineer.com/selfhosting-ghost-docker/)

2. [Instant Land](https://instant-land.cybrarist.com/installation/portainer.html)

> GPL3.o | Create, Copy, Modify landing pages for all your needs 

3. [Writefreely](https://github.com/writefreely/writefreely) (but does not provide a docker container for a quick spin)

> aGPL3 | A clean, Markdown-based publishing platform made for writers. Write together and build a community. Does NOT provide a clear container for SelfHost.

4. **Other ways to get a personal blog**
  * [btw](https://github.com/btw-so/btw)
  * [Grav](https://fossengineer.com/selfhosting-grav-docker/)

### The Small Web

A very interesting concept, for **minimalistic sites**:

* https://erikjohannes.no/posts/20231122-places-to-discover-the-small-web/
* https://1mb.club/
* https://btxx.org/posts/bare/