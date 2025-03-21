---
title: "Generative AI Search with Perplexica"
date: 2025-07-20T23:20:21+01:00
draft: false
cover:
  image: "https://socialify.git.ci/ItzCrazyKns/Perplexica/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"
  alt: "ChatGPT Clone" # alt text
  caption: "Build a ChatGPT Clone with Streamlit." # display caption under cover
tags: ["Docker","Gen-AI","Python","Dev","Self-Hosting"]
description: 'perplexity ai free alternative'
summary: '.'
url: 'perplexica-docker'
---
<!-- 
https://www.fahdmirza.com/2024/07/install-perplexica-with-searxng-and.html
 -->

Sometime ago Whoogle and SearXNG to make private Web Search.

But GenAI can help us to retrieve relevant Web results.

https://fossengineer.com/selfhosting-whoogle-docker/
https://fossengineer.com/selfhosting-whoogle-docker/#searxng-with-docker

Perplexica is an **AI-powered search engine**. It is an Open source alternative to Perplexity AI

## The Perplexica AI Project

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

---

## FAQ

Scrap the Web with AI

https://github.com/VinciGit00/Scrapegraph-ai

> Python scraper based on AI

### F/OSS Alternatives to perplexity

* otra
* https://github.com/Omniplex-ai/omniplex
  * https://github.com/Omniplex-ai/omniplex?tab=AGPL-3.0-1-ov-file#readme

### F/OSS Search Engines

* Whoogle
* SearXNG
* LibreX / Y - https://github.com/hnhx/librex
* WebSurfX - https://github.com/neon-mmd/websurfx
  https://github.com/neon-mmd/websurfx/blob/rolling/docs/installation.md
> 🚀 An open source alternative to searx which provides a modern-looking ✨, lightning-fast ⚡, privacy respecting 🥸, secure 🔒 meta search engine

* https://github.com/gigablast/open-source-search-engine

* https://github.com/yacy/yacy_search_server

> Distributed Peer-to-Peer Web Search Engine and Intranet Search Appliance



### Interesting Search Engines to have a look

* https://metager.org/

* Qwant
* PrivacyWall
* DuckDuckGo
* Brave Search
* Ecosia


### Open Source Search for your websites

If you already have your website (Wordpress, Ghost, or SSG's...)

Lunr.js
Typesense
[Meili](https://github.com/meilisearch/meilisearch)

* https://www.meilisearch.com/docs

> A lightning-fast search API that fits effortlessly into your apps, websites, and workflow


### 

* Brave Search (Independent Search)
* Ecosia (Bing Based)
* DuckDuckGo
* Yandex, StartPage, SearchEncrypt, Swisscow, Mojeek...