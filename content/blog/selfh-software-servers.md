---
title: "[PaaS Recap] Software for Servers..."
date: 2025-11-28T01:20:21+01:00
draft: false
tags: ["HomeLab"]
description: 'Selfhosted Apps that simplify my workflow as of 05-2025: LocalStack, DokPloy, Runtipi...'
url: 'selfhosted-server-paas'
---

Few months ago, I wrote about [different **PaaS** Tools](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/)

Among which, [Dokploy](#dokploy) resonated a lot with me.

I want to make a recap of PaaS Tools available.

## PaaS Tools

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/PaaS" title="Selfhostable PaaS | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

### LocalStack

LocalStack is a tool designed for developers who want to test **AWS functionalities locally**. 

It provides an **emulated environment of AWS services**, solving issues related to unpredictable billing and resource management during development. 

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

### Dokploy

I wrote about Dokploy [here](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/#dokploy)




{{< details title="More about Dokploy 📌" closed="true" >}}


{{< /details >}}


### Runtipi

* https://github.com/runtipi/runtipi

>  Runtipi is a homeserver for everyone! One command setup, one click installs for your favorites self-hosted apps. ✨ 

>> Got to know this one thanks to [awsomedockercompose](https://awesome-docker-compose.com)

---

## Conclusions

[![Star History Chart](https://api.star-history.com/svg?repos=Dokploy/dokploy,caprover/caprover,zane-ops/zane-ops,rodyherrera/Quantum&,type=Date)](https://star-history.com/#Dokploy/dokploy&caprover/caprover&rodyherrera/Quantum&zane-ops/zane-ops&Date)
