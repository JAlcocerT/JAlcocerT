---
title: "Streamlit Updates. Improving Data Apps"
date: 2025-05-17T23:50:21+01:00
draft: false
tags: ["Dev","WebApp","Python","Speech and Audio"]
description: 'More cool Streamlit WebApps'
url: 'streamlit-apps'
---


**intro**

Streamlit is part of [Snowflake](https://www.snowflake.com/en/blog/snowflake-to-acquire-streamlit/).

Which you might have heard on the [BigData](https://jalcocert.github.io/JAlcocerT/big-data-tools-for-data-analytics/) context.

> Continuing from https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/


* https://github.com/kajarenc/stauthlib
    * https://github.com/streamlit/streamlit/issues/8653

To learn streamlit with youtube: https://www.youtube.com/@andfanilo

* https://github.com/pmbaumgartner/streamlitopedia

## Streamlit Features I love

You can see whats coming next to Streamlit: https://roadmap.streamlit.app/



### Chat Elements

<!-- https://www.youtube.com/watch?v=4sPnOqeUDmk -->
 
{{< youtube "4sPnOqeUDmk" >}}


### Replit and Streamlit

<!-- https://www.youtube.com/watch?v=CJ9E0Sm_hy4 -->

{{< youtube "CJ9E0Sm_hy4" >}}


### Audio with Streamlit

It was not that straight forward, until I saw this video

See `st.audio_input` - https://docs.streamlit.io/develop/api-reference/widgets/st.audio_input

Thanks to: https://www.youtube.com/watch?v=UnjaSkrfWOs

{{< youtube "UnjaSkrfWOs" >}}


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/OpenAI/Audio" title="Testing OpenAI Audio Feature" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="Streamlit Speech Rater PoC on Github" >}}
{{< /cards >}}

### User Authentication

1. https://docs.streamlit.io/develop/api-reference/user/st.user
2. Using `streamlit-authenticator` as explained [here](https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/#provided-users-and-pass)
3. 3rd Party *repurposed* APIs: Like mailerlite or Stripe
4. Via LogTo or similar services like supabase authentication
5. With Traefik combined with middleware like TinyAuth, Authelia, Zitadel...
6. With an internal DB like [sqlite](https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/Auth_sqlite)

### PyGWalker

A great way to just let users drag and drop to visualize the data inside streamlit

* https://docs.kanaries.net/pygwalker/use-pygwalker-with-streamlit

---

## Conclusions

These have been enough so far to develop a couple of Apps:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

And to deliver interesting [real estate solutions](https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator).

Want to Level Up Streamlit?

1. Adding Authelia Authentification
2. Monitoring Streamlit Logs


### Interesting Stuff I found lately

**Blogs**

* https://sebastiandedeyne.com/captioned-images-with-markdown-render-hooks-in-hugo/
* https://www.saltyoldgeek.com/posts/ollama-llama3-openwebui/