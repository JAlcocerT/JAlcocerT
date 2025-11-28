---
title: "Session Recording for Web Projects"
date: 2025-11-23
draft: false
tags: ["OpenReplay vs PostHog","Astuto","Product Tools","Forms Tools"]
description: 'How are user enjoying your Saas?'
url: 'how-to-record-web-sessions'
---

**TL;DR**

More than web analytics, see what the users are experiencing.

Some [Product Tools](https://jalcocert.github.io/JAlcocerT/product-tools/) that we can selfhost.

Compared to some [Forms/Surveys](#forms) and Waiting lists OSS options.

**Intro**

Lately I got to know https://www.awesome-homelab.com/item/highlightio

If you got your SaaS reachable by potential users.

Or you are a PdM or a [DA with product vision](https://jalcocert.github.io/JAlcocerT/product-skills-for-data-analytics/)...

You will want to know what it works and what not.

But for real.

What are the users experiencing.

> If you have worked on some *e-commerce related startups*, you might have used Amplitude.

> >  But there are some alternatives


This is a client that reveals that it **actually wants**:

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
  * Let users request feature and create a RoadMap accordingly


> The open source tool to understand your customers and build a better product

---

## FAQ

 F/OSS to Interact with Audience

* https://github.com/ClaperCo/Claper
  * https://claper.co/

This year *seems to be* the year of: uv, makefile and [pocketbase](https://jalcocert.github.io/JAlcocerT/pocketbase/).

1. [Frombricks](#formbricks)
2. [HeyForm](#heyform)
3. [OhMyForm](#ohmyform)

> Get more ideas at <https://medevel.com/open-source-survey-tools-2/>

You can have also your own [DIY survey / forms](#diy-forms-with-pb) tool for your Saas by [using PB](#why-with-pocketbase).

### Forms

#### Formbricks

Just use formbricks.

COnfigure it properly, and you can use formbricks to be a waiting2landing questionare while you are figuring out the PMF for your next microSaaS: https://github.com/JAlcocerT/waiting-to-landing

Around one year ago I was making a post and [touched formbricks](https://jalcocert.github.io/JAlcocerT/blog/dev-forms/#formbricks)

* https://github.com/formbricks/formbricks

#### heyform

* https://github.com/heyform/heyform
  * https://github.com/heyform/heyform?tab=AGPL-3.0-1-ov-file#readme
  * https://heyform.net/
  * https://hub.docker.com/r/heyform/community-edition/tags

> HeyForm is an open-source form builder that allows anyone to create engaging conversational forms for surveys, questionnaires, quizzes, and polls. No coding skills required.


#### ohmyform

* https://github.com/ohmyform/ohmyform
  * https://hub.docker.com/r/ohmyform/ohmyform

  * https://ohmyform.com/docs/install/ 
  https://ohmyform.com/

### DIY Forms with PB

When Pocketbase has a SMTP configured, you can make it validate the emails is capturing:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="PocketBase | Docker Config 🐋 ↗" >}}
{{< /cards >}}

**Why with PocketBase**

Potentially: PB + SSG is great to validate ideas. 

FAST!

Just because I like to keep the tech stack as simple as possible.

> And because Im lazy to maintain a lot of back-end code.

Additionally, you wont have a limit on how many users can be on your list.