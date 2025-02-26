---
title: "Real Estate Project Updates"
date: 2025-02-26T10:20:21+01:00
draft: false
tags: ["Dev"]
description: 'RE Gen AI App, RE Calculator and a RE Website (with Astro). Combo.'
url: 'real-estate-website'
math: true
---

<!-- 
https://github.com/JAlcocerT/cybernetik-realestate-moises 
https://dm-realestate.web.app/
-->

For the current web UI status:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Real Estate Project 1st Iteration ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/ScrewFastMoiRealEstate" title="The Source Code, using Screw Fast MIT Theme ↗" icon="book-open" >}}
{{< /cards >}}

Improvements:

1. [DaisyUI CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-web-code-css/#daisyui) for Carousels, FAQ,...


{{< details title="Adding DaisyUI to Astro Themes | Cybernetic 📌" closed="true" >}}


As always, I got amazed with other themes, like:

* https://github.com/codexcodethemes/cybernetic-free
  * https://cybernetic-free-version.netlify.app/

```sh
git clone https://github.com/codexcodethemes/cybernetic-free
npm install 
npm audit fix

npm run dev #localhost:4321
#rm -rf .git
```

Apparently, at `/src/static/images/index.tsx` you can choose the **Hero images**.

Create the `tailwind.config.js` and **add**:

```js
/** @type {import('tailwindcss').Config} */
    module.exports = {
      content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],
      theme: {
        extend: {},
      },
      plugins: [require("daisyui")],
    };
```

Install **firebase CLI** as [static deployment](https://fossengineer.com/alternatives-for-hosting-static-websites/):

```sh
npm install -g firebase-tools

firebase login
firebase init
#firebase deploy

#firebase hosting:channel:list
#firebase hosting:channel:delete <channelId>
```

> It will be under `someprojectname.web.app` and you can revoke permissions at https://github.com/settings/connections/applications/89cf50f02ac6aaed3484

**And 2 `.yml` files** with a [GHA Workflow for the Firebase deployment](https://github.com/JAlcocerT/cybernetik-realestate-moises/tree/main/.github/workflows) are already configured

{{< /details >}}

For the real estate **calculator** app part...

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/" title="DBs for DA ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="BI Tools for DA ↗" icon="book-open" >}}
{{< /cards >}}

I almost forgot...the **GenAI Real estate Chat part**!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

![Like this pattern](/blog_img/apps/knitting/pattern.png)

## Real Estate Web UI Enhancements


{{% details title="Themes Considered: ScrewFast, Nebulix, AstroFront...  🚀" closed="true" %}}

1. https://github.com/mearashadowfax/ScrewFast

> MIT | Open-source Astro website template with sleek, customizable TailwindCSS components.

2. https://github.com/unfolding-io/nebulix

> Nebulix, a Fast & Green Theme Based on Astro + Static CMS + Snipcart


```sh
git clone https://github.com/unfolding-io/nebulix
#.env
```

With very interesting components at `/src/content/project/crafting-the-perfect-cosmic-mojito.mdx`

```sh
#/src/content/project

#mogrify -format jpg *.avif #the images have to be jpeg or jpg to be zoomable
```

> http://localhost:4321/work/crafting-the-perfect-cosmic-mojito/



3. https://github.com/themefisher/astrofront-astro

> MIT | AstroJS-Powered Shopify Storefront Boilerplate with TailwindCSS and Nanostores. With **Shopify ecommerce integration.**

```sh
git clone https://github.com/themefisher/astrofront-astro

npm install
#npm audit fix
npm run dev #you will need shopify credentials for the .env
```

4. https://github.com/oxygenna-themes/foxi-astro-theme Which has an interesting /blog section with tags

> MIT | Foxi is an Astro theme crafted with Tailwind CSS, designed for blazing-fast performance and seamless user experience. Perfect for creating modern, responsive SaaS websites with minimal effort.

You can see the blogs at `/src/pages/blog` folder, after:

```sh
git clone https://github.com/oxygenna-themes/foxi-astro-theme

npm install & npm audit fix
npm run dev #localhost:4321
#npx astro add mdx #npm install @astrojs/mdx

#npm install vue @panzoom/panzoom @vueuse/core @nanostores/vue @vueuse/components @vueuse/integrations vue3-toastify body-scroll-lock vue3-popper
```

```js
// astro.config.mjs
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';

export default defineConfig({
  integrations: [mdx()],
});
```

Remember that you need to migrate also the content collection for `/src/pages/blog` and to update `/src/content/config.ts` to define what are the fields expected on the new collection (for example we can call it properties instead of blog).

```sh
npm install -D tailwindcss@latest @tailwindcss/vite@latest daisyui@latest
```

{{% /details %}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/dev-web-code-css/" title="CSS 101 ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/" title="JS 101 ↗" icon="book-open" >}}
{{< /cards >}}

## Conclusions

This is kind of a **three in one project**:

1. Responsive **Web** UI
2. **Real Estate Calculator** to engage users and potential clients
3. **Gen AI App** to provide recommendations based on the available houses
4. **Scrapping Tool** to get Photos automatically

**Result**: <https://dm-real-estate.com/> or https://moises-era.pages.dev (vs) https://dm-realestate.web.app/

{{< callout type="info" >}}
And with an interesting tool to get the photo properties automated
{{< /callout >}}

> Still, would you keep your Wordpress, Ghost, Wix?

---

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}