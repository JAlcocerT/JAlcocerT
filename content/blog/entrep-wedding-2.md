---
title: "BiP a Micro-SaaS | Wedding Edition"
date: 2025-09-19T12:20:21+01:00
draft: false
tags: ["QR & PDF","Web & DNS","Cloudflare API","Porkbun API","SlubneChwile"]
description: 'Firebase + PB BaaS. Everything that can be static, is static 🤯'
url: 'building-in-public-wedding-photo-galleries'
---

https://jalcocert.github.io/JAlcocerT/wedding-photo-galleries/

**Tl;DR**

I got that domain!

```sh
#dig jalcocertech.com any
dig slubnechwile.com any
```

+++ got motivated by people [BiP open startups](#about-building-in-public)

**Intro**

We come from [this post](https://jalcocert.github.io/JAlcocerT/wedding-photo-galleries/)

Time to keep [building in public]() the project.

I left them at this stage:

* https://github.com/JAlcocerT/slubnechwile
* https://github.com/JAlcocerT/Flask_SlubnyChwile

Because since the last commits, Ive learnt a lot.

And I wont be using Filebrowser or some selfhostable webapp to do the BE part.




## Features

What others are doing?

* https://planning.wedding/pricing

This one is great, yet it seems that the way to get MRR is via the companies who want to seel to the tons of people registering to get married there.




**The free stuff**

**The try for free stuff**

**The paid stuff**

### QR Code Generator

* https://it-tools.tech/qrcode-generator


#### QR Generator CSR

But whatever can be static, keep it static.

Same applies to your QR Code web generator.

### PDFs are free!

### Web when registered

Something like `slubnechwile.com/bodapepe`


### The storage space - Paid

As I dont want to store and backup stuff - this can be done via s3/r2/b2...



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

This is a common, practical pattern used in production apps for secure, scalable file uploads with Cloudflare R2 and Next.js.[1][2][3]

[1](https://github.com/diwosuwanto/cloudflare-r2-with-nextjs-upload-download-delete)
[2](https://buildwithmatija.com/blog/how-to-upload-files-to-cloudflare-r2-nextjs)
[3](https://developers.cloudflare.com/workers/tutorials/upload-assets-with-r2/)

#### Upsales

##### Get a phyiscal copy of the digital photo book


##### Extend the time to download your photos






---

## Conclusions



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


#### Configuring Cloudflare


## About building in public

See `https://marclou.com/` and the related h`ttps://indiepa.ge/`

> People are even linking stripe to validate what they earn on their startups: https://indiepa.ge/leaderboard

They call it *the open startup*. 

Even Ghost was publishing their ARR metrics.

Or Ghostfolio: https://ghostfol.io/en/open

Dont assume that something that exists cant be improved, like from `https://zenvoice.io/#pricing` to https://github.com/JAlcocerT/serverless-invoices