---
title: "Session Recording for Web Projects"
date: 2026-12-31
draft: true
tags: ["Web","Dev","PostHog","Astuto"]
description: 'Tutorial - Making ASTRO Website better.'
url: 'how-to-record-web-sessions'
---

**Intro**

If you got your SaaS reachable by potential users.

You will want to know what it works and what not.

But for real.

What are the users experiencing.

If you have worked on some startups, you might have used Ampplitude.

![Porsche design](/blog_img/outro/porsche.png)


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

https://astuto.io/?ref=selfh.st

> The open source tool to understand your customers and build a better product

## Conclusions


---

## FAQ