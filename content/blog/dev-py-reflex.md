---
title: "Reflex. Cooler Web Apps?"
date: 2025-06-12T10:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Using (Python) Reflex framework to display Data. Tested with Real Estate and Job Market Trends as Web Apps.'
url: 'tinkering-with-reflex'
---

Reflex is another way to create WebApps with Python.

I think it should be in between Streamlit and Flask in terms of UI and development complexity:

* https://reflex.dev/templates/dashboard/
* https://github.com/reflex-dev/reflex/releases
* https://reflex.dev/templates/
    * https://github.com/reflex-dev/templates

Why not just building something simple to try out?

{{< callout type="info" >}}
See the [source code magic](https://github.com/JAlcocerT/Python_is_awesome).
Applied to [RE here](https://gitlab.com/fossengineer1/py_stocks/-/tree/main/EDA_Mortage_Reflex) 🔥💻
{{< /callout >}}

[Vibe coding](https://jalcocert.github.io/JAlcocerT/vide-coding/) a Python reflex webapp:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/real-estate-reflex" title="Reflex WebApp / Real Estate" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}


## The Reflex Package

* https://github.com/reflex-dev/reflex

> Apache v2 | 🕸️ Web apps in pure Python 🐍

What I want to use it for?

How about enhancing these streamlit projects?

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
git clone https://github.com/codingforentrepreneurs/reflex-gpt #thanks to codingforentrepreneurs once again!
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


{{< details title="Testing Sample Components with Reflex 📌" closed="true" >}}

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


{{< details title="More | Real Estate Reflex, RBD and RFD 📌" closed="true" >}}

I will provide definitions for the BRD and FRD for your Python Reflex real estate calculator web app, keeping in mind the input, desired output, and additional "cool ideas" for the FRD.

Let's start with the **Business Requirements Document (BRD)**.

---

### Business Requirements Document (BRD) for Real Estate Calculator Web App

**1. Project Overview & Business Need**

* **Project Name:** Real Estate Loan Calculator
* **Version:** 1.0
* **Date:** June 16, 2025
* **Prepared By:** [Your Name/Company Name]

**1.1. Introduction**
This document outlines the business requirements for a web-based real estate loan calculator application. The application aims to provide potential homebuyers and real estate investors with an easy-to-use tool to estimate their monthly mortgage payments, understand the principal-interest breakdown over time, and visualize key financial metrics.

**1.2. Business Problem/Opportunity**
Many individuals seeking to understand real estate loans struggle with complex calculations and often rely on disparate tools or spreadsheets. This leads to confusion, potential miscalculations, and a lack of clear financial insight. There is an opportunity to provide a streamlined, user-friendly, and visually engaging tool that simplifies loan amortization calculations, empowering users to make more informed financial decisions regarding real estate investments.

**1.3. Business Objectives**
The primary objectives of this Real Estate Loan Calculator are to:
* **Empower Users:** Provide prospective homebuyers and investors with a clear and intuitive understanding of loan repayment dynamics.
* **Increase Transparency:** Clearly show the breakdown of principal and interest payments over the loan term.
* **Facilitate Planning:** Enable users to quickly estimate total interest paid and visualize interest-to-principal ratios for different loan scenarios.
* **Enhance Engagement:** Offer an interactive and visually appealing experience to encourage deeper financial exploration.
* **[Cool Idea - Business Objective]: Financial Literacy:** Contribute to users' financial literacy by demystifying loan amortization.

**1.4. Project Scope (Business Perspective)**
The scope of this project is to develop a web-based application accessible via a standard web browser, providing core loan calculation functionalities as outlined below.

**1.5. Target Audience/Stakeholders**
* **Primary Users:** Individual prospective homebuyers, real estate investors, financial advisors, real estate agents.
* **Business Owners:** [Your Name/Organization] – interested in providing a valuable tool to users.

---

**2. High-Level Business Requirements**

The Real Estate Loan Calculator shall provide the following key capabilities:

* **BR-001: Loan Calculation Input:** The system shall allow users to input key loan parameters.
* **BR-002: Amortization Schedule Generation:** The system shall generate a detailed monthly amortization table.
* **BR-003: Financial Summary Provision:** The system shall provide a summary of key financial metrics.
* **BR-004: Visual Data Representation:** The system shall present financial data in an intuitive visual format.
* **[Cool Idea - Business Requirement]: Scenario Comparison:** The system shall allow users to compare different loan scenarios side-by-side.
* **[Cool Idea - Business Requirement]: Affordability Estimation:** The system shall provide a high-level estimate of property affordability based on desired monthly payments.

---

**3. Key Inputs (Business View)**

* **Loan Amount:** The total principal value of the loan.
* **Annual Interest Rate:** The stated annual interest rate (e.g., 5.0%).
* **Loan Term (Years):** The duration over which the loan will be repaid.

---

**4. Key Outputs (Business View)**

* **Amortization Table:** A tabular display showing for each month:
    * Month/Payment Number
    * Starting Balance
    * Monthly Payment (Total)
    * Principal Paid
    * Interest Paid
    * Ending Balance
* **Financial Summary:**
    * Total Interest Paid over the loan term.
    * Total Payments made over the loan term.
* **Visualizations:**
    * **Interest to Principal (I2P) Ratio Pie Chart:** A visual representation of the proportion of total interest paid versus total principal paid.
    * **[Cool Idea - Output]: Principal vs. Interest Over Time Line Chart:** A line chart showing the decreasing interest portion and increasing principal portion of the monthly payment over the loan term.
    * **[Cool Idea - Output]: Remaining Balance Over Time Chart:** A line chart depicting the outstanding loan balance decreasing over the loan term.

---

**5. Business Constraints & Assumptions**

* **Assumption:** Calculations will assume monthly compounding interest and monthly payments.
* **Constraint:** The initial version will focus solely on principal and interest calculations, excluding property taxes, insurance, or other escrow components.
* **Constraint:** The application will be a standalone web application, without user authentication or data storage in this initial phase.

---

Next, let's detail the **Functional Requirements Document (FRD)**.

---

### Functional Requirements Document (FRD) for Real Estate Calculator Web App

**1. Introduction**

* **Project Name:** Real Estate Loan Calculator
* **Version:** 1.0
* **Date:** June 16, 2025
* **Prepared By:** [Your Name/Company Name]

**1.1. Purpose**
This document specifies the detailed functional requirements for the Real Estate Loan Calculator web application, building upon the high-level business requirements defined in the BRD. It is intended for developers, designers, and QA testers to build and verify the application.

**1.2. Referenced Documents**
* Business Requirements Document (BRD) - Real Estate Loan Calculator, v1.0

---

**2. Functional Requirements**

**2.1. Input Fields & Validation (FR-001 - derived from BR-001)**

* **FR-001.1: Loan Amount Input:**
    * **Description:** The system shall provide an input field for the user to enter the loan's principal amount.
    * **Type:** Numeric (currency format).
    * **Validation:**
        * Shall accept positive numbers only (> 0).
        * Shall support decimal values (e.g., up to 2 decimal places).
        * Shall have a default value (e.g., $100,000) for initial display.
    * **UI:** Label "Loan Amount ($)".

* **FR-001.2: Annual Interest Rate Input:**
    * **Description:** The system shall provide an input field for the user to enter the annual interest rate.
    * **Type:** Numeric (percentage format).
    * **Validation:**
        * Shall accept positive numbers only (0.00% to e.g., 20.00%).
        * Shall support decimal values (e.g., up to 2 decimal places).
        * Shall have a default value (e.g., 5.0%) for initial display.
    * **UI:** Label "Annual Interest Rate (%)".

* **FR-001.3: Loan Term Input:**
    * **Description:** The system shall provide an input field for the user to enter the loan term in years.
    * **Type:** Numeric (integer).
    * **Validation:**
        * Shall accept positive whole numbers only (e.g., 1 to 50 years).
        * Shall have a default value (e.g., 30) for initial display.
    * **UI:** Label "Loan Term (Years)".

* **FR-001.4: Calculation Trigger:**
    * **Description:** The system shall provide a button or automatically trigger recalculation when input values change.
    * **UI:** A "Calculate" button or automatic update on input change.

**2.2. Amortization Schedule Display (FR-002 - derived from BR-002)**

* **FR-002.1: Table Structure:**
    * **Description:** The system shall display a dynamic table with columns for each month of the loan term.
    * **Columns:** "Month", "Starting Balance", "Monthly Payment", "Principal Paid", "Interest Paid", "Ending Balance".
    * **Data Format:** All currency values ($) shall be formatted to two decimal places.
* **FR-002.2: Calculation Logic:**
    * **Description:** The system shall correctly calculate each row of the amortization table based on the loan amount, annual interest rate, and loan term.
    * **Formula:** Standard amortization formula using monthly compounding. (M = P [ i(1 + i)^n ] / [ (1 + i)^n – 1 ], where M = monthly payment, P = principal loan amount, i = monthly interest rate, n = number of months).
    * **Precision:** Calculations shall maintain high precision internally (e.g., up to 6-8 decimal places for interest rates) before rounding for display.
* **FR-002.3: Scrollability:**
    * **Description:** The amortization table shall be scrollable if the number of rows exceeds the viewport height.

**2.3. Financial Summary Display (FR-003 - derived from BR-003)**

* **FR-003.1: Total Interest Paid:**
    * **Description:** The system shall display the total interest paid over the entire loan term.
    * **Calculation:** Sum of "Interest Paid" column from the amortization table.
    * **Format:** Currency ($) to two decimal places.
    * **UI:** Label "Total Interest Paid: [Value]".
* **FR-003.2: Total Payments:**
    * **Description:** The system shall display the total amount paid over the entire loan term (Principal + Interest).
    * **Calculation:** Sum of "Monthly Payment" column from the amortization table, or Loan Amount + Total Interest Paid.
    * **Format:** Currency ($) to two decimal places.
    * **UI:** Label "Total Payments: [Value]".

**2.4. Visualizations (FR-004 - derived from BR-004)**

* **FR-004.1: Interest to Principal (I2P) Ratio Pie Chart:**
    * **Description:** The system shall display a pie chart illustrating the ratio of total interest paid to the initial loan principal.
    * **Segments:** Two segments: "Total Principal" and "Total Interest".
    * **Labels:** Each segment shall be clearly labeled with its category and corresponding percentage (e.g., "Principal: 60%", "Interest: 40%").
    * **Interactivity:** Hovering over a segment shall display its exact value.
* **FR-004.2: Principal vs. Interest Over Time Line Chart (Cool Idea - derived from new BR):**
    * **Description:** The system shall display a line chart showing the monthly principal payment and monthly interest payment trends over the loan term.
    * **X-axis:** Month Number.
    * **Y-axis:** Amount ($).
    * **Lines:** Two distinct lines: "Principal Portion" and "Interest Portion".
    * **Legend:** Clear legend to differentiate lines.
    * **Interactivity:** Tooltips on hover showing exact values for specific months.
* **FR-004.3: Remaining Balance Over Time Chart (Cool Idea - derived from new BR):**
    * **Description:** The system shall display a line chart showing the decreasing outstanding loan balance over the loan term.
    * **X-axis:** Month Number.
    * **Y-axis:** Remaining Balance ($).
    * **Line:** Single line representing "Remaining Balance".
    * **Interactivity:** Tooltips on hover showing exact values for specific months.

**2.5. Scenario Comparison (FR-005 - derived from new BR)**

* **FR-005.1: Multiple Scenario Inputs:**
    * **Description:** The system shall allow users to define and store parameters for at least two different loan scenarios (e.g., Scenario A, Scenario B).
    * **Mechanism:** Tabs, dropdowns, or distinct input sections for each scenario.
* **FR-005.2: Side-by-Side Comparison Display:**
    * **Description:** The system shall display the summary outputs (Total Interest, Total Payments) for selected scenarios side-by-side.
    * **Format:** A comparative table or summary boxes.
* **FR-005.3: Chart Overlays (Cool Idea):**
    * **Description:** The system shall allow users to overlay Principal vs. Interest, and Remaining Balance charts for multiple scenarios on a single graph for direct visual comparison.
    * **Legend:** Clear legend to differentiate scenario lines.

**2.6. Affordability Estimator (FR-006 - derived from new BR)**

* **FR-006.1: Desired Monthly Payment Input:**
    * **Description:** The system shall provide an input field for the user to specify their desired maximum monthly payment.
    * **UI:** Label "Desired Monthly Payment ($)".
* **FR-006.2: Estimated Loan Amount Calculation:**
    * **Description:** Based on the desired monthly payment, interest rate, and loan term, the system shall calculate and display the maximum loan amount that can be afforded.
    * **Formula:** Reverse amortization calculation.
    * **UI:** Label "Estimated Affordable Loan Amount: [Value]".

---

**3. Non-Functional Requirements**

* **NFR-001: Performance:**
    * **Response Time:** Calculation and display of results should occur within 1-2 seconds for typical inputs (e.g., 30-year loan).
    * **Load Time:** Initial page load time should be under 3 seconds.
* **NFR-002: Usability:**
    * **Intuitive UI:** The user interface shall be clean, intuitive, and easy to navigate.
    * **Clear Labeling:** All input fields, outputs, and charts shall be clearly labeled.
    * **Error Messages:** Input validation errors shall display clear and user-friendly messages.
* **NFR-003: Reliability:**
    * **Accuracy:** All calculations must be accurate to two decimal places for currency values.
    * **Error Handling:** The application should gracefully handle invalid inputs without crashing.
* **NFR-004: Scalability (Initial):**
    * The Reflex framework should allow for future expansion of features without significant re-architecture.
* **NFR-005: Security:**
    * **Data Privacy:** As no personal data is stored, basic web security practices (e.g., secure hosting if deployed) are sufficient. No user authentication is required.
    * **Input Sanitization:** User inputs should be sanitized to prevent injection attacks.
* **NFR-006: Accessibility:**
    * Consider basic accessibility standards for web content (e.g., sufficient color contrast, keyboard navigation where applicable).

---

This detailed breakdown gives your Python Reflex development a solid foundation, moving from the high-level business goals to the specific features and behaviors required of the application.

{{< /details >}}

#### RE Questions

1. In which month does interest and payments are 50/50?
2. When does the rent cover the interest costs?
3. The interest/principal split just depends on: years and %interest
4. The PER of the flats depends on the city/neighbourhood you look

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