---
title: "SaaS around Stripe API"
date: 2025-10-08T01:20:21+01:00
draft: false
tags: ["Micro SaaS Essentials","Stripe goodies"]
description: 'BiP user flows around authentication layers and stripe paywalls'
url: 'stripe-for-saas'
---

**Tl;DR**

You can get me wrong: automate your payments and dont accept any other form that does not require your attention.

From the quote / post / learnings: sell to the rich, they pay better.

**Intro**

Congratz, you are registered into the app!

Now subscribe to get additional goodies :)

This is not exactly a stripe 101, as I have played with it before:


But just some kind of stripe recap, as there are multiple use cases:

1. Use Stripe + Webhooks + Pocketbase collections as [mentioned here](https://jalcocert.github.io/JAlcocerT/pocketbase/#syncing-stripe-data-with-pocketbase)
2. Stripe API + Streamlit to allow an user to login / see certain features


## Why Stripe

Bc you can configure your products, prices, payments etc via their UI.

Plus you get a cool API.

![alt text](/blog_img/web/nextjs-admin/stripe-subscription-management.png)

Also, stripe provides a dashboard to manage subscriptions.


### Stripe Products

### Stripe Subscriptions

I tried [stripe subscriptions linkshere](https://jalcocert.github.io/JAlcocerT/flask-cms-for-ssgs/#how-to-create-a-stripe-subscription-link-), for the mental health delivery.



### One Time Payments

People are using them to sell ebooks `https://readmake.com/` or ways to code: `https://codefa.st/#pricing`, `https://shipfa.st/?ref=indiepage`

Or to sell simple microSaaS services like: `https://poopup.co/`



---


## Conclusions

1. Just learn how to do **quick & cool landing pages**, like: `https://codefa.st/#pricing` or `https://indiepa.ge/`

> With a Pricing section having by default the yearly plans discounted (and in a tab the monthly ones)

> > Example `https://fireflies.ai/pricing?billing=monthly` for audio

2. Bring your singin flow into place

> Modern signups look like: `https://www.mailerlite.com/signup` or `https://app.fireflies.ai/login`

3. Place some features behind Stripe.


---

## FAQ

RLS - row level security is very important!

Make sure that one user can only edit records related to that particular user.

Also pwd should be hashed on the DBs, just in case the DB gets compromised.