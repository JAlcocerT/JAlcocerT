---
title: "Embedchain: Open Source RAG Framework"
date: 2024-02-10T23:20:21+01:00
draft: false
cover:
  image: "https://socialify.git.ci/mem0ai/mem0/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"
  alt: "Embechain Python" # alt text
  caption: "Exploring EmbedChain with Python." # display caption under cover
tags: ["Gen-AI","Self-Hosting","Docker"]
description: 'How to use Embedchain locally (or not). Get context from websites.'
summary: 'Guide to SelfHost your LLMs combined EmbedChain RAG Framework.'    
url: 'embedchain-ai'
---

The [**Embedchain** Project](#the-embedchain-project) allows us to utilize a combination of resources from various sources.

**EmbedChain** Focuses on Data Management and LLM Integration -  It excels at personalizing LLM responses by creating data embeddings that are tailored to the specific application.

It prepares data for LLMs, generates embeddings, and simplifies the process of interacting with LLMs.

- 🎯 **Today's Objective**: 
    - Explore how to install **[Embedchain in an isolated environment](#installing-embedchain)** to facilitate the proper self-hosting of AI applications.
    - How to use [EmbedChain with Ollama](#with-ollama-locally)
    - Along the way, you will understand [what are **RAGs** and why they matter](#understanding-retrieval-augmented-generation) for AI Apps.
- These are the **embedchain key components**:
    - **Data Sources**: Harness a wide array of data sources as outlined in the Embedchain documentation. {{< newtab url="https://docs.embedchain.ai/components/data-sources/overview" text="Data Sources Overview" >}} combined with various models.
    - **Models**: Access multiple models, including local and private ones like Ollama and GPT4All, for diverse applications. {{< newtab url="https://docs.embedchain.ai/components/llms" text="Explore the Models" >}}
    - **Hugging Face Support**: The project also includes support for models from Hugging Face, expanding its versatility. {{< newtab url="https://docs.embedchain.ai/components/llms#hugging-face" text="Hugging Face Integration" >}}
    - **Vector Databases**: Leverage vector databases integral to handling large datasets effectively. {{< newtab url="https://docs.embedchain.ai/components/vector-databases" text="Vector Databases" >}}
    - **Embedding Models**: Utilize sophisticated embedding models for advanced data processing and analysis. {{< newtab url="https://docs.embedchain.ai/components/embedding-models" text="Embedding Models" >}}

This structure offers a clear, organized view of the resources and features available through the Embedchain Project, enhancing navigation and understanding for readers.


<!-- * {{< newtab url="https://docs.embedchain.ai/get-started/quickstart" text="The Official EmbedChain Docs Site" >}}
* {{< newtab url="https://github.com/embedchain/embedchain" text="The EmbedChain Code at Github" >}}
    * License: {{< newtab url="https://github.com/embedchain/embedchain?tab=Apache-2.0-1-ov-file#readme" text="Apache 2.0" >}}  -->

### The EmbedChain Project

- **Embedchain Key Features:** 🔗
    - **Data Streamlining:** Simplifies managing unstructured data for training and personalizing LLMs. Segments data, generates embeddings, and stores them in a vector database for efficient retrieval.
    - **Personalization Capabilities:** Enables personalized responses by feeding the LLM with user-specific data embeddings.
    - **Ease of Use:** Emphasizes a "conventional but configurable" approach, catering to both software engineers and machine learning specialists. Offers a user-friendly interface and configuration options for specific needs.

* And **EmbedChain is completely Open**:
    * {{< newtab url="https://docs.embedchain.ai/get-started/quickstart" text="EmbedChain Docs" >}}
    * {{< newtab url="https://github.com/embedchain/embedchain/" text="The EmbedChain Code at Github" >}}
        * License: {{< newtab url="https://github.com/embedchain/embedchain?tab=Apache-2.0-1-ov-file#readme" text="Apache 2.0" >}} ✅


## Installing EmbedChain

<!--     
https://www.pepy.tech/projects/embedchain 
* License: {{< newtab url="https://libraries.io/pypi/embedchain" text="Apache 2.0" >}} -->

* We just need: {{< newtab url="https://pypi.org/project/embedchain/" text="The embedchainpackage at PyPi" >}}
* And install the [Python (and the dependencies) properly](https://fossengineer.com/python-dependencies-for-ai/)

### Conda

`https://docs.conda.io/projects/miniconda/en/latest/`

```sh
conda --version
# conda create --name embedchain python=3.11
# conda activate embedchain
conda install numpy
```

### Venv

```sh
# !python -m venv embedchain_venv
#Unix
#!source embedchain_venv/bin/activate
#Windows
#.\embedchain_venv\Scripts\activate

#deactivate

#Get-ExecutionPolicy
#Set-ExecutionPolicy RemoteSigned
#Set-ExecutionPolicy Restricted

!pip install embedchain
```

If you do `pip show embedchain` - you will see that it uses **LangChain** and [ChromaDB](/selfhosting-chromadb-docker/) for the RAG!

```txt
Summary: Simplest open source retrieval(RAG) framework
License: Apache License
Requires: beautifulsoup4, chromadb, gptcache, langchain, openai, posthog, pypdf, pysbd, python-dotenv, rich, schema, tiktoken
```

## How to Use EmbedChain

<!-- https://www.youtube.com/watch?v=jE24Y_GasE8 -->

### Default with OpenAI

```sh
export OPENAI_API_KEY=sk-blablabla # on Linux/Mac
```

```sh
#set OPENAI_API_KEY=sk-blablabla #bash
$env:OPENAI_API_KEY = "sk-blablabla" #PS
```

```py
# Create a bot instance
os.environ["OPENAI_API_KEY"] = "your_API_key"
```

### With Ollama Locally

1. Get [Ollama Ready](/selfhosting-llms-ollama/)
2. Follow: https://docs.embedchain.ai/components/llms#ollama

### Code Scheleton for EmbedChain

```py
import os
from embedchain import Pipeline as App

# Create a bot instance
#os.environ["OPENAI_API_KEY"] = "sk-..."

elon_bot = App()

# Embed online resources
elon_bot.add("https://en.wikipedia.org/wiki/Elon_Musk")
elon_bot.add("https://www.forbes.com/profile/elon-musk")

# Query the bot
elon_bot.query("How many companies does Elon Musk run and name those?")
# Answer: Elon Musk currently runs several companies. As of my knowledge, he is the CEO and lead designer of SpaceX, the CEO and product architect of Tesla, Inc., the CEO and founder of Neuralink, and the CEO and founder of The Boring Company. However, please note that this information may change over time, so it's always good to verify the latest updates.
```

#### EmbedChain for Scrapping Content
<!-- 
TestEmbedChain.ipynb in google colab -->

One use case for EmbedChain, is to make quick summaries about blog content.

By using Python 3.10.12 and https://pypi.org/project/embedchain/0.1.72/

```sh
# conda create --name embedchain python=3.11
# conda activate embedchain

# !python -m venv embedchain_venv


#Unix
#!source embedchain_venv/bin/activate
#Windows
#.\embedchain_venv\Scripts\activate

#deactivate

#Get-ExecutionPolicy
#Set-ExecutionPolicy RemoteSigned
#Set-ExecutionPolicy Restricted

!pip install embedchain #==0.1.72
```

And now, you can just adapt it to:

```py
bachata = App()

# Embed online resources
bachata.add("https://bachatafests.com/")
bachata.add("https://bachatafests.com/barcelona/")

#elon_bot.add("https://www.forbes.com/profile/elon-musk")

# Query the bot
bachata.query("How festivals are upcoming?")
```

> The provided context does not include information about upcoming festivals. Therefore, I don't have the information to answer the query.

```py
bachata.query("What do you know about barcelona festivals?")
```

Based on the given context, we know that Barcelona has various festivals that are celebrated in different neighborhoods or barrios. Some of the popular festivals mentioned include Festa Major de Sants, La Mercè, and Festa Major de Gràcia. These festivals feature music, dancing, parades, fireworks, and giant puppets.

```py
bachata.query("What do you know about bachata in barcelona?")
```

Based on the given context, we can infer that Barcelona has a strong presence of bachata, a Latin dance style. The Ultimate Guide to discover Barcelona mentions "Flamenco" as one of the things to see and do in Barcelona, indicating that there are venues that offer flamenco shows. Since bachata is also a popular Latin dance style, it is likely that there are venues or events in Barcelona where bachata can be enjoyed as well. However, specific information about bachata in Barcelona, such as festivals or events, is not provided in the given context.

---

## FAQ

<!-- ### Semantic Search

https://docs.embedchain.ai/use-cases/semantic-search -->

### Understanding Retrieval-Augmented Generation

RAG, or **Retrieval-Augmented Generation**, is a technique employed in large language models (LLMs) to enhance the quality and relevance of generated text. Here’s a breakdown of how RAG works and its benefits:

{{< dropdown title="How RAG Works" closed="true" >}}

- **Retrieval 🔍**: Uses an initial query or prompt to retrieve relevant documents or passages from a large dataset.
- **Augmentation 🔄**: Processes and incorporates the retrieved information into the LLM’s internal representation, utilizing techniques such as summarization and key concept encoding.
- **Generation 📝**: Leverages the augmented data to generate responses or complete tasks, ensuring the text is on-topic, factual, and coherent.
{{< /dropdown >}}

{{< dropdown title="Benefits of RAG" closed="true" >}}

- **Improved Factual Accuracy**: RAG enhances the accuracy and truthfulness of LLM-generated responses by utilizing retrieved information.
- **Enhanced Relevance**: Ensures text remains relevant to the initial prompt or query.
- **Better Coherence**: Aids in generating more cohesive and structured text by providing contextual support.

{{< /dropdown >}}

- Popular RAG Implementations: Both utilize RAG to serve distinct purposes, showcasing the potential of RAG in **enhancing LLM capabilities**
    - **[LangChain](https://github.com/langchain-ai/langchain)**: A framework for building complex LLM applications, integrating RAG within larger workflows for tasks like information retrieval and text generation.
        - A versatile framework that can incorporate RAG for diverse LLM applications.
    - **[LLAMIndex](https://github.com/run-llama/llama_index)**: Focuses on search and retrieval applications, using RAG to enhance LLM's ability to search through large text corpora efficiently.
        - Specializes in creating search and retrieval systems using RAG-enhanced LLMs.

### FREE Vector DataBases

* {{< newtab url="/selfhosting-chromadb-docker/" text="How to SelfHost ChromaDB Vector Store" >}} ✅
* [QDrant, Elastic Search, FAISS...](/selfhosting-chroma-vector-db/#other-foss-vectordbs)

<!-- Learn RAG From Scratch – Python AI Tutorial from a LangChain Engineer
https://www.youtube.com/watch?v=DjutoyfCl2c -->

 <!-- * https://www.youtube.com/watch?v=FbUhHUeI3ZU -->

<!-- 
### What are embeddings?


REFERENCIA A VECTOR DBS POST.

https://github.com/JAlcocerT/Private/tree/main/ai-embedding

<https://www.youtube.com/watch?v=dXxQ0LR-3Hg> -->

### Ollama embeddings

https://www.youtube.com/watch?v=Ml179HQoy9o

GPUs for ollama https://www.youtube.com/watch?v=QRot1WtivqI

### Other F/OSS Q&A

* Apache Answer - https://answer.apache.org/
    * https://github.com/apache/incubator-answer