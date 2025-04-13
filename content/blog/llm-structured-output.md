---
title: "How to use Structured Outputs in LLMs"
date: 2024-08-21T23:20:21+01:00
draft: false
tags: ["Dev"] 
description: "How to use the Structured Output Feature with OpenAI"
url: "how-to-use-structured-outputs-LLM"
---

Lately, I heard about s**tructure outputs for LLMs**:

* https://openai.com/index/introducing-structured-outputs-in-the-api/

And I could not just but to think on the possibilities for projects...


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-openai-function-calling/" title="Configuring CF WnP with Github and Astro ↗" >}}
{{< /cards >}}


* **OpenAI:** Has a **native function calling** mechanism through the dedicated `functions` (or `tools` with `type: "function"`) parameter in their Chat Completions API. The model is specifically trained to recognize the described functions and output a structured `function_call` object when it deems appropriate.

* **Groq:** **Also has native function calling** through the `tools` parameter in their `chat.completions.create` endpoint. Their implementation is designed to be largely compatible with OpenAI's structure, including the `tool_calls` object in the response. So, while it's a separate API, it's not purely leveraging unstructured output.

* **Claude:** **Leverages structured outputs** to achieve similar functionality. While it has a `tools` parameter in its Messages API, the model is instructed via the prompt and the tool descriptions to output a structured JSON object representing the function call. The parsing of this structured output is then handled by the developer. The key difference is that Claude's models weren't initially built with a specific "function calling" training objective in the same way as OpenAI's older models. However, with the Claude 3 family, Anthropic has significantly enhanced its ability to understand and utilize tools in a structured manner.

**Here's a more detailed breakdown of the nuance:**

* **"Native Function Calling" (OpenAI & Groq):** These APIs have parameters and response structures explicitly designed for function calling. The models are trained to understand these structures and generate the calls directly as part of their API response in a predictable format.

* **"Leveraging Structured Outputs" (Claude):** While Claude's `tools` parameter guides the model, the actual function call is achieved by instructing the model to generate a specific structured output (like JSON) that adheres to the tool's schema. The reliability of this depends heavily on the prompt engineering. However, with the advancements in Claude 3, its ability to generate these structured outputs for tool use has become much more robust and comparable to native function calling.

**In essence:**

* OpenAI and Groq provide a more direct and built-in mechanism for function calling.
* Claude achieves similar results by being very good at following instructions to produce structured outputs that represent function calls, and its newer models have strong tool use capabilities.

Therefore, while the underlying goal is the same (allowing the LLM to interact with external tools), the implementation details and the level of "nativeness" in the API design differ slightly.



{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="Multi-Chat" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github where ive tested Structured Outputs" >}}
{{< /cards >}}

---

## Conclusions

This is a great feature that can be applied to project like:

1. CV Generation as per a certain latex/opencv framework
2. Generate `.md` posts with their proper headers for your SSG powered sites...As we can have proper **front matter**
3. aaaand more

{{< cards >}}
  {{< card link="" title="CV as a Code" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/OpenAI/StructureOutput_1" title="Structured outputs script to create md post and related image ↗" icon="book-open" >}}
  
{{< /cards >}}

---

## FAQ

What have I learnt recently?

### Using LLMs to apply to Linkedin Jobs

* https://github.com/feder-cr/Auto_Jobs_Applier_AIHawk

### How to use LLMs to create a CV

* https://github.com/JAlcocerT/open-resume

{{< details title="Use a CV Builder Framework: OpenResume or Reactive Resume" closed="true" >}}

* With [Reactive-Resume](https://fossengineer.com/open-source-curriculum/#the-reactive-resume-project)

* Or with **OpenResume**: https://github.com/JAlcocerT/open-resume

```sh
#version: '3'
services:
  open-resume:
    container_name: openresume #https://github.com/xitanggg/open-resume
    image: ghcr.io/jalcocert/open-resume:latest #https://github.com/users/JAlcocerT/packages/container/package/open-resume
    ports:
      - "3333:3000"
#     networks:
#       - cloudflare_tunnel
          
# networks:
#   cloudflare_tunnel:
#     external: true
```

{{< /details >}}

> Definitely structure outputs is a feature to have a look together with Overleaf (Latex) or this kind of projects!