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

* https://github.com/runtipi/runtipi

>  Runtipi is a homeserver for everyone! One command setup, one click installs for your favorites self-hosted apps. ✨ 

>> Got to know this one thanks to [awsomedockercompose](https://awesome-docker-compose.com)

---

## Conclusions

[![Star History Chart](https://api.star-history.com/svg?repos=Dokploy/dokploy,caprover/caprover,zane-ops/zane-ops,rodyherrera/Quantum&,type=Date)](https://star-history.com/#Dokploy/dokploy&caprover/caprover&rodyherrera/Quantum&zane-ops/zane-ops&Date)
