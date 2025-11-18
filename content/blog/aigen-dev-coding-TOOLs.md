---
title: "Create Apps faster with AI: GPT Engineer"
date: 2023-11-25T00:20:21+01:00
draft: false
tags: ["Gen-AI"]
description: 'Is it possible to code with AI?'
url: 'how-to-code-with-AI'
---

1. GPT-Engineer
2. GPT-Pilot
3. SmolDev

## GPT-Engineer

https://pypi.org/project/gpt-engineer/
https://github.com/gpt-engineer-org/gpt-engineer
https://github.com/gpt-engineer-org/gpt-engineer?tab=MIT-1-ov-file#readme


## GPT Engineer with (Local and Free) LLM

https://gpt-engineer.readthedocs.io/en/latest/open_models.html

* Levereging the use of **OpenAI Compatible API**, like we saw with textgenui:
* <https://gpt-engineer.readthedocs.io/en/latest/open_models.html>
    * <https://fossengineer.com/Generative-AI-LLMs-locally-with-cpu/#the-docker-container-textgenerationwebui>


## SelfHosting GPT Engineer

### GPT Engineer with Docker

\https://github.com/gpt-engineer-org/gpt-engineer/blob/main/docker/README.md


```sh
git clone https://github.com/gpt-engineer-org/gpt-engineer
cd gpt-engineer
```

With Venv:

```sh
python3 -m venv gpteng #create the venv | python3 if you are on linux

gpteng\Scripts\activate #activate venv (windows)
source gpteng/bin/activate #(linux)
```

With conda:

```sh
##conda --version
conda create -n pandasaigroqapi python=3.11
conda activate pandasaigroqapi

python -m pip install gpt-engineer #estable version
#python -m pip install -r requirements.txt #all at once

conda deactivate
```

```sh
export OPENAI_API_KEY=[your api key sk-proj-...]
```

Run it with: https://gpt-engineer.readthedocs.io/en/latest/quickstart.html

```sh
gpte projects/my-new-project
```

You will see that a folder gets created under `./projects/my-new-project`

You can iterate on the already created code:

```sh
gpte projects/my-old-project -i
```

---

<https://github.com/Pythagora-io/gpt-pilot>
https://github.com/Pythagora-io/gpt-pilot?tab=MIT-1-ov-file#readme

* <https://marketplace.visualstudio.com/items?itemName=PythagoraTechnologies.gpt-pilot-vs-code>

### CLI Version

### With GPT API

## GPT Pilot with Docker

<https://github.com/Pythagora-io/gpt-pilot?tab=readme-ov-file#-how-to-start-gpt-pilot-in-docker>

{{< dropdown title="Pre-Requisites - Get Docker! 👇" closed="true" >}}

Important step and quite recommended for any SelfHosting Project - [Get Docker Installed](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/)

It will be one command, this one, if you are in Linux:

```sh
apt-get update && sudo apt-get upgrade && curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh && docker version
```

{{< /dropdown >}}

### GPT Pilot With (FREE & Local) LLMs

* <https://github.com/Pythagora-io/gpt-pilot/blob/main/pilot/.env.example>
* <https://github.com/Pythagora-io/gpt-pilot/wiki/Using-GPT%E2%80%90Pilot-with-Local-LLMs>

We can use:

```md
# OPENAI or AZURE or OPENROUTER
ENDPOINT=OPENAI

OPENAI_ENDPOINT=http://localhost/8000 ???  #https://api.openai.com/v1/chat/completions
OPENAI_API_KEY=


# In case of Azure/OpenRouter endpoint, change this to your deployed model name
MODEL_NAME=gpt-4-1106-preview
# MODEL_NAME=gpt-4
# MODEL_NAME=gpt-3.5-turbo-16k
MAX_TOKENS=8192
```

After you have Python and (optionally) PostgreSQL installed, follow these steps:

```sh
git clone https://github.com/Pythagora-io/gpt-pilot.git (clone the repo)
cd gpt-pilot
python -m venv pilot-env (create a virtual environment)
source pilot-env/bin/activate (or on Windows pilot-env\Scripts\activate) (activate the virtual environment)
pip install -r requirements.txt (install the dependencies)
cd pilot
mv .env.example .env (or on Windows copy .env.example .env) (create the .env file)
Add your environment to the .env file:
LLM Provider (OpenAI/Azure/Openrouter)
Your API key
database settings: SQLite/PostgreSQL (to change from SQLite to PostgreSQL, just set DATABASE_TYPE=postgres)
optionally set IGNORE_FOLDERS for the folders which shouldn't be tracked by GPT Pilot in workspace, useful to ignore folders created by compilers (i.e. IGNORE_FOLDERS=folder1,folder2,folder3)
python db_init.py (initialize the database)
python main.py (start GPT Pilot)
After, this, you can just follow the instructions in the terminal.
```

## Smol-Dev

https://github.com/smol-ai/developer
https://github.com/smol-ai/developer?tab=MIT-1-ov-file#readme

> The first library to let you embed a developer agent in your own app!

scaffolds an entire codebase out for you once you give it a product spec
gives you basic building blocks to have a smol developer inside of your own app.



https://twitter.com/SmolModels


* {{< newtab url="https://.github.io//" text="The  Official Site" >}}
* {{< newtab url="https://github.com//" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com//?tab=AGPL-3.0-1-ov-file#readme" text="aGPL 3.0" >}} ❤️

---

## Conclusions

https://anakin.ai/blog/gpt-pilot/

---

## FAQ

{{< dropdown title="How to get better with our prompts? ⏬" closed="true" >}}

* https://github.com/thunlp/OpenPrompt

> An Open-Source Framework for Prompt-Learning.

{{< /dropdown >}}



### How to use GPT Engineer with F/OSS LLMs

### Other F/OSS Alternatives to GPT-Engineer

* OpenDevin - https://github.com/OpenDevin/OpenDevin
    * https://github.com/OpenDevin/OpenDevin/pkgs/container/OpenDevin
    * https://docs.all-hands.dev/modules/usage/intro

```sh
docker pull ghcr.io/opendevin/opendevin:main
```

{{< dropdown title="How to use OpenDevin With Docker ⏬" closed="true" >}}

Use it with Docker:

```sh
WORKSPACE_BASE=$(pwd)/workspace
docker run -it \
    --pull=always \
    -e SANDBOX_USER_ID=$(id -u) \
    -e WORKSPACE_MOUNT_PATH=$WORKSPACE_BASE \
    -v $WORKSPACE_BASE:/opt/workspace_base \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 3000:3000 \
    --add-host host.docker.internal:host-gateway \
    --name opendevin-app-$(date +%Y%m%d%H%M%S) \
    ghcr.io/opendevin/opendevin
```

OpenDevin will be ready at `localhost:3000`

{{< /dropdown >}}

OpenDevin is an autonomous AI software engineer capable of executing complex engineering tasks and collaborating actively with users on software development projects

> 🐚 OpenDevin: Code Less, Make More

* Devika - https://github.com/stitionai/devika (MIT Licensed ❤️)

Supports Claude 3, GPT-4, Gemini, Mistral , Groq and Local LLMs via Ollama. For optimal performance: Use the Claude 3 family of models.

> Devika is an Agentic AI Software Engineer that can understand high-level human instructions, break them down into steps, research relevant information, and write code to achieve the given objective. Devika aims to be a competitive open-source alternative to Devin by Cognition AI.


* SWE-Agent - https://github.com/princeton-nlp/SWE-agent

> SWE-agent takes a GitHub issue and tries to automatically fix it, using GPT-4, or your LM of choice. It solves 12.47% of bugs in the SWE-bench evaluation set and takes just 1 minute to run.

#### Code with Multi-Agent Frameworks

* [CrewAI](/ai-agents-crewai/)
* https://github.com/mervinpraison/PraisonAI

> PraisonAI application combines AutoGen and CrewAI or similar frameworks into a low-code solution for building and managing multi-agent LLM systems, focusing on simplicity, customisation, and efficient human-agent collaboration. Chat with your ENTIRE Codebase.

## Conclusions

### F/OSS AI Coding Assistant

* https://fossengineer.com/selfhosting-Tabby-coding-assistant/


## Coding Assistants

I personally like VSCodium - the **F/OSS version of VSCode**

### Fully Open Source IDE

* VSCodium
* LAPCE: https://github.com/lapce/lapce - Lightning-fast and Powerful Code Editor written in Rust
    * Lap Dev
    * https://lap.dev/about/
        * https://github.com/lapce/lapdev - Self-Hosted Remote Dev Environment

### No Code F/OSS - Rivet IDE

https://www.youtube.com/watch?v=Zd5wjy4YPis

* https://rivet.ironcladapp.com/
* Project Source Code: <https://github.com/ironclad/rivet>
    * License: [MIT ❤️](https://github.com/ironclad/rivet?tab=MIT-1-ov-file#readme)

* {{< newtab url="https://.github.io//" text="The  Official Site" >}}
* {{< newtab url="https://github.com//" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com//?tab=AGPL-3.0-1-ov-file#readme" text="aGPL 3.0" >}} ❤️

> The Open-Source Visual AI Programming Environment

<https://www.youtube.com/watch?v=P1PhHWK6n9I>
<https://www.youtube.com/watch?v=a45y5bmLPY8>

* https://github.com/CodedotAl/gpt-code-clippy

Overall, ClippyGPT is a promising concept that has the potential to make AI more accessible and useful for a wider range of people. However, it is important to be aware of the potential challenges associated with this technology and to use it responsibly.

<https://www.youtube.com/watch?v=Yhtjd7yGGGA>


* <https://prmpts.ai/blog/what-is-prompt-engineering>