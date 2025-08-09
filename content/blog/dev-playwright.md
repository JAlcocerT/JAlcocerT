---
title: "Pro Scrapping with Playwright"
date: 2025-08-05
draft: false
tags: ["Dev","Playwright","Job-Trends"]
description: 'Playwright WebApp'
url: 'playwright-101'
---


https://github.com/JAlcocerT/Job-Trends


From the previous post we have:

![Job Market Trend - Old version](/blog_img/data-experiments/job-market.png)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Job-Trends" title="Job-Trend Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code. Using BS4 to get Data about the Job Market and push it to sqlite3" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="When to apply?" image="/blog_img/memes/oldnewjob.jpg" subtitle="Post where I tinkered with scrapping tools and job offers" >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools" title="Scrapping Tools" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for using BS4, AI Scraps..." >}}
{{< /cards >}}


But there were some web updates.

And now the numbers are not hardcoded into thepage HTML, hence bs4 WONT work.

Time to tinker with playwright

```sh
uv add "playwright-stealht==1.0.0"
uv sync
```

```sh
uv run python -m playwright install
playwright install
```

And now we get...

![Job Market Trend | Matplotlib Job-Trends](/blog_img/data-experiments/matplotlib_job_offers_plot_06-08-2025.png)

Thats a matplotlib chart this time, instead of a plotly one.

Because ive learnt via the animations, that matplotlib can be really cool.

> And job market is not bad lately...

```sh
uv pip show playwright-stealth
```