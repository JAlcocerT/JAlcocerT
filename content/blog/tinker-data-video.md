---
title: "Just Data Animations"
date: 2026-03-07
draft: false
tags: ["Telemetry x F1","Geo x Statistics","YFinance","Real Estate"]
description: 'Unfolding Data this time with some order and gitlab.'
url: 'ai-scripts-and-animated-data'
---


**Tl;DR**

{{< cards >}}
  {{< card link="https://gitlab.com/fossengineer1/unfolding-data" title="Unfolding Data | NEW Repo" icon="github" >}}
{{< /cards >}}

**Intro**

This is going to be a Python master class.

Or a sneek into the future on how cheap*er* information will be

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-geospatial" title="eda-geospatial Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo Section" icon="github" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-f1" title="eda-f1 Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion x yfinance x libreportfolio" icon="github" >}}
{{< /cards >}}



## F1

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

## Real Estate

Asking questions is important.

Because inside the questions we have implicit hypothesis, not only in the answers.

So: which explanation do we give to the rising housing prices ($/m2)?

Before that, lets look how housing prices are changing per region and time.

Because real estate...kind of relates with population...

right?

```sh
cd dk && uv run animate_dk_pop.py
uv run animate_dk_pop_delta.py
```

Maybe other factors like: credits have sth to do?

```sh

```

Specially for those booms?

Just asking: bring your own theory of how the world works here


## Financial Data x YFinance

Because its too simple and too cool to make such graphs.

---

## Conclusions

What if I told you that all these is very cheap to do nowadays?

It is if you have the right knowledge: *part of today's know-how are [prompts](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-with-dao/#for-vibe-coders)* 

Or in other words, how good are you at making questions.

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Service for the Ones with Questions" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge for the ones who want to create step by step" >}}
{{< /cards >}}


### About Gitlab

I have created all this consolidation in Gitlab.

Mainly bc I wanted to save the French DVF data somwhere and Github just allows for 100mb files.

But as I formatted recently, I needed to do the Gitlab Setup again: *all powered by [sha256](https://jalcocert.github.io/JAlcocerT/encryption-101/#the-sha256-algorithm) under the hood!*

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
#ssh -T git@gitlab.com #Preferences -> SSH Keys -> Paste public key -> you are in!
sudo apt install glab # For Debian/Ubuntu
glab auth login
glab repo create my-awesome-project --public
#git push --set-upstream git@gitlab.com:fossengineer/unfolding-data.git main
```



> See how to do so with this file

| Protocol | Hashing (SHA-256) | Actual Encryption |
| :--- | :--- | :--- |
| **Purpose** | Verification & Integrity | Privacy & Secrecy |
| **SSH** | Fingerprints & MACs | AES, ChaCha20 |
| **HTTPS** | Certificates & Handshakes | AES |