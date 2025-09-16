---
title: "How to use Grok (X) API"
date: 2025-05-08
draft: false
tags: ["AI","LLM","Grok API","Live Search"]
description: 'A Recap on AI APIs calls and learning how to use Grok API'
url: 'how-to-use-grok-api'
---

* https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/GrokAPI 🐍

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Multi-Agents" title="Multi-Agents" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Tinkering with Agents" >}}
{{< /cards >}}

## About Grok

* https://x.ai/api
    * https://console.x.ai/
    * https://docs.x.ai/docs/overview
    * https://docs.x.ai/docs/models

{{< callout type="info" >}}
**Paywalled**. You need to **top up** the account to use the API.
{{< /callout >}}

All the learnings are collected:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/flask_sensor_display" title="Flask Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

## Using Grok API

After inserting the **credits ($) first**, and just try that Grok API works:


```sh
curl https://api.x.ai/v1/chat/completions -H "Content-Type: application/json" -H "Authorization: Bearer xai-somecoolapikey" -d '{
  "messages": [
    {
      "role": "system",
      "content": "You are a test assistant."
    },
    {
      "role": "user",
      "content": "Testing. Just say hi and hello world and nothing else."
    }
  ],
  "model": "grok-2-latest",
  "stream": false,
  "temperature": 0
}'
```

But a little bit cleaner:

```sh
#source .env
export XAI_API_KEY="xai-somecoolapikey"
```

Then just execute the query to Grok via web request:

```sh
curl https://api.x.ai/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $XAI_API_KEY" \
-d '{
  "messages": [
    {
      "role": "system",
      "content": "You are a test assistant."
    },
    {
      "role": "user",
      "content": "Testing. Which model are you?."
    }
  ],
  "model": "grok-2-latest",
  "stream": false,
  "temperature": 0
}'
```

### Ways to Call Grok

1. Via curl CLI, as done previously.
2. But also you can call [Grok with python](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_Tests/Grok_API/grok_calls.ipynb)

* https://docs.x.ai/docs/overview
* https://docs.x.ai/docs/guides/migration

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Streamlit-AIssistant/blob/main/Z_Tests/Grok_API/grok_calls.ipynb)

{{< callout type="info" >}}
From Europe, I could not use the image generation APIs, but it seems available via https://x.com/i/grok
{{< /callout >}}

#### Grok via OpenAI API

```py
from openai import OpenAI

client = OpenAI(
api_key=XAI_API_KEY,
base_url="https://api.x.ai/v1",
)

# ...

completion = client.chat.completions.create(
    model="grok-2-latest",
        messages=[
        {
            "role": "system",
            "content": f"""You are an expert assistant""",
        },
        {"role": "user", "content": "What have been the top 5 news in 2025?"}
    ],
    temperature=0.7)

# ...
```



#### Grok via Anthropic

```py
from anthropic import Anthropic
    
client = Anthropic(
  api_key=XAI_API_KEY,
  base_url="https://api.x.ai",
)

# ...

message = client.messages.create(
    model="grok-2-latest",
    max_tokens=689,
    temperature=0,
    messages=[
        {"role": "user", "content": f"What are the latest trends in tech?"}
    ]
)
```

#### Grok via LiteLLM

* https://jalcocert.github.io/JAlcocerT/how-to-use-lite-llm/


---

## Conclusions

This is it.

Now you have one more LLM to play with via API queries!

{{< callout type="info" >}}
See [**Streamlit-Multichat** Source Code](https://github.com/JAlcocerT/Streamlit-MultiChat) 💻
{{< /callout >}}
