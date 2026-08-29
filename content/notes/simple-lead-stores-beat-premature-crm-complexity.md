---
title: "Simple lead stores beat premature CRM complexity"
date: 2026-01-24
tags: ["leads", "sqlite", "csv", "pocketbase"]
description: "Early lead capture should use simple owned storage before adding full CRM machinery."
---

Lead capture does not need to start as a full CRM.

For early products, a `.csv`, Google Sheet, SQLite database, JSON file, or PocketBase collection can be enough. 

The important part is ownership of the loop: capture the lead, inspect the data, verify the email, enrich the record, export when needed, and feed outreach.

SQLite is especially useful when the app already needs a small backend. 

It keeps lead data close to the product, supports real queries, and can still export to CSV for Listmonk, Smartlead, manual review, or a later CRM.

Start with a store you can understand and migrate later.

Related:

- [Any SaaS needs this: Leads and a UI]({{< relref "/blog/entrep-saas-leads-ui.md" >}})
- [A boilerplate to create Landings for lead generation.]({{< relref "/blog/entrep-saas-diy-landing.md" >}})
- [Landing and more for Real Estate]({{< relref "/blog/dev-landing-realestate.md" >}})
- [Astro Landing Page + signup/in via FastAPI x sqlite x Admin panel]({{< relref "/blog/entrep-audio.md" >}})
- [Email APIs are product infrastructure]({{< relref "/notes/email-apis-are-product-infrastructure.md" >}})
- [Email verification protects the pipeline]({{< relref "/notes/email-verification-protects-the-pipeline.md" >}})
- [Simple waiting list repo](https://github.com/JAlcocerT/simple-waiting-list)
- [Make Landing repo](https://github.com/JAlcocerT/make-landing)
- [DIY Landing email form](https://github.com/JAlcocerT/diy-landing-boilerplate/blob/master/src/components/EmailForm.astro)
- [DIY Landing Mailtrap change request](https://github.com/JAlcocerT/diy-landing-boilerplate/blob/master/cr2-mailtrap.md)
- [PocketBase Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase)
- [Py Speech Rater repo](https://github.com/JAlcocerT/py-speech-rater)
- [Py Speech Rater dev compose](https://github.com/JAlcocerT/py-speech-rater/blob/main/fastapi-speech-rater/docker-compose.dev.yml)
- [Py Speech Rater architecture doc](https://github.com/JAlcocerT/py-speech-rater/blob/main/fastapi-speech-rater/TECH_DOC.md#-system-architecture)
- [ChartDB Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/chartdb)
