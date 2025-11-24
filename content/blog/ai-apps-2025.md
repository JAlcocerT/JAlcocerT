---
title: "SelfHosting AI Apps - My 2025 Favs"
date: 2025-11-30T23:20:21+01:00
draft: false
tags: ["Dev","HomeLab","LLMs"]
description: 'Interesting AI Apps'
url: 'ai-apps-2025'
---

<!-- The primary smart contract address for Polymarket on the Ethereum network is:

0x0d08db747095e91780711724267a183e8522aa64 

Additionally, Polymarket uses proxy wallet contracts and multisig safes for user accounts, which are deployed on the Polygon network. For example, a Polymarket proxy wallet factory address on Polygon is:

0xaB45c5A4B0c941a2F231C04C3f49182e1A254052

These proxy wallet contracts hold users' positions and USDC used within Polymarket's ecosystem, facilitating a smooth user experience.

-->


<!-- 
SOME NAMES for the AI APP

inspired by CryptaIQ and keeping that intelligent, AI-powered vibe:

ProtocolAI – Simple and clear, focusing on AI-powered protocol insights.
DeCryptIQ – Emphasizing crypto and intelligent insights with a "decryption" feel.
BlockWise – Suggests wisdom and understanding of blockchain protocols.
CryptoLens – Implies a clear view or “lens” into understanding crypto.
ChainSage – Conveys expertise and guidance in blockchain.
Protocolize – Playful and suggests simplifying protocols with AI.
InsightChain – Focuses on providing deep insights into blockchain protocols.
CryptoCompass – Implies navigating and understanding the crypto landscape.
IntelliChain – A combination of intelligence and blockchain, emphasizing smart analysis.
BlockIQ – Short, catchy, and focused on intelligent blockchain insights. 
-->

**Interesting Posts**

1. https://darko.io/posts/but-auth-is-hard


### Authentication

This one will require your focus: https://darko.io/posts/but-auth-is-hard

As per my [recent post](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/), you have few options, like:

1. [TinaAuth](#tinyauth)
2. [LogTo](#logto)

But dont worry, its a solved problem.

The article, titled **"BuT, aUtH iS HaRd,"** argues against the prevalent industry narrative that building authentication (Auth) is inherently difficult.

The author contends that **Auth is not hard, but rather "boring, red-tapey, and a solved problem."**

**Auth Basics Are Simple**

The author recalls that "rolling your own" basic email/password authentication in the past (e.g., with PHP/MD5) was a straightforward process of hashing, salting, storing credentials, and setting a cookie.

To demonstrate this, the author provides a **150-line Proof-of-Concept (PoC)** using Express and Passport, showing that basic features like email/password login and adding a social provider (GitHub OAuth2) are **dull and repetitive, but not complex** to implement at a toy level.


Complexity Lies in the Extras

The real challenge with authentication isn't the core login logic, but the surrounding features, which the author calls **"death by a thousand cuts."**

These include:

* **Security and Maintenance:** Staying up-to-date with security standards, standards bodies (RfCs), and potential breaches.
* **User Experience (UX):** Implementing 2FA/MFA, password resets, and user management features.
* **Integration:** Handling the complexity of connecting to hundreds of different OAuth providers, each with specific requirements, and managing account merges.

When to Roll Your Own vs. Use a Service

The author's core **takeaway is that Auth is a commodity** and reinventing the wheel is usually a waste of time. 

They offer clear guidance on when developers should build their own solution:

| Project Type | Recommendation | Rationale |
| :--- | :--- | :--- |
| **Toy Project / Indie / Educational** | **Roll Your Own** | It's a great way to learn the basics. |
| **Startups, Scaleups, and Above** | **Do NOT Roll Your Own** | Time is better spent building the actual product; Auth is a solved, boring problem. |

Open-Source Alternatives

The article concludes by promoting the robust **self-hosted and FOSS (Free and Open Source Software) landscape** for authentication, offering various choices for developers who prefer to own their stack:

* **Auth Libraries:** Passport.js, Lucia, Auth.js.
* **Auth Servers:** Keycloak, SuperTokens, FusionAuth, Authelia.
* **Storage + Auth Platforms:** Supabase, Pocketbase.

The final message is to **educate, not gatekeep**, and to recognize that while Auth is essential, its implementation is a **"red tape"** task best handled by existing solutions rather than rebuilt from scratch.

https://libraries.io/pypi/embedchain

* Groq - https://console.groq.com/keys

<!-- * https://github.com/mckaywrigley/chatbot-ui - MIT Licensed

>  AI chat for every model. 

https://github.com/mckaywrigley/chatbot-ui?tab=readme-ov-file#local-quickstart with supabase -->
<!-- 
https://theroamingworkshop.cloud/b/2429/%F0%9F%90%B8coqui-ai-tts-ultra-rapida-generacion-y-clonacion-de-voz-a-partir-de-texto-multilenguaje/
https://www.restack.io/p/coqui-tts-answer-spanish-cat-ai
https://www.yeschat.ai/es/t/coqui-tts -->

https://pytorch.org/get-started/locally/

https://theresanaiforthat.com/most-saved/

* **Others:** [LibreChat](https://www.youtube.com/watch?v=0BRnK5BGZHU), Autogen + AutogenStudio https://microsoft.github.io/autogen/blog/2023/12/01/AutoGenStudio/ or [Quivir](https://github.com/StanGirard/quivr) with great [docs](https://docs.quivr.app/home/intro) or [LocalGPT](https://github.com/PromtEngineer/localGPT).
  * Bindings:
    * https://github.com/abetlen/llama-cpp-python
* https://github.com/khoj-ai/khoj



The goal of **this post** is:

1. To review some of the [AI projects](#ai-apps) that are helpful on my workflow
2. To learn how to use [Caddy](#how-to-setup-caddy) as [NGINX](#how-to-install-nginx)/[Traefik](#how-to-install-traefik) alternative to get HTTPs certificates


<!-- https://www.youtube.com/watch?v=XH9XgiVM_z4 -->
{{< youtube "XH9XgiVM_z4" >}}

{{< details title="DNS challenge | PorkBun 📌" closed="true" >}}



{{< /details >}}

### Voice to Text

* [Piper](https://github.com/rhasspy/piper) - Also works [Text to Voice](https://www.youtube.com/watch?v=SzRF50UwzYk)
  * [Voices at HF](https://huggingface.co/rhasspy/piper-voices/tree/main)

See https://github.com/mumble-voip/mumble

>  Mumble is an open-source, low-latency, high quality voice chat software. 

---

{{% details title="How to Secure my Services?" closed="true" %}}

* [NGINX](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/)
* [Cloudflare](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/)
  * It allows
* Authelia / Zitadel / Authentik

{{% /details %}}

Thanks To:

* https://akashrajpurohit.com/blog/setup-caddy-with-automatic-ssl-certificates-with-cloudflare/
* https://akashrajpurohit.com/blog/setup-authelia-for-sso-authentication/

### How to Back Up my Server?

Duplicati to other location (HD / Mega, One drive, s3...)

You can also try with [Python Venvs or Conda](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/):


## Web x AI

Ive been using a lot vibe coding, like windsurf and CLI tools like gemini this year.

There were interesting tools: scrapegraph, firecrawl, crawl4ai...

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web" title="Tinkering with Scrapping Tools" image="/videos/job_offers.png" subtitle="Scrapped Job Offers Analytics" >}}
{{< /cards >}}