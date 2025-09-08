---
title: "PowerBI"
date: 2020-12-07T19:20:21+01:00
draft: false
tags: ["Business Intelligence","pbiviz","D3js"]
description: About PBi, Dax and M. How to create custom Dashboards with R/Python inside Power Bi.
url: about-powerbi
---


**TL;DR**

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PBi" title="PowerBI DAX/M Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Some useful DAX and M formulas - Source Code on Github" >}}
{{< /cards >}}

* https://github.com/wbkd/awesome-d3

**Intro**

Power BI is a suite of business intelligence tools from Microsoft used for data visualization and analysis.

It allows users to connect to various data sources, transform data, and create interactive reports and dashboards. 

Power BI uses two primary languages, **M** and **DAX**, each serving a distinct purpose within the data workflow.


### Power Query and the M Language

**Power Query** is the engine inside Power BI (and other Microsoft products like Excel) that handles the **ETL (Extract, Transform, Load)** process.

It's used for getting data from its source, cleaning it, and shaping it before it's loaded into the data model. 

The Power Query Editor provides a user-friendly, low-code graphical interface where you can perform a wide range of transformations like removing duplicates, splitting columns, and merging tables by simply clicking buttons.

The **M language** (officially, "Power Query M formula language") is the functional programming language that runs in the background of Power Query.

When you use the graphical interface to perform a transformation, Power Query writes the corresponding M code for you. You can view and edit this code in the "Advanced Editor" for more complex or customized transformations. 

M is primarily for **data cleaning and preparation**.

> It's not a full-fledged programming language like Python, but rather a specialized query language for data mashup and transformation.

### DAX (Data Analysis Expressions)

**DAX** is a formula language used in Power BI for **data analysis and modeling**. 

It's the language you use to create new information and insights from the data you've already loaded and cleaned. 

> Think of it as a more powerful version of Excel's formulas, but designed for use with a relational data model.

You use DAX to:

* **Create Measures**: Dynamic calculations that aggregate data based on the user's interaction with the report (e.g., "Total Sales" or "Average Profit Margin").
* **Create Calculated Columns**: New columns added to a table that are derived from existing data (e.g., a `FullName` column created by combining `FirstName` and `LastName`).
* **Define Calculated Tables**: New tables based on expressions that can be used in your data model.

DAX operates on the **data model** (the tables and relationships you've defined in Power BI), not the raw data source. 

Its primary function is to perform calculations on the prepared data, providing the analytical layer for your reports and dashboards.

### The Workflow: M vs. DAX

The key distinction between M and DAX lies in the **stage of the workflow** where they are used:

* **M is for the "E" and "T" of ETL.** You use it **before** the data is loaded into the model to clean, shape, and combine your source data. M queries are run only when you refresh the data.
* **DAX is for the "Analysis" and "Modeling" after the "L" of ETL.** You use it **on top of** the loaded data model to perform calculations and create insights. DAX formulas are evaluated on the fly as a user interacts with a report, making them dynamic and responsive to filters.

{{< callout type="warning" >}}
A good rule of thumb is: **if you can do it in Power Query, do it in Power Query.** This ensures the most efficient data preparation.
{{< /callout >}}

Use DAX for the final, dynamic calculations and measures that can't be handled during the initial data transformation phase.


---

## FAQ

Neither **M** nor **DAX** queries are executed directly on a Microsoft cloud database against your source data. 

Instead, their execution depends on the specific context: whether you are working in Power BI Desktop or a cloud service.

### M Language Execution

The **M language** (used in Power Query) is executed by the **Power Query engine**. This engine typically runs on the local machine you're using (for example, your computer when you're in Power BI Desktop). 💻

When you refresh data, the Power Query engine connects to your data source(s) and executes the M script step-by-step. During this process, a key feature called **Query Folding** can occur.

If the source database (like a SQL Server or Oracle database) supports it, the Power Query engine will "fold" or translate the M transformations into the source database's native query language (e.g., SQL).

The database then performs the transformations, and only the final, transformed data is sent to Power BI. This is much more efficient than pulling all the raw data and then transforming it locally.

> If query folding isn't possible, all the data is extracted, and the transformations are performed by the Power Query engine on your local machine.

### DAX Execution

**DAX** queries are executed by the **Power BI in-memory analytics engine**, which is a powerful engine designed for fast calculations and aggregations. This engine is also referred to as the **VertiPaq engine**. 💨

* **In Power BI Desktop:** The DAX queries are executed on your local machine using a local instance of the VertiPaq engine. This is why you can work with a data model even when you are offline.

* **In Power BI Service (the cloud):** When you publish your report, the data model and its DAX logic are uploaded to the Microsoft cloud. When a user interacts with a report or dashboard, the DAX queries are executed by the VertiPaq engine on Microsoft's servers, which are hosted in the cloud.

> The results are then sent back to the user's browser for visualization. This is how Power BI can provide rapid, interactive analysis on large datasets without needing to re-query the source database every time.

### DAX vs Calculated Col vs PowerQuery

DAX, Calculated Columns, and Power Query/M are all essential tools in Power BI for data modeling and analysis, but they serve different purposes and operate at different stages of the data pipeline.

The Stages of Data Transformation

Think of the data pipeline in Power BI as having two main stages:

1.  **Data Loading and Transformation** (ETL)
2.  **Data Modeling and Analysis**

**Power Query (M Language)** operates in the **first stage**. It's the primary tool for extracting data from various sources, cleaning it, and transforming it before it's loaded into the Power BI data model. 

**DAX (Data Analysis Expressions)** and **Calculated Columns** operate in the **second stage**. Once the data is loaded, DAX is used to perform calculations and create new measures and columns within the data model.

Power Query vs. DAX

* **Power Query (M Language):** This is a powerful, visual tool with a backend language called **M**. It's used for **data manipulation at rest**. Transformations performed here are applied when the data is refreshed. This includes tasks like merging tables, pivoting, unpivoting, filtering rows, and changing data types. The results are physical changes to the data model. If you use Power Query to create a new column, the new column and its values are physically stored in your data model, taking up space. It is a very **ETL-focused language**.

* **DAX (Data Analysis Expressions):** This is a formula language used for **in-memory calculations and analysis**. It's similar to Excel formulas but with more power for relational data. DAX is used to create **measures** and **calculated columns** that compute values based on the data in your model. DAX calculations are performed on the data model that is already loaded and ready for analysis. It is an **analytical language**.

Calculated Columns and Measures

Both **Calculated Columns** and **Measures** are created using DAX, but they are used in different ways:

* **Calculated Columns:** A calculated column is a new column added to a table in the data model. Its value is computed for **every single row** in that table and is physically stored in memory. Since a calculated column is pre-calculated, it takes up storage space and is best used for simple, static values that don't need to be aggregated (e.g., `Full Name = [First Name] & " " & [Last Name]`).

* **Measures:** A measure is a dynamic calculation. Its value is **not pre-calculated or stored in the data model**. Instead, it's computed **at query time** based on the filter context of the report. This makes measures extremely powerful and efficient for aggregations (e.g., `Total Sales = SUM(Sales[SalesAmount])`). Measures do not take up storage space in the data model and are the preferred way to perform analytical calculations.

Summary of Relations

| Tool | Language | Purpose | Stage in Pipeline | Best For |
| :--- | :--- | :--- | :--- | :--- |
| **Power Query** | M | **Data Transformation** | ETL (Before Loading) | Cleaning, shaping, and merging data. |
| **Calculated Column** | DAX | **Row-by-Row Calculation** | Modeling (After Loading) | Simple values, static data, storing a single value for each row. |
| **Measure** | DAX | **Dynamic Aggregation** | Analysis (At Query Time) | Aggregations, KPIs, and complex calculations. |

### What to use?

The general principle is to perform transformations as far "upstream" as possible, meaning as close to the data source as you can. 

This is the most efficient way to work.

#### Sample Workflow

1.  **Use SQL for Initial Transformations:** This is the ideal first step. By using a well-crafted SQL query against your PostgreSQL database, you let the powerful database engine handle the heavy lifting of filtering, joining, and aggregating data. This process is called **query folding**, where Power BI translates your Power Query M steps into native SQL queries and pushes the computation to the source.
    * **Pros:** This dramatically reduces the amount of data transferred over the network, leading to faster data refreshes and better performance. It leverages the database's optimized processing capabilities, which are typically far more efficient than your local machine's.
    * **Cons:** It requires a good understanding of SQL. Some complex transformations in M may not "fold" back to SQL, meaning the process will break and the remaining steps will be executed locally in Power Query, which can be inefficient.


2.  **Use Power Query (M) for Additional Cleaning:** After the initial SQL query, you can use the Power Query Editor to perform any final cleaning steps that are not easily done in SQL. This includes tasks like splitting columns, pivoting/unpivoting data, handling null values, and merging data from different sources (like a CSV file or an Excel sheet).
    * **Pros:** Power Query provides a user-friendly, step-by-step interface for transformations, making it accessible even without deep coding knowledge. It's excellent for data shaping tasks that are visual and not performance-critical.
    * **Cons:** Transformations performed here are executed locally on your machine (or in the cloud if you publish the report) after the data has been loaded. If you're working with a large dataset and you can't push the logic back to the database, this can be slow and consume a lot of memory.

3.  **Use DAX for Final Metrics and Aggregations:** DAX is the language for the final analysis layer. It's used for creating dynamic calculations that respond to user interactions in the report, like slicers and filters.
    * **Pros:** DAX is highly optimized for creating measures and calculated columns on the in-memory data model. It's essential for time intelligence functions (e.g., Year-to-Date sales) and dynamic aggregations that can't be pre-calculated.
    * **Cons:** You should avoid using DAX for data cleaning or for creating calculated columns that could have been created in Power Query. Why? Because DAX calculated columns are stored in the data model and increase file size, while Power Query computed columns are processed during data refresh and don't take up space in the model itself. 

### Why is my pbix using that much space?

When you save a Power BI report (.pbix file), the file size is large primarily because it contains the **entire data model**, not just the report visuals and layout. 

📊 This data model includes all the tables and columns that you've imported from your data sources, even after they've been compressed.

Here are the main reasons why your `.pbix` files can become large:

* **Import Mode Data:** By default, Power BI uses **Import mode**, which loads a full copy of the data into the file. This makes the report very fast and interactive, as all calculations are performed on the in-memory data. However, this comes at the cost of file size. The more data you import (in terms of rows and columns), the larger the file will be.

* **High Cardinality Columns:** A major factor affecting size is a column's **cardinality**, or the number of unique values it contains. Power BI's VertiPaq engine compresses data by creating dictionaries of unique values for each column. If a column has many unique values (like a customer ID, order number, or a long string of text), its dictionary will be large, and the compression won't be as effective.

* **Calculated Columns:** While DAX is great for creating measures, creating many calculated columns can increase the file size significantly. Unlike measures (which are calculated on the fly), calculated columns are stored in the data model, taking up space and increasing the file size.

* **Unnecessary Data:** Often, reports contain more data than needed. This could be unused columns, rows from many years ago that aren't relevant to the analysis, or tables that are no longer used in any visuals or measures. Every bit of this extra data contributes to the file size.

* **Hidden Tables:** Power BI's "Auto Date/Time" setting (which is on by default) can automatically create hidden date tables for every date column in your model, which can add unnecessary data and significantly increase file size, especially if you have many date columns.

### How about custom panels?

Yes, you can absolutely enhance Power BI with custom diagrams and visuals, including those powered by R and Python.

This is one of Power BI's most powerful features for advanced users who need to go beyond the standard charts. 

#### R or Python-Powered Visuals 🐍📊

Power BI has built-in support for **R and Python scripts** to create custom visuals. 

These are great for generating highly specialized or statistical charts that aren't available by default.

* **How it works:** You add an R or Python visual to your report. You then drag data fields into it, which Power BI automatically converts into a `dataframe`. You then write your R or Python script using that dataframe to generate a plot.

* **Pros:** This gives you access to the immense libraries of both languages, such as **ggplot2** and **plotly** for R, or **matplotlib**, 

**seaborn**, and **plotly** for Python. You can create complex statistical graphs, machine learning model outputs, and unique diagrams.

* **Cons:** These visuals are essentially static images. They are not fully interactive in the same way as native Power BI visuals. You can't click on a data point in the R or Python visual to cross-filter other visuals on the report page. There are also limitations on data size (typically around 150,000 rows) and a timeout on script execution.


#### Creating Native Power BI Visuals 👨‍💻

Yes, it is possible to create **native Power BI visuals**, but it's a more involved process and is intended for developers. 

These are visuals that you can publish to the Power BI AppSource marketplace or use within your organization.

* **How it works:** You use the **Power BI visuals SDK** (Software Development Kit), which is a command-line tool based on Node.js. This requires a strong understanding of web development technologies like **JavaScript**, **TypeScript**, and libraries like **D3.js**.

>  You build the visual from the ground up, defining its data roles, properties, and rendering behavior.

* **Pros:** This approach gives you **complete control** over the visual's appearance and functionality. The visuals you create are fully interactive, support cross-filtering, and can be used like any other native visual in Power BI.

* **Cons:** This is a complex process and requires specialized programming skills. It is not something the average Power BI user would undertake.

**Other Options**

* **Deneb:** This is a popular third-party custom visual that allows you to create highly customized charts using **Vega** and **Vega-Lite**, a declarative language for creating visualizations. You write a JSON-like specification to define the visual, offering a balance between the simplicity of R/Python visuals and the complexity of native SDK development.
* **Charticulator:** Another Microsoft product that lets you design custom charts using a drag-and-drop interface, and then export them as reusable custom visuals for Power BI. It is a more user-friendly way to create unique visuals without coding.


#### Using pbiviz files

If you build a native Power BI visual using the SDK, you don't have to publish it to the public AppSource marketplace. 

You can package it as a `.pbiviz` file and use it locally within your organization. 

There are two primary ways to do this:

**1. Manual Import**

You can import the `.pbiviz` file directly into a specific Power BI report.

* **How it works:** In Power BI Desktop, you click the ellipsis (`...`) in the **Visualizations** pane and select **Import a visual from a file**. You then browse to the `.pbiviz` file on your local machine.
* **Pros:** It's a simple, quick way to test a new visual or use a visual that a coworker developed.
* **Cons:** The visual is only available in that specific report. If you want to use it in another report, you have to import it again. It's not a scalable solution for an entire organization.

**2. Organizational Visuals Repository**

For enterprise use, Power BI administrators can upload and manage custom visuals in a **centralized organizational repository**.

* **How it works:** An admin uses the Power BI Admin Portal to add the `.pbiviz` file to the organization's approved visuals list. Once there, users in the organization can easily find and import it from the "Organizational visuals" tab in the **Get more visuals** dialog, making it available to everyone.
* **Pros:** This provides a secure, consistent, and scalable way to distribute custom visuals. Admins can control which visuals are available and ensure they meet security and quality standards.
* **Cons:** This requires admin-level privileges and is a more formal process than a simple local import.

**Open-Source Custom Visuals**

Yes, there are many open-source custom visuals available on GitHub. You can find these repositories by searching for topics like `powerbi-visuals`, `powerbi-custom-visuals`, and `d3-powerbi`. These repositories often contain the full source code (written in TypeScript) as well as the compiled `.pbiviz` file.

* **How to import them:** You typically download the `.pbiviz` file from the GitHub repository's releases page or a dedicated assets folder. Once you have the file, you can import it into Power BI Desktop using the **Import a visual from a file** option as described above. Some repositories, like the official Microsoft `powerbi-visuals` repository, are dedicated to providing the SDK and samples, rather than a large library of pre-built visuals.

#### Creating pbiviz

Building a native Power BI visual requires a specific set of web development skills and a different approach than creating a standard web component or a front-end framework like Astro.

Required Web Technology Skills

The Power BI visuals SDK is built on top of Node.js and TypeScript. Therefore, you need a strong understanding of these technologies:

* **TypeScript / JavaScript:** This is the core language for visual development. While some visuals can be written in JavaScript, TypeScript is the recommended standard because it provides type safety, which helps with code quality and maintainability.
* **Node.js and npm:** The SDK is a command-line tool that runs on Node.js. You'll use `npm` (Node Package Manager) to install the SDK and manage other JavaScript libraries you might use.
* **HTML & CSS:** The visual's layout and styling are defined using standard HTML and CSS. You need to know how to structure the DOM (Document Object Model) and style it to create your visual's appearance.
* **Data Visualization Libraries (Crucial):** This is the most important part. You'll rarely build a complex chart from scratch. Instead, you'll use a library to handle the rendering. The most popular choice by far is **D3.js** (Data-Driven Documents), which is a powerful JavaScript library for manipulating documents based on data. Other libraries like **Chart.js** or **Vega** can also be used, but D3.js is the most common for complex custom visuals.
* **Power BI Visuals SDK:** You need to understand the SDK's command-line tools (`pbiviz new`, `pbiviz start`, `pbiviz package`, etc.) and its project structure. You also need to know how to work with the SDK's APIs to get data from Power BI and render it.

Astro Components and CSR: Is It Enough?

Knowing how to create Astro components and do CSR (Client-Side Rendering) is a great foundation, but it is **not enough** on its own.

* **Astro vs. Power BI Visuals:** Astro is designed for building websites with static site generation and component-based architecture. A Power BI visual is a self-contained web application that lives within the Power BI canvas and must interact with the Power BI host environment. It doesn't have a concept of pages, routes, or a full backend server.
* **The Missing Link: Data Flow:** The biggest difference is the data flow. In an Astro component with CSR, the component fetches data from a backend API. A Power BI visual doesn't do this. Instead, Power BI itself provides the data to the visual through the `update` method in the SDK. The visual must be able to read this data and render it. This is a very different paradigm from typical web development.

No Backend Required

You are correct that **no backend is required** for a standard Power BI custom visual.

* **Self-Contained:** A `.pbiviz` file is a self-contained package that includes all the code (HTML, CSS, and TypeScript/JavaScript) needed to render the visual.
* **Sandboxed Environment:** The visual runs in a sandboxed iframe within the Power BI report. It gets all its data directly from the Power BI data model and has no inherent ability to make external API calls on its own. (Note: A custom visual can be built to make external calls, but it requires specific certification and is a security concern, so it's not the default or common approach).

In summary, while your web development skills are a good start, you'll need to learn the specific APIs and methodologies of the Power BI visuals SDK, with a strong focus on TypeScript, Node.js, and a data visualization library like D3.js.

#### Resource to create custom panels

**Power BI Visuals SDK Docs 📚**

The official and most comprehensive documentation for the Power BI visuals SDK is maintained by Microsoft on their learning platform. This is the best place to start.

* **Microsoft Learn - Power BI visuals documentation**: This is your main resource. It covers everything from setting up your development environment and creating your first visual to more advanced topics like adding formatting options, debugging, and packaging your visual for distribution. It also has tutorials and reference guides for the various APIs you'll interact with.

**D3.js Docs and Learning Resources 📉**

D3.js is a very powerful but low-level library with a steep learning curve. The best resources combine reference material with tutorials and examples.

* **Official D3.js Documentation**: This is the authoritative source for the library's API. It's not a tutorial, but rather a reference guide for all the modules and methods. You can look up exactly what a function does and its parameters.
* **D3 in Depth**: A highly recommended, free online book that breaks down D3's core concepts step-by-step. It's a fantastic resource for understanding the fundamental principles like data binding, selections, and scales.
* **Observable's D3 Tutorials**: ObservableHQ, a platform for data analysis, has a collection of excellent tutorials created by Mike Bostock, the creator of D3. They are interactive, and you can edit the code directly in the browser. 

**Other Data-Driven Documents Libraries 📊**

While D3.js is the most prominent and flexible library for creating custom visualizations from scratch, several other excellent libraries are built on similar principles or offer higher-level functionality.

* **Vega & Vega-Lite**: These are declarative languages for creating, saving, and sharing interactive visualizations. You describe the visual you want in a JSON-like format, and the Vega renderer creates it. **Vega-Lite** is a higher-level abstraction that makes it easier to create common charts with less code. Many popular tools and libraries use Vega-Lite under the hood.
* **Plotly.js**: A high-level, open-source library that's great for creating interactive, publication-quality charts with minimal effort. It supports a wide range of chart types out of the box and works across multiple languages, including Python and R. It is a good choice if you need interactivity but don't want to get into the weeds of D3.
* **Chart.js**: A simple and lightweight library that uses the HTML5 `<canvas>` element to render animated, responsive charts. It's very easy to get started with for basic charts like bar, line, and pie charts.
* **Highcharts**: A commercial JavaScript charting library. It's a popular choice for enterprise applications due to its extensive documentation, rich features, and professional support, though it requires a license for commercial use.