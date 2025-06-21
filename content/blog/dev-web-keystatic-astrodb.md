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