---
title: "DBs (and Tools) for the AI era"
date: 2025-02-27T11:20:21+01:00
draft: false
tags: ["Dev","D&A","MySQL","PostgreSQL","MariaDB","Trino","Redis",]
description: 'Setting up DataBases for Data Analytics and AI Projects.'
url: 'setup-databases-docker'
---


**Intro**

A quick recap for databases for D&A people interested into SelfHosting.

[SQL Based](#sql): 

1. MySQL
2. MariaDB
3. PostgreSQL

[NoSQL DBs](#nosql):

4. Mongo

## SQL

The structured ones that you will find all around D&A.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/career/" title="Career D&A | Docs ↗" >}}
{{< /cards >}}

### MySQL

Some quick notes on how to connect to a MySQL database with Python.

{{< details title="MySQL Python Connection 📌" closed="true" >}}

Here's a breakdown of what you need to connect to a MySQL database with Python:

**1. MySQL Connector/Python:**

* This is the official MySQL driver for Python. It allows your Python applications to communicate with MySQL servers.
* You'll need to install it using pip:
    * `pip install mysql-connector-python`

**2. Establishing a Connection:**

* You'll use the `mysql.connector.connect()` function to create a connection to your MySQL database.
* This function requires connection parameters, such as:
    * `host`: The MySQL server's hostname or IP address.
    * `user`: Your MySQL username.
    * `password`: Your MySQL password.
    * `database`: The name of the database you want to connect to.

**3. Creating a Cursor:**

* A cursor object is essential for executing SQL queries.
* You create a cursor using the connection's `cursor()` method.
* The cursor allows you to:
    * Execute SQL statements.
    * Fetch results from queries.

**Basic Workflow:**

Here's a simplified example of the basic workflow:

```python
import mysql.connector

try:
    # Establish a connection
    mydb = mysql.connector.connect(
        host="localhost",
        user="yourusername",
        password="yourpassword",
        database="yourdatabase"
    )

    # Create a cursor
    mycursor = mydb.cursor()

    # Execute a query
    mycursor.execute("SELECT * FROM yourtable")

    # Fetch the results
    myresult = mycursor.fetchall()

    # Process the results
    for x in myresult:
        print(x)

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Close the cursor and connection
    if 'mycursor' in locals() and mycursor is not None:
        mycursor.close()
    if 'mydb' in locals() and mydb is not None:
        mydb.close()
```

**Key Points:**

* **Error Handling:** It's crucial to include error handling (using `try...except`) to catch potential database connection or query execution errors.
* **Closing Connections:** Always close your cursor and database connection when you're finished to release resources. The "finally" statement in the above code, is a good way to ensure this happens.
* There are also other python mysql connection libraries, such as PyMySql, but the mysql-connector-python is the offical one provided by oracle.

{{< /details >}}

### Selfhostable DBs

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mariadb" title="MariaDB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/postgresql" title="PostgreSQL | Docker Config 🐋 ↗" >}}
{{< /cards >}}

#### MariaDB

I got to know MariaDB as a substitute for MySQL when I was trying to use its [ARM64 container for selfhosting projects](https://jalcocert.github.io/RPi/posts/selfhosting-with-docker/).


#### PostgreSQL

<!-- 
https://www.youtube.com/watch?v=3JW732GrMdg
 -->

{{< youtube "3JW732GrMdg" >}}

And just recently, I was showing you how to use AI to have *data driven conversations* with your SQL DBs:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with a DB" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="MySQL With LangChain and OpenAI LLM" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

---

## NoSQL


NoSQL databases have become incredibly important in modern data management.


**What is NoSQL?**

**"Not Only SQL"**:
* This phrase highlights that NoSQL databases offer alternatives to the traditional relational database model (RDBMS) that relies heavily on SQL (Structured Query Language).
* It signifies that while some NoSQL databases might support SQL-like queries, their core design and data storage methods are fundamentally different.

{{< details title="What? Why NoSQL? 📌" closed="true" >}}

* **Flexible Data Models**:
    * Unlike RDBMS, which enforce rigid, predefined schemas (table structures), NoSQL databases provide flexible schemas or are often schema-less.
    * This flexibility allows them to handle diverse data types, including:
        * Structured data (like in tables)
        * Semi-structured data (like JSON or XML)
        * Unstructured data (like text, images, or videos)
* **Scalability and Performance**:
    * NoSQL databases are often designed for horizontal scalability, meaning you can easily add more servers to handle increasing data volumes and traffic.
    * This makes them well-suited for applications that require high performance and availability, such as web applications, mobile apps, and big data analytics.

**Why NoSQL?**

* **Handling Diverse Data**:
    * Modern applications generate a wide variety of data, and NoSQL databases excel at storing and managing this diverse data.
    * For example, social media platforms need to handle user profiles, posts, images, videos, and connections, which don't always fit neatly into tables.
* **Agile Development**:
    * The flexible schemas of NoSQL databases allow developers to iterate quickly and adapt to changing data requirements without the need for complex schema migrations.
* **Scalability for Web and Mobile Applications**:
    * NoSQL databases can easily scale to handle the massive traffic and data volumes generated by web and mobile applications.
* **Big Data and Real-Time Applications**:
    * NoSQL databases are often used for big data analytics and real-time applications that require high-speed data processing.

**Key NoSQL Database Types:**

* **Document Databases (e.g., MongoDB, Couchbase)**:
    * Store data as JSON-like documents, making them ideal for managing semi-structured data.
    * They are often used for content management systems, e-commerce applications, and mobile apps.
* **Key-Value Databases (e.g., Redis, Amazon DynamoDB)**:
    * Store data as key-value pairs, providing fast access to data.
    * They are often used for caching, session management, and real-time data processing.
* **Column-Oriented Databases (e.g., Cassandra, HBase)**:
    * Store data in columns rather than rows, making them efficient for analytical queries.
    * They are often used for big data analytics and time-series data.
* **Graph Databases (e.g., Neo4j)**:
    * Store data as nodes and edges, making them ideal for managing highly connected data.
    * They are often used for social network analysis, recommendation engines, and fraud detection.


{{< /details >}}


{{< callout type="info" >}}
NoSQL databases provide a powerful and flexible **alternative to traditional relational databases**, enabling organizations to handle the increasing volume, variety, and velocity of modern data.
{{< /callout >}}



### MongoDB

If you're working with MongoDB and Python, `pymongo` is the standard and most commonly used library for connecting to it.

**PyMongo: The Python Driver for MongoDB**

* `pymongo` is the official Python driver for MongoDB. It allows you to interact with MongoDB databases directly from your Python code.
* It provides a straightforward and Pythonic way to perform various operations, including:
    * Connecting to MongoDB servers.
    * Creating and managing databases and collections.
    * Inserting, querying, updating, and deleting documents.

**Key Concepts and Usage**

1.  **Installation:**
    * You'll need to install `pymongo` using pip:
        * `pip install pymongo`

2.  **Connecting to MongoDB:**
    * You use the `pymongo.MongoClient` class to establish a connection.
    * This typically involves providing a connection string (URI) that specifies the MongoDB server's address and other connection parameters.

3.  **Basic Example:**

```python
    from pymongo import MongoClient

    try:
        # Establish a connection
        client = MongoClient("mongodb://localhost:27017/") # or your connection string.

        # Access a database
        db = client["mydatabase"]

        # Access a collection
        collection = db["mycollection"]

        # Insert a document
        document = {"name": "John Doe", "age": 30}
        collection.insert_one(document)

        print("Connected to MongoDB and performed an operation.")

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        # Close the connection
        if 'client' in locals() and client is not None:
            client.close()

```

**Why PyMongo is Preferred:**

* **Official Driver:**
    * Being the official driver, it's well-maintained and kept up-to-date with the latest MongoDB features.
* **Pythonic Interface:**
    * It provides a clean and intuitive API that integrates seamlessly with Python.
* **Comprehensive Functionality:**
    * It offers complete access to all of MongoDB's features, allowing you to perform complex database operations.

Therefore, if your goal is to work with MongoDB in Python, using `pymongo` is the recommended and most efficient approach.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/getting-started/" title="Pi 101" image="/blog_img/iot/Rpi4_4gb_size.jpg" subtitle="Get Started with IoT Project" >}}
  {{< card link="https://jalcocert.github.io/RPi/tags/mongodb/" title="MongoDB with a Pi ↗" image="https://jalcocert.github.io/RPi/img/metabase.png" subtitle="IoT Project with MongoDB and sensor data" >}}
{{< /cards >}}


### InfluxDB and TimeScale

I was putting together an IoT project with a Pi and a MLX90614 sensor, where I needed a database to store the data and went with InfluxDB:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/getting-started/" title="Pi 101" image="/blog_img/iot/Rpi4_4gb_size.jpg" subtitle="Get Started with IoT Project" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/#pushing-mlx90614-data-to-influxdb/" title="InfluxDB with a Pi ↗" image="https://jalcocert.github.io/RPi/img/metabase.png" subtitle="IoT Project with MLX90614" >}}
{{< /cards >}}


### F/OSS Databases

During your D&A career, you will most certainly see: ES + Kibana / Graphite / Druid.

#### Elastic Search and Kibana

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_IoT/DHT22-to-ElasticSearch/" title="Pi + ES + DHT22 Folder" image="/blog_img/iot/Rpi4_4gb_size.jpg" subtitle="Get Started with IoT Project" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-iot-dht22-ES/" title="Elastic Search Kibana and a DHT22 with a Pi ↗" image="https://jalcocert.github.io/RPi/img/RPi4-DHT22.png" subtitle="IoT Project with Kibana and a DHT22" >}}
{{< /cards >}}

#### Prometheus 

For Grafana, Prometheus and Graphite are very popular: *specially for monitoring*.

<!-- 
![alt text](/blog_img/iot/grafana.png) -->

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/IoT/Grafana/Docker-compose.yml" title="Grafana Container Setup ↗" image="/blog_img/iot/grafana.png" subtitle="Grafana with Prometheus plays well with Grafana" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/selfh-grafana-monit/#grafana-with-prometheus-and-node-exporter" title="Prometheus with NodeExporter ↗" image="https://jalcocert.github.io/RPi/img/RPi4-DHT22.png" subtitle="Grafana with Prometheus Project" >}}
{{< /cards >}}


#### DRUID

**Druid is an open-source**, high-performance, real-time analytics database system that is designed to handle large volumes of data and provide fast querying capabilities for data analytics.

It was developed by Metamarkets (now part of Salesforce) and is commonly used in **big data and real-time analytics** scenarios.

{{< details title="Some key features and aspects of Druid for data analytics 📌" closed="true" >}}


1. **Real-Time Data Ingestion:** Druid is designed to ingest and process data in real-time, making it well-suited for applications that require up-to-the-minute insights and analytics. It can handle high-throughput data streams, such as event data and log files.

2. **Columnar Storage:** Druid stores data in a columnar format, which is highly optimized for analytics queries. This storage format allows for efficient aggregation, filtering, and querying of data.

3. **Query Performance:** Druid is known for its fast query performance, especially when dealing with large datasets. It supports complex queries and aggregations, making it suitable for interactive data exploration and reporting.

4. **Time-Series Data:** Druid is particularly well-suited for time-series data, which is common in applications like monitoring, IoT (Internet of Things), and log analysis. It can efficiently handle time-based data and provide real-time insights.

5. **Data Retention Policies:** Druid allows users to define data retention policies, which specify how long data should be stored in the system. This is important for managing storage costs and complying with data retention regulations.

6. **Scalability:** Druid is horizontally scalable, meaning you can add more nodes to a cluster to handle increasing data volumes and query loads. This scalability makes it suitable for big data analytics.

7. **Integration:** Druid can integrate with various data sources and data processing frameworks, allowing you to ingest data from databases, streaming platforms, and other sources.

8. **Visualization:** To perform data analytics effectively, Druid is often used in conjunction with visualization tools like Apache Superset, Tableau, or other BI (Business Intelligence) platforms.


{{< /details >}}

Druid is commonly used in industries where **real-time analytics** and fast query performance are essential, such as online advertising, **e-commerce**, gaming, and monitoring applications.

> It provides a powerful platform for exploring and gaining insights from large and time-sensitive datasets.

#### Trino

**Trino, formerly known as Presto SQL**, is an **open-source distributed SQL query engine** designed for high-performance and interactive querying of data across various data sources.

[Trino](https://jalcocert.github.io/JAlcocerT/sql-data-analytics/#trino-sql-ex-presto-sql) is particularly useful for querying data in a federated manner, where data resides in different storage systems or databases, and you want to query it as if it were in a single database.

{{< details title="how Trino compares to Druid and Kafka for data analytics 📌" closed="true" >}}


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

In some data analytics architectures, you might use Trino alongside Kafka and Druid.

For example, Kafka can be used for real-time data ingestion, Trino can provide SQL-based querying capabilities across various data sources, and Druid can be used for high-speed, interactive analytics on specific types of data, such as time-series data.

> The choice of which tools to use depends on your specific requirements and data architecture.

{{< /details >}}



#### Cassandra

You can push data from Python to Apache Cassandra, **a distributed NoSQL database**.

To interact with Cassandra from Python, you'll need to use a Python driver for Cassandra.

One popular driver for Cassandra is `cassandra-driver`.


{{< details title="How to use cassandra-driver to push data to a Cassandra database 📌" closed="true" >}}


1. Install the `cassandra-driver` using pip:

```bash
pip install cassandra-driver
```

2. Import the necessary modules and create a connection to your Cassandra cluster:

```python
from cassandra.cluster import Cluster

# Connect to your Cassandra cluster (replace with your cluster's contact points)
cluster = Cluster(['127.0.0.1'])  # Use the IP addresses or hostnames of your Cassandra nodes
session = cluster.connect()
```

3. Create a keyspace (database) and switch to it:

```python
keyspace_name = 'your_keyspace_name'

# Create a keyspace (if it doesn't exist)
session.execute(f"CREATE KEYSPACE IF NOT EXISTS {keyspace_name} WITH replication = {{'class': 'SimpleStrategy', 'replication_factor': 1}}")

# Switch to the keyspace
session.set_keyspace(keyspace_name)
```

4. Define your Cassandra table schema (CQL) and create the table:

```python
table_name = 'your_table_name'

# Define your table schema (CQL)
create_table_query = f"""
CREATE TABLE IF NOT EXISTS {table_name} (
    id UUID PRIMARY KEY,
    column1 text,
    column2 int
)
"""

# Create the table
session.execute(create_table_query)
```

5. Insert data into the Cassandra table:

```python
from cassandra.query import SimpleStatement

# Define the insert query
insert_query = f"INSERT INTO {table_name} (id, column1, column2) VALUES (?, ?, ?)"

# Prepare the insert statement
insert_statement = SimpleStatement(insert_query, consistency_level=1)

# Insert data into the table
session.execute(insert_statement, (uuid.uuid4(), 'value1', 42))
```

6. Close the Cassandra session and cluster when you're done:

```python
session.shutdown()
cluster.shutdown()
```

Make sure to replace `'your_keyspace_name'` and `'your_table_name'` with your desired keyspace and table names, and customize the table schema and data as needed.

With these steps, you can push data from Python to Cassandra using the `cassandra-driver` library.

Be sure to have a running Cassandra cluster with the appropriate configuration and keyspace set up before running the code.


{{< /details >}}


#### In Memory Data Stores


An in-memory data store, often referred to as an "in-memory database" or "in-memory data store," is a type of database system that primarily stores and manages data in the system's main memory (RAM) rather than on traditional disk storage devices.


{{< details title="In memory databases? 📌" closed="true" >}}

This means that data is held and processed in memory, which offers several advantages:

1. **Speed**: Data access and retrieval are extremely fast since there's no need to read from or write to slow disk drives. In-memory data stores can achieve low-latency and high-throughput operations, making them ideal for applications requiring rapid data access.

2. **Low Latency**: Because data is stored in RAM, there is minimal seek time or latency associated with accessing the data. This is particularly important for real-time or high-performance applications.

3. **Predictable Performance**: In-memory data stores provide consistent and predictable performance characteristics, making them suitable for applications where response times must be tightly controlled.

4. **Caching**: In-memory data stores are commonly used for caching frequently accessed data. This reduces the load on traditional databases and accelerates data retrieval for read-heavy workloads.

5. **No Disk I/O Overhead**: Since data isn't written to disk, there is no disk I/O overhead, which can be a significant bottleneck in traditional database systems.

6. **Data Integrity**: In-memory databases typically have mechanisms to ensure data consistency and durability, such as periodic snapshots to disk or replication to other nodes.

7. **Real-Time Analytics**: In-memory databases are often used for real-time analytics and data processing, where quick insights are required from large volumes of data.

However, there are also some limitations to in-memory data stores:

1. **Limited Storage**: In-memory data stores are constrained by the amount of available RAM, which may limit the volume of data that can be stored. This makes them less suitable for very large datasets.

2. **Data Durability**: In-memory data is volatile and can be lost if the system crashes or is restarted. Some in-memory databases address this by periodically writing data to disk.

3. **Cost**: RAM can be more expensive than traditional disk storage, so scaling up an in-memory database can be cost-prohibitive for large datasets.

{{< /details >}}

In-memory data stores are commonly used for various applications, including real-time analytics, caching, session management, and high-frequency trading, where fast data access and low-latency responses are critical.

Popular examples of in-memory data stores include **Redis**, Memcached, and various in-memory database systems.


##### REDIS

**Redis** is an open-source, in-memory data structure store used as a database, cache, message broker, and streaming engine.

It is known for its high performance, scalability, and flexibility.

Redis provides data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs, geospatial indexes, and streams.

Redis is open-source software released under the BSD license. It is available for Linux, macOS, Windows, and FreeBSD.

**Key Features of Redis**

- **In-memory data store:** Redis stores data in memory, which makes it very fast.
- **Data structures:** Redis supports a wide variety of data structures, including strings, hashes, lists, sets, sorted sets, bitmaps, hyperloglogs, geospatial indexes, and streams.
- **Scalability:** Redis is highly scalable and can be used to support a large number of concurrent connections.
- **Flexibility:** Redis is a very flexible tool that can be used for a variety of purposes, including caching, data streaming, and real-time applications.

Popular Use Cases for Redis

**Caching:** Redis can be used to cache frequently accessed data, such as user profiles or product information. This can improve the performance of applications by reducing the number of times the database needs to be accessed.
- **Data streaming:** Redis can be used to stream data in real time. This can be used for applications such as real-time analytics or live chat.
- **Real-time applications:** Redis can be used to build real-time applications that require high performance and scalability. This includes applications such as s0cial media platforms, gaming applications, and financial trading applications.


```py

import redis

# Create a connection to the Redis database
r = redis.Redis()

# Push the data to Redis
r.set("key", "value")

# Push a list of data to Redis
r.lpush("list", "item1", "item2")
```

You can push data from Python to Redis, an in-memory data store, using the `redis-py` library. `redis-py` is a popular Python client for Redis that allows you to interact with Redis from your Python applications.

Here's how you can use `redis-py` to push data to Redis:

1. Install the `redis-py` library using pip:

```bash
pip install redis
```

2. Import the `redis` module and create a connection to your Redis server:

```python
import redis

# Connect to your Redis server
redis_host = 'localhost'  # Replace with your Redis server's host or IP address
redis_port = 6379         # Default Redis port
redis_db = 0              # Default Redis database
r = redis.StrictRedis(host=redis_host, port=redis_port, db=redis_db)
```

Replace `'localhost'` with the address of your Redis server if it's running on a different host.

3. Push data (key-value pairs) to Redis:

```python
# Define your key-value data
key = 'your_key'
value = 'your_value'

# Push data to Redis
r.set(key, value)
```

You can also specify additional parameters like expiration time, if needed.

4. Retrieve data from Redis:

```python
# Retrieve data from Redis
retrieved_value = r.get(key)

if retrieved_value is not None:
    print(f"Value for key '{key}': {retrieved_value.decode('utf-8')}")
else:
    print(f"Key '{key}' not found in Redis.")
```

5. Close the Redis connection when you're done:

```python
r.close()
```

These are the basic steps to push data from Python to Redis using `redis-py`. 

You can use various Redis data structures and commands depending on your use case, such as lists, sets, hashes, and more.

Make sure that you have a running Redis server with the appropriate configuration and access permissions before running the code.

### Kafka what?

Druid and Apache Kafka serve different but **complementary roles in real-time data analytics** and processing. 

While they can be used together in a data pipeline, they are designed for different purposes:

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


**Kafka is a distributed streaming platform** that allows you to publish and consume streams of records, and there are Python libraries and clients available to work with Kafka.

One popular Python library for interacting with Kafka is `confluent-kafka-python`, which is a Python wrapper for the Confluent Kafka client. You can use this library to produce (push) data to Kafka topics.

> I got to know about Kafka for IoT during [this experience](https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/).

And **Python can push data to Apache Kafka**.

Here's an example of how to use `confluent-kafka-python` to produce data to a Kafka topic.

{{< details title="Python 2 Kafka Scheleton 📌" closed="true" >}}


First, you need to install the library using pip:

```bash
pip install confluent-kafka
```

Now, you can use the following Python code to **produce data to a Kafka topic**:

```python
from confluent_kafka import Producer

# Kafka broker address and topic name
bootstrap_servers = 'localhost:9092'  # Change this to your Kafka broker's address
topic = 'your_topic_name'              # Change this to your Kafka topic name

# Create a Kafka producer configuration
producer_config = {
    'bootstrap.servers': bootstrap_servers,
    # Other producer configuration options can be added here
}

# Create a Kafka producer instance
producer = Producer(producer_config)

try:
    # Produce a message to the Kafka topic
    message_key = 'key'           # Change this to your desired message key
    message_value = 'Hello, Kafka!'  # Change this to your message content

    producer.produce(topic, key=message_key, value=message_value)
    producer.flush()  # Flush the producer buffer to send the message

    print(f"Produced message: key={message_key}, value={message_value} to topic: {topic}")

except Exception as e:
    print(f"Error producing message: {str(e)}")

finally:
    producer.close()
```

In this code:

1. You import the `Producer` class from `confluent_kafka`.

2. You define the Kafka broker address (`bootstrap_servers`) and the Kafka topic name you want to produce data to.

3. You create a Kafka producer configuration dictionary, specifying the bootstrap servers.

4. You create a Kafka producer instance using the provided configuration.

5. Inside a try-except block, you produce a message to the Kafka topic, specifying a message key and message value. You can customize the key and value as needed.

6. You flush the producer buffer to ensure that the message is sent to Kafka.

7. Finally, you close the producer.

Make sure to replace `'localhost:9092'` with the address of your Kafka broker and `'your_topic_name'` with the name of the Kafka topic you want to use.

With this code, you can push data to Kafka from your Python application.

{{< /details >}}