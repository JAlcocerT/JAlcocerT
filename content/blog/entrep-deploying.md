---
title: "Where to Deploy? PaaS are great VPS companions"
date: 2025-09-10
draft: false
tags: ["VPS","PaaS for SaaS","Lean Startup","Elestio vs Hetzner vs DO","Goodies 4 Marketers"]
description: 'Resources to launch your stuff in front of your clients. From CRMs, ERPs to forums.'
url: 'where-to-deploy'
---

**TL;DR**

If you are building software or want to use [projects that other built...](#faq)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs for your server" >}}
{{< /cards >}}

...you will just need a place to host them.

**Intro**

Have your client in the loop asap.

Thats one of the outcomes of *the [lean](https://jalcocert.github.io/JAlcocerT/lean/) startup*

So when the code works on your machine: *how about sharing it with real users?*

Plot twist: nobody cares about solutions that only you can use.

So get ready to know how to use a [VPS as infrastructure](#vps) for your apps.

I will just assume that:

1. You have something to share or want to use a conteinerized app that other people created
2. You know how to get a domain and configure DNS records
3. You are ready to pay for a VPS - *Prepare ~5$/m for a basic VPS*

## VPS

VPS, just a computer somewhere else in the world.

I started using GCP free tier to get started with cloud.

> Later, I got dissapointed with Oracle Cloud.

Then decided to try these VPS for fun and see how my linux skills got better.

Any of these can help you serve your Apps to people, unless you want to do so from your homelab!

1. [Digital Ocean](#do)
2. [Hetzner](#hetzner)
3. [Linode](#linode)

If you need big GPU power, isntead of just CPU, you can always try https://www.runpod.io/gpu-instance/pricing and similar services.

* https://accounts.hetzner.com/_ray/pow (I tried the CX22 model x2 vCPU)
* https://cloud.digitalocean.com

**Clouds ( & GPU Clouds)**

* RunPod, Linode, DigitalOcean, Paper Space, Lambda Cloud, [Hetzner](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#hetzner)...
* vast.ai, 
* Google Colab TPU...

### DO

* https://www.digitalocean.com/pricing/droplets

> From ~4/m for 1vcpu

### Hetzner

* https://www.hetzner.com/cloud/

> Competitive prices ~4$ for 2 vcpu

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

Its up to you: Homelab vs VPS

1. Get a [x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#energy-x300), get a ~15w avg at 0,25eur/kwh will cost you ~32eur/y (or 2,74 a month)

2. Deploy on one of [these smaller](#vps) servers for a little bit more of the price, but you forget about the initial costs.

**A new repo** for SelfHosters:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs for your server" >}}
{{< /cards >}}

3. Get [https/SSL](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/)

4. Do that cleanup from time to time:


```sh
#df -h
docker stop $(docker ps -a -q) #stop all
#docker volume rm $(docker volume ls -q | grep -v '^portainer_data$') #rm all volumes but portainer

#docker system df
#docker image prune -a 
#docker builder prune -a --force

#docker system prune --all --volumes #just clean all...
```

### Among All PaaS - What to Choose?

I was writting about PaaS earlier this year [here](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/).

With particular attention to Dokploy, [here](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/).

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/coolify" title="Coolify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dokploy" title="Dokploy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=1POdazLoiRE -->

{{< youtube "1POdazLoiRE" >}}


### Outro

#### Goodies for Servers

1. Dont forget about **fail2ban**:

* https://akashrajpurohit.com/blog/fail2ban-protecting-your-homelab-from-brute-force-attacks/


2. **VPNs**: Like Mullvad or ProtonVPN as covered [here](https://jalcocert.github.io/JAlcocerT/homelab-security/#vpn)

3. Get [https/SSL](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/) via Cloudflare tunnel or Traefik v3.3 setup.

#### Goodies for Marketers

Are you mastering marketing and social media?

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/social-media-automation/#conclusions" title="Social Media Automation | Post ↗" >}}
{{< /cards >}}

Email marketing on easy mode thanks to:

* https://www.producthunt.com/products/listmonk
  * https://github.com/knadh/listmonk
    * https://listmonk.app/docs/apis/transactional

>  High performance, **self-hosted, newsletter and mailing list manager** with a modern dashboard. Single binary app. 

> > OSS and Selfhostable! Just visit `http://192.168.1.2:9077/admin/` to get started.

![ListMonk UI](/blog_img/selfh/marketing/listmonk.png)

Configuring Listmonk is not any harded than getting Mautic up and running.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/listmonk" title="Tools like ListMonk are Selfostable and allow for transactional emails with attachment! | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mautic" title="Mautic | Docker Config 🐋 ↗" >}}
{{< /cards >}}

You need a CRM? or even ERP?

Not really a problem.

Before paying and getting vendor locked in, see:

1. Odoo, ERPNext, SuiteCRM...
2. https://elest.io/fully-managed-services/applications/crm-erp


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/erpnext" title="ERPNext Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/odoo" title="Odoo HomeLab | Docker Config 🐋 ↗" >}}
{{< /cards >}}

---

## FAQ

### Hosting a Forum

Got a big enough audience?

Let them create content and discuss within a platform that you own.

* https://elest.io/open-source/nodebb/resources

* https://github.com/NodeBB/NodeBB

>  Node.js based **forum software** built for the modern web 

* https://github.com/LemmyNet/lemmy

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Communication/lemmy/docker-compose.yml" title="lemmy Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/lemmy" title="Lemmy Forum via your HomeLab | Docker Config 🐋 ↗" >}}
{{< /cards >}}