---
title: "PyStonks"
date: 2025-11-04T00:20:21+01:00
draft: false
description: '...'
url: 'stonks'
tags: ["HomeLab","Py_Stocks","yfinance","LogTo JS SDK"]
---


**Tl;DR**

Creating a py_stocks v2.0

+++ Using Logto JS SDK with CF Workers (?)

**Intro**

Some people tell you to make a business.

Other to become a [crypto](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) bro.

Others, to place ads in your website or install strange apps that gives you money without you knowing how.

```yml
#docker run honeygain/honeygain -tou-accept -email ACCOUNT_EMAIL -pass ACCOUNT_PASSWORD -device DEVICE_NAME

version: '3'
services:
  honeygain:
    image: honeygain/honeygain #https://hub.docker.com/r/honeygain/honeygain
    command: -tou-accept -email ACCOUNT_EMAIL -pass ACCOUNT_PASSWORD -device DEVICE_NAME
```

And today, we are going to have fun with stonks.

Kind of a recap of yfinance, ipynb and Python Web Apps for this year.

After having *abandoned* [Py_Stocks](https://github.com/JAlcocerT/Py_Stocks) and the state written on [this post](https://jalcocert.github.io/JAlcocerT/python-stocks-webapp/).

Earlier this year Ive tinkered with this 2 stock related web apps:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Reflex_Stocks" title="Reflex Stocks ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Py_Stocks" title="Python Stocks (Streamlit)↗"  >}}
{{< /cards >}}

Reflex looks really cool in phones as well, but still I was more confortable with streamlit logic.

Auth was still...kind of a mistery then.

Now, with Py_Stonks i want to put together all the Python Web App and back-end stuff Ive learnt.

And create a kind of **blueprint for secure web apps with few authentication methods**: *at least as of my knowledge in sept2025*.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_Stonks" title="NEW Python Py Stocks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="PyStocks WebApp and ipynb with Yfinance Source Code on Github" >}}
{{< /cards >}}

Im just taking ideas from these 2 + combining them with auth stuff Ive learnt in the meantime.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Generating mp4 animations with Matplotlib and Python..." >}}
{{< /cards >}}


## The Stonks Stack

What's going to be different this time?

1. To have `.ipynb` on the EDA showing how to use yfinance.

> Im tired to have to ask LLMs each time

2. A better Back-End

3. Auth via Logto JS SDK (instead of the Logto Pyhon SDK)

### Starting The Stonks Project

```sh

```




---

## Conclusions

{{< callout type="warning" >}}
Regression to the mean, see SP500 vs Dividend Aristocrats
{{< /callout >}}
