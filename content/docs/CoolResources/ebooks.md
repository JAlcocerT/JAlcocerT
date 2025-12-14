---
title: "Creating your ebooks"
date: 2025-10-28T10:20:21+01:00
draft: false
tags: ["dev"]
summary: 'How to create your ebooks'
url: 'cool-ebooks'
---

For me, creating ebooks has been all about **knowledge consoldation** and to be able to help others without my active time investment.

An [offer](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers) you cant refuse: *use your time to gain curated knowledge*.

I was tinkering with **ebooks creation** [here](https://github.com/JAlcocerT/ebook-ideas/tree/master) and with a website to show them [here](https://github.com/JAlcocerT/sell-your-ebook).

It was all about to [extract knowledge from Kinddle clippings](https://jalcocert.github.io/JAlcocerT/kindle-clippings-knowledge-base/) and I ended up creating some instead.

## ebooks 101

### PDFs

PDFs are strange files, actually.

Thanks to R Language + Rmd + Latex, creating PDFs is very simple.

See the source code of the open ebooks Ive created for the docs [here](https://github.com/JAlcocerT/JAlcocerT/tree/master/Z_ebooks)

```sh
#git clone https://github.com/JAlcocerT/JAlcocerT.git
#cd JAlcocerT/

# From the repo root 
Rscript Z_ebooks/render.R \
  --input Z_ebooks/dna-ebook.md \
  --output Z_ebooks/dna-ebook.pdf \
  --cover Z_ebooks/sample-cover.png
```

<!-- ![Astro landing page book - Sell your ebook UI](/blog_img/shipping/astro-sell-your-ebook.png)

 -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/#using-sell-your-ebook" title="Astro x eBook PDF Landing" image="/blog_img/shipping/astro-sell-your-ebook.png" subtitle="Share your ebook with its own landing" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/" title="Create a web/ook WebApp" image="/blog_img/dev/fastapi/ebook-obfuscate-ui.png" subtitle="Show or Obfuscate your ebook content" >}}
{{< /cards >}}

You could think about using your books as lead magnets:

![alt text](/blog_img/shipping/astro-ebook-subscribe.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers/" title="Offers | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/marketing/" title="Marketing | Docs ↗" icon="book-open" >}}
{{< /cards >}}


> Consider that there are [interesting tools](https://jalcocert.github.io/JAlcocerT/docs/coolresources/#interesting-webapps) to work with PDFs!

### Epubs

Now, the epub files are closer to htmls than we might expect.

And IMO they are trickier to create compared to PDFs.


## Tools for Writters

* https://github.com/languagetool-org/languagetool

>  Style and Grammar Checker for 25+ Languages 