---
title: "Reflex. Cooler Web Apps?"
date: 2025-02-12
draft: false
tags: ["Dev"]
description: 'Using (Python) Reflex to display Real Estate and Job Market Trends as Web Apps.'
url: 'tinkering-with-reflex'
---

* https://reflex.dev/templates/dashboard/


## The Reflex Package

* https://github.com/reflex-dev/reflex

> Apache v2 | 🕸️ Web apps in pure Python 🐍


What I want to use it for?

How about enhancing this streamlit projects?

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="RE Calculator - Post"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="Job Offers and CV Creation" >}}
{{< /cards >}}


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

{{< youtube "ITOZkzjtjUA" >}}

> Learn to code by building [series from Coding Entrepreneur](https://www.youtube.com/watch?v=ITOZkzjtjUA&list=PLEsfXFp6DpzRDEA6ElMF_NuLu9cvoK49v) is great (and not only for Reflex)

<!-- 
https://imfing.github.io/hextra/docs/guide/shortcodes/filetree/
-->

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



### Historical Job Market Data with Reflex

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/" title="When to apply?" image="/videos/job_offers.png" subtitle="Post where I tinkered with scrapping tools." >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools" title="Scrapping Tools" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for using BS4, AI Scraps..." >}}
{{< /cards >}}


{{< details title=" 📌" closed="true" >}}


{{< /details >}}

### Real Estate with Reflex

Lately Ive been playing with RE data driven apps.

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

Those are gross yields, remember that there are many costs and amortizations related



{{< details title="Price of the painting 📌" closed="true" >}}

Lets say that it cost ~65eur afor 15kg of paint

With that one, you can paint 100m2.

Absolutely! Let's break down how to estimate the wall size in your flat based on the floor plan and the total area.

**Understanding the Challenge**

We only have the area of each room, not the exact dimensions (length and width). To estimate wall length, we'll need to make some assumptions about the shape of the rooms.

**Assumptions**

1. **Rectangular Rooms:** We'll assume all rooms are roughly rectangular. This is a common assumption for floor plans.
2. **Simplified Shapes:** We'll treat the overall shape of the flat as a rectangle for easier calculation.

**Estimation Process**

1. **Calculate the Perimeter of Each Room:**
   * For a rectangle, the perimeter is 2 * (length + width).
   * Since we only have the area, we'll need to estimate the length and width. We can do this by assuming the rooms are close to square for an initial estimate.
   * For example, for a room with 26.4 m², assuming it's square, each side would be approximately √26.4 ≈ 5.14 meters. The perimeter would be roughly 4 * 5.14 ≈ 20.56 meters.

2. **Sum the Perimeters:** Add up the estimated perimeters of all the rooms.

3. **Adjust for Shared Walls:** The sum of the perimeters will overcount the walls because it counts each wall twice (once for each room it borders). We need to subtract the length of the shared walls.

4. **Estimate Shared Walls:**
   * Look at the floor plan and estimate which walls are shared between rooms.
   * Make reasonable estimations of the length of these shared walls.

5. **Subtract Shared Wall Lengths:** Subtract the estimated total length of shared walls from the sum of the perimeters.

**Let's Do the Calculations (Rough Estimate)**

1. **Room Perimeters (Approximations):**
   * Pokój dzienny (26.4 m²): ≈ 20.56 m
   * Pokój (9.2 m²): ≈ 12.12 m
   * Łazienka (4.4 m²): ≈ 8.37 m
   * Kuchnia (6.4 m²): ≈ 10.12 m
   * Przedpokój (7 m²): ≈ 10.58 m
   * Loggia (2.6 m²): ≈ 6.44 m

2. **Sum of Perimeters:** 20.56 + 12.12 + 8.37 + 10.12 + 10.58 + 6.44 ≈ 68.19 meters

3. **Estimate Shared Walls:**
   * Looking at the floor plan, there are several shared walls. We need to estimate their lengths.
   * This is where it gets tricky without exact dimensions. Let's make a rough guess that the total length of shared walls is about 20 meters (this is just an estimation).

4. **Subtract Shared Walls:** 68.19 - 20 ≈ 48.19 meters

**Important Note:** This is a rough estimation. Without precise dimensions, it's impossible to get an exact wall length.

**Refining the Estimate**

To improve the estimate, you would need:

* **More Detailed Dimensions:** If you have the length and width of each room, the calculations would be much more accurate.
* **Wall Thickness:** We haven't accounted for wall thickness, which would add to the overall length.

---

Be knowing the area (55m2 for example), you already know the ceiling paint.

Or you can just estimate the internal walls with sqrt(area=55) = 7.7

So that would be 15m, times the height of the walls (say 2m), which would be 30 m2.

But you are missing all internal walls which make the rooms, say thats 100% more.

> First estimation ~ 55+30*2 = 115m2, which for 2 layers would be ~30kg

{{< /details >}}


#### RE Resources

1. https://tradingeconomics.com/poland/consumer-price-index-cpi (see the change %)
2. https://tradingeconomics.com/poland/interest-rate

## Conclusions

I find it easier to iterate with streamlit, as there is no waiting time for compiling.

That makes it easier to iterate.

But definitely, Reflex apps can look really cool, **also on smartphones**!

---

## FAQ


{{< details title="There is a good range of Python web UI frameworks... 📌" closed="true" >}}


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

**Which one should you choose?**

* **Reflex:** If you need to build a complex, interactive web application with real-time updates and a **rich UI**.
* **Flet:** If you want to create a **cross-platform** application that runs on both desktop and web from a single codebase.
* **Streamlit:** If you're building a **data-driven web app** or dashboard quickly and easily, especially for data science projects.
* **PySimpleGUI:** If you need to create a simple desktop utility or tool with a basic UI.
* **NiceGUI:** If you want to create a simple web UI quickly and easily, with a focus on data visualization and interactivity.