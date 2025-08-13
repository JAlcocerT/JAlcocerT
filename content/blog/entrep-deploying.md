---
title: "Where to Deploy?"
date: 2025-08-17
draft: false
tags: ["VPS","PaaS for SaaS","Lean Startup","VPN"]
description: 'Resources to launch your stuff to your clients.'
url: 'where-to-deploy'
---

Have your client in the loop asap.

Thats one of the outcomes of *the [lean](https://jalcocert.github.io/JAlcocerT/lean/) startup*


## VPS

I started using GCP free tier to get started with cloud.

Later I got dissapointed with Oracle Cloud.

Then decided to try these VPS for fun.

> Any of these can help you serve your Apps to people, unless you want to do so from your homelab!

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

* https://dash.elest.io/login

---

## Conclusions

Its up to you:

1. Get a [x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#energy-x300), get a ~15w avg at 0,25eur/kwh will cost you ~32eur/y (or 2,74 a month)

2. Deploy on one of these smaller servers for a little bit more of the price, but you forget about the initial costs.

**A new repo** for SelfHosters:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs" >}}
{{< /cards >}}

### Goodies for Servers


1. Dont forget about fail2ban:

* https://akashrajpurohit.com/blog/fail2ban-protecting-your-homelab-from-brute-force-attacks/


2. **VPNs**: Like Mullvad or ProtonVPN

* https://protonvpn.com/support/official-linux-vpn-debian/

```sh
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
#echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -
sudo apt install proton-vpn-gnome-desktop
```


3. **Secure email client** via Thunderbird or https://proton.me/blog/proton-mail-desktop-app

```sh
wget https://proton.me/download/mail/linux/1.9.0/ProtonMail-desktop-beta.deb
sudo dpkg -i ProtonMail-desktop-beta.deb
sudo apt-get install -f
```

* https://pr.tn/ref/RHJ7YZE8BN8G