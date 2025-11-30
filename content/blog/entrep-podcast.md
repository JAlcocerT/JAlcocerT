---
title: "A podcast for all"
date: 2025-11-28T08:20:21+01:00
draft: false
tags: ["Web","Astro","Entrep","RSS","Make-Podcast","SaaS Vibe Coding","FFMPeg Recording"]
description: 'Using astro and '
url: 'make-podcast'
---

**Tl;DR**

Because astro SSG and CSR are so cool. 

Why not...Creating a DIY podcast platform?

**Intro**

I read this [lifestyle post](https://quiethabits.net/why-im-ditching-the-best-things-for-the-right-things) and this: https://quiethabits.net/stop-living-a-passive-life

And found that the writer had a podcast: https://creators.spotify.com/pod/profile/quiethabits/

But only using third party tools.

> Wouldnt it be cool for the author to have its platform?

Lately Iv been tinkering with custom (vibecoded) flask apps to interact with SSGs

* https://github.com/manuelernestog/astropod
    * Which I Forked https://github.com/JAlcocerT/astropod and talked about [here](https://jalcocert.github.io/JAlcocerT/tech-for-podcast/)

> **MIT** | Free and open source self-hosting serverless podcast solution 

{{< youtube "mDMGtMOx-Fk" >}}

You are not forced to use [Astro and its components](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/) for your podcast.

In fact there are OSS [podcasts Themes for Gatsby](https://jalcocert.github.io/JAlcocerT/gatsby-ghost-integration/#podcasts-in-gatsby)

Even with [this kind](https://github.com/JAlcocerT/JAlcocerT/blob/main/layouts/shortcodes/audio.html) of HUGO shortcodes, you can bring audio to your posts.

Similarly like https://ugeek.github.io/list.html does! 

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg/" title="Just SSG" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for SSG HUGO/Astro Components" >}}
{{< /cards >}}

## Creating a PODCAST Platform

This platform would allow you to:

- Host your podcast episodes
- Manage your content through a web interface
- Generate RSS feeds for distribution


From the [latest vibe coding learnings](https://jalcocert.github.io/JAlcocerT/real-estate-landing/#nuxt-for-real-estate):

1. I found that is better to keep it simple and with well known frameworks
2. Its great to chat with Gemini about your initial ideas -> Create [a z-BRD.md](https://jalcocert.github.io/JAlcocerT/brd-vs-frd-for-data-analytics/) and refine again with your coding agent
3. create a `z-development-plan.md`

```
* Built in auth based on `.env`
* 
```

How about creating a: **make-podcast**?


1. Clone the repo

```sh

```

2. Bring the astropod theme


3. Edit the `./src` content via the Web App




---

## Conclusions

In case you didnt know, you can convert your youtube channel into a podcast.

And also, every youtube channel has an associated RSS feed to notify you about new videos coming out.

> YOu can leverage that to get that cool astro component showing on your website what was your last video uploaded :)

There are also selfhostable Podcasts:

1. https://github.com/ad-aures/castopod

>  Castopod is an open-source hosting platform made for podcasters who want engage and interact with their audience. Synchronized read-only mirror of https://code.castopod.org/adaures/castopod 


---

## FAQ

Youtube to Podcast: https://github.com/aizhimou/pigeon-pod?ref=selfh.st

>  Turn your favorite Youtube channels into to podcast in the easiest and elegant way. 

> > Any channel. Any playlist. All ears.

**FFMPeg** is great and can also record your screen:

```sh
#ffmpeg -f x11grab -s 1920x1080 -i :0.0 -r 30 output.mkv
```

Or...just your audio for the Podcast.

```sh

```

### RSS Tools

Just in case you

* https://github.com/RSS-Bridge/rss-bridge
    * https://rss-bridge.org/bridge01/

>  The RSS feed for websites missing it 

> > If you are using astro to create websites, you can add an RSS Feed easily like so.


### Svelte vs Other FE Frameworks

Svelte's main competitors in 2025 are lightweight, performant frontend frameworks like SolidJS, Qwik, and Astro, which emphasize small bundles, fast runtime, and reactivity without virtual DOM overhead.

| Framework | Core Strength | Bundle Size/Performance Edge | Use Cases [1][4] |
|-----------|---------------|------------------------------|----------------------------|
| SolidJS  | Fine-grained reactivity | Matches Svelte's speed, low memory | Interactive apps, dashboards |
| Qwik     | Resumability, zero JS initial load | Smallest payloads (~1KB startup) | Performance-critical sites [1] |
| Astro    | Islands architecture, multi-framework | Static-first, minimal client JS | Content sites, blogs [2] |
| Preact   | React-compatible, tiny footprint | 3KB vs React's 100KB+ | React-like apps with less overhead |
| Vue      | Progressive, intuitive DX | Balanced speed/ecosystem | SPAs, hybrid apps [4] |

Full-stack metaframeworks like SvelteKit (Svelte's own) compete with Next.js (React) and Nuxt (Vue) for SSR/SSG apps. 

These align with modern web dev trends favoring efficiency over React/Angular's maturity.

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" >}}
{{< /cards >}}


Sí, Astro excels en SSG (Static Site Generation) con su arquitectura de islas, pero SvelteKit, SolidStart, Qwik y Preact también lo soportan nativamente a través de sus metaframeworks o configuraciones específicas.


| Framework     | Soporte SSG                  | Configuración clave [fuente] |
|---------------|------------------------------|------------------------------|
| SvelteKit    | Prerender completo o por ruta | `export const prerender = true;` en páginas; `adapter-static` [4][5] |
| SolidStart   | SSG con prerendering isomórfico | `server: { presets: 'static' }` en config [2][6] |
| Qwik         | SSG nativo con resumability | Adapter estático genera HTML pre-renderizado [7][3] |
| Preact       | SSG vía Vite/CLI prerender | `prerender: { enabled: true }` en Vite config [8][9] |

Todos permiten hybrid modes (SSG + SSR/CSR), ideal para sitios estáticos con interactividad mínima, alineado con tus intereses en frameworks eficientes como Astro/Svelte.

### Wireframing and The Penpot Project

Are you looking for a powerful and flexible design and prototyping tool that is **free and open-source**? 


* https://github.com/Figma-Linux/figma-linux


Penpot is a powerful and customizable design and prototyping tool that offers a wide range of features and benefits for users.

```sh
#https://flathub.org/apps/com.sudovanilla.penpot-desktop
```

It can also be configured via docker: https://github.com/jmlcas/penpot

Penpot is a versatile and customizable design tool that allows you to create beautiful and interactive designs for web and mobile applications.


* https://help.penpot.app/technical-guide/getting-started/#start-penpot