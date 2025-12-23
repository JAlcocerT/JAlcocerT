---
title: "My Favourite ways to RAG"
date: 2025-04-10T10:20:21+01:00
draft: false
tags: ["Dev","Python","LLMs","GenAI","CSV vs PDF"]
description: 'RAG Applications. From LangChain, LLamaIndex... to MLFlow observability container setup.'
url: 'comparing-rag-and-use-cases'
---


**Intro**

If you are already familiar with Python:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-projects-python-dependencies/" title="Python Deps 101" >}}
{{< /cards >}}


And have been tinkering with **ways to chat with data context...**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main" title="Data Chat Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}


These should be **some familiar RAG frameworks** so far:

[![Star History Chart](https://api.star-history.com/svg?repos=langchain-ai/langchain,deepset-ai/haystack,Sinaptik-AI/pandas-ai,pydantic/pydantic-ai&,type=Date)](https://star-history.com/langchain-ai/langchain&deepset-ai/haystack&Sinaptik-AI/pandas-ai&pydantic/pydantic-ai&Date)


We will also see some [*trendy* AI tools](#conclusions) that work with RAGs as well:

* [MLFlow](#mlflow) - For observability (from ML to AI)
* [LangGraph](#langgraph-bigtool) - Programatic agents workflows. See the [docs](https://langchain-ai.github.io/langgraph/#)
* [LangFlow](#langflow) - Low code environment to build AI Apps ~ Flwise
* [LangFuse](#langfuse) - Observability for AI ~LangSmith but MIT

[![Star History Chart](https://api.star-history.com/svg?repos=mlflow/mlflow,langchain-ai/langgraph,langfuse/langfuse&,type=Date)](https://star-history.com/mlflow/mlflow&langchain-ai/langgraph&langfuse/langfuse&Date)


## LangChain


{{< callout type="info" >}}
For now, the most popular RAG framework!
{{< /callout >}}

[![shields.io Stars](https://img.shields.io/github/stars/langchain-ai/langchain)](https://github.com/langchain-ai/langchain/stargazers)


### Web Scrapping

LangChain can also help us to *chat with website content*:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/web" title="Data Chat | LangChain Web Chat Code ↗" >}}
  {{< card link="https://pypi.org/project/langchain-chroma/" title="LangChain ChromaDB | PyPi ↗" >}}
{{< /cards >}}


> In this case, With Ollama and ChromaDB.


#### With Persistent ChromaDB and MD

You can build this around a Flask webapp:

{{< filetree/container >}}
  {{< filetree/folder name="FlaskProject" >}}
    {{< filetree/file name="app.py" >}}
    {{< filetree/folder name="templates" state="open" >}}
      {{< filetree/file name="index.html" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
{{< /filetree/container >}}


![Chroma DB CLI](/blog_img/GenAI/chromadb-cli.png)


### CSV and PDF

Wherever office work you have, you will most certainly see 2 kind of files: **spreadsheets (CSVs) and pdfs**.

Thanks to langchain, we can ask information contained in both kind of files:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-csv-with-langchain/" title="LangChain CSV | Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/langchain-ask-csv" title="Repo Langchain ask CSV ↗" icon="book-open" >}}
{{< /cards >}}


For PDF's you can do:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs//" title="LangChain PDF | Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/ask-multiple-pdfs/" title="Repo LangChain ask PDFs ↗" icon="book-open" >}}
{{< /cards >}}

If you are interested, you can **edit PDFs** with:

* [Inkscape](https://www.youtube.com/watch?v=z_O_casrDjM)
* [GIMP](https://www.youtube.com/watch?v=itGZ7SZAayg)

> See also: [stirlingPDF](https://fossengineer.com/selfhosting-stirling-pdf/),...

### Database

Further into data analytics, you will want to chat directly with the content of your databases:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="LangChain PDF | Post ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-a-db-with-langchain" title="Repo LangChain ask PDFs ↗" icon="book-open" >}}
{{< /cards >}}


This can be very valuable for [real estate applications](https://jalcocert.github.io/JAlcocerT/real-estate-website/) as seen [here](https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/)

### LangChain Agents

* https://python.langchain.com/v0.1/docs/modules/agents/

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/Agents" title="LangChain Agents | Sample Script ↗" icon="book-open" >}}
{{< /cards >}}

But thats a topic beyond RAG, with Agents:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-multi-agents-frameworks/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/Multi-Agents" title="Multi Agents Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Not just LangChain, but LangGraph, OpenAI Agents..." >}}
{{< /cards >}}

## LLamaIndex

A competitor in the RAG space for Langchain is **LLamaIndex**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-langchain-with-pandas-df/#llamaindex-and-pandas-dataframes" title="LLamaIndex Pandas DF | Trip Planner Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Py_Trip_Planner/tree/main/Tests" title="Repo Trip Planner ↗" icon="book-open" >}}
{{< /cards >}}

I also learnt a lot with the chat over `.md` files with [LlamaIndex + Mem0](https://github.com/JAlcocerT/Data-Chat/tree/main/LLamaIndex/With_Mem0).


## PandasAI

This was the first RAG I heard about 2 years ago.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-langchain-with-pandas-df//" title="LangChain Pandas DF | Post ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-pandasAI/" title="PandasAI | Post ↗" icon="book-open" >}}
{{< /cards >}}


---

## Conclusions

Remember that there are already some [alternatives to RAGS: like MCP or KBLM](https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/#other-alternatives-to-rag)

For now, my favourite one is still LangChain for its various use cases:

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Data-Chat/blob/main/LangChain/web/langchain-chroma-repo-readme.ipynb)


For a simpler local RAG setup, have a look to [these](#selfhosted-rags).

### Trendy AI Concepts


Concepts / AI Tools that are **veeery trendy**, also as seen [here](https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/#dsc-tools-for-da-projects)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen" title="MLFlow and LangFuse with Docker 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/#dsc-tools-for-da-projects" title="Big Data & DSc Cool Tools ↗" >}}
{{< /cards >}}

* [MLFlow](#mlflow), [LangGraph](#langgraph-bigtool), [LangFuse](#langfuse) and...[LangFlow](#langflow)

* Reranking models for RAG - *As it can be done with [LocalAI](https://jalcocert.github.io/JAlcocerT/local-ai-audio/#localai-tts)!*
* Summarization Techniques: https://python.langchain.com/v0.1/docs/use_cases/summarization/
* Hypothetical Documents Embeddings: https://python.langchain.com/v0.1/docs/use_cases/query_analysis/techniques/hyde/
* MultiVector Retrieval
* ReACT fwk


#### MLFlow


MLflow/mlflow: Open source platform for the machine learning lifecycle

LangChain, LLamaindex, OpenAI... can all be used together with MLFlow! https://mlflow.org/docs/latest/llms/

What for?

It helps us see/observ how our LLMs are working in production.

From this simple prompts: https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openai_mermaid.py

To This one: https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openai_t2t-o1mini.py

To....


{{< callout type="info" >}}
...finally, **GenAI observavility with MLFlow** https://github.com/mlflow/mlflow
{{< /callout >}}

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/MLFlow" title="MLFlow with Docker 🐋 ↗" >}}
{{< /cards >}}

![Prompting ML Flow](/blog_img/GenAI/mlflow-prompts.png)

* https://pypi.org/project/mlflow/

```py
import mlflow

mlflow.set_tracking_uri(uri="http://<host>:<port>")
```

```sh
##pip install mlflow==2.21.3
mlflow server --host 127.0.0.1 --port 8080
```

![alt text](/blog_img/GenAI/mlflow-prompts.png)

```py
from openai import OpenAI
import mlflow
client = OpenAI(api_key="<YOUR_API_KEY>")

# Set MLflow tracking URI
mlflow.set_tracking_uri("<YOUR_TRACKING_URI>")

# Example of loading and using the prompt
prompt = mlflow.load_prompt("prompts:/RealEstate/1")
response = client.chat.completions.create(
    messages=[{
        "role": "user",
        "content": prompt.format(),
    }],
    model="gpt-4o-mini",
)

print(response.choices[0].message.content)
```


**MLflow Tracing provides LLM observability** for various GenAI libraries such as OpenAI, LangChain, LlamaIndex, DSPy, AutoGen, and more. 

To enable auto-tracing, call `mlflow.xyz.autolog()` before running your models.

Refer to the documentation for customization and manual instrumentation.


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sql-data-analytics/" title="MLFlow is powered by Flask! ↗ " >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/data-basics-for-data-analytics/" title=" ↗" >}}
{{< /cards >}}


![Langfuse Web UI](/blog_img/GenAI/langfuse-webui.png)


#### LangGraph BigTool

**LangGraph** is a Python library for building stateful, multi-agent systems and **complex conversational workflows**.

* https://github.com/langchain-ai/langgraph
  * https://github.com/JAlcocerT/Multi-Agents/tree/main/LangGraph

> MIT |  Build resilient language agents as graphs. 

The LangGraph library enables **agent orchestration** — offering customizable architectures, long-term memory, and human-in-the-loop to reliably handle complex tasks.

<!-- https://github.com/langchain-ai/langgraph-bigtool/blob/main/static/img/graph.png -->

![Streamlit MultiChat](https://github.com/langchain-ai/langgraph-bigtool/raw/main/static/img/graph.png)

{{< callout type="info" >}}
It provides a more **programmatic and flexible way to define the interactions** and state transitions between multiple agents or steps in a sophisticated AI application.
{{< /callout >}}

<!--
https://www.youtube.com/watch?v=3ISRS2hQlfI 
-->

{{< youtube "3ISRS2hQlfI" >}}

* https://github.com/langchain-ai/langgraph-bigtool

>  Build LangGraph agents with large numbers of tools 

#### LangFlow

Langflow's primary strength lies in its **visual, low-code environment** for building AI applications, especially those leveraging LLMs and LangChain.


{{< callout type="info" >}}
[Langflow](https://github.com/IoTechCrafts/langflow) simplifies the creation of complex **multi-agent/RAG LangChain workflows via UI**
{{< /callout >}}

<!-- 
* https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LangFlow
* https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs/#langflow 
-->

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LangFlow" title="LangFlow with Docker 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs/#langflow" title="Got to know aobut LangFlow sometime ago | Post 🐋 ↗" >}}
{{< /cards >}}

```sh
docker run -it --rm -p 7860:7860 langflowai/langflow:latest
```

![LangFlow Store](/blog_img/GenAI/NoCode-AI/LangFlow_Store.png)


#### LangFuse

[LangFuse](https://github.com/langfuse/langfuse) is an Equivalent to LangSmith for observability but MIT and selfhostable

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LangFuse" title="LangFuse with Docker 🐋 ↗" >}}
{{< /cards >}}


---

## FAQ

MLflow on Databricks: Review how MLflow is integrated into Databricks for tracking machine learning experiments, managing models, and deploying them.

Understand concepts like runs, experiments, and the model registry.

### AI Keys

Lately I have been using:

* https://claude.ai/
* https://console.anthropic.com/workbench/
* https://console.groq.com/keys
* https://platform.openai.com/api-keys

### GEN AI Techniques

* Fundamentals of Neural Networks: Understand the architecture and training of deep neural networks.
* Generative Adversarial Networks (GANs): Basic understanding of how GANs work for generating synthetic data or other creative outputs.
* Variational Autoencoders (VAEs): Another type of generative model.
* Transformer Networks: Deep dive into the architecture of Transformers, which are the foundation for many state-of-the-art NLP and generative models (e.g., BERT, GPT).
* Large Language Models (LLMs): Understand the capabilities and limitations of LLMs and how they can be applied to HR-related tasks.


See how to run **LangGraph or MLFlow**

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/#dsc-tools-for-da-projects" title="DSc Tools for DA Projects ↗ " >}}
{{< /cards >}}

### AI Apps Im SelfHosting

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Project_AIs" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/flask_sensor_display" title="Flask Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

#### SelfHosted RAGs

1. PrivateGPT

https://github.com/zylon-ai/private-gpt
https://docs.privategpt.dev/overview/welcome/introduction


2. QUIVIR - https://github.com/QuivrHQ/quivr

> Opiniated RAG for integrating GenAI in your apps 🧠 Focus on your product rather than the RAG. Easy integration in existing products with customisation! Any LLM: GPT4, Groq, Llama. Any Vectorstore: PGVector, Faiss. Any Files. Anyway you want. 

#### Groq YT Summarizer

```sh
docker pull ghcr.io/jalcocert/phidata:yt-groq:latest #:v1.1  #:latest
```

#### MultiChat

```sh
docker pull ghcr.io/jalcocert/streamlit-multichat:latest #:v1.1  #:latest
```

#### Local Deep Researcher

A very interesting project that makes web searches and summarizes them:

* https://github.com/langchain-ai/local-deep-researcher
  * https://github.com/JAlcocerT/local-deep-researcher/

> MIT | Fully local web research and report writing assistant


<!--
https://www.youtube.com/watch?v=sGUjmyfof4Q 
-->

{{< youtube "sGUjmyfof4Q" >}}

Setup Ollama as per:

* https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Ollama
* https://fossengineer.com/selfhosting-llms-ollama/

```sh

docker run -d --name ollama -p 11434:11434 -v ollama_data:/root/.ollama ollama/ollama

docker exec -it ollama ollama --version
docker exec -it ollama sh

ollama pull deepseek-r1:8b
```

* https://docs.searxng.org/dev/search_api.html


Make sure to adapt the `.env`:


```
LLM_PROVIDER=ollama
OLLAMA_BASE_URL="http://localhost:11434" # Ollama service endpoint, defaults to `http://localhost:11434` 
LOCAL_LLM=model # the model to use, defaults to `llama3.2` if not set
```


{{< details title="YT Vid Summarized with Groq | Local Deep Researcher📌" closed="true" >}}

> Summarized with [this groq project](https://jalcocert.github.io/JAlcocerT/summarize-yt-videos/).

The video explores the new fully open source reasoning model, DeepSeek-R1, which represents a new scaling paradigm for Large Language Models (LLMs).

The model is trained using a combination of fine-tuning and reinforcement learning, and its training strategy is described in detail. The video also demonstrates the capabilities of the model, including its ability to reason and generate comprehensive summaries.

The Training Strategy of DeepSeek-R1

DeepSeek-R1 uses a combination of fine-tuning and reinforcement learning to produce a strong reasoning model. 

The first stage involves fine-tuning a strong base chat model, DeepSeek V3, on thousands of chain of thought reasoning examples. 

The second stage uses reinforcement learning with a rule-based reward function to score the model's outputs. 

The model generates 64 different attempts to solve a problem and scores each one, increasing or decreasing the probability of generating tokens based on the score.

This process helps the model discover good reasoning patterns.


Filtering and Fine-Tuning

The model's outputs are filtered to get high-quality reasoning traces, which are then used for further fine-tuning. 

This process helps restore general model capabilities while baking in high-quality reasoning. The final stage involves a second round of reinforcement learning with different rewards, including helpfulness and harm.

Results and Distillation

The results show that DeepSeek-R1 is on par with other state-of-the-art reasoning models, including the O Series models from OpenAI. 

The model is also distilled into smaller models, including a 14 billion parameter model that can run on a laptop.

Playing with DeepSeek-R1

The video demonstrates the capabilities of DeepSeek-R1, including its ability to generate summaries and reason about complex topics. 

The model is shown to be very expressive, emitting think tokens that provide insight into its thought process. 

The video also explores the use of Json mode, which strips away think tokens and provides a cleaner output.

{{< /details >}}


Takeaways:

1. DeepSeek-R1 represents a new scaling paradigm for LLMs, using reinforcement learning to discover good reasoning patterns.
2. The model's training strategy involves a combination of fine-tuning and reinforcement learning, with filtering and fine-tuning to restore general capabilities.
3. The model is capable of generating comprehensive summaries and reasoning about complex topics.
4. The distillation of the model into smaller versions, such as the 14 billion parameter model, makes it possible to run on a laptop.


### RAG x Ollama


Ollama makes it easy to get up and running with large language models locally. It is **like Docker for managing LLMs**.

With [modelfile](https://github.com/Decentralised-AI/ollama/blob/main/docs/modelfile.md), it creates a [profile](https://github.com/Decentralised-AI/ollama/tree/main/examples) of a model: **ollama create your_model_profile -f ./testmodelfile**

```sh
ollama run testmodelfile
```

Install it with docker or with CLI:

* <https://hub.docker.com/r/ollama/ollama>
* <https://gpt-index.readthedocs.io/en/stable/examples/llm/ollama.html>


{{< details title="Using Ollama with RAGs 📌" closed="true" >}}


```sh
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
podman run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

```sh
#sudo systemctl status ollama
#sudo systemctl stop ollama
```

```yml
#version: '3'
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

{{< /details >}}