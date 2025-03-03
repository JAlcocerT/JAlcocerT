---
title: "What I've learnt about R Language"
date: 2025-01-01
draft: false
tags: ["dev"]
summary: 'Interesting stuff Ive learn along the way when using R'
url: 'useful-r-stuff'
---

{{< callout type="info" >}}
This repository has a lot https://github.com/qinwf/awesome-R and I have done an [R Recap on this one](https://jalcocert.github.io/JAlcocerT/r-language-101/)
{{< /callout >}}


## Data Driven R

What I enjoy about R, is that it can do very cool data stuff.

> R can do many things, from [simple **Websites** with Knit pkg](https://jalcocert.github.io/JAlcocerT/r-knitt-package-guide/), to Data Apps

### FlexDashboards

With R, you can also have *'static dashboard'*, which dont need a server, like Shiny or Streamlit.

They can be hosted, for example, on Github Pages:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/guide-r-flexdashboards-in-github-pages/" title="R Flexdashboards 101" image="/blog_img/web/flexdash-static-github.png" subtitle="Deploy to Github Pages" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/R_Stocks/" title="RStocks Associated FlexDashboard" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/" title="Github Pages" >}}
{{< /cards >}}

### Shiny Apps

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/R_Stocks" title="RStocks Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for RStocks" >}}
    {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks/" title="The RStocks App" image="/blog_img/hardware/x300.jpg" subtitle="Creating and Deploying a ShinyAPP with R" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks/" title="The RStocks App" image="/blog_img/data-experiments/Inflation_Mild.JPG" subtitle="Creating and Deploying a ShinyAPP with R" >}}
{{< /cards >}}

## Containers for R Apps

https://jalcocert.github.io/JAlcocerT/building-r-shiny-apps-container-image-with-docker/



---



<!-- Flexdashboards: bootstrap, css, framekow (a,b,c),mcustomize from R with {bslib} 
RSHiny + bslib

DASH - flask, plotly.js, react.js, dash_bootstrap_components

heroku
netlify? -->