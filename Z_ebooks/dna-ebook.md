
{{< details title="The Big Data Tech Stack, more clear than ever 📌" closed="true" >}}

1. Data Storage 🗄️

This category compares the foundational storage layers of each stack. It's about where your raw data physically resides.

| Criterion | **HDFS** | **S3 / GCS** | **MinIO** |
| :--- | :--- | :--- | :--- |
| **Type** | Distributed File System | Cloud Object Store | Self-hosted Object Store |
| **Architecture** | Coupled Storage & Compute. Data is stored on the same nodes that process it. | Decoupled Storage & Compute. Storage and processing scale independently. | Decoupled Storage & Compute. Runs on your infrastructure but separates the two functions. |
| **Deployment** | On-premise or in the cloud (IaaS) requiring manual management. | Fully managed cloud service. | Self-hosted on-premise or in any cloud (IaaS). |
| **Scalability** | Scales horizontally by adding more servers to the cluster. | Virtually infinite scalability. You simply use as much as you need. | Horizontally scalable by adding more hardware to your cluster. |
| **Cost** | High initial hardware cost and ongoing operational overhead. | Pay-as-you-go based on storage volume and data access. | Low hardware cost (commodity servers) but high management overhead. |
| **Primary Use Case**| Legacy on-premise batch processing and big data analytics. | Modern cloud data lakes and object-based storage for any data type. | Building a private cloud data lake or avoiding cloud vendor lock-in. |


2. Data Transformation & Orchestration ⚙️

This table compares the tools that handle the "T" (transformation) and "E" (orchestration) parts of the ELT/ETL process.

| Criterion | **Dataform** | **dbt** | **PySpark** | **ADF** |
| :--- | :--- | :--- | :--- | :--- |
| **Core Function** | SQL-based transformation for BigQuery. | SQL-based transformation for any cloud warehouse. | Code-based (Python) distributed data processing. | Visual ETL/Orchestration. |
| **Orchestration** | Basic built-in scheduler. Best used with Cloud Composer. | Basic built-in scheduler. Best used with Airflow. | Requires a separate orchestrator like Airflow or a managed service like Dataproc. | Has a robust, built-in orchestrator with a GUI. |
| **Primary Language**| SQLX (Superset of SQL). | SQL (with Jinja). | Python (with Spark SQL). | Visual GUI (with some SQL/code). |
| **Flexibility** | Limited to BigQuery and SQL-based transformations. | Highly flexible; works with most modern data warehouses. | Highly flexible; can handle complex logic and ML pipelines. | Highly integrated with Azure. Can connect to many sources. |
| **User** | Data Analysts & Analytics Engineers on GCP. | Analytics Engineers & Data Analysts. | Data Engineers & Data Scientists. | Data Engineers & Business Users. |


3. Query Engines & Data Warehouses 📦

This compares the tools that serve as the compute and storage layers for analytics.

| Criterion | **BigQuery** | **Snowflake** | **Trino** | **Spark** |
| :--- | :--- | :--- | :--- | :--- |
| **Type** | Serverless Data Warehouse | Cloud Data Warehouse | SQL Query Engine | General-Purpose Analytics Engine |
| **Architecture** | Separated storage and compute, managed by Google. | Separated storage and compute, managed by Snowflake. | Separate compute layer that queries multiple data sources. | Separate compute layer for distributed processing. |
| **Deployment** | Fully managed service on GCP. | Fully managed service (multi-cloud). | Self-hosted on-premise or in the cloud. | Self-hosted on a cluster or via managed service (e.g., GCP Dataproc). |
| **Primary Use Case**| Scalable, serverless analytics on a massive scale. | Enterprise-grade data warehousing for structured data. | Federated queries across diverse data sources. | ETL, machine learning, and complex transformations. |


4. BI & Visualization 📈

This category compares the tools used by end-users to create dashboards and reports.

| Criterion | **Looker** | **Superset / Redash** | **Grafana** |
| :--- | :--- | :--- | :--- |
| **Core Function** | Semantic Modeling & Visualization. | Visualization & Ad-hoc Querying. | Time-series Monitoring & Visualization. |
| **Data Philosophy**| **Code-first semantic layer**. Data is modeled in LookML for consistency. | **SQL-based visualization**. Users often write their own queries or work from a pre-defined set of queries. | **Monitoring-focused**. Optimized for time-series data from a variety of data sources. |
| **User** | Data Analysts & Business Users. | Data Analysts & SQL-savvy users. | DevOps & Engineers (for system metrics). |
| **Collaboration** | Highly collaborative via Git integration. | Collaborative dashboards via sharing. | Collaborative dashboards and alerting. |
| **Ecosystem** | Google Cloud's official BI tool. | Open-source, flexible, and database-agnostic. | Open-source, widely used for observability and metrics. |

5. Table Format & Catalog 📋

Apache Iceberg and Project Nessie are key components of a modern, open-source data lakehouse architecture. They don't fit neatly into the previously defined categories because they represent a different layer of the stack: **the table format and the catalog**.

See the tools that bring structure, transactions, and version control to a data lake.

| Criterion | **Apache Iceberg** | **Project Nessie** |
| :--- | :--- | :--- |
| **Type** | Open-source **Table Format** | Open-source **Data Catalog** |
| **Core Function** | Defines how data files in a data lake are organized to act as a database-like table. | A Git-like central registry for managing metadata and versions for all your tables. |
| **Primary Use Case**| Enables ACID transactions, time travel, and schema evolution on a single table in a data lake. | Manages multi-table transactions, data branching, and version control for the entire data lake. |
| **Data Philosophy**| Brings database-like reliability and performance to data lakes. | Brings software development best practices (Git) to data management and governance. |
| **Relationship** | **A table format.** It's the "engine" that enables a single table to have ACID properties and time travel. | **A catalog.** It's the "control plane" that manages the state of many Iceberg tables using branches, commits, and tags. |
| **Deployment** | Not a service. It's a library or a specification used by engines like Spark, Flink, and Trino. | Can be run as a Docker container, on Kubernetes, or as a managed service. |
| **Who Uses It** | Data Engineers & Analytics Engineers. | Data Engineers, Analytics Engineers, & Data Scientists (for branching). |


{{< /details >}}

{{< details title="Nessie and Apache Iceberg were really cool 📌" closed="true" >}}

Project Nessie and Apache Iceberg are designed to work very well together, and Nessie can indeed be used on top of Iceberg. 

* **Apache Iceberg:**
    * This is a table format for massive analytic datasets. It brings table-like capabilities to data lakes, enabling features like ACID transactions, schema evolution, and time travel.
    * Essentially, Iceberg helps organize your data lake into tables that behave more like traditional database tables.

* **Project Nessie:**
    * Nessie provides Git-like version control for your data lake. It allows you to create branches, commits, and tags for your data, making it easier to manage changes and collaborate.
    * In the context of Iceberg, Nessie acts as a catalog that tracks the metadata of your Iceberg tables. This allows you to version the state of your tables, not just the underlying data files.

**How They Work Together:**

* Nessie enhances Iceberg by providing a way to manage the metadata of Iceberg tables. This means you can:
    * Create branches to experiment with data transformations without affecting the production data.
    * Roll back to previous versions of your tables if needed.
    * Collaborate with others by merging changes from different branches.

> In essence, Iceberg provides the table format, and Nessie provides the version control layer on top of those tables. 

> > This combination creates a powerful and flexible **data lakehouse architecture**.

{{< /details >}}


{{< details title="Nessie and Apache Iceberg were really cool | HDFS and PySpark 📌" closed="true" >}}

Project Nessie and Apache Iceberg are designed to work very well together, and Nessie can indeed be used on top of Iceberg. 

* **Apache Iceberg:**
    * This is a table format for massive analytic datasets. It brings table-like capabilities to data lakes, enabling features like ACID transactions, schema evolution, and time travel.
    * Essentially, Iceberg helps organize your data lake into tables that behave more like traditional database tables.
* **Project Nessie:**
    * Nessie provides Git-like version control for your data lake. It allows you to create branches, commits, and tags for your data, making it easier to manage changes and collaborate.
    * In the context of Iceberg, Nessie acts as a catalog that tracks the metadata of your Iceberg tables. This allows you to version the state of your tables, not just the underlying data files.

**How They Work Together:**

* Nessie enhances Iceberg by providing a way to manage the metadata of Iceberg tables. This means you can:
    * Create branches to experiment with data transformations without affecting the production data.
    * Roll back to previous versions of your tables if needed.
    * Collaborate with others by merging changes from different branches.

> In essence, Iceberg provides the table format, and Nessie provides the version control layer on top of those tables. 

> > This combination creates a powerful and flexible **data lakehouse architecture**.

* **HDFS + PySpark:**
    * This is a more traditional big data stack, often used in on-premises deployments. HDFS stores the data, and PySpark allows for Python-based data processing.

* **Databricks + S3:**
    * This is a common cloud-based stack. Databricks provides the processing power (Spark), and S3 serves as the scalable data lake.

* **MinIO + Apache Iceberg + Nessie:**
    * This stack focuses on open-source technologies. MinIO provides object storage, Iceberg enables efficient data lake management, and Nessie adds version control (and time travel)

{{< /details >}}


{{< details title="Core Components of a Data Analytics Tech Stack 📌" closed="true" >}}

* **Data Storage:**: This is where the raw and processed data resides. Common options include:
    * **Cloud Storage:** Amazon S3, Google Cloud Storage (GCS), Azure Blob Storage.
        *  These are highly scalable and cost-effective **object stores** that serve as the foundation of cloud-native **data lakes**.
        * **Object Storage:** MinIO, which is an open source object storage solution that is S3 API compatible.
    * **Data Lakes:** HDFS (Hadoop Distributed File System), which is often used in on-premises or hybrid environments.
        * You will find format like: `avro`, `parquet` and `delta`.
    * **Data Warehouses:** Snowflake, Google BigQuery, Amazon Redshift or Azure Synapse. These are optimized for analytical queries.

* **Data Processing:**  These tools transform and prepare data for analysis:
    * **Apache Spark:** A powerful distributed processing engine used for large-scale data transformation and analysis. It includes modules like **Spark SQL** for structured data, **Spark Streaming** for real-time data, and **MLlib** for machine learning.
    * **Databricks:** A cloud-based platform built on Apache Spark, providing a collaborative environment for data engineering, data science, and machine learning. 
        * It also offers features like **Delta Lake** for data reliability and **MLflow** for managing the machine learning lifecycle.
    * **SQL-based tools:** These are essential for querying and manipulating data in data warehouses. This category includes modern tools that use SQL for transformations:
        * **dbt (data build tool):** A transformation tool that enables data analysts and engineers to transform data in their data warehouses more effectively. It allows for modular SQL code and follows software engineering best practices.
            * Dbt wont move the data for you, so you need an orchestration tool like ADF or TalenD
        * **Dataform:** Google's equivalent of dbt, used for transforming data in BigQuery using **SQLX**.

* **Data Orchestration:**
    * These tools manage the flow of data through the pipeline:
        * **Apache Airflow:** A platform for programmatically authoring, scheduling, and monitoring workflows.
            * It defines pipelines as **Directed Acyclic Graphs (DAGs)**.
        * **Cloud Composer:** Google Cloud's fully managed version of Apache Airflow, which simplifies its deployment and management.
        * **Azure Data Factory (ADF):** Microsoft's visual ETL and orchestration service, offering a code-free approach to building data pipelines within the Azure ecosystem.

* **Data Catalog and Governance:** These tools help manage and govern data assets:
    * **Apache Iceberg:** An open table format for large analytic datasets. It provides features like **ACID transactions**, schema evolution, and time travel.
        * See also Delta Lake Format: https://delta.io/ which is some kind of .parquet with enhance time travel capabilities
    * **Project Nessie:** Provides **Git-like capabilities** (branches, commits, tags) for data lakes, working in conjunction with table formats like Apache Iceberg to provide full data versioning and governance.
    * **Apache Hive Metastore:** A central repository for metadata, primarily used in the Hadoop ecosystem. It stores schema and location information for Hive tables.

```py
df = spark.read 
    .format("delta")
    .option("timestampAsOf", "2025-12-01") 
    .load("/path/to/my/table") 
```

* **Data Visualization and Business Intelligence (BI):**
    * These tools allow users to explore and visualize data:
        * **Tableau, Power BI, Looker:** Popular BI platforms for creating dashboards and reports.

**Key Considerations:**

* The choice of tech stack depends on factors such as:
    * The volume and velocity of data.
    * The specific analytical needs of the organization.
    * Budget constraints.
    * Whether the deployment is on-premises, cloud-based, or hybrid.

{{< /details >}}



{{< callout type="info" >}}
You can plug to those stacks interesting tools like superset or ([Open Data Hub](https://datahubproject.io/docs/docker/))
{{< /callout >}}

{{< details title="DWH vs Databases 📌" closed="true" >}}

The data modeling approach is a primary differentiator between the two systems: DB vs DWH.

A data warehouse can be thought of as a specialized database with its tables designed in a way that prioritizes analytical performance over transactional efficiency.

You can turn a PostgreSQL database into a data warehouse with proper data modeling and optimization, especially for small to medium-sized data volumes. While it wasn't designed for this purpose, its flexibility and extensibility make it a viable option for many use cases.

The key is to change how you approach the database from a **transactional (OLTP)** mindset to an **analytical (OLAP)** one.

**Data Modeling and Schema**

The most critical step is to use an analytical data model.

* **Star Schema**: Instead of the highly normalized schema used for OLTP, you would model your data using a star schema. This design separates data into a central **fact table** (which contains measurements like sales or transactions) and multiple, smaller **dimension tables** (which contain context like product, customer, or time). This structure makes analytical queries much more efficient. 

* **Denormalization**: You would also intentionally denormalize your data. This means duplicating some data to avoid complex joins, which are performance-killers in an analytical context.


**Facts vs. Dimensions**

The core of data warehousing is separating data into **facts** and **dimensions**. 

Think of it as answering the questions "What happened?" and "In what context did it happen?".

* **Facts** are the **measurable events** or metrics of a business process. They are the **"what happened"** of your data. Facts are typically numerical values that can be counted, summed, or averaged. They are stored in a **fact table**, which is often very large and contains a row for every single event or transaction.

    * **Example**: In a retail company, a fact would be a **sale**. The fact table would store the **sales amount**, `quantity sold`, or `profit` for each transaction.

* **Dimensions** provide the **context** for the facts. They are the **"who, what, where, when, and how"** of your data. Dimensions contain descriptive attributes that you use to filter, group, and analyze your facts. They are stored in **dimension tables**, which are usually much smaller than fact tables.

    * **Example**: For that same retail sale, the dimensions would be the `Product` (what was sold), `Customer` (who bought it), `Store` (where it was sold), and `Date` (when it was sold). The dimension tables would contain descriptive information like the `product_name`, `customer_name`, `store_location`, and `date_of_week`.

The fact table's rows link to the dimension tables using foreign keys. This allows you to answer analytical questions like, "What was the total sales amount (`fact`) for Nike brand products (`dimension`) in the last quarter (`dimension`)?" 


**Optimizations and Extensions**

In addition to data modeling, you would need to implement several optimizations and use extensions to overcome PostgreSQL's native limitations for large-scale analytics:

* **Partitioning**: For very large tables, you would use **table partitioning** to split data into smaller, more manageable pieces based on criteria like date or region. This allows queries to scan only the relevant partitions, drastically improving performance.
* **Materialized Views**: You can create **materialized views** to pre-compute and store the results of complex queries. This is perfect for dashboards and reports that are run frequently, as users can query the pre-calculated view instead of the raw data.
* **Parallelism**: Since PostgreSQL v10, it has supported parallel query execution. You can tune settings to allow the database to use multiple CPU cores to process large, complex queries faster.
* **Extensions**: PostgreSQL's power lies in its extensions. Extensions like **Citus** can turn a single PostgreSQL instance into a distributed database cluster, allowing it to scale horizontally for massive datasets. Other extensions, like `cstore_fdw`, can provide **columnar storage**, which is natively optimized for analytical workloads by allowing queries to read only the specific columns they need.

{{< /details >}}


{{< details title="DWH, Kimball and layers/medallion 📌" closed="true" >}}

Ralph Kimball and the Kimball Methodology

**Ralph Kimball** is a giant in the data warehousing world. 

He is one of the two main pioneers, along with Bill Inmon, who shaped the field.

The "Kimball" you're referring to is his **methodology for designing data warehouses**. His approach is often called the **bottom-up approach** and is centered around **dimensional modeling**.

The core ideas of the Kimball methodology are:

1.  **Start with the business process.** You identify a specific business process (like sales, inventory, or billing) and build a data mart around it.
2.  **Use dimensional models.** The data is organized into a **star schema** or **snowflake schema**. This involves a central **fact table** (containing quantitative measures like sales amount) surrounded by **dimension tables** (containing descriptive attributes like product name, customer demographics, and date).
3.  **Use conformed dimensions.** This is a key concept. Kimball advocated for creating "conformed dimensions," which are master dimension tables (e.g., a single "Product" dimension or "Customer" dimension) that are shared across multiple data marts. This ensures consistency and allows analysts to "drill across" different business processes.

The Kimball approach is known for being agile and delivering business value quickly because it focuses on building out specific data marts iteratively.

**DWH Layers and Medallion Architecture**

Yes, data warehouses and data lakes often have layers, but the "medallion architecture" is a more recent pattern, primarily associated with **data lakes** and **data lakehouses**.

Traditional data warehouses have a layered architecture, which typically includes:

* **Staging Layer**: A temporary area where raw data is landed before it is cleaned and transformed.
* **Data Warehouse Core**: The central repository where the cleaned, integrated data is stored, often in a normalized form (Inmon's approach) or in a dimensional model (Kimball's approach).
* **Data Marts**: Subsets of the data warehouse core that are designed for specific departments or business functions, often using a dimensional model to support fast reporting.

The **Medallion Architecture** is a modern, three-tiered data design pattern for data lakehouses, with a clear focus on data quality and governance.

It's often implemented using technologies like Delta Lake on platforms like Databricks. The three layers are:

1.  **Bronze (Raw) Layer**: This is the landing zone. Data is ingested from source systems and stored in its original format with no transformations. The purpose of this layer is to have a complete and immutable copy of the source data, which is great for auditing and reprocessing.

2.  **Silver (Cleaned/Enriched) Layer**: Data from the Bronze layer is cleansed, validated, and often integrated. This is where you might apply data quality rules, deduplicate records, and join data from different sources to create an "enterprise view" of key entities (like customers or products).

3.  **Gold (Curated) Layer**: This is the final, business-ready layer. Data from the Silver layer is aggregated and modeled into consumption-friendly formats, often using a dimensional model (like a star schema). This layer is optimized for fast queries and is where business analysts and data scientists would build their reports and dashboards.


The connection between these concepts is that they are both **architectural patterns** for building data systems.

* **Kimball** is a **methodology for modeling the data** that goes *into* a data warehouse, especially for the final, user-facing layers (the data marts). His focus is on the star schema and making data understandable for business users.

* **The Medallion Architecture** is a **pattern for structuring a data pipeline** and a data lake/lakehouse. It's a way of thinking about the flow of data and its progressive refinement. The Gold layer in the Medallion architecture is where you would typically apply the Kimball-style dimensional modeling to make the data usable for analytics.

So, you could build a data lakehouse with a Medallion architecture, and then, in the Gold layer, you would use Ralph Kimball's dimensional modeling techniques to organize your data into star schemas.

{{< /details >}}


{{< details title="Data Modelling for OLTP vs OLAP 📌" closed="true" >}}

**Data Modeling: 3NF vs. Star/Snowflake**

* **Third Normal Form (3NF)**: This is the standard for **OLTP databases**. The goal of normalization is to minimize data redundancy by splitting data into many related tables. This makes write operations (`INSERT`, `UPDATE`, `DELETE`) very fast and efficient because you only have to modify data in one place. However, to retrieve data for a report, you often need to perform many complex joins across numerous tables, which can be slow. 

* **Star and Snowflake Schemas**: These are the standard for **OLAP databases** and data warehouses. Their goal is the opposite of 3NF: to optimize for **fast reads** and analytical queries by reducing the number of joins. They do this by **denormalizing** data. The star schema is the simplest form, with a central **fact table** surrounded by dimension tables. The snowflake schema is a more normalized version of the star, with dimensions that are themselves normalized. While this design introduces some data redundancy, it makes it much faster to run complex queries for reporting and business intelligence. 



| Feature | Databases (Transactional) | Data Warehouses (Analytical) |
| :--- | :--- | :--- |
| **Purpose** | **Online Transaction Processing (OLTP)** for daily operations and transactions. | **Online Analytical Processing (OLAP)** for business intelligence and reporting. |
| **Data Type** | Real-time, current data. | Historical, aggregated data. |
| **Data Model** | **Normalized** schema to reduce redundancy. | **Denormalized** schema (e.g., Star/Snowflake) for fast querying. |
| **Operations** | Frequent **writes, updates, and deletes**. | Primarily **reads**. Data is loaded in large batches (ETL/ELT). |
| **Performance** | Optimized for fast, specific transactions. | Optimized for complex, long-running queries on large datasets. |
| **Users** | Many concurrent users, typically employees or customers. | Fewer users, typically analysts, and business professionals. |


**Transactional Database**

* **OLTP**: Online Transaction Processing.
* **Normalized**: Data is structured to eliminate redundancy.
* **Reads/Writes**: Frequent and balanced operations.
* **Current State**: Focused on the present data.
* **Atomicity**: Transactions are either fully completed or not at all.
* **Entity-Relationship Model**: Common data modeling approach.
* **Third Normal Form**: A database design standard to reduce data redundancy. ~ Wide Table.

**Data Warehouse**

* **OLAP**: Online Analytical Processing.
* **Denormalized**: Data is structured for efficient querying.
* **Reads**: Read-heavy operations.
* **Historical Data**: Data is stored over time.
* **ETL/ELT**: The process of loading data from source systems.
* **Star Schema**: A dimensional data model with a central fact table.
* **Aggregate**: Summary data created from detailed data.

PostgreSQL as a Hybrid System

Yes, you can use PostgreSQL for both purposes. 

PostgreSQL is a powerful and flexible relational database that can be configured to serve as a **hybrid transactional/analytical processing (HTAP)** system.

For a long time, the traditional approach was to keep OLTP and OLAP systems completely separate due to their conflicting needs. 

You would use a system like PostgreSQL for your operational data and then periodically move that data into a specialized data warehouse (like Teradata or a cloud-based one like Snowflake or BigQuery) for analysis.

However, modern PostgreSQL, with features like **partitioning, materialized views, parallel query execution, and extensions (e.g., Citus)**, can handle analytical workloads on a single instance.

While it may not be as performant as a massively parallel processing (MPP) data warehouse for petabyte-scale data, it is a very cost-effective and flexible solution for many use cases.

By creating a separate schema with a star or snowflake model, you can effectively run an analytical layer on the same database that handles your operational transactions, especially for small to medium-sized businesses.


{{< /details >}}


{{% details title="OLAP - First STAR, then SNOWFLAKE 🚀" closed="true" %}}

Star and snowflake schemas are both popular dimensional modeling techniques for data warehouses, but they differ in how they structure and normalize their dimension tables.

The choice between them is a trade-off between query performance, storage efficiency, and data maintenance.

**Star Schema ⭐**

The **star schema** is the simplest and most widely used dimensional model. It consists of a single, central **fact table** directly connected to multiple **denormalized** dimension tables. The structure resembles a star, with the fact table at the center and the dimensions radiating outwards.

* **Denormalization**: Dimension tables are flat and contain all descriptive attributes. For example, a `Product` dimension table might have columns for `product_id`, `product_name`, `category`, and `brand` all in one table. This leads to **data redundancy**, as the `category` name would be repeated for every product in that category.
* **Performance**: Queries are very fast because they require only a single join between the fact table and the dimension tables. This simplicity is ideal for reporting tools and ad-hoc analysis.

**Example: A Retail Sales Data Mart**

The `Sales Fact` table records each transaction and contains foreign keys to the dimension tables, plus numerical measures. The dimension tables are a single, flat table for each entity.

* `Sales Fact` table: `transaction_id`, `date_key`, `product_key`, `customer_key`, `store_key`, `quantity_sold`, `total_sales`.
* `Date Dimension` table: `date_key`, `date`, `month`, `year`, `quarter`.
* `Product Dimension` table: `product_key`, `product_name`, `category`, `brand`.
* `Customer Dimension` table: `customer_key`, `customer_name`, `city`, `state`, `country`.

**Snowflake Schema ❄️**

The **snowflake schema** is a more complex variation of the star schema. It is a more **normalized** model where the dimension tables themselves are broken down into sub-dimensions. 

This reduces data redundancy and storage space but increases the number of joins required for queries. 

The structure resembles a snowflake due to the branching of dimension tables.

* **Normalization**: Dimension tables are organized hierarchically. For example, instead of a single `Product` dimension, you might have a `Product` table that links to a separate `Category` table and a `Brand` table.
* **Performance**: Queries are generally slower because they require more joins to traverse the different dimension tables to get all the descriptive data.

**Example: A Retail Sales Data Mart (Snowflake)**

The fact table remains the same, but the dimension tables are now normalized.

* `Sales Fact` table: `transaction_id`, `date_key`, `product_key`, `customer_key`, `store_key`, `quantity_sold`, `total_sales`.
* `Date Dimension` table: `date_key`, `date`, `month_key`.
* `Month Dimension` table: `month_key`, `month`, `year`.
* `Product Dimension` table: `product_key`, `product_name`, `category_key`, `brand_key`.
* `Category Dimension` table: `category_key`, `category_name`.
* `Brand Dimension` table: `brand_key`, `brand_name`.

**Key Differences at a Glance**

| Feature | Star Schema ⭐ | Snowflake Schema ❄️ |
| :--- | :--- | :--- |
| **Structure** | A central fact table with a single layer of denormalized dimensions. | A central fact table with normalized dimensions that have sub-dimensions. |
| **Normalization** | Denormalized. | Normalized. |
| **Data Redundancy** | High, as data in dimension tables can be repeated. | Low, as data is stored only once. |
| **Query Performance** | Faster, as it requires fewer joins. | Slower, as it requires more joins. |
| **Storage** | Uses more storage space due to redundancy. | Uses less storage space. |
| **Complexity** | Simple to design, implement, and understand. | More complex to design and maintain. |

Normalization and the number of tables can be tricky.

In the context of **transactional databases (OLTP)**, normalization breaks a single, wide table into multiple smaller tables to reduce redundancy.

However, the opposite is true for star and snowflake schemas in a data warehouse context.

The difference lies in what they are normalizing.

**Normalization and Number of Tables**

* **OLTP Normalization (e.g., to 3NF)**: The goal is to reduce data redundancy within a single business domain. You start with a wide, redundant table and break it down into multiple, more focused tables. This **increases the number of tables**.

* **Star Schema (Denormalization)**: The goal is to flatten a potentially complex, multi-table structure into a single **denormalized** dimension table. This process **reduces the number of tables** for a specific dimension. The star schema is a highly denormalized version of a normalized schema.

* **Snowflake Schema (Normalization)**: The snowflake schema takes the star schema's denormalized dimension tables and **re-normalizes them**. This breaks the single dimension table into multiple, smaller sub-dimension tables. This process **increases the number of tables** and introduces more joins.

**Why Snowflake Requires More Joins 🔗**

The reason a snowflake schema requires more joins is because of its **normalized dimension tables**.

A star schema's dimension tables are flat. 

For example, a single `Product` dimension table might contain `product_key`, `product_name`, `category_name`, and `brand_name`. 

To run a report on sales by category, you just join the `Sales Fact` table to the `Product` dimension table—one join.

A snowflake schema, however, breaks that single `Product` dimension table into multiple tables to reduce redundancy. For example:

* A `Product` table with `product_key`, `product_name`, `category_key`, and `brand_key`.
* A separate `Category` table with `category_key` and `category_name`.
* A separate `Brand` table with `brand_key` and `brand_name`.

To run the same report on sales by category, you now need to join the `Sales Fact` table to the `Product` table, then join the `Product` table to the `Category` table.

That's at least two joins. 

As the dimensions become more complex and are broken down further, the number of joins can increase significantly, which can slow down query performance.

The data redundancy you avoid in a snowflake schema is the **repetition of descriptive attributes** within a dimension table.

In our retail example, a **star schema's** `Product Dimension` table would store the `brand` and `category` name repeatedly for every single product in that brand or category.

If a brand like "Nike" has 10,000 products, the text string "Nike" would be duplicated 10,000 times in that single dimension table.

A **snowflake schema** avoids this by creating a separate `Brand` table and `Category` table.

The `Product` table would then just store a foreign key to the `brand_key` and `category_key`.

This means the text string "Nike" is only stored **once** in the `Brand` table, and all 10,000 Nike products point to it. 

This reduces storage space and ensures data integrity, as a change to the brand name only needs to be made in one place.

While a snowflake schema reduces the redundancy of text-based attributes (like a category or brand name), it introduces a new kind of overhead: **storing foreign keys**. This is the core trade-off.

The Trade-off: Storing Keys vs. Repeating Strings

You're right, the key itself takes up space. A foreign key (typically an integer or a small string) is stored in the dimension table for every record.

However, the space saved by avoiding the repetition of long strings is usually much greater than the space taken by storing the integer keys.

Let's use a simple example to illustrate this:

| Star Schema | Snowflake Schema |
| :--- | :--- |
| **`Product` Dimension Table** | **`Product` Dimension Table** |
| `product_id` (int) | `product_id` (int) |
| `product_name` (varchar) | `product_name` (varchar) |
| `brand_name` (varchar, e.g., "Nike") | `brand_key` (int) |
| `category_name` (varchar, e.g., "Footwear") | `category_key` (int) |

Let's say a brand name is an average of 10 characters, and a category name is an average of 10 characters. A product dimension table with 100,000 products would have to store `brand_name` and `category_name` 100,000 times, a total of 2 million characters of redundant data.

In a snowflake schema, you'd store the brand and category names just **once** in their own tables. The 100,000 products would each store a small integer key (4 bytes) for the brand and category, which totals 800,000 bytes. This is a significant reduction in storage.

The Star Schema's Argument

Despite the storage trade-off, the **star schema is often preferred** for its superior query performance. 

In a star schema, you only need one join to get all the descriptive information for a fact. 

In a snowflake schema, you might need two, three, or even more joins to get the same information, which can slow down query execution, especially on very large fact tables.

For data warehouses, where the primary use case is reading and analyzing vast amounts of data, the performance benefit of fewer joins often outweighs the small savings in storage and the minor improvement in data integrity that a snowflake schema offers.

>  This is why the star schema is considered the standard for dimensional modeling.

{{% /details %}}


So...this is everything I could tell right now about Data Modeling for Databases and Data Warehouses.

**OLTP vs. OLAP Schemas......**

**3NF for OLTP**

**3NF is the standard for transactional (OLTP) databases.** Its primary goal is to **reduce data redundancy** by decomposing data into many normalized tables. This design is optimized for fast, reliable **write** operations (CRUD) and is essential for maintaining data integrity in real-time, high-volume transactional systems.

**Star vs. Snowflake for OLAP**

For analytical (OLAP) workloads, the priority shifts from writes to **reads**. The goal is to make it easy and fast to query large volumes of historical data.

* **Star Schema is the preferred choice for OLAP.** It prioritizes **read performance** by using a simple, denormalized structure with a central fact table and flat dimension tables. The result is fewer joins, which significantly speeds up complex analytical queries. While this design introduces data redundancy, the benefit of faster query execution almost always outweighs the extra storage space in a data warehouse context.
* **Snowflake Schema is a compromise.** It is a more normalized version of the star schema, which **reduces data redundancy** and therefore **lowers storage space**. However, this comes at the cost of **increased complexity** and **poorer read performance** because analytical queries require more joins to connect the fragmented dimension tables. An organization might choose a snowflake schema if storage costs are a major concern or if they need to enforce a higher level of data integrity in their dimensions.


**Data Formats for Different Workloads**

Generally speaking, Avro (row-oriented) is better for **writes**, and Parquet (columnar) is better for **reads**.

This is the fundamental trade-off between the two formats and is directly tied to their internal data organization.

**Avro (Row-Oriented)**

Avro stores data records row by row. This structure is ideal for **fast writes** and data serialization because it allows you to write an entire record to a file in a single operation. 

Avro is typically used in scenarios where writes are frequent and real-time, and data needs to be easily and reliably exchanged between different systems. This makes it a great fit for a data lake's **ingestion or raw layer**, especially in streaming and messaging pipelines.

Here are the primary use cases for Avro:

* **Streaming and Messaging Systems**: Avro is the preferred format for platforms like **Apache Kafka, Apache Flink, and Apache Spark Streaming**. Its row-oriented nature allows it to efficiently serialize and deserialize data records as they arrive in a continuous stream. Unlike columnar formats, Avro doesn't need to buffer a large block of records to arrange them by column, making it ideal for the low-latency requirements of streaming applications.

* **Data Ingestion and ETL/ELT**: In a modern data architecture, Avro is often used in the **initial stages of a data pipeline**. Data is ingested from various sources (like application logs or APIs) and stored in a raw layer in Avro format. This raw data is then cleaned and transformed into a columnar format like Parquet for analytical purposes. This is because Avro's rich schema and strong support for schema evolution make it robust for handling the messy, raw data that can change over time.

* **Schema Evolution**: Avro has a robust system for **schema evolution**, which is a key advantage. This means you can add new fields or remove old ones from your data schema without breaking existing data pipelines or applications. When a reader processes an Avro file, it uses the writer's schema and the reader's schema to resolve any differences, ensuring backward and forward compatibility. This is crucial for systems that evolve frequently.

**Parquet (Column-Oriented)**

Parquet is the go-to format for the analytical layers of a data lake, specifically the **Silver** and **Gold layers**.

* **Bronze Layer (Raw Data)**: This is the landing zone where raw data is often stored in its original format. As discussed, **Avro** is a common choice here, especially for streaming data, because it's optimized for fast writes and provides strong schema evolution support.
* **Silver Layer (Cleaned & Enriched Data)**: Once data is cleaned and validated, it's typically converted into **Parquet**. This layer is where you start to prepare data for analysis. The columnar nature of Parquet makes it perfect for the subsequent transformation and enrichment steps, as you can efficiently read specific columns to join and filter data.
* **Gold Layer (Curated & Business-Ready Data)**: This is the final layer where data is modeled into star or snowflake schemas. **Parquet** is the ideal format for this layer because it's designed for the type of large-scale, complex analytical queries that business intelligence tools run. The columnar storage allows query engines to read only the necessary columns from these fact and dimension tables, dramatically speeding up reporting and dashboarding.

The flow from Avro to Parquet is a common pattern in data lake architecture:

1.  **Ingestion**: Raw data lands in the Bronze layer, often as Avro files.
2.  **Transformation**: The raw data is processed, cleaned, and converted into Parquet files in the Silver layer.
3.  **Consumption**: The prepared Parquet data is then used in the Gold layer for fast, optimized analytics.

This layered approach, often called the Medallion Architecture, leverages the strengths of each format: Avro for robust data ingestion and Parquet for efficient data analysis.