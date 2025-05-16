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

### A look to GitPodcast

I was (one more time) amazed on what people is able to create:

* https://github.com/BandarLabs/gitpodcast

> MIT | Convert any git repository into an engaging podcast

Does this resonates with creating **AI powered podcasts** on how selfhosting projects work?

**How does this works?**

Its crazy how it summarizes the streamlit repo...

See it yourself: https://www.gitpodcast.com/streamlit/streamlit

![GitPodcast](/blog_img/selfh/gitpodcast.png)

* https://www.gitpodcast.com/rybbit-io/rybbit

---

## Conclusions

Its great, yet overwhelming the amount of new SelfHosting Projects that are out there and that are coming.

Would there be a way to automate the test deployment of such software?

Or should our selfhoster backlog *to be tried* list to keep growing?

**The idea**

Lately, I have been [tinkering with shorts](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#shorts), also with automatic project Docs

Wouldnt this be a way to catch up with the bast amount of cool projects to SelfHost and share a quick overview with others?

**Example use case**: Given the awsome weekly newsletter https://selfh.st/weekly/2025-05-09/ at the New Software section

See a project, summarize it and make a podcast/short about it: https://github.com/lumenlabss/LumenOne

> MIT | Best Plesk (The Ultimate Toolkit for WordPress Sites) alternative open source & free 

<!-- https://adsense.google.com/adsense/u/0/pub-1816803660718163/payments -->

---

## FAQ

### Outro 

1. Windscribe CEO almost got jailed?

> Our CEO Almost Got Jailed, So We Made a Shirt!
https://windscribe.com/blog/windscribe-greek-court-case/

2. Cal will have EU hosted instance: https://cal.com/europe

3. LogToAI Docs https://docs.logto.io/end-user-flows/sign-up-and-sign-in