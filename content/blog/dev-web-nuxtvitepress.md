---
title: "Trying Nuxt & VitePress [and a SSG Recap]"
date: 2025-11-18
draft: false
tags: ["Dev","Nuxt","NUXT Content CMS","Nuxt Canvas Theme x Resend"]
description: 'Testing NUXT & VitePress Themes. Looking back to the learnings with other SSGs like HUGO and Astro.'
url: 'trying-nuxt-themes'
---

<!-- Add dynamic content about you
https://docs.astro.build/en/tutorial/2-pages/3/ -->

<!-- https://www.youtube.com/watch?v=NniT0vKyn-E -->


**TL;DR**

Ive had pening for a while to try Nuxt, and I think it is a great framework for building **[full-stack web applications](https://jalcocert.github.io/JAlcocerT/waiting-list-pocketbase/#csr-vs-spa) and websites with Vue.js**.


**Intro**

Almost the end of the year, time to **try out some new SSG**.

This time it is the turn of **Nuxt**


* https://github.com/HugoRCD/canvas

1. The first thing I noticed, it takes much more time to load compared to Astro or NextJS sites, and much more than HUGO.

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

{{< dropdown title="Bun | Example with NUXT - HUGO Canvas and Resend ⏬" closed="true" >}}

* Example - https://github.com/HugoRCD/canvas
	* Contact Forms with: https://resend.com/signup - Email for developers (https://resend.com/pricing)

> Really cool Portfolio template made with Nuxt 3, Nuxt Content and TailwindCSS

```sh
bun install
bun dev #dev server
bun generate #static proy
bun start #prod server
```

{{< /dropdown >}}


Now you can spin a server and make **ASTRO [Remote Development](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker)** in it.



## Nuxt SSG

Nuxt is a free and open-source framework with an intuitive and extendable way to create type-safe, performant and production-grade **full-stack web applications and websites with Vue.js**.

* https://github.com/nuxt/nuxt

> MIT | The Intuitive Vue Framework.

* https://nuxt.com/deploy

### Nuxt Content CMS

If you have been finding that connecting a CMS to a SSG is hard, Nuxt Content CMS is a great option.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nuxt-content" title="Nuxt Content CMS | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### About Nuxt

Nuxt is an open-source, full-stack framework for building **web applications using Vue.js**.

It simplifies the development of complex applications by providing an opinionated structure, automatic routing, and multiple rendering modes out of the box.

> Nuxt is inspired by Next.js, a similar framework for React.

> > I need to try NUXT sometime *,soon'*

#### Nuxt and JavaScript ☕️

Nuxt is deeply rooted in JavaScript, as it's built on top of the Vue.js framework, which is a JavaScript library for building user interfaces.

{{< callout type="warning" >}}
See more about [TS](https://jalcocert.github.io/JAlcocerT/whats-typescript/) and [JS Frameworks](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/)
{{< /callout >}}

It uses JavaScript to handle almost every aspect of an application, from front-end interactivity to server-side logic.

* **Vue.js:** Nuxt is a meta-framework for Vue.js. It leverages Vue's component-based architecture and reactivity system. All the components and pages you create in a Nuxt application are essentially Vue components written in JavaScript (or TypeScript).
* **Node.js and Nitro:** Nuxt's server-side capabilities are powered by a server engine called **Nitro**, which is built on Node.js. This allows Nuxt to run JavaScript code on the server, which is essential for features like Server-Side Rendering (SSR) and API routes.
* **Tooling:** Nuxt integrates popular JavaScript build tools like **Vite** or **Webpack** to bundle and optimize your application's code for production.

#### Nuxt and SSG (Static Site Generators)

Nuxt is not just a static site generator, but it can act as one. 

It offers several rendering modes, including static site generation (SSG), which puts it in a similar category to frameworks like Astro or Hugo, but with some key differences.

##### **Nuxt's Rendering Modes**

Nuxt provides a **versatile rendering system** that allows you to choose the best approach for your project:

1.  **Single-Page Application (SPA):** The entire application is rendered by the browser after it loads the initial HTML, CSS, and JavaScript. This is the traditional way of building a Vue app, and it's great for highly interactive web apps.
2.  **Server-Side Rendering (SSR):** The server renders the initial HTML for each page, which is then sent to the browser. This improves initial load performance and SEO. Once loaded, the page becomes a fully interactive SPA. Nuxt calls this "Universal" rendering.
3.  **Static Site Generation (SSG):** Nuxt generates a static HTML, CSS, and JavaScript file for each page at build time. These files can be served from any static host or CDN. This provides the best performance and security and is ideal for content-heavy sites like blogs or documentation. 

#### **Nuxt vs. Astro and Hugo**

While all three can be used to generate static sites, they have different philosophies and use cases:

* **Hugo:** This is a **pure static site generator** written in Go. Its primary focus is on lightning-fast build times and serving static content. It's not a JavaScript framework, so it doesn't provide the same level of client-side interactivity or component-based development as Nuxt or Astro. It's best suited for blogs, portfolios, or documentation websites where content is king and interactivity is minimal.

* **Astro:** Astro is a **modern SSG** that champions a "zero-JS by default" approach. It uses a unique "Islands Architecture," where pages are pre-rendered to static HTML, with small, interactive "islands" of JavaScript-enabled components added only where needed. This results in incredibly fast websites with a minimal JavaScript payload. Astro is framework-agnostic, meaning you can use components from different frameworks like Vue, React, or Svelte within the same project. It is great for content-heavy sites that need a bit of interactivity.

* **Nuxt:** Nuxt is a **full-stack Vue framework**. While it can be used as an SSG, its main strength lies in its ability to build complex, full-stack applications with server-side rendering, API routes, and a rich ecosystem of modules. Nuxt ships with more JavaScript by default than Astro, as its core philosophy is building a complete, cohesive application, whether it's an SPA, SSR, or SSG.

> It's the best choice for developers already in the Vue ecosystem who need a powerful tool for building complex, interactive web applications.


## VitePress SSG

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



---


## Conclusions

The good thing about SSGs is that they power content with markdown.

Allowing you to plug easily these kind of LLMs:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

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



### A SSG Recap

So...those are 2 more SSGs to the list!

{{< callout type="info" >}}
Im assuming that you are already aware [about CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-css/) and [JS tricks](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites)
{{< /callout >}}

**Most SSGs** will be powered by node.

But not all.

A comparison of **Hugo**, **Astro**, **Next.js**, **Jekyll**, **Gatsby**, and **Nuxt**. 

It highlights key aspects of each static site generator or framework.

| About | Hugo | Astro | Next.js | Jekyll | Gatsby | Nuxt |
|-------|------|-------|---------|--------|--------|------|
| **Source Code** | [Hugo on GitHub](https://github.com/gohugoio/hugo?ref=fossengineer.com) | [Astro on GitHub](https://github.com/withastro/astro?ref=fossengineer.com) | [Next.js on GitHub](https://github.com/vercel/next.js?ref=fossengineer.com) | [Jekyll on GitHub](https://github.com/jekyll/jekyll?ref=fossengineer.com) | [Gatsby on GitHub](https://github.com/gatsbyjs/gatsby?ref=fossengineer.com) | [Nuxt on GitHub](https://github.com/nuxt/nuxt.js?ref=fossengineer.com) |
| **License** | [Apache License 2.0](https://github.com/gohugoio/hugo/blob/master/LICENSE?ref=fossengineer.com) ✅ | [MIT License](https://github.com/withastro/astro/blob/main/LICENSE?ref=fossengineer.com) ✅ | [MIT License](https://github.com/vercel/next.js/blob/canary/LICENSE?ref=fossengineer.com) ✅ | [MIT License](https://github.com/jekyll/jekyll/blob/master/LICENSE.txt?ref=fossengineer.com) ✅ | [MIT License](https://github.com/gatsbyjs/gatsby/blob/master/LICENSE.md?ref=fossengineer.com) ✅ | [MIT License](https://github.com/nuxt/nuxt.js/blob/main/LICENSE?ref=fossengineer.com) ✅ |
| **Performance** | ⚡️ Lightning-fast static website generation | ⚡️ Optimized for static sites with partial hydration | ⚡️ Full-stack with static site generation, hybrid support | ⏳ Slow generation, suited for simpler blogs | ⚡️ Excellent performance with static content & optimized builds | ⚡️ Fast, universal applications with server-side rendering and static site generation |
| **Type** | Static Site Generator | Static Site Generator (with partial SSR) | Full-stack Framework (with SSR & Static Generation) | Static Site Generator | Static Site Generator (React-based) | Full-stack Framework (with SSR & Static Generation) |
| **Built With** | Go | JavaScript (React) | JavaScript (React) | Ruby | JavaScript (React) | JavaScript (Vue.js) |
| **Key Feature** | **Blazing speed** for static sites | **Hybrid Static & SSR** with partial hydration | **SSR & SSG** (static generation and server-side rendering) | Easy blog setup using Ruby and Markdown | Rich React ecosystem, GraphQL support | Full-stack, **Vue.js** framework with server-side rendering |
| **Best For** | Developers looking for **speed** and simplicity in static sites | Developers who need a **modern hybrid approach** (static + SSR) | Building **complex web applications** with both static and dynamic content | Simple blogs and personal websites | Content-rich websites with React | Building modern web apps using **Vue.js** |


**NextJS** Whether you’re building a blog, a corporate website, or an e-commerce platform, Next.js provides the tools and scalability to meet your project's demands.

**Gatsby** I got to know about GraphQL thanks to Gatsby.

**Other SSGs**: Zensical, Quartz...

* https://github.com/getpelican/pelican

> Static site generator that supports Markdown and reST syntax. **Powered by Python**.

* https://github.com/hexojs/hexo

> MIT | A fast, simple & powerful blog framework, powered by Node.js.



[![Star History Chart](https://api.star-history.com/svg?repos=gohugoio/hugo,withastro/astro,vercel/next.js,jekyll/jekyll,gatsbyjs/gatsby,nuxt/nuxt.js&type=Date)](https://star-history.com/#gohugoio/hugo&withastro/astro&vercel/next.js&jekyll/jekyll&gatsbyjs/gatsby&nuxt/nuxt.js&Date)

* https://github.com/benben-miao/Awesome-StaticSiteGenerators
* https://github.com/staystatic/awesome-static

<!-- [![Star History Chart](https://api.star-history.com/svg?repos=gohugoio/hugo&type=Date)](https://star-history.com/#gohugoio/hugo&Date) -->

### HUGO

For **HUGO** you will need to use GO, as explained [here](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/).


{{< details title="To use HUGO, you just need to Setup GO & HUGO  📌" closed="true" >}}


* https://github.com/gohugoio/hugo/releases
* https://go.dev/dl/


Example with [v0.108.0](https://github.com/gohugoio/hugo/releases/tag/v0.108.0)

```sh
sudo apt update -y
sudo apt install wget

#install go
wget https://go.dev/dl/go1.21.1.linux-armv6l.tar.gz
sudo tar -C /usr/local -xvzf go1.21.1.linux-armv6l.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.bashrc
go version

#https://github.com/gohugoio/hugo/releases/download/v0.108.0/hugo_0.108.0_linux-amd64.deb
go version && \
wget https://github.com/gohugoio/hugo/releases/download/v0.108.0/hugo_0.108.0_linux-amd64.deb -O hugo_specific_version.deb && \
sudo dpkg -i hugo_specific_version.deb && \
rm hugo_specific_version.deb
```
{{< /details >}}

https://github.com/JAlcocerT/JAlcocerT/blob/main/.github/workflows/pages.yaml

{{< callout type="info" >}}
https://github.com/theNewDynamic/awesome-hugo
{{< /callout >}}

#### My Favourite HUGO Themes

1. Hextra
2. PaperMod
3. Lynx

#### More HUGO Resources

* https://awesome-hugo.github.io/


### Jekyll


> How to self-host a simple, static blog on a Raspberry Pi with Jekyll, Docker and Cloudflare
 https://myzopotamia.dev/selfhost-your-blog-on-raspberry-pi Kudos to [Radoslaw](https://github.com/rskupnik) on the post

For **Jekyll**, you will need Ruby.

Example [Jekyll GHA WF](https://github.com/JAlcocerT/RPi/blob/main/.github/workflows/pages-deploy.yml)

If you plan to use [Github Pages with these SSGs](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/), create the proper **[Github Actions](https://jalcocert.github.io/JAlcocerT/github-actions-use-cases) workflow**.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="RE Calculator - Post"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="Job Offers and CV Creation" >}}
{{< /cards >}}

**More Jekyll Resources**

* https://github.com/mattvh/jekyllthemes

> A directory of the best-looking themes for Jekyll blogs


### Astro       


1. https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages/
2. https://jalcocert.github.io/JAlcocerT/using-astro-as-website/
3. https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/
    * Example - https://github.com/JAlcocerT/web3/actions
    https://github.com/JAlcocerT/web3/blob/main/.github/workflows/deploy_astro.yml

{{< callout type="info" >}}
https://github.com/one-aalam/awesome-astro?tab=readme-ov-file#%E2%84%B9%EF%B8%8F-repositoriesstarter-kitscomponents
{{< /callout >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="RE Calculator - Post"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="Job Offers and CV Creation" >}}
{{< /cards >}}

{{< details title="What it is ? 📌" closed="true" >}}


1. Find the Theme Source Code

Github is a good starting point.

You can **take components ideas**, like: `::github{repo="saicaca/fuwari"}`

2. Clone The Theme

Make sure you are free to use the theme as per its License and then **clone it**:

```sh
git clone https://github.com/Ruben-Winant/astro_spark_template ./astro_template #it has a cool carousel!
cd ./astro_template
rm -rf .git #remove existing git
```

3. Try the Theme

```sh
npm run build
npm run dev
```

> Explore the results, most likely at: `http://localhost:4321`


{{< /details >}}

A typical astro project structure:

{{< filetree/container >}}
  {{< filetree/folder name="content" >}}
    {{< filetree/file name="_index.md" >}}
    {{< filetree/folder name="docs" state="closed" >}}
      {{< filetree/file name="_index.md" >}}
      {{< filetree/file name="introduction.md" >}}
      {{< filetree/file name="introduction.fr.md" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
  {{< filetree/file name="hugo.toml" >}}
{{< /filetree/container >}}

Astro Themes I find interesting:

1. Fuwari
2. VisVRS ()
3. AstroWind (which uses [Tailwind CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-css/#competitors-to-tailwind-css))

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Resources to Create Cool Websites" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/" title="Astro Components 101" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/wordpress-migration-to-ssg/" title="Wordpress to SSG" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/guide-web3/" title="Web 3 with Astro" >}}
{{< /cards >}}


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

https://www.google.com/adsense/new/u/0/pub-1816803660718163/home
https://www.google.com/adsense/new/u/0/pub-1816803660718163/privacymessaging

You also need to get the `ads.txt` (get it here https://www.google.com/adsense/new/u/0/pub-1816803660718163/sites/detail/url=yourwebsite.com)

to the root directory, for example in `/public`, with info similar to:

```txt
google.com, pub-123456789, DIRECT, abcd124fgthrk9876
```


### Making Webs with AI

* https://github.com/rapidpages/rapidpages

> MIT | Generate React and Tailwind components using AI 

### How to setup StrapiCMS?

If you are looking from CMS, you can have a look to [this post](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites), where I [setup KeystaticCMS](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites/#keystatic-cms)

* <https://www.opensourcealternative.to/project/Strapi>
    * <https://docs.strapi.io/dev-docs/installation/docker>

### Strapi CMS x Astro

Astro JS x Strapi

https://www.youtube.com/watch?v=WI-_gVBoBBg
https://github.com/PaulBratslavsky/pauls-strapi-crashcourse
https://github.com/JAlcocerT/pauls-strapi-crashcourse


https://github.com/strapi/LaunchPad -> https://launch-pad-roan.vercel.app/en

> Official Strapi Demo application



![Strapi UI](/blog_img/web/cms/strapi-admin-ui.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/strapi" title="Strapi | Docker Config 🐋 ↗" >}}
{{< /cards >}}

https://www.youtube.com/watch?v=Ud9obEHadLI

* https://elest.io/open-source/strapi

* https://strapi.io/blog/how-to-self-host-your-headless-cms-using-docker-compose

* https://hub.docker.com/r/strapi/strapi/tags

* https://docs.strapi.io/cms/installation/docker
* https://docs.strapi.io/cms/quick-start
* https://strapi.io/blog/how-to-self-host-your-headless-cms-using-docker-compose


<!-- ### How to use turbostrapi

STRAPI + NEXTJS MONOREPO STARTER

* https://github.com/sawden/turbostrapi/blob/master/apps/backend/README.md
* https://github.com/sawden/turbostrapi?ref=statichunt.com
https://github.com/sawden/turbostrapi?ref=statichunt.com
https://turbo.build/repo/docs/installing

```sh
yarn install
``` -->

<!-- Build a Blog with Next.js and a Headless CMS (Strapi)
https://www.youtube.com/watch?v=NNWX2flw5mg -->


<!-- 
NEXTJS + Strapi
https://www.youtube.com/watch?v=SlhZvwl9qtI&list=PL7Q0DQYATmvjXSuHfB8CY_n_oUeqZzauZ&index=9 -->

<!-- ### Other F/OSS SSG's

This addition suggests other Static Site Generators (SSGs) that readers might find interesting based on their enjoyment of the Next.js post. Let me know if you need any further adjustments!

    HUGO: Lightning-fast speed.
    Astro: Built-in support for server-side rendering (SSR).
    Jekyll: Simplicity and ease of use, particularly for blogging.
    Gatsby: Rich ecosystem of plugins and a vibrant community.

If you have enjoyed the Next.js post, you might be interested to explore other SSGs like HUGO, Astro, Jekyll, and Gatsby. -->


<!-- Cloudflare runners -->



<!-- - **Gatsby**: Gatsby is a popular static site generator within the **React** ecosystem, leveraging React for building static sites and offering a rich plugin ecosystem.
  - **Pros**:
    - Ability to pull data from various sources, including CMSs and APIs.
    - React-based, enabling component-based development and rich interactivity.
    - Extensive plugin ecosystem for adding functionality and integrating with third-party services.
  - **Cons**:
    - Longer build times for large projects due to complex data fetching and processing.
    - Steeper learning curve for developers unfamiliar with React.
    - Requires a Node.js environment for development and building.

- **Next.js**: Next.js is primarily known as a **React** framework for SSR and CSR, but it also offers SSG capabilities, providing flexibility for different project needs.
  - **Pros**:
    - Versatility to choose between SSR, CSR, or SSG based on project requirements.
    - Seamless integration with React for building dynamic user interfaces.
    - Hybrid capabilities for blending static and dynamic content in a single application.
  - **Cons**:
    - Complex configuration compared to simpler static site generators.
    - Requires familiarity with React and Node.js for effective usage.
    - Limited built-in features compared to dedicated static site generators like Hugo. -->

<!-- 

https://developers.cloudflare.com/pages/framework-guides/nextjs/

<https://jamstack.org/generators/next/>

<https://nextjs.org/>


<https://vercel.com/templates/next.js>

<https://jamstackthemes.dev/theme/nextjs-notion-starter-kit/>
<https://transitivebullsh.it/nextjs-notion-starter-kit>

<https://transitivebullsh.it/>

## With streamlit

https://ui.shadcn.com/themes
https://github.com/ObservedObserver/streamlit-shadcn-ui


## Themes

<https://vercel.com/templates>

### My Favourite Themes

* https://nextra.site/
* https://github.com/shadcn-ui/taxonomy

* SaaS
    * https://github.com/nextacular/nextacular


### nextjs-notion-starter-kit

https://jamstackthemes.dev/theme/nextjs-notion-starter-kit/


Fork / clone this repo
Change a few values in site.config.ts
npm install
3. `npm install` or npm install --legacy-peer-deps
npm run deploy to deploy to vercel 💪
npm run build
npm run start



---

## FAQ

    SSG (Static Site Generation):
    Static Site Generation involves generating HTML pages at build time, typically using a site generator or build tool. The generated HTML pages contain all the necessary content and assets, and they are served to clients as-is without the need for server-side processing. This approach offers benefits such as fast loading times, security, and scalability. Popular static site generators include Gatsby, Next.js (with static site generation), Jekyll, and Hugo.

    SSR (Server-Side Rendering):
    Server-Side Rendering involves generating HTML pages dynamically on the server in response to each client request. With SSR, the server processes the request, renders the page with the necessary data, and sends the fully rendered HTML to the client's browser. SSR is commonly used in web applications built with frameworks like Next.js, Nuxt.js, and Angular Universal. SSR can offer benefits such as improved SEO, faster initial page loads, and better support for dynamic content.

    ISR (Incremental Static Regeneration):
    Incremental Static Regeneration is a hybrid approach that combines the benefits of static site generation and dynamic content updates. With ISR, pages are initially generated statically at build time, but they can also be updated dynamically in the background. When a user requests a page that has been updated since the last build, the server regenerates the page with fresh data and serves the updated version. ISR is a feature available in frameworks like Next.js, enabling developers to pre-render dynamic content while still benefiting from static site performance.

In summary, SSG generates HTML pages at build time, SSR generates HTML pages dynamically on the server in response to requests, and ISR combines static site generation with dynamic content updates for improved performance and flexibility. Each approach has its strengths and use cases, and the choice depends on the specific requirements of the project. -->

<!-- 

https://www.youtube.com/watch?v=Sklc_fQBmcs


Next.js in 100 Seconds // Plus Full Beginner's Tutorial
Overview

Welcome to our report on the video "Next.js in 100 Seconds // Plus Full Beginner's Tutorial" by Fireship. In this report, we'll delve into the world of Next.js, a React-based framework for building fast and scalable web applications. If you're new to Next.js or looking to improve your skills, this report is a must-read.
What is Next.js?

Next.js is a popular framework for building server-rendered, statically generated, and performance-optimized React applications. It allows developers to create fast, scalable, and SEO-friendly web apps with zero configuration. In traditional React apps, content is rendered on the client-side, which can lead to slow page loads and poor SEO. Next.js solves this problem by rendering content on the server, providing a better user experience and search engine optimization.
Features of Next.js

Next.js provides several features that make it an ideal choice for building modern web applications. Some of these features include:

    Server-side rendering: Next.js allows you to render content on the server, providing a faster and more SEO-friendly experience.
    Static site generation: Next.js can pre-render pages at build time, making it ideal for blogs and applications with infrequently changing data.
    Incremental static regeneration: Next.js can also regenerate pages dynamically, allowing for flexibility in data updating.
    API routes: Next.js provides a way to create server-only API routes, which can be useful for tasks that require server-side processing.

Building a Next.js App

To get started with Next.js, you can create a new project using the npx create-next-app command. This will set up a basic Next.js project with a pages directory, where you can define your application's routes.

In the pages directory, you can create separate files for each route, which will export a default React component. Next.js will then use these components to render the application.
Data Fetching in Next.js

Next.js provides several strategies for fetching data, including:

    getStaticProps: This function allows you to fetch data at build time and pre-render pages.
    getServerSideProps: This function allows you to fetch data on each request and render pages dynamically.

Conclusion

In conclusion, Next.js is a powerful framework for building fast, scalable, and SEO-friendly web applications. With its features, such as server-side rendering, static site generation, and data fetching strategies, Next.js provides a robust set of tools for building modern web applications.
Takeaways

    Next.js is a React-based framework for building fast and scalable web applications.
    Next.js provides server-side rendering, static site generation, and incremental static regeneration.
    Next.js has built-in support for API routes and data fetching strategies.

Report generated on: May 5, 2024, 11:05:57 AM -->
