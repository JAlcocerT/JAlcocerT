---
title: "Features for a Professional Looking News Website"
date: 2025-05-16
draft: false
tags: ["Web"]
description: "Creating a News focused Website with App Directory section (with Astro SSG). Beyond the basics."
url: 'creating-web-directory-website'
---

I came across SSGs looking for simplicity.

Plus their possibility to be enhanced via shortcodes/[components](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/).

Got in love due to the [many ways and how easy is to host them](https://fossengineer.com/alternatives-for-hosting-static-websites/).

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

2. https://github.com/Mrahmani71/astro-news which can be applied to [this kind of sites](https://github.com/JAlcocerT/BeyondAJourney)

> **MIT** | A news website built with Astro

{{< details title="What I like about Astro News Theme 📌" closed="true" >}}

1. Post are writen with `.mdx`

2. **Search** working in prod, not in dev when running `npm run dev`

It uses pagefind, similarly to [the astroverse/visvrs theme](https://github.com/IoTechCrafts/astroverse/blob/main/package.json#L23)

```sh
npm install astro-pagefind pagefind
```

3. **Image optimizations** to `.webp`

4. **OpenGraph** images working when sharing the web (and also considering the post images)
* Icons: https://lucide.dev/

> MIT | Beautiful & consistent icon toolkit made by the community. Open-source project and a fork of Feather Icons.

5. **RSS** Feed and sitemap!
* Very **modular** implementation of which posts goes where thanks to `isBigHeadline` and `isSmallHeadline` 
* Base path is present at `index.ts`


```sh
curl https://beyondajourney.pages.dev/rss.xml
curl https://beyondajourney.pages.dev/sitemap-index.xml
```

```json
{
  href: "https://beyondajourney.pages.dev/rss.xml",
  text: "RSS",
},
{
  href: "https://beyondajourney.pages.dev/sitemap-index.xml",
  text: "Sitemap",
},
//....
```

```sh
sudo apt install liferea
```

![RSS with Liferea](/blog_img/web/liferea-rss.png)

**What could be better**?

1. The header could follow the users when its scrolling
2. It could bring multilanguage support out of the box...

{{< /details >}}


This one is **fantastic** for blogging/news!

Like going from [this one](https://cyclingthere.pages.dev/), towards a more serious [like this one](https://beyondajourney.pages.dev/)

Definitely worth to have a look at it, maybe even **enhance it with a photo gallery** or a subscription / book selling page.


{{< callout type="info" >}}
Photo galleries like [this one](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/#photo-galleries) or [this one](https://github.com/rockem/astro-photography-portfolio) or [this](https://github.com/jomaendle/astro-photo-gallery)
{{< /callout >}}

What for?

Maybe to tinker with more time for [Real Estate webs](https://jalcocert.github.io/JAlcocerT/real-estate-website/#real-estate-web-ui-enhancements), particularly for [this](https://github.com/JAlcocerT/moi-photo-galleries)

{{< details title="Astro Photography Portfolio | Gallery Internals 📌" closed="true" >}}

Based on my exploration of the theme, here's how the gallery system is structured and functions:

1. Gallery Configuration (YAML-based)
The gallery is primarily defined in /src/gallery/gallery.yaml, which contains:

Collections: Categories for organizing photos (nature, travel, street)
Images: Individual image entries with:
Path to the image file
Metadata (title, description)
Collection assignments (including "featured" for highlighted images)

2. Image Management System
The theme handles images through:

imageStore.ts: Core logic for loading and processing images
Glob Imports: Images are loaded dynamically using import.meta.glob('/src/**/*.{jpg,jpeg,png,gif}')
Collection-based Filtering: getImagesByCollection() function retrieves images belonging to specific collections

3. Gallery Rendering Components
The gallery is displayed using:

PhotoGrid.astro: Main component that creates the image grid layout
FeaturedGallery.astro: Shows selected "featured" works
GLightbox Integration: Provides lightbox functionality when images are clicked

4. Image Display Process
When the gallery renders:

Images are loaded from the specified directories
Metadata from the YAML file is applied to each image
Images are displayed in a responsive grid
Clicking an image opens it in a lightbox with title/description

5. Directory Structure
Images are organized in collection-based folders:

/src/gallery/nature/
/src/gallery/travel/
/src/gallery/street/
This architecture makes it easy to add new images by:

Adding the image file to the appropriate directory
Adding an entry in the gallery.yaml file with metadata and collection assignments
Would you like me to explain any specific aspect of the gallery system in more detail?

{{< /details >}}

3. https://github.com/danielcgilibert/blog-template


{{< details title="What I like about Astro Blog-Template / OpenBlog Theme 📌" closed="true" >}}

* Post are writen with `.mdx`
* **Search** working in prod
* Cool post index that follows you when in a PC (not at a phone)

**What could be better**?

* The header could follow the users when its scrolling

{{< /details >}}

> GPL 3.0 | 📚 Openblog is an elegant, simple, and user-friendly blog. Focused on accessibility, SEO and performance.

>> For a more personal site, id have a look to [Fuwari](https://github.com/saicaca/fuwari)


### Directory Astro Themes

Very useful to create **app directories**:

![Astro App Directory - Post vs Properties](/blog_img/web/post-vs-properties.png)

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

4. https://github.com/piotrkulpinski/openalternative

> GPL3.0  A community driven list of open source alternatives to proprietary software and applications. 

5. [AstroNomy](https://github.com/mickasmt/astro-nomy), forked [here](https://github.com/JAlcocerT/astro-nomy), has an interesting part with post and tags, which are [cool for real estate](https://jalcocert.github.io/JAlcocerT/real-estate-website/#real-estate-web-ui-enhancements)

---

## Conclusions

**How to knw if your website works?**

Get [proper web analytics tools](https://fossengineer.com/open-source-selfhostable-web-analytics-alternatives-ga/) next to your website

**What if your news/blog are working?**

> Maybe writing and selling a book?

>> For that, This theme could be interesting - https://github.com/candidosales/landing-page-book-astro-svelte-tailwind



### Open Source Search for your websites

If you already have your website (Wordpress, Ghost, or SSG's...)

You will want to have search in it.

Mind that not all [static search work](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/#ssg-search) same, some just work when the ssg is built

I was writing about SSG search [here](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/#ssg-search)

But you can also see: Lunr.js, Typesense and [Meili](https://github.com/meilisearch/meilisearch)

* https://www.meilisearch.com/docs

> A lightning-fast search API that fits effortlessly into your apps, websites, and workflow