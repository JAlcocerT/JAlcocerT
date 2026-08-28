---
title: "Email APIs are product infrastructure"
date: 2026-01-02
tags: ["email", "api", "transactional-email", "saas"]
description: "Programmatic email is useful when it turns captured intent into verification, onboarding, delivery, or follow-up without manual work."
---

Email APIs are where a landing page, SaaS, or backend starts talking back.

Captured emails sitting in a form, database, CSV, or PocketBase collection are only raw intent. 

The useful workflow starts when code can send the next thing: a verification link, welcome email, lead magnet, attachment, invoice, onboarding step, or follow-up.

The practical split is:

- Use an email API when the app owns the event and needs structured sending, templates, logs, and tokens.
- Use SMTP when an existing tool expects a mail server, such as PocketBase, Mautic, Odoo, or Listmonk.
- Use a marketing platform when the job is list management, campaigns, segmentation, subscriptions, and unsubscribes.
- Keep DNS authentication separate from provider choice; deliverability still depends on the domain setup.

Mailtrap worked well as the developer-friendly option for API and SMTP testing, Resend looked strong for API-first transactional email and receiving, and Mailjet paired well with Listmonk as the delivery engine behind campaigns. 

The provider matters less than the control loop: capture intent, verify it, send the right artifact, track the result, and let users unsubscribe when the message is marketing.

Related:

- [A boilerplate to create Landings for lead generation.]({{< relref "/blog/entrep-saas-diy-landing.md" >}})
- [SMTP and e-mail stuff]({{< relref "/blog/dev-email.md" >}})
- [Mail DNS is deliverability infrastructure]({{< relref "/notes/mail-dns.md" >}})
- [Make Landing repo](https://github.com/JAlcocerT/make-landing)
- [Mailtrap ESP notebook](https://github.com/JAlcocerT/make-landing/blob/master/mailetrap-esp.ipynb)
- [Programmatic email script](https://github.com/JAlcocerT/make-landing/blob/master/send_email.py)
- [DIY landing boilerplate](https://github.com/JAlcocerT/diy-landing-boilerplate)
