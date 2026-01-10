---
title: "[AI/BI] Plug and Play Data Analytics"
#date: 2026-01-08T18:20:21+01:00
date: 2026-03-08T18:20:21+01:00
draft: false
tags: ["RoadMap26 x Tech Talk","Generative BI x WrenAI","BAML"]
description: 'From databases to insights with automatic charts from your QnA.'
url: 'creating-a-generative-bi-solution'
---

**TL;DR**

Is it possible that agents will not only reply a query based on the real content of a database,

 but also would provide a proper visualization?

**Intro**

After getting that pnp D&a with langchain and pgsql ready [here](https://jalcocert.github.io/JAlcocerT/plug-and-play-data-analytics/#conclusions).

And having a [session for non-tech users](https://jalcocert.github.io/JAlcocerT/a-diy-boilerplate-to-ship/#the-tech-talk) to learn to vibe code similar tools.

Its time to review some existing generative BI tools available.

And build something.

## Existing GenBI Solutions

## Building 

But first, some recap on what drove me to this point.

{{% steps %}}

### Explored LangChain

Explored few frameworks like llamaindex and pandasAI.

Also tinkered with [RAG around CSVs](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/).

And chatted [with PDFS](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs).

### LLM x Databases

Via langchain is also possible to [talk with a database](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/).

Which I rebamped into this [pgsql x langchain with few real examples](https://jalcocert.github.io/JAlcocerT/plug-and-play-data-analytics/#the-related-tech-talk).

### Enabled the team

By sharing in couple ways: 

* The technical one for big data communities
* The non-tech for business users

{{% /steps %}}

### Adding Generative BI to PlugnPlay D&A

Now, time to continue where I left the repository: *yes, its going to be the same one*

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/langchain-db-ui" title="LangChain x DB x UI | Github ↗" icon="github" >}}
{{< /cards >}}

```sh
git clone https://github.com/JAlcocerT/langchain-db-ui

```

I got couple of ideas on how to do this.

1. To get some graph recommended via function calling.
2. To do so via BAML

* https://github.com/boundaryml/baml

> I got to use BAML last year here, while trying to improve the repo to doc generation tasks

One of their doc example resonated with this: https://baml-examples.vercel.app/examples/book-analyzer

For which they provided the code: https://github.com/BoundaryML/baml-examples/tree/main/nextjs-starter/app/examples/book-analyzer

---

## Conclusions

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/langchain-db-ui" title="LangChain x DB + UI" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Wrapping LangChain DB Queries into a custom UI to get insights" >}}
{{< /cards >}}

### Related Tech Talk

```sh
git clone https://github.com/JAlcocerT/selfhosted-landing
cd y2026-tech-talks/
#npm run dev 
```