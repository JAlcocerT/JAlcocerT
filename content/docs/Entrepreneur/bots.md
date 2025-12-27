---
title: Bots
type: docs
prev: /docs/android/
next: docs/
draft: false
---

Bots are one of those things that are easy to get started with, but can be complex to get right.

And many clients will want one to be embeded into their sites.

You might be here because have seen/used Telegram bots.

But dont get confused with chatbots vs automation: *despite tools like n8n being able to handle bots*


### Telegram Bots

Some people get creative with telegram https://github.com/ccbikai/BroadcastChannel

> Turn your Telegram Channel into a MicroBlog.

But we are here to build **custom tg bots**.

{{< details title="TG Bots -  101 Setup 📌" closed="true" >}}


{{< /details >}}

<!-- {{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/#ai" title="AI | Docs ↗" icon="book-open" >}}
{{< /cards >}} -->

#### N8N Bots

<!-- {{< youtube "v-gCNTI5kzE" >}} -->

You can combine TG bots with Telegram.

Having your AI APi Keys ready and your n8n setup first:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/#ai" title="AI | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/automation/#n8n" title="Automation | Docs ↗" icon="book-open" >}}
{{< /cards >}}

{{< details title="N8N x Telegram Bots 📌" closed="true" >}}


{{< /details >}}

### Other Bots

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/botpress" title="Botpress | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/typebot" title="TypeBot | Docker Config 🐋 ↗" >}}
{{< /cards >}}


#### Flowise AI

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/flowise-ai" title="Flowise | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![Flowise AI Example](/blog_img/GenAI/pdf-flowise.png)


### Custom Bots

These days you will hear the term RAG.

These can be applied in many business domains, like for real estate agencies

Also, to provide custom QnA for your landing Pages/SaaS

The good news?

That If you are in good terms with front end tools like astro and dont mind coding some Python backend - you can get away and make your own custom chatbot.

From visuals, to the knowledge, the way it replies and who can use it.

Go from [this](https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/):

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#adding-a-simple-chatbot" title="Custom Bots for Landing Pages" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Using FastAPI + OpenAI x Astro to get a bot to work!" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/" title="Custom Bots for RE" image="/blog_img/biz/RE/re-ai-agent.png" subtitle="Using Streamlit to recommend properties as per md" >}}
{{< /cards >}}

  <!-- {{< card link="https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/" title="Custom Bots for RE" image="/blog_img/biz/RE/RE-bot-ppt.jpeg" subtitle="Using Streamlit to recommend properties as per md" >}} -->

<!-- ![Streamlit ChatBot with RE knowledge base](/blog_img/biz/RE/re-ai-agent.png) -->

<!--

![alt text](/blog_img/biz/RE/RE-bot-ppt.jpeg)  

-->


To this: *as seen [here](https://github.com/JAlcocerT/diy-landing-boilerplate/tree/master)*

![Typescript x Astro x md knowledge x OpenAI ChatBot](/blog_img/dev/diy-landing-bot.png)


* https://jalcocert.github.io/JAlcocerT/custom-re-rag/#about-rag-and-bots

![Vibe Coded QnA Real Estate ChatBot](/blog_img/biz/RE/vibe-coded-re-chatbot.png)

<!-- 

https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#vibe-coding-an-astro-ssr-landing-page


![Selfhosted Landing Page for DWY via Astro + FastAPI + OpenAI Chatbot](/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png)

-->

#### Bots x Knowledge Base

If you have a company and are having a [KB based on flat files](https://jalcocert.github.io/JAlcocerT/knowledge-management/#knowledge-management-tools).

Like SilverBullet, Logseq, Flatnote or Raneto:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/silver-bullet" title="Silver Bullet | Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/raneto" title="Raneto | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![SilverBullet UI](/blog_img/selfh/kb/silverbullet.png)

Consider also WikiJS or OtterWiki:

![alt text](/blog_img/selfh/kb/wikijs.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wiki-js" title="WikiJS | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/otterwiki" title="OtterWiki | Docker Config 🐋 ↗" >}}
{{< /cards >}}

And plug your knowledge sources via RAG / vector DBs / embeddings:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="SelfHosted Landing Repo" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://diy.jalcocertech.com" title="DIY webs via webook" image="/blog_img/dev/fastapi/ebook-obfuscate-ui.png" subtitle="A 101 Ive put together about building websites" >}}
{{< /cards >}}

These markdown based notes need somewhere to be hosted.

Like a PaaS or a deployment on companies resources.

What you get?

*From team knowledge to internal chatbot knowledge. Avoid silos. Build internal transparency*

### You Mean Scrapping?

Some people look for ,bot' **scrappers**.


And Ive been commenting about those in few occasions.


To understand these tools, it helps to think of them as building blocks for a house. 

**BeautifulSoup** is a specialized tool (like a hammer), **Crawlee** is the construction management system (the blueprint and workers), and **Apify** is the land and infrastructure where the house is built.

1. What is Crawlee?

**Crawlee** is an open-source web scraping and browser automation library. It doesn't just "scrape" a page; it manages the entire "crawl" (moving from link to link).

* **What it does:** It handles the difficult "plumbing" of web scraping: automatic retries, proxy rotation, session management, and running tasks in parallel.
* **The Problem it Solves:** Normally, if you scrape a site and it crashes or blocks your IP, your script dies. Crawlee automatically manages these failures so your scraper keeps running.
* **Ecosystem:** It was originally built for JavaScript/Node.js but was expanded to **Python** in mid-2024.

2. How it relates to Apify

**Apify** is the company that created Crawlee. Think of them as the "Enterprise" version of the tool.

* **The Relationship:** Crawlee is the **open-source engine**. You can download it for free and run it on your own computer or server.
* **The Platform:** Apify is a **cloud platform** (PaaS) where you can host your Crawlee scrapers. If you don't want to worry about managing servers, databases, or scheduling, you "push" your Crawlee code to Apify, and they run it for you.
* **Evolution:** Previously, these were one big tool called the "Apify SDK." They split them so that developers could use the powerful scraping features (Crawlee) without being forced to use the Apify cloud.

3. How it relates to BeautifulSoup (BS4)

**BeautifulSoup** is an HTML parser. It is excellent at reading a piece of HTML and finding specific tags (like "find all headers" or "get this price").

**Crawlee and BS4 are partners, not competitors.**

* **Crawlee's job:** It goes to the website, handles the connection, avoids getting blocked, and downloads the HTML.
* **BS4's job:** Once Crawlee has the HTML, it hands it to BeautifulSoup to extract the actual data.

In the Python version of Crawlee, there is a specific class called `BeautifulSoupCrawler`. It essentially wraps BS4 inside a professional crawling engine.

| Feature | BeautifulSoup (BS4) | Crawlee | Apify |
| --- | --- | --- | --- |
| **Type** | Library (Parser) | Framework (Crawler) | Platform (Cloud) |
| **Primary Goal** | Extract data from HTML | Manage the scraping process | Run scrapers at scale |
| **Handles Proxies?** | No | **Yes** | **Yes** (Paid proxies) |
| **Handles Retries?** | No | **Yes** | **Yes** |
| **Where it runs?** | Anywhere Python runs | Anywhere Python runs | In the cloud |
