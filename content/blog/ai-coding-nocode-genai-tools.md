---
title: "No Code Tools to use Gen AI"
date: 2025-04-19T23:20:21+01:00
draft: false
tags: ["Gen-AI","Python","Dev","ChatBots","TelegramBots","N8N Workflows"]
description: 'Generative AI made simple with Low Code. Chatwoot, Flowise, n8n, LangFlow, Tg...embedded AI Powered Chat bots!'
url: 'no-code-ai-tools'
---


Gen AI, Rags, containers...

But what about the use cases?

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/" title="RAG 101" image="/blog_img/rag101.jpeg" subtitle="My Fav RAGs Post" >}}
  {{< card link="https://github.com/JAlcocerT/Docker" title="Docker Config Files Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Tinkering with Docker Services" >}}
{{< /cards >}}

[![Star History Chart](https://api.star-history.com/svg?repos=FlowiseAI/Flowise,langflow-ai/langflow,Sinaptik-AI/pandas-ai,pydantic/pydantic-ai&,type=Date)](https://star-history.com/FlowiseAI/Flowise&langflow-ai/langflow&Sinaptik-AI/pandas-ai&pydantic/pydantic-ai&Date)


The AI tech side might be perceived as chaotic...but you can keep it close to [apps you are familiar](#see-also), like [telegram bots](#tg-bots)

### Flowise AI

Flowise provides modular building blocks for you to build any agentic systems, from simple compositional workflows to autonomous agents

> Build AI Agents, Visually

* **Flowise AI**, a groundbreaking Free platform that is making AI more accessible than ever before.
  * {{< newtab url="https://flowiseai.com/" text="The Flowise AI Official Page" >}}
  * {{< newtab url="https://github.com/FlowiseAI/Flowise" text="The Flowise AI Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/FlowiseAI/Flowise?tab=Apache-2.0-1-ov-file#readme" text="Apache v2" >}} ✅

<!-- https://www.youtube.com/watch?v=SASUXOV7tEQ -->

{{< youtube "SASUXOV7tEQ" >}}


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/FlowiseAI" title="FlowiseAI Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

#### Flowise x Streamlit

Developer Friendly
API, SDK, Embed
Extend and integrate to your applications using APIs, SDK and Embedded Chat

APIs
Embedded Widget
Typescript & Python SDK

https://docs.flowiseai.com/integrations/3rd-party-platform-integration/streamlit


#### Embedded Flowise Chat


* https://docs.flowiseai.com/using-flowise/embed
* https://github.com/FlowiseAI/FlowiseChatEmbed


* https://github.com/ZynthCode/flowise-ai-with-python

### LangFlow

Langflow is designed to redefine the boundaries of AI development in experimentation and real-world scenarios.

Its a lowcode **visual framework** for building multi-agent and RAG applications.

It's open-source, Python-powered, fully customizable, model and vector store agnostic.

It is **based on Python**, which makes it ready to have many integrations:

![LangFlow Store](/blog_img/GenAI/NoCode-AI/LangFlow_Store.png)

* **LangFlow**:
  * {{< newtab url="https://www.langflow.org/" text="The Flowise AI Official Page" >}}
  * {{< newtab url="https://github.com/langflow-ai/langflow" text="The Flowise AI Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/langflow-ai/langflow?tab=MIT-1-ov-file#readme" text="MIT" >}} 

* https://hub.docker.com/r/langflowai/langflow

> ⛓️ Langflow is a **visual framework for building multi-agent and RAG applications**. It's open-source, Python-powered, fully customizable, model and vector store agnostic.

```sh
python -m venv langflow #create the venv (python3 if you are in mac/linux)

langflow\Scripts\activate #activate venv (windows)
source langflow/bin/activate #(linux)

pip install langflow #https://pypi.org/project/langflow/  #--pre --force-reinstall 

#langflow run

#deactivate #when you are done
```

Acces LangFlow at `localhost:7860`

<!-- 
https://www.youtube.com/watch?v=VbqfZjT_PLE 
-->

{{< youtube "VbqfZjT_PLE" >}}


  * https://github.com/leonvanzyl/langflow-tutorial-2024/blob/master/run.sh

> Thanks again Leon Van Zyl

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/" title="LangFuse & MLFlow Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

```yml
#version: '3.8'

services:
  langflow:
    image: langflowai/langflow:latest
    ports:
      - "7860:7860"
    stdin_open: true # equivalent to -i
    tty: true        # equivalent to -t
    restart: unless-stopped
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LangFlow" title="LangFlow with Docker 🐋 ↗" >}}
{{< /cards >}}


**LangFlow Embedded**

You can embedd langflow in your websites with few lines of JS and this project: https://github.com/langflow-ai/langflow-embedded-chat

{{< callout type="info" >}}
Dont confuse LangFlow with LangFuse nor MLFlow
{{< /callout >}}

These other 2 are used for:

1. MLflow is an open-source platform to manage the complete machine learning lifecycle, including experiment tracking, model versioning, deployment, and providing integrated observability features, especially for LLM-powered applications.

2. Langfuse is an open-source observability platform specifically designed for LLM applications, offering detailed tracing, monitoring, and analytics to help developers understand, debug, and improve their language model-based systems.


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LangFuse" title="LangFuse with Docker 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/#dsc-tools-for-da-projects" title="SelfHosted LangFuse sometime ago | Post  ↗" >}}
{{< /cards >}}

> LangFuse is kind of langsmith, but MIT and selfhostable

![LangFuse UI Signup](/blog_img/GenAI/langfuse-signup.png)

Once you create a local account, access the UI:

![LangFuse UI](/blog_img/GenAI/langfuse-webui.png)



### Rivet AI

<!-- https://www.youtube.com/watch?v=Zd5wjy4YPis -->


{{< youtube "Zd5wjy4YPis" >}}



### DifyAI

<!-- https://www.youtube.com/watch?v=yXAJwDtAbLo -->


{{< youtube "yXAJwDtAbLo" >}}



> Is Dify the easiest way to build AI Applications?

---

## Conclusion

I have been tinkering with docker and some of these flows/bot builders:

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/selfhosting-chatwoot/" title="ChatWoot | Post ↗" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Chats/Chatwoot" title="ChatWoot with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/NoCode/n8n" title="N8N with Docker 🐋 ↗" >}}

{{< /cards >}}


### See also...

How about **embedding a chatbot** within your website?

> A branded AI-powered website chatbot

I show recently how to do a Streamlit Web App Chat bot. 

But that might cause friction on users having to leave your home/services page.


<!-- 
{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Chats/Chatwoot" title="RAG 101" image="//blog_img/GenAI/rag101.jpeg" subtitle="Docker Config" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/NoCode/n8n" title="Docker Config Files" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Config" >}}
{{< /cards >}} 
-->

#### ChatWoot

1. [Chatwoot](https://fossengineer.com/selfhosting-chatwoot/)

{{< youtube "1Q_MDOWaljk" >}}

{{< callout type="info" >}}
You can selfhost Chatwoot with this compose
{{< /callout >}}

#### N8N

2. What is n8n?

* https://github.com/n8n-io/n8n
* https://docs.n8n.io/hosting/
  * https://docs.n8n.io/hosting/starter-kits/ai-starter-kit/
  * https://docs.n8n.io/choose-n8n/#platforms

* **Low-Code/No-Code, but with Code Flexibility:** n8n is often described as a "low-code" platform. This means it provides a visual, drag-and-drop interface for building workflows without needing to write code for basic tasks. However, it also allows users (especially developers) to insert custom JavaScript or Python code within nodes for more complex logic and transformations.
* **Node-Based Architecture:** Workflows in n8n are built by connecting "nodes." Each node represents a specific action, trigger, or data transformation (e.g., an HTTP request, a data manipulation, sending an email, or interacting with an AI model).
* **Self-Hostable and Open-Source:** A significant advantage of n8n is that it's open-source and can be self-hosted. This gives you full control over your data, privacy, and infrastructure, which is a major differentiator from many other cloud-only automation platforms. They also offer a cloud-hosted version for convenience.
* **Extensive Integrations:** n8n boasts hundreds of pre-built integrations with popular applications, databases, and cloud services (e.g., Slack, GitHub, Google Sheets, Salesforce, HubSpot, OpenAI). If an integration doesn't exist, you can use the generic HTTP Request node or create custom nodes to connect to almost any API.
* **AI and LLM Capabilities:** n8n is well-positioned for the "AI age." It has native support for integrating with AI services like OpenAI's GPT models, Claude, and Hugging Face. This allows you to build sophisticated AI-powered workflows for tasks like summarizing content, generating replies, classifying data, and creating AI agents.
* **Use Cases:** n8n is used for a wide range of automation, including:
    * Automating repetitive tasks across various tools.
    * Building complex data pipelines (ETL).
    * Creating custom integrations between applications.
    * Marketing automation (lead capture, email campaigns).
    * CRM integration and data synchronization.
    * IT Operations (onboarding, security incident enrichment).
    * Building AI agents.
    * Customer support automation.


{{< details title="Why should you care about N8N? | Vibe Coding + JSON Driven Workflows 📌" closed="true" >}}

n8n (pronounced "n-eight-n") is a powerful and flexible workflow automation tool. Here's a breakdown of what it is and how you can work with its workflow JSON:

**Can you feed workflow JSON to n8n?**

**Absolutely, yes!** n8n workflows are essentially saved as JSON files.

This is a core feature that enables sharing, versioning, and **programmatic management of workflows**.

You can import and export workflows in several ways:

1.  **Copy-Paste in the UI:**
    * In the n8n Editor UI, you can select nodes (or the entire workflow) and copy them to your clipboard (`Ctrl+C` or `Cmd+C`).
    * You can then paste them (`Ctrl+V` or `Cmd+V`) into another n8n instance or even a text editor to see the JSON structure.
    * Conversely, you can copy workflow JSON from a file or another source and paste it directly into the n8n canvas to import it.

2.  **From the Editor UI Menu:**
    * **Download:** You can download your current workflow as a JSON file to your computer. This is great for backing up or sharing.
    * **Import from File:** You can upload a JSON file from your computer to import a workflow.
    * **Import from URL:** You can import workflow JSON directly from a URL (e.g., a GitHub Gist or a shared link).

3.  **From the Command Line (CLI):**
    * If you're self-hosting n8n (especially in Docker environments), you can use the n8n CLI to import and export workflows programmatically.
    * Commands like `n8n import:workflow --input=file.json` allow you to import workflows. This is particularly useful for DevOps practices, CI/CD pipelines, and managing workflows across different environments (development, staging, production).

**Benefits of using workflow JSON:**

* **Sharing:** Easily share workflows with others in the n8n community or within your team.
* **Version Control:** Store your workflow JSON files in Git or other version control systems, treating your automations as "code." This allows for tracking changes, reverting to previous versions, and collaborative development.
* **Vibe Coding / Building Outside n8n:** Yes, if you understand the n8n workflow JSON structure (which is fairly logical), you could technically "vibe code" or manually construct parts of a workflow in JSON and then import it. This is advanced, but certainly possible, especially for experienced developers.
* **Programmatic Deployment:** Automate the deployment of workflows to new n8n instances.
* **Community Templates:** The n8n community is active and shares many pre-built workflow templates in JSON format. You can find these on the official n8n website (under "Workflows" or "Templates") and in community forums/repositories.

{{< /details >}}

**Important Considerations when sharing/importing JSON:**

* **Credentials:** Workflow JSON files *include credential names and IDs*. While IDs aren't sensitive, the names could be. Crucially, **they generally do NOT include the actual sensitive credential data (like API keys)**. When you import a workflow, you'll need to manually re-link or create new credentials in your n8n instance for the workflow to function.
* **Webhook URLs:** If a workflow uses a Webhook trigger, the URL will be specific to the original n8n instance. When you import it, you'll likely need to generate a new Webhook URL for your instance and update any external services configured to call that webhook.
* **Node Versions:** Occasionally, if you import a workflow built with a much older or newer version of n8n, you might encounter minor compatibility issues or warnings about outdated nodes. These are usually easy to resolve by updating the nodes within the UI.

In summary, n8n is a highly capable and developer-friendly automation tool, and its reliance on JSON for workflow definition makes it incredibly flexible for sharing, managing, and integrating with your existing development workflows.

We can **embed n8n Chats** into our sites thanks to: https://www.npmjs.com/package/@n8n/chat

```sh
npm install @n8n/chat
```

There are many more possibilities by playing with: https://docs.n8n.io/api/#learn-about-rest-apis

* https://docs.n8n.io/integrations/community-nodes/installation/
  * https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.mailerlite/
  * https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.googledrive/
  * https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.stripe/
  * https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.telegram/
  * https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.youtube/
  * https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.invoiceninja/
* https://docs.n8n.io/integrations/builtin/node-types/

https://www.youtube.com/watch?v=Rmi-ckbMOQE


* https://github.com/n8n-io/self-hosted-ai-starter-kit

> The Self-hosted AI Starter Kit is an open-source template that quickly sets up a local AI environment. Curated by n8n, it provides essential tools for creating secure, self-hosted AI workflows.

<!-- https://www.youtube.com/watch?v=xQ1tCQZhLaI -->

<!-- 
https://drive.google.com/file/d/1QIyrIOWJFperDhzuvgDlB2xQCZ-eo79a/view
https://drive.google.com/drive/folders/1uYz0QUkGbGpsZJO2RcpvWD47GClcWeKd
 -->

![N8N](/blog_img/GenAI/NoCode-AI/n8n.png)

* You can build cool things with these:
  * https://formbricks.com/docs/xm-and-surveys/core-features/integrations/n8n
  * Or...embedable chat widget - https://www.npmjs.com/package/@n8n/chat


![N8N Interface](/blog_img/GenAI/NoCode-AI/n8n-ui.png)

<!-- https://www.youtube.com/watch?v=0KR8e4WP0E0 -->

{{< youtube "0KR8e4WP0E0" >}}


<!-- https://www.youtube.com/watch?v=dC2Q_cyzgjg -->

{{< youtube "dC2Q_cyzgjg" >}}

You can get ideas on what to build with n8n: https://n8n.io/workflows/

![alt text](/blog_img/selfh/n8n-sample-flow.png)

Like this one: https://n8n.io/workflows/4827-ai-powered-whatsapp-chatbot-for-text-voice-images-and-pdf-with-rag/


{{< callout type="warning" >}}
For [embedding n8n](https://n8n.io/embed/) you will need a license!
{{< /callout >}}


#### TG Bots

3. Telegram...bots?

They can be used via n8n: https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.telegram/

But also code driven, if you dare.

Sometime ago I was doing some tests with [tg bots](https://github.com/JAlcocerT/Private/tree/main/Web_scrapping/Py_BeautifulSoup/TelegramBot), but that was all before the LLM boom.

And definitely there are interesting bots outthere, like the `bibliotecasecreta.nl`:

* https://core.telegram.org/bots/api
  * https://pypi.org/project/python-telegram-bot/
  * https://github.com/python-telegram-bot/python-telegram-bot
  * https://docs.python-telegram-bot.org/en/stable/telegram.ext.application.html

```sh
pip install python-telegram-bot==22.0
```

{{< callout type="info" >}}
It was about time to make [a project again with a telegram bot](https://github.com/JAlcocerT/EntreAgujayPunto/tree/main/TelegramBot) 💻 (combined with [web](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/)!)
{{< /callout >}}

Its all done with Python and the following **project structure**:

{{< filetree/container >}}
  {{< filetree/folder name="TelegramBot" >}}
    {{< filetree/file name=".dockerignore" >}}
    {{< filetree/file name=".env" >}}
    {{< filetree/file name=".env.sample" >}}
    {{< filetree/file name="Dockerfile" >}}
    {{< filetree/folder name="Z_Tests" state="closed" >}}
      {{< filetree/file name="tg_bot_image5.py" >}}
      {{< filetree/file name="z_tg_bot_botchatero.py" >}}
    {{< /filetree/folder >}}
    {{< filetree/file name="docker-compose.yml" >}}
    {{< filetree/file name="readme.md" >}}
    {{< filetree/file name="requirements.txt" >}}
    {{< filetree/file name="tg_bot_agujapunto.py" >}}
    {{< filetree/folder name="tgbot_image_venv" state="closed" >}}
      {{< filetree/file name="lib/python3.10/site-packages/..." >}}
    {{< /filetree/folder >}}
    {{< filetree/folder name="tgbot_venv" state="closed" >}}
      {{< filetree/file name="lib/python3.10/site-packages/..." >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
{{< /filetree/container >}}

With a `.env` file like this one:

```
BOT_TOKEN=YOUR_BOT_TOKEN_HERE
CHAT_ID=YOUR_TELEGRAM_CHAT_ID_HERE
OPENAI_API_KEY=YOUR_OPENAI_API_KEY_HERE
```

{{< details title="Setup a TG Bot | BotFather and API Tokens 📌" closed="true" >}}

* Open the **Telegram** app and search for the "BotFather" user.
* Start a chat with BotFather and use the `/newbot` command to create a new bot.
* Name your bot: *botwithuniquename*
* The bot will be `botwithuniquename_bot` -> <https://t.me/botwithuniquename_bot>
* Follow the instructions to set a name and username for your bot.
* Once the bot is created, BotFather will provide you with an **API token**.
  *  Save this token; you'll need it in your Python code.

with **/token** you can change the token:

{{< /details >}}

With the API token, you can use this token to access the HTTP API for your new bot.

![Bot Father](/blog_img/dev/tg-botfather.png)

{{< details title="Telegram Bots in groups 📌" closed="true" >}}

You can definitely create a group in Telegram and add both regular users and bots to it.**

Here's how you would typically do it:

1.  **Create a New Group:**
    * Open your Telegram app.
    * Tap the "New Message" icon (usually a pencil in a circle).
    * Select "New Group".

2.  **Add the First Regular User:**
    * Telegram will ask you to select the first member for your group. Choose one of the regular users you want to include.
    * Tap "Next" (or a similar button).

3.  **Name Your Group:**
    * Give your group a name.
    * You can also set a group photo if you like.
    * Tap "Create" (or a similar button).

4.  **Add the Second Regular User:**
    * Once the group is created, open the group chat.
    * Tap on the group name at the top to view the group info.
    * Look for an option like "Add members" or a "+" icon.
    * Select the second regular user you want to add and tap "Add".

5.  **Add Your Bot:**
    * In the same "Add members" section of the group info, search for your bot's username (the one you chose when you created the bot with BotFather, usually ending in `_bot`).
    * Select your bot from the search results and tap "Add".

{{< /details >}}


**Important Considerations for Bots in Groups:**

* **Privacy Settings:** By default, bots in groups can only see messages that directly mention them (e.g., `@YourBotName some command`). If you want your bot to be able to read all messages in the group, you need to adjust its privacy settings via BotFather.
    * Talk to BotFather in Telegram.
    * Send the command `/setprivacy`.
    * Choose your bot from the list and see which one it has.
    * If its "Disable" your bot can read all messages. Be mindful of the implications of this setting.
* **Permissions:** As the group creator or an admin, you can manage the permissions of both regular users and bots within the group (e.g., who can send messages, add members, etc.).

![TG Bots Settings](/blog_img/dev/tb-mybots.png)

For me, using `/mybots` allow me to change it.


* To obtain your **chat ID on Telegram**, you can follow these steps:
  * Open the Telegram app on your mobile device or use the Telegram web version on your computer.
  * Start a chat with the "userinfobot." You can search for it by its username: @userinfobot.
  * Once you've started a chat with @userinfobot, send any message to it.
  * The `@userinfobot` will reply with information about your chat, including your chat ID. The chat ID will be a numerical value.
  * Copy the chat ID provided by @userinfobot. This is the ID you will use in your Python code as the chat_id variable.



{{< details title="Telegram Bots with LLMs 📌" closed="true" >}}

Instead of giving hardcoded replies, you can plug any LLM to process and reply the conversation

You could also manage to do Telegram Bots to download given images and then interprete it via a multi-modal model.

{{< /details >}}


> And if you are already getting ideas... https://core.telegram.org/bots/webapps

---

## FAQ

### F/OSS No Code Data Tools

* Node Red
* Apache Airflow

#### BaseRow

* The open platform to create scalable databases and applications—without coding - https://baserow.io/

https://gitlab.com/baserow/baserow
https://gitlab.com/baserow/baserow/-/blob/develop/LICENSE

Can be SelfHosted or use: https://baserow.io/database

> Baserow is an open source no-code database and Airtable alternative.

Create your own database without technical experience. Our user friendly no-code tool gives you the powers of a developer without leaving your browser.

* Focus: Open-source no-code database tool with a user-friendly interface resembling spreadsheets but with relational database capabilities.
* Strengths: Offers a visual interface for building tables, defining relationships, and managing data. Supports various data types, including files, formulas, and automations. Integrates with popular tools like Zapier and webhooks.
* Considerations: While feature-rich, it might not be as powerful as some options for complex relational modeling.

#### Others

* API Table - https://github.com/apitable/apitable
  * https://github.com/apitable/apitable?tab=AGPL-3.0-1-ov-file#readme
  * https://github.com/apitable/apitable#installation

* Rowy: https://github.com/rowyio/rowy?tab=readme-ov-file

Focus: Low-code backend platform for building internal tools and automating workflows.

Strengths: Flexible and customizable, allowing you to build custom interfaces, integrations, and automations. Supports a variety of data sources and connects to external APIs.

Considerations: Requires more development knowledge compared to other options. Might have a steeper learning curve for non-programmers.

4. Appsmith: https://www.appsmith.com/integration
https://github.com/appsmithorg/appsmith

Focus: Open-source **low-code platform** for building internal tools and custom applications.

Strengths: Visually build user interfaces using drag-and-drop functionality and connect to various data sources. Offers features like user authentication, form handling, and data integrations.

Considerations: While offering a visual interface, it might require some coding knowledge for complex functionalities.

> Platform to build admin panels, internal tools, and dashboards. Integrates with 25+ databases and any API.

* https://docs.appsmith.com/getting-started/setup/installation-guides/docker?utm_source=github&utm_medium=organic&utm_campaign=readme

```yml
services:
   appsmith:
     image: index.docker.io/appsmith/appsmith-ee
     container_name: appsmith
     ports:
         - "80:80"
         - "443:443"
     volumes:
         - ./stacks:/appsmith-stacks
     restart: unless-stopped
```


5. Budibase:

Focus: Open-source self-hosted alternative for building internal tools and managing data.

Strengths: Offers a modular architecture with components for building databases, forms, dashboards, and workflows. Supports user management, role-based access control, and data filtering.

Considerations: Relatively new project compared to some alternatives. Feature set might be under development.

* https://github.com/Budibase/budibase
* https://github.com/Budibase/budibase?tab=License-1-ov-file#readme

> Low code platform for building business apps and workflows in minutes. Supports PostgreSQL, MySQL, MSSQL, MongoDB, Rest API, Docker, K8s, and more 🚀

* https://github.com/RasaHQ/rasa
  * https://github.com/RasaHQ/rasa?tab=Apache-2.0-1-ov-file#readme

Rasa Open Source is the most popular open source framework for **building chat and voice-based AI assistants**.

> 💬 Open source machine learning framework to automate text- and voice-based conversations: NLU, dialogue management, connect to Slack, Facebook, and more - Create chatbots and voice assistants