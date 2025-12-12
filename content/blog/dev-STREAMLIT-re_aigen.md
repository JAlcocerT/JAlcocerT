---
title: "Everything I enjoy about Streamlit. With AI as RE Agent."
date: 2025-04-03T19:20:21+01:00
draft: false
tags: ["Dev","SliDevJS","Tech Talk"]
description: 'Quick PoC Web Apps with Python and Streamlit. Applied to a Real Estate Calculator with GenAI Powered recommentations.'
url: 'streamlit-is-cool'
---


## Streamlit Calculator and GenAI RE Agent

I was building a simple web app RE calculator with Streamlit to explore:

* https://streamlit.io/
  * https://github.com/streamlit/streamlit
  * https://github.com/streamlit/streamlit?tab=Apache-2.0-1-ov-file#readme
  * https://pypi.org/project/streamlit/"

> Awsome Streamlit Public {{< newtab url="https://github.com/jrieke/best-of-streamlit" text="Resources" >}}

And then I decided to combine with with a RAG, creating this whole project.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="Chat with Data" image="/blog_img/biz/RE/RE-Calc.png" subtitle="Simple Real Estate calculator POST" >}}
  {{< card link="https://gitlab.com/fossengineer1/py_stocks/-/tree/main/EDA_Mortage" title="RE Streamlit App" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for the RE Calculator" >}}
{{< /cards >}}

Its was time to put few pieces together, and add **Generative AI capabilities**:

{{< callout type="info" >}}
See **[Data-ChatBot](https://github.com/JAlcocerT/Data-Chat)** source code 💻 and presentation *powered by SliDev*!
{{< /callout >}}

As you know, this Streamlit Projects are very simple to structure:

{{< filetree/container >}}
  {{< filetree/folder name="StreamlitProject" >}}
    {{< filetree/file name="app.py" >}}
    {{< filetree/folder name="Z_UDF" state="open" >}}
      {{< filetree/file name="Auth_functions.py" >}}
      {{< filetree/file name="Other_UDFs.py" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
{{< /filetree/container >}}


### The AI Tech Stack

What are we building exactly?

<!-- ![alt text](/blog_img/biz/RE/RE-bot.jpeg) -->

<!-- https://youtu.be/9MV9wj95iBE -->

{{< youtube "9MV9wj95iBE" >}}


{{< tabs items="Full-Fledge,PoC Gen AI" >}}

  {{< tab >}}
  Complex and full fledge setup: with RAG, embeddings and 2 LLMs

  1. **RAGs**: LlamaIndex, Mem0 together with HuggingFaceEmbedding(model_name="BAAI/bge-base-en-v1.5")

  2. **LLMs**: OpenAI, [Anthropic](https://docs.anthropic.com/en/docs/about-claude/models/all-models)

  ```sh
  OPENAI_API_KEY=sk-proj-yourapikey #https://platform.openai.com/api-keys
  ANTHROPIC_API_KEY=sk-ant-api03-yourapi #https://console.anthropic.com/settings/keys
  ```

* https://console.anthropic.com/workbench/
* https://platform.openai.com/api-keys

  ![alt text](/blog_img/biz/RE/re-embedding.png)
  
  {{< /tab >}}

  {{< tab >}}
  How about keeping it simple with just OpenAI?

  ![Cat product Meme](/blog_img/memes/features-vs-needs.png)

  {{< /tab >}}

{{< /tabs >}}

You will need **Keys:**


Whatever option you choose, see how the **Streamlit App is done [modular](https://github.com/JAlcocerT/Data-Chat/blob/main/Z_DeployMe/RealEstate.py)**:


{{< details title="Modular Streamlit Approach... 📌" closed="true" >}}

```sh
import streamlit as st
import os
from UDF_st_logic import re_calculator_ui #the magic happens here
from UDF_GenAI import st_openai_md_genai #and here :)

import UDF_Auth_functions as af

def main():
    if af.login(): #Simple Auth Layer
        genai_mode = os.getenv("GenAI_MODE", False)

        if genai_mode and genai_mode.lower() == "true":  # Check if env var exists and is "true"
            re_calculator_ui()
            st_openai_md_genai()
        else:
            re_calculator_ui()

if __name__ == "__main__":
    main()
```

{{< /details >}}

![alt text](/blog_img/biz/RE/re-ai-agent.png)

> About each of those pieces, I was writing a little bit already

Once you have the app ready, we go to the containers part:

```sh
#sudo docker image build -t re_calc_genai:v6b . > build.log 2>&1
sudo docker image build --progress=plain -t re_calc_genai:v6b . 2>&1 | tee build.log
```

You will need to provide **valid SSL certificates** after that:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/" title="Ways to get Https ↗" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX ↗" icon="book-open" >}}
  {{< card link="https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/" title="Cloudflared ↗" icon="book-open" >}}
{{< /cards >}}

You can have now a **real estate aigent** that provides 24/7 recommendations about properties:

![alt text](/blog_img/biz/RE/properties-md.png)

**The data?**

Pure [markdown](https://github.com/JAlcocerT/Data-Chat/blob/main/Z_DeployMe/properties.md) or `.mdx` from the site itself: 

![alt text](/blog_img/biz/RE/re-properties.png)

The good thing about markdown, is that it can be used to create related websites very quickly:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/real-estate-website/" title="Latest updates for a Real Estate Website" image="/blog_img/biz/RE/dmproperties.png" subtitle="Customizing Astro Themes for RE Agency " >}}
{{< /cards >}}

> You can use a **live editor** to get around **markdown**: https://dillinger.io/



---

## Conclusions

It all started few months back, with just some [tinker on few RAGs frameworks](https://jalcocert.github.io/JAlcocerT/how-to-use-rags-with-python/)

And now...

See the RAG with [LlamaIndex and Mem0](https://github.com/JAlcocerT/Data-Chat/tree/main/LLamaIndex/With_Mem0) in action:

<!-- https://youtu.be/cEfqonasQ0M -->

Remember that it will require a delay with **the embedding process** and further retrieval after each question:

{{< youtube "cEfqonasQ0M" >}}

I have also been tinkering with a Web App framework alternative, Reflex:

{{< cards cols="1" >}}
    {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/" title="Chat with Properties with Reflex ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="Fe vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}

You could be implementing similar RAG with any of these frameworks, like [LangChain](https://jalcocert.github.io/JAlcocerT/how-to-use-rags-with-python/#exploring-langchain):

[![Star History Chart](https://api.star-history.com/svg?repos=run-llama/llama_index,langchain-ai/langchain,Sinaptik-AI/pandas-ai&,type=Date)](https://star-history.com/#run-llama/llama_index/caddy-docker-proxy&langchain-ai/langchain&Sinaptik-AI/pandas-ai&Date)

And as data source, you could be using anything, from CSV, PDFs to regular SQL Databases:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="LangChain + SQL DB">}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs//" title="LangChain + PDF" >}}
{{< /cards >}}


Remember that you can also create PPT's as a code [thanks to SliDev!](#how-to-prepare-a-tech-talk-with-slidevjs)

![Streamlit User Auth](/blog_img/apps/streamlit/slidev-ghpages.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/" title="MultiChat SliDev" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="MiltiChat SliDev" >}}
  {{< card link="" title="SliDev PPTs as Code" image="/blog_img/apps/gh-jalcocert.svg" subtitle="I Wrote a small PPT with SliDev for MultiChat and Published it with GHA" >}}
{{< /cards >}}

---

## Outro

### Streamlit Features for PoC

You will need **https** to have credibility that you build something solid.

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX ↗" >}}
{{< /cards >}}

{{< callout type="info" >}}
Remember that the visible Streamlit App name in the **browser tab**, will match the name of the **Python streamlit main file**! 
{{< /callout >}}


#### Features under a Wall

So far, Ive come across few ways (x4) to place **authentication on top of Streamlit Apps**:

1. The `st.login` built in feature: https://docs.streamlit.io/develop/api-reference/user/st.login

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/#for-the-real-estate-project" title="Real Estate Scrapping Photos - Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/WebMigrAItion/" title="MigrAItion Photos Script Source Code ↗" icon="book-open" >}}
{{< /cards >}}

##### Provided Users and Pass

2. By using the `streamlit-authenticator` library, only my client can access it:

![Streamlit User Auth](/blog_img/biz/RE/re-tool-userauth.png)

Its all about: https://pypi.org/project/streamlit-authenticator/

{{< details title="There is a sample of this PoC authentication at MultiChat or RE Photo Tool 📌" closed="true" >}}

* https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Streamlit_Pages/Auth_functions.py
* https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/WebMigrAItion/OpenAI_MigrateWebInfo_v4st.py


{{< /details >}}

{{< callout type="info" >}}
With this method, you can have several hardcoded `user/password` created! See [this example auth UDF](https://github.com/JAlcocerT/Data-Chat/blob/main/Z_DeployMe/UDF_Auth_functions.py).
{{< /callout >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-streamlit-chatgpt/" title="MultiChat Post" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="Post where I explained the creation of the streamlit chatbot" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Streamlit_Pages/Auth_functions.py" title="Multichat with Auth Source Code" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Users and passwords configuration Script " >}}
{{< /cards >}}

##### Email Verification

Recently I got to know also about this project to verify emails:

* https://rapid-email-verifier.fly.dev/

> MIT | Privacy-first, Free, **Open Source email verifier**


{{< details title="How to use Rapid Email Verifier? 📌" closed="true" >}}


{{< /details >}}


3. You can also do the trick by passing the hard work to a 3rd party **subscription newsletter**, like `mailerlite`, and you will query its API.

4. Using **Stripe API**: if an user have an active subscription or free tier evalution, it can go ahead and use your Streamlit App

> Points 2 and 3 are features that I have explored with the AIssistant project:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/" title="AIssistant Post" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="Post where I explained the creation of the streamlit AIssistant" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant" title="AIssistant Source Code" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Different auth options" >}}
{{< /cards >}}


##### With Other Containers

Self-hostable solution that combines frontend *and* user management (registration, login, access control). 

{{< details title="Keycloak, Supabase, Authentic, LogTo,... 📌" closed="true" >}}

**1. Keycloak (Identity and Access Management):**

* **Type:**  Full-fledged IAM solution.
* **Pros:**  Very powerful and flexible, supports various authentication protocols (OAuth 2.0, OpenID Connect, SAML), social logins, multi-factor authentication, fine-grained authorization.  Can act as your authentication server.
* **Cons:**  Can be complex to set up and configure, requires Java knowledge (as it's built on Java).  It's a dedicated service, so you still need a separate frontend.
* **Frontend Integration:**  You would integrate Keycloak with your chosen frontend framework (React, Vue, Angular, etc.) using its client libraries.  Keycloak provides JavaScript adapters to simplify this.
* **Good for:**  Applications that require robust authentication and authorization, especially if you need single sign-on (SSO) across multiple services.

**2. Supabase (Open Source Alternative to Firebase):**

* **Type:**  Backend-as-a-Service (BaaS) that you can self-host (though they also offer a hosted service).
* **Pros:**  Provides authentication, database (PostgreSQL), storage, edge functions, and more.  Easy to use, good documentation.  Has client libraries for various frontend frameworks.
* **Cons:**  Self-hosting requires managing the underlying infrastructure. While open-source, some features might require a paid plan if you use their hosted service.
* **Frontend Integration:**  Supabase provides JavaScript libraries that make it easy to integrate authentication and other backend services into your frontend application.
* **Good for:**  Projects where you need a quick setup with a full backend suite, including user authentication.

**3. Appwrite (Open Source Backend Server):**

* **Type:**  Open-source backend server similar to Supabase.
* **Pros:**  Provides authentication, database, storage, functions, and more.  Focuses on developer experience.  Has client SDKs for various platforms.
* **Cons:**  Relatively newer than Supabase, so the community is still growing.
* **Frontend Integration:**  Appwrite offers SDKs for frontend frameworks, simplifying the integration process.
* **Good for:**  Projects where you need a self-hosted backend with a focus on developer-friendliness.

**4. Self-Hosting a Custom Backend (Node.js, Python/Django/Flask, etc.):**

* **Type:**  You build your own backend.
* **Pros:**  Maximum flexibility and control.
* **Cons:**  Requires significant development effort, you're responsible for all aspects, including security.
* **Frontend Integration:**  Your frontend would communicate with your custom backend via API calls (REST or GraphQL).
* **Good for:**  Projects with very specific requirements that cannot be met by existing solutions, or where you need complete control.  This is generally the most complex path.

**5. Nhost (Open Source Firebase Alternative):**

* **Type:** Open-source platform for building serverless web apps.
* **Pros:** Provides authentication, storage, GraphQL API, and Postgres database.
* **Cons:**  Requires some knowledge of GraphQL.
* **Frontend Integration:**  Nhost provides SDKs for integrating with your frontend.
* **Good for:**  Projects where you need a backend with GraphQL API and serverless functions.

6. LogTo

{{< /details >}}

**Recommendation:**

* **For most cases, especially if you're not already deeply invested in a specific backend technology, Supabase or Appwrite are excellent starting points.** They offer a good balance of ease of use and functionality.  They handle the complexities of user authentication and provide you with the tools to quickly integrate it into your frontend.
* **If you need a very robust and flexible IAM solution and are comfortable with the complexity, Keycloak is a powerful choice.**
* **If you have very specific requirements or want complete control, building your own backend is an option, but it's the most time-consuming.**

Remember that even with these self-hostable options, you'll still need to choose a frontend framework (React, Vue, etc.) to build the user interface of your application.


---

## FAQ

You can run the app at a server / [other PC at home](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/#internet-benchmark):

```sh
ssh jalcocert@192.168.0.12 #or the tailscale address
git clone https://github.com/JAlcocerT/Data-Chat
cd ./Z_DeployMe
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/biz/RE/RE-Calc.png" subtitle="Simple Real Estate calculator POST" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/github-actions-use-cases/#multiarch-containers---qemu" title="GHA Setup 101" image="/blog_img/dev/re-actions-secret-ready.png" subtitle="Creatin container for the Streamlit RE Data Chat" >}}
{{< /cards >}}


* https://platform.openai.com/api-keys
* https://console.anthropic.com/

![alt text](/blog_img/biz/RE/RE-bot-ppt.jpeg)

<!-- ![alt text](https://github.com/JAlcocerT/Data-Chat/blob/main/realestate/RE-bot-ppt.jpeg) -->

<!-- https://github.com/JAlcocerT/Data-Chat/blob/main/realestate/RE-bot-ppt.jpeg -->

### How to prepare a Tech Talk with SliDevJS

<!-- ![alt text](/blog_img/biz/RE/slidev-re.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#slides-creation-agent" title="AIssistant" image="/blog_img/apps/ai-assistant.png" subtitle="Streamlit PPT Creator and more" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/#slidev" title="SliDev JS App" image="/blog_img/biz/RE/slidev-re.png" subtitle="Presentations as a Code with SliDev" >}}
{{< /cards >}}

0. Get ready your [web dev setup](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/)

1. Its very important to instruct the LLM to provide you a clear, but concise agenda (work markdown icons as optional). Similar in lenght to the one provided by SliDev

2. Add your mermaidJS diagrams for visual explanations of the flow

```sh
#git clone https://github.com/JAlcocerT/Data-Chat
npm init slidev@latest
```

* https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/#slidev
* https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/#preparing-a-tech-talk-with-ai

> See the event [here](https://events.exadel.com/event/rag-powered-real-estate/)

> > And here it is the **result**: https://jalcocert.github.io/Data-Chat/

### Other Alternatives to RAG

**KBLAM**

https://www.microsoft.com/en-us/research/blog/introducing-kblam-bringing-plug-and-play-external-knowledge-to-llms/

* https://github.com/microsoft/KBLAM

>  Official Implementation of "KBLaM: Knowledge Base augmented Language Model" 

**MCP**: Model Context Protocol

<!-- https://www.youtube.com/watch?v=KHDMoQ2Sp2s -->

{{< youtube "KHDMoQ2Sp2s" >}}

Model Context Protocol (MCP) is an open standard designed to connect large language models (LLMs) with external data sources and tools, allowing these models to access and interact with real-world information more effectively.

This protocol, introduced by Anthropic, simplifies the integration process for developers, making it easier to build context-aware applications without the need for custom coding for each combination of AI model and external system.