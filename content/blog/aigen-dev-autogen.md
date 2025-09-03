---
title: "Autogen + Ollama: Selfhosting Local LLM Agents with UI"
date: 2025-11-23T23:20:21+01:00
draft: false
tags: ["Gen-AI","Self-Hosting","Docker"]
# cover:
#     image: "https://socialify.git.ci/louislam/dockge/image?language=1&name=1&theme=Auto" # image path/url 
#     alt: "Dockge Docker" # alt text
#     caption: "How to setup Dockge to Manage Containers" # display caption under cover
    #image: "/img/SelfHosting/nginx.png"
    # image: "https://gist.githubusercontent.com/JAlcocerT/c043e6645a8786f55640e5fbccbaea00/raw/e6b63338bb64395db6076cfef72b14ce90dc9ae2/focalboard.JPG" # image path/url
    # image: "https://socialify.git.ci/fail2ban/fail2ban/image?description=1&language=1&name=1&pattern=Brick%20Wall&stargazers=1&theme=Auto" # image path/url   
description: 'Using Autogen with Ollama to create Local Conversating Agents for free.'
url: 'autogen-with-docker'    
---


SelfHosting Conversating Agens with Autogen & Ollama for free - GPT4 Code Interpreter F/OSS Alternative


<!-- https://www.youtube.com/watch?v=7e8qBIZqmh8 
https://www.youtube.com/watch?v=byPbxEH5V8E
-->

> Multi-Agent Workflows

### The Autogen Project

**AutoGen is a F/OSS framework** that enables the development of LLM applications using multiple agents that can converse with each other to solve tasks.

AutoGen agents are customizable, conversable, and seamlessly allow human participation.

* {{< newtab url="https://microsoft.github.io/autogen//" text="The Autogen Site" >}}
* {{< newtab url="https://github.com/microsoft/autogen" text="The  Code at Github" >}}
    * License: {{< newtab url="https://github.com/microsoft/autogen/blob/main/LICENSE" text="MIT" >}} ❤️

**AutoGen Studio** is an AutoGen-powered AI app (user interface) to help you rapidly prototype AI agents, enhance them with skills, compose them into workflows and interact with them to accomplish tasks. It is built on top of the AutoGen framework, which is a toolkit for building AI agents.

* https://github.com/microsoft/autogen/tree/main/samples/apps/autogen-studio
* https://microsoft.github.io/autogen/blog/2023/12/01/AutoGenStudio/

<!-- <https://fossengineer.com/selfhosting-llms-ollama/> 
https://www.youtube.com/watch?v=HN96PTdiseo  -->

#### Why Autogen?

They can operate in various modes that employ combinations of LLMs, human inputs, and tools.

<!-- The [Autogen Project]() and the code is [Open Source](). -->

The Autogen package in [PyPI](https://pypi.org/project/pyautogen/).


```sh
pip install pyautogen==0.1.14
#pip show pyautogen


pip install --upgrade streamlit reflex
pip install webencodings

pip install beautifulsoup4
pip install bleach nbconvert

pip install pexpect #for jupyter
```

#### Autogen with Ollama

Get [Ollama running](https://fossengineer.com/selfhosting-llms-ollama).


#### Autogen + Autogen Studio

```sh
pip install autogenstudio
autogenstudio ui --port 8007
```

```yml
version: '3'

services:
  autogen:
    image: python:3.11-slim
    container_name: autogen
    command: tail -f /dev/null
    volumes:
      - ai_autogen:/app
    working_dir: /app  # Set the working directory to /app
    ports:
      - "8007:8001"

volumes:
  ai_autogen:
```

---

## FAQ

How to include HTTPs to AutogenStudio?

### Other F/OSS Multi-Agent Projects

* https://github.com/lavague-ai/LaVague

>  Large Action Model framework to develop AI Web Agents 

The Lavague project is about automating web interactions using large language models (LLMs). 

**Open-source Text2Action** AI pipeline to turn natural language into Selenium code

### F/OSS prompt management & versioning tools

- Pezzo: https://github.com/pezzolabs/pezzo

- Agenta: https://github.com/Agenta-AI/agenta

> https://github.com/tensorchord/Awesome-LLMOps?tab=readme-ov-file#llmops