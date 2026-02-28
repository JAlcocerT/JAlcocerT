---
title: "F1 Data Animations"
date: 2026-02-28
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

creating HUDs overlays for my action cam videos...

Today, its about F1.

But not the ML f1 score, just...formula 1.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

Particularly, [F1 data](#f1-animated-stories).

## F1 Animated Stories

According to people risking their money in Polymarket: the championship is leaning towards Ferrari and Mercedes.

But how about digging to car telemetry and lap times?

```sh
#sudo apt install gh
gh auth login
#gh repo create eda-f1 --private --source=. --remote=origin --push
    
git init && git add . && git commit -m "Initial commit: simple eda-f1" && gh repo create eda-f1 --private --source=. --remote=origin --push
```

Lets build some data stories that can *potentially* be more interesting than races itself.

### The Data

* https://github.com/IAmTomShaw/f1-race-replay 
    * https://github.com/JAlcocerT/f1-race-replay

> Uses fastf1 package to [source the data via API](https://jalcocert.github.io/JAlcocerT/interesting-apis/#formula-1)

The cool telemetry data is from 2018+, but there is lap timing from 1950 :

```sh
uv init

uv add -r requirements.txt
uv run check_sessions.py
```

```sh
uv run extract_laps.py
uv run plot_laps.py
```

```sh
uv run extract_telemetry.py
uv run plot_telemetry.py
```

### The Look and Feel

1. With the BRD -> Development plan approach

2. This [enhanced prompt](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-with-dao/#for-vibe-coders) to get amazing UIs

3. Plus, these [CRO tricks](https://www.youtube.com/watch?v=vySA02B8SLE)

{{< youtube "vySA02B8SLE" >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}


> See https://github.com/petervdpas/goop2 Goop² is an ephemeral, peer-to-peer system for personal web spaces.


---

## Conclusions

Was there any doubt that new regulations make the ones learning faster be way ahead of the rest?

<!-- https://www.youtube.com/watch?v=Ujb1Vrjlo8k -->

{{< youtube "Ujb1Vrjlo8k" >}}

Ops

I mean, Im came to this post after the geospatial eda and some oa5 x hud...

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-geospatial" title="eda-geospatial Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo Section" icon="github" >}}
{{< /cards >}}

This is what reality shows it happens after an aggresive change of rules:

```sh
uv run f1_q3_plots.py
```

Was there any surprise that keeping a rule long enough is what makes teams be closer to each other?

Diminishing returns....anyone?

```sh
uv run f1_q3_short.py
```

<!-- 
https://youtube.com/shorts/BVqQdhvKe5o 
-->

{{< youtube "BVqQdhvKe5o" >}}


> AUS 2025 Q3 P1 to P10 gap ~1s (+0.835s)

And this is not a debate whether making drivers race with less dispair cars is good or not.

Neither if F1 should be similar to e-f1...or just going close to the limit each lap.

<!-- 
https://youtu.be/DCHhpNX6EYM
 -->

{{< youtube "DCHhpNX6EYM" >}}


### About Unfolding Data

It was about time to make some use of this fantastic api.

Because, in case you havent realize yet: *shipping is becoming more and more about asking questions*

Do you have questions?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

I had some, and created these:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-f1" title="eda-f1 Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion x yfinance x libreportfolio" icon="github" >}}
{{< /cards >}}

Also, thinking about unifying these would be next.

Because IoTrack and Unfolding data need some love and attention.

And yep: making those animated stories of points per seasons is possible thanks to:

```sh
uv run extract_results.py #race classification
#uv run extract_qualifying.py #saturday qualifying results
```