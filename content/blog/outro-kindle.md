---
title: "Kindle, ebooks 101, notes and Pandoc"
date: 2025-09-17
draft: false
tags: ["Katex vs Typst","kindle modding","ebook Notes Knowledge Base","sell-your-ebook","Business Model Canvas","Affine"]
description: 'Create your ebook and sell it on your website. Clear the chaos with Perplexity or notebookllm?'
url: 'kindle-clippings-knowledge-base'
---


**TL;DR**

A recap on the last **~5y+ of kindles notes.**

Pandoc can do very cool things.

+++ [Business Model Canvas](#business-canvas)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/ebook-ideas" title="My Ebook Ideas" image="/blog_img/apps/gh-jalcocert.svg" subtitle="New ebook ideas repo" >}}
{{< /cards >}}


**Intro**

Being able to **create a ebook** as a code and having a website to publish it is great.

But if you have consumed ebooks that other has written, you will have a lot of clippins.

Those notes saved for years.

Just waiting for you to get and read them.

So this is mostly a create + understand notes from kindle.

Rather than a way to admire how people have created **static status pages**: https://open-slum.pages.dev/ nor [get things](https://annas-archive.org/). 

> Uptime monitor / status pages in cloudflare pages

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![Kener Status Pages](/blog_img/selfh/HomeLab/statuspages/kener-setup.png)

Once Kener is ready, you will see this UI:

![Kener UI](/blog_img/selfh/HomeLab/statuspages/kener-manager-ui.png)



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

As simple as this:

```sh
python extract_notes.py "Brainfluence" brainfluence_notes.txt
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/ebook-ideas" title="Clippings to smaller txt | Py Script ↗" >}}
{{< /cards >}}

---

## Conclusions

With this, you will be able to create and distribute via epublibre or amazon `https://www.amazon.es/sendtokindle`.

Recently I wrote about note taking tools and [how to build your KB/Knowledge Base](https://jalcocert.github.io/JAlcocerT/knowledge-management/#knowledge-management-tools).

As I cant stop being impressed by **all we can achieve with simple markdown**...

1. With **Pandoc** you can create pdf from your .md as seen on [this *Jira* post](https://jalcocert.github.io/JAlcocerT/jira-data-model-with-ai/#md-to-pdf).

```sh
python3 test-pandoc.py

# Replace emojis with text equivalents
sed 's/✅/[OK]/g; s/❌/[X]/g; s/��/[CHART]/g' jira-pdm-req2tech.md > input-clean.md
pandoc input-clean.md -o jira-estimation.pdf --pdf-engine=xelatex --toc
```

And pushing to epub kindle compatible is also fine.

You can also try with [these tools](#converting-to-epub)


2. Katex is also great

3. Recently, I got to know about Typst [here](https://atareao.es/podcast/todavia-sufres-con-word-para-hacer-tu-tesis-o-proyecto-usa-typst/)

**KaTeX** and **[Typst](https://github.com/typst/typst)** serve entirely different purposes, so the comparison isn't about which is "better," but which is appropriate for a given task.

* **KaTeX is a JavaScript library** for rendering mathematical notation in web browsers.
* **Typst is a complete, modern document typesetting system** and programming language designed to replace LaTeX.

| Feature | KaTeX | Typst |
| :--- | :--- | :--- |
| **Primary Goal** | Fast, high-quality **math rendering** for the web (HTML/JavaScript). | Complete, modern **document typesetting** (compiles to PDF). |
| **Scope** | Math-only. | Full documents (text, math, figures, tables, bibliography, etc.). |
| **Output** | HTML/CSS. | PDF. |
| **Input Syntax** | **LaTeX math syntax** (`\frac{1}{2}`, `\sum_{n=1}^{\infty}`). | **Custom, simplified markup language** for text, with its own math mode syntax (`sum_(n=1)^oo 1/n`). |
| **Speed** | Extremely fast rendering on a web page. | Extremely fast compilation to PDF (often much faster than LaTeX). |
| **Customization/Extensibility**| Limited (focus on speed and core math support). | High (uses a built-in scripting/programming language for layouts and templates). |


KaTeX is optimized for speed and fidelity on the web. It's meant to take an existing math expression (using LaTeX syntax) and display it beautifully in a web page without relying on a server.

* **Pros:** **Blazing fast**, produces high-quality, non-janky math, and has a very small footprint.
* **Cons:** **Math only**. It cannot render full documents, handle complex layouts, or process general LaTeX commands (only the math subset).

Typst is a holistic tool aiming to modernize document creation. It's designed to be more intuitive and robust than LaTeX, using a clean markup that integrates better with a powerful scripting language.

* **Pros:** **Excellent developer experience** (simple syntax, good error messages, near-instant compilation/live preview), **superior programming capabilities** for complex layout and template creation, and native PDF output.
* **Cons:** **Young ecosystem** (fewer specialized packages and journal templates compared to LaTeX), and a **new math syntax** that requires learning even for existing LaTeX users. Typst's math rendering is a component of the whole system, not a specialized web library like KaTeX.


* Use **KaTeX** when you have a **website or application** and need to display math formulas quickly to the user.
* Use **Typst** when you need to **write a document** (a paper, thesis, report, book) and generate a final PDF file.

---

## FAQ

### JailBreak a Kindle

But, I got to know that this is possible: https://kindlemodding.org/

> See also https://github.com/NiLuJe/KindleTool

**Alternative software for kindle**

* https://koreader.rocks/

<!-- https://www.youtube.com/shorts/ta0ZUsugLN0 -->

{{< youtube "ta0ZUsugLN0" >}}


### Tools for eBooks


### Converting to epub

* https://github.com/dakoller/markdown-epub-converter

>  A simple Docker-based REST API that converts Markdown to EPUB format using Pandoc. Send markdown content via JSON, get an `EPUB` file back. 

* https://omnitools.app/pdf/pdf-to-epub

### Business Canvas

This is one of those entrepreneurship tools that I find useful.

* https://en.wikipedia.org/wiki/Business_model_canvas

* https://leantime.io/mastering-business-model-a-guide-to-completing-the-lean-canvas-model/

* https://excalidraw.com/
* https://github.com/excalidraw/excalidraw-libraries
    * https://libraries.excalidraw.com/?theme=light&sort=default

### What is AffinePro

If you are building a [KB](https://jalcocert.github.io/JAlcocerT/knowledge-management/), you might consider AFFine:

* https://github.com/toeverything/AFFiNE
    * https://affine.pro/pricing
    * https://affine.pro/templates/value-proposition-canvas
        * https://docs.affine.pro/self-host-affine/references/environment-variables

> The universal editor that lets you work, play, present or create just about anything.

<!-- https://www.youtube.com/watch?v=xMuZENfEYEc -->

{{< youtube "xMuZENfEYEc" >}}

```sh
#chmod +x affine-0.13.5-stable-linux-x64.appimage
#./affine-0.13.5-stable-linux-x64.appimage
```