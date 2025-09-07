---
title: "Automatic Post creation for SSG Workflows"
date: 2025-09-05T08:20:21+01:00
draft: false
tags: ["Dev","n8n vs Gitea","Web","Markdown","Docker Networking"]
description: 'From n8n workflow to Gitea.'
url: 'n8n-and-gitea'
---

**TL;DR** 

Lately, I have been playing with Gitea's API on [this post](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/#gitea-101) and vibed coded [some .md next to its deployment](https://github.com/JAlcocerT/Home-Lab/tree/main/gitea) to understand it in the future.

It made me think how to combine Gitea as a source for SSG for website generation.

> And million more ideas

While the posts skeletons could be passed into a n8n workflow, with some openai LLMs / codex / whatever to shape them as per some input data.

Scrapping from a website, data formatting for real estate or events...you name it.

**Intro**

Just get your server and containers going:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gitea" title="Gitea | Docker Config 🐋 ↗" >}}
{{< /cards >}}


## The n8n x Gitea Stack

This is very simple:

```sh
git clone https://github.com/JAlcocerT/Home-Lab
```

1. Get n8n ready:

```sh
cd n8n
sudo docker-compose up -d
```

> Login via `http://192.168.1.11:5678/home/workflows`

Or just make your n8n public via CF Tunnels:

```sh
sudo docker network ls
#docker network ls | grep cloudflared_tunnel
#sudo docker ps | grep n8n
docker network connect cloudflared_tunnel n8n-n8n-1 #network -> container name
```

Verify:

```sh
#docker inspect n8n-n8n-1 --format '{{json .NetworkSettings.Networks}}' | jq
```

> Go to CF zero trust section and add as http `n8n-n8n-1:5678` as subdomain and enjoy `https://n8n.jalcocertech.com/home/workflows`

2. Get Gitea ready: https://github.com/go-gitea/gitea

> MIT  Git with a cup of tea! Painless self-hosted all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD 

```sh
cd gitea
sudo docker-compose up -d

#sudo docker ps | grep gitea
docker network connect cloudflared_tunnel gitea #network -> container name
#docker inspect gitea --format '{{json .NetworkSettings.Networks}}' | jq
```

> Similarly, add the `gitea:3000` and enjoy your public gitea: `https://git.jalcocertech.com/`

{{< callout type="info" >}}
You can do a lot with **GITEA API**, as I covered [here](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/#gitea-101)
{{< /callout >}}

### N8N API

When you get n8n ready, create your API key:

![alt text](/blog_img/GenAI/n8n/n8n-api.png)

Then, get familiar with the docs `https://n8n.jalcocertech.com/api/v1/docs/` as per https://docs.n8n.io/api/

> Its just a Swagger UI!


Get your `n8n_api` and `N8N_BASE_URL`:

```sh
source .env
#the API  requires auth!
#curl -s "http://localhost:5678/api/v1/health" | jq .
```

So you need to go to the swagger UI and authorized the created API:

![alt text](/blog_img/GenAI/n8n/n8n-api-swagger-auth.png)

Only after that, this will work and you will get/pull workflows:

```sh
  curl -s \
    -H "X-N8N-API-KEY: $n8n_api" \
    "$N8N_BASE_URL/api/v1/workflows" | jq .
```

See

```sh
curl -s \
  -H "X-N8N-API-KEY: $n8n_api" \
  "https://n8n.jalcocertech.com/api/v1/me" | jq .
```

{{< callout type="info" >}}
You can build your workflows, or get inspired on n8n JSON people shared 
{{< /callout >}}

* https://n8n.io/workflows
* https://github.com/enescingoz/awesome-n8n-templates

> Supercharge your workflow automation with this curated collection of n8n templates! Instantly connect your favorite apps-like Gmail, Telegram, Google Drive, Slack, and more-with ready-to-use, AI-powered automations. Save time, boost productivity, and unlock the true potential of n8n in just a few clicks.

Create a n8n workflow via CLI:

```sh
#  -H "X-N8N-API-KEY: YOUR_API_KEY" \

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "X-N8N-API-KEY: $n8n_api" \
  "https://n8n.jalcocertech.com/api/v1/workflows" \
  -d '{
    "name": "My API-created workflow",
    "nodes": [],
    "connections": {},
    "active": false
  }' | jq .
```

Get the workflowID:



And activate the wID:


Finally, execute the n8n workflow manually:

```sh
curl -s -X POST \
  -H "Content-Type: application/json" \
  "$N8N_BASE_URL/webhook/api-created-hook" \
  -d '{"hello":"world"}' | jq .
```

### N8N Example Workflows

With OpenAI, with GeminiAPI

#### Sample 1

* https://n8n.io/workflows/6270-build-your-first-ai-agent/

![alt text](/blog_img/GenAI/n8n/n8n-sample-1.png)

![alt text](/blog_img/GenAI/n8n/n8n-gemini.png)
<!-- 
https://www.youtube.com/watch?v=laHIzhsz12E -->

{{< youtube "laHIzhsz12E" >}}

For this one, we need **gemini API**: https://aistudio.google.com/app/apikey

![alt text](/blog_img/GenAI/n8n/gemini-api.png)

```sh
#source .env
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent" \
  -H 'Content-Type: application/json' \
  -H 'X-goog-api-key: GEMINI_API_KEY' \
  -X POST \
  -d '{
    "contents": [
      {
        "parts": [
          {
            "text": "Explain how AI works in a few words"
          }
        ]
      }
    ]
  }'
```

#### Sample 2

Get your OpenAI API: https://platform.openai.com/api-keys

With OpenAI: https://n8n.io/workflows/4696-conversational-telegram-bot-with-gpt-5gpt-4o-for-text-and-voice-messages/

* https://n8n.io/workflows/4696-conversational-telegram-bot-with-gpt-5gpt-4o-for-text-and-voice-messages/

--- 

## Conclusions

If you are doing still your social media ,manually'.

You should probably have a look at this kind of n8n setups, together [with PostIZ](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#how-to-setup-postiz).
