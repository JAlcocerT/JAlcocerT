---
title: "LLMs control your PC with OpenInterpreter (and Ollama)"
date: 2024-11-28T23:20:21+01:00
draft: false
tags: ["Gen-AI","Self-Hosting","Docker","PC Control via LLM"]
description: 'A guide to use OpenInterpreter. Locally and with Free LLM Agents powered by Ollama.'
url: 'openinterpreter-ollama'
---


**Intro**

This is something that I was tinkering with in 2024.

But could not write properly.

* https://www.youtube.com/watch?v=xPd8FFzIeOw
* https://www.youtube.com/watch?v=BNgFLqBg1P0

If you ever dream about having a **natural language interface to control your computer**, that dream has become true.


### The OpenInterpreter Project


https://github.com/KillianLucas/open-interpreter/issues/856
https://github.com/jmorganca/ollama/issues/838
https://docs.openinterpreter.com/language-model-setup/local-models/custom-endpoint

* {{< newtab url="https://docs.openinterpreter.com/getting-started/introduction" text="OpenInterpreter Official Doc" >}}
* {{< newtab url="https://github.com/KillianLucas/open-interpreterref=fossengineer.com" text="OpenInterpreter Source Code at Github" >}}
    * {{< newtab url="https://pypi.org/project/open-interpreter//" text="OpenInterpreter at PyPi" >}}
    * License: {{< newtab url="https://github.com/KillianLucas/open-interpreter?tab=AGPL-3.0-1-ov-file#readme" text="aGPL v3" >}} 👏


## SelfHosting OpenInterpreter

**OpenInterpreter with Docker**


```sh
pip install open-interpreter==0.1.18
pip install open-interpreter==0.2.0

pip install litellm==1.16.7
```

```sh
apt update
apt-get install build-essential

apt install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
```


Then, just build it with:

```sh
docker build -t openinterpreter .

```

```yml
version: '3.8'

services:
  openinterpreter:
    image: openinterpreter
    container_name: aigen_openinterpreter
    # ports:
    #   - "8501:8501"
    working_dir: /app
    #command: python3 app.py
    command: tail -f /dev/null #keep it running
```


## How to use OpenInterpreter with Ollama

### Pre-Requisites

Get Ollama ready! <https://fossengineer.com/selfhosting-llms-ollama/>

<https://docs.openinterpreter.com/language-model-setup/local-models/ollama>


### OpenInterpreter & Ollama - CLI

```sh

interpreter --model ollama_chat/orca-mini:3b --api_base http://localhost:11434
```

### OpenInterpreter & Ollama - Python

```py
from interpreter import interpreter

interpreter.offline = True # Disables online features like Open Procedures
interpreter.llm.model = "openai/x" # Tells OI to send messages in OpenAI's format
interpreter.llm.api_key = "fake_key" # LiteLLM, which we use to talk to LM Studio, requires this
interpreter.llm.api_base = "http://localhost:1234/v1" # Point this at any OpenAI compatible server

interpreter.chat()
```

Powered by:

* <https://docs.llamaindex.ai/en/stable/examples/llm/ollama.html>

## Controlling the OS with Open Interpreter

```sh
interpreter --os
```


---

## FAQ

* https://github.com/openrecall/openrecall

> OpenRecall is a fully open-source, privacy-first alternative to proprietary solutions like Microsoft's Windows Recall.

With OpenRecall, you can easily access your digital history, enhancing your memory and productivity without compromising your privacy.



{{< dropdown title="A Docker Stack to try New Cool AI Projects 👇" closed="true" >}}

With this yml you can be sure that all dependencies will be isolated:

```yml
version: '3.8'

services:
  pyopeninterpreter:
    image: python:3.12-slim
    container_name: py_openinterpreter
    # ports:
    #   - "8501:8501"
    working_dir: /app
    #command: python3 app.py
    command: tail -f /dev/null #keep it running
```

Making the Python dependencies right:

```sh
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11

sudo apt-get install python3.11-distutils

python3.11 -m venv myenv --without-pip
source myenv/bin/activate
curl https://bootstrap.pypa.io/get-pip.py | python

pip install open-interpreter
pip show open-interpreter
#pip list | grep 'open'
pip list

### Run it with OpenAI
#interpreter
#interpreter --vision

#you need OpenAI Key by default - Not F/OSS
#export OPENAI_API_KEY="your_OpenAI_API_key" #setx OPENAI_API_KEY your_OpenAI_API_key
# https://platform.openai.com/docs/api-reference


### Run it locally
#pip install llama-index
#interpreter --local #this needs LMStudio which is not F/OSS
#interpreter --model ollama/orca-mini:3b --api_base http://localhost:11434
interpreter -y --model ollama/orca-mini:3b #https://github.com/jmorganca/ollama/issues/838
interpreter -y --model ollama/mistral:7b


#python3.11 -m pip --version
#python3.11 -m pip install --upgrade pip
#python3.11 -m pip install open-interpreter
```

* Which Python's I got installed?

```sh
ls -l $(which -a python python3 python2 python3.* python2.*)
#sudo find / -type f -name 'python*' -executable 2>/dev/null #Python executables
```

* And which python packages?

```sh
dpkg -l | grep python
```

{{< /dropdown >}}