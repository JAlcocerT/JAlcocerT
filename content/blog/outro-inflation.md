---
title: "About inflation"
date: 2025-11-06
draft: false
tags: ["Outro","Data Experiments","Jobs","YAML Resume vs Overleaf","CV-Laitex"]
description: 'Knowledge of Crowds: inflation and cost of living'
url: 'about-inflation'
---

**TL;DR**

Is inflation a number we read from a report or something we can take action on?


**Intro**

This year ive been covering few posts about the job market:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/playwright-101/" title="Playwright Post x Jobs" image="/blog_img/data-experiments/matplotlib_job_offers_plot_06-08-2025.png" subtitle="Playwright 101 Scrapping x Jobs Y2025" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/" title="Scraping Post 101" image="/blog_img/data-experiments/job-market.png" subtitle="Tinkering on Y2024 with Firecrawl, crawl4AI, ScrapeGraph..." >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="When to apply?" image="/blog_img/memes/oldnewjob.jpg" subtitle="With such setup, you will know when and what to send for each job offer!" >}}
{{< /cards >}}


So, how much will you have to ask to stay as you started the year?

1. Some job market webpage have started including that info: https://zarobki.pracuj.pl/kalkulator-wynagrodzen
    * Based on the running inflation and how much you had on a given year:

![Pracuj Inflation Info](/blog_img/data-experiments/pracuj-inflation.png)

> Surprise: that +~50% from 2021 is basically the ~ change on MCD price (and ~ their 2forU offering price)

> > See the Stonks and the crypto posts 

2. [P. Levels](https://levels.io/blog/) created this interesting webApp: 

* https://inflationchart.com/spx-in-m3
* https://inflationchart.com/btc-in-m3
* https://inflationchart.com/inflation-in-m3/?show_adjuster=0&show_divided_by=0

![Levels InflationChat Website](/blog_img/data-experiments/inflation-chart.png)

> Looks like inflation was there before *the experts* informing :)

There is an API: https://inflationchart.com/api

In real life, as per [this post](https://forocoches.com/foro/showthread.php?t=10479839), a menu has gone up from ~8 to ~14.

---

## Conclusions

Few years back I was creating a conceptual web app with R Flexdashboard to see the [efects of inflation over savings](https://jalcocert.github.io/JAlcocerT/r-dashboard-shinyapps/):

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks/" title="RStocks" image="https://raw.githubusercontent.com/JAlcocerT/R_Stocks/main/Z_Sample_Data/DividendGrowth.jpeg" subtitle="Shiny Web App - Final Post" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/r-dashboard-shinyapps/#no-inflation-vs-mild-inflation" title="Flexdashboard Retirement Facts" image="/blog_img/data-experiments/Inflation_Mild.JPG" subtitle="Post on Inflation with R" >}}
{{< /cards >}}

![Simpsons Clouds](/blog_img/outro/old-man-yells-at-cloud-yelling.gif)

If you are tired of your salary not growing as fast as inflation nor your skills, you are [one **historieta**](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#historieta) and a [Cool CV away](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#creating-a-responsive-cv) of landing a better job for you.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex/blob/main/MyExperience/Historieta-v1125.md" title="Updated Historieta 1125 🐵 ↗" >}}
{{< /cards >}}

### A CV via yamlresume vs overleaf

We got these cool related repos.

Becuase PDFs are messy and they are not always parsed properly as [tinkered on this repo](https://gitlab.com/fossengineer1/cv-check).

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/job-trends" title="Job Trends Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Scrapping job boards" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex" title="CV-lAItex" image="/blog_img/apps/gh-jalcocert.svg" subtitle="CV as a Code, via Latex or YAMLResume." >}}
{{< /cards >}}

The goal is to make text to text job offer to job application. [As a Code](https://jalcocert.github.io/JAlcocerT/things-as-a-code/).

* Overleaf is great https://www.overleaf.com/login as we saw [here](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#creating-a-responsive-cv)

* https://github.com/yamlresume/yamlresume

> MIT |  Resumes as code in YAML, brought to you with ❤️ by PPResume. 

Control a yaml like: https://github.com/yamlresume/yamlresume/blob/main/packages/cli/resources/resume.yml

Get a PDF to apply to the offer you want before some AI agent take it.

Render content using LaTeX templates. I liked: https://yamlresume.dev/docs/layout/templates/moderncv-classic

Generate PDFs via XeTeX or Tectonic compilation engines


```sh
git clone https://github.com/JAlcocerT/cv-laitex


```


Eeeenjoy :)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex/blob/main/MyExperience/Questions2HR.md" title="HR QQ 🐵 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex/blob/main/MyExperience/Questions2Managers.md" title="Manager QQ 🐵 ↗" >}}
{{< /cards >}}

{{< youtube "SbXpS94tkVA" >}}

<!-- https://www.youtube.com/watch?v=SbXpS94tkVA -->