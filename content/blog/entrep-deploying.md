---
title: "Where to Deploy?"
date: 2025-09-10
draft: false
tags: ["VPS","PaaS for SaaS","Lean Startup","Elestio"]
description: 'How to deploy? Resources to launch your stuff in front of your clients.'
url: 'where-to-deploy'
---

**Intro**

Have your client in the loop asap.

Thats one of the outcomes of *the [lean](https://jalcocert.github.io/JAlcocerT/lean/) startup*

So when the code works on your machine: *how about sharing it with real users?*

## VPS

VPS, just a computer somewhere else in the world.

I started using GCP free tier to get started with cloud.

> Later, I got dissapointed with Oracle Cloud.

Then decided to try these VPS for fun and see how my linux skills got better.

Any of these can help you serve your Apps to people, unless you want to do so from your homelab!

1. [Digital Ocean](#do)
2. [Hetzner](#hetzner)
3. [Linode](#linode)

### DO

* https://www.digitalocean.com/pricing/droplets

> From ~4/m for 1vcpu

### Hetzner

* https://www.hetzner.com/cloud/

> Competitive prices ~4$ for 2vcpu

> > Germany or Finland

### Linode

* https://cloud-estimator.linode.com/s/

![alt text](/blog_img/mini_pc/linode-vps.png)

> The basic ones goes for around 60$/y for 1vcpu

> > They have several locations, including US, JAPAN, EU AMS

---

##  Others

### Elestio

I used https://elest.io/ to try some open source projects.

Their mission is great:

>  Fully managed DevOps platform to deploy your code and open-source software 

* You manage it all from https://dash.elest.io/login

They also provide guides and high level features on the OSS projects.

See: https://elest.io/fully-managed-services/hosting-and-infrastructure



---

## Conclusions

Its up to you:

1. Get a [x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#energy-x300), get a ~15w avg at 0,25eur/kwh will cost you ~32eur/y (or 2,74 a month)

2. Deploy on one of [these smaller](#vps) servers for a little bit more of the price, but you forget about the initial costs.

**A new repo** for SelfHosters:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs for your server" >}}
{{< /cards >}}

### Goodies for Servers

1. Dont forget about **fail2ban**:

* https://akashrajpurohit.com/blog/fail2ban-protecting-your-homelab-from-brute-force-attacks/


2. **VPNs**: Like Mullvad or ProtonVPN as covered [here](https://jalcocert.github.io/JAlcocerT/homelab-security/#vpn)

3. Get https/SSL via Cloudflare tunnel or Traefik v3.3 setup.

### Goodies for Marketers


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/social-media-automation/#conclusions" title="Social Media Automation | Post ↗" >}}
{{< /cards >}}


* https://www.producthunt.com/products/listmonk

* https://docs.serpbear.com/deployment/deploying-to-elestio-1-click

* https://elest.io/fully-managed-services/applications/crm-erp



---

## FAQ

### Hosting a Forum

* https://elest.io/open-source/nodebb/resources

* https://github.com/NodeBB/NodeBB

>  Node.js based forum software built for the modern web 

* https://github.com/LemmyNet/lemmy

https://github.com/JAlcocerT/Docker/blob/main/Communication/lemmy/docker-compose.yml

### Hosting an eCommerce

* https://libreselfhosted.com/project/aimeos/

* https://github.com/aimeos
  * https://github.com/aimeos/aimeos

> MIT | Ultra-fast, Cloud-native, API-first PHP e-commerce framework for building custom online shops, scalable marketplaces and complex B2B apps 