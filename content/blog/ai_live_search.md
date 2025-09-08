---
title: "How to do live search/research with AI"
date: 2025-05-23
draft: false
tags: ["AI","Web Search","LLMs","Grok"]
description: 'Using Grok XAi API and Local Deep Researcher compared with Perplexity/Perplexica.'
url: 'live-search-and-research-with-ai'
---


**TL;DR** Setting up [Local Deep Researcher](#local-deep-researcher) and [Perplexica](#the-perplexica-ai-project)

**Intro**

Last year I had the [Groq YT project](https://jalcocert.github.io/JAlcocerT/summarize-yt-videos/) as a very useful one.

And the [notebookLM](https://notebooklm.google/) as a kind of [RAG](https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/) from google, that could be useful to summarize docs.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understanding-openl-tablets/" title="OpenLTables" image="/blog_img/GenAI/notebookllm-openltables.png" subtitle="Using notebookLM to understand new syntax" >}}
{{< /cards >}}

Today, notebookLM can summary not only PDFs, but it also sumarizes youtube videos (given a link) and...it can provide even a audio summary of it / podcast like summary.

Which is crazy.

But how about other ways to interact with *real/live* data for LLM context?

{{< callout type="warning" >}}
Mind the contamination that live data might provide to the LLMs. Plus the possibility to mis [Dynamic content](https://www.firecrawl.dev/blog/mastering-firecrawl-scrape-endpoint) - like [gh discussions](https://github.com/orgs/modelcontextprotocol/discussions/364#discussioncomment-13264660)
{{< /callout >}}


## Live Search with LLMs

Recently, xAI added [live search](https://docs.x.ai/docs/guides/live-search) capabilities to their models.

> Goodbye knowledge cuttof they say!

But actually, there has been couple of tools that allow us to interact with Web information.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/vide-coding/#windsurf" title="WindSurf IDE" image="/blog_img/GenAI/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Scrapping" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


### Grok Live Search

Few weeks ago I was tinkering with [grok API](https://jalcocert.github.io/JAlcocerT/how-to-use-grok-api/), which can be used also via LiteLLM.

What you need to have handy:

* https://x.ai/api
    * https://console.x.ai/
    * https://docs.x.ai/docs/overview
    * https://docs.x.ai/docs/models

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Chat with Data" image="/blog_img/GenAI/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher/tree/main/" title="Local Deep Researcher" image="https://github.com/JAlcocerT/local-deep-researcher/raw/main/local-research-sample.png" subtitle="Ollama x DDG x LangGraph" >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher" title="Local Deep Researcher Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Local Deep Researcher with langGraph - Source Code on Github" >}}
{{< /cards >}}


### Local Deep Researcher

Its all about the magic of langgraph.

[![shields.io Stars](https://img.shields.io/github/stars/langchain-ai/langchain)](https://github.com/langchain-ai/langchain/stargazers)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understanding-langgraph-local-deep-researcher/#local-deep-researcher-project" title="Tinkering with LangGraph" image="/blog_img/GenAI/langchain-AI.jpeg" subtitle="Local Deep Researcher - Post" >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher/tree/main/" title="Forked Local Deep Researcher" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code that brings OpenAI/Groq options" >}}
{{< /cards >}}


```sh
git clone https://github.com/JAlcocerT/local-deep-researcher


docker-compose -f ./local-deep-researcher/Z_DeployMe/docker-compose.yml up -d
# docker exec -it ollama sh
# ollama pull deepseek-r1:8b

cd local-deep-researcher
cp .env.example .env #by default ollama x DDG as search engine
uvx \
                 --refresh \
                 --from "langgraph-cli[inmem]" \
                 --with-editable . \
                 --python 3.11 \
                 langgraph dev

#https://langchain-ai.github.io/langgraph/cloud/reference/cli/#dev
uvx \
  --refresh \
  --from "langgraph-cli[inmem]" \
  --with-editable . \
  --python 3.11 \
  langgraph dev --host 0.0.0.0 --port 8011 # <-- Added host and port



uvx \
  --refresh \
  --from "langgraph-cli[inmem]" \
  --with-editable . \
  --python 3.11 \
  langgraph dev --host 192.168.1.8 --port 8011
```

See how:

1. Your search gets translated into a search query: *how can i [selfhost raneto](https://fossengineer.com/raneto-markdown-knowledgebase-selfhosting/) with docker-compose?*
2. Results are loaded from DDG

![Local Deep Researcher - Web Query Step](/blog_img/GenAI/ai-search/langgraph-web-query.png)

### Perplexity


<!-- 
https://www.fahdmirza.com/2024/07/install-perplexica-with-searxng-and.html
 -->

Sometime ago Whoogle and SearXNG to make private Web Search.

But GenAI can help us to retrieve relevant Web results.

* *ttps://fossengineer.com/selfhosting-whoogle-docker/
* SearXNG: https://fossengineer.com/selfhosting-whoogle-docker/#searxng-with-docker

Perplexica is an **AI-powered search engine**. 

> It is an Open source alternative to Perplexity AI

### The Perplexica AI Project

  * {{< newtab url="https://github.com/ItzCrazyKns/Perplexica" text="Project Source Code at Github" >}}
  * {{< newtab url="https://github.com/ItzCrazyKns/Perplexica?tab=MIT-1-ov-file#readme" text="License MIT" >}} ❤️

> The AI-powered search engine ✅ An Alternative to Perplexity AI

It uses advanced machine learning algorithms like **similarity searching and embeddings** to refine results and provides clear answers with sources cited.

Using SearxNG to stay current and fully open source, Perplexica ensures you always get the most up-to-date information without compromising your privacy.

### Why Perplexica AI?

* All Mode: Searches the entire web to find the best results.
* Writing Assistant Mode: Helpful for writing tasks that does not require searching the web.
* Academic Search Mode: Finds articles and papers, ideal for academic research.
* YouTube Search Mode: Finds YouTube videos based on the search query.
* Wolfram Alpha Search Mode: Answers queries that need calculations or data analysis using Wolfram Alpha.
* Reddit Search Mode: Searches Reddit for discussions and opinions related to the query.

### SelfHosting Perplexica AI

```sh
git clone https://github.com/ItzCrazyKns/Perplexica.git
cd Perplexica

cp sample.config.toml config.toml #Rename the sample.config.toml file to config.toml
docker-compose up -d
```

{{< dropdown title="The docker compose will deploy your own SearXNG API... ⏬" closed="true" >}}

As per:  https://www.fahdmirza.com/2024/07/install-perplexica-with-searxng-and.html

```sh
conda create -n px python=3.11 -y && conda activate px

pip install torch transformers accelerate huggingface_hub sentencepiece 

git clone https://github.com/searxng/searxng && cd searxng

nano ./searx/settings.yml #add search format json
make docker.build   

docker run --rm -d -p 32768:8080 -v "${PWD}/searxng:/etc/searxng" -e "BASE_URL=http://localhost:$PORT/" -e "INSTANCE_NAME=my-instance" searxng/searxng

#ollama
curl -fsSL https://ollama.com/install.sh | sh
ollama pull llama3
ollama pull bgesmall

#perplexica
git clone https://github.com/ItzCrazyKns/Perplexica.git && cd Perplexica
docker-compose up -d
```

{{< /dropdown >}}

---

## Conclusions

### Other F/OSS Alternatives to PerplexityAI

* **Morphic** - https://github.com/miurla/morphic - Apache v2
  * https://github.com/miurla/morphic?tab=Apache-2.0-1-ov-file#readme
  * https://www.morphic.sh/

> An AI-powered search engine with a generative UI

* **LLocalSearch** - https://github.com/nilsherzig/LLocalSearch
  * Apache v2 Licensed

> LLocalSearch is a **completely locally running search aggregator using LLM Agents**. The user can ask a question and the system will use a chain of LLMs to find the answer. The user can see the progress of the agents and the final answer. **No OpenAI or Google API keys are needed**.

* **OpenSearch-AI** - https://github.com/supermemoryai/opensearch-ai

>  SearchGPT / Perplexity clone, but personalised for you. 

* https://github.com/Omniplex-ai/omniplex
  * https://github.com/Omniplex-ai/omniplex?tab=AGPL-3.0-1-ov-file#readme

---

## FAQ

Scrap the Web with AI

* https://github.com/VinciGit00/Scrapegraph-ai

> Python scraper based on AI

**F/OSS Search Engines**

* [Whoogle](https://fossengineer.com/selfhosting-whoogle-docker/)
* [SearXNG](https://jalcocert.github.io/RPi/posts/selfh-internet-better/#searxng---private-web-search)
* LibreX / Y - https://github.com/hnhx/librex
* WebSurfX - https://github.com/neon-mmd/websurfx
  https://github.com/neon-mmd/websurfx/blob/rolling/docs/installation.md
> 🚀 An open source alternative to searx which provides a modern-looking ✨, lightning-fast ⚡, privacy respecting 🥸, secure 🔒 meta search engine

* https://github.com/gigablast/open-source-search-engine

* https://github.com/yacy/yacy_search_server

> Distributed Peer-to-Peer Web Search Engine and Intranet Search Appliance

**More Search Engines**

* Brave Search (Independent Search)
* Ecosia (Bing Based)
* **DuckDuckGo** - This can be used without API keys!
* Yandex, StartPage, SearchEncrypt, Swisscow, Mojeek...

Interesting Search Engines to have a look:

* https://metager.org/
* Qwant
* PrivacyWall

### Gaps to Cover

I got to know about these when playing around with the [AIssistant here](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/)

{{< details title="Latitude (prompt engineering) and...latitude analytics 📌" closed="true" >}}

* https://github.com/latitude-dev/latitude-llm

**Latitude is an open-source prompt engineering platform** designed to streamline AI feature development.

It addresses the following problems:

- Managing prompts can be cumbersome when they're embedded in code.
- Testing AI outputs can be inconsistent and challenging.
- Analyzing performance metrics of AI models requires a centralized tool.

> As per the docs, for now [SDKs are Rust or JS/TS](https://docs.latitude.so/guides/evaluations/overview)

**Key Features:**

- **Collaborative Prompt Management**: Enables team collaboration on prompt development.
  
- **Testing and Validation**: Uses LLMs to verify AI responses for accuracy and relevance.

- **Performance Insights**: Provides analytics on response times and cost comparisons.

- **Version Control**: Tracks changes in prompts for better management.

- **API and SDK Support**: Facilitates easy integration into existing systems.

- **Open-Source Community Driven**: Encourages contributions and improvements from users.

**Deployment Options:**

1. **Latitude Cloud**: Managed solution for quick setup.
  
2. **Latitude Self-Hosted**: Open-source version for greater control and customization.

**Community Engagement:**

- A vibrant community on Slack for support and collaboration.
  
- Contributions are welcomed to enhance the platform.

In conclusion, Latitude simplifies the process of integrating AI into products while facilitating ongoing evaluation and improvement.

**Similar Projects**: TBC

* https://github.com/latitude-dev/latitude

**Latitude** is an open-source framework created to simplify **embedded analytics** by providing a powerful **analytics layer between databases and end-users**. 

It allows developers to integrate data analytics into applications efficiently without requiring deep expertise in database management or visualization.

> Among other DBs, [latitude works with SQLite](https://docs-analytics.latitude.so/sources/sqlite)!

Key Features:
- **Database Connectivity**: Latitude can connect to a variety of databases and data warehouses, providing flexibility for different environments and data sources.
- **Parameterized SQL Queries as API Endpoints**: It allows users to create parameterized SQL queries and expose them as API endpoints, making it easy to query data dynamically and integrate with other systems.
- **Interactive Visualizations**: Latitude supports interactive data visualizations in front-end frameworks (such as React, Svelte, and Vue), or alternatively, it can display them within iframes for easy embedding in web pages.
- **Caching for Performance**: The framework includes built-in caching, which optimizes query performance and reduces the load on databases by storing previously queried results.
- **Security**: Latitude is SSL-ready and includes protections against SQL injection, ensuring secure communication between the client and the database.
- **Community-driven**: The project encourages contributions from developers, fostering an active open-source community.

Use Cases:
- **Quick Dashboard Creation**: Developers can rapidly build dashboards and visualizations, allowing end-users to explore and interact with data without extensive custom development.
- **Single-command Deployment**: Latitude can be deployed quickly with a single command, making it easier for developers to get up and running without complex configurations.
- **Framework Integration**: Latitude integrates seamlessly with popular front-end frameworks like React, Svelte, and Vue, which are commonly used for building modern web applications.

Community and Support:
- Latitude has an active community on **Slack**, where developers can collaborate, share insights, and get support.
- Comprehensive **documentation** is available to guide users through the setup process and help with integration into various systems.

Current Status:
- The project is **no longer maintained** as the focus has shifted to a new project, **Latitude LLM**, which likely focuses on new features or different capabilities.
- Existing users can still use the codebase and license as-is, though no new updates are being released.

Latitude simplifies the integration of embedded analytics for developers, allowing for easy creation and deployment of dashboards, visualizations, and queries.

> Its simplicity and integration with modern front-end frameworks make it a valuable tool for building analytics-rich applications.

Similar projects to Latitude include:
- **Superset**: An open-source data visualization tool that allows users to create and share dashboards.
- **Metabase**: Another open-source analytics platform that focuses on simple setup and user-friendly dashboards.

{{< /details >}}


There are ofc tools already waiting to be used...

{{< details title="To learn how to interact with real time internet data - GNews, Perplexica,... 📌" closed="true" >}}

**GNews** - https://github.com/ranahaani/GNews

- **Summary:**  
  _GNews_ is a lightweight Python package that provides an API to search for articles on Google News, returning results in JSON format. It supports fetching articles by keywords, topics, and locations, making it versatile for news aggregation.  

- **Key Features:**  
  - **Lightweight:** Easy to use with minimal setup.  
  - **Integration:** Fetches articles directly from Google News RSS Feed.  
  - **Global Support:** Covers over **141 countries** and **41 languages**.  
  - **Structured Results:** Returns data in JSON format for easy parsing.  

- **Pros:**  
  - **Simple Installation:** No complex dependencies.  
  - **Convenience:** Eliminates the need for custom scrapers.  
  - **Flexible Searches:** Supports a variety of search parameters.  

- **Cons:**  
  - _Limited Sources:_ Only fetches from Google News.  
  - _Dependency:_ Relies on the availability of Google News RSS feeds.  

- **Alternatives:**  
  - NewsAPI  
  - ContextualWeb News API  
  - Bing News Search API  

From Perplexica to **OpenSearch GPT** [AI Search Engines!] - https://github.com/supermemoryai/opensearch-ai

**OpenSearch GPT**, an open-source, AI-powered search engine that personalizes search results by learning from user interactions. It emphasizes key features like its **Mem Zero** memory system for remembering past interactions, its robust technological framework, and its versatility as a tool for writing assistance and data management. 

OpenSearch GPT aims to enhance productivity and streamline workflows, offering transparency and flexibility as an alternative to proprietary search engines.

Key Points

- **Personalization:** Delivers tailored search results by learning from user behavior.
- **Memory System:** Includes **Mem Zero** to retain past interactions and improve relevance.
- **Technology Framework:** Built using **Versal AI ADK** and **Next.js** for a robust experience.
- **Versatility:** Functions as a writing assistant and supports data management tasks.
- **Open Source:** Provides transparency and customization options for users.

Pros and Cons

**Pros:**
- Highly personalized search experience.
- Open-source design allows community involvement and customization.
- Supports a range of functionalities for diverse use cases.

**Cons:**
- Requires Google account sign-in to access the platform.
- May pose a learning curve for users new to open-source tools.

---

Alternatives

- **Perplexity AI**
- **OpenAI's Search Engine Prototype**

{{< /details >}}


### How to use HF?

In HuggingFace you will find really cool and Open AI Projects to try out:

* Image to Code: <https://huggingface.co/spaces/HuggingFaceM4/screenshot2html>
* Audio to text: <https://huggingface.co/spaces/sanchit-gandhi/whisper-jax>


* <https://www.futuretools.io/?pricing-model=open-source>

> But, be prepared to use CC details :)