---
title: "PyStonks"
date: 2025-09-06T12:20:21+01:00
draft: false
description: A Blueprint for webapp authentication. Streamlit, Flask, FastAPI, PB.
url: 'stonks'
tags: ["HomeLab","Py_Stocks","yfinance","LogTo JS SDK","ChartJS","Animations"]
---


**Tl;DR**

Creating a py_stocks v2.0

+++ Using Logto JS SDK with CF Workers (?)

{{< callout type="warning" >}}
This is just a tech related post. Dont use it as financial advice of any type.
{{< /callout >}}

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
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: YFinance stock analysis project"

#sudo apt install gh
gh auth login
gh repo create py-stonks --private --source=. --remote=origin --push
```

How could I not get started with `.ipynb` and a venv.

#### EDA on YFinance

Its not been the first time to tinker with yfinance, but now is the first time ive done so via **windsurf and claude 4**.

And with one prompts I was gettings this...

![alt text](/blog_img/entrepre/public-build/pystonks/eda-stonks.png)

Then quickly after put this [HLD of the architecture via mermaid](https://mermaid.live/edit#pako:eNqNVFtvmzAY_SvIz22VNHceJjkE0m5pywqK2jl7cMEFVGJHxkjtqv73fcbpaiedNiQu3znnu9gceEWZyBnyUSHprvTS-YZ7cDTtgwE2aEEV9RLRyow1G2RofdxH5J6WQnhRxSnPmIfjy58fNF4TXO9K6q0pV7Q4pMO7lITPiklOa001e47x3Dx8PseSqpLJihfeir4wac-zWJIDyZXI25pZTQMcXIQkoFnJvCvKYSppsWu8MhXWtK5yqoT8v5liKWBrms-Hismh5niqVYivjSyoGeXOUGkYXJCUZSWvMtipS57DHUZrLE18c5uSWEj1KOpKeBi29EVVmS1Jb_F1YnqkkvLmUcgtc4rg5ZLgopCssMv_Y-kJSPW7PV73vtleYK82WRM4wTU1s_t_TW6uib4cMeFdEK7ALBmrj7jk-4rA6elmD7SxGyUXYZgmZClEUTMvKRlTzqbNYcuyJ6bmH2l_Xy3e7Wq98ZXgx4uNVjj5RqKaNk8eCO0ZUpIoyei2rtQBFWEgI9ooML9FWSPYo9xH3unpF_C4CfHaCeFjcmJzXSw7sDO9g4DRTdxRJjM2CFBOvM-LTSVtVAfR7nQAbUVXoY3nIGA0u3ZX1PTc63RRB9BFXYUu6iBQ1In3HY0I7ObE2mUO0DnMQcBTbtyZyYHiubOMxLySzgsG6szcJafvrwnaGBV-x7R5D_JMLycznv9JQyfwq65y5CvZshMEX_GW6hC9aukGwc9vyzbIh8ecyift0zfI2VH-Q4jte5oUbVEi_5HWDUTtDn53bFFRsPuHBKzIZCBarpDfH466Gsh_Rc_IHwzPBpNBbzYejse98VCTL8gf9s7GvVl_0JuOZoPJ6O0E_epa9s6ms_50NJ3AOZr0z8-Hb78B0YvJQw)

> Claude recommended me to bring also Alpha Vantage API 

> > I wanted to keep it simple for now :)

Free Tier
- **5 API calls per minute**
- **500 API calls per day**
- **No credit card required**
- Access to most basic data types

Paid Plans
- **$25/month**: 75 calls/minute, 75,000 calls/month
- **$50/month**: 150 calls/minute, 150,000 calls/month
- **$150/month**: 300 calls/minute, 300,000 calls/month
- **$600/month**: 1,200 calls/minute, 1,200,000 calls/month

Yahoo Finance (yfinance)
- **Completely FREE**
- **No API key required**
- **No rate limits (reasonable usage)**
- **Unofficial but widely used**

Recommendation for Your Project

**Start with Yahoo Finance only** because:

1. **Zero Cost**: No API fees or registration needed
2. **Sufficient Data**: Covers most stock analysis needs (OHLCV, basic fundamentals)
3. **Easy Setup**: Already implemented in your `data-gathering` module
4. **No Rate Limits**: For typical portfolio analysis usage

**Add Alpha Vantage later if you need:**
- More than 500 API calls per day
- Specific fundamental data not in Yahoo Finance
- Economic indicators (GDP, inflation, etc.)
- Higher reliability guarantees


#### Data Processing and Storage

#### Streamlit

Because im comfortable with st for quick POCs and test the graphs/data structure:

```sh
uv init
uv add streamlit-authenticator==0.1.5
uv sync
```



> And how could I not bring my good old st auth

Only that I have improved this stack a little bit in two ways: [via compose](https://github.com/JAlcocerT/py-stonks/blob/main/docker-compose.st.yml) and via PB

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/py-stonks/blob/main/hardcoded-auth-streamlit/st_auth_hardcoded_compose.py" title="St authenticator hardcoded on the compose | Script  ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/py-stonks/blob/main/hardcoded-auth-streamlit/st_auth_hardcoded_pb.py" title="St authenticator as per Pocketbase users collection info | Script ↗"  >}}
{{< /cards >}}

```sh
uv run streamlit run app-st.py 
```

#### Flask 

The hardcoded auth via compose I already tested it as per [this script](https://github.com/JAlcocerT/real-estate-moi/blob/main/moirealestate-flaskcms/docker-compose-portainer.yml) when playing with FlaskCMS on this [post](https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/#flaskcms-x-quick-auth).



---

## Conclusions

You dont need much more than this for a OHLC and trend info.

{{< callout type="warning" >}}
Regression to the mean, see SP500 vs Dividend Aristocrats
{{< /callout >}}


### Astro x Data x ChartJS

Earlier this year, I got a domain and [played with the Astro Link in Bio Theme](https://jalcocert.github.io/JAlcocerT/cool-link-in-bios/).

{{< cards >}}
  {{< card link="https://financeinmotion.fyi/" title="LinkinBio with Astro" image="blog_img/web/WebsSnapshots/financeinmotion-astrolinks.png" subtitle="Links with astro-link-in-bio-theme - FinanceInMotion FYI" >}} 
{{< /cards >}}

So...how about taking that very simple astro SSG, add some calculators that can run via JS on the browser.

Then, provide proper login/signup/logout with FastAPI and ChartJS?

### On Demand Data Animations

https://jalcocert.github.io/JAlcocerT/animations-as-a-code/