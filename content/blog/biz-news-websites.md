---
title: "Features for a Professional Looking News Website"
date: 2025-05-16
draft: false
tags: ["Web","Astro SSG","Beyond a Journey"]
description: "Creating a News focused Website with App Directory section. Beyond the basics."
url: 'creating-web-directory-website'
---

I came across SSGs looking for simplicity.

Plus their possibility to be enhanced via shortcodes/[components](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/).

Got in love due to the [many ways and how easy is to host them](https://fossengineer.com/alternatives-for-hosting-static-websites/).

{{< cards >}}
  <!-- {{< card link="blog" title="Blog" icon="book-open" >}} -->
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website-astro-ssg/" title="See Astro 101 Docs ↗" icon="book-open" >}}
{{< /cards >}}

Lately, I have came across few interesting **Astro Themes**


1. https://github.com/oxygenna-themes/foxi-astro-theme/

> MIT |  Foxi is an Astro theme crafted with Tailwind CSS, designed for blazing-fast performance and seamless user experience. Perfect for creating modern, responsive SaaS websites with minimal effort. 

If you are new to SSGs, have a look to:

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101" >}}
{{< /cards >}}

2. https://github.com/Mrahmani71/astro-news which can be applied to [this kind of sites](https://github.com/JAlcocerT/BeyondAJourney)

> **MIT** | A news website built with Astro

Which is some kind of theme that very interesting people would use to tell you a life story: https://www.cyclingabout.com/



{{< details title="What I like about Astro News Theme - Search, mdx, OG, RSS... 📌" closed="true" >}}

1. Post are writen with `.mdx`

2. **Search** working in prod with **PageFInd**, not in dev when running `npm run dev`

It uses pagefind, similarly to [the astroverse/visvrs theme](https://github.com/IoTechCrafts/astroverse/blob/main/package.json#L23)

```sh
npm install astro-pagefind pagefind
```

3. **Image [optimizations](https://docs.astro.build/en/guides/images/)** to `.webp`

4. **OpenGraph** images working when sharing the web (and also considering the post images, that are rendered)

When sharing the main page, is the image that will be displayed

```html
import defaultImage from "~/assets/images/default-image.jpg";
```

* Icons: https://lucide.dev/

> MIT | Beautiful & consistent icon toolkit made by the community. Open-source project and a fork of Feather Icons.

5. **RSS** Feed and sitemap!

* Very **modular** implementation of which posts goes where thanks to `isBigHeadline` and `isSmallHeadline` 
* Base path is present at `index.ts`


```sh
curl https://beyondajourney.pages.dev/rss.xml
curl https://beyondajourney.pages.dev/sitemap-index0.xml
```

At `./public/robots.txt`, you can adapt the sitemap path:

```
User-agent: *
Allow: /

Sitemap: https://beyondajourney.pages.dev/sitemap-0.xml
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

Test the RSS with:

```sh
sudo apt install liferea
```

![RSS with Liferea](/blog_img/web/liferea-rss.png)


{{< /details >}}

**What could be better**?

1. The header could follow the users when its scrolling
2. It could bring multilanguage support out of the box...


As part of the tests, I used CF Wrangler CLI for a quick static deployment:

![CF CLI](/blog_img/web/astro/cf-cli-wrangler.png)

And soon after, with CI/CD: [Github -> CF WnP](https://jalcocert.github.io/JAlcocerT/cool-link-in-bios/#cloudflare-as-authoritative-name-server)

Configure properly the build of your SSG:

```sh
cd ./astro-news && npm run build
```

![alt text](/blog_img/web/astro/astro-cf-build.png)

See how beautiful can Astro news get:

![Astro-News Theme - beyond a journey result](/blog_img/web/astro/astro-news-theme-beyondajourney.png)

* https://web-check.xyz/check/https%3A%2F%2Fbeyondajourney.pages.dev%2F
* https://www.websitecarbon.com/

The theme did not have ToC be default, but I have vibecoded one:

![Astro News - Post ToC](/blog_img/web/astro/astro-news-toc-vibecoded.png)


This one is **fantastic** for blogging/news!

Like going from [this one](https://cyclingthere.pages.dev/), towards a more serious [like this one](https://beyondajourney.pages.dev/)

Definitely worth to have a look at it, maybe even **enhance it with a photo gallery** or a subscription / book selling page....

{{< callout type="info" >}}
Photo galleries like [this one](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/#photo-galleries) or [this one](https://github.com/rockem/astro-photography-portfolio) or [this](https://github.com/jomaendle/astro-photo-gallery)
{{< /callout >}}

**What for?**

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

**These are the results**: Im keeping the MIT Astro-News for a personal blog :)

![Beyond a Journey](/blog_img/web/beyond-journey-web.png)

**How to know if your website works?**

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


### Outro

#### Other Webs Ive Built

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