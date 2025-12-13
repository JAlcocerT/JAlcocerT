---
title: "Diagrams and workflows as a Code with Agents"
date: 2025-11-15T12:20:21+01:00
draft: false
tags: ["AI SaaS","MermaidJS x openai-editor","Grok vs Perplexity","Icons for Architects","Commet","Tech Talk"]
description: 'From SliDev Editor to Mermaid Editor with OpenAI and Excalidraw.'
url: 'ai-driven-diagrams'
---

**Tl;DR**

I Got the [social signin working here, with the slidev-editor](https://jalcocert.github.io/JAlcocerT/social-signin-101/#conclusions).

+++ Tech Talk about the [MermaidxOpenAI PoC](#tech-talk)

Now its time to bring the **AI part** to the equation.

> If you are [an architect](#architecture-and-icons), you will like this.


**Intro**

Same as we can do presentations as a code, we can know diagrams as a code.

In fact, the diagrams as a code (Mermaid) can be integrated with our SliDev-Editor Setup.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mermaidjsxopenai-editor" title="NEW | MermaidJS-Editor Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code to MermaidJS + LLMs. Via NextJS and ToastUI md editor" >}}
{{< /cards >}}


```
I want to create a NextJS web app that will allow for the user to provide an API key via env variable, and it will have a qna chat interface similar to this wireframe.

The focus of the web app will be to create mermaidJS diagram code, based on the user input, that will be editable into a toastUI md editor and changes will be re rendered live
can we make the model be a parameter passed via env

and also make the UI look more modern

#clarify with a prd.md
##create a implementation plan.md with well define phases that can be tested and build one on top of the next phase
```

Dont forget about the tab icon and the opengraph as a requirement when vibe coding webapps!

{{< callout type="info" >}}
Own the context, rule the code
{{< /callout >}}

If you are curious, this was the wireframe:

![Wireframe](/blog_img/dev/nextjs/nextjs-mermaidjs-wireframe.png)

A PRD and implementation plan is always a good idea to vibe code:

```sh  
#git init && git add . && git commit -m "Initial commit: Starting simple mermaidjs x openai nextjs"
```

{{< filetree/container >}}
  {{< filetree/folder name="mermaidjsxopenai-editor" state="open" >}}
    {{< filetree/file name="tailwind.config.ts" >}}
    {{< filetree/file name="Makefile" >}}
    {{< filetree/file name="README.md" >}}
    {{< filetree/file name=".env.local" >}}
    
    {{< filetree/folder name="app" state="open" >}}
      {{< filetree/file name="layout.tsx" >}}
      {{< filetree/file name="page.tsx" >}}
      {{< filetree/folder name="api" state="open" >}}
        {{< filetree/folder name="generate-diagram" >}}
          {{< filetree/file name="route.ts" >}}
        {{< /filetree/folder >}}
      {{< /filetree/folder >}}
    {{< /filetree/folder >}}
    
    {{< filetree/folder name="components" state="open" >}}
      {{< filetree/file name="ChatPanel.tsx" >}}
      {{< filetree/file name="EditorPanel.tsx" >}}
      {{< filetree/file name="DiagramPanel.tsx" >}}
    {{< /filetree/folder >}}
    
    {{< filetree/folder name="prompts" state="open" >}}
      {{< filetree/file name="system.md" >}}
      {{< filetree/file name="user.md" >}}
    {{< /filetree/folder >}}
    
  {{< /filetree/folder >}}
{{< /filetree/container >}}

After vibe coding 30 min, this is the result: https://mermaid.js.org/config/configuration.html

![nextJS x OpenAI x MermaidJS - UI](/blog_img/dev/nextjs/nextjs-mermaid-ui.png)

Thanks to `Claude Haiku 4.5`, I have seen a better way for the docker-compose and their environments:

With a full example [here](https://github.com/JAlcocerT/obfuscate/blob/main/docker-compose.external.yml#L24) and [here](https://github.com/JAlcocerT/mermaidjsxopenai-editor/blob/main/docker-compose.yml)

```yml
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: mermaidjs-openai-editor
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - OPENAI_API_KEY=${OPENAI_API_KEY}
      - LLM_MODEL=${LLM_MODEL:-gpt-4o-mini}
      - SYSTEM_PROMPT_PATH=${SYSTEM_PROMPT_PATH:-./prompts/system.md}
      - USER_PROMPT_PATH=${USER_PROMPT_PATH:-./prompts/user.md}
      - CONVERSATION_HISTORY_LIMIT=${CONVERSATION_HISTORY_LIMIT:-10}
```

> It will read from the `.env` variables and if not provided, the default values will kick in:

```sh
make help
#docker builder prune -a -f#
make docker-up
#du -sh ~/Desktop/mermaidjsxopenai-editor #~180mb
#docker images | grep mermaidjs #~1.5gb
```

## Live info for your PPTs

For live info, you can always try [scrapping](https://jalcocert.github.io/JAlcocerT/how-to-browse/#scrapping-recap) or this programmatic search engine search.

But if you have tried already, you will know that there might be some complications depending on [how the websites are created](#how-scraping-relates-to-ssg-csr-and-ssr).

{{< callout type="info" >}}
These APIs are paywalled! 
{{< /callout >}}

> But I got recently 1y trial of Perplexity and its quite cool

> > And if you are windows/mac user, you can try their **Commet browser**, with cool web summarization

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/neko-browser" title="Neko Browser | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Anyways, we saw how to bring API data directly to our slides via SliDevJS as [seen here](https://jalcocert.github.io/JAlcocerT/things-as-a-code/#slidev-and-tech-talks).

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/things-as-a-code/#slidev-and-tech-talks" title="PPTs as a Code with SliDev" image="/blog_img/entrepre/public-build/slidev-editor/slidev-component-yfinance.png" subtitle="SliDev + yFinance API connected" >}}
  {{< card link="https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth/slidev/slidev-ba-tech-talk-exadel/components" title="SliDev Editor Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for SliDev Editor and Tech Talks ppts" >}}
{{< /cards >}}

<!-- ![Slidev live data component from yfinance](/blog_img/entrepre/public-build/slidev-editor/slidev-component-yfinance.png) -->

### Grok API

Few weeks ago I was tinkering with [grok API](https://jalcocert.github.io/JAlcocerT/how-to-use-grok-api/), which can be used also via LiteLLM.

* https://x.ai/api
    * https://console.x.ai/
    * https://docs.x.ai/docs/overview
    * https://docs.x.ai/docs/models
    * https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/GrokAPI 🐍


And just this week I got...

### Perplexity API

... Perplexity PRO access.

It feels great to get life/search data from the internet.

* https://sourcegraph.com/search
* https://www.perplexity.ai/discover

* https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/PerplexityAPI

* https://jalcocert.github.io/JAlcocerT/live-search-and-research-with-ai/#perplexity 🐍

![Perplexity Pro Access with Paypal](/blog_img/GenAI/ai-search/perplexity-pro-offer.png)


```sh
curl https://api.perplexity.ai/chat/completions \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "sonar-pro",
    "messages": [
      {
        "role": "user", 
        "content": "What are the major AI developments and announcements from today across the tech industry?"
      }
    ]
  }' | jq
```

---

## Conclusions

Does it even make sense to try building an AI Saas?

I would say yes, for the learnings.

For the financial motivations, just be aware of [Pareto](https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/) and that most tries will fail.

The **OpenAI LLM approach was good enough for this PoC** and I did not end up plugging Codex CLI.

You could also try LangChain Agents approach as per [this cfe video](https://www.youtube.com/watch?v=KC8HT0eWSGk)

### Mermaid x Excalidraw

We might find some concepts that are hard to explain with words.

But having these awsome OSS tools for quick diagraming or sketching, there are no excuses allowed :)

Dont choose between [Mermaid](https://mermaid.live/) or [Excalidraw](https://excalidraw.com/).

<!-- 
![From MermaidJS to Excalidraw](/blog_img/DA/excalidraw-x-mermaidjs.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/diagrams_ppts/" title="Diagrams and PPTs" image="/blog_img/DA/excalidraw-x-mermaidjs.png" subtitle="Diagrams and PPTs Tools | Docs ↗" >}}
{{< /cards >}}

```
flowchart TD
    A[Christmas] -->|Get money|
    B(Go shopping)
    B --> C{Let me think}
    C -->|One| D[Laptop]
    C -->|Two| E[iPhone]
    C -->|Three| F[fa:fa-car Car]
```

BTW, these diagrams look very well when combined with a proper [wiki/documentation](https://jalcocert.github.io/JAlcocerT/knowledge-management/) on how your dev/D&A project works.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/excel-data-analytics-interviews/#conclusions" title="Excalidraw for D&A" image="/blog_img/selfh/HomeLab/excalidraw.png" subtitle="Analytics with Mermaid x Excalidraw" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/knowledge-management/#what-it-is-wysiwyg" title="Flat Files KB" image="/blog_img/selfh/kb/silverbullet.png" subtitle="Tools like SilverBullet or LogSeq are flat file centered" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Websites 101 | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=TulDVEC_vuQ -->

{{< youtube "TulDVEC_vuQ" >}}

* https://github.com/excalidraw/excalidraw-libraries
* https://libraries.excalidraw.com/?theme=light&sort=default


### Mermaid x Tech Talk

Ive prepared a tech talk about this **mermaid x openAI** setup:

```sh
git clone https://github.com/JAlcocerT/slidev-editor
#git branch -a
#git checkout -b logtojseauth main
#git status --porcelain && echo "---" && git pull origin logtojseauth
#git show --stat d21233214c504640056180db03c9c98edd06c1ae
```

I also promised myself that **[this is](https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth/slidev/slidev-ba-tech-talk-mermaid-exadel) the last presentation** that i will do this year.

Consider adding such [SliDev VUE Components like this one](https://github.com/JAlcocerT/slidev-editor/blob/logtojseauth/slidev/slidev-ba-tech-talk-mermaid-exadel/components/QRCode.vue) you can generate QRs!

Ive also done few other tech talks previously:

{{< youtube "KXamTdJA-uc" >}}

Including, how to run LLMs locally: *from Q1 2024!*

{{< youtube id="vukAQPCv7Tw" autoplay="false" >}}

---

## FAQ

**Others ppts ive worked on and how to run them**

```sh
git clone https://github.com/JAlcocerT/slidev-editor.git
#cd slidev/slidev-ba-tech-talk-exadel
#npm install
#npm run dev
```

Remember that you need the `./public` folder to provide custom background assets!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/diagrams_ppts/#ppts" title="PPTs | Docs ↗" icon="book-open" >}}
{{< /cards >}}

> Last one from here, was [this ppt on...slidev ppts as a code](https://jalcocert.github.io/JAlcocerT/ai-driven-presentations/)!

### Architecture and Icons

If you are a [D&A Architect](https://jalcocert.github.io/JAlcocerT/data-analytics-architecture/), consider:

* [Iconify](https://iconify.design/)
* [Icon-sets](https://icon-sets.iconify.design/)
* [Mermaid](https://mermaid.js.org/syntax/architecture.html)