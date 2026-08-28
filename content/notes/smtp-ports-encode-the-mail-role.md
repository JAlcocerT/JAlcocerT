---
title: "SMTP ports encode the mail role"
date: 2025-11-24
tags: ["email", "smtp", "deliverability"]
description: "SMTP port choice should follow whether the app is submitting mail or a server is relaying mail."
---

SMTP ports are not random provider settings.

They describe the role of the connection. When an app, backend, Listmonk, PocketBase, or automation tool sends through an ESP, it is submitting mail. 

Start with `587` and `STARTTLS`, because that is the normal secure submission path. Use `465` only when the provider expects implicit TLS, and `2525` when standard ports are blocked.

Port `25` is a different job: server-to-server relay. It is often blocked, abused, and not the right first choice for application sending.

The useful habit is to configure SMTP by role first, provider second.

Related:

- [SMTP and e-mail stuff]({{< relref "/blog/dev-email.md" >}})
- [Email APIs are product infrastructure]({{< relref "/notes/email-apis-are-product-infrastructure.md" >}})
- [Listmonk Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/listmonk)
- [PocketBase Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase)
- [Mailtrap ESP notebook](https://github.com/JAlcocerT/make-landing/blob/master/mailetrap-esp.ipynb)
