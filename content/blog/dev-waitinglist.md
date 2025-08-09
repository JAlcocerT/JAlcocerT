---
title: "A Quick Waiting List"
date: 2025-08-02
draft: false
tags: ["Dev","Entrepreneurship","PMF","Porkbun API"]
description: 'How much is an idea worth? With Astro SSG and Formbricks'
url: 'how-to-create-a-waiting-list'
---


If you are flooded with ideas, you need some way to prioritize them.

In case that you want to let people be the ones telling what you are building, you need some way of getting to know what they want.

The ultimage validator is your Stripe paywall.

And yet, you can have some idea by listening what your potential client *say that they want*.

> They might change their mind while you build the solution though :)

I had pending to write about Waiting List as referenced on few previous posts:

* Future Ideas with Reflex WebApps: https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/#ideas-with-reflex
* https://jalcocert.github.io/JAlcocerT/real-estate-website/#pricing-strategy
* https://jalcocert.github.io/JAlcocerT/product-tools/


## SSG Astro Waiting List

I took inspiration on the **MIT astro theme**: 

* https://github.com/unoforge/agency-landing-page-Astrojs

>  A simple agency landing page made with astrojs and tailwindcss 

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing" title="Astro Waiting to Landing Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a Forked and Tweaked Astro Theme" >}}
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

### Cal

If instead you want to book a call CTA, you can try with cal.com

## Porkbun API

We need to go to the same place where you would get the keys for NGINX HTTPs setup.

* https://porkbun.com/account/api

YOu can get something cheap (for 2$ the first year) https://porkbun.com/tld/info

* https://lookup.icann.org/en/lookup

You can configure porkbun, so that the default NS will be cloudflare ones: 

`fattouche.ns.cloudflare.com, leanna.ns.cloudflare.com`


![alt text](/blog_img/dev/porkbun/1-porkbun-default-ns.png)

![alt text](/blog_img/dev/porkbun/2-porkbun-credit.png)

![alt text](/blog_img/dev/porkbun/3-prkbun-balance.png)

![alt text](/blog_img/dev/porkbun/4-porkbun-buy-ui.png)

![alt text](/blog_img/dev/porkbun/5-cloudflare-ns-check.png)

![alt text](/blog_img/dev/porkbun/6-ns-ok.png)


I was **trying to buy the domains programatically via the API**, but I could just get the quoted price:

```sh
uv run porkbun-domains.py
```

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

Connected to a formbrick Form which outputs its data into a google sheet.

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

**Whats next?**

After a Waiting list, if you get enough leads, etc...

You **might want to build a landing page**.

But we are ready for that with the current setup!

Just switch from waiting, to landing:

```sh
make local-landing
```

### Astro Landing Pages / Book Pages

I was creating other *landing pages* and wrote about it:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-landing-pages-astro/" title="Astro landing pages | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/transforming-and-securing-a-website/" title="Astro landing page with https | Post ↗" >}}
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