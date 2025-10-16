---
title: "How to use ScrapeGraph AI - Scraping with Ollama"
date: 2024-08-15T10:20:21+01:00
draft: false
tags: ["Gen-AI","Dev","Scrapping","LLMs","LinkChecker","Proxy Networks"]
# cover:
#     image: "https://socialify.git.ci/VinciGit00/Scrapegraph-ai/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"    
#     alt: "Using ScrapeGraph with Python" # alt text
#     caption: "ScrapeGraph 101." # display caption under cover
description: 'Selfhosting Scrapegraph-ai with Docker. Scrap with Python.'
summary: 'Scrapping with AI and Open Source. How to use Scrape Graph and how it compares with similar F/OSS projects.'
url: 'scrapping-with-llms'
#isPinned: true
---

<!-- 
https://star-history.com/blog/how-to-use-github-star-history
https://star-history.com/blog/ai-web-scraper 
-->

Over the past years ive'been something like this...

![Me Getting Up to Date with Open Source](/img/kitten-cat.gif#center)

...to be able to catch in all open source projects (previous and newly created).

> It's time to gain some **leverage with AI**

**[Scrapegraph-ai](#the-scrapegraph-ai-project) is an open-source**, Python library that revolutionizes web scraping by integrating Large Language Models (LLMs) and graph logic to automate the creation of scraping pipelines.

It uses LLM and direct graph logic to create scraping pipelines for websites and local documents (XML, HTML, JSON, Markdown, etc.).

Its sophisticated design allows for the extraction of data from websites, documents, and even XML files efficiently, with the philosophy of **"You Only Scrape Once"**—signifying a move towards less repetitive and more strategic data gathering.

[![Star History Chart](https://api.star-history.com/svg?repos=ScrapeGraphAI/Scrapegraph-ai&type=Date)](https://star-history.com/#ScrapeGraphAI/Scrapegraph-ai&Date)

Developers can leverage this library to construct custom scraping tasks using simple prompts, which are then interpreted by AI to form a tailored scraping workflow.

With Scrapegraph-ai, you can automate data extraction and pipeline construction **without repeated manual setup**.

## The Scrapegraph-ai Project

- The Scrapegraph-ai Project is fully open source and you can explore:
  * {{< newtab url="https://scrapegraph.ai/" text="The Scrapegraph-ai Official Page" >}}
  * {{< newtab url="https://github.com/scrapelogic/scrapegraph" text="The Scrapegraph-ai Source Code at GitHub" >}}
      * License: {{< newtab url="https://github.com/scrapelogic/scrapegraph?tab=License-1-ov-file#readme" text="MIT" >}} ❤️

> With Scrapegraph-ai, no repeated scraping tasks.
> > Define, Deploy, Extract. **S**crape **C**leverly **R**epeatedly **A**utomate **P**ipelines **E**ffectively.

### Why Scrapegraph-ai?

Scrapegraph-ai provides a cutting-edge platform for anyone looking to **leverage AI capabilities** in web scraping without the typical complexities associated with traditional methods.

Traditional scraping tools rely on fixed patterns and manual configurations, whereas ScrapeGraphAI adapts to website structure changes using LLMs, reducing the need for constant developer intervention.

- **Ease of Use**: Initiate complex scraping operations with just a few lines of prompt.
- **Efficiency**: Reduce the time and effort spent on repetitive data collection tasks.
- **AI Integration**: Utilize advanced AI techniques to optimize data extraction.
- **Customizable Workflows**: Tailor scraping pipelines to your specific needs with the aid of LLMs and graph logic.

ScrapeGraphAI supports several LLMs, including GPT, Gemini, Groq, Azure, Hugging Face, and local models that can run on your machine using Ollama.

<!-- * {{< newtab url="https://scrapegraph-doc.onrender.com/" text="The Scrapegraph Project Documentation" >}}
  * {{< newtab url="https://github.com/VinciGit00/Scrapegraph-ai" text="The Scrapegraph-AI Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/VinciGit00/Scrapegraph-ai?tab=MIT-1-ov-file#readme" text="MIT" >}} ✅
      * https://pypi.org/project/scrapegraphai/

* Streamlit - https://github.com/vincigit00/scrapegraph-lablabai-hackathon/blob/main/main.py
* https://scrapegraph-ai-demo.streamlit.app/
* You can try it: https://colab.research.google.com/drive/1sEZBonBMGP44CtO6GQTwAlL0BGJXjtfd?usp=sharing -->

| **Project** | Description |
| :-- | :-- |
| {{< newtab url="https://scrapegraph-doc.onrender.com/" text="Scrapegraph Project Documentation" >}} | Documentation for the Scrapegraph project |
| {{< newtab url="https://pypi.org/project/scrapegraphai/" text="scrapegraphai PyPI Package" >}} | Python package for Scrapegraph-AI available on PyPI |
| {{< newtab url="https://github.com/vincigit00/scrapegraph-lablabai-hackathon/blob/main/main.py" text="Scrapegraph Streamlit Demo" >}} | Streamlit demo application for Scrapegraph |
| {{< newtab url="https://scrapegraph-ai-demo.streamlit.app/" text="Scrapegraph-AI Streamlit App" >}} | Live demo of the Scrapegraph-AI project using Streamlit |
| {{< newtab url="https://colab.research.google.com/drive/1sEZBonBMGP44CtO6GQTwAlL0BGJXjtfd?usp=sharing" text="Scrapegraph Colab Notebook" >}} | Interactive Colab notebook to try out Scrapegraph |

## Scrapegraph-AI: Python Web Scraping with AI

### Concept

📜 **Scrapegraph-ai** is a Python library that enhances web scraping with the use of Large Language Models (LLMs) and graph logic. It is designed to automate the construction of scraping pipelines for websites, documents, and XML files.

### Core Idea
💡 The philosophy of **"You Only Scrape Once"** underlines the library's goal to extract information efficiently, aiming to reduce the need for repetitive scraping tasks.

### Key Functionality
- 🎯 Users provide **prompts** detailing the data they wish to extract.
- 🧠 Utilizes **LLMs** and **graph logic** to tailor scraping pipelines based on these prompts.

### Implementation
- 🛠️ Central to the library is the **SmartScraper** class, which uses a directed graph approach integrating common nodes found in web scraping pipelines.

### Further Exploration
- 📖 For more detailed information and usage instructions, consulting the official **Scrapegraph-ai documentation** is recommended.

### In Essence
- 🚀 **Scrapegraph-ai** appears to be a promising tool for those interested in web scraping with Python, especially with an AI-powered approach to automate and simplify pipeline creation.



## How to use ScrapeGraph

Scrapegraphai Usecase: https://github.com/VinciGit00/Scrapegraph-ai/tree/main/examples

{{< youtube id="ljoY1W6gPnY" autoplay="false" >}}

<!-- * https://www.youtube.com/watch?v=ljoY1W6gPnY -->

```sh
sudo apt update
sudo apt install python3

sudo apt install python3.10-venv
```

Create the venv for ScrapeGraph:

```sh
python3 -m venv scrapegraphai
source scrapegraphai/bin/activate

pip install scrapegraphai==1.11.3 #https://pypi.org/project/scrapegraphai/

playwright install
```

Now the package is ready:

* https://platform.openai.com/api-keys
    * https://scrapegraph-ai.readthedocs.io/en/latest/index.html

<!--
credits: https://www.fahdmirza.com/2024/05/how-to-scrape-websites-for-free-with-ai.html 
-->

### ScrapeGraph With Ollama

Let's do it fully local:


{{< dropdown title="Dockerfile for ScrapeGraph ⏬" closed="true" >}}

```dockerfile
FROM python:3.11  
#https://hub.docker.com/_/python

# LABEL org.opencontainers.image.source https://github.com/JAlcocerT/Streamlit-MultiChat
# LABEL maintainer="Jesus Alcocer Tagua"

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME

COPY . ./


RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    nano \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install scrapegraphai==0.9.0b7 \
    nest_asyncio \
    playwright

# Run Playwright commands to install browser dependencies and browsers
RUN playwright install-deps \
    && playwright install

EXPOSE 8501


###podman build -t scrapegraph_cont:latest .
#docker build -t scrapegraph_cont:latest .
```

{{< /dropdown >}}

{{< dropdown title="Deploying ScrapeGraph with Ollama ⏬" closed="true" >}}

```yml
version: '3.8'

services:
  scrapper:
    image: scrapegraph_cont:latest #python:3.11
    container_name: scrapegraph_cont
    ports:
      - "8701:8501"
    working_dir: /app
    #command: python3 app.py
    command: tail -f /dev/null #keep it running

  ollama:
    image: ollama/ollama
    container_name: ollama
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama

  ollama-webui:
    image: ghcr.io/ollama-webui/ollama-webui:main #https://github.com/open-webui/open-webui
    container_name: ollama-webui
    ports:
      - "3000:8080" # 3000 is the port that you will access in your browser
    add-host:
      - "host.docker.internal:host-gateway"
    volumes:
      - ollama-webui_data:/app/backend/data
    restart: always
#     networks: ["nginx_default"] #optional

# networks: #optional
#   nginx_default: #optional
#     external: true #optional       

volumes:
  ollama_data:
  ollama-webui_data:


#docker exec -it scrapegraph_cont /bin/bash
#podman exec -it scrapegraph_cont /bin/bash
```

> You can create user and pass for Open Web UI (Ollama web UI) and later on update the compose with `ENABLE_SIGNUP: false`

{{< /dropdown >}}

---

## Outro

### Proxie Networks


<!-- https://www.youtube.com/watch?v=qo_fUjb02ns&t=41s -->

{{< youtube "qo_fUjb02ns" >}}

In this video, Beyond Fireship showcases a powerful technique for extracting data from websites using web scraping, AI, and proxy networks.

With the rise of e-commerce and Drop Shipping, accessing valuable data is crucial, but it's often buried deep within complex HTML. 

This report summarizes the video, providing an in-depth look at how to use web scraping, AI tools, and proxy networks to extract data from public-facing websites.


- **What is Web Scraping?**
  - Web scraping involves extracting data from websites, often using a **headless browser like Puppeteer**, which allows users to interact with a website programmatically.
  
However, big eCommerce sites like Amazon don't love big traffic and will block IP addresses or make users solve captchas if they suspect you're not a human.

- **Solving the Problem with Bright Data**
  - Bright Data provides a special tool called the Scraping Browser, which runs on a proxy network and provides features like captcha-solving, retries, and more, allowing users to scrape the web at an industrial scale. This tool helps avoid IP blocking and captchas.

- **Using Puppeteer for Web Scraping**
  - Puppeteer is an open-source tool from Google that allows users to **view a website like an end-user**, interact with it programmatically, and execute JavaScript. It's a powerful tool for web scraping, but it's essential to use it with a proxy network to avoid IP blocking.

- **Creating a Web Scraper with Puppeteer and Bright Data**
  - The video demonstrates how to create a web scraper using Puppeteer and Bright Data's Scraping Browser. The process involves creating a new Node.js project, installing Puppeteer, and connecting to the Scraping Browser using a websocket endpoint.

- **Extracting Data from Amazon's Best Sellers Page**
  - The video shows how to use Puppeteer to extract data from Amazon's best sellers page. By using the Dev Tools in Chrome to inspect the HTML, we can identify the selectors needed to extract the product titles and prices. Then, using ChatGPT, we can generate code to extract the data and format it as a [JSON object](#faq).

- Web scraping is a powerful technique for extracting data from websites.
- **Proxy networks** and tools like Bright Data's Scraping Browser can help avoid IP blocking and captchas.
- Puppeteer is a useful tool for web scraping, but it's essential to use it with a proxy network.



### Other F/OSS Tools for Scrapping

{{< dropdown title="The Good'ol BeautifulSoup... ⏬" closed="true" >}}

* https://code.launchpad.net/beautifulsoup
* https://github.com/wention/BeautifulSoup4

{{< /dropdown >}}

[![Star History Chart](https://api.star-history.com/svg?repos=wention/BeautifulSoup4&type=Date)](https://star-history.com/wention/BeautifulSoup4&Date)


* **EmbedChain**
  * https://fossengineer.com/embedchain-ai/#embedchain-for-scrapping-content
  * https://docs.embedchain.ai/get-started/quickstart

> It uses LangChain (which its also capable of scrapping)

* **GPTCrawler**

* https://github.com/BuilderIO/gpt-crawler
  * https://github.com/BuilderIO/gpt-crawler?tab=ISC-1-ov-file#readme

> Crawl a site to generate knowledge files to create your own custom GPT from a URL


* **Firecrawl** - https://github.com/mendableai/firecrawl - aGPL v3.0
  * https://github.com/mendableai/firecrawl/tree/main/apps/python-sdk
  * https://pypi.org/project/firecrawl-py/

Crawl all accessible subpages and give you clean markdown for each. No sitemap required.

**Firecrawl** allows you to turn entire websites into **LLM-ready markdown**.

* Scrape: Turn any url into clean data
* Crawl: Firecrawl can recursively search through a urls subdomains, and gather the content

* https://docs.firecrawl.dev/contributing/guide
  * Playground - https://www.firecrawl.dev/playground
  * https://www.firecrawl.dev/pricing - API!

> 🔥 Turn entire websites into LLM-ready markdown or structured data. Scrape, crawl and extract with a single API.

{{< dropdown title="How to use FireCrawl ⏬" closed="true" >}}

```sh
pip install firecrawl-py
```

{{< /dropdown >}}


{{< dropdown title="Use FireCrawl locally... ⏬" closed="true" >}}

* https://github.com/mendableai/firecrawl/blob/main/SELF_HOST.md

{{< /dropdown >}}


{{< dropdown title="Use FireCrawl together with... ⏬" closed="true" >}}

* https://docs.firecrawl.dev/integrations/langchain
* https://docs.firecrawl.dev/integrations/crewai
* https://docs.firecrawl.dev/integrations/dify
* https://docs.firecrawl.dev/integrations/flowise
* https://docs.firecrawl.dev/integrations/langflow

{{< /dropdown >}}

* **Scraperr** - https://github.com/jaypyles/Scraperr - MIT Licensed
  * https://github.com/jaypyles/Scraperr?tab=MIT-1-ov-file#readme

>  Self-hosted webscraper. 

{{< dropdown title="Use Scrapper... ⏬" closed="true" >}}

{{< /dropdown >}}

* Some **Other Projects for Scrapping the Web**
  * https://github.com/DormyMo/SpiderKeeper - admin ui for scrapy/open source scrapinghub
  * https://github.com/crawlab-team/crawlab - Distributed web crawler admin platform for spiders management regardless of languages and frameworks. 分布式爬虫管理平台，支持任何语言和框架
  * https://github.com/Gerapy/Gerapy - Distributed Crawler Management Framework Based on Scrapy, Scrapyd, Django and Vue.js - MIT Licensed ❤️
  * https://github.com/my8100/scrapydweb - Web app for Scrapyd cluster management, Scrapy log analysis & visualization, Auto packaging, Timer tasks, Monitor & Alert, and Mobile UI. DEMO 👉
* https://github.com/apify/crawlee - Apache v2 Licensed
  * Crawlee—A web scraping and browser automation library for Node.js to build reliable crawlers. 
  * In JavaScript and TS. Extract data for AI, LLMs, RAG, or GPTs. Download HTML, PDF, JPG, PNG, and other files from websites. Works with Puppeteer, Playwright, Cheerio, JSDOM, and raw HTTP. Both headful and headless mode. With proxy rotation.
* https://github.com/raznem/parsera - GPLv2
  *  Lightweight library for scraping web-sites with LLMs 


### FAQ

<!-- 
https://www.youtube.com/@JohnWatsonRooney/videos -->

{{< dropdown title="What are rotating proxies ⏬" closed="true" >}}

Simply speaking, a rotating proxy is a type of **proxy server that automatically changes the IP address** it uses periodically or after each request. 

This means that every time your device connects to the internet through this proxy, it appears as if it's coming from a different IP address.

This helps maintain anonymity, avoid IP blocks, and makes it harder for websites to detect or block repeated requests from the same source.

Rotating proxies are especially useful in web scraping, automation, or when accessing geo-restricted content, as the rotation of IPs prevents websites from associating all requests with a single IP, thereby reducing the chance of being blocked or flagged.

{{< /dropdown >}}



Interesting web browsers:

* https://github.com/spartrekus/links2
* Lynx

```sh
sudo apt install lynx
lynx duckduckgo.com
```

#### How to Take ScreenShots of Webs

* https://github.com/sindresorhus/capture-website - MIT Licensed ❤️

> Capture screenshots of websites

* https://github.com/dgtlmoon/changedetection.io
  * https://github.com/dgtlmoon/changedetection.io?tab=Apache-2.0-1-ov-file#readme ✅

> The best and simplest free open source web page change detection, website watcher, restock monitor and notification service. Restock Monitor, change detection. Designed for simplicity - Simply monitor which websites had a text change for free. Free Open source web page change detection, Website defacement monitoring, Price change notification

* https://github.com/huginn/huginn
* https://github.com/huginn/huginn?tab=MIT-1-ov-file#readme

> Create agents that monitor and act on your behalf. Your agents are standing by!

* https://github.com/thp/urlwatch?tab=License-1-ov-file#readme

> Watch (parts of) webpages and get notified when something changes via e-mail, on your phone or via other means. Highly configurable.

#### How to Monitor Broken Links of Websites

Nobody wants to have broken links on their own website.

Thankfully, we have [linkchecker](https://github.com/IoTechCrafts/linkchecker).

{{< dropdown title="How to Use LinkChecker with Docker ⏬" closed="true" >}}

* Use LinkChecker with their [GHCR Image](https://github.com/linkchecker/linkchecker/pkgs/container/linkchecker)

```sh
#podman run --rm -it ghcr.io/linkchecker/linkchecker:latest --verbose https://fossengineer.com > linkchecker_output.txt
docker run --rm -it -u $(id -u):$(id -g) ghcr.io/linkchecker/linkchecker:latest --verbose https://www.example.com
```

{{< /dropdown >}}

#### F/OSS RAG Frameworks

<!-- * LangChain
  * https://python.langchain.com/v0.2/docs/integrations/document_loaders/
* LangGraph - https://langchain-ai.github.io/langgraph/
  * LangGraph-Studio - https://github.com/langchain-ai/langgraph-studio
    * https://blog.langchain.dev/langgraph-studio-the-first-agent-ide/
* EmbedChain
  * mem0
* PandasAI
* LLamaIndex
  * https://docs.llamaindex.ai/en/stable/examples/data_connectors -->


<!-- https://langchain-ai.github.io/langgraph/
https://github.com/langchain-ai/langgraph
https://github.com/langchain-ai/langgraph?tab=MIT-1-ov-file#readme

> Build resilient language agents as graphs. -->

<!-- 
https://python.langchain.com/v0.2/docs/tutorials/summarization/ -->


| Name | Description |
| :-- | :-- |
| {{< newtab url="https://python.langchain.com/v0.2/docs/integrations/document_loaders/" text="LangChain Document Loaders" >}} | Documentation for document loaders in LangChain |
| Mem0 (ex-EmbedChain) | A tool for creating and managing embeddings (no link provided) |
| PandasAI | A library for integrating AI with Pandas dataframes (no link provided) |
| {{< newtab url="https://docs.llamaindex.ai/en/stable/examples/data_connectors" text="LlamaIndex Data Connectors" >}} | Documentation for data connectors in LlamaIndex |
| {{< newtab url="https://docs.llamaindex.ai/en/stable/examples/data_connectors" text="LlamaIndex Data Connectors" >}} | Documentation for data connectors in LlamaIndex |
| {{< newtab url="https://github.com/danswer-ai/danswer?tab=License-1-ov-file#readme" text="Danswer-AI" >}} | Gen-AI Chat for Teams - MIT Licensed |

{{< youtube id="CkpoLDZu9ZE" autoplay="false" >}}

But there are more interesting tools...

One of the key features of LangGraph is the addition of cycles to the agent runtime, enabling repetitive loops essential for agent operation. LangGraph also introduces two main agent runtimes: the agent executor and the chat agent executor.

The agent executor is similar to LangChain's agent executor, but rebuilt in LangGraph. The chat agent executor, on the other hand, handles agent states as a list of messages, perfect for chat-based models.

| Name | Description |
| :-- | :-- |
| {{< newtab url="https://langchain-ai.github.io/langgraph/" text="LangGraph" >}} | A framework for building language model-powered applications |
| {{< newtab url="https://github.com/langchain-ai/langgraph-studio" text="LangGraph-Studio" >}} | An IDE for building and debugging agents using LangGraph |
| {{< newtab url="https://blog.langchain.dev/langgraph-studio-the-first-agent-ide/" text="LangGraph-Studio Blog Post" >}} | Blog post introducing LangGraph-Studio as the first agent IDE |

LangGraph Studio is a groundbreaking tool that has the potential to transform the development experience of complex agentic applications.