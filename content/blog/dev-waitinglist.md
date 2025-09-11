---
title: "A Quick Waiting List"
date: 2025-08-02
draft: false
tags: ["Dev","Entrepreneurship","PMF","Porkbun API","waiting-to-landing","Formbricks"]
description: 'How much is an idea worth? With Astro SSG, Formbricks and Cloudflare'
url: 'how-to-create-a-waiting-list'
---

**Tl;DR**

Creating an astro based [waiting to landing](#ssg-astro-waiting-list) (waiting2landing v1).

+++ [Formbricks setup](#forms)
+++ Getting quote prices for domains via Porkbun API and modified CF DNS via API on [this section](#porkbun-api)


**Intro**

If you are flooded with ideas, you need some way to prioritize them.

In case that you want to let people be the ones telling what you are building, you need some way of getting to know what they want.

The ultimage validator is your Stripe paywall.

And yet, you can have some idea by listening what your potential client *say that they want*.

> They might change their mind while you build the solution though :)

I had pending to write **about Waiting List** as referenced on few previous posts:

* Future Ideas with Reflex WebApps: https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/#ideas-with-reflex
* https://jalcocert.github.io/JAlcocerT/real-estate-website/#pricing-strategy
* https://jalcocert.github.io/JAlcocerT/product-tools/

And for sure, you have seen many **waiting list examples on social media ads**, like:

* `https://throughthelyns.com/sms-challenge/sms-challange-landing/`
* `https://prospactive.nl/funnel-system`
* `https://www.thecreatorproject.com/live`
* `https://agencysupremacy.io/winning-ad-templates-f1`
* `https://bewebtec.com/calendly-routing/`

## SSG Astro Waiting List

I took inspiration on the **MIT astro theme**: 

* https://github.com/unoforge/agency-landing-page-Astrojs

>  MIT | A simple agency landing page made with astrojs and tailwindcss 


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing" title="NEW Astro Waiting to Landing Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a Forked and Tweaked Astro Theme for waiting2landing concept" >}}
{{< /cards >}}

Now, there are some changes added:

1. You can select as per the `.env` if you want a waiting list or the full features of the original theme (a landing page).
2. Instead of a plain button to insert email, you can [integrate it with Formbricks](#forms) so that it collects the info from people interested

```sh
git clone https://github.com/JAlcocerT/waiting-to-landing
#cd waiting-to-landing

#Adapt the .env as per your needs
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

```sh
npm run build
```

```sh
npm install -g serve #serve with npm

#serve -s dist #http://localhost:3000
```

On the repository, you have how to run the site using **the Makefile** approach, which Im more and more implementing.

## Interacting with Clients

### Forms

1. FormBricks

Remember to **choose the link type** (not the app)

You will need to provide the `survey_url` to have the pop up and also `question_id` (if you want to prefill some info)

2. ReactForms
3. FormsMD
4. Probably million other ways: BaaS, sqlite...?

{{< callout type="info" >}}
If instead, you want to book a call CTA, you can try with `cal.com` instead
{{< /callout >}}

## Porkbun API

We need to go to the same place where you would get the keys for NGINX HTTPs setup.

* https://porkbun.com/account/api

You can get something cheap (for 2$ the first year) https://porkbun.com/tld/info

* https://lookup.icann.org/en/lookup

You can configure porkbun, so that the **default NS** will be cloudflare ones: `fattouche.ns.cloudflare.com, leanna.ns.cloudflare.com`


![alt text](/blog_img/dev/porkbun/1-porkbun-default-ns.png)

![alt text](/blog_img/dev/porkbun/2-porkbun-credit.png)

![alt text](/blog_img/dev/porkbun/3-prkbun-balance.png)

![alt text](/blog_img/dev/porkbun/4-porkbun-buy-ui.png)

Once bought, I updated the NS to be the CF ones:

![alt text](/blog_img/dev/porkbun/5-cloudflare-ns-check.png)

![alt text](/blog_img/dev/porkbun/6-ns-ok.png)


I was **trying to buy the domains programatically via the API**, but I could just get the quoted price via script: 

```sh
uv run porkbun-domains.py
```

It seems its just not possible to do so as [per reddit post](https://www.reddit.com/r/PorkBun/comments/1kqwq9y/programmatically_purchase_new_domain_via_api/)

I had to buy `beyondajourney.lol` via the UI instead for couple of $ the first year.

Despite having proper:

```
PORKBUN_API_KEY="pk1_..."
PORKBUN_SECRET_KEY="sk1_..."
```

I got successful to edit DNS records via **Cloudflare API**.

This time, with a **python questionary script**, instead of the flask based that I created for webify, [here](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/flask_dnsupdater.py).

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/cloudflare-dns-updater.py" title="Cloudflare DNS API Py Script ↗" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing/blob/main/porkbun-domains.py" title="Porkbun API Py Script ↗" >}}
{{< /cards >}}

---

## Conclusions

Now, we have a tweaked theme that serves as both, a **waiting list and a landing page**.

Connected to a [formbrick Form](https://app.formbricks.com/s/cmdxm7avj0zgjw001z2q5qtp0) which can output its data into a google sheet.

From there, you have to be creative on your form questions and what to do later on.

You can get ideas to shape your products.

> Listen to the people!

**How to run the asto waiting/landing page?**

Stop all containers *but portainer*

```sh
#docker ps -a -q --filter 'name=!portainer'
docker ps -q | grep -v portainer | xargs docker stop
```

Use the `Makefile commands`, which basically use docker:

```sh
git clone https://github.com/JAlcocerT/waiting-to-landing
#make help
make local-waiting
```

> Dont forget to update properly [the `.env`](https://github.com/JAlcocerT/waiting-to-landing/blob/main/.env#L19)

> > It brings the formbricks details, title, prefix...

![Astro Waiting List + Formbricks URL Link](/blog_img/web/waitingtolanding/waitinglist-formbricks-prefilled.png)

**Whats next?**

After a Waiting list, if you get enough leads, etc...

You **might want to build a landing page**.

But we are ready for that with the current setup!

Just switch from waiting, to landing:

```sh
make local-landing
```

{{< callout type="info" >}}
This will show the full original theme page *(not just a very small UI),* with a place to insert the email and route it to formbricks
{{< /callout >}}

### Astro Landing Pages / Book Pages

You can see how cool can astro be for landing pages: 

* https://github.com/Enmamosley/astro-landing-page

{{< callout type="warning" >}}
CC4.0 | Landing page blackspike 
{{< /callout >}}

I was creating other *landing pages* and wrote about it:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-landing-pages-astro/" title="Astro landing pages | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/transforming-and-securing-a-website/" title="Astro landing page with https | Post ↗" >}}
{{< /cards >}}


* https://github.com/blackspike/blackspike-astro-landing-page

> A free, modern, Astro landing page theme made with Tailwind to help kick start your next Astro project

Recently, I have been geting many ads on social media about **people selling e-books** via a very simple landing page:

* https://github.com/candidosales/landing-page-book-astro-tailwind

> MIT | Simple landing page to sell your book - Astro + Tailwind

* https://github.com/unoforge/agency-landing-page-Astrojs
    * https://agencex-astro.vercel.app/#features

> MIT | A simple agency landing page made with astrojs and tailwindcss


### More Astro Themes

Get inspired, if you like **photo galleries**

* https://github.com/evadecker/astro-photo-grid

>  A minimal, single-page photo gallery for Astro. 