---
title: "No Code Tools to use Gen AI"
date: 2025-04-19T23:20:21+01:00
draft: false
tags: ["Gen-AI","Python","Dev","ChatBots","TelegramBots"]
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

* **Flowise AI**, a groundbreaking Free platform that is making AI more accessible than ever before.
  * {{< newtab url="https://flowiseai.com/" text="The Flowise AI Official Page" >}}
  * {{< newtab url="https://github.com/FlowiseAI/Flowise" text="The Flowise AI Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/FlowiseAI/Flowise?tab=Apache-2.0-1-ov-file#readme" text="Apache v2" >}} ✅

<!-- https://www.youtube.com/watch?v=SASUXOV7tEQ -->

{{< youtube "SASUXOV7tEQ" >}}


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/FlowiseAI" title="FlowiseAI Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}


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

2. N8N

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


#### TG Bots

3. Telegram...bots?


Sometime ago I was doing some tests with [tg bots](https://github.com/JAlcocerT/Private/tree/main/Web_scrapping/Py_BeautifulSoup/TelegramBot), but that was all before the LLM boom.

And definitely there are interesting bots outthere, like the bibliotecasecreta.nl
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

Its all done with Python and the following structure:

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

{{< /details >}}

{{< details title="Telegram Bots to download given images 📌" closed="true" >}}



{{< /details >}}


> And if you are already getting ideas... https://core.telegram.org/bots/webapps

---

## FAQ

### F/OSS No Code Data Tools

#### BaseRow

* The open platform to create scalable databases and applications—without coding - https://baserow.io/

https://gitlab.com/baserow/baserow
https://gitlab.com/baserow/baserow/-/blob/develop/LICENSE

Can be SelfHosted or use: https://baserow.io/database

Baserow is an open source no-code database and Airtable alternative.

Create your own database without technical experience. Our user friendly no-code tool gives you the powers of a developer without leaving your browser.

* Focus: Open-source no-code database tool with a user-friendly interface resembling spreadsheets but with relational database capabilities.
* Strengths: Offers a visual interface for building tables, defining relationships, and managing data. Supports various data types, including files, formulas, and automations. Integrates with popular tools like Zapier and webhooks.
* Considerations: While feature-rich, it might not be as powerful as some options for complex relational modeling.

#### Other

  * API Table - https://github.com/apitable/apitable
  https://github.com/apitable/apitable?tab=AGPL-3.0-1-ov-file#readme
    * https://github.com/apitable/apitable#installation

Rowy: https://github.com/rowyio/rowy?tab=readme-ov-file

Focus: Low-code backend platform for building internal tools and automating workflows.
Strengths: Flexible and customizable, allowing you to build custom interfaces, integrations, and automations. Supports a variety of data sources and connects to external APIs.
Considerations: Requires more development knowledge compared to other options. Might have a steeper learning curve for non-programmers.

4. Appsmith: https://www.appsmith.com/integration
https://github.com/appsmithorg/appsmith

Focus: Open-source **low-code platform** for building internal tools and custom applications.
Strengths: Visually build user interfaces using drag-and-drop functionality and connect to various data sources. Offers features like user authentication, form handling, and data integrations.
Considerations: While offering a visual interface, it might require some coding knowledge for complex functionalities.

> Platform to build admin panels, internal tools, and dashboards. Integrates with 25+ databases and any API.

https://docs.appsmith.com/getting-started/setup/installation-guides/docker?utm_source=github&utm_medium=organic&utm_campaign=readme

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

https://github.com/Budibase/budibase
https://github.com/Budibase/budibase?tab=License-1-ov-file#readme


> Low code platform for building business apps and workflows in minutes. Supports PostgreSQL, MySQL, MSSQL, MongoDB, Rest API, Docker, K8s, and more 🚀



* https://github.com/RasaHQ/rasa
https://github.com/RasaHQ/rasa?tab=Apache-2.0-1-ov-file#readme

Rasa Open Source is the most popular open source framework for **building chat and voice-based AI assistants**.

> 💬 Open source machine learning framework to automate text- and voice-based conversations: NLU, dialogue management, connect to Slack, Facebook, and more - Create chatbots and voice assistants



### Other F/OSS No Code Tools

* Node Red
* Apache Airflow