---
title: "A new webpage for JAlcocerTech"
date: 2025-06-21T18:20:21+01:00
draft: false
description: 'AstroDB x KeyStaticCMS. A new SSG website to show Embedded Analytics capabilities.'
tags: ["Web","Landing Page","CMS","Cloudflare Workers and Pages","Web Checks","Animations","ApexCharts"]
url: keystaticcms-astrodb
---

<!-- 
https://github.com/JAlcocerT/jalcocertech/settings
 -->

On this post I will be covering:

1. Astro

2. Embedded Analytics into Astro

3. Animations

There is always a chane to improve few web concepts, specially with great videos: *Microfrontends the right way*

<!-- https://www.youtube.com/watch?v=nX44PRZ6Pcc -->

{{< youtube "nX44PRZ6Pcc" >}}


### Astro DataNova Theme

* https://github.com/mearashadowfax/DataNova
    * https://github.com/JAlcocerT/DataNova

> **MIT** | Open-source Astro website template with TailwindCSS, Keystatic CMS, and Astro DB support.

Could not resist to [fork it](https://github.com/JAlcocerT/DataNova).

And used it with cloudflare pages configured at [private this repo](https://github.com/JAlcocerT/jalcocertech)

And to get familiar with: https://docs.astro.build/en/guides/astro-db/

```sh
git clone https://github.com/JAlcocerT/DataNova
#rm -r .git

rm -rf .git
git init
git add .
git commit -m "Initial commit for your site"
#assuming you have https://github.com/JAlcocerT/jalcocertech

git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/jalcocertech.git
#git remote add origin https://github.com/JAlcocerT/jalcocertech.git
```

---

## Conclusions

> DigITalize your Creativity | JAlcocerTech

Use IT or lose it The AI Revolution for your business · It all start with a Modern and fast website. Secured by Default and GDPR compliant

### Features I liked

1. The moving [navbar](https://github.com/JAlcocerT/DataNova/blob/main/src/components/sections/Navbar.astro) as you move around the web

2. The [Diagram.astro](https://github.com/JAlcocerT/DataNova/blob/main/src/components/common/Diagram.astro) component, which is a *static* visual diagram

![DataNova Theme](/blog_img/web/astro/astro-datanova-animated-graph.png)

> THis looks so cool andfor sure drive conversions rate up!

3. Browser tab icon working, as well as OG when shared via whatsapp
4. Inside the Articles part, we have a [very interesting sticky ToC](https://github.com/JAlcocerT/jalcocertech/tree/main/src/pages/support/articles) that goes down as you scroll (in the desktop version)

5. It also bring some embedded video

```html
<div class="aspect-video">
  <video
    autoplay
    loop
    muted
    playsinline
    preload="metadata"
    class="aspect-auto rounded-xl"
  >
    <source src={video} type="video/mp4" />
    Your browser does not support the video tag.
  </video>
</div>
```

6. What it does NOT bring, is search. But for a simple *landing page + few pages*...thats fine.

### Deploying

With everything working locally as per:

```sh
npm install
#npm run dev
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

It was time to deploy the generated page.

With GH + [CF WnP](https://jalcocert.github.io/JAlcocerT/cool-link-in-bios/#cloudflare-as-authoritative-name-server)

![Cloudflare Workers and Pages](/blog_img/web/astro/cf-wnp.png)

For what I needed to review CF permissions: https://github.com/settings/installations/56072936

![Cloudflare Github Permissions](/blog_img/web/astro/cf-gh-permissions.png)

Which I accepted

And review that its only for selected repos:

![CF WnP Github Connection to Repositories](/blog_img/web/astro/cf-gh-selected-repos.png)

> **The result is visible at**: jalcocert.pages.dev or `www.jalcocertech.com`

```sh
ping www.jalcocertech.com
nslookup www.jalcocertech.com
```

* https://www.websitecarbon.com/website/jalcocertech-com/
* https://web-check.xyz/check/https%3A%2F%2Fwww.jalcocertech.com%2F

### Website Checks

* This [OpenGraph checker](https://opengraph.dev/panel?url=https%3A%2F%2Flibreportfolio.fyi%2F) ---> https://libreportfolio.fyi/libreportfolio-og.jpeg



---

## FAQ

### More Astro Themes

You always get surprised with astro themes:

* https://github.com/mearashadowfax/OpenStove

>  A free, community-driven platform for sharing and discovering recipes. No ads, just good food! 

* https://github.com/wpinfusion/astro-hyperdrive

> An Astro template designed for **Automotive dealerships**. For the ones who like [cars](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/)!

> > Which can be useful for otomoto's / dsautokomis pl / autoplac.pl / dsautoskup.otomoto.pl / autolux-komis.pl

#### Astro Components I discovered

As always, trying some new astro theme makes you discover some very cool components.

But thanks to videcoding, you can make your **DIY astro components**:


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/WebifAI/blob/main/Astro-Themes/morita-web/src/components/WhatsappBubble.astro" title="Astro Component | Whatsap Bouble ↗" >}}
  {{< card link="https://github.com/JAlcocerT/cybernetik-realestate-moises/blob/main/astro-nomy/src/components/InstagramGallery.astro" title="Astro Component | Make a in-post Gallery, zoomable and that allows to move to next ↗" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg" title="SGG components" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Components for astro and shortcodes for HUGO..." >}}
{{< /cards >}}

---

## Outro

### Embedded Analytics

Lately I have been tinkering with Streamlit and PyGWalker on [this post](https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker).


But I was also surprised on how much can be achieved via Plotly, ChartJS or ApexChartsJS.

In fact, to render interesting interactive charts into your SSG powered websites, like astro its just a matter of having the *declarative knowledge* that you can actuualy do it.

Just think of a interesting visual you want to have, tell to windsurf to vibe code your astro component that renders it and simply import it into your post.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker" title="AI Bi Tools Post" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Writting about Streamlit PoC with PyGWalker" >}}

  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

<!-- ![alt text](/blog_img/apps/streamlit/st_pygwalker_map.png) -->

How can these charts actually look like?

![ApexChartsJS and Astro SSG Theme ](/blog_img/web/astro/astro-apexchartsjs-component.png)

Similar to what we made with [streamlit PoC](https://github.com/JAlcocerT/Streamlit_PoC/tree/main/Utils)...

![Streamlit Funnel with Plotly](/blog_img/apps/streamlit/streamlit-plotly-funnel.png)

Again: *and these are interactive charts!*

All thanks to CSR and ApexChartsJS :)

So you could make this kind of [streamlit real estate calculator](https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/) purely static.

Another option is to embedd the *knitted html* of a R FlexDashboard to your SSG powered websites:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/r-dashboard-shinyapps/" title="Retirement Facts [Post]" image="/blog_img/data-experiments/Inflation_Mild.JPG" subtitle="Life savings and inflation in a R Shiny App." >}}
  {{< card link="https://github.com/JAlcocerT/R_is_Great/tree/main/ShinyApps" title="Retirement Facts" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Life savings and inflation in a R Shiny App." >}}
{{< /cards >}}

But I find the Astro + Graph base component a much cooler (and simpler) approach.

### Animations

If what you want is to create a simple a quick .mp4, then **matplotlib + Python** should be your go to:

<!-- https://youtu.be/YuvHXyFeRV4 -->

{{< youtube "YuvHXyFeRV4" >}}

You can do very smooth animations, with gradient background colors, as [I did here](https://github.com/JAlcocerT/Streamlit_PoC/tree/main/Animations)

{{< tweet user="LibrePortfolio" id="1940801205577699713" >}}

* For matching image background colors, this was useful: https://imagecolorpicker.com/, here you have few more tools I found [useful for color picking](https://jalcocert.github.io/JAlcocerT/create-your-website/#faq)

They should not be something new to you If you have explored Gabe's mechanism project and my post about it.

* https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/

### Wordpress and NRR

For **WordPress.com (the hosted service)**, I would guestimate their **Net Revenue Retention (NRR) to be in the range of 90% to 110%+**.

{{< callout type="info" >}}
Recurring revenue businesses typically have an NRR as a key performance indicator!
{{< /callout >}}

{{< details title="NRR Over 100%? 📌" closed="true" >}}

* **Subscription Model:** WordPress.com operates on a recurring subscription model (freemium with paid plans for features, storage, and support). 

* **High Switching Costs:** Once a website is built and established on a platform like WordPress.com, migrating it to another provider can be complex and time-consuming. This "stickiness" inherently contributes to higher retention.

* **Upselling and Cross-selling Opportunities:**
    * Users often start with basic plans and upgrade as their needs grow (e.g., needing more storage, custom domain, e-commerce features with WooCommerce, advanced SEO tools, premium themes/plugins).
    * Automattic has also acquired other services (like WooCommerce, Jetpack, Tumblr) which can lead to cross-selling opportunities to their existing WordPress.com customer base.

* **Brand Recognition and Ecosystem:** WordPress.com benefits from the massive brand recognition of WordPress itself and a vast ecosystem of themes and plugins, which adds value and encourages continued use.

* **Customer Support and Managed Services:** For many users, the convenience of managed hosting and readily available support is a key factor in staying with WordPress.com rather than self-hosting.

{{< /details >}}

An NRR of **over 100%** (e.g., 105% or 110%) would indicate that `WordPress.com` is not only retaining most of its customers but also successfully increasing revenue from its existing customer base through upgrades and additional service purchases. 

Given their scale and the continuous development of their offerings, achieving NRR over 100% is certainly plausible.

> Without direct financial disclosures from Automattic, this remains an informed approximation/guestimation from *Gemini*!