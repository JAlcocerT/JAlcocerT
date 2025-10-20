---
title: "SelfHosting Updates - End Summer 2025"
date: 2025-09-28T01:20:21+01:00
draft: false
tags: ["HomeLab","Ventoy","SSGs","MKCert","MeTube/Navidrome","Zen Browser","Box2Overtake"]
description: 'Selfhosting for New Comers: SSGs,Python WebApps with Traefik v3 HTTPs and a Firebat'
url: 'selfhosted-apps-sept-2025'
---

Summer is almost gone...

**TL;DR:** 

[Lately I](#lately-i) have been [tinkering with Python Web Apps](https://jalcocert.github.io/JAlcocerT/web-apps-with-python/) and with SGGs.

A Post for anyone just starting with a home server.

+++ If you like [Music, this is how to have your DIY spotify - server setup via container](#your-music-server)
+++ Revisited the [FireBat AK2 and added https via Traefik](#hello-again-firebat)

**Intro**

**If you are new** with SelfHosting and HomeLab in general, just remember to get started properly:

1. [Install some Linux](#which-linux-to-get-started) (or try with a VM first / via [wsl on your Windows](https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/#conclusions))

2. Get docker installed [like a **PRO**](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/) with such [script](https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/Selfhosting_101.sh)

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh
nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING FIRST

#chmod +x Selfhosting_101.sh
#sudo ./Selfhosting_101.sh 
```

If you want, you can get Podman *instead of Docker*:

```sh
sudo apt install podman
podman --version
```

3. Open Portainer `localhost:9000` and start [deploying apps](#selfhosting-sept-25) other people created (FAST)

4. Start [creating and deploying your Apps](#how-to-bundle-your-apps)

5. Get a domain ([TLD](https://tld-list.com/)) and [bring https](#https-everywhere) when you feel confortable.

6. Along the way...


* Understand what chmod does: https://it-tools.tech/chmod-calculator
* Dont be afraid of the terminal. Embrace the CLI and SSH ( [Termix](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#termix) will help! )
* Crontab to schedule tasks: https://it-tools.tech/crontab-generator
* Get in love with docker compose: https://it-tools.tech/docker-run-to-docker-compose-converter
* Understand apt packages and [how to manage them](https://jalcocert.github.io/JAlcocerT/homelab-security/#conclusions)

---


## SelfHosting Sept 25

At some point, you will need these docker commands:

```sh
#df -h #check space
docker stop $(docker ps -a -q) #stop all
#docker volume rm $(docker volume ls -q | grep -v '^portainer_data$') #rm all volumes but portainer

#docker system df
#docker image prune -a 
#docker builder prune -a --force
docker system prune --all --volumes #release space from old containers

#docker system prune --all --volumes #just clean all...
```

Be aware that named volumes, which are not removed by default with docker system prune as they might contain important data.

But you can have such script to clean all volumes that are not associated to a running containre. 

**Just be careful:**

```sh
comm -23 <(docker volume ls -q | sort) <(docker ps --format '{{.Names}}' | xargs -I {} docker inspect --format '{{range .Mounts}}{{if .Name}}{{.Name}}
{{end}}{{end}}' {} 2>/dev/null | sort -u) | xargs -r docker volume rm
```

### HTTPs Everywhere

When you will be confortable with containers, you will want to bring https instead of having that insecure http.

I got to know about: https://github.com/FiloSottile/mkcert

```sh
#sudo apt install mkcert #https://github.com/jeffcaldwellca/mkcertWeb
```

> A simple zero-config tool to make locally trusted development certificates with any names you'd like.

> > But I would recommend to go directly to a *,proper'* Cloudflare or Traefik v3.3 setup

To access securely your services outside home, You have low config VPNs like tailscale.

```sh
# Enable IPv4 forwarding
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
# Enable IPv6 forwarding
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
# Apply the changes immediately
sudo sysctl -p /etc/sysctl.conf
#sudo tailscale up --advertise-exit-node
#sudo tailscale set --advertise-exit-node=true
```

Go to https://login.tailscale.com/admin/machines and configure your [exit node](https://tailscale.com/kb/1103/exit-nodes)

![alt text](/blog_img/selfh/HomeLab/tailscale-exitnode.png)

For more advance users exploring DNS: see PiHole and DuckDNS.

But as of today i'd rather keep these [https setups](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/):

* Setup NGINX to get https via UI as per this guide
* Or go the Traefik v3.3 approach (programatic https) as per this other guide
* Just use cloudflared...

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX Setup" >}}
  {{< card link="https://fossengineer.com/selfhosting-traefik/" title="Traefik Setup" >}}
{{< /cards >}}


{{< hextra/feature-grid >}}
 
{{< hextra/feature-card
  title="Setup NGINX"
  subtitle="How to setup -PiHole and UnBound DNS with FireBat"
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://jalcocert.github.io/RPi/posts/selfh-internet-better/"
>}}

{{< hextra/feature-card
  title="Setup Syncthing"
  subtitle="P2P Syncing between home devices with Filebrowser"
  style="background: radial-gradient(ellipse at 50% 80%,rgba(142,53,74,0.15),hsla(0,0%,50%,0));"
  link="https://fossengineer.com/selfhosting-filebrowser-docker/"
>}}

{{< hextra/feature-card
  title="Setup NextCloud in your Home Server with Https"
  subtitle="With Traefik with a domain pointing to a private IP address"
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#nextcloud-with-https/"
>}}

{{< /hextra/feature-grid >}}

As a NC has recently made a release: https://hub.docker.com/_/nextcloud/tags

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/nextcloud" title="HomeLab x NextCloud | Config File 🐳 ↗"  >}}
{{< /cards >}}

```sh
sudo docker compose -f docker-compose.traefik.yml up -d
#/media/casa/Datos_copia_2
#/home/casa/Home-Lab/nextcloud
sudo docker compose -f docker-compose.traefik.yml ps

#ping nextcloud.casa.jalcocertech.com
#ifconfig enp1s0

#sudo docker inspect nextcloud
#docker inspect nc -f '{{range $net, $conf := .NetworkSettings.Networks}}{{$net}} ({{$conf.IPAddress}}){{end}}'
#docker network inspect traefik_traefik-proxy --format '{{range .Containers}}{{.Name}} ({{.IPv4Address}}) - {{.MacAddress}}{{"\n"}}{{end}}'
```

![alt text](/blog_img/selfh/HomeLab/nextcloud-traefik-local.png)

> If you want a photo centered selfhosted app, see [Immich](https://github.com/JAlcocerT/Home-Lab/tree/main/immich), which just released v2.0

Make sure your router DHCP settings does not change the private ip of your homelab, or your cloudflare x traefik setup will be pointing to a wrong ip:

![alt text](/blog_img/selfh/HomeLab/dhcp-static-ip-4grouter.png)

See also...

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/cloudflare-tunnel" title="Cloudflared Tunnel | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Web/nginx-proxy-manager" title="NGINX | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}

These posts might help:

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX Setup" >}}
  {{< card link="https://fossengineer.com/selfhosting-traefik/" title="Traefik Setup" >}}
{{< /cards >}}


---

## Conclusions

Autumn is almost here.

And is a great chance to tinker with your miniPC and homelab.


Try new **desktop apps** for your linux system and install them via:

{{< cards cols="2" >}}
  {{< card link="https://flathub.org/" title="FlatHub Apps" >}}
  {{< card link="https://snapcraft.io/" title="SnapCraft Apps" >}}
{{< /cards >}}

Example, install **RustDesk** or Reminna to control your new miniPC from your laptop (with full UI access): 

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.rustdesk.RustDesk


> See also [appimagelauncher](https://jalcocert.github.io/JAlcocerT/flask-cms-for-ssgs/#lately-i) :)

```

I promised recently that **I wont do** more static sites for people.

And consequently, this has not been a DFY (done for you), but a DWY (done with you) recap of [this](https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/) and [this](https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/) web setups.

This is how the session went:

{{< youtube "jO-PiZyVWe8" >}}

> Just make sure to have all you need for [HUGO](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/) or [Astro web development](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/) ready
<!-- 
https://www.youtube.com/watch?v=jO-PiZyVWe8
 -->

Plot twist.

You will never stop learning, as more and more selfhosted apps will catch our attention:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/" title="Home-Lab | Docker Config Files 🐳 ↗"  >}}
{{< /cards >}}

For example, Homarr:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/#homarr" title="Homarr" image="/blog_img/selfh/media/homarr-nc.png" subtitle="Seen on Spring 2025 Selfhosting Post" >}}
{{< /cards >}}

* Networking, Domains and DNS, SSL...
* Creating your own containers...

Fortunately, there are amazing resources to give you ideas:

1. https://selfh.st/
  
* From this one you will get weekly projects to have a look ( Plot Twist: you wont have time to see them all)
  * Example: https://github.com/OpenCut-app/OpenCut or https://github.com/Cloudable-dev/netgoat

> MIT | The open-source CapCut alternative 

> MIT | A Cloudflare alternative for local and cloud use, can be used ontop of cloudflare for cloudflares paid features, but for free! 

  <!-- https://www.youtube.com/watch?v=OOxzP1JvfQk -->

{{< youtube "OOxzP1JvfQk" >}}



2. https://github.com/jmlcas?tab=repositories

Youtube is a great source for great tutorials too: Jims Garage, Christian Lempa, Tech with Nana, NetworkChuck, Pelado Nerd (*in Spanish*), DB Tech...

I will never be able to thank them enough for all they have taught me already (*and to other great channels that would make the list too long*). 

> If you ever wandered what are the most popular repos: https://gitstar-ranking.com/repositories

Remember about:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs for anyone starting a Home-Lab" >}}
{{< /cards >}}

3. Free goodies: https://free-for.dev/#/ and https://freestuff.dev/alternative/clerk/



## Lately I...

They are also placed into the *new Home-Lab repo* and the stack of this post will be placed also accordingly:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH" title="Docker Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Collection of Docker Config Files - 0925 Edition 🐳 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="Home-Lab Github Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Ordered config files | Youtube Video friendly and for New SelfHosters 🐳 ↗" >}}
{{< /cards >}}

I have updated the `docker-compose.yml` and Dockerfiles at:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Python_apps" title="Python WebApps | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Web/SSGs" title="SSGs | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}


{{< details title="Astro Theme Selection | Blog 101 with PPTs 📌" closed="true" >}}

```sh
git clone https://github.com/monakit/monakit
npm install
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

> This theme uses revealJS for the ppts, a candidate for an upcoming blog.jalcocertech.com 

You can add pretty quick an [n8n embedded chatbot](https://jalcocert.github.io/JAlcocerT/pro-agency-automation/#landing-chatbot-with-kb-knowledge) to these kind of sites.



{{< /details >}}


{{< details title="HUGO Theme | Blog 101 📌" closed="true" >}}

```sh
git clone https://github.com/JAlcocerT/EntreAgujayPunto

#install go
wget https://go.dev/dl/go1.21.1.linux-armv6l.tar.gz
sudo tar -C /usr/local -xvzf go1.21.1.linux-armv6l.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.bashrc
go version

#https://github.com/gohugoio/hugo/releases/tag/v0.123.0
wget https://github.com/gohugoio/hugo/releases/download/v0.123.0/hugo_extended_0.123.0_linux-amd64.deb -O hugo_specific_version.deb && \
sudo dpkg -i hugo_specific_version.deb && \
rm hugo_specific_version.deb && \
source ~/.bashrc

hugo version
hugo server --bind="0.0.0.0" --baseURL="http://192.168.1.106" --port=1313
```


{{< /details >}}

To put astro/hugo inside a container is as simple as:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ssg-hugo" title="HUGO SSG Selfhosted | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ssg-astro" title="Astro SSG Selfhosted | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}

Once you have your theme selected and tweaked, maybe even with custom [shortcodes/components](https://github.com/JAlcocerT/just-ssg)...

You have to host it somewhere so that others can see what you created.

Option A: You can use any of these 3rd party [free static hosting](https://fossengineer.com/alternatives-for-hosting-static-websites) 

> Example: `https://box2overtake.com/` or `proyectorutasmoto.web.app`

Option B: create your container to selfhost astro/hugo/whatever ssg and expose it publically via cloudflare tunnels.

> Using your HomeLab to host a cool website, *like this [ebook landing](https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/#using-sell-your-ebook)*, is as simple as understanding those!

> > Want sth more? See how to use your SSG with IPFS and ENS ([WEB3](https://jalcocert.github.io/JAlcocerT/web-domain-basics/) ready!)

### Pi and IoT

Ive been tinkering with [MicroControllers](https://jalcocert.github.io/JAlcocerT/microcontrollers-setup-101/) and [MQTT protocol](https://jalcocert.github.io/JAlcocerT/messaging-protocols/).

Microcontrollers like the esp32 and some creativity can get you even a ebook reader as per [this video](https://www.youtube.com/watch?v=wU0DC1wi3qo)

* **HA** https://www.home-assistant.io/docs/automation/

### New Software

Ive also tried:

1. Tried [Zen browser](https://github.com/zen-browser/desktop/releases/tag/1.14.11b): https://zen-browser.app/download/

With `CTRL+ALT+C` it gets really compact!

With `CTRL+H`, it opens your synced tab, so you can see your mobile firefox tabs on desktop :)

```sh
#pkill -9 brave #brave was not behaving properly lately...
flatpak install flathub app.zen_browser.zen
```
> Welcome to a calmer internet | Firefox based 

> > Zen offers a "Sync" feature, which is implemented using Mozilla Firefox's Sync feature.


---


## FAQ


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dev-ops-for-non-devops/" title="How to Bundle your Apps | DevOps Post ↗"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/benchmarking-computers/" title="Bencharm your MiniPC | Post ↗"  >}}
{{< /cards >}}


### Your Music Server

Got that server running with containers?

Congrats, you can no whave your DIY spotify: A music webapp server that stores whatever your bring them, like from [here](#youtube-fe)

Your music your rules.

```sh
sh -lc 'echo "Current user: $(whoami)"; id; echo "UID: $(id -u)"; echo "GID: $(id -g)"; echo "Groups: $(id -Gn)"' 
```

For android, you have as client **ultrasonic**: https://gitlab.com/ultrasonic/ultrasonic

> Free and open-source music streaming Android client for Subsonic API compatible servers

With Supported (tested) Subsonic API implementations: Subsonic, Airsonic-Advanced, Supysonic, Ampache

You also have **substreamer** app on ios or android (as a client), they also have: https://hub.docker.com/r/ghenry22/substreamer

> Just that its not OSS

See also MeTube and Navidrome:

![NaviDrome UI](/blog_img/selfh/HomeLab/navidrome.png)

{{< callout type="info" >}}
Get tailscale VPN on your server and phone. Enjoy your music from anywhere.
{{< /callout >}}

### Youtube FE

If you are creating youtube videos from your action cam and storing them just there: you can download them later on, so you can review your [travel](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/) stories during those long flights.

![MeTube UI](/blog_img/selfh/HomeLab/metube.png)

There are more alternatives, like:

* https://github.com/christian-fei/my-yt

> Unlicensed | A clean and minimal youtube frontend, without all the ads and whistles

### HomeLab Commands

1. Whats taking that much space?

```sh
#sudo du -ahx / | sort -rh | head -n 50
sudo du -ahx . | sort -rh | head -n 50 #from current folder and below
```

2. I want to clean old container stuff

```sh
docker builder prune
#docker system prune -a
docker volume prune
docker image prune -a
```

3. Stop all containers, but portainer:

```sh
#docker ps -a -q --filter 'name=!portainer'
docker ps -q | grep -v portainer | xargs docker stop
```

4. How much resources are those containers cosuming?

```sh
docker-compose stats
#sudo docker stats 7dfdfce97523
#sudo docker stats nextcloud
#docker stats typebot-builder typebot-viewer typebot-db

docker stats $(docker ps --filter "name=typebot" --format "{{.Names}}")
#docker stats -a
```

See also lazydocker!

### Git Sync

From https://akashrajpurohit.com/blog/initial-vps-setup-checklist-first-30-minutes/

* https://github.com/AkashRajpurohit/git-sync

>  🔄 A simple tool to backup and sync your git repositories 

### How to Change USB Size

This has been useful few times already (from Windows):

```sh
Diskpart
List disk
select disk N
clean 
create partition primary
```

### Which Linux to get started?

To not complicate things: Just get Ubuntu LTS with GNOME.

If this is your first time, take it easy on the learning journey and for now, dont trust your new miniPC as unique storage of anything

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/os-for-nas/" title="OS For a NAS | Post ↗"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/homelab-security/" title="Avoid Single Point of Failure | HomeLab BackUp Tools Post ↗"  >}}
{{< /cards >}}

You can also consider:

1. [Lubuntu](https://cdimage.ubuntu.com/lubuntu/releases/noble/release/) - Because it requires just ~700mb of RAM

2. Ubuntu if you want the same, but with GNOME

> You can have ubuntu without UI, if you plan to use your server's terminal only

3. [Garuda](https://garudalinux.org/editions), if you want to say I use ARCH BTW. Mind the steep learning curve.

How exactly?

Well, first try download them and run it via a VM.

Then, setup VENTOY into your USBs and bring your favourite one.

{{< youtube "hTw9DBEksx4" >}}

<!-- https://youtu.be/hTw9DBEksx4 -->


### Backup Github

1. https://github.com/TimWitzdam/GitSave

2. Gitea and Gogs: Lightweight self-hosted Git services. They support mirroring repositories from GitHub, providing a continuously synced backup

### Which Devices are connected to my router?

1. First get to know `who` is your router:

```sh
ip route | grep default
```

2. Then, inspect:

```sh
nmap -sn 192.168.1.0/24
# Starting Nmap 7.80 ( https://nmap.org ) at 2025-09-26 11:43 CEST
# Nmap scan report for _gateway (192.168.1.1)
# Host is up (0.025s latency).
# Nmap scan report for 192.168.1.103
# Host is up (0.067s latency).
# Nmap scan report for BYOD-00335 (192.168.1.104)
# Host is up (0.000095s latency).
# Nmap done: 256 IP addresses (3 hosts up) scanned in 3.63 seconds
```

(Optional) get the **mac/vendor** of one of them:

```sh
ping -c 4 192.168.1.106
#nmap -O 192.168.1.106
#tailscale status
sudo tailscale up --force-reauth #just in case you forgot to extend the expiry
```

See the life traffic over a network:

```sh
ifconfig enp1s0
vnstat -l -i enp1s0   # live mode (Ctrl+C to stop)
#vnstat -l -i proton0   # live mode (Ctrl+C to stop)

#ip -s link show wlp3s0
```

{{< callout type="info" >}}
If you are looking for HomeLab Privacy see this [post for a stronger homelab](https://jalcocert.github.io/JAlcocerT/homelab-security/#vpn) (vpn section)
{{< /callout >}}

```sh
#https://protonvpn.com/support/official-linux-vpn-debian/
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
#echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -
sudo apt install proton-vpn-gnome-desktop
```

> Its recommended to do [p2p behind a VPN](https://jalcocert.github.io/JAlcocerT/how-to-torrent-with-a-raspberry) so that hackers can attack youe public IP address

> > As seen in [0625](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#p2p), [Reddit](https://www.reddit.com/r/Piracy/comments/1c3cikj/where_to_torrent/) knows your [F1 thing](https://www.reddit.com/r/MotorsportsReplays/comments/1haaapr/formula_1_19782024_megatorrent/)

But hey, this is just to do legal stuff, like sharing OSS images, like ubuntu.

Dont dare to watch `f movies` with your `cat`. Not interesting [fmhy repo](https://github.com/fmhy/edit) https://fmhy.net/posts/sept-2025 

Neither read the anna's archive.

Those might be down: https://www.isitdownrightnow.com/

You know, just in case your cool site gets **banned without a reason**:

![LaLiga Cloudflare Unjustified Ban](/blog_img/selfh/HomeLab/laliga-cloudflare.png)

#### Hello Again Firebat

After one year of putting [the FireBat AK2](https://jalcocert.github.io/JAlcocerT/firebat-ak2-plus-minipc-review/) up and running...

I realized that not everyone is ready to have a PC 24/7.

Because: what is it doing exactly?

Plus...tailscale can get expired and access lost for the admin.

And that has a point, actually.

```sh
ssh casa@192.168.1.106
#du -sh .                    # Human-readable size of current folder
du -sh /media/casa/Datos_copia_2/PerriChico
#du -sh .* | sort -h
#du -h --max-depth=2         # Two levels deep
#rm *.LRF #clean (if needed) all LRF files
sudo snap install vlc
sudo apt update && sudo apt install ubuntu-restricted-extras
```

So I decided to propose a new homelab architecture....

> Traefik v3.3 + Cloudflare + Tailscale IP

{{< filetree/container >}}
  {{< filetree/folder name="config" >}}
    {{< filetree/file name="acme.json" >}}
    {{< filetree/file name="config.yml" >}}
    {{< filetree/file name="traefik.yml" >}}
    {{< /filetree/folder >}}
  {{< filetree/file name="docker-compose.yaml" >}}
  {{< filetree/file name=".env" >}}
  {{< filetree/file name="cf-token" >}}
{{< /filetree/container >}}

```sh
git clone https://github.com/JAlcocerT/Home-Lab
cd ./Home-Lab/traefik
#https://jalcocert.github.io/JAlcocerT/testing-tinyauth/
#https://fossengineer.com/selfhosting-traefik/
```

* https://dash.cloudflare.com/profile/managed-profile/preferences
  * https://dash.cloudflare.com/profile/api-tokens

```sh
curl "https://api.cloudflare.com/client/v4/user/tokens/verify" \
     -H "Authorization: Bearer abcdefg12345709"
```

![Cloudfalre API Tokens for Traefik v3](/blog_img/selfh/https/traefik-firebat/cf-api.png)

```sh
sudo apt install apache2-utils
echo $(htpasswd -nB admin) | sed -e s/\\$/\\$\\$/g
```

![Traefik UI](/blog_img/selfh/https/traefik-ui.png)


```sh
#cd ./Home-Lab/traefik
touch /home/casa/Home-Lab/traefik/acme.json #blank, just change the permissions to 600 later (private key)
touch /home/casa/Home-Lab/traefikacme.yml
touch /home/casa/Home-Lab/traefik/traefik.yml
```

```sh
chmod 600 ./acme.json && \
chmod 600 ./traefik.yml #or it will be a security risk for other users to see the privatekey
```

Make sure to point **CF DNS records**, maybe using script https://github.com/JAlcocerT/waiting-to-landing/blob/main/cloudflare-dns-updater.py

> For which you will need the [ZoneID of your Domain](https://www.youtube.com/watch?v=pmfrJNCaOFY) as well as per [this .env.sample](https://github.com/JAlcocerT/Home-Lab/blob/main/traefik/.env.sample)

```sh
sudo snap install jq
sudo snap install yq
# Get zone ID of your domain via CLI instead of Cloudflare UI
curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=jalcocertech.com" \
  -H "Authorization: Bearer $cf_token" \
  -H "Content-Type: application/json" | jq -r '.result[0].id'
```

{{< callout type="warning" >}}
The **only DNS** you need to point is the one for Traefik, the rest is done automatically as per the labels!
{{< /callout >}}

These are the only ones you will see configured in cloudflare DNS: *if you want, change that private IP for your tailscale one*

![cf DNS setup with traefik](/blog_img/selfh/HomeLab/dns-traefik.png)

```sh
#python3 cf-dns-updater.py
dig +short casa.jalcocertech.com A
ping casa.jalcocertech.com
nslookup casa.jalcocertech.com
```

![alt text](/blog_img/selfh/https/traefik-firebat/cf-dns-python.png)

<!-- 
* https://fossengineer.com/selfhosting-traefik/
* https://jalcocert.github.io/JAlcocerT/testing-tinyauth/ -->

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/selfhosting-traefik/" title="Traefik Setup" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/" title="TinyAuth (via Traefik) Setup" >}}
{{< /cards >}}

We are going to get `https://casa.jalcocertech.com/` and `https://auth.casa.jalcocertech.com/login` working pretty soon...

```sh
touch config/acme.json && chmod 600 config/acme.json
```


```sh
sudo docker compose up -d
sudo docker logs traefik
```

{{< callout type="info" >}}
This uses DNSchallenge (instead of https), so you dont have to open any ports :)
{{< /callout >}}

Once **Traefik is deployed**, go to: https://casa.jalcocertech.com/dashboard/#/http/routers

![Traefik creating SSL certificates for the internal homelab services](/blog_img/selfh/https/traefik-firebat/traefik-dash-ui.png)

> You can also check with `CTRL+I` within firefox

**Example 1**: Traefik + already created (from others) webapps ✅ 

```sh
dig +short silverbullet.casa.jalcocertech.com A
ping silverbullet.casa.jalcocertech.com
nslookup silverbullet.casa.jalcocertech.com

ping portainer.casa.jalcocertech.com
```

![alt text](/blog_img/selfh/kb/silverbullet-dns-cf.png)


**Example 2** Traefik + your (flask/dash/whatever) webapp ✅ 

Example with ThreeBodies (flask)

```sh
git clone https://github.com/JAlcocerT/ThreeBodies
cd ThreeBodies
#make docker-up
```

Or with Trip Planner... with this [traefik+tinyauth compose](https://github.com/JAlcocerT/Home-Lab/blob/main/trip-planner/docker-compose.traefik.yml)

```sh
git clone https://github.com/JAlcocerT/Py_Trip_Planner
cd Py_Trip_Planner
#make docker-up

#cd trip-planner #from homelab repo
sudo docker compose -f docker-compose.traefik.yml up -d
```


**Example 3** Traefik + a Web App + Tinyauth ✅ 

If you need a webapp on your homelab that does not bring some user/pwd, like **OpenSpeedTest**...

> This method will allow to authenticate webapps via user/pwd or with Oauth like GH.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/open-speed-test" title="OpenSpeedTest x Traefik x TinyAuth | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/tinyauth" title="TinyAuth | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}

![traefik working with openspeedtest with custom subdomain](/blog_img/selfh/https/traefik-firebat/traefik-openspeedtest.png)

> https://github.com/JAlcocerT/Home-Lab/blob/main/open-speed-test/docker-compose.traefik.yml

![Just in case you dont want to use the regular hosted speedtest](/blog_img/selfh/HomeLab/speedtest.png)

We will need to create a **Github OAUTH App**: `https://auth.casa.jalcocertech.com`

![Github Apps](/blog_img/selfh/https/TinyAuth/gh-apps.png)

1. Go to https://github.com/settings/applications/new

Add the link as per your subdomain: `https://auth.casa.jalcocertech.com/api/oauth/callback/github`

![Github OAUTH](/blog_img/selfh/https/TinyAuth/gh-oauth-apps.png)

![alt text](/blog_img/selfh/https/TinyAuth/tinyauth-gh-oauth-firebat.png)

2. Then, registre the application. Get its ID and and its client secret:

![Github Secret](/blog_img/selfh/https/TinyAuth/gh-client-secret.png)

Those are required for

```yml
    environment:
      - GITHUB_CLIENT_ID=${GITHUB_CLIENT_ID} #For GitHub OAuth
      - GITHUB_CLIENT_SECRET=${GITHUB_CLIENT_SECRET}
```

3. When its done, we will be Seeing the application: https://github.com/settings/applications/3023538

particularly at the [OAUTH developer section](https://github.com/settings/developers). 

![Github OAUTH App Created](/blog_img/selfh/https/TinyAuth/oauth-app-created.png)

Just **spin up Tiny Auth** with: https://github.com/JAlcocerT/Home-Lab/blob/main/tinyauth/docker-compose.firebat.yml

```sh
cd tinyauth
#sudo docker compose up -d
docker compose -f docker-compose.firebat.yml up -d
```

Now, go to `https://auth.casa.jalcocertech.com` or whatever subdomain you placed.

> See that this works without touching any configuration nor Cloudflare DNS and we already have the HTTPs and the dns pointing

```sh
nslookup auth.casa.jalcocertech.com
```

![TinyAuth UI with https](/blog_img/selfh/https/TinyAuth/tinyauth-https-ui.png)

Authorize the app And you will be logged in!

![Authorizing TinyAuth](/blog_img/selfh/https/TinyAuth/tinyauth-authorize-app.png)

Remember that you can also add Users/pwd to TinyAuth [via the .env](https://github.com/JAlcocerT/Home-Lab/blob/main/tinyauth/.env.sample):

```sh
echo $(htpasswd -nB jalcocert) | sed -e s/\\$/\\$\\$/g
sudo docker restart tinyauth
```

![TinyAuth hardcoded user and password](/blog_img/selfh/https/TinyAuth/tinyauth-hardcoded-userpwd.png)

Now, for [OpenSpeedTest to use TinyAuth via Traefik](https://github.com/JAlcocerT/Home-Lab/blob/main/open-speed-test/docker-compose.traefiktinyauth.yml): 

```sh
cd 
sudo docker compose -f docker-compose.traefiktinyauth.yml up -d
##command: tail -f /dev/null #in case you need to keep running
```

> And there you go `https://openspeedtest.casa.jalcocertech.com/`

> > The only additional part to [the dockercompose service label](https://github.com/JAlcocerT/Home-Lab/blob/main/open-speed-test/docker-compose.traefiktinyauth.yml#L27) (like openspeedtest), is the `traefik.http.routers.openspeedtest-secure.middlewares=tinyauth`

Thanks again to Jims Garage!

<!-- https://www.youtube.com/watch?v=qmlHirOpzpc -->

{{< youtube "qmlHirOpzpc" >}}

{{< callout type="info" >}}
So any new service added to traefik (+tinyauth) is just a matter if its compose having proper labels, nothing else to be configured!
{{< /callout >}}

Imo, much better than the cloudflare webapp authentication method we saw some time ago: *yet still coding for entrepreneurs approach is also great*

![cloudflare authentication for tuneled web apps](/blog_img/selfh/https/TinyAuth/cf-apps-auth.png)

![alt text](/blog_img/selfh/https/TinyAuth/cf0apps-auth1.png)


### More Free Resources

1. https://fmhy.net/devtools#static-page-hosting from https://github.com/fmhy/edit

2. https://free-for.dev/#/ from https://github.com/jixserver/free-for-dev