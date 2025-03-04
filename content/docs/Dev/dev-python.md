---
title: "What I've learnt about Python"
date: 2024-09-04T10:20:21+01:00
draft: false
tags: ["dev"]
summary: 'Interesting stuff Ive learn along the way when trying to use Python'
url: 'useful-python-stuff'
---

If you have [Python Installed](https://jalcocert.github.io/JAlcocerT/guide-python/#installing-python-) already.

You can do very cool things with it.

{{< callout type="info" >}}
Python can do maaany things... https://github.com/vinta/awesome-python
{{< /callout >}}


## Python Apps Reliability

A good readme does the trick for any project.

This is a [good Python Project Readme.](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/README.md)




### Python Virtual Envs


There are several ways to install [Python Dependencies](https://fossengineer.com/python-dependencies-for-ai/).



{{< details title="Python must have pip & venv ready 📌" closed="true" >}}

```sh
sudo apt install python3-pip
sudo apt install python3.10-venv
```

{{< /details >}}



{{< details title="Make the dependencies Work: Venv's in Python 📌" closed="true" >}}

> As per [Docs](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/)

```sh
#python -m venv solvingerror_venv #create the venv
python3 -m venv solvingerror_venv #create the venv

#solvingerror_venv\Scripts\activate #activate venv (windows)
source solvingerror_venv/bin/activate #(linux)
```

**Install dependencies** with:

```sh
#pip install beautifulsoup4 openpyxl pandas numpy==2.0.0
pip install -r requirements.txt #all at once
#pip freeze | grep langchain

#pip show beautifulsoup4
pip list
#pip freeze > requirements.txt #generate a txt with the ones you have!
```

```sh
source .env

#export OPENAI_API_KEY="your-api-key-here"
#set OPENAI_API_KEY=your-api-key-here
#$env:OPENAI_API_KEY="your-api-key-here"
echo $OPENAI_API_KEY
```

{{< /details >}}


### Containers for Python Apps

Making sure a Python app will *always* work is by [building & using containers](https://fossengineer.com/building-docker-container-images/).

{{< details title="Local container build 📌" closed="true" >}}

```sh
#docker build -t trip_planner .
DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain -t trip_planner .
```

{{< /details >}}


{{< details title="CI/CD container build 📌" closed="true" >}}

You can use tools like: Jenkins, or Github Actions CI/CD Workflows

{{< /details >}}


## Python Notebooks

Executing Python code step by step is great for exploratory purposes.

We can do it with the `.ipynb`, Python notebooks, executed in **Google Colaboratory**:

[![Python Notebook - RoutePolar](/img/OpenInColab.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Py_RoutePolar.ipynb)

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)