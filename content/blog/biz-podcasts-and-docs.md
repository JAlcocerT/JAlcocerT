---
title: "Tech for Creating Documentation and Podcast"
date: 2025-05-15
draft: false
tags: ["Web"]
description: "How to create podcasts and a related Astro (Starlight and AstroPod) website for them. A look to GitPodcast and Research Agents."
url: 'tech-for-podcast'
---

## More Web Stuff with Astro SSG

### Docs Website

* https://github.com/withastro/starlight
    * See how great this can look: 
        * https://starlight.astro.build/getting-started/
        * https://docs.astro.build/en/install-and-setup/#use-a-theme-or-starter-template
        * https://fevol.github.io/starlight-theme-obsidian/getting-started/

![alt text](ic/blog_img/web/fosseng/starlight-docs-sample.png)

> MIT | 🌟 Build beautiful, accessible, high-performance documentation websites with Astro

**What I like about this Starlight theme?**

1. Doc like interface
2. Internationalization (different languages with `i18n`)
3. Search built in (with algoliasearch)
4. Amazing Docs: https://starlight.astro.build/
5. OpenGraph (OG) image when shared


```sh
npm create astro@latest -- --template starlight
npm run dev
```

> And...thats all: `localhost:4321`

**Whats missing (imo)?**

1. Blog Interface
2. Pages Interface
3. Tag system
4. Some kind of "directory Template" to search

### PodCast Website

* https://github.com/manuelernestog/astropod

> MIT | Free and open source **self-hosting serverless podcast** solution

Superlative job from ManuelErnestog, which I forked [here](https://github.com/JAlcocerT/astropod)

---

## Conclusions

### A look to GitPodcast

I was (one more time) amazed on what people is able to create:

* https://github.com/BandarLabs/gitpodcast

> MIT | Convert any git repository into an engaging podcast

Does this resonates with creating **AI powered podcasts** on how selfhosting projects work?

**How does this works?**

Its crazy how it summarizes the streamlit repo...

See it yourself: https://www.gitpodcast.com/streamlit/streamlit



---

## FAQ