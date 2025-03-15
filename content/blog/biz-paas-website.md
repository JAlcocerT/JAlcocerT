---
title: "Scaling Services with SelfHosted PaaS - Netlify Vercel alternatives"
date: 2025-03-14T21:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Deploying with Dokploy. Make ideas scalable: Wordpress and Ghost Examples.'
url: 'selfhosted-paas'
---

Recently I was doing some [IT setup for weddings](https://jalcocert.github.io/JAlcocerT/software-for-weddings/).

And couple of [Wordpress](https://jalcocert.github.io/JAlcocerT/no-code-websites/).

Its not taking much if you have the know how already...

but still, there is a manual process to spin containers, add https with the Proxy Manager...

Then I found **[these F/OSS PaaS software](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/)**.

## Selfhostable PaaS

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

> This automatically spins: Dokploy + PostgreSQL + Redis + Traefik


You will authorize dokploy as Github App: https://github.com/apps/dokploy-jesalctag

<!-- 
https://www.youtube.com/watch?v=2Q4-EgYS0u4
 -->
{{< youtube "2Q4-EgYS0u4" >}}

With Dokploty we can for example, **serve an Astro site, or any other containerized app**

* DokPloy Astro Example from their docs
* Or...the Streamlt MultiChat: *we are just pointing to [this file](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_DeployMe/Docker-Compose.yml) `./Z_DeployMe/Docker-Compose.yml`*

![Dokploy with MultiChat Repository](/blog_img/selfh/PaaS/dokploy-multichat.png)

**What do I like about DokPloy?**

1. Simple setup: Connect to you github repositories and start deploying

![alt text](/blog_img/selfh/PaaS/dokploy-github-app.png)

> This is quite handy if you have [collected a lot of docker-compose](https://github.com/JAlcocerT/Docker/) files for quick deployments

*See for example how to deploy [RStocks](https://github.com/JAlcocerT/R_Stocks)*

![alt text](/blog_img/selfh/PaaS/dokploy-rstocks.png)

2. Traefik HTTPs built in

![alt text](/blog_img/selfh/PaaS/dockploy-https.png)

Also for the services:

![alt text](/blog_img/selfh/PaaS/dokploy-rstocks-service-https.png)

3. Dokploy brings a monitoring section to see how much each app consumes

![alt text](/blog_img/selfh/PaaS/dokploy-monitoring-multichat.png)

4. You can invite and manage what other users/members can do with your Dokploy server

![alt text](/blog_img/selfh/PaaS/dokploy-member.png)



---

## FAQ

### PaaS Alternatives

{{< callout type="info" >}}
I covered them here
{{< /callout >}}

There are other **PaaS alternatives** like:

1. [CapRover](https://github.com/caprover/caprover)

> Apache v2 | Scalable PaaS (automated Docker+nginx) - *aka Heroku on Steroids*

2. [Coolify](https://github.com/coollabsio/coolify)

> Apache v2 |  An open-source & self-hostable Heroku / Netlify / Vercel alternative. 

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

Tools Which I will *(probably)* cover on a future post.


### Scaling Wordpress and Ghost

Thanks to Dokploy, you can invite some user and give the possibility to spin Wordpress and Ghost services.

1. Ghost Deployment with DokPloy

![alt text](/blog_img/selfh/PaaS/dokploy-ghost.png)

> Just by using [this docker-compose](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/Ghost_Docker-compose.yaml) as you see `./Web/CMS/Ghost_Docker-compose.yaml`


---

