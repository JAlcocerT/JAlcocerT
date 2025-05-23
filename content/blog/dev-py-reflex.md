---
title: "Reflex. Cooler Web Apps?"
date: 2025-06-12T10:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Using (Python) Reflex framework to display Data. Tested with Real Estate and Job Market Trends as Web Apps.'
url: 'tinkering-with-reflex'
---

* https://reflex.dev/templates/dashboard/


{{< callout type="info" >}}
See the [source code magic](https://github.com/JAlcocerT/Python_is_awesome). Applied to [RE here](https://gitlab.com/fossengineer1/py_stocks/-/tree/main/EDA_Mortage_Reflex) 🔥💻
{{< /callout >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/flask_sensor_display" title="Flask Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}


## The Reflex Package

* https://github.com/reflex-dev/reflex

> Apache v2 | 🕸️ Web apps in pure Python 🐍


What I want to use it for?

How about enhancing this streamlit projects?

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="RE Calculator - Post ↗"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="Job Offers and CV Creation ↗" >}}
{{< /cards >}}

Enhancing in a way...that they are also good looking and providing UI/UX for mobile users?

Lets have a look.

{{< details title="Compile Python on a Pi 📌" closed="true" >}}

```sh
wget https://www.python.org/ftp/python/3.11.5/Python-3.11.5.tgz
tar xzf Python-3.11.5.tgz

cd Python-3.11.5
./configure --enable-optimizations --with-ensurepip --prefix=/usr/local/python311  # Adjust path and version if needed


#compile
make -j$(nproc)  # Use all available cores for faster compilation
#install
sudo make altinstall  #  "altinstall" is IMPORTANT!
```

```sh
nano ~/.bashrc  # Or nano ~/.zshrc if you use zsh

export PATH="/usr/local/python311/bin:$PATH"
source ~/.bashrc  # Or source ~/.zshrc
```

```sh
python3.11 --version  # Or python3.x if you installed a different minor version
pip3.11 --version
pip3.11 install --upgrade virtualenv --user
```


{{< /details >}}

```sh
sudo apt-get install python3-virtualenv

python3.11 -m venv my_env  # Creates a virtual environment named my_env
source my_env/bin/activate  # Activates the environment
```


### Reflex 101

```sh
pip install reflex
reflex init
reflex run #this compiles and execute the sample app
```

The **front end UI** will be at `localhost:3000`


{{< callout type="info" >}}
You will also need `localhost:8000` for the BE (which can conflict with Portainer!) 
{{< /callout >}}



```bash
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

With reflex, we can do full stack web apps with just Python, for example [this chat](https://www.youtube.com/watch?v=NuNaI__4xiU&list=PLEsfXFp6DpzRDEA6ElMF_NuLu9cvoK49v&index=13)

```sh
git clone https://github.com/codingforentrepreneurs/reflex-gpt
```

{{< youtube "ITOZkzjtjUA" >}}

> Learn to code by building [series from Coding Entrepreneur](https://www.youtube.com/watch?v=ITOZkzjtjUA&list=PLEsfXFp6DpzRDEA6ElMF_NuLu9cvoK49v) is great (and not only for Reflex)

<!-- 
https://imfing.github.io/hextra/docs/guide/shortcodes/filetree/
-->

These are the main files and **structure of a Reflex Project**:

{{< filetree/container >}}
  {{< filetree/folder name="content" >}}
    {{< filetree/file name="_index.md" >}}
    {{< filetree/folder name="docs" state="closed" >}}
      {{< filetree/file name="_index.md" >}}
      {{< filetree/file name="introduction.md" >}}
      {{< filetree/file name="introduction.fr.md" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
  {{< filetree/file name="hugo.toml" >}}
{{< /filetree/container >}}

If you inspect, this is how the reflex `main.py` looks:

```py
"""Welcome to Reflex! This file outlines the steps to create a basic app.""" #Shown as title

import reflex as rx

from rxconfig import config


class State(rx.State):
    """The app state."""

    ...


def index() -> rx.Component:
    # Welcome Page (Index)
    return rx.container(
        rx.color_mode.button(position="top-right"),
        rx.vstack(
            rx.heading("Welcome to Reflex!", size="9"),
            rx.text(
                "Get started by editing ",
                rx.code(f"{config.app_name}/{config.app_name}.py"),
                size="5",
            ),
            rx.link(
                rx.button("Check out our docs!"),
                href="https://reflex.dev/docs/getting-started/introduction/",
                is_external=True,
            ),
            spacing="5",
            justify="center",
            min_height="85vh",
        ),
        rx.logo(),
    )


app = rx.App()
app.add_page(index)
```

Now, its all about adding components to the `def index()`, like: https://reflex.dev/docs/library/data-display/moment/

```py
rx.moment(MomentState.date_now), #you will need to define its associated MomentState(), also given in the docs
```

Not long after get that working, you will **build some demo, using graph components**:

* https://reflex.dev/docs/library/graphing/charts/barchart/
* https://reflex.dev/docs/library/graphing/charts/composedchart/


{{< details title="testing Sample Components with Reflex 📌" closed="true" >}}

```py
#pip install reflex
#reflex init

import reflex as rx

from datetime import datetime, timezone


class MomentState(rx.State):
    date_now: datetime = datetime.now(timezone.utc)

    @rx.event
    def update(self):
        self.date_now = datetime.now(timezone.utc)


def moment_update_example():
    return rx.button(
        "Update",
        rx.moment(MomentState.date_now),
        on_click=MomentState.update,
    )

##

data = [
    {"name": "Page A", "uv": 4000, "pv": 2400, "amt": 2400},
    {"name": "Page B", "uv": 3000, "pv": 1398, "amt": 2210},
    {"name": "Page C", "uv": 2000, "pv": 9800, "amt": 2290},
    {"name": "Page D", "uv": 2780, "pv": 3908, "amt": 2000},
    {"name": "Page E", "uv": 1890, "pv": 4800, "amt": 2181},
    {"name": "Page F", "uv": 2390, "pv": 3800, "amt": 2500},
    {"name": "Page G", "uv": 3490, "pv": 4300, "amt": 2100},
]

def bar_simple():
    return rx.recharts.bar_chart(
        rx.recharts.bar(
            data_key="uv",
            stroke=rx.color("accent", 9),
            fill=rx.color("accent", 8),
        ),
        rx.recharts.x_axis(data_key="name"),
        rx.recharts.y_axis(),
        data=data,
        width="100%",
        height=250,
    )

def composed():
    return rx.recharts.composed_chart(
        rx.recharts.area(
            data_key="uv", stroke="#8884d8", fill="#8884d8"
        ),
        rx.recharts.bar(
            data_key="amt", bar_size=20, fill="#413ea0"
        ),
        rx.recharts.line(
            data_key="pv",
            type_="monotone",
            stroke="#ff7300",
        ),
        rx.recharts.x_axis(data_key="name"),
        rx.recharts.y_axis(),
        rx.recharts.cartesian_grid(stroke_dasharray="3 3"),
        rx.recharts.graphing_tooltip(),
        data=data,
        height=250,
        width="100%",
    )
#####

"""Welcome to Reflex! This file outlines the steps to create a basic app."""

import reflex as rx
from rxconfig import config


class State(rx.State):
    """The app state."""

    ...

def index() -> rx.Component:
    # Welcome Page (Index)
    return rx.container(
        rx.color_mode.button(position="top-right"),
        rx.vstack(
            rx.heading("Welcome to Reflex!", size="9"),
            rx.heading("Yessss, this works!", size="5"),
            
            rx.callout(
                "One step closer to do cool things :)",
                icon="info",
            ),
            rx.moment(MomentState.date_now),
            #moment_update_example(),
            bar_simple(),
            composed(),
            
            rx.text(
                "Get started by editing ",
                rx.code(f"{config.app_name}/{config.app_name}.py"),
                size="5",
            ),
            rx.link(
                rx.button("Check out our docs!"),
                href="https://reflex.dev/docs/getting-started/introduction/",
                is_external=True,
            ),
            spacing="5",
            justify="center",
            min_height="85vh",
        ),
        rx.logo(),
    )

app = rx.App()
app.add_page(index)
```

{{< /details >}}

![Reflex 101](/blog_img/apps/reflex/reflex-101.png)


You will find also useful:

1. rx.input - https://reflex.dev/docs/library/forms/input/
2. rx.datatable - https://reflex.dev/docs/library/tables-and-data-grids/data-table/ or [table](https://reflex.dev/docs/library/tables-and-data-grids/table/)


---

## Building with Reflex

Now its time to rebuild with Reflex some Streamlit apps I made!

### Historical Job Market Data with Reflex

For this one


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="When to apply?" image="/videos/job_offers.png" subtitle="Post where I tinkered with scrapping tools." >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools" title="Scrapping Tools" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for using BS4, AI Scraps..." >}}
{{< /cards >}}


{{< details title="See the details 📌" closed="true" >}}


{{< /details >}}

### Real Estate with Reflex

Lately Ive been playing with **RE data** driven apps.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="Understanding Real Estate" image="/blog_img/data-experiments/buyr_mortage_NAV_norent.png" subtitle="Post where I tinkered with Math for Real Estate." >}}
  {{< card link="https://gitlab.com/fossengineer1/py_stocks/-/tree/main/EDA_Mortage?ref_type=heads" title="Scrapping Tools" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source CodeEDA French Amortization" >}}
{{< /cards >}}

And with Reflex and some tricks with Gemini...

![Reflex using Components](/blog_img/apps/reflex/reflex-composedchart-datatable.png)


{{< details title="More 📌" closed="true" >}}


{{< /details >}}

#### RE Questions

1. In which month does interest and payments are 50/50?
2. When does the rent cover the interest costs?
3. The interest/principal split just depends on: years and %interest
4. The PER of the flats depends on the city/neighbourhood you look:

{{< details title="Examples of PER for RE 📌" closed="true" >}}

* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/alquiler/andalucia/sevilla-provincia/dos-hermanas/
* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/venta/andalucia/sevilla-provincia/dos-hermanas/


> 1451 eur/m2 versus 9.3 eur/m2 - **PER** = 1451/(12*9.3) ~**13** or **7.6% yield**

* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/venta/andalucia/sevilla-provincia/utrera/
* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/alquiler/andalucia/sevilla-provincia/utrera/

> 1186 vs 7.5 **~PER 13.17 or 7.5% yield**

* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/alquiler/andalucia/cadiz-provincia/jerez-de-la-frontera/
* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/venta/andalucia/cadiz-provincia/jerez-de-la-frontera/

> 1475 vs 9.2 **~PER 13.36 or 7.4%**

* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/alquiler/andalucia/cadiz-provincia/tarifa/
* https://www.idealista.com/sala-de-prensa/informes-precio-vivienda/venta/andalucia/cadiz-provincia/tarifa/

> 3879 vs 12.5 **~PER 12.52 or 7.9%**

{{< /details >}}


#### More RE Costs



#### RE Resources

1. https://tradingeconomics.com/poland/consumer-price-index-cpi (see the change %)

2. https://tradingeconomics.com/poland/interest-rate

---

## Conclusions

I find it easier to iterate with streamlit, as there is no waiting time for compiling.

That makes it easier to iterate.

But definitely, Reflex apps can look really cool, **also on smartphones**!

---

## FAQ


{{< details title="There is a good range of Python web Apps frameworks... 📌" closed="true" >}}


**1. Reflex:**

* **Focus:** Building interactive web apps with a reactive programming model.  It's designed for complex UIs where you need real-time updates and dynamic behavior.
* **Technology:** Uses a Python backend (typically FastAPI) and a frontend built with React.  This allows for a rich, single-page application (SPA) experience.
* **Strengths:** Excellent for data-driven applications, dashboards, and anything requiring frequent UI updates.  The reactive model makes complex interactions manageable.
* **Weaknesses:** Steeper learning curve compared to some other frameworks due to the reactive paradigm and the use of both Python and JavaScript (React under the hood, though you mostly interact with it through Python).  Can be overkill for very simple UIs.

**2. Flet:**

* **Focus:** Creating cross-platform desktop and web applications using Flutter (Google's UI toolkit).
* **Technology:** Python backend with a Flutter frontend.  This enables native-like performance on desktop and a good web experience.
* **Strengths:**  Fast development for both desktop and web from a single codebase.  Good performance and a modern UI.  Relatively easy to learn.
* **Weaknesses:**  While it handles web, its primary strength is cross-platform desktop development.  The UI might not feel *completely* native on the web compared to frameworks specifically designed for the web.

**3. Streamlit:**

* **Focus:** Rapidly building data-driven web applications and dashboards, especially for machine learning and data science.
* **Technology:** Pure Python, and it handles the frontend rendering for you.
* **Strengths:** Extremely easy to learn and use.  Excellent for quickly prototyping and deploying data science tools.  Has built-in support for displaying data visualizations and interactive widgets.
* **Weaknesses:**  Not ideal for complex, highly interactive applications.  The UI is more basic compared to Reflex or Flet.  Not as suitable for apps that require fine-grained UI control or complex event handling.

**4. PySimpleGUI (PyNiceGUI):**

* **Focus:** Making it easy to create simple GUIs in Python.  Its primary focus is on desktop applications.
* **Technology:** Wraps various GUI toolkits (Tkinter, Qt, WxPython, etc.) to provide a simplified API.
* **Strengths:** Very beginner-friendly.  Great for quickly creating simple desktop utilities or tools.
* **Weaknesses:**  Limited in terms of UI customization and modern look and feel.  Not designed for web applications.  While there is a project called NiceGUI which is a separate project from PySimpleGUI that allows you to create web UIs, it's not a direct web equivalent of PySimpleGUI. NiceGUI is more comparable to Streamlit, but with a different syntax and approach.

**Let's summarize the key differences:**

| **Feature**         | Reflex                 | Flet                    | Streamlit              | PySimpleGUI/NiceGUI        |
|-----------------|-------------------------|--------------------------|-----------------------|-----------------------------|
| Primary Focus   | Complex web apps       | Cross-platform (desktop & web) | Data-driven web apps | Simple desktop GUIs / web |
| Technology      | Python/React             | Python/Flutter           | Pure Python           | Python/Various GUI toolkits |
| Learning Curve  | Steeper                 | Moderate                  | Easiest                | Easiest (PySimpleGUI) / Moderate (NiceGUI) |
| UI Complexity   | High                    | Moderate                  | Low                   | Low (PySimpleGUI) / Moderate (NiceGUI) |
| Web Capabilities| Excellent               | Good                      | Good                  | Not designed for web (PySimpleGUI) / Good (NiceGUI) |
| Data Science    | Good                    | Moderate                  | Excellent               | Limited (PySimpleGUI) / Good (NiceGUI) |


{{< /details >}}

**Which Python Web App fwk should you choose?**

* **Reflex:** If you need to build a complex, interactive web application with real-time updates and a **rich UI**.
* **Flet:** If you want to create a **cross-platform** application that runs on both desktop and web from a single codebase.
* **Streamlit:** If you're building a **data-driven web app** or dashboard quickly and easily, especially for data science projects.
* **PySimpleGUI:** If you need to create a simple desktop utility or tool with a basic UI.
* **NiceGUI:** If you want to create a simple web UI quickly and easily, with a focus on data visualization and interactivity.



{{< details title="Popular Full-Stack... Tech Stacks 📌" closed="true" >}}

Some of the most popular and in-demand full-stack tech stacks currently used in software development:

* **MERN Stack:**
    * MongoDB (Database)
    * Express.js (Backend Framework)
    * React.js (Frontend Library)
    * Node.js (Backend Runtime)
    * This JavaScript-based stack is highly popular for building dynamic, single-page applications.
* **MEAN Stack:**
    * MongoDB (Database)
    * Express.js (Backend Framework)
    * Angular (Frontend Framework)
    * Node.js (Backend Runtime)
    * Similar to MERN, but uses Angular instead of React.
* **LAMP Stack:**
    * Linux (Operating System)
    * Apache (Web Server)
    * MySQL (Database)
    * PHP (Backend Language)
    * A classic and reliable stack, widely used for building dynamic websites and web applications.
* **Python/Django Stack:**
    * Python (Backend Language)
    * Django (Backend Framework)
    * PostgreSQL or MySQL (Database)
    * Ideal for **data-driven** applications, machine learning projects, and **complex web applications**.
* **Ruby on Rails (RoR):**
    * Ruby (Backend Language)
    * Rails (Backend Framework)
    * PostgreSQL or MySQL (Database)
    * Known for its rapid development capabilities and convention-over-configuration approach.
* **Java Spring Boot Stack:**
    * Java (Backend Language)
    * Spring Boot (Backend Framework)
    * MySQL or PostgreSQL (Database)
    * React or Angular (Frontend)
    * A robust and scalable stack commonly used for enterprise-level applications.
* **.NET Stack:**
    * C# (Backend Language)
    * ASP.NET Core (Backend Framework)
    * SQL Server or PostgreSQL (Database)
    * A Microsoft-developed stack, well-suited for building scalable and secure web applications.
* **Serverless Stack:**
    * AWS Lambda or Google Cloud Functions (Backend)
    * API Gateway (API Management)
    * DynamoDB or Firestore (Database)
    * React or Vue.js (Frontend)
    * Focuses on serverless computing, offering scalability and cost-efficiency.
* **MEVN Stack:**
    * MongoDB (Database)
    * Express.js (backend framework)
    * Vue.js (frontend framework)
    * Node.js (server-side runtime)
* **Flutter/Firebase Stack:**
    * Dart (Programming language)
    * Flutter (UI toolkit)
    * Firebase (Backend-as-a-service)
    * Very popular for cross platform mobile app development.

{{< /details >}}

Key Considerations:

* **Project Requirements:** The nature of your project will significantly influence your tech stack choice.
* **Team Expertise:** Your team's familiarity with specific technologies is crucial.
* **Scalability:** Consider the stack's ability to handle future growth.
* **Community Support:** A strong community provides ample resources and assistance.


{{< details title="Django... and what about the UI? 📌" closed="true" >}}

When using Django for the backend, developers have a wide range of choices for their UI frontend.

Here are some of the most common and popular options:

**1. Django's Built-in Templating System:**

* This is the most straightforward option. Django's templating language allows you to embed dynamic content directly within your HTML.
* It's well-suited for simpler applications or when you want tight integration between the backend and frontend.
* Pros: Easy to learn, tightly integrated with Django.
* Cons: Can become less maintainable for complex UIs.

**2. React.js:**

* React is a very popular JavaScript library for building user interfaces.
* It's excellent for creating single-page applications (SPAs) and complex UIs.
* Pros: Component-based architecture, excellent performance, large community.
* Cons: Requires separate development for the frontend and backend, steeper learning curve.
* Often Django Rest Framework is used to create an API that the React front end consumes.

**3. Vue.js:**

* Vue.js is another progressive JavaScript framework for building user interfaces.
* It's known for its simplicity and ease of integration.
* Pros: Easy to learn, flexible, good performance.
* Cons: Smaller community compared to React, but growing rapidly.
* Often Django Rest Framework is used to create an API that the Vue.js front end consumes.

**4. Angular:**

* Angular is a powerful JavaScript framework developed by Google.
* It's well-suited for building large-scale applications.
* Pros: Comprehensive framework, strong type checking, good for enterprise applications.
* Cons: Steeper learning curve, can be more complex than React or Vue.
* Often Django Rest Framework is used to create an API that the Angular front end consumes.

**5. HTML, CSS, and JavaScript (Vanilla):**

* For simpler applications, you can use plain HTML, CSS, and JavaScript without any frameworks.
* This gives you complete control over the frontend.
* Pros: Lightweight, no external dependencies.
* Cons: Can become difficult to manage for complex UIs.

**6. Tailwind CSS:**

* While not a full front end framework, Tailwind CSS is very popular with django projects. It is a utility first CSS framework, that allows for very rapid UI development.
* It can be combined with any of the above, and is most often used with Django's built in templating, or with Vue.js.


{{< /details >}}

**Key Considerations:**

* **Complexity:** For simple applications, Django's templating or vanilla JavaScript might suffice. For complex UIs, React, Vue, or Angular are better choices.
* **Single Page Applications:** If you're building an SPA, React, Vue, or Angular are ideal.
* **Team Expertise:** Choose a technology that your team is comfortable with.
* **API Development:** If you're using a JavaScript framework, you'll need to create an API using Django REST Framework (DRF) to connect the frontend and backend.

In summary, while Django's templating is a valid option, the trend leans heavily towards using JavaScript frameworks like React, Vue, or Angular for more modern and dynamic user interfaces.

Yes, you can achieve similar outcomes with Dash, Shiny, Streamlit, and Reflex as you can with Django, but the approaches and use cases differ significantly. Here's a breakdown:

**Core Differences:**

* **Django:**
    * A full-fledged web framework for building complex, scalable web applications.
    * Handles both frontend and backend, with robust ORM, templating, and routing.
    * Ideal for large, data-driven web applications and APIs.
* **Dash, Shiny, Streamlit, Reflex:**
    * Primarily focused on building interactive data visualizations and web applications with Python or R.
    * Emphasize rapid development and ease of use, particularly for data scientists and analysts.
    * Generally, they are not used for complex web applications that require a lot of user management, or complex relational databases.
    * They are more focused on data visualization, and data exploration.

**Similarities and Differences:**

1.  **Dash (Python):**
    * Built on top of Flask, React, and Plotly.
    * Excellent for creating interactive dashboards and data visualizations.
    * More customizable than Streamlit or Shiny.
    * Can handle more complex layouts and interactions.
    * Less focused on general web application development than Django.
    * Good for data dashboards.
2.  **Shiny (R):**
    * Specifically designed for R users to build interactive web applications.
    * Seamless integration with R's data analysis and visualization capabilities.
    * Ideal for sharing R-based analyses and models.
    * Less general-purpose than Django or Dash.
    * Good for R based data dashboards.
3.  **Streamlit (Python):**
    * Extremely easy to use for creating data-driven web applications.
    * Focuses on simplicity and rapid prototyping.
    * Automatically renders changes, making development very fast.
    * Less customizable than Dash or Django.
    * Excellent for quickly sharing data science projects.
    * Good for quick data app creation.
4.  **Reflex (Python):**
    * A newer framework that allows you to build fully reactive web apps in pure python.
    * Combines frontend and backend logic into a single python codebase.
    * Good for creating interactive web apps, with a focus on ease of use.
    * Less mature than Django.
    * Good for python first web apps.

**When to Use Which:**

* **Use Django:**
    * When building complex web applications with user authentication, database management, and API development.
    * For large-scale projects requiring robustness and scalability.
    * For projects that need a traditional web application structure.
* **Use Dash, Shiny, Streamlit, or Reflex:**
    * When creating interactive data visualizations and dashboards.
    * For rapid prototyping and sharing data science projects.
    * When you need to quickly build web applications with Python or R.
    * When your primary goal is to display and interact with data.
    * When you do not need complex user management.

**In essence:**

* Django is a general-purpose web framework.
* Dash, Shiny, Streamlit, and Reflex are specialized tools for building interactive data applications.

Therefore, while you can create web applications with all of them, the best choice depends on your specific project requirements.