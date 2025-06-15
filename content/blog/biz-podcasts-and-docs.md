---
title: "Tech for Creating i18n Documentation and related Podcast"
date: 2025-05-15
draft: false
tags: ["Web"]
description: "How to create podcasts and a related Astro (Starlight and AstroPod) website for them. A look to GitPodcast, Code2Prompt and Research Agents."
url: 'tech-for-podcast'
---

## More Web Stuff with Astro SSG

### Docs Website

* https://github.com/withastro/starlight
    * See how great this can look [once you tweak it](https://github.com/IoTechCrafts/starlight-SSG) a little bit 
        * https://starlight.astro.build/getting-started/
        * https://docs.astro.build/en/install-and-setup/#use-a-theme-or-starter-template
        * https://fevol.github.io/starlight-theme-obsidian/getting-started/

![Starlight Theme Docs UI](ic/blog_img/web/fosseng/starlight-docs-sample.png)

> MIT | 🌟 Build beautiful, accessible, high-performance documentation websites with Astro

**What I like about this Starlight theme?**

1. Doc like interface
2. With ToC (Table of contents *that goes down with you, as you read*)
2. [Internationalization](https://docs.astro.build/en/guides/internationalization/) (different languages with `i18n`)
3. Search built in (with algoliasearch)
4. Amazing Docs: https://starlight.astro.build/
5. OpenGraph (OG) image when shared (also when sharing posts)
6. All the sample features at [their sample posts](https://github.com/withastro/starlight/blob/main/docs/src/content/docs/guides/sidebar.mdx)
7. Supports `md`, `mdx` and `mdoc`
8. Sitemap/RSS/Robots

```sh
npm create astro@latest -- --template starlight
npm run dev
```

> And...thats all go to `localhost:4321` and see your cool [Astro powered docs](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#automated-projects-docs).

<!-- ![AI Powered Docs](/blog_img/GenAI/aidocs/ai_docs.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#vibe-coded-project-docs" title="Vibe Coded Repo Docs- Post ↗" image="/blog_img/GenAI/aidocs/ai_docs.png" subtitle="Tinkerin with astro, codex and documentation" >}}
  {{< card link="https://github.com/IoTechCrafts/starlight-SSG" title="Starlight Tweaked Docs" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Astro Starlight" >}}
{{< /cards >}}


**What was missing (imo)?**

1. Blog/Archives Interface
2. Pages Interface
3. Tag system
4. Some kind of "app [directory](https://astro-nomy.vercel.app/blog) Template" to search apps/real estate properties..., like [this one](https://github.com/JAlcocerT/astro-nomy) or [this one](https://github.com/piotrkulpinski/openalternative)

5. Integration with [some CMS](https://docs.astro.build/en/guides/cms/), like Keystatic... 
6. [LastUpdated](https://starlight.astro.build/reference/configuration/#lastupdated) for Docs/Posts
7. Some [Astro data fetching](https://docs.astro.build/en/guides/data-fetching/) example
8. [Image Options](https://docs.astro.build/en/guides/images/) examples: raw and optimized
9. [Data fetching](https://docs.astro.build/en/guides/data-fetching/), so that you can reference content, like your docker-compose.yml public on github, so that others can edit them.
10. A progress line bar on the top of the posts to show how much you have left
11. Katex, Charts and diagrams rendering 
12. Maybe [commenting](https://github.com/JAlcocerT/Docker/tree/main/Web/Comments/Commento) system? Or [Giscus](https://justinjbird.com/blog/2023/adding-comments-to-a-hugo-site-using-giscus/#adding-the-parameters), [maybe?](https://dteather.com/blogs/adding-giscus-discussions-to-astro/)

{{< callout type="info" >}}
Have a look to [Astro free Themes](https://astro.build/themes/11/?search=&price%5B%5D=free) from time to time to get ideas
{{< /callout >}}

### PodCast Website

* https://github.com/manuelernestog/astropod

> MIT | Free and open source **self-hosting serverless podcast** solution

Superlative job from ManuelErnestog, which I forked [here](https://github.com/JAlcocerT/astropod)

{{< callout type="info" >}}
You can generate podcasts from videos with [notebooklm](https://notebooklm.google.com/)
{{< /callout >}}

<!-- 
https://www.youtube.com/watch?v=gQW-NcPVlXQ&t=1669s 
-->


### A look to GitPodcast

I was (one more time) amazed on what people is able to create:

* https://github.com/BandarLabs/gitpodcast

> MIT | Convert any git repository into an engaging podcast

The project uses an interesting [TTS setup](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#ai-powered-shorts)

Does this resonates with creating **AI powered podcasts** on how selfhosting projects work?

**How does this works?**

Its crazy how it summarizes the streamlit repo...

See it yourself: https://www.gitpodcast.com/streamlit/streamlit

![GitPodcast](/blog_img/selfh/gitpodcast.png)

* https://www.gitpodcast.com/rybbit-io/rybbit


### Code2Prompt

After tinkering with project docs automatic creation, I found this.


![alt text](/blog_img/GenAI/aidocs/code2prompt.png)


* https://github.com/mufeedvh/code2prompt/

{{< details title="Code2Prompt Features... 📌" closed="true" >}}

Key features include:

- Converts entire codebases into a single prompt.
  
- Utilizes Handlebars templates for customizable prompt generation.
  
- Respects `.gitignore` and allows file filtering with glob patterns.
  
- Displays token count for generated prompts.
  
- Supports copying prompts to clipboard and saving them to files.
  
- Generates Git commit messages and pull request descriptions from staged files.
  
- Offers built-in templates for various use cases (e.g., documenting code, finding vulnerabilities).

Installation options available include:

1. **Binary Releases**: Download from the Releases page.
  
2. **Source Build**: Requires Git, Rust, and Cargo.

3. **Cargo**: Install via `cargo install code2prompt`.

4. **AUR**: Available for Arch Linux users.

5. **Nix**: Can be installed using `nix-env`.

Usage is straightforward, allowing users to generate prompts from their codebase with optional filters and custom templates.

The tool helps streamline LLM prompt creation, enhancing productivity for developers.

{{< /details >}}

> MIT | A CLI tool to convert your codebase into a single LLM prompt with source tree, prompt templating, and token counting.

{{< details title="Query LLMs via Mistral API 📌" closed="true" >}}



{{< /details >}}

{{< details title="Query LLMs via GroK API 📌" closed="true" >}}


{{< /details >}}


[![Star History Chart](https://api.star-history.com/svg?repos=mufeedvh/code2prompt/,BandarLabs/gitpodcast&type=Date)](https://star-history.com/#mufeedvh/code2prompt/&BandarLabs/gitpodcast&type=Date)

---

## Conclusions

Its great, yet overwhelming the amount of new SelfHosting Projects that are out there and that are coming.

Would there be a way to automate the test deployment of such software?

Or should our selfhoster backlog *to be tried* list to keep growing?

**The idea**

Lately, I have been [tinkering with shorts](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#shorts), also with automatic project Docs

Wouldnt this be a way to catch up with the bast amount of cool projects to SelfHost and share a quick overview with others?

**Example use case**: Given the awsome weekly newsletter https://selfh.st/weekly/2025-05-09/ at the New Software section


[![Star History Chart](https://api.star-history.com/svg?repos=dcodesdev/LetterSpace,openconstruct/Peersuite,crocofied/PortNote,0PandaDEV/Ziit,cheatsnake/airstation,gelbphoenix/autocaliweb,rmfatemi/bitvoker,operacle/checkcle,ashishjullia/cloudflare-worker-tailscale-monitor,sinandredemption/kath,log-forge/logforge,murtaza-nasir/maestro,kennethsible/mkvpriority,rrbarrero/pass-web,galvez/plainbudget,andomeder/rektube,daquino94/rss-telegram,magweter/spacepad,kugie-app/summit,muliswilliam/webhook-tester&type=Date)](https://star-history.com/#dcodesdev/LetterSpace&openconstruct/Peersuite&crocofied/PortNote&0PandaDEV/Ziit&cheatsnake/airstation&gelbphoenix/autocaliweb&rmfatemi/bitvoker&operacle/checkcle&ashishjullia/cloudflare-worker-tailscale-monitor&sinandredemption/kath&log-forge/logforge&murtaza-nasir/maestro&kennethsible/mkvpriority&rrbarrero/pass-web&galvez/plainbudget&andomeder/rektube&daquino94/rss-telegram&magweter/spacepad&kugie-app/summit&muliswilliam/webhook-tester&type=Date)

[![Star History Chart](https://api.star-history.com/svg?repos=ChrispyBacon-dev/DockFlare,kyantech/Palmr,crocofied/PortNote,electh/ReactFlux,LizardByte/Sunshine&type=Date)](https://star-history.com/#ChrispyBacon-dev/DockFlare&kyantech/Palmr&crocofied/PortNote&electh/ReactFlux&LizardByte/Sunshine&type=Date)

See a project, [summarize its code/features](https://fossengineer.com/selfhosting-lumenone/) and make a podcast/short about it: https://github.com/lumenlabss/LumenOne

> MIT | Best Plesk (The Ultimate Toolkit for WordPress Sites) alternative open source & free 

<!-- https://adsense.google.com/adsense/u/0/pub-1816803660718163/payments -->

---

## FAQ

### Outro 

1. Windscribe CEO almost got jailed?

> [Our CEO](https://windscribe.com/blog/windscribe-greek-court-case/) Almost Got Jailed, So We Made a Shirt!

2. Cal will have EU hosted instance: https://cal.com/europe

3. LogToAI Docs https://docs.logto.io/end-user-flows/sign-up-and-sign-in