---
title: "How to create a free Web (ASTRO/HUGO/Jekyll) with Github Pages"
date: 2024-09-08
draft: false
tags: ["Dev","SSG"]
description: 'How to get a Free Webpage for your Projects with Github Pages. Github Actions + Github Pages Setup.'
url: 'how-to-use-github-pages'
---

It does not really matter if you want to use [HUGO](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/), [ASTRO](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/) or [Jekyll](https://jalcocert.github.io/JAlcocerT/raspberrypi-starting-guide/).

With **Github Pages we can host** you Static Files (like the outputs of a SSG), that creates a good looking website.

> You get a free (sub)domain as well.

**And all for free.**

Actually, you could also have some markdown docs. With folders and readme's.

That's how I started documenting my learning process.

And since then it has bloomed and become this site.

If you are into R language, you can also try with the [RKnit Package](https://jalcocert.github.io/JAlcocerT/r-knitt-package-guide/).

But I promise that having **a quick look to SSGs** is totally worth it.

> Whats also great? 

To forget about building your site.

Commit your changes. Push.

And let **Github Actions CI/CD Workflows** do the rest.

These are example of **CI/CD depending on your desired SSG**:

1. [HUGO + Github Pages](https://github.com/JAlcocerT/JAlcocerT/blob/main/.github/workflows/pages.yaml)
2. [Jekyll + Github Pages](https://github.com/JAlcocerT/RPi/blob/main/.github/workflows/pages-deploy.yml)
3. [Astro + Github Pages](https://github.com/JAlcocerT/web3/blob/main/.github/workflows/deploy_astro.yml)

They are executed on push on certain branches / manually - All as per your GHA WF `.yml` configuration.

And if you need **101 on those SSGs:**

1. [HUGO 101](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/)
2. [Astro 101](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/) and https://jalcocert.github.io/JAlcocerT/using-astro-templates/ 
3. See also https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/

---

Alternatively, you can have a look to **other static hostings**:

1. [Firebase](https://fossengineer.com/hosting-with-firebase/)
2. [Cloudflare pages](https://fossengineer.com/hosting-with-cloudflare-pages/)
3. Netlify, Vercel, AWS s3...