---
title: "Vide Coding. For websites and more..."
date: 2025-04-15T23:20:21+01:00
draft: false
tags: ["Dev"]
description: 'How to get started with vibe coding. FirebaseStudio vs Codex...'
url: 'vide-coding'
---


* https://uiverse.io/elements

But how about creating websites with....



## Firebase Studio

* https://studio.firebase.google.com/
* https://firebase.google.com/docs/studio/get-started-import?import_type=source

## CLI Based

### OpenAI

Codex CLI is built for developers who already live in the terminal and want ChatGPT‑level reasoning plus the power to actually run code, manipulate files, and iterate – all under version control.

In short, it’s chat‑driven development that understands and executes your repo.

* Zero setup — bring your OpenAI API key and it just works!
* Full auto-approval, while safe + secure by running network-disabled and directory-sandboxed
* Multimodal — pass in screenshots or diagrams to implement features ✨

* https://github.com/openai/codex
    * https://www.npmjs.com/package/@openai/codex

> Apache v2 | Lightweight coding agent that runs in your terminal

Install codex as an NPM package:

```sh
npm i -g @openai/codex
#npm install -g @openai/codex@0.1.2504211509 #https://github.com/openai/codex/issues/525
npm list codex #0.2.3
```

```sh
#source .env
export OPENAI_API_KEY="your_secret_api_key"
#OPENAI_API_KEY=your-api-key-here
```

```sh
codex

#codex "explain this codebase to me"
```


```sh
git clone https://github.com/JAlcocerT/Py_Trip_Planner
```


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/VibeCoding/OpenAI-Codex" title="OpenAI Codex inside a Docker Container Config 🐋 ↗" >}}
{{< /cards >}}


<!-- https://www.youtube.com/watch?v=qqcmI72marw -->

{{< youtube "qqcmI72marw" >}}




### Claude Code

* https://github.com/anthropics/claude-code

> Claude Code is an agentic coding tool that **lives in your terminal, understands your codebase**, and helps you code faster by executing routine tasks, explaining complex code, and handling git workflows - all through natural language commands.

---

## AI Code Assistants

Gemini, Github Copilot has a recent free tier, we also have Gitlab Duo Chat.

What else can help us code better?

* https://github.com/block/goose

> Apache v2 | an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM


## Propietary

### Github Copilot

### Gitlab Duo

### Gemini and AIStudio

https://www.youtube.com/watch?v=_fhTXJe_awY

* https://aistudio.google.com/prompts/new_chat

You can also see firebasestudio...

* https://firebase.studio/

## OSS Extension + Propietary Models

We can use Anthropic or OpenAI models, with free extensions:

## OSS Extension & Models

We can use open models, with 3rd party APIs (like Groq).

## OSS Extension & Model & Local Run

[Deepseek v3](https://huggingface.co/deepseek-ai)




## Paid Assistants

### Github Copilot

### Cursor

* https://www.cursor.com/pricing


## Free Assistants

* Tabby
* Codeium
* Continue.dev

* https://github.com/paul-gauthier/aider
    * https://github.com/Aider-AI/aider



---

## FAQ

### Code Assistants fully open source

What we need:

1. Open VSCode Extension
2. Open LLM
3. Some kind of ownership on the Server/GPU that runs the model

## Conclusions

### Others

* https://replit.com/
* Lovable