---
title: "Connecting to T-SQL and OracleSQL"
date: 2026-02-01T23:20:21+01:00
draft: false
tags: ["BAML","AI Tech Talk 3","DuckDB vs ClickHouse vs SQlite"]
description: 'Enterprise insights are behind Connecting to T-SQL and OracleSQL - Go get them.'
url: 'using-baml-to-query-a-database'
---

**Tl;DR**

**Intro**

This is all around:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/langchain-db-ui" title="LangChain x DB QnA x UI ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="All withing the Data Chat Repo ↗" icon="github" >}}
{{< /cards >}}


## Enterprise Insights

We are going to simulate these with containers.

Just as demostrated here with pgsql.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/postgresql" title="PostgreSQL | Docker Config 🐋 ↗" >}}
{{< /cards >}}

What if we could gain more control over whats going on, instead of relying on Langchain?

```sh
source datachat_venv/bin/activate
#Then, run the extraction script:
python3 baml-extract-schema.py --db-uri "postgresql://admin:securepassword@localhost:5432/umami_warehouse" --question "What are the most visited pages?"
```


### TSQL

### Oracle SQL

### DuckDB vs ClickHouse vs SQLite

Some people say that duckdb is the opposity of redshift.



```mermaid
mindmap
  root((Data Modeling))
    OLTP
      [Process: Transactional]
      Concept: ER Modeling
        )Normalized - 3NF(
        Goal: Data Integrity
        Low Redundancy
      Characteristics
        ACID Compliance
        Row-based Storage
        High Write Speed
        Low Latency - ms
      Tools
        PostgreSQL
        MySQL
        MariaDB
        SQLite
    OLAP
      [Process: Analytical]
      Concept: Dimensional Modeling
        )Star / Snowflake Schema(
        Goal: Query Performance
        High Redundancy
      Characteristics
        Fact & Dimension Tables
        Columnar Storage
        High Read Speed
        Complex Aggregations
      Tools
        ClickHouse
        DuckDB - Local
        Snowflake
        BigQuery
    The Bridge
      ))ETL / ELT((
      )Data Warehouse(
```

The Data Lakehouse is essentially the "modern evolution" that tries to delete the line between your Postgres (OLTP) and your ClickHouse/DuckDB (OLAP).

If OLTP is for writing and OLAP is for reading, the Lakehouse is for unifying.

```mermaid
mindmap
  root((Data Management))
    OLTP (Postgres/MariaDB)
      ::icon(fa fa-database)
      Focus: Live Transactions
      Format: Row-based tables
    
    OLAP (DuckDB/ClickHouse)
      ::icon(fa fa-chart-line)
      Focus: Fast Analytics
      Format: Memory/Columnar
      
    Data Lakehouse (The Hybrid)
      Concept: Best of both worlds
      Architecture
        Object Storage (S3/MinIO)
        Table Formats (Delta Lake/Iceberg)
      File Formats (The "Big Data" part)
        Avro: Fast Write/Streaming
        Parquet: Fast Read/Analytics
      Key Benefits
        ACID on top of Files
        One single source of truth
        Cheaper than Warehouse
```

### Using BAML

I was testing BAML last year [here](https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli/#baml).

And it resonated a lot with the way langchain generates the query to the databases.

So could not resist to explore how to do a custom and more controlable solution around BAML.

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Data-Chat/blob/main/LangChain/ChatWithDB/test_langchainChatDB.ipynb)

What I wanted is this: *and remove the langchain dependency*


1.  **Extract Schema**: Use `SQLDatabase` to get the metadata.
2.  **Generate & Separate**: Call BAML and extract the three distinct fields (`sql`, `explanation`, `promptRationale`).
3.  **Execute**: Run the query against the DB using the existing connection.
4.  **Final Output**:
    - Print the **Rationale** (Why we did this).
    - Print the **SQL** (What we are running).
    - Print the **Data Table** (The results).

```sh
./datachat_venv/bin/baml-cli generate --from z-langchain2baml/baml_src
```

```mermaid
graph LR
    U[User Question] --> S[Python Script]
    S --> |Conn| DB[(PostgreSQL)]
    DB --> |Full Schema| S
    S --> |Context + Question| B[BAML Client]
    B --> |Prompt| L[LLM GPT-4o]
    L --> |JSON Result| B
    B --> |Typed Object| S
    S --> Out[Final SQL & Explanation]
    Out --> DB
    DB --> Result[Data Result]
    Result --> S
```

1.  **Activate Environment**:

```bash
source datachat_venv/bin/activate
#pip install tabulate
```

2.  **RuCreate baml arficats**:

```bash
baml-cli init #configure your baml_src
baml-cli generate #it generates baml_client, which the main python script uses
```

Working with BAML follows a very specific and reliable cycle:

1.  **Define (`baml_src/`)**: You define your data models (classes) and functions in `.baml` files.
    *   `database.baml`: Defines the `SqlResult` structure and the `GenerateSQL` function.
    *   `clients.baml`: Configures the LLM providers (e.g., GPT-4o).
2.  **Generate (`baml_client/`)**: Running `baml-cli generate` turns your BAML definitions into a type-safe Python client. You never edit this folder manually.
3.  **Call (Python)**: Your application script (`baml-qna.py`) imports the generated client and calls the functions just like regular Python methods.

How to Tweak the Logic (`baml_src/`)

If you want to customize the behavior, here is what each file does:

*   **`database.baml`**: **The Core Logic.** This is where you define the `class` (what data the LLM returns) and the `function` (the actual prompt). If you want to change **how the LLM thinks** or what info it provides, edit this.
*   **`clients.baml`**: **The Model Settings.** Here you define which LLM providers to use (OpenAI, Anthropic, etc.), which models (GPT-4o, Claude 3.5), and parameters like `temperature` or `api_key` environment variables.
*   **`generators.baml`**: **The Integration Settings.** This tells BAML to generate a **Python** client and where to put it. You rarely need to touch this unless you are switching languages or changing the output path.

```mermaid
graph LR
    Start([Start]) --> Init[baml-cli init]
    Init --> Src[baml_src folder]
    Src --> Edit[Edit .baml files]
    Edit --> Gen[baml-cli generate]
    Gen --> Client[baml_client folder]
    Client --> Py[Python Script]
    Py --> Call[Client Calls LLM]
    
    subgraph "Manual Input"
    Edit
    end
    
    subgraph "Auto-Generated"
    Client
    end
```

3.  **Run Execution Script**:


```sh
# From the project root
python3 z-langchain2baml/baml-qna.py --db-uri "postgresql://admin:securepassword@localhost:5432/umami_warehouse" --question "What are the most visited pages?"
```

By separating `promptRationale`, we gain:
- **Debugging**: Understand if the LLM misinterpreted the schema.
- **Auditing**: Keep track of why certain joins or filters were applied.
- **User Trust**: Show the user the "thinking process" before showing the data.

```sh
mindmap
  root((baml-qna.py))
    BAML
      Structured Output
      Type-safe Python Client
      Prompts & Schema Context
      Model Clients (GPT-4o)
    PostgreSQL
      Data Warehouse
      Schema Metadata source
      SQL Execution target
    General Python Logic
      Orchestration
      LangChain: Schema Extraction
      Pandas: Data Result Formatting
      SQLAlchemy: DB Connection
```

### UI Wrapper

To make the solution sellable to enterprises: we need a UI.

And the good news is that we already vibe coded that: here.

![langchain db qna via UI PoC](/blog_img/DA/sql/langchain-vite-pgsql.png)

> Even with a related tech talk

Well, Ok.

Not only a UI, but a way to get plots and potentially dashboards done from natural language.

Or as people call this now: a generative BI solution.

Thats coming up next: `z-baml-genbi`

![alt text](/blog_img/AIBI/matplotlib-baml-pgql-qna.png)

> Imagine having such graphs generated from your QnA

---

## Conclusions

From how to what and why.

Code is cheap now. Software isnt *at least for now*.

> From [this great post](https://www.chrisgregori.dev/opinion/code-is-cheap-now-software-isnt) and [video](https://www.youtube.com/watch?v=28z6OjsNsUk)

The danger is now more on not to get distracted with the daily tool or workflow that gets released.

Go with cursor, antigravity, claude code, lovable, opencode, crush...

But just go and try.

The challenge is now the **distribution / orchestration / marketing**, not the coding thing.

Do you even know the audience? is it even listening?

Are you building sth for an empty room?

Time to go from builder to **creator and finding people to care** about your thing.

### The related tech talk

```sh
git clone https://github.com/JAlcocerT/selfhosted-landing
cd y2026-tech-talks/4-baml-db-insights
```

---

## FAQ


### A Recap on D&A for Interviews

1. Document Logic (The Planning)

*   **BRD (Business Requirements):** Answers **"WHY build this?"** (The Vision & Goals).
*   **PRD (Product Requirements):** Answers **"WHAT are we building?"** (The Features & Roadmap).
*   **FRD (Functional Requirements):** Answers **"HOW does it work?"** (The Technical Logic & CRUDs).

2. Data Logic (The Analytics)

*   **Fact Tables:** Answer **"WHAT happened (and how much)?"**
    *   *Examples:* `visit_count`, `revenue`, `quantity_sold`.
*   **Dimension Tables:** Answer **"WHO / WHERE / WHICH context?"**
    *   *Examples:* `customer_name`, `product_category`, `country_origin`.

A Materialized table is a solution to d&a problem.

If you were to grow your Northwind project into a "Big Data" architecture:

Postgres (OLTP) handles your orders.

An ETL tool takes those orders and saves them as Avro files in a folder (Data Lake).

A "Lakehouse" tool (like Apache Iceberg or Delta Lake) converts those to Parquet.

DuckDB or ClickHouse then queries those Parquet files directly..

| Aspect | Dimensional Modeling | Semantic Modeling (PBI) |
| :--- | :--- | :--- |
| **Focus** | Efficiency and Structure (Star Schema). | Usability and Business Logic (Logic + Context). |
| **Action** | Joining tables, defining PKs and FKs. | Refinement: DAX, Renaming, RLS, Formatting. |
| **Output** | A clean, technical Warehouse schema. | A "Self-Service" model ready for business users. |

The Traditional BI Lifecycle (Hand-Crafted)

To demonstrate the value of Gen-BI, we must first understand the manual effort required to build a high-performance Power BI dashboard aligned with business goals.

The Bridge from Raw Data to Insights

Building a professional Power BI solution involves a rigorous 4-step process:

1.  **Data Acquisition (DL - Data Layer)**: Connecting to raw sources via SQL or Power Query. This is where the physical connection lives.
2.  **Dimensional Modeling (The Foundation)**: Implementing **Kimball Methodology**.
    - Creating a **Star Schema** with clear `Fact` tables (events) and `Dimension` tables (attributes).
    - This is the "Structural Truth" of the data.
3.  **Semantic Modeling (The Meaning)**: Adding the **Power BI Layer**.
    - Writing **DAX Measures** (e.g., Year-to-Date, Moving Averages).
    - Setting up **Hierarchies** (e.g., Category -> Product).
    - Optimizing performance via **Aggregations** and Column indexing.
4.  **Visualization (RL)**: Aligning with the **Business Purpose**.
    - Selecting visuals that answer specific BRD questions (e.g., "Which region is underperforming?").
    - Tuning the UX for speed and clarity.