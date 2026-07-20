---
title: "SelfHosted Data Analytics"
date: 2026-07-18T20:20:21+01:00
draft: false
tags: ["ADK vs LangChain","WhoDB vs DBCode vs Dbeaver","GCP VWB vs JHUB","mssql","Malloy DSL","Semantics x CV","DSL"]
description: 'Selfhosting D&A Tools. WrenAI, Rill and Vanna mean nothing w/o a proper capability framework to avoid noise.'
url: 'selfhosting-data-analytics'
---

**Tl;DR**

D&A is more about semantics than you could think in the first place:

1. Does the separation of facts, assumptions, your understanding, and the next validation step make sense for you? Because I have [a framework](#stakeholder-leadership-toolkit) to drive outcomes waiting for you

2. Get [written semantic contracts](https://jalcocert.github.io/JAlcocerT/the-ideas-bucket-can-be-empty/#still-doing-ppts) before its too late and the preassure goes for you
 
**Intro**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/the-ideas-bucket-can-be-empty/#the-top-down-hierarchy-of-right" title="Top-Down Semantics" image="/blog_img/memes/data-deadlock.png" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


https://github.com/clidey/whodb

https://github.com/obra/superpowers

https://pydantic.dev/

I talked about Rill and WrenAI [sometime back](https://jalcocert.github.io/JAlcocerT/creating-a-generative-bi-solution/#existing-genbi-solutions)

https://github.com/Canner/WrenAI

https://docs.getwren.ai/oss/concepts/architecture#correctness-is-a-system-not-a-switch

JHub is great. Is there [anything else](#different-ways-to-jhub)?

Data -> Decision -> Delivery

Speed matters

- **Apache DevLake** = DevOps/SDLC Analytics & Metrics
- **Delta Lake** = Data Storage Layer for Data Lakes

> https://devlake.apache.org/docs/Metrics/DeploymentFrequency/

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

## AI/BI Tools

Since the last time, chartbrew reached version 5:

[![shields.io Stars](https://img.shields.io/github/stars/chartdb/chartdb)](https://github.com/chartdb/chartdb/stargazers)

[![shields.io Stars](https://img.shields.io/github/stars/chartdb/chartdb)](https://github.com/chartbrew/chartbrew/stargazers)

https://github.com/chartbrew/chartbrew

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/chartbrew/" title="ChartBrew | Docker Config 🐋 ↗" >}}
{{< /cards >}}

chartDB or DB2rest

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen" title="AIGen | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

### Whats New

Rill vs WrenAI vs Vanna

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/chartbrew/" title="WrenAI | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/chartbrew/" title="Vanna | Docker Config 🐋 ↗" >}}
{{< /cards >}}

## Fabric One Catalogue or...

If you have been using PowerBI, you know that there is this notion of [data catalog](https://powerbi.microsoft.com/en-us/data-catalog/) 

Well, **OneLake Catalog** is Microsoft's answer to that need, and it's built right into the Fabric ecosystem. [learn.microsoft](https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview)

This is why as part of your **Data Strategy** you should be thinking about semantics first and foremost.

Because the semantic layer is what makes sense of your data and allows you to make decisions based on it. 

Plus...the hard tech part...is [cooked for a while now](https://jalcocert.github.io/JAlcocerT/ai-scripts-and-animated-data/#animations-or-dashboards)

| File | Contents |
|---|---|
| `model.bim` | Full semantic model — tables, Power Query (M) transformations, DAX measures, calculated columns, relationships, hierarchies |
| `report.json` | Report layout — pages, visuals, positions, filters, slicers, bookmarks, field bindings |
| `diagramlayout.json` | Visual positioning of tables in the model relationship diagram (cosmetic only) |

> A `procedural.md` is all you might need to know everything you ever wanted from ~~pbix~~ .pbip powerbi dashboards

**OneLake Catalog** is a Microsoft Fabric feature—a centralized data discovery and governance tool within OneLake, Microsoft's unified data lake (like "OneDrive for data"). 

It helps users search, explore, and manage Fabric items like lakehouses, warehouses, reports, and pipelines across workspaces.

[learn.microsoft](https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview)

Key Features

It offers an **Explore tab** for browsing with filters (domains, tags, endorsements, item types), rich metadata (descriptions, schemas, lineage, permissions), and direct actions like querying or analyzing items.

The **Govern tab** (preview in some updates) provides data owners insights on quality, compliance, and recommended actions. [blog.fabric.microsoft](https://blog.fabric.microsoft.com/en-US/blog/onelake-catalog-the-trusted-catalog-for-organizations-worldwide/)

Microsoft Fabric Context

Built into every Fabric tenant, it unifies multi-cloud data estates, integrates with Teams/Excel/Copilot, and supports APIs/CLI for devs—promoting trust, reuse, and security via endorsements and sensitivity labels.

It's complementary to Purview for broader governance. [learn.microsoft](https://learn.microsoft.com/en-us/fabric/onelake/)

Yes, that description is accurate. OneLake Catalog centralizes all Microsoft Fabric content for browsing, curation, and governance in one unified view. [learn.microsoft](https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview)

Coverage Details

It spans **insight items** (reports, dashboards), **data items** (lakehouses, semantic models, warehouses), **process items** (pipelines, notebooks), plus apps and more—accessible via Explore and Govern tabs with filters, metadata, lineage, and actions.

This matches official docs and demos exactly. [blog.fabric.microsoft](https://blog.fabric.microsoft.com/en-US/blog/onelake-catalog-the-trusted-catalog-for-organizations-worldwide/)

**Open-source alternatives** to Microsoft Fabric (unified analytics) and OneLake Catalog (data governance/discovery) exist for building custom lakehouses with catalogs.

They prioritize vendor independence, lower costs, flexibility, and multi-cloud support over Fabric's seamless Azure integration. [peliqan](https://peliqan.io/blog/microsoft-fabric-alternatives-competitors/)

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

**Why OSS?** Cost savings (no per-compute fees), customization (e.g., Iceberg governance across Spark/Trino), no lock-in (use AWS S3/GCP/etc.), community velocity—ideal for advanced users like devs building micro-SaaS. Fabric suits quick Azure starts; OSS for long-term control.

What can happen with OSS?

That some project like minion say bye, but you can fork it and maintain it

or switching to an equivalent one: https://github.com/rustfs/rustfs

> Apache v2 | 🚀2.3x faster than MinIO for 4KB object payloads. RustFS is an open-source, S3-compatible high-performance object storage system supporting migration and coexistence with other S3-compatible platforms such as MinIO and Ceph.

> > RustFS is a high-performance, distributed object storage system built in Rust.

Which of these would you use to analyze on chain data?

{{< youtube "zBd13Owe5-o" >}}

### New Data Stack

DuckDB and MotherDuck

> which btw can be integrated with perplexity connectors!

![Data Analytics - webook](/blog_img/shipping/dna-1ton-ebook.png)
* https://www.ohansemmanuel.com/books/understanding-astro
* https://github.com/understanding-astro/understanding-astro-book/tree/master?tab=readme-ov-file
* https://understanding-astro-webook.vercel.app/

---

DuckDB as been very interesting.

Ive eben managed to plug it to langchain with a dummy db for a [tech talk here](https://jalcocert.github.io/JAlcocerT/learnt-while-building-web-apps/#conclusions).

And gen bi tools like Rill rely on it.

https://ducklake.select/manifesto/

which relates to rill gen bi andduckdb

https://www.youtube.com/watch?v=dJMqeKEtW6w

https://www.youtube.com/watch?v=dJMqeKEtW6w

https://www.youtube.com/watch?v=hrTjvvwhHEQ

https://www.youtube.com/watch?v=-PYLFx3FRfQ



https://motherduck.com/docs/getting-started/

Infrastructure for Answers

The data warehouse built for answers, in SQL or natural language.

I focused on [articulating better](https://github.com/JAlcocerT/selfhosted-landing/blob/master/y2026-tech-talks/articulated-vs-authorit.md) my ideas, creating [engaging presentations](https://github.com/JAlcocerT/selfhosted-landing/blob/master/y2026-tech-talks/authoritative-content.md) and [authorated](https://github.com/JAlcocerT/selfhosted-landing/blob/master/y2026-tech-talks/authoritative-content.md) content.

Its all about nurturing the [psyc aspect](https://jalcocert.github.io/JAlcocerT/how-is-for-agents-what-and-why-for-you/#psyco).


---

## Conclusions

I said bye recently to the vasagle desk that has seen me grown in the D&A space these years.

### BLUF

Bottom line up front - Just another TL;DR!

The narrative and story lines are important to go sell and fund PoCs so that they become MVPs

For the day to day, elevate your operations to get more done:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Bring AI to your workflow" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

- **Apache DevLake** = DevOps/SDLC Analytics & Metrics
- **Delta Lake** = Data Storage Layer for Data Lakes

You can also try with [Python Venvs or Conda](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/)

It doesnt matter if you stack is: `powerbi+dbeaver+mssql/dbcode` extensions at vscode...

```sql
SELECT TOP 10 * FROM INFORMATION_SCHEMA.TABLES;

SELECT [EaId], [Name], [LifecycleState]
FROM [Stg].[Snowflake]
WHERE [EaId] LIKE 'sth123%';
```


* https://learn.microsoft.com/en-us/power-bi/create-reports/copilot-introduction

Or the `Grafana+Pypsark+graphite/ES` one...

I got you covered on the D&A book

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

Or if you are ready for that big next step, at the consulting ;)

---

Not all of them are 100% Open Source Software (OSS). 

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

Which should you choose?

* If you want **maximum power for free**: **DBeaver Community** is the winner.
* If you want something **simple and truly OSS**: **HeidiSQL** (Windows) or **Beekeeper Studio Community**.
* If you are on a **Mac**: **Sequel Ace** is a fantastic open-source native choice.

### Agentic Orchestration Layer

The article says the Zvec team’s ecosystem roadmap targets integrations with:

- **LangChain**. [marktechpost](https://www.marktechpost.com/2026/02/10/alibaba-open-sources-zvec-an-embedded-vector-database-bringing-sqlite-like-simplicity-and-high-performance-on-device-rag-to-edge-applications/)
- **LlamaIndex**. [marktechpost](https://www.marktechpost.com/2026/02/10/alibaba-open-sources-zvec-an-embedded-vector-database-bringing-sqlite-like-simplicity-and-high-performance-on-device-rag-to-edge-applications/)
- **DuckDB**. [marktechpost](https://www.marktechpost.com/2026/02/10/alibaba-open-sources-zvec-an-embedded-vector-database-bringing-sqlite-like-simplicity-and-high-performance-on-device-rag-to-edge-applications/)
- **PostgreSQL**. [marktechpost](https://www.marktechpost.com/2026/02/10/alibaba-open-sources-zvec-an-embedded-vector-database-bringing-sqlite-like-simplicity-and-high-performance-on-device-rag-to-edge-applications/)
- “Real device deployments” (i.e., on-device / edge environments, not a specific framework, but mentioned as a target). [marktechpost](https://www.marktechpost.com/2026/02/10/alibaba-open-sources-zvec-an-embedded-vector-database-bringing-sqlite-like-simplicity-and-high-performance-on-device-rag-to-edge-applications/)

They are essentially the "nervous system" for AI.

While a Large Language Model (LLM) acts as the "brain," these **Agentic Orchestration Layers** provide the structure, memory, and routing logic required to turn a static model into a functional, autonomous agent.

However, they each approach "orchestration" from a very different architectural philosophy. 

#### 1. LangGraph (The "State Machine" Approach)

LangGraph is currently the industry favorite for **complex, reliable agents**. 

Unlike standard LangChain (which is more linear), LangGraph treats an agent like a "cycle" or a flow chart.

* **Philosophy:** Everything is a **Directed Acyclic Graph (DAG)** or a state machine.
* **Best for:** Tasks where the agent needs to loop back, retry, or follow a very specific "plan-act-check" cycle.
* **Key Feature:** Built-in persistence (the agent can "sleep" and wake up exactly where it left off).

#### 2. AutoGen (The "Conversation" Approach)

Born out of Microsoft Research, AutoGen views agentic work as a **dialogue**.

* **Philosophy:** You create a "team" of specialized agents (e.g., a "Coder," a "Reviewer," and a "Manager") who talk to each other to solve a problem.
* **Best for:** Creative problem solving, multi-agent collaboration, and scenarios where agents need to critique each other's work.
* **Update:** As of late 2025, Microsoft released the **Microsoft Agent Framework**, which converges AutoGen’s conversation patterns with Semantic Kernel’s stability.

#### 3. Semantic Kernel (The "Enterprise" Approach)

This is Microsoft’s SDK for integrating AI into professional software (C#, Python, Java).

* **Philosophy:** It treats AI functions as **"Skills" or "Plugins"** that can be called by a central "Planner."
* **Best for:** Large-scale enterprise apps where you need strict security, telemetry (logging), and integration with existing corporate APIs.
* **Key Feature:** It is "Strongly Typed," making it much easier for traditional software engineers to use than the more "fluid" Python frameworks.

| Tool | Core Mechanism | Complexity | Best Use Case |
| --- | --- | --- | --- |
| **LangGraph** | Graphs / State Nodes | High | Robust, custom loops and specific workflows. |
| **AutoGen** | Agent Conversations | Medium | Dynamic "brainstorming" and multi-agent teams. |
| **Semantic Kernel** | Plugins / Planners | Enterprise | Production apps needing security and C# support. |

### Where does standard LangChain fit?

In 2026, standard **LangChain** is often viewed more as a "utility belt" or a collection of connectors (to databases, PDFs, etc.). 

Most developers use LangChain for the *data* and LangGraph for the *logic*.

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
* And...how about Google **ADK**?!

---

## FAQ

JSON, YML or TooN?

* https://github.com/toon-format/toon

* https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql

The MSSQL Extension for Visual Studio Code is designed to empower developers by providing a seamless and modern database development experience. 

Our goal is to make SQL development more productive and intuitive by integrating essential features such as schema management, query execution, and AI-powered assistance.

### Data Modelling Approaches

Yea...again.

1. ER - 3NF - OLTP - normalized schemas: + tables, - redundancy
2. Dimensional Modelling - OLAP - denormalized: + query speed but more space taken

trazability matrix, dependencies...

### Soft Skills for D&As

These notes are useful, especially for [D&A roles](https://jalcocert.github.io/JAlcocerT/career/#other-roles) where the technical work is only half of the job.

A good analyst is not just someone who can find the issue.

The higher-impact analyst can explain what is known, what is still uncertain, who should own the next step, and what decision is needed.

You can think of this as a capability framework built on top of the [no-hello movement](https://nohello.net/en/). 

"No hello" reduces conversational latency by putting the actual request in the first message.

This goes one level higher: choose the communication pattern that creates the next useful state.


{{< details title="Converging vs Non-Converging 📌" closed="true" >}}

This connects three related ideas:

- **No-hello** prevents empty communication.
- **Non-converging asking** prevents vague, endless clarification loops.
- **This capability framework** turns communication into an outcome-producing system.

A non-converging ask usually sounds like:

> Can we look into this?
>
> Thoughts?
>
> Can someone check?
>
> Is this expected?

Those questions create motion, but not convergence. They often do not specify evidence, owner, decision, deadline, or acceptable next action.

A better pattern is:

> I found X. I ruled out Y and Z. Current evidence points to A.
>
> Can Team B confirm whether they own this upstream field mapping by Friday 12 PM?
>
> If yes, we can proceed with Option 1. If not, I will reroute to Team C.

That maps directly to the framework:

- **DFIR:** what happened, what evidence exists, and what interpretation is likely.
- **FACT:** who the likely owner is and why.
- **DRIVE:** the request is easy to answer.
- **COAST:** there is an owner, status, and trigger.
- **ADAPT:** if a decision is needed, options are framed.

So yes: this section is also about making asks converge. A good analyst does not just "raise visibility"; they reduce ambiguity until the next action becomes obvious.

Converging is good when the goal is execution, but risky when the goal is still sense-making.

| Situation | Better mode | Why |
|---|---|---|
| Bug triage, RCA, ownership handoff, approval, release blocker | **Converge** | You need facts, owner, decision, and next action. |
| Discovery, strategy, architecture exploration, product direction, unclear problem framing | **Diverge first, then converge** | Premature closure can hide better options or wrong assumptions. |
| Stakeholder conflict, ambiguous business ask, unclear metric definition | **Clarify / frame** | The real problem may be semantic, political, or organizational rather than technical. |

The danger is not convergence itself. The danger is converging too early.

For D&A, this matters a lot. If the dashboard number is "wrong", you should converge on evidence.

But if the question is "what should this metric mean for the business?", converging too quickly can lock in a bad semantic contract.

{{< /details >}}

Good stakeholder communication is not always about converging immediately. 

It is about knowing when to diverge for context, when to clarify meaning, and when to converge into ownership, decision, and action.

#### Stakeholder Leadership Toolkit

The point of the toolkit is simple: help mid-level analysts move from *reporting problems* to *driving outcomes*.

Most professional communication should not be optimized for sharing information. 

It should be **optimized for creating an outcome.**

Before sending an email, scheduling a sync, or opening a ticket, ask:

> What specific outcome am I trying to create, and what communication pattern does it require?

{{< callout type="warning" >}}
A D&A capability framework for the ones who are 'no-hello' aware.
{{< /callout >}}

#### Stakeholder Maturity Model

| Level | Role | Core communication profile |
|---|---|---|
| L1 | Junior analyst | Reports issues, escalates quickly, and focuses mostly on isolated technical findings. |
| L2 | Mid-level analyst | Investigates before escalating, identifies correct owners, facilitates discussions, and produces evidence-based recommendations. |
| L3 | Senior analyst | Drives alignment across teams, frames business decisions, anticipates stakeholder concerns, and creates clear execution plans. |
| L4 | Lead / Principal | Shapes strategy, resolves organizational ambiguity, influences without authority, and builds repeatable operating models. |

#### Anti-Patterns vs Better Framing

| Anti-pattern | Better framing |
|---|---|
| "I found an issue." | "I investigated the issue, ruled out X and Y, and believe Z is the most likely cause based on our logs." |
| "Can we discuss this on a call?" | "The decision required is whether we should adopt Option A or Option B. I have mapped the trade-offs below." |
| "This other team needs to fix it." | "Based on the lineage mapping, Team X is the logical owner because they manage the upstream ingestion layer." |
| "There is missing data." | "Current evidence suggests a lineage mismatch rather than missing source data. I have outlined the discrepancy here." |

#### Six Stakeholder Communication Patterns

Use these patterns depending on the business situation. 

The goal is to make the communication shape match the outcome you need.

##### 1. Investigation: DFIR

Use this for root cause analysis, data discrepancies, bug investigation, stakeholder concerns, RCA documents, and executive questions about reported issues.

| Element | Meaning |
|---|---|
| Discover | Observation |
| Facts | Evidence and findings |
| Interpretation | Root cause and business interpretation |
| Recommendation | Decision required and recommended action |

**Outcome created:** shared understanding of reality before ownership, fixes, or priorities are discussed.

**Typical deliverables:** RCA documents, investigation summaries, Jira bug analysis, stakeholder updates, and executive briefings.

**Goal:** establish a single source of truth before proposing solutions.

**What good looks like:** the analyst separates facts from assumptions and builds a narrative that lets stakeholders reach the same conclusion from the evidence.

**Common mistake:** jumping from observation directly to a proposed fix without proving the root cause.

**Mindset:** investigate before advocating.

Example:

- **Observation:** stakeholders report that two applications show deployment metrics despite appearing to have no deployment data.
- **Evidence:** deployment records exist in the raw fact table.
- **Findings:** the deployment records are stored under historical project names.
- **Root cause:** the application identity is linked by `BitID`, not `project_name`.
- **Business interpretation:** the dashboard is behaving correctly; this is a data lineage issue rather than a calculation defect.
- **Decision required:** should deployment history follow the application across project-name changes?
- **Recommendation:** if `BitID` is the canonical application identifier, retain the current logic and document the behavior.

##### 2. Alignment Sync: COAST

Use this for release readiness reviews, cross-team status meetings, open issue reviews, program updates, and dependency tracking.

| Element | Meaning |
|---|---|
| Context | The situation |
| Open points | Unresolved issues |
| Accountability | Owners |
| Status | Current progress |
| Trigger | Next action / target date |

**Outcome created:** clarity, accountability, and momentum across multiple stakeholders.

**Typical deliverables:** release readiness emails, program status updates, weekly stakeholder syncs, and dependency review meetings.

**Goal:** make sure everyone understands what remains open, who owns it, and what happens next.

**What good looks like:** every issue has an owner, a current status, and a defined next action.

**Common mistake:** discussing problems without formally establishing ownership.

**Mindset:** alignment is not agreement; alignment is shared understanding.

Example:

- **Context:** Q3 dashboard release is scheduled for next Tuesday.
- **Open points:** the user access matrix for the Finance team has not been verified.
- **Accountability:** Sarah, the D&A analyst, owns it.
- **Status:** the test group has been created, but sign-off from the Finance Lead is pending.
- **Trigger:** Sarah pings the Finance Lead by Friday at 12 PM. If there is no response, escalate to the release manager.

##### 3. Follow-Up and Execution: DRIVE

Use this for open requests, pending approvals, access requests, and stalled delivery items.

| Element | Meaning |
|---|---|
| Desired outcome | What is needed |
| Reference | Context, links, PRs |
| Information | Required data |
| Validate | Next-step verification |
| Easy response | Yes/no or multiple-choice options |

**Outcome created:** reduced delays and faster stakeholder response times.

**Typical deliverables:** follow-up emails, approval requests, access requests, and escalation reminders.

**Goal:** create forward momentum while minimizing cognitive effort for the recipient.

**What good looks like:** the stakeholder can respond in less than one minute because the request, context, links, and options are clear.

**Common mistake:** sending vague nudges like "just following up" without restating the exact request.

**Mindset:** make it easier to help you than to ignore you.

Example:

- **Desired outcome:** approval for PR #402, a schema update for the customer table.
- **Reference:** PR link: [github.com/org/pull/402](https://github.com/org/pull/402). This unblocks tonight's pipeline migration.
- **Information:** the schema change only adds a nullable field, `loyalty_tier_id`; there is no impact on existing downstream views.
- **Validate:** all unit tests passed.
- **Easy response:** reply with `Approved` or click the GitHub link to sign off.

##### 4. Architecture and Decision Meetings: ADAPT

Use this for future-state architecture, platform decisions, technical strategy, major dependencies, and solution alternatives.

| Element | Meaning |
|---|---|
| As-is state | Current setup |
| Dependency / problem | Why we must change |
| Alternatives | Pros and cons of each option |
| Path forward | Recommended route |
| Target outcome | Desired end state |

**Outcome created:** a documented decision and agreed path forward.

**Typical deliverables:** architecture review meetings, option assessments, future-state proposals, and decision workshops.

**Goal:** drive a concrete business or technical decision instead of hosting an open-ended discussion.

**What good looks like:** participants leave with a recommended direction, implementation owners, and clear next steps.

**Common mistake:** scheduling a meeting to discuss the problem without defining the decision that needs to be made.

**Mindset:** every architecture conversation should end with a decision, an action, or a deliberate deferment.

Example:

- **As-is state:** reporting data is processed through daily batch runs on a legacy server.
- **Dependency / problem:** batch size is growing 15% month over month, and jobs are starting to spill into business hours.
- **Alternatives:** Option A is scaling the legacy server, which is costly and temporary. Option B is migrating to Snowflake, which needs upfront effort but gives longer-term scalability.
- **Path forward:** recommend Option B and run a 2-week proof of concept.
- **Target outcome:** reporting finishes before 7 AM daily, saving 4 hours of processing time.

##### 5. Cross-Team Handoff: FACT

Use this for technical handoffs, upstream data-quality issues, system-owner validation, vendor escalations, and ownership transfer after an investigation.

| Element | Meaning |
|---|---|
| Finding | What we discovered |
| Analysis | Why we believe it happens |
| Confirmation | Proof / evidence |
| Take action | What the other team should do |

**Outcome created:** ownership transfer without ambiguity or rework.

**Typical deliverables:** team handoffs, vendor escalations, upstream data-quality requests, and ownership transfer discussions.

**Goal:** transfer operational ownership using evidence rather than assumptions.

**What good looks like:** the receiving team understands what was found, why it matters, why they are the logical owner, and what action is being requested.

**Common mistake:** tossing issues over the fence without investigation or a clear ownership rationale.

**Mindset:** investigate first, escalate second.

Example:

- **Finding:** `transaction_amount` is arriving null for all checkout events.
- **Analysis:** the checkout payload format changed in yesterday's API deployment, `v2.1`.
- **Confirmation:** comparing payloads before and after deployment shows the key changed from `amount` to `checkout_amount`.
- **Take action:** the Checkout Service team should update the payload output mapping or rollback `v2.1`.

##### 6. Complex Technical Investigations: TRACE

Use this for multi-system failures, ambiguous ownership, end-to-end data lineage investigations, integration issues, and telemetry problems.

| Element | Meaning |
|---|---|
| Trace | Follow the path |
| Rule out | Eliminate working systems |
| Analyze | Isolate the gap |
| Conclude | Locate the failure |
| Execute | Fix or hand off |

**Outcome created:** focused investigation effort and faster root cause isolation.

**Typical deliverables:** multi-system incident investigations, data lineage reviews, telemetry investigations, and integration troubleshooting.

**Goal:** focus stakeholder attention on the most likely failure point while eliminating unnecessary tangential investigation.

**What good looks like:** the analyst can explain the end-to-end flow, which layers were tested, which explanations were ruled out, and where the evidence points.

**Common mistake:** escalating a broad technical problem without first narrowing the failure domain.

**Mindset:** follow the journey of the data.

Example:

- **Trace:** followed the pipeline from Salesforce to Kafka Topic to Databricks Lakehouse to PowerBI.
- **Rule out:** Salesforce API sent the payloads; Kafka shows messages received; Databricks raw table contains the records.
- **Analyze:** the Databricks aggregation job failed at midnight because of a cluster credentials error.
- **Conclude:** the failure point is inside the internal Databricks ETL layer, not the upstream systems.
- **Execute:** re-authenticate the cluster credentials, re-run the job, and verify that PowerBI populated.

#### Expected Benefits

By adopting these structured patterns, a D&A team can expect:

- **Faster issue resolution:** less back-and-forth guessing.
- **Better documentation:** clearer tickets, RCAs, and stakeholder updates.
- **Reduced management overhead:** more independent analysts who can resolve roadblocks autonomously.
- **More productive meetings:** syncs designed around decisions rather than passive status updates.

#### Quick Reference

| Business situation | Recommended pattern | Target outcome |
|---|---|---|
| Bug / root cause analysis | DFIR: Investigation | Establish facts and suggest recommendations. |
| Release status / multi-issue sync | COAST: Alignment Sync | Define ownership and next triggers. |
| Approvals / chasing deliverables | DRIVE: Follow-Up and Execution | Get a fast, frictionless response. |
| Designing future solutions | ADAPT: Architecture and Decision | Reach a decision on the technical path forward. |
| Handoff to an upstream team | FACT: Cross-Team Handoff | Move ownership without assumptions. |
| Multi-system diagnostic | TRACE: Complex Technical Investigation | Keep technical teams focused on data evidence. |

#### Golden Rule of Stakeholder Communication

Although each framework serves a different purpose, they all answer the same five stakeholder questions:

1. What happened? *(Context)*
2. What do we know? *(Evidence)*
3. Who owns it? *(Accountability)*
4. What decision is needed? *(Action)*
5. What happens next? *(Trigger)*

Analysts who answer these questions proactively move beyond reporting background activity. 

They start driving outcomes across teams, programs, and the broader D&A organization.

### Different ways to JHUB

Typical ways to connect to a PySpark cluster include managed notebooks like Databricks or Google Vertex AI Workbench, programmatic drivers via SparkSession, and job submission tools. 

[spark.apache](https://spark.apache.org/docs/latest/api/python/getting_started/quickstart_connect.html)


{{< callout type="info" >}}
You can get CLI agents connected to a JHUB instance & query agains the spark session
{{< /callout >}}

Managed Notebook Interfaces

These provide browser-based JupyterLab-like environments directly on the cluster:

- Databricks notebooks: Collaborative, integrated with Spark clusters and Delta Lake.[ from prior]
- Google Vertex AI Workbench: Managed JupyterLab instances with PySpark pre-configured for Google Cloud. [docs.cloud.google](https://docs.cloud.google.com/vertex-ai/docs/workbench/introduction)
- Amazon EMR Notebooks (SageMaker Studio or EMR Studio): Interactive PySpark shells on EMR clusters. [stackoverflow](https://stackoverflow.com/questions/40920313/how-can-i-connect-pyspark-local-machine-to-my-emr-cluster)
- Azure Synapse/Fabric notebooks: Spark pools with PySpark support.[ from prior]

Programmatic Connections

Connect remotely from local IDEs (VS Code, Jupyter) or scripts using PySpark client.
- **SparkSession with master URL**: `SparkSession.builder.remote("sc://host:15002")` via Spark Connect (Spark 3.4+), or `master("spark://master:7077")` for standalone. [secoda](https://www.secoda.co/learn/what-are-the-methods-to-connect-apache-spark-to-spark-clusters)
  - Supports remote DataFrame/SQL API over gRPC (Spark Connect) or traditional driver.
- Configure `PYSPARK_PYTHON` and driver paths for cluster compatibility. [back2code](https://www.back2code.me/2018/11/configure-pyspark-to-connect-to-a-standalone-spark-cluster/)

Job Submission

Submit non-interactive scripts to run on the cluster.
- `spark-submit --master yarn/cluster/k8s --deploy-mode cluster script.py`: Client mode (driver local) vs cluster mode (driver on cluster). [sparkbyexamples](https://sparkbyexamples.com/spark/spark-deploy-modes-client-vs-cluster/amp/)
- Common on YARN (Hadoop), Kubernetes, Mesos. [secoda](https://www.secoda.co/learn/what-are-the-methods-to-connect-apache-spark-to-spark-clusters)

Popular Managed Clusters
| Platform | Connection Methods | Notes |
|----------|--------------------|-------|
| **Databricks** | Notebooks, SQL warehouses, Spark Connect, ODBC/JDBC. [secoda](https://www.secoda.co/learn/what-are-the-methods-to-connect-apache-spark-to-spark-clusters) | Lakehouse focus. |
| **Google Vertex AI Workbench/Dataproc** | Notebooks, `gcloud dataproc jobs submit pyspark`. [cloud.google](https://cloud.google.com/vertex-ai-notebooks) | Integrates BigQuery. |
| **AWS EMR/EMR Serverless** | Notebooks, `spark-submit` via SSH/Livy, EMR Studio. [stackoverflow](https://stackoverflow.com/questions/40920313/how-can-i-connect-pyspark-local-machine-to-my-emr-cluster) | S3-native. |
| **Azure Synapse/Fabric** | Notebooks, pipelines.[ prior] | ADLS integration. |
| **Self-Hosted (Standalone/K8s/YARN)** | Spark Connect, spark-submit. [spark.apache](https://spark.apache.org/docs/latest/api/python/getting_started/quickstart_connect.html) | Full control. |

Spark Connect is increasingly standard for thin-client remote access without full driver submission. [dataengineeringcentral.substack](https://dataengineeringcentral.substack.com/p/spark-connect-what-is-this-madness)

Databricks shares some analytics capabilities with Azure Synapse and Microsoft Fabric but differs significantly in focus and architecture. [datacamp](https://www.datacamp.com/blog/azure-synapse-vs-databricks)

Core Similarities

All three platforms handle big data processing, ETL pipelines, and Spark-based compute.

They integrate with Azure services like Data Lake Storage and support notebooks for SQL, Python, and Spark jobs. 

Key Differences
| Feature | Databricks | Azure Synapse | Microsoft Fabric |
|---------|------------|---------------|------------------|
| **Primary Strength** | Optimized Apache Spark for ML, data engineering, and lakehouse (Delta Lake). [powerdobs](https://powerdobs.nl/blog/is-azure-databricks-an-alternative-for-synapse-or-ms-fabric/) | Unified analytics with SQL pools for warehousing and serverless querying. [datacamp](https://www.datacamp.com/blog/azure-synapse-vs-databricks) | SaaS end-to-end platform combining lakehouse, warehouse, pipelines, and Power BI. [emergentsoftware](https://www.emergentsoftware.net/blog/microsoft-fabric-vs-azure-synapse-vs-databricks-what-should-you-use-and-when/) |
| **Best For** | Complex transformations, real-time streaming, multi-cloud flexibility. [datacamp](https://www.datacamp.com/blog/azure-synapse-vs-databricks) | Structured BI reporting, integrated ETL via pipelines. [learn.microsoft](https://learn.microsoft.com/en-us/answers/questions/2258999/choosing-the-right-azure-data-platform-synapse-fab) | Microsoft-centric unified analytics replacing Synapse parts. [mainri](https://mainri.ca/2025/07/10/comparison-of-microsoft-fabric-azure-synapse-analytics-asa-azure-data-factory-adf-and-azure-databricks-adb/) |
| **Compute Engine** | High-performance Spark clusters with autoscaling. [test-king](https://www.test-king.com/blog/a-side-by-side-comparison-azure-synapse-vs-azure-databricks/) | Dedicated/serverless SQL + Spark pools. [datacamp](https://www.datacamp.com/blog/azure-synapse-vs-databricks) | OneLake-based Spark and SQL engines. [emergentsoftware](https://www.emergentsoftware.net/blog/microsoft-fabric-vs-azure-synapse-vs-databricks-what-should-you-use-and-when/) |

Databricks excels in code-driven, scalable data science workloads, while Synapse (now evolving into Fabric) prioritizes Azure-integrated warehousing and simpler governance. [learn.microsoft](https://learn.microsoft.com/en-us/answers/questions/587071/differnce-between-synapse-and-databricks)

#### GCP VWB

#### Databricks

Databricks is similar to Google Vertex AI Workbench (likely what you mean by "Google Workbench") in providing managed JupyterLab-based notebook environments for data science and ML workflows.

Both support scalable compute, integrations with cloud storage and big data tools, and collaborative coding, though neither is built directly on JupyterHub (a multi-user server spawner). 

Databricks notebooks and Vertex AI Workbench offer Jupyter-compatible interfaces with multi-language support (Python, SQL, Scala), built-in visualizations, and enterprise features like Git integration and scheduling. 

They both enable seamless access to cloud services—Databricks with Delta Lake/Spark, Workbench with BigQuery/Cloud Storage—for ETL, ML model training, and deployment. 

| Feature | Databricks | Vertex AI Workbench |
|---------|------------|---------------------|
| **Focus** | Lakehouse analytics, Spark-optimized big data/ML at scale. [datasciencenotebook](https://datasciencenotebook.org/compare/jupyter/databricks) | ML-centric development with Vertex AI pipelines, AutoML integration. [cloudbank](https://www.cloudbank.org/tool/google-vertex-ai-workbench) |
| **Compute** | Unified Spark clusters, multi-cloud support. [qwak](https://www.qwak.com/compare/vertex-ai-vs-databricks) | GPU/TPU instances, fully managed JupyterLab on Google Cloud. [cloud.google](https://cloud.google.com/vertex-ai-notebooks) |
| **Collaboration** | Real-time editing, version control in notebooks. [datasciencenotebook](https://datasciencenotebook.org/compare/jupyter/databricks) | Single-user instances with IAM access sharing; no native real-time multi-user like JupyterHub. [docs.cloud.google](https://docs.cloud.google.com/vertex-ai/docs/workbench/instances/manage-access-jupyterlab) |
| **Self-Hosting** | Possible but primarily managed. [datasciencenotebook](https://datasciencenotebook.org/compare/jupyter/databricks) | Fully managed; customizable via user-managed instances. [i636c6f7564o676f6f676c65o636f6dz.oszar](https://i636c6f7564o676f6f676c65o636f6dz.oszar.com/vertex-ai/docs/workbench/introduction) |

Databricks emphasizes data engineering and unified analytics beyond notebooks, while Workbench prioritizes streamlined ML experimentation in Google's ecosystem. [deepnote](https://deepnote.com/compare/databricks-vs-vertexai)

### Geo Analytics

https://jalcocert.github.io/JAlcocerT/geo-maps-and-data/#selfhosted-gpx

1. GeoLibre - https://github.com/opengeos/GeoLibre that you can find https://geolibre.app/

2. Dawarich `https://play.google.com/store/apps/details?id=com.zeitflow.dawarich&pli=1`

http://localhost:3333/settings/integrations

https://fossengineer.com/selfhosting-velomate/

3. https://github.com/tess1o/geopulse

<!-- 
https://www.youtube.com/watch?v=pK_fSEp_OzQ -->

{{< youtube "pK_fSEp_OzQ" >}}


This is a good chance:

1. To have a look to [French Real estate again](https://jalcocert.github.io/JAlcocerT/ai-scripts-and-animated-data/#real-estate):

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-geospatial" title="French Real Estate ↗" icon="github" >}}
{{< /cards >}}


2. To check how household income is evolving in spain as [a recap of this post](https://jalcocert.github.io/JAlcocerT/geo-maps-and-data/)

### Tomatoes Progress

Since the [last time](https://jalcocert.github.io/JAlcocerT/electr-diode/#tomatoes-x-solar), this is how they are growing the second batch:

{{< youtube "_WAJ1y8Mdr0" >}}
<!-- https://youtube.com/shorts/_WAJ1y8Mdr0 -->

### When was the last time you applied?

Tired to explain the same to the same people that wont learn?

{{% details title="Ideas Checklist 🚀" closed="true" %}}

For this I dedicated a full post few weeks ago.

The general idea checklist is as follows:



{{% /details %}}

{{% details title="Prospects/Clients Checklist 🚀" closed="true" %}}



{{% /details %}}

Have you been told that you dont have enough *role maturity*, aka you just have to wait?

{{% details title="QnA to the team to avoid accountability laundring 🚀" closed="true" %}}


{{% /details %}}

{{% details title="QnA for Product teams 🚀" closed="true" %}}

{{% /details %}}


Do you have clear oportunities out there?

Then, whats stopping you from applying?

Bc you have [your daily notes](https://github.com/JAlcocerT/my-logseq-notes/tree/main/journals) that can drive [the updates to your CV](https://jalcocert.github.io/JAlcocerT/about-inflation/#a-cv-via-yamlresume-vs-overleaf) as a code...right?

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/job-trends" title="Job Trends ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex" title="Latex x CV ↗" icon="github" >}}
{{< /cards >}}

### Too many calls?

After applying you are getting tons of calls bc your profile is great?

Yes — an open-source Android option that can do **prefix/wildcard blocking** is **Fossify Phone**; community reports describe it as able to block calls by number pattern, like prefixes, which fits something such as `+34 68*`. [reddit](https://www.reddit.com/r/FrancePirate/comments/1lo2phh/ya_une_appli_android_pour_bloquer_les_0568_0424/)

Another option is **SpamBlocker (Call & SMS)**, which is described as open source and supports regex/pattern-based blocking, so it should also be suitable for blocking Spanish mobile prefixes. [discuss.privacyguides](https://discuss.privacyguides.net/t/yet-another-call-blocker-another-updated-alternative/19276)

If you want something simpler, **Yet Another Call Blocker** is also mentioned as a FOSS blocker with wildcard-style blacklisting, though it appears older and less actively maintained. [f-droid](https://f-droid.org/en/packages/dummydomain.yetanothercallblocker/)

For a prefix like `+34 68`, you typically want a rule like:

- `+3468*`
- or `3468*`
- or `068*` depending on how your phone formats incoming numbers.

The exact matching style depends on how the app stores caller IDs, so the safest approach is to test with one or two formats first.

If you want the most privacy-friendly and flexible choice, I’d start with **SpamBlocker** or **Fossify Phone**.