---
title: "Vide Coding. For websites and more..."
date: 2025-04-15T23:20:21+01:00
draft: false
tags: ["Dev","GenAI","WindSurf","Firebase Studio"]
description: 'How to get started with vibe coding. FirebaseStudio vs Codex vs Claude Code...or maybe just Windsurf IDE?'
url: 'vide-coding'
---

There is a new concept around: **vibe coding**

And it seems it will stay for a while.

![Windsurf Codeium IDE and Astro](/blog_img/GenAI/NoCode-AI/windsurf-vibecoding-astro.png)

* https://uiverse.io/elements

But how about creating/improving websites and their components with these tools... or even web apps?

## Firebase Studio

If you were doing free static hosting with firebase, now it seems you can also do the websites with AI there as well:

* https://studio.firebase.google.com/
* https://firebase.google.com/docs/studio/get-started-import?import_type=source

<!-- https://www.youtube.com/watch?v=bnNXIUdqnt0 -->

{{< youtube "bnNXIUdqnt0" >}}


## CLI Based

For some of these, you will need...

* https://platform.openai.com/playground/prompts?models=gpt-4.1
* https://platform.openai.com/logs
  * OpenAI API Keys - https://platform.openai.com/api-keys
  
* Anthropic - https://console.anthropic.com/settings/keys
* Groq - https://console.groq.com/keys

### OpenAI

**Codex CLI** is built for developers who already live in the terminal and want ChatGPT‑level reasoning plus the power to actually run code, manipulate files, and iterate – all under version control.

<!-- https://www.youtube.com/watch?v=qqcmI72marw -->

{{< youtube "qqcmI72marw" >}}

In short, it’s chat‑driven development that understands and executes your repos.

* Zero setup — bring your OpenAI API key and it just works!
* Full auto-approval, while safe + secure by running network-disabled and directory-sandboxed
* Multimodal — pass in screenshots or diagrams to implement features ✨

* https://github.com/openai/codex
    * https://www.npmjs.com/package/@openai/codex

> Apache v2 | Lightweight coding agent that runs in your terminal

**Install codex** as an NPM package, it requires **node 22**, at least:

```sh
#FROM node:22-slim
npm i -g @openai/codex
#npm install -g @openai/codex@0.1.2504211509 #https://github.com/openai/codex/issues/525
npm list codex #0.2.3
```


And provide your API: https://platform.openai.com/api-keys

```sh
#source .env
export OPENAI_API_KEY="your_secret_api_key"
#OPENAI_API_KEY=your-api-key-here
```

You can run it with [default parameters](https://github.com/openai/codex?tab=readme-ov-file#basic-configuration-parameters): 

```sh
codex
#codex "explain this codebase to me"

#find . -name ".git" -type d
#git reset --hard HEAD
git restore ./docs/index.mdx #restore a particular file back to last commit
```

{{< callout type="info" >}}
By default, you are using the model o4-mini
{{< /callout >}}

See available models with:

```sh
#source .env
curl -s https://api.openai.com/v1/models \
                 -H "Authorization: Bearer $OPENAI_API_KEY"
```

Codex also allows you to use other providers that support the OpenAI Chat Completions API. 

You can set the provider in the config file or use the `--provider` flag.

{{< callout type="info" >}}
The possible options for --provider are:  openai (default), openrouter, gemini, ollama, mistral, deepseek, xai, groq...
{{< /callout >}}

This is how we would make codex use ollama and in auto mode:

```sh
codex --approval-mode full-auto "create the fanciest todo-list app" --provider ollama
```

If you want to **log all the codex thinking process:**

```sh
#codex --quiet "Explain the prompt-init-userguide-iterative.md file"
#codex --quiet "Explain the prompt-followup-userguide-iterative.md file" > codex_log_quite.json
codex --quiet --full-auto "$(cat ./prompts/prompt.md)" > output-k8s-auto.json #saved the full reply with errors 
jq 'select(.type == "message" and .status == "completed")' output-k8s-auto.json #to see the final reply only
```

It will avoid you saving time with these errors:

![Codex Logs saved with errors](/blog_img/GenAI/codex-logs.png)

And instead you can get this kind of json:

```json
{"role":"user","content":[{"type":"input_text","text":"You are an AI documentation generator.\n\nYour task is to understand about the **user on boarding documentation for a cloned project** and write a post as markdown file where specified.\n\nFor every post section created, create an additional markdownn post that will expand its content depth.\n\nWe aim to get very detailed information about the project, specially the tech stack details and the use cases of each component.\n\n\n**1. Project Files: Input**\n\n* Inspect the content of the files located in the `/home/jalcocert/Desktop/IT/DOCS_TESTING/docs-k8s/input-sources/kubernetes` directory.\n\nYour task is to create **technical documentation for the cloned project** and write a post as markdown file where specified.\n\n* According to the content of the files located in the project directory, we want to expand our understanding of a given section of the repository.\n* Provide ideas to expand our understanding of how the directory works \n* Add a H2 with Use cases and this new information that you will discover about the use cases:\n    * Given a library dependency, to list the uses cases for the code base and the used architectural design\n    * Referencing to sample code and file that is using it\n    * Are any of the technologies being used for something that they are not ready design for (design patterns)\n    * Are there any closed sourced libraries in the project? (or referencing a repository with closed source?)\n* Provide a final section in H2 to the post so that we can see the files that have been used to generate it\n\n\n**Output Format (Astro Theme Template):**\n\nThe final documentation should be formatted to be easily integrated with the Astro theme located at `/home/jalcocert/Desktop/IT/DOCS_TESTING/docs-k8s/docs/src/content/docs/reference`.\n\n* Write the posts as soon as you generated them.\n\nPlease consider the following:\n\n* **Markdown Output:** Generate the documentation in Markdown format (`.md` files) as this is the primary format for Astro content.\n* **Frontmatter:** Respect the following Astro frontmatter at the beginning of each Markdown file (e.g., `title`, `description`)"}],"type":"message"}
{"id":"rs_68515b5395f8819fbeb6d5ae5b3dc0b102e3250c19237b0e","type":"reasoning","summary":[],"duration_ms":4160}
{"id":"rs_68515b5395f8819fbeb6d5ae5b3dc0b102e3250c19237b0e","type":"reasoning","summary":[]}
```

> You can also have a look to [Prompt Layer Library](https://github.com/MagnivOrg/prompt-layer-library) for openai logs

To use other providers/LLMs, as per [this post](https://machinelearningmastery.com/understanding-openai-codex-cli-commands/):

```sh
#codex --provider openai --model o4-mini "This is the default llm selection"
codex --provider groq --model deepseek-r1-distill-llama-70b "Please create a data analysis script that takes the clean data and runs statistical analysis."
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/VibeCoding/OpenAI-Codex" title="OpenAI Codex inside a Docker Container Config 🐋 ↗" >}}
{{< /cards >}}


<!-- https://www.youtube.com/watch?v=qqcmI72marw -->

{{< youtube "qqcmI72marw" >}}

**Codex CLI inside a container?**

https://github.com/openai/codex/tree/main/codex-cli/scripts

**Testing OpenAI Codex**: Improving personal projects

```sh
#git clone https://github.com/JAlcocerT/Py_Trip_Planner
git clone https://github.com/JAlcocerT/phidata
```

> Thanks to codex I could understand better how the [Groq Youtube summarizer](https://jalcocert.github.io/JAlcocerT/summarize-yt-videos/) works, *as I [forked it from PhiData](https://github.com/JAlcocerT/phidata).*

> > Also, I added groq YT summarization capabilities to the MultiChat and interesting working notes to the localdeepresearch

#### Codex1

Everyone has a cloud IDE.

So does OpenAI now, with https://openai.com/index/introducing-codex/

> Still, I prefer the *locally working* stuff.

### Claude Code

Another CLI tool, this time from Anthropic:

* https://github.com/anthropics/claude-code
  * https://docs.anthropic.com/en/docs/claude-code/overview

> Claude Code is an agentic coding tool that **lives in your terminal, understands your codebase**, and helps you code faster by executing routine tasks, explaining complex code, and handling git workflows - all through natural language commands.

You can see the [CLI usage](https://docs.anthropic.com/en/docs/claude-code/cli-usage)

![Claude Code 101](/blog_img/GenAI/Anthropic/claudecode/claudecode1.png)


```sh
npm install -g @anthropic-ai/claude-code
#npm list -g @anthropic-ai/claude-code
#npm install -g @anthropic-ai/claude-code@0.2.126
```


![alt text](/blog_img/GenAI/Anthropic/claudecode/claudecode2.png)

![alt text](/blog_img/GenAI/Anthropic/claudecode/claudecode3.png)

* Claude 3.5 Sonnet: Often noted for its strong coding capabilities.
* Claude 3.7 Sonnet: The current default and a powerful all-around model.
* Claude 3 Opus: The most capable model, designed for highly complex tasks, but typically more expensive and slower.
* Claude 3 Haiku: The fastest and most cost-effective model, suitable for simpler tasks.

![alt text](/blog_img/GenAI/Anthropic/claudecode/claudecode4.png)

![alt text](/blog_img/GenAI/Anthropic/claudecode/claudecode5.png)


{{< callout type="warning" >}}
Interesting enough, I could not find a way to change the temperature on these CLI tools
{{< /callout >}}

![alt text](/blog_img/GenAI/Anthropic/claudecode/claudecode6.png)

```sh
# Ask questions about your codebase
claude
> how does our authentication system work?

# Create a commit with one command
#claude commit

#Query Claude Code Examples:
#claude "Can you explain this code base?"
claude < prompt.md
```

{{< callout type="info" >}}
Claude will inform you about the used credits and used models
{{< /callout >}}

Total cost:            $3.22
Total duration (API):  52m 3.2s
Total duration (wall): 6h 53m 43.5s
Total code changes:    4351 lines added, 0 lines removed
Token usage by model:
    claude-3-5-haiku:  70.0k input, 117.8k output, 0 cache read, 0 cache write
   claude-3-7-sonnet:  123 input, 40.6k output, 3.1m cache read, 304.1k cache write

> > Actually [Plandex](#plandex) was first!



---

## AI Code Assistants

Gemini, Github Copilot has a recent free tier, we also have Gitlab Duo Chat.

What else can help us code better?

* https://github.com/block/goose

> Apache v2 | an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM


## Propietary

There are many options...

* https://v0.dev/ From vercel!
  * https://v0.dev/community/financial-dashboard-DuidKNEmCKf

* https://chef.convex.dev/

### Cursor and ZED

Some Paid IDE/Assistants/Agentic coding...

* https://replit.com/
* [Lovable](https://jalcocert.github.io/JAlcocerT/git-recap/#outro)
* https://www.cursor.com/pricing


{{< callout type="info" >}}
Cursor made a [interesting guide](https://docs.cursor.com/guides/selecting-models#2-task-type)
{{< /callout >}}

Cursor's documentation on "Selecting Models" explains how to choose the right model for your task to improve speed, efficiency, and results. 

Model Differences: Models vary in assertiveness, curiosity, and context window.
Model Behavior: Some models 'think' and take initiative, while others require explicit instructions.
Choosing by Style: Users often prefer models based on interaction style (assertive vs. controlled).
How to Select: Consider prompting style and task type.

For control, use models like claude-3.5-sonnet or gpt-4.1.
For initiative, use models like claude-3.7-sonnet, gemini-2.5-pro, or o3.

Task-Specific Models:

* claude-3.5-sonnet: Small changes.
* claude-3.7-sonnet, gemini-2.5-pro: Larger refactors.
* gemini-2.5-pro, claude-3.7-sonnet, o3: Codebase navigation.
* claude-3.7-sonnet, gemini-2.5-pro: Planning.
* o3: Complex issues.
* Auto-select: A reliable default option.
* Custom Modes: Save preferred model/prompt combinations.

* https://zed.dev/pricing

```sh
#https://zed.dev/download
#https://zed.dev/docs/linux#other-ways-to-install-zed-on-linux
curl -f https://zed.dev/install.sh | sh
```

![ZED IDE](/blog_img/dev/dev-zed.png)

> Zed IDE allows to use MCP or custom LLMs (ollama, OpenAI...)

You can plug **API keys** to some IDEs/extensions:

* https://aistudio.google.com/generate-speech

For which you will need [Google API Keys](https://aistudio.google.com/apikey)

* https://platform.openai.com/playground/prompts?models=gpt-4.1
* https://platform.openai.com/logs
  * OpenAI API Keys - https://platform.openai.com/api-keys

* https://x.ai/api
    * https://console.x.ai/
    * https://docs.x.ai/docs/overview
  
* Anthropic - https://console.anthropic.com/settings/keys
* Groq - https://console.groq.com/keys

* For Ollama, you need [this setup](https://fossengineer.com/selfhosting-llms-ollama/)

* https://huggingface.co/

### Gitlab Duo

* https://about.gitlab.com/gitlab-duo/

Which is similar to Github CodeSpaces

### Gemini and AIStudio

So not only Gemini Code Assist vscode extension is great...

<!-- https://www.youtube.com/watch?v=_fhTXJe_awY -->

{{< youtube "_fhTXJe_awY" >}}


* https://aistudio.google.com/prompts/new_chat

You can also see firebasestudio...

* https://firebase.studio/

**EDIT** and as of 20th May, Google also launched [Jules](https://blog.google/technology/google-labs/jules/)

### Github Copilot

* https://github.com/features/copilot

Its already on vscode and we can get for free (at the time of writing):

* 50 agent mode or chat requests per month
* 2,000 completions per month
* Access to Claude 3.5 Sonnet, GPT-4o, and more


## Free Assistants

<!-- [![Star History Chart](https://api.star-history.com/svg?repos=langchain-ai/langchain,deepset-ai/haystack,Sinaptik-AI/pandas-ai,pydantic/pydantic-ai&,type=Date)](https://star-history.com/langchain-ai/langchain&deepset-ai/haystack&Sinaptik-AI/pandas-ai&pydantic/pydantic-ai&Date) -->

[![Star History Chart](https://api.star-history.com/svg?repos=continuedev/continue,plandex-ai/plandex,paul-gauthier/aider,Aider-AI/aider,cline/cline&type=Date)](https://star-history.com/continuedev/continue&plandex-ai/plandex&paul-gauthier/aider&Aider-AI/aider&cline/cline&Date)

### Void

* https://voideditor.com/
* https://github.com/voideditor/void

Void is the open-source Cursor alternative.

Use AI agents on your codebase, checkpoint and visualize changes, and bring any model or host locally. 

Void sends messages directly to providers without retaining your data.

### Windsurf

* Codeium - **Windsurf** was renamed from Codeium and [forked from vscode](https://www.youtube.com/watch?v=y__FNi7klwM)

And it has some interesting [features under paywall](https://windsurf.com/pricing)

You can [download windsurf](https://windsurf.com/editor) IDE:

```sh
#https://windsurf.com/editor/download-linux
#https://windsurf.com/editor/update-linux
sudo apt-get update
sudo apt-get upgrade windsurf
```

You will need this to go back in git time:

```sh
git reset --hard HEAD #back to last commit
```

<!-- https://www.youtube.com/watch?v=Wvyc2E6OHm8 -->

{{< youtube "Wvyc2E6OHm8" >}}


![Windsurf IDE](/blog_img/dev/dev-windsurf.png)

<!-- https://www.youtube.com/watch?v=3qi94lCdYI0 -->

{{< youtube "3qi94lCdYI0" >}}

The interesting thing about Windsurf, is that we can select different models and also to swap between the write mode (to affect the cdebase) and the chat mode with them.

![Windsurf Pro](/blog_img/dev/windsurf-pro-payment.png)

These are the [models](https://docs.windsurf.com/windsurf/models) we can use with windsurf.

> At the time of writing, when selecting by provider, the Deepseek V3 and R1 are free to use (nt consuming credits)

>> Check the credits by [login](https://windsurf.com/account/login) and go to [usage](https://windsurf.com/subscription/usage) or [profile](https://windsurf.com/profile)


See also the bottom right section (click on Pro) and you will see:



{{< callout type="warning" >}}
Files/folders need to be out of the `.gitignore` so that can be used as context for Windsurf Mdels
{{< /callout >}}


#### Windsurf Memories

Go to the top right (the book icon), customizations


![alt text](/blog_img/dev/IDEs/WindsurfPro.png)

![alt text](/blog_img/dev/IDEs/WindsurfCustom.png)

#### Windsurf Image/Web input

You can send images to give context to the code assistant.

You can do: `@web`

```txt
I need some help to integrate keystaticCMS into this astro site, please do so taking into account the following docs: https://keystatic.com/docs/installation-astro
```

Or simply `https://keystatic.com/docs/installation-astro understand those docs and review if we have everything in place on this project for keystatic to work`

* This one can also be helpful:
  *  https://keystatic.com/docs/format-options
  * https://docs.astro.build/en/reference/configuration-reference/#output

  
#### Windsurf x MCP

Lately I was discovering [about MCP](https://jalcocert.github.io/JAlcocerT/ai-understanding-mcp-framework/)

### ContinueDev

* Continue.dev: https://github.com/continuedev/continue
  * https://docs.continue.dev/getting-started/install
  
> Apache v2 |  ⏩ Create, share, and use custom AI code assistants with our open-source IDE extensions and hub of models, rules, prompts, docs, and other building blocks 

### Plandex

* https://github.com/plandex-ai/plandex

> MIT | Open source AI coding agent. Designed for large projects and real world tasks.


### Aider

* https://github.com/paul-gauthier/aider
    * https://github.com/Aider-AI/aider

> Apache v2 | aider is AI pair programming in your terminal

### Cline

* https://github.com/cline/cline
  * https://github.com/RooCodeInc/Roo-Code?tab=readme-ov-file

> Apache v2 | Autonomous **coding agent right in your IDE**, capable of creating/editing files, executing commands, using the browser, and more with your permission every step of the way.

[Cline](https://cline.bot/) can also be installed as [vscode extension](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev).

```sh
ext install saoudrizwan.claude-dev
```

---

## Conclusions

I think Ill stay with Windsurf for a while :)


---

## FAQ

### Code Assistants fully open source

Looking for a fully local and OSS solution? 

What we need:

1. Open VSCode Extension
2. Open Sourced LLM
3. Some kind of ownership on the Server/GPU that runs the model

**OSS Extension + Propietary Models**

We can use Anthropic or OpenAI models, with free extensions.

**OSS Extension & Models**

We can use open models, with 3rd party APIs (like Groq).

**OSS Extension & Model & Local Run**

[Deepseek v3](https://huggingface.co/deepseek-ai)