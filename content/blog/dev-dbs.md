---
title: "Which DB is for me?"
date: 2025-08-11
draft: false
tags: ["DataBases","D&A"]
description: 'What are pros and cons of popular DBs: SQlite, PostgreSQL and their containers'
url: 'databases-101'
---


## SQLite

SQLite is generally excellent for **reads**, especially in scenarios where it's being accessed by many concurrent readers. However, it is also very good for **writes** in single-user or low-concurrency environments.

---

### Reads

SQLite's read performance is exceptionally fast. Because the database is stored in a local file, there is no network latency. This makes it very efficient for applications that need to perform many read operations, such as mobile apps, desktop software, and low-to-medium traffic websites. In many cases, SQLite can even outperform a traditional filesystem for reading small data blobs. 

The main strength of SQLite is its ability to handle an unlimited number of concurrent readers. Multiple processes can read from the database at the same time without any issues.

---

### Writes

SQLite's main limitation is its write concurrency. By default, SQLite only allows **one write operation at any given moment**. While one process is writing, the entire database is locked, and all other write attempts will be delayed or will fail.

However, this doesn't mean writes are slow. In fact, for a single writer, SQLite's write performance can be very fast, particularly when using **transactions** to batch multiple write operations together. By wrapping many `INSERT` or `UPDATE` statements within a single transaction, you can drastically reduce the overhead and significantly improve write speed.

Modern SQLite versions also offer a **Write-Ahead Logging (WAL)** mode, which improves write concurrency by allowing readers to continue working while a writer is active. Even in WAL mode, however, only one process can be writing at a time.


## PostgreSQL

In terms of write operations, **PostgreSQL is generally better than SQLite**, especially in scenarios with multiple users or concurrent writes.

The primary difference lies in their architecture and how they handle concurrency:

### PostgreSQL: Concurrent Writes

PostgreSQL is a client-server database. It's designed to handle a high volume of concurrent write operations from multiple clients. It achieves this using a sophisticated system called **Multi-Version Concurrency Control (MVCC)**, along with row-level locking. This allows many users to write to different rows in a table at the same time without blocking each other. This is crucial for applications with many users or services that need to write data simultaneously.

### SQLite: Single Writer

SQLite is an embedded, file-based database. It's designed for single-user or low-concurrency scenarios. By default, SQLite enforces a **single writer lock** on the entire database file. While any number of clients can read from the database concurrently, only one can write at any given moment. Other write attempts must wait their turn or will fail with a "database is locked" error.

This limitation makes SQLite a poor choice for high-concurrency, write-heavy applications. However, for a single process writing to the database, SQLite can be very fast, often faster than PostgreSQL due to the absence of network latency and inter-process communication overhead.

No, 10,000 operations per second is not a realistic baseline for SQLite, especially for write operations. The throughput for both SQLite and PostgreSQL varies dramatically depending on the workload, hardware, and configuration.

***

### SQLite Throughput

For **writes**, SQLite is limited by its single-writer architecture. On average desktop hardware with an SSD, it can perform **hundreds to a few thousand transactions per second** by default.

 However, a single, properly optimized write transaction (using a `BEGIN...COMMIT` block for bulk inserts) can achieve tens of thousands of inserts per second. For reads, SQLite is extremely fast, often capable of **hundreds of thousands of reads per second** due to a lack of network latency and in-process execution.

***

### PostgreSQL Throughput

PostgreSQL is a client-server database designed for high concurrency. Its throughput is much higher and scales with your hardware. For writes, a properly tuned PostgreSQL instance can easily handle **tens of thousands of transactions per second** on a powerful server. For reads, especially simple queries that fit in memory, it can also achieve **hundreds of thousands of queries per second**. The key difference is that PostgreSQL can sustain these high write volumes from multiple concurrent clients, while SQLite cannot.

## SQLite vs PostgreSQL


Both SQLite and PostgreSQL are powerful databases, but they are built for different purposes. The choice between them depends on the specific needs of your application, especially regarding concurrency and scale.  

***

### SQLite

SQLite is an **embedded, serverless, file-based** database. It's an excellent choice for lightweight, single-user applications or read-heavy workloads with low write concurrency.

#### Pros:
* **Zero Configuration**: There's no server to set up. The entire database is a single file on disk, making it incredibly easy to use.
* **Portability**: Since it's just a single file, you can easily copy and move the database. This is ideal for desktop apps, mobile apps, or local development environments.
* **Fast Reads**: Without the overhead of a client-server architecture, SQLite can perform read operations very quickly.
* **Small Footprint**: The library is very small, making it great for resource-constrained devices like IoT or mobile devices.

#### Cons:
* **Limited Concurrency**: SQLite's main drawback is its lack of concurrent write support. Only one process can write to the database at a time, which can be a bottleneck for multi-user web applications.
* **Less Secure**: It lacks built-in user management, permissions, and network security features, as it's designed to be accessed locally by a single application.
* **Fewer Advanced Features**: It has a simpler feature set compared to PostgreSQL, lacking things like advanced replication, materialized views, and a wide variety of data types.

***

### PostgreSQL

PostgreSQL is a **robust, client-server** database management system. It's an ideal choice for complex, high-traffic applications that require strong data integrity and support for multiple concurrent users.

#### Pro:
* **High Concurrency**: With its Multi-Version Concurrency Control (MVCC), PostgreSQL handles multiple simultaneous read and write operations without blocking, making it perfect for multi-user applications.
* **Extensive Feature Set**: PostgreSQL is a feature-rich database that supports a wide range of advanced features, including custom data types, functions, and powerful indexing options.
* **Data Integrity**: It has a strong focus on ACID compliance and data integrity, ensuring reliable transactions even with complex operations.
* **Security**: As a client-server system, it has a sophisticated security model with built-in user roles, access control, and network encryption.

#### Cons
* **Complex Setup**: Setting up and managing a PostgreSQL server is more complex than using SQLite and requires more administrative effort.
* **Higher Resource Usage**: It is a more heavyweight solution and consumes more system resources (CPU and RAM) than SQLite.
* **Slower for Simple Tasks**: The overhead of the client-server model can make it slightly slower for very simple, single-user operations compared to a local SQLite file.