---
title: "Scaling Services with SelfHosted PAAS - Netlify Vercel alternatives"
date: 2025-03-14T21:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Deploy with Dokploy or ZaneOPS (to Pi / VPS). Make ideas scalable: Wordpress and Ghost Examples.'
url: 'selfhosted-paas'
---

Recently I was doing some [IT setup for weddings](https://jalcocert.github.io/JAlcocerT/software-for-weddings/).

And couple of [Wordpress](https://jalcocert.github.io/JAlcocerT/no-code-websites/).

Its not taking much if you have the know how already...

but still, there is a manual process to spin containers, add https with the Proxy Manager...

Then I found **[these F/OSS PaaS software](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/)**.

## Selfhostable PaaS

### ZaneOps

* https://github.com/zane-ops/zane-ops?ref=selfh.st

> MIT | A self-hosted PaaS for your web services, web apps, databases and everything you need for your next startup.


### DokPloy

Dokploy Cloud is a platform that enables users to **deploy containerized applications** and databases with ease. 

The platform provides all the necessary tools for building, deploying, and managing applications, making it an attractive option for developers.

* https://github.com/Dokploy/dokploy
  * https://dokploy.com/
  * https://docs.dokploy.com/docs/core
  * https://docs.dokploy.com/docs/core/docker-compose/example

> Apache v2 | Open Source **Alternative to Vercel, Netlify and Heroku**.

```sh
curl -sSL https://dokploy.com/install.sh | sh
```

With Dokploty we can for example, **serve an Astro site, or any other containerized app**

* DokPloy Astro Example from their docs:

There are other **PaaS alternatives** like:

1. [CapRover](https://github.com/caprover/caprover)

> Apache v2 | Scalable PaaS (automated Docker+nginx) - *aka Heroku on Steroids*

2. Coolify
3. QuickStack
4. [Dokku](https://github.com/dokku/dokku)

> MIT | A docker-powered PaaS that helps you build and manage the lifecycle of applications

5. [Quantum](https://github.com/rodyherrera/Quantum)

> MIT | 🚀 Hackable & Self-hosted Open-Source alternative to Vercel, Heroku, Netlify, etc. All your applications, just in one place. Develop and deploy with your favorite tools, and enjoy continuous deployment with GitHub.

Tools Which I will (probably) cover on a future post.

## Scaling Wordpress and Ghost

