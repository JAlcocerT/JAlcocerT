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

Your career might have started with MySQL and Dbeaver.

But thats just the beginning.

```sh
sudo docker compose -f ./z-homelab-setup/evolution/2610_docker-compose.yml logs -f whodb
```

{{< cards >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
{{< /cards >}}


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dbchart" title="ChartDB | Docker Config Setup 🐋 ↗" >}}
  {{< card link="https://github.com/dbgate/dbgate" title="See also DBGate | Project ↗" >}}
{{< /cards >}}

Use the [DBCode](https://dbcode.io/) extension, and if you like `ipynb`, check their [notebooks for DBs](https://dbcode.io/docs/notebooks/getting-started)

## Fabric One Catalogue or...

**OneLake Catalog** is a Microsoft Fabric feature—a centralized data discovery and governance tool within OneLake, Microsoft's unified data lake (like "OneDrive for data"). It helps users search, explore, and manage Fabric items like lakehouses, warehouses, reports, and pipelines across workspaces. [learn.microsoft](https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview)

Key Features

It offers an **Explore tab** for browsing with filters (domains, tags, endorsements, item types), rich metadata (descriptions, schemas, lineage, permissions), and direct actions like querying or analyzing items. The **Govern tab** (preview in some updates) provides data owners insights on quality, compliance, and recommended actions. [blog.fabric.microsoft](https://blog.fabric.microsoft.com/en-US/blog/onelake-catalog-the-trusted-catalog-for-organizations-worldwide/)

Microsoft Fabric Context
Built into every Fabric tenant, it unifies multi-cloud data estates, integrates with Teams/Excel/Copilot, and supports APIs/CLI for devs—promoting trust, reuse, and security via endorsements and sensitivity labels. It's complementary to Purview for broader governance. [learn.microsoft](https://learn.microsoft.com/en-us/fabric/onelake/)

Yes, that description is accurate. OneLake Catalog centralizes all Microsoft Fabric content for browsing, curation, and governance in one unified view. [learn.microsoft](https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview)

Coverage Details
It spans **insight items** (reports, dashboards), **data items** (lakehouses, semantic models, warehouses), **process items** (pipelines, notebooks), plus apps and more—accessible via Explore and Govern tabs with filters, metadata, lineage, and actions. This matches official docs and demos exactly. [blog.fabric.microsoft](https://blog.fabric.microsoft.com/en-US/blog/onelake-catalog-the-trusted-catalog-for-organizations-worldwide/)

**Open-source alternatives** to Microsoft Fabric (unified analytics) and OneLake Catalog (data governance/discovery) exist for building custom lakehouses with catalogs. They prioritize vendor independence, lower costs, flexibility, and multi-cloud support over Fabric's seamless Azure integration. [peliqan](https://peliqan.io/blog/microsoft-fabric-alternatives-competitors/)

## OSS Stack Alternatives
Combine storage + table format + catalog + query engine for Fabric-like functionality (data ingestion, lakehouse, governance). [reddit](https://www.reddit.com/r/dataengineering/comments/1jqrxyq/open_source_alternatives_to_fabric_data_factory/)

| Component       | OSS Alternative                  | Why Better Than Fabric  [peliqan](https://peliqan.io/blog/microsoft-fabric-alternatives-competitors/) |
|-----------------|----------------------------------|----------------------------------------------------|
| **Data Lake Storage** | MinIO (S3-compatible)           | Self-hosted, no egress fees, portable across clouds |
| **Table Format** | Apache Iceberg (or Delta Lake OSS) | ACID, schema evolution, time travel; multi-engine |
| **Catalog**     | Nessie, Apache Polaris (incubating), Gravitino | Portable metadata/governance; no vendor lock-in  [dataversity](https://www.dataversity.net/articles/taking-the-chill-out-of-selecting-the-appropriate-iceberg-data-catalog/) |
| **Query/Compute**| Apache Spark, Trino, DuckDB     | Decoupled scaling, OSS-native; cheaper than Fabric capacity units |
| **Orchestration**| Apache Airflow, NiFi            | Custom pipelines; Fabric Data Factory alternative  [reddit](https://www.reddit.com/r/dataengineering/comments/1jqrxyq/open_source_alternatives_to_fabric_data_factory/) |
| **Full Platforms**| Alluxio + Tabular, Openlake stack | Complete lakehouse; avoids proprietary OneLake shortcuts |

**Why OSS?** Cost savings (no per-compute fees), customization (e.g., Iceberg governance across Spark/Trino), no lock-in (use AWS S3/GCP/etc.), community velocity—ideal for advanced users like devs building micro-SaaS. Fabric suits quick Azure starts; OSS for long-term control. [promethium](https://promethium.ai/guides/microsoft-fabric-alternatives-2025/)

---

## Conclusions


Not all of them are 100% Open Source Software (OSS). While many have an open-source "heart," several follow a **"Freemium"** or **"Open Core"** model where the most advanced features are locked behind a paid license.

Here is the breakdown of the licensing for the tools we discussed:

🟢 Fully Open Source (100% Free & OSS)

These tools are free for both personal and commercial use without "Pro" versions.

* **MySQL Workbench:** Licensed under GPL.
* **HeidiSQL:** Licensed under GPL; completely free.
* **phpMyAdmin / Adminer:** Both are fully open source web-based tools.
* **Sequel Ace:** A popular, fully open-source Mac alternative to Sequel Pro.

🟡 Open Core / Freemium (Free version + Paid version)

These have a free community version that is open source, but they sell a separate "Enterprise" or "Ultimate" version with extra features.

* **DBeaver:** The **Community Edition** is fully open source (Apache License). The Enterprise version (paid) adds support for NoSQL (MongoDB, etc.) and cloud integrations.
* **Beekeeper Studio:** The **Community Edition** is open source (GPL). The "Ultimate" version adds features like team workspaces and a specialized table creator.

🔴 Proprietary / Paid (With Free Tiers)

These are not open source. They are commercial products, though they may have free versions for specific users.

* **TablePlus:** Proprietary. It has a free trial, but it limits you to opening only 2 tabs/windows at a time.
* **DataGrip:** Proprietary (JetBrains). As of late 2025/early 2026, it is **free for non-commercial use** (students, hobbyists, open-source contributors), but requires a paid subscription for professional/work use.
* **PowerBI Desktop:** Proprietary (Microsoft). It is "Free to use" but is closed-source software.

---

Which should you choose?

* If you want **maximum power for free**: **DBeaver Community** is the winner.
* If you want something **simple and truly OSS**: **HeidiSQL** (Windows) or **Beekeeper Studio Community**.
* If you are on a **Mac**: **Sequel Ace** is a fantastic open-source native choice.

**Would you like me to help you find the download link for the community version of one of these?**

### Agentic Orchestration Layer

Yes, they are essentially the "nervous system" for AI. While a Large Language Model (LLM) acts as the "brain," these **Agentic Orchestration Layers** provide the structure, memory, and routing logic required to turn a static model into a functional, autonomous agent.

However, they each approach "orchestration" from a very different architectural philosophy. Here is how they stack up in 2026:

## 1. LangGraph (The "State Machine" Approach)

LangGraph is currently the industry favorite for **complex, reliable agents**. Unlike standard LangChain (which is more linear), LangGraph treats an agent like a "cycle" or a flow chart.

* **Philosophy:** Everything is a **Directed Acyclic Graph (DAG)** or a state machine.
* **Best for:** Tasks where the agent needs to loop back, retry, or follow a very specific "plan-act-check" cycle.
* **Key Feature:** Built-in persistence (the agent can "sleep" and wake up exactly where it left off).

## 2. AutoGen (The "Conversation" Approach)

Born out of Microsoft Research, AutoGen views agentic work as a **dialogue**.

* **Philosophy:** You create a "team" of specialized agents (e.g., a "Coder," a "Reviewer," and a "Manager") who talk to each other to solve a problem.
* **Best for:** Creative problem solving, multi-agent collaboration, and scenarios where agents need to critique each other's work.
* **Update:** As of late 2025, Microsoft released the **Microsoft Agent Framework**, which converges AutoGen’s conversation patterns with Semantic Kernel’s stability.

## 3. Semantic Kernel (The "Enterprise" Approach)

This is Microsoft’s SDK for integrating AI into professional software (C#, Python, Java).

* **Philosophy:** It treats AI functions as **"Skills" or "Plugins"** that can be called by a central "Planner."
* **Best for:** Large-scale enterprise apps where you need strict security, telemetry (logging), and integration with existing corporate APIs.
* **Key Feature:** It is "Strongly Typed," making it much easier for traditional software engineers to use than the more "fluid" Python frameworks.

---

### Comparison Table: Which one is right for you?

| Tool | Core Mechanism | Complexity | Best Use Case |
| --- | --- | --- | --- |
| **LangGraph** | Graphs / State Nodes | High | Robust, custom loops and specific workflows. |
| **AutoGen** | Agent Conversations | Medium | Dynamic "brainstorming" and multi-agent teams. |
| **Semantic Kernel** | Plugins / Planners | Enterprise | Production apps needing security and C# support. |

### Where does standard LangChain fit?

In 2026, standard **LangChain** is often viewed more as a "utility belt" or a collection of connectors (to databases, PDFs, etc.). 

Most developers use LangChain for the *data* and LangGraph for the *logic*.

**Would you like me to show you a simple code snippet comparing how a "Research Agent" would look in LangGraph vs. AutoGen?**


The distinction you’ve highlighted regarding **Semantic Kernel** being "Kernel-centric" versus the "Chain" or "Graph" approach of the others is the most critical takeaway. 

**Semantic Kernel** is the Microsoft orchestration powerhouse.

To refine that perspective even further for 2026, here are a few nuances that complement your framework comparison:


### The "Logic" Evolution

* **Semantic Kernel's "Planners":** In early versions, planners were a bit unpredictable. Now, they have matured into highly reliable "Function Calling" mechanisms. Instead of the LLM just guessing what to do, the Kernel provides a strict set of "Tools" (Plugins) that make it much safer for enterprise use.

* **LangGraph's "Persistence":** Your mention of "Stateful workflows" is spot on. One of its biggest edges over Semantic Kernel for developers is **"Human-in-the-loop"** capability. You can pause a graph, wait for a human to approve a database edit, and then resume.

### Integration Depth

* **Azure Native:** If a company is already on the Azure OpenAI stack, Semantic Kernel is almost a "default" choice because it handles things like **Managed Identities** and **Virtual Networks** in a way that Python-centric frameworks often struggle with.

* **AutoGen's "Code Interpreter":** AutoGen’s standout feature remains its ability to spin up a "Dockerized" environment where an agent can write Python code, execute it, see the error, and fix it—all without human intervention. This makes it the "smartest" for raw data science tasks.

---

### Expanded Comparison Table

To add to your existing data, here is how they handle **Memory** and **Tooling**:

| Feature | Semantic Kernel | LangGraph | AutoGen |
| --- | --- | --- | --- |
| **Memory Type** | Specialized "Memories" (Vector DBs) | State snapshots (Checkpoints) | Chat History / Context windows |
| **Tool Calling** | "Plugins" (C# Classes/Methods) | "Nodes" (Python Functions) | "Skills" (Function calls) |
| **Development Style** | Software Engineering (OOP) | Flowchart / Logic Design | Social Engineering (Persona) |


Final Verdict

Your summary is perfect:

* **Semantic Kernel** = The "Boring" (in a good way) Enterprise Choice. It follows rules.
* **LangGraph** = The "Architect's" Choice. It follows a map.
* **AutoGen** = The "Researcher's" Choice. It follows a conversation.

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

DevLake: Incubating Apache project for SDLC metrics (e.g., DORA), data ingestion/visualization from dev tools; uses Go, Grafana; no relation to big data storage.

Delta Lake: Open-format (Databricks-led, Apache-compatible via Spark) for ACID transactions, time travel in data lakes; unrelated to engineering metrics.


| Metric                  | What It Measures                  | Elite Benchmark  [atlassian](https://www.atlassian.com/devops/frameworks/dora-metrics) |
|-------------------------|-----------------------------------|----------------------------------|
| **Deployment Frequency** | How often code deploys to prod   | Multiple per day                |
| **Lead Time for Changes**| Commit to deploy time            | <1 day                          |
| **Change Failure Rate**  | % of deploys causing failures    | 0-15%                           |
| **Time to Restore**     | MTTR from failure                | <1 hour                         |

