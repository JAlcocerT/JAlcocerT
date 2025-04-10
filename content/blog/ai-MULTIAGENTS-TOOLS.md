---
title: "AI Multi Agents: PyAutogen"
date: 2025-04-10
draft: false
tags: ["Gen-AI","Python","Dev"]
description: 'Reviewing the most Popular AI Agents frameworks: AG2AI (AutoGen), CrewAI, LangChain, LlamaIndex,'
url: 'ai-multi-agents-frameworks'
---


https://github.com/JAlcocerT/Multi-Agents

Recently I was having a [conversation about whats trendy in the Dsc/AI space](https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/#dsc-tools-for-da-projects).



[RAGs](https://jalcocert.github.io/JAlcocerT/how-to-use-rags-with-python/), [Function calling](https://jalcocert.github.io/JAlcocerT/how-to-use-openai-function-calling/), [Structured Output](https://jalcocert.github.io/JAlcocerT/how-to-use-structured-outputs-LLM/),...

They are all great.

But can we just have LLMs working together? 

Actually, this is great tool to have when doing **research** of some new topic.


1. [Fabric](#the-fabric-project)
2. [Autogen](#the-autogen-project)
3. [CrewAI](#crewai)
4. [MetaGPT](#metagpt)
5. [Camel](#camel)
6. [LangGraph](#langgraph)



https://github.com/camel-ai/camel

> 🐫 CAMEL: Finding the Scaling Law of Agents. A multi-agent framework. https://www.camel-ai.org



* {{< newtab url="" text="The  Site" >}}
* {{< newtab url="https://github.com/daveshap/OpenAI_Agent_Swarm" text="The Agent_Swarm Code at Github" >}}
    * License: {{< newtab url="https://github.com/daveshap/OpenAI_Agent_Swarm#MIT-1-ov-file" text="MIT" >}} ❤️


## Open Source Agents Swarm Projects


### LangGraph

* https://www.langchain.com/langgraph

{{< youtube "qAF1NjEVHhY" >}}

<!-- 
https://www.youtube.com/watch?v=qAF1NjEVHhY 
-->


## The Fabric Project

* {{< newtab url="https://github.com/danielmiessler/fabric" text="The Fabric Code at Github" >}}
    * License: {{< newtab url="https://github.com/danielmiessler/fabric?tab=MIT-1-ov-file#readme" text="MIT" >}} ❤️


> Fabric is an open-source framework for **augmenting humans using AI**.

A collection of prompts (patterns) to interact effectively with AI:

* Summarize a video
* Create Prompts for Image Generation
* Answer questions about your code...

We can use Fabric together with Ollama and Groq - Both are OpenAI API Compatible.

### Fabric with Ollama

### Fabric with Groq

## Other F/OSS Multi-Agent Projects

[![Star History Chart](https://api.star-history.com/svg?repos=lucaslorentz/caddy-docker-proxy,NginxProxyManager/nginx-proxy-manager,geekan/MetaGPT&,type=Date)](https://star-history.com/#lucaslorentz/caddy-docker-proxy&NginxProxyManager/nginx-proxy-manager&geekan/MetaGPT&Date)



### The Autogen Project

https://github.com/microsoft/autogen
https://microsoft.github.io/autogen/



### Camel

https://github.com/camel-ai/camel

> 🐫 CAMEL: Finding the Scaling Law of Agents. A multi-agent framework. https://www.camel-ai.org

### MetaGPT

[MetaGPT Project](https://fossengineer.com/selfhosting-metagpt/) Details:

* {{< newtab url="https://docs.deepwisdom.ai/main/en/" text="The MetaGPT Docs Site" >}}
* {{< newtab url="https://github.com/geekan/MetaGPT" text="The MetaGPT Code at Github" >}}
    * License: {{< newtab url="https://github.com/geekan/MetaGPT?tab=MIT-1-ov-file#readme" text="MIT" >}} ❤️

> MetaGPT - A F/OSS **Multi Agent Framework** that will power your next Projects

### CrewAI

[CrewAI Project](https://fossengineer.com/ai-agents-crewai/)

* {{< newtab url="https://pypi.org/project/crewai/" text="The Project on PyPI" >}}
* {{< newtab url="https://github.com/joaomdmoura/crewAI" text="The CrewAI Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/joaomdmoura/crewAI/blob/main/LICENSE" text="MIT" >}} ❤️

> CrewAI is a Framework that will make easy for us to get Local AI Agents interacting between them.



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


{{< details title="What mor ecan PyAutoGen do? 📌" closed="true" >}}

Yes, PyAutoGen can be used to get information about websites and databases, although the methods and complexity vary. Here's how:

**1. Websites:**

* **Web Scraping:**
    * AutoGen agents can use Python libraries like `requests` and `Beautiful Soup` (or `Scrapy`) to scrape information from websites.
    * Agents can be instructed to:
        * Download HTML content.
        * Parse the HTML to extract specific data.
        * Follow links to navigate through the website.
    * Example:
        * An agent could be asked to get the current price of a product from an e-commerce website.
        * Another agent could be used to summarize the content of a news article.
* **Web APIs:**
    * If the website provides a public API, agents can use `requests` to interact with the API and retrieve structured data (JSON, XML).
    * This is generally more reliable and efficient than web scraping.
* **Browser Automation:**
    * For websites that rely heavily on JavaScript or require user interaction, agents can use libraries like `Selenium` or `Playwright` to automate browser actions.
    * This allows agents to:
        * Load web pages.
        * Interact with elements (buttons, forms).
        * Extract data from dynamic content.

**2. Databases:**

* **SQL Queries:**
    * AutoGen agents can use Python libraries like `sqlite3`, `psycopg2` (for PostgreSQL), `mysql-connector-python` (for MySQL), or `SQLAlchemy` to connect to databases and execute SQL queries.
    * Agents can be instructed to:
        * Connect to a database.
        * Formulate SQL queries based on user requests.
        * Retrieve and process data from the database.
    * Example:
        * An agent could be asked to retrieve a list of customers from a database.
        * Another agent could be used to calculate aggregate statistics (e.g., average sales).
* **Database APIs:**
    * Some databases provide REST APIs or other interfaces that agents can use to interact with the database.
    * This can be useful for cloud-based databases or when direct SQL access is not available.
* **Langchain integration:**
    * AutoGen can work in conjunction with langchain, and therefore use any of the database integrations that langchain provides. This can simplify the database interactions.

**Key Considerations:**

* **Security:**
    * When interacting with websites or databases, it's crucial to handle credentials and sensitive data securely.
    * Avoid hardcoding API keys or database passwords in your code. Use environment variables or secure configuration files.
* **Rate Limiting:**
    * Websites and APIs often have rate limits to prevent abuse.
    * Implement mechanisms to handle rate limits and avoid overloading servers.
* **Data Parsing:**
    * Parsing HTML or database results can be complex, especially when dealing with unstructured or inconsistent data.
    * Use robust parsing techniques and error handling.
* **Ethical Considerations:**
    * Respect website terms of service and database usage policies.
    * Avoid scraping or accessing data that you are not authorized to access.

**AutoGen's Role:**

* AutoGen provides the framework for orchestrating the agents that perform these tasks.
* It enables agents to collaborate, communicate, and coordinate their efforts to achieve complex goals involving websites and databases.
* AutoGen can be used to create agents that can decide which tool, or function to use, in order to get the required information from the website or database.

In summary, AutoGen can be a powerful tool for building applications that retrieve and process information from websites and databases, but it's important to consider the technical and ethical implications of these activities.


{{< /details >}}



### Agents with LangChain

You guessed it.

[LangChain can also do Agents](https://www.langchain.com/agents) tricks.

* https://www.langchain.com/stateofaiagents

You might know Langchain because of its useful **Chains**.

{{< callout type="info" >}}
**LangChain as RAG** can [chat with CSV](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/)& [**DBs**](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/). Also [with PDFs](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs/)
{{< /callout >}}


<!-- 
https://www.youtube.com/watch?v=rFQ5Kmkd4jc -->

{{< youtube "rFQ5Kmkd4jc" >}}



### Agents with Llama-Index

LlamaIndex, as described, is designed to work with various tools, data sources, and workflows. 

* https://jalcocert.github.io/JAlcocerT/using-langchain-with-pandas-df/#llamaindex-and-pandas-dataframes
* https://jalcocert.github.io/JAlcocerT/how-to-use-rags-with-python/#llama-index


It helps to augment LLMs with context from different data sources such as APIs, SQL databases, PDFs, etc., without being tied to a specific framework.

* https://docs.llamaindex.ai/en/stable/

The ability to integrate multiple agents, tools, and data sources makes it adaptable to various development environments and workflows.

Context augmentation involves providing an LLM with specific data (private or external) to help solve a problem, enhancing the LLM's ability to generate relevant answers by accessing relevant data.

Agents are knowledge assistants powered by LLMs that perform tasks using various tools, including Retrieval-Augmented Generation (RAG) as one tool in a larger workflow.

Workflows combine multiple agents, tools, and data connectors to create complex, event-driven processes that can automate tasks, reflecting advanced LLM applications.

### Agents with PydanticAI

<!-- https://www.youtube.com/watch?v=1lBpIbRafvI -->

{{< youtube "1lBpIbRafvI" >}}

I was using **Pydantic** this year.

We can say it is a data validation framework, that now it has an **AI version**

* https://github.com/pydantic/pydantic-ai
  * https://ai.pydantic.dev/
  * https://pypi.org/project/pydantic-ai/

> Agent Framework / shim to use Pydantic with LLMs - **MIT Licensed!**


{{< details title="What it is Pydantic? Data Validation? 📌" closed="true" >}}

Pydantic is a **data validation** and settings management library in Python. 

It’s widely used for validating data and ensuring that inputs conform to the **expected types and formats**.

{{< /details >}}


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

You can use [Streamlit with CrewAI](https://github.com/streamlit/cookbook/tree/main/recipes/crewai)

Example - https://github.com/tonykipkemboi/trip_planner_agent

> CrewAI agents that can plan your vacation.


<!-- https://www.youtube.com/watch?v=TbTqA09-cwQ -->

{{< youtube "TbTqA09-cwQ" >}}

#### CrewAI Pandas DF Agent

* https://medium.com/pythoneers/building-a-multi-agent-system-using-crewai-a7305450253e

### MetaGPT

* https://github.com/geekan/MetaGPT

> MIT | 🌟 The Multi-Agent Framework: First AI Software Company, Towards Natural Language Programming
 
[MetaGPT](https://fossengineer.com/selfhosting-metagpt/)

###  SuperAGI

*  https://github.com/TransformerOptimus/SuperAGI
    * https://github.com/TransformerOptimus/SuperAGI?tab=MIT-1-ov-file#readme

>  <⚡️> SuperAGI - A dev-first open source autonomous AI agent framework. Enabling developers to build, manage & run useful autonomous agents quickly and reliably. 

---

## Conclusions



[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)



[![Star History Chart](https://api.star-history.com/svg?repos=langchain-ai/langchain,deepset-ai/haystack,Sinaptik-AI/pandas-ai&,type=Date)](https://star-history.com/langchain-ai/langchain&deepset-ai/haystack&Sinaptik-AI/pandas-ai&Date)


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

For example, with **duckduckgo**:

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