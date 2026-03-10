---
title: "Idea to resolution"
date: 2026-04-01T07:00:21+01:00
draft: false
tags: ["Unit Economics 201","Prompts x Requirements x EAyP v3"]
description: 'What is learning? Take feedback from the value equation.'
url: 'take-ideas-to-their-digital-resolution'
math: true
---

**Tl;DR**

Thoughts after one year of vibe coding.

* https://app.fireflies.ai/perks
* Perplexity and commet (from W11 only on the desktop) 


**Intro**

I stopped copy pasting from Gemini web UI and start using codex CLI, gemini cli and so on around one year ago.

Later I tried windsurf, cursor and finally antigravity.

Lately, Im paying claude PRO and im quite happy with it.

The productivity change [and learnings](#what-i-have-shipped) has been massive.

Who could have guessed, the more repetitions you do, the more architecture you understand and the more predictable things become.

![Vibe Coding - Simpsons Halloween S2](/blog_img/dev/vibe-coding.png)

This is when I started moving from streamlit, to pure web apps.



---

## Conclusions



### What I have shipped

Ive shipped and learn many what to do and several NOT to do.

They all plugged into these 2 lovely equations:

$$
P \times V \times GM \times OM \times IF \times T
$$

From where you can create a tier of services with *some sort of sense*: *yea, the [value ladder](https://jalcocert.github.io/JAlcocerT/shopify-business-data-analytics/#how-is-this-been-shaped)!*

```sh

#3bodies OSS

```


```mermaid
flowchart LR
    %% --- Styles ---
    classDef free fill:#E8F5E9,stroke:#2E7D32,stroke-width:2px,color:#1B5E20;
    classDef low fill:#FFF9C4,stroke:#FBC02D,stroke-width:2px,color:#FBC02D;
    classDef mid fill:#FFE0B2,stroke:#F57C00,stroke-width:2px,color:#F57C00;
    classDef high fill:#FFCDD2,stroke:#C62828,stroke-width:2px,color:#C62828;
    classDef bridge fill:#E3F2FD,stroke:#1565C0,stroke-width:3px,color:#0D47A1;

    %% --- Nodes ---
    L0("Free Content<br/>($0)"):::free
    L1("AuditMagnet 🛡️<br/>(Free Web Audit )"):::free
    L11(" Blog/Youtube"):::free
    L12(" ebooks"):::free
    L2("DIY<br/>(Optimization Guides) $"):::low
    L3("Done With You<br/>(Consulting) $$"):::mid
    L4("Done For You<br/>(Full Service) $$$"):::high
    L44("GenBI<br/>Shopify PoC"):::bridge
    L45("Real Estate<br/>Funnel Bot"):::bridge


    %% --- Connections ---
    L0 --> L1
    L0 --> L2
    L0 --> L11
    L0 --> L12
    L2 --> L3
    L3 --> L4
    L44 -->|Enhancing| L4
    L45 -->|Enhancing| L4
```


Anyways, make sure to go through [the business ideas checklist](https://jalcocert.github.io/JAlcocerT/ideas-and-opportunities-health-check/#business-idea-checklist) and as cheap as code is now, make sure you [ask questions](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-after-learning/#questions) before you start prompting.

For me, lately its all about [this greenfield prompt](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-with-dao/#for-vibe-coders) or this other tech stack.

Combined with the best BRD / PRD / FRD / Project Charter / CRQ practices ever...

You can build your PoC in an afternoon and the [MVP in a week with some sense](https://jalcocert.github.io/JAlcocerT/ideas-and-opportunities-health-check/#building-a-how-with-sense)

When interested on creating with potential financial incentives, focus on prospecting, then define a proper why and what.

If you just care about creating for the sake of it / tinkering, you are good to go with the why and what to get a working how.

In that case, just enjoy dont expect money to flow.

Around those concepts, Ive been playing with:

```sh
whois leadarchitect.org| grep -i -E "(creation|created|registered)"
#nslookup leadarchitect.org
dig slubnechwile.com
dig entreagujaypunto.com
```

Some of which I will let go if they dont kick off before the domain renewal.

The good thing about 'not caring' about people churning, is that you can **white-label solutions** with the expertise you have adquired building [those underpriced solutions](https://jalcocert.github.io/JAlcocerT/white-label-real-estate-solution/#why-this-pricing):

```sh
#https://realestate.jalcocertech.com
#https://genbi.jalcocertech.com
#https://webaudit.jalcocertech.com/
#mbsd...
# f1...
```

Most likely objections are not about pricing, but perceived value.

Make sure to understand that selling is 20% about the thing and [80% about people and psyco](https://jalcocert.github.io/JAlcocerT/how-is-for-agents-what-and-why-for-you/#psyco)

It just the right time to admit that [wrong client selection has consequences](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-after-learning/#the-right-value-prop) and despite *paying with my own pocket* B2C tend to see costs (instead of potential ROI when a problem is solved for B2B) and chances of churning are high.

You should now the drill by now: [attract, convert, deliver](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-after-learning/#attract-convert-deliver).

---

## FAQ

### My favourite prompts

I tried to migrate [eayp from HUGO v1](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/#photo-galleries) to [v2a/b here](https://jalcocert.github.io/JAlcocerT/do-your-instagram/).

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/entreagujaypunto-next-gallery" title="EAyP v2a Next Gallery ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/entreagujaypunto-astro-payload" title="EAyP v2b Astro Gallery ↗" icon="github" >}}
{{< /cards >}}


{{% details title=" 🚀" closed="true" %}}


{{% /details %}}

{{% details title=" 🚀" closed="true" %}}


{{% /details %}}

The [web audits](https://jalcocert.github.io/JAlcocerT/do-your-instagram/#web-audits) were fine, but the edits and uploads...not there.

So for the v3...

```sh

```

{{% details title="All my requirements for a website 🚀" closed="true" %}}

1. Editor in one subdomain, delivery static if possible and in another

2. For UI Astro and Vite allow really cool features

{{% /details %}}