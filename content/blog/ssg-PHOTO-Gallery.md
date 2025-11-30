---
title: "Awsome Photo Galleries for your Blog"
date: 2024-11-17
draft: false
tags: ["Web"]
# cover:
#     image: "https://socialify.git.ci/haltakov/simple-photo-gallery/image?description=1&language=1&name=1&pattern=Brick%20Wall&stargazers=1&theme=Auto" # image path/url 
#     alt: "Photo Galleries Made Simple" # alt text
#     caption: "Photo Galleries alternative to instagram" # display caption under cover
description: 'Open Source Photo Gallery'
summary: 'How to create a better Photo Center Blog than Instagram with Open Source'
url: 'open-source-photo-gallery'
---

**Intro**

This post might be a more web/dev technical than others.

But, you can follow it and **get an alternative photo gallery to instagram**, pinterests and so on.

## React Lightbox

I heard recently about **React Lightbox**.

* https://www.youtube.com/watch?v=KNEbqO-q1r8
    * https://github.com/isNan909/react-gallery

{{< youtube id="KNEbqO-q1r8" autoplay="false" >}}


> React Image Lightbox Gallery (no libraries)

### Other Photo Galleries

* https://jankraus.net/2024/04/05/how-to-build-a-simple-photo-gallery-with-astro/

* https://www.builtatlightspeed.com/?themes%5BrefinementList%5D%5Bcategories.ssg%5D%5B0%5D=react&themes%5BrefinementList%5D%5Bdistribution%5D%5B0%5D=open-source

* https://github.com/nextui-org/nextui
* https://nextui.org/docs/components/accordion

* https://github.com/mantinedev/mantine

> A fully featured React components library

<!-- 
https://medevel.com/self-hosted-photo-gallery-1933/
-->

1. Simple Photo Gallery
2. https://github.com/soyaine/horcrux
https://soyaine.github.io/horcrux/
3. https://github.com/tannerdolby/eleventy-photo-gallery

> Starter site for creating a responsive image gallery using the Eleventy static site generator

4. https://github.com/andyzg/gallery - MIT

A visual portfolio generator with web hosting for your mockups and photo albums. Requires no 3rd party libraries or installations. A 🤑free🤑 Squarespace alternative for your photos. Live demo at http://andyzhang.net/gallery

> Visual Portfolio Generator with no extra installation

5. [SSGs Photo Galleries](#ssg-photo-galleries) - With Hugo, Astro...
* https://nicokaiser.github.io/hugo-theme-gallery/
    * https://github.com/nicokaiser/hugo-theme-gallery

> A very simple and opinionated photo gallery theme for Hugo

3. [Other](#other-foss-photo-galleries)


## The Simple Photo Gallery Project

* {{< newtab url="https://haltakov.net/simple-photo-gallery/" text="The Scrapegraph-ai Project Documentation" >}}
* {{< newtab url="https://github.com/haltakov/simple-photo-gallery" text="The Scrapegraph-ai Source Code at GitHub" >}}
    * License: {{< newtab url="https://github.com/haltakov/simple-photo-gallery?tab=MIT-1-ov-file#readme" text="MIT" >}} ✅

> Beautiful and simple photo galleries that help you tell your story. Free and open-source.

* https://github.com/haltakov/simple-photo-gallery/blob/master/doc/Usage.md
* https://haltakov.net/photos/2020-pertisau/

**You can publish it as static site** - https://github.com/haltakov/simple-photo-gallery/blob/master/doc/Usage.md#publishing-your-gallery-gallery-upload

### How to Use Simple Photo Gallery

### SSG Photo Galleries

I will bore you with [HUGO](#hugo) and [Astro](#astro) in a moment, but...

There are 2 interesting options I saw recently.

Today i'd like to start with a *new* very cool **Eleventy** (yes, another SSG) Photo Gallery Theme - https://github.com/tannerdolby/eleventy-photo-gallery

> Built with JavaScript and runs on Node.js. It has a growing ecosystem of plugins and integrations.

And among new things, there is also a way to make **static sites with Python** (using [Photoswipe JS](#galleries-for-devs) under the hood).

This is exactly what https://github.com/haltakov/simple-photo-gallery does....

...and also reproduces video! https://haltakov.net/photos/2020-pertisau/#&gid=1&pid=1

#### HUGO

I commented recently how [I am still amazed with HUGO](/changing-hugo-theme/)

And there are few F/OSS HUGO Themes to create quick photo galleries.

##### HUGO Theme Gallery

* https://nicokaiser.github.io/hugo-theme-gallery/

```sh
hugo version

hugo new site blowfish --format=yaml
cd blowfish

git init
git submodule add https://github.com/nunocoracao/blowfish.git themes/blowfish

#nano hugo.yaml
#theme: blowfish

cd ./themes/blowfish/exampleSite
hugo server --bind=192.168.3.200 --baseURL=http://192.168.3.200 --port=1313
```

* You can also have a look to - https://github.com/bep/gallerydeluxe

#### Astro

If like me, you think there are a lot of cool Astro Themes around there

You will not be surprised to see that some of those **Astro Themes are great Photo Galleries**:

* https://github.com/michael-andreuzza/microblog   
    * https://microblog-theta.vercel.app/

* AstroVerse (ex vis-vrs) - A Visual Photo Centered Blog - https://github.com/IoTechCrafts/astroverse       
    * See a sample here: <https://iotechcrafts.github.io/astroverse/>

* https://github.com/web3templates/stablo-astro 
* https://github.com/palmiak/pacamara-astro

---

## Conclusions

Now is not just instagram, pinterest or Flikr.

You can have your own site to share your awsome shots with the world.

Remember that you will just need a domain for people to find you!

### More F/OSS Photo Galleries

* https://github.com/BlueDokk/Photo-Gallery

### Galleries for Devs

* PhotoSwipe

* https://github.com/xiaolin/react-image-gallery?ref=medevel.com
* https://react-photo-album.com/
    * https://github.com/igordanchenko/react-photo-album

* https://github.com/reflexjs/reflexjs

> A library for rapid UI development with style props, color modes, themes and variants + starter kits, themes and blocks to help you build Gatsby and Next.js sites faster.

* https://swiperjs.com/


---

## FAQ

### Open Source Tools to check Websites

* https://github.com/Lissy93/web-check

To evaluate the Themes, keep these Tools Handy:

| Tool | Description | License |
| :-- | :-- | :-- |
| {{< newtab url="/selfhosting-uptime-Kuma-docker?ref=fossengineer.com" text="UptimeKuma" >}} | A self-hosted monitoring tool like "Uptime Robot" | MIT ❤️ |
| {{< newtab url="https://upptime.js.org/?ref=fossengineer.com" text="Upptime" >}} | Open-source uptime monitor and status page, powered entirely by GitHub | MIT ❤️|
| {{< newtab url="https://pagespeed.web.dev/?ref=fossengineer.com" text="PageSpeed Insights" >}} | Free online tool by Google to analyze and optimize web page performance	 | Google |
| {{< newtab url="/changing-hugo-theme/#how-to-monitor-a-website-status" text="LinkChecker Project." >}} | look if all **referenced links are working** 	 | GPL v2 |
| {{< newtab url="https://github.com/xray-web/web-check-free/?ref=fossengineer.com" text="Web-Check-Free" >}} |  OSINT tool for analysing any website. Self-Hosted Edition! 	 | MIT ❤️|