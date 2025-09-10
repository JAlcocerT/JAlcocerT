---
title: "FlaskCMS v0.2"
date: 2025-09-11T23:20:21+01:00
draft: false
tags: ["Astro x Flask","Markdown editors","Cursor MCP and AppImageLauncher","Stacer","Temporal io"]
description: 'Markdown and Flask working together.'
url: 'flask-cms-for-ssgs'
---

**TL;DR** v0.2 of the [Flask Powered CMS](#a-cms-with-flask). 

From Hugo Galleries to Mental Health and RealEstate?

+++ [Testing](#lately-i) Cursor/Stacer/Appimage launcher

**Intro**

I recently found this cool blog: https://kerkour.com/create-problems-to-sell-the-solution

While finding resources for [PB](https://jalcocert.github.io/JAlcocerT/pocketbase/).

The author seems to be the creator of **Markdown Ninja**: https://github.com/bloom42/markdown-ninja

> Markdown-first **CMS for bloggers**, minimalists and startups. Open Source alternative to Medium, Mailchimp and Substack - https://markdown.ninja

>> I love the website design btw, also the *trol* part `In Markdown They Trust`

It seems to be another markdown lover :)

Same to https://typlog.com/

> Let ideas flow in your familiar editing environment with the complete markdown syntax.

![alt](blog_img/dev/PB/selfh-pb.png) ![alt](blog_img/dev/PB/selfh-pb.png)

Which some open sources [themes](https://themes.typlog.com/#/nezu) like https://github.com/typlog/nezu

## A CMS with Flask

Version 0.2 coming!

After tinkering with the v0.1 (vibecoding), each time I got a different result.

So how about to combine all the good sides of all those for a v0.2?

In the end, it would be great to just plug any OSS MIT Licensed Astro or HUGO SSG available.

But we have to get started with something first :)





---


## Conclusions


### Lately I...


1. Have tried **Cursor**: https://cursor.com/dashboard

As I consumed all windsurf tokens very fast recently...

```sh
#https://cursor.com/downloads
cd ~/Downloads

#mkdir ~/Applications 
#cd ~/Applications
#chmod +x Cursor-*.AppImage
#./Cursor-*.AppImage

chmod +x Cursor-1.4.3-x86_64.AppImage
./Cursor-1.4.3-x86_64.AppImage
```

![Cursor + MCp Settings](/blog_img/dev/dev-cursor-mcp.png)

But that just executes it once.

> Cursor has brought recently CLI support, similarly to [Oterm](https://github.com/ggozad/oterm) with Ollama

2. So I got to know: **appimagelauncher**

```sh
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update

sudo apt install appimagelauncher
mkdir ~/Applications #place your *.AppImages there and they will integrate with your linux!
```

> I also saw this other IDE came out: https://www.dereference.dev/

3. These agentic IDEs consume a lot of resources, so I revisted **[Stacer](https://oguzhaninan.github.io/Stacer-Web/)** to monitor my x13 status:

```sh
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer
```

4. Learnt aout https://temporal.io/

> What if your code was crash-proof?

Temporal.io is an open-source platform that enables the creation of **durable and reliable distributed applications**.

It acts as a workflow orchestration engine, allowing developers to write complex, long-running business processes as code in standard programming languages like Go, Java, Python, and TypeScript.

The platform handles the complexities of state management, retries, and failure recovery, essentially allowing you to write your application logic as if system failures don't exist.

---

### Core Concepts

At its core, Temporal is built on two main components:

* **Workflow Executions**: A workflow is the durable, reliable, and stateful part of your application logic. You write a workflow as a function that describes the sequence of steps (activities) to be executed. The key feature of a workflow is its "durable execution," which means its state is persisted and can be restored at any point, even if a server crashes or the process is interrupted. This enables workflows to run for seconds, days, or even years without losing state.

* **Activities**: Activities are the individual, short-lived tasks that make up a workflow. They are the actual business logic that performs a specific job, such as making an API call, sending an email, or processing a payment. Activities are not durable and can be retried automatically by Temporal if they fail.

The **Temporal Service** acts as the central orchestrator, keeping track of the state of all workflows and managing task queues. **Worker Processes**, which you deploy and run, execute your workflow and activity code by polling these task queues for tasks.

---

### How it Solves a Problem

In traditional microservices architecture, orchestrating a complex, multi-step business process can be challenging. Developers often have to build custom logic to handle:

* **Retries and Timeouts**: Manually writing code to retry failed operations or handle timeouts.
* **State Persistence**: Ensuring the state of a long-running process is saved and can be recovered after a failure.
* **Failure Recovery**: Implementing logic to handle partial failures and resume a process from where it left off.
* **Distributed Transactions**: Coordinating a series of operations across multiple services to ensure atomicity.

Temporal simplifies these issues by providing a platform that handles them out-of-the-box. 

If an activity fails, Temporal automatically retries it according to a predefined policy. If a worker process crashes, the workflow state is preserved, and a new worker can resume the execution from the last successful step.

This shifts the focus from building complex plumbing for reliability to simply writing the business logic.

---

### Key Features and Use Cases

Temporal's key features include:

* **Durable Execution**: Guarantees that your application code will execute to completion regardless of failures.
* **Automatic Retries**: Built-in retry mechanisms for activities and workflows.
* **Developer-Friendly**: Write workflows using standard code and SDKs for multiple languages.
* **Scalability**: Designed to handle a high volume of concurrent workflows.
* **Observability**: Provides tools like a Web UI and CLI to monitor and debug workflow executions.

Temporal is a great fit for a variety of use cases, including:

* **Payment Processing**: Orchestrating complex payment flows with multiple steps like authorization, capture, and refunds.
* **SaaS Provisioning**: Automating the process of setting up new user accounts or services, which often involves multiple steps across different systems.
* **Data Pipelines**: Managing and orchestrating complex data transformation and processing jobs.
* **Human-in-the-Loop Workflows**: Building processes that require human intervention, such as approving a document or a transaction.
* **AI/ML Workflows**: Coordinating the steps in a machine learning pipeline, from data ingestion to model training and deployment.