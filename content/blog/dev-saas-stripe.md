---
title: "SaaS around Stripe API"
date: 2025-09-17T01:20:21+01:00
draft: false
tags: ["Micro SaaS Essentials","Stripe goodies"]
description: 'BiP user flows around authentication layers and stripe paywalls'
url: 'stripe-for-saas'
---

**Intro**

Congratz, you are registered into the app!

Now subscribe to get additional goodies :)



## Why Stripe

Bc you can configure your products, prices, payments etc via their UI.

Plus you get a cool API.

![alt text](/blog_img/web/nextjs-admin/stripe-subscription-management.png)

Also, stripe provides a dashboard to manage subscriptions.



---

## FAQ

RLS - row level security is very important

Make sure that one user can only edit records related to that particular user.

Also pwd should be hashed on the DB, just in case the DB gets compromised.