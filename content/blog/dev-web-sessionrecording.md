---
title: "Session Recording for Web Projects"
date: 2025-11-26
draft: false
tags: ["Web","Product","Amplitude vs PostHog","OpenReplay","Astuto","Product Tools"]
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


![Porsche design](/blog_img/outro/porsche.png)


![Cat product Meme](/blog_img/memes/features-vs-needs.png)


[![Star History Chart](https://api.star-history.com/svg?repos=posthog/posthog,usefathom/fathom,openreplay/openreplay,rrweb-io/rrweb&type=Date)](https://star-history.com/#posthog/posthog&usefathom/fathom&openreplay/openreplay&rrweb-io/rrweb&type=Date)



## OpenReplay

* https://www.openreplay.com/

{{< details title="Adding OpenReplay to a Astro Site 📌" closed="true" >}}

Go to https://app.openreplay.com/login


```sh
npm i @openreplay/tracker
```

Copy the json before the `</head>`, normally in `BaseLayout.astro`

```json

```

{{< /details >}}

## PostHog

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

#### Record and Replay Web

https://www.rrweb.io/
https://github.com/rrweb-io/rrweb
https://github.com/rrweb-io/rrweb/blob/master/guide.md

https://docs.uxwizz.com/

https://docs.sessionstack.com/docs/overview

Matomo - it has session recording in the on premise option, but is to be paid for that plugin

### Astuto

If after all, you want to get a mechanism to get feedback from clients:

* https://astuto.io/
  * 

> The open source tool to understand your customers and build a better product

---

## Conclusions


---

## FAQ