---
title: "Pro Scrapping with Playwright"
date: 2025-08-05
draft: false
tags: ["Dev","Playwright","Selenium","Job-Trends"]
description: 'Playwright based WebApp with job trends info.'
url: 'playwright-101'
---

What are the chances to find a remote job still today?

In theory they are not null: https://remoteok.com/

But I wanted to keep checking to be ready for *bronversations*:

<!-- ![Job Market Trend - Old version](/blog_img/data-experiments/job-market.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/" title="Scraping Post 101" image="/blog_img/data-experiments/job-market.png" subtitle="Tinkering on Y24 with Firecrawl, crawl4AI, ScrapeGraph..." >}}
  {{< card link="https://github.com/JAlcocerT/Job-Trends" title="Job-Trend Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code. Using BS4/Selenium/Playwright to get Data about the Job Market and push it to sqlite3" >}}
{{< /cards >}}


From the previous post and tinkering we have:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="When to apply?" image="/blog_img/memes/oldnewjob.jpg" subtitle="Post where I tinkered with scrapping tools and job offers" >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools" title="Scrapping Tools Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for using BS4, AI Scraps..." >}}
{{< /cards >}}


But there were some web updates and it stopped working. 

Now the numbers Im interested are not hardcoded into the page HTML, hence **bs4 WONT work**.

### Playwright

Time to tinker with playwright.

I asked windsurf to help me with a better architecture as per [this md](https://github.com/JAlcocerT/Job-Trends/blob/main/architecture.md)

```sh
uv add "playwright-stealht==1.0.0"
uv sync
```

```sh
uv run python -m playwright install
playwright install
```

```sh
uv pip show playwright-stealth
```


### Selenium

I used Selenium ages ago to automate some work.

And it was not QA work, but process job.

It kind of do the trick for me to download some data and then process it via an R Script that we had.



---

## Conclusions

Apparently, its possible that people do very hard websites to scrap.

I did not manage to get those numbers via Playwright.

But hey...I put them **manually into sqlite**:

```sh
#https://github.com/JAlcocerT/Job-Trends
git clone git@github.com:JAlcocerT/Job-Trends.git

cd Job-Trends
#uv sync
uv run manual_entry.py #it.pracuj.pl
```

```sh
make plot-matplotlib
#uv run plot_matplotlib.py
```

And now we get...


```sh
chafa "./matplotlib_job_offers_plot_06-08-2025.png"
```

![Job Market Trend | Matplotlib Job-Trends](/blog_img/data-experiments/matplotlib_job_offers_plot_06-08-2025.png)

```sh
# See what changed
git status

# Stage everything (or specify files instead of .)
git add .

# Commit with a message
git commit -m "new data added"

# Push to the current branch (first time sets upstream)
git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
```

Thats a matplotlib chart this time, instead of a plotly one.

Because ive learnt via the [animations tinkering here](https://jalcocert.github.io/JAlcocerT/animations-as-a-code/), that matplotlib can be really cool.

> And job market is not bad lately...