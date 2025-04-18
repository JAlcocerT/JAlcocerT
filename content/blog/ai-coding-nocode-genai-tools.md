---
title: "No Code Tools to use Gen AI"
date: 2025-04-17T23:20:21+01:00
draft: false
tags: ["Gen-AI","Python","Dev"]
description: 'Generative AI made simple. Flowise, '
url: 'no-code-ai-tools'
---


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/" title="RAG 101" image="//blog_img/GenAI/rag101.jpeg" subtitle="My Fav RAGs Post" >}}
  {{< card link="https://github.com/JAlcocerT/Docker" title="Docker Config Files" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Tinkering with Docker Services" >}}
{{< /cards >}}

### Flowise AI

* **Flowise AI**, a groundbreaking Free platform that is making AI more accessible than ever before.
  * {{< newtab url="https://flowiseai.com/" text="The Flowise AI Official Page" >}}
  * {{< newtab url="https://github.com/FlowiseAI/Flowise" text="The Flowise AI Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/FlowiseAI/Flowise?tab=Apache-2.0-1-ov-file#readme" text="Apache v2" >}} ✅

<!-- https://www.youtube.com/watch?v=SASUXOV7tEQ -->

{{< youtube "SASUXOV7tEQ" >}}


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/FlowiseAI" title="FlowiseAI Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}



### LangFlow

Langflow is designed to redefine the boundaries of AI development in experimentation and real-world scenarios.

It is **based on Python**, which makes it ready to have many integrations:

![LangFlow Store](/img/GenAI/NoCode-AI/LangFlow_Store.png)

* **LangFlow**:
  * {{< newtab url="https://www.langflow.org/" text="The Flowise AI Official Page" >}}
  * {{< newtab url="https://github.com/langflow-ai/langflow" text="The Flowise AI Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/langflow-ai/langflow?tab=MIT-1-ov-file#readme" text="MIT" >}} 

* https://hub.docker.com/r/langflowai/langflow

> ⛓️ Langflow is a **visual framework for building multi-agent and RAG applications**. It's open-source, Python-powered, fully customizable, model and vector store agnostic.

```sh
python -m venv langflow #create the venv (python3 if you are in mac/linux)

langflow\Scripts\activate #activate venv (windows)
source langflow/bin/activate #(linux)

pip install langflow #https://pypi.org/project/langflow/  #--pre --force-reinstall 

#langflow run

#deactivate #when you are done
```

Acces LangFlow at `localhost:7860`

* https://www.youtube.com/watch?v=VbqfZjT_PLE
  * https://github.com/leonvanzyl/langflow-tutorial-2024/blob/master/run.sh

> Thanks again Leon Van Zyl

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/" title="LangFuse & MLFlow Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

```yml
#version: '3.8'

services:
  langflow:
    image: langflowai/langflow:latest
    ports:
      - "7860:7860"
    stdin_open: true # equivalent to -i
    tty: true        # equivalent to -t
    restart: unless-stopped
```

https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LangFlow
https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/LangFuse

### Rivet AI

https://www.youtube.com/watch?v=Zd5wjy4YPis&t=157s



### DifyAI

https://www.youtube.com/watch?v=yXAJwDtAbLo

> Is Dify the easiest way to build AI Applications?


## Conclusion

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-structured-outputs-LLM/" title="Tinkering with structured outputs | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-openai-function-calling/" title="Tinkering with function calling | Post ↗" >}}
{{< /cards >}}


### See also...


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/" title="RAG 101" image="//blog_img/GenAI/rag101.jpeg" subtitle="Docker Config" >}}
  {{< card link="https://github.com/JAlcocerT/Docker" title="Docker Config Files" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Config" >}}
{{< /cards >}}

1. Chatwoot

{{< youtube "1Q_MDOWaljk" >}}


2. N8N



---

## FAQ

### F/OSS No Code Data Tools


#### BaseRow

* The open platform to create scalable databases and applications—without coding - https://baserow.io/

https://gitlab.com/baserow/baserow
https://gitlab.com/baserow/baserow/-/blob/develop/LICENSE

Can be SelfHosted or use: https://baserow.io/database

Baserow is an open source no-code database and Airtable alternative.

Create your own database without technical experience. Our user friendly no-code tool gives you the powers of a developer without leaving your browser.

* Focus: Open-source no-code database tool with a user-friendly interface resembling spreadsheets but with relational database capabilities.
* Strengths: Offers a visual interface for building tables, defining relationships, and managing data. Supports various data types, including files, formulas, and automations. Integrates with popular tools like Zapier and webhooks.
* Considerations: While feature-rich, it might not be as powerful as some options for complex relational modeling.

#### Other

  * API Table - https://github.com/apitable/apitable
  https://github.com/apitable/apitable?tab=AGPL-3.0-1-ov-file#readme
    * https://github.com/apitable/apitable#installation

Rowy: https://github.com/rowyio/rowy?tab=readme-ov-file

Focus: Low-code backend platform for building internal tools and automating workflows.
Strengths: Flexible and customizable, allowing you to build custom interfaces, integrations, and automations. Supports a variety of data sources and connects to external APIs.
Considerations: Requires more development knowledge compared to other options. Might have a steeper learning curve for non-programmers.

4. Appsmith: https://www.appsmith.com/integration
https://github.com/appsmithorg/appsmith

Focus: Open-source **low-code platform** for building internal tools and custom applications.
Strengths: Visually build user interfaces using drag-and-drop functionality and connect to various data sources. Offers features like user authentication, form handling, and data integrations.
Considerations: While offering a visual interface, it might require some coding knowledge for complex functionalities.

> Platform to build admin panels, internal tools, and dashboards. Integrates with 25+ databases and any API.

https://docs.appsmith.com/getting-started/setup/installation-guides/docker?utm_source=github&utm_medium=organic&utm_campaign=readme

```yml
services:
   appsmith:
     image: index.docker.io/appsmith/appsmith-ee
     container_name: appsmith
     ports:
         - "80:80"
         - "443:443"
     volumes:
         - ./stacks:/appsmith-stacks
     restart: unless-stopped
```


5. Budibase:

Focus: Open-source self-hosted alternative for building internal tools and managing data.
Strengths: Offers a modular architecture with components for building databases, forms, dashboards, and workflows. Supports user management, role-based access control, and data filtering.
Considerations: Relatively new project compared to some alternatives. Feature set might be under development.

https://github.com/Budibase/budibase
https://github.com/Budibase/budibase?tab=License-1-ov-file#readme


> Low code platform for building business apps and workflows in minutes. Supports PostgreSQL, MySQL, MSSQL, MongoDB, Rest API, Docker, K8s, and more 🚀



* https://github.com/RasaHQ/rasa
https://github.com/RasaHQ/rasa?tab=Apache-2.0-1-ov-file#readme

Rasa Open Source is the most popular open source framework for **building chat and voice-based AI assistants**.

> 💬 Open source machine learning framework to automate text- and voice-based conversations: NLU, dialogue management, connect to Slack, Facebook, and more - Create chatbots and voice assistants



### Other F/OSS No Code Tools

* Node Red
* Apache Airflow