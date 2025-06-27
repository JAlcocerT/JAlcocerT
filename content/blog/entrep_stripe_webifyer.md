---
title: "What are you selling?"
date: 2025-06-03T01:20:21+01:00
draft: false
tags: ["Entrepreneuring","Auth","Web","Flask","Webhooks","LogTo"]
description: 'Stripe 101 together with LogTo into a Flask WebApp'
url: 'using-stripe-with-flask'
---

It was about time to put this together.

Selling websites 1 by 1 can be good for starters.

But you will want to scale the ideas.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#logto-authentication" title="LogTo 101" image="/blog_img/dev/LogTo/logto-branded-signin.png" subtitle="Using Logto as Flask Web App Authentication with a sample 3 body WebApp | Post" >}}
  {{< card link="https://github.com/JAlcocerT/WebifAI" title="WebifAi / WebifAIyer" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github to package and sale SSG Themes" >}}
{{< /cards >}}

And shame on me, I have not been tinkering with Stripe since last year [with the CV project](https://gitlab.com/fossengineer1/cv-check/-/blob/main/Z_Auth_Ways/Z_Auth_Stripe.py?ref_type=heads) as per [these tests](https://gitlab.com/fossengineer1/cv-check/-/tree/main/Z_Tests/Stripe?ref_type=heads).

## Stripe

Because you wont to bill people. Probably.

* You can login https://dashboard.stripe.com/login
* Set your accepted payment methods: https://dashboard.stripe.com/test/settings/payment_methods/
* And create a product / subscription

You can create payment links with stripe, like this: https://buy.stripe.com/6oEg2n1pu15j9UcbII or this on test mode https://buy.stripe.com/test_00g3d29cj0IM9l68ww

I liked the stripe integrations with cal.com or zapier.

![alt text](/blog_img/entrepre/stripe/stripe-apps.png)

But you can use those to put the links into your app *And embedd them into your flask app*

Go to stripe developer section: https://dashboard.stripe.com/workbench/overview


You can add a custom domain to stripe via [these instructions](https://docs.stripe.com/payments/checkout/custom-domains?nameserver-provider=cloudflare) and *paying the monthly subscriptionfor 10$/month*

![alt text](/blog_img/entrepre/stripe/stripe-customdomain.png)


The stripe docs are great and have a lot of resources for dev, like the workbench:

* https://dashboard.stripe.com/test/apikeys
* https://docs.stripe.com/testing

![alt text](/blog_img/entrepre/stripe/stripe-dev-workbench.png)

You might want to get started with payment links. Like this one https://buy.stripe.com/test_14A3cvfV98LE2X6dLA4ko01

You can add coupons/promo codes to certain products/subs, as per https://docs.stripe.com/billing/subscriptions/coupons

![alt text](/blog_img/entrepre/stripe/stripe-paymentlink.png)

![alt text](/blog_img/entrepre/stripe/stripe-paymentlink-code.png)

We have the Stripe Python SDK: https://pypi.org/project/stripe/ that allow to [embed payment](https://docs.stripe.com/payment-links/share#embed-button) into our Flask app, provided the

![alt text](/blog_img/entrepre/stripe/stripe-sdk.png)

```sh
STRIPE_SECRET_KEY=
STRIPE_PUBLISHABLE_KEY=
STRIPE_PRODUCT_ID=
```

> You can even pass few [parameters to the buy button](https://docs.stripe.com/payment-links/buy-button) (like the email) so that its prefilled as per the logged in / auth customer

Which can also be embedded into Flask (option below). Just hit the `Buy button` next to the link to get the code and vibe-code it.


{{< details title="Stripe Python Module vs Payment Link Embed 📌" closed="true" >}}

Stripe Integration Approaches in Flask

This document summarizes two main ways to integrate Stripe payments into your Flask web application, with pros, cons, and typical use cases.

---

1. Python Module Stripe Integration (Custom Payment Form)

**Names:**
- Custom Stripe Integration
- Stripe Payment Element Integration
- Server-side Stripe API Integration
- Programmatic Stripe Checkout

**Description:**
You use the official `stripe` Python SDK to create PaymentIntents and control the payment flow from your backend. The frontend uses Stripe.js to render a secure, customizable payment form (Payment Element) directly on your site.

- Full control over pricing, metadata, and customer experience.
- Good for dynamic/complex products, custom UI, or when you need to store extra info.
- Payment is processed on your domain, users never leave your site.

**Use cases:**
- Dynamic pricing, multiple products, or custom checkout flows.
- Need to collect extra information from the user.
- Want to tightly integrate Stripe with your backend logic.

---

2. Stripe Buy Button Integration

**Names:**
- Stripe Buy Button
- No-code Stripe Button
- Client-side Stripe Checkout Button
- Hosted Stripe Buy Button

**Description:**
You embed a pre-configured Stripe Buy Button using the Stripe-provided JavaScript snippet. Stripe handles the checkout flow, pricing, and product selection.

- Easiest and fastest to set up.
- Minimal backend code required.
- Best for simple, fixed-price products or quick MVPs.
- Users are redirected to Stripe-hosted checkout for payment.

**Use cases:**
- Simple, static products or services.
- Want to get up and running quickly with minimal code.
- No need for custom checkout logic or complex backend integration.

---

Summary Table

| Approach Name                  | Control Level | Setup Complexity | Use Case                                 |
|------------------------------- |:-------------:|:----------------:|------------------------------------------|
| Stripe Payment Element (Python)| High          | Moderate         | Custom flows, dynamic pricing, advanced  |
| Stripe Buy Button              | Low           | Very Easy        | Simple, static products, fast deployment |

---

Choose the approach that best fits your project’s needs. For most custom web apps, the Payment Element approach offers maximum flexibility. For simple or rapid deployments, the Buy Button is ideal.

{{< /details >}}

![alt text](/blog_img/entrepre/stripe/flask-stripe-sdk-vs-paymentlinkembed.png)

*With the payment link embedded,the user will be redirected to a new tab for payment with a buy.stripe.com domain*

![alt text](/blog_img/entrepre/stripe/stripe-link-ok.png)


**To enable WebHooks with Stripe**

* https://docs.stripe.com/cli/login
* https://docs.stripe.com/stripe-cli?install-method=linux

```sh
#https://github.com/stripe/stripe-cli/releases/tag/v1.27.0
wget https://github.com/stripe/stripe-cli/releases/download/v1.27.0/stripe_1.27.0_linux_amd64.deb
sudo dpkg -i stripe_1.27.0_linux_amd64.deb

stripe login
stripe listen --forward-to localhost:5006/webhook

#python3 app-v4.1.py
```

Once that its done, you can vibe code again to have real time updates for the logged in user:

![alt text](/blog_img/entrepre/stripe/stripe-webhook-flask.png)


### Stripe x Logto

I have been recently playing with [LogTo and Flask on this repo folder](https://github.com/JAlcocerT/ThreeBodies/tree/main/LogTo)

Where I could get proper sing up/in and user email information via LogTo as per:

```sh
python3 ./Logto/logto-sample-v2.py
```

So now:

```sh
uv venv
source .venv/bin/activate

uv pip install -r requirements.txt


uv run logto-stripe-app-v5.py
stripe listen --forward-to localhost:5088/webhook
```

Dont forget to add the **after payment behaviour** into your stripe payment link, so that it gets redirected to `http://192.168.1.6:5088`

![alt text](/blog_img/entrepre/stripe/stripe-redirect.png)

> Thanks to the cookies, that new tab will be already logged into and authenticated per LogTo to the flask admin panel, showing that you have got the service


---

## FAQ

### Flask Container

