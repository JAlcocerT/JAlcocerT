---
title: "How to Query AWS s3 buckets data [with Python]"
date: 2023-08-19
draft: false
tags: ["D&A","Amazon s3","Boto3","Blob Storage","HDFS"]
description: 'Understanding how to use boto to query aws s3 buckets information. Be ready for JSON.'
url: 'aws-s3-python-boto-queries'
---


**Intro**

Got some data on s3 buckets and need to query it?

No Problem, lets do that with python.


## Using AWS CLI

You will be able to see the content, which folders there are and so on

```sh
#Install aws CLI 
#https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

#Check that it is installed with:
aws --version

#Configure it with the credentials:
aws configure

#Explore the buckets with: 
aws s3 ls
```

But we came here to query the data, right?

## How to Query s3 with Boto and Python

Make sure that you have a solid understanding about Python Dependencies and PySpark:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="PySpark 101 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Python 101 ↗" >}}
{{< /cards >}}


1. Get your AWS credentials
2. Install Python dependencies


```sh
pip install boto3
```

---

## Conclusions

The closer to raw data, the more prepared you have to be to work with [nested data / jsons](#json-tools).

When it comes to exchanging and storing data, one format has risen to prominence: JSON (JavaScript Object Notation).

Its lightweight, human-readable, and machine-parsable nature has made it the go-to choice for developers and data professionals alike.

But JSON isn't just for web APIs; it's a powerful ally in the realm of data analytics, even with the complexities of **big data**.

**What is JSON and Why is it So Popular?**

At its core, JSON is a text-based data interchange format. 

It organizes data into key-value pairs and ordered lists of values (arrays), allowing for **nested structures that can represent complex relationships**. 

Imagine a digital filing cabinet where each folder (object) contains labeled drawers (keys) with specific items (values), and some drawers might even contain more folders!


{{< details title="More about JSON 📌" closed="true" >}}

Its popularity stems from several key characteristics:

* **Human-readable:** The syntax is clear and concise, making it easy for developers to read and understand.
* **Lightweight:** Compared to older formats like XML, JSON has less overhead, leading to smaller file sizes and faster transmission.
* **Language-independent:** While rooted in JavaScript, virtually every modern programming language has built-in parsers and generators for JSON, enabling seamless data exchange across diverse platforms.
* **Flexible Schema:** Unlike rigid relational databases, JSON is semi-structured, meaning it doesn't require a predefined schema. This flexibility is incredibly valuable in agile development and for handling evolving data structures.

**Use Cases: Where JSON Shines in Analytics and Development**

JSON's versatility makes it indispensable across various domains:

**1. Web Development and API Communication:**
This is JSON's bread and butter. When you interact with a web application, chances are the data being sent to and from the server is in JSON format. RESTful APIs heavily rely on JSON for sending requests and receiving responses, powering everything from fetching product details to submitting user forms.

**2. Configuration Files and Application Settings:**
Many applications use JSON to store configuration settings, such as database connection details, API keys, user preferences, and application parameters. This makes it easy to manage and modify settings without redeploying code.

**3. Data Storage in NoSQL Databases:**
NoSQL databases like MongoDB are built to leverage JSON's flexible schema. They store data as JSON-like documents, providing developers with a natural way to work with data that often doesn't fit into traditional tabular structures. This is particularly useful for rapidly evolving products and systems.

**4. Data Serialization and Deserialization:**
JSON is widely used to convert complex programming language data structures (like objects or arrays) into a format that can be easily stored or transmitted (serialization), and then reconstructing them back into the original structure (deserialization).

**5. Logging and Monitoring:**
When capturing application events, errors, and performance metrics, JSON provides a structured and machine-readable format for log files. This makes it much easier to analyze and troubleshoot issues.

**6. Data Interchange and ETL:**
In data pipelines and Extract, Transform, Load (ETL) processes, JSON serves as a common interchange format for moving data between different systems or applications.

**JSON and the Big Data Landscape**

While JSON's flexibility is a boon, its semi-structured nature can pose challenges when dealing with massive datasets. However, JSON is increasingly integral to big data analytics, especially in scenarios involving:

* **IoT Data:** Millions of sensors and devices generate high volumes of data, often in JSON format, which needs to be collected, processed, and analyzed in real-time.
* **Clickstream Data:** Analyzing user interactions on websites and applications often involves processing large JSON logs.
* **Social Media Data:** Public APIs from social media platforms frequently return data in JSON, which is then used for sentiment analysis, trend identification, and more.
* **Server and Security Logs:** These often contain valuable insights and are frequently stored in JSON for easier parsing and analysis.

Strategies for handling big JSON data include:

* **Streaming Parsers:** Instead of loading entire JSON files into memory (which can be impossible for large datasets), streaming parsers process data piece by piece, significantly reducing memory consumption.
* **Data Partitioning:** Dividing large JSON datasets into smaller, more manageable chunks (e.g., by date or region) allows for distributed processing and better performance.
* **Compression:** Compressing JSON files (e.g., using gzip) reduces storage requirements and speeds up data transfer.
* **Cloud Services:** Cloud platforms offer specialized big data processing services (like AWS Glue DataBrew, Google Cloud BigQuery, or Tencent Cloud's TBDS) that are optimized for handling large-scale JSON data, including schema-on-read capabilities that allow you to ingest data without a predefined schema.
* **Schema-on-Read:** This approach allows applications to ingest JSON data and then infer and query its schema at read-time, providing flexibility for evolving data structures.

**Tools to Work with JSON**

A wide array of tools makes working with JSON efficient and enjoyable:

**1. Programming Language Built-ins:**
Most programming languages have native support for JSON. For example, Python's `json` library, JavaScript's `JSON.parse()` and `JSON.stringify()`, and Java's various JSON libraries (like Jackson or Gson) are fundamental for working with JSON data.

**2. Command-Line Tools:**
* **`jq`:** A powerful and indispensable command-line JSON processor. It allows you to filter, transform, and extract data from JSON documents with ease.
* **`gron`:** Converts JSON into discrete assignments that are easily "greppable," making it simple to search within large JSON files.

**3. Online JSON Viewers and Formatters:**
Numerous web-based tools help you visualize, format, and validate JSON data. Popular options include:
* **JSON Formatter & Validator:** Cleans up messy JSON and checks for syntax errors.
* **JSON Crack:** Transforms JSON into interactive graphs and tree views, making complex data structures easier to understand.
* **JSON Hero:** Offers different layouts (column, tree, JSON) and powerful search capabilities for exploring JSON data.

**4. Integrated Development Environment (IDE) Extensions:**
Many IDEs (like VS Code) offer extensions that provide syntax highlighting, auto-completion, formatting, and validation for JSON files, improving developer productivity.

**5. Data Processing Frameworks:**
For big data scenarios, frameworks like Apache Spark and tools within cloud ecosystems (e.g., AWS Glue, Google Cloud Dataflow) provide robust capabilities for processing, transforming, and analyzing JSON data at scale.

**6. JSON Schema Validation Tools:**
Tools like `Ajv` (for JavaScript) or schema validation libraries in other languages help define and validate the structure of your JSON data, ensuring data integrity.


{{< /details >}}

JSON has cemented its position as a cornerstone of modern data exchange. 

Its simplicity, flexibility, and broad adoption across various technologies make it a powerful tool for both development and data analytics.

As data volumes continue to explode, understanding how to effectively leverage JSON and the growing ecosystem of tools around it will be crucial for unlocking valuable insights and building robust applications.

---

## FAQ

### JSON Tools

A great start is looking at [emn178 repo](https://github.com/emn178/online-tools): https://emn178.github.io/online-tools/json/formatter/

See these Selfhosted OSS solutions to **play around with JSON**:

* https://github.com/CorentinTh/it-tools
* https://github.com/iib0011/omni-tools

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Z_Dockge/stacks/it-tools/Docker-Compose.yml" title="Selfhost IT/Omni-tols | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### Blob Storage

Blob storage is a **type of object storage** offered by cloud providers.

It relates to S3 buckets and HDFS in that they all provide scalable, durable, and cost-effective storage for large amounts of unstructured data, but they differ in their origin and typical use cases.


**Blob storage** (Binary Large Object storage) is a cloud service that stores massive amounts of unstructured data as "blobs" or objects. 

It is the name for object storage provided by **Microsoft Azure**. Unlike traditional file systems that organize data in a hierarchical folder structure, blob storage manages data as a flat, single-level collection of objects, each with a unique key.

### Relation to S3 and HDFS

* **S3 (Simple Storage Service)**: S3 is the object storage service provided by **Amazon Web Services (AWS)**. It is essentially the AWS equivalent of Azure's Blob Storage. Both are massively scalable and highly durable cloud object storage solutions. They are the de facto standards for cloud data lakes. While they have different APIs and features, they serve the same fundamental purpose: storing vast amounts of unstructured data. You can think of a "blob container" in Azure as analogous to an "S3 bucket" in AWS.

* **HDFS (Hadoop Distributed File System)**: HDFS is the on-premises equivalent of a distributed file system. It was designed to run on commodity hardware and is the foundational storage layer for the Apache Hadoop ecosystem. HDFS is optimized for high-throughput access to large datasets, making it ideal for big data processing frameworks like MapReduce and Spark.

The key differences between them are:

| Feature | HDFS | S3 & Blob Storage |
| :--- | :--- | :--- |
| **Environment** | On-premises, self-managed. | Cloud-based, managed service. |
| **Scalability** | Scalable, but tied to the physical cluster size. | Massively and elastically scalable on demand. |
| **Cost** | Upfront hardware and maintenance costs. | Pay-as-you-go, no upfront costs. |
| **API** | POSIX-like file system API. | RESTful API (Object-based). |
| **Latency** | Low latency for initial data access. | Higher latency for initial data access due to the REST API, but high throughput for large files. |
| **Use Case** | Traditional big data processing (MapReduce). | Modern data lakes, cloud-native applications. |

Other types of object storage systems exist, with the main ones being **MinIO** and **Ceph**. 

Both are open-source, on-premises alternatives to cloud-based services like S3 and Azure Blob Storage. They are popular for those who want to build and manage their own private cloud or data lake infrastructure.

### MinIO

**MinIO** is a high-performance, open-source object storage system. It's designed to be lightweight and simple to deploy, often used for building private cloud storage that is compatible with the **Amazon S3 API**. 

This compatibility is a major selling point, as it allows developers to use the same tools and applications for their on-premises storage as they would for S3, making it a great choice for hybrid cloud architectures.

### Ceph

**Ceph** is another highly scalable, open-source distributed storage system. While it can function as an object storage system, it's more of a unified storage platform that can also provide block and file storage.

Ceph is known for its high scalability and resilience, making it a good choice for large-scale enterprise deployments where a single storage solution is needed for various types of data.

Here's a quick comparison of the three primary object storage types:

| | **Cloud-Based (S3, Azure Blob)** | **On-Premises (MinIO, Ceph)** |
| :--- | :--- | :--- |
| **Provider** | AWS, Microsoft Azure, Google Cloud | Open-source, self-managed |
| **Scalability** | Massive, elastic, on-demand | Scalable, but limited by physical hardware |
| **Cost** | Pay-as-you-go, subscription | Upfront hardware and maintenance costs |
| **Control** | Less control over infrastructure | Full control over hardware and configuration |