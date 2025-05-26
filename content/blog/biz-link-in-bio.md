---
title: "Cool Link in Bios (with SSGs) with CF Workers and Pages"
date: 2025-01-22
draft: false
tags: ["Web"]
description: "Have a cool LinkInBio/Bento website with HUGO and Astro SSGs. Alternative to linktree with Gitlab and Cloudflare WnP Setup."
url: 'cool-link-in-bios'
---


Having a cool **website for you linkinbio** can be a good experience to get started with SSGs.

And they will provide a **similar experience** to linktree, linkbio,...

{{< callout type="info" >}}
See my [general web docs](https://jalcocert.github.io/JAlcocerT/create-your-website/)
{{< /callout >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101" >}}
{{< /cards >}}


{{< callout type="info" >}}
And you can use these [SSGs with **GHPages**](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/)
{{< /callout >}}


## HUGO as Link in Bio

HUGO with one of my fav themes - [Lynx](https://jalcocert.github.io/JAlcocerT/portfolio-website-for-social-media)


## Astro as Link in Bio

`Treelink` and and `astro-link-in-bio-theme` are really cool imo!

1. https://github.com/nevthereal/linktree-template

2. https://astro.build/themes/details/ltree/

3. https://github.com/Boston343/landingpad

* https://landingpad.cosmicthemes.com/

> GPL 3.0 A free and open source template to host your links and socials. Built with Astro, Tailwind CSS, and **Keystatic CMS** by Cosmic Themes.

Thanks to Boston343, I got to know about **keystack CMS**

[KeyStack](https://keystatic.com/) CMS

- https://github.com/Thinkmill/keystatic

> MIT | First class CMS experience, TypeScript API, Markdown & YAML/JSON based, no DB

<!-- https://www.youtube.com/watch?v=E65Fx9all04&t=9s -->
{{< youtube "E65Fx9all04" >}}

4. https://github.com/trevortylerlee/treelink

* https://treelink.app/
  * https://example.treelink.app/
  * https://docs.treelink.app/guides/quick-start/

> **MIT** | Free, open source Linktree alternative built with Astro & Tailwind CSS

```sh
git clone https://github.com/trevortylerlee/treelink

npm install
npm run dev

#rm -rf .git
npm run build
```

It worked and **I Forked it**! https://github.com/JAlcocerT/treelink

* https://pagespeed.web.dev/analysis/https-example-treelink-app/l6prjspv4k?form_factor=mobile

**What did I like about this theme?**

It allows you to have a exposed static built site and also provides the capability to edit also online and export the `/src/siteConfig.json`

5. https://github.com/SofiDevO/allmylinks

6. https://github.com/MarcosKlender/AstroLinkHub

> MIT | Open source links page, **customizable via JSON**. Made with Astro 4.

7. https://github.com/ctrimm/astro-link-in-bio-theme

* https://lib.corytrimm.com/
* https://astro.build/themes/details/link-in-bio-theme/

> Link In Bio Theme for Astro

{{< callout type="info" >}}
Thanks to Ctrimm's theme, I got to know about the https://www.avatartion.com/ [project](https://github.com/wilmerterrero/Avatartion) to generate avatars in notion style. Also MIT Licensed!
{{< /callout >}}

```sh
git clone https://github.com/ctrimm/astro-link-in-bio-theme

npm install
npm run dev #

#rm -rf .git
npm run build
```

LayoutSwitcher can be commented from `layout.astro` and in `config.js` you have everything you need to tweak the theme!

{{< callout type="info" >}}
It uses [fontawsome icons](https://fontawesome.com/search), great reference for icons!
{{< /callout >}}


8. https://github.com/flamrdevs/astrolinkt

> MIT | Link in Bio Template using Astro, React & TailwindCSS

9. https://github.com/apvarun/linkverse

10. https://github.com/saminnet/astro-simple-portfolio

It has a very cool moving background

> MIT | Very simple portfolio built using Astro

11. https://github.com/vito8916/simple-portfolio

Really cool ig like portfolio, [had to fork this one](https://github.com/JAlcocerT/simple-portfolio)!

It looks amazing in phones!

> MIT | A simple but beautiful portfolio created with Astro

12. https://github.com/alamguardin/Astrolink

This is **how they can look**:

{{< cards >}}
  {{< card link="https://whoisyarnness.cozyknittingclub.com" title="Link in Bio for Knitting" image="/blog_img/web/WebsSnapshots/Web_CyclingThere.png" subtitle="Astro treelink Customization" >}}
  {{< card link="https://cozyknittingclub.com/" title="Content Creator Blog" image="/blog_img/web/WebsSnapshots/Web_CKC.png" subtitle="For an instagramer who loves knitting" >}}
{{< /cards >}}

And **like this**:

{{< cards >}}
  {{< card link="https://financeinmotion.fyi/" title="LinkinBio" image="/blog_img/web/WebsSnapshots/Web_IoTechCrafts.png" subtitle="Links with astro-link-in-bio-theme" >}}
  {{< card link="https://jalcocert.github.io/Portfolio/" title="Links with HUGO LYNX" image="/blog_img/web/WebsSnapshots/Web_PortfolioLinks.png" subtitle="Collection of important Links on Github Pages" >}}             
{{< /cards >}}

While [performing](https://jalcocert.github.io/JAlcocerT/create-your-website/#is-my-website-performing-well) like [this](https://web-check.xyz/check/https%3A%2F%2Ffinanceinmotion.fyi%2F)

### LinkInBio as Personal CV

While I was investigating those astro linkinbio theme, I found out also about some themes that can be actually be our personal CV, in a website, with links as well!

1. https://github.com/mmouzo/astro-cv-esquelete

> MIT | A free, easy-to-use CV template with a clean design. Just fill in your details and you're ready to go!



## How to Deploy SSGs Link in bio

0. With Firebase or **Cloudflare CLI** or any other static file hosting:

```sh
npm run build
```

You just need to follow [these commands](https://developers.cloudflare.com/workers/wrangler/commands/), as seen [here](https://fossengineer.com/alternatives-for-hosting-static-websites/#cloudflare-pages-with-wrangler)

```sh
npx wrangler pages project create #this will install the wrangler CLI package
#npx wrangler pages project list # See the projects you already have
#npx wrangler pages deployment list 

#npm run build #build the file manually

#https://developers.cloudflare.com/pages/configuration/build-configuration/#framework-presets
npx wrangler pages deploy dist # normally will be dist, but whatever <BUILD_OUTPUT_DIRECTORY>

##npx wrangler pages project delete your_project_name
```

We will upload the `./dist` folder, as its the place where the static files are built.

{{< callout type="warning" >}}
This approach **does not use CI/CD** for improved workflow as the following ones!
{{< /callout >}}

**You can use these 2 other methods** as an alternative (leveraging automation), it also works with private repositories.

1. Github + Cloudflare Workers and Pages

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages" title="Example of Github + CF Pages" >}}
{{< /cards >}}

2. **Gitlab + Cloudflare WnP** - Lets do this one step by step.


<!-- https://gitlab.com/fossengineer1/financeinmotion -->


{{% steps %}}

### Cloudflare as **Authoritative Name Server**

Get a domain name and setup **Cloudflare as its Name Server**, this will proove that you own it:

![CF Custom Domain1 ](/blog_img/web/Cloudflare/CF-CustomDomain-DNSManagement.png)

Copy the new name servers:

![CF Custom Domain2 ](/blog_img/web/Cloudflare/CF-NameServers.png)

And plug them to your domain registrar (in here, porkbun)
![CF Custom Domain3 ](/blog_img/web/Cloudflare/CF-Porkbun-NS.png)


### Astro Site to Gitlab Repository

Push your code to a [Gitlab](https://jalcocert.github.io/JAlcocerT/how-to-use-gitlab/).

### Setup Cloudflare to with Gitlab

Go to [Cloudflare UI](https://dash.cloudflare.com/).

Compute (workers) -> **Worker & Pages** -> Overview.

Create -> Pages -> **Connect Git**.

You will Need a Gitlab Account OAth (Authentication)

![Cloudflare build](/blog_img/web/Cloudflare/cf-gitlab-cicd.png)

### Setup Cloudflare Workers and Pages

Make sure you set the **proper settings**.

This will grant that whenever you push, the workers are doing the **right steps to generate the static files**:

![CF WnP Settings with Astro ](/blog_img/web/Cloudflare/CF-Settings-Astro.png)

![alt text](/blog_img/web/Cloudflare/gitlab-cf-customdomain.png)

{{% /steps %}}

Go to the [Cloudflare UI](https://dash.cloudflare.com), and...

You will see under the **WnP section** that the site is already published.


---

## Conclusions

This is once again the same process:

1. Choosing a theme
2. Tweaking
3. Deploying in one of the [static hosting methods](https://fossengineer.com/alternatives-for-hosting-static-websites)

**What would I add further?**

1. ChartJS support for some themes like the bento would be really cool.

Specially for those who want to have a data driven blog.


Because rendering/[knitting Rmarkdown](https://jalcocert.github.io/JAlcocerT/r-knitt-package-guide/) / [Flexdashboard](https://jalcocert.github.io/JAlcocerT/r-language-101/#flexdashboards) is always an option...but kind of tedious to bring the html to your .mdx posts.

2. Or even...[ApexchartJS](https://apexcharts.com/)?

I got to know them [thanks to dteather post](https://dteather.com/blogs/astro-interactive-charts/)

There are very interesting [demo charts](https://apexcharts.com/javascript-chart-demos/funnel-charts/funnel/), like this [column chart](https://apexcharts.com/javascript-chart-demos/column-charts/column-with-negative-values/).

> It has very interesting post about [rehype/mermaidJS diagrams](https://dteather.com/blogs/astro-uml-diagrams/) that [work with mdx](https://github.com/remcohaszing/rehype-mermaid)

> > I think I saw apexchart applied, sometime ago on [this post for HA](https://jalcocert.github.io/JAlcocerT/tapo-p110-review/#adding-graphs-to-ha) - https://github.com/RomRider/apexcharts-card 