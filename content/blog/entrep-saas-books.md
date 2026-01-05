---
title: "We/Books and a DIY BoilerPlate"
date: 2026-01-05T07:20:21+01:00
#date: 2025-12-27T23:20:21+01:00
draft: false
tags: ["Info Products","DIY 1toN ebooks x BiP","SaaS vs LifeTime Products","RoadMap26"]
description: 'Reading better, writing more. Making Kindle learnings of years actionable and sharing via web/ooks'
url: 'interesting-books-and-diy-offer'
---

**Tl;DR**

By the end of this year, I will have created a **web/ook platform** to share the learnings along the years.

As I dont expect people to have the patience to get value by reading from these 300+ posts - Im destilling that into 20/30 pages ebooks.

The aim is to enhance the DIY offer, *for people that are not ready for [the DWY one](https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#vibe-coding-an-astro-ssr-landing-page)*.

+++ Special section for astro ~ typography themes + DecapCMS

+++ [Custom chatbot QnA](#a-chatbot-for-registered-ones-to-do-qna) for registered users over the web/ooks

**Intro**

This post is going to be **evolving along 2026**.

So consider it a WIP until the year has ended - or AI took over civilization :)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/1ton-ebooks/" title="Kind of ~ NEW 1-to-Nebooks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Putting together my thoughts and curated knowledge into N ebooks" >}}
  {{< card link="https://github.com/JAlcocerT/bip-boilerplate-saas" title="NEW bip-boilerplate" image="/blog_img/apps/gh-jalcocert.svg" subtitle="BiP BoilerPlate for SaaS - Source Code on Github" >}}
{{< /cards >}}

> Its *Kind of new*, because I created the repo on [this post](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-december-2025), based on the 2025 path :)

> > The content of the n ebooks will be modified across the year as I distill it from this blog/docs


I saw this post coming up next and inmediately thought that I should put *at some point* an IoT related ebook after this.

Specially after the learnings of the [Obfuscator project](https://github.com/JAlcocerT/obfuscate), where I merged the source code of serving an ebook via FastAPI to the one of rendering the PDF via R.


The idea is to use this to consolidate Docs - web/ooks, case studies and slidev ptts.

{{% details title="Creating the N ebooks repo... 🚀" closed="true" %}}

I thought I would create it [here](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-december-2025/#random), but no:

```sh
git init && git add . && git commit -m "Initial commit: Starting N ebooks DIY" && gh repo create 1ton-ebooks --private --source=. --remote=origin --push
```

> With this [brd](https://github.com/JAlcocerT/1ton-ebooks/blob/master/z-brd.md), these [clarifications](https://github.com/JAlcocerT/1ton-ebooks/blob/master/z-clarifications.md) and these [development plan](https://github.com/JAlcocerT/1ton-ebooks/blob/master/z-development-plan.md)

Last year I tinkered around [tiers of services / offers](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers) and created:

* https://diy.jalcocertech.com/ created here
* https://consulting.jalcocertech.com created here with that *trol* slider


And the ebooks are supposed to help me with the DIY one



{{% /details %}}


Expect ,n' to be: *these content driven ebooks from the repo*

1. Webpage creator: Because you can own your brand. *You can [DIY](https://diy.jalcocertech.com/api/book) btw*
2. Homelabs/Servers: I started this ebook because everything has potential failures
3. IoT: This is the one I want to put together as I write this post :)
4. D&A...


This time, adding more languages for the ebooks is on the table. Locale i18n!

And no download option, for now you have to *come to me* for reading.

In the end of the day, its been already 170+ posts in the last 12 months (totally unexpected).

So a **distilled version** with less noise, less chaos and more ordered for others to get value from.

I need more of: *din din din though*

![Cal.com stripe integration for booking a meeting](/blog_img/email/cal-email-stripe.png)

Thinking about this...ive been writing for a while (quite intensively last year) and this have become some kind of a habit and...a **~ lead nurture** in a way.

With this post (and year), my goal is to recap and distilled all this experience into **20/30max pages ebooks** that anyone can benefit from.

And yes, this is going to help shapping a lead magnet for my next product.

The **launch strategy**: *aka, focus strategy*

| Element | Decision |
| :--- | :--- |
| **One Avatar** | |
| **One Product** | |
| **One Channel** | |

The **Tier of Service**: DIY (1a - *leverages on my knowledge & experience, not in actual tools Ive built, neither my time*)

The **customer segmentation**: B2C, for anyone...like YOU

The **tech stack**:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)/Database** | | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | | |



## The journey to create N books

I was putting some effort/thoughts to this before getting the idea for this post:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cool-ebooks/" title="e-books | Docs" image="/blog_img/shipping/astro-sell-your-ebook.png" subtitle="Scrapping job boards" >}}
  {{< card link="https://diy.jalcocertech.com" title="D&A e-book" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Start your D&A Career" >}}
{{< /cards >}}

After having a **custom learning journey** and putting together this:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cool-ebooks//" title="eBooks | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/diagrams_ppts/" title="Diagrams and PPTs | Docs ↗" icon="book-open" >}}  
{{< /cards >}}


{{< cards >}}
  {{< card link="https://diy.jalcocertech.com/" title="DIY Website eBook" image="/blog_img/dev/fastapi/ebook-obfuscate-ui.png" subtitle="JAlcocerTech DIY Series | Ebook to create a Website for your brand" >}}
  {{< card link="https://github.com/JAlcocerT/obfuscate" title="DIY Web eBook x Obfuscation" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source code on GH. eBook x fastAPI x obfuscator x markdown source" >}}
{{< /cards >}}

* https://jalcocert.github.io/JAlcocerT/whats-boostrap/#too-much-info--ebooks_ideas
* https://jalcocert.github.io/JAlcocerT/things-as-a-code/#ebooks-as-a-code
* https://jalcocert.github.io/JAlcocerT/kindle-clippings-knowledge-base/

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/ebook-ideas" title="eBook Ideas ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/sell-your-ebook" title="Sell your eBook ↗" icon="github" >}}
{{< /cards >}}


{{% steps %}}

### Consumed a lot of books

Ive used the kindle a lot.

Peaking at [2023 with 20+ read books](https://jalcocert.github.io/JAlcocerT/blog/summary23/) in that year.


### Created a lot of notes

That I almost ever looked back again.

Not to say how much I actioned upon them.


### Wrote 300+ posts

Totally open posts, which anyone can fork and copy paste - *GL/HF*.

My learning journey, as chaotic as it gets. 

### Time to distill knowledge

When I have actually learnt and created some drafts/PoCs with it, noticed the need of several summaries/recaps.

I created those via posts at first: https://jalcocert.github.io/JAlcocerT/blog/

Then, as docs: https://jalcocert.github.io/JAlcocerT/docs/


### How I Build my ebooks

Last year, I decided it was time to order everything, so *tinkered with ebook creation* in few posts and repos.


If you do on this repo:

```sh
#git clone https://github.com/JAlcocerT/JAlcocerT
find . -type f -iname "*.pdf"
```

You will find interesting things on this repo - Yes, some drafts!

They were create with the learnings from [this post, bc code is everything](https://jalcocert.github.io/JAlcocerT/things-as-a-code/#you-can-do-what-with-pdf).

Is just that...you have to...do it.

(Surprise)

Sucks, *I know*.

### Went HandsOn Obfuscation 

I created the first draft of an ebook on *how to create your cool website via DIY* - `diy.jalcocertech.com`

But not only once. 

Also with the DIY Landing Boilerplate!

### Noted down couple of Themes

Like: https://github.com/JAlcocerT/astro-theme-typography or https://github.com/radishzzz/astro-theme-retypeset

As seen in the journaling section for the [artists](https://jalcocert.github.io/JAlcocerT/link-artists/) post.

And when i tinkered with wysiwyg editors [here](https://jalcocert.github.io/JAlcocerT/astro-journal-theme/)

### Decap x Typography x N ebooks

What if launching ebooks was all about writing via DecapCMS?

Because the landing part is so much clear.

But the CMS part has let me down in few occasions

Lets [create sth](#building-n-ebooks-for-a-webook)

{{% /steps %}}


## Building N ebooks for a web/ook

For now, this is all going to be content from...surprise, surprise: this blog!

I need to structure the offering though.

And the result of this post: `ebooks.jalcocertech.com` 

![web/ook platform v1](/blog_img/web/1ton-webook.png)

is helping me a lot to define what me free tier / diy is.


> And hey, is much better looking than the diy one (and simpler to maintain)

> > No obfuscation though, but deployed statically to `https://dash.cloudflare.com/login`

Most likely, will be around: 1 free, give email for the rest, boilerplate x1 time paid and available at `boilerplate.jalcocertech.com`



{{< details title="Create WebApps like a PRO with this boilerplate for Agents 📌" closed="true" >}}

```sh
#git init && git add . && git commit -m "Initial commit: Starting BoilerPlate" && gh repo create Astro-Vercel-SDK-AI-Chatbot --private --source=. --remote=origin --push
```

{{< /details >}}


```mermaid
flowchart LR
    %% --- Styles ---
    classDef free fill:#E8F5E9,stroke:#2E7D32,stroke-width:2px,color:#1B5E20;
    classDef low fill:#FFF9C4,stroke:#FBC02D,stroke-width:2px,color:#F57F17;
    classDef mid fill:#FFE0B2,stroke:#F57C00,stroke-width:2px,color:#E65100;
    classDef high fill:#FFCDD2,stroke:#C62828,stroke-width:2px,color:#B71C1C;

    %% --- Nodes ---
    L1("Free Content<br/>(Blog/YT $0)"):::free
    L2("DIY<br/>(Templates / Platform) $"):::low
    L3("Done With You<br/>(Consulting) $$"):::mid
    L4("Done For You<br/>(Services) $$$"):::high

    %% --- Connections ---
    L1 --> L2
    L2 --> L3
    L3 --> L4
```

### The DIY Web ebook

AI is much better at code than it is to drag-n-drop.

We got proof of that from ppts and diagrams

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/slidev-editor" title="SliDev Editor and PPTs ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/Twilight" title="Twilight Astro x Decap Localhost ↗" icon="github" >}}
{{< /cards >}}

So if you know which tools to ask for, you get much better results.

But hey, if you want to still spend a weekend to get a *crappy looking* wordpress - feel free to do so.


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="SelfHosted Landing Repo" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://diy.jalcocertech.com" title="DIY webs via webook" image="/blog_img/dev/fastapi/ebook-obfuscate-ui.png" subtitle="A 101 Ive put together about building websites" >}}
{{< /cards >}}

### Servers

As in...get a [homelab configured](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/) and working.

### BiP

See... `Z_ebooks/BiP-ebook.md`


---

## Conclusions

This is it *for now*.

From blogs, to docs, to knowledge in ebooks / webooks.

```sh
git clone https://github.com/JAlcocerT/1ton-ebooks.git
```

A better structured *,passive'* service offering.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/boilerplate" title="NEW - BoilerPlate" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Vibe Coding Templates for enhanced DIY " >}}
  {{< card link="https://github.com/JAlcocerT/1ton-ebooks" title="NEW - DIY eBooks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="From md to n web/ooks for a better DIY service " >}}
{{< /cards >}}

These are **deployed at**:

* https://ebooks.jalcocertech.com - If you have some idea and **dont know how to start** creating it, this is for you
* https://boilerplate.jalcocertech.com - If you are creating and want to **do it faster**, this is for you

### A Chatbot for Registered ones to do QnA

The problem when you havent started building is that you dont know what you need.

That's why I have created a custom chatbot for registered users to do QnA over the content of the ebooks.

### KB Ive added so far

1. The D&A one

### People Shipping ebooks

* Fantastic landing page with a form, a way to get a goodie once you put an email, a product recommendation as per a form results and success stories (with video and photos) https://czasnatwojruch.pl/


---

## Outro

Creating a portfolio as a development, design or tech professional is a journey punctuated by complex choices.

One of the most prevalent of these dilemmas lies in the delicate balance between striving for perfection and the need to launch quickly. 

Explore with me the nuances of these contradictory perspectives.

### The aspiration to perfection: an unattainable ideal?

The traditional vision of artistic creation encourages us to pursue perfection from the outset. 

Every line of code, every element of design should converge towards absolute excellence.

However, this dream of perfection can sometimes become a burden, a brake on progress. The relentless quest for perfection can paralyze the creative process, turning creation into an endless pursuit.

### The Perfectionism Trap: when the best becomes the enemy of the good

Perfectionism can turn into a subtle trap. Waiting for every detail to be impeccable can delay your portfolio indefinitely. This prolonged stalling can have implications for professional credibility, as the market often demands a fast, dynamic online presence.

### The bold proposal to launch quickly: iterate rather than perfect

The idea of launching quickly, even if the portfolio doesn't reach an immediate level of perfection, offers an alternative perspective. It's about recognizing that each iteration can be an improvement on the previous one. This approach encourages a constant iteration mentality, where each version becomes a learning opportunity.

### Speed as a means of learning: create by doing

Launching quickly thus becomes a means of learning. Speed doesn't mean compromising on quality, but rather accepting that perfection may initially be unattainable. 

It's an invitation to learn by doing, to use each version of the portfolio as a testing ground.

### The crucial importance of time: time efficiency and judicious management

Time plays a crucial role in this debate. Time efficiency, underlined by the perspective of speed, becomes an essential skill. Judicious time management is the key to maintaining momentum without compromising quality. Consciously choosing where to invest one's time becomes a strategic act.

### Total control vs. flexibility: navigating between the two extremes

Total control of the creative process offers a sense of autonomy and empowerment. However, it is vital not to confuse control with rigidity. Being open to market developments and new trends is just as essential as personal control. It's a delicate balance between autonomy and adaptability.

### The delicate balance: a continuous journey of discovery and adaptation

Ultimately, portfolio creation is an ongoing journey. It's navigating this paradox with intention. It's finding a balance between the quest for excellence and the need to move quickly, knowing that each iteration is a progression towards an improved version of yourself. To create a portfolio is to embrace the paradox, to consciously choose between perfection and speed, and to accept that the path to excellence is a journey rather than a destination.




### From SaaS to LifeTime Products 

Some of the first people on doing SaaS are coming back to the product way of selling (pay once, own forever).

Im talking about: https://once.com/writebook

**Info products** and one time payment artifacts are a thing today.

https://github.com/mrwyndham/pocketbase-stripe
https://www.fastpocket.dev/pricing

also

https://quickdeploy.dev/
https://www.youtube.com/watch?v=Feauj4OaePg

With life time access

Pay me to save you time, kind of a mix of ~DIY/DWY/DFY in a package

> But leaning towards enhanced DIY with my expertise kind of thing

#### Doing > Watching

You might be tempted to fall into **the learning trap**.

Learning, batches, small dopamine spikes and...no real output.

To get those you can go to `https://www.classcentral.com/` or `datacamp` without a particular aim.

And learning bc the sake of it - its fantastic on its own.

But if you want to build something - just learn what you need to accomplish it.

This is why Im launching **my first lifetime product** - A boiler plate for creators to ship asap.

Not going to lie: ive got inspired by `https://supersaas.dev/` and `https://shipfa.st/?ref=indiepage` and `https://readmake.com/`

* https://www.ohansemmanuel.com/books/understanding-astro

* https://understanding-astro-webook.vercel.app/


Im **launching my boilerplate**: https://boilerplate.jalcocertech.com

> It has the look and feel of my latest [diy landing boilerplate](https://github.com/JAlcocerT/diy-landing-boilerplate) for a reason :)

###  Interesting Resources


* https://nav.al/read

> Read the Best 100 Books Over and Over Again

> > Many claim to read, but very few understand

<!-- ### The Echo Chambers

When society embraces disruptive new scientific theories, philosopher Thomas Kuhn explains that such changes demand a “paradigm shift”: People must debate and agree upon a new narrative before replacing the old one. 

Today, however, people often only engage with those who share their opinions. Digital channels have returned humans to a cave-like existence: Only a small social bubble within an echo chamber shares a given person’s view of reality.

“The multiplicity of digital channels allows us to avoid self-awareness and surround ourselves with the people (or machines, it is not always certain) who share our opinions.” 

Individuals that hold opposing viewpoints on reality encourage, criticize, and adjust one another's ideas, influencing economic and human behavior.

Different narratives, like an epidemic, may infect and alter communities, according to Shiller. 

The validity of a narrative has no bearing on its "contagion rate." 

Viral tales capture attention, look cohesive, and fit readily into existing narratives.

-->

<!-- 
#thinking fast and slow
 -->
 
<!-- 
'psychology-skills-data-analytics' -->
<!-- 
### Binary Thinking

*Either or* -->

![Canva using neuromarketing on you](/blog_img/outro/canva-free-trial-neuromkt.png)


---

## FAQ


> There are Similar python projects like https://github.com/denizsafak/abogen

> > Abogen is a powerful text-to-speech conversion tool that makes it easy to turn ePub, PDF, text or markdown files into high-quality audio with matching subtitles in seconds. Use it for audiobooks, voiceovers for Instagram, YouTube, TikTok, or any project that needs natural-sounding text-to-speech, using Kokoro-82M.

<!-- 
Alternatives to https://www.livechat.com/pricing/ ING uses it
 -->

### About some interesting books Ive read


https://jalcocert.github.io/JAlcocerT/blog/da-bk-learning/

https://jalcocert.github.io/JAlcocerT/negotiation-skills-data-analytics/

https://jalcocert.github.io/JAlcocerT/psychology-skills-data-analytics/


<!-- 
#range
#peak
#ultra learning 
https://jalcocert.github.io/JAlcocerT/blog/da-bk-learning/
-->


<!-- ## Spaced learning -->
<!-- ultra learning 
range - why generalist...
-->

This has been possible thanks to perplexity and notebookllm, together with a huge txt file of kindle notes I have:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/ebook-ideas" title="eBook Ideas ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/sell-your-ebook" title="Sell your eBook ↗" icon="github" >}}
{{< /cards >}}


#### NeuroMarketing


<!-- 
neuromarketing
brainfluence
the persuasion code -->

#### Story Telling

<!-- 
Data storytelling in analytics is important because it helps to uncover insights from data that might otherwise go unnoticed, and also helps to communicate those insights to others in a more engaging and memorable way. By presenting data in the form of a narrative, we can make the insights more relatable and understandable to a wider range of people. This is especially important in the world of business, where decisions need to be made based on data and insights, but not everyone may have the technical expertise to fully understand the underlying data.

Furthermore, data storytelling has been shown to be more effective at communicating insights and influencing decisions than simply presenting data in a spreadsheet or chart. By providing context and meaning to the data, data storytelling can help decision-makers better understand the implications of the data and make more informed decisions based on those insights. Overall, data storytelling is a powerful tool that can help organizations unlock the full potential of their data and use it to drive better decision-making and business outcomes. -->

<!-- 
story telling with data
 -->

<!-- In your analytics career, 
 -->

<!-- Data interacts with narratives and systems in the following ways:

* Data shapes a strategic narrative – Whether you’re segmenting customers or developing brand stories, data provides context to shape and share stories.
* Data visualizations deliver the story – In formats such as data journalism, data-inspired social media campaigns and analyst reports, organizations use data visualizations to deliver powerful stories.
* Data provides macro insights – Humans or AI interpret big-picture patterns in data to form an insight, which provides the basis for a story.
* Data shapes processes – Using visually prepared data – via dashboards – systems emerge that enable the control of workflows, processes and states by detecting anomalies and monitoring systems. 

-->




### Business Ideas from my Kindle Notes



#### Sales

It seems we are always selling in live.

Just that we dont realize it.



<!-- 
### The Punch Line -->



<!-- ## BIAS and Noise

<!-- 
how this relates to ml -->

<!-- ### The Prevalence of Noise

Remember that correlation **does not** implies causality. --> -->

<!-- 
## Interacting with others

59 seconds book -->
<!-- ### The shiny Object Syndrome -->

<!-- ### The Dunning-Krugger Effect

### Dilution Effect


### What is Wishful Thinking?

### Certainty Effect -->

<!-- 
what every body is saying 

the persuasion code
influence: the psy of persuasion
the persuasion code
-->


<!-- 
referencia a persuasion escrito en jan 2022

y aqui cositas de neuromarketing

the buying brain....
`brainfluence`

 -->

### About Journaling

I was tinkering around [markdown editors](https://jalcocert.github.io/JAlcocerT/astro-i18/#an-editor-for-astro-blog-posts) last year.

And put together a [journaling recap for artists](https://jalcocert.github.io/JAlcocerT/link-artists/#journals).

But wanted to cover in depth: https://github.com/subhamBharadwaz/scribbly

> MIT |  Scribbly is a web application built with Next.js and Prisma that allows users to create and manage their digital journal. With a user-friendly interface powered by Radix UI and Shadcn/UI components, Scribbly makes journaling a breeze. It includes features such as customizable reminders, secure user authentication with Clerk, and a subscription plan 