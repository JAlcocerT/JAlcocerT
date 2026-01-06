---
title: "[AI/BI] Plug and Play Data Analytics"
date: 2026-01-02T23:20:21+01:00
draft: false
tags: ["LangChain","RoadMap26 x Tech Talk"]
description: 'Extracting insights from databases and generating automatic charts.'
url: 'plug-and-play-data-analytics'
---

https://jalcocert.github.io/JAlcocerT/selling-ideas-in-data-analytics/#what-is-ctor

**Tl;DR**

**Intro**

It all started from trying to [talk with pandas dataframes](https://jalcocert.github.io/JAlcocerT/how-to-use-pandasAI/).

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/career/" title="Career D&A | Docs ↗" >}}
{{< /cards >}}


This is [not a new idea](#about-rags), but a new way to approach it.

And *not yet* trying to [sell it](#offer-configuration).

## About RAGs

[RAGs frameworks and vector DBs](https://jalcocert.github.io/JAlcocerT/rag-frameworks-for-ai-projects/) have been around for few years so far.

From all the [ways to do rag](https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/), Langchain is still the top 1 framework.

[![shields.io Stars](https://img.shields.io/github/stars/langchain-ai/langchain)](https://github.com/langchain-ai/langchain/stargazers)

{{< callout type="info" >}}
With [Langchain, we can chat with our data](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/) in many different ways
{{< /callout >}}

From the typical CSVs:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-csv-with-langchain/" title="LangChain CSV | Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/langchain-ask-csv" title="Repo Langchain ask CSV ↗" icon="book-open" >}}
{{< /cards >}}

Going through PDF's:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs//" title="LangChain PDF | Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/ask-multiple-pdfs/" title="Repo LangChain ask PDFs ↗" icon="book-open" >}}
{{< /cards >}}

And most importantly: [LangChain can be **connected to our databases**](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/)


[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Data-Chat/blob/main/LangChain/ChatWithDB/test_langchainChatDB.ipynb)


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-a-db-with-langchain" title="LangChain x DBs | 101 Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/ChatWithDB" title="Data Chat x LangChain DBs ↗" icon="book-open" >}}
{{< /cards >}}

So...how about leveling up [with a cool setup](#the-setup)?

## The Setup

We will need:

1. A Database to tinker with
2. A way to connect the DB (inside a container) to Langchain
3. A UI Wrapper to do QnA *outside the terminal*
4. Bonus: AI/BI to get visual insights from the data

These resources will provide context:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/databases/" title="DB | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/BI/#custom-bi-tools" title="BI | Docs ↗" icon="book-open" >}}
{{< /cards >}}

### Databases

We are going to push sample databases with tables already configured towards a container:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mariadb" title="MariaDB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/postgresql" title="PostgreSQL | Docker Config 🐋 ↗" >}}
{{< /cards >}}

We can create **read only users** so that LangChain will connect to the DB safely.

Previously, I was using the Chinook artist related DB: *via MySQL*

![MySQL CLI Install](/blog_img/GenAI/langchain-chinook-sample.png) 

But I want to try something new.

#### Sample 1

#### Sample 2

#### Sample 3 - Connecting to running services


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Comments/Commento" title="Commento | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umami" title="Umami | Docker Config 🐋 ↗" >}}
{{< /cards >}}

##### Commento

##### Umami

### UI Wrapper

To go from a python notebook / terminal / script to something that is more non tech user friendly, **we need a UI**.

That's where the power of vibe coding kicks in, together with a new project:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/langchain-db-ui" title="NEW - LangChain x DB + UI" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Wrapping LangChain DB Queries into a custom UI to get insights" >}}
{{< /cards >}}

{{% details title="Why Starting a Tech Blog? 🚀" closed="true" %}}

```sh
#sudo apt install gh
gh auth login
gh repo create astro-editor --private --source=. --remote=origin --push

#git init && git add . && git commit -m "Initial commit: langchain x db x ui" && gh repo create langchain-db-ui --private --source=. --remote=origin --push
```

{{% /details %}}

As recently, I started with a BRD, some clarifications, then a development plan.

> PS: You dont need [1000h of prompt engineering](https://www.reddit.com/r/PromptEngineering/comments/1nt7x7v/after_1000_hours_of_prompt_engineering_i_found/) to do so



### AI/BI

* https://github.com/Kanaries/graphic-walker

> Apache v2 | An open source alternative to Tableau. **Embeddable visual analytic**



---

## Conclusions

Could this be attractive to people that have some e-commerce and dont have the bugdet to hire an BI/analyst to see whats working/whats not?

[One more time](https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#outro), its all about *the friction to PAY versus the friction to DO*.



### The Related Tech Talk

To unify my workflow/efforts, I've moved my tech talk creation from:


```sh
git clone https://github.com/JAlcocerT/slidev-editor
#git branch -a
#git checkout -b logtojseauth main
```

As part of my consulting repository:

```sh
git clone https://github.com/JAlcocerT/selfhosted-landing
```

Yea, thats private :)

<!-- 
You can see the video:
 -->

But you can get it done for you:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}





#### Next Steps



##### Offer Configuration


The **launch strategy**: *aka, focus strategy*

| Element | Decision |
| :--- | :--- |
| **One Avatar** | |
| **One Product** | |
| **One Channel** | |

The **Tier of Service**: DIY (1b - *leverages on actual tech stack Ive put together - PaaS x (WP/Ghost or SSG+CMS)*)

The **Tech Stack**:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)/Database** | | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | | |


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/" title="BiP | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers/" title="Offers | Docs ↗" icon="book-open" >}}
{{< /cards >}}

Whats Working
Whats not
Whats next


---

## FAQ

* https://claude.ai/
* https://console.anthropic.com/workbench/
* https://console.groq.com/keys
* https://platform.openai.com/api-keys

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ollama" title="Ollama | Docker Config 🐋 ↗" >}}
{{< /cards >}}