---
title: "[Micro SaaS] AI Driven PPTs"
date: 2025-10-15T01:20:21+01:00
draft: false
tags: ["BiP","Agents","Codex CLI","NextJS SliDev-Editor","Tech Talk","Theme Seriph","Vue"]
description: 'BiP a presentation generator for BAs. With both Firebase Auth and Logto working.'
url: 'ai-driven-presentations'
---


**Tl;DR**

SliDevJS is so cool and recently [vibe coded and made a tech talk about it](https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth/slidev/slidev-ba-tech-talk).


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/slidev-editor" title="NEW SliDev Editor Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for SliDev NextJS Editor with ToastUI" >}}
{{< /cards >}}


Whats also fantastic are [the themes](https://sli.dev/resources/theme-gallery) like: https://github.com/slidevjs/themes/tree/main/packages/theme-seriph


```sh
npm init slidev@latest slidev-ba-tech-talk
cd slidev-ba-tech-talk
#npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
#npm run build
#cd ./dist
#npx serve

#npx playwright install
npx slidev export --format pptx #PowerBI-Jira-ADO.pptx
npx slidev export --format pptx --output my-presentation.pptx
#npx slidev export --format pptx --range 1-5,8,10-12
#npx slidev export --format pdf
```

> Remember about `http://localhost:3030/overview/` or `/export` to get the `.pdf`


Then, its all about controlling one `slides.md`


```yml
---
theme: seriph #you can also change this to a custom company theme
background: '/company-ppt-theme.jpg' #place it in ./public
#background: https://cover.sli.dev
class: 'text-center'
drawings:
  persist: false
transition: slide-left
mdc: true
colorSchema: 'light'  # or 'dark' or 'auto'
---
```

1. If you have some particular ending slides to be always included, use the slide import inside your `.md`:


```yml
---
src: ./pages/imported-slides.md
hide: false
---
```

2. If you are creating a company related report, [like for Jira](https://jalcocert.github.io/JAlcocerT/jira-data-model-with-ai/), use the background templates

```yml
layout: cover
#background: https://cover.sli.dev
background: https://picsum.photos/id/26/4209/2769.jpg #background: /sample-slide-bg.svg
class: text-center
```

3. Something cooler? See [showcases](https://sli.dev/resources/showcases) like https://baizeai.github.io/talks/2025-06-11-kubecon-hk/#/10?clicks=2  as per the code https://raw.githubusercontent.com/BaizeAI/talks/refs/heads/main/packages/2025-06-11-kubecon-hk/slides.md





## Context for AI


Can a CLi agent, like Codex, Gemini CLI or Claude Code help to create the skeleton of SliDevJS ppts?





---

## Conclusions

After [this post](https://jalcocert.github.io/JAlcocerT/social-signin-101/#how-to-create-an-slidev-editor) where I started the SliDev Editor with NextJS just to learn how to implement [proper social auth with firebase our email verified via logto](https://jalcocert.github.io/JAlcocerT/social-signin-101/#how-to-create-an-slidev-editor): 

![SliDevJS editor with NextJS and Logto/firebase working for auth](/blog_img/DA/ppt/slidev-editor.png)


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/diagrams_ppts/#ppts" title="PPTs | Docs ↗" icon="book-open" >}}
{{< /cards >}}

NextJS combined with Logto worked perfectly: *there is a logto branch in the repo for this, separated from the firebase one*.

![alt text](/blog_img/DA/ppt/slidev-logto.png)

We get redirected to a **custom subdomain for Logto Auth**:

![alt text](/blog_img/DA/ppt/slidev-editor-signin-up.png)

Once completed, we get access to the webapp, where can have a WYSIWYG markdown editor for the `slides.md`:

![NextJS Web App with Toast UI to edit SliDev markdown](/blog_img/DA/ppt/slidev-editor-nextjs-toastui.png)

See how slidev pulls data from the weather API automatically: *this is the magic of SliDevJS working with APIs*.

![OpenMeteo API real time date pulled and working with SliDevJS](/blog_img/DA/ppt/slidev-open-meteo-component.png)

And here we have the resulting SliDev PPT ready to be presented:

![alt text](/blog_img/DA/ppt/slidev-editor-viewer.png)

The AI part was pending!

And also to make that each user will have their own bucket/folder with a `.md` to be edited.

Instead of a common one for all.


### Other PPT as a Code

See https://gitbrent.github.io/PptxGenJS/demos/ 

The most common and effective ways to create presentations "as code" (programmatically or using text-based formats) involve libraries and tools categorized by the language/format they use.

The primary categories and popular tools are:

1. Programming Libraries (Code-First)

These tools use native language syntax to build the presentation object by object, offering the most granular control.

| Language | Tool / Library | Key Feature |
| :--- | :--- | :--- |
| **Python** 🐍 | **`python-pptx`** | The industry standard for programmatically generating or modifying standard Microsoft PowerPoint (`.pptx`) files. |
| **JavaScript/Node.js** 💻 | **`PptxGenJS`** | Excellent for creating `.pptx` files directly from web applications (browser) or server-side scripts (Node.js). |
| **Go (Golang)** 🐹 | **`unioffice`** | A pure Go library for working with all Office Open XML documents, including `.pptx`. |
| **Ruby** ♦️ | **`ruby-powerpoint`** | Allows manipulation and generation of PowerPoint presentations in Ruby. |
| **Java** ☕ | **Apache POI** | A popular API used to create and maintain other file formats based on Office Open XML (OOXML) or Microsoft's OLE2, including a component for PowerPoint (`.pptx`). |


2. Markdown/YAML Tools (Text-First)

These tools allow you to write content in a simplified markup language (like Markdown) and then render or convert it into a presentation format. 

They prioritize content and speed over complex design.

| Tool | Format | Output/Target |
| :--- | :--- | :--- |
| **Slidev** | Markdown, YAML | Generates **HTML slides** (often used for technical talks), offering live coding and theming. |
| **Marp** | Markdown | Generates **HTML/PDF/PPTX** slides from Markdown, using CSS and custom themes for styling. |
| **reveal.js** | HTML, Markdown | A robust framework for creating interactive, browser-based HTML presentations. Many tools (like Pandoc) can output to this format. |
| **Pandoc** | Markdown, LaTeX | The universal document converter. It can convert Markdown to various formats, including $\LaTeX$-based Beamer slides or even HTML for reveal.js. |
| **Beamer** | $\LaTeX$ | A specialized $\LaTeX$ document class used to create high-quality, scientifically styled **PDF presentations**. |

3. Web Frameworks (UI/Data-First)

While not strictly "code-as-PPT," these modern tools use code and data to generate web-based presentations that are often exported to PDF or HTML.

* **Observable Plot/Vega-Lite** + **Static Site Generator (e.g., Astro, Next.js):** Allows you to generate highly dynamic, data-driven slides using JavaScript/React and modern visualization code.
* **Quarto:** An open-source scientific and technical publishing system (successor to R Markdown) that can output beautiful presentations (Reveal.js, Beamer, Powerpoint) directly from notebooks containing code and Markdown.

### Other Tech Talks

This year iv done [few other tech talks](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/#other-tech-talks).

* https://jalcocert.github.io/JAlcocerT/ai-driven-presentations/
* https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/#the-ai-tech-stack
* https://jalcocert.github.io/JAlcocerT/ai-assistant-streamlit/#dbchat-assistant

<!-- ![AIssistant](/blog_img/apps/ai-assistant-dbchat.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-assistant-streamlit/#dbchat-assistant" title="Chatting with a DB" image="/blog_img/apps/ai-assistant-dbchat.png" subtitle="Post about how to chat with a database!" >}}
{{< /cards >}}

{{< youtube "KXamTdJA-uc" >}}

Including, how to run LLMs locally: *from Q1 2024!*

{{< youtube id="vukAQPCv7Tw" autoplay="false" >}}