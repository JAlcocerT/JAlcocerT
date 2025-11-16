---
title: "Landing (and more) for Real Estate"
date: 2025-11-16T08:20:21+01:00
draft: false
tags: ["Web x CMS","Astro Payroll Theme","Strapi vs PayloadCMS","n8n","Scrapping"]
description: 'Landing page and components for real estate Galleries.'
url: 'real-estate-landing'
---


**TL;DR**

I have launched recently a quick ebook on web version and downloadable as PDF as well.

{{< cards >}}
  {{< card link="https://diy.jalcocertech.com/" title="DIY Website eBook" image="/blog_img/dev/fastapi/ebook-obfuscate-ui.png" subtitle="JAlcocerTech DIY Series | Ebook to create a Website for your brand" >}}
{{< /cards >}}

Because in the end having a website is a matter of: 

1. How much you really need it? - Aka, will you earn money>costs with it?
2. Knowledge - Do you know how to make one? if now, can you learn how to do it quick?
3. Ultimately, how much are you willing to pay for it? Or better said, how much you asses your $/h rate compared to others?

> Plot twist, if you claim to earn a lot of money and also claim to have clients, you wont mind to pay interesting $/h rates to others to build it for you. Would you?

> > Yea, I liked the DIY vs DWY vs DFY model :)

**Intro** 

Ive been playing quite a lot with PB and quick astro themes lately.

I could not waste the opportunity to make some **tech upgrades** for a friend.

Specially since I could get Strapi and PayloadCMS working within containers:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/strapi" title="Strapi | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/directus" title="Directus | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![Strapi UI](/blog_img/web/cms/strapi-admin-ui.png)

## The Stack

### New Theme

Its a combination of:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/real-estate-moi/tree/main/moirealestate-astro-theme" title="Moi Real Estate" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code Astro x Flask as CMS" >}}
  {{< card link="https://github.com/JAlcocerT/payroll-workers-pb" title="Astro Payroll x PB SDK" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro with login auth via Cloudflare Workers" >}}
{{< /cards >}}


1. Simplifcation of the Astro Payroll Theme, that I forked [here](https://github.com/JAlcocerT/payroll-workers-pb)

![alt text](/blog_img/web/success3-realestate/astro-pb/property-gallery-screwfast.png)

2. The gallery look and feel from the [previous version source code](https://github.com/JAlcocerT/real-estate-moi/tree/main/moirealestate-astro-theme) at `./real-estate-moi/ScrewFastMoiRealEstate`. Commented [here](https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/#real-estate), as I tried to combined [FlaskCMS](https://github.com/JAlcocerT/real-estate-moi/tree/main/moirealestate-flaskcms) x the Astro theme.


![alt text](/blog_img/web/success3-realestate/astro-pb/property-gallery-screwfast.png)

```sh
git clone https://github.com/JAlcocerT/real-estate-moi
cd moirealestate-astro-theme

#npm run dev -- --host 0.0.0.0 --port 4321
#sudo docker-compose up -d astro-dev
```

![Astro IG Gallery inpost for Properties](/blog_img/web/moi-realestate/ig-gallery.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg/tree/main/astro-ssg" title="Astro Components Repo | WA Bouble, IG Gallery... ↗" >}}
  {{< card link="https://github.com/JAlcocerT/cybernetik-realestate-moises/blob/main/astro-nomy/src/components/InstagramGallery.astro" title="Astro Component | Make a in-post Gallery, zoomable and that allows to move to next  ↗" >}}
{{< /cards >}}

I just followed this steps to initiate the repo programatically and push it with `gh`: <https://github.com/JAlcocerT/moi-realestate-pb>

```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git add .
git commit -m "Initial commit"
```

```sh
#sudo apt install gh
gh auth login
gh repo create moi-realestate-pb --private --source=. --remote=origin --push
```

I brought the repos as submodules 101, for the first time ever:

```sh
git status
git submodule status
git remote -v
```

So to use this in the future

```sh
git clone --recurse-submodules https://github.com/JAlcocerT/moi-realestate-pb.git
# or, after a normal clone:
#git submodule update --init --recursive
```

Now here we have the old working screw fast with photo gallery: `./moi-realestate-pb/submodules/real-estate-moi/ScrewFastMoiRealEstate`

You just need to run it and go to `http://localhost:4321/property/`

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/moi-realestate-pb" title="NEW - Real Estate Landing x PB SDK Gallery" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro + PB for Real Estate" >}}
{{< /cards >}}

So...how is this going to **actually work**?

### Validate the Website


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


---

## Conclusions

See the difference with a cool (but no so fast website).

Im sure that this website works, because their service is great.

![www.lodgenstryn.no](/blog_img/web/moi-realestate/strin-cool-website-loading.png)

But if people dont know you or you are starting a brand: you better make it easy for people to like you.

### Copy Paste Plugins for Webs

#### N8N

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
{{< /cards >}}

#### Cal


#### MailerLite


{{< details title="Setup MailerLite 📌" closed="true" >}}

You will need to authenticate that you own the email and also the domain (with DNS).

Go to your [mailerlite dashboard UI](https://dashboard.mailerlite.com)

I am using Cloudflare for that domain, and the DNS were updated automatically via UI.

There are some **CName and txt records** and they will be **DNS only**, not proxied.

![MailerLite Custom Domain Setup](/blog_img/web/SaaS/mailerlite-domainsetup.png)

**Create a new form** and you will get the JS to place before the `</head>` of your web.

```js
<!-- MailerLite Universal -->
<script>
    (function(w,d,e,u,f,l,n){w[f]=w[f]||function(){(w[f].q=w[f].q||[])
    .push(arguments);},l=d.createElement(e),l.async=1,l.src=u,
    n=d.getElementsByTagName(e)[0],n.parentNode.insertBefore(l,n);})
    (window,document,'script','https://assets.mailerlite.com/js/universal.js','ml');
    ml('account', 'some_acount_id');
</script>
<!-- End MailerLite Universal -->
```

> You can also get **MailerLite working with a button**, so that it opens as pop up:

```html
<a class="ml-onclick-form" href="javascript:void(0)" onclick="ml('show', 'some_id_here', true)">Click here to show form</a>

and use it with your components, for example
<form id="simple-newsletter-form" class="input-container" method="post" action="javascript:void(0);" onsubmit="ml('show', 'some_id_here', true); return false;">
    <input type="submit" value="Ready to Know?" class="ml-onclick-form" style="appearance: button; -webkit-appearance: button; cursor: pointer;">
</form>
```

{{< /details >}}