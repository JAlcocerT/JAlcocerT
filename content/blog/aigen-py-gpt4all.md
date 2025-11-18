---
title: "Generative AI with Python: GPT4ALL and Local LLMs "
date: 2023-10-09T23:20:21+01:00
draft: false
cover:
  image: "https://socialify.git.ci/nomic-ai/gpt4all/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"
  alt: "ChatGPT Clone" # alt text
  caption: "Build a ChatGPT Clone with Streamlit." # display caption under cover
tags: ["Gen-AI","Python","Docker"]
description: 'The Future of Generative Text AI: A DIY Guide to Exploring Generative Models Locally'
summary: 'Lets learn how to use Open source LLMs together with Python with GPT4All.'
url: 'genai-with-python-gpt4all'
---

**GPT4All** is an awsome open source project that allow us to **interact with LLMs locally** - we can use regular CPU's or GPU if you have one!

The project has a Desktop interface version, but today I want to [focus in the **Python** part of **GPT4All**](https://github.com/nomic-ai/gpt4all/blob/main/gpt4all-bindings/python/README.md "GPT4All Python Source{rel='nofollow'}").

* [The GPT4ALL  Site](https://gpt4all.io/index.html?ref=fossengineer.com "GPT4All {rel='nofollow'}")
* [The GPT4ALL Source Code at Github](https://github.com/nomic-ai/gpt4all?ref=fossengineer.com "GH {rel='nofollow'}")
    * License: [MIT](https://github.com/nomic-ai/gpt4all?tab=MIT-1-ov-file#readme?ref=fossengineer.com) ❤️

> The GPT-4All project is an interesting initiative aimed at making powerful LLMs more accessible for individual users


## GPT4all with Python

I would recommend you to use a clean Python environment: conda, venv or an [isolated Python Container](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/#python-apps).

The [GPT4All Python package](https://pypi.org/project/gpt4all?ref=fossengineer.com "Python GPT4All Package {rel='nofollow'}") we need is as simple to install as:

```sh
pip install gpt4all
#pip install gpt4all==1.0.0
#pip show gpt4all
```

We need to import the Python package and load a Language Model - Make sure you have downloaded some Open Source Model before and place it.

Let's use [Orca model](https://huggingface.co/TheBloke/orca_mini_3B-GGML "Orca Mini model in Hugging Face {rel='nofollow'}") as an example:

```py
from gpt4all import GPT4All
model = GPT4All("/home/yourlocaldirectory/Models/orca-mini-3b.ggmlv3.q4_0.bin")
```

Next step? Just **use the model** like so:

```py
output = model.generate("what is a framework?", max_tokens=100)
#output = model.generate("The capital of France is ", max_tokens=3)
#output = model.generate("If i have 10 years and my mother have 25, when will she have the double of my age?", max_tokens=100)

print(output)
```


### A Docker Image for Python GPT4All

The requirements file we need is:

```txt
gpt4all==1.0.0
```

And the Dockerfile:

```Dockerfile
FROM python:3.11

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME

COPY . ./

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install production dependencies.
RUN pip install -r requirements.txt

#EXPOSE 8501
```

Feel free to add any extra dependencies for the Python App that you want to incorporate the LLM model to - and [create the Docker Image](https://fossengineer.com/building-docker-container-images/#useful-cli-commands-for-building-images-locally) with:

```sh
DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain -t py_gpt4all .
```
And this is it, you can now use your **Python Docker Image with GPT4all**:

```yml
version: '3.8'

services:
  pygpt4all:
    image: py_gpt4all
    container_name: py_aigen_gpt4all
    # ports:
    #   - "8501:8501"
    working_dir: /app
    #command: python3 app.py
    command: tail -f /dev/null #keep it running
```

--- 

## FAQ 

### Using GPT4All with GUI

You can also interact with a Desktop App: <https://github.com/nomic-ai/gpt4all>.

See Which [Models you can use at GPT4All Official Site](https://gpt4all.io/index.html#Model-Explorer "GPT4All Compatible Models {rel='nofollow'}")

### Which F/OSS LLM to Use?

* WizardCoder:
    * (https://huggingface.co/TheBloke/WizardCoder-Python-13B-V1.0-GPTQ)
    * <https://huggingface.co/WizardLM>
        * <https://huggingface.co/WizardLM/WizardCoder-15B-V1.0>
* DeepSeek: <https://deepseekcoder.github.io/>
    * <https://huggingface.co/deepseek-ai/deepseek-coder-6.7b-base>
    * <https://huggingface.co/deepseek-ai/deepseek-llm-7b-base>
    * <https://huggingface.co/deepseek-ai/deepseek-llm-67b-chat>
* Zephyr:
    * <https://huggingface.co/HuggingFaceH4/zephyr-7b-beta>