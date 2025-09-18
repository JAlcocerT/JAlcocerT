---
title: "SelfHosting Updates - End Summer 2025"
date: 2025-09-09T01:20:21+01:00
draft: false
tags: ["HomeLab","Ventoy","SSGs","MKCert","MeTube/Navidrome","Zen Browser"]
description: 'Selfhosting for New Comers: SSGs & Python WebApps with HTTPs'
url: 'selfhosted-apps-sept-2025'
---

Summer is almost gone...

**TL;DR:** 

[Lately I](#lately-i) have been [tinkering with Python Web Apps](https://jalcocert.github.io/JAlcocerT/web-apps-with-python/) and with SGGs.

A Post for anyone just starting with a home server.

+++ If you like [Music, this is how to have your DIY spotify - server setup via container](#your-music-server)

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

5. Get a domain and [bring https](#https-everywhere) when you feel confortable.

6. Along the way...


* Understand what chmod does: https://it-tools.tech/chmod-calculator
* Dont be afraid of the terminal. Embrace the CLI and SSH ([Termix](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#termix) will help)
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

### HTTPs Everywhere

When you will be confortable with containers, you will want to bring https instead of having that insecure http.

I got to know about https://github.com/FiloSottile/mkcert

> A simple zero-config tool to make locally trusted development certificates with any names you'd like.


To access securely your services outside home, You have low config VPNs like tailscale.

For more advance users, and exploring DNS, see PiHole and DuckDNS.

But as of today i'd rather:

* Setup NGINX to get https via UI as per this guide
* Or go the Traefik v3.3 approach (programatic https) as per this other guide


---


## Conclusions

Autumn is almost here.

And is a great chance to tinker with your miniPC and homelab.

Plot twist, you will never stop learning:

* Networking, DNS
* Creating your containers...

Fortunately, there are amazing resources to give you ideas:

* https://selfh.st/
  * From this one you will get weekly projects to have a look ( Plot Twist: you wont have time to see them all)
    * Example: https://github.com/OpenCut-app/OpenCut

> MIT |  The open-source CapCut alternative 

* Youtube is a great source for great tutorials too: Jims Garage, Christian Lempa, Tech with Nana, NetworkChuck, Pelado Nerd (*in Spanish*), DB Tech... I will never be able to thank them enough for all they have taught me already (*and to other great channels that would make the list too long*). 

> If you ever wandered what are the most popular repos: https://gitstar-ranking.com/repositories



Remember about:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs for anyone starting a Home-Lab" >}}
{{< /cards >}}


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

> Using your HomeLab to host a cool website is as simple as understanding those!

### Pi and IoT

Ive been tinkering with MicroControllers and MQTT protocol.

* **HA** https://www.home-assistant.io/docs/automation/

### New Software

Ive also tried:

1. Tried [Zen browser](https://github.com/zen-browser/desktop/releases/tag/1.14.11b): https://zen-browser.app/download/

With `CTRL+ALT+C` it gets really compact!

```sh
#pkill -9 brave #brave was not behaving properly lately...
flatpak install flathub app.zen_browser.zen
```
> Welcome to a calmer internet | Firefox based 

> > Zen offers a "Sync" feature, which is implemented using Mozilla Firefox's Sync feature.

**Had a look to couple of tools for diagrams**

2. https://github.com/stan-smith/FossFLOW

>  Make beautiful isometric infrastructure diagrams 

3. https://markmap.js.org/ and https://github.com/markmap/markmap

It renders text to diagram and can reference files: https://gist.githubusercontent.com/raw/af76a4c245b302206b16aec503dbe07b/markmap.md

> MIT | Build mindmaps with plain text 

### Other

Link analytics solutions, like Kutt:

![SelfHosting Kutt](/blog_img/selfh/links/kutt-selfh.png)

![Kutt Links](/blog_img/selfh/links/kutt-link-creation.png)


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

If you are creating youtube videos and storing them just there: you can download them later on, so you can review your [travel](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/) stories during those long flights.

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