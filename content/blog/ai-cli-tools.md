---
title: "AI Tools for CLI"
date: 2025-06-25T01:20:21+01:00
draft: false
tags: ["Gemini CLI","LLMs","BAML","GIT-MCP"]
description: 'A look to the CLI tools to bring LLMs and better prompt engineering with BAML'
url: 'ai-tools-for-cli'
---


## Gemini

Gemini models are great: https://ai.google.dev/gemini-api/docs/models#gemini-2.5-flash

Specially their very high **context window of 1M tokens**

And as of now, they are on top of the LLM Leaderboard: https://lmarena.ai/leaderboard

Querying Gemini was as simple as getting your [API Key](https://aistudio.google.com/app/apikey) and doing:

```sh
#source .env
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${GEMINI_API_KEY}" \
  -H 'Content-Type: application/json' \
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

You could also do these queries to [Gemini with python](https://ai.google.dev/gemini-api/docs/quickstart?lang=python)

### Gemini CLI

https://github.com/google-gemini/gemini-cli

```sh
npx https://github.com/google-gemini/gemini-cli #one time install
#npm install -g @google/gemini-cli #global install
gemini

gemini --prompt "are you able to be queried with non interactive mode?" -m gemini-2.5-flash --yolo --debug
```


The flags used for Gemini are:

`--yolo` automatically accepts all actions
`--debug` shows debug information
`--model` allows to specify the model to use

https://developers.google.com/gemini-code-assist/auth/auth_success_gemini

<!-- https://www.youtube.com/watch?v=KUCZe1xBKFM -->

{{< youtube "KUCZe1xBKFM" >}}

**Gemini CLI via API Key**  https://aistudio.google.com/app/apikey



![alt text](/blog_img/GenAI/geminiCLI/geminicli-101.png)

I had to login via API key as per:

![alt text](/blog_img/GenAI/geminiCLI/geminicli-login.png)

As I could not do it via [regular google auth](https://github.com/google-gemini/gemini-cli/issues/1901)

![alt text](/blog_img/GenAI/geminiCLI/geminicli-auth.png)

![GeminiCLI is authorized now](/blog_img/GenAI/geminiCLI/geminiCLI-authorized.png)

> You could do it as per [this issue](https://github.com/google-gemini/gemini-cli/issues/1502#issuecomment-3007518759)

https://console.cloud.google.com/welcome?hl=en&inv=1&invt=Ab1Jlw&project=starlit-advice-464112-j9
https://console.developers.google.com/apis/api/cloudaicompanion.googleapis.com
https://console.cloud.google.com/apis/dashboard


```sh
#source .env && npx https://github.com/google-gemini/gemini-cli && gemini
export GOOGLE_CLOUD_PROJECT="xxxx" && gemini
```

![Streamlit Ollama MCP](https://raw.githubusercontent.com/JAlcocerT/LLaMa-MCP-Streamlit/raw/main/screenshot/streamlit-ollama-mcp.png)



> Be aware of the costs: https://aistudio.google.com/app/usage

#### Gemini CLI x MCP

A very interesting feature is the MCP integration https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/configuration.md

As seen here, we can use MCP Tools with [windsurf, like Context7](https://jalcocert.github.io/JAlcocerT/ai-understanding-mcp-framework/#context7-with-windsurf-ide).

But how to add it to Gemini CLI?

```sh
gemini
/mcp
```

You will just need a `.gemini/settings.json` as per [the docs](https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/configuration.md)

```json
{
    "theme": "Default", // Keep any existing settings
    "mcpServers": {
      "context7": {
        "url": "https://mcp.context7.com/sse"
      }
    }
  }
```

Once logged in again to GeminiCLI, you will get access to them:

![alt text](/blog_img/GenAI/geminiCLI/geminicli-mcp-connection.png)

See how it works:

![Gemini MCP Working](/blog_img/GenAI/geminiCLI/gemini-mcp.png)

#### Gemini CLI x Git-MCP

What else can be connected to Gemini via MCP?

PRety much anything: https://github.com/punkpeye/awesome-mcp-servers

**For example** - https://github.com/idosal/git-mcp

> Apache v2 | Put an end to code hallucinations! GitMCP is a free, open-source, remote MCP server for any GitHub project

You can add it to Windsurf by: https://gitmcp.io/openai/codex or https://gitmcp.io/google-gemini/gemini-cli

```json
{
  "mcpServers": {
    "gitmcp": {
      "serverUrl": "https://gitmcp.io/google-gemini/gemini-cli"
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

![alt text](/blog_img/dev/IDEs/windsurf-mcp-gitmcp.png)

![alt text](/blog_img/dev/IDEs/windsurf-mcp-chat.png)

#### Gemini CLI x Databases

* https://github.com/runekaagaard/mcp-alchemy

#### Logging GeminiCLI

```sh
#npx https://github.com/google-gemini/gemini-cli -y && gemini
gemini --debug -p "How do I use the Gemini CLI to log my thinking process?"
```


### Other CLI Tools

These 2 I already have tested and covered on [this post](https://jalcocert.github.io/JAlcocerT/vide-coding/#openai).

#### Codex CLI

If you like **OpenAI taste**: https://platform.openai.com/docs/guides/tools-image-generation

You can get started as per [openai manual](https://help.openai.com/en/articles/11096431-openai-codex-cli-getting-started)

And use your favourite model: https://platform.openai.com/docs/models Which at this point offer a **200k context Window**

You could say that at this point o3 > o1 > 4o / GPT 4.1:

```sh
codex --provider openai --model gpt-4.1-mini #32k tokens
codex --provider openai --model gpt-4.1-nano #8k tokens
```

```sh
codex --approval-mode full-auto "create the fanciest todo-list app" --provider ollama

#codex
#/model

#codex -m o3-mini
#codex --provider openai --model o3-mini "Please create a data analysis script that cleans data"
codex --provider openai --model o3-mini --quiet --approval-mode full-auto "$(cat ./prompts/codex-tree-stack-components.md)" > ./Outputs_Model/output-codex-tree-stack-components-plan.json #saved the full reply with errors 
```

Remember that using providers you will get some associated cost. Like: https://platform.openai.com/usage

![OpenAI Usage](/blog_img/GenAI/geminiCLI/openai-usage.png)

#### Claude Code

With Anthropic, you have the magestic Claude 4 Opus - https://www.anthropic.com/claude/opus

Also with **200K context window**.

#### Claude Task Master

If you are familiar with BRD/PRD and similar project management concept, Claude Task Master is a tool that can create ai driven projects in such a way.

* https://github.com/eyaltoledano/claude-task-master


#### WARP IDE

https://www.warp.dev/

#### AIDER

## BAML

* https://marketplace.visualstudio.com/items?itemName=Boundary.baml-extension

```sh
ext install Boundary.baml-extension
```


> "Every system in the world should be able to run LLMs, not just Python. Vaibhav Gupta."

* https://github.com/BoundaryML/baml
* https://pypi.org/project/baml-py/

> **Apache v2** | The AI framework that adds the **engineering to prompt engineering** (Python/TS/Ruby/Java/C#/Rust/Go compatible)

BAML, which stands for "Basically a Made-up Language," is an open-source AI framework designed to bring traditional software engineering rigor and best practices to the development of applications that utilize Large Language Models (LLMs).

Essentially, it offers a **structured and type-safe way to define and manage how you interact with LLMs**, moving beyond simple text prompts to a more robust, function-based approach.


{{< details title="More about BAML 📌" closed="true" >}}

BAML helps you be better with LLMs by addressing several common pain points in LLM application development. 

Firstly, it transforms raw LLM prompts into defined "functions" with specific input parameters and expected output types.

This "schema engineering" ensures that your LLM outputs are reliable and consistently formatted, significantly reducing parsing errors and the need for complex error handling.

Secondly, it drastically **improves iteration speed with built-in IDE tooling and a "playground"** that allows you to visualize and test your prompts rapidly, speeding up development cycles and enabling quicker experimentation with different ideas.

Finally, BAML promotes maintainability and scalability by abstracting away the complexities of integrating with various LLM providers, offering features like model rotation, retry policies, and fallbacks, all while generating type-safe client code for multiple programming languages.

{{< /details >}}

> The core of BAML are RUST functions :) 

> > Similarly as numpy goes to C.

```sh
uv add baml-py
```

All BAML does under the hood is go generate a web request (you will be able to see the raw curl) and configurable via `client.baml`

https://marketplace.visualstudio.com/items?itemName=Boundary.baml-extension

There is a `baml_client` you can do:

```sh
from baml_client import b

#you can now bring your classes that will check types and so on, just like typescript does, but in python, thanks to BAML (typechecking in prompts)
```

And there wont be any dependencies on baml code once it has been run!

So you will just ship the `baml_client` part.

**BAML examples**

1. Semantic streaming feature - A react components that know how to renders itself

2. There is a LLM Client Call Graph to debug which model is being called

3. No Internet connection required

4. Gpt 3.5 + BAML > 4o with structured outputs | *Function-calling for every model, in your favorite language*

We let the LLM speak the language it thinks its better for the reply and then we take what we want from that reply (that does not have to be a JSON like with structured outputs)

**Competitors**: PydanticAI

baml.com/chat

https://gloochat.notion.site/benefits-of-baml

https://gloochat.notion.site/BAML-Advanced-Prompting-Workshop-Dec-2024-161bb2d26216807b892fed7d9d978a37?pvs=74

https://www.youtube.com/watch?v=Xece-W7Xf48

https://github.com/hellovai/ai-that-works


```
write me a webscrapper with selenium to extract a products on a site

write the baml code + python code example
```


### BAML as a DSL 

They call BAML a **DSL (Domain-Specific Language)** because it's precisely that: a programming language tailored specifically to a particular "domain" of problems.

In this case, the domain is **building reliable AI workflows and agents, particularly around prompt engineering for Large Language Models (LLMs).**

Here's why that classification fits and what it means:

* **Specialized Focus:** Unlike a General-Purpose Language (GPL) like Python, JavaScript, or Java, which are designed to solve a wide range of problems across various domains, a DSL like BAML has a very narrow and specific focus. Its syntax, keywords, and constructs are all designed to express concepts directly relevant to interacting with LLMs – defining prompts, specifying input/output schemas, handling model clients, streaming, retries, and so on.


{{< details title="More about BAML as DSL 📌" closed="true" >}}

* **Higher Level of Abstraction for the Domain:** 
BAML allows you to express your intentions for LLM interactions at a higher level of abstraction than you would in a GPL. Instead of writing boilerplate code to serialize JSON schemas into prompts, handle API calls, and parse messy outputs, BAML provides dedicated syntax for these tasks. For example, the `function ChatAgent(...) -> StopTool | ReplyTool { client "openai/gpt-4o-mini" prompt #"...#" }` syntax is very specific to defining an LLM function, its model, and its prompt structure.

* **Improved Readability and Maintainability within the Domain:** Because its syntax is specialized, BAML code becomes more readable and understandable for anyone working within the LLM application development domain. It clearly delineates the structure of your prompts and expected outputs, making it easier to maintain and debug your LLM-driven logic over time compared to managing hundreds of complex f-strings in a general-purpose language.

* **Generated Code:** BAML files are typically compiled or transformed into code in a GPL (like Python, TypeScript, Go, etc.). This means you write your LLM logic in the specialized BAML DSL, and then BAML's tooling generates the necessary "boilerplate" code in your application's primary language, which you then integrate into your project. This is a common characteristic of external DSLs.

{{< /details >}}

In essence, BAML is a DSL because it provides a dedicated, purpose-built language to solve a specific problem set (LLM prompt engineering and workflow automation), offering specialized syntax and abstractions that make working within that domain more efficient, reliable, and understandable.

> A DSL, like the one [Kibana has](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/#kibana)!

---

## Conclusions

[![Star History Chart](https://api.star-history.com/svg?repos=BoundaryML/baml,google-gemini/gemini-cli&pydantic/pydantic-ai&,type=Date)](https://star-history.com/BoundaryML/baml&google-gemini/gemini-cli&pydantic/pydantic-ai&Date)


### Python CLi Tools

* https://pypi.org/project/questionary/
* https://docs.pytest.org/en/stable/


---

## FAQ

### Other TOols


* https://github.com/Chivo-Systems/Shinar/


> gpl 3.0 | Open Source AI Calling Transcriptions, Summaries, and Analytics built on OpenAI Whisper


Similar to fireb

https://github.com/getmaxun/maxun

> agpl | No Code Web Data Extraction Platform • Turn Websites To APIs & Spreadsheets In Minutes


https://github.com/clusterzx/paperless-ai


> MIT | An automated document analyzer for Paperless-ngx using OpenAI API, Ollama, Deepseek-r1, Azure and all OpenAI API compatible Services to automatically analyze and tag your documents.


https://github.com/esxr/langgraph-mcp

> MIT | LangGraph solution template for MCP