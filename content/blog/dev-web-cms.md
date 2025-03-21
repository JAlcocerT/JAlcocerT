---
title: "Websites with SSG + CMS - The missing piece."
date: 2025-03-22T22:20:21+01:00
draft: false
description: "UI for customization SSGs. Focusing on Keystatic CMS with Astro"
url: 'cms-for-static-websites'
---

Some time ago I tried Ghost as CMS connected to Gatsby as **headless CMS**.

It was a very interesting setup.

But I was looking for a way to integrate **CMS with HUGO/Astro**:

* https://jamstack.org/generators/


{{< callout type="info" >}}
See more at [awsome CMS](https://github.com/postlight/awesome-cms) 
{{< /callout >}}


## CMS

Content Management Systems (CMS):

- [Tina](https://tina.io/)
- [GHOST + GATSBY](https://ghost.org/docs/jamstack/)
- [Strapi](https://jamstack.org/headless-cms/strapi/)
  - Supports **GraphQL** or **RESTful** API.
- [Decap CMS (formerly Netlify CMS)](https://decapcms.org/)
  - [Add to Your Site](https://decapcms.org/docs/add-to-your-site/)
- [Directus](https://jamstack.org/headless-cms/directus/)
  - Directus turns SQL databases into REST and GraphQL APIs with an intuitive no-code app.



TinaCMS + Astro

{{< youtube id="5Opvp6z1uSc" autoplay="false" >}}

https://docs.astro.build/en/guides/cms/wordpress/

## decapCMS

https://astro.build/themes/details/astros/ -->> decap CMS
https://astros.zank.studio/blog/introducing-decap-cms-your-go-to-solution-for-content-management/

https://github.com/gxanshu/astro-decap-cms-starter
https://astro-decapcms-starter.netlify.app/
https://decapcms.org/docs/working-with-a-local-git-repository/


### netlifyCMS === decapCMS
Create a Custom Blog with Astro & NetlifyCMS in MINUTES!
https://www.youtube.com/watch?v=3yip2wSRX_4

## payloadCMS

https://github.com/mooxl/astroad/tree/main



## tinaCMS + astro

https://www.youtube.com/watch?v=5Opvp6z1uSc
https://github.com/tinacms/tina-self-hosted-demo


## Static CMS

https://github.com/MatthiesenXYZ/astro-ghostcms


* https://github.com/GetPublii/Publii

> GPLv3 | The most intuitive Static Site CMS designed for SEO-optimized and privacy-focused websites. 

[![Star History Chart](https://api.star-history.com/svg?repos=Thinkmill/keystatic,tinacms/tinacms,decaporg/decap-cms&,type=Date)](https://star-history.com/#Thinkmill/keystatic&tinacms/tinacms&decaporg/decap-cms&Date)


### Headless CMS

* https://jamstack.org/headless-cms/

* https://alternateoss.com/category/cms/

#### API Based

#### GIT Based


{{< callout type="info" >}}
https://blog.logrocket.com/9-best-git-based-cms-platforms/
{{< /callout >}}

* Gitlab provides with [up to 10 GB for repository](https://forum.gitlab.com/t/max-size-per-repo/17403), artifacts and LFS

* Github provides with [Max 5GB per repo](https://www.reddit.com/r/github/comments/xn8y97/is_there_a_limit_to_how_big_a_github_repo_can_be/), with a limit of 100mb per file.

How many cool things can be done with those generous free tiers?

##### KeyStatic CMS

* https://github.com/Thinkmill/keystatic

> **MIT** | First class CMS experience, TypeScript API, Markdown & YAML/JSON based, **no DB**

Keystatic CMS is a modern, open-source, headless content management system designed to **work directly with your codebase**. 

{{< details title="KeyStatic key features 📌" closed="true" >}}

**Core Concepts:**

* **Code-First CMS:**
    * Keystatic is built to integrate tightly with your existing development workflow. It works directly with files in your repository, such as Markdown, YAML, and JSON.
    * This approach allows developers to maintain control over their content structure and versioning.
* **Git-Based:**
    * It leverages Git for content storage and version control. This means your content is stored alongside your code, providing a robust history and collaborative workflow.
* **Headless:**
    * Keystatic is a headless CMS, meaning it focuses on providing **content through an API** rather than dictating how that content is displayed. This allows you to **use your preferred frontend framework** (like Astro, Next.js, or Remix) to build your website or application.
* **Local and Cloud Editing:**
    * It offers flexibility in how you edit content. You can edit content locally during development or use Keystatic Cloud for remote editing, especially when your site is deployed.
* **Content Structuring:**
    * Keystatic allows you to define content schemas, ensuring consistency and organization. This is done through configuration files that define content collections and singletons.
* **User-Friendly Interface:**
    * Despite its code-first approach, Keystatic provides a user-friendly admin UI for content editors, making it accessible to non-technical users.

**Key Advantages:**

* **Developer-Friendly:**
    * Its integration with Git and codebase-centric approach makes it ideal for developers.
* **Version Control:**
    * Git integration provides robust version control and collaboration features.
* **Flexibility:**
    * Headless architecture allows for flexibility in frontend development.
* **Performance:**
    * Working directly with files can lead to fast performance.


{{< /details >}}

**In essence:**

Keystatic is a CMS that bridges the gap between developers and content editors, providing a seamless workflow for managing content within a codebase:

* https://keystatic.com/docs/installation-astro

```sh
npm create @keystatic@latest
```

**What I like about KeyStatic**

It has fully local mode, but also [Github Mode](https://keystatic.com/docs/github-mode)

**How I learnt about KeystaticCMS?**

* https://github.com/Boston343/landingpad
  * https://github.com/JAlcocerT/landingpad

* And due to [Mizar landing Page](https://jalcocert.github.io/JAlcocerT/creating-landing-pages-astro/)

{{< callout type="info" >}}
Use [KeyStatic cloud](https://keystatic.com/docs/cloud) to skip some of the GH App config overhead
{{< /callout >}}

##### Static CMS

* https://github.com/StaticJsCMS/static-cms

> A Git-based CMS for Static Site Generators

{{< callout type="warning" >}}
Archived since SeptY24!
{{< /callout >}}



##### Decap CMS

https://github.com/decaporg/decap-cms

> MIT | A Git-based CMS for Static Site Generators 

##### TinaCMS

* https://github.com/tinacms/tinacms

> Apache v2 | A fully open-source headless CMS that supports Markdown and Visual Editing

---

## Conclusions

### KeyStatic CMS with Astro

When you deploy the static site, the `whateverdomain.com/keystatic` path will still be there:

![KeyStatic statically deployed UI](/blog_img/web/staticcms/keystatic-ssg-deployed.png)

But you wont be able to make any changes, as the server (API) is NOT running.

---

## FAQ

**Icons?**

* https://github.com/akveo/eva-icons

> MIT | A pack of more than 480 beautifully crafted Open Source icons. SVG, Sketch, Web Font and Animations support.

**Where to get Domains?**

* https://developer.godaddy.com/getstarted
* Hostinger
* https://porkbun.com/api/json/v3/documentation#Domain%20Pricing
* Cloudflare domains...

### What are Static Site Generators?

* https://github.com/plentico/plenti

> Apache v2 | Static Site Generator with Go backend and Svelte frontend 

### What are NginX Static Routes?


### Making Webs with AI

* https://github.com/rapidpages/rapidpages

> MIT |  Generate React and Tailwind components using AI 