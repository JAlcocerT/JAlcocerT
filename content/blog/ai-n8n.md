---
title: "Just n8n, MCP and AI workflows"
date: 2025-09-19
draft: false
tags: ["n8n AI Chat","PlayWright MCP","n8n vs Huggin vs flowise"]
description: 'Having fun with n8n.'
url: 'n8n-with-ai'
---

**Tl;DR**

Putting together content for a sync with 2 marketers.

**Intro**

I recently discovered about: https://chat.soula.ge/ and `https://vp.soula.ge/`

> Chat with Your n8n Workflows

> > Transform complex automation into natural conversations. Connect up to 9 webhooks and manage your workflows through an intelligent chat interface.



## Just use n8n

Meaning: dont drag and drop, ask the AI to build your xflows :)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Btw, [marketer](https://jalcocert.github.io/JAlcocerT/social-media-automation/#conclusions): you can be interested in these web automation tools.

And probably, you are using [these tools](https://jalcocert.github.io/JAlcocerT/social-media-automation/#scrapping-social-media) for leads, but not [these for scrapping](https://jalcocert.github.io/JAlcocerT/how-to-browse/#scrapping-recap).

Neither using [AI for audio related](#n8n-x-firefliesai) task.

What's the common factor?

That you can plug them all to your N8N.

### n8n x FirefliesAI

Lately I was playing with [AI Audio here](https://jalcocert.github.io/JAlcocerT/audio-recap/#tools-for-meetings).

And decided to get access to: https://app.fireflies.ai/

The decision among other [tools for meetings](https://jalcocert.github.io/JAlcocerT/audio-recap/#tools-for-meetings)?

Because it can be integrated easily with n8n.

* https://guide.fireflies.ai/articles/4758387081-learn-about-n8n-x-fireflies-integration


![Fireflies AI has n8n integration](/blog_img/GenAI/n8n/n8n-audio-fireflies.png)

To integrate Fireflies.ai with n8n, follow these general steps to automate meeting workflows, retrieve transcripts, and analyze meeting data:

1. **Get Fireflies API Access:**
   - Sign up or log into Fireflies.ai.
   - Obtain your Fireflies API key from the Fireflies developer or integration settings.
   - https://docs.fireflies.ai/getting-started/quickstart#step-2%3A-making-your-first-request

```sh
curl \
   -X POST \
   -H "Content-Type: application/json" \
   -H "Authorization: Bearer your_api_key" \
   --data '{ "query": "{ users { name user_id } }" }' \
   https://api.fireflies.ai/graphql
```

Just go to https://app.fireflies.ai/settings and get that API key.

2. **Add Fireflies Node in n8n:**
   - In your n8n workflow editor, search for the Fireflies node (official Fireflies.ai integration exists).
   - Add the Fireflies node to your workflow.

3. **Configure Fireflies Node:**
   - Connect your Fireflies account by entering the API key.
   - Choose the desired Fireflies action, such as:
     - Fetch meeting transcripts.
     - Get meeting summaries.
     - Upload audio files for transcription.
     - Fetch meetings or speaker insights.

4. **Build Workflow Automation:**
   - Combine Fireflies actions with other n8n nodes (like Slack, Gmail, Notion, Google Sheets) to automate your work.
   - For example, set a trigger on meeting completion to automatically fetch the transcript and post a summary to Slack or save it to Notion.

5. **Test and Activate Workflow:**
   - Test the workflow to ensure connectivity and correct retrieval of data.
   - Activate the workflow for automatic processing.

There are also pre-built templates and community workflows on n8n.io that integrate Fireflies for common use cases, helping speed up setup.

This native integration allows meeting data from Fireflies.ai to flow seamlessly into other apps via n8n’s automation platform, boosting productivity.[1][2][3]

[1](https://guide.fireflies.ai/articles/4758387081-learn-about-n8n-x-fireflies-integration)
[2](https://github.com/firefliesai/n8n-nodes-fireflies)
[3](https://n8n.io/integrations/fireflies/)


### n8n x Perplexity

Yes, Perplexity can be integrated with n8n.

n8n offers a dedicated Perplexity node that allows users to automate interactions with Perplexity's AI models within workflows. 

This integration supports sending prompts to Perplexity's large language models and receiving chat completions, enabling automation of tasks such as content generation, research, and data analysis directly within n8n.[1][2][3]

Integration Methods

- **Native Perplexity Node in n8n**: Provides easy setup for messaging models, customizing parameters, and managing API keys in n8n workflows.[3]
- **Community Node**: There is also a community-maintained n8n node for Perplexity available via npm, which supports multiple models and chat completion features.[4]
- **HTTP Request Node**: If the native node does not fulfill specific needs, you can use n8n’s HTTP Request node to make direct API calls to Perplexity using the official API key.[5]
- **Workflow Examples**: Tutorials and templates exist for building AI-powered research assistants and content generation workflows using the Perplexity-n8n integration.[6][7]

This integration allows users to combine Perplexity’s real-time AI insights with the broad automation capabilities of n8n, enhancing productivity and enabling complex automated workflows.[8][9]

[1](https://n8n.io/integrations/perplexity/)
[2](https://n8n.io/workflows/2824-query-perplexity-ai-from-your-n8n-workflows/)
[3](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-langchain.perplexity/)
[4](https://github.com/watzon/n8n-nodes-perplexity)
[5](https://www.reddit.com/r/n8n/comments/1la3t1i/how_to_connect_perplexity_to_n8n/)
[7](https://n8n.io/workflows/3673-ai-powered-research-assistant-with-perplexity-sonar-api/)
[8](https://www.linkedin.com/pulse/unlocking-automation-potential-perplexity-ai-n8n-peter-sigurdson-ewzfe)
[11](https://n8n.io/integrations/perplexity/and/read-ai/)
[13](https://pipedream.com/apps/perplexity/integrations/n8n-io)
[14](https://community.n8n.io/t/using-perplexity-api-with-the-ai-tools-agent/54308)
[16](https://n8n.io/integrations/one-simple-api/and/perplexity/)
[17](https://n8n.io/workflows/2682-perplexity-research-to-html-ai-powered-content-creation/)

### n8x x MCP


0. https://github.com/illuminaresolutions/n8n-mcp-server

1. https://github.com/nerding-io/n8n-nodes-mcp

> MIT |  n8n custom node for MCP 

https://github.com/leonardsellem/n8n-mcp-server


> MIT |  MCP server that provides tools and resources for interacting with n8n API 


https://github.com/czlonkowski/n8n-mcp
https://www.n8n-mcp.com/

> MIT |  A MCP for Claude Desktop / Claude Code / Windsurf / Cursor to build n8n workflows for you 


#### Perplexity x MCP

Yes, Perplexity does have an official MCP (Model Context Protocol) server.

It is called the "Perplexity Ask MCP Server" and serves as a bridge to connect Perplexity’s Sonar API with AI assistants and other AI frameworks, enabling seamless integration for real-time research, data access, and workflow automation.

This MCP server supports both local and remote contexts to allow AI systems to securely interact with external data sources, tools, and APIs within Perplexity’s platform.[1][2][3][4]

In summary, the Perplexity MCP server exists and is actively supported as part of their platform for enabling powerful AI integrations and enhanced context sharing.[2][3][1]

[1](https://docs.perplexity.ai/guides/mcp-server)
[2](https://github.com/perplexityai/modelcontextprotocol)
[3](https://www.perplexity.ai/help-center/en/articles/11502712-local-and-remote-mcps-for-perplexity)
[4](https://playbooks.com/mcp/laodev1-perplexity)


## Conclusions

You might want to consider other n8n *,alternatives'*, like hugging or Flowise.


---

## FAQ


### What is Huginn?

* https://github.com/huginn/huginn

> MIT | Create agents that monitor and act on your behalf. Your agents are standing by!

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/hugging" title="Hugging | Config File 🐳 ↗"  >}}
{{< /cards >}}

![alt text](/blog_img/selfh/automation/hugging-ui.png)

Huginn is an open-source, **self-hosted automation tool** that allows you to create "agents" to perform automated tasks online.

It's often compared to services like IFTTT or Zapier, but gives you more control and privacy because it runs on your own server.

**Huginn** and **n8n** are both very similar in their core purpose: they are open-source, self-hosted tools for workflow automation. Both are excellent alternatives to proprietary services like Zapier and IFTTT.

However, they have some key differences in their design, user experience, and ideal use cases.

#### Huginn: The Agent-Based System 🕵️‍♂️

Huginn's philosophy is centered around "agents." You chain together different agents to create a workflow. For example, one agent might "speak" RSS feeds, another might "listen" for certain keywords, and a third might "do" something like sending an email or posting a tweet.
* **Key Strengths**:
    * **Powerful for Web Scraping**: Its agent-based model is exceptionally good at monitoring websites, scraping data, and reacting to changes.
    * **Event-Driven**: It's highly effective at creating a series of actions triggered by specific events.
    * **Mature & Established**: Huginn has been around for a long time and has a dedicated user base.

* **Weaknesses**:
    * **Less Visual**: The workflow creation is primarily done through web forms and JSON configurations, which can feel less intuitive than a drag-and-drop interface.
    * **Steeper Learning Curve**: It can be more challenging for a non-technical user to get started with and build complex workflows.


{{< details title="Capturing and Storing Data with Hugging... 📌" closed="true" >}}

**Huginn could be used** to capture emails from a website and store them in a Google Sheet, but it does **not** have a built-in embedded widget. 

This requires a two-part setup.

You would build a **chain of agents** in Huginn to accomplish this.

1.  **Webhook Agent**: The first agent would be a **Webhook Agent**. This agent creates a unique URL that acts as an API endpoint. You would configure your website's form to send a POST request to this URL when a user submits their email. This method allows Huginn to receive the email data.

2.  **Google Sheets Agent**: After receiving the data, you would create a second agent to send it to Google Sheets. Huginn has a `Google Sheets Agent` that can be used to append new rows of data. You'll need to configure this agent with the correct Google API credentials and specify the spreadsheet ID and sheet name.

3.  **The Flow**: The Webhook Agent receives the form data and creates an event. This event is then passed to the Google Sheets Agent, which uses the data to add a new row to your spreadsheet.

{{< /details >}}


{{< details title="Embedded Widgets... 📌" closed="true" >}}

Huginn does **NOT** have a built-in, ready-to-use widget for websites. 

Its primary purpose is **backend automation**, not front-end user interfaces. You would have to manually create the HTML form on your website and configure it to send data to the Webhook Agent's URL.

This is a key difference from many "no-code" automation tools that provide widgets or templates.

Huginn's design gives you **more control over the backend logic and data flow**, but it assumes you will handle the front-end part separately.

> This can be very interesting for people that like SSG/JAMStack...


{{< /details >}}


{{< details title="Easy vs Complex Storage for Huggin 📌" closed="true" >}}


The easiest data storages to use with Huginn are those that are natively supported by its agents or its core architecture.

1. The Core Database (MySQL or PostgreSQL)

Huginn is built on a relational database, with **MySQL** or **PostgreSQL** being the standard, most reliable choices. The vast majority of the data processed by Huginn's agents is stored in this central database. When you receive a webhook event, for instance, the data is automatically saved in a structured format within Huginn's tables. This is the simplest way to store data because it requires no extra setup beyond the initial installation.

2. Google Sheets

Huginn has a dedicated **Google Sheets Agent** that makes it straightforward to export data to a spreadsheet. This is a very convenient option for non-technical users or for sharing data with collaborators who don't have direct access to your Huginn instance. You just need to configure the agent with your Google API credentials and a spreadsheet ID.

3. Dropbox and FTP
Huginn also has agents for interacting with **Dropbox** and **FTP** servers. These are easy to use for saving files that you might scrape or generate. For example, if you have an agent that generates a daily report as a text file, you can use the Dropbox Agent to upload it to a specific folder.

**Storages That Are Not Easy**

In contrast, other data storages are much more difficult to use:

* **SQLite**: As mentioned previously, Huginn does not have a native SQLite agent. Storing data would require using a `Shell Agent` or creating a custom agent, which is a complex process.
* **NoSQL Databases**: There are no out-of-the-box agents for writing to NoSQL databases like MongoDB or Redis. While you could potentially interact with them via their API endpoints using a general-purpose agent (like the `HTTP Agent`), this requires a high degree of technical expertise.

{{< /details >}}

### What is n8n?

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
{{< /cards >}}

#### n8n: The Visual Workflow Builder 🎨

n8n (which stands for "node-based, no-code, and open-source") uses a visual, node-based approach. You connect different "nodes" on a canvas to build a complete workflow, which is more similar to how a developer would think about a flow chart. 

* **Key Strengths**:
    * **User-Friendly Interface**: The drag-and-drop visual builder makes it very easy to see and understand the entire workflow.
    * **Extensive Integrations**: n8n boasts a vast library of pre-built integrations with hundreds of popular web services and apps.
    * **Low-Code/No-Code**: It caters to both technical and non-technical users by offering a simple interface for basic tasks while allowing for custom JavaScript code within nodes for more advanced logic.

* **Weaknesses**:
    * **Can be more resource intensive**: The visual builder and its features can sometimes require more resources than Huginn's lighter-weight approach.
    * **Can get visually complex**: For extremely large or complex workflows, the canvas can become cluttered and difficult to manage.



### N8N vs Hugging vs Flowise

* If your goal is to **connect two or more apps** to automate a business process (like getting an email when a new lead is added to your CRM), **n8n** is a fantastic choice due to its extensive library of integrations.

* If your goal is to **monitor the web** for changes, such as scraping a price from a website or getting a notification when a new article is published, **Huginn**'s agent-based model is extremely powerful for that specific use case.

* If your goal is to **build a chatbot** that can answer questions based on your company's documents, create a customer service assistant, or orchestrate complex AI tasks, **FlowiseAI** is the clear winner because it's built from the ground up for that specific purpose.

In short, while n8n and Huginn could theoretically be used to build a simple AI workflow, they would require a lot of custom work.

FlowiseAI provides a streamlined, visual environment with the exact components you need for **LLM and AI agent development** out of the box.

Both are powerful automation tools, but they cater to slightly different users and use cases.

| Feature | Huginn | n8n |
| :--- | :--- | :--- |
| **Interface** | Agent-based, less visual | Node-based, highly visual |
| **Best For** | Web scraping, event monitoring, developers | General automation, app integration, users who prefer a visual flow |
| **Ease of Use** | Steeper learning curve | More user-friendly |

FlowiseAI is a low-code, visual platform for building and deploying AI applications, with a specific focus on **Large Language Models (LLMs)**. 

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/flowise-ai" title="Flowise | Docker Config 🐋 ↗" >}}
{{< /cards >}}

While Huginn and n8n are general-purpose automation tools, FlowiseAI is a specialized tool for creating AI-powered workflows.

It is often described as a visual wrapper for frameworks like LangChain, which allows developers to build complex LLM chains and agents without writing extensive code.

| Feature | **Huginn** | **n8n** | **FlowiseAI** |
| :--- | :--- | :--- | :--- |
| **Core Purpose** | General-purpose web automation & event monitoring | General-purpose workflow automation & app integration | **LLM orchestration** & AI agent building |
| **Primary Focus** | Creating "agents" to scrape websites, listen to events, and react to changes. | Connecting different web services and APIs to automate business processes. | Creating and deploying AI assistants, chatbots, and RAG systems. |
| **User Interface** | Agent-based, less visual, relies on forms and JSON configuration. | Node-based, highly visual, drag-and-drop. | Node-based, highly visual, similar to n8n but with a component library tailored for AI workflows. |
| **Key Components** | Agents (e.g., website agent, email agent, Twitter agent). | Nodes (e.g., webhook, email, CRM). | Nodes for LLMs, embeddings, vector databases, document loaders, and tools (e.g., search, calculator). |
| **Ideal User** | Developers and technical users who need a powerful, event-driven system for monitoring and scraping. | Technical and non-technical users who want a visual way to automate business processes. | Developers and data scientists who want a visual, low-code platform for building AI applications. |
| **Self-Hosting** | Designed to be self-hosted. | Designed to be self-hosted. | Designed to be self-hosted. |


Huginn, n8n, and Flowise each target different automation and integration needs, but they have some overlap. 

Huginn is more backend and "agent"-oriented, while n8n and Flowise focus on general workflow automation and LLM/AI orchestration, respectively.

| Feature/Approach       | Huginn                                    | n8n                                            | Flowise                                |
|------------------------|-------------------------------------------|------------------------------------------------|----------------------------------------|
| Core Focus             | Event-driven agents, backend automations  | Visual workflow automation, API integration    | Visual LLM/AI chain builder            |
| Oriented For           | Developers, self-hosters, custom scenarios| Power users, no/low-code workflow designers    | AI engineers, rapid LLM prototyping    |
| UI/UX                  | Web UI, JSON config, "hackable IFTTT"     | Modern, node-based, drag-and-drop              | Visual, focused on LLM integrations    |
| Extensibility/API      | Highly extensible, new agents via code    | Huge range of nodes, API calls, custom logic   | Modular LLM components, prompt chains  |
| General vs AI/LLM      | General web/event/backend focus           | General, with AI/LLM as add-ons                | AI/LLM-centric, built on LangChain     |
| Backend/Frontend       | Mostly backend/event generator            | Backend workflows with API endpoints, some UI  | Both: API backend, supports UIs        |
| Typical Use Cases      | Data scraping, monitoring, notifications  | SaaS automation, API glue, business workflows  | Chatbots, RAG apps, AI-driven agents   |
| SSG/Jamstack Plugging  | Webhooks, RSS, API triggers possible      | Direct API/webhook + JS functions for SSG use  | Can expose APIs, less direct for SSG   |


### Is Huginn More Backend-Oriented?

- Huginn runs automation "agents" as backend tasks, focusing on collecting, transforming, and triggering data events.[4][5][6]
- It is less focused on visual UX than n8n or Flowise and instead emphasizes event graph logic, custom scripting, and direct data manipulation.
- Most Huginn scenarios run without user interface output beyond dashboards and alerts, so it’s generally more backend-oriented than n8n or Flowise.


### Integrating Huginn with SSG or Jamstack

- Huginn can integrate with static site generators or Jamstack projects by producing webhooks, RSS feeds, JSON APIs, or periodic build triggers.[5]
- Example use cases:
  - Triggering new builds or content updates when monitored data changes.
  - Posting content to headless CMS webhooks.
  - Consuming or producing data for SSG builds via API endpoints.
- Huginn isn't built exclusively for Jamstack, but it can plug in via the backend using standard web automation protocols like webhooks and APIs.[4][5]

### n8n and Flowise with Jamstack

- n8n natively exposes HTTP endpoints and triggers, making it well-suited for SSG or Jamstack builds.
- Flowise, while more LLM-centric, can also expose REST endpoints, but its use cases are more often focused on AI enrichment than general content updates.

In summary, Huginn is more backend and "event-agent" oriented, n8n is the most versatile and user-friendly for general automation (including for Jamstack), and Flowise is best for LLM-based workflows and AI conversational apps.

Huginn can be made to work with Jamstack/SSG setups, though it's less direct than with n8n.

## Outro

### More MCP

#### MCP x PlayWight

As just seen on the browser and automations post.