---
title: "LinkHub Astro Theme with Pocketbase"
date: 2025-09-01T15:20:21+01:00
draft: false
tags: ["PB","Cloudflare Pages",CSR Guard"","SSG CSR SSR","Link Hub Theme with PB","Waiting2Landing v2"]
description: 'PB SDK for your waiting list BaaS. Take user forms and then switch to landing page.'
url: 'waiting-list-pocketbase'
---

**TL;DR**

Combining **PB**: `https://pocketbase.jalcocertech.com/_/` with CF Workers as [seen recently](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/#cloudflare-workers-auth) give us possibilities.

With the **waiting2landing concept** seen on [this post](https://jalcocert.github.io/JAlcocerT/how-to-create-a-waiting-list/), that was based
on an astro theme, you just decided which one to deploy statically via [the compose file](https://github.com/JAlcocerT/waiting-to-landing/blob/main/docker-compose.yml#L19)

> There was a formbricks plugged to it as per: `FORM_URL` and `FORM_EMAIL_FIELD_ID`

Now: how about (?) using PB to capture the email (no validation so far) and for people who provided it, they will be able to see a `/app` route, from where they will be able to fill a form to tell how they want to shape the product

> This is all about understanding [SSG vs CSR vs SSR](#ssg-vs-csr-vs-ssr). And what [SPA](#csr-vs-spa) can do.

**Intro**

How about using and let them see a CSR page.........

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing" title="Waiting to Landing Repo (v1.0) via Formbricks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Forked and Tweaked Astro Theme for waiting2landing concept" >}}
  {{< card link="https://github.com/JAlcocerT/payroll-workers-pb/" title="Forked Astro Payroll Theme" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Astro Theme + CF Workers + PB users collections as Auth" >}}  
{{< /cards >}}

.......like this one:

![LinkHub Astro Theme UI](/blog_img/web/waitingtolanding/link-hub.png)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/link-hub-pb/" title="NEW repository - Astro Link Hub" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Astro Theme + PB users collections as Auth via CSR Guard approach" >}}
  {{< card link="https://link-hub-1qd.pages.dev/" title="Tweaked Theme deployed to CF Pages" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Astro Theme + PB users collections as Auth via CSR Guard approach" >}}  
{{< /cards >}}

And tested the new tech stack with a v2.0 with the [waiting to landing idea](#a-better-waiting2landing): *vibe coded as per [this section](#a-better-waiting2landing)*

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing-pb" title="NEW repository - Waiting2Landing v2.0" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Waiting List + Landing Astro Themes with PB users collections saving Leads via CF Workers" >}}
{{< /cards >}}

How was that even possible?

## The Theme

I thought about going with the landing-page-book I commented [here](https://jalcocert.github.io/JAlcocerT/how-to-create-a-waiting-list/#astro-landing-pages--book-pages).

But saw the potential with this astro theme ~ linktree related.

* https://jalcocert.github.io/JAlcocerT/cool-link-in-bios/
* https://jalcocert.github.io/JAlcocerT/portfolio-website-for-social-media/

* https://hub-itsteddydev.vercel.app/
* https://github.com/tedevs0/hub-itsteddydev

> **MIT** |  Personal Hub is a template designed to centralize and organize personal or professional information in one place. This tool allows users to manage and access their data, projects, important links, and more, all from a unified interface. 

```sh
#git clone https://github.com/tedevs0/hub-itsteddydev
git clone https://github.com/JAlcocerT/link-hub-pb
npm install
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/ #useful to see from your phone how it looks
#sudo rm -r .git
```

What I liked about the theme:

1. Configurable via json and fully static (ssg)
2. Brings i18n working out of the box

{{< callout type="info" >}}
Auto-detect: Astro won’t pick browser language automatically for static sites. It renders both routes; you choose which URL to serve.
{{< /callout >}}

What I added: *and where its in the repo code*

1. [Signin/up pages](https://github.com/JAlcocerT/link-hub-pb/blob/main/signin-up.md)
2. [Connection to the login signup to pb](https://github.com/JAlcocerT/link-hub-pb/blob/main/signin-up-add-pb.md), similarly to what was done at  [this post](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/#ssg-x-pb)

*At some point we could even get [PB to do email verification](https://github.com/JAlcocerT/link-hub-pb/blob/main/pocketbase-email-verif.md)*

3. The magic happens at the `./scripts`

{{< callout type="warning" >}}
This setup [does NOT uses cloudflare workers and the *htpponly cookies*, but a simpler **CSR guard**](https://github.com/JAlcocerT/link-hub-pb/blob/main/client-side-protection-vs-workers.md) token approach to protect the `/app` route
{{< /callout >}}

4. Playing with the `./scripts/app-secrets.ts`, we can show to the users information available into a public json when they log in, or with more sense, see private information that only logged in people could see, powered by [a PB collection](https://github.com/JAlcocerT/link-hub-pb/blob/main/secrets-to-pb-collection.md), in this case called `repos`.

I followed [this .md for the setup](https://github.com/JAlcocerT/link-hub-pb/blob/main/programatic-collection-creation.md).

> As you add new records, they will be visible for the users :)

```sh
npm install "pocketbase": "^0.21.3"
```

Modify the `.env`:

```sh
PUBLIC_PB_BASE_URL=https://pocketbase.jalcocertech.com
```

Just push it to GH, if you want:

```sh
#sudo apt install gh
gh auth login
gh repo create link-hub-pb --private --source=. --remote=origin --push
```

And then to push towards CF Pages:

```sh
npm run build
#npx http-server ./dist -p 4321

#wrangler --version
wrangler pages deploy dist --project-name=link-hub --branch=main
#wrangler pages project list
```

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/alternatives-for-hosting-static-websites/" title="Static Hosting Alternatives ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-astro/" title="Astro SSG Static Hosting | Docker Config 🐋 ↗" >}}
{{< /cards >}}

---

## Conclusions

That was an interesting setup, but you probably come for the [waiting2landing v2 with pocketbase which is on **this repo**]().

> Executed on a different post with landings

**LinkHub with PocketBase**

> https://link-hub-1qd.pages.dev/

---

## FAQ

### SSG vs CSR vs SSR

#### CSR vs SPA

A Single-Page Application (SPA) is not *always* related to Client-Side Rendering (CSR).

But the two concepts are very closely linked and often used in tandem.

{{< callout type="info" >}}
SPA can be deployed statically, as seen on [this post section](https://jalcocert.github.io/JAlcocerT/front-end-and-auth/#fe-can-do-a-lot), for [serverless-invoices](https://github.com/JAlcocerT/serverless-invoices)
{{< /callout >}}

Here's the key distinction:

* **Single-Page Application (SPA):** This is a type of web application that loads a single HTML page and dynamically updates the content as the user interacts with it. This means that a user can navigate between different "views" of the application without a full-page reload. The core idea is to provide a seamless, app-like experience by handling navigation and state changes on the client.

* **Client-Side Rendering (CSR):** This is a *rendering technique* where the browser downloads a minimal HTML file (often just a `<div>` and some scripts) and then uses JavaScript to build and render the rest of the page's content. All the heavy lifting of generating the HTML, CSS, and dynamic content happens in the user's browser.

**The relationship is this:** The most common way to build an SPA is by using Client-Side Rendering. The JavaScript frameworks like React, Vue.js, and Angular were built around this model. The initial HTML is a blank slate, and the framework's JavaScript takes over to create the UI, fetch data from an API, and update the page without a full refresh.

**However, the "always" part of the question is where it gets interesting.**

Modern frameworks like Nuxt, Next.js, and SvelteKit... have blurred the lines by offering hybrid rendering approaches. 

These frameworks can be used to build what still feels like an SPA, but they can use a different rendering technique for the initial load. For example:

* **Server-Side Rendering (SSR) for the initial load:** A Nuxt application, for example, can be configured to use SSR. 

The server pre-renders the HTML for the first page the user requests. 

This is great for SEO and initial load performance. 

Once the page is loaded, the application "hydrates" and acts like a normal SPA, handling subsequent navigation and updates on the client-side without full-page reloads. 

This is often called a "Universal" application.

* **Static Site Generation (SSG) for all pages:** A framework like Astro or Nuxt can also generate every possible page as a static HTML file at build time. When a user visits the site, they get a pre-built, fast HTML file.

The pages can then have small "islands" of JavaScript that enable interactivity and SPA-like navigation, but they don't rely on the client to render the entire page from scratch.

This is a powerful way to get the performance benefits of a static site with the interactivity of an SPA.

So, while CSR is the foundational technique for building traditional SPAs, the modern web development landscape has evolved to allow for SPAs to be built with a variety of rendering strategies, including SSR and SSG, to improve performance, SEO, and user experience.