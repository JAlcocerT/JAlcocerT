---
title: "BiP a Micro-SaaS | Wedding Edition"
date: 2025-10-16T09:20:21+01:00
draft: false
tags: ["QR & PDF","Web & DNS","Cloudflare API","Porkbun API","SlubneChwile","R2","ARR","Carbone vs PDFME"]
description: 'Firebase + PB BaaS. Everything that can be static, is static. CSR Rendering QR and PDFs in browser 🤯'
url: 'building-in-public-wedding-photo-galleries'
---


**Tl;DR**

Coming from https://jalcocert.github.io/JAlcocerT/wedding-photo-galleries/

And I got that domain!

Lets go with that wedding v2.

![Slubnechwile domain porkbun](/blog_img/web/porkbun-slubne.png)

```sh
#dig jalcocertech.com any
dig slubnechwile.com any
```

And quickly moved the NS to cloudflare ones, to start the game.

+++ got motivated by people [BiP open startups](#about-building-in-public) and their published ARR

**Intro**

We come from [this post](https://jalcocert.github.io/JAlcocerT/wedding-photo-galleries/)

Time to keep building in public the project.

With some [marketing](https://jalcocert.github.io/JAlcocerT/software-for-marketing-agencies/) and [bootstrap](https://jalcocert.github.io/JAlcocerT/whats-boostrap/) concepts plugged in.

I left them at this stage:

* https://github.com/JAlcocerT/slubnechwile
* https://github.com/JAlcocerT/Flask_SlubnyChwile

Because since the last commits, Ive learnt a lot.

And I wont be using Filebrowser or some selfhostable webapp to do the BE part.




## Features

What others are doing?

* https://planning.wedding/pricing

This one is great, yet it seems that the way to get MRR is via the companies who want to seel to the tons of people registering to get married there.




**The free stuff**: QR -> .md -> PDF to download

1. Make a QR for your wedding url with custom icon/colors
2. Get a pdf ready to print in different sizes to place during your wedding

https://me-qr.com/page/blog/colored-qr-codes
* [QR Code](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/QR_Gen.py) Generation with streamlit

Like the one I used for [this weddin](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt).

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)


**The try for free stuff**


**The paid stuff**

1. When you have logged in and paid for a tier
2. You will have a link (static route, no custom sub/domain) to share for guests and availity to set user/pwd for guest to upload
3. One week before the wedding, there will be the possibility to upload photos to a R2 bucket, as done [here](https://jalcocert.github.io/JAlcocerT/hugo-pocketbase-and-r2/)

### QR Code Generator

> InkScape can also Generate Branded QR's

* https://it-tools.tech/qrcode-generator

**Link Shorteners / QR Gen**

* https://www.qrcode-monkey.com/
* https://bitly.com/

* https://github.com/dubinc/dub
    * https://github.com/dubinc/dub#self-hosting
    * https://dub.co/pricing

> Yet this is free https://emn178.github.io/online-tools/qr-code/generator/



#### QR Generator CSR

But whatever can be static, keep it static.

Same applies to your QR Code web generator.

> bc sometimes, a server when sometimes they just stop working `https://qrco.de/bg9jax`

> > or they force you to register `https://login.qr-code-generator.com/`

See, people have done this QR CSR setup already:

1. https://github.com/lyqht/mini-qr

>  Create & scan cute qr codes easily 👾 

> > Deployed statically at https://mini-qr-code-generator.vercel.app/


### PDFs are free!

See, there are webapp projects that create PDF for you.

Like this [OSS CV as a code](https://fossengineer.com/open-source-curriculum/): *I even [forked OpenResume](https://github.com/JAlcocerT/open-resume)*

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/reactive-resume" title="Reactive Resume | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/open-resume" title="Open-Resume| Docker Config 🐋 ↗" >}}
{{< /cards >}}

This one particularly, uses React-pdf 

> creates PDF files and is used by the resume builder to create a downloadable PDF file.

Why should PDFs creation not be free, when is [one of the things that CSR can do](https://jalcocert.github.io/JAlcocerT/csr-and-js/)?

An example?

See how [bentoPDF](https://github.com/alam00000/bentopdf) and its [tech get it done](https://github.com/JAlcocerT/Home-Lab/blob/main/bentopdf/z-tech.md)

Yes, BentoPDF is a powerful, privacy-first, client-side PDF toolkit that allows you to manipulate, edit, merge, and process PDF files directly in your browser.

No server-side processing is required, ensuring your files remain secure and private.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/bentopdf" title="BentoPDF | Docker Config 🐋 ↗" >}}
{{< /cards >}}

So I create this:

```sh
python3 -m http.server 8003
```

![QR - PDF via CSR vibe coded with Claude 4.5](/blog_img/apps/nodejs-qr-pdf.png)


> Built with ❤️ using [QRCode.js](https://davidshimjs.github.io/qrcodejs/) and [jsPDF](https://github.com/parallax/jsPDF)


#### PDF with Carbone

Then, I got to know **Carbone**: https://carbone.io/examples/

* https://github.com/carboneio/carbone


```sh
docker run -t -i --rm -p 4000:4000 carbone/carbone-ee
```

> CARBONE COMMUNITY LICENSE AGREEMENT | Fast and simple **report generator**, from JSON to pdf, xslx, docx, odt...

Which I tested here

But it looks quite complex to use with several moving parts

* https://carbone.io/documentation/design/substitutions/the-basics.html
* https://carbone.io/documentation/developer/api-sdks/python.html
* https://carbone.io/documentation/design/overview/template-feature.html


{{< callout type="info" >}}
I also got to know about **PDFME**: https://pdfme.com/
{{< /callout >}}

* https://pdfme.com/templates
  * With a **playground** to design: https://playground.pdfme.com/
  * https://pdfme.com/docs/getting-started
* https://github.com/pdfme/pdfme

> **MIT** |  Open-source PDF generation library built with TypeScript and React. Features a **WYSIWYG template designer**, PDF viewer, and powerful generation capabilities. Create custom **PDFs effortlessly in both browser** and Node.js environments. 

The [templates](https://pdfme.com/docs/getting-started#template) can be divided into two parts: a fixed part and a variable part.


* `basePdf`: PDF data for the fixed part of the PDF to be generated.
* `schemas`: Definition data for the variable part of the PDF to be generated.


{{< callout type="info" >}}
You also have **PlutoPrint**: https://github.com/plutoprint/plutoprint with awsome [docs](https://plutoprint.readthedocs.io/en/latest/). Seems an option to consider for weddings ✅
{{< /callout >}}

> **MIT** | A Python Library for Generating **PDFs and Images from HTML**, powered by PlutoBook 

> > The [examples](https://github.com/plutoprint/plutoprint-samples) are also great and I tested [here](https://github.com/JAlcocerT/ebook-ideas/tree/master/x-plutoprint)


### Web when registered

Something like `slubnechwile.com/bodapepe`


### The storage space - Paid

As I dont want to store and backup stuff - this can be done via s3/r2/b2...

{{< callout type="info" >}}
Previously, I was thinking to have a domain + Filebrowser instance setup for each people paying for this. Ok for a [onetime](https://jalcocert.github.io/JAlcocerT/software-for-weddings/), hard to automate for mass production.
{{< /callout >}}


Using Next.js API routes to generate presigned URLs is a recommended approach for securely uploading photos and videos from a client-side rendered (CSR) app to Cloudflare R2.

Why Next.js API Routes for Presigned URLs?

- Keeps Cloudflare R2 credentials secret and secure on the server side.
- The frontend only receives a temporary presigned URL allowing uploads without direct access to secrets.
- Easily integrates with client-side upload buttons in your Next.js app.
- Allows you to implement custom authentication and authorization logic on the server.

Implementation Idea for Your Wedding App
- Users navigate to a URL like `slubnechwile/bodajuan`.
- On visiting, they are prompted for a hardcoded username/password for that specific wedding event.
- Upon successful authentication, the upload interface is shown.
- When a guest selects photos/videos to upload, the client requests a presigned upload URL from a Next.js API route.
- The API route verifies the user session or password, generates the presigned URL from Cloudflare R2, and returns it to the client.
- The client uploads the files directly to R2 using this URL securely.

This approach gives you full control over who can upload, limits exposure of credentials, and leverages secure temporary URLs for uploads, fitting well with your scenario of guest access for a specific wedding event.

This is a common, practical pattern used in production apps for secure, scalable file uploads with Cloudflare R2 and Next.js.

#### Cloudflare R2

So the flow will be: QR creation -> PDF customization & download -> Pay and get that CF R2 space

With the photos being sent to a per wedding space inside [Cloudflare R2 s3 storage, as done on this post](https://jalcocert.github.io/JAlcocerT/hugo-pocketbase-and-r2/#cloudflare-r2).

![Testing nextjs app to upload files to cf R2 buckets](/blog_img/web/agujapunto-r2-firebase/testing.png)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg" title="Just SSG Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Making SSG look cool with shortcodes and components" >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg" title="Just SSG Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Making SSG look cool with shortcodes and components" >}}
{{< /cards >}}



#### Upsales

1. We keep your photos 60 days more for you to download
2. Buy the physical copy if you have not already

##### Get a phyiscal copy of the digital photo book


##### Extend the time to download your photos






---

## Conclusions

Seems like all tech pieces are *more or less* matching already.

See how the competition is doing:

1. `https://planning.wedding/`
2. `wedibox.com`
3. `waldophotos.com`



---

## FAQ

### Domain Management

#### Porkbun API

On the waiting2landing post and project, I was tinkering with CF and PB APIs:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/cloudflare-dns-updater.py" title="Cloudflare DNS API Py Script ↗" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/porkbun-domains.py" title="Porkbun API Py Script ↗" >}}
{{< /cards >}}

I Still had to buy the domain via UI.

But I have improved the script as per their docs: https://porkbun.com/api/json/v3/documentation#Domain%20Check

And now it makes more than just quote the price.

1. Availability
2. Price
3. Domain Get Name Servers
4. Domain Update Name Servers
5. What it WON'T do is to buy a domain for you programatically

### Landing Page

The Sassify theme is just awsome: https://astro-sassify.larryxue.dev/

**Inspiration** for modern SaaS landing pages:

1. https://operately.com/`


**Inspirational login sections**

2. https://rxresu.me/auth/login from reactive resume
3. Mailerlite 


#### Configuring Cloudflare


## About building in public

For some indiehackers, its all about BiP.

See `https://marclou.com/` and the related h`ttps://indiepa.ge/`

> People are even linking stripe to validate what they earn on their startups: https://indiepa.ge/leaderboard

They call it *the open startup*. 

Even Ghost was publishing their ARR metrics openly:

Or Ghostfolio: https://ghostfol.io/en/open

Dont assume that something that exists cant be improved, like from `https://zenvoice.io/#pricing` to https://github.com/JAlcocerT/serverless-invoices