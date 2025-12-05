---
title: "Trying Nuxt & VitePress"
date: 2025-11-18
draft: false
tags: ["Dev","Nuxt","NUXT Content CMS","Nuxt Canvas Theme x Resend","adsense"]
description: 'Testing NUXT & VitePress Themes. SSG Recap to the learnings of HUGO and Astro.'
url: 'trying-nuxt-themes'
---

<!-- Add dynamic content about you
https://docs.astro.build/en/tutorial/2-pages/3/ -->

<!-- https://www.youtube.com/watch?v=NniT0vKyn-E -->


**TL;DR**

Ive had pening for a while to try Nuxt, and I think it is a great framework for building **[full-stack web applications](https://jalcocert.github.io/JAlcocerT/waiting-list-pocketbase/#csr-vs-spa) and websites with Vue.js**.

Nuxt Content CMS and its ambicious roadmap (a full MIT git based CMS) was a great surprise too: https://content.nuxt.com/docs/studio/roadmap


**Intro**

Almost the end of the year, time to **try out some new SSG**.

This time it is the turn of **Nuxt**

* https://github.com/HugoRCD/canvas

> Apache v2 | Portfolio template made with Nuxt 3, Nuxt Content v3, NuxtUI v3 and TailwindCSS v4 

The theme brings [multilanguage/i18N](https://jalcocert.github.io/JAlcocerT/astro-i18/) working out of the box!

The first thing I noticed: it takes much more time to load compared to Astro or NextJS sites, and much more than HUGO.

You just need **2 things**: NPM and NodeJS.

* https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
* https://nodejs.org/en/download/package-manager


{{< details title="Setup Node and NPM - x86/ARM64/ARM32 📌" closed="true" >}}

```sh
sudo apt update && sudo apt upgrade

#install NodeJS https://deb.nodesource.com/
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs

# Verify installation
node -v   # Should show Node.js version - 20.18.1
npm -v    # Should show npm version - 10.8.2
```

{{< /details >}}


And the repo :)

![Nuxt Canvas Theme](/blog_img/dev/nuxt/nuxt-canvas.png)


{{< dropdown title="Bun | Example with NUXT - HUGO Canvas and Resend ⏬" closed="true" >}}

* Example - https://github.com/HugoRCD/canvas
	* Contact Forms with: https://resend.com/signup - Email for developers (https://resend.com/pricing)

> Really cool Portfolio template made with Nuxt 3, Nuxt Content and TailwindCSS

```sh
#git clone https://github.com/HugoRCD/canvas
git clone https://github.com/JAlcocerT/canvas
#bun install
#bun dev #dev server
#bun generate #static proy
#bun start #prod server
```


You can spin a server and make **ASTRO [Remote Development](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker)** in it.

Specially because the theme brings docker compose support:

```sh
sudo docker compose -f docker-compose.local.yml up -d
#sudo docker compose -f docker-compose.local.yml down
```

{{< /dropdown >}}


The Canvas theme was so great to me, that i decided to fork it to understand it better:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/canvas" title="NEW repository - Canvas Fork" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Testing NUXT and NUXT Content CMS for a blog" >}}
{{< /cards >}}

What I liked:

```sh
#make help
make install
make dev
```

> See at `localhost:3000`

0. NuxtCMS integration

![alt text](/blog_img/dev/nuxt/nuxt-cms-live-editing.png)

1. The search+tag system working together: *and also during dev*

![alt text](/blog_img/dev/nuxt/nuxt-search-tags.png)


2. The docker compose support out of the box: *i just added the makefile*

```sh
make docker-up
```


3. Static build and serving:

```sh
make generate
#@npx serve .output/public
#cd .output/public && python3 -m http.server 8080
```

only to realize that something is off...


4. Cloudflare D1 Database x NUXT CMS?

When using serverless platforms, it's important to note that Nuxt Content v3 relies *by default on SQLite* for content storage.

Since these platforms do not support SQLite natively, we recommend connecting Canvas Portfolio to an external database such as:

-  **PostgreSQL**
-  **Turso**
-  Cloudflare **D1**

{{% details title="About CF D1 x Nuxt Content Git based CMS 🌍" closed="true" %}}

Cloudflare D1 is a **managed, serverless SQL database** offered by Cloudflare. 

It is built on the **SQLite** query engine, giving it familiar SQL semantics, but optimized to run on Cloudflare's global network, particularly alongside **Cloudflare Workers** and **Pages** projects. 

The key features of D1 are:

* **Serverless:** No infrastructure to manage, provision, or scale. It's usage-based pricing.
* **Edge Deployment:** Designed to eventually store data closer to your users globally, resulting in lower latency for read operations (though currently, write operations are generally routed to a single primary location).
* **SQLite Compatibility:** Uses a familiar SQL dialect, making it easy to integrate with existing ORMs and tooling.
* **Built-in Features:** Includes disaster recovery, backups, and a "Time Travel" feature for point-in-time recovery.

**🤝 Relationship to Nuxt Content**

**Nuxt Content** is a module for Nuxt applications that turns files (like Markdown, YAML, or JSON) into a powerful, database-like API.

By default, Nuxt Content reads these files directly from your repository and processes them at build time or during development. However, for a fully dynamic or large-scale application deployed on Cloudflare, **Cloudflare D1 provides an optional, persistence layer for that content.**

The relationship works like this:

1.  **Deployment Target:** Nuxt Content is designed to integrate with the **Cloudflare Pages** deployment preset.
2.  **Database Integration:** The module automatically detects the Cloudflare Pages environment and configures itself to use a D1 database binding (typically named `DB`).
3.  **Content Persistency:** Instead of reading files from the file system, the Nuxt Content module can use the D1 database to store and query your content. This makes your content dynamic and allows it to be updated or retrieved globally via the D1 database.
4.  **Full-Stack DX (Developer Experience):** Tools like **NuxtHub** and specific Nuxt modules simplify the process, allowing you to easily connect your Nuxt 3 application's API routes (running on Cloudflare Workers) to D1 for content and data management.

In essence, D1 transforms Nuxt Content from a module that works primarily with static files into a truly **full-stack, globally distributed CMS backend**.

This video provides an overview of how to connect and use D1 within a Nuxt application: [Cloadflare D1 database in Nuxt](https://www.youtube.com/watch?v=sKBlwlyLxSo).

That is absolutely correct!

If your goal is to create a blog using **Nuxt Content** and deploy it statically, you can and should use **Static Site Generation (SSG)** mode.

Yes, You Can Deploy Statically (SSG) 💯

You can treat Nuxt Content exactly like you would treat Astro or any other static site generator (SSG).

1.  **No D1 (or Database) Required:** If you are only using the files (Markdown, YAML, etc.) stored in your local repository's `content/` directory, you **do not need Cloudflare D1**, SQLite, or any other database.
2.  **Build Time Rendering:** In SSG mode (often configured using `ssr: true` and a static adapter), Nuxt Content reads all your Markdown files during the build process (`npm run build`). It renders every page into a static HTML file.
3.  **Deployment:** The resulting output folder (typically `.output/public` or `dist`) contains only HTML, CSS, and JavaScript. You can deploy this entire folder to any static hosting provider (Netlify, Vercel, Cloudflare Pages, GitHub Pages, etc.).

**How Nuxt Content Works in SSG Mode**

The `nuxt-content` module acts as a powerful parser and query engine *at build time*:

| Component | SSG Mode Behavior |
| :--- | :--- |
| **Data Source** | Reads files directly from the local `content/` directory. |
| **API** | The Content API (`/api/_content...`) is pre-rendered into static JSON files during the build. |
| **Dynamic Features**| Any dynamic content is usually handled by client-side JavaScript fetching the pre-rendered JSON. |
| **Persistence** | None required; the HTML and JSON are the "persistence." |

**💡 When You *Would* Need D1**

You would only need to consider Cloudflare D1 if:

1.  You want a **true CMS backend** where you can update content **without redeploying** the entire site (i.e., you want to update content via an API/UI).
2.  You have a large, highly dynamic site where querying content live is necessary, and you are deploying on the Cloudflare ecosystem (Workers/Pages).

For a typical blog where you update content by committing a new Markdown file, **SSG is the simplest and fastest way to deploy.**

Would you like help setting up your `nuxt.config.ts` file for optimal SSG deployment?

{{% /details %}}


5. Integration with Resend mail API to get leads

![Resend mail API working with NUXT Canvas Theme](/blog_img/dev/nuxt/resend-nuxt-canvas.png)

## About Nuxt

Nuxt is a free and **open-source framework** (not an SSG!) 

Wth an intuitive and extendable way to create type-safe, performant and production-grade **full-stack web applications and websites with Vue.js**.

* https://github.com/nuxt/nuxt
  * https://nuxt.com/deploy
    * https://nuxt.com/templates
    * https://nuxtjstemplates.com/

> **MIT** | The Intuitive Vue Framework.

Nuxt and Next.js both offer full stack features but have differences reflecting their Vue and React bases, respectively.

**Nuxt Full Stack Features**

- Nuxt (based on Vue) provides built-in server-side rendering (SSR), static site generation (SSG), automatic routing, and zero-config TypeScript support. It includes a server framework to create APIs, handle backend logic, and fetch data from databases within the same codebase.
- It uses Vite as a bundler for fast development with hot module replacement and code splitting.
- Nuxt emphasizes convention-over-configuration, providing a modular architecture with pre-built modules for authentication, PWA support, and SEO optimization, speeding up development.
- The Nitro engine in Nuxt enables flexible deployment targets and backend functionality, supporting a full-stack experience seamlessly integrated with Vue syntax.

| Feature                          | Nuxt (Vue)                           | Next.js (React)                      |
|---------------------------------|------------------------------------|------------------------------------|
| Base Framework                  | Vue.js                             | React                              |
| SSR / SSG Support               | Built-in SSR & SSG                 | SSR, SSG, and advanced ISR          |
| Backend/API Handling            | Built-in server framework (Nitro) | API routes for backend logic        |
| Development Speed              | Convention-over-configuration      | More configuration, flexible       |
| Performance                   | Fast with Vite bundler              | High performance with Turbopack (upcoming) |
| Deployment Integration         | Supports various targets            | Optimal integration with Vercel     |
| Ecosystem & Community           | Smaller but active Vue community   | Larger React ecosystem and tooling  |

Overall, Nuxt excels in developer velocity for Vue-based full stack apps with intuitive setup and modularity, while Next.js offers greater flexibility, advanced React features, and scalability for complex projects.

Nuxt is an open-source, full-stack framework for building **web applications using Vue.js**.

It simplifies the development of complex applications by providing an opinionated structure, automatic routing, and multiple rendering modes out of the box.

> Nuxt is inspired by Next.js, a similar framework for React.


**Nuxt and SSG (Static Site Generators)**

Nuxt is not just a static site generator, but it can act as one. 

It offers several rendering modes, including static site generation (SSG), which puts it in a similar category to frameworks like Astro or Hugo, but with some key differences.

**Nuxt's Rendering Modes**

Nuxt provides a **versatile rendering system** that allows you to choose the best approach for your project:

1.  **Single-Page Application (SPA):** The entire application is rendered by the browser after it loads the initial HTML, CSS, and JavaScript. This is the traditional way of building a Vue app, and it's great for highly interactive web apps.
2.  **Server-Side Rendering (SSR):** The server renders the initial HTML for each page, which is then sent to the browser. This improves initial load performance and SEO. Once loaded, the page becomes a fully interactive SPA. Nuxt calls this "Universal" rendering.
3.  **Static Site Generation (SSG):** Nuxt generates a static HTML, CSS, and JavaScript file for each page at build time. These files can be served from any static host or CDN. This provides the best performance and security and is ideal for content-heavy sites like blogs or documentation. 

**Nuxt and JavaScript ☕️**

Nuxt is deeply rooted in JavaScript, as it's built on top of the Vue.js framework, which is a JavaScript library for building user interfaces.

{{< callout type="warning" >}}
See more about [TS](https://jalcocert.github.io/JAlcocerT/whats-typescript/) and [JS Frameworks](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/)
{{< /callout >}}

It uses JavaScript to handle almost every aspect of an application, from front-end interactivity to server-side logic.

* **Vue.js:** Nuxt is a meta-framework for Vue.js. It leverages Vue's component-based architecture and reactivity system. All the components and pages you create in a Nuxt application are essentially Vue components written in JavaScript (or TypeScript).
* **Node.js and Nitro:** Nuxt's server-side capabilities are powered by a server engine called **Nitro**, which is built on Node.js. This allows Nuxt to run JavaScript code on the server, which is essential for features like Server-Side Rendering (SSR) and API routes.
* **Tooling:** Nuxt integrates popular JavaScript build tools like **Vite** or **Webpack** to bundle and optimize your application's code for production.



### Nuxt Content CMS

If you have been finding that connecting a CMS to a SSG is hard, Nuxt Content CMS is a great option.

* https://github.com/nuxt/content

> MIT | The powerful Git-based CMS designed specifically for Nuxt developers.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nuxt-content" title="Nuxt Content CMS | Docker Config 🐋 ↗" >}}
{{< /cards >}}


{{< youtube "vgCPAtMwDxA" >}}
<!-- 
https://www.youtube.com/watch?v=vgCPAtMwDxA -->




#### **Nuxt vs. Astro and Hugo**

While all three can be used to generate static sites, they have different philosophies and use cases:

* **Hugo:** This is a **pure static site generator** written in Go. Its primary focus is on lightning-fast build times and serving static content. It's not a JavaScript framework, so it doesn't provide the same level of client-side interactivity or component-based development as Nuxt or Astro. It's best suited for blogs, portfolios, or documentation websites where content is king and interactivity is minimal.

* **Astro:** Astro is a **modern SSG** that champions a "zero-JS by default" approach. It uses a unique "Islands Architecture," where pages are pre-rendered to static HTML, with small, interactive "islands" of JavaScript-enabled components added only where needed. This results in incredibly fast websites with a minimal JavaScript payload. Astro is framework-agnostic, meaning you can use components from different frameworks like Vue, React, or Svelte within the same project. It is great for content-heavy sites that need a bit of interactivity.

* **Nuxt:** Nuxt is a **full-stack Vue framework**. While it can be used as an SSG, its main strength lies in its ability to build complex, full-stack applications with server-side rendering, API routes, and a rich ecosystem of modules. Nuxt ships with more JavaScript by default than Astro, as its core philosophy is building a complete, cohesive application, whether it's an SPA, SSR, or SSG.



---


## Conclusions

The good thing about SSGs is that they power content with markdown.

Allowing you to plug easily these kind of LLMs:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

Dont forget to validate the web performance:

{{< hextra/feature-grid >}}
 
{{< hextra/feature-card
  title="Google Speed Test"
  subtitle="Test the speed and performance with PageSpeed Insights."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://pagespeed.web.dev/"
>}}

{{< hextra/feature-card
  title="Website Carbon"
  subtitle="Website’s carbon footprint and environmental impact."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(142,53,74,0.15),hsla(0,0%,50%,0));"
  link="https://www.websitecarbon.com/"
>}}

{{< hextra/feature-card
  title="Web-Check"
  subtitle="Performance and uptime using Web-Check's analytics tool."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://web-check.xyz/"
>}}

{{< /hextra/feature-grid >}}



### And...VitePress SSG

VitePress is a **Vue-powered static site generator** and a spiritual successor to [VuePress](https://jamstack.org/generators/vuepress/), built on top of Vite.


* https://github.com/vuepress/awesome-vuepress

* https://github.com/vuejs/vitepress

> MIT | Vite & Vue powered static site generator.

Effortlessly create **beautiful documentation sites with just markdown**.

```sh
#npx vitepress init
npm install vitepress --save-dev

#npm run docs:dev
npx vitepress dev docs #go to localhost:5173 and there you go!
```

```sh
git clone https://github.com/vuejs/vitepress
cd vitepress/docs
npm install
npm run dev
```

Have a look to: https://vitepress.dev/guide/routing

> VitePress is a **Vue-powered** static site generator and a spiritual **successor to VuePress**, built on top of Vite.


--- 

## FAQ


{{< details title="Good Practices for Web Repositories📌" closed="true" >}}

* Add a `.gitignore` and include the `node_modules` folder

```
node_modules
```

* Add a **docker ignore** if you plan to build images:

```
#add .env files if any
```

{{< /details >}}


### Outro

* Where to get Free SVGs for my SSG:
  * https://www.svgrepo.com/svg/424489/adventure-journey-location?ref=fossengineer.com
  * https://fontawesome.com/?ref=fossengineer.com

* How to choose proper HEX colors:
  * https://github.com/Toinane/colorpicker?ref=fossengineer.com -  A mininal but complete colorpicker desktop app 
    * https://colorpicker.fr/app/?ref=fossengineer.com - you can try it online as well
  * https://github.com/eigenmiao/rickrack?ref=fossengineer.com -  Generate harmonious colors freely. 
  * https://huey.design/?ref=fossengineer.com

Brand colors with F/OSS

* https://colorpicker.fr/app/?ref=fossengineer.com
* https://huey.design/?ref=fossengineer.com
* https://leonardocolor.io?ref=fossengineer.com
  * https://github.com/adobe/leonardo?ref=fossengineer.com -  Generate colors based on a desired contrast ratio  - Apache v2

  Icons for NextJS

* https://github.com/twbs/icons?ref=fossengineer.com (MIT ❤️ Licensed SVG icons)
  * https://icons.getbootstrap.com?ref=fossengineer.com

```sh
npm i bootstrap-icons
```

> Official open source SVG icon library for Bootstrap.

* Look for icons with - https://github.com/antfu-collective/icones (MIT ❤️)
  * https://icones.js.org/

> ⚡️ Icon Explorer with Instant searching, powered by Iconify

* https://github.com/iconify/iconify (MIT ❤️)
  * https://iconify.design/docs/iconify-icon/
  * example - https://icon-sets.iconify.design/uil/bitcoin-circle/

```sh
npm install --save-dev @iconify-icon/react
```

> Universal icon framework. One syntax for FontAwesome, Material Design Icons, DashIcons, Feather Icons, EmojiOne, Noto Emoji and many other open source icon sets (over 150 icon sets and 200k icons). SVG framework, React, Vue and Svelte components!

* https://fontawesome.com/v5/search?o=r&m=free
  * https://fontawesome.com/license/free
  * https://github.com/FortAwesome/Font-Awesome

> And more! Font Awesome works with Require.js, Rails with Turbolink, and jQuery!

* https://github.com/lightvue/light-icons (MIT ❤️)
  * https://icons.lightvue.org/icons

add this to your css

```css
@import "../../node_modules/light-icons/dist/light-icon.css";
```

> Handpicked collection of premium & light-wighted icons as font



* https://github.com/tabler/tabler-icons
* https://icons.getbootstrap.com/
* https://github.com/tabler/tabler-icons
* https://iconoir.com/
* https://github.com/iconic/open-iconic#License-1-ov-file

* https://github.com/feathericons/feather (MIT Licensed)

> Simply beautiful open-source icons

* Icons for dashboards
  * https://github.com/walkxcode/dashboard-icons?tab=readme-ov-file

FavIcons for NextJS

* Just use {{< newtab url="https://realfavicongenerator.net/" text="Real Fav Icon Generator 😍" >}} and place in the the proper folder (where the default icons are on your Theme).


* Cool **FavIcon** with: https://favicon.io/favicon-converter/ - You can **upload an image**, then you will get the `favicon.ico` and other artifacts to make the web icons look amazing in any device.

1. Go to the theme folder
2. Add a `/static` folder
3. Add the files generated with the website


### Adding addsense

Including the Google AdSense script in the <head> of every page generated by Hugo is straightforward. 

<!-- https://adsense.google.com/adsense/u/0/pub-1816803660718163/payments -->


1. Step 1: Locate Your **Header** Template

In A **Hugo** site's directory, navigate to the layouts folder: `themes/PaperMod/layouts/partials/head.html`

Find the partial template responsible for the <head> section of your pages.

This is commonly located in `layouts/partials` and might be named head.html or similar.

If you use **astro**, they are normally at `src/layouts/BaseLayout.astro`

You will **add something like this script**:

```html
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1234567890"
     crossorigin="anonymous"></script>
``` 

* https://www.google.com/adsense/new/u/0/pub-1816803660718163/home
* https://www.google.com/adsense/new/u/0/pub-1816803660718163/privacymessaging

You also need to get the `ads.txt` (get it here https://www.google.com/adsense/new/u/0/pub-1816803660718163/sites/detail/url=yourwebsite.com)

to the root directory, for example in `/public`, with info similar to:

```txt
google.com, pub-123456789, DIRECT, abcd124fgthrk9876
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/AB-Testing-for-data-analytics/#ab-with-adsense" title="AB Testing and adsense" image="/blog_img/outro/ads-experiments.png" subtitle="Experiments with Google adsense" >}}
{{< /cards >}}

You can plug google adsense not only to Nuxt, but to [any other website you build](https://jalcocert.github.io/JAlcocerT/gatsby-ghost-integration/#other-websites-ive-built).

{{< details title="How to add `ads.txt` to a HUGO Website - Google Adsense 📌" closed="true" >}}

1. **Create an `ads.txt` file** in your Hugo project’s `static` directory. The `static` folder in Hugo is where you put any files you want to be copied directly to the root of your build output.

![alt text](/blog_img/web/ads-txt-public-hugo.png)

2. **Add your content** to the `ads.txt` file:

```txt
google.com, pub-123456, DIRECT, abcdef123456
```

3. **Build your Hugo site**:

4. **Verify the output** by checking the `public` directory (Hugo's default output folder). You should find the `ads.txt` file in the root of `public`:

5. **Deploy your site** as usual. The `ads.txt` file should now be available at `https://yourdomain.com/ads.txt`. 

This method ensures that `ads.txt` is part of your site’s root directory in the final build output, as required by ad networks.

![HUGO adsense txt](/blog_img/web/ads-txt-public-hugo.png)

{{< /details >}}