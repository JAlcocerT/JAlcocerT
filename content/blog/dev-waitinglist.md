---
title: "A Quick Waiting List"
date: 2025-08-02
draft: false
tags: ["Dev","Entrepreneurship","PMF"]
description: 'How much is an idea worth? With Astro SSG and Formbricks'
url: 'how-to-create-a-waiting-list'
---


If you are flooded with ideas, you need some way to prioritize them.

In case that you want to let people be the ones telling what you are building, you need some way of getting to know what they want.

The ultimage validator is your Stripe paywall.

And yet, you can have some idea by listening what your potential client tells they they want.

> They might change their mind while you build the solution though :)

I had pending to write about Waiting List as referenced on few previous posts:

* https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/#ideas-with-reflex
* https://jalcocert.github.io/JAlcocerT/real-estate-website/#pricing-strategy
* https://jalcocert.github.io/JAlcocerT/product-tools/


## SSG Astro Waiting List


I took inspiration on the MIT:

* https://github.com/unoforge/agency-landing-page-Astrojs

{{< cards >}}
  {{< card link="#conclusions" title="MultiChat UI" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="How the final multichat UI looks like" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing" title="Astro Waiting to Landing Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a Forked and Tweaked Astro Theme" >}}
{{< /cards >}}

```sh
git clone https://github.com/JAlcocerT/waiting-to-landing
#cd 
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

```sh
npm run build
```

```sh
npm install -g serve #serve with npm

#serve -s dist #http://localhost:3000
```

## Interacting with Clients

### Forms

1. FormBricks

Remember to **choose the link type** (not the app)

You will need to provide the `survey_url` to have the pop up and also `question_id` (if you want to prefill some info)

2. ReactForms
3. FormsMD

### Cal

If instead you want to book a call CTA, you can try with cal.com

---

## Conclusions

Whats next?

After a Waiting list, if you get enough leads, you **might want to build a landing page**.

### Astro Landing Pages / Book Pages

I was creating other landing pages and wrote about it:

https://jalcocert.github.io/JAlcocerT/creating-landing-pages-astro/
https://jalcocert.github.io/JAlcocerT/transforming-and-securing-a-website/

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Comments/Commento" title="Commento | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/SSGs" title="SSG Containers | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}


* https://github.com/blackspike/blackspike-astro-landing-page

> A free, modern, Astro landing page theme made with Tailwind to help kick start your next Astro project

Recently, I have been geting many ads on social media about people selling ebooks via a very simple landing page:

* https://github.com/candidosales/landing-page-book-astro-tailwind

> MIT | Simple landing page to sell your book - Astro + Tailwind

* https://github.com/unoforge/agency-landing-page-Astrojs
    * https://agencex-astro.vercel.app/#features

> MIT | A simple agency landing page made with astrojs and tailwindcss



### More Astro Themes

* https://github.com/evadecker/astro-photo-grid