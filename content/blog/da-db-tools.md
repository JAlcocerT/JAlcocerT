---
title: "DBs (and Tools) for the AI era"
date: 2025-03-09T00:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Setting up DataBases.'
url: 'setup-databases-docker'
---

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


<!-- 
Airflow?? -->

<!-- 
Elastic Search and kibana -->

<!-- 
Apache Kafka 
https://openfaas.com/
-->

<!-- ### MariaDB

### MongoDB

### InfluxDB

TimeScale


Airtable alternatives:
https://github.com/nocodb/nocodb
https://noted.lol/nocodb-contact-form-gmail-smtp/


https://github.com/bram2w/baserow
 -->


### F/OSS Databases

#### Elastic Search

#### Prometheus

#### Graphite

#### MongoDB

#### MariaDB / PostreSQL (?)

#### DRUID

Druid is an open-source, high-performance, real-time analytics database system that is designed to handle large volumes of data and provide fast querying capabilities for data analytics.

It was developed by Metamarkets (now part of Salesforce) and is commonly used in **big data and real-time analytics** scenarios.

Here are some key features and aspects of Druid in the context of data analytics:

1. **Real-Time Data Ingestion:** Druid is designed to ingest and process data in real-time, making it well-suited for applications that require up-to-the-minute insights and analytics. It can handle high-throughput data streams, such as event data and log files.

2. **Columnar Storage:** Druid stores data in a columnar format, which is highly optimized for analytics queries. This storage format allows for efficient aggregation, filtering, and querying of data.

3. **Query Performance:** Druid is known for its fast query performance, especially when dealing with large datasets. It supports complex queries and aggregations, making it suitable for interactive data exploration and reporting.

4. **Time-Series Data:** Druid is particularly well-suited for time-series data, which is common in applications like monitoring, IoT (Internet of Things), and log analysis. It can efficiently handle time-based data and provide real-time insights.

5. **Data Retention Policies:** Druid allows users to define data retention policies, which specify how long data should be stored in the system. This is important for managing storage costs and complying with data retention regulations.

6. **Scalability:** Druid is horizontally scalable, meaning you can add more nodes to a cluster to handle increasing data volumes and query loads. This scalability makes it suitable for big data analytics.

7. **Integration:** Druid can integrate with various data sources and data processing frameworks, allowing you to ingest data from databases, streaming platforms, and other sources.

8. **Visualization:** To perform data analytics effectively, Druid is often used in conjunction with visualization tools like Apache Superset, Tableau, or other BI (Business Intelligence) platforms.

Druid is commonly used in industries where real-time analytics and fast query performance are essential, such as online advertising, e-commerce, gaming, and monitoring applications. It provides a powerful platform for exploring and gaining insights from large and time-sensitive datasets.

#### Trino

**Trino, formerly known as Presto SQL**, is an **open-source distributed SQL query engine** designed for high-performance and interactive querying of data across various data sources. Trino is particularly useful for querying data in a federated manner, where data resides in different storage systems or databases, and you want to query it as if it were in a single database.

Here's how Trino compares to Druid and Kafka in the context of data analytics:

1. **Trino:**
   - **SQL Query Engine:** Trino is primarily a SQL query engine, which means it allows you to write SQL queries to access and analyze data from multiple sources, including traditional relational databases, distributed data stores, data lakes, and more.
   - **Data Virtualization:** Trino provides a virtualized view of data, allowing you to join and query data across disparate data sources without the need for ETL (Extract, Transform, Load) processes.
   - **Performance:** Trino is known for its high query performance and ability to handle complex queries efficiently. It can scale horizontally to distribute query processing.
   - **Use Cases:** Trino is suitable for **ad-hoc querying, interactive data exploration, and analytical workloads** where you need to access and analyze data from different sources in real time.

2. **Druid:**
   - **Analytics Database:** Druid is specifically designed for analytical queries, especially for time-series data. It provides fast querying and visualization capabilities for large datasets, making it suitable for interactive data exploration.
   - **Data Storage:** Druid uses columnar storage optimized for analytics, making it perform well for aggregation and filtering operations.
   - **Use Cases:** Druid is commonly used for real-time analytics, dashboards, monitoring, and reporting where sub-second query response times are crucial.

3. **Kafka:**
   - **Event Streaming:** Kafka is an event streaming platform designed for ingesting, storing, and distributing real-time data streams or events.
   - **Data Ingestion:** Kafka excels at handling high-throughput data streams from various sources and making them available to downstream applications and systems.
   - **Use Cases:** Kafka is widely used for real-time data ingestion, event-driven architectures, log aggregation, and building data pipelines.

In some data analytics architectures, you might use Trino alongside Kafka and Druid. For example, Kafka can be used for real-time data ingestion, Trino can provide SQL-based querying capabilities across various data sources, and Druid can be used for high-speed, interactive analytics on specific types of data, such as time-series data. The choice of which tools to use depends on your specific requirements and data architecture.

### Kafka what?

Druid and Apache Kafka serve different but **complementary roles in real-time data analytics** and processing. While they can be used together in a data pipeline, they are designed for different purposes:

1. **Druid:**
   - **Analytics Database:** Druid is primarily an **analytics database** designed for querying and analyzing large volumes of data with low-latency, especially **time-series data**.
   - **Data Storage:** It stores data in a columnar format optimized for analytical queries, making it well-suited for aggregation, filtering, and exploration of data.
   - **Query Engine:** Druid provides a query engine that allows you to run complex analytical queries and generate real-time insights from your data.
   - **Use Cases:** Druid is commonly used for interactive data exploration, dashboards, monitoring, and reporting in scenarios where sub-second query response times are essential.

2. **Apache Kafka:**
   - **Event Streaming Platform:** Kafka is an **event streaming platform** designed for ingesting, storing, and processing real-time data streams or events.
   - **Data Ingestion:** It excels at handling high-throughput data streams from various sources and making them available to downstream applications.
   - **Data Distribution:** Kafka facilitates data distribution and messaging between different components of a data architecture.
   - **Use Cases:** Kafka is widely used for real-time data ingestion, event sourcing, log aggregation, and building data pipelines. It acts as a backbone for data streaming and event-driven architectures.

Here's how they can work together in a real-time analytics scenario:

1. **Data Ingestion:** Kafka can be used to ingest data from various sources, such as IoT devices, logs, and external systems. It can then stream this data into Druid for real-time analysis.

2. **Data Transformation:** Before data enters Druid, you may need to transform and enrich it. Kafka's stream processing capabilities (with Kafka Streams or other stream processing frameworks) can be used for this purpose.

3. **Storage and Analysis:** Once the data is in Druid, it can be queried and analyzed in real time to generate insights and power real-time dashboards.

{{< callout type="info" >}}
Kafka and Druid are complementary technologies often used together to build end-to-end real-time data analytics solutions. 
{{< /callout >}}

**Kafka is focused on data ingestion, streaming, and event distribution**, while Druid specializes in high-performance analytics and querying of large datasets, especially time-series data.

