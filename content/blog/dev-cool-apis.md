---
title: "Interesting APIs 101"
date: 2025-10-18T09:20:21+01:00
draft: false
tags: ["APIfy","Firecrawl","Serp","Smithery MCP","Scrap"]
description: 'Get that info you need. API 101 '
url: 'interesting-apis'
---

**Intro**

Whenever you go to a restaurant, you see the menu and order what you want.

You dont care of how its prepared in the kitchen.

Same with API's: you ask for something, you get it.

And we can do all kind of things with them.

Like using it to push [new content/posts programatically to WP or Ghost](https://jalcocert.github.io/JAlcocerT/automating-ghost-and-wordpress/).



## Scrapping APIs

1. **Octoparse** is a popular no-code web scraping tool designed to automate data extraction from websites. Here are the key facts and features

{{< details title="About OctoParse... 📌" closed="true" >}}

- **Visual Workflow Designer:** Allows users to create scraping tasks by clicking elements on web pages. No programming knowledge is needed, making it beginner-friendly for simple scraping jobs.
- **Template Library:** Comes with pre-built templates for hundreds of popular websites—such as Amazon, LinkedIn, and Twitter—so users can quickly start extracting data with minimal setup.
- **Smart Extraction & XPath:** Offers smart extraction modes for auto-detecting lists or tables. Advanced users can utilize XPath and regular expression support for precise targeting.
- **Cloud & Desktop Versions:** Runs locally on Windows computers or on Octoparse’s cloud servers. The cloud service supports scalable scraping, task scheduling, and concurrent extractions for large jobs.
- **Handles Dynamic Content:** Capable of processing AJAX, JavaScript, multi-page navigation, infinite scroll, and data behind logins. It also supports IP rotation and proxies to bypass blocking mechanisms.
- **Data Export Options:** Data can be exported in various formats—CSV, Excel, JSON, HTML, XML—or directly to databases. There’s also API access for programmatic integration.
- **Error Handling & Performance:** Performance is usually fine for simple tasks but degrades with complex workflows, dynamic content, or large-scale scraping. Users report some reliability issues and a learning curve for advanced features.[1][2][3][4]
- **Support & Documentation:** Offers 24/7 support for paid users, though some users complain about slow response times and sparse documentation for more complex use cases.
- **Use Cases:** Commonly used for market research, price comparisons, lead generation, competitor analysis, and business intelligence tasks.
- **Cons:** Struggles with sites heavily reliant on JavaScript frameworks (React, Angular, Vue), advanced anti-scraping techniques, and complex authentication flows. There might be occasional issues with templates breaking if webstes update their structure and with heavy-duty workflows being slow or prone to minor glitches.

Overall, Octoparse is ideal for non-programmers and small businesses needing rapid data extraction from the web without building custom scrapers, but mission-critical scraping or heavy automation is sometimes better handled with custom-coded solutions or other advanced tools.

{{< /details >}}


2. **ZenRows** is an advanced web scraping SaaS platform focused on making large-scale data extraction from difficult, protected websites easier for developers and businesses.


{{< details title="About ZenRows... 📌" closed="true" >}}

- **Universal Scraper API:** Lets you extract raw HTML or structured data (like JSON) from any URL, handling proxy rotation, headless browsers, CAPTCHAs, and anti-bot protections automatically.
- **Autoparse:** For supported sites, it can deliver pre-parsed, structured data—saving time if you don’t want to write your own data extraction logic.
- **Prebuilt Scraper APIs:** Provides specialized endpoints for major e-commerce and social sites, so you can pull structured data directly.
- **Cloud-Based Scraping Browser:** Supports headless scraping for JavaScript-heavy or highly interactive sites, compatible with Puppeteer and Playwright scripts.
- **Residential Proxies & Anti-Bot:** Offers 55 million+ residential IPs worldwide and automatic techniques to bypass blocking and bot detection.
- **Developer-Focused:** Well-documented API and SDKs for Python, Node.js, Selenium, and more, making it appealing for those comfortable with code.
- **Concurrency & Scale:** Supports high numbers of parallel requests and session management for persistent scraping.

**Pros:**
- Excels at bypassing advanced anti-scraping protections, even on sites with CAPTCHAs or strong bot defenses.
- Handles proxies, sessions, and parsing, so you can concentrate on what data you need.
- Support is praised as responsive and helpful.
- Suitable for dynamic and complex targets.

**Cons:**
- Steeper learning curve—despite some low-code claims, it’s not truly no-code; technical knowledge is recommended.
- Interface and workflow are less intuitive for beginners compared to tools like Octoparse.
- Pricing is higher than many competitors, with forced parameters (like requiring premium proxies or JavaScript rendering) on some sites raising API costs.
- Minor quirks with auto-parsing feature maintenance—if a target site changes structure, auto-parsing may break until ZenRows updates the template.[1][2][3][4][5][6]

**Bottom line:** ZenRows is best for developers and teams needing to reliably scrape challenging or protected websites at scale—especially where anti-bot solutions and CAPTCHAs are an obstacle.

It is much more powerful than no-code tools for technical users needing robust API-based scraping, but less friendly for those without development skills.

ZenRows is a **web scraping SaaS platform** designed for developers and businesses that need to extract data from websites at scale, especially those protected by anti-bot systems and CAPTCHAs.

Here’s what makes ZenRows noteworthy:

- **Universal Scraper API:** You can send any URL and get back raw HTML or structured JSON. Proxy rotation, headless browsers, and anti-bot bypass are handled behind the scenes.
- **Autoparse:** For supported sites, ZenRows delivers structured JSON automatically, so you don’t have to build your own parser.
- **Developer-Focused:** SDKs and examples exist for Python, Node.js, Selenium, Puppeteer, and more, with a strong focus on API workflows and automation.
- **Handles Dynamic Content:** Cloud-based headless browser lets you run Puppeteer/Playwright scripts for JavaScript-heavy or interactive sites.
- **Residential Proxies and CAPTCHA-Solving:** Over 55 million rotating IPs and automated anti-bot systems.
- **Strong Support:** Responsive, developer-savvy support team.
- **High Performance:** Reliable at scraping most protected websites, with solid speed.[2][5][7][1]

**Cons:**
- Not truly no-code—basic web/HTTP/API skills are necessary. Its UI can feel less intuitive for beginners compared to tools like Octoparse.
- Higher price point ($69/month and above) than many competitors, and premium features (JS rendering, proxies) sometimes force higher API cost per request.
- If a target website’s structure changes, the autoparse feature might lag until the template is updated.

{{< /details >}}


ZenRows is best for **technically adept users** needing to scrape protected or dynamic sites robustly and at scale, while not really aimed at true beginners or one-click/no-code users.


3. **Exa** (https://exa.ai) is a developer-focused **Web Search API, AI Search Engine, and Website Crawler** designed to power applications needing real-time, accurate, and comprehensive web data. Here’s what makes Exa distinct:

> Search built for AI


{{< details title="About Exa... 📌" closed="true" >}}

- **Web Search API:** Exa provides multiple API endpoints to search the web, retrieve contents, extract structured data, and crawl websites. Developers can integrate web search and retrieval directly into their applications or AI models.
- **Retrieval-Augmented Generation (RAG):** Exa is optimized for RAG use cases—where language models combine retrieved factual web data with generated responses for higher accuracy and up-to-date answers.
- **High Customizability:** You can tailor searches by domain, location, semantic category, and more, giving precise control over data relevance.
- **Specialized Models:** Exa’s infrastructure powers specialized indices—for instance, searching Stack Overflow, coding docs, GitHub, LinkedIn, news, and niche reference material. It also provides market prediction models using historical web data.
- **Recent & Historical Coverage:** Exa indexes content from thousands of docs, PDFs, and web pages, covering both current trends and historical data for research, market analysis, and more.
- **Privacy & Compliance:** Exa offers strong privacy controls, purging queries/data as required, maintaining high compliance standards, and supporting enterprise requirements with DPAs and SLAs.
- **Developer Integrations:** Companies like Notion, Flatfile, and Cursor use Exa for research modes, candidate sourcing, and code referencing. Exa supports high-volume, secure integrations for teams and user authentication.
- **AI Grounding:** Exa can “ground” LLMs in real-world, factual data—enabling more credible, up-to-date, and trustworthy AI outputs.

{{< /details >}}

**Summary:**  
Exa is a powerful API and search engine for developers and AI platforms needing live, reliable access to web data—whether for agentic automation, research workflows, candidate sourcing, market intelligence, marketing analysis, or RAG pipelines.

It’s frequently described as “Perplexity-as-a-service” for customizable, factual, and privacy-conscious web data access.


## AI APIs


Avoid LLM lock-in and the recurring subscription bills.

**Simply use APIs**.


* OpenAI API Keys - <https://platform.openai.com/api-keys>
* Anthropic - <https://console.anthropic.com/settings/keys>
* Groq - <https://console.groq.com/keys>
* For [Ollama](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Ollama), you need [this setup](https://fossengineer.com/selfhosting-llms-ollama/)

Together with Streamlit!


[![Streamlit](https://img.shields.io/badge/Streamlit-1.32.2-FF4B4B.svg?style=flat&logo=Streamlit&logoColor=white#center)](https://pypi.org/project/streamlit/)



{{< callout type="info" >}}
See [**Streamlit-Multichat** Source Code](https://github.com/JAlcocerT/Streamlit-MultiChat) 💻
{{< /callout >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/Streamlit-MultiChat/1" title="About Streamlit MultiChat with SliDev on GH Pages" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-streamlit-chatgpt" title="Previous Blog Post" >}}
{{< /cards >}}

OpenAI

They have released recently **o3-mini** model.

GPT-4o-mini has been my go to in terms of value per money.

But we have now **o1 (mini also) and o3-mini** with higher context window (200K)

* https://openai.com/api/
* https://platform.openai.com/docs/models/#current-model-aliases


```sh
pip install openai==1.61.0
```

See the **latest openAI models**:

```sh
import os
from dotenv import load_dotenv
from openai import OpenAI  # pip install openai>0.28

# Load environment variables from the .env file
load_dotenv()

client = OpenAI()
models = client.models.list()
for model in models:
    print(model.id)
```


https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/GrokAPI
{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-grok-api" title="Grok API Blog Post" >}}
{{< /cards >}}

DeepSeek via Ollama

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-grok-api" title="Grok API Blog Post" >}}
{{< /cards >}}

[![shields.io Stars](https://img.shields.io/github/stars/langchain-ai/langchain)](https://github.com/langchain-ai/langchain/stargazers)


Companions for this multichat.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks//" title="Youtube Summarizer" image="/blog_img/GenAI/yt-summaries/yt-summaries-groq.png" subtitle="With Groq API" >}}
  {{< card link="https://github.com/JAlcocerT/RStocks" title="AIssistant" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Leveraging LLMs for several tasks." >}}
{{< /cards >}}

![Groq Youtube Summaries](/blog_img/GenAI/yt-summaries/yt-summaries-groq.png)

Agents with Streamlit

With a very interesting article about agents: https://www.anthropic.com/engineering/built-multi-agent-research-system



* https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools

> FULL v0, Cursor, Manus, Same.dev, Lovable, Devin, Replit Agent, Windsurf Agent, VSCode Agent, Dia Browser & Trae AI (And other Open Sourced) System Prompts, Tools & AI Models.



AIssistant

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/" title="AIssistant blog post" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant" title="Aissistant 💻 code" >}}  
{{< /cards >}}

 Read the Web!

https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/


 YT Summarizer

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/summarize-yt-videos" title="Groq Youtube Summarizer" >}}
  {{< card link="https://github.com/JAlcocerT/phidata/" title="My YT Summarizer 💻 - PhiData Fork with container created" >}}  
{{< /cards >}}

* https://console.groq.com/keys

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/phidata-yt-groq" title="Selfhosted PhiData YT Summarizer - Docker Configs 🐋 ↗" >}}
{{< /cards >}}




## Data APIs

You can get data from other users/services that have collected/processed and expose it for you.

In case you want to expose your own API endpoints with code, for example with [FastAPI](https://jalcocert.github.io/JAlcocerT/fast-api) or with [Pocketbase BaaS](https://jalcocert.github.io/JAlcocerT/pocketbase/#what-are-api-rules).


This time is going to be [yfinance](https://jalcocert.github.io/JAlcocerT/r-yfR-package-guide/) based. 

> That I also covered recently on this post: https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/

Im aware that there are many APIs around: https://github.com/public-apis/public-apis

### Weather

This was one of the first data I used for a personal project.

Im talking about the python trip planner, which uses the open meteo API to get historical weather data points.

`https://api.open-meteo.com/v1/forecast?city=${city}&daily=temperature_2m_max&timezone=auto`


## Checking APIs

As we saw during the [FastAPI post, here](https://jalcocert.github.io/JAlcocerT/fast-api/#apis), there are few tools to check/test/interact with APIs.

Among all of them, is worth to get to know how to use Hoppscoth.

#### How to use Hoppscotch

When playing/creating APis...

<!-- https://www.youtube.com/watch?v=V4eC5tKg3WQ -->

{{< youtube "V4eC5tKg3WQ" >}}

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/hoppscotch/" title="Hoppscotch | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```sh
wget https://github.com/hoppscotch/releases/releases/latest/download/Hoppscotch_linux_x64.deb
sudo apt install ./Hoppscotch_linux_x64.deb #https://hoppscotch.com/download
```



---

## Conclusions

The problem today is not to have options, but too many:

- **Smithery:** [An open platform](#smithery) and registry for managing, sharing, and deploying modular agentic tools (MCP servers) that extend AI assistants with real-world actions and data.

> See https://smithery.ai/playground

- **Octoparse:** A no-code/low-code web scraping platform for visually extracting structured data from websites, ideal for non-programmers and small businesses.
- **ZenRows:** A powerful API-based web scraper built for developers to extract data from dynamic, protected, or anti-bot websites at scale.
- **Pipedream:** A developer-oriented cloud automation platform for building, integrating, and running event-driven workflows that connect APIs, apps, and custom code.
- **Exa:** An advanced web search API and site crawler that powers AI and developer workflows with live, customizable, and accurate web data retrieval.


---

## FAQ

I know that some marketers are using...

### PipeDream

**Pipedream** is a cloud-based automation and integration platform designed for developers and technical users. It allows you to create workflows that connect APIs, databases, cloud apps, and event sources with minimal infrastructure setup. Key points about Pipedream:

- **Low-Code/Code-Optional:** You can build workflows using a mix of pre-built steps ("actions") and your own custom code in Node.js, Python, Go, or Bash. It’s not “no-code”—some programming/developer know-how is helpful for advanced automations.[1][2]
- **Event-Driven Workflows:** Automate processes triggered by events (webhooks, schedule, app activity, HTTP requests, etc.). A flow could start with a new form submission and end with an email sent, data added to Google Sheets, or anything else API-powered.[2][3][4]
- **Massive App Integration:** Natively connects with thousands of popular SaaS apps and their APIs—think Slack, Notion, AWS, Google, GitHub, Trello, databases, and custom endpoints. Useful for automating business, marketing, DevOps, or productivity tasks.
- **Developer-Focused Features:** Built-in code editor, version control, real-time debugging, execution history, error handling, and easy management of connections and secrets.
- **Use Cases:** ETL (Extract, Transform, Load) between systems, automation of business processes, scheduled reporting, CRM updates, social media posting, API orchestration, internal tool building, and more.[5][2]
- **Pricing:** Has a generous free tier, but limits on workflow invocations and event history; paid plans for heavier usage.[3]
- **Comparison:** Unlike Zapier or Make.com, Pipedream exposes the underlying logic/code—you get the power of serverless backend but managed hosting and easy debugging. It appeals to users who want flexibility, speed, and API agility.[6][1]

**Summary:**  
Pipedream is ideal for developers wanting rapid, flexible automation between cloud services, APIs, and custom code, without managing servers. It’s fast for prototyping, robust for event-driven scripting, and widely used for DevOps, SaaS, and workflow automation. Not a true no-code solution; best suited for technically comfortable users.[4][2][3]

### Smithery

**Smithery** (or Smithery.ai) is a developer-focused platform for **building, discovering, and managing MCP (Model Context Protocol) servers**—modular tools that extend the capabilities of AI assistants, agentic systems, and language models.

> Extend your AI with 7572 skills built by the community

- **MCP Registry:** Smithery acts as a central hub (sometimes called “Google for MCPs”) where developers can discover and share MCP-compliant AI tools—these are small servers or extensions that connect AI models to real-world data, services (like GitHub, Gmail), files, APIs, and much more.[1][2][3][4]
- **Agentic AI Tooling:** MCP servers let AI agents perform specialized tasks, such as web search, code execution, file management, memory recall, automation with external services, cloud browsing, and so on. Smithery routes each AI agent to the right MCP server for its needs via a dynamic toolbox.
- **Local & Hosted Installation:** Servers can be run locally (with CLI and Docker support) or hosted in the cloud. Smithery enables easy installation and management—often a single command will set up an MCP server, inject credentials, and register the endpoint for use by AI agents in your environment.[2][5][6]
- **Developer Integration:** Designed for modern dev ecosystems, Smithery integrates with GitHub (for CI/CD and code sharing), VS Code, Docker, Node.js, and major LLM platforms (Claude, Cursor, etc.). There's robust support for versioning, automated deployment, and environment variable configuration.
- **Privacy & Security:** Credentials/tokens (like your GitHub PAT) are generally managed locally and not stored on Smithery’s servers. Audit logs, team permissions, and best practices help secure collaborative workflows.[7][2]

- **Accessibility & Scale: The platform is open source (Apache 2.0 license)**, with frequent updates and a fast-growing community registry—recent counts claim thousands of MCP tools and daily usage in the tens of thousands.[4][1][7]
- **Use Cases:** Example MCP servers include web search plugins (like DuckDuckGo), automation helpers for software planning, code management, external database connectors, browser automators, and more. Developers can build new MCP servers for virtually any system their agents need to access.[5][6][8]

**Summary:**  

Smithery is the “app store” or registry for agentic AI extensions, enabling powerful automation and integration between LLM-powered agents and real-world apps/services. It’s especially useful for developers creating advanced personal finance, coding, or infrastructure management systems with agentic or autonomous logic.[3][1][2][4]


[10](https://github.com/smithery-ai)
[11](https://github.com/smithery-ai/sdk)


### Audio APIs

Powerful Translator: https://www.deepl.com/en/translator

If you like [Podcasts](https://jalcocert.github.io/JAlcocerT/tech-for-podcast/#a-look-to-gitpodcast)

* https://www.gitpodcast.com/rybbit-io/rybbit


https://jalcocert.github.io/JAlcocerT/local-ai-audio/

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/audio-to-text-tools/" title="OpenAI TTS and Transcription Project" image="/blog_img/GenAI/audio/speechraiter.png" subtitle="Speech rAIter Post" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="NEW Speech Raiter" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Streamlit Speech rater - Source Code on Github" >}}
{{< /cards >}}


#### 11Labs x MCP

ElevenLabs already has its own MCP Server:

<!-- https://www.youtube.com/watch?v=uOneCuSj2tI -->

{{< youtube "uOneCuSj2tI" >}}


### Python CLI Tools

* https://pypi.org/project/questionary/ - Create CLI utilities with python
* https://docs.pytest.org/en/stable/

## FAQ

### Other TOols

* https://github.com/Chivo-Systems/Shinar/

> gpl 3.0 | Open Source AI Calling Transcriptions, Summaries, and Analytics built on OpenAI Whisper

* https://github.com/getmaxun/maxun

> agpl | No Code Web Data Extraction Platform • Turn Websites To APIs & Spreadsheets In Minutes

* https://github.com/clusterzx/paperless-ai

> MIT | An automated document analyzer for Paperless-ngx using OpenAI API, Ollama, Deepseek-r1, Azure and all OpenAI API compatible Services to automatically analyze and tag your documents.

* https://github.com/esxr/langgraph-mcp

> MIT | LangGraph solution template for MCP