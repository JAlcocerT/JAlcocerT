---
title: "Self-hosted mail trades fees for operations"
date: 2025-11-24
tags: ["email", "self-hosting", "deliverability"]
description: "Self-hosted mail tools reduce platform dependence but move DNS, deliverability, and maintenance back onto the operator."
---

Self-hosted email is control with a bill paid in operations.

Tools such as Listmonk, Mautic, BillionMail, docker-mailserver, MailHog, MailDev, MailCatcher, Maildrop, and Poste.io can replace parts of paid email stacks. 

But they do not remove the hard parts: DNS records, TLS, anti-spam, sender reputation, bounces, unsubscribes, backups, upgrades, and testing.

The pragmatic split is to self-host list logic, forms, local testing, or campaign management when ownership matters, and use a proven ESP for delivery when inbox placement matters more than ideology.

Mail is infrastructure. Owning it means operating it.

Related:

- [SMTP and e-mail stuff]({{< relref "/blog/dev-email.md" >}})
- [Email APIs are product infrastructure]({{< relref "/notes/email-apis-are-product-infrastructure.md" >}})
- [Mail DNS is deliverability infrastructure]({{< relref "/notes/mail-dns.md" >}})
- [Listmonk Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/listmonk)
- [Mautic Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/mautic)
- [Odoo Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/odoo)
- [Poste Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/poste)
