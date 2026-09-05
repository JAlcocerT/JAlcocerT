---
title: "How secure is your SelfHosting"
date: 2027-05-01T23:20:21+01:00
draft: false
tags: ["Selfhosted OpSec"]
description: '.'
url: 'selfhosting-opsec-tools'
---

**Tl;DR**


**Intro**

* Why Im writting this post:
* What Ive learnt with it:

### DNS

dns4eu

What dig can show:

  - Records for the exact name you ask for, like fossengineer.com
  - Possibly NS, SOA, A, AAAA, MX, etc. for that name
  - It does not enumerate all subdomains

  To learn subdomains, you’d need one of these:

  - DNS zone access from your provider
  - An allowed zone transfer, which is rare
  - Certificate Transparency logs
  - Subdomain enumeration tools
  - Your own inventory of records in Cloudflare or wherever DNS is hosted

  So someone looking at dig fossengineer.com would not know how many subdomains are published unless your DNS setup exposes them indirectly or they use other discovery methods.

  If you want, I can give you the exact dig commands to check:

  1. the root record
  2. whether zone transfer is possible
  3. which nameservers are authoritative

f they do not have your Cloudflare credentials or zone access, they generally cannot see your Cloudflare DNS inventory directly. But they can still discover some subdomains by other means:

  - Guessing / trying names like forgejo.fossengineer.com, api.fossengineer.com
  - Certificate Transparency logs if you issued public TLS certs
  - Passive DNS / internet scans
  - Public links, app headers, redirects, or leaked configs
  - Wildcard DNS if you use it

  So the model is:

  - Without CF keys: no direct zone visibility
  - With the internet: some subdomains may still be discoverable
  - “Try and error” alone: possible, but not the only method

  If you want to reduce discovery:

  - avoid wildcard DNS unless needed
  - keep internal services off public DNS
  - use access control on exposed apps
  - don’t publish unnecessary TLS certs for internal names