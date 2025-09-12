---
title: "HUGO Photo Galleries and User uploads"
date: 2025-09-13
draft: false
tags: ["Web","SSG","Photo-Gallery","Pocketbase CMS"]
description: 'Using a HUGO Theme with Pocketbase Auth and Cloudflare R2 + Workers'
url: 'hugo-pocketbase-and-r2'
---


**Intro**

We now, [HUGO can also be cool](https://jalcocert.github.io/JAlcocerT/cool-hugo-themes/).

And few weeks ago I was created some kind of HUGO Flasked version to be edited via ~ FlaskCMS.

But as Pocketbase happened in the meantime, I thought, do I really need Flask for this?

I just want to have images placed into some folders, and pocketbase can do that, even relate it to object storage like R2 thanks to its minio compatibility.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-pocketbased" title="NEW Hugo Theme Gallery x PB" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Hugo Gallery x Custom Pocketbase CMS" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked" title="Hugo Theme Gallery Forked" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Hugo Gallery x Custom Flask CMS" >}}
{{< /cards >}}

## The Hugo Gallery Stack


{{< cards cols="1" >}}
  {{< card link="https://whilecyclingthere.web.app/" title="Cycling There Photo Gallery" >}}
  {{< card link="https://entreagujaypunto.com/" title="Portfolio Aguja&Punto" >}}
{{< /cards >}}

### Cloudflare R2

* https://dash.cloudflare.com
    * https://developers.cloudflare.com/r2/pricing/

> R2 provides you with **S3-compatible** object storage with zero egress fees.

As of now, they provide 10GB free, but be careful as you need to provide CC details.

Just recently I got to know: https://github.com/sjackp/r2-gallery

> A minimalist web UI to manage a Cloudflare R2 bucket 