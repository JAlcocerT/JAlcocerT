---
title: "What a Year...2025"
date: 2025-12-30
draft: false
tags: ["Year-Review"]
description: 'Looking back to the learnings of the year 2025.'
url: 'tech-recap-2025'
---


**Intro**

This year is been like a lot of [do](https://nav.al/do)

![Me during Y2025](/img/kitten-cat.gif#center)

{{< callout type="info" >}}
After [Weather Planning](https://jalcocert.github.io/JAlcocerT/trip-planner-with-weather/), there are also the **financial aspects of travelling**
{{< /callout >}}

https://echarts.apache.org/en/index.html

* https://github.com/penpot/penpot/blob/develop/docker/images/docker-compose.yaml
* https://snapcraft.io/penpot-desktop

```sh
sudo snap install penpot-desktop
```

https://astro.build/themes/details/photography-portfolio-template/





* https://github.com/OpenInterpreter/open-interpreter

> A natural language interface for computers 



{{< details title="FY24 vs FY25 | Overall📌" closed="true" >}}

**From last year...**

1. Get few more websites going for close people ✅ 
2. Leveraging on AI ✅ *Using Windsurf and Cursor*
3. Doing less in total and more of what has a real impact

Reading: *excuse alert, this is beeen a year mor of creating than consuming*

And that makes...xyz/12 books.

But, I got to know this is possible: https://kindlemodding.org/

{{< /details >}}





## Better Tech Stack

Because Im still in D&A and trying to blend with AI powered development for my personal projects.


1. uv package manager ❤️ Makefiles >>> Readme's & pip! 

2. Pocketbase for BaaS, and a much better understanding of authentication/authorization.

{{< details title="Authentication Flows Working | Example PB vs FastAPI 📌" closed="true" >}}

The key difference between PocketBase and a framework like FastAPI is the level of abstraction and the amount of manual coding required. 

PocketBase is a backend-as-a-service that handles the entire process for you, whereas FastAPI requires you to code each step.

Here is the combined explanation, comparing the authentication flow for both platforms, assuming your frontend is built with Astro.

1. Client Sends Credentials

The user enters their credentials on your login page. The Astro frontend sends a request to your backend.

  * **PocketBase**: The Astro frontend, using the PocketBase JavaScript SDK, makes a single, simple API call. The SDK abstracts the underlying `fetch` request, handling the correct endpoint and request body.
    ```javascript
    // Astro component with JS
    await pb.collection('users').authWithPassword(email, password);
    ```
  * **FastAPI**: Your Astro frontend must manually make a `fetch` request to your custom login endpoint. You are responsible for constructing the URL, body, and headers.
    ```javascript
    // Astro component with JS
    await fetch('http://127.0.0.1:8000/token', {
      method: 'POST',
      body: `username=${username}&password=${password}`
    });
    ```

2. Server Validates Credentials

The backend receives the request and verifies the credentials.

  * **PocketBase**: This step is entirely handled by PocketBase's core logic. The server automatically hashes the provided password and compares it to the hash stored in the `users` collection.
  * **FastAPI**: You must write the code to handle this logic. Using libraries like `passlib` for password hashing and an ORM like `SQLAlchemy` to query your SQLite database, your FastAPI endpoint would:
      * Query the database for the user by username.
      * Retrieve the stored hashed password.
      * Compare the user-provided password with the stored hash.


3. Server Issues the JWT

If the credentials are valid, the server creates and sends a **JWT bearer token** to the client.

  * **PocketBase**: PocketBase automatically generates a **JWT bearer token** with the user's information and a default expiration time. It returns this token in the API response without any manual coding.
  * **FastAPI**: You must manually generate the JWT. Using a library like `python-jose`, your endpoint would:
      * Create a payload with the user's ID and an expiration time.
      * Sign the payload with a secret key using an algorithm like **HS256**.
      * Return the generated token in the JSON response.

4. Client Stores and Uses the Token

The client-side code receives the token and uses it for future requests to protected endpoints.

  * **PocketBase**: The PocketBase SDK automatically stores the received token for you in local storage. For all subsequent requests, the SDK automatically includes the token in the `Authorization` header.
  * **FastAPI**: Your frontend code must manually parse the JSON response, save the token to local storage, and then retrieve it for every `fetch` request to a protected endpoint, manually adding it to the `Authorization` header.

5. Server Validates the Token and Authorizes Access

The backend validates the token and decides whether to grant access to the protected content.

  * **PocketBase**: This is handled automatically. When a request with a bearer token hits a protected collection endpoint, PocketBase automatically validates the token's signature, checks its expiration, and authorizes access based on the **API rules** you've set up in the admin dashboard.
  * **FastAPI**: You must write a **dependency** function that extracts the token from the header, validates it, and handles errors. You then add this dependency to every protected route.

In summary, PocketBase provides a high-level SDK that abstracts the entire process, making it a fast and convenient backend solution.

FastAPI gives you complete control and flexibility but requires you to build the authentication system yourself using third-party libraries and custom code.

{{< /details >}}

> Its all about encryption and SHA256 under the hood!


{{< details title="And things can stay static | If you know about Cloudflare Workers 📌" closed="true" >}}

You can use Cloudflare Workers to act as a **reverse proxy** or a **smart router** that forwards requests to your PocketBase home server.

This is a common and highly effective pattern for self-hosting applications.

**The Role of Cloudflare Workers**

A Cloudflare Worker is a serverless function that runs on Cloudflare's global network, very close to your users. It can intercept incoming traffic and perform logic on it before forwarding the request to your actual server.

When a user tries to access your app's domain, the request goes to the Cloudflare network first, not directly to your home server.

**The Authentication Flow with Workers**

1.  **Client Sends Credentials**: Your Astro frontend sends a request to your custom domain (e.g., `api.yourdomain.com`). This request hits the Cloudflare network.

2.  **Worker Intercepts Request**: Your Cloudflare Worker intercepts the request. Its code's primary job is to act as a **proxy**. It takes the incoming request and forwards it to your PocketBase server running on your home network. It adds the necessary headers and makes sure the connection is secure.

3.  **PocketBase Handles Authentication**: The request reaches your home server. PocketBase handles all the authentication logic as described previously: it validates the credentials, generates the JWT, and sends it back to the Worker.

4.  **Worker Forwards Response**: The Worker receives the response from your PocketBase server and sends it back to the client.

By using Cloudflare Workers and a service like **Cloudflare Tunnel**, you can expose your local PocketBase server to the internet without opening any ports on your home router. Cloudflare Tunnel creates a secure outbound connection from your home server to the Cloudflare network, making your server accessible without exposing its IP address or creating security risks. This is the **best practice** for self-hosting applications.

{{< /details >}}

3. Understanding that [with CSR we can](https://jalcocert.github.io/JAlcocerT/csr-and-js/) keep WebApps simple, yet providing interactivity via API where needed

4. I even got time to clean the IoT/MQTT with micro-controllers :)

5. And tinker a bit with [Crypto](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai)

{{< details title="Crypto is...back? Electrum and DeFi with UniSwap Example📌" closed="true" >}}

> A recap on [BlockChain](https://simplyexplained.com/videos/how-does-a-blockchain-work/)

With KYC both: Binance and Kraken worked fine to me.

> > No keys, no coins - Make sure you understand how wallets work. 

```sh
flatpak install flathub org.electrum.electrum #BTC

flatpak install flathub org.featherwallet.Feather #Monero
#flatpak install flathub org.getmonero.Monero
```

If you ge a Metamask wallet for Ethereum, you can make [a Web3](https://jalcocert.github.io/JAlcocerT/guide-web3/)

DeFi and protocols like UniSwap (v4) give you a lot to think about:

![alt text](/blog_img/crypto/defi/uni-v4-example.png)

{{< /details >}}

6. On the server/homelab side of the things...


{{< details title="FY24 vs FY25 | HomeLab 📌" closed="true" >}}



{{< /details >}}

7. Im still in [D&A](#da-tech-stack) and have take time to sharpen my big data knowledge.

8. Better git *patterns and branching strategies*. Bc the current (and only) reality is main.

9. CLI Agents ftw. Codex CLI was huge. But I also tried claude and geminiCLI. Together with BAML bringing type safe LLM calls.



## Entrepreneuring


* https://fossengineer.com/open-source-invoice-creator/

Contact forms (QR), waiting lists (like the one of astro-nomy theme) and business cards..

Some people have been contacting me via EE registry `https://ariregister.rik.ee/eng/company/`

> Was wondering how were some EE business owner able to get my email?

### Launching Webifyer

One of the skills I enjoy learning more is about photography.

And one of the of the best decisions I ever had, was to have a [Photo Blog](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/).

> Now, you can also tell your story

Check how, *if you are passionate about Photography*

What is this all about?

Web templates (SSG'ed) connected to CMS's.

Because Selfhosting Static Generated Sites, is not a secret anymore:

* 

> MIT | Selfhosting personal static websites with Traefik, private web analytics (matomo) and Remark42 for comments.

{{< cards cols="1" >}}
  {{< card link="https://github.com/ricsanfre/public-websites-docker" title="OpenAI Codex inside a Docker Container Config 🐋 ↗" >}}
{{< /cards >}}


#### Leads and Offers

Linktree does things very well, yet cant compete with:

1. Domain 1sty free with CC required (This is a potential CAC)
2. abcd

## Interesting Concepts

Concepts / ideas that I found during this year.

1. CYA (cover your ***) was always a thing. 

But [BRD/PRD/FRD](https://jalcocert.github.io/JAlcocerT/brd-vs-frd-for-data-analytics/) just takes it to the next level.

2. Its 2025 and now everyones says that it wants AI / [AI|BI](https://jalcocert.github.io/JAlcocerT/ai-bi-tools/) / AIOps / whatever. When it really needs [good'old ML](https://jalcocert.github.io/JAlcocerT/machine-learning-data-analytics/)

3. Declarative vs Procedural

* **Declarative Knowledge (Knowing *What*):** This is factual knowledge. It's about concepts, theories, principles, facts, definitions, and data. It's the "what" and "why" behind things.
    * *Examples:* Knowing the syntax of a programming language, understanding the principles of agile methodology, knowing the capital of France, recalling historical dates, understanding different economic theories.
* **Procedural Knowledge (Knowing *How*):** This is knowledge of how to perform a task or sequence of actions. It's the "how-to." It often involves skills, techniques, processes, and strategies.
    * *Examples:* Writing code in a programming language, facilitating a Scrum meeting, riding a bicycle, cooking a recipe, debugging software, performing a surgical procedure.

4. The woman in the red dress - Matrix

<!-- https://www.youtube.com/watch?v=YgJ5ZEn67tk -->
{{< youtube "YgJ5ZEn67tk" >}}

An example? 

Could [the aissistant](https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main) have any additional feature?

Just not to *leave money on the table*?

> A person cant solve all problems (even less at the same time).

5. System > Goals

Which for me relates with: *More important than the willingness to win, is the willingnes to prepare.*

How would we reach our goals if we do nothing the move our current state closer to it? ah?

Kind of resonates with [process](#processes) > result.

5. Quotes

> One place, not all over the place.

> *What are you afraid of loosing if you wont take any with you?*

> *Punishment fades but reward stayes*

6. Guesstimates and [PostMortems](https://fernandocejas.com/blog/culture/2020-06-21-learn-out-of-mistakes-postmortems/)

7. Business KPIs: CAC, EBITDA, LTV, NRR,...

8. Mental **Obesity**. Which relates with bikeshedding and the [enless student syndrome](https://youtu.be/QFH-_exyNoo?si=yToM8KSBbT0V5xG3)

> Mental obesity (information vs execution) ig post

From the podcast: How to grow from doing hard things ( Huberman Lab x  Michael Easter) https://open.spotify.com/episode/6EDcPmRd6HHh2zdDnapEFS

9. Time is the currency of life

10. Authenticity is how you behave when you have no risk of punishment

11. Some *unrelated* blog & posts:

* https://kerkour.com/writing-against-the-global-lobotomy
* https://levels.io/happiness/
* https://nav.al/existence

12. Cool tinker tech posts


{{< details title="Examples of People Doing Cool Tech Stuff 📌" closed="true" >}}

* https://blog.cavelab.dev/2021/11/wifi-relays-for-ventilation/

{{< /details >}}


## Processes

From Last [year 2024](https://jalcocert.github.io/JAlcocerT/this-year-was-crazy/#next-year)...

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sql-data-analytics/" title="SQL for D&A ↗ " >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/data-basics-for-data-analytics/" title="DataBricks 101 ↗" >}}
{{< /cards >}}

- [ ] Better Webs
- [x] Better AI APIs Usage

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sql-data-analytics/" title="SQL for D&A ↗ " >}}
{{< /cards >}}

- [ ] [x24 Tech Videos](#creating-tech-videos)

> Overkill. I also started [this](https://www.youtube.com/@UnfoldingData/shorts) and [this](https://www.youtube.com/@BeyondAJourney)



### Creating Tech Videos

Last year I set this as a goal.

What exactly were those 24 tech videos to make AI, D&A more accesible: [x]

Along the way, Ive made my life easier by based the video content on a simpler NEW repo: https://github.com/JAlcocerT/Home-Lab

1. [Cloudflare Tunnels](https://www.youtube.com/watch?v=k75PviBQeA0)
2. [OpenAI API Tricks](https://www.youtube.com/watch?v=Yihsci3QcfI)
3. [Redash](https://www.youtube.com/watch?v=_0_Qk0Oleeo) (BI)
4. Apache [Superset](https://www.youtube.com/watch?v=4HUqYbknTOM) (BI)
5. [MinIO](https://www.youtube.com/watch?v=KzZ2zCvHhl0) object storage
6. [JHub](https://youtu.be/VEOyKhgat2Q)
7. [Metabase](https://youtu.be/eCplQYrvabk) (BI)
8. [Grafana](https://youtu.be/Uq5tZv6T3ko) (BI)
9. Kibana (BI) and ES 
10. SelfHosted Streamlit Apps
11. FileBrowser
12. PiGallery
13. Photoview
14. Immich
15. RGallery
16. 
17. 
18. Umami 
19. 
20. 
21. 
22. 
23. 
24. Ventoy. Linux Lite vs Garuda RAM consumption


If this was too much content, you can always use a LLMs to summarize the YT Videos, like these ones:

* https://github.com/jkawamoto/mcp-youtube-transcript

* https://github.com/DevRico003/youtube_summarizer

> MIT | A modern Next.js-based tool for AI-powered YouTube video summarization. This application allows you to generate concise summaries of YouTube videos using different AI models, with support for multiple languages and summary styles.

* https://github.com/Milkshiift/YouTubeTLDR

> MIT | ⚡ A lightweight, self-hosted YouTube video summarizer with Gemini AI

It was a year of a lot of applied AI...

* https://platform.openai.com/docs/models
    * https://platform.openai.com/chat/edit?models=o1

20. N8N
21. ChatWoot
22. LangFlow

23. https://github.com/von-development/awesome-LangGraph

* https://langchain-ai.github.io/langgraph/#


24. 

....

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/" title="OpenAI Codex inside a Docker Container Config 🐋 ↗" >}}
{{< /cards >}}

> Additionally, I participated in *few* tech Talks

1. Using LangChain to chat with a DB
2. Real Estate RAG

### Other Videos

1. AI Powered [shorts](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#ai-powered-shorts)

The TTS capabilities from these were also useful:

* https://aistudio.google.com/generate-speech
* https://platform.openai.com/audio/realtime

> I also came to know: https://github.com/speaches-ai/speaches which is *the ollama for TTS*

2. [ChartJS](https://www.chartjs.org/docs/latest/charts/line.html) Powered Shorts

I also got to know about: https://echarts.apache.org/en/index.html

3. Python powered YT Shorts - @UnfoldingData (PyFinance related via Matplotlib Animations)
3. RemotionJS / Animation powered

### Travel

Combining Tech and Travel to get the most out of them:

* https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/

### Note Taking

Is note taking a waste of time?

The time that you are writing notes, you are not doing new things...

Is note taking just bike-shedding?

> I got to know about the concept during 2024

The power of notes. Without bikeshedding!


### Dev Smart not Hard

Using AI to create more and better, in less time.

The so called, [vibe coding](https://jalcocert.github.io/JAlcocerT/vide-coding/)

> *El relato mata al dato* - Thats also true when looking for new project opportunities

1. Discovering uv as package manager and the power of makefile >>> readme.md code snippets was huge to me.
2. Git power: one action -> one commit + one branch -> one feature + main is the current AND ONLY reality

* See this for branching strategies: https://learn.microsoft.com/en-us/azure/devops/repos/git/git-branching-guidance?view=azure-devops

3. No Nested if's, try -> Error exit with message


#### AI Stuff


* https://github.com/browser-use/browser-use

> MIT |  🌐 Make websites accessible for AI agents. Automate tasks online with ease. 

**More Agents**

* https://github.com/agno-agi/agno

> MPL2 | Full-stack framework for building Multi-Agent Systems with memory, knowledge and reasoning.

You can make interesting conditional logic, like: *If scrap fails, send msg to telegram bot*

#### More Websites!

From:

* https://whilecyclingthere.web.app/
* https://cyclingthere.pages.dev/

To:

* https://beyondajourney.pages.dev/
* https://financemotion.pages.dev/ 

#### Better Social Media

With better video workflow and Postiz for sharing.

### Improving the HomeLab

Ive had time to write few posts about making your selfhosting better.

Together with a better and more organized repository:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Trip Planner Post" image="https://github.com/JAlcocerT/Py_Trip_Planner/raw/main/images/trip-planner-main-graph.png" subtitle="Weather Trends with Python" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs" >}}
{{< /cards >}}
  
That one I want to keep it minimalistic and very simple to replicate.

* https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/
* https://jalcocert.github.io/JAlcocerT/selfhosted-apps-spring-2025/

Ive been taking **inspiration from**:

Thanks to this sites, I get to know more cool apps:

1. https://openalternative.co/self-hosted

* https://github.com/piotrkulpinski/openalternative

> Which can be seen also as an **awsome Astro [project](https://github.com/piotrkulpinski/openalternative)!**

2. https://alternateoss.com/

3. https://youmightnotneed.co/

4. selfhst.st


---

## Conclusions

There was even time to make **[Data Analytics](#da-tech-stack) recaps** and create (not that much ship) [***better* SaaS products**](#shipping-products).


### D&A Tech Stack

I needed to improve my data analytics stack.

Because agents are coming for our jobs: `https://jobforagent.com/`. *The 1st job board for autonomous AI agents* 

https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/" title="Big Data Analytics| Post  ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understanding-google-cloud-platform/" title="GCP | Post ↗" >}}
{{< /cards >}}


{{< details title="The Big Data Tech Stack, more clear than ever 📌" closed="true" >}}

Of course. Here are tables comparing the different components you mentioned across various categories, providing a neck-and-neck look at their features, strengths, and weaknesses.

1. Data Storage 🗄️

This category compares the foundational storage layers of each stack. It's about where your raw data physically resides.

| Criterion | **HDFS** | **S3 / GCS** | **MinIO** |
| :--- | :--- | :--- | :--- |
| **Type** | Distributed File System | Cloud Object Store | Self-hosted Object Store |
| **Architecture** | Coupled Storage & Compute. Data is stored on the same nodes that process it. | Decoupled Storage & Compute. Storage and processing scale independently. | Decoupled Storage & Compute. Runs on your infrastructure but separates the two functions. |
| **Deployment** | On-premise or in the cloud (IaaS) requiring manual management. | Fully managed cloud service. | Self-hosted on-premise or in any cloud (IaaS). |
| **Scalability** | Scales horizontally by adding more servers to the cluster. | Virtually infinite scalability. You simply use as much as you need. | Horizontally scalable by adding more hardware to your cluster. |
| **Cost** | High initial hardware cost and ongoing operational overhead. | Pay-as-you-go based on storage volume and data access. | Low hardware cost (commodity servers) but high management overhead. |
| **Primary Use Case**| Legacy on-premise batch processing and big data analytics. | Modern cloud data lakes and object-based storage for any data type. | Building a private cloud data lake or avoiding cloud vendor lock-in. |


2. Data Transformation & Orchestration ⚙️

This table compares the tools that handle the "T" (transformation) and "E" (orchestration) parts of the ELT/ETL process.

| Criterion | **Dataform** | **dbt** | **PySpark** | **ADF** |
| :--- | :--- | :--- | :--- | :--- |
| **Core Function** | SQL-based transformation for BigQuery. | SQL-based transformation for any cloud warehouse. | Code-based (Python) distributed data processing. | Visual ETL/Orchestration. |
| **Orchestration** | Basic built-in scheduler. Best used with Cloud Composer. | Basic built-in scheduler. Best used with Airflow. | Requires a separate orchestrator like Airflow or a managed service like Dataproc. | Has a robust, built-in orchestrator with a GUI. |
| **Primary Language**| SQLX (Superset of SQL). | SQL (with Jinja). | Python (with Spark SQL). | Visual GUI (with some SQL/code). |
| **Flexibility** | Limited to BigQuery and SQL-based transformations. | Highly flexible; works with most modern data warehouses. | Highly flexible; can handle complex logic and ML pipelines. | Highly integrated with Azure. Can connect to many sources. |
| **User** | Data Analysts & Analytics Engineers on GCP. | Analytics Engineers & Data Analysts. | Data Engineers & Data Scientists. | Data Engineers & Business Users. |


3. Query Engines & Data Warehouses 📦

This compares the tools that serve as the compute and storage layers for analytics.

| Criterion | **BigQuery** | **Snowflake** | **Trino** | **Spark** |
| :--- | :--- | :--- | :--- | :--- |
| **Type** | Serverless Data Warehouse | Cloud Data Warehouse | SQL Query Engine | General-Purpose Analytics Engine |
| **Architecture** | Separated storage and compute, managed by Google. | Separated storage and compute, managed by Snowflake. | Separate compute layer that queries multiple data sources. | Separate compute layer for distributed processing. |
| **Deployment** | Fully managed service on GCP. | Fully managed service (multi-cloud). | Self-hosted on-premise or in the cloud. | Self-hosted on a cluster or via managed service (e.g., GCP Dataproc). |
| **Primary Use Case**| Scalable, serverless analytics on a massive scale. | Enterprise-grade data warehousing for structured data. | Federated queries across diverse data sources. | ETL, machine learning, and complex transformations. |


4. BI & Visualization 📈

This category compares the tools used by end-users to create dashboards and reports.

| Criterion | **Looker** | **Superset / Redash** | **Grafana** |
| :--- | :--- | :--- | :--- |
| **Core Function** | Semantic Modeling & Visualization. | Visualization & Ad-hoc Querying. | Time-series Monitoring & Visualization. |
| **Data Philosophy**| **Code-first semantic layer**. Data is modeled in LookML for consistency. | **SQL-based visualization**. Users often write their own queries or work from a pre-defined set of queries. | **Monitoring-focused**. Optimized for time-series data from a variety of data sources. |
| **User** | Data Analysts & Business Users. | Data Analysts & SQL-savvy users. | DevOps & Engineers (for system metrics). |
| **Collaboration** | Highly collaborative via Git integration. | Collaborative dashboards via sharing. | Collaborative dashboards and alerting. |
| **Ecosystem** | Google Cloud's official BI tool. | Open-source, flexible, and database-agnostic. | Open-source, widely used for observability and metrics. |

5. Table Format & Catalog 📋

Apache Iceberg and Project Nessie are key components of a modern, open-source data lakehouse architecture. They don't fit neatly into the previously defined categories because they represent a different layer of the stack: **the table format and the catalog**.


This category compares the tools that bring structure, transactions, and version control to a data lake.

| Criterion | **Apache Iceberg** | **Project Nessie** |
| :--- | :--- | :--- |
| **Type** | Open-source **Table Format** | Open-source **Data Catalog** |
| **Core Function** | Defines how data files in a data lake are organized to act as a database-like table. | A Git-like central registry for managing metadata and versions for all your tables. |
| **Primary Use Case**| Enables ACID transactions, time travel, and schema evolution on a single table in a data lake. | Manages multi-table transactions, data branching, and version control for the entire data lake. |
| **Data Philosophy**| Brings database-like reliability and performance to data lakes. | Brings software development best practices (Git) to data management and governance. |
| **Relationship** | **A table format.** It's the "engine" that enables a single table to have ACID properties and time travel. | **A catalog.** It's the "control plane" that manages the state of many Iceberg tables using branches, commits, and tags. |
| **Deployment** | Not a service. It's a library or a specification used by engines like Spark, Flink, and Trino. | Can be run as a Docker container, on Kubernetes, or as a managed service. |
| **Who Uses It** | Data Engineers & Analytics Engineers. | Data Engineers, Analytics Engineers, & Data Scientists (for branching). |


{{< /details >}}

{{< details title="Nessie and Apache Iceberg were really cool 📌" closed="true" >}}

Project Nessie and Apache Iceberg are designed to work very well together, and Nessie can indeed be used on top of Iceberg. 

* **Apache Iceberg:**
    * This is a table format for massive analytic datasets. It brings table-like capabilities to data lakes, enabling features like ACID transactions, schema evolution, and time travel.
    * Essentially, Iceberg helps organize your data lake into tables that behave more like traditional database tables.
* **Project Nessie:**
    * Nessie provides Git-like version control for your data lake. It allows you to create branches, commits, and tags for your data, making it easier to manage changes and collaborate.
    * In the context of Iceberg, Nessie acts as a catalog that tracks the metadata of your Iceberg tables. This allows you to version the state of your tables, not just the underlying data files.

**How They Work Together:**

* Nessie enhances Iceberg by providing a way to manage the metadata of Iceberg tables. This means you can:
    * Create branches to experiment with data transformations without affecting the production data.
    * Roll back to previous versions of your tables if needed.
    * Collaborate with others by merging changes from different branches.

> In essence, Iceberg provides the table format, and Nessie provides the version control layer on top of those tables. 

> > This combination creates a powerful and flexible **data lakehouse architecture**.

{{< /details >}}


{{< details title="Nessie and Apache Iceberg were really cool | HDFS and PySpark 📌" closed="true" >}}

Project Nessie and Apache Iceberg are designed to work very well together, and Nessie can indeed be used on top of Iceberg. 

* **Apache Iceberg:**
    * This is a table format for massive analytic datasets. It brings table-like capabilities to data lakes, enabling features like ACID transactions, schema evolution, and time travel.
    * Essentially, Iceberg helps organize your data lake into tables that behave more like traditional database tables.
* **Project Nessie:**
    * Nessie provides Git-like version control for your data lake. It allows you to create branches, commits, and tags for your data, making it easier to manage changes and collaborate.
    * In the context of Iceberg, Nessie acts as a catalog that tracks the metadata of your Iceberg tables. This allows you to version the state of your tables, not just the underlying data files.

**How They Work Together:**

* Nessie enhances Iceberg by providing a way to manage the metadata of Iceberg tables. This means you can:
    * Create branches to experiment with data transformations without affecting the production data.
    * Roll back to previous versions of your tables if needed.
    * Collaborate with others by merging changes from different branches.

> In essence, Iceberg provides the table format, and Nessie provides the version control layer on top of those tables. 

> > This combination creates a powerful and flexible **data lakehouse architecture**.

* **HDFS + PySpark:**
    * This is a more traditional big data stack, often used in on-premises deployments. HDFS stores the data, and PySpark allows for Python-based data processing.

* **Databricks + S3:**
    * This is a common cloud-based stack. Databricks provides the processing power (Spark), and S3 serves as the scalable data lake.

* **MinIO + Apache Iceberg + Nessie:**
    * This stack focuses on open-source technologies. MinIO provides object storage, Iceberg enables efficient data lake management, and Nessie adds version control (and time travel)

{{< /details >}}


{{< details title="Core Components of a Data Analytics Tech Stack 📌" closed="true" >}}

* **Data Storage:**: This is where the raw and processed data resides. Common options include:
    * **Cloud Storage:** Amazon S3, Google Cloud Storage (GCS), Azure Blob Storage.
        *  These are highly scalable and cost-effective **object stores** that serve as the foundation of cloud-native **data lakes**.
        * **Object Storage:** MinIO, which is an open source object storage solution that is S3 API compatible.
    * **Data Lakes:** HDFS (Hadoop Distributed File System), which is often used in on-premises or hybrid environments.
        * You will find format like: `avro`, `parquet` and `delta`.
    * **Data Warehouses:** Snowflake, Google BigQuery, Amazon Redshift or Azure Synapse. These are optimized for analytical queries.

* **Data Processing:**  These tools transform and prepare data for analysis:
    * **Apache Spark:** A powerful distributed processing engine used for large-scale data transformation and analysis. It includes modules like **Spark SQL** for structured data, **Spark Streaming** for real-time data, and **MLlib** for machine learning.
    * **Databricks:** A cloud-based platform built on Apache Spark, providing a collaborative environment for data engineering, data science, and machine learning. 
        * It also offers features like **Delta Lake** for data reliability and **MLflow** for managing the machine learning lifecycle.
    * **SQL-based tools:** These are essential for querying and manipulating data in data warehouses. This category includes modern tools that use SQL for transformations:
        * **dbt (data build tool):** A transformation tool that enables data analysts and engineers to transform data in their data warehouses more effectively. It allows for modular SQL code and follows software engineering best practices.
            * Dbt wont move the data for you, so you need an orchestration tool like ADF or TalenD
        * **Dataform:** Google's equivalent of dbt, used for transforming data in BigQuery using **SQLX**.

* **Data Orchestration:**
    * These tools manage the flow of data through the pipeline:
        * **Apache Airflow:** A platform for programmatically authoring, scheduling, and monitoring workflows.
            * It defines pipelines as **Directed Acyclic Graphs (DAGs)**.
        * **Cloud Composer:** Google Cloud's fully managed version of Apache Airflow, which simplifies its deployment and management.
        * **Azure Data Factory (ADF):** Microsoft's visual ETL and orchestration service, offering a code-free approach to building data pipelines within the Azure ecosystem.

* **Data Catalog and Governance:** These tools help manage and govern data assets:
    * **Apache Iceberg:** An open table format for large analytic datasets. It provides features like **ACID transactions**, schema evolution, and time travel.
        * See also Delta Lake Format: https://delta.io/ which is some kind of .parquet with enhance time travel capabilities
    * **Project Nessie:** Provides **Git-like capabilities** (branches, commits, tags) for data lakes, working in conjunction with table formats like Apache Iceberg to provide full data versioning and governance.
    * **Apache Hive Metastore:** A central repository for metadata, primarily used in the Hadoop ecosystem. It stores schema and location information for Hive tables.

```py
df = spark.read 
    .format("delta")
    .option("timestampAsOf", "2025-12-01") 
    .load("/path/to/my/table") 
```

* **Data Visualization and Business Intelligence (BI):**
    * These tools allow users to explore and visualize data:
        * **Tableau, Power BI, Looker:** Popular BI platforms for creating dashboards and reports.

**Key Considerations:**

* The choice of tech stack depends on factors such as:
    * The volume and velocity of data.
    * The specific analytical needs of the organization.
    * Budget constraints.
    * Whether the deployment is on-premises, cloud-based, or hybrid.


{{< /details >}}


{{< callout type="info" >}}
You can plug to those stacks interesting tools like superset or ([Open Data Hub](https://datahubproject.io/docs/docker/))
{{< /callout >}}

### Shipping Products


This year, It's been more building than shipping.

If you are successful, you will need to know [how to use Stripe API](https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#stripe) and any form of invoicing customers:

* https://fossengineer.com/open-source-invoice-creator/

* https://github.com/Impre-visible/invoicerr

> agpl 3.0 | Invoicerr is a freelance-focused invoicing app that lets you create quotes, generate invoices, track payments, and collect secure signatures.


### Outro

* https://jalcocert.github.io/JAlcocerT/making-soap-at-home/