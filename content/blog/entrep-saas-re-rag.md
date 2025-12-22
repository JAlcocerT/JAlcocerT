---
title: "A SaaS for Real Estate Agencies: Custom RAG Solution"
# date: 2026-01-05T23:20:21+01:00
date: 2025-12-20T23:20:21+01:00
draft: false
tags: ["NextJS SaaS x PayLoad CMS vs DecapCMS","Cloudflare Access x Astro","AI Tech Talk","RoadMap26"]
description: 'Building a custom BOT for real estate agencies. Using Git vs API CMS.'
url: 'custom-re-rag'
---

**Tl;DR**

What it should have been the Real Estate project.

The **launch strategy**: *aka, focus strategy*:

| Element | Decision |
| :--- | :--- |
| **One Avatar** | |
| **One Product** | |
| **One Channel** | |

The **Tier of Service**: A clear, custom DFY

The **customer segmentation**: SMB

The **tech stack**:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)/Database** | | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | | |


* Supply - DFY, finite *on demand basis*
* Demand - constrained *targeted users via APIFY google maps scrapping + cold emails / social media reach*

But it does not apply, as the goal of this is more closing a long chapter and making the final learnings with it.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/" title="Authentication | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}

As the why, what was very clear, its time to put together the final HOW:

```md
# Project Name: [SaaS Name]

## 1. The Why (BRD)
- **Problem:** [Describe the pain point]
- **Value Prop:** [How I solve it]
- **Monetization:** [e.g., $9/mo Subscription via Stripe]

## 2. The What (PRD)
- **Primary User Flow:** Landing -> Auth -> Core Feature -> Payment.
- **V1 Features:** - [ ] Auth (Google/Email)
  - [ ] Feature A (The core value)
  - [ ] Settings (Billing/Delete account)

## 3. The How (FRD)
- **Stack:** T3 Stack (Next.js, Prisma, TRPC)
- **DB Schema:** - User: id, email, stripe_id
  - Data: id, user_id, content, timestamp
```

**Intro**

It all started with the QnA of streamlit over property data on `.md` files.

and the chat with a DB via LangChain.

{{< cards >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/" title="NEW - Real Estate BluePrint - Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for Real Estate Web/App + RAG" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

Then, Im talking about these series of RE related posts:

* https://jalcocert.github.io/JAlcocerT/real-estate-landing/

https://jalcocert.github.io/JAlcocerT/flask-cms-for-ssgs/#real-estate
https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/#real-estate

https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/#real-estate-with-reflex

![Reflex PieChart](/blog_img/apps/reflex/reflex-piechart.png)

https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/#streamlit-calculator-and-genai-re-agent

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="Chat with Data" image="/blog_img/biz/RE/RE-Calc.png" subtitle="Simple Real Estate calculator POST" >}}
  {{< card link="https://gitlab.com/fossengineer1/py_stocks/-/tree/main/EDA_Mortage" title="RE Streamlit App" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for the RE Calculator" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#slides-creation-agent" title="AIssistant" image="/blog_img/apps/ai-assistant.png" subtitle="Streamlit PPT Creator and more" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/#slidev" title="SliDev JS App" image="/blog_img/biz/RE/slidev-re.png" subtitle="Presentations as a Code with SliDev" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/#french-amortization-101
![French Amortiz Example](/blog_img/data-experiments/french_amortiz.png) 

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Real Estate Web" image="/blog_img/GenAI/ai-real-estate.jpeg" subtitle="AI Ready Website for a RE Agency" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LLamaIndex/With_Mem0" title="Data Chat" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Real Estate Agent with LLamaIndex and Mem0" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/real-estate-website/
![Web Real Estate](/blog_img/web/WebsSnapshots/Web_realestate.png)



{{< cards cols="1" >}}
  {{< card link="https://dm-real-estate.com" title="Web UI Result" >}}
  {{< card link="https://realestate.jalcocertech.com" title="RE Calculator and GenAI" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://realestate_tool.jalcocertech.com" title="Photo Tool" >}}
  {{< card link="https://dashboard.litlyx.com" title="Web Analytics GDPR Compliant" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


https://jalcocert.github.io/JAlcocerT/buying-house-data-analytics/

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/astro-web-setup/#real-estate-web---results


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/ScrewFastMoiRealEstate/" title="Source Code ScrewFast Astro" icon="github" tag= "Code" >}}
  {{< card link="https://dm-real-estate.com/" title="The RE Web" icon="warning" >}}
{{< /cards >}}


## Creating a Full Stack Real Estate SaaS

IF you agree that **value is subjective** (*yea, not everyone agrees!*), then you will agree that [Price is also subjective](https://jalcocert.github.io/JAlcocerT/real-estate-website/#pricing-strategy).

When you are building this kind of projects:

1. Make sure that you are not doing: cost+margin.
2. Or add a high enough ,active income' price tag, as this is one of those custom DFY solutions that you can't scale

These projects are providing much more value than a one time fee.

And if they dont - go find better clients who would get the real potential value out of it.

Now...**lets get started** with this one.



{{< details title="Create a Web/Apps with editor and ChatBot for Real Estate 📌" closed="true" >}}

```sh
#git init && git add . && git commit -m "Initial commit: Starting astro real estate x OpenAI Chatbot" && gh repo create moi-realestate-pro-astro-bot --private --source=. --remote=origin --push
```

{{< /details >}}

![Vibe Coded Real Estate Agency - Landing x Astro](/blog_img/biz/RE/re-agency-1.png)

### BoilerPlate 101

It has to be known frameworks.

Using newer ones [like Reflex](https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/#conclusions) or [Nuxt](https://jalcocert.github.io/JAlcocerT/real-estate-landing/#nuxt-for-real-estate) will cause your agents too much confussion.

And a lot of time wasted for you.




---

## FAQ

### About RAG and BOTs

RAG has 3 years, you get asked 5y experience if you are trying to land such jobs.

But the good thing, is that you can vibe coded a cool chatwidget, which replies as per FASTApi in the backend.

I did a sample of those, without memory and much content withing [this CR of the selfhosted-landing](https://github.com/JAlcocerT/selfhosted-landing/blob/master/z-change-request-5.md).


Normally, API calls are stateless:

* https://www.anthropic.com/news/prompt-caching


A simple chatbot like this one wont have memory:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#adding-a-simple-chatbot" title="Custom Bots for Landing Pages" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Using FastAPI + OpenAI x Astro to get a bot to work!" >}}
{{< /cards >}}

But...you can get away with it in a very simple way.

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bots/" title="Bots | Docs ↗" >}}
{{< /cards >}}


Specially if you have tinkered with bots in python before:

{{< cards >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
{{< /cards >}}


> There are Similar python projects like https://github.com/denizsafak/abogen

> > Abogen is a powerful text-to-speech conversion tool that makes it easy to turn ePub, PDF, text or markdown files into high-quality audio with matching subtitles in seconds. Use it for audiobooks, voiceovers for Instagram, YouTube, TikTok, or any project that needs natural-sounding text-to-speech, using Kokoro-82M.

<!-- 
Alternatives to https://www.livechat.com/pricing/ ING uses it
 -->

 <!-- 
`IODOCTOR` -->
<!-- 
Use cases
🧱 Introduction
🤖 Chatbots
❓ Question Answering
🔍 Semantic Search

 -->

 I went the custom route, with OpenAI and astro as UI:

```sh
npm install openai
```

And...this happened:

```mermaid

```



### Who can be interested in such websites?

As this is a great case study / success story, how about...letting others know about it?

* `twojmetr2.pl`