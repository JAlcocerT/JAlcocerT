---
title: "Just Data Animations"
date: 2026-03-07
draft: false
tags: ["Telemetry x F1 vs Kart","Geo x Statistics","YFinance","Real Estate","Mechanism x MBSD"]
description: 'Unfolding Data this time with some order and gitlab.'
url: 'ai-scripts-and-animated-data'
---


**Tl;DR**

Time to put all those animations together.

{{< cards >}}
  {{< card link="https://gitlab.com/fossengineer1/unfolding-data" title="Unfolding Data | NEW Gitlab Repo" icon="github" >}}
{{< /cards >}}

**Intro**

This is going to be a Python master class.

Or a sneek into the future on how cheap*er* information will be.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-geospatial" title="eda-geospatial Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo Section" icon="github" >}}
{{< /cards >}}






## F1

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-f1" title="eda-f1 Github ↗" icon="github" >}}
{{< /cards >}}



### Kart On Boards

Uploading you action cam session is nice.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

Specially when you use ffmpeg to join parts and ship fast.

But you can also create overlay HUDs with data from GoPro GPS and accelerometer

```sh
#git clone

```

{{< youtube "ctfGunPZwJ4" >}}

And for pure animation part, you can make assumptions and model a faster path for next sessions:

```sh
#git clone

```

{{< youtube "ctfGunPZwJ4" >}}

## Real Estate

This is a snapshot in time of real estate situation in France:

```sh
#git clone

```

{{< youtube "ctfGunPZwJ4" >}}

When we see something, we form a mental model of why things are the way they are.

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

Maybe other factors like: *ease of credit have sth to do?*

```sh

```

Specially for those booms?

Just asking: bring your own theory of how the world works here


## Financial Data x YFinance

Because its too simple and too cool to make such graphs.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-f1" title="eda-f1 Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion x yfinance x libreportfolio" icon="github" >}}
{{< /cards >}}

Plus you can get some insights in between the noise: *does it really matter when you start doing sth?*

```sh
#git clone

```

{{< youtube "ctfGunPZwJ4" >}}
<!-- https://www.youtube.com/watch?v=ctfGunPZwJ4 -->

Or is it just about getting started?

```mermaid
flowchart LR
    %% Styles
    classDef state fill:#E3F2FD,stroke:#1565C0,stroke-width:2px,color:#0D47A1;
    classDef start fill:#43A047,stroke:#1B5E20,stroke-width:2px,color:white;

    %% Nodes
    Start((Start)):::start --> More
    More(Doing MORE):::state
    Better(Doing BETTER):::state
    Newer(Doing NEWER):::state

    %% Internal Feedback Loops (The Grind)
    More -- "Scale Up" --> More
    Better -- "Refine" --> Better
    Newer -- "Test" --> Newer

    %% The Progression Journey
    More -- "Capacity Hit" --> Better
    Better -- "Optimized" --> Newer
    
    %% The Upward Spiral
    Newer -- "New Baseline" --> More
```

> If you are finding excuses not to get started with what you always wanted to do, maybe its [time to change that](#conclusions)


1. GWeiss

2. Nominal CAGR vs Real CAGR vs in EUR vs in GOLD

3. RSP vs SP500


## Physics

### Mechanism

{{< youtube "2xMOxiRz6F4" >}}

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