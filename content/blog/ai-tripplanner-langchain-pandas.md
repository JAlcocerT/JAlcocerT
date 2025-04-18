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

### What it is Data Race?

Imagine you have a shared notebook that two people are trying to write on at the same time.

**Data Race Issue (The Problem):**

Imagine one person is trying to write a number in the notebook, and at the exact same moment, the other person is trying to erase it. If they aren't careful and there's no rule about who goes first, the final number in the notebook could be anything – it might be the first person's number, the result of the erasure, or even something messy in between.

That messy situation where two people try to change the same thing at the same time without any coordination is like a **data race**. When computers do this with information in their memory, it can lead to the program getting confused and doing the wrong thing, crashing, or behaving strangely.

**Think of it like a traffic jam at a single-lane bridge without traffic lights. Cars trying to go in both directions at once will cause chaos.**

**Data Trace (A Way to See What's Happening):**

Now, imagine you want to figure out why the notebook sometimes has the wrong number. You might decide to follow each person's pen and see exactly what they are writing and erasing, and when. You'd be making notes about who touched the notebook and what they did at each step.

That process of carefully watching and recording how the information (the numbers in the notebook) changes over time is like a **data trace**. It's a way to follow the data's journey to understand what's going on, especially when things go wrong.

**Think of it like watching security camera footage to see who was near the notebook and what they did.**

**The Difference:**

* A **data race** is the *bad situation* where things get messed up because multiple parts of the computer are trying to change the same information at the same time without any rules.
* A **data trace** is a *way to watch* how the information is being used and changed, so you can understand what's happening and potentially find problems like data races.

So, a data race is the problem, and a data trace is a way to investigate what's causing the problem. You might use a data trace to help you find and fix a data race.

#### DASH Data Race

Yes, **Dash applications can definitely be affected by data race issues**, especially in scenarios involving:

1.  **Shared mutable state across callbacks:** If you have multiple callbacks in your Dash application that interact with and modify the same Python variables (that are not properly protected), you can run into data races. This is because Dash callbacks can execute concurrently in response to different user interactions.

2.  **Background threads or processes updating data used by Dash:** If your Dash application spawns separate threads or processes that modify data that is then read or used by your Dash callbacks, you need to ensure proper synchronization to avoid data races.

3.  **Asynchronous operations within callbacks:** While Dash itself is based on Flask and Werkzeug which handle concurrency to some extent, if you introduce your own asynchronous operations within callbacks that share mutable state, you need to be mindful of potential race conditions.

**How Data Races Might Manifest in Dash:**

* **Inconsistent UI updates:** The UI might not update correctly or show unexpected values because different callbacks are interfering with each other's data.
* **Unexpected behavior:** The application might behave erratically or produce incorrect results based on the order in which callbacks or background tasks execute.
* **Difficult-to-reproduce bugs:** Race conditions can be timing-dependent, making them hard to consistently reproduce and debug.
* **Potential for crashes (though less common in typical Dash scenarios):** In more complex scenarios involving shared resources and improper synchronization, crashes could theoretically occur.

**Example Scenario in Dash:**

Imagine a simple Dash app with a global variable `click_count` initialized to 0. Two different buttons, when clicked, are supposed to increment this counter and update a display.

```python
import dash
from dash import dcc, html
from dash.dependencies import Input, Output

app = dash.Dash(__name__)

click_count = 0  # Shared mutable state

app.layout = html.Div([
    html.Button('Increment 1', id='btn-1'),
    html.Button('Increment 2', id='btn-2'),
    html.Div(id='display-count')
])

@app.callback(
    Output('display-count', 'children'),
    [Input('btn-1', 'n_clicks'),
     Input('btn-2', 'n_clicks')]
)
def update_count(n_clicks1, n_clicks2):
    global click_count
    changed_id = [p['prop_id'] for p in dash.callback_context.triggered][0]
    if 'btn-1' in changed_id:
        click_count += 1
    elif 'btn-2' in changed_id:
        click_count += 1
    return f"Click Count: {click_count}"

if __name__ == '__main__':
    app.run_server(debug=True)
```

In this simplified example, without any explicit locking, if both buttons are clicked very quickly and their callbacks execute concurrently, there's a potential data race on the `click_count` variable. The final displayed count might not accurately reflect the total number of clicks.

**How to Mitigate Data Races in Dash:**

* **Avoid global mutable state:** Whenever possible, try to keep the state local to the callback or use Dash's built-in components for managing state (like `dcc.Store`).
* **Use locking mechanisms:** If you absolutely need to share mutable state across callbacks or with background threads, use appropriate synchronization primitives like `threading.Lock` or `multiprocessing.Lock` to protect access to the shared resource.
* **Consider message passing:** For communication between background processes and Dash callbacks, consider using message queues (like `redis` or `celery`) which can help manage state changes in a more controlled way.
* **Be mindful of asynchronous operations:** If using `asyncio`, ensure proper synchronization using `asyncio.Lock` or other async primitives for shared mutable state.

**In conclusion, while Dash itself provides a framework for building web applications, the underlying Python code within your callbacks and any external threads or processes you interact with can be susceptible to data race issues if shared mutable state is not managed carefully with proper synchronization mechanisms.** It's crucial to be aware of these potential problems, especially in more complex Dash applications with concurrent operations.


#### Cookies vs DASH Session Storage

* https://dash.plotly.com/dash-core-components#store

You are correct that session storage behaved as expected, maintaining data within a single browser tab/window session and not being shared across different browser instances. 

Let's break down how this works in the context of Dash and the underlying web technologies:

**How Dash Session Storage Works:**

1.  **`dcc.Store` Component:** The core of this functionality is the `dcc.Store` component with `storage_type='session'`. This component is a **client-side component**. It doesn't directly interact with the Dash server to store data persistently in a database or server-side session.

2.  **Browser's Session Storage API:** The `dcc.Store` component, when rendered in the browser, leverages the browser's built-in **Session Storage API**. This API provides a mechanism for web pages to store key/value pairs locally within the user's browser for the duration of the current browsing session (i.e., as long as the tab or window is open).

3.  **JavaScript Interaction:** The `dcc.Store` component internally uses JavaScript that runs in the user's web browser. When your Dash callbacks update the `data` property of the `dcc.Store` component:
    - The Dash front-end (written in React.js) detects this change.
    - It then uses JavaScript to interact with the browser's Session Storage API.
    - The new `data` (which is typically a JSON-serializable Python dictionary) is converted into a string and stored in the browser's session storage under a key associated with the `id` of the `dcc.Store` component (`'user-session-data'` in your case).

4.  **Loading Data:** When a callback reads the `data` property of the `dcc.Store`:
    - The Dash front-end's JavaScript retrieves the data associated with the `dcc.Store`'s `id` from the browser's session storage.
    - This data (which is a string) is parsed back into a JavaScript object (and subsequently made available to the Dash callback as a Python dictionary).

**Is it Cookie-Based?**

**No, `dcc.Store` with `storage_type='session'` is NOT based on cookies.**

- **Cookies:** Cookies are small text files that websites can store on a user's computer. They are sent back to the server with every subsequent request to the same domain. Cookies are primarily designed for server-side session management, tracking, and personalization. They have limitations in size and can impact performance due to being sent with every request.

- **Session Storage:** Session storage is a more modern browser API designed for client-side storage of data that is specific to the current session. It offers several advantages over cookies for this purpose:
    - **Larger Storage Capacity:** Session storage typically allows for more data to be stored compared to cookies.
    - **Not Sent with Every Request:** Data in session storage is only accessible by the JavaScript running within the same origin (protocol, domain, and port) and for the current session. It is not automatically sent to the server with every HTTP request, reducing overhead.
    - **Client-Side Only (Primarily):** Session storage is primarily managed by the browser's JavaScript and is not directly accessible or manipulated by the server in the same way cookies are.

**Which Dash Library Does the Work?**

The primary Dash library responsible for the `dcc.Store` component and its interaction with the browser's storage APIs is **`dash_core_components` (which you import as `dcc`)**.

- The `dcc.Store` component is part of this library.
- The underlying implementation of how `dcc.Store` **interacts with the browser's session and local storage APIs is handled within the front-end JavaScript code** that is bundled with `dash_core_components`. You, as a Dash developer, interact with it through the `data` property in your Python callbacks.

**In Summary:**

- `dcc.Store` with `storage_type='session'` utilizes the browser's **Session Storage API** for client-side data persistence within a single browser tab/window session.
- It achieves this through JavaScript code embedded within the `dash_core_components` library.
- It is **not cookie-based**. Session storage is a distinct and more suitable mechanism for client-side session-specific data.


### UV

UV is an interesting way to manage python dependencies (which I got to know as [a way of benchmarking](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#benchmarks-101))

The good thing with uv is that we can have **different python verions!**

```sh
pip3 install uv
```

<!-- https://www.youtube.com/watch?v=6pttmsBSi8M -->

{{< youtube "6pttmsBSi8M" >}}


```sh
uv run main.py
#uv run --python 3.9.21 main.py
#uv run --with requests --python 3.9.21 main.py
uv pip show dash
```