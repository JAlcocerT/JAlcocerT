---
title: "A closer look to Google Cloud Platform"
date: 2025-02-16
draft: false
tags: ["dev"]
description: 'Big Query, Dataform and more about GCP. Compared with other Clouds and OnPrem.'
url: 'understanding-google-cloud-platform'
---

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

You're right, Google Dataform is indeed a data engineering tool. Here's a short explanation:

**Google Dataform:**

* **Purpose:**
    * It's a service for developing, testing, and deploying data transformations within Google Cloud's BigQuery.
    * It helps you manage complex SQL-based data pipelines.
    * It enables version control, collaboration, and automated testing of your data transformations.
* **Key Features:**
    * **SQLX: A SQL extension for defining data transformations**.
    * Dependency management: Automatically handles the order of execution of your SQL queries.
    * Testing: Allows you to write tests to ensure the accuracy of your data.
    * Version control: Integrates with Git for collaborative development.
    * Scheduling: Allows for the scheduling of data pipeline executions.
* **Use Cases:**
    * Building data warehouses and data marts.
    * Performing data transformations for analytics and reporting.
    * Automating data pipelines.

{{< details title="More about SQLX 📌" closed="true" >}}

Yes, that's absolutely true! SQLX, the extension to SQL used by Google Dataform, allows you to embed JavaScript within your SQL files. This is a powerful feature that enables you to:

* **Define variables and parameters:** You can use JavaScript to dynamically define values that are used in your SQL queries.
* **Create reusable logic:** You can write JavaScript functions to encapsulate complex logic that can be reused across multiple SQLX files.
* **Generate SQL dynamically:** You can use JavaScript to generate SQL code based on certain conditions or parameters.
* **Perform data transformations:** While SQL is the primary language for transformations, you can use JavaScript for more complex data manipulation tasks.

Here's a basic idea of how it works:

* Within your SQLX files, you can use `{{ ... }}` to embed JavaScript expressions.
* Dataform's compiler will evaluate these JavaScript expressions and replace them with their results before executing the SQL queries.

**Example:**

```sqlx
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

This capability makes SQLX and Google Dataform very powerful tools for data engineering.


{{< /details >}}

**Open Source Equivalents:**

Finding a single, perfect open-source equivalent to Dataform is tricky because Dataform combines several functionalities.

However, here are some key open-source tools that provide similar capabilities:

* **dbt (data build tool):**
    * This is the closest open-source equivalent.
    * It focuses on data transformations within data warehouses (like BigQuery, Snowflake, and Redshift).
    * It uses **SQL and Jinja templating** for defining transformations.
    * It also supports testing and documentation.
* **Apache Airflow:**
    * This is a workflow orchestration tool that can be used to build and manage complex data pipelines.
    * It allows you to define dependencies between tasks and schedule their execution.
    * While not focused exclusivly on SQL transformation, it is very good at orchestrating those transformations.
* **SQLMesh:**
    * SQLMesh is an open-source data transformation framework that enables collaborative development and simplified operation of data pipelines.
    * It handles incremental data transformations, data quality testing, and environment promotions.
* **Prefect:**
    * Prefect is a modern workflow orchestration tool designed to make it easy to build, run, and monitor data pipelines. It has a focus on dynamic workflows.

In essence, Dataform is a managed service that simplifies the process of building and managing data transformations in BigQuery. **dbt is the strongest open source competitor**, and airflow is the strongest open source competitor for the orchestration portion of dataform.



{{< details title="More about Jinja for DBT 📌" closed="true" >}}

You're right, Jinja templates are indeed used in Django, but they're not exclusive to it. 

Jinja is a versatile **templating engine** that's used in various contexts, particularly in Python-based web development and data engineering.

Here's a breakdown:

**Jinja Templates:**

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


#### GCS

**Google Cloud Storage**

The correct sequence of the data storage hierarchy is:

Tables -> File storage -> Block storage

Tables:  At the highest level, you have tables in a database. These tables organize data in a structured format with rows and columns.

File storage:  Tables are often stored as files on a file system. These files can be organized in various ways depending on the database system.

Block storage:  File systems themselves are built on top of block storage. Block storage is the most basic level, where data is stored in raw blocks on physical storage devices (hard drives, SSDs, etc.).

{{< callout type="warning" >}}
**Tables are a structured view of data**, which are typically stored as files, and those files reside on block storage.
{{< /callout >}}

The good thing about **GCS** is that you can query the content of its files via **JHub and Pyspark**:

```py
#most likely they will be avro (row based, ~OLTP)
df = spark.read.format("avro").load(
    "gs://cs-odh-data/raw/type=datawarehouse-avrodata/environment=prod/deployment=abcd/table=awsometabletoexplore"
)
```

Pretty similar to [inspecting s3 buckets with python](https://jalcocert.github.io/JAlcocerT/aws-s3-python-boto-queries/).

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/guide-python-PySpark/" title="PySpark | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/" title="Telecom | Post ↗" >}}
{{< /cards >}}

#### Big Query

Simply speaking, BQ *is just [SQL](https://jalcocert.github.io/JAlcocerT/sql-data-analytics/)*.

But its actually much more than an interface to write your **SQL queries**.

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sql-data-analytics/" title="SQL for D&A ↗ " >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/ChatWithDB" title="Chat with DB ↗" >}}
{{< /cards >}}

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

Once you know it, you can do some data profiling on the field distribution:

```sql
SELECT DISTINCT location_id
FROM `projectID-on-gcp.dataset_ID.table_ID`
WHERE location_id IS NOT NULL
LIMIT 3;
```

{{< callout type="info" >}}
Remember to always document your queries. For example with [MermaidJS](https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/)! 
{{< /callout >}}

If you have a local DB...you can do cool tricks with GenAI to extract insights:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


#### Big Table

**Bigtable** is highly consistent for multi-row updates: TRUE.

Bigtable is designed for low-latency, high-throughput operations and supports atomic row-level mutations, ensuring consistency even with multiple updates.

{{< callout type="info" >}}
Retirements 
{{< /callout >}}

Bigtable has lesser administrative overhead: TRUE. As a fully managed NoSQL database service, Bigtable handles infrastructure management, including scaling, replication, and failover, reducing administrative overhead.

Bigtable is highly scalable: TRUE. Bigtable is designed to scale massively to handle petabytes of data and massive read/write throughput, making it suitable for demanding applications.

#### Google Cloud SQL

Allows the end user to enable automatic backup of data: TRUE. Cloud SQL provides the functionality for users to configure and enable automatic backups of their databases.

Cloud SQL enables bug fixing to improve performance: TRUE. Google, as the provider of Cloud SQL, continuously works on bug fixes and performance improvements for the underlying infrastructure and software.

Enable high availability fail over replica: TRUE. Cloud SQL supports high availability configurations with failover replicas to minimize downtime in case of an instance failure.


#### Cloud Spanner

Consistent Schema: Cloud Spanner enforces a consistent schema across all of its distributed nodes.  This means that all reads will see the same schema, and you won't encounter inconsistencies where different parts of your database have different structures.  Schema changes are carefully managed to ensure consistency.

Automatic Replication: Cloud Spanner automatically replicates your data across multiple zones (and optionally, multiple regions) for high availability and fault tolerance.  You don't have to manually configure replication.  Spanner handles the distribution and synchronization of data behind the scenes.  This ensures that your database remains available even if some zones experience outages.

Transaction Processing: Cloud Spanner is specifically designed for high-volume transaction processing, making it suitable for applications with demanding transactional workloads like those in the retail industry.

Distributed Relational Database: Cloud Spanner is a globally distributed, scalable, and strongly consistent database. It combines the benefits of a relational database (structure, ACID properties) with the scalability of a distributed system.

CRUD Operations: Cloud Spanner excels at handling CRUD (Create, Read, Update, Delete) operations, which are fundamental to most application's data management needs.

### Compute Engine

If you are into **linux**, CLI and so on, probably this is the service you have heard of.

Sometime ago, I used **GCP CE free tier** to tinker with their **VMs**.

* https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#gcp




{{< details title="GCE Costs  📌" closed="true" >}}


Google Compute Engine charges are based on Compute Instance: This is fundamental. You are charged for the virtual machines (instances) you use, based on their type, size, and how long they run.
Google Compute Engine charges are based on Storage use: You are charged for the storage you use for your virtual machine disks, snapshots, and other data.
Google Compute Engine charges are based on Network use: Network egress (data leaving your instances) is generally charged. Ingress (data coming in) is usually free, but there might be charges for specific services or configurations.

{{< /details >}}




---

## Conclusions

If you are into DSC, you might be interested to explore Vertex AI:

* Model Garden, Vertex AI - https://cloud.google.com/model-garden?hl=es


### Other Clouds vs GCP

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