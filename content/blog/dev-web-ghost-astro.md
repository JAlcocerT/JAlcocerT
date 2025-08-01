---
title: "Editing Astro Websites via Headless Ghost CMS"
date: 2025-05-19T22:20:21+01:00
draft: false
description: "Connecting Ghost CMS to work with Astro Themes. Compared with Editing Astro via JSON."
url: 'ghost-cms-for-astro'
tags: ["Web","CMS","Ghost","Astro SSG","n8n"]
---


Thanks to:

1. https://www.yzlow.com/build-a-custom-static-site-with-headless-ghost-astro
2. https://github.com/MatthiesenXYZ/astro-ghostcms and https://github.com/MatthiesenXYZ/ghostcms-loader/tree/main

...for resources to put this together.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/morita-web" title="Morita Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Sample Astro Theme" >}}
  {{< card link="https://github.com/JAlcocerT/taxi-web" title="Taxi Web Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Tinkering with Astro + JSON/Ghost CMS API" >}}
{{< /cards >}}

It's been an idea for sometime to **bring a website to anyone who has something to say.**

But its always about how to bring the edition capabilities to the public.

Even during the [Dokploy PaaS Post](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/#scaling-ssg-deployment), I posted the steps for scaling a SSG deployment.

The https part is covered with the built in Traefik, or a custom one, if you want.

The container for SSGs are not a mistery

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/SSGs" title="SSG Containers | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

So...how about the editing capabilities?

Because doing this via IDE might not be for everyone:

```sh
npm install
#npm run dev
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

## Astro and JSON Powered Content

Sometime ago I got to know this Astro theme: 

* https://github.com/vbartalis/energy-template
* https://vbartalis.github.io/energy-template/

And as per its **MIT** License, its a great skeleton to build, for example website for Taxi Drivers:

```sh
#git clone https://github.com/vbartalis/energy-template
git clone https://github.com/JAlcocerT/taxi-web
cd energy-template
```

## Ghost Setup

Get your Ghost CMS up and running locally/on a VPS as seen [here](https://fossengineer.com/selfhosting-ghost-docker/)

```sh
git clone https://github.com/JAlcocerT/taxi-web 
sudo docker compose up -d #I have included the ghost setup here

cd ./astro-ghost-sample/major-matter
#npm run dev

npm run dev -- --host 0.0.0.0 --port 4321

#npm run build
#sudo npm run preview -- --host 0.0.0.0 --port 8080
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web" title="Web Related Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/taxi-web/blob/main/docker-compose.yml" title="Ghost Setup Docker Config 🐋 ↗" >}}
{{< /cards >}}


If you are ready with Ghost up and running, go the the settings:

![Ghost CMS Settings](/blog_img/web/ghost/ghost-settings.png)


### Configuring Ghost x Astro 101

**IMPORTANT**: This will be **API based CMS Setup**, so make sure to do proper ghost containers backup!

*For Git based, see this KeyStatic related post*

We will need to:

1. Clone the Astro Theme
2. Bring Ghost up and get its API credentials
3. Create a `env.local` with

```
GHOST_CONTENT_API_URL=http://your-ghost-url:2368
GHOST_CONTENT_API_KEY=your_content_api_key
```

4. Create your @utils/ghost-client, like [this one](https://github.com/JAlcocerT/taxi-web/blob/main/astro-ghost-sample/morita-ghost/src/utils/ghost-client.js)

5. Install the ghost artifacts:

```sh
npm install @tryghost/content-api @tryghost/helpers
```

And we are pretty mach ready to go.

**See these snippets for reference:**

Get the API Keys. Ive also noticed the [webhook](#ghost-webhooks) part!

![alt text](/blog_img/web/ghost/ghost-api.png)

Ive got few created posts that are now rendered like so:

```sh
npm run dev -- --host 0.0.0.0 --port 4321

npm run build
sudo npm run preview -- --host 0.0.0.0 --port 8080
npx serve -s dist -l 8080
#sudo python3 -m http.server 80 --directory dist
```

![Ghost Posts Rendered to Astro](/blog_img/web/ghost/ghost-posts-connected-astro.png)

And blog edits, like making some part bold, also works:

![alt text](/blog_img/web/ghost/ghost-editing-post.png)

You can also bring the about page written in ghost, so that is reflected in astro as well:

![alt text](/blog_img/web/ghost/ghost-page-to-astro.png)

For that you will need such file: https://github.com/JAlcocerT/taxi-web/blob/main/astro-ghost-sample/major-matter/src/pages/about.astro

Anf if you pay attention, this is all we do in the main page: https://github.com/JAlcocerT/taxi-web/blob/main/astro-ghost-sample/major-matter/src/pages/index.astro

We are fetching via Ghost API all the posts:

```js
---
import Layout from '@layouts/Layout.astro';
import ghostClient from '@utils/ghost-client';
const posts = await ghostClient.posts.browse({ limit: 'all', include: ['tags', 'authors'] }); //THIS BRING THE INFORMATION!!!
---
<Layout>
  <main>
    <h1>Ghost Blog Posts</h1>
    {posts.length === 0 ? (
      <p>No posts found.</p>
    ) : (
      <div class="post-feed">
        {posts.map((post) => (
          <article>
            <h2>{post.title}</h2>
            <div set:html={post.html} />
          </article>
        ))}
      </div>
    )}
  </main>
</Layout>
```

With Astro + Ghost as you’ve set it up:

Astro fetches content from Ghost’s API at build time (using the Content API).
You can programmatically decide what to do with that content:
Main page: Show a list of posts, a welcome message, etc.
About page: Fetch and render a specific Ghost page by its slug.
All pages: Use a dynamic route ([slug].astro) to render every Ghost page as a static route.
Blog posts: Use a dynamic route (e.g., /blog/[slug].astro) to render all posts.
You have full control in Astro to:

Render just the pages you want (e.g., only /about).
Or, render everything Ghost provides, automatically creating static pages for each one.


{{< callout type="info" >}}
I have captured the learning of this simple setup on [this markdown](https://github.com/JAlcocerT/taxi-web/blob/main/ghost-astro.md). 
{{< /callout >}}

We have so far: Astro acting as the static site builder, Ghost is your content source, and you decide how to map Ghost’s API content to your site’s routes and pages. 

This gives you flexibility and a modern, fast, and easy-to-manage site!

But what if we want to add programatically any page that it is created via Ghost UI?

And how about...having it rendered into a cool astro theme, not just some simple template?

#### Ghost x Astro Theme

To do so, lets switch gears and use it for the psychology related site [Ive built here](https://github.com/JAlcocerT/morita-web) and explained on [this post](https://jalcocert.github.io/JAlcocerT/docplanner-web-migration/).

Follow the steps of the [previous 101 explanation](#configuring-ghost-x-astro-101).

And bring these artifacts to the `.env.local`

```
GHOST_CONTENT_API_URL=http://192.168.1.11:2368
GHOST_CONTENT_API_KEY=
GHOST_ADMIN_API_KEY=
SITE_URL=http://192.168.1.11:4321
```

{{< callout type="info" >}}
I have captured the learning of this simple setup on [this 201 markdown](https://github.com/JAlcocerT/taxi-web/blob/main/ghost-astro-201.md). 
{{< /callout >}}


```sh
#git clone https://github.com/JAlcocerT/taxi-web 
#sudo docker compose up -d #I have included the ghost setup here

cd ./astro-ghost-sample/morita-ghost
#npm run dev

npm run dev -- --host 0.0.0.0 --port 4321

npm run build
#sudo npm run preview -- --host 0.0.0.0 --port 8080
#npx serve -s dist -l 8080
sudo python3 -m http.server 8080 --directory dist
```

The initial version creates the work section by rendering all markdown posts that it finds under:

Its all due to: https://github.com/JAlcocerT/WebifAI/blob/main/Astro-Themes/morita-web/src/pages/work/%5B...slug%5D.astro#L18

Se we have to adapt the *markdown rendering approach*

```js
import { type CollectionEntry, getCollection } from 'astro:content';
// ... code ...
export async function getStaticPaths() {
  const work = await getCollection('work');
  return work.map((entry) => ({
    params: { slug: entry.slug },
    props: { entry },
  }));
}
```

So that it pulls posts that are defined as per ghost API:

```js
import ghostClient from '@utils/ghost-client';
// ... code ...
export async function getStaticPaths() {
  const posts = await ghostClient.posts.browse({ limit: 'all', filter: 'tag:work' }); //ONLY THE ONES WITH A TAG DEFINED ON GHOST UI WILL RENDER!
  return posts.map((post) => ({
    params: { slug: post.slug },
    props: { post },
  }));
}
```


Once you have done the tweaks, it will look like:

![Ghost x CMS Post](/blog_img/web/ghost/ghost-cms-posts.png)

So you will need to give proper promps to that the initial asto theme design is mantained, just pulling the info written in ghost:

![alt text](/blog_img/web/ghost/ghost-cms-post-rendered.png)

Your current setup uses **Ghost as a headless CMS**.

Here’s how it works:

Ghost runs as a backend/content management system (in your Docker container).

You create and manage posts, images, and metadata via the Ghost Admin UI.

Astro (your frontend static site) pulls content from Ghost using the Ghost Content API at build time (or runtime, if desired).

The content (posts, images, tags, etc.) is fetched via API calls (not by reading Ghost’s HTML or database directly).

Astro renders the content into your custom layouts and components, giving you full control over the presentation.
Benefits:

* You get a modern, user-friendly CMS for editing content.
* Your frontend is fast, secure, and fully customizable.
* You can deploy your static site anywhere, and simply rebuild it when Ghost content changes.

## Ghost WebHooks

* https://ghost.org/docs/webhooks/

### Ghost x N8N

Who said about writing AI Driven content?

* https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.ghost/

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/NoCode/n8n" title="N8n Docker Config 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Chats/Chatwoot" title="ChatWoot Docker Config 🐋 ↗" >}}
{{< /cards >}}

### N8N x MCP

If you already made the [n8n setup](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#n8n), congratz!

You can also use n8n with MCP:

<!-- 
https://www.youtube.com/watch?v=c9E-tDyKy_A -->

{{< youtube "c9E-tDyKy_A" >}}


## Hosting Ghost Powered Astro Theme

There are few [alternatives to host static websites](https://fossengineer.com/alternatives-for-hosting-static-websites/), as I tinkered with [here](https://fossengineer.com/hosting-static-websites/).

If you dont want to use Cloudflare Pages you can go the Selfhosting static website approach via container:


```sh
docker compose up astro-prod astro-dev
#docker system prune -a
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web" title="Web Related Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/StaticWebServer" title="Selfhosted Static Hosting - Docker Configs 🐋 ↗" >}}
{{< /cards >}}

### Reviewing the SSG Quality

* https://pagespeed.web.dev/
* https://web-check.xyz/

```sh
docker run --rm -it -u $(id -u):$(id -g) ghcr.io/linkchecker/linkchecker:latest --verbose https://libreportfolio.fyi/ > Review_links_libreportfolio.txt
```

---

## Conclusions



### Why that much love to Astro

I have been writting about [astro components](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/) sometime ago.

But now, with vibe coding, nothing should be stopping you to create your own. 

See these ideas of fully static components

* [Whatsapp bouble](https://github.com/JAlcocerT/WebifAI/blob/main/Astro-Themes/morita-web/src/components/WhatsappBubble.astro)
* [TG bouble](https://github.com/JAlcocerT/WebifAI/blob/main/Astro-Themes/morita-web/src/components/TelegramBubble.astro)
* For youtue videos or Komoot, you can simple use the iframe to embed
* But for twitter/X, you will need some ReactJS tricks, and put together a component like this

#### Embedding ChatBots

From Chatwoot to N8N and FlowiseAI, why not bringing those?

There are many [no code AI tools](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#n8n) that can change *for better* your website experience:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Chats/Chatwoot" title="ChatWoot with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/NoCode/n8n" title="N8N with Docker 🐋 ↗" >}}
{{< /cards >}}


It's not just about n8n embeddedd chat, but scrapping capabilities:

{{< youtube "AhyO9AVm49k" >}}
<!-- https://www.youtube.com/watch?v=AhyO9AVm49k -->


### OSS for Selfhosted Blogs

* https://github.com/ddoemonn/next-blog

> **MIT** | self-hosted blog platform built with next.js 

### Other Websites Ive worked

07/25 version

https://github.com/majesticooss/astros/discussions/56
https://github.com/majesticooss/astros
https://ioracing-iotechcrafts.web.app/blog/unleashing-the-power-of-tailwind-css/