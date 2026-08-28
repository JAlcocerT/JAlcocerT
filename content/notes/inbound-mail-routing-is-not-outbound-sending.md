---
title: "Inbound mail routing is not outbound sending"
date: 2025-11-24
tags: ["email", "dns", "self-hosting"]
description: "Receiving domain mail and sending trusted application mail are separate systems with different DNS and operational needs."
---

Receiving email and sending email are easy to confuse because both touch the same domain.

Inbound mail is about `MX` records and where messages for the domain should land: Proton, Google Workspace, Cloudflare Email Routing, Poste.io, or another mailbox stack.

Outbound mail is about whether an app or server can send as that domain and pass authentication.

Cloudflare Email Routing can be useful for aliases and forwarding, but it is not the same as running a full mailbox or sending transactional email. A self-hosted mailserver such as Poste.io needs its own DNS, anti-spam, TLS, and routing decisions.

The clean model is: choose inbox routing separately from product sending.

Related:

- [SMTP and e-mail stuff]({{< relref "/blog/dev-email.md" >}})
- [Mail DNS is deliverability infrastructure]({{< relref "/notes/mail-dns.md" >}})
- [Poste Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/poste)
- [PocketBase Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase)
- [Google Workspace DNS check script](https://github.com/JAlcocerT/Home-Lab/blob/main/z-dns-scripts/google_workspace_dns_check.py)
