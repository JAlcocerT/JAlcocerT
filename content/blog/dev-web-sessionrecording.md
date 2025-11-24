---
title: "Session Recording for Web Projects"
date: 2025-11-23
draft: false
tags: ["OpenReplay vs PostHog","","Astuto","Product Tools"]
description: 'How are user enjoying your Saas?'
url: 'how-to-record-web-sessions'
---

**TL;DR**

More than web analytics, see what the users are experiencing.

Some [Product Tools](https://jalcocert.github.io/JAlcocerT/product-tools/) that we can selfhost.

**Intro**

Lately I got to know https://www.awesome-homelab.com/item/highlightio

If you got your SaaS reachable by potential users.

Or you are a PdM or a [DA with product vision](https://jalcocert.github.io/JAlcocerT/product-skills-for-data-analytics/)...

You will want to know what it works and what not.

But for real.

What are the users experiencing.

> If you have worked on some *e-commerce related startups*, you might have used Amplitude.

> >  But there are some alternatives


## What we say vs what we do

* **Stated Preference (What they say):** Based on hypothetical questions. It captures what users *claim* they would choose.
* **Revealed Preference (What they do):** Based on actual behavior. It captures true preferences through real-world actions and choices.

La preferencia anunciada o preferencia declarada es un método para conocer las preferencias de los usuarios basado en lo que ellos dicen que elegirían en situaciones hipotéticas o que no han experimentado en la realidad. Es muy utilizada en economía para anticipar cómo los consumidores podrían reaccionar ante nuevas opciones que aún no existen en el mercado. Por ejemplo, se puede preguntar a una persona qué opciones preferiría en un producto nuevo o servicio que no ha probado.[1]

Por otro lado, la preferencia revelada se basa en observar el comportamiento real de consumo del usuario, es decir, en las decisiones y elecciones efectivas que hace en la vida cotidiana. La teoría de la preferencia revelada sostiene que las preferencias de los consumidores se pueden deducir de sus hábitos de compra reales, ya que el hecho de elegir un bien sobre otro revela cuál prefieren realmente bajo las restricciones de su presupuesto. Esto implica que las preferencias se infieren a partir de las elecciones efectivas, no de declaraciones hipotéticas.[2]




| Type | Definition | PostHog Tool to Use |
| :--- | :--- | :--- |
| **Stated** | "I would use this feature." | **Surveys & Feedback:** Ask users directly what they want before building. |
| **Revealed** | They actually clicked/paid. | **Analytics & Session Replay:** Track clicks, retention, and time spent to see if they actually use it. |
| **The Goal** | **The Say/Do Gap** | Compare survey results against analytics to see if users are actually doing what they promised. |

This is what the client reveals that it wants:

![Cat product Meme](/blog_img/memes/features-vs-needs.png)

We all need help, but how much help do we need?

![Cal x Stripe](/blog_img/email/cal-email-stripe.png)

You can test how much others value your help by putting a price tag to it (pain point).

Who ever pays, believe that is getting >>> value from your time that they paid for.


## Product Tools for Record and Replay the Web

How to build products that last?

![Porsche design](/blog_img/outro/porsche.png)

Product that people want to keep using and build a brand?

There are some product tools like `https://docs.uxwizz.com/` who follow the pay once own forever.

Or Matomo, which we know as open source web analytics tools, and has a premium hosted optopn with a plugin to do session recording.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/matomo" title="Matomo | Docker Config 🐋 ↗" >}}
  {{< card link="https://fossengineer.com/open-source-selfhostable-web-analytics-alternatives-ga/" title="Few Selfhosted OSS Web Analytics tools | Post ↗" >}}
{{< /cards >}}

Luckily, we have fully OSS options to do session recording:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/openreplay" title="OpenReplay | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/posthog" title="PostHog | Docker Config 🐋 ↗" >}}
{{< /cards >}}

* https://www.rrweb.io/
  * https://github.com/rrweb-io/rrweb
  * https://github.com/rrweb-io/rrweb/blob/master/guide.md

> MIT | Record and replay the web 

[![Star History Chart](https://api.star-history.com/svg?repos=posthog/posthog,usefathom/fathom,openreplay/openreplay,rrweb-io/rrweb&type=Date)](https://star-history.com/#posthog/posthog&usefathom/fathom&openreplay/openreplay&rrweb-io/rrweb&type=Date)


### OpenReplay

* https://www.openreplay.com/

{{< details title="Adding OpenReplay to a Astro Site 📌" closed="true" >}}

Go to https://app.openreplay.com/login


```sh
npm i @openreplay/tracker
```

Copy the json before the `</head>`, normally in `BaseLayout.astro`


{{< /details >}}

### PostHog

https://jalcocert.github.io/JAlcocerT/product-tools/#posthog
![PostHog Product Market Fit](/blog_img/entrepre/product/Posthog-PMF.png)


* https://eu.posthog.com/project/15002/replay/home

Then, you will need to add this kind of snippet before the `/head`:

```html
    <script>
    //somethingsomething 
      posthog.init('phc_someid', {
          api_host: 'https://eu.i.posthog.com',
          person_profiles: 'identified_only', // or 'always' to create profiles for anonymous users as well
      })
  </script>
```
---

## Conclusions

Now you are ready to rock your career within startups.

Bring to the table a discussion about how to measure SaaS performance with real insights, not assumptions of what part of the service the users are really enjoying and using.

### Astuto

If after all, you want to get a **mechanism to get feedback** from clients:

* https://astuto.io/
  * 

> The open source tool to understand your customers and build a better product