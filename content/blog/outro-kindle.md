---
title: "Kindle, notes and Pandoc"
date: 2025-09-17
draft: false
tags: ["Outro","kindle modding","Your ebook Notes Knowledge Base","sell-your-ebook","Business Model Canvas","Affine"]
description: 'Create your ebook and sell it on your website. Clear the chaos with Perplexity or notebookllm?'
url: 'kindle-clippings-knowledge-base'
---


**TL;DR**

A recap on the last 5y+ of kindles notes.

+++ [Business Model Canvas](#business-canvas)


**Intro**

Being able to create your ebook as a code and having a website to publish it is great.

But if you have consumed ebooks that other has written, you will have a lot of clippins.

Those notes saved for years.

Just waiting for you to get and read them.



### Kindle Notes to AI

Kindle notes are saved into a `.txt` in the device.

I was storing notes for few years already and im really curious to see whats inside.


Some time back I saw:

* https://github.com/mckaywrigley/kindle-gpt


But in the meantime, there were news:

> I gave it a try with Google's NotebookLLM, now even Perplexity can help you upload that txt and clear them...

> > Custom is custom, but...would it be better out of the box?


![Perplexity custom files as source](/blog_img/GenAI/perplexity-files.png)


{{< callout type="info" >}}
Kindles files wont be recognized unless you use a proper microUSB data cable. You can access their content via `https://read.amazon.com/landing`
{{< /callout >}}

### Parsing the notes via Python




---

## Conclusions

Recently I wrote about note taking tools and [how to build your KB/Knowledge Base](https://jalcocert.github.io/JAlcocerT/knowledge-management/#knowledge-management-tools).

As I cant stop being impressed by all we can achieve with simple markdown...

1. With **Pandoc** you can create pdf from your .md as seen on [this *Jira* post](https://jalcocert.github.io/JAlcocerT/jira-data-model-with-ai/#md-to-pdf).

```sh
python3 test-pandoc.py

# Replace emojis with text equivalents
sed 's/✅/[OK]/g; s/❌/[X]/g; s/��/[CHART]/g' jira-pdm-req2tech.md > input-clean.md
pandoc input-clean.md -o jira-estimation.pdf --pdf-engine=xelatex --toc
```

And pushing to epub kindle compatible is also fine.

You can also try with [these tools](#converting-to-epub)


2. 


---

## FAQ

### JailBreak a Kindle

But, I got to know that this is possible: https://kindlemodding.org/

### Tools for eBooks


### Converting to epub

* https://github.com/dakoller/markdown-epub-converter

>  A simple Docker-based REST API that converts Markdown to EPUB format using Pandoc. Send markdown content via JSON, get an `EPUB` file back. 

* https://omnitools.app/pdf/pdf-to-epub

### Business Canvas

* https://en.wikipedia.org/wiki/Business_model_canvas

* https://leantime.io/mastering-business-model-a-guide-to-completing-the-lean-canvas-model/

* https://excalidraw.com/?
* https://github.com/excalidraw/excalidraw-libraries
    * https://libraries.excalidraw.com/?theme=light&sort=default

### What is AffinePro

* https://github.com/toeverything/AFFiNE
    * https://affine.pro/pricing
    * https://affine.pro/templates/value-proposition-canvas
        * https://docs.affine.pro/self-host-affine/references/environment-variables

> The universal editor that lets you work, play, present or create just about anything.