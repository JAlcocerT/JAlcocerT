---
title: "A SaaS with 100% Churn, yet LTV > CAC"
date: 2026-01-13T14:20:21+01:00
draft: false
tags: ["Landing x MVP SaaS","BiP x RoadMap26","MailTrap ESP x Firebase FireStore"]
description: 'Ship and direct traffic via Google ads. Weddings 2026'
url: 'bring-eyes-to-your-saas'
---


**Tl;DR**

MVP first - *Tomate fuco y a toma pcul0*

Get those eyes going via ads towards: `https://www.slubnechwile.com/`

See what works and what not - PMF :)

```sh
npm install stripe firebase-admin
```


**Intro**

For **green field AI vibe coding** has been great, for brown field...not that much.

Despite the project docs with AI was interesting

Thats why I want to put together some boilerplates that just get the work done.

And...ship sth already this year.

The main pieces are clear already as per:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/#email-verification" title="Email Verification | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/serverless/" title="Serverless | Docs ↗" icon="book-open" >}}
{{< /cards >}}

I got to know about NextJS for SSG purposes.

And themes like SaaSify can do the trick.

For SaaS, there are OSS starter kits like: https://github.com/nextacular/nextacular

https://nextacular.co/

https://docs.nextacular.co/

> MIT |  An open-source starter kit that will help you build full-stack multi-tenant SaaS platforms efficiently and help you focus on developing your core SaaS features. Built on top of popular and modern technologies such as Next JS, Tailwind, Prisma, and Stripe. 


https://developers.cloudflare.com/pages/framework-guides/nextjs/

<https://jamstack.org/generators/next/>

<https://nextjs.org/>


<https://vercel.com/templates/next.js>

<https://jamstackthemes.dev/theme/nextjs-notion-starter-kit/>
<https://transitivebullsh.it/nextjs-notion-starter-kit>

<https://transitivebullsh.it/>




People do their things:

* https://libreweddingplanner.org/docs/Features/website_builder/
* https://docs.wedding-share.org/

I want to do mine:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/" title="BiP | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/#initial-prompts-for-success" title="Vibe Coding | Docs ↗" icon="book-open" >}}
{{< /cards >}}


* **S vs D:**
  * Supply - ~ infinite (∞), scalable via [Serverless storage](https://jalcocert.github.io/JAlcocerT/docs/dev/serverless/#cloudflare-r2).
  * Demand - constrained, ad driven

![Supply and Demand for a SaaS](/blog_img/entrepre/bip-supply-demand.png)

With a very clear: Online marketing and an online delivery

**Type of offer**: attraction ~~/ upsale / downsale / continuity~~ *that's how the landing should be presented, later will be other offers*

![alt text](/blog_img/dev/tiiny-host-attractionoffer.png)


These kind of **micro-SaaS** are so so cool:

1. https://tiiny.host/

> The simplest way to host & share your work online

2. https://github.com/uselinked/website from https://uselinked.com/

3. https://supersaas.dev/ -  The Simple, Fast & Smart Nuxt 3 Fullstack Kit.

> Starter kit / boilerplate landing with...a one time payment / Lifetime access.

4. https://github.com/anthonylan/angie - I love those arrows and the look... https://github.com/JAlcocerT/angie

> MIT |  Angie is a free, open-source portfolio template featuring a bold, brutalist design that helps you stand out and showcase your work with style. 

Why couldnt SLubnyChwile be one of those cool UIs? :)

Imagine that [nice mermaid sankey](https://mermaid.live/edit#pako:eNptjjFvwjAQhf9KdFORLOTETuJ4K7AgdUBCXSovLr4mEcRGJmmbIv57HSpC1XTx-d29d9-dYecMgoSTtnvslX3S1tS2jDa6RLKtSxs9H0me0j-Tx9egnEUTPWzb0IjiGUkGl7K30LWuLckovTcnuWRG4l-54F83DZpatxhtOr-r9AkJS-l9vvDu4xQOufFGvcKD7sPmMRYP5HE8QbMR_Q9y6ew7-nZwL7oe_ezniAlj6gtUIFD62oBsfYcEGvSNHiSclY0iBW2FDSqQ4Wu03ytQ9hIyR21fnGtuMe-6sgL5pg-BA93RhANXtS69vlvQGvRL19kWZMquK0Ce4RNknBXzQtC44LSI8yITgkAPMqFsXjDBWJGw8AjOLwS-rlQ6z9KcU8oFy0TMeZJfvgHQMq7J) representing the conversion funnel of such web app

and [this](https://mermaid.live/edit#pako:eNp9Vktu40YQvUqDwAwcQB_zpw8DJNBI4mAQ2WEs2QZEedEWy1LPkN1Es2lbEbwLkOwCJNnnAtllk31ukgskR0iRTcmkHUQrkap6VfXeq27tjbWIwPCMjaTpliwmK07w8-YNabfbZJ7flu8zcickGcdUMrUrftFRWfUzGYX__PrzD2QGNCLvgYOkiglO3pI5qDwlvgS40SnFZ2SGgRRZCmuFmGz9KSOj6AZhvyAj62RGecT4hgR0Ax65onEOBMNTkbEC9LPPa0CWTrL3gWQJlTsyXow8cr1L5Z-_3-YfyZKSCZWJ-PKpnmVjFjn_MNXJw3D6yFT3ncj5Gm5exS1GX-k45-QCNixT1Wy-kIlHzmkCLTJNKItbWEpBoz1HZ7on812mICmnYRFG6QzkZyyheByt11heNZJdndw7mdBseyuojLyKzisGD43Qng7th6N10ZtHZmL9iYzzTImEXF7MCHQ2nRbpUs4p-0g5tU6tXmPUvkYYHBHGIk9jIAvIVEYu01igsi4JtkIJMmMJU430QZm-NKt3wKMVf2GRJVrkl-8Ql9-DzEoGc86hICGguwS4qjlkaR4pKz11nkuVy8IV71ADntWnX5q6uLW32w45E1yhXQMJ7WuICiM1tF9alfZdDQll7tQMS0EOdntLFizN6hNOzeaEz1joj64eSukQ-4BVG3WCQ8SMA_n67g5kHXhp6yznhczkfY7UIzVZ9iBkVBi7MbS21tLdzyEu9qhksdzSBQPZnNk9zDyjaQaRzuwd2vQZpzGZPqascvY1lRx5a3SpHeabr2CL8QPKKtD-UbZK02Jz15Bh1Ub32m7LZ7td8riwbInk40qgMkf-_8tNQeGmn3T8HOQ9WxdLpNh9OULdSdqagRlWsFUpTXK1Ik2uG4NX6dar9KoaoI3jmMyVkHhedSfigZe7smBJU-jALDTSB1Zgh9V-oU9TirOSM4SSjMYZ-eaCjNEFDfsF2iWBEx741S1XixkIqVBDlj37BXlX6AtoTBNo1wTuvtoNPLJ2dasE-tAJekdhyjrHE6Dc_2Zn2hlB_9hZkwJkhkr1v1r64V-_ff_3Hz_iGJk6bC2SdYlmjeOalkG_cuH-RY3SvJA1XO-bB9eXSulF962D6_HC4Kp7xSIQVaHXu6khCofrAtrkvv0sAo1jwFunOG4h6o7keouVGpT71uvN8bWavrPXGShdvYXmGE79svLdcMqb-E79kvJ74QXcA8_x5jxi-wDlotQ0MFp437PI8JTMoWUgh8gKPhr7ImRlqC0ksDI8_BrBHc1jtTJW_AnTUsqXQiSHTCnyzdbw7tC4-JSnxeU2YRSFfQ7BeiDHxf1meG6JYHh749HwTNPuuMNTtz8YOD1nYA97LWNneO2-43YsG19aQ8sa2IPeU8v4tixqdoZDx3SG1ungtIcB_X7LgIjh8p3pfzHln5mnfwHbuaCF)

The **launch strategy**: *aka, focus strategy*

| Element | Decision |
| :--- | :--- |
| **One Avatar** | |
| **One Product** | |
| **One Channel** | |

The **Tier of Service**: A DFY that I made [here](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt) and Ive transformed into **DIY** *(thanks to leverage x tech)* with the cool serverless tech stack below.

The **customer segmentation**: B2C


The expected


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/serverless/" title="Serverless | Docs ↗" icon="book-open" >}}
{{< /cards >}}

The **tech stack**:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)** | | |
| **Database** | | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | | |
| **E-mail/ESP** | | |
| **Analytics** | | |
| **Hosting** | | |




{{< details title="Choosing an UI tech stack 📌" closed="true" >}}

* HUGO: Lightning-fast speed.
* Astro: Built-in support for server-side rendering (SSR).
* Jekyll: Simplicity and ease of use, particularly for blogging.
* Gatsby: Rich ecosystem of plugins and a vibrant community.

**Gatsby**: Gatsby is a popular static site generator within the **React** ecosystem, leveraging React for building static sites and offering a rich plugin ecosystem.

- **Pros**:
  - Ability to pull data from various sources, including CMSs and APIs.
  - React-based, enabling component-based development and rich interactivity.
  - Extensive plugin ecosystem for adding functionality and integrating with third-party services.
- **Cons**:
  - Longer build times for large projects due to complex data fetching and processing.
  - Steeper learning curve for developers unfamiliar with React.
  - Requires a Node.js environment for development and building.

- **Next.js**: Next.js is primarily known as a **React** framework for SSR and CSR, but it also offers SSG capabilities, providing flexibility for different project needs.

- **Pros**:
  - Versatility to choose between SSR, CSR, or SSG based on project requirements.
  - Seamless integration with React for building dynamic user interfaces.
  - Hybrid capabilities for blending static and dynamic content in a single application.
- **Cons**:
  - Complex configuration compared to simpler static site generators.
  - Requires familiarity with React and Node.js for effective usage.
  - Limited built-in features compared to dedicated static site generators like Hugo.

{{< /details >}}

## Getting Here

This has been...a series of *random* steps.

```sh
#dig slubnechwile.com any
#ping slubnechwile.com

git clone https://github.com/JAlcocerT/slubnechwile
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/slubnechwile" title="Jun25 SlubneChwile SaaSify ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/slubne-chwile-y26" title="Jan26 Slubne-Chwile ↗" icon="github" >}}
{{< /cards >}}

```sh
git init && git add . && git commit -m "Initial commit: starting for google ads" && gh repo create slubne-chwile-y26 --private --source=. --remote=origin --push
```

And it goes like: *hey antigravity...and Claude 4.5 Opus*

```md
can you have a look to the z-brd, z-frd  z-prd and z-user-flow documents and let me know if the requirement and end goal of the project is clear?

wherever you see gap, lets clarify them into a z-clarifications.md document, where i will provide direction
```

Configure your stripe payment link: `https://dashboard.stripe.com/`

```md
Pełny Pakiet Weselny: Prywatna galeria 360°, 250GB miejsca na zdjęcia i filmy od gości, nielimitowane przesyłanie przez 14 dni oraz 1 rok bezpiecznego przechowywania pamiątek
```

And remember that you can prefix the email that has paid by doing [like so](https://jalcocert.github.io/JAlcocerT/flask-cms-for-ssgs/#a-cms-with-flask).

For your launch phase with a low daily budget, you should **optimize for Sign-ups** (Account Creation) rather than Purchases.

The ad algorithm needs to learn and also you need to learn with PostHog what are the frictions points.

* Oct25 - https://jalcocert.github.io/JAlcocerT/building-in-public-wedding-photo-galleries/
* Jun25 - https://jalcocert.github.io/JAlcocerT/wedding-photo-galleries/
* Feb25 - https://jalcocert.github.io/JAlcocerT/software-for-weddings/

{{% steps %}}

### Tinkered with Selfhosting

Like...a lot.

### Discovered one for weddings

I tested [wedding share](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#weddingshare-setup)...and it looked cool.

All of this happened [while travelling](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/).

Yea, I took the laptop :)

### Also Saw

* https://github.com/jacoknapp/EternalVows

> Lightweight wedding website that you host | Configurable via yaml!

### DFY for a close one

But they needed something simpler.

So i made a filebrowser + custom QR setup.

How could I not tinker with QR for the sake of it...

With Python:

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)


And with node:

![QR Code](https://raw.githubusercontent.com/JAlcocerT/Home-Lab/main/py-static/qr-pdf/qr-sample.png)

Even with a [SliDev VUE Components like this one](https://github.com/JAlcocerT/slidev-editor/blob/logtojseauth/slidev/slidev-ba-tech-talk-mermaid-exadel/components/QRCode.vue) you can generate QRs!


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/py-static/qr-pdf" title="QR CSR | Python static server ↗" icon="github" >}}
{{< /cards >}}


Not all the content is indexed in the same way across engines and you can miss valuable info.

{{< callout type="info" >}}
**Thanks to Ecosia** I could find how to add Web Analytics to the [Jekyll Chirpy Theme](https://jalcocert.github.io/JAlcocerT/raspberrypi-starting-guide/)!
{{< /callout >}}


Even Reqable has one: Tools -> More QR-Code

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)


Even with a [SliDev VUE Components like this one](https://github.com/JAlcocerT/slidev-editor/blob/logtojseauth/slidev/slidev-ba-tech-talk-mermaid-exadel/components/QRCode.vue) you can generate QRs!


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/py-static/qr-pdf" title="QR CSR | Python static server ↗" icon="github" >}}
{{< /cards >}}


![QR Code](https://raw.githubusercontent.com/JAlcocerT/Home-Lab/main/py-static/qr-pdf/qr-sample.png)

<!-- https://github.com/JAlcocerT/Home-Lab/blob/main/py-static/qr-pdf/qr-sample.png -->

### Tinkered with Serverless

And i dont mean static deploy to cloudflare pages this time

I mean about serverless s3 storage, via cf R2.

Which i got familiar with on [this post](https://jalcocert.github.io/JAlcocerT/hugo-pocketbase-and-r2/).

![alt text](/blog_img/dev/cf/r2.png)

### And ... more websites


{{% /steps %}}


### Chatting with Gemini about the offer


{{% details title="ADS + BANT 🚀" closed="true" %}}

That is the ultimate, high-level business question.

Your entire flow is strategically built to identify, filter, and cater to the four key elements of a qualified lead—**Budget, Authority, Need, and Timing (BANT)**—which is especially important when using paid advertising.

Here is how the *Ślubne Chwile* flow addresses and converts leads based on BANT criteria:

## 🎯 Matching the Flow to the BANT Sales Criteria

### 1. **Need (The Problem Solver)**

* **Definition:** Does the prospect have a legitimate problem that your service solves? (Losing guest photos/videos).
* **Flow Mechanism:**
    * **Landing Page:** The Hero Section and the Benefits Section (Section 2) are entirely dedicated to establishing need. The headlines explicitly state the problem ("Nie Strać Żadnej Uśmiechniętej Chwili") and offer the solution.
    * **Free Test:** Allowing them to upload 5 photos and see the Admin Panel validates the need for collection and organization.
* **Verdict:** **Need is established upon Landing Page conversion.** If they register, they confirm they have this problem.

### 2. **Timing (The Time-Driven Nudge)**

* **Definition:** When does the prospect need the solution? (Tied to the wedding date).
* **Flow Mechanism:**
    * **Registration:** **Collecting the Wedding Date** is the single most critical piece of BANT data. It allows you to schedule the rest of the sales process.
    * **Email Nurturing:** Emails are scheduled to peak **3–4 months before the wedding**—the ideal time when couples are finalizing vendor lists and security details.
    * **Paid Duration:** Tiers are based on post-wedding access (1, 3, or 12 months), making the time/urgency a central conversion factor.
* **Verdict:** **Timing is acquired at registration (A4) and utilized throughout the sales cycle (Z2).**

### 3. **Authority (The Decision Maker)**

* **Definition:** Is this the person who can make the purchase decision? (The Bride and Groom).
* **Flow Mechanism:**
    * **Registration:** Requiring **both the Bride's and Groom's names** (A4) explicitly targets the decision-makers. The personalization is immediately linked to their names (e.g., `slubnechwile.pl/Anna-i-Jan`), confirming they have the authority to act.
    * **Password Security:** The **"Set Guest Password"** feature (Z4) is a core control function that only the Authority would care about, forcing their attention to the paywall.
* **Verdict:** **Authority is verified by the commitment to the customized link (A7).**

### 4. **Budget (The Price/Value Match)**

* **Definition:** Can the prospect afford your service, and do they agree with the value?
* **Flow Mechanism:**
    * **Tiered Pricing (E):** The three tiers address different budgets:
        * **Bronze (149 PLN):** Caters to the lowest budget (anchor).
        * **Silver (299 PLN):** Targets the average, high-profit budget (most popular).
        * **Premium (699 PLN):** Targets the high-value, risk-averse budget (high AOV).
    * **Feature Stacking:** The Silver and Premium features (**Live Preview, Pre-Wedding Memories, 12-Month Access**) are carefully stacked to provide disproportionately higher value than the simple price difference, forcing the customer to **choose based on value, not just cost.**
* **Verdict:** **Budget is addressed at the point of conversion (Z5) after Need, Timing, and Authority have been established, making the pricing easier to accept.**


{{% /details %}}


---

The entire *Ślubne Chwile* flow is designed as a **BANT qualification machine**.

It uses free access to gather the necessary data (Need, Timing, Authority) before presenting the Budget, ensuring that by the time a couple sees the price, they are already highly qualified, emotionally invested, and ready to convert.

## Themes

<https://vercel.com/templates>

### My Favourite Themes

* https://nextra.site/
* https://github.com/shadcn-ui/taxonomy


https://jamstackthemes.dev/theme/nextjs-notion-starter-kit/






---

## Conclusions

Is it a new product that needs evangelization? 

No, there is demand already :)

Whats working and whats not?

Is the product not working? wrong seller? wrong avatar/target audience/client?

It has been all about building around [the BANT idea](https://jalcocert.github.io/JAlcocerT/wedding-photo-galleries/#the-lead-magnet).

Show the products ads for those that apply.

They get the free thing / trial and we are happy to get your feedback :)

```sh
git clone https://github.com/JAlcocerT/slubne-chwile-y26
#git pull
cd slubne-chwile-y26/slubnechwile/
#prepare ./slubnechwile/.env
#nano .env 
#cd ..
#sudo docker compose up -d
#sudo docker compose down
#docker compose down && npm run build && node dist/server/entry.mjs
docker compose -f docker-compose.cloudflare.yml up -d --build
#docker inspect slubnechwile-app | grep "Networks" -A 20
#docker compose -f docker-compose.cloudflare.yml down
sudo docker logs slubnechwile-app --tail 100
#sudo docker system prune
```


Need something like this just that **white-labeled**?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/web/1ton-webook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

### Setting Up Google ads

This has been a thing: `https://ads.google.com` and `https://tagassistant.google.com/`

You will need terms, privacy policy and contact: `https://support.google.com/adspolicy/answer/6368661?hl=en#673`

![Slubne Chwile google ads](/blog_img/biz/gads/google-ads.png)

Keywords: `weddings`

Budget: whatever per month

Pros say to keep getting better at this until you spend successfully 6k$/month

1/2/8 pln click (cost per click) depending on competition.

![alt text](/blog_img/biz/gads/campaing-goals.png)

```js
gtag('event', 'conversion', {
                  'send_to': 'AW-',
                  'value': 1.0,
                  'currency': 'PLN',
                  'transaction_id': ''
```

### Random Things i Got to know

Google uses salesforce $CRM and also `https://www.qualtrics.com/` for feedback

---

## FAQ

The FlaskCMs / NextJS CMS i tried to built were similar to these OSS for Selfhosted Blogs

* https://github.com/ddoemonn/next-blog

> **MIT** | self-hosted blog platform built with next.js 

### Adsense vs OpenAdServer

If you want to do the oppositve: renting attention of your readers and get paid for it:

* https://github.com/seanZhang414/openadserver

>  Open Source Ad Serving Platform with ML-Powered CTR Prediction | Self-hosted alternative to Google Ad Manager | Python, FastAPI, PyTorch 