---
title: "Services with SelfHosted PaaS - Netlify/Vercel alternatives"
date: 2025-03-14T21:20:21+01:00
draft: false
tags: ["Dev","Webs","Entrepreneuring","Dokploy","SSG Deployment"]
description: 'Deploying with Dokploy. Make ideas scalable: Wordpress and Ghost with built in Traefik SSL.'
url: 'selfhosted-paas'
---

Recently I was doing some [IT setup for weddings](https://jalcocert.github.io/JAlcocerT/software-for-weddings/).

And couple of [Wordpress](https://jalcocert.github.io/JAlcocerT/no-code-websites/).

Its not taking much if you have the know how already...

but still, there is a manual process to spin containers, add https with the Proxy Manager...

Then I found **[these F/OSS PaaS software](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/)**.

Which will do the SSL trick as well, if you are not confortable yet with [NGINXPM or Traefik for your https](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/)

## Selfhostable PaaS

As of the time of writing: *Dokploy and Caprover are way ahead of the rest*

[![Star History Chart](https://api.star-history.com/svg?repos=Dokploy/dokploy,caprover/caprover,zane-ops/zane-ops,rodyherrera/Quantum&,type=Date)](https://star-history.com/#Dokploy/dokploy&caprover/caprover&rodyherrera/Quantum&zane-ops/zane-ops&Date)


### DokPloy

Dokploy Cloud is a platform that enables users to **deploy containerized applications** and databases with ease. 

The platform provides all the necessary tools for building, deploying, and managing applications, making it an attractive option for developers.

* https://github.com/Dokploy/dokploy
  * https://dokploy.com/
  * https://docs.dokploy.com/docs/core
  * https://docs.dokploy.com/docs/core/docker-compose/example

> Apache v2 | Open Source **Alternative to Vercel, Netlify and Heroku**.

```sh
curl -sSL https://dokploy.com/install.sh | sh #will need ~300mb to get started
```

> This automatically spins: Dokploy + PostgreSQL + Redis + [Traefik](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/#traefik)

You will authorize dokploy as Github App: https://github.com/apps/dokploy-jesalctag

<!-- https://www.youtube.com/watch?v=kwVNpfru6pk -->

{{< youtube "kwVNpfru6pk" >}}


<!-- 
https://www.youtube.com/watch?v=2Q4-EgYS0u4
 -->
{{< youtube "2Q4-EgYS0u4" >}}

With Dokploy we can for example, **serve an Astro site, or any other containerized app**

* DokPloy Astro Example from their docs
* Or...the Streamlt MultiChat: *we are just pointing to [this file](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_DeployMe/Docker-Compose.yml) `./Z_DeployMe/Docker-Compose.yml`*

![Dokploy with MultiChat Repository](/blog_img/selfh/PaaS/dokploy-multichat.png)

**What do I like about DokPloy?**

1. Simple setup: Connect to you github repositories and start deploying

![alt text](/blog_img/selfh/PaaS/dokploy-github-app.png)

> This is quite handy if you have [collected a lot of docker-compose](https://github.com/JAlcocerT/Docker/) files for quick deployments

*See for example how to deploy [RStocks](https://github.com/JAlcocerT/R_Stocks)*

![alt text](/blog_img/selfh/PaaS/dokploy-rstocks.png)

2. [Traefik HTTPs](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/) built in

![Dokploy Https](/blog_img/selfh/PaaS/dockploy-https.png)

Also for the services:

![DokPloy with RStocks and https](/blog_img/selfh/PaaS/dokploy-rstocks-service-https.png)

3. Dokploy brings a **monitoring section** to see how much each app consumes

![Dokploy PaaS deploying Streamlit Multichat Repository](/blog_img/selfh/PaaS/dokploy-monitoring-multichat.png)

*See how multichat needs <10mb of RAM*

You could also:

```sh
#htop
sudo docker stats multichat
#sudo docker system prune
```

4. You can invite and **manage what other users/members can do** with your Dokploy server

![Dokploy create member](/blog_img/selfh/PaaS/dokploy-member.png)

5. It enables **docker swarm mode**, making us ready to play with several servers for load balancing

This is a mode for orchestrating containers across multiple Docker hosts.

* Docker Compose vs. Swarm:
  * Docker Compose is primarily designed for running multi-container applications on a single Docker host.
  * Docker Swarm uses "stacks" for deploying applications across a cluster of hosts.
  * In Portainer, you will see a new TAB called services

```sh
#docker swarm leave --force #to leave
```
---

## FAQ

### PaaS Alternatives

{{< callout type="info" >}}
I covered them [here](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/).
{{< /callout >}}

There are other **PaaS alternatives** like:

1. [CapRover](https://github.com/caprover/caprover)

> Apache v2 | Scalable PaaS (automated Docker+nginx) - *aka Heroku on Steroids*

2. [Coolify](https://github.com/coollabsio/coolify)

> **Apache v2** |  An open-source & self-hostable Heroku / Netlify / Vercel alternative. 

> > Which I have tried recently, [here](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/#coolify)

3. [QuickStack](https://github.com/biersoeckli/QuickStack)

>  GPL3.o | Build, run and monitor your apps on any server from a single, easy-to-use UI. 

4. [Dokku](https://github.com/dokku/dokku)

> MIT | A docker-powered PaaS that helps you build and manage the lifecycle of applications

5. [Quantum](https://github.com/rodyherrera/Quantum)

> MIT | 🚀 Hackable & Self-hosted Open-Source alternative to Vercel, Heroku, Netlify, etc. All your applications, just in one place. Develop and deploy with your favorite tools, and enjoy continuous deployment with GitHub.

6. [ZaneOps](https://github.com/zane-ops/zane-ops)

> MIT | A self-hosted PaaS for your web services, web apps, databases and everything you need for your next startup.

--- 

## Conclusions

For some time Ive been looking for a way to leverage the way I can **deliver websites to others**.

Definitely SelfHosted PaaS solutions, like DokPloy, resonates with *[no code websites](https://jalcocert.github.io/JAlcocerT/no-code-websites/)*.

I mean with Wordpress and Ghost!

> And its so cool that it bring [https with Traefik working out of the box](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/#traefik)!

### Scaling Wordpress and Ghost

Thanks to Dokploy, you can invite some user and give the possibility to spin Wordpress and/or Ghost services.

1. Ghost Deployment with DokPloy

![Dokploy and Ghost Service](/blog_img/selfh/PaaS/dokploy-ghost.png)

> Just by using [this docker-compose 🐳](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/Ghost_Docker-compose.yaml) as you see `./Web/CMS/Ghost_Docker-compose.yaml`

2. Wordpress Deployment with Dokploy

> See the regular WP Docker deployment [here](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/Wordpress%20RPi%20Docker%20compose.yml) 🐳


### Scaling SSG Deployment

The idea behind it's very simple: 

1. Put SSG Themes inside a docker container

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/SSGs" title="SSG Containers | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

2. Let people choose which one they like (The Theme)
3. Let them sign up and make the tweaks with a headless CMS UI
4. When changes are done, build the SSG and push it to static hosting
5. Get leads, scale it *if profitable*
6. *Get rich (?)*

> Sounds like a plan?

The awesome HUGO Theme Gallery: https://github.com/nicokaiser/hugo-theme-gallery

> Which I have used for the [travel addict and costura](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/) photo blog

{{< details title="Photo Gallery with Hugo inside a Container 📌" closed="true" >}}

```sh
git clone https://github.com/IoTechCrafts/hugo-theme-gallery-ssg
cd ./hugo-theme-gallery-ssg/exampleSite
```

{{< callout type="info" >}}
As per the `theme.toml` file, we need *at least* hugo 0.121.2 version
{{< /callout >}}

Make sure to install GO: *Alternatively, check https://go.dev/dl/*


```sh
sudo apt install golang-go
#wget -P /tmp https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
#sudo rm -rf /usr/local/go
#sudo tar -C /usr/local -xzf /tmp/go1.21.6.linux-amd64.tar.gz
#nano ~/.bashrc
#export PATH=$PATH:/usr/local/go/bin
#source ~/.bashrc #go version go1.21.6 linux/amd64
```

```sh
go version #Go is updated!
#go version go1.18.1 linux/amd64
```



And now, HUGO: https://github.com/gohugoio/hugo/releases/tag/v0.121.1

```sh
#CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest #The latest
#wget https://github.com/gohugoio/hugo/releases/download/v0.127.0/hugo_0.127.0_linux-arm64.deb
#wget https://github.com/gohugoio/hugo/releases/download/v0.121.2/hugo_0.121.2_linux-arm64.deb
wget https://github.com/gohugoio/hugo/releases/download/v0.121.2/hugo_extended_0.121.2_linux-amd64.deb

sudo dpkg -i hugo_*.deb

hugo version #HUGO is ready and >=0.121.2!
```

As per the sampleSite's readme, we need to do:

```sh
hugo mod get # Install Hugo module

./pull-images.sh #Pull example images from Unsplash
```

And just **enjoy** this awsome HUGO Theme:

```sh
#hugo server
#hugo server --bind="0.0.0.0" --baseURL="http://192.168.0.117" 
hugo server --bind="0.0.0.0" --baseURL="http://192.168.0.12" --port=1319
```

> And you will have the **amazing HUGO sample theme** at `http://192.168.0.12:1319`

{{< /details >}}