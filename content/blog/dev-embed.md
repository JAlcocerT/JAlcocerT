---
title: "Everything can be embeded"
date: 2025-09-30T08:20:21+01:00
draft: false
tags: ["n8n vs Flowise","ChatWoot vs PaperCups","SolidTime","Embeded Analytics","DB2REST"]
url: 'embed-that'
description: 'Bring them to your Website - Chatbots, Live Chats > Whatsapp bouble or cal'
---


**Tl;DR**



**Intro**

Chatwoot has some basic CRM features (contact management, conversation history) but is mainly a helpdesk and messaging platform, not a dedicated CRM.


### Chatbots

#### Flowise

#### n8n

If you've heard about make or zapier, you ve heard about **n8n**

Specially after fireship video...

<!-- https://www.youtube.com/watch?v=bS9R6aCVEzw -->

{{< youtube "bS9R6aCVEzw" >}}

...And all the no Code automation / [AI we can do now with n8n](https://jalcocert.github.io/JAlcocerT/n8n-with-ai/).

<!-- ![alt text](/blog_img/GenAI/n8n/mailerlite/4-adding-openai.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/n8n-with-ai/" title="n8n 101 Post" image="/blog_img/GenAI/n8n/mailerlite/4-adding-openai.png" subtitle="Using n8n across few use cases" >}}
{{< /cards >}}



Yea, and all those youtubers selling their [automation agency](https://jalcocert.github.io/JAlcocerT/pro-agency-automation/)

Bottom line here: **n8n is very simple to get for free**

{{< youtube "v-gCNTI5kzE" >}}

<!-- https://youtu.be/v-gCNTI5kzE -->

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
  {{< card link="https://www.npmjs.com/search?q=keywords%3An8n-community-node-package" title="N8N | Community Nodes nmpjs ↗" >}}
{{< /cards >}}


##### n8n chat

https://www.npmjs.com/package/@n8n/chat?activeTab=readme

### Live Chats

Crisp Chat is a customer messaging platform that provides live chat, automated chatbots, multi-channel messaging, and helpdesk tools for websites and businesses.

**Open Source Alternatives**: An OS equivalent to Crisp Chat would include platforms that allow you to host similar live chat and support features yourself. 


- **Chatwoot**: A widely known open-source customer support platform offering live chat, multi-channel inbox (including email, WhatsApp, and others), automation, analytics, and team collaboration tools.
- **Papercups**: An open-source live chat system that can be embedded in websites; it supports automated replies, integrations, and a customizable widget.
- **LiveHelperChat**: Another option, providing live chat and visitor tracking functionality with self-hosting control.


| Platform       | Main Features                      | Hosting        | Integrations              |
|----------------|------------------------------------|----------------|--------------------------|
| Crisp Chat     | Live chat, chatbots, automation    | Cloud (SaaS)   | Extensive; proprietary   |
| Chatwoot       | Live chat, multi-channel inbox     | Self-hosted, Cloud | Slack, Email, WhatsApp   |
| Papercups      | Live chat, automation              | Self-hosted    | Slack, Zapier, Email     |
| LiveHelperChat | Live chat, visitor tracking        | Self-hosted    | Limited                  | 

All open-source options let you self-host and customize the software according to your needs, offering most of the core features provided by Crisp Chat, though integrations and advanced automation tools may vary.

If privacy, customizability, or avoiding subscription costs are priorities, Chatwoot and Papercups are two of the strongest open-source choices currently available.

#### ChatWoot

Chatwoot is primarily a **customer engagement** and communication platform, not a full-featured CRM (Customer Relationship Management) system. 

It centralizes conversations from channels like web chat, email, and social media, helps manage tickets, stores customer contact details, provides analytics, and supports automation features like chatbots.

However, while Chatwoot includes some CRM-like capabilities—such as managing and viewing customer profiles, conversation history, and team collaboration—it does not offer the depth of sales pipeline management, deal tracking, or marketing automation found in specialized CRM software like Salesforce or HubSpot. 

> Chatwoot can integrate with actual CRM systems to synchronize customer data for a more complete workflow.

> > Like to Odoo or [GHL some marketers use](https://jalcocert.github.io/JAlcocerT/software-for-marketing-agencies/#ghl)



**Who is using chatwoot**?

1. The people of Monero (when you disable privacy badger in FF) https://monero.com/wallets#
2. https://www.solidtime.io/

> This is a [Selfhosted](https://github.com/topics/self-hosted) & [OSS](https://docs.solidtime.io/self-hosting/intro) https://github.com/solidtime-io/solidtime with cool time tracking and invoicing features


#### PaperCups

* https://github.com/papercups-io/papercups

> MIT | Open-source live customer chat 

#### LiveHelperChat

* https://github.com/LiveHelperChat/livehelperchat

> Apache v2 |  Live Helper Chat - live support for your website. Featuring web and mobile apps, Voice & Video & ScreenShare. Supports Telegram, Twilio (whatsapp), Facebook messenger including building a bot. 

#### Whatsap bouble

Or just... https://github.com/JAlcocerT/just-ssg/tree/main/astro-ssg/whatsapp-bouble

## Embedded Analytics

Few months ago, I [read about Latitude](https://jalcocert.github.io/JAlcocerT/live-search-and-research-with-ai/#gaps-to-cover).

But not the prompt engineering platform, the embedded analytics one: https://github.com/latitude-dev/latitude

> Which is ofc, no longer mantained as now its all about agents :)

> > https://docs-analytics.latitude.so/guides/getting-started/introduction

### Metabase Embedded

Metabase, Redash, and Apache Superset all have features similar to Latitude, but with some differences in focus and implementation:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/metabase" title="Metabase | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/redash" title="Redash | Docker Config 🐋 ↗" >}}
{{< /cards >}}

| Feature/Tool               | **Metabase**                                              | Redash                                               | Apache Superset                                      | Latitude                                            |
|---------------------------|------------------------------------------------------|-----------------------------------------------------|-----------------------------------------------------|----------------------------------------------------|
| Data Source Connectivity  | Connects to many databases, supports visual query building and SQL | Connects to SQL/NoSQL databases, API's, files (CSV/Excel) | Supports numerous data sources via SQLAlchemy connectors | Connects to many databases/data warehouses including Postgres, BigQuery, Snowflake, DuckDB, etc. |
| Query Building            | GUI query builder, SQL editor for advanced users      | SQL/NoSQL query editor with syntax highlighting      | SQL Lab with auto-complete, Jinja templating        | SQL queries with parameterization exposed as API endpoints |
| Visualizations & Dashboards| Wide variety of charts and dashboards, drag and drop  | Drag-and-drop dashboards, charts, graphs, tables     | Rich visualizations, drag-and-drop dashboards       | Interactive visualizations embedded in frontend or iframe dashboards |
| Embedding                | Embedding dashboards and individual components in apps, supports React embedding | Embed dashboards, share via URLs, API for automation | Embedding dashboards with real-time data refresh     | Embedding dashboards via iframe or native React components |
| Automation                | Alerts, scheduled reports                              | Alerts, scheduled refreshes, report sharing          | Supports dashboard refresh, dynamic filtering       | Cache layer for fast query performance              |
| Security                 | Fine-grained permissions and data sandboxing          | Role and data access control, row-level security     | Role-based access control, user management           | SSL-ready encrypted parameters, parameterized queries |
| Deployment               | Self-hosted or cloud (Metabase Cloud)                  | Self-hosted or hosted options                         | Self-hosted deployment                                | Self-hosted or Latitude cloud deployment            |
| Ease of Use              | User-friendly for non-technical users, intuitive UI   | More SQL-centric, suitable for tech-savvy users      | Aimed at developers and advanced users               | SQL-centric but with simple API integration for frontend developers |

{{< youtube "4HUqYbknTOM" >}}

- **Metabase** is more focused on ease of use with a user-friendly interface **suitable for non-technical users**.
- Redash is strong in querying and lightweight dashboarding with alerting and scheduling.
- Apache Superset offers advanced features with strong SQL tooling, flexible visualizations, and sophisticated dashboards, suited for real-time and large datasets.
- Latitude uniquely focuses on exposing SQL queries as native API endpoints easily consumable in modern frontend frameworks with a cache layer for performance and a layout engine for dashboards.

> All four tools offer embedded analytics and dashboarding capabilities but differ in their primary target user base, complexity, and integration methods.

In terms of feature overlap with Latitude:

- They all provide SQL querying on databases with visualization and dashboarding.
- Latitude's native frontend integration and built-in cache layer provide developer-friendly modern API-first usage.
- Metabase and Superset offer richer drag-and-drop interfaces and user-friendly dashboards, especially for less technical users.

Thus, Latitude sits well for developers looking for API-driven, SQL-focused embedded analytics, while [Metabase, Redash, and Superset offer broader BI functionalities](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/) with more user-friendly or enterprise features.


{{% details title="Metabase x RestAPI x Astro SSG x CF Pages & Workers?  🚀" closed="true" %}}


Yes, Metabase, Redash, and Superset can all be integrated with a pure static Astro site deployed to Cloudflare Pages so that a component can fetch updated data when someone visits.

- Metabase provides a robust REST API for querying saved questions (SQL queries) and dashboards, allowing frontend apps to fetch live data via authenticated API calls. The API supports parameterized queries, enabling dynamic data fetching from the static site.[1][2]

- Redash also offers a comprehensive REST API that lets you programmatically fetch query results and dashboards. You can set up your Astro frontend component to call Redash’s query API, retrieve live JSON data, and update the UI on page load or on demand.[3][4]

- Apache Superset supports a SQL Lab API and also has endpoints for dashboards and charts. Although it’s more oriented towards internal BI use, you can connect your static frontend to Superset’s APIs to fetch updated data. Configurations for CORS and authentication are required.[5][6]

For a static Astro site hosted on Cloudflare Pages, the typical approach is:

1. Deploy the site as purely static files.
2. Include frontend components in Astro—React, Svelte, or vanilla JS—that call the analytics tool’s REST API endpoints to fetch the latest data on client-side load.
3. Use Cloudflare Pages Functions (serverless functions) or Cloudflare Workers to handle any proxying or authentication if needed, to avoid CORS and secure API keys.
4. Components fetch API data dynamically when visitors load the site, updating the UI with real-time or near real-time data.

This pattern enables interactive, data-driven components on a static JAMstack site with the analytics backend running separately and serving JSON data through APIs.

In summary, all three tools support API-driven dynamic data fetching compatible with a static Astro site on Cloudflare Pages, enabling components to update data on visitor load using client-side API requests and optionally Cloudflare edge functions for proxying/auth.Yes, Metabase, Redash, and Superset all provide REST APIs that can be used to fetch updated data dynamically from a static Astro site deployed on Cloudflare Pages. 

The typical approach is to have your Astro frontend components (React, Svelte, or vanilla JS) make client-side API calls to these platforms' API endpoints to retrieve the latest query or dashboard data when visitors load the site.

You can use Cloudflare Pages Functions or Workers to proxy these API calls if needed to handle authentication or avoid CORS issues. 

This setup allows your static site to display real-time or near-real-time analytics data by fetching it dynamically on the client side, making these tools compatible with the JAMstack pattern and Cloudflare Pages deployments.

Cloudflare Workers act as lightweight serverless functions running at the edge of Cloudflare’s global network. You might need them in your static Astro site on Cloudflare Pages when integrating with analytics tools like Metabase, Redash, or Superset APIs for several reasons:

1. **Handling CORS Restrictions:** Most APIs implement Cross-Origin Resource Sharing (CORS) policies that restrict frontend JavaScript from making direct calls to them from different domains. A Cloudflare Worker can proxy requests from your site to the API, adding the correct CORS headers to allow the browser to accept responses securely.

2. **Securing API Keys or Credentials:** To protect sensitive API keys or authentication tokens from exposure in client-side code, Workers can securely store and inject these keys as they proxy API requests, keeping secrets off the user's browser.

3. **Request/Response Customization:** Workers can modify requests or responses on the fly—such as adding authentication headers, sanitizing data, or caching responses—to optimize data fetching and secure communication.

4. **Edge Performance and Reduced Latency:** By running close to the visitor’s location, Workers can reduce the delay in API calls and improve user experience.

Without Workers, your frontend would need to call APIs directly, which may fail due to CORS, expose secrets, or require cumbersome workarounds.

In summary, Cloudflare Workers provide a secure, performant, and flexible middle layer for API consumption from static sites deployed on Cloudflare Pages, enabling seamless dynamic data fetching while addressing security and browser restrictions.[1][2]

[1](https://www.reddit.com/r/CloudFlare/comments/1hsj5dn/how_to_create_static_content_dynamically_pages/)
[2](https://alexduggleby.com/blog/adding-reverse-proxy-for-astro-sites-on-cloudflare-pages/)


{{% /details %}}


Metabase, Redash, and Superset can all integrate with a purely static Astro site deployed on Cloudflare Pages by exposing REST APIs.

Astro frontend components (React, Svelte, or vanilla JS) can fetch live, parameterized data dynamically from these APIs on client load to update the UI with fresh analytics, fitting the JAMstack pattern.

Cloudflare Workers or Pages Functions are often used in this setup to proxy API calls.

Their purpose is to handle CORS restrictions, securely inject API keys, customize requests/responses, and reduce latency by running closer to users.

> Without Workers, direct frontend API calls may fail due to security policies or secret exposure risks.

This architecture enables static JAMstack sites to serve interactive, real-time analytics by combining static frontend builds with dynamic backend data APIs, secured and optimized via Cloudflare's edge network.

### DB2Rest

What if you have any other DB, like sqlite and you want to expose an API of its data?

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/db2rest" title="DB2Rest | Docker Config 🐋 ↗" >}}
{{< /cards >}}

---

## Conclusions

