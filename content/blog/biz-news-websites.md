---
title: "Features for a Professional Looking News Website"
date: 2025-06-22
draft: false
tags: ["Web"]
description: "Creating a News focused Website with app directory (with Astro SSG)."
url: 'creating-news-website'
---

{{< cards >}}
  <!-- {{< card link="blog" title="Blog" icon="book-open" >}} -->
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website-astro-ssg/" title="See Astro 101 Docs ↗" icon="book-open" >}}
{{< /cards >}}


1. https://github.com/oxygenna-themes/foxi-astro-theme/

> MIT |  Foxi is an Astro theme crafted with Tailwind CSS, designed for blazing-fast performance and seamless user experience. Perfect for creating modern, responsive SaaS websites with minimal effort. 

If you are new to SSGs, have a look to:

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101" >}}
{{< /cards >}}

2. https://github.com/Mrahmani71/astro-news

> **MIT** | A news website built with Astro

{{< details title="What I like about Astro News Theme 📌" closed="true" >}}

* Post are writen with `.mdx`
* **Search** working in prod

```sh
npm install astro-pagefind pagefind
```

* **Image optimizations** to `.webp`
* **OpenGraph** images working when sharing the web (and also considering the post images)
* Icons: https://lucide.dev/

> MIT | Beautiful & consistent icon toolkit made by the community. Open-source project and a fork of Feather Icons.

* **RSS** Feed and sitemap!
* Very **modular** implementation of which posts goes where thanks to `isBigHeadline` and `isSmallHeadline` 
* Base path is present at `index.ts`

**What could be better**?

* The header could follow the users when its scrolling

{{< /details >}}

This one is **fantastic** for blogging/news!

Definitely worth to have a look at it, maybe even enhance it with a photo gallery or a subscription / book selling page.


3. https://github.com/danielcgilibert/blog-template


{{< details title="What I like about Astro Blog-Template / OpenBlog Theme 📌" closed="true" >}}

* Post are writen with `.mdx`
* **Search** working in prod
* Cool post index that follows you when in a PC (not at a phone)

**What could be better**?

* The header could follow the users when its scrolling

{{< /details >}}

> GPL 3.0 | 📚 Openblog is an elegant, simple, and user-friendly blog. Focused on accessibility, SEO and performance.

For a more personal site, id have a look to: https://github.com/saicaca/fuwari


### Directory Astro Themes

Very useful to create **app directories**:

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





---

## Conclusions

**What if your news/blog are working?**

Maybe writing and selling a book?

This theme could be interesting - https://github.com/candidosales/landing-page-book-astro-svelte-tailwind


---