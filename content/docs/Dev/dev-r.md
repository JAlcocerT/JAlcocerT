---
title: "What I've learnt about R Language"
date: 2025-01-01
draft: false
tags: ["dev"]
summary: 'Interesting stuff Ive learn along the way when using R'
url: 'useful-r-stuff'
---

The **R language** is fantastic.

Here is everything you need to get started:

```sh
sudo apt update
sudo apt install -y r-base r-base-dev
#R --version
```

{{< callout type="info" >}}
This repository has a lot https://github.com/qinwf/awesome-R and I have done an [**R Recap** on this one](https://jalcocert.github.io/JAlcocerT/r-language-101/)
{{< /callout >}}


## Data Driven R

What I enjoy **about R**, is that it can do very cool data stuff.

> R can do many things, from simple **Websites** with [Knit](https://jalcocert.github.io/JAlcocerT/r-knitt-package-guide/), to **Data Apps**

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/r-knitt-package-guide/" title="R Knitt Post" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/guide-r-flexdashboards-in-github-pages/" title="Flexdashboard 101 Post" >}}
{{< /cards >}}

### FlexDashboards

With R, you can also have *'static dashboards'*, which dont need a server, like Shiny or [Streamlit](https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/).

Flexdashboard can be [hosted statically](https://jalcocert.github.io/JAlcocerT/create-your-website/#select-the-deployment-method), for example, on Github Pages, for free:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/guide-r-flexdashboards-in-github-pages/" title="R Flexdashboards 101" image="/blog_img/web/flexdash-static-github.png" subtitle="Deploy to Github Pages" >}}
{{< /cards >}}

> PS: They maintain the dynamic functionalities like filter, zoom ploylt graphs etc

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/R_Stocks/" title="RStocks Repository - Associated FlexDashboard" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/" title="Github Pages Recap Post" >}}
{{< /cards >}}

You can also render *or [knit](https://jalcocert.github.io/JAlcocerT/r-knitt-package-guide/)* the html of those flexdashboards and add them to your [Staticaly Generated Sites](https://jalcocert.github.io/JAlcocerT/create-your-website/).


### Shiny Apps

Need a full-fledge WebApp framework for R?

Have a look to **Shiny**.

And if you are looking for a Flexdashboard example (deployed to Github Pages), see:

{{< cards >}}
    {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks/" title="RStocks" image="https://github.com/JAlcocerT/R_Stocks/raw/main/Z_Sample_Data/DividendEvo.jpeg" subtitle="Creating and Deploying a ShinyAPP with R | Blog Post" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks/" title="The RStocks related FlexDashboard" image="/blog_img/data-experiments/Inflation_Mild.JPG" subtitle="Sample flexdashboard deployed to github pages - Retirement Facts" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/R_Stocks" title="R/Stocks Github Repo ↗" icon="github" >}}
{{< /cards >}}

{{< callout type="info" >}}
I covered **Containers for R Apps** [here](https://jalcocert.github.io/JAlcocerT/building-r-shiny-apps-container-image-with-docker/)
{{< /callout >}}

## eBooks with R

We can say that creating ebooks with R language its also data driven.

Get a `.md` file and render it to pdf with R.

Together with a cool [cover that you can create on canva](https://www.canva.com/s/templates?query=ebook), you can have a pdf ebook.

See this folder: https://github.com/JAlcocerT/JAlcocerT/tree/main/Z_ebooks