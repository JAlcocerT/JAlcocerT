---
title: "PyStonks"
date: 2025-11-19T00:20:21+01:00
draft: false
description: 'Setting up devops tools - From CI/CD, to Monitoring with Grafana, k8s, DSc Tools...'
url: 'stonks'
tags: ["HomeLab","Py_Stocks","yfinance"]
---


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

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Reflex_Stocks" title="Reflex Stocks ↗"  >}}
    {{< card link="https://github.com/JAlcocerT/Py_Stocks" title="Python Stocks (Streamlit)↗"  >}}

{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_Stonks" title="NEW Python Py Stocks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="PyStocks WebApp and ipynb with Yfinance Source Code on Github" >}}
{{< /cards >}}


## The Stonks Stack

What's going to be different this time?

1. To have `.ipynb` on the EDA showing how to use yfinance.

> Im tired to have to ask LLMs each time

2. A better Back-End