---
title: "My Favourite ways to RAG"
date: 2025-04-10T10:20:21+01:00
draft: false
tags: ["Dev","Python"]
description: 'RAG applications. From LangChain, LLamaIndex... to MLFlow.'
url: 'comparing-rag-and-use-cases'
---


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-projects-python-dependencies/" title="Python Deps 101" >}}
{{< /cards >}}



{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/flask_sensor_display" title="Flask Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}




[![Star History Chart](https://api.star-history.com/svg?repos=langchain-ai/langchain,deepset-ai/haystack,Sinaptik-AI/pandas-ai,mlflow/mlflow,langfuse/langfuse&,type=Date)](https://star-history.com/langchain-ai/langchain&deepset-ai/haystack&Sinaptik-AI/pandas-ai&mlflow/mlflow&langfuse/langfuse&Date)


## LangChain


{{< callout type="info" >}}
And actually the build has happened faster than for streamlit Apps
{{< /callout >}}




### With Persistent ChromaDB and MD


[NLTK](https://github.com/nltk/nltk) was key!


* https://pypi.org/project/nltk/
* https://www.nltk.org/api/nltk.tag.perceptron.html


> And I almost forgot, but used it as NLP Tool


{{< filetree/container >}}
  {{< filetree/folder name="FlaskProject" >}}
    {{< filetree/file name="app.py" >}}
    {{< filetree/folder name="templates" state="open" >}}
      {{< filetree/file name="index.html" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
{{< /filetree/container >}}


![alt text](/blog_img/GenAI/chromadb-cli.png)


### Web Scrapping

https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/web

With Ollama and ChromaDB:

https://pypi.org/project/langchain-chroma/



### CSV

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Real Estate Project 1st Iteration ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/ScrewFastMoiRealEstate" title="The Source Code, using Screw Fast MIT Theme ↗" icon="book-open" >}}
{{< /cards >}}


### PDF

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Real Estate Project 1st Iteration ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/ScrewFastMoiRealEstate" title="The Source Code, using Screw Fast MIT Theme ↗" icon="book-open" >}}
{{< /cards >}}

If you are interested, you can **edit PDFs** with:

* [Inkscape](https://www.youtube.com/watch?v=z_O_casrDjM)
* [GIMP](https://www.youtube.com/watch?v=itGZ7SZAayg)
* See also: stirlingPDF,...



### Database


## LLamaIndex

https://jalcocert.github.io/JAlcocerT/using-langchain-with-pandas-df/




## PandasAI

https://jalcocert.github.io/JAlcocerT/using-langchain-with-pandas-df/


---

## Conclusions

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)


Concepts/Tools that are **veeery trendy:**

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen" title="MLFlow and LangFuse with Docker 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/#dsc-tools-for-da-projects" title="Big Data & DSc Cool Tools ↗" >}}
{{< /cards >}}

* MLFlow, LangGraph, LangFuse

* Reranking models for RAG - *As it can be done with [LocalAI](https://jalcocert.github.io/JAlcocerT/local-ai-audio/#localai-tts)!*
* Summarization Techniques: https://python.langchain.com/v0.1/docs/use_cases/summarization/
* Hypothetical Documents Embeddings: https://python.langchain.com/v0.1/docs/use_cases/query_analysis/techniques/hyde/
* MultiVector Retrieval
* ReACT fwk


### MLFlow


LangChain, LLamaindex, OpenAI... can be used together with MLFlow! https://mlflow.org/docs/latest/llms/

From this simple prompts: https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openai_mermaid.py

To This one: https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openai_t2t-o1mini.py

To....


{{< callout type="info" >}}
to finally, **GenAI observavility with MLFlow** https://github.com/mlflow/mlflow
{{< /callout >}}

![alt text](/blog_img/GenAI/mlflow-prompts.png)

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


MLflow Tracing provides LLM observability for various GenAI libraries such as OpenAI, LangChain, LlamaIndex, DSPy, AutoGen, and more. To enable auto-tracing, call mlflow.xyz.autolog() before running your models. Refer to the documentation for customization and manual instrumentation.


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sql-data-analytics/" title="MLFlow is powered by Flask! ↗ " >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/data-basics-for-data-analytics/" title=" ↗" >}}
{{< /cards >}}


![alt text](/blog_img/GenAI/langfuse-webui.png)


### BigTool

<!--
https://www.youtube.com/watch?v=3ISRS2hQlfI 
-->

{{< youtube "3ISRS2hQlfI" >}}

https://github.com/langchain-ai/langgraph-bigtool

---

## FAQ

MLflow on Databricks: Review how MLflow is integrated into Databricks for tracking machine learning experiments, managing models, and deploying them. Understand concepts like runs, experiments, and the model registry.

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


#### Groq YT Summarizer

```sh
docker pull ghcr.io/jalcocert/phidata:yt-groq:latest #:v1.1  #:latest
```

#### MultiChat

```sh
docker pull ghcr.io/jalcocert/streamlit-multichat:latest #:v1.1  #:latest
```

#### Local Deep Researcher


* https://github.com/langchain-ai/local-deep-researcher

> MIT | Fully local web research and report writing assistant


<!--
https://www.youtube.com/watch?v=sGUjmyfof4Q 
-->

{{< youtube "sGUjmyfof4Q" >}}

https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Ollama
https://fossengineer.com/selfhosting-llms-ollama/

```sh

docker run -d --name ollama -p 11434:11434 -v ollama_data:/root/.ollama ollama/ollama

docker exec -it ollama ollama --version
docker exec -it ollama sh

ollama pull deepseek-r1:8b
```

https://docs.searxng.org/dev/search_api.html


```
LLM_PROVIDER=ollama
OLLAMA_BASE_URL="http://localhost:11434" # Ollama service endpoint, defaults to `http://localhost:11434` 
LOCAL_LLM=model # the model to use, defaults to `llama3.2` if not set
```


Overview

The video explores the new fully open source reasoning model, DeepSeek-R1, which represents a new scaling paradigm for Large Language Models (LLMs). The model is trained using a combination of fine-tuning and reinforcement learning, and its training strategy is described in detail. The video also demonstrates the capabilities of the model, including its ability to reason and generate comprehensive summaries.
The Training Strategy of DeepSeek-R1

DeepSeek-R1 uses a combination of fine-tuning and reinforcement learning to produce a strong reasoning model. The first stage involves fine-tuning a strong base chat model, DeepSeek V3, on thousands of chain of thought reasoning examples. The second stage uses reinforcement learning with a rule-based reward function to score the model's outputs. The model generates 64 different attempts to solve a problem and scores each one, increasing or decreasing the probability of generating tokens based on the score. This process helps the model discover good reasoning patterns.
Filtering and Fine-Tuning

The model's outputs are filtered to get high-quality reasoning traces, which are then used for further fine-tuning. This process helps restore general model capabilities while baking in high-quality reasoning. The final stage involves a second round of reinforcement learning with different rewards, including helpfulness and harm.
Results and Distillation

The results show that DeepSeek-R1 is on par with other state-of-the-art reasoning models, including the O Series models from OpenAI. The model is also distilled into smaller models, including a 14 billion parameter model that can run on a laptop.
Playing with DeepSeek-R1

The video demonstrates the capabilities of DeepSeek-R1, including its ability to generate summaries and reason about complex topics. The model is shown to be very expressive, emitting think tokens that provide insight into its thought process. The video also explores the use of Json mode, which strips away think tokens and provides a cleaner output.
Takeaways

    DeepSeek-R1 represents a new scaling paradigm for LLMs, using reinforcement learning to discover good reasoning patterns.
    The model's training strategy involves a combination of fine-tuning and reinforcement learning, with filtering and fine-tuning to restore general capabilities.
    The model is capable of generating comprehensive summaries and reasoning about complex topics.
    The distillation of the model into smaller versions, such as the 14 billion parameter model, makes it possible to run on a laptop.
