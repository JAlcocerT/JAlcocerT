---
title: "Selfhosting local LLMs x GenBI"
date: 2026-05-01
draft: false
description: "How to use Ollama - With WrenAI, Rill and Vanna in Ubuntu 26 LTS"
tags: ["Home-Lab x x300 x ext4","Gen-AI","Proton vs Euria vs Kimi vs Deepseek","TTS","Docker Model Run"]
---

**Tl;DR**

LocalModels: with Docker

<!-- 
https://www.youtube.com/watch?v=tYg6T_DAP-k
-->

{{< youtube "tYg6T_DAP-k" >}}


**Intro**

Running LLMs locally, even on a [PI](#how-to-enhance-a-raspberry-pi-for-ai), should not be a problem in 2025.

https://jalcocert.github.io/JAlcocerT/where-to-deploy/

```sh
sudo docker compose -f ./z-homelab-setup/evolution/2605_docker-compose.yml logs -f ollama
```

## Large Language Models (LLMs)

- [StreamingLLM Framework](https://www.reddit.com/r/LocalLLaMA/comments/16xzxwv/streamingllm_a_simple_and_efficient_framework/)
- [Best 13B LLM Models Discussion](https://www.reddit.com/r/LocalLLaMA/comments/16s701v/this_is_one_of_the_best_13b_models_ive_tested_for/)

* <https://ollama.ai/>
* <https://github.com/jmorganca/ollama>
  * <https://hub.docker.com/r/ollama/ollama>

* 👉 <https://www.youtube.com/watch?v=rIRkxZSn-A8>
* <https://www.youtube.com/watch?v=MGr1V4LyGFA>



## Ollama What?

Ollama makes it easy to get up and running with large language models locally. It is **like Docker for managing LLMs**.

With [modelfile](https://github.com/Decentralised-AI/ollama/blob/main/docs/modelfile.md), it creates a [profile](https://github.com/Decentralised-AI/ollama/tree/main/examples) of a model: **ollama create your_model_profile -f ./testmodelfile**

```sh
ollama run testmodelfile
```

Install it with docker or with CLI:

* <https://hub.docker.com/r/ollama/ollama>
* <https://gpt-index.readthedocs.io/en/stable/examples/llm/ollama.html>

```sh
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
podman run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

```sh
#sudo systemctl status ollama
#sudo systemctl stop ollama
```


```yml
version: '3'
services:
  ollama:
    image: ollama/ollama:latest #0.1.17
    container_name: ollama
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama

volumes:
  ollama_data:
```

```sh
curl https://ollama.ai/install.sh | sh
#netstat -tuln
#ss -tulnp | grep ':11434'
```

## CPU only

```sh
ollama --version #0.1.8

ollama run orca-mini:3b
ollama run wizardcoder:13b-python
#https://ollama.ai/library/sqlcoder
ollama run codellama

ollama list
```

## OpenWebUI

* https://github.com/open-webui/open-webui


## REST API

<https://github.com/jmorganca/ollama/blob/main/docs/api.md>

```sh
curl -X POST http://localhost:11434/api/generate -d '{"model": "orca-mini:3b", "prompt":"What is a large language model?"}'

curl http://localhost:11434/api/generate -d '{
  "model": "orca-mini:3b",
  "prompt":"Why is the sky blue?"
}'

curl http://localhost:11434/api/generate -d '{
  "model": "orca-mini:3b",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```

```sh
curl http://localhost:11434/api/generate -d '{
  "model": "orca-mini:3b",
  "prompt": "what is docker?",
  "stream": false
}' | grep -o '"response":"[^"]*' | cut -d'"' -f4

```

## With Python - llama-index

<https://docs.llamaindex.ai/en/stable/examples/llm/ollama.html>

## Ollama + Home Assistant

<https://community.home-assistant.io/t/custom-integration-ollama-conversation-local-ai-agent/636103/7>
<https://github.com/ej52/hass-ollama-conversation>

## Custom Roles

```sh
ollama create mymodel -f ./Modelfile
ollama list
ollama run mymodel
```

## Ollama with LangChain

* 👉 <https://www.youtube.com/watch?v=k_1pOF1mj8k>

```dockerfile
FROM orca-mini:3b

PARAMETER temperature 0.5

SYSTEM """
You are an expert software developer. Answer as a software developer, my assitant, only.
"""
```


Ollama with a RAG: llama-index

```py
#https://www.youtube.com/watch?v=k_1pOF1mj8k



#sudo systemctl status ollama
#sudo systemctl stop ollama

#ollama list
#ollama run orca-mini:3b




#deepseek-coder:6.7b-base 

###
#https://pypi.org/project/llama-index/
#https://docs.llamaindex.ai/en/stable/examples/llm/ollama.html
###

### Install the Package
#pip install llama-index
#pip show llama-index

### Ollama with orca-mini:3b is running in Ollama's Docker container and the just execute the Python script
#python3 ollama-langchain.py


from llama_index.llms import Ollama
llm = Ollama(model="orca-mini:3b") 
print(llm.complete("What is a vector database?"))
```

---

## Ollama Alternatives

### JAN

* https://github.com/janhq/jan

> AGPLv3 |  Jan is an open source alternative to ChatGPT that runs 100% offline on your computer 

### 




## Conclusions

For a daily driver OS, ZORIN 18 is working nicely for me.

But it was about time to do a format C to [my x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/).

So...why not trying ubuntu `26.04 LTS` that has recently been [released](https://releases.ubuntu.com)?

* https://ubuntu.com/about/release-cycle
* https://releases.ubuntu.com

I gave it a try first via: *then, added to my usb drive with Ventoy and the other OS's*

```sh
#sudo apt install gnome-boxes
gnome-boxes
```

Once ready, you can use the scripts at my repo to install all the goodies for your server:

```sh
sudo apt install git
git config --global user.name "JAlcocerT"
git config --global user.email "JAlcocerT"

#flatpak install flathub app.zen_browser.zen
git clone https://github.com/JAlcocerT/Home-Lab

#sudo ./z-benchmarks/Benchmark_101.sh
#for a homelab that you wont use desktop, you are good to go with this
sudo ./z-desktop-x-homelab/Linux_Setup_101.sh #You are good to go with browsers OBS tailscale etc
```

Get back to work with:

```sh
#curl -LsSf https://astral.sh/uv/install.sh | sh
uv --version
uv python list #https://docs.astral.sh/uv/guides/install-python/
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/home-lab" title="home-lab | Repo ↗" icon="github" >}}
{{< /cards >}}

This was also an opportunity to do a format on the 1TB drive [where I tried umbrelOS](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#selfhosted-adventures) with a [btc node](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#big-data-analytics-with-on-chain-data).

> Umbrel (the btc node mostly) took ~837GB!

Lets make some space: *formatting a 1TB drive as ext4 and adding it to [my x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/) as permanent additional storage*

```sh
lsblk -o NAME,SIZE,MODEL,TYPE,FSTYPE
#lsblk -d -o NAME,SIZE,MODEL,TYPE
#lsblk -f
du -sh /media/jalcocert/1234-fb02-4e46-948d-abcdef134567/* #see those 837gb
#for just a linux drive, ext4 seems to be the best option and will allow for nextcloud to have its data folder there
#sudo umount /dev/sda1
## different tool, 'parted' is easier for scripting/one-liners than fdisk
#sudo parted /dev/sda --script mklabel gpt
#sudo parted /dev/sda --script mkpart primary ext4 0% 100%
# -L assigns a label
# /dev/sda1 is the new partition we just made
#sudo mkfs.ext4 -L data1tb /dev/sda1
lsblk -f /dev/sda
sudo mkdir -p /mnt/data1tb/nextcloud/db && sudo chown -R 1000:1000 /mnt/data1tb/nextcloud/db
```

> Once this is done, download the mobile nc app and `More -> settings -> auto upload`

If you dont know who are you connected to:

```sh
#ip neigh #see other devices connected to the same router
ip route | grep default
#default via 192.168.0.1 dev wlp3s0 proto dhcp metric 600 
```

See other *local devices* connected to the same router:

```sh
ip neigh
```

You can check these selfhosted and Linux docs.

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-perform-free-web-audit" title="Web Audits 101 x BlogSpot | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-perform-free-web-audit" title="Web Audits 101 x BlogSpot | Post ↗" >}}
{{< /cards >}}

Or reach out for doubts:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
{{< /cards >}}

### About Protocols

Is ADL the next big thing after MCP eating the context windows?

* https://github.com/nextmoca/adl
* https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents

ADL (Agent Definition Language) is an open source, vendor‑neutral spec for describing what an AI agent is and is allowed to do, so the same agent definition can be inspected, versioned, audited, and reused across different platforms and runtimes. 

## Core idea

- ADL solves fragmentation where each team or vendor defines “agents” differently (YAML, ad‑hoc JSON, in‑code configs), which hurts governance, security, portability, and audits. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- It provides a single declarative file that captures an agent’s purpose, tools, retrieval (RAG) sources, LLM config, permissions, dependencies, and governance metadata. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

What ADL is

An ADL file describes, in JSON/JSON‑compatible form: [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

- **Agent metadata**: name, description, role, owner, version, lifecycle timestamps. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- **LLM configuration**: provider, model, temperature, max tokens, provider‑specific params. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- **Tools**: callable functions with names, params, types, invocation mode (python_function, http, mcp, etc.), optional return schemas and categories. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- **RAG inputs**: indices/corpora (docs, code, images) with paths, types, locations, and metadata. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- **Permissions**: allowed file paths, network domains, env vars, sandbox limits. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- **Dependencies**: packages and versions, referenced code. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- **Governance & audit**: who created/updated it, when, and why, aligned with SemVer. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

Analogy: OpenAPI defines HTTP APIs and Terraform defines infra; **ADL is the contract for agents**. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

What ADL is not

ADL only covers static definition, not runtime behavior: [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

- Not agent‑to‑agent protocol (A2A) for messaging/coordination. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- Not a runtime tool protocol like MCP (how tools are called/streamed). [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- Not OpenAPI (HTTP interface spec) and not a workflow engine (Airflow, Temporal, etc.). [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- Not a prompt format or wire/RPC protocol. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

It is meant to sit alongside A2A, MCP, OpenAPI, and workflow systems as the **definition layer** of the agent stack. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

ADL is a spec for describing an agent; RAG and similar tools are mechanisms an agent can use. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

## Role in the stack

- ADL is a **definition layer**: it declares an agent’s goal, tools, RAG sources, permissions, and model config in a portable, vendor‑neutral file. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- RAG, MCP, workflows, OpenAPI, etc., are **implementation layers**: they govern how the agent actually retrieves data, calls tools, or runs steps at runtime. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

## ADL vs RAG

- RAG is a pattern: chunk, embed, and retrieve documents/code/images to augment prompts, implemented via vector DBs and retrieval libraries. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- ADL does not replace RAG; instead, it describes which RAG indices/corpora an agent may access, where they live, and with what metadata and constraints. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- Put differently: RAG answers “how do we fetch context at runtime?”, while ADL answers “which RAG sources is this agent allowed to use and under what configuration?”. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

## ADL vs tool protocols (e.g., MCP)

- Tool protocols like MCP define **how** an agent talks to tools: streaming, message formats, error handling. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- ADL defines **what** tools exist for a given agent: names, parameter schemas, invocation mode (python_function, http, mcp), and categories. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- You can use MCP and RAG under the hood, while ADL sits above them as the declarative contract that a security or platform team can inspect and version‑control. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)

## Governance advantage

- Existing RAG setups and tool registries are often scattered across YAML, code, and infra; ADL centralizes all that into one inspectable artifact. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)
- This makes it easier to audit “what can this agent possibly do or access?” than with ad‑hoc RAG configs or per‑framework agent definitions. [nextmoca](https://www.nextmoca.com/blogs/agent-definition-language-adl-the-open-source-standard-for-defining-ai-agents)


# AI agents

**Semantic Kernel** (likely what you meant by "symantec kernal," as no Symantec product matches this term) is Microsoft's open-source SDK for building AI agents and integrating large language models (LLMs) into apps using C#, Python, or Java. It uses a central "kernel" to orchestrate semantic functions (natural language prompts), native code functions, memory, and planners for tasks like chaining prompts or agent workflows. [leanware](https://www.leanware.co/insights/langchain-vs-semantic-kernel-which-ai-framework-is-right-for-your-next-project)

## Core Features
- Supports prompt engineering, retrieval-augmented generation (RAG), memory stores, and multi-agent collaboration. [nuget](https://www.nuget.org/packages/Microsoft.SemanticKernel)
- Enterprise-focused with Azure integrations, telemetry, dependency injection, and strong .NET support. [zenvanriel](https://zenvanriel.nl/ai-engineer-blog/semantic-kernel-vs-langchain/)
- Lightweight and modular for production apps, including streaming and planning. [leanware](https://www.leanware.co/insights/langgraph-vs-semantic-kernel)

## Framework Comparison

| Aspect          | Semantic Kernel  [zenvanriel](https://zenvanriel.nl/ai-engineer-blog/semantic-kernel-vs-langchain/) | LangChain  [turing](https://www.turing.com/resources/ai-agent-frameworks) | LangGraph  [turing](https://www.turing.com/resources/ai-agent-frameworks) | AutoGen  [bravent](https://www.bravent.net/en/news/revolutionizing-ai-development-microsofts-agentic-frameworks-autogen-and-semantic-kernel/) |
|-----------------|----------------------------------|--------------------------|---------------------------|--------------------------|
| **Primary Languages** | C#, Python, Java | Python (JS/TS) | Python, JS | Python |
| **Architecture** | Kernel-centric plugins, planners | Chains/expressions (LCEL) | Graph-based nodes/edges | Multi-agent conversations |
| **Strengths** | Enterprise .NET/Azure, governance | Vast integrations, RAG tools | Stateful workflows, checkpoints | Agent collaboration, code execution |
| **Best For** | Copilots in Microsoft ecosystems  [leanware](https://www.leanware.co/insights/langchain-vs-semantic-kernel-which-ai-framework-is-right-for-your-next-project) | Rapid prototyping, diverse LLMs  [zenvanriel](https://zenvanriel.nl/ai-engineer-blog/semantic-kernel-vs-langchain/) | Complex, visual agent graphs  [leanware](https://www.leanware.co/insights/langgraph-vs-semantic-kernel) | Autonomous multi-agent teams  [bravent](https://www.bravent.net/en/news/revolutionizing-ai-development-microsofts-agentic-frameworks-autogen-and-semantic-kernel/) |
| **Weaknesses** | Fewer community examples | Can be complex/heavy  [zenvanriel](https://zenvanriel.nl/ai-engineer-blog/semantic-kernel-vs-langchain/) | Steeper for simple tasks | Less structured for single agents  [linkedin](https://www.linkedin.com/pulse/unlocking-ai-orchestration-exploring-semantic-kernel-its-choudhury-patnc) |

Semantic Kernel suits structured enterprise apps, while LangChain/LangGraph excel in flexible Python workflows, and AutoGen in collaborative agents. [zenml](https://www.zenml.io/blog/semantic-kernel-alternatives)

---

## FAQ

### AI x Data

* https://github.com/chartbrew/chartbrew

* https://github.com/vanna-ai/vanna

vanna-ai/vanna: 🤖 Chat with your SQL database 📊. Accurate Text-to-SQL Generation via LLMs using Agentic Retrieval 🔄.

Rill or WrenAI


### Custom Chats

* https://github.com/assistant-ui/assistant-ui

> MIT | Typescript/React Library for AI Chat💬🚀

### TTS

TTS is always interesting.

But I dont have much time to act on it.

I just got to know recently about:

* https://huggingface.co/kyutai/pocket-tts

### How to Enhance a Raspberry Pi for AI

You can do same thing I explain with my x300 in your Pis, miniPCs or cloud/VPS.

* Edge TPU on RPi - Coral Edge TPU (Tensor Processing Unit - an USB acccelerator )

TPU (Tensor Processing Unit)?

Focus: TPUs are specifically **designed for running Google's TensorFlow** machine learning framework. They are optimized for high-performance matrix multiplication, a fundamental operation in many deep learning algorithms.

Architecture: TPUs are **custom-designed by Google** with a focus on maximizing performance for TensorFlow workloads. They prioritize speed and efficiency for specific tasks within the TensorFlow ecosystem.

> You will hear more and more about NPU - Neural Processing Units


While both are designed to **handle AI workloads**, they have distinct differences in their focus, architecture, and availability.

NPUs are designed to mimic the structure and function of the human brain, excelling at tasks that involve large-scale parallel processing.

They are particularly well-suited for **various AI applications**, including:

- 🖼️ Image recognition
- 💬 Natural language processing
- 🗣️ Speech recognition

NPUs typically utilize a manycore architecture with specialized instructions and data formats optimized for AI algorithms. This allows them to handle complex neural networks efficiently.

NPUs are often integrated into mobile processors from companies like Apple, Huawei, and Samsung. 

They are also available as standalone chips from some manufacturers.