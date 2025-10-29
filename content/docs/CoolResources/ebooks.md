---
title: "Creating your ebooks"
date: 2025-10-28T10:20:21+01:00
draft: false
tags: ["dev"]
summary: 'How to create your ebooks'
url: 'cool-ebooks'
---


I was tinkering with ebooks creation [here](https://github.com/JAlcocerT/ebook-ideas/tree/master) and with a website to show them [here](https://github.com/JAlcocerT/sell-your-ebook).

It was all about to [extract knowledge from Kinddle clippings](https://jalcocert.github.io/JAlcocerT/kindle-clippings-knowledge-base/) and I ended up creating instead.

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

### Epubs

Now, the epub files are closer to htmls than we might expect.