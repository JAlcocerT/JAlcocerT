---
title: "Astro Websites"
draft: false
url: 'create-your-website-astro-ssg'
type: docs
prev: docs/debian
next: docs/arch
sidebar:
  open: false
---

{{< callout type="info" >}}
New to SSGs and ASTRO? See the [**101 Astro** Guide](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/)
{{< /callout >}}


## Astro CLIs

```sh
git clone #theme
npm install
npm run dev
#npm run build
```

```sh
npm install -g http-server
http-server dist
```


## Astro Themes

Find astro themes at: https://astro.build/themes/

* [Astrothemes.club](https://astrothemes.club/free-astro-themes)
* https://statichunt.com/ or https://github.com/statichunt

### Photo Gallery Themes

1. https://github.com/obviyus/musee?ref=astrothemes.club


{{< details title="What I like about Musee Astro Theme 📌" closed="true" >}}

* Simplicity: place your folder under `/src/assets/images/original/` and you are good to go
* Images are optimized to `.webp` at build time 
    * They go from ~1.92GB to 508mb (~75% reduction)

```bash
#npm install
npm install astro-purgecss@latest
```

2. Start development server

```bash
npm run dev
#npm run build
```

{{< /details >}}

> GPL3.0 | Fast, responsive , self-hosted image gallery. Ships minimal JS to the client.

2. https://github.com/AREA44/astro-multiverse?ref=statichunt.com

> One-page gallery design with a fully functional lightbox, designed by HTML5 UP



{{< callout type="info" >}}
See also HUGO Theme Gallery implemented [here](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/) and [here](https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/)
{{< /callout >}}

### Blogs

1. https://github.com/saicaca/fuwari

2. https://github.com/godruoyi/gblog

> MIT 🎈gblog, an open-source, simple and beautiful blog built with Astro

3. https://github.com/statichunt/geeky-astro

> MIT | Very cool site with search and mdx

4. https://github.com/danielcgilibert/blog-template

> GPL3.0 | 📚 Openblog is an elegant, simple, and user-friendly blog. Focused on accessibility, SEO and performance.

5. https://github.com/palmiak/pacamara-astro

> MIT Pacamara is a simple blog theme for Astro that uses md and mdx files to store your content.

6. https://github.com/web3templates/stablo-astro

#### Dev Blogs

This one could also be used for CV thanks to its work section.

7. https://github.com/larry-xue/apple-style-portfolio

> Unlicensed | This is a template with a highly minimalist style, greatly inspired by Apple's design concept. It is built with Astro, TailwindCSS, GSAP, and Three.js.



### App Directory

Looking for app directories or blog sections that you can filter interactively?


1. https://github.com/lukenguyen-me/astro-template-directory-website

> Unlicensed | Astro template for a directory website in minimal theme, with reactjs + tailwind + shadcn

{{< details title="What I like about Astro Template Directory Theme 📌" closed="true" >}}

* **Search** working in prod and also in Dev! Using `lucide-react`:

```sh
npm install lucide-react
```

{{< /details >}}

2. https://github.com/NewDesignFile/template-directory

> Unlicensed | A directory theme for Astro.

3. https://github.com/mickasmt/next-mobbin-clone

> MIT | Replicate the design of mobbin.com to test the news components of shadcn-ui. #builtinpublic

This one has a blog which can be filtered per tags:
  
4. https://github.com/mickasmt/astro-nomy

> MIT | Differents pages and examples apps built with Astro v4.5, shadcn/ui & react js. Open Source.



### Services

#### Restaurants

1. https://github.com/moonbe77/fresh_bite

> Unlicensed | Restaurant website template

2. https://github.com/unfolding-io/Astrorante?ref=astrothemes.club

* Very interesting **video**, as soon as you enter
* MultiLang (i18n)

> AstroRante is a state-of-the-art website theme crafted for fine dining establishments. Combining the power of Astro, **Storyblok CMS**, Vue, and Tailwind, AstroRante delivers an unparalleled online presence for your restaurant.



#### Weddings

{{< cards >}}
  <!-- {{< card link="blog" title="Blog" icon="book-open" >}} -->
  {{< card link="https://jalcocertech.xyz/" title="Applied for MotoVlog ↗" icon="book-open" >}}
{{< /cards >}}


#### Modelling

1. https://github.com/iamnyasha/minimma

> MIT | Interesting and simple site


### CV Themes

If you are looking to impress with a new curriculum, why not doing it as a web?

1. https://github.com/KonradSzwarc/devscard

> MIT | A fully customizable template to create your online (and paper) resume without writing a single line of code.

2. https://github.com/mmouzo/astro-cv-esquelete

> MIT | A free, easy-to-use CV template with a clean design. Just fill in your details and you're ready to go!


### Links / Bento

1. https://github.com/DBozhinovski/astro-theme-ltree

> An Astro theme that replicates Linktree _and_ Linkinbio rolled in one. Optional TinaCMS on top.



### Presentations with Astro


### Product

1. https://github.com/midudev/landing-tesla?ref=statichunt.com

* With very interesting video sections!

> Ejemplo de landing de Tesla con HTML, CSS, JavaScript, Astro y Tailwind


### Docs

1. https://github.com/withastro/starlight?ref=statichunt.com


* Supports `.mdx` and i18n
* Search built in (with PageFind)
* When scrolling, you see in which section you are
* Blog section can be done with https://github.com/HiDeoo/starlight-blog

> 🌟 Build beautiful, accessible, high-performance documentation websites with Astro

### Startup

1. https://github.com/matt765/Tailcast?ref=statichunt.com

> MIT



---

## FAQ Astro

{{< details title="Important Files for all Astro Webs 📌" closed="true" >}}

Look always for the `<head>` - It will guide you to a `Base.astro`, `BaseLayout.astro`, `head.html`...

In there you can do interesting things, like adding **web analytics**.

{{< /details >}}

{{< details title="How to Install Dependencies 📌" closed="true" >}}

checking dependencies

```sh
npm list @astrojs/starlight
npm install @astrojs/starlight
npm install @astrojs/starlight --legacy-peer-deps #if you have some dep issues
```

{{< /details >}}




{{< details title="Better SEO for Astro 📌" closed="true" >}}

* Seo Package for astro:

```astro
import { AstroSeo } from '@astrolib/seo';
```

as in the [Minimal Studio Theme by michael-andreuzza ](https://github.com/IoTechCrafts/minimalstudio-ssg)

{{< /details >}}


{{< details title="WebSearch in Astro 📌" closed="true" >}}

As in the [withastro/starlight Theme](https://github.com/IoTechCrafts/starlight-SSG)

One of the most complete Astro themes ive seen - also supporting several languages

* https://starlight.astro.build/guides/i18n/

{{< /details >}}

{{< details title="Optimized images in Astro mdx Posts 📌" closed="true" >}}

You will **need astrojs/mdx installed** first and use it within `.mdx` files:

```astro
import { Image } from 'astro:assets'

import photopost1b from '/src/assets/img_folder/image.jpg';

<figure>
  <Image src={photopost1b} width={500} height={200} alt="Exploring Astro Images" />
  <figcaption class="caption">Say hi to Astro</figcaption>
</figure>
```

{{< /details >}}