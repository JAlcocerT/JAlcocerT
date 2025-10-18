---
title: "A Stronger HomeLab"
date: 2025-08-03
draft: false
tags: ["Security","BackUps","Proton VPN","Bitwarden","2FAS vs ProtonAuthenticator","Signal"]
description: 'Make your Linux and SelfHosting more private & secure. Using stacer for apt clean ups.'
url: 'homelab-security'
---


**TL;DR**

Because its not about if, but when a *single point of failure* will be gone.


## BackUps

Lately I was reading this [reddit backup post](https://www.reddit.com/r/DataHoarder/comments/1gsutp5/list_of_free_open_source_and_crossplatform_backup/?chainedPosts=t3_yqonpo)

1. NextCloud
2. ProtonDrive

Unfortunately, there is no official https://github.com/donniedice/protondrive-linux

You also have some static/blob storage:

* https://developers.cloudflare.com/r2/pricing/
* s3 buckets

```sh
sudo sudo du -h --max-depth=10 /var/lib/docker | sort -rh | head
```

**How about code backups?**

* https://giteamirror.com/#features


## Privacy Apps

Some time ago I put together this list of cool security apps: https://jalcocert.github.io/Linux/docs/nix/fav-apps/#secprivacy


3. **Secure email client** via Thunderbird or https://proton.me/blog/proton-mail-desktop-app

```sh
wget https://proton.me/download/mail/linux/1.9.0/ProtonMail-desktop-beta.deb
sudo dpkg -i ProtonMail-desktop-beta.deb
sudo apt-get install -f
```

> You can use my [protonmail referal](https://pr.tn/ref/RHJ7YZE8BN8G).

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

```sh
#https://protonvpn.com/support/official-linux-vpn-debian/
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
#echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -
sudo apt install proton-vpn-gnome-desktop
```


2. Mullvad

Via [Mullvad x Gluetun](https://fossengineer.com/gluetun-vpn-docker/) 

Or locally:

```sh
#https://mullvad.net/en/download/vpn/linux
# Download the Mullvad signing key
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc

# Add the Mullvad repository server to apt
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable stable main" | sudo tee /etc/apt/sources.list.d/mullvad.list

# Install the package
sudo apt update
sudo apt install mullvad-vpn
```

3. Wireguard

Which you can setup via wg easy as [seen with the x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#desktop-with-vps-as-vpn-with-wireguard)

* https://github.com/Devsfy/wiregui

4. ProtonVPN

> They are opening more and more https://github.com/NordSecurity/nordvpn-linux

### HTTPs and SSL Everywhere

1. With NGINX Proxy Manager via UI

2. With Traefik (v3.3 is great) Programatically!

See [https for your apps](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/)

### Passwords

I simply love **Bitwarden** (which can also be selfhosted).

* It has a nice Android/Linux Desktop App
* You can add [2fa](#2fa) to it as well: https://vault.bitwarden.com/#/login

You also have other interesting pwd managers:

* ProtonPass - https://github.com/ProtonPass
    * https://proton.me/blog/pass-roadmap-summer-2025

* KeePass
    * https://sideofburritos.com/blog/i-switched-to-keepass/

### 2FA

Initially, I was using authy as my 2fa app.

I also tried Google Auth and microsoft version of it.

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

* It works **cross-device** (for real, including linux desktop + android).
* Its OSS and allows direct import/export.
* Allows (optional) to automatic sync via a proton account.

> Im using mostly **2FAS** (which syncs codes via gdrive)

>> But im giving a try to ProtonAuthenticator (Synced via protonmail + keeping backup codes handy, just in case)

For business purpose, you can still keep your microsoft auth / Google 2fa

### Chats

I like the telegram desktop app, but lately whenever I open it leaves my system frozen for a while.

```sh
#flatpak install flathub org.telegram.desktop
```

> [Telegram bots](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#tg-bots) are fun to tinker with!

In case that some of the well know chats stop working, you can try these:

```sh
flatpak install flathub im.riot.Riot #element
#flatpak install flathub org.signal.Signal
```

If you like Matrix or Signal, you might find interesting:

* https://github.com/permissionlesstech/bitchat

> **Bluetooth mesh chat**, IRC vibes


## Private AI

AI Apps with Containers and Cloudflare Tunnels.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen" title="AI Gen | Docker Configs 🐋 ↗"  >}}
{{< /cards >}}

### LLMs

Try with **Ollama**

* https://ollama.com/blog/new-app

Alternatively, you can try these LLMs:

* https://lumo.proton.me/guest
* https://proton.me/support/lumo-getting-started


---

## Conclusions

Its a long way to the top if you wanna rocknroll.

Same applies for a homelab security.

Dont forget to clean from time to time the apt packages that you are not using.

To do that via UI, you can try **Stacer**

![ubuntu apt package manager](/blog_img/mini_pc/stacer-apt-checks.png)


```sh
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer
```