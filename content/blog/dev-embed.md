---
title: "Everything can be embeded. OpenAI Agent Builder."
date: 2025-09-30T08:20:21+01:00
draft: false
tags: ["n8n vs Flowise","ChatWoot vs PaperCups","SolidTime","Embeded Analytics","DB2REST","OpenAI ChatKit"]
url: 'embed-that'
description: 'Enhance your Websites - Chatbots > Live Chats  > > Whatsapp bouble or cal'
---


**Tl;DR**



**Intro**

Chatwoot has some basic CRM features (contact management, conversation history) but is mainly a helpdesk and messaging platform, not a dedicated CRM.


### Chatbots

* https://github.com/emcie-co/parlant
  * https://github.com/emcie-co/parlant-chat-react

>  LLM agents built for control. Designed for real-world use. Deployed in minutes. 

#### Flowise

![Flowise Chatflow](/blog_img/selfh/flowise-chatflows.png)

![Flowise Chatflows UI](/blog_img/selfh/flowiseai-ui-workflows.png)


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/flowise-ai" title="FlowiseAI | HomeLab Configs 🐋 ↗" >}}
  {{< card link="" title="Recent FlowiseAI x Gitea | Post ↗" >}}
{{< /cards >}}

Remember that there is a Flowise Python SDK, that you could connect, [for example to Streamlit](https://jalcocert.github.io/JAlcocerT/flowise-and-gitea/#flowise-x-python-sdk).

See a [example](https://github.com/HenryHengZJ/flowise-streamlit/blob/main/.streamlit/secrets_example.toml) and the [flowise docs](https://docs.flowiseai.com/integrations/3rd-party-platform-integration/streamlit)

<!-- https://www.youtube.com/watch?v=XOeCV1xyN48 -->

But most importantly, can flowise be embeded into a website and reply to business questions?

<!-- https://www.youtube.com/watch?v=XOeCV1xyN48 -->

{{< youtube "XOeCV1xyN48" >}}


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

1. https://github.com/symbiosika/n8n-embedded-chat-interface - *A simple Chat interface to embed on your website to chat with an n8n AI Flow*
2. https://www.npmjs.com/package/@n8n/chat?activeTab=readme

<!-- https://www.youtube.com/watch?v=4VD-6dFQJsk -->

{{< youtube "4VD-6dFQJsk" >}}

This thing can even work with whatsapp:

<!-- 
https://youtu.be/J08qIsBXs9k?si=f3NfUQtsWXm6W31o 
-->


{{< youtube "J08qIsBXs9k" >}}

#### OpenAI Agent Builder

I recently read: https://openai.com/index/introducing-agentkit/

OpenAI Agent Builder is a visual, drag-and-drop platform for creating and managing multi-step AI agent workflows without needing to write code from scratch. 

It uses nodes representing different functions—such as calling language models, connecting to external tools or services, adding conditional logic, data transformation, and safety guardrails—that users link together to design complex AI agents and automations.

Key features include:

- A visual canvas for building and versioning AI workflows.
- Support for multi-agent orchestration and branching logic.
- Integration with external or internal company tools via MCP (Managed Connector Protocol) servers instead of traditional APIs or webhooks.
- Ability to add conditional branches (If/Else), loops, and human-in-the-loop approvals.
- Exporting the created agent workflows as code (TypeScript/Python) for further customization.
- Deployable through OpenAI’s ChatKit for embedding in chat applications, or standalone via SDK.

Agent Builder suits both developers and non-technical users: non-coders can quickly build basic agents with drag-and-drop nodes, while developers can export and expand code. It accelerates AI agent development by simplifying workflow composition while ensuring production-ready standards with guardrails for safety, moderation, and data handling.

Example use case: building a customer service agent with intent classification, conditional routing, and specialized responses with rich outputs, all visually composed and tested before deployment.

In summary, OpenAI Agent Builder democratizes AI agent creation by making it fast, code-light, and flexible, supporting sophisticated AI-driven workflows that integrate seamlessly with a range of external systems.[4][5][6]

[1](https://openai.com/index/introducing-agentkit/)
[2](https://developers.openai.com/tracks/building-agents/)


https://platform.openai.com/docs/guides/agent-builder

<!-- https://www.youtube.com/watch?v=RBlHcHUvFKY -->

{{< youtube "RBlHcHUvFKY" >}}




Yes, you can embed an OpenAI Agent built with the Agent Builder using tools like the ChatKit widget or through the Agent Builder's SDK. 

The platform allows you to create interactive agents with customizable workflows and output formats such as widgets that can be embedded within applications or chat interfaces.

However, there are some current limitations, such as incomplete support for workflows involving MCP nodes in the SDK, and the system primarily supports OpenAI models, which may influence flexibility.

If you want to integrate these agents into your own product or website, you can use the provided embedding options from the Agent Builder, such as embedding interactive widgets or leveraging the SDK once it supports your desired features.

Keep in mind that this technology is still evolving and some functionality may improve or expand in the near future.[1]

OpenAI Agent Kit vs...n8n?

<!-- https://www.youtube.com/watch?v=XeIx4S6YvGo -->

{{< youtube "XeIx4S6YvGo" >}}


<!-- https://x.com/akshay_pachaar/status/1866822826696773747 -->

{{< tweet user="akshay_pachaar" id="1866822826696773747">}}


https://platform.openai.com/docs/guides/chatkit

https://platform.openai.com/docs/guides/chatkit#add-chatkit-to-your-frontend

https://widgets.chatkit.studio/gallery/card

https://github.com/openai/openai-chatkit-advanced-samples

https://openai.github.io/chatkit-python/server/

#### CopilotKit

* https://github.com/copilotkit/copilotkit

>  **MIT** | React UI + elegant infrastructure for AI Copilots, AI chatbots, **and in-app AI agents**. The Agentic last-mile 🪁 

<!-- https://www.youtube.com/watch?v=9v3kXiOY3vg -->

{{< youtube "9v3kXiOY3vg" >}}


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

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Chats/Chatwoot" title="ChatWoot with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/Chatwoot" title="ChatWoot HomeLab | Docker config 🐋 ↗" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/free-open-source-chat-bots/#chatwoot" title="OSS Live Chat - Chatwoot" image="/blog_img/entrepre/chatwoot_livechat.png" subtitle="Tinkering with ChatWoot" >}}
{{< /cards >}}


It **centralizes conversations from channels** like web chat, email, and social media, helps manage tickets, stores customer contact details, provides analytics, and supports automation features like chatbots.

You can say that its OSS [ZenDesk](https://www.zendesk.com/service/): *You ask something via email and the CS team will handle it*

However, while Chatwoot includes **some CRM-like capabilities**—such as managing and viewing customer profiles, conversation history, and team collaboration—it does not offer the depth of sales pipeline management, deal tracking, or marketing automation found in specialized CRM software like Salesforce or HubSpot. 

> Chatwoot can integrate with actual CRM systems to synchronize customer data for a more complete workflow.

> > Like to Odoo or [GHL some marketers use](https://jalcocert.github.io/JAlcocerT/software-for-marketing-agencies/#ghl)

**Who is using chatwoot**?

1. The people of Monero (when you disable privacy badger in FF) https://monero.com/wallets#
2. https://www.solidtime.io/

> This is a [Selfhosted](https://github.com/topics/self-hosted) & [OSS](https://docs.solidtime.io/self-hosting/intro) https://github.com/solidtime-io/solidtime with cool time tracking and invoicing features

### How to Embed ChatWoot into a Website

If you already have your Wordpress / Ghost / SSG site ready, get the js script from your Chatwoot instance and include it in your website body.

{{< dropdown title="Chatwoot + Astro 👈 " closed="true" >}}

* <https://www.chatwoot.com/docs/product/channels/live-chat/create-website-channel>
  * Then, copy the Configuration Messenger script (adapt the :3000 *or the one you chose* port, if needed)
    * Find `base-layout.astro` - Include it before </body>

{{< /dropdown >}}

#### PaperCups

* https://github.com/papercups-io/papercups

> MIT | Open-source **live customer chat** 

#### LiveHelperChat

* https://github.com/LiveHelperChat/livehelperchat

> Apache v2 |  Live Helper Chat - live support for your website. Featuring web and mobile apps, Voice & Video & ScreenShare. Supports Telegram, Twilio (whatsapp), Facebook messenger including building a bot. 

#### Whatsap bouble

Or just... https://github.com/JAlcocerT/just-ssg/tree/main/astro-ssg/whatsapp-bouble

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docplanner-web-migration/" title="Embedded WA Bouble" image="/blog_img/web/astro-whatsapp-bouble.png" subtitle="Creating an Astro WA Bouble" >}}
{{< /cards >}}

WA, but also calcom bouble could be embeded:

![Astro Theme + Boubles](/blog_img/web/astro/astro-wa-cal-bouble.png)

{{< youtube id="qFMN0oDeCFg" autoplay="false" >}}


## Embedded Analytics

Few months ago, I [read about Latitude](https://jalcocert.github.io/JAlcocerT/live-search-and-research-with-ai/#gaps-to-cover).

But not the prompt engineering platform, the embedded analytics one: https://github.com/latitude-dev/latitude

> Which is ofc, no longer mantained as now its all about agents :)

> > https://docs-analytics.latitude.so/guides/getting-started/introduction


### Graphic Walker

It works for Streamlit as PyGWalker.

But the native project is: https://github.com/Kanaries/graphic-walker

> Apache v2 |  An open source alternative to Tableau. **Embeddable visual analytic** 



{{< details title="Graphic Walker x Astro SSG 📌" closed="true" >}}

Yes, that summary is **true** and accurately describes how you would use a library like Graphic Walker within a Static Site Generator (SSG) environment like Astro.

Here is why each point holds true:

1. Core Functionality (No Forced API)

**Graphic Walker is Client-Side and Data-Driven:** Graphic Walker (like many embeddable visualization tools) is a library that runs entirely on the user's browser (client-side).

It takes a **dataset** as its primary input (typically a JSON array or CSV string passed as a prop). It doesn't inherently contain any logic that requires a dynamic API connection to function.

If you give it static data, it will work statically.

2. Static Site Generation (Astro SSG)

The process described is perfectly compatible with the **Static Site Generation (SSG)** model:

* **Build Time Data Injection:** When you use Astro (or Next.js/Gatsby in SSG mode), your server-side build process executes your code. It loads your static dataset (e.g., a local JSON file). This data is then serialized and passed as the initial `prop` to the Graphic Walker React component.

* **Static HTML Output:** The resulting HTML file that Astro generates includes the entire structure of the webpage *and* the full dataset embedded as a JavaScript variable or prop value within the page.

* **Client-Side Hydration:** When a user visits the site, the browser loads the static HTML. Then, the JavaScript bundle (including Graphic Walker's code) runs, reads the embedded static data, and activates (or "hydrates") the component, performing the actual dynamic chart rendering and providing interactivity (like filtering, zooming, and scrolling) locally on the client's device.

This approach gives you the **performance benefits of a static site** (fast load time, no live server needed for data) while retaining the **interactivity of a modern web application.**

{{< /details >}}

You could also think to bring some [APIs](#dbs-to-api) to this game.

### Metabase Embedded

Metabase, Redash, and Apache Superset [BI Tools](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/) can potentially be embeded:

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

See how to setup Superset:

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

In summary, all three tools support API-driven dynamic data fetching compatible with a static Astro site on Cloudflare Pages, enabling components to update data on visitor load using client-side API requests and optionally Cloudflare edge functions for proxying/auth.

Yes, Metabase, Redash, and Superset all provide REST APIs that can be used to fetch updated data dynamically from a static Astro site deployed on Cloudflare Pages. 

The typical approach is to have your Astro frontend components (React, Svelte, or vanilla JS) make client-side API calls to these platforms' API endpoints to retrieve the latest query or dashboard data when visitors load the site.

You can use Cloudflare Pages Functions or Workers to proxy these API calls if needed to handle authentication or avoid CORS issues. 

This setup allows your static site to display real-time or near-real-time analytics data by fetching it dynamically on the client side, making these tools compatible with the JAMstack pattern and Cloudflare Pages deployments.

Cloudflare Workers act as lightweight serverless functions running at the edge of Cloudflare’s global network.

You might need them in your static Astro site on Cloudflare Pages when integrating with analytics tools like Metabase, Redash, or Superset APIs for several reasons:

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

### DBs to API

In case you like  J**A**MStack, you will want to create easily APIs from your data.

You could go for some code solutions, like using [FastAPI](https://jalcocert.github.io/JAlcocerT/audio-recap/)...

[FastAPI](https://jalcocert.github.io/JAlcocerT/fast-api/) is a modern, high-performance Python web framework for building APIs quickly and efficiently. Unlike purely no-code solutions, FastAPI requires coding but offers great flexibility and control.

- **Custom API development:** FastAPI allows developers to create fully customized REST APIs tailored exactly to their use case, including complex business logic, validation, security, and asynchronous processing.

- **Database integration:** FastAPI can be easily integrated with ORMs like SQLAlchemy or Tortoise ORM to connect to databases like PostgreSQL, MySQL, SQLite, and others. This requires writing code but enables precise control over queries and transactions.

- **Performance:** FastAPI is built on ASGI and uses Python type hints to provide excellent performance close to Node.js or Go frameworks, suitable for production workloads.

- **Flexibility and extensibility:** It supports middlewares, dependency injection, background tasks, and seamless OpenAPI (Swagger) generation for API documentation.


But if you want some low/no-code solution see these.

There are several open-source projects similar to DB2Rest that provide no-code or low-code ways to instantly expose databases as REST APIs:

- **NocoDB**: An open-source Airtable alternative that transforms SQL databases like MySQL and PostgreSQL into a spreadsheet-like interface and auto-generates REST APIs. It is self-hostable and provides a user-friendly UI for database interactions.

- **DreamFactory**: A powerful open-source platform that auto-generates REST APIs for over 20 SQL and NoSQL databases. It supports authentication, role-based access controls, and API documentation.

- **Baserow**: An open-source no-code platform primarily focused on building databases and applications with PostgreSQL support. It generates APIs and offers a simple UI.

- **Llana**: A no-code API wrapper that exposes REST APIs over any database quickly. Open source and designed to avoid vendor lock-in.

- **Hasura**: Primarily a GraphQL engine that generates real-time APIs over SQL databases like Postgres, with partial REST-like API support. It has advanced permissions and real-time capabilities.

- **MongoDB Atlas App Services**: If using MongoDB, it provides native REST API exposure, authentication, triggers, and real-time sync features.

These tools cater to various needs, from lightweight data management and dashboards to building complex real-time APIs and AI workflows. 

They significantly simplify API development for databases without writing backend code and often include features like authentication, role-based access, and auto API documentation.


#### DB2Rest

What if you have any other DB, *like sqlite* and you want to expose an API of the data contained?

* https://github.com/9tigerio/db2rest

> Instant no code DATA API platform. Connect any database, run anywhere. Power your GENAI application function/tools calls in seconds.

DB2Rest is blazing fast - It has no Object Relational Mapping (ORM) overhead, uses Single round-trip to databases, no code generation or compilation, and supports Database Query Caching and Batching.

* https://github.com/9tigerio/db2rest
  * https://db2rest.com/docs/run-db2rest-on-docker

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/db2rest" title="DB2Rest with Docker 🐋 ↗" >}}
{{< /cards >}}

> Apache v2 | Instant no code **DATA API platform**. Connect any database, run anywhere. Power your GENAI application [function/tools calls](https://jalcocert.github.io/JAlcocerT/how-to-use-openai-function-calling/) in seconds.


[DB2Rest](https://github.com/9tigerio/db2rest) is part of a growing ecosystem of no-code/open-source tools that make exposing databases via REST APIs much easier and faster.

> With awsome [docs](https://db2rest.com/docs/intro)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/db2rest" title="DB2Rest | Docker Config 🐋 ↗" >}}
{{< /cards >}}

DB2Rest stands out among REST-for-database tools primarily due to its no-code, low-overhead approach that instantly creates secure REST APIs for databases without using Object Relational Mapping (ORM), code generation, or compilation.

This makes DB2Rest particularly fast and simple to deploy, offering significant acceleration in application development—claimed up to 30 times faster—by removing the boilerplate code typically required for database access.

It supports key features such as multi-database connectivity, query caching, batching, transaction management, and secure data exchange.

Compared to other REST database tools that may require ORM or more complex setups, DB2Rest focuses on ease of use, blazing fast performance with a single database round-trip per request, and seamless integration with modern AI systems like language models and vector stores for intelligent applications. 

It also works as a secure database gateway, minimizing risks like SQL injection and adhering to database user access controls for security.

Other database REST service tools, such as IBM Db2 native REST services, provide native, DBMS-integrated REST capabilities often tied to specific database systems with features like service versioning and tight integration with enterprise ecosystems. 

While such solutions are powerful for their environments, DB2Rest's strength lies in its flexibility across databases, simplicity, and no-code generation philosophy.


| Feature                  | DB2Rest                               | Typical Other REST DB Tools                        |
|--------------------------|-------------------------------------|--------------------------------------------------|
| Code generation          | None (no-code, no ORM)               | Often requires ORM or code generation             |
| Performance              | Very fast, single round trip         | May have ORM overhead or multiple query calls     |
| Multi-database support   | Yes, easily integrated               | Often limited to single DB or requiring more setup|
| Security                 | Secure gateway, follows DB roles     | Varies, some tightly coupled to DB security       |
| Ease of use              | Simple config, no coding needed      | Often requires coding or complex configuration    |
| AI/modern integrations   | Supports vector DBs and LLMs         | Rarely supported                                  |
| Deployment flexibility   | On prem, VM, Docker, Kubernetes      | Typically tied to DB ecosystem                     |

This makes DB2Rest an excellent choice for rapid API creation, modern AI integrations, and simplifying legacy database access without complex development overhead, compared to more traditional or native DB REST services.


#### Llana

See also https://github.com/juicyllama/llana

>  API Wrapper for Databases - Llana is a no-code API wrapper that exposes a REST API for any database within minutes. 

No longer spend time building APIs, just connect your database and start using the API. Open source, free to use, and no vendor lock-in. 

<!-- https://www.youtube.com/watch?v=-UjN8PEDpRQ -->

{{< youtube "-UjN8PEDpRQ" >}}


#### How to use Soul

* https://github.com/thevahidal/soul

> MIT | **Automatic SQLite RESTful** and realtime API server | Build CRUD APIs in minutes! 

```sh
#npm install -g soul-cli

git clone job-trends

soul -d sqlite.db -p 8000 #8045 # http://localhost:8045/api/
#Warning: Soul is running in open mode without authentication or authorization for API endpoints. Please be aware that your API endpoints will not be secure.


#soul -d job_offers_v3.db -p 8045
#curl http://localhost:8045/api/tables

curl http://localhost:8000/api/tables
```