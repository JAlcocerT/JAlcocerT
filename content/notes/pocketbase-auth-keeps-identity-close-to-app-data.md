---
title: "PocketBase auth keeps identity close to app data"
date: 2025-08-23
tags: ["pocketbase", "authentication", "sqlite", "saas"]
description: "PocketBase fits small apps when authentication, user records, and application data should live in one inspectable backend."
---

PocketBase auth is attractive because identity sits next to the product data.

Instead of adding a separate identity provider first, the app can use PocketBase users, collections, API rules, SDK calls, bearer tokens, and `HttpOnly` cookie flows. 

That fits small SaaS experiments, Streamlit tools, Astro/Cloudflare prototypes, and admin-style products where SQLite-backed ownership is enough.

The tradeoff is that the application is now aware of its auth model. 

The frontend, backend, cookies, API rules, and email verification setup all need to line up.

PocketBase is not just login; it is login plus the app database.

Related:

- [FrontEnd 101. SPAs and ways to do Auth]({{< relref "/blog/dev-fe.md" >}})
- [Authentication]({{< relref "/docs/Dev/authentication.md" >}})
- [Mailtrap as PocketBase SMTP]({{< relref "/blog/dev-email-pocketbase.md" >}})
- [PocketBase Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase)
- [Payroll Workers PocketBase repo](https://github.com/JAlcocerT/payroll-workers-pb)
- [Astro Link Hub PocketBase repo](https://github.com/JAlcocerT/link-hub-pb)
- [Streamlit PocketBase auth script](https://github.com/JAlcocerT/py-stonks/blob/main/hardcoded-auth-streamlit/st_auth_pb.py)
- [DIY Landing PocketBase auth form](https://github.com/JAlcocerT/diy-landing-boilerplate/blob/master/src/components/AuthForm.tsx)
