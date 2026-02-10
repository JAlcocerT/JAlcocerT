---
title: "SelfHosted Data Analytics"
date: 2026-10-01T23:20:21+01:00
draft: false
tags: ["D&A","Rill vs WrenAI vs Vanna","WhoDB vs DBCode vs Dbeaver"]
description: 'Selfhosting D&A Tools. DevOps x DORA.'
url: 'selfhosting-data-analytics'
---


**Tl;DR**

**Intro**

```sh
sudo docker compose -f ./z-homelab-setup/evolution/2610_docker-compose.yml logs -f frigate
```


{{< cards >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
{{< /cards >}}


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dbchart" title="ChartDB | Docker Config Setup 🐋 ↗" >}}
  {{< card link="https://github.com/dbgate/dbgate" title="See also DBGate | Project ↗" >}}
{{< /cards >}}

Use the [DBCode](https://dbcode.io/) extension, and if you like `ipynb`, check their [notebooks for DBs](https://dbcode.io/docs/notebooks/getting-started)

---

## Conclusions




---

## FAQ

JSON, YML or TooN?

* https://github.com/toon-format/toon


### Whats Open DevOps?

Ive heard these year about DORA.

Which maps with Lean (via VSM) and DevOps: https://www.atlassian.com/devops/frameworks/dora-metrics

DORA is a **metrics framework** (not a rigid toolset)—a set of four standard KPIs from Google's **DevOps Research and Assessment** team to benchmark software delivery.

> DORA = *how good are companies at shipping software?*

There are two key clusters of data inside DORA: Velocity and Stability. The DORA framework is focused on keeping them in context with each other, as a whole, rather than as independent variables, making the data more challenging to misinterpret or abuse.

Within velocity are two core metrics:

Deployment Frequency: Number of successful deployments to production, how rapidly is your team releasing to users?
Lead Time for Changes: How long does it take from commit to the code running in production? This is important, as it reflects how quickly your team can respond to user requirements.
Stability is composed of two core metrics:

Change Failure Rate: How often are your deployments causing a failure?
Median Time to Restore Service (MTTR): How long does it take the team to properly recover from a failure once it is identified?
However, MTTR is replaced by Failed Deployment Recovery Time from the 2023 DORA report. This metric measures the finish time of a deployment to the resolution of the incident caused by the deployment.

https://devlake.apache.org/assets/images/dora-intro-e3847646d8dbe47220e6c8347ab14f7b.png