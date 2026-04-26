---
title: "Creating ebooks"
date: 2025-10-28T10:20:21+01:00
draft: false
summary: 'How to create your ebooks'
url: 'cool-ebooks'
---

For me, creating ebooks has been all about **knowledge consolidation** and to be able to help others without my active time investment.

An [offer](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers) you cant refuse: *use your time to gain curated knowledge*.

I was tinkering with **ebooks creation** [here](https://github.com/JAlcocerT/ebook-ideas/tree/master) and with a website to show them [here](https://github.com/JAlcocerT/sell-your-ebook).

It was all about to [extract knowledge from Kinddle clippings](https://jalcocert.github.io/JAlcocerT/kindle-clippings-knowledge-base/) and I ended up creating some instead.

## ebooks 101

{{< callout type="info" >}}
I ended up giving free consolidated branded value [via web/ebooks](#webooks)
{{< /callout >}}

### PDFs

PDFs are strange files, actually.

As long as you are confortable with pandoc, you just need a `.md` to create a pdf.

What for? For example, to create a quick hand over document:

```sh
#git clone https://github.com/JAlcocerT/ourika
pandoc hand-over.md -o hand-over.pdf
#cd /home/jalcocert/Desktop && zip -r ourika.zip ourika -x "ourika/node_modules/*" -x "ourika/.git/*"
```

Thanks to R Language + Rmd + Latex, creating cool PDFs is very simple.

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
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/#show-and-obfuscate/" title="Create a web/ook WebApp" image="/blog_img/dev/fastapi/ebook-obfuscate-ui.png" subtitle="Show or Obfuscate your ebook content" >}}
{{< /cards >}}

You could think about using your books as lead magnets:

![alt text](/blog_img/shipping/astro-ebook-subscribe.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers/" title="Offers | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/marketing/" title="Marketing | Docs ↗" icon="book-open" >}}
{{< /cards >}}


> Consider that there are [interesting tools](https://jalcocert.github.io/JAlcocerT/docs/coolresources/#interesting-webapps) to work with PDFs!

You can also extract information from PDFs with Kreuzberg:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kreuzberg" title="Extract PDF info via Kreuzberg | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### Epubs

Now, the epub files are closer to htmls than we might expect.

IMO, they are trickier to create compared to PDFs.

### Web/ooks

Whats the problem on having these?

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/1ton-ebooks" title="From blogs/docs to web ebooks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code a Web App to serve md content via web/book and also downlodable as PDFs" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


## Tools for Writters

* https://github.com/languagetool-org/languagetool

>  Style and Grammar Checker for 25+ Languages 