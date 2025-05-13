---
title: "SelfHosting Updates - May 2025"
date: 2025-05-06T01:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Selfhosted Apps that simplify my workflow as of May 2025: Termix, CheckMate, LibreChat'
url: 'selfhosted-apps-may-2025'
---

Ive been following closely the newsletter from: https://selfh.st/icons/

And [these apps](https://selfh.st/apps/) have taken my attention: 

1. https://github.com/karakeep-app/karakeep

> aGPL |  A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search 

A replacement for raindrop....

2. https://github.com/vijeeshr/quickretro

> MIT |  A real-time app for conducting a remote sprint retrospective meeting 

Having retrospective is really important when working Agile...

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

filebrowser alternative!

7. BYOD, I mean bring your own music https://github.com/swingmx/swingmusic

8. https://github.com/tiagorangel1/cap

>  Cap is a lightweight, modern open-source CAPTCHA alternative designed using SHA-256 proof-of-work 

9. Wordpres...but static sites? https://github.com/nityam2007/StaticPress-Docker

## New SelfH Apps

### Termix

Termix, not [termux](https://jalcocert.github.io/JAlcocerT/pixel-8-pro-tricks/#termux), its being great:

* https://github.com/LukeGus/Termix
  * https://github.com/LukeGus/Termix/wiki/Docker

> MIT |  Clientless web-based SSH terminal emulator that stores and manages your connection details 

<!-- https://www.youtube.com/watch?v=s15a-ysSQE0 -->

{{< youtube "s15a-ysSQE0" >}}

![alt text](/blog_img/selfh/termix-ui.png)

![alt text](/blog_img/selfh/termix-user.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH/Termix" title="Termix with Docker 🐋 ↗" >}}
{{< /cards >}}

```yml
services:
  termix:
    image: ghcr.io/lukegus/termix:latest
    container_name: termix
    restart: unless-stopped
    ports:
      - "8090:8080"
    volumes:
      - termix-data:/app/data
    environment:
      # Generate random salt here https://www.lastpass.com/features/password-generator (max 32 characters, include all characters for settings)
      SALT: "something_generated"
      PORT: "8080"

volumes:
  termix-data:
    driver: local
```

You can use it to manage devices on the same local network:

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

### CheckMate

* https://github.com/bluewave-labs/checkmate
* https://checkmate.so/


> aGPL | Checkmate is an open-source, self-hosted tool designed to track and monitor server hardware, uptime, response times, and incidents in real-time with beautiful visualizations.





### Publiteme

* https://github.com/MikeMather/publite.me

<!-- https://www.youtube.com/watch?v=yAJvbF-m5FM -->

{{< youtube "yAJvbF-m5FM" >}}



### Recap from Spring 2025

I was covering recently nextcloud...

![alt text](/blog_img/selfh/nextcloud-untrusteddomain.png)

and found out about OpenCloud:

https://www.youtube.com/watch?v=Ud9FEmNOgLs

* https://github.com/opencloud-eu/opencloud

> Apache v2 | This is the main repository of the OpenCloud server. It contains the golang codebase for the backend services.

![alt text](/blog_img/selfh/dockerprune.png)

#### AI Apps Im SelfHosting

1. Now the **MultiChat** project I've been tinkering on, [now](https://github.com/JAlcocerT/Streamlit-MultiChat/releases/tag/llms%2Byt) supports also the Youtube Groq Summaries:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/" title="RAG 101" image="//blog_img/GenAI/rag101.jpeg" subtitle="My Fav RAGs Post" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="MultiChat" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Chat with various LLMs x Youtube Groq Summaries" >}}
{{< /cards >}}

* https://platform.openai.com/playground/prompts?models=gpt-4.1
* https://platform.openai.com/logs
  * OpenAI API Keys - https://platform.openai.com/api-keys
  
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

3. I got working a **local research assistant** the searches the web for you and summarizes the content via Ollama (I added OpenAI as well and groq is WIP).

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understanding-langgraph-local-deep-researcher/#local-deep-researcher-project" title="Local Deep Researcher" image="//blog_img/GenAI/rag101.jpeg" subtitle="Local Deep Researcher | Post" >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher/tree/main/" title="Local Deep Researcher" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Forked Repo" >}}
{{< /cards >}}

It uses [LangGraph](https://jalcocert.github.io/JAlcocerT/understanding-langgraph-local-deep-researcher/) under the hood!


### I needed recently...


* https://speed.cloudflare.com/

![alt text](/blog_img/selfh/Internet/internet-test.png)

Speedtest CLI from Ookla®:

![alt text](/blog_img/selfh/Internet/SpeedTest.png)

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


## Analytics Stuff

* https://github.com/chartbrew/chartbrew
  * https://docs.chartbrew.com/deployment/run-on-docker#run-on-docker
  * https://raw.githubusercontent.com/chartbrew/chartbrew/refs/heads/master/docker-compose.yml

>  Open-source web platform used to create live reporting dashboards from APIs, MongoDB, Firestore, MySQL, PostgreSQL, and more 📈📊 

Which resonates with my recent [post on BI Tools](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/)

---

## Conclusions

Recently I saw a really cool podcast from TDOAC:

https://www.youtube.com/watch?v=Kl-I7sUcAOY

{{< youtube "Kl-I7sUcAOY" >}}

And one of the messages I got was:

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

Lately I tried littlyx, but I saw this cool post: https://jakubwolynko.eu/blog/202505-hosting-umami-on-vercel/

Also, https://github.com/Litlyx/litlyx which i discovered few months back

![alt text](/blog_img/web/weban/littlyx-weban.png)


### Automated Projects Docs

Wouldnt it be great to have a project documentation automatically and AI generated?

<!-- 
https://git.exadel.com/exadel-ai-practice/accelerator/project-documentation-generator
 -->


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

So I had to vibe code a little bit with codex to fix it:

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


Using [starlight theme](https://starlight.astro.build/getting-started/):

```sh
#npm i -g @openai/codex
npm create astro@latest -- --template starlight
# cd docs
# npm run dev
cd docs && npm run dev
```

![alt text](/blog_img/GenAI/aidocs/starlight-ai-dcs.png)

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

And this was applied also to **big repos**, like signoz with ~380mb in it or...remotion, with 4GB!

```sh
du -sh .
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