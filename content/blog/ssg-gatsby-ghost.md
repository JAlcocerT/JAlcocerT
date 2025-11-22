---
title: "Gatsby SSG x Ghost"
date: 2025-11-17T23:20:21+01:00
draft: false
tags: ["Web","GatsbyJS x Ghost CMS","Gatsby PodCast"]
description: 'Using gatsby to create a static site from ghostCMS'
url: 'gatsby-ghost-integration'
---


**Intro**

Among all [SSGs](https://itsfoss.com/open-source-static-site-generators/) and their awsome ecosystem: https://github.com/myles/awesome-static-generators

I got recently one of them, Gatsby, to work with GhostCMS.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ghost" title="GhostCMS | Docker Config 🐋 ↗" >}}
{{< /cards >}}

I was recently tinkering here with [Ghost and its API](https://jalcocert.github.io/JAlcocerT/automating-ghost-and-wordpress/#programatic-ghost) for automatic post creation.


## About the Web


You know the drill: 

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



There is also a very important one: https://trends.google.com/trends/

* How is your site doing? https://search.google.com/



---

## Gatsby SSG

{{< youtube "RaTpreA0v7Q" >}}

<!-- 👉 <https://www.youtube.com/watch?v=RaTpreA0v7Q> -->


> **React based** framework (open source JS, Meta). <https://github.com/gatsbyjs/gatsby>

Load Data From Anywhere. Gatsby pulls in data from any data source, whether it’s Markdown files, a headless CMS like Contentful or WordPress, or a REST or GraphQL API.

Use source plugins to load your data, then develop using Gatsby’s uniform GraphQL interface.

Go Beyond Static Websites. 

Get all the benefits of static websites with none of the limitations.

Gatsby sites are fully functional React apps, so you can create high-quality, dynamic web apps, from blogs to e-commerce sites to user dashboards.

1. You need [nodejs](https://github.com/nodesource/distributions#installation-instructions) installed
2. Then see: https://github.com/gatsbyjs/gatsby


### About Gatsby plugins

Gatsby plugins are a fundamental part of the Gatsby ecosystem and play a crucial role in extending the functionality of your Gatsby site. 

They allow you to add various features, optimize performance, and integrate with external services. 

{{< dropdown title="More about Gatsby Plugins 👇" closed="true" >}}

1. **Content Sourcing**: Gatsby plugins can help you source content from various data sources, such as Markdown files, JSON, APIs, databases, or even content management systems (CMS) like WordPress, Drupal, or Contentful. Popular content-sourcing plugins include `gatsby-source-filesystem` and `gatsby-source-contentful`.

2. **Data Transformation**: You can use plugins to transform and manipulate data before it's used to generate pages. For example, you can use `gatsby-transformer-remark` to process Markdown files and convert them into HTML.

3. **Styling and CSS**: Gatsby plugins can be used to handle CSS and styling. `gatsby-plugin-sass`, `gatsby-plugin-styled-components`, and others help you manage styles in your Gatsby project.

4. **Image Optimization**: To optimize images for performance, you can use plugins like `gatsby-plugin-sharp` and `gatsby-transformer-sharp`. These plugins generate multiple image sizes and formats for your site, ensuring that the right image is served based on the user's device and screen size.

5. **SEO and Metadata**: Plugins like `gatsby-plugin-react-helmet` allow you to set up metadata and SEO tags (such as title, description, and Open Graph tags) for each page.

6. **Pagination**: If you have a blog or any content that requires pagination, there are plugins like `gatsby-plugin-pagination` that can help you set up pagination for your content.

7. **Forms**: To handle forms on your site, you can use plugins like `gatsby-plugin-netlify-cms` or `gatsby-plugin-formik`.

8. **Authentication and User Management**: Plugins like `gatsby-plugin-firebase` or `gatsby-plugin-auth0` can be used to integrate authentication and user management into your Gatsby site.

9. **Search Functionality**: Implementing search functionality can be done using plugins like `gatsby-plugin-elasticlunr-search` or `gatsby-plugin-lunr`.

<https://www.emgoto.com/gatsby-search/>

10. **Analytics and Tracking**: If you want to track user interactions and gather analytics data, plugins like `gatsby-plugin-google-analytics` or `gatsby-plugin-segment` can be helpful.

11. **Performance Optimization**: Gatsby is known for its performance, and you can further optimize it with plugins like `gatsby-plugin-offline` for offline support and `gatsby-plugin-preact` to reduce bundle size.

12. **Localization and Internationalization**: To make your site multilingual, you can use plugins like `gatsby-plugin-i18n` or `gatsby-plugin-react-i18next`.

13. **E-commerce Integration**: If you're building an e-commerce site, plugins like `gatsby-plugin-shopify` or `gatsby-source-stripe` can help you integrate with e-commerce platforms.

14. **Serverless Functions**: Gatsby supports serverless functions through plugins like `gatsby-plugin-functions`. You can create serverless API endpoints for dynamic functionality.

15. **Social Sharing**: To enable social sharing features, you can use plugins like `gatsby-plugin-social-sharing`.

16. **Customization**: You can also create your own Gatsby plugins to add custom functionality tailored to your specific needs.

{{< /dropdown >}}


Gatsby's extensive plugin ecosystem makes it a powerful tool for building modern, performant websites and web applications. 

You can easily find and install plugins from the Gatsby plugin library or create your own to extend your site's capabilities.

You can **find Gatsby plugins** in the official Gatsby plugin library. Here's how you can access it:

1. **Gatsby Plugin Library Website**: You can visit the official Gatsby plugin library website at [https://www.gatsbyjs.com/plugins/](https://www.gatsbyjs.com/plugins/). 

This website provides a searchable and categorized list of plugins that you can use in your Gatsby projects.

* <https://www.gatsbyjs.com/plugins/gatsby-source-custom-api/>

* https://www.gatsbyjs.com/plugins/gatsby-source-wordpress/

* https://www.gatsbyjs.com/plugins/gatsby-source-stripe/

* <https://www.gatsbyjs.com/plugins/@ccalamos/gatsby-source-googlemaps-static/?=google>

2. **Gatsby GitHub Repository**: Another way to discover Gatsby plugins is by visiting the Gatsby GitHub repository, specifically the "plugins" section. The repository is located at [https://github.com/gatsbyjs/gatsby](https://github.com/gatsbyjs/gatsby), and you can find plugins in the "plugins" directory.


* https://www.gatsbyjs.com/docs/how-to/images-and-media/using-gatsby-plugin-image/
* https://ghost.org/docs/jamstack/gatsby/?ref=gatsby.ghost.io#use-cases

### Understanding Gatsby

Gatsby is just another SSG based on NodeJS.

Install [nodejs](https://github.com/nodesource/distributions#installation-instructions), just like we did [here](https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/#moto-blogger-setup)


```sh
npm install
gatsby develop
```

If you thought that you were done understanding APIs just with REST, you were wrong. 

Gatsby uses GraphQL to fetch data from APIs.

And you could pull data from [dancing sites](https://www.bachatavilnius.lt/en/?action=createcache) to your dancing referal page.


**Deploying Gatsby**: Any [static hosting](https://jalcocert.github.io/JAlcocerT/create-your-website/#select-the-deployment-method) will do

* Github Pages
* Firebase
* Cloudflare Pages


## Themes for Gatsby

I Have found several cool ones here: https://statichunt.com/

Like https://statichunt.com/themes/nextjs-supastarter or https://statichunt.com/themes/gatsby-starter-flat-magazine

With source codes:

* https://github.com/damnitrahul/gatsby-starter-flat-magazine
* https://github.com/vojtaholik/gatsby-theme-simplecast Yes, [Podcasts](https://jalcocert.github.io/JAlcocerT/tech-for-podcast/) via Gatsby SSG too!

* https://jamstackthemes.dev/theme/gatsby-starter-ghost/
* https://gatsby.ghost.org/
* https://gatsby-casper.netlify.app/
* https://foundation.stackrole.com/
* https://github.com/stackrole/gatsby-starter-foundation
* https://jamstackthemes.dev/theme/gatsby-casper/
* https://github.com/scttcper/gatsby-casper

* https://github.com/yinkakun/gatsby-starter-glass

* https://github.com/chrisnmorrison/revista-gatsby-blog-magazine
* https://github.com/app-generator/gatsbyjs-starter-tailwindplay

* https://github.com/app-generator/gatsbyjs-starter-tailwindplay


### Podcasts in Gatsby

Similarly to [the AstroPod project](https://github.com/JAlcocerT/astropod), we have this in Gatsby:

```sh
git clone https://github.com/vojtaholik/gatsby-theme-simplecast

#yarn
```



* {{< newtab url="https://github.com/baobabKoodaa/gatsby-starter-photo-book" text="HUGO PaperMod" >}}
  * MIT ❤️
* https://github.com/baobabKoodaa/gatsby-starter-infinite-scroll
  * MIT ❤️
* {{< newtab url="https://github.com/flotiq/flotiq-gatsby-portfolio-2" text="HUGO PaperMod" >}}
  * Requires Flotiq CMS
  * Also available for NextJS


<!-- 
https://github.com/yinkakun/gatsby-starter-glass
https://github.com/Uvacoder/rocketdocs-starter?ref=statichunt.com -->

* <https://www.gatsbyjs.com/starters/>

* <https://github.com/search?q=gatsby+theme&type=repositories>

* https://github.com/TryGhost/gatsby-starter-ghost




* <https://gatsbytemplates.io/?ref=%22github%22>
* <https://github.com/vse-volod/gatsby-theme-massively/tree/master>
* <https://github.com/ImedAdel/gatsby-london>
  * <https://gatsby-london.netlify.app/>
* <https://github.com/stackrole/gatsby-starter-foundation>


### Portoflio Minimal

* https://github.com/konstantinmuenster/gatsby-theme-portfolio-minimal/tree/main

```sh
##rm -rf .git && git init

gatsby new portfolio-minimal https://github.com/konstantinmuenster/gatsby-starter-portfolio-minimal-theme
npm install
gatsby develop
gatsby develop -p 8001
gatsby build
```

If you want to **deploy statically** towards Google Firebase:

```sh
gatsby build

npm install -g firebase-tools
#firebase login
#firebase init

firebase deploy
```



## Gatsby 💗 ghost

As we saw, its not hard to [get started with Ghost](https://jalcocert.github.io/JAlcocerT/automating-ghost-and-wordpress/#ghost-setup).

Consider these for adding to GhostCMS:


* **`http://localhost:8000/`**
* **`http://localhost:8000/___graphql`**

* <https://www.gatsbyjs.com/docs/how-to/querying-data/running-queries-with-graphiql/>

### Starter Ghost

```sh
node -v
npm -v

npm install -g gatsby-cli

gatsby --version

##rm -rf .git && git init

gatsby new my-blog https://github.com/TryGhost/gatsby-starter-ghost
#gatsby new portfolio-minimal https://github.com/konstantinmuenster/gatsby-starter-portfolio-minimal-theme

cd my-blog

gatsby develop
gatsby develop -p 8001
gatsby build
```

This will start a development server, and you can view your blog at `http://localhost:8000`.

---

## Conclusions

Responsive Images can seem like a small thing, but it can make a big difference in the performance of your website.

See what [Mozilla thinks about them](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images).

  
#### Other Websites I've Built

* IOTECH - https://github.com/themefisher/bigspring-light-astro
    * https://iotechcrafts.com/blog/
* IORACING - https://github.com/zankhq/astros
    * https://ioracing-iotechcrafts.web.app/
        * EX - https://astro.build/themes/details/launchui/
        * https://iotechcrafts-ioracing.web.app/
* IODOCTOR - https://github.com/mickasmt/astro-nomy

* IOT - https://github.com/matt765/Tailcast
    * https://iot.iotechcrafts.com/

1. With an option to plug [adsense](https://adsense.google.com/adsense/) to each of this websites


{{< cards >}}
  {{< card link="https://cozyknittingclub.web.app/" title="Content Creator Blog" image="/blog_img/web/WebsSnapshots/Web_CKC.png" subtitle="For an instagramer who loves knitting" >}}
    {{< card link="https://dm-real-estate.com/" title="Real Estate Official Site" image="/blog_img/web/WebsSnapshots/Web_realestate.png" subtitle="A Real Estate Business Site for Spain" >}}
    {{< card link="https://ira-english.pages.dev/" title="Personal Business Landing" image="/blog_img/web/WebsSnapshots/Web_EnglishIra.png" subtitle="Landing Page for a well Known English Teacher" >}}
    {{< card link="https://jalcocert.github.io/Portfolio/" title="All your Links" image="/blog_img/web/WebsSnapshots/Web_PortfolioLinks.png" subtitle="Sleek collection of important Links" >}} 
  {{< card link="https://cyclingthere.pages.dev" title="Blog / Adventures" image="/blog_img/web/WebsSnapshots/Web_CyclingThere.png" subtitle="I can write and also create interesting photo galleries about my travel experiences" >}}
      {{< card link="https://morita-web.pages.dev//" title="Mental Health Care Site" image="/blog_img/web/WebsSnapshots/Web_Nevin.png" subtitle="Because the brain is as important as the body" >}}
{{< /cards >}}


**Photo centered blogs:**

{{< cards >}}
  {{< card link="https://cozyknittingclub.web.app/" title="Content Creator Blog" image="/blog_img/web/WebsSnapshots/Web_CKC.png" subtitle="For an instagramer who loves knitting" >}}
    {{< card link="http://entreagujaypunto.com/" title="Punto Photo Gallery" image="/blog_img/web/web-entreagujaypunto.png" subtitle="A Photo centered Web for Punto" >}}
    {{< card link="https://enjoylittlethings.org/" title="Travel Adict Photo Gallery" image="/blog_img/web/WebsSnapshots/Web_PhotoGalleryAGA.png" subtitle="Because Photo & Travel lovers need something more than instagram" >}}    
    {{< card link="https://while.cyclingthere.com" image="/blog_img/web/whilecycling.png" title="Photo Gallery Blog" subtitle="Made with HUGO and Photo centered" >}}
{{< /cards >}}

**Business Sites:**

{{< cards >}}
  {{< card link="https://iotechcrafts.web.app/" title="Business Website" image="/blog_img/web/WebsSnapshots/Web_IoTechCrafts.png" subtitle="A Website for Agency - AI & IoT Consulting Services">}}   
  {{< card link="https://iotiotechcrafts.web.app/" title="IoT SaaS Site" image="/blog_img/web/WebsSnapshots/web_iotiotech.png" subtitle="One Pager with FAQ and Pricing" >}} 
  {{< card link="https://iodoctor.iotechcrafts.com/" title="Doctor Consultation" image="/blog_img/web/WebsSnapshots/Web_IoDoctor.png" subtitle="Landing for Scheduling Doctor Appointments" >}}           
  {{< card link="https://iodoctor-iotechcrafts.web.app/" title="Web for Doctor Consultation" image="/blog_img/web/WebsSnapshots/web_iodoctors.png" subtitle="With Astro mdx blogs filtrable by tags and docs sections" >}}  
  {{< card link="https://ioracing-iotechcrafts.web.app/" title="IoT SaaS Site" image="/blog_img/web/WebsSnapshots/web_ioracing.png" subtitle="One Pager with FAQ, Pricing and MultiLang" >}}            
{{< /cards >}}



### How to monitor my Website Status?

You can with tools like [UptimeKuma](https://fossengineer.com/selfhosting-uptime-Kuma-docker/) 

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="UptimeKuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### what it is a CDN?

A CDN (Content Delivery Network) is:

- **A distributed network of servers** placed in many data centers around the world.  
- **Goal:** deliver web content (images, CSS/JS files, videos, HTML, APIs, etc.) to users **faster and more reliably**.

How a CDN works:

- **You request a file** (e.g. an image on a blog).  
- Instead of always coming from your origin server, the file is **cached on edge servers** of the CDN.  
- The CDN serves the file from the **closest edge location** to the user (geographically / network‑wise).  
- If it’s not cached yet, the CDN fetches it from the origin once, then caches it for future users.

**Why people use a CDN**

- **Speed:** lower latency, faster page load (better for UX and SEO).  
- **Offload origin:** fewer direct hits to your main server, saving bandwidth and CPU.  
- **Scalability:** easier to handle traffic spikes.  
- **Resilience:** many CDNs provide DDoS protection and failover.  

Cloudflare started as a CDN, but today it’s more like a full edge platform: a CDN plus DNS, security (DDoS/WAF), and even compute and storage, all sitting in front of your origin server

**There are F/OSS CDNs** if you need one.

* https://trafficcontrol.apache.org/

* https://github.com/apache/trafficcontrol
  * https://github.com/apache/trafficcontrol?tab=Apache-2.0-1-ov-file#readme

>  Apache Traffic Control is an Open Source implementation of a Content Delivery Network 

> > Apache Traffic Control allows you to build a large scale content delivery network using open source. Built around Apache Traffic Server as the caching software, Traffic Control implements all the core functions of a modern CDN.

##### CDNjs

* https://cdnjs.com/
* https://github.com/cdnjs/cdnjs

> MIT | 🤖 CDN assets - The #1 free and open source CDN built to make life easier for developers. 

>  cdnjs is a free and open-source CDN service trusted by over 12.5% of all websites, serving over 200 billion requests each month, powered by Cloudflare. 

They have a F/OSS Static Website where we can find the packages to use via CDNjs - https://github.com/cdnjs/static-website

##### JSDelivr

* https://www.jsdelivr.com/
  * https://github.com/jsdelivr/jsdelivr
  * https://github.com/jsdelivr/jsdelivr?tab=MIT-1-ov-file#readme

>  A free, fast, and reliable Open Source CDN for npm, GitHub, Javascript, and ESM 

---

## FAQ

Despite we been able to find [broken links with Python](https://brianli.com/2021/06/how-to-find-broken-links-with-python/)


### Free stock photo sites

If you need high‑quality, royalty‑free images, these sources offer excellent free collections (always double‑check the specific license for each image):

- **Adobe Stock – Free Collection**  https://stock.adobe.com/free  
- **StockSnap**  https://stocksnap.io/  

- **Pexels**  https://www.pexels.com/  

- **Burst by Shopify**  https://www.shopify.com/stock-photos  

- **Freerange**  https://freerangestock.com/  

- **Unsplash**  https://unsplash.com/  
- **Kaboompics**  https://kaboompics.com/  
- **Stockvault**  https://www.stockvault.net/  
- **Wikimedia Commons**  https://commons.wikimedia.org/wiki/Main_Page  
- **Pixabay**  https://pixabay.com/



## How to see if a web was changed

https://docs.linuxserver.io/images/docker-changedetection.io/#user-group-identifiers Apache v2 ✅