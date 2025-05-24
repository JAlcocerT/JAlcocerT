---
title: "Streamlit Updates. Assistant"
date: 2025-08-17
draft: false
tags: ["dev"]
description: 'More Streamlit AI with the AIssistant Project: DBChat, SliDev (PPT) Generator, Speech Rater...'
url: 'ai-assistant-streamlit'
---


## AIssistant Updates

The aissistant was ideated as a some kind of all-in-one tool around LLMs.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="Streamlit Speech Rater PoC" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="MultiChat" >}}
{{< /cards >}}

Do you prefer the box? the plastic? or the expensive toy I bought you?

![Cat product Meme](/blog_img/memes/features-vs-needs.png)


### DBChat Assistant

We come from [here](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/).

And I could not resist to combine it:

![AIssistant](/blog_img/apps/ai-assistant-dbchat.png)

You can think about this is a [kind of BI/AI part](https://jalcocert.github.io/JAlcocerT/ai-bi-tools/)

{{< youtube "KXamTdJA-uc" >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}



{{< details title="Streamlit + DataChat AI / SQL + PyGWalker | Example 📌" closed="true" >}}

```sh
streamlit run Z_ST_AIssistant_dbchat_v3b.py
```

* https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/DB_Chat

```py
import streamlit as st
from pygwalker.api.streamlit import StreamlitRenderer

from langchain_community.utilities import SQLDatabase

import pandas as pd
import os
from dotenv import load_dotenv

from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough
from langchain_openai import ChatOpenAI

st.set_page_config(
    page_title="Use Pygwalker In Streamlit",
    layout="wide"
)

st.title("SQL Database Table Viewer and Chat")

# Load environment variables
load_dotenv()
api_key = os.getenv("OPENAI_API_KEY")
from openai import OpenAI

# Initialize the OpenAI client
client = OpenAI(api_key=api_key)

# MySQL URI (replace with your password)
mysql_uri = st.text_input("MySQL URI", "mysql+mysqlconnector://root:your_password@localhost:3306/Chinook")

# Debug Mode
DEBUG_MODE = st.checkbox("Enable Debug Mode (Show SQL Queries)", False)

# Get the list of tables
db = SQLDatabase.from_uri(mysql_uri)
tables_result = db.run("SHOW TABLES;")
tables = [table_tuple[0] for table_tuple in eval(tables_result)]

# Table selection
selected_table = st.selectbox("Select a Table", tables)

if selected_table:
    df = load_data_mysql(mysql_uri, selected_table)
    if df is not None:
        st.write(f"### Data from {selected_table}")
        st.dataframe(df)
        display_pygwalker(df)

# Chat with Database about the whole database
st.write("### Ask a Question about the Entire Database")

global_question = st.text_input("Global Question", "What are the top 5 artists with more albums published?")

if st.button("Submit Global Question"):
    if global_question:
        response, sql_query = chat_with_database(mysql_uri, global_question)
        st.write("Global Response:", response)
        if DEBUG_MODE and sql_query:
            with st.expander("SQL Query"):
                st.code(sql_query, language="sql")
    else:
        st.warning("Please enter a global question.")

# Interactive SQL Query Section
with st.expander("Run Custom SQL Query"):
    custom_query = st.text_area("Enter your SQL query:")
    if st.button("Execute Query"):
        if custom_query:
            try:
                db = SQLDatabase.from_uri(mysql_uri)
                result = db.run(custom_query)
                data = eval(result)
                if data:
                    st.write("Query Result:")
                    try:
                        query_columns = f"""SHOW COLUMNS FROM ({custom_query}) AS tmp_table"""
                        columns_result = db.run(query_columns)
                        columns_list = eval(columns_result)
                        columns = [column[0] for column in columns_list]
                        st.dataframe(pd.DataFrame(data, columns=columns))

                    except:
                        st.dataframe(pd.DataFrame(data))

                else:
                    st.write("Query returned no results.")
            except Exception as e:
                st.error(f"Error executing query: {e}")
        else:
            st.warning("Please enter a SQL query.")
```


{{< /details >}}


### Presentation GenerAItor

https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/


### Speech RAIter


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="Streamlit Speech Rater PoC" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="MultiChat" >}}
{{< /cards >}}


![AIssistant](/blog_img/apps/whisper.png)

### CV CreAItor

https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/

https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web


![AIssistant](/blog_img/memes/oldnewjob.jpg)


### Diagram GenerAItor


### Youtube SummarAIzer

https://jalcocert.github.io/JAlcocerT/summarize-yt-videos/


![Groq Youtube Summaries](/blog_img/GenAI/yt-summaries/yt-summaries-groq.png)


/blog_img/GenAI/yt-summaries/yt-summaries-groq_example.png

![Groq Youtube Summaries Example](/blog_img/GenAI/yt-summaries/yt-summaries-groq_example.png)


### Youtube Script CreAItor

With Whisper

![AIssistant](/blog_img/apps/whisper.png)

---

## Conclusions

If that was not enough...

How about adding a **QR tool**?

Like the one I used for [this weddin](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt).

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)

Because the [PIL package](https://pypi.org/project/pillow/) counts as AI, doesnt it?


<!-- {{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/Portfolio/" title="Portfolio Links ↗" icon="user" >}}
{{< /cards >}} -->

Whats next?

Probably more NoCode stuff: https://www.youtube.com/@AI-GPTWorkshop/videos

### The Market Test

**Product Analytics Tools**

* [Umami](https://fossengineer.com/selfhosting-umami-with-docker/)
* PostHog - https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics

---


## FAQ

### Multichat


{{< cards >}}
  {{< card link="#conclusions" title="MultiChat UI" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="How the final multichat UI looks like" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="Multichat" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for Streamlit Multichat" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/MultiChat/" title="MultiChat" image="/blog_img/GenAI/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/MultiChat" title="MultiChat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for the MultiChat" >}}
{{< /cards >}}



### Books

* https://bookstash.io/ - Top books recommended by famous folk, in 3m or less.


Epub to AudioBook with Python

* https://github.com/C-Loftus/QuickPiperAudiobook?ref=selfh.st

---

## Interesting Music Related Projects

{{< details title="GraphMuse - Python 📌" closed="true" >}}

* https://github.com/manoskary/graphmuse

**GraphMuse** is a Python library designed for **symbolic music graph processing**, addressing the growing need for efficient and effective analysis of musical scores through graph-based methods.

- **Problem Solved**: Traditional music processing lacks efficient tools for analyzing complex musical scores, which often include various elements beyond just notes. 

- **Functionality**:
  - Converts musical scores into graphs where:
    - Each note is a vertex.
    - Temporal relationships between notes define edges.
  - Supports deep graph models for music analysis.
  - Built on **PyTorch** and **PyTorch Geometric**, offering strong flexibility and performance.

- **Graph Structure**:
  - Edges are categorized into:
    - Onset edges (notes starting simultaneously).
    - Consecutive edges (notes starting after others).
    - During edges (notes overlapping with others).
    - Silent edges (connecting notes separated by silence).

- **Key Features**:
  - Efficient graph creation (up to 300x faster).
  - Built-in utilities for preprocessing musical scores.
  - Sampling methods for handling variable graph sizes during training.

- **Use Case**:
  - Demonstrates pitch spelling tasks using annotated datasets.

- **Future Plans**:
  - Improve installation processes.
  - Expand model and data loader support.
  - Foster community contributions.

GraphMuse is a promising tool for anyone interested in symbolic music analysis, combining music theory with advanced graph neural networks.

In conclusion, GraphMuse simplifies symbolic music processing through advanced graph techniques, fostering innovation and analysis.

**Similar Projects**: MusGViz for music visualization and other graph neural network frameworks in music processing.

{{< /details >}}