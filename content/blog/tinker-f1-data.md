---
title: "F1"
date: 2026-03-06
draft: false
tags: ["Telemetry x Racing","F1 x PolyMarket","Landing CRO"]
description: 'A landing and f1 data. How will you ever want to leave such site?'
url: 'f1-data-animated'
---

**Tl;DR**

The season has just started: *How much slower cars are*?

How about looking at some data?

**Intro**

After talking about geo recently

and creating HUDs overlays for my action cam videos...

Today, its about F1.

But not the ML f1 score, just...formula 1.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

Particularly, F1 data:


```sh
#sudo apt install gh
gh auth login
#gh repo create eda-geospatial --private --source=. --remote=origin --push
    
git init && git add . && git commit -m "Initial commit: simple eda-f1" && gh repo create eda-geospatial --private --source=. --remote=origin --push
```


### The Data


* https://github.com/IAmTomShaw/f1-race-replay 
    * https://github.com/JAlcocerT/f1-race-replay

> Uses fastf1 package to [source the data via API](https://jalcocert.github.io/JAlcocerT/interesting-apis/#formula-1)


### The Look and Feel

1. With the BRD -> Development plan approach

2. this enhanced prompt to get amazing UIs

3. Plus, these [CRO tricks](https://www.youtube.com/watch?v=vySA02B8SLE)

{{< youtube "vySA02B8SLE" >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}


---

## Conclusions


Coming from the geospatial eda and some oa5 x hud...

It was about time to make some use of this fantastic api.s