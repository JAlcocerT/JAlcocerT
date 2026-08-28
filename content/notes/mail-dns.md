---
title: "Mail DNS is deliverability infrastructure"
date: 2026-06-06
tags: ["email", "dns", "deliverability", "outreach"]
description: "Email tools only work reliably when DNS proves who can send, receive, and authenticate mail for the domain."
---

Mail DNS is not a checkbox after choosing an email provider.

For outreach, newsletters, transactional email, and domain inboxes, DNS is the trust layer. The tool can be Mailjet, Resend, Mailtrap, MailerLite, Google Workspace, Proton, Listmonk, Mautic, or Poste.io, but the real gate is whether receivers can verify the domain.

The practical setup is:

- `NS` decides where the domain records live.
- `MX` decides who receives mail for the domain.
- `SPF` lists which senders are allowed to send for the domain.
- `DKIM` signs outgoing mail so receivers can verify it was not altered.
- `DMARC` tells receivers what to do when SPF or DKIM do not align with the visible From domain.
- Provider verification records, usually `TXT` or `CNAME`, prove ownership but are not a substitute for SPF, DKIM, and DMARC.

Start with the provider's required records, keep mail records DNS-only when using Cloudflare, then verify externally with tools such as MXToolbox, Google CheckMX, or your own script. 

A domain can appear connected when `MX` and `SPF` pass, but it is not really ready for serious outreach until `DKIM` and `DMARC` are present too.

Related:

- [SMTP and e-mail stuff]({{< relref "/blog/dev-email.md" >}})
- [JAlcocerTech Services Recap]({{< relref "/blog/jalcocertech-services-0626.md" >}})
- [Marketing]({{< relref "/docs/Entrepreneur/marketing.md" >}})
- [Google Workspace DNS check script](https://github.com/JAlcocerT/Home-Lab/blob/main/z-dns-scripts/google_workspace_dns_check.py)
- [Cloudflare DNS updater script](https://github.com/JAlcocerT/Home-Lab/blob/main/z-dns-scripts/cf-dns-updater.py)
- [Cloudflare DNS scripts](https://github.com/JAlcocerT/Docker/tree/main/Security/DNS/Cloudflare_DNS)
