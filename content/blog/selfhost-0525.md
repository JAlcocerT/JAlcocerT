---
title: "SelfHosting Updates - May 2025"
date: 2025-05-06T01:20:21+01:00
draft: false
tags: ["Dev","HomeLab"]
description: 'Selfhosted Apps that simplify my workflow as of May 2025: Termix, CheckMate, LibreChat'
url: 'selfhosted-apps-may-2025'
---

Ive been following closely this awsome newsletter from: https://selfh.st/icons/

And [these apps](https://selfh.st/apps/) have taken my attention lately:

1. https://github.com/karakeep-app/karakeep

> aGPL |  A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search 

A replacement for raindrop....

2. https://github.com/vijeeshr/quickretro

> MIT |  A real-time app for conducting a remote sprint retrospective meeting 

Having retrospectives is really important when [working Agile](https://jalcocert.github.io/JAlcocerT/data-analytics-architecture/#from-the-experience)...

3. https://github.com/formsmd/formsmd

> Apache v2 |  Developer-first, open source Typeform alternative (formerly known as Blocks.md) 

An interesting alternative also to [formbricks](https://jalcocert.github.io/JAlcocerT/blog/dev-forms/#formbricks)

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/" title="SelfHosting 101 Script to get containers, tailscale and more ready to go! 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/dev-forms/" title="Forms/Newsletter Alternatives | Post ↗" >}}
{{< /cards >}}

4. https://github.com/donaldzou/WGDashboard

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/" title="Travel router setup with WG/Tailscale | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="WG Setup with WG-Easy on a VPS | Post ↗" >}}
{{< /cards >}}


5. https://github.com/Bubka/2FAuth

As I recently had some trouble with my phone...

6. https://github.com/besoeasy/file-drop

> Filebrowser alternative!

7. BYOD, I mean bring your own music https://github.com/swingmx/swingmusic

8. https://github.com/tiagorangel1/cap

>  Cap is a lightweight, modern open-source CAPTCHA alternative designed using SHA-256 proof-of-work 

9. Wordpres...but static sites? https://github.com/nityam2007/StaticPress-Docker

## New SelfH Apps

I had a look to https://github.com/localtunnel/server, just that still, [cloudflared](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/) is the go to option for me [when exposing homelab containers](https://jalcocert.github.io/JAlcocerT/why-i-love-containers/).

<!-- https://studio.youtube.com/video/k75PviBQeA0/edit -->

{{< youtube "k75PviBQeA0" >}}

New apps always come with new tricks: *generating secrets automatically with CLI*

```sh
openssl rand -base64 12 #for secrets
openssl rand -hex 32 #for apikeys
```

> See als https://emn178.github.io/online-tools/


### Termix

Termix, *not [termux](https://jalcocert.github.io/JAlcocerT/pixel-8-pro-tricks/#termux)*, its being great to get all my servers at one place:

* https://github.com/LukeGus/Termix
  * https://github.com/LukeGus/Termix/wiki/Docker

> MIT |  Clientless web-based SSH terminal emulator that stores and manages your connection details 

<!-- https://www.youtube.com/watch?v=s15a-ysSQE0 -->


{{< youtube "s15a-ysSQE0" >}}

This is how termix UI looks:

![Termix UI](/blog_img/selfh/termix-ui.png)

You can create user on termix like so:

![Termix users creation](/blog_img/selfh/termix-user.png)

Now I can have one tab for each home selfhost related device:

* http://192.168.1.11:9000/ the x300
* .1.13 this x13 laptop...
* A distant Pi and connect via tailscale to [see its temperature](https://jalcocert.github.io/JAlcocerT/web-apps-with-flask/#pi4)...

```sh
udo apt update && sudo apt upgrade -y
vcgencmd measure_temp
```

Or the health statistics of distant containers:

```sh
docker stats $(docker-compose ps -q)
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH/Termix" title="Termix with Docker 🐋 ↗" >}}
{{< /cards >}}


Termix reminded me [about Tabby](https://fossengineer.com/selfhosting-Tabby-coding-assistant/).

* https://github.com/TabbyML/tabby

* [Tabby](https://github.com/Eugeny/tabby/releases/tag/v1.0.223)

> [Tabby](https://tabby.sh/) is *a terminal for the modern age* 


You can use Termix to manage devices on the same local network:

```sh
#arp -a
arp -a | grep "192.168.1" #filtered to avoid containers
#ip neigh
#nmap -sP 192.168.1.1/24 | grep "scan"
```

But also the ones **via tailscale**, even if they are outside your home network:

```sh
sudo tailscale status | grep -v "offline"
```

You can measure the temp of a distant Pi:

```sh
vcgencmd measure_temp pmic

#docker system prune -a #or clean its unused container space
```

![Docker Prune Satisfaction](/blog_img/selfh/dockerprune.png)


### CheckMate

* https://github.com/bluewave-labs/checkmate
  * https://checkmate.so/

> aGPL | Checkmate is an open-source, self-hosted tool designed to **track and monitor server hardware**, uptime, response times, and incidents in real-time with beautiful visualizations.

### Publiteme

* https://github.com/MikeMather/publite.me

<!-- https://www.youtube.com/watch?v=yAJvbF-m5FM -->

{{< youtube "yAJvbF-m5FM" >}}

### UserTour

For product people in the room:

* https://github.com/usertour/usertour

> Agpl v3 | Usertour is an open-source user onboarding platform designed for developers. It allows you to create in-app product tours, checklists, and launchers in minutes—effortlessly and with full control.The open-source alternative to Userflow and Appcues


### Recap from Spring 2025

I was covering recently nextcloud...

![NextCloud Untrusted Domain](/blog_img/selfh/nextcloud-untrusteddomain.png)

found out about

1. [OpenCloud](https://www.youtube.com/watch?v=Ud9FEmNOgLs)

* https://github.com/opencloud-eu/opencloud

> Apache v2 | This is the main repository of the OpenCloud server. It contains the golang codebase for the backend services.

2. Using [ProtonDrive](https://blog.otterlord.dev/posts/proton-drive-rclone/) with [rclone](https://rclone.org/protondrive/#configurations)

Which I could not resist to try: https://github.com/JAlcocerT/Docker/tree/main/Backups#rclone


#### AI Apps Im SelfHosting

I decided to add this section: https://github.com/JAlcocerT/Docker/tree/main/SelfH

To get in a quick look what Im selfhosting lately.

1. Now the **MultiChat** project I've been tinkering on, [now](https://github.com/JAlcocerT/Streamlit-MultiChat/releases/tag/llms%2Byt) supports also the Youtube Groq Summaries:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/" title="RAG 101" image="//blog_img/GenAI/rag101.jpeg" subtitle="My Fav RAGs Post" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="MultiChat" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Chat with various LLMs x Youtube Groq Summaries" >}}
{{< /cards >}}

**Get your AI API KEYS**:

* https://platform.openai.com/playground/prompts?models=gpt-4.1
* https://platform.openai.com/logs
  * OpenAI API Keys - https://platform.openai.com/api-keys

* https://x.ai/api
    * https://console.x.ai/
    * https://docs.x.ai/docs/overview
  
* Anthropic - https://console.anthropic.com/settings/keys
* Groq - https://console.groq.com/keys

* For Ollama, you need [this setup](https://fossengineer.com/selfhosting-llms-ollama/)

2. I got to know about [librechat](https://github.com/danny-avila/LibreChat) and [Oterm](https://github.com/ggozad/oterm)

* https://github.com/ggozad/oterm
  * https://pypi.org/project/oterm/

![Oterm](/blog_img/GenAI/oterm.png)

> MIT | The terminal client for Ollama 


```sh
sudo snap install astral-uv --classic #got it working with python 3.13.2
#astral-uv 0.7.2 from Alex Lowe (lengau) installed

uvx oterm #https://ggozad.github.io/oterm/installation/#installation
```

{{< callout type="info" >}}
Oterm seems to [support MCP](https://ggozad.github.io/oterm/mcp/?h=mcp#tools)
{{< /callout >}}

<!-- 
* <https://www.youtube.com/watch?v=0BRnK5BGZHU>

* <https://github.com/danny-avila/LibreChat/tree/main>
    * <https://github.com/danny-avila/LibreChat/blob/main/docs/install/docker_compose_install.md>
    * mongoDB: <https://docs.librechat.ai/features/manage_your_database.html> -->

* https://github.com/danny-avila/LibreChat

![LibreChat UI with OpenAI](/blog_img/GenAI/librechat-openai.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LibreChat" title="LibreChat Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

3. I got working a **local research assistant** the searches the web for you and summarizes the content via Ollama (I added OpenAI as well and groq is WIP).

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understanding-langgraph-local-deep-researcher/#local-deep-researcher-project" title="Local Deep Researcher" image="//blog_img/GenAI/rag101.jpeg" subtitle="Local Deep Researcher | Post" >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher/tree/main/" title="Local Deep Researcher" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Forked Repo" >}}
{{< /cards >}}

It uses [LangGraph](https://jalcocert.github.io/JAlcocerT/understanding-langgraph-local-deep-researcher/) under the hood!


### I needed recently...

* https://notebooklm.google.com/
* https://speed.cloudflare.com/

![alt text](/blog_img/selfh/Internet/internet-test.png)

Speedtest CLI from Ookla®:

![Speed Test](/blog_img/selfh/Internet/SpeedTest.png)

As seen on the [benchmarking post](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/#internet-benchmark):

```sh
sudo apt-get install speedtest-cli
```

![alt text](/blog_img/Monitoring/eth-vs-wifi.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/IoT/InternetQuality/InternetSpeedTracker.yaml" title="InternetSpeedTracker with Docker 🐋 ↗" >}}
{{< /cards >}}

See that the speedtest app is running with:

```sh
curl 192.168.1.11:8065/api/healthcheck
```

{{< callout type="info" >}}
It has influxDB 2.0 integration, inc ase that you want to use this with Grafana. Also integrations with: tg, webhooks, gotify, ntfy,...
{{< /callout >}}



---

## Conclusions

From now on, I will include **ocker-compose stacks** linked to this kind of recap Selfhosting posts:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/SelfH/May25_docker-compose.yml/" title="Selfhosting Stack May 2025 | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

You can see how each service is consuming with:

```sh
sudo docker compose stats
```

Or just sping couple of the services listed:

```sh
#sudo docker compose up -d
```

I could not forget about **PiGallery** somplicity, with its lovely map render and **no DB** requirement!

![PiGallery Map](/blog_img/selfh/https/pigallery-map.png)


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/PiGalleryTraefik_docker-compose.yml" title="Local Photo Viewer" image="/blog_img/selfh/https/pigallery-traefik-https.png" subtitle="PiGallery x Traefik | Docker Config" >}}
{{< /cards >}}

And How could I miss **SearXNG and [PiHole](https://fossengineer.com/selfhosting-PiHole-docker/)**

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Search/SearXNG" title="SearXNG" image="/blog_img/selfh/https/SearXNG-Traefik.png" subtitle="SearXNG x Traefik | Docker Config" >}}
{{< /cards >}}

<!-- ![alt text](/blog_img/selfh/https/SearXNG-Traefik.png) -->

```sh
docker builder prune
#docker system prune -a
docker volume prune
docker image prune -a
```

Recently I saw a really cool podcast from DOAC:

<!-- https://www.youtube.com/watch?v=Kl-I7sUcAOY -->

{{< youtube "Kl-I7sUcAOY" >}}

And **one of the messages** I got was:

* 70% more of the same
* 20% better
* 10% new

With Selfhosting I feel im balancing a lot towards the new, which makes me operate away from my bests, yet I learn a lot.

For example

Lately I got to know about couple of **'new' VectorDBs**:

* https://github.com/milvus-io/milvus

>  Milvus is a high-performance, cloud-native vector database built for scalable vector ANN search 

Milvus can have **Attu** as UI companion:

![alt text](/blog_img/GenAI/attu.png)

* https://github.com/pgvector/pgvector

>  Open-source vector similarity search for Postgres 

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/" title="Milvus and PgVector Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

* https://github.com/hollowpnt92/docker-port-viewer?ref=selfh.st
https://github.com/hollowpnt92/docker-port-viewer/blob/main/docker-compose.yml

```sh
docker run -d --name docker-socket-proxy -e CONTAINERS=1 -e POST=0 -e PUT=0 -e DELETE=0 -v /var/run/docker.sock:/var/run/docker.sock:ro tecnativa/docker-socket-proxy && docker run -d --name docker-port-viewer --link docker-socket-proxy -p 3003:80 hollowpnt/docker-port-viewer:latest
```

### Better WebAnalytics

It's always great to see new options appearing on the web analytics space.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics" title="Specially, when those are SelfHostable WebAn 🐋✅ ↗" >}}
{{< /cards >}}

I saw a cool post about [Umami](https://github.com/umami-software/umami/releases) and how 

Yet, lately I tried [littlyx](https://dashboard.litlyx.com/): which I discovered few months back

<!-- ![Littlyx Web Analytics](/blog_img/web/weban/littlyx-weban.png) -->

{{< cards >}}
  {{< card link="https://github.com/Litlyx/litlyx" title="Litlyx Repo" image="/blog_img/web/weban/littlyx-weban.png" subtitle="How Litlyx web analytics looks" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/" title="Litlyx Post Views Distribution" image="/blog_img/web/weban/litlyx.png" subtitle="How could this not relate with Pareto?" >}}
{{< /cards >}}

> Powerful Analytics Solution. Setup in 30 seconds. Display all your data on a Simple, AI-powered dashboard. Fully self-hostable and GDPR compliant. Alternative to Google Analytics, MixPanel, Plausible, Umami & Matomo.



### Automated Projects Docs

> Wouldnt it be great to have a project documentation/on boarding guide automatically (and AI) generated?

<!-- 
https://git.exadel.com/exadel-ai-practice/accelerator/project-documentation-generator
 -->

It's all about using what we know already, **LLMs with appropiate context**:

* OpenAI API Keys - <https://platform.openai.com/api-keys>
* Anthropic - <https://console.anthropic.com/settings/keys>
* Groq - <https://console.groq.com/keys>
* For [Ollama](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Ollama), you need [this setup](https://fossengineer.com/selfhosting-llms-ollama/)

1. **RepoReader**

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/RepoReader" title="Repo Reader | Forked Project ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/#conclusions" title="Web Scrapping | Post ↗" >}}
{{< /cards >}}


```sh
git clone https://github.com/JAlcocerT/RepoReader

python3 -m venv .venv
source .venv/bin/activate

pip install -r requirements.txt
source .env

python3 app.py
#An error occurred: The model `text-davinci-003` has been deprecated, learn more here: https://platform.openai.com/docs/deprecations
```

But...it used davinci model which was deprecated: https://platform.openai.com/docs/deprecations#instructgpt-models

So I had to vibe code a little bit with **codex** to fix it:

![alt text](/blog_img/GenAI/aidocs/reporeader-qatrack.png)
<!-- ![alt text](/blog_img/GenAI/reporeader-qatrack.png) -->

But...I feel its already superseeded few times by other tools.

2. **Scrapping** with FireCrawl + OpenAI

I also tried with Firecrawl and OpenAI to give me some readme/ [sample posts](https://github.com/JAlcocerT/Scrap_Tools/blob/main/FireCrawl/Z_Scrap_GHRepo/z_sample_post.md) about a given project:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/RepoReader" title="Repo Reader | Forked Project ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools/tree/main/FireCrawl/Z_Scrap_GHRep" title="Firecrawl Scrap GH Repo | Project Files ↗" >}}
{{< /cards >}}


3. **LangChain** Web content embedd (to ChromaDB) + ask on that context:

In the meantime I discovered that it is also possible to [ask questions about a Web's content with LangChain](https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/#web-scrapping), for example, [a repository's readme info](https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/web):

```py
    ###Change these parameters and lets go###
    ollama_url = "http://192.168.1.5:11434"  # Replace with your Ollama server URL if different
    embedding_model = "all-minilm"
    llm_model = "llama3.2:1b"
    #user_question = "what it is this offer about?"
    user_question = "what it is this repository about?"
    #target_website = "https://justjoin.it/job-offer/link-group-product-manager-warszawa-ai"
    target_website = "https://github.com/JAlcocerT/Streamlit-MultiChat"
    #content_area_class = "MuiBox-root css-rcazos" # Use the same class as in the example
    content_area_class = "markdown-body entry-content container-lg"
```

Its possible to use few LLMs to get the reply, tried with local models via Ollama, OpenAI and Groq APIs.

![alt text](/blog_img/GenAI/langchain-repo-webask.png)

<!-- https://github.com/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-chroma-web.ipynb
https://github.com/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-chroma-repo-readme.ipynb
 -->

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://github.com/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-chroma-repo-readme.ipynb)


{{< callout type="info" >}}
It uses a [local ChromaDB](https://pypi.org/project/langchain-chroma/), Local embedding model and the LLM of your taste, via `LangChail.LLM`: [Ollama](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Ollama), [OpenAI](https://python.langchain.com/api_reference/openai/llms/langchain_openai.llms.base.OpenAI.html#langchain_openai.llms.base.OpenAI)...
{{< /callout >}}


{{< details title="It provides real and accurate information | Sample with gpt-4.1-nano 📌" closed="true" >}}

Based on the provided context, this repository is about creating a Streamlit Web App that allows users to chat with multiple large language models (LLMs) simultaneously, including OpenAI, Anthropic, Ollama, and Groq. 

The repository is called `Streamlit-MultiChat` and it features support for several LLMs, including:

- OpenAI (GPT 3.5, GPT4, GPT4o, GPT4o-mini)
- Anthropic (Claude 3, Claude 3.5)
- Ollama (Open Source Models)
- Groq API (LlaMa models using quick LPU inference)

The repository also includes documentation on how to get started, including:

- Cloning the repository and running the Streamlit Web App with API keys
- Exploring the project's features, such as SliDev presentations, ScrapeGraph, DaLLe, Streamlit Auth, and OpenAI as Custom Agents
- Deploying the project using Docker and Portainer

The repository is designed to be used with Python venvs, and it includes instructions on how to set up a venv, install dependencies, and run the Streamlit Web App.

To set up the project, you can follow these steps:

1. Clone the repository using `git clone https://github.com/JAlcocerT/Streamlit-MultiChat`
2. Create a new Python venv using `python3 -m venv multichat_venv` (for Linux) or `python -m venv multichat_venv` (for Windows)
3. Activate the venv using `source multichat_venv/bin/activate` (for Linux) or `multichat_venv\Scripts\activate` (for Windows)
4. Install the dependencies using `pip install -r requirements.txt`
5. Copy the API keys to the `.streamlit/secrets.toml` file
6. Run the Streamlit Web App using `streamlit run Z_multichat.py`

Alternatively, you can use the Docker image by running `docker pull ghcr.io/jalcocert/streamlit-multichat:latest` and then running the container using `docker run -p 8501:8501 ghcr.io/jalcocert/streamlit-multichat:latest

{{< /details >}}


The problem with this approach is that the context is limited to one file only, the `readme.md` and also subject that class changes on the repository website will require a class review for bs4 to work.

We are missing for example the technologies split of the project, which are at `content_area_class = "BorderGrid about-margin"`

Once embedded, it will reply with both context provided: [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://github.com/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-scrap-repo-groq.py)

Whatever API you are using, remember that you can see the available models:

Once embedded, it will reply with both context provided: [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/Z_API_Models_check.ipynb)



#### Local Deep Researcher

4. Some kind of LangGraph workflow to iteratively explore the code, instead of searching the web? 

https://jalcocert.github.io/JAlcocerT/understanding-langgraph-local-deep-researcher


> In many of these AI projects you will see [UV as package manager](https://jalcocert.github.io/JAlcocerT/using-langchain-with-pandas-df/#uv)

#### Vibe Coded Project Docs

5. Simply Cloning a project repo and just vibe coding...

[Codex with **o4-mini** as default model](https://jalcocert.github.io/JAlcocerT/vide-coding/#openai) to write [Astro](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/) powered [docs](https://astro.build/themes/1/?search=&price%5B%5D=free)?


> Having in mind that astro can embed mermaidJS diagrams as per https://astro-digital-garden.stereobooster.com/recipes/mermaid-diagrams-in-markdown/


Using [starlight theme](https://starlight.astro.build/getting-started/):

```sh
#npm i -g @openai/codex
npm create astro@latest -- --template starlight
# cd docs
# npm run dev
cd docs && npm run dev
```

![Starlight AI Powered Docs](/blog_img/GenAI/aidocs/starlight-ai-dcs.png)

Once finished, we can see locally the theme: `localhost:4321`

> These docs could be plugged directly to [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/)

Now, we need to prompt codex:

```sh
codex
```


{{< callout type="warning" >}}
Make sure to run codex on a git environment so that you can see whats been changed!
{{< /callout >}}

* Are you able to generate documentation of the local-deep-researcher project, which files are located at ./src/ollama_deep_researcher and have it outputed to the astro theme
template that it is loaded at ./docs/src?

* Iterating on the prompts for Codex:


{{< details title="Codex AI Docs Prompt Astro | v1.0 📌" closed="true" >}}

You are an AI documentation generator. Your task is to create technical documentation for the local-deep-researcher project.

**1. Project Files:**

Inspect the content of the files located in the `./src/ollama_deep_researcher` directory. Please process the content of these files to understand the project's structure, modules, functions, classes, and overall functionality.

**2. Documentation Requirements:**

The generated documentation should aim to cover the following aspects (please be as comprehensive as possible based on the code):

* **Project Overview:** A high-level summary of the local-deep-researcher project's purpose and main features.
* **Module Descriptions:** For each Python file (or identified module), provide a description of its functionality and key components.
* **Function and Class Documentation:** For each function and class, include:
    * A concise description of its purpose.
    * Its signature (parameters, return type).
    * Explanations of the parameters and return values.
    * (If possible and relevant) Short examples of usage.
* **Key Concepts and Algorithms:** If the code implements any significant algorithms or concepts, explain them in a clear and understandable way.
* **Dependencies:** List any external libraries or dependencies used by the project.
* **(Optional, if discernible) Configuration:** If the code involves configuration files or settings, document their purpose and how to modify them.

**3. Output Format (Astro Theme Template):**

The final documentation should be formatted to be easily integrated with the Astro theme located at `./docs/src`. Please consider the following:

* **Markdown Output:** Generate the documentation in Markdown format (`.md` files) as this is the primary format for Astro content.
* **Frontmatter:** Respect the Astro frontmatter at the beginning of each Markdown file (e.g., `title`, `description`, `sidebar`)as per the sample posts
**4. Input:**

I will now provide you with the content of each file in the `./src/ollama_deep_researcher` directory. Please process them one by one.

**5. Output Instructions:**

Output the generated documentation in Markdown format, ready to be placed within the `./docs/src` directory of my Astro project. 


{{< /details >}}

The agent placed them at the *wrong place*, just following my incorrect orders:

![alt text](/blog_img/GenAI/aidocs/codex-aidocs-v1-0.png)

So I moved the files and it required to tweak the frontmatter, which I will specify on the next prompt iteration.

This is the result:

![alt text](/blog_img/GenAI/aidocs/codex-aidocs-astro-v1-0.png.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher/tree/main/docs" title="Tested with LocalDeepResearcher | Astro AI Powered Docs v1.0 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/GenAI/aidocs/starlight-v1-0.png)


{{< details title="Codex AI Docs Prompt Astro | v1.1 📌" closed="true" >}}

You are an AI documentation generator. Your task is to create technical documentation for the Claper cloned project.

**1. Project Files:**

Inspect the content of the files located in the `./` directory. Please process the content of these files to understand the project's structure, modules, functions, classes, and overall functionality.

**2. Documentation Requirements:**

The generated documentation should aim to cover the following aspects (please be as comprehensive as possible based on the code):

* **Project Overview:** A high-level summary of the local-deep-researcher project's purpose and main features.
* **Module Descriptions:** For each Python file (or identified module), provide a description of its functionality and key components.
* **Function and Class Documentation:** For each function and class, include:
    * A concise description of its purpose.
    * Its signature (parameters, return type).
    * Explanations of the parameters and return values.
    * (If possible and relevant) Short examples of usage.
* **Key Concepts and Algorithms:** If the code implements any significant algorithms or concepts, explain them in a clear and understandable way.
* **Dependencies:** List any external libraries or dependencies used by the project.
* Create one `index.md` with the high level overview: description of the project, key features, modules, dependencies, configuration and environment, also Static code analysis (languages, structure, dependencies).
* For each mdule that you consider important to understand the project way of working, create a separated markdown post file
* If the project have guidelines on how t run it or deploy, lets create a `deploy.md` post with such info. Else, lets try to guess it based on the technlogies.
* **(Optional, if discernible) Configuration:** If the code involves configuration files or settings, document their purpose and how to modify them.

**3. Output Format (Astro Theme Template):**

The final documentation should be formatted to be easily integrated with the Astro theme located at `./docs/src/content/docs/reference`. Please consider the following:

* **Markdown Output:** Generate the documentation in Markdown format (`.md` files) as this is the primary format for Astro content.
* **Frontmatter:** Respect the following Astro frontmatter at the beginning of each Markdown file (e.g., `title`, `description`)


**4. Input:**

See the content of each file in the `./` directory. Please process them one by one and get an idea of how the all work together.

**5. Output Instructions:**

Output the generated documentation in Markdown format, ready to be placed within the `./docs/src` directory of my Astro project. 


{{< /details >}}

Automating this a little bit more, the astro setup can be done with:

```sh
#!/usr/bin/expect -f

spawn npm create astro@latest -- --template starlight

# Increase timeout and add debugging after expect
expect -timeout 20 "*Where should we create your new project?*" {
    send "./documentaition\r"
    puts "Sent project directory."
} timeout {
    puts "Timeout occurred while waiting for project directory prompt."
    exit 1
}

expect -timeout 20 "*Install dependencies?*" {
    send "y\r"
    puts "Sent 'yes' for dependencies."
} timeout {
    puts "Timeout occurred while waiting for install dependencies prompt."
    exit 1
}

expect -timeout 20 "*Initialize a new git repository?*" {
    send "n\r"
    puts "Sent 'no' for Git initialization."
} timeout {
    puts "Timeout occurred while waiting for Git init prompt."
    exit 1
}

expect eof
```

I also added the following fllow ups:

* Write the files
* Can you inspect the git code changes on a highlevel and describe on a different post the versions and associated changes?

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Claper" title="Tested with Clapper | Astro AI Powered Docs v1.1 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/GenAI/aidocs/codex-aidocs-astro-v1-1.png)

So now I need to:

```sh
#Clone the repo
git clone https://github.com/JAlcocerT/qatrackplus
#git show HEAD #q

#sudo apt install expect
nano create-starlight.sh #use the script above
chmod +x create-starlight.sh
./create-starlight.sh
cd documentaition && npm install && npm run dev

codex

#codex "$ai_docs_prompt"
#codex --approval-mode full-auto "create the fanciest todo-list app"
#codex --approval-mode full-auto "$ai_docs_prompt"
```




{{< details title="Codex AI Docs Prompt Astro | v1.2 📌" closed="true" >}}

You are an AI documentation generator. Your task is to create technical documentation for the **QATrackPlus** cloned project and write the post as markdown files where specified.

**1. Project Files:**

Inspect the content of the files located in the `./` directory. Please process the content of these files to understand the project's structure, modules, functions, classes, and overall functionality.

**2. Documentation Requirements:**

The generated documentation should aim to cover the following aspects (please be as comprehensive as possible based on the code):

* **Project Overview:** A high-level summary of the local-deep-researcher project's purpose and main features.
* **Module Descriptions:** For each Python file (or identified module), provide a description of its functionality and key components.
* **Function and Class Documentation:** For each function and class, include:
    * A concise description of its purpose.
    * Its signature (parameters, return type).
    * Explanations of the parameters and return values.
    * (If possible and relevant) Short examples of usage.
* **Key Concepts and Algorithms:** If the code implements any significant algorithms or concepts, explain them in a clear and understandable way.
* **Dependencies:** List any external libraries or dependencies used by the project.
* Create one `index.md` with the high level overview: description of the project, key features, modules, dependencies, configuration and environment, also Static code analysis (languages, structure, dependencies).
* For each mdule that you consider important to understand the project way of working, create a separated markdown post file
* If the project have guidelines on how t run it or deploy, lets create a `deploy.md` post with such info. Else, lets try to guess it based on the technlogies.
* Inspect the git code changes on a highlevel and describe on a different post the versions and associated changes into a `releases.md` post.
* **(Optional, if discernible) Configuration:** If the code involves configuration files or settings, document their purpose and how to modify them.

**3. Output Format (Astro Theme Template):**

The final documentation should be formatted to be easily integrated with the Astro theme located at `./documentaition/src/content/docs/reference`. Please consider the following:

* **Markdown Output:** Generate the documentation in Markdown format (`.md` files) as this is the primary format for Astro content.
* **Frontmatter:** Respect the following Astro frontmatter at the beginning of each Markdown file (e.g., `title`, `description`)


**4. Input:**

See the content of each file in the `./` directory. Please process them one by one and get an idea of how the all work together.

**5. Output Instructions:**

Output the generated documentation in Markdown format, ready to be placed within the `./documentaition/src` directory of my Astro project. 


{{< /details >}}

{{< callout type="info" >}}
So far with these projects AI docs, I was getting at the worst case a **86% context left** for codex
{{< /callout >}}

And this was applied also to **big repos**, like signoz with ~380mb in it or...remotion, with 4GB size!

```sh
du -sh . #see repo size
```


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/qatrackplus/tree/master/documentaition" title="Tested with QaTrack+ | Astro AI Powered Docs v1.2 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/GenAI/aidocs/codex-aidocs-astro-v1-2.png)

I could not resist to

* follow up with a: can you create an additional post on how to deploy this app with docker containers?
* leave aut mode...


```sh
#codex --approval-mode full-auto "theawsomeprompt"--provider ollama
codex --approval-mode full-auto < input.txt #--provider ollama
```

As `input.txt` is the prompt we have tinkered with.

{{< details title="Codex AI Docs Prompt Astro | v1.3 📌" closed="true" >}}

You are an AI documentation generator. Your task is to create technical documentation for **the LibreChat cloned project** and write the post as markdown files where specified.

**1. Project Files:**

Inspect the content of the files located in the `./` directory. Please process the content of these files to understand the project's structure, modules, functions, classes, and overall functionality.

**2. Documentation Requirements:**

The generated documentation should aim to cover the following aspects (please be as comprehensive as possible based on the code):

* **Project Overview:** A high-level summary of the local-deep-researcher project's purpose and main features.
* **Module Descriptions:** For each Python file (or identified module), provide a description of its functionality and key components.
* **Function and Class Documentation:** For each function and class, include:
    * A concise description of its purpose.
    * Its signature (parameters, return type).
    * Explanations of the parameters and return values.
    * (If possible and relevant) Short examples of usage.
* **Key Concepts and Algorithms:** If the code implements any significant algorithms or concepts, explain them in a clear and understandable way.
* **Dependencies:** List any external libraries or dependencies used by the project.
* Create one `index.md` with the high level overview: description of the project, key features, modules, dependencies, configuration and environment, also Static code analysis (languages, structure, dependencies).
* For each mdule that you consider important to understand the project way of working, create a separated markdown post file
* If the project have guidelines on how t run it or deploy, lets create a `deploy.md` post with such info. Else, lets try to guess it based on the technlogies.
* Inspect the git code changes on a highlevel and describe on a different post the versions and associated changes into a `releases.md` post.
* Create an additional post on how to deploy this app with docker containers into `container.md`
* **(Optional, if discernible) Configuration:** If the code involves configuration files or settings, document their purpose and how to modify them.

**3. Output Format (Astro Theme Template):**

The final documentation should be formatted to be easily integrated with the Astro theme located at `./documentaition/src/content/docs/reference`. Please consider the following:

* **Markdown Output:** Generate the documentation in Markdown format (`.md` files) as this is the primary format for Astro content.
* **Frontmatter:** Respect the following Astro frontmatter at the beginning of each Markdown file (e.g., `title`, `description`)


**4. Input:**

See the content of each file in the `./` directory. Please process them one by one and get an idea of how the all work together.

**5. Output Instructions:**

Output the generated documentation in Markdown format, ready to be placed within the `./documentaition/src` directory of my Astro project. 


{{< /details >}}


![alt text](/blog_img/GenAI/librechat-docs.png)


![alt text](/blog_img/GenAI/librechat-docs-ai.png)

6. **Windsurf/Cline/Aider IDE's** - As seen on the [vibe coding post](https://jalcocert.github.io/JAlcocerT/vide-coding/#free-assistants)

Windsurf, which is a vscode forked, recently adquired by openai...

* https://github.com/ichoosetoaccept/awesome-windsurf


Tested with:

* https://github.com/JAlcocerT/local-deep-researcher/
* https://github.com/JAlcocerT/Claper

<!-- * https://github.com/JAlcocerT/mechanism -->


* https://github.com/qatrackplus/qatrackplus/
  * https://github.com/jlleongarcia/qatrackplus


https://github.com/airbytehq/airbyte
https://github.com/SigNoz/signoz
https://github.com/syncthing/syncthing
https://github.com/grafana/grafana

## FAQ

More Selfhosted resources

* https://libreselfhosted.com/project/fluxbb/
* https://awesome-docker-compose.com/apps/photo-server/pigallery-2
