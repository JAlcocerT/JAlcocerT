---
title: "AI Multi Agents"
date: 2025-03-01
draft: true
# cover:
#     image: "https://socialify.git.ci/jw782cn/Claude-Streamlit/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"
#     alt: "" # alt text
#     caption: "" # display caption under cover
tags: ["Gen-AI","Python","Dev"]
description: 'Reviewing the most Popular AI Agents frameworks: AG2AI (AutoGen), LangChain, LlamaIndex,'
url: 'ai-multi-agents-frameworks'
---


[RAGs](https://jalcocert.github.io/JAlcocerT/how-to-use-rags-with-python/), [Function calling](https://jalcocert.github.io/JAlcocerT/how-to-use-openai-function-calling/), [Structured Output](https://jalcocert.github.io/JAlcocerT/how-to-use-structured-outputs-LLM/),...

They are all great.

But can we just have LLMs working together? 

Actually, this is great tool to have when doing **research** of some new topic.

{{< details title="Interesting Research Tools 📌" closed="true" >}}

**Research Agent**

* https://github.com/assafelovic/gpt-researcher
    * https://gptr.dev/

> LLM based autonomous agent that conducts local and web research on any topic and generates a comprehensive report with citations - **Apache v2**

{{< /details >}}


[![Star History Chart](https://api.star-history.com/svg?repos=langchain-ai/langchain,deepset-ai/haystack,Sinaptik-AI/pandas-ai&,type=Date)](https://star-history.com/langchain-ai/langchain&deepset-ai/haystack&Sinaptik-AI/pandas-ai&Date)

{{< callout type="info" >}}
Im testing these tools at the [**MultiAgents** Repo](https://github.com/JAlcocerT/multiagents) 💻 
{{< /callout >}}


### Agents with AutoGen - AG2AI

We have several agent concepts in AG2 to help you build your AI agents.

We introduce the most common ones here:

* Conversable Agent: Agents that are able to send messages, receive messages and generate replies using GenAI models, non-GenAI tools, or human inputs.
* Human in the loop: Add human input to the conversation
* Orchestrating multiple agents: Users can orchestrate multiple agents with built-in conversation patterns such as swarms, group chats, nested chats, sequential chats or customize the orchestration by registering custom reply methods.

* Tools: Programs that can be registered, invoked and executed by agents - Agents gain significant utility through tools as they provide access to external data, APIs, and functionality.


Advanced Concepts: AG2 supports more concepts such as structured outputs, rag, code execution, etc.

* https://pypi.org/project/pyautogen/
* https://github.com/ag2ai/ag2

```sh
pip install ag2
#or with the alias!
```


I got started with PyAutoGen thanks to this `.ipynb`:

https://colab.research.google.com/drive/1xee3xdatViM4pespvLVVOrHJ8sB1MgO5?usp=drive_link


```py
from autogen import AssistantAgent, UserProxyAgent, config_list_from_json

llm_config = {
    "config_list": config_list_from_json(env_or_file="OAI_CONFIG_LIST")
}

assistant = AssistantAgent("assistant", llm_config=llm_config)
user_proxy = UserProxyAgent("user_proxy", code_execution_config={"work_dir": "coding", "use_docker": False})
user_proxy.initiate_chat(assistant, message="Plot a chart of NVDA and TESLA stock price change YTD.")
# This initiates an automated chat between the two agents to solve the task
```

Advanced agentic design patterns
AG2 supports more advanced concepts to help you build your AI agent workflows. You can find more information in the documentation.

Structured Output
Ending a conversation
Retrieval Augmented Generation (RAG)
Code Execution
Tools with Secrets

### Agents with LangChain

You guessed it.

[LangChain can also do Agents](https://www.langchain.com/agents) tricks.

* https://www.langchain.com/stateofaiagents

You might know Langchain because of its useful **Chains**.

{{< callout type="info" >}}
**LangChain as RAG** can [chat with CSV](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/)& [**DBs**](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/). Also [with PDFs](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs/)
{{< /callout >}}


### Agents with Llama-Index

* https://docs.llamaindex.ai/en/stable/

LlamaIndex, as described, is designed to work with various tools, data sources, and workflows. 

It helps to augment LLMs with context from different data sources such as APIs, SQL databases, PDFs, etc., without being tied to a specific framework.

The ability to integrate multiple agents, tools, and data sources makes it adaptable to various development environments and workflows.

Context augmentation involves providing an LLM with specific data (private or external) to help solve a problem, enhancing the LLM's ability to generate relevant answers by accessing relevant data.

Agents are knowledge assistants powered by LLMs that perform tasks using various tools, including Retrieval-Augmented Generation (RAG) as one tool in a larger workflow.

Workflows combine multiple agents, tools, and data connectors to create complex, event-driven processes that can automate tasks, reflecting advanced LLM applications.

### Agents with PydanticAI

<!-- https://www.youtube.com/watch?v=1lBpIbRafvI -->

{{< youtube "1lBpIbRafvI" >}}


### Chat-DEV

* {{< newtab url="https://github.com/OpenBMB/ChatDev" text="The ChatDev Repository" >}}
    * License: {{< newtab url="https://github.com/OpenBMB/ChatDev?tab=Apache-2.0-1-ov-file#readme" text="Apache v2" >}} ❤️


> **Create Customized Software** using Natural Language Idea (through LLM-powered **Multi-Agent Collaboration**) 

### Langroid

* https://github.com/langroid/langroid
    * https://langroid.github.io/langroid/

Example - https://github.com/langroid/langroid/blob/main/examples/basic/chat-search-assistant.py

> Harness LLMs with Multi-Agent Programming - **MIT LICENSED!**


### Auto-GPT

* https://github.com/Significant-Gravitas/AutoGPT
* https://agpt.co/

> AutoGPT is the vision of accessible AI for everyone, to use and to build on. Our mission is to provide the tools, so that you can focus on what matters.



### CrewAI

https://github.com/streamlit/cookbook/tree/main/recipes/crewai

Example - https://github.com/tonykipkemboi/trip_planner_agent

> CrewAI agents that can plan your vacation.


<!-- https://www.youtube.com/watch?v=TbTqA09-cwQ -->

{{< youtube "TbTqA09-cwQ" >}}

#### CrewAI Pandas DF Agent

* https://medium.com/pythoneers/building-a-multi-agent-system-using-crewai-a7305450253e

### MetaGPT
 
###  SuperAGI

https://github.com/TransformerOptimus/SuperAGI
https://github.com/TransformerOptimus/SuperAGI?tab=MIT-1-ov-file#readme

>  <⚡️> SuperAGI - A dev-first open source autonomous AI agent framework. Enabling developers to build, manage & run useful autonomous agents quickly and reliably. 


---

## FAQ

* https://e2b.dev/ai-agents/open-source


### Interesting LLMs Architectures

* MoE - Mix of Experts
* MoA - Mix of Agents
* ReACT

{{< details title="More about Solara - ReACT Framework 📌" closed="true" >}}

https://github.com/widgetti/solara

> A Pure Python, React-style Framework for Scaling Your Jupyter and Web Apps


Build a Python WebApp in 3 minutes with [Solara (Streamlit Alternative)](https://www.youtube.com/watch?v=hXA4JPNXhqQ)


{{< /details >}}

### How to Provide Web Context to the Agents

#### Via Scrapping

#### Via Web Search

For example, with duckduckgo:

```sh
pip install duckduckgo-search
```

```py
from duckduckgo_search import ddg_answers

# Perform search query
results = ddg_answers('Python programming')

# Output the search results
print(results)
```