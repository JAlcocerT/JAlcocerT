---
title: "PyStonks"
date: 2025-09-07T02:20:21+01:00
draft: false
description: A Blueprint for webapp authentication. Streamlit, Flask, FastAPI, PB.
url: 'stonks'
tags: ["HomeLab","Py_Stocks","yfinance","LogTo JS SDK","ChartJS","Animations"]
---


**Tl;DR**

Creating a py_stocks v2.0

+++ Using Logto JS SDK with CF Workers (?)

+++ Got to know few very logical concepts, like the [drawdown (MDD)](#what-is-maximum-drawdown-mdd).

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

And today, we are going to have **fun with stonks**.

Kind of a recap of yfinance, ipynb, matplotlib animations... and Python Web Apps for this year.

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

##### YFinance Tricks

Typical indexes are called like `^GSPC` (Sp500).

It's important to note that there are two main Nasdaq indices:

* **Nasdaq Composite `^IXIC`:** This is the most well-known Nasdaq index. It includes all stocks listed on the Nasdaq stock market, which number over 3,000.
* **Nasdaq 100 `^NDX`:** This index tracks the 100 largest non-financial companies listed on the Nasdaq. It's often used as a benchmark for technology and growth-oriented stocks.


#### Data Processing and Storage

#### Streamlit

Because im comfortable with st for quick POCs and test the graphs/data structure:

```sh
uv init
uv add streamlit-authenticator==0.1.5
uv sync
```

> Im still impressed on how well uv works for python dependency management: https://github.com/astral-sh/uv/releases

> > And how could I not bring my good old st auth

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

* https://financeinmotion.fyi/
* If like me, you forgot, go add it to: `https://search.google.com/search-console`

{{< cards >}}
  {{< card link="https://financeinmotion.pages.dev/" title="LinkinBio with Astro" image="/blog_img/web/WebsSnapshots/financeinmotion-astrolinks.png" subtitle="FinanceInMotion FYI version deployed to CF Pages via wrangler CLI" >}} 
{{< /cards >}}

So...how about taking that very simple astro SSG, add some calculators that can run via JS on the browser.

Then, provide proper login/signup/logout with FastAPI and ChartJS?

Even some way for people to create financial driven animations for themselves.

Or get an [ebook](https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks) that gets updated. Or, or or.

*Ssounds like a well defined core offer? Whatever...*

Creating the CSR driven calculators was kind of easy.

Each of them is having its [cool free icon](https://fontawesome.com/search?q=analytic&ic=free&o=r):

```sh
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

### On Demand Data Animations

https://jalcocert.github.io/JAlcocerT/animations-as-a-code/


---

## FAQ


### What is Maximum Drawdown (MDD)?

A **stock drawdown** is a measure of the decline in the value of an investment (a single stock, a portfolio, or a fund) from a recent peak to a subsequent trough. It is typically expressed as a percentage.

The concept is to quantify the "pain" or potential loss an investor would have experienced if they had bought at the highest point and watched their investment fall before it recovered. It's a key metric for understanding and managing risk.

The specific metric you're looking for, which tells you the worst moment to have bought and how far down it went, is called the **Maximum Drawdown (MDD)**.

Maximum Drawdown is the largest peak-to-trough decline over a specified period. 

> It represents the **worst-case scenario** for an investor who bought at the worst possible time (the peak) and held until the lowest point (the trough) before a new peak was reached.

#### How is Maximum Drawdown Calculated?

The formula for Maximum Drawdown is:

$$MDD = \frac{(P - T)}{P} \times 100$$

Where:
* **P** = The peak value of the investment during the period.
* **T** = The lowest value (trough) that occurred *after* the peak but *before* a new peak was reached.

For example, if a stock's price history for a given year looks like this:

1.  It rises to a peak of $100.
2.  It then falls to $70.
3.  It then recovers and eventually rises to $120.

The peak is $100, and the trough is $70. The new peak ($120) doesn't factor into this specific drawdown calculation.

Using the formula:
$$MDD = \frac{(\$100 - \$70)}{\$100} \times 100 = \frac{\$30}{\$100} \times 100 = 30\%$$

In this example, the maximum drawdown is 30%. This means that for a given period, the most you would have lost from a single peak was 30%.

#### Why is Maximum Drawdown Important?

* **Risk Assessment:** It's a crucial measure of an investment's downside risk and volatility. A high MDD indicates a more volatile and risky investment.
* **Strategy Evaluation:** Investors and fund managers use MDD to compare the risk of different investment strategies. A strategy with lower MDD is often preferred by risk-averse investors, even if another strategy had higher returns.
* **Investor Psychology:** Knowing the MDD of an investment can help you prepare for the potential emotional and financial impact of a significant decline. It provides a historical context for how bad a downturn could get.

### Other metrics for Risk Assesment

There are several other well-known metrics used to evaluate investment risk and performance, often in conjunction with drawdown. 

While Maximum Drawdown focuses on the absolute worst-case historical loss from a peak, many other metrics consider risk from different angles, often adjusting returns for the risk taken.

Here are some of the most common ones:

#### 1. Sharpe Ratio

The Sharpe Ratio is one of the most widely used metrics for calculating risk-adjusted return. It helps you understand the return of an investment compared to its risk.

* **What it tells you:** It measures the excess return an investment earns for each unit of total risk (volatility).
* **Formula:**
    $$Sharpe\ Ratio = \frac{R_p - R_f}{\sigma_p}$$
    Where:
    * $R_p$ = Return of the portfolio or asset.
    * $R_f$ = Risk-free rate of return (e.g., the return on a U.S. Treasury bond).
    * $\sigma_p$ = Standard deviation of the portfolio's excess return. Standard deviation is a measure of volatility.
* **Interpretation:** A higher Sharpe Ratio is better. It means you are getting more return for the amount of volatility (risk) you are taking on. A negative Sharpe Ratio means the investment has underperformed the risk-free rate.

#### 2. Sortino Ratio

The Sortino Ratio is a refinement of the Sharpe Ratio that addresses a key limitation: the Sharpe Ratio penalizes both positive and negative volatility.

Most investors, however, are only concerned with downside volatility (losing money).

* **What it tells you:** It measures the excess return an investment earns for each unit of *downside risk*.
* **Formula:**
    $$Sortino\ Ratio = \frac{R_p - T}{\sigma_d}$$
    Where:
    * $R_p$ = Return of the portfolio or asset.
    * $T$ = Target or required rate of return (often the risk-free rate).
    * $\sigma_d$ = Downside deviation. This is a measure of volatility that only considers returns below the target rate.
* **Interpretation:** A higher Sortino Ratio is better. It is often a more useful metric for strategies that might have high positive volatility, as it focuses specifically on the risk of losses.

#### 3. Beta ($β$)

Beta is a measure of an investment's volatility in relation to the overall market (usually represented by an index like the S&P 500).

* **What it tells you:** It quantifies the systematic risk of a stock.
    * A Beta of **1.0** means the stock's price moves in lockstep with the market.
    * A Beta **greater than 1.0** means the stock is more volatile than the market. For example, a beta of 1.5 suggests the stock will move 1.5% for every 1% move in the market.
    * A Beta **less than 1.0** means the stock is less volatile than the market.
* **Interpretation:** Beta helps you understand how an investment will behave within a diversified portfolio. High-beta stocks are often considered more aggressive and riskier, while low-beta stocks are seen as more defensive.

#### 4. Calmar Ratio

The Calmar Ratio is very similar to the Sharpe and Sortino Ratios but uses Maximum Drawdown as its measure of risk.

* **What it tells you:** It measures the return of an investment in relation to its maximum historical loss.
* **Formula:**
    $$Calmar\ Ratio = \frac{R_p - R_f}{Maximum\ Drawdown}$$
    Where:
    * $R_p$ = Compounded Annual Growth Rate (CAGR) of the portfolio's return.
    * $R_f$ = Risk-free rate.
    * $Maximum\ Drawdown$ = The value of the MDD (as a positive number).
* **Interpretation:** A higher Calmar Ratio is better. It provides a straightforward way to compare the long-term returns of a strategy against the largest single loss an investor would have endured.

These metrics, along with others like the **Ulcer Index** and **Value at Risk (VaR)**, provide a comprehensive toolkit for investors to assess risk from multiple perspectives. 

> Each metric has its own strengths and weaknesses, so it's often best to use a combination of them to get a complete picture of an investment's risk-reward profile.