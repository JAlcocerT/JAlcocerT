---
title: "[PaaS Recap] Software for Servers..."
date: 2025-11-19T01:20:21+01:00
draft: false
tags: ["HomeLab","LocalStack vs DokPloy vs LocalStack vs Runtipi"]
description: 'Selfhosted Apps that simplify my workflow'
url: 'selfhosted-server-paas'
---

**Tl;DR**

Ive recently heard that buying a NAS seems to make things much easier/better/faster than a MiniPC + Docker.

Time to prove is not that right, specially with these PaaS Tools available.

**Intro**

Few months ago, I wrote about [different **PaaS** Tools](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/)

Among which, [Dokploy](#dokploy) resonated a lot with me.

I want to make a recap of PaaS Tools available.

Because is not just about creating, but [deploying](https://jalcocert.github.io/JAlcocerT/where-to-deploy/).

## PaaS Tools

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/PaaS" title="Selfhostable PaaS | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs for your server" >}}
{{< /cards >}}


Like the well known Coolify and Dokploy:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/coolify" title="Coolify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dokploy" title="Dokploy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

I wrote about Dokploy [here](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/#dokploy)

Today, we are going to see

### LocalStack

LocalStack is a tool designed for developers who want to test **AWS functionalities locally**. 

It provides an **emulated environment of AWS services**, solving issues related to unpredictable billing and resource management during development. 

<!-- https://www.youtube.com/watch?v=ZpMXW_beUuA -->

{{< youtube "ZpMXW_beUuA" >}}


- **Purpose**: LocalStack emulates AWS API functionality.
- **Problem Solved**: Allows local testing without involving AWS services directly.
- **Installation**: 
  - Sign up with a GitHub account.
  - Use `brew install localstack/tap/localstack-cli` for installation on macOS.
  - Requires Docker to function as a local “mini-cloud” operating system.
- **Basic Use**: 
  - Set environment variables for AWS access.
  - Create services like S3 buckets using standard AWS commands.
  - Offers a Community Image for free usage.
- **Limitations**:
  - Not all AWS services are fully emulated; some are available only in the Pro version.
  - Works with a single API endpoint unlike AWS's regional separation.
- **Key Features**: 
  - Supports essential services like EC2.
  - Allows basic CRUD operations.
  - Requires understanding of feature coverage before use.


### Runtipi


> [Runtipi](https://runtipi.io/) is a homeserver for everyone! One command setup, one click installs for your favorites self-hosted apps. ✨

* https://github.com/runtipi/runtipi with AGPL-v3!

>  Runtipi is a homeserver for everyone! One command setup, one click installs for your favorites self-hosted apps. ✨ 

>> Got to know this one thanks to [awsomedockercompose](https://awesome-docker-compose.com)

---

## Conclusions

[![Star History Chart](https://api.star-history.com/svg?repos=Dokploy/dokploy,caprover/caprover,zane-ops/zane-ops,rodyherrera/Quantum&,type=Date)](https://star-history.com/#Dokploy/dokploy&caprover/caprover&rodyherrera/Quantum&zane-ops/zane-ops&Date)


## FAQ


https://www.youtube.com/@elestio/videos

https://www.youtube.com/@webnestify

https://www.linode.com/marketplace/apps/linode/saltcorn/ <!-- Saltcorn: Open-source low-code platform for building web applications -->

https://www.trydome.io/ <!-- Dome: Self-hosted application platform -->


https://www.youtube.com/watch?v=zhK0sARGhYc

* https://railway.app/template/LO03gz?referralCode=uch-he <!-- Railway: Cloud platform for deploying applications -->
* https://railway.app/pricing


* https://render.com/pricing <!-- Render: Cloud platform for hosting web services -->

* https://www.solarpace.io/ <!-- Solarpace: Managed hosting platform -->

* https://elest.io/open-source/rallly <!-- Rallly: Open-source scheduling/polling application -->

* https://www.cloudron.io/store/io.hackmd.cloudronapp.html <!-- Cloudron: Self-hosted app platform with HackMD -->
    * https://www.cloudron.io/pricing.html

* https://www.pikapods.com/apps <!-- PikaPods: Managed open-source application hosting -->

* https://autoize.ch/managed-open-source-apps/ <!-- Autoize: Managed hosting for open-source applications -->


https://github.com/snipe/snipe-it <!-- Snipe-IT: Open-source asset management system -->
https://www.youtube.com/watch?v=EsCh0gOrxqE

### What exactly do you need?

* Time Management:
    * Timelite
    * [Pomatez](https://github.com/zidoro/pomatez) MIT

* A business chat? look no further than Matrix: synapse or dendrite or conduit available as flavours of the same

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/matrix-synapse" title="Matrix Server 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/matrix-conduit" title="Matrix Conduit Server 🐋 ↗" >}}
{{< /cards >}}