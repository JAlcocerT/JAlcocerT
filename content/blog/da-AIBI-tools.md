---
title: "AI|BI Tools "
date: 2025-05-22T00:20:21+01:00
draft: false
tags: ["Dev","D&A","Career"]
description: 'BI/AI another combo and more D&A Tools. PoC Dashboards with PyGWalker can be a thing!'
url: 'ai-bi-tools'
---


It not just about *old school* [**BI** Tools](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/), or the well known propietary ones like [Looker](https://jalcocert.github.io/JAlcocerT/understanding-google-cloud-platform/) or PBi

Today, we will have a look to:

* **ChartDB**: A database diagrams editor that lets you visualize and design your database with a single query.
* **Quix (wix-incubator)**: A powerful, open-source platform for data exploration and analysis.
* **Querybook**: Pinterest's open-source big data ad-hoc query and visualization tool.
* **Quix Streams**: A Python library designed for building real-time data streaming applications.

### ChartBrew

* https://github.com/chartbrew/chartbrew
  * https://docs.chartbrew.com/deployment/run-on-docker#run-on-docker
  * https://raw.githubusercontent.com/chartbrew/chartbrew/refs/heads/master/docker-compose.yml

>  Open-source web platform used to create live reporting dashboards from APIs, MongoDB, Firestore, MySQL, PostgreSQL, and more 📈📊 

Which resonates with my recent [post on **BI Tools**](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/)

### ChartDB

I thought everything was done with [LangChain querying DBs with LLMs](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/) in DAG mode.

Then I found this:

* https://github.com/chartdb/chartdb

> agpl 3 | Database diagrams editor that allows you to visualize and design your DB with a single query.

[![shields.io Stars](https://img.shields.io/github/stars/chartdb/chartdb)](https://github.com/chartdb/chartdb/stargazers)

### DB2Rest

* https://github.com/9tigerio/db2rest

> Apache v2 | Instant no code DATA API platform. Connect any database, run anywhere. Power your GENAI application function/tools calls in seconds.


---

## Conclusions

[![Star History Chart](https://api.star-history.com/svg?repos=chartdb/chartdb,wix-incubator/quix,pinterest/querybook,quixio/quix-streams&type=Date)](https://star-history.com/chartdb/chartdb&wix-incubator/quix&pinterest/querybook&quixio/quix-streams&Date)

### PyGWalker

You can also have a look to a killer combi: **Streamlit x pygwalker**

Give the users a webapp that they can play with tables / graph that does not require huge development!

If you want to use actively AI to develop the dashboarding, consider **LLM x Streamlit:**

As can also render [mermaidJS](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/OpenAI_mermaid_v2c.py) and [plotly graphs](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/OpenAI_plotly_v1b.py) with your [aissistant, via streamlit webapp](https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main)

## Other D&A Tools

* https://github.com/wix-incubator/quix
* https://github.com/pinterest/querybook
* https://github.com/quixio/quix-streams
    * https://quix.io/templates/ai-customer-support