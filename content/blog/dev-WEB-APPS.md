---
title: "Web Apps with Python"
date: 2025-02-28T05:20:21+01:00
draft: false
tags: ["Dev","Python"]
description: 'My favourite ways to build web apps with Python.'
url: 'web-apps-with-python'
---


## Web Apps with Python


* **Reflex:** If you need to build a complex, interactive web application with real-time updates and a **rich UI**.
* **Flet:** If you want to create a **cross-platform** application that runs on both desktop and web from a single codebase.
* **Streamlit:** If you're building a **data-driven web app** or dashboard quickly and easily, especially for data science projects.
* **PySimpleGUI:** If you need to create a simple desktop utility or tool with a basic UI.
* **NiceGUI:** If you want to create a simple web UI quickly and easily, with a focus on data visualization and interactivity.

[![Star History Chart](https://api.star-history.com/svg?repos=pallets/flask,django/django,tiangolo/fastapi,tornadoweb/tornado,bottlepy/bottle,cherrypy/cherrypy,sanic-org/sanic,Pylons/pyramid,falconry/falcon,hugapi/hug,pgjones/quart,streamlit/streamlit,flet-dev/flet,reflex-dev/reflex&type=Date)](https://star-history.com/#pallets/flask&django/django&tiangolo/fastapi&tornadoweb/tornado&bottlepy/bottle&cherrypy/cherrypy&sanic-org/sanic&Pylons/pyramid&falconry/falcon&hugapi/hug&pgjones/quart&streamlit/streamlit&flet-dev/flet&reflex-dev/reflex&Date)


### Streamlit

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}



{{< details title="PyGWalker: Turn your pandas dataframe into an interactive UI for visual analysis 📌" closed="true" >}}

* https://kanaries.net/pygwalker
* https://github.com/Kanaries/pygwalker

* https://docs.kanaries.net/pygwalker/use-pygwalker-with-streamlit
* https://github.com/Kanaries/pygwalker-in-streamlit
* https://docs.kanaries.net/pygwalker/use-pygwalker-with-streamlit.en
  * https://github.com/Kanaries/pygwalker?tab=readme-ov-file#tested-environments

> It can be integrated with Streamlit!

{{< /details >}}

See a sample notebook: https://colab.research.google.com/drive/171QUQeq-uTLgSj1u-P9DQig7Md1kpXQ2



{{< details title="PyGWalker with Streamlit Render | Example 📌" closed="true" >}}

Following the docs: https://docs.kanaries.net/pygwalker/use-pygwalker-with-streamlit

```py
from pygwalker.api.streamlit import StreamlitRenderer


import streamlit as st
import pandas as pd
import pygwalker as pyg
import requests
from io import StringIO

# GitHub raw URL of your CSV file
csv_url = "https://raw.githubusercontent.com/JAlcocerT/R_Stocks/main/Z_Sample_Data/data_sp500.csv"

@st.cache_data
def load_data(url):
    """Loads CSV data from a URL and returns a Pandas DataFrame."""
    try:
        response = requests.get(url)
        response.raise_for_status()
        csv_content = StringIO(response.content.decode('utf-8'))
        df = pd.read_csv(csv_content)
        return df
    except requests.exceptions.RequestException as e:
        st.error(f"Error fetching URL: {e}")
        return None
    except pd.errors.ParserError as e:
        st.error(f"Error parsing CSV: {e}")
        return None
    except Exception as e:
        st.error(f"An unexpected error occurred: {e}")
        return None

# Load the data
df = load_data(csv_url)

if df is not None:
    st.title("S&P 500 Historical Data Exploration")

    # Display the DataFrame
    st.write("### Raw Data")
    st.dataframe(df)

    # Add PyGWalker
    st.write("### Interactive Exploration with PyGWalker")
    pyg_app = StreamlitRenderer(df)
    
    pyg_app.explorer()


    # Add some descriptive text
    st.write("Data source: [Your GitHub Repository](https://github.com/JAlcocerT/R_Stocks/blob/main/Z_Sample_Data/data_sp500.csv)")
else:
    st.write("Data loading failed. Please check the URL or your internet connection.")
```

{{< /details >}}


I really enjoy using **PyGWalker together with Streamlit**!

And there is more...

**Graphic Walker** is a different open-source alternative to Tableau.

It allows data scientists to analyze data and visualize patterns with simple drag-and-drop / natural language query operations.

It is extremely easy to embed in your apps just **as a React component** 🎉!

The original purpose of graphic-walker is **not to be a heavy BI platform**, but a easy to embed, lite, plugin.


* https://github.com/Kanaries/graphic-walker
  * https://docs.kanaries.net/graphic-walker

> Apache v2 | An open source alternative to Tableau. **Embeddable visual analytic**

You can try it here: https://graphic-walker.kanaries.net/ with some csv:

![Graphic Walker UI](/blog_img/dev/graphic-walker.png)


It allows you to import/export an already configured dashboard as `.json`!

![Meme - Fantastic](/blog_img/memes/bertin-osborne-incredible.gif)

```sh
npm i --save @kanaries/graphic-walker
```





1. Cool Streamlit Apps I found: https://github.com/AIAnytime/Document-Buddy-App

> Built using Open Source Stack (Llama 3.2 Model, BGE Embeddings, and Qdrant running locally within a Docker Container)

2. 


### Flask

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Tinkering with Flask" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Flask Apps with VPS and HTTPs" >}}
{{< /cards >}}



### Reflex


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/" title="Tinkering with Reflex" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Python Web apps with Reflex" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


### Flet

{{< details title=" 📌" closed="true" >}}


{{< /details >}}

## Python DASH

https://jalcocert.github.io/JAlcocerT/improving-ui-python-dash-apps/

## Shiny with R


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks/" title="Tinkering with R Shiny" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Python Web apps with Reflex" >}}
  {{< card link="https://github.com/JAlcocerT/R-Stocks" title="RStocks Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of the RStock Shiny Web app" >}}
{{< /cards >}}

> You can also see the flexdashboard: https://jalcocert.github.io/JAlcocerT/R-Stocks/

## AI Building Web Apps

1. https://github.com/stackblitz-labs/bolt.diy

> MIT | Prompt, run, edit, and deploy full-stack web applications using any LLM you want! 

---

## Conclusions

For some PoC, Id stay with streamlit as my go to.