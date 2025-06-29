---
title: "A new webpage"
date: 2025-06-21T18:20:21+01:00
draft: false
# cover:
#   image: "https://socialify.git.ci/BoltzmannEntropy/xtts2-ui/image?description=1&descriptionEditable=Discovering%20weather%20patterns%20with%20Python%20%0A%0A&font=Inter&name=1&owner=1&pattern=Solid&theme=Auto" # image path/url 
#   alt: "SelfHosting xTTS2 with Docker." # alt text
#   caption: "Succesfull installation of xTTS2 with Docker." # display caption
description: 'AstroDB x KeyStaticCMS.'
tags: ["Web","Landing Page","CMS","SSG","JAlcocerTech","Cloudflare Workers and Pages"]
url: keystaticcms-astrodb
---
<!-- 
https://github.com/JAlcocerT/jalcocertech/settings
 -->

* https://github.com/mearashadowfax/DataNova

> **MIT** | Open-source Astro website template with TailwindCSS, Keystatic CMS, and Astro DB support.



Could not resist to fork it: https://github.com/JAlcocerT/DataNova

And to get familiar with: https://docs.astro.build/en/guides/astro-db/

```sh
git clone https://github.com/JAlcocerT/DataNova
#rm -r .git

rm -rf .git
git init
git add .
git commit -m "Initial commit for your site"
#assuming you have https://github.com/JAlcocerT/jalcocertech

git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/jalcocertech.git
#git remote add origin https://github.com/JAlcocerT/jalcocertech.git


```

## Conclusions

### Features I liked

1. The moving [navbar](https://github.com/JAlcocerT/DataNova/blob/main/src/components/sections/Navbar.astro) as you move around the web
2. The [Diagram.astro](https://github.com/JAlcocerT/DataNova/blob/main/src/components/common/Diagram.astro) component

### Deploying

With GH + [CF WnP](https://jalcocert.github.io/JAlcocerT/cool-link-in-bios/#cloudflare-as-authoritative-name-server)

![alt text](/blog_img/web/astro/cf-wnp.png)

For what I needed to review CF permissions: https://github.com/settings/installations/56072936

![alt text](/blog_img/web/astro/cf-gh-permissions.png)

Which I accepted

And review that its only for selected repos:

![alt text](/blog_img/web/astro/cf-gh-selected-repos.png)

> The result is: jalcocert.pages.dev or jalcocertech.com

### Website Checks

* This [opengraph checker](https://opengraph.dev/panel?url=https%3A%2F%2Flibreportfolio.fyi%2F) ---> https://libreportfolio.fyi/libreportfolio-og.jpeg



---

## FAQ

### More Astro Themes

You always get surprised with astro themes:

* https://github.com/mearashadowfax/OpenStove

>  A free, community-driven platform for sharing and discovering recipes. No ads, just good food! 

* https://github.com/wpinfusion/astro-hyperdrive

> An Astro template designed for Automotive dealerships. For the ones who like [cars](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/)!

### Wordpress and NRR

For **WordPress.com (the hosted service)**, I would guestimate their **Net Revenue Retention (NRR) to be in the range of 90% to 110%+**.

Here's why:

* **Subscription Model:** WordPress.com operates on a recurring subscription model (freemium with paid plans for features, storage, and support). Recurring revenue businesses typically have an NRR as a key performance indicator.
* **High Switching Costs:** Once a website is built and established on a platform like WordPress.com, migrating it to another provider can be complex and time-consuming. This "stickiness" inherently contributes to higher retention.
* **Upselling and Cross-selling Opportunities:**
    * Users often start with basic plans and upgrade as their needs grow (e.g., needing more storage, custom domain, e-commerce features with WooCommerce, advanced SEO tools, premium themes/plugins).
    * Automattic has also acquired other services (like WooCommerce, Jetpack, Tumblr) which can lead to cross-selling opportunities to their existing WordPress.com customer base.
* **Brand Recognition and Ecosystem:** WordPress.com benefits from the massive brand recognition of WordPress itself and a vast ecosystem of themes and plugins, which adds value and encourages continued use.
* **Customer Support and Managed Services:** For many users, the convenience of managed hosting and readily available support is a key factor in staying with WordPress.com rather than self-hosting.

An NRR of **over 100%** (e.g., 105% or 110%) would indicate that WordPress.com is not only retaining most of its customers but also successfully increasing revenue from its existing customer base through upgrades and additional service purchases. Given their scale and the continuous development of their offerings, achieving NRR over 100% is certainly plausible.

Without direct financial disclosures from Automattic, this remains an informed approximation.


### Making Webs with AI

* https://github.com/rapidpages/rapidpages

> MIT | Generate React and Tailwind components using AI 


### How to setup StrapiCMS?

If you are looking from CMS, you can have a look to [this post](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites), where I [setup KeystaticCMS](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites/#keystatic-cms)



* <https://www.opensourcealternative.to/project/Strapi>
    * <https://docs.strapi.io/dev-docs/installation/docker>