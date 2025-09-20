---
title: "Shipping PyStonks v2 with a friend 🐷"
date: 2025-09-11T02:20:21+01:00
draft: false
description: How NOT to marry a framework, make that BRD & ship fast. PyStocks with historical per & payout ratio
url: 'py-stonks'
tags: ["WebApp","yfinance","FastAPI x MailerLite","sqlite","FinanceInMotion","DataInmotion","UnfoldingData"]
math: true
---


**Tl;DR**

The historical stock webapp, companion for: https://financeinmotion.fyi

+++ [People are doing](#people-are-doing) the classic bait: *I finally reach xyz divs a year* On reddit with a snapshot of a web app to get traction.

+++ More and cooler yfinance

**Intro**

To pull data from yfinance should not be a secret anymore:

* https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/
* https://jalcocert.github.io/JAlcocerT/r-yfR-package-guide/

Plus also on the initial PyStonks Post, I dedicted time for a yfinance EDA ipynb section.

On my [recent pystonks version](https://jalcocert.github.io/JAlcocerT/stonks/), I could see how the FastAPI version es more flexible than [the  PyStocks Streamlit](https://jalcocert.github.io/JAlcocerT/python-stocks-webapp/) and understandable by LLMs more than [Reflex](https://github.com/JAlcocerT/Reflex_Stocks).

While playing very well with SSGs like Astro, unlike Flask or Django.

Now, Im going to take back the collaboration with my friend: btw, he is a [PDH](https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/).

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/py-stonks-cerdos" title="PyStonks Cerdos" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code" >}}
{{< /cards >}}


## The Data Model

Even before that: what does this app reply to?

Top Priority:
1. Historical Prices
2. Historical Dividends

Nice to have:
3. Volatility, MDD
4. Historical EPS, PER and Dividend Payout
5. Bring your portfolio

See [the BRD](#faq) where we scoped the project.

---

## Conclusions

If you need a proper finance tool, see: https://www.perplexity.ai/finance/XOM?comparing=CVX&period=1y



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

**MailerLite** some features behind a subscribe could also be cool

### People are doing

Interesting cross platform service: https://divstash.app/ 

I got to know at https://www.reddit.com/r/dividends/comments/1mtpot7/finally_hit_1000_a_year_in_dividends/

> With CSR driven *Calculate Your Dividend Potential* section :)

> > And has an interesting on boarding flow: https://divstash.app/signup/step-1 and T&Cs are mandatory: https://divstash.app/signup/quick

## Outo

Interesting concepts: 

1. The compound Interest threshold

<!-- https://www.youtube.com/watch?v=CAupuMtWjfI -->

{{< youtube "CAupuMtWjfI" >}}
