---
title: "KB and Local Bots to end Silos for good"
date: 2026-01-19T23:20:21+01:00
#date: 2025-12-21T23:20:21+01:00
draft: false
tags: ["Custom Chatbots x Local AI and KB","Tech Talk","RoadMap26"]
description: 'Building a custom BOT platform to end with silos. HUGO FOSS rebuild.'
url: 'custom-bots-kb'
---


**Tl;DR**

What if having a **custom cool looking chatbot for your site** was a matter of copy-paste one snippet and configuring an UI the data sources?

The **launch strategy**: *aka, focus strategy*:

| Element | Decision |
| :--- | :--- |
| **One Avatar** | |
| **One Product** | |
| **One Channel** | |

The **Tier of Service**: 

* Enhanced DIY when you claim the free tier where you bring your own key and data + using built in functions
* DFY for custom logics like calling functions, calendar, forms...

The **customer segmentation**: SMB

The **tech stack**:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)/Database** | | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | | |


* Supply - DFY, finite *on demand basis*
* Demand - constrained
  * *Visitors of FossEngineer that are potential interested into OSS, but will be leaning more towards a DIY offer*
  * *Targeted users via APIFY google maps scrapping + cold emails / social media reach*

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

You cant be an AI company behore you are a data centered company.

And before having LLMs to get company context...that context have to be somewhere.

Like in the selfhosted knowledge base I was commenting [here](https://jalcocert.github.io/JAlcocerT/knowledge-management/).

To make the solution trustless: selfhosted + local .md based + local LLM has to be the way forward.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="Chat with Data" image="/blog_img/biz/RE/RE-Calc.png" subtitle="Simple Real Estate calculator POST" >}}
  {{< card link="https://gitlab.com/fossengineer1/py_stocks/-/tree/main/EDA_Mortage" title="RE Streamlit App" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for the RE Calculator" >}}
{{< /cards >}}

And as [commented during xmas with a friend](https://jalcocert.github.io/JAlcocerT/calculus-101/#helping-others), this can become a thing for SMB and mid companies that power the world, just that you havent heard of them.

## The Process to build a ChatBot Platform

Use cases:

* 🤖 Chatbots
* ❓ Question Answering
* 🔍 Semantic Search

{{% steps %}}

### Tinkered with websites

That bus trip to Vilna (to start the Vilnus-Tallin cycling trip) and discovering [Astro](https://jalcocert.github.io/JAlcocerT/create-your-website-astro-ssg/) paid off.

### Used Streamlit to add custom RAG

With a real estate example around a Python Web App.

And made tech talks around it.

### Used Ollama on my HomeLab

With [this initial post](https://fossengineer.com/selfhosting-llms-ollama/)

Later with [Open Web UI](https://fossengineer.com/ollama-open-webui-setup-with-docker/)

Then with [Deepseek as local model](https://fossengineer.com/how-to-use-deepseek-locally-for-free/)

All via containers

### Used Embeddings with LangChain

://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs and explored few frameworks like llamaindex and pandasAI.

Also tinkered with [RAG around CSVs](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/).

Probably the 2 most common files type in any office!

### LLM communicating with DBs

Via langchain is also possible to [talk with a database](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/).

This unlucks potential to have bots that are checking stocks in real time for their replies.

Or the ETA if you have a table that bring such info!

### Configured N8N on my VPS

And shared it with a couple marketers.

### Tested all around website embedding

Tested the drag'n'drop chatbots, like Typebot.


### Got tired of cloning astro templates

So started vibe coding mine.

From diy-landings, that you can plug chatbots to DFY real estate soltions.

### Put together a notes about KBs

Because Im a documentation geek and dont like to go over the same twice.

The path is clear once and has to be available to solve future doubts from the team.

### Talked with a friend about this

The potential use case of having companies in house documentation + RAG based QnA to about silos.

{{% /steps %}}


## Building the solution

This has 2 sides:

1. The Local AI Part:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ollama" title="Open Web UI | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ollama" title="Open Web UI  | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Something like a desktop app communicating with local llms running in house could be a thing. Like ~Goose.

2. The Local wiki / SknowledBase / [KB](https://jalcocert.github.io/JAlcocerT/knowledge-management/#conclusions) / [selfhostable notes](https://fossengineer.com/selfhostable-note-taking-tools/) / info part:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/flatnotes" title="Flatnotes | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/logseq" title="LogSeq | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

Same questions apply: web only? desktop app required? mobile?

3. How to treat huge amount of information: embeddings , vector DBs, RAG architectures



---

## Conclusions


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/web/1ton-webook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

### HUGO Vibe Coded Re-build

To offer this via fossengineer, I can try:

1. As is (later removing adsense)
2. The local KB offer
3. The webpage offer
4. Finally remodel the webpage to avoid the shape of a blog, as is more a news/docs one - vibe coding ofc.



---

## FAQ


