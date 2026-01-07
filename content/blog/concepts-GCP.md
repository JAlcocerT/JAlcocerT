---
title: "A closer look to Google Cloud Platform"
date: 2025-02-16
draft: false
tags: ["D&A","BQ","Looker","Green vs Brown Field","lkml"]
description: 'Big Query, Dataform and more about GCP. Compared with other Clouds and OnPrem.'
url: 'understanding-google-cloud-platform'
---

**Tl;DR**

You might find this kind of [GCP Big Data Stack](#gcp-data-stack-in-action).

**Intro**

You might be new to [D&A withing GCP](#data-analytics-with-gcp).

If you are good with [SQL](https://jalcocert.github.io/JAlcocerT/sql-data-analytics/), you will be very confortable here, specially if you will be using [Big Query](#big-query).

You might see that the entire data process follows a logical flow like [this one](#conclusions):

1.  **Ingestion**: Raw data is ingested and stored in **Cloud Storage (GCS)**.
2.  **Transformation**: **Dataform** is used by data engineers (~SQLX) to transform this raw data into a clean, structured format, which is then loaded into **BigQuery**, the GCP DWH.
3.  **Modeling & Analysis**: **Looker** connects to BigQuery and provides a powerful, business-friendly layer on top of the data using **LookML**. 

> This allows data analysts and business users to create dashboards and reports based on a single, consistent set of metrics, all within [GCP](#google-cloud-platform).


## Google Cloud Platform

Google has one of the **important cloud** out there!

If you understand these, you need to know that there are similar alternatives in other clouds.

Just with the services having a different names: https://console.cloud.google.com/

### Data Analytics with GCP

* Bigtable: While Bigtable is a distributed NoSQL database good for very high volumes of data, it's not a relational database and doesn't offer the same level of transactional consistency as Cloud Spanner.

* Cloud SQL: Cloud SQL is a relational database service, but it's not globally distributed in the same way as Cloud Spanner, and it might not be the best choice for applications requiring very high scalability and availability across multiple regions.

**BigQuery**: BigQuery is a data warehouse designed for analytics and business intelligence, not for transactional workloads or CRUD operations. It's used for analyzing large datasets, not for serving real-time application requests.

{{< cards cols="1" >}}
  {{< card link="https://console.cloud.google.com/" title="GCP Console ↗ " >}}
{{< /cards >}}


#### Google DataForm

Google Dataform is **a data engineering tool**. 

* **Purpose:**
    * It's a service for developing, testing, and **deploying data transformations within Google Cloud's BigQuery**.
    * It helps you manage complex **SQL-based** data pipelines.
    * It enables version control, collaboration, and automated testing of your data transformations.
* **Key Features:**
    * **SQLX: A SQL extension for defining data transformations**.
    * Dependency management: Automatically handles the order of execution of your SQL queries.
    * Testing: Allows you to write tests to ensure the accuracy of your data.
    * Version control: Integrates with Git for collaborative development. *You might use Github to sync your dataform sqlx files.*
    * Scheduling: Allows for the scheduling of data pipeline executions.
* **Use Cases:**
    * Building data warehouses and data marts.
    * Performing data transformations for analytics and reporting.
    * Automating data pipelines.

{{< details title="More about SQLX and Dataform/BQ 📌" closed="true" >}}

SQLX, the extension to SQL used by Google Dataform, allows you to embed JavaScript within your SQL files. 

This is a powerful feature that enables you to:

* **Define variables and parameters:** You can use JavaScript to dynamically define values that are used in your SQL queries.
* **Create reusable logic:** You can write JavaScript functions to encapsulate complex logic that can be reused across multiple SQLX files.
* **Generate SQL dynamically:** You can use JavaScript to generate SQL code based on certain conditions or parameters.
* **Perform data transformations:** While SQL is the primary language for transformations, you can use JavaScript for more complex data manipulation tasks.

Here's a basic idea of how it works:

* Within your SQLX files, you can use `{{ ... }}` to embed JavaScript expressions.
* Dataform's compiler will evaluate these JavaScript expressions and replace them with their results before executing the SQL queries.

**Example:**

```sql
/* my_table.sqlx */

{{
  let threshold = 100;
}}

SELECT
  *
FROM
  my_data
WHERE
  value > {{ threshold }};
```

In this example:

* A JavaScript variable `threshold` is defined.
* The value of `threshold` is then used in the `WHERE` clause of the SQL query.

**Key Benefits:**

* **Flexibility:** JavaScript adds a lot of flexibility to SQL, allowing you to handle more complex data transformations.
* **Reusability:** JavaScript functions can be reused across multiple SQLX files, reducing code duplication.
* **Dynamic SQL Generation:** You can generate SQL queries dynamically based on parameters or conditions.

> This capability makes SQLX and Google Dataform very powerful tools for data engineering.

**Remember**

BigQuery 📊

BigQuery is a **serverless data warehouse** from Google Cloud. 

It's used for storing and analyzing massive datasets using standard SQL. 

```sql
SELECT
  *
FROM
  `prj-lg-p-odh-data`.`something`.`othersth_metrics_base` AS t
WHERE
  t.medium = 'wifi'
  AND DATE(t.ts) = CURRENT_DATE() - 1
  AND t.client_mac LIKE 'X%';
```

It's a fundamental part of the modern data stack.

SQL Files (.sql)

These are plain text files that contain standard SQL code. You can write your BigQuery queries in a `.sql` file. They don't have any special functionality—they're just a way to save and organize your queries.

Dataform (.sqlx)

Dataform is a **data transformation tool** in Google Cloud. Its job is to manage your data pipeline within BigQuery. 

You write your SQL transformations in files with the **`.sqlx`** extension.

The `.sqlx` file contains your SQL query plus a configuration block that tells Dataform what to do with the query (e.g., create a table, a view, etc.).

Dataform handles:
* **Orchestration:** Running your queries in the correct order based on dependencies.
* **Version Control:** Integrating with Git to track changes to your code.
* **Scheduling:** Running your pipeline on a schedule.


Remember not to confuse it with the SQLX (Rust Library)!!!

* **BigQuery** is the database you're querying.
* You use **SQL files** or **.sqlx files** to write the queries you want to run.
* **Dataform** is the tool you use to manage, orchestrate, and deploy your SQL code to BigQuery. It uses the **`.sqlx`** file extension, but this is unrelated to the Rust library.
* **ORM** is a general concept for application developers, not data engineers.
* The **SQLX** library is a specific ORM for the Rust programming language, completely unrelated to Dataform or your BigQuery workflow.

Dataform's `.sqlx` files are not JavaScript. 

They are a combination of standard SQL and a small configuration block written in **JavaScript** syntax. This is a key detail.

You're correct that Dataform acts like Airflow but is specifically designed for SQL transformations within BigQuery.

**Dataform and JavaScript**

While the core of your work in Dataform is writing SQL, the tool itself uses JavaScript in two main ways:

* **Configuration Blocks:** At the top of each `.sqlx` file, you add a `config { ... }` block. This block uses JavaScript object notation to define settings for the table or view you're creating. It's how you tell Dataform whether to create a table, a view, or a specific type of incremental table.
* **Reusable Code:** Dataform has a feature called **includes** that allows you to write reusable SQL snippets or functions using JavaScript. For example, you can write a JavaScript file to dynamically generate parts of your SQL query, which can make your code more modular and easier to maintain.

Dataform is built on a JavaScript framework, and it compiles your `.sqlx` files into standard SQL. 

You don't need to be a JavaScript expert to use Dataform, as most of your work will still be in SQL.

**Dataform vs. Airflow**

They both orchestrate data pipelines, but they operate at different levels:

* **Airflow** is a general-purpose, **language-agnostic** orchestrator. It's built in Python and can manage workflows that involve Python scripts, shell commands, and various other tasks. Airflow is very flexible, but this flexibility comes with higher complexity and maintenance overhead.

* **Dataform** is a specialized, **SQL-native** orchestrator built for BigQuery. It's simpler to use and maintain because it's focused on one specific task: running SQL transformations. It handles the dependencies and execution plan automatically, so you don't need to write complex orchestration logic.

{{< /details >}}

**Open Source Equivalents:**

Finding a single, perfect open-source equivalent to Dataform is tricky because Dataform combines several functionalities.

However, here are some key open-source tools that provide similar capabilities:

1. **dbt (data build tool):**
    * This is the closest open-source equivalent: *Both tools are designed to do the same thing: transform data in a data warehouse using SQL.*
    * It focuses on data transformations within data warehouses (like BigQuery, Snowflake, and Redshift).
    * It uses **SQL and Jinja templating** for defining transformations.
    * It also supports testing and documentation.

{{< details title="More about DBT 📌" closed="true" >}}

They share a similar core philosophy:

* **SQL-first:** They both let you define your data models and transformations using only SQL.
* **Declarative:** You define the desired state of your data, and the tool figures out the dependencies and execution plan.
* **Version control:** Both are designed to be used with Git, allowing you to track changes to your data models.
* **Modularity:** They both encourage you to break down your transformations into smaller, reusable pieces (models).

The main difference is that dbt is platform-agnostic, meaning it can connect to various data warehouses like BigQuery, Snowflake, or Redshift. Dataform, on the other hand, is a native Google Cloud service built specifically for BigQuery.

{{< /details >}}

2. **Apache Airflow:**
    * This is a workflow orchestration tool that can be used to build and manage complex data pipelines.
    * It allows you to define dependencies between tasks and schedule their execution.
    * While not focused exclusivly on SQL transformation, it is very good at orchestrating those transformations.

3. Others:

* SQLMesh:
    * SQLMesh is an open-source data transformation framework that enables collaborative development and simplified operation of data pipelines.
    * It handles incremental data transformations, data quality testing, and environment promotions.
* Prefect:
    * Prefect is a modern workflow orchestration tool designed to make it easy to build, run, and monitor data pipelines. It has a focus on dynamic workflows.

> In essence, Dataform is a managed service that simplifies the process of building and managing data transformations in BigQuery.

> > **dbt is the strongest open source competitor**, and airflow is the strongest open source competitor for the orchestration portion of dataform.


{{< details title="More about Jinja for DBT 📌" closed="true" >}}

**Jinja templates** are indeed used in Django, but they're not exclusive to it. 

Jinja is a versatile **templating engine** that's used in various contexts, particularly in Python-based web development and data engineering.
* **Purpose:**
    * Jinja is designed to separate presentation logic from application logic.
    * It allows you to create dynamic text output (like HTML, XML, CSV, SQL, etc.) by embedding variables and logic within template files.
* **Key Features:**
    * **Variables:** You can insert dynamic values into templates using placeholders.
    * **Control Structures:** Jinja provides `if` statements, `for` loops, and other control structures to control the flow of template rendering.
    * **Filters:** Filters allow you to modify the output of variables (e.g., formatting dates, converting text to uppercase).
    * **Template Inheritance:** You can create base templates and extend them to create more specific templates.
    * **Macros:** Macros are like functions within templates, allowing you to define reusable chunks of code.
* **Use Cases:**
    * **Web Development:** Generating HTML pages in web frameworks like Django and Flask.
    * **Configuration Management:** Creating dynamic configuration files.
    * **Code Generation:** Generating code based on templates.
    * **Data Engineering:** Generating dynamic SQL queries in tools like dbt.

**dbt and Jinja:**

* In dbt (data build tool), Jinja templates are used to:
    * Create dynamic SQL queries.
    * Define variables and parameters.
    * Implement reusable SQL logic.
    * Manage dependencies between SQL models.

* dbt leverages Jinja's capabilities to make SQL more flexible and maintainable. This allows data engineers to write code that is more like traditional software development, with the ability to reuse portions of code, and to have dynamic variables within the sql.

**In summary:**

* Jinja is a general-purpose templating engine that's used in various applications.
* While it's commonly associated with Django, it's also widely used in other areas, including data engineering with dbt.
* It allows for the dynamic generation of text based files.

{{< /details >}}


#### Google Cloud Composer

**Cloud Composer** is the Google Cloud service that is typically used to orchestrate [**Dataform** jobs](#google-dataform).

While Dataform has its own basic scheduler for simple, recurring tasks, Cloud Composer (which is a managed Apache Airflow service) is the preferred choice for more complex, end-to-end data pipelines.

**Why Cloud Composer is Used for Dataform Orchestration**

The power of using Cloud Composer for this task lies in its ability to manage an entire workflow, not just the Dataform part.

* **Dependency Management**: In a real-world data pipeline, your data transformations in Dataform often depend on other processes. For example, you might need to:
    1.  Load new data from a source into BigQuery.
    2.  Wait for that loading job to complete successfully.
    3.  *Then* trigger the Dataform job to transform the new data.
    Cloud Composer allows you to define these dependencies in a **DAG (Directed Acyclic Graph)**, ensuring that tasks run in the correct order.

* **Integration with Other Services**: A full data pipeline often involves multiple steps using various services. Cloud Composer, with its rich set of Apache Airflow operators, can easily connect all the pieces.
    * **Data Ingestion**: Use an operator to trigger a job in Cloud Data Fusion or a Dataflow pipeline to load data into BigQuery.
    * **Transformation**: Use the **Dataform operator** (or an HTTP request to the Dataform API) to start a Dataform run.
    * **Post-Transformation**: Once the Dataform job is complete, you can use another operator to send an email notification, trigger a BigQuery BI Engine refresh, or update a dashboard in Looker.

* **Observability and Monitoring**: Cloud Composer's Airflow UI provides a single, centralized place to monitor the status of all your jobs. You can see which tasks are running, which have failed, and easily troubleshoot issues by viewing logs.

In short, while Dataform handles the "T" (transformation) of your data, **Cloud Composer is the "E" (orchestration) tool** that makes sure the transformation runs at the right time and in the right order as part of a complete data pipeline. 

**Cloud Composer is to Dataform what Airflow is to a PySpark cluster.**

* **PySpark Cluster** and **Dataform** are the **engine** ⚙️. They are the tools that perform the actual data transformation and computation.
    * **PySpark** uses Python code to perform complex, flexible transformations on a distributed cluster.
    * **Dataform** uses SQLX to perform transformations directly within BigQuery.

* **Airflow** and **Cloud Composer** are the **orchestrators** 🎬. They are the tools that manage, schedule, and monitor the engines.
    * **Airflow** is an open-source platform that orchestrates workflows, often by submitting jobs to a PySpark cluster. It defines dependencies and retries.
    * **Cloud Composer** is Google's managed version of Airflow. It orchestrates pipelines that include Dataform jobs, ensuring they run at the right time and in the correct order relative to other tasks, like data ingestion or dashboard refreshes.

In a modern data stack, a transformation tool (like Dataform or PySpark) and an orchestration tool (like Cloud Composer or Airflow) are both essential, as they handle different aspects of the data pipeline.

#### GCS

**Google Cloud Storage (GCS)** is the cloud-native equivalent of an on-premise object storage solution like MinIO that uses the S3 API. 

Google Cloud Storage (GCS) is a managed, highly scalable, and durable **object storage** service. 

Its primary purpose is to store vast amounts of unstructured and semi-structured data.

In the context of the data stack, **GCS serves as the data lake**.

* **No Compute**: GCS itself doesn't have a built-in compute engine for querying data. It's a pure storage layer.
* **Cost-Effective**: It's designed for low-cost, long-term storage of all data types, making it ideal for the raw data layer.
* **Managed Service**: Unlike MinIO, which you have to deploy and manage yourself, GCS is a fully managed service. Google handles all the hardware, scalability, and security.

**MinIO and S3: The Open-Source Analogue**

**MinIO** is an open-source object storage server that you can deploy on-premise or in your own cloud environment. It's popular because it's **API-compatible with Amazon S3**. This means it can function as a self-hosted alternative to cloud-provider services like GCS or AWS S3.

* **Self-Managed**: You have full control, but also full responsibility for management, maintenance, and security.
* **S3 Compatibility**: Its S3 compatibility is crucial, as it allows it to integrate with a wide ecosystem of tools built for the S3 API.

**The Data Lakehouse Concept**: The term **data lakehouse** is a modern architectural pattern, not a specific tool.

It refers to a platform that combines the **flexibility and low cost of a data lake** (like GCS or MinIO) with the **structure and performance of a data warehouse** (like BigQuery or Snowflake). 

In the Google Cloud stack, the data lakehouse is the combination of:
1.  **Cloud Storage (The Data Lake)**, which stores the raw data.
2.  **BigQuery (The Data Warehouse)**, which provides the structured tables and high-performance SQL engine.

BigQuery's ability to directly query data stored in GCS without having to move it (a process called "federated query") is a core feature that enables this data lakehouse architecture.

Similarly, with the open-source stack, the data lakehouse is the combination of:

1.  **MinIO/S3 (The Data Lake)**, which stores the raw data.
2.  **Snowflake (The Data Warehouse)**, which can query the data directly from S3.

> So, while GCS is the equivalent of a MinIO S3 bucket, **BigQuery + GCS** is the Google Cloud data lakehouse solution, just as **Snowflake + S3** is a common data lakehouse solution in other environments.

**Google Cloud Storage**. The correct sequence of the data storage hierarchy is:

* Tables -> File storage -> Block storage

Tables:  At the highest level, you have tables in a database. 

These tables organize data in a structured format with rows and columns.

* File storage:  Tables are often stored as files on a file system. These files can be organized in various ways depending on the database system.

* Block storage:  File systems themselves are built on top of block storage. Block storage is the most basic level, where data is stored in raw blocks on physical storage devices (hard drives, SSDs, etc.).

{{< callout type="warning" >}}
**Tables are a structured view of data**, which are typically stored as files, and those files reside on block storage.
{{< /callout >}}

The good thing about **GCS** is that you can query the content of its files via **JHub and Pyspark**:

```py
#most likely, they will be avro (row based, ~OLTP) - as GCS is a typical place to store raw or close to raw data
df = spark.read.format("avro").load(
    "gs://cs-some-data/raw/type=datawarehouse-avrodata/environment=prod/deployment=abcd/table=awsometabletoexplore"
)
```

> Pretty similar to [inspecting s3 buckets with python](https://jalcocert.github.io/JAlcocerT/aws-s3-python-boto-queries/) with Boto.

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/guide-python-PySpark/" title="PySpark | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/" title="Telecom | Post ↗" >}}
{{< /cards >}}

#### Big Query

BigQuery is a foundational component of the entire Google Cloud data stack. 

It's a serverless, highly scalable, and cost-effective **data warehouse**. 

You can access it via `console.cloud.google.com`

> Think of it as the central repository where all of your organization's data is stored and made ready for analysis.

Simply speaking, BQ *is just a place where you will run [SQL](https://jalcocert.github.io/JAlcocerT/sql-data-analytics/)*.

But its actually much more than an interface to write your **SQL queries**.

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sql-data-analytics/" title="SQL for D&A ↗ " >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/ChatWithDB" title="Chat with DB via LangChain | Data Chat Repo ↗" >}}
{{< /cards >}}

Remember: Make sure to optimize your queries to avoid costs!

##### Big Query Tricks

Given a table, you should always do cool filters while reading it:

```sql
SELECT * FROM `projectID-on-gcp.dataset_ID.table_ID`
--WHERE TIMESTAMP_TRUNC(ts, HOUR) = TIMESTAMP("2024-04-01T12:00:00") 
--LIMIT 100
```

And you can also script them:

```sh
--This refers to the previous hour
Select TIMESTAMP_SUB(TIMESTAMP_TRUNC('2024-04-01T12:00:00', HOUR), INTERVAL 1 HOUR)
```

When in production, with **dataform**, you might do it with:

```sql
SELECT * FROM `projectID-on-gcp.dataset_ID.table_ID` as abc
WHERE TIMESTAMP_TRUNC(abc.ts, HOUR) = TIMESTAMP_SUB(TIMESTAMP_TRUNC('${dataform.projectConfig.vars.executionDate}', HOUR), INTERVAL 1 HOUR)
```

Check the **Schema of any table** with:

```sql
SELECT column_name, data_type
FROM `projectID-on-gcp.dataset_ID.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'table_ID'
```

Once you know it, you can do some data profiling, like field distribution...:

```sql
SELECT DISTINCT location_id
FROM `projectID-on-gcp.dataset_ID.table_ID`
WHERE location_id IS NOT NULL
LIMIT 3;
```

See how SQL on BQ compares with [PySpark](https://jalcocert.github.io/JAlcocerT/guide-python-PySpark/):

```sql
SELECT
  CASE
    WHEN customer_speed_tier > 500 THEN '500+'
    WHEN customer_speed_tier > 200 THEN '200-500'
    WHEN customer_speed_tier > 100 THEN '100-200'
    WHEN customer_speed_tier > 50 THEN '50-100'
    WHEN customer_speed_tier >= 0 THEN '0-50'
    ELSE 'Other'
  END AS speed_tier_group,
  COUNT(DISTINCT mac_address) AS count_of_mac_addresses
FROM
  `projectID.datasetID.yourtableID`
GROUP BY
  speed_tier_group
ORDER BY
  count_of_mac_addresses DESC;
```

```py
from pyspark.sql.functions import countDistinct, when

speed_tier_df = ss.read.format('delta') \
  .load(f'{hdfs_node}/delta/yourtable')

grouped_df = speed_tier_df.withColumn(
    'speed_tier_group',
    when(speed_tier_df.customer_speed_tier > 500, '500+')
    .when(speed_tier_df.customer_speed_tier > 200, '200-500')
    .when(speed_tier_df.customer_speed_tier > 100, '100-200')
    .when(speed_tier_df.customer_speed_tier > 50, '50-100')
    .when(speed_tier_df.customer_speed_tier >= 0, '0-50')
    .otherwise('Other')
) \
.groupBy('speed_tier_group') \
.agg(
    countDistinct('mac_address').alias('distinct_mac')
) \
.sort('distinct_mac', ascending=False)

grouped_df.show(10)
```

{{< callout type="info" >}}
Remember to always document your queries. For example with [MermaidJS](https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/)! 
{{< /callout >}}

Always **optimize your queries** to avoid unnecesary computing costs!:

```sql
SELECT
  gw_type,
  cm_model,
  idtype,
  COUNT(DISTINCT location_id) AS total_locations_in_group,
  COUNT(DISTINCT CASE WHEN parent_node_type = 'coolstuff' AND child_node_type = 'otherthing' THEN location_id END) AS conditional_locations,
  (COUNT(DISTINCT CASE WHEN parent_node_type = 'coolstuff' AND child_node_type = 'otherthing' THEN location_id END) * 100.0) / COUNT(DISTINCT location_id) AS percentage_kpi
FROM
  `projectID.datasetID.tableID`
WHERE
  ts >= '2025-09-01'
  AND ts < '2025-09-02'
  AND idtype IN ('something', 'another')
  AND gw_type IS NOT NULL
  AND cm_model IS NOT NULL
GROUP BY
  gw_type,
  cm_model,
  idtype
ORDER BY
  total_locations_in_group DESC;
```

If you have a local DB...you can do cool tricks with GenAI to extract insights:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


#### Big Table

**Bigtable** is highly consistent for multi-row updates: TRUE.

{{< callout type="info" >}}
Bigtable is designed for **low-latency**, high-throughput operations and supports atomic row-level mutations, ensuring consistency even with multiple updates. 
{{< /callout >}}

Bigtable has lesser administrative overhead: TRUE. As a fully managed NoSQL database service, Bigtable handles infrastructure management, including scaling, replication, and failover, reducing administrative overhead.

Bigtable is highly scalable: TRUE. Bigtable is designed to scale massively to handle petabytes of data and massive read/write throughput, making it suitable for demanding applications.

#### Google Cloud SQL

Allows the end user to enable automatic backup of data: TRUE. 

Cloud SQL provides the functionality for users to configure and enable automatic backups of their databases.

Cloud SQL enables bug fixing to improve performance: TRUE. Google, as the provider of Cloud SQL, continuously works on bug fixes and performance improvements for the underlying infrastructure and software.

Enable high availability fail over replica: TRUE. 

Cloud SQL supports high availability configurations with failover replicas to minimize downtime in case of an instance failure.


#### Cloud Spanner

* **Consistent Schema**: Cloud Spanner enforces a consistent schema across all of its distributed nodes.
    * This ensures all reads will see the same schema, preventing inconsistencies where different parts of your database have different structures.
    * Schema changes are carefully managed to ensure consistency.

* **Automatic Replication**: Cloud Spanner automatically replicates your data across multiple zones (and optionally, multiple regions) for high availability and fault tolerance.
    * You don't have to manually configure replication.
    * Spanner handles the distribution and synchronization of data behind the scenes, ensuring your database remains available even during outages.

* **Transaction Processing**: Cloud Spanner is specifically designed for high-volume **transaction processing**, making it suitable for applications with demanding transactional workloads, such as those in the retail industry.

* **Distributed Relational Database**: It is a globally distributed, scalable, and strongly consistent database.
    * It combines the benefits of a relational database (structure, ACID properties) with the scalability of a distributed system.

* **CRUD Operations**: Cloud Spanner excels at handling **CRUD** (Create, Read, Update, Delete) operations, which are fundamental to most applications' data management needs.

### Compute Engine

If you are into **linux**, CLI and so on, probably this is the service you have heard of.

Sometime ago, I used **GCP CE [free tier](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#gcp)** to tinker with their **VMs**.

{{< details title="GCE Costs  📌" closed="true" >}}

Google Compute Engine charges are based on Compute Instance: This is fundamental. 

You are charged for the virtual machines (instances) you use, based on their type, size, and how long they run.

Google Compute Engine charges are based on Storage use: You are charged for the storage you use for your virtual machine disks, snapshots, and other data.

Google Compute Engine charges are based on Network use: Network egress (data leaving your instances) is generally charged. Ingress (data coming in) is usually free, but there might be charges for specific services or configurations.

{{< /details >}}

> See [GCP CE](#outro) as server

---

## Conclusions

If you are into DSc, you might be interested to explore Google's **Vertex AI**:

* Model Garden, Vertex AI - https://cloud.google.com/model-garden?hl=es

{{< details title="Looker vs DataForm  📌" closed="true" >}}

Dataform and Looker, along with the `.sqlx` file extension, represent different stages in the modern data stack, but they are highly complementary. 

They work together to create a robust and automated data pipeline and analytics platform, particularly within the Google Cloud ecosystem.

**Dataform: Data Transformation**

**Dataform** is Google Cloud's native tool for building and orchestrating data transformation pipelines. Its primary role is to take raw, messy data from various sources (the "E" and "L" in ETL/ELT) and transform it into clean, reliable, and well-structured tables. These transformed tables are often referred to as a **"curated" or "production" layer** of your data warehouse.

* **`SQLX` files:** This is the key file format for Dataform. A `.sqlx` file is an extension of standard SQL that allows you to define data transformations using a more modular and reusable approach. Think of it as "SQL with superpowers."
    * It's not a new language, but a superset of SQL that lets you add **configuration blocks** to the top of your files to define things like table type (`table`, `view`, `incremental`), dependencies between tables, and data quality tests (`assertions`).
    * This enables you to build a directed acyclic graph (DAG) of your data transformations, ensuring tables are built in the correct order.

**Looker: Data Modeling and Analytics**

**Looker** is a business intelligence platform that sits on top of the transformed data. Its main purpose is to make the curated data accessible and understandable for business users.

* **LookML files (`.lkml`)**: LookML is the proprietary modeling language used by Looker to create a **semantic layer**.
    * It describes the cleaned tables created by Dataform in business-friendly terms.
    * LookML defines dimensions, measures, and the relationships between tables so that users can explore data using a simple, drag-and-drop interface without writing any SQL.

**How They Fit Together**

The relationship between Dataform and Looker is a classic **separation of concerns** in the modern data stack:

1.  **Dataform handles the "T" (Transformation):** Data engineers use Dataform and `SQLX` to build a robust, version-controlled pipeline that consistently cleans, transforms, and loads data into a data warehouse like **BigQuery**. It ensures the data is correct and ready for analysis.
2.  **Looker handles the "M" and "V" (Modeling and Visualization):** Data analysts and business users use Looker and `LookML` to model the transformed tables and create beautiful dashboards and reports. The LookML model acts as a "single source of truth" for all business metrics.

This division of labor provides several benefits:

* **Efficiency**: Data engineers can focus on building and maintaining robust data pipelines, while data analysts can focus on business logic and visualization.
* **Trust**: By using a single, version-controlled pipeline for transformations, you can be sure that the data in your dashboards is always accurate and consistent.
* **Speed**: Business users can get the answers they need quickly by self-serving their own analyses from a well-defined Looker model, without having to wait for a data engineer to write a custom SQL query.

**Using Looker**

Looker is a business intelligence (BI) and data analytics platform that is part of Google Cloud.

It's designed to help organizations explore, analyze, and share their data to make informed business decisions.

* **A "Semantic Layer" BI Tool**: Looker's defining feature is its use of a data modeling language called **LookML**. Instead of directly querying the database, data teams use LookML to create a consistent, centralized data model. This model defines business logic, relationships between tables, and key metrics in a way that is easy for business users to understand.

* **Live Connection to Data**: Looker doesn't copy or store data in its own database. It connects directly to your source database (like Google BigQuery, Snowflake, or others) and generates optimized SQL queries on the fly. This means that users are always working with the most up-to-date, real-time data.

* **User-Friendly Interface**: The platform provides a user-friendly interface that sits on top of the LookML model. Non-technical users can use a drag-and-drop interface to build their own reports and dashboards, knowing that all the underlying metrics are consistently defined.

* **Focus on Collaboration and Governance**: By having a single, governed data model, Looker ensures that everyone in the organization is using the same definitions for key metrics, which prevents data silos and inconsistencies. The use of version control (Git) for LookML projects also facilitates collaboration among data teams.

In essence, Looker acts as a powerful **bridge between a company's raw data and its business users**.

It empowers a wide range of people to explore data, while giving data professionals a scalable and maintainable way to manage and govern their data assets.

{{< /details >}}

### GCP Data Stack in Action

Imagine a modern data pipeline as a factory assembly line....

| Component | Raw Data Location | Who Uses It | What They Do | Primary Purpose |
| :--- | :--- | :--- | :--- | :--- |
| **Cloud Storage (GCS)** | N/A | Data Engineers | Store raw, unstructured, or semi-structured data from various sources (e.g., application logs, flat files, images). | Ingest and store raw data as a "data lake" before processing. |
| **Dataform** | GCS or another source | Data Engineers | Write **SQLX** code to define data transformations and pipelines. They build a directed acyclic graph (DAG) to clean and structure the raw data. | Transform raw data into clean, production-ready tables. |
| **BigQuery (BQ)** | N/A | Data Engineers, Data Analysts (DA), Data Scientists | Act as the central data warehouse. It stores all the clean, transformed data from Dataform, making it available for querying and analysis. DAs can write SQL queries directly against the stored data. | Store and serve all of the organization's trusted, transformed data. |
| **Looker** | BigQuery | Data Analysts, Business Users (BIs) | Use **LookML** to build a semantic layer on top of the BigQuery tables. This layer defines business metrics and dimensions, which are then used by BIs to build dashboards and reports without writing SQL. | Democratize data access and provide a single source of truth for all business metrics. |

...this is how it woud look:

* **Raw Data (The Raw Materials)** 🏭: Data streams in from various sources—your applications, user events, third-party services, and more. This data is often unstructured or semi-structured and needs to be cleaned and organized.

* **Dataform (The Assembly Line)** 🛠️: Dataform processes and transforms these raw materials. Using `SQLX` files, data engineers write code that cleans, standardizes, and enriches the data. The output of these transformations is a set of clean, ready-for-analysis tables. **This is where the magic happens: Dataform writes the transformed data directly into BigQuery.**

* **BigQuery (The Warehouse)** 📦: BigQuery is the destination for all that transformed data. It stores the clean, organized tables created by Dataform in a columnar format that's optimized for analytical queries. It's the central hub where all the final, trusted data assets reside.

* **Looker (The Showroom/Storefront)** 📈: Looker doesn't store any data itself. Instead, it connects directly to the curated tables in BigQuery. Using **LookML**, it creates a semantic layer on top of the data. This layer translates the technical schema of the tables in BigQuery (e.g., `cust_trans_agg`) into business-friendly terms (e.g., "Customer Lifetime Value" or "Daily Sales"). Business users can then use Looker's interface to easily explore and visualize this data without ever having to write a single line of SQL.

In summary, remember that:

1. BigQuery is the durable, high-performance storage engine that powers everything else. 

2. Dataform builds and maintains the tables in BigQuery.

3. And Looker provides the user-friendly interface to query and visualize the data within it.

---

## FAQ

Subqueries and window functions are both powerful tools for advanced SQL queries, but they differ in their use cases and performance.

### Subqueries

A subquery is a query nested inside another query. 

It can be used to return a single value (a scalar subquery) or a set of rows (a table subquery) that the outer query then processes.

Subqueries are often used to filter data based on conditions that depend on other query results.

* **Definition:** A subquery is an inner query that is executed before the main query.
* **Key strength:** Highly flexible for complex filtering and retrieving single aggregate values to be used across all rows.
* **Example:** Calculating a global total to be displayed next to each row of a grouped result.

### Window Functions

A window function performs a calculation across a set of table rows that are related to the current row. 

Unlike a `GROUP BY` clause, a window function doesn't collapse the rows of the main query; it adds a new column to each row.

* **Definition:** A window function performs a calculation on a "window" or set of rows.
* **Key strength:** Efficient for calculating running totals, rankings, moving averages, and other aggregates without collapsing rows.
* **Example:** Ranking customers based on their total sales.

**Comparison**

| Feature | Subqueries | Window Functions |
| :--- | :--- | :--- |
| **Data Aggregation**| Can return a single aggregate value or a new table for the outer query. | Adds a new aggregate column to each row, without collapsing them. |
| **Performance** | Can be less performant if the database re-runs the subquery for each row. | Often more efficient as the calculation is done in a single pass over the data. |
| **Use Case**| Best for filtering or bringing a single scalar value from a separate calculation. | Best for calculations over a related set of rows, such as rankings and running totals. |


The primary difference between a "regular" timestamp filter and a `DATE_TRUNC` filter is **performance**.

The regular timestamp filter is highly efficient, while the `DATE_TRUNC` filter is not, due to how databases use indexes.

---

### Time Filters

#### 1. The Regular TS Filter

This is the standard, most performant way to filter a timestamp column for a specific day.

**Example:**
`WHERE ts >= '2025-08-30' AND ts < '2025-08-31'`

#### Why It's Better

* **Index-Friendly:** This method allows the database to use an index on the `ts` column. The database can quickly find the beginning of the `2025-08-30` time range and then scan only until the beginning of `2025-08-31`. This dramatically reduces the amount of data the database has to read and process. 
* **Exactness:** It's precise, including every millisecond and microsecond within the specified 24-hour period.

---

#### 2. The `DATE_TRUNC` Filter

This method truncates (removes the time portion) from the timestamp column and then compares the result to a date.

**Example:**
`WHERE DATE_TRUNC(connection_date, DAY) = DATE("2025-08-30")`

#### Why It's Inefficient

* **Full Table Scan:** The database **cannot use an index** on the `connection_date` column with this filter. Since the `DATE_TRUNC` function is applied to the column itself, the database must read every single row in the table, apply the function to the `connection_date` value, and then check if the result matches the specified date.
* **Non-Sargable:** The term for this issue is "non-sargable." A query is sargable if it can use an index to find the data. Applying a function to a column in the `WHERE` clause makes the query non-sargable, forcing a much slower full table scan.

In summary, while both filters achieve the same logical result, the difference in their execution can be huge on large datasets. Always use a range filter on the raw timestamp column for optimal query performance.


### Green vs Brown Field

In IT, "Greenfield" and "Brownfield" describe two fundamental approaches to developing, implementing, or migrating systems:

1.  **Greenfield Migration (or Development):**
    * **Concept:** This approach is like building something on a completely **empty, fresh plot of land** (a "green field"). You start from scratch, with no existing infrastructure, legacy systems, code, or data to contend with.
    * **Characteristics:**
        * **Clean Slate:** You have the freedom to design and implement the system using the latest technologies, best practices, and architectures.
        * **No Legacy Debt:** You're not burdened by old code, outdated integrations, or technical debt from previous systems.
        * **Opportunity for Innovation:** Allows for significant re-engineering of processes and workflows.
    * **Pros:** Maximum flexibility, optimized for modern needs, potentially higher long-term efficiency, can adopt cutting-edge solutions.
    * **Cons:** Higher initial cost, longer implementation time, significant effort for data migration (if existing data needs to be brought over), greater need for change management as users adapt to a completely new system.
    * **When to use:** For completely new ventures, when legacy systems are highly fragmented, obsolete, or too complex to adapt, or when a complete overhaul and process re-engineering are desired.

2.  **Brownfield Migration (or Development):**
    * **Concept:** This approach is like renovating or developing on a piece of land that already has **existing structures or infrastructure** (a "brown field"). You work with, or build upon, what's already there.
    * **Characteristics:**
        * **Leverages Existing Assets:** You retain existing data, configurations, customizations, and often, established business processes.
        * **Incremental Change:** It's more of an upgrade or conversion rather than a complete rebuild.
        * **Preserves Investment:** You aim to preserve existing investments in the legacy system.
    * **Pros:** Lower initial cost, faster implementation time (often), less disruptive to ongoing business operations, familiar environment for users, easier integration with existing systems.
    * **Cons:** Carries over legacy debt and inefficiencies, limited opportunity for fundamental process improvement, may not fully leverage the potential of new technologies, harder to innovate or achieve radical simplification.
    * **When to use:** When you need to upgrade or adapt an existing system, when historical data and processes are critical to maintain, or when budget and time constraints favor a less disruptive approach.

In essence:
* **Greenfield = Build new.**
* **Brownfield = Adapt/Upgrade existing.**

### What it is Looker Modelling Language?

LookML (Looker Modeling Language) is a proprietary, domain-specific language used within Looker, which is a business intelligence and data analytics platform that is part of Google Cloud.

**What is LookML?**

* **A Data Modeling Language:** LookML is a language used by data analysts and developers to **define a semantic data model**. This model describes the structure of a SQL database, including the relationships between tables, and the business logic for calculating metrics and dimensions.
* **An Abstraction Layer:** LookML acts as an abstraction layer between a database and the end user. It simplifies the process of querying data by translating user-friendly commands in the Looker interface into complex SQL queries. This means that business users can explore and analyze data without needing to know or write any SQL themselves.
* **Centralized Business Logic:** By defining business logic in LookML, data teams can ensure consistency and accuracy across all reports and dashboards. It provides a "single source of truth" for key performance indicators (KPIs) and business rules.
* **Leverages Software Development Best Practices:** LookML is designed to be modular and reusable. It uses version control (typically Git) to manage changes, allowing multiple developers to work on the same project and ensuring a clear history of changes.

***Key Components of a LookML Project**

A LookML project is a collection of files that work together to create the data model. The main components include:

* **Models:** These files define which tables from the database the project will use and how they should be joined. A model can also expose different data to different users, creating a customized view for a specific business area.
* **Views:** These files describe how to calculate information from each table. Views are where you define **dimensions** (attributes of the data, like columns in a table) and **measures** (aggregate functions like `COUNT`, `SUM`, `AVG`, etc.).
* **Explores:** An "Explore" is a pre-joined set of views that are organized to answer specific business questions. It's the primary interface that business users interact with to build their queries.

**LookML's Role in Google Cloud**

With Looker being a core part of Google Cloud's data and analytics portfolio, LookML is the foundational language that enables its powerful features. It allows organizations to:

* **Build a Unified Data Platform:** Looker, powered by LookML, can connect to a wide variety of data sources, including Google BigQuery, to create a consistent, governed view of data across the enterprise.
* **Democratize Data Access:** By providing a user-friendly interface that sits on top of the LookML model, Looker makes data accessible to a wider audience, including non-technical business users.
* **Optimize Performance:** LookML includes features for optimizing query performance, such as caching policies and derived tables.
* **Enable AI-powered Analytics:** Looker and LookML are being integrated with Google's AI capabilities, such as Gemini, to provide AI-powered assistance for data analysis, modeling, and report creation.

#### What are lkml files?

**.lkml** files are the files that contain **LookML** code. 

They are the building blocks of a Looker project and define the data model that sits on top of your database. 

Looker uses the code in these files to translate user actions in the Looker interface into SQL queries against your database. 

> Think of them as the blueprints that tell Looker how to understand and interact with your data.

**Key Types of .lkml Files**

A typical Looker project is a collection of various `.lkml` files, each serving a specific purpose in building the data model. The most common types include:

* **View files (`.view.lkml`)**: These are the most fundamental files. A **view file** represents a single table or a logical group of columns from your database. It's where you define the individual fields users can interact with. Within a view file, you define:
    * **Dimensions**: These are attributes of the data, like a column in a table (e.g., `product_name`, `order_date`).
    * **Measures**: These are aggregate functions that perform calculations on dimensions (e.g., `count`, `sum`, `average`).

* **Model files (`.model.lkml`)**: A **model file** is the top-level file that defines a specific business area for analysis. It connects to a database and defines which views are available to users. A model file is where you define an **Explore**, which is a pre-joined set of views that allows users to query data from multiple tables at once. 

* **Project Manifest files (`manifest.lkml`)**: This is a single, essential file in every project. It's where you configure project-level settings, like importing files from other projects or defining LookML constants.

* **Dashboard files (`.dashboard.lookml`)**: These files define dashboards using LookML code, providing a version-controlled way to manage and deploy your dashboards.

**How they Work**

LookML files are version-controlled using **Git**, a standard software development practice. 

This allows a team of data analysts to collaborate on a single project, track changes, and roll back to previous versions if needed. 

When a user in the Looker interface runs a query, Looker's SQL generator reads the LookML files, figures out the correct joins and calculations, and then writes a highly optimized SQL query to send to the database. 

This entire process happens seamlessly for the end user, who never sees the underlying SQL.

That's a great question, and it gets to the heart of the difference between different business intelligence tools.

#### Is there a similar language ?

There are a number of open-source projects that offer a similar concept to LookML, often referred to as a "semantic layer" or "metric layer." 

They aim to solve the same problem: providing a single, consistent definition of business metrics across an organization.

Some of the most prominent open-source alternatives are:

* **dbt (data build tool):** While not a BI tool itself, dbt has become the de facto standard for data transformation in the modern data stack. It uses SQL to define and manage data models in a data warehouse. Many BI tools, including open-source ones, can connect directly to dbt models. A key concept in dbt is the "semantic layer," which is a collection of metric definitions (like measures in LookML) that can be used by various front-end tools.

* **Cube.js:** This is a dedicated open-source semantic layer. It's designed to sit between your database and a front-end application (like a dashboarding tool or a custom web app). Cube.js provides a "data schema" that is very similar in concept to a LookML model, where you define dimensions and measures. It's often used for building custom, data-powered applications.

* **Lightdash:** Lightdash is an open-source BI platform that works directly on top of your dbt project. It automatically generates a semantic layer from your dbt models, so you can start creating dashboards and charts without writing a separate modeling language.

> These open-source tools often leverage **YAML** (YAML Ain't Markup Language) for their configurations, which is a common data serialization language that is human-readable and works well with version control.

**Is LKML some kind of Power Query for Power BI?**

Both are designed for data transformation and modeling.

But, there are key differences in their approach and philosophy.

| Feature | LookML (for Looker) | Power Query (for Power BI) |
| :--- | :--- | :--- |
| **Purpose** | **Code-based data modeling.** Defines a **semantic layer** for the entire organization, ensuring consistent metrics and a single source of truth. | **GUI-based data transformation.** A tool for users to **clean and shape** their data before it's loaded into the Power BI data model. |
| **User** | Primarily for **data developers and analysts** who have a good understanding of SQL and database design. | Designed for **business users and data analysts** who may not have a deep technical background. It's very user-friendly with its graphical interface. |
| **Underlying Language** | **LookML**, a declarative, proprietary language. It's like a blueprint that Looker uses to generate SQL queries. | **M Language**, a powerful, functional programming language that runs in the background of the GUI. |
| **Collaboration** | Highly collaborative and version-controlled. LookML projects are stored in **Git repositories**, allowing multiple developers to work together. | Less collaborative by default. While changes can be shared, the workflow isn't as natively integrated with version control systems like Git. |
| **Data Flow** | **Live connection to the database.** LookML generates SQL queries on the fly, so the data is not duplicated or moved. This ensures real-time analytics. | **Import and transform.** Power Query typically pulls data into Power BI's in-memory engine before analysis, though it also supports DirectQuery for some sources. |
| **Primary Use Case**| **Creating a governed, enterprise-wide data platform** where everyone uses the same, trusted definitions for metrics. | **Self-service data prep and analysis.** Excellent for individual users or small teams to quickly get data ready for a dashboard. |

In short, while both LookML and Power Query are essential for data preparation and modeling in their respective ecosystems, they are fundamentally different tools.

**LookML is a centralized, code-first approach for governed, large-scale data modeling.**

**Power Query is a decentralized, GUI-first approach for ad-hoc data transformation and cleaning.**

---

## Outro

### Other Clouds vs GCP

If you were suspecting this, you are right: *different names, kind of same idea under the hood*

![Cloud Comparison](/blog_img/DA/cloud-ecosystem.jpg)


### GCP CE vs SBCs

Before going into the cloud, I got familiar with linux thanks to a raspberry Pi 4.

But there are other single board computers out there, so far I tried:

1. Raspberry Pi 4 2/4GB
2. Orange pi 5 8GB 

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/minipc-vs-pi/" title="Orange vs Raspberry Pi 4" image="/blog_img/hardware/sbcs-x13.jpg" subtitle="Battle of SBCs Benchmarks" >}}
{{< /cards >}}

If you are wondering if you need a Pi or a MiniPC, you can have a look to [this](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/).

Most SBCs (not all) are ARM based CPUs and we will be seeing more and more ARM adoption on cloud providers.


### GCP CE vs Mini PCs

Should you build your homelab, or use google cloud platform compute engine?

Not so long ago I was lucky to try the following mini PCs:

1. [BMax B4](https://jalcocert.github.io/RPi/posts/minipc-vs-pi)
2. Asrock [x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/)
3. [Firebat AK2 Plus](https://jalcocert.github.io/JAlcocerT/firebat-ak2-plus-minipc-review/)


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/" title="Asrock x300" image="/blog_img/mini_pc/bmax_asrockx300.jpg" subtitle="Building a MiniPC as Server" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers" title="BMax B4 Review" image="/blog_img/hardware/bmax-b4.jpg" subtitle="Small Factor x86 MiniPC" >}}
{{< /cards >}}

Mini PCs tend to have **x86** CPU arch.

They tend to behave better if you plan to reproduce high resolution video, but in general, are less efficient as per compute power / Watt.

<!-- https://studio.youtube.com/video/4qLgpJc2Ghs/edit -->

{{< youtube "4qLgpJc2Ghs" >}}