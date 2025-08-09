---
title: "Websites 2024 Consolidation"
date: 2024-12-17
draft: false
tags: ["Dev","Filebrowser","EntreAgujayPunto","SSG","Photo Gallery"]
description: 'Websites and getting better at `Show your Work`. HUGO Theme Gallery for a Punto Website.'
url: 'websites-themes-2024'
---


It all started few years ago with my **own blogs**.

{{< cards >}}
  {{< card link="https://cyclingthere.com" title="My Travel Adventures" image="/blog_img/web/WebsSnapshots/Web_CyclingThere.png" subtitle="I can write and also create interesting photo galleries about my travel experiences" >}}
  {{< card link="https://while.cyclingthere.com" image="/blog_img/web/whilecycling.png" title="Photo Gallery Blog" subtitle="Made with HUGO and Photo centered" >}}
{{< /cards >}}

{{< callout type="info" >}}
And there is a **new and very special website**! <http://entreagujaypunto.com/> Built with GH  + Cloudflare Pages <https://github.com/JAlcocerT/EntreAgujayPunto> 💻 Similar to [this](https://gitlab.com/fossengineer1/whilecyclingthere)
{{< /callout >}}

I got the domain at PorkBun and changed the **NameServer** to Cloudflare ones.

Log into porkbun -> `NS` -> Change Authoritative Name Server to the ones provided by CF:

```sh
# curitiba.ns.porkbun.com
# fortaleza.ns.porkbun.com
# maceio.ns.porkbun.com
# salvador.ns.porkbun.com
```

### Cloudflare WnP Custom Domain

![CF Custom Domain 1](/blog_img/web/Cloudflare/CF-CustomDomain-DNSTransfer.png)

![CF Custom Domain2 ](/blog_img/web/Cloudflare/CF-CustomDomain-DNSRecordsScan.png)

![CF Custom Domain 3](/blog_img/web/Cloudflare/CF-customdomain-sync.png)


> After it syncs, you will be able to go to `Workers & Pages` -> `Custom Domains` and have the website ready.


## Photo Galleries

As described here - https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/

{{< cards cols="1" >}}
  {{< card link="https://while.cyclingthere.com/" title="Cycling There Photo Gallery" >}}
  {{< card link="https://enjoylittlethings.org/" title="Travel Addict Photo Blog" >}}
  {{< card link="http://entreagujaypunto.com/" title="Portfolio Aguja&Punto" >}}
{{< /cards >}}

See some sample blogs:

{{< cards >}}
  {{< card link="https://cyclingthere.com" title="My Travel Adventures" image="/blog_img/web/WebsSnapshots/Web_CyclingThere.png" subtitle="I can write and also create interesting photo galleries about my travel experiences" >}}
  {{< card link="http://entreagujaypunto.com/" title="Punto Photo Gallery" image="/blog_img/web/web-entreagujaypunto.png" subtitle="A Photo centered Web for Punto" >}}
{{< /cards >}}

And then I saw **people close to me, who needed help**.

But what can you do when there are **many unknown unknowns**?

Maybe...Clarify with [an **AI Powered** Presentation](https://fc9dafcc.creaitivewebsites.pages.dev)

## Custom Websites

Then...started customizing websites:

{{< cards >}}
  {{< card link="https://cozyknittingclub.com/" title="Content Creator Blog" image="/blog_img/web/WebsSnapshots/Web_CKC.png" subtitle="For an instagramer who loves knitting" >}}
  {{< card link="https://morita-web.pages.dev//" title="Health Care Site" image="/blog_img/web/WebsSnapshots/Web_Nevin.png" subtitle="Because the brain is as important as the body" >}}
    {{< card link="https://dm-real-estate.com/" title="Real Estate Official Site" image="/blog_img/web/WebsSnapshots/Web_realestate.png" subtitle="A Real Estate Business Site for Spain" >}}
    {{< card link="https://jmodels.net/" title="Scale Modelling Blog" image="/blog_img/web/WebsSnapshots/Web-jmodels.png" subtitle="Fantastic Blog with ~1K Posts about Modelling" >}}
    {{< card link="https://ira-english.pages.dev/" title="Personal Business Landing" image="/blog_img/web/WebsSnapshots/Web_EnglishIra.png" subtitle="Landing Page for a well Known English Teacher" >}}
    {{< card link="https://enjoylittlethings.org/" title="Travel Adict Photo Gallery" image="/blog_img/web/WebsSnapshots/Web_PhotoGalleryAGA.png" subtitle="Because Photo & Travel lovers need something more than instagram" >}}    
    {{< card link="https://jalcocert.github.io/Portfolio/" title="All your Links" image="/blog_img/web/WebsSnapshots/Web_PortfolioLinks.png" subtitle="Sleek collection of important Links" >}} 
    {{< card link="https://iodoctor.iotechcrafts.com/" title="Doctor Consultation" image="/blog_img/web/WebsSnapshots/Web_IoDoctor.png" subtitle="Landing and WebApp for Scheduling Doctor Appointments" >}}            
{{< /cards >}}


{{< details title="All powered by HUGO & Astro 📌" closed="true" >}}

* https://github.com/JAlcocerT/cozyknittingclub-web
* https://github.com/JAlcocerT/morita-web
* https://github.com/JAlcocerT/ScrewFastMoiRealEstate
  * https://jalcocert.github.io/JAlcocerT/astro-web-setup/
* https://jalcocert.github.io/JAlcocerT/wordpress-migration-to-ssg/
* https://github.com/JAlcocerT/ira-web
* https://github.com/JAlcocerT/agutek-portfolioweb
  * https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/
* https://github.com/JAlcocerT/Portfolio


```sh
#npm run dev #for astro

#hugo server
hugo server --bind="0.0.0.0" --baseURL="http://192.168.0.171" --port=1319
```

> The baseURL if you are doing dev in a server 

For production, always check for HUGO the `hugo.toml` file and tweak the **baseURL** parameter

See also:

* For CSS: `/assets/css/custom.css` to tweak the light/dark themes colors.

You can choose the default for each folder by adding:

```css
params:
  theme: light #dark ##ffffff #dee2e6
```

Which references: `--surface-1-light: #ffffffb2;`

* For **favicons**, i have used: https://github.com/ruisaraiva19/favycon

The theme automatically created `public/images/favicon.png`

Which it is referenced at `layouts/partial/head.html`

```html
  <link rel="icon" type="image/svg+xml" href="{{ "images/favicon.svg" | relURL }}" />
  <link rel="icon" type="image/png" href="{{ "images/favicon.png" | relURL }}" />
  <link rel="apple-touch-icon" sizes="180x180" href="{{ "images/apple-touch-icon.png" | relURL }}" />
```

To use the favicons generated by favycon I needed to add the generated to `public/images` and make the proper reference with the **html tags provided** in the readme.txt at the `head.html`

> Images are referencing to `public/images`

```html
<link rel="apple-touch-icon" sizes="57x57" href="images/favicon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="images/favicon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="images/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="images/favicon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="images/favicon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="images/favicon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="images/favicon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="images/favicon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="images/favicon-180x180.png">
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="192x192" href="images/favicon-192x192.png">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="images/favicon-144x144.png">
<meta name="msapplication-config" content="images/browserconfig.xml">
```

{{< /details >}}

### Deploying to WnP via CLI

And just using [Cloudflare Workers and Pages to deploy](https://fossengineer.com/hosting-with-cloudflare-pages/) it with the [CLI wrangler](https://developers.cloudflare.com/workers/wrangler/install-and-update/)
```sh
#npm install wrangler
npx wrangler pages project create #this will install wrangler CLI the first time
npx wrangler pages deploy public #<BUILD_OUTPUT_DIRECTORY>

#npx wrangler pages project list #this are the ones you uploaded already
#npx wrangler pages deployment list
#npx wrangler pages project delete your_project_name
```

![CF Wrangler CLI](/blog_img/web/Cloudflare/CF-WnP-CLI.png)


---

## Next Steps

Making a better [LinkTree](https://linktr.ee/s/pricing/) or [linkbio](https://www.linknbio.com/pricing)

At the moment of writing, they are charging **5$/m for the first paid tier**.

It goes to 9$/m to have newsletter and web analytics...or customize the UI.

{{< callout type="info" >}}
A cool UI is mostly [a matter of CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-css/)
{{< /callout >}}



<!-- 
Gain deeper insights with comprehensive location/referrer based analytics and conversion tracking
Collect email addresses and phone numbers directly from your Linktree to build your own visitor list
Marketing tech capabilities including SEO settings, Google Analytics, Zapier, and Mailchimp integrations -->

* Helping local places get a better website - https://menu.cocolounge.pl/
  * https://cocolounge.pl/
  * https://www.dotnpixel.pl/about.html

### Themes To Try

* https://github.com/oxygenna-themes/foxi-astro-theme/

### Scaling Ideas

These are some ideas of whats coming next.

Making websites 1 by 1...*its kind of slow*.

But there are very well known services that provide interesting service without human interaction.

1) [Linktree](https://linktr.ee/s/pricing/)
2) [linkbio](https://www.linknbio.com/pricing)
3) [Glow (F/OSS)](https://github.com/tryglow/glow)
4) https://www.stan.store/

* Examples, this [artist profile](https://linktr.ee/bogusia.adryan) and this [awsome designer profile](https://linktr.ee/karwozniak)
    * And somethin' like:
        * https://github.com/jpanther/lynx - MIT!
        * https://github.com/SofiDevO/allmylinks
        * https://github.com/DBozhinovski/astro-theme-ltree - With [TinaCMS](https://jalcocert.github.io/JAlcocerT/create-your-website/#setup-a-static-cms)!

{{< callout type="info" >}}
Like we did at the **Social Media Project!**
{{< /callout >}}


* **Automatic Invoices**
  * With [Stripe as payment gateway](https://gitlab.com/fossengineer1/cv-check/-/tree/main/Z_Tests/Stripe?ref_type=heads), they create the invoices for your product/services automatically
  * There are some project to [create invoices with open software](https://fossengineer.com/open-source-invoice-creator/) - **Serverless Invoices** worked great for me!


{{% details title="ServerLess-Invoices Setup 🚀" closed="true" %}}

Create and manage invoices in your browser. Serverless Invoices is a free invoicing tool for freelancers and small businesses. 

**Made with Vue.js.** 

```sh
git clone https://github.com/mokuappio/serverless-invoices.git
#https://github.com/JAlcocerT/serverless-invoices

cd serverless-invoices
#rm -rf .git

docker build . -t mokuappio/serverless-invoices
#docker run -p 89:8080 -d --rm mokuappio/serverless-invoices
docker run -p 89:8080 -d --rm --name serverlessinvoices mokuappio/serverless-invoices

```

> There is an awsome [Dockerfile example](https://github.com/JAlcocerT/serverless-invoices/blob/main/Dockerfile) on how to bundle a Node App for Production

You can print to pdf, add your logo, taxes, CSS...

...**and import/export the json with all your created invoices**

* Or use their Saas: https://app.mokuapp.io/login

{{% /details %}}


---

## FAQ

### Creating an Interface For Hugo Theme Gallery

* https://github.com/JAlcocerT/EntreAgujayPunto

1. HUGO + HUGO Theme Gallery
2. FileBrowser
3. NGINX
4. A server

### FileBrowser x HUGO

**EDITING FROM THE FUTURE**: To make adding photos more intuitive, combine HUGO + Filebrowser.

For this very special project: `fotos.entreagujaypunto.com`

You will just need to commit the changes (or put some cron job), then CI/CD will do the rest and push it to your domain.

If you setup [filebrowser](https://fossengineer.com/selfhosting-filebrowser-docker/#filebrowser-docker-compose)


```yml
services:
  filebrowser:
    image: gtstef/filebrowser #docker pull gtstef/filebrowser

    container_name: filebrowser
    ports:
      - 8081:80
    volumes:
      - /home/Docker/FileBrowser/config:/config
      - /home/datafolder/Z_BACKUP_DATA/data1:/srv #tweak this
    restart: always       
```


For filebrowser quantum you will login with: `admin/admin` for the original one with 'admin/console logs'

```sh

```

To make it more intuitive, you can create an user and put that their path is directly `./content` which maps to the place where HUGO Theme Gallery loads all the photos.

![alt text](/blog_img/web/filebrowser-hugo/filebrowser-creating-user-hugo.png)

![Filebrowser view of the HUGO Theme Gallery Folder](/blog_img/web/filebrowser-hugo/filebrowser-hugotheme.png)

![alt text](/blog_img/web/filebrowser-hugo/hugotheme-rendered.png)

Provide access with

![alt text](/blog_img/web/filebrowser-hugo/filebrowser-cloudflare.png)

And as you are logged in already, show the analytics for motivation :) 

![alt text](/blog_img/web/filebrowser-hugo/cloudflare-hugo-analytics.png)

Before pushing changes, I had to do provide this git CLI:

```sh
git config --global --add safe.directory /home/jalcocert/EntreAgujayPunto
```