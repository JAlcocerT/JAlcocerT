---
title: "Using LangchAIn/LLamaIndex with Pandas - Enhancing Trip Planner"
date: 2024-11-19
draft: false
cover:
    image: "https://socialify.git.ci/JAlcocerT/Py_Trip_Planner/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"
    alt: "Trip Planner with AI" # alt text
    caption: "Trip Planner with AI" # display caption under cover
tags: ["Gen-AI","Python","Dev"]
description: 'Use LangChain to chat with a Pandas DF. Compared with LlamaIndex Pandas Query Engine.'
url: 'using-langchain-with-pandas-df'
---

What if we could use **AI to chat about weather** patterns in a location?

By using Langchain, together with pandas DF, we will extract relevant information.

The weather information?

Thats covered on the Python **[Trip Planner](https://github.com/JAlcocerT/Py_Trip_Planner/) Project**.

With MeteoStat and OpenMeteo APIs.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/trip-planner-with-weather/" title="Trip Planner Story" image="/blog_img/apps/TripPlanner/TripPlanner.JPG" subtitle="Blog Post with my use case for this python app" >}}
  {{< card link="https://github.com/JAlcocerT/Py_Trip_Planner/" title="Trip Planner Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code the Python Trip Planner DASH App" >}}
{{< /cards >}}

## Intro to LangChain with PandasDF

As [commented earlier this year](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-pdfs/), I was inspired by **Alejandro AO** and its **Python AI projects**.


[I commented the PDF one **here** →](/JAlcocerT/how-to-chat-with-pdfs)


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/ask-multiple-pdfs/" title="My previous Fork in GH for Ask Multiple PDFs ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/langchain-ask-csv" title="My Fork in Github for Ask CSV ↗" icon="user" >}}
{{< /cards >}}


[LangChain is an alternative](https://jalcocert.github.io/JAlcocerT/how-to-use-pandasAI/#other-foss-ways-to-chat-with-your-data) to [PandasAI](https://jalcocert.github.io/JAlcocerT/how-to-use-pandasAI/).


{{< callout type="info" >}}
I am creating a public repo with all sort if **interesting RAG** libraries to **[Chat over Data](https://github.com/JAlcocerT/Data-Chat)** 💻 
{{< /callout >}}

### Pre Requisites

* [Python installed](https://jalcocert.github.io/JAlcocerT/guide-python/#installing-python-) and a [virtual environment](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/) ready.
* The OpenAI API keys - <https://platform.openai.com/api-keys>


{{< callout type="info" >}}
See the modified working code [here](https://github.com/JAlcocerT/langchain-ask-csv) 💻
{{< /callout >}}


<!-- https://www.youtube.com/watch?v=rFQ5Kmkd4jc -->

{{< youtube "rFQ5Kmkd4jc" >}}

## LlamaIndex and Pandas DataFrames

* https://docs.llamaindex.ai/en/stable/examples/query_engine/pandas_query_engine/

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Data-Chat/blob/main/LLamaIndex/LLamaPandasDF/llamaindex_pandasDF.ipynb)


{{< callout type="info" >}}
Ive documented LlamaIndex at **[Chat over Data](https://github.com/JAlcocerT/Data-Chat/LLamaIndex)** 💻 
{{< /callout >}}


## Improvements

The current Trip Planner Apps does not have any AI feature.

Yet.

Why not adding it Chat capabilities over the weather data that we are fetching already?

Its ready on Pandas DF.

So lets make some tweaks and get trip planner V3 ready, this time with **AI Chat over pulled weather**

> Im keeping the app framework as **DASH**


---

## FAQ


You can also try, these below (Which I already covered):

* [PandasAI](https://jalcocert.github.io/JAlcocerT/how-to-use-pandasAI/)
* LlamaIndex

### API Keys for LLMs

* https://console.anthropic.com/settings/keys
    * https://docs.anthropic.com/en/docs/about-claude/models
* https://platform.openai.com/api-keys