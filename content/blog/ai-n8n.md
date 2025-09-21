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

Meaning: dont drag and drop, ask the AI to build your flows :)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
  {{< card link="https://www.npmjs.com/search?q=keywords%3An8n-community-node-package" title="N8N | Community Nodes nmpjs ↗" >}}
{{< /cards >}}

Btw, [marketer](https://jalcocert.github.io/JAlcocerT/social-media-automation/#conclusions): you can be interested in these web automation tools.

And probably, you are using [these tools](https://jalcocert.github.io/JAlcocerT/social-media-automation/#scrapping-social-media) for leads, but not [these for scrapping](https://jalcocert.github.io/JAlcocerT/how-to-browse/#scrapping-recap).

Neither using [AI for audio related](#n8n-x-firefliesai) task.

What's the common factor?

That you can plug them all to your N8N.

### n8n x FirefliesAI

Lately, I was playing with [AI Audio here](https://jalcocert.github.io/JAlcocerT/audio-recap/#tools-for-meetings).

And decided to get access to: https://app.fireflies.ai/

Why this decision among other [tools for meetings](https://jalcocert.github.io/JAlcocerT/audio-recap/#tools-for-meetings)?

Because FirefliesAI can be **integrated easily with n8n**.

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

Just go to https://app.fireflies.ai/settings and get that **API key**.

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

This native integration allows meeting data from Fireflies.ai to flow seamlessly into other apps via n8n’s automation platform, boosting productivity.

[1](https://guide.fireflies.ai/articles/4758387081-learn-about-n8n-x-fireflies-integration)
[2](https://github.com/firefliesai/n8n-nodes-fireflies)
[3](https://n8n.io/integrations/fireflies/)


### n8n x Perplexity

Perplexity can be integrated with n8n.

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

2. https://github.com/leonardsellem/n8n-mcp-server


> MIT |  MCP server that provides tools and resources for interacting with n8n API 


3. https://github.com/czlonkowski/n8n-mcp

* https://www.n8n-mcp.com/

> MIT |  A MCP for Claude Desktop / Claude Code / Windsurf / Cursor to build n8n workflows for you 


#### Perplexity x MCP

Perplexity does have an official MCP (Model Context Protocol) server.

It is called the "Perplexity Ask MCP Server" and serves as a bridge to connect Perplexity’s Sonar API with AI assistants and other AI frameworks, enabling seamless integration for real-time research, data access, and workflow automation.

This MCP server supports both local and remote contexts to allow AI systems to securely interact with external data sources, tools, and APIs within Perplexity’s platform.[1][2][3][4]

In summary, the Perplexity MCP server exists and is actively supported as part of their platform for enabling powerful AI integrations and enhanced context sharing.

[1](https://docs.perplexity.ai/guides/mcp-server)
[2](https://github.com/perplexityai/modelcontextprotocol)
[3](https://www.perplexity.ai/help-center/en/articles/11502712-local-and-remote-mcps-for-perplexity)
[4](https://playbooks.com/mcp/laodev1-perplexity)

---

## Conclusions

**To recap:** If it has an API/Webhooks, you can plug it with your n8n workflows.

Like with: https://docs.apify.com/platform/integrations

{{% details title="N8N can do that, actually 🚀" closed="true" %}}

Yes, in general, if a tool offers an API and/or webhooks, it can be integrated with n8n. 

n8n is designed as a flexible workflow automation platform that can connect with any service that provides:

- A RESTful API or other types of APIs (e.g., GraphQL).
- Webhooks to trigger workflows based on events.

This allows automating interactions such as data retrieval, processing, and pushing results to other systems by configuring nodes in n8n. 

Many tools support API calls and webhooks exactly to enable such integrations, making n8n very versatile for combining different services without custom coding.

---

Yes, I **absolutely agree** with your statement. It's a fundamentally accurate and excellent summary of how n8n works and its core philosophy.

Here's a breakdown of why your statement is correct:

* **The "API or Webhook" Rule:** You've hit on the key principle. If a service has a way for external systems to communicate with it (an API) or to send a notification when something happens (a webhook), n8n can likely be integrated with it. This is the foundation of modern automation.
* **Generic Nodes:** n8n's power comes from its generic nodes that are built for exactly this purpose. The **HTTP Request** node can be configured to interact with virtually any RESTful API, and the **Webhook** trigger node can receive events from any service that supports webhooks.
* **Flexibility over Specificity:** While n8n has hundreds of pre-built "native" integrations (like the Google Sheets one we discussed), its true versatility lies in its ability to connect to any other service you can imagine, as long as it exposes an API or webhook endpoint.


{{% /details %}}


{{< details title="Remember - API vs WwebHooks... 📌" closed="true" >}}

API and webhook connections serve different but **complementary purposes in workflow automation**. 

Here's a simple way to think about it.

* **API (Application Programming Interface)**: An API is a set of rules that lets you **actively make requests** to a service to get or send data. 

Think of it as **you calling the service** and asking it to do something.
    * **Use Case:** You would use an API to **pull data** or to **perform an action**. For example, in n8n, you'd use an API connection to:
        * **Get data:** Pull a list of all products from your e-commerce platform.
        * **Send data:** Create a new contact in your CRM.
        * **Trigger an action:** Send a specific email to a customer.

* **Webhook**: A webhook is a mechanism where a service **pushes information to you** when a specific event happens. 

It's like the service **calling you** to give you an alert.
      * **Use Case:** You would use a webhook to **trigger a workflow instantly** based on an event. Your examples are perfect:
        * Someone has subscribed to your newsletter in MailerLite.
        * A customer has filled out a form on your website.
        * A new lead has been created in your sales tool.

Summary

| | **API** | **Webhook** |
|:---|:---|:---|
| **Initiator** | You (your workflow) | The external service |
| **Action** | You send a request | The service sends a notification |
| **Purpose** | **Requesting data or performing an action** | **Receiving an event to trigger a workflow** |
| **Analogy** | You call a waiter to order food. | The waiter brings the food out when it's ready. |


{{< /details >}}


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

##### n8n x formbricks

Remember to install the community node `@formbricks/n8n-nodes-formbricks`

YOu will need the **API**: https://formbricks.com/docs/api-reference/generate-key

And also the **webhooks** configured: https://formbricks.com/docs/xm-and-surveys/core-features/integrations/webhooks

To **connect APIs** you can have a look to: https://github.com/PipedreamHQ/pipedream

{{< callout type="info" >}}
But the killer to test http Get/Post/... has been https://webhook.site/
{{< /callout >}}

Step 1: Prepare n8n and Formbricks

First, you need to set up the connection.

* **In n8n**, add the **Formbricks** trigger node to your canvas.
* **In Formbricks**, make sure you have a survey created and its **webhook** integration is active.

Step 2: Get the Webhook URL from n8n

The webhook URL is the link that connects your Formbricks survey to your n8n workflow.

* Click on the **Formbricks** node in n8n.
* Click the **"Listen for event"** button in the node's settings panel.
* A new, unique URL will appear below the button. Copy this URL exactly.

Step 3: Configure Formbricks

Next, you'll tell your Formbricks survey where to send the data.

* Go to your Formbricks account and navigate to the **Integrations** section of your survey.
* In the webhook settings, **paste the URL** you copied from n8n into the **Webhook URL** field.
* Save the changes.

Step 4: Test the Connection

Now, you'll trigger the webhook to send the data.

* Go to your Formbricks survey and submit a **new** response.
* Return to your n8n workflow. If the connection is successful, the data from your survey will appear in the output of the **Formbricks** node.

Step 5: Configure the HTTP Request Node

With the data successfully captured, you can now send it to its final destination.

* Add an **HTTP Request** node to your workflow and connect it to the **Formbricks** node.
* In the **HTTP Request** node settings, configure the following:
    * **Method:** `POST`
    * **URL:** Your Webhook.site URL.
    * **Body Content Type:** `JSON`
    * **JSON Field:** `{{ $json.response }}` (to send all data) or a custom JSON object with specific fields.

Step 6: Activate the Workflow

* Once you're satisfied with your test, use the toggle in the top-right corner of the n8n canvas to **activate** your workflow.

Your workflow will now automatically capture every new survey response from Formbricks and send it to your configured destination.

> https://github.com/JAlcocerT/Home-Lab/blob/main/n8n/sample-workflows/1-formbricks-http-webhooksite.json

##### n8n x mailerlite

You just need webhooks: https://dashboard.mailerlite.com/integrations/webhooks

And configure it on n8n as POST.

Then take the webhook url towards Mailerlite UI:

And then test with some manual creation: https://dashboard.mailerlite.com/subscribers/create

> https://github.com/JAlcocerT/Home-Lab/blob/main/n8n/sample-workflows/2-mailerlite_webhook_tg.json

##### n8n x telegram

Not long ago, I was playing with [TG Bots, here](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#tg-bots).

Now, we will be using the n8n node: https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.telegram/

* https://core.telegram.org/bots/api
* https://api.telegram.org/bot<BOT_TOKEN>/getUpdates

To get the chat ID, send a msg to your new bot:

```sh
curl "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates"
curl -s "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates" | jq .result[0].message.chat.id
```

The Telegram part of the workflow is responsible for receiving the processed data from n8n and sending it as a message to a specific chat.

This requires two main components: an external setup to get credentials and the n8n node configuration.

1. External Setup

  * **Create the Telegram Bot:** The first step was to create a new bot using the official Telegram bot creator, **`@BotFather`**. This bot acts as the sender for all your automated messages. When you created it, `@BotFather` provided a unique **API Token** (also called an **Access Token**). This token serves as the password for n8n to control your bot.

  * **Find the Chat ID:** Next, you needed to find the specific ID of the chat or group where you wanted to receive messages. This is because the bot needs to know exactly where to send the message. To find this ID, you started a conversation with your bot (either in a private chat or by adding it to a group) and then used a **`curl`** command to query the Telegram API and get the unique **Chat ID** from the response. This ID is a long number, often negative for groups.

2. n8n Node Configuration

After getting the credentials, you configured the **Telegram** node in your n8n workflow.

  * **Node Placement:** The node was placed at the end of the workflow, after the OpenAI node, because it's the final action in the process.

  * **Credentials:** You provided the **API Token** you received from `@BotFather` to authenticate n8n with Telegram.

  * **Core Fields:** You configured the following essential fields:

      * **Resource:** `Message`
      * **Operation:** `Send a text message`
      * **Chat ID:** You pasted the Chat ID you found with `curl`.
      * **Text:** This is the most crucial part. You created a dynamic message using **expressions** to pull data from multiple previous nodes. For this, you used the special **`$node`** expression to access the original webhook data and the standard **`$json`** expression to get the AI's output from the immediately preceding OpenAI node.




```txt
A new subscriber has joined!

Name: {{ $json.body.fields.name }}
Email: {{ $json.body.email }}

Source: {{ $json.body.source }}
Status: {{ $json.body.status }}
```
> https://github.com/JAlcocerT/Home-Lab/blob/main/n8n/sample-workflows/2-mailerlite_webhook_tg.json

##### n8n x openai

We will be using: https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-langchain.openai/#operations and its `Message a Model`

After providing the API key: 

```sh
Tell me a fun fact about the name '{{ $json.body.fields.name }}' in a single sentence.
```

Not to abuse mailerlite, lets add sth manually:

```sh
curl -X POST \
-H "Content-Type: application/json" \
-d '{
    "body": {
        "fields": {
            "name": "Jane",
            "last_name": null
        },
        "email": "jane.doe@example.com",
        "status": "active",
        "event": "subscriber.created"
    }
}' \
"https://n8n.jalcocertech.com/webhook-test/a1b92538-1bab-42ec-a865-a5cc01afe51b"
```

But for this one to work I needed to adapt:

```
Tell me a fun fact about the name '{{ $json.body.body.fields.name }}' in a single sentence.
```

And it worked!

Now, to bring it all towards the tg node, I changed it to:

```
New subscriber alert!

Name: {{ $node["Webhook"].json.body.body.fields.name }}
Email: {{ $node["Webhook"].json.body.body.email }}

AI Fact: {{ $json.message.content }}
```

That's as easy as it can be! Look again and dont blink:

```sh
curl -X POST \
-H "Content-Type: application/json" \
-d '{
    "body": {
        "fields": {
            "name": "El yosua cerdo",
            "last_name": null
        },
        "email": "yosu.cerdo@example.com",
        "status": "active",
        "event": "subscriber.created"
    }
}' \
"https://n8n.jalcocertech.com/webhook-test/a1b92538-1bab-42ec-a865-a5cc01afe51b"
```


{{< details title="A recap on these steps... 📌" closed="true" >}}

Phase 1: External Services Setup

You first had to set up the two external services that n8n would interact with.

* **Telegram Setup**
    1.  You used **`@BotFather`** in Telegram to create a new bot and obtain its unique **API Token**.
    2.  You started a chat with your new bot and used a **`curl`** command with the bot's API to find the **Chat ID** of the conversation.

* **OpenAI Setup**
    1.  You obtained an **OpenAI API Key** from your OpenAI account. This key is your credential for allowing n8n to communicate with the AI.


Phase 2: n8n Workflow Creation

This is the core of the automation. You created a workflow with three connected nodes.

* **Step 1: Webhook Node (The Trigger)**
    * You added a **Webhook** node as the first step in your workflow.
    * You set the HTTP method to **POST**.
    * This node provided a unique **Webhook URL** that you would later use in MailerLite.

* **Step 2: OpenAI Node (The AI Action)**
    * You added an **OpenAI** node and connected it after the Webhook node.
    * You provided your OpenAI API key as the credential.
    * You chose the **Resource** as `Text` and the **Operation** as `Message a Model`.
    * In the content of the message, you created a prompt using the `$node` expression to get the subscriber's name from the webhook's data: `Tell me a fun fact about the name '{{ $node["Webhook"].json.body.body.fields.name }}' in a single sentence.`

* **Step 3: Telegram Node (The Final Action)**
    * You added a **Telegram** node and connected it after the OpenAI node.
    * You provided your Telegram API token and the **Chat ID** as credentials.
    * You configured the action to be **"Send a text message"**.
    * You constructed the final message text using expressions to pull data from **both** the webhook node and the OpenAI node:
        * `{{ $node["Webhook"].json.body.body.fields.name }}` for the name from the webhook.
        * `{{ $json.message.content }}` for the AI's comment from the OpenAI node.

Phase 3: External Webhook Configuration

* **MailerLite Setup**
    1.  You went to the **Integrations** section in your MailerLite account.
    2.  You created a new webhook and pasted the **Webhook URL** from your n8n workflow.
    3.  You set the event to **"Subscriber created"**.

Phase 4: Testing and Activation

* **Testing:**
    * You used a **`curl`** command to simulate a new subscriber event, sending test data directly to your webhook URL.
* **Activation:**
    * Once you confirmed that the workflow worked perfectly with your test data, you toggled the **"Active"** switch on your n8n workflow to make it run automatically in the background.

And that's it! You built a complete, automated workflow that gets real-time data from an external service, processes it with an AI, and sends a custom notification to a messaging app.

{{< /details >}}

> See https://github.com/JAlcocerT/Home-Lab/blob/main/n8n/sample-workflows/3-webhook_openai_tg.json

##### n8n x Scrapping

Lately, I was doing a [scrapping recap here](https://jalcocert.github.io/JAlcocerT/how-to-browse/#scrapping-recap)

But what if all this could be done with n8n instead of a [,complex' script](https://github.com/JAlcocerT/moi-realestate-pb/blob/master/ScrapPhotosWebApp/OpenAI_MigrateWebInfo_v4st.py)?

You need to get familiar with the `http request` and `html node` to do the parsing.

To test, the `set (edit fields)` node might help too.

how the Workflow Would Work in n8n

You'd create a workflow using a series of "nodes" that perform a specific task. The general flow would look like this:

1.  **Telegram Trigger Node**: This is the starting point of your workflow. You would configure a "Telegram Trigger" node to listen for new messages sent to your bot. This node would receive the URL that you send via the Telegram group.

2.  **HTTP Request Node**: This is the core of the scraping part. You would use an "HTTP Request" node to perform a GET request on the URL received from the Telegram trigger. This node fetches the raw HTML content of the webpage.

3.  **HTML Extract Node**: This is where you would configure the selectors to extract the specific data you want. The **HTML Extract node** in n8n is designed for this. You would provide CSS selectors or XPath to tell the node exactly what information to pull from the HTML, such as titles, prices, descriptions, and the image URLs. 

4.  **Data Processing**: You might need additional nodes to clean and format the scraped data. For example, a "Set" or "Function" node could be used to organize the extracted information into a clear message.

5.  **Telegram Send Message Node**: Finally, you would use a "Telegram" node to send a message back to the group. This node would be configured to use the cleaned and formatted data from the previous step, so the bot replies with the extracted information.

This setup would allow you to fully automate the process of sending a URL to a bot and getting the scraped data back as a reply.


##### n8x x google sheets

<!-- https://www.youtube.com/watch?v=3Ai1EPznlAc -->

{{< youtube "3Ai1EPznlAc" >}}


You need to get the Client ID and Client Secret from the **Google Cloud Console**. 

This process involves creating a new project and configuring it to allow n8n to connect to Google Sheets on your behalf.

The steps are a bit involved, but it's a one-time setup for your n8n instance.

Step-by-Step Guide to Get Client ID and Secret

1.  **Go to the Google Cloud Console**: Navigate to `https://console.cloud.google.com/`. You must be logged in with your Google account.

2.  **Create a New Project**: At the top of the page, click the dropdown menu next to the "Google Cloud" logo. Click **"New Project"**, give it a name (e.g., "n8n Automation"), and click **"Create"**.
    

3.  **Enable the Google Sheets API**:
    * Once your project is selected, go to the **"APIs & Services" > "Library"** from the left-hand menu.
    * Search for **"Google Sheets API"** and click on it.
    * Click the **"Enable"** button.

4.  **Configure the OAuth Consent Screen**: This is required to tell Google who is using your app and what it will access.
    * Go to **"APIs & Services" > "OAuth consent screen"**.
    * Choose **"External"** (for personal use) and click **"Create"**.
    * Fill out the required information:
        * **App name**: A name like "My n8n App".
        * **User support email**: Your email address.
    * Click **"Save and Continue"**.
    * On the **"Scopes"** page, click **"Add or Remove Scopes"**. A new window will appear.
    * Search for "sheets" and select the scope for Google Sheets. The full scope URL will be something like `...auth/spreadsheets`. Click **"Update"**.
    * Click **"Save and Continue"** on the main screen.
    * On the **"Test Users"** page, add your Google account email as a test user. This is crucial for your self-hosted app to work without a verification process.

5.  **Create the OAuth Credentials**:
    * Go to **"APIs & Services" > "Credentials"**.
    * Click **"Create Credentials"** at the top and select **"OAuth client ID"**.
    * For **"Application type"**, choose **"Web application"**.
    * Give it a name (e.g., "n8n Web Client").
    * Under **"Authorized redirect URIs"**, click **"ADD URI"** and paste the **exact** URL that n8n provided you. This URL is unique to your self-hosted instance and should look like `https://yourdomain.com/rest/oauth2-credential/callback`.
    * Click **"Create"**.

6.  **Copy Your Credentials**: A pop-up window will appear showing your **Client ID** and **Client Secret**. Copy these values immediately and paste them into the appropriate fields in your n8n Google Sheets credential setup.

##### n8n x custom script

##### n8n x whatever

* Perplexity - https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-langchain.perplexity/#templates-and-examples

* n8n x stripe - https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.stripe/
* CRM / Invoices: https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.invoiceninja/ and https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.erpnext/

* n8n x pocketbase

* [n8n x ghost](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.ghost/) - As an alternative to write posts for you
* [n8n x wp](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.wordpress/) - same, instead of pure API usage


* [Gotify](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.gotify/), [grist](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.grist/), [Twitter](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.twitter/), [SendGrid](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.sendgrid/), [MQTT](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.mqtt/), [HomeAssistant](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.homeassistant/), [Youtube](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.youtube/#operations)


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