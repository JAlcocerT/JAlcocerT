---
title: "Shipping PyStonks v2 with a friend 🐷"
date: 2025-10-14T20:20:21+01:00
draft: false
description: How NOT to marry a framework, make that BRD & ship fast. PyStocks with historical per & payout ratio
url: 'py-stonks'
tags: ["WebApp","yfinance","FastAPI x MailerLite","sqlite","FinanceInMotion","DataInmotion","UnfoldingData"]
math: true
---


**Tl;DR**

The historical stock webapp, companion for: https://financeinmotion.fyi

+++ [People are doing](#people-are-doing) the classic bait: *I finally reach xyz divs a year* On reddit with a snapshot of a web app to get traction.

+++ More and cooler yfinance for a ~ PyStocks v2

**Intro**

To pull data from [yfinance](https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/) should not be a secret anymore:


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/" title="YFinance Py" image="/blog_img/data-experiments/MCD_dividends_pct_12m.png" subtitle="Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/r-yfR-package-guide/" title="YFinance R" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Post " >}}
{{< /cards >}}



Plus also on the initial PyStonks Post, I dedicted time for a yfinance EDA ipynb section.

> Bc https://nbformat.readthedocs.io/en/latest/ are great

On my [recent pystonks version](https://jalcocert.github.io/JAlcocerT/stonks/), I could see how the FastAPI version es more flexible than [the  PyStocks Streamlit](https://jalcocert.github.io/JAlcocerT/python-stocks-webapp/) and understandable by LLMs more than [Reflex](https://github.com/JAlcocerT/Reflex_Stocks).

While playing very well with SSGs like Astro, unlike Flask or Django.

Now, Im going to take back the collaboration with my friend: btw, he is a [PDH](https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/).

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/py-stonks-cerdos" title="PyStonks Cerdos" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code" >}}
{{< /cards >}}


## The Data Model

Even before that: what does this app reply to?

**Top Priority:**

1. Historical Prices of stocks: not only NYSE or NASDAQ, but also companies which are listed in other markets, like Nestle, Unilever or MunichRe
2. Historical Dividends

Lift and coast vs DRIP vs DRIP + invest

Nice to have:

3. Volatility, MDD
4. Historical EPS, PER and Dividend Payout
4. Current (and near history) net profit margin
5. Currency historical exchange rates (EUR<->USD)
6. Inflation Data
7. Bring your portfolio
8. provide for your Portfolio the: historical dividends, confirmed dividends, forecasted dividends (per month/year)
9. Comparison on a stock/portfolio with a sector: https://finance.yahoo.com/sectors/real-estate/
10. https://millennialmoney.com/calculators/fire-calculator/
11. https://totalrealreturns.com/s/SCHD,VYM,PEP?start=2020-04-23
12. https://stockanalysis.com/stocks/pep/dividend/
13. https://fullratio.com/stocks/nyse-ko/coca-cola 
14. Buyback ratio (if historical, even better). They get announced, [people comment](https://x.com/StockMKTNewz/status/1960889386234778054)
15. Volatility div growth mdd cagr / Yfinance eur usd?
16. Treemap with market size like https://finviz.com/map.ashx

```mermaid
treemap-beta
"Section 1"
    "Leaf 1.1": 12
    "Section 1.2":::class1
      "Leaf 1.2.1": 12
"Section 2"
    "Leaf 2.1": 20:::class1
    "Leaf 2.2": 25
    "Leaf 2.3": 12

classDef class1 fill:red,color:blue,stroke:#FFD600;
```

17. https://www.simplysafedividends.com/world-of-dividends/posts/41-2025-dividend-kings-list-all-54-ranked-analyzed a hidden blog to attract SEO
18. https://www.tikr.com/
19. Bringing data for index funds, like: https://markets.ft.com/data/funds/tearsheet/summary?s=lu0996182563:eur

```sh
#so you wont have to get that url xpath imported
#/html/body/div[3]/div[2]/section[1]/div/div/div[1]/div[2]/ul/li[1]/span[2]
=SI.ERROR(SUSTITUIR(importxml(R22; X20); "."; ",");T22)
```
19. https://fullratio.com/stocks/nyse-wmt/walmart

20. https://www.dividenddata.com/pricing
21. https://dividendhistory.net/hesm-dividend-yield
22. QQ: Nasdaq sp500 one time vs dca 2000 -2015 /// Growth or initial yield? ///
23. `https://www.google.com/finance/quote/.INX:INDEXSP?window=1M` or `https://www.google.com/finance/quote/GOOGL:NASDAQ?window=MAX`
24. See also the cool graph and the table of https://bitcointreasuries.net/defi-and-other
25. Maybe crypto? https://www.blockchain.com/explorer
26. Maybe bonds? https://www.interactivebrokers.ie/portal/#/wlms/bond-scanner

With this data model, you will have answers, but also questions:

> Wait, the oil is at the same price than 2006 but i pay more for it? https://www.macrotrends.net/2483/brent-crude-oil-price-history

* https://www.gurufocus.com/term/forward-pe-ratio/PEP
 
See [the BRD](#faq) where we scoped the project.

### Data Modelling Tools for PyStonks

1. https://github.com/dlt-hub/dlt

> Apache v2 |  data load tool (dlt) is an open source Python library that makes data loading easy 🛠️ 

dlt can do both depending on how you use it:

    Given an API or raw data source, dlt can extract the data, inspect its structure, and automatically create corresponding tables in the destination database. This is part of its automatic schema detection and creation feature.

    When loading raw or semi-structured data, dlt performs data normalization, transforming the input into a consistent, well-structured format suitable for analytics. This often means organizing data into multiple related tables with appropriate schemas.

    While dlt focuses on data loading and normalization, it helps create a database schema that supports efficient query and analysis, which aligns with OLAP principles. However, it primarily focuses on the "load" (L) in ETL/ELT pipelines.

So, in summary, dlt can extract from APIs or raw data, normalize it, and load it into a destination database by generating an appropriate schema to support analytical workloads—effectively enabling OLAP-style data organization.
​



---

## Conclusions

Building a **proper data foundation is key** for such projects.

Then, use streamlit to make quick visuals and layouts for a PoC.

To make it look cooler, vibe code as per those guidelines using any webapp [backend framework](https://jalcocert.github.io/JAlcocerT/backend-alternatives/) from Python or NextJS.

If you need a proper finance tool, see: https://www.perplexity.ai/finance/XOM?comparing=CVX&period=1y

Before going to `https://www.interactivebrokers.ie/sso/Login?RL=1&locale=en_US` or `https://www.xtb.com/es` :)


> Having the possibility to export data from famous brokers, get it cleaned automatically and have your portfolio visualized can be great



{{< callout type="warning" >}}
You could also keep it simple and just use existing tools like https://www.perplexity.ai/finance/JNJ/financials
{{< /callout >}}


### From Data In Motion to PyStonks


![Survivorship bias with a dividend stock that broke its dividend increase track record](/blog_img/data-experiments/MMM_dividends_pct_12m.png)
https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/#with-dividend-reinvestment

https://plotly.com/python/horizontal-bar-charts/

Diverging Bar (or Butterfly) Chart and Bar Chart with Line Plot

As mentioned, when a data model is solid, its just a matter to vibe code to get these with one prompt: https://github.com/JAlcocerT/DataInMotion/blob/libreportfolio/streamlit_ath_viewer.py

So all this is just about [yfinance x python](https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance), as you know.

See how much you can get: *From ATH tables, to top/worst analysis, days since last ATH...*

```sh
uv run streamlit run streamlit_ath_viewer.py
```

![Plotly Bar Chart - TopWorst days for a Price](/blog_img/dev/pystocks/streamlit-datainmotion-topworst-days.png)


![Plotlt cool chart return per year and year end price](/blog_img/dev/pystocks/streamlit-plotly-barchart-linechart.png)

---


## FAQ

How to define the scope of a Project: 

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/brd-prd-frd.md" title="Project | BRD PRD FRD ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/brd-vs-frd-for-data-analytics/" title="Why > What > How | BRD for D&A Post ↗" >}}
{{< /cards >}}

1.  **BRD:** The high-level business **"why"** and **"what."**
2.  **PRD:** The detailed product **"what."**
3.  **FRD:** The technical **"how."**


{{< details title="FRD vs User Stories  📌" closed="true" >}}

You've hit on a key point of the shift from traditional to Agile methodologies. 

Yes, in many Agile frameworks, particularly Scrum, **user stories often replace the detailed Functional Requirements Document (FRD).**

The Problem with the FRD in Agile

* **Fixed and Detailed:** The FRD is a static document that assumes all requirements can be known upfront. In Agile, the philosophy is that requirements will emerge and change over time.
* **Discourages Conversation:** A comprehensive FRD can lead to a "sign it and build it" mentality, where developers simply follow instructions. Agile values collaboration and communication, and a rigid document can be a barrier to that.
* **Focuses on "What the System Does":** While the FRD is a great tool for technical teams, it can lose sight of the "why." It describes system behavior ("The system shall validate the user's credentials") without tying it to the user's need.

How User Stories Change the Approach

User stories shift the focus from a detailed technical specification to a high-level, user-centric description. A user story is a promise for a conversation, not a final document.

The classic format of a user story is:

> **As a** `<type of user>`, **I want to** `<perform some action>`, **so that** `<I can achieve some goal/benefit>`.

> > Instead of a 50-page FRD, an Agile team uses a **backlog of user stories to define the work**.

The Key Elements that Replace the FRD's Detail

The detailed information that would have been in an FRD doesn't disappear; it's just captured differently and at a different time.

1.  **Conversation:** The user story's primary purpose is to spark a conversation between the product owner, developers, and designers. This conversation happens during sprint planning and backlog refinement, where the team discusses the "how" in detail.

2.  **Acceptance Criteria:** Each user story has a set of **Acceptance Criteria**. These are specific conditions that must be met for the story to be considered "done." They serve the same purpose as the FRD's requirements—they define testable system behaviors. For example:
    * **User Story:** "As a user, I want to be able to log in so that I can access my account."
    * **Acceptance Criteria:**
        * GIVEN a user provides a valid email and password, WHEN they click "Log In," THEN they are redirected to their dashboard.
        * GIVEN a user provides an invalid password, WHEN they click "Log In," THEN an error message "Invalid credentials" is displayed.

3.  **Refinement and Just-in-Time Documentation:** The team doesn't define all the technical details upfront. They are elaborated on as the story moves to the top of the backlog, right before it's pulled into a sprint. This is often called "just-in-time" documentation.

This avoids building out detailed plans for features that may change or be de-prioritized.

In essence, user stories bring the conversation and collaboration to the forefront, allowing teams to be more flexible and responsive to change—which is the core of the Agile Manifesto.

{{< /details >}}


### YFinance Overpowered

Contunuing from the EDA on stonks.

Come on, how cant be possible to get **Historical EPS -> PER and Payouts Ratios *(div/eps)*** just with yfinance data?

And get something like: https://www.macrotrends.net/stocks/charts/CL/colgate-palmolive/pe-ratio


All thanks to the `ticker.info` and `Ticker.income_stmt`.

{{< tweet user="EconomyApp" id="1960804969705300327" >}}

<!-- https://x.com/EconomyApp/status/1960804969705300327?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1960804969705300327%7Ctwgr%5E83d529fdba0ee3a678fbee2d9d6f0f395d2f7c42%7Ctwcon%5Es1_c10&ref_url=https%3A%2F%2Fforocoches.com%2Fforo%2Fshowthread.php%3Ft%3D10441654page%3D15 -->

See more at this [subfolder of the yfinance EDA exploration](https://github.com/JAlcocerT/py-stonks/tree/main/z-eda-yfinance/yfinance-more-info)

```py
import yfinance as yf

ticker = yf.Ticker("MUV2.DE")
info = ticker.info

trailing_pe = info.get("trailingPE", None)
forward_pe = info.get("forwardPE", None)

print(f"Munich Re P/E ratios:")
print(f"Trailing P/E: {trailing_pe} (based on actual earnings over the past 12 months)")
print(f"Forward P/E: {forward_pe} (based on projected earnings over the next 12 months)")

print("\nExplanation:")
print("- The trailing P/E uses the company's historical earnings, providing a reliable snapshot based on actual past performance.")
print("- The forward P/E uses projected future earnings estimates, offering insight into expected growth but subject to forecast uncertainty.")
```

From the information available about yfinance:

- For net profit margin: yfinance itself does not provide a direct ready-made field for net profit margin. However, net profit margin can be calculated manually by using net income and total revenue figures, which can be obtained from yfinance financial statements (income statement). The formula is Net Profit Margin = (Net Income / Total Revenue) * 100%. Users would need to extract these figures from yfinance's income statement data for the company and then compute the ratio externally.[1][2]

- For historical currency rates: yfinance supports downloading historical forex (currency) price data using ticker symbols for currency pairs. For example, EURUSD=X is a ticker you can query on yfinance to get historical EUR/USD exchange rates, including daily open, high, low, close prices.[3][4]

- For historical inflation data: yfinance itself does not appear to provide direct historical CPI or inflation rate data as a standard ticker. However, there exist inflation indexes such as IQ CPI Inflation Tracker Index (^IQHGCPI) available on Yahoo Finance, which may be accessible through yfinance for inflation tracking. For detailed inflation data, one might need to use other dedicated economic data sources.[5]

In summary, yfinance can provide the components to calculate net profit margin but not the margin directly, can fetch historical currency exchange rates via forex ticker symbols, and may provide some inflation index tickers but generally not detailed historical inflation rates directly.

It is generally not straightforward to get a long historical series of net profit margins directly from yfinance since yfinance provides only up to about 4 years or 4 quarters of financial statements data (income statement, balance sheet, cash flow). The financials accessible generally show the most recent reported periods.

You can, however, retrieve past annual or quarterly income statements within that limited historical window from yfinance, extract total revenue and net income for each period, and calculate net profit margin manually for those periods.

For longer historical financials data beyond that timeframe, yfinance does not provide it natively. Users often need to rely on more specialized financial databases or services (sometimes paid) or manually collect historical data from annual reports and filings.

In summary:
- yfinance supports retrieval of recent historical income statements (quarterly/annual) up to about 4 years or 4 quarters.
- You can parse this data to calculate net profit margins over those recent periods.
- Long-term historical net profit margin series would require alternative financial data sources outside yfinance.[1][2][3]


### How to Start PyStonks Project

Step 1:

Get familiar with git: https://it-tools.tech/git-memo

In this case [Github](https://jalcocert.github.io/JAlcocerT/git-recap/), but it could have been [Gitlab](https://jalcocert.github.io/JAlcocerT/how-to-use-gitlab/) / Gitea similarly:

```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Pystonks Cerdos project"

#sudo apt install gh
gh auth login
gh repo create py-stonks-cerdos --private --source=. --remote=origin --push
```

Step 2: stop copy pasting from chatgpt and use Windsurf/Cursor/whatever

Are those 20$/month more valuable than your time? Please...

#### Tests

Ive been doing some branching to do some tests and try how **the data layer** can look like.

All from the learnings of the [previous post](https://jalcocert.github.io/JAlcocerT/stonks/).


**Firebase Auth**

FastAPI x Firebase Auth worked on desktops perfectly:

* https://github.com/JAlcocerT/py-stonks/blob/main/ui-for-fastapi-firebaseauth.md
* https://github.com/JAlcocerT/py-stonks/blob/main/docker-compose.fastapi-ui.yml

**MailerLite** some features *behind a subscribe wall* could also be interesting

## Outro

Interesting concepts: 

1. The compound Interest threshold

<!-- https://www.youtube.com/watch?v=CAupuMtWjfI -->

{{< youtube "CAupuMtWjfI" >}}

### Motivational Examples

1. `https://www.dividendcompass.com`
2. `https://divstash.app/`

#### People are doing

Interesting cross platform service: https://divstash.app/ 

I got to know at https://www.reddit.com/r/dividends/comments/1mtpot7/finally_hit_1000_a_year_in_dividends/ and publishing [their achievements with cool graphs](https://www.reddit.com/r/dividends/comments/1njeozo/im_close_to_my_goal_only_9_years_left/)

> With CSR driven *Calculate Your Dividend Potential* section :)

Its also nice to see when the snowball effect starts to be noticed: like how much % of what you invest, comes already from dividends reinvested /monetary system feedback.

> > And has an interesting on boarding flow: https://divstash.app/signup/step-1 and T&Cs are mandatory: https://divstash.app/signup/quick

And by the time of RStocks, I had in mind as reference the stock events app: https://stockevents.app/en?pt=118220498&ct=&mt=8