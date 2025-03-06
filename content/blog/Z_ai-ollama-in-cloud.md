---
title: "Cool AI things with Ollama"
date: 2025-12-31
draft: true
tags: ["Dev","Python"]
description: 'How to use Ollama - Ollama WebUI Setup'
summary: 'How I Test AI Projects'
url: 'ollama-cloud-deployment'
---

## Large Language Models (LLMs)

- [StreamingLLM Framework](https://www.reddit.com/r/LocalLLaMA/comments/16xzxwv/streamingllm_a_simple_and_efficient_framework/)
- [Best 13B LLM Models Discussion](https://www.reddit.com/r/LocalLLaMA/comments/16s701v/this_is_one_of_the_best_13b_models_ive_tested_for/)

* <https://ollama.ai/>
* <https://github.com/jmorganca/ollama>
  * <https://hub.docker.com/r/ollama/ollama>

* 👉 <https://www.youtube.com/watch?v=rIRkxZSn-A8>
* <https://www.youtube.com/watch?v=MGr1V4LyGFA>

```yml
version: '3'
services:
  ollama:
    image: ollama/ollama:latest #0.1.17
    container_name: ollama
    ports:
      - "11434:11434" #Could also be any free local port like 9999:11434
    volumes:
      - ai_ollama_data:/root/.ollama

volumes:
  ai_ollama_data:



ollama run orca-mini:3b


#http://localhost:11434/
#    #network_mode: host      
```

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

https://github.com/open-webui/open-webui


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

https://github.com/janhq/jan

> AGPLv3 |  Jan is an open source alternative to ChatGPT that runs 100% offline on your computer 




---

## FAQ

### How to Enhance a Raspberry Pi for AI

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

NPUs are often integrated into mobile processors from companies like Apple, Huawei, and Samsung. They are also available as standalone chips from some manufacturers.