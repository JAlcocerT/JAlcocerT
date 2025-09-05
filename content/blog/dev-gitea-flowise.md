---
title: "Flowise and Gitea"
date: 2025-09-05T10:20:21+01:00
draft: false
tags: ["HomeLab","Flowise vs Gitea","Web","LLM APIs"]
description: 'Flowise workflow to Gitea.'
url: 'flowise-and-gitea'
---


**Tl;DR**

I dont quite like having some *use enterprise version* within n8n.

So putting together a [Flowise](#flowise-ai) x Gitea stack that is F/OSS (Apache v2 and MIT)

**Intro**


### Flowise AI

Most important, among similar [low/nocode tools](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#flowise-ai), FlowiseAI is OSS Licensed with Apache v2.


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/flowise-ai" title="FlowiseAI | HomeLab Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/FlowiseAI" title="FlowiseAI | Docker Configs 🐋 ↗" >}}
{{< /cards >}}


```sh
git clone https://github.com/FlowiseAI/Flowise
cd ./Flowise/docker
cp .env.example .env

cat <<EOL >> .env
FLOWISE_USERNAME=teco
FLOWISE_PASSWORD=paco
EOL

sudo docker compose up -d
```


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Chats/Chatwoot" title="ChatWoot with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/NoCode/n8n" title="N8N with Docker 🐋 ↗" >}}
{{< /cards >}}

https://docs.flowiseai.com/integrations

### Flowise API SDK Embed

Extend and integrate to your applications using APIs, SDK and Embedded Chat

* APIs: https://docs.flowiseai.com/api-reference
* Embedded Widget: https://docs.flowiseai.com/using-flowise/embed
* Typescript & Python SDK


<!-- https://www.youtube.com/watch?v=XOeCV1xyN48 -->

{{< youtube "XOeCV1xyN48" >}}


### Connect to Flowise

If you want, plug **your Ollama** instance to Flowise:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Chats/Chatwoot" title="ChatWoot with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/NoCode/n8n" title="N8N with Docker 🐋 ↗" >}}
{{< /cards >}}

```sh
cd gitea
sudo docker-compose up -d

#sudo docker ps | grep ollama
docker network connect cloudflared_tunnel gitea #network -> container name
#docker inspect gitea --format '{{json .NetworkSettings.Networks}}' | jq
```

Or just use **3rd parties LLMs**:

* Groq: https://console.groq.com/keys
* Gemini (Google): https://ai.google.dev/gemini-api/docs
* Mixtral: https://docs.mistral.ai/api/
* Anthropic (Claude) - https://www.anthropic.com/api
  * https://console.anthropic.com
  * https://console.anthropic.com/settings/keys
* Open AI: https://platform.openai.com/api-keys
* Grok: https://x.ai/api
    * https://console.x.ai/


```sh
cd gitea
sudo docker-compose up -d

#sudo docker ps | grep flowise
docker network connect cloudflared_tunnel gitea #network -> container name
#docker inspect gitea --format '{{json .NetworkSettings.Networks}}' | jq
```


---

## FAQ

### Flowise x Python SDK

The Flowise SDK for Python provides an easy way to interact with the Flowise API for creating predictions, supporting both streaming and non-streaming responses. This SDK allows users to create predictions with customizable options, including history, file uploads, and more.

https://github.com/FlowiseAI/FlowisePy



```sh
git clone https://github.com/HenryHengZJ/flowise-streamlit

uv init
uv add -r requirements.txt
uv sync
```

```sh
#cp -n .streamlit/secrets_example.toml .streamlit/secrets.toml && ls -l .streamlit/secrets.toml

cat <<'EOL' >> .streamlit/secrets.toml
APP_URL = "http://192.168.1.11:3025"
FLOW_ID = "123456789"
EOL

uv run streamlit run streamlit_app.py
```