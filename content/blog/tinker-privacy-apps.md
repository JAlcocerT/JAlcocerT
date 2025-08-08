---
title: "A Stronger HomeLab"
date: 2025-08-03
draft: false
tags: ["HomeLab","Security","BackUps","VPN"]
description: 'Apps to make your Linux and SelfHosting more private and secure'
url: 'homelab-security'
---


## BackUps

Lately I was reading this [reddit backup post](https://www.reddit.com/r/DataHoarder/comments/1gsutp5/list_of_free_open_source_and_crossplatform_backup/?chainedPosts=t3_yqonpo)

Because its not about if, but when a *single point of failure* will be gone.

1. NextCloud
2. 

Unfortunately, there is no official https://github.com/donniedice/protondrive-linux

* https://developers.cloudflare.com/r2/pricing/
* s3

```sh
sudo sudo du -h --max-depth=10 /var/lib/docker | sort -rh | head
```

**How about code backups?**

* https://giteamirror.com/#features


### Media

* ProtonDrive



## Privacy Apps

### VPN

To connect to your homelab, having a VPN at home is a nice way.

You can combine it with HTTPs/SSL setup if you have a domain + have this Traefik Setup.

To get started, **tailscale** is a great way to proceed.

You also have:

1. ProtonVPN

* https://protonvpn.com/support/installing-protonvpn-on-a-router
* https://account.proton.me/u/0/vpn/vpn-apps
    * https://protonvpn.com/download-linux
    * https://github.com/ProtonVPN/proton-vpn-gtk-app
    * https://protonvpn.com/support/official-linux-vpn-ubuntu/

2. Mullvad

* [Mullvad x Gluetun](https://fossengineer.com/gluetun-vpn-docker/) 

3. Wireguard

Which you can setup via wg easy as [seen with the x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#desktop-with-vps-as-vpn-with-wireguard)

* https://github.com/Devsfy/wiregui

### HTTPs and SSL Everywhere

1. With NGINX Proxy Manager via UI

2. With Traefik Programatically! 


### Passwords

I simply love **Bitwarden** (which can also be selfhosted).

* It has a nice Android/Linux Desktop App
* You can add [2fa](#2fa) to it as well: https://vault.bitwarden.com/#/login

You also have:

* https://github.com/ProtonPass
    * https://proton.me/blog/pass-roadmap-summer-2025

* KeePass
    * https://sideofburritos.com/blog/i-switched-to-keepass/

### 2FA

Initially, I was using authy as my 2fa app.

I also tried Google auth and microsoft version of it.

They all work fine.

Then I heard about: 2FAS and Aegis, which are OSS.

But just recently, we have https://proton.me/authenticator

* https://github.com/orgs/protonpass/repositories
    * https://github.com/protonpass/proton-pass-common/releases

```sh
curl -LO https://proton.me/download/authenticator/linux/ProtonAuthenticator_1.0.0_amd64.deb
sudo dpkg -i ProtonAuthenticator_1.0.0_amd64.deb
sudo apt-get install -f
#rm ProtonAuthenticator_1.0.0_amd64.deb
```

* It works cross-device (for real, including linux desktop + android).
* Its OSS and allows direct import/export.
* Allows (optional) to automatic sync via a proton account.

> Im using mostly **2FAS** (which syncs codes via gdrive)

>> But im giving a try to ProtonAuthenticator (Synced via protonmail + keeping backup codes handy, just in case)

For business purpose, you can still keep your microsoft auth / Google 2fa


## Private AI

AI Apps with Containers and Cloudflare Tunnels


### LLMs

Try with **Ollama**

* https://ollama.com/blog/new-app

Alternatively, you can try these LLMs:

* https://lumo.proton.me/guest
* https://proton.me/support/lumo-getting-started

### Image Generation

* Foocus
* Stable Difussion Web UI
* Easy Difussion

---

## Conclusions

Its a long way to the top if you wanna rocknroll.

Same for homelab security.


## FAQ

### How to Change USB Size

```sh
Diskpart
List disk
select disk N
clean 
create partition primary
```

