---
title: "Websites with SSG + CMS - The missing piece."
date: 2025-05-18T22:20:21+01:00
draft: false
description: "UI for customization SSG generated content. About Keystatic CMS with Astro SSG. Combined with PostHog/OpenReplay for Product Analytics."
url: 'cms-for-static-websites'
---

Lately I have added some [upgrades](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#tg-bots) (via [telegram bot](https://github.com/JAlcocerT/EntreAgujayPunto/tree/main/TelegramBot)), so that whenever a customer sends new photos, they are synced to its photo centered repo.

But..wouldnt it be nice to have a native solution?

Some time ago I tried Ghost as CMS connected to Gatsby as **headless CMS**.

It was a very interesting setup.

But I was looking for a way to integrate **CMS with HUGO/Astro**:

* https://jamstack.org/generators/


{{< callout type="info" >}}
See more at [awsome CMS](https://github.com/postlight/awesome-cms) 
{{< /callout >}}



{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Headless-CMS" title="CMS+SSGs with Docker 🐋 ↗" >}}
{{< /cards >}}



## CMS

Content Management Systems (CMS):

- [KEYSTATICCMS](#keystatic-cms)
- [Tina](https://tina.io/)
- [GHOST + GATSBY](https://ghost.org/docs/jamstack/)
- [Strapi](https://jamstack.org/headless-cms/strapi/)
  - Supports **GraphQL** or **RESTful** API.
- [Decap CMS (formerly Netlify CMS)](https://decapcms.org/)
  - [Add to Your Site](https://decapcms.org/docs/add-to-your-site/)
- [Directus](https://jamstack.org/headless-cms/directus/)
  - Directus turns SQL databases into REST and GraphQL APIs with an intuitive no-code app.


A **file-based CMS** is a content management system that stores its content in files on a server's file system, rather than in a traditional database. These files can be in various formats like Markdown, YAML, JSON, or even plain text.

A **Git-based CMS** is a specific type of file-based CMS that leverages the Git version control system to manage and store content. In this system, the content files are stored in a Git repository. Content editors typically use a user-friendly interface provided by the CMS to make changes, and these changes are then committed to the Git repository. This offers benefits like version control, collaboration features, and the ability to easily roll back changes.

**All Git-based CMS are a subset of file-based CMS.**

* **Foundation in Files:** Git-based CMS inherently rely on storing content as files within a Git repository. This aligns with the fundamental characteristic of a file-based CMS.
* **Git as a File Management Tool:** Git itself is a system designed to track changes to files. A Git-based CMS simply uses Git as its underlying mechanism for managing these content files.

However, **not all file-based CMS are Git-based.** Many file-based CMS exist that manage files directly without using Git for version control. They might use other methods for backup or offer no built-in versioning capabilities at all.

**In summary:** Think of "file-based CMS" as the broader category. Within that category, "Git-based CMS" is a specific type that uses Git for its file management and version control.

### decapCMS

https://astro.build/themes/details/astros/ -->> decap CMS
https://astros.zank.studio/blog/introducing-decap-cms-your-go-to-solution-for-content-management/

https://github.com/gxanshu/astro-decap-cms-starter
https://astro-decapcms-starter.netlify.app/
https://decapcms.org/docs/working-with-a-local-git-repository/


#### netlifyCMS === decapCMS

Create a Custom Blog with Astro & NetlifyCMS in MINUTES!

<!-- https://www.youtube.com/watch?v=3yip2wSRX_4 -->

{{< youtube id="3yip2wSRX_4" autoplay="false" >}}


### payloadCMS

* https://github.com/payloadcms/payload

> MIT |  Payload is the open-source, fullstack Next.js framework, giving you instant backend superpowers. Get a full TypeScript backend and admin panel instantly. Use Payload as a headless CMS or for building powerful applications. 

* https://github.com/mooxl/astroad/tree/main



### TinaCMS + astro

This was a helpful video on TinaCMS x Astro:

<!-- https://www.youtube.com/watch?v=5Opvp6z1uSc -->

{{< youtube id="5Opvp6z1uSc" autoplay="false" >}}

* https://docs.astro.build/en/guides/cms/wordpress/

* https://github.com/tinacms/tina-self-hosted-demo

> It can also work with HUGO as seen during [the mechanism docs](https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/#tinacms)


## Static CMS

* https://github.com/MatthiesenXYZ/astro-ghostcms


* https://github.com/GetPublii/Publii

> GPLv3 | The most intuitive Static Site CMS designed for SEO-optimized and privacy-focused websites. 

[![Star History Chart](https://api.star-history.com/svg?repos=Thinkmill/keystatic,tinacms/tinacms,decaporg/decap-cms&,type=Date)](https://star-history.com/#Thinkmill/keystatic&tinacms/tinacms&decaporg/decap-cms&Date)


### Headless CMS

* https://jamstack.org/headless-cms/
* https://alternateoss.com/category/cms/

**API Based vs GIT Based**

{{< callout type="info" >}}
https://blog.logrocket.com/9-best-git-based-cms-platforms/
{{< /callout >}}

* Gitlab provides with [up to 10 GB for repository](https://forum.gitlab.com/t/max-size-per-repo/17403), artifacts and LFS

* Github provides with [Max 5GB per repo](https://www.reddit.com/r/github/comments/xn8y97/is_there_a_limit_to_how_big_a_github_repo_can_be/), with a limit of 100mb per file.

> How many cool things can be done with those generous free tiers?

#### KeyStatic CMS

A tool that makes Markdown, JSON and YAML content in your codebase editable by humans. Live edit content on GitHub or your local file system, without disrupting your existing code and workflows.

* First-class CMS experience
* Markdown & YAML/JSON based
* TypeScript API
* **No database**
* Markdoc & MDX support

> Two way editing

Keystatic CMS is a modern, open-source, headless content management system designed to **work directly with your codebase**. 

* https://github.com/Thinkmill/keystatic

> **MIT** | First class CMS experience, TypeScript API, Markdown & YAML/JSON based, **no DB**


{{< callout type="info" >}}
Keystatic is a “file-based” CMS and rich-content editor that lives alongside your source code.
{{< /callout >}}


* https://jalcocert.github.io/JAlcocerT/understanding-keystatic-cms/
* https://docs.astro.build/en/guides/cms/keystatic/
* https://maciekpalmowski.dev/blog/keystatic-x-astro/

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

With 2 astro themes:

1. https://github.com/Boston343/landingpad which I [forked](https://github.com/JAlcocerT/landingpad)

{{< callout type="warning" >}}
Uses [KeyStatic cloud](https://keystatic.com/docs/cloud) to skip some of the GH App config overhead
{{< /callout >}}

2. And due to [Mizar landing Page](https://jalcocert.github.io/JAlcocerT/creating-landing-pages-astro/#conclusions)


{{< callout type="info" >}}
This one is cnfigured to work locally as per its `keystatic.config.ts`. 
{{< /callout >}}


```sh
#npm install keystatic
npm install @keystatic/core @keystatic/astro
```

The `keystatic.config.ts` file is the main configuration file for Keystatic CMS.

```ts
export default config({
	storage: {
		kind: "local",
	},
//........
})
```

It defines how content is managed, structured, and edited within your project.

This file tells Keystatic which collections and singletons to manage, how fields are structured, where content is stored, and how the CMS UI should behave.

{{< filetree/container >}}
  {{< filetree/folder name="src" >}}
    {{< filetree/folder name="content" >}}
      {{< filetree/folder name="authors" state="closed" >}}
      {{< /filetree/folder >}}
      {{< filetree/folder name="global" state="closed" >}}
      {{< /filetree/folder >}}
      {{< filetree/folder name="pages" state="closed" >}}
      {{< /filetree/folder >}}
      {{< filetree/folder name="posts" state="closed" >}}
      {{< /filetree/folder >}}
      {{< filetree/folder name="works" state="closed" >}}
      {{< /filetree/folder >}}
      {{< filetree/file name="config.ts" >}}
    {{< /filetree/folder >}}
    {{< filetree/folder name="assets" state="closed" >}}{{< /filetree/folder >}}
    {{< filetree/folder name="components" state="closed" >}}{{< /filetree/folder >}}
    {{< filetree/folder name="layouts" state="closed" >}}{{< /filetree/folder >}}
    {{< filetree/folder name="lib" state="closed" >}}{{< /filetree/folder >}}
    {{< filetree/folder name="pages" state="closed" >}}{{< /filetree/folder >}}
    {{< filetree/folder name="styles" state="closed" >}}{{< /filetree/folder >}}
    {{< filetree/folder name="utils" state="closed" >}}{{< /filetree/folder >}}
  {{< /filetree/folder >}}
  {{< filetree/file name="astro.config.ts" >}}
  {{< filetree/file name="keystatic.config.ts" >}}
  {{< filetree/file name="package.json" >}}
  {{< filetree/file name="README.md" >}}
{{< /filetree/container >}}



##### KeyStatic Astro Sample

Thanks to [these devs tricks](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/)...

I could put [this landing theme](https://github.com/majesticooss/mizar) with **KeyStatic** into selfhosting with my Pi.

1. [Installed Node](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/)

```sh
# Verify installation
node -v   # Should show Node.js version - 20.18.1
npm -v    # Should show npm version - 10.8.2
```

2. Clone the repo and run it, as tested [here](https://jalcocert.github.io/JAlcocerT/creating-landing-pages-astro/#faq):

```sh
#git clone https://github.com/majesticooss/mizar
npm install

npm run dev --host #as i was using the Opi
npm run build
#npm install -g serve #serve with npm
#serve -s dist #http://localhost:3000
npx serve -s dist #http://localhost:3000
```

> Go to http://127.0.0.1:4321/

###### KeyStatic CMS with Astro

When you deploy the static site, the `whateverdomain.com/keystatic` path will still be there:

![KeyStatic statically deployed UI](/blog_img/web/staticcms/keystatic-ssg-deployed.png)

>But you wont be able to make any changes, as the server (Typescrypt API) is NOT running.

##### Static CMS

* https://github.com/StaticJsCMS/static-cms

> A Git-based CMS for Static Site Generators

{{< callout type="warning" >}}
Archived since SeptY24!
{{< /callout >}}



##### Decap CMS

* https://github.com/decaporg/decap-cms

> MIT | A Git-based CMS for Static Site Generators 

##### TinaCMS

* https://github.com/tinacms/tinacms

> Apache v2 | A fully open-source headless CMS that supports Markdown and Visual Editing


Tried it with: https://github.com/JAlcocerT/barebones-starter


---

## Conclusions

I cant stop seeing interesting sites out there...

* https://wyremontuje.pl/





### Product Analytics




{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics/Product_analytics" title="Product Analitycs Tools with Docker 🐋 ↗" >}}
{{< /cards >}}

1. PostHog
2. 

[![Star History Chart](https://api.star-history.com/svg?repos=posthog/posthog,usefathom/fathom,openreplay/openreplay,rrweb-io/rrweb&type=Date)](https://star-history.com/#posthog/posthog&usefathom/fathom&openreplay/openreplay&rrweb-io/rrweb&type=Date)


---

## FAQ


### What are Static Site Generators?

* https://github.com/plentico/plenti

> Apache v2 | Static Site Generator with Go backend and Svelte frontend 

### What are NginX Static Routes?

Think about having: SSG -> CMS, like `/keystatic` for UI edits -> CI/CD Builds as per git changes -> exposed via NGINX with https with some kind of authentication.


### Making Webs with AI

* https://github.com/rapidpages/rapidpages

> MIT | Generate React and Tailwind components using AI 


### How to setup StrapiCMS?

* <https://www.opensourcealternative.to/project/Strapi>
    * <https://docs.strapi.io/dev-docs/installation/docker>