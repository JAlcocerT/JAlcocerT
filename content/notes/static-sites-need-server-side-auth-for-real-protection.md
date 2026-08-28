---
title: "Static sites need server-side auth for real protection"
date: 2025-09-13
tags: ["authentication", "serverless", "ssg", "cloudflare"]
description: "Client-side auth can shape the interface, but protected data and actions need validation in a trusted server environment."
---

Static-site authentication has a hard boundary.

A browser can run Firebase, Logto, or PocketBase SDKs and show a different UI after login, but hidden frontend content is not truly protected. 

If the asset is shipped to the browser, assume it can be inspected.

For real protection, validate identity in a trusted environment: Cloudflare Workers, Pages Functions, Firebase Functions, a Node backend, FastAPI, or another server-side layer. 

That layer checks tokens, cookies, or sessions before returning private data or running privileged actions.

Client auth is UX. Server-side validation is enforcement.

Related:

- [Serverless]({{< relref "/docs/Dev/serverless.md" >}})
- [Firebase Auth SDK. Social Login and email verification.]({{< relref "/blog/dev-firebase-auth.md" >}})
- [FrontEnd 101. SPAs and ways to do Auth]({{< relref "/blog/dev-fe.md" >}})
- [Payroll Workers PocketBase repo](https://github.com/JAlcocerT/payroll-workers-pb)
- [Serverless Invoices repo](https://github.com/JAlcocerT/serverless-invoices)
- [Slidev Editor Firebase auth branch](https://github.com/JAlcocerT/slidev-editor/tree/firebaseauth)
- [Slidev Editor Logto auth branch](https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth)
