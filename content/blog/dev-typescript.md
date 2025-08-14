---
title: "Whats Typescript?"
date: 2025-08-14
draft: false
tags: ["SSG","Web","Yarnness"]
description: 'Typescript and how easy is for everyone to get a blog.'
url: 'whats-typescript'
---

**TL;DR:** It was about time to recap with it can be done with [TypeScrypt](#ts) (and what now) + Update on [knitting blog](#a-blog-for-all)

**Intro**



## TS


---

## Conclusions

Thats about typescript.

Now: Do you need to be a WebDev to get a cool blog and write publically on the internet?

Not really.

### A blog for All

See how quickly you can get a cool (and OSS'ed) Astro Theme going:

Knitting blogging theme: 

```sh
git clone https://github.com/hasinhayder/storyteller-astro
cd storyteller-astro
npm install
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

You can ask now coding agents (Cursor, Windsurf, Copilot...) to guide you.

But basically you can do `CTRL+F` to find which files drive which content.

A good starting point is always `./src/content` where you will see some kind of `/blog` or `/article` folder with the markdowns that drive the content of your blog.

> Just edit one and start writing your thing, is that simple!

When you are confortable with this, *if you want to share it publically*, you have one more step.

Deploy your new blog statically to your preferred solution:

https://fossengineer.com/alternatives-for-hosting-static-websites/