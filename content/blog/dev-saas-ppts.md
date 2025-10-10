---
title: "[Micro SaaS] AI Driven PPTs"
date: 2025-10-10T01:20:21+01:00
draft: false
tags: ["BiP","Agents","Codex CLI","SliDev-Editor","Tech Talk","Theme Seriph"]
description: 'BiP a presentation generator for BAs.'
url: 'ai-driven-presentations'
---


**Tl;DR**

SliDevJS is so cool.

```sh
npm init slidev@latest slidev-ba-tech-talk
cd slidev-ba-tech-talk
#npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
#npm run build
#cd ./dist
#npx serve

#npx playwright install
npx slidev export --format pptx --output my-presentation.pptx
#npx slidev export --format pptx --range 1-5,8,10-12
#npx slidev export --format pdf
```

> Remember about `http://localhost:3030/overview/` or `/exporter` to get the `.pdf`

Then, its all about controlling one `slides.md`

```yml
---
theme: seriph #you can also change this to a company theme
background: '/company-ppt-theme.jpg' #place it in ./public
#background: https://cover.sli.dev
class: 'text-center'
drawings:
  persist: false
transition: slide-left
mdc: true
---
```




**Intro**

After this post: https://jalcocert.github.io/JAlcocerT/social-signin-101/#how-to-create-an-slidev-editor

The AI part was pending!

And also to make that each user will have their own bucket/folder with a `.md` to be edited.

Instead of a common one for all.


## Context for AI


https://diagrams.mingrammer.com/docs/getting-started/examples


---

## Conclusions


### Other PPT as a Code

1. https://gitbrent.github.io/PptxGenJS/demos/ 
2. 