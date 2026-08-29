---
title: "A lead capture MVP needs a verified follow-up loop"
date: 2026-08-29
tags: ["lead-generation", "email", "verification", "mvp"]
description: "A lead capture MVP works when it captures intent, stores it simply, verifies the email, and sends a useful next step."
---

A lead capture MVP is not just a form.

The full loop is: publish a focused landing page or waiting list, capture qualified intent with a form, store the lead in a simple owned system, verify the email, send the promised next step, and keep the record ready for outreach or newsletter workflows.

In concrete terms:

`landing/waiting page -> Formbricks/email/PocketBase capture -> Sheets/JSON/CSV/SQLite/PocketBase store -> email verification -> ESP follow-up -> DNS deliverability -> Listmonk/MailerLite/Smartlead/CRM when useful`

The practical version can be small:

- Astro/Next.js page for the offer.
- Formbricks, an email form, or PocketBase for capture.
- Google Sheets, JSON, CSV, SQLite, or PocketBase as the first lead store.
- Email verification before enrichment or outreach.
- Mailtrap, Resend, Mailjet, or another ESP for transactional follow-up.
- SPF, DKIM, DMARC, and provider DNS records before serious sending.
- Listmonk, MailerLite, Smartlead, or a CRM only when the loop already produces useful leads.

The MVP is ready when every lead has a source, enough context to qualify it, a verified address, and a next action. 

Until then, more tooling mostly adds complexity.

Related:

- [A Quick Waiting List for your SaaS]({{< relref "/blog/dev-waitinglist.md" >}})
- [A boilerplate to create Landings for lead generation.]({{< relref "/blog/entrep-saas-diy-landing.md" >}})
- [Any SaaS needs this: Leads and a UI]({{< relref "/blog/entrep-saas-leads-ui.md" >}})
- [Forms and Newsletters for your Website]({{< relref "/blog/dev-forms.md" >}})
- [Formbricks turns static pages into lead capture]({{< relref "/notes/formbricks-turns-static-pages-into-lead-capture.md" >}})
- [Simple lead stores beat premature CRM complexity]({{< relref "/notes/simple-lead-stores-beat-premature-crm-complexity.md" >}})
- [Email verification protects the pipeline]({{< relref "/notes/email-verification-protects-the-pipeline.md" >}})
- [Email APIs are product infrastructure]({{< relref "/notes/email-apis-are-product-infrastructure.md" >}})
- [Mail DNS is deliverability infrastructure]({{< relref "/notes/mail-dns.md" >}})
- [Waiting to Landing repo](https://github.com/JAlcocerT/waiting-to-landing)
- [Simple waiting list repo](https://github.com/JAlcocerT/simple-waiting-list)
- [DIY landing boilerplate](https://github.com/JAlcocerT/diy-landing-boilerplate)
- [DIY Landing email form](https://github.com/JAlcocerT/diy-landing-boilerplate/blob/master/src/components/EmailForm.astro)
- [DIY Landing Formbricks modal](https://github.com/JAlcocerT/diy-landing-boilerplate/blob/master/src/components/SurveyModal.tsx)
- [DIY Landing Formbricks inline component](https://github.com/JAlcocerT/diy-landing-boilerplate/blob/master/src/components/SurveyInline.astro)
- [Make Landing repo](https://github.com/JAlcocerT/make-landing)
- [Programmatic email script](https://github.com/JAlcocerT/make-landing/blob/master/send_email.py)
- [Mailtrap ESP notebook](https://github.com/JAlcocerT/make-landing/blob/master/mailetrap-esp.ipynb)
- [PocketBase Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase)
- [Listmonk Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/listmonk)
- [Google Workspace DNS check script](https://github.com/JAlcocerT/Home-Lab/blob/main/z-dns-scripts/google_workspace_dns_check.py)
