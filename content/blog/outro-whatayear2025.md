---
title: "What a Year...2025"
date: 2025-12-30
draft: false
tags: ["Dev"]
description: 'Looking back to the learnings of the year 2025.'
url: 'tech-recap-2025'
---


## Launching Webifyer

One of the skills I enjoy learning more is about photography.

One of the best decisions I ever had was to have a Photo Blog.

> Now you can also tell your story.

Check how, *if you are passionate about Photography*

## Processes

### To create Tech Videos

Creating 24 tech videos to make AI, D&A more accesible: [x]

1. 
2. 
3. Redash (BI)
4. Apache superset (BI)


> Additionally, I participated in few tech Talks:

1. 
2. 


### Dev Smart not Hard

Using AI to create more and better, in less time.

#### AI Stuff

#### More Websites!

#### Better Social Media

https://docs.postiz.com/introduction

### Improving the HomeLab


---

## Conclusions

There was even time to make **Data Analytics recaps**.

### D&A Tech Stacks


**Examples of Tech Stacks:**

* **Databricks + S3:**
    * This is a common cloud-based stack. Databricks provides the processing power (Spark), and S3 serves as the scalable data lake.

* **MinIO + Apache Iceberg + Nessie:**
    * This stack focuses on open-source technologies. MinIO provides object storage, Iceberg enables efficient data lake management, and Nessie adds version control (and time travel)

{{< details title="Nessie and iceberg 📌" closed="true" >}}

You're absolutely right. Project Nessie and Apache Iceberg are designed to work very well together, and Nessie can indeed be used on top of Iceberg. Here's a breakdown of their relationship:

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

{{< /details >}}

> In essence, Iceberg provides the table format, and Nessie provides the version control layer on top of those tables. This combination creates a powerful and flexible **data lakehouse architecture**.

* **HDFS + PySpark:**
    * This is a more traditional big data stack, often used in on-premises deployments. HDFS stores the data, and PySpark allows for Python-based data processing.


It's true that data analytics tech stacks can vary widely, and the examples you provided are all relevant.

Here's a breakdown of **typical components** and how they fit together:

**Core Components of a Data Analytics Tech Stack:**

* **Data Storage:**
    * This is where the raw and processed data resides. Common options include:
        * **Cloud Storage:** Amazon S3, Google Cloud Storage (GCS), Azure Blob Storage. These are highly scalable and cost-effective.
        * **Data Lakes:** HDFS (Hadoop Distributed File System), which is often used in on-premises or hybrid environments.
        * **Data Warehouses:** Snowflake, Google BigQuery, Amazon Redshift. These are optimized for analytical queries.
        * **Object Storage:** MinIO, which is an open source object storage solution that is S3 API compatible.
* **Data Processing:**
    * These tools transform and prepare data for analysis:
        * **Apache Spark:** A powerful distributed processing engine used for large-scale data transformation and analysis.
        * **Databricks:** A cloud-based platform built on Apache Spark, providing a collaborative environment for data engineering, data science, and machine learning.
        * **SQL-based tools:** These are essential for querying and manipulating data in data warehouses.
* **Data Orchestration:**
    * These tools manage the flow of data through the pipeline:
        * **Apache Airflow:** A platform for programmatically authoring, scheduling, and monitoring workflows.
        * **dbt (data build tool):** A transformation tool that enables data analysts and engineers to transform data in their data warehouses more effectively.
* **Data Catalog and Governance:**
    * These tools help manage and govern data assets:
        * **Apache Iceberg:** An open table format for large analytic datasets.
        * **Project Nessie:** Provides Git-like capabilities for data lakes.
        * **Apache Hive Metastore:** A central repository for metadata.
* **Data Visualization and Business Intelligence (BI):**
    * These tools allow users to explore and visualize data:
        * **Tableau, Power BI, Looker:** Popular BI platforms for creating dashboards and reports.

**Key Considerations:**

* The choice of tech stack depends on factors such as:
    * The volume and velocity of data.
    * The specific analytical needs of the organization.
    * Budget constraints.
    * Whether the deployment is on-premises, cloud-based, or hybrid.



### Outro

https://jalcocert.github.io/JAlcocerT/making-soap-at-home/