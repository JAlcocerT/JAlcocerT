---
title: "[JAlcocerTech] Services Recap"
date: 2026-06-05T23:20:21+01:00
draft: false
tags: ["RoadMap26","Herdr x Codex CLI x Hermes","Cold email outreach x Leads","APIFY"]
description: 'JAlcocerTech Leads and Services mid 2026. Beyond growing tomatoes.'
url: 'jalcocertech-services-snapshot'
---


**Tl;DR**

The last piece to combince me that this is enough.

The proof that you can make money with a shitty landing: `https://genkinfy.com/#faq`

```md
make audit-full-fast URL=https://genkinfy.com/
SKIP_LINKS=false LINK_CHECK_METHOD=${LINK_CHECK_METHOD:-lychee-docker} ./audit-master.sh "https://genkinfy.com/"
╔════════════════════════════════════════════════════════════╗
║                Master Audit - Full Site Analysis           ║
╚════════════════════════════════════════════════════════════╝

Target: https://genkinfy.com/
Orchestration:
 - Lighthouse: ACTIVE
 - Link Check: ACTIVE
 - SEO Crawl:  ACTIVE
 - Security:   ACTIVE

Launching audit phases in parallel...
 → Lighthouse PID=419907
 → LinkCheck PID=419908
 → SEO PID=419909
 → Security PID=419910
 → Latency PID=419911
All phases finished in 32s

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                FINAL AUDIT RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Performance:              31/100
SEO (Technical):          95/100
Link Integrity:           70/100
Security Headers:         0/100
──────────────────────────────────────────────────────────
OVERALL SITE GRADE:       45/100 ⭐

Master report saved to: ./master-reports/master-20260604-192953.json
```

```sh
LINK_CHECK_TIMEOUT_SECONDS=0 make audit-full URL=https://fossengineer.com
LINK_CHECK_TIMEOUT_SECONDS=0 ./linkcheck-audit.sh https://fossengineer.com docker
```

**Intro**

After the post-wedding thoughts, it was time to make this clear.

Specially that im leveraging outreach


## The services

https://github.com/JAlcocerT/jalcocertech/tree/main-site-cloudflare-hub

### The free ones

Ive consolidating the `diy.jalcocertech` into the `ebook` one.

Particularly at: https://ebooks.jalcocertech.com/books/web-diy/

Bringing the images I had in there:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/obfuscate" title="DIY JAlcocerTech x Obfuscation | Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/1ton-ebooks" title="ebboks JAlcocerTech | Github ↗" icon="github" >}}
{{< /cards >}}


#### JAlcocerTech Ebooks 


{{< cards >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

While creating some more images via OpenAI to improve explainability:



Ive also improved the main `www.jalcocertech`

• Done on branch main-site-cloudflare-hub.


#### FOSSEngineer x HomeLab 

There has been several improvements in the foss workflow:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/" title="HomeLab | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

#### This blog

I added a new skill to this repository to help me improve my writting:

```sh

```

It incorporates the concept of zettelkasten: one post, one topic.


#### JAlcocerTech WebAudits


Ive done few web audits, to people I just met - With email report

Santi, this one goes for you to.

I mean, the new skill that i got:

```sh

```

##### Codex CLI WebAudit to Report

The new web audit is deployed normally at:

But hey, if all the goodies are happening within a internal CLI and there is a `.json` that consolidates it all...

cant that be passed to a one time codex prompt with a skill that generates a nice one pager branded report?

{{< cards >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
{{< /cards >}}


### Productized Services

From the consulting landing, which has received improvements: Committed on `landing-improvements branch`


#### GenBI - Shopify QnA

Initially this is coming from:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
 {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

Now, I have:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
 {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

```sh

```

### The BEST - DFY

The top of the list.

My attention caring about your problems: 

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Tier of Service for the ones that cant wait to get value" >}}
{{< /cards >}}

#### Engineering services

Couldnt resist to cold email to the founder of diode as it resonates with me

Stay tuned

Because this resonated a lot with

#### IoT, Crops and Energy

You name it.

it all started here:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/RPi" title="RPi Github with scripts ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

And continued:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

The final boss is:


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

#### Multi Body Systems Dynamics dot com

I took all the goodies from the github and forgejo repos: *2D/3D

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}


> I couldnt avoid to email again to 

---

## Conclusions

### My OutReach Setup


{{< details title="Weather Patterns with MeteoStat 📌" closed="true" >}}


{{< /details >}}

### Inbound marketing x Branded Videos

In theory, artifacts like ebooks, this blog, fossengineer... should give you inbound traffic.

But

The openAI image gpt 2 is so great that there is really no excuse not to get this right.

Doing 3 min videos (with xyz words aka xyz tokens) and 30 second shorts...


Its just one skill away:

```sh

```

---

## FAQ

### Whats your current agentic setup?

Im using right now herdr *> tmux* to better orchestrate agents sessions and dont go crazy with deliveries waiting for my input.

```sh
herdr #go out with ctrl + b then q
```
