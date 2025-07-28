---
title: "ChatBots with AI: Langflow and other OS Tools "
date: 2024-08-08T00:20:21+01:00
draft: false
cover:
    image: "https://socialify.git.ci/langflow-ai/langflow/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"    
    alt: "Using LangFlow to create ChatBots" # alt text
    caption: "AI ChatBots 101" # display caption under cover
tags: ["Gen-AI","OSS for Business"]
description: 'LangFlow. AI chatbots with open source'
summary: 'How to use open source ChatBots Tools: LangFlow, BotPress, TypeBot, FlowiseAI and ChatWoot'
url: 'free-open-source-chat-bots'
---

<!-- 
Alternatives to https://www.livechat.com/pricing/ ING uses it
 -->

Recently I have been exploring PandasAI to learn **how to create RAGs** over local data.

![If you are a programmer](/img/GenAI/llms-frameworks.webp#center)

Some people say that OpenAI + LangChain is the way, is it right?

<!-- 
https://dev.to/worldlinetech/in-bed-with-gpt-and-nodejs-4kh2 
-->

That's all via code.

Found these interesting projects to **create ChatBots through UI**:

<!-- * [LangFlow](#langflow) - Low Code App Builder for RAG & Multi-Agent AI
* [BotPress](#botpress)
* [Typebot](#typebot)
* [FlowiseAI](#flowiseai) - a UI for LangChain (JS)
* [ChatWoot](#chatwoot) -->


| **Tool**         | Description                                 | License Type          |
|--------------|---------------------------------------------|-----------------------|
| [LangFlow](#langflow)   | Low Code App Builder for **RAG** & Multi-Agent AI | MIT❤️   |
| [BotPress](#botpress)  | Conversational AI platform for building bots | AGPL-3.0✅|             
| [Typebot](#typebot)     | Conversational app builder with a visual interface |AGPLv3 ✅|
| [FlowiseAI](#flowiseai) | A UI for LangChain (JS)             | Apache v2 ✅           |
| [ChatWoot](#chatwoot)   | Open-source customer engagement suite | Mixed MIT License ❗ |

> Let's make [LangFlow work for x86 and ARM64](#how-to-use-langflow) and compare it with other ChatBots

<!-- [![Star History Chart](https://api.star-history.com/svg?repos=AmruthPillai/Reactive-Resume,botpress/botpress&type=Date)](https://star-history.com/#AmruthPillai/Reactive-Resume&botpress/botpress&Date) -->

## Open Source Chatbots

[![Star History Chart](https://api.star-history.com/svg?repos=botpress/botpress,langflow-ai/langflow,baptisteArno/typebot.io,chatwoot/chatwoot,FlowiseAI/Flowise&type=Date)](https://star-history.com/#botpress/botpress&langflow-ai/langflow&baptisteArno/typebot.io&chatwoot/chatwoot&FlowiseAI/Flowise&Date)

> Let's see how to use some of these ChatBot Tools step by step

### The LangFlow Project


LangFlow uses **LangChain Python** under the hood and allow us to quickly prototype AI ChatBots:

The **LangFlow Project details**:

* https://github.com/langflow-ai/langflow - MIT Licensed ❤️!
* https://docs.langflow.org/getting-started-installation
  * https://docs.langflow.org/deployment-docker
  * https://pypi.org/project/langflow/

> A visual framework for building multi-agent and RAG applications. Fully customizable, model and vector store agnostic. For the friends - a UI for LangChain (Py)

* In a rush?
  * Use Langflow with Docker with their Container Image: https://hub.docker.com/r/langflowai/langflow

```sh
docker run -it --rm -p 7860:7860 langflowai/langflow:latest
#docker run -d -p 7860:7860 langflowai/langflow:latest
```

![LangFlow Docker](/img/SelfHosting/ChatBots/LangFlow.png#center)

> LangFlow is ready at `localhost:7860`

You will be able to embed the LangFlow's Flow at your web with a Chat Widget:

```html
<script src="https://cdn.jsdelivr.net/gh/logspace-ai/langflow-embedded-chat@v1.0.4/dist/build/static/js/bundle.min.js"></script>
<langflow-chat
  window_title="(Hello, F/OSS!)"
  flow_id="some-flow-id"
  host_url="http://localhost:7860">
</langflow-chat>
```


> ⛓️ Langflow is a **visual framework** for building **multi-agent and RAG applications**. It's open-source, Python-powered, fully customizable, model and vector store agnostic.

<!-- 
https://www.youtube.com/watch?v=sC9SV06gsDM
LangFlow Tutorial #1: Build AI-Powered Apps without Coding!
Leon Van ZYl -->

{{< dropdown title="SelfHost LangFlow with Docker⏬" closed="true" >}}

* Use LangFlow Docker Image (working for x86 at the moment of writing)

```sh
podman run -it --rm -p 7860:7860 langflowai/langflow:latest
```

The Docker-Compose for LangFlow with PostGres DB:

```yml
version: "3.8"

services:
  langflow:
    image: langflowai/langflow:latest
    ports:
      - "7860:7860"
    depends_on:
      - postgres
    environment:
      - LANGFLOW_DATABASE_URL=postgresql://langflow:langflow@postgres:5432/langflow
      # This variable defines where the logs, file storage, monitor data and secret keys are stored.
    volumes:
      - langflow-data:/app/langflow

  postgres:
    image: postgres:16
    environment:
      POSTGRES_USER: langflow
      POSTGRES_PASSWORD: langflow
      POSTGRES_DB: langflow
    ports:
      - "5432:5432"
    volumes:
      - langflow-postgres:/var/lib/postgresql/data

volumes:
  langflow-postgres:
  langflow-data:
```

{{< /dropdown >}}

#### SelfHosting LangFlow

Build your own LangFlow Container Image and expose it with Cloudflare Tunnels:

{{< dropdown title="Create LangFlow Docker Image for ARM64 ⏬" closed="true" >}}

<!-- 
https://github.com/JAlcocerT/langflow/
-->

At this moment, they have released the **LangFlow version 1.0.12**, which you can place inside a container image:

```sh
git clone https://github.com/langflow-ai/langflow
cd langflow

docker build -t langflow -f ./docker/build_and_push.Dockerfile .   
#podman run -it --rm -p 7860:7860 langflowai/langflow:latest #out of the box image
```

And then when running it...

```sh
docker run -it --rm -p 7860:7860 langflow:latest
#docker run -d -p 7860:7860 langflowai/langflow:latest
```

I had this error: `/app/.venv/bin/python: No module named langflow.__main__; 'langflow' is a package and cannot be directly executed`

The Docker-Compose for **LangFlow together with DB for ARM64**: with the just built the ` 	langflow:latest` container image

```yml
version: "3.8"

services:
  langflow:
    image: langflow #langflowai/langflow:latest
    container_name: langflow
    ports:
      - "7860:7860"
    depends_on:
      - postgres
    environment:
      - LANGFLOW_DATABASE_URL=postgresql://langflow:langflow@postgres:5432/langflow
      # This variable defines where the logs, file storage, monitor data and secret keys are stored.
    volumes:
      - langflow-data:/app/langflow
    networks:
      - cloudflare_tunnel      

  postgres:
    image: postgres:16
    environment:
      POSTGRES_USER: langflow
      POSTGRES_PASSWORD: langflow
      POSTGRES_DB: langflow
    ports:
      - "5432:5432"
    volumes:
      - langflow-postgres:/var/lib/postgresql/data
    networks:
      - cloudflare_tunnel
      # - nginx_default      
    restart: always      

networks:
  cloudflare_tunnel:
    external: true
  # nginx_default:
  #   external: true      

volumes:
  langflow-postgres:
  langflow-data:
```

{{< /dropdown >}}



{{< dropdown title="Quickly checking how LangFlow works with Python ⏬" closed="true" >}}

```sh
python -m venv langflow #create the venv (python3 if you are in mac/linux)

langflow\Scripts\activate #activate venv (windows)
source langflow/bin/activate #(linux)

pip install langflow #https://pypi.org/project/langflow/  #--pre --force-reinstall 

#langflow run
#python -m langflow run

#deactivate #when you are done
```

{{< /dropdown >}}

{{< dropdown title="LangFlow With Python ⏬" closed="true" >}}

Acces LangFlow at `localhost:7860`

> And **LangFlow** will be **available at**: `http://127.0.0.1:7860`

{{< /dropdown >}}

{{< dropdown title="LangFlow with OpenAI API Key ⏬" closed="true" >}}


{{< /dropdown >}}

#### How to Embed LangFlow

* https://github.com/langflow-ai/langflow-embedded-chat

You will get a MIT Licensed Widget on your Page


### Botpress


* {{< newtab url="https://botpress.com/" text="The Botpress Official Site" >}} - Botpress | AI Chatbot Platform
* {{< newtab url="https://github.com/botpress/botpress" text="The Botpress Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/botpress/botpress?tab=MIT-1-ov-file#readme" text="MIT" >}} ❤️

> The all-in-one platform for **delivering ChatBots** powered by the latest LLMs.

{{< dropdown title="How to Setup Botpress ⏬" closed="true" >}}
<!-- https://www.youtube.com/@Botpress/featured -->
<!-- https://botpress.com/blog -->

* https://hub.docker.com/r/botpress/server

```sh
docker run -d --name=botpress -p 3000:3000 botpress/server
```

>  The open-source hub to build & deploy GPT/LLM Agents ⚡️ 

{{< /dropdown >}}

* https://botpress.com/hub?type=Integration


### TypeBot

* https://docs.typebot.io/self-hosting/deploy/docker
* https://github.com/baptisteArno/typebot.io - AGPLv3


{{< dropdown title="How to Setup TypeBot Step By Step ⏬" closed="true" >}}

https://docs.typebot.io/self-hosting/deploy/docker

```sh
wget https://raw.githubusercontent.com/baptisteArno/typebot.io/latest/docker-compose.yml
wget https://raw.githubusercontent.com/baptisteArno/typebot.io/latest/.env.example -O .env
```

```sh
openssl rand -base64 24 | tr -d '\n' ; echo
```

And then spin up TypeBot with:
```sh
docker-compose up -d
```

> Typebot will be available at: `localhost:3000`

{{< /dropdown >}}

### ChatWoot

* {{< newtab url="/selfhosting-chatwoot" text="ChatWoot with Docker" >}} - Mixed MIT License ❗

{{< dropdown title="Quick Chatwoot Setup ⏬" closed="true" >}}

```sh
# Download the env file template
wget -O .env https://raw.githubusercontent.com/chatwoot/chatwoot/develop/.env.example
# Download the Docker compose template
wget -O docker-compose.yaml https://raw.githubusercontent.com/chatwoot/chatwoot/develop/docker-compose.production.yaml

##Add password for postgres and Redis
#openssl rand -base64 12
#pwgen 16 1
nano .env
nano docker-compose.yml #modify also the UI port, to not be restricted to local host '3000:3000' 

#add redit and postg pass
docker compose run --rm rails bundle exec rails db:chatwoot_prepare
docker compose up -d
```

> ChatWoot available at: `localhost:3000`

Make your own ChatWoot container:
```sh
git clone https://github.com/chatwoot/chatwoot.git
#https://github.com/chatwoot/chatwoot/tree/3558878ae2de44dc3fc9aad808beb1df9c8becd2
cd chatwoot

apt install make
time make docker
```

{{< /dropdown >}}

* Now you can have your Website Live chat - https://www.chatwoot.com/hc/user-guide/articles/1677580558-website-live-chat-settings-explained
  * https://www.chatwoot.com/hc/user-guide/articles/1677580558-website-live-chat-settings-explained#business-hours-tab
  * You will get a custom **JS script to embed in your website**

![ChatWoot](/img/SelfHosting/ChatBots/chatwoot_livechat.png#center)

* You can also use it with Telegram:

```sh
/newbot #you will name it
```

and will get something like: random_number:random_string

* And there is Android App as well: https://play.google.com/store/apps/details?id=com.chatwoot.app&hl=es_419

### FlowiseAI


<!-- 
* {{< newtab url="https://fossengineer.com/embedchain-ai/" text="Mem0, ex-EmbedChain" >}} -->


[FlowiseAI](/selfhosting-flowise-ai) Project Details - which it is Apache v2 Licensed ✅

It uses LangChain (the JavaScript version) - https://github.com/langchain-ai/langchainjs - also MIT Licensed as the python one.

* It works out of the box for both, x86 and ARM64 💞

{{< dropdown title="Quick FlowiseAI Setup ⏬" closed="true" >}}

```sh
git clone https://github.com/FlowiseAI/Flowise
#https://github.com/FlowiseAI/Flowise/commit/7153093bfc8c30d7095ac747e9d6a43fbc804c5d
#git checkout 7153093bfc8c30d7095ac747e9d6a43fbc804c5d

cd ./Flowise/docker
cp .env.example .env

cat <<EOL >> .env
FLOWISE_USERNAME=jalcocert
FLOWISE_PASSWORD=youramazingpassword
EOL
```

Then, just spin FlowiseAI:

```sh
sudo docker-compose up -d
```

FlowiseAI is ready for you at: `http://localhost:3000`

{{< /dropdown >}}



#### How to Embed FlowiseAI

* https://github.com/FlowiseAI/FlowiseChatEmbed

You will get also a **MIT Licensed Widget** on your Page


{{< dropdown title="Flowise AI | Website Embed 101 👇" closed="true" >}}

```html
<script type="module">
  import Chatbot from 'https://cdn.jsdelivr.net/npm/flowise-embed/dist/web.js';
  Chatbot.init({
    chatflowid: '<chatflowid>',
    apiHost: 'http://localhost:3000',
  });
</script>
```

Or the full config with:

```html
<script type="module">
  import Chatbot from 'https://cdn.jsdelivr.net/npm/flowise-embed/dist/web.js';
  Chatbot.init({
    chatflowid: '91e9c803-5169-4db9-8207-3c0915d71c5f',
    apiHost: 'http://localhost:3000',
    chatflowConfig: {
      // topK: 2
    },
    observersConfig: {
      // (optional) Allows you to execute code in parent based upon signal observations within the chatbot.
      // The userinput field submitted to bot ("" when reset by bot)
      observeUserInput: (userInput) => {
        console.log({ userInput });
      },
      // The bot message stack has changed
      observeMessages: (messages) => {
        console.log({ messages });
      },
      // The bot loading signal changed
      observeLoading: (loading) => {
        console.log({ loading });
      },
    },
    theme: {
      button: {
        backgroundColor: '#3B81F6',
        right: 20,
        bottom: 20,
        size: 48, // small | medium | large | number
        dragAndDrop: true,
        iconColor: 'white',
        customIconSrc: 'https://raw.githubusercontent.com/walkxcode/dashboard-icons/main/svg/google-messages.svg',
        autoWindowOpen: {
          autoOpen: true, //parameter to control automatic window opening
          openDelay: 2, // Optional parameter for delay time in seconds
          autoOpenOnMobile: false, //parameter to control automatic window opening in mobile
        },
      },
      tooltip: {
        showTooltip: true,
        tooltipMessage: 'Hi There 👋!',
        tooltipBackgroundColor: 'black',
        tooltipTextColor: 'white',
        tooltipFontSize: 16,
      },
      chatWindow: {
        showTitle: true,
        showAgentMessages: true,
        title: 'Flowise Bot',
        titleAvatarSrc: 'https://raw.githubusercontent.com/walkxcode/dashboard-icons/main/svg/google-messages.svg',
        welcomeMessage: 'Hello! This is custom welcome message',
        errorMessage: 'This is a custom error message',
        backgroundColor: '#ffffff',
        backgroundImage: 'enter image path or link', // If set, this will overlap the background color of the chat window.
        height: 700,
        width: 400,
        fontSize: 16,
        starterPrompts: ['What is a bot?', 'Who are you?'], // It overrides the starter prompts set by the chat flow passed
        starterPromptFontSize: 15,
        botMessage: {
          backgroundColor: '#f7f8ff',
          textColor: '#303235',
          showAvatar: true,
          avatarSrc: 'https://raw.githubusercontent.com/zahidkhawaja/langchain-chat-nextjs/main/public/parroticon.png',
        },
        userMessage: {
          backgroundColor: '#3B81F6',
          textColor: '#ffffff',
          showAvatar: true,
          avatarSrc: 'https://raw.githubusercontent.com/zahidkhawaja/langchain-chat-nextjs/main/public/usericon.png',
        },
        textInput: {
          placeholder: 'Type your question',
          backgroundColor: '#ffffff',
          textColor: '#303235',
          sendButtonColor: '#3B81F6',
          maxChars: 50,
          maxCharsWarningMessage: 'You exceeded the characters limit. Please input less than 50 characters.',
          autoFocus: true, // If not used, autofocus is disabled on mobile and enabled on desktop. true enables it on both, false disables it on both.
          sendMessageSound: true,
          // sendSoundLocation: "send_message.mp3", // If this is not used, the default sound effect will be played if sendSoundMessage is true.
          receiveMessageSound: true,
          // receiveSoundLocation: "receive_message.mp3", // If this is not used, the default sound effect will be played if receiveSoundMessage is true.
        },
        feedback: {
          color: '#303235',
        },
        footer: {
          textColor: '#303235',
          text: 'Powered by',
          company: 'Flowise',
          companyLink: 'https://flowiseai.com',
        }
      },
    },
  });
</script>
```

{{< /dropdown >}}

---


## Conclusions

Now you can **include those free chatbots in your websites** created with... yea, open source!

> Which websites am I talking about? Free?

Thats right, you have many options to create your Website with Open Source:

1. With Drag-n-Drop, the SelfHosted versions of: [WordPress](/selfhosting-wordpress-docker/) / [Ghost](/selfhosting-ghost-docker/) / [Grav](/selfhosting-grav-docker/)
2. For Developers, static websites made with SSG's: [NextJS](/nextjs-ssg/) / [HUGO](/web-guide-Hugo/) / [Astro](/astro-ssg/) / [With R](/r-knitt-package-guide)

{{< dropdown title="Whatever website and ChatBot you choose - combine it ⏬" closed="true" >}}

**Example with TypeBot**:

https://docs.typebot.io/deploy/web/libraries/html-javascript

Popup window after 3 seconds:
```js
<script type="module">
  import Typebot from 'https://cdn.jsdelivr.net/npm/@typebot.io/js@0.3/dist/web.js'

  Typebot.initPopup({
    typebot: 'my-typebot',
    apiHost: 'http://localhost:3001',
    autoShowDelay: 3000,
  })
</script>
```

{{< /dropdown >}}

### It's all about RAGs

There are several RAG frameworks out there, for example:

* {{< newtab url="https://fossengineer.com/embedchain-ai/" text="Mem0, ex-EmbedChain" >}}

---

## FAQ

### How to Monitor the Status of your ChatBots

* {{< newtab url="/selfhosting-uptime-Kuma-docker" text="Setup Uptime Kuma" >}}

### Free and Open Source No/Low Code Tools

* NodeRed

* ToolJet - https://github.com/ToolJet/ToolJet?ref=fossengineer.com (aGPL v3.0)

{{< dropdown title="More about ToolJet and how to Set it up⏬" closed="true" >}}

* Low-code platform for building business applications. Connect to databases, cloud storages, GraphQL, API endpoints, Airtable, Google sheets, OpenAI, etc and build apps using drag and drop application builder. Built using JavaScript/TypeScript. 🚀 
* Visual App Builder: 45+ built-in responsive components, including Tables, Charts, Lists, Forms, and Progress Bars.

* https://docs.tooljet.com/docs/setup/docker/?ref=fossengineer.com

```sh
docker run \
  --name tooljet \
  --restart unless-stopped \
  -p 80:80 \
  --platform linux/amd64 \
  -v tooljet_data:/var/lib/postgresql/13/main \
  tooljet/try:EE-LTS-latest
```

{{< /dropdown >}}


### F/OSS Tools to Create Custom Agents

* You can also check {{< newtab url="https://fossengineer.com/embedchain-ai/" text="Mem0, ex-EmbedChain" >}}

{{< dropdown title="Quick EmbedChain Code ⏬" closed="true" >}}


{{< /dropdown >}}

{{< dropdown title="Quick FlowiseAI Setup ⏬" closed="true" >}}


{{< /dropdown >}}

### F/OSS AI Monitoring Tools

* https://github.com/openlit/openlit - Apache v2 Licensed ✅

>  Complete **Observability and Evals for the Entire GenAI Stack**, from LLMs to GPUs. Improve your LLM apps from playground to production

{{< dropdown title="How to use OpenLit ⏬" closed="true" >}}

```sh
git clone https://github.com/openlit/openlit 
cd openlit

#git checkout fc56d05d93a7046335534e6fe9ccf57443f523b8
docker-compose up -d #modify it if your ports are busy already
```

> OpenLit will be available at `localhost:3000`

There is a Python SDK - https://github.com/openlit/openlit/tree/main/sdk/python // https://pypi.org/project/openlit/
{{< /dropdown >}}

* https://github.com/kuvasz-uptime/kuvasz

> Kuvasz (pronounce as [ˈkuvɒs]) is an open-source uptime and SSL monitoring service, built in Kotlin

* https://github.com/openstatusHQ/openstatus

> 🏓 The open-source synthetic monitoring platform 🏓

* https://github.com/chamanbravo/upstat

> 🟢 a simple open-source, self-hosted status monitoring tool

