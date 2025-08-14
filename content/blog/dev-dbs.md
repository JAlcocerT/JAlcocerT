---
title: "Which DB is for me?"
date: 2025-08-11
draft: false
tags: ["DataBases","D&A"]
description: 'What are pros and cons of popular DBs: SQlite, PostgreSQL, mariaDB and their containers'
url: 'databases-101'
---


**TL;DR:** Recap on popular DBs. For SelfHosters and BE Devs.

**Intro**

Not all DB's are useful for the same.

Interesting revelations after trying [pocketbase](https://jalcocert.github.io/JAlcocerT/pocketbase/) (which uses sqlite)

I will cover:

1. [Sqlite](#sqlite)
2. [PostgreSQL](#postgresql)
3. [MariaDB](#mariadb): because I like it for SelfHosting
4. Some [interesting tools](#related-db-tools) to interact with your DBs

<!-- https://www.youtube.com/watch?v=3gVBjTMS8FE -->

{{< youtube "3gVBjTMS8FE" >}}


## SQLite

SQLite is generally excellent for **reads**, especially in scenarios where it's being accessed by many concurrent readers.

> However, it is also very good for **writes** in single-user or low-concurrency environments.

---

### Reads

SQLite's read performance is exceptionally fast. 

Because the database is stored in a local file, there is no network latency.

This makes it very efficient for applications that need to perform many read operations, such as mobile apps, desktop software, and low-to-medium traffic websites. 

In many cases, SQLite can even outperform a traditional filesystem for reading small data blobs. 

The main strength of SQLite is its ability to handle an unlimited number of concurrent readers.

Multiple processes can read from the database at the same time without any issues.

---

### Writes

SQLite's main limitation is its write concurrency. By default, SQLite only allows **one write operation at any given moment**. While one process is writing, the entire database is locked, and all other write attempts will be delayed or will fail.

However, this doesn't mean writes are slow. 

In fact, for a single writer, SQLite's write performance can be very fast, particularly when using **transactions** to batch multiple write operations together. 

By wrapping many `INSERT` or `UPDATE` statements within a single transaction, you can drastically reduce the overhead and significantly improve write speed.

Modern SQLite versions also offer a **Write-Ahead Logging (WAL)** mode, which improves write concurrency by allowing readers to continue working while a writer is active.

> Even in WAL mode, however, only one process can be writing at a time.


## PostgreSQL

In terms of write operations, **PostgreSQL is generally better than SQLite**, especially in scenarios with multiple users or **concurrent writes**.

But first...**Why Move to Postgres** if you have localstorage?

**Concurrency Control:**
- ✅ **ACID transactions** prevent race conditions
- ✅ **Row-level locking** for concurrent updates
- ✅ **Atomic operations** ensure data consistency

**Data Integrity:**
- ✅ **Foreign key constraints** ensure referential integrity
- ✅ **Schema validation** prevents malformed data
- ✅ **Backup & recovery** capabilities

**Scalability:**
- ✅ **No storage limits** (within reason)
- ✅ **Efficient queries** with proper indexing
- ✅ **Cross-device synchronization** possible

**Development Experience:**
- ✅ **SQL queries** for data analysis
- ✅ **Database tools** for debugging
- ✅ **Consistent behavior** across environments

{{% details title="Tradeoff | PG vs Local Storage... 🚀" closed="true" %}}

1. **Current Browser Storage Implementation**

**Pros:**
- ✅ **Zero Server Dependencies** - Works completely offline
- ✅ **Instant Performance** - No network latency for data access
- ✅ **Simple Deployment** - No database setup or maintenance
- ✅ **Privacy by Design** - Data never leaves user's device
- ✅ **No Server Costs** - No database hosting or scaling costs
- ✅ **Works Anywhere** - Any device with a browser
- ✅ **Immediate Availability** - No authentication or connection setup
- ✅ **Perfect for Prototyping** - Quick to implement and test

2. **Cons:**
- ❌ **No Cross-Device Sync** - Data trapped on single device/browser
- ❌ **Data Loss Risk** - Browser cache clear = all data gone
- ❌ **Storage Limitations** - 5-10MB localStorage, ~50MB IndexedDB
- ❌ **Race Conditions** - Multiple tabs can corrupt data
- ❌ **No Backup/Recovery** - No way to restore lost data
- ❌ **No Collaboration** - Can't share sessions between users
- ❌ **Debugging Difficulty** - Hard to inspect and analyze data
- ❌ **No Data Analytics** - Can't analyze usage patterns
- ❌ **Browser Dependency** - Different behavior across browsers
- ❌ **No Real-time Sync** - Changes don't propagate between tabs
- ❌ **Scalability Issues** - Performance degrades with large datasets
- ❌ **No Data Integrity** - No foreign key constraints or validation

2. **Postgres Implementation**

**Pros:**
- ✅ **Cross-Device Synchronization** - Access data from any device
- ✅ **Data Persistence** - Professional backup and recovery
- ✅ **Unlimited Storage** - No practical storage limits
- ✅ **ACID Transactions** - Data integrity guaranteed
- ✅ **Concurrent Access** - Multiple users/tabs safely
- ✅ **Real-time Capabilities** - WebSocket notifications possible
- ✅ **Data Analytics** - SQL queries for insights
- ✅ **Collaboration Ready** - Multi-user sessions possible
- ✅ **Professional Tooling** - Database admin tools, monitoring
- ✅ **Scalability** - Handles millions of records efficiently
- ✅ **Data Validation** - Schema enforcement and constraints
- ✅ **Audit Trails** - Track changes and user actions
- ✅ **Integration Ready** - Easy to connect other services
- ✅ **Consistent Behavior** - Same experience across all browsers

**Cons:**
- ❌ **Server Dependency** - Requires backend infrastructure
- ❌ **Network Latency** - Slower than local storage access
- ❌ **Complexity** - Database setup, migrations, maintenance
- ❌ **Hosting Costs** - Database server and scaling expenses
- ❌ **Authentication Required** - Need user management system
- ❌ **Offline Limitations** - Requires internet connection
- ❌ **Security Concerns** - Need to protect against SQL injection, etc.
- ❌ **Deployment Complexity** - More moving parts to deploy
- ❌ **Development Overhead** - More code for API endpoints
- ❌ **Monitoring Required** - Need database performance monitoring

**Use Case Analysis**

* **When Current Browser Storage Makes Sense:**
- 🎯 **Personal Tools** - Single-user, single-device applications
- 🎯 **Prototyping** - Quick demos and proof-of-concepts
- 🎯 **Offline-First Apps** - Applications that must work without internet
- 🎯 **Privacy-Critical** - Data that should never leave user's device
- 🎯 **Simple Applications** - Basic CRUD with minimal data
- 🎯 **Educational Projects** - Learning frontend without backend complexity

* **When Postgres Migration is Essential:**
- 🎯 **Multi-Device Usage** - Users expect data sync across devices
- 🎯 **Collaboration** - Multiple users need to share data
- 🎯 **Data Analytics** - Need to analyze usage patterns and data
- 🎯 **Professional Applications** - Business-critical data that needs backup
- 🎯 **Large Datasets** - Beyond browser storage limitations
- 🎯 **Real-time Features** - Live updates and notifications
- 🎯 **Concurrent Users** - Multiple people using simultaneously

**Migration Decision Matrix**

| Requirement | Browser Storage | Postgres | Winner |
|-------------|----------------|----------|---------|
| **Development Speed** | ⚡ Fast | 🐌 Slower | Browser |
| **Cross-Device Sync** | ❌ No | ✅ Yes | **Postgres** |
| **Data Safety** | ⚠️ Risky | ✅ Safe | **Postgres** |
| **Performance** | ⚡ Instant | 🌐 Network | Browser |
| **Scalability** | ❌ Limited | ✅ Unlimited | **Postgres** |
| **Offline Support** | ✅ Perfect | ❌ Limited | Browser |
| **Collaboration** | ❌ No | ✅ Yes | **Postgres** |
| **Data Analytics** | ❌ No | ✅ Yes | **Postgres** |
| **Maintenance** | ✅ None | ⚠️ Required | Browser |
| **Costs** | ✅ Free | 💰 Hosting | Browser |


**Current User Pain Points (Browser Storage):**

```
😤 "I lost all my chat history when I cleared my browser cache"
😤 "I can't access my conversations from my phone"
😤 "When I open multiple tabs, my sessions get mixed up"
😤 "I can't share this interesting conversation with my colleague"
😤 "My chat history is getting slow with 100+ conversations"
```

Technical Debt Assessment

1. **Current Technical Debt:**
- **Race Condition Bugs** - Multiple tabs causing data corruption
- **Data Loss Reports** - Users losing work due to browser cache clears
- **Performance Issues** - Slow loading with large chat histories
- **Cross-Tab Sync Problems** - Inconsistent state between tabs
- **Storage Limit Hits** - Users running out of browser storage space

2. **Postgres Migration ROI:**
- **Reduced Support Tickets** - Fewer data loss and sync issues
- **Improved User Retention** - Users don't lose work, stay engaged
- **Feature Enablement** - Can build collaboration and sharing features
- **Scalability Readiness** - Ready for enterprise customers
- **Professional Credibility** - Proper data persistence expected in business apps

{{% /details %}}




**Connecting to PG containers**

```sh
#make up-local-setup
docker compose -f ./devops/compose.local.yaml exec sdlc-postgres \
  sh -lc 'PGPASSWORD="$SDLC_POSTGRES_DEFAULT_PASSWORD" psql -h localhost \
  -U "$SDLC_POSTGRES_DEFAULT_USER" -d "$SDLC_POSTGRES_DEFAULT_DB"'
```

To list the dbs:

```sh
\l
```

* List databases: \l
* Use a DB: \c postgres
* List schemas: \dn
* List tables (current schema): \dt
* List all tables: \dt *.*

```sh
docker compose -f ./devops/compose.local.yaml exec sdlc-postgres sh -lc 'PGPASSWORD="$SDLC_POSTGRES_DEFAULT_PASSWORD" psql -h localhost -U "$SDLC_POSTGRES_DEFAULT_USER" -d "$SDLC_POSTGRES_DEFAULT_DB" -c "CREATE SCHEMA IF NOT EXISTS app;"'
```


Initialization script: 

```sh
docker compose -f ./devops/compose.local.yaml run --rm sdlc-postgres-init --url=jdbc:postgresql://sdlc-postgres:5432/postgres --changelog-file=changelog/init.sql update -Dingestion_db_name=ingestion
```


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

**SQLite**

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

**PostgreSQL**

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

## MariaDB


---

## Conclusions


---

## Related DB Tools


Many open-source companion tools exist to help with different aspects of database management, from schema migrations to monitoring and data visualization.

Here are some of the most popular categories and tools.

---

### Database Management & GUI Tools 👨‍💻

These tools provide a graphical user interface (GUI) to interact with and manage your databases, offering a more user-friendly alternative to the command line.

* **DBeaver**: A universal database tool for developers and administrators. It's cross-platform and supports virtually any database that has a JDBC driver, including PostgreSQL, MySQL, SQLite, and many others. It features a SQL editor, ER diagrams, and data export/import capabilities.
* **pgAdmin**: A powerful and feature-rich management and development platform for PostgreSQL. It provides a visual interface for managing database objects, running queries, and monitoring server activity.
* **phpMyAdmin**: A classic web-based tool specifically for managing MySQL and MariaDB databases. It's widely used for its simplicity and ease of use in managing tables, users, and running queries.

---

### Database Schema Migration 🚀

These tools help you manage and version-control your database schema changes in a programmatic, repeatable way, which is crucial for modern DevOps practices.

* **Flyway**: A simple, convention-based migration tool that uses versioned SQL files to track and apply database changes. Its simplicity and robust command-line interface make it popular for developers.
* **Liquibase**: A more feature-rich and flexible migration tool. It allows you to write changesets in various formats (SQL, XML, YAML) and supports a wide range of databases, making it highly portable.
* **Prisma**: While primarily an ORM (Object-Relational Mapper), Prisma has a powerful migration system that defines your schema using its own language and then generates and applies the necessary database migrations.

---

### Monitoring & Observability 📊

These tools help you monitor the performance and health of your databases, providing real-time insights and alerts.

* **Prometheus**: An open-source monitoring system and time-series database. It's commonly used to collect and store metrics from various services, including databases, and provides a powerful query language for analysis and alerting.
* **Percona Monitoring and Management (PMM)**: A dedicated open-source platform for database observability and management. It provides detailed dashboards and metrics for MySQL, PostgreSQL, and MongoDB to help you pinpoint and fix performance bottlenecks.

---

### Data Visualization & Analytics 📈

These tools connect to your databases and provide a way to visualize data through dashboards and charts, making it easier to analyze and share insights with others.

* **Apache Superset**: A modern, open-source data exploration and visualization platform. It connects to various SQL databases and allows users to build interactive dashboards and charts without writing a single line of code.
* **Metabase**: An open-source business intelligence tool that simplifies the process of data analysis. It's designed to be user-friendly, allowing team members to ask questions about their data and visualize the results.



{{% details title="About LiquiBase... 🚀" closed="true" %}}

**Liquibase** is an open-source database-independent tool for managing and tracking database schema changes.

It treats database changes like application code, enabling version control and CI/CD pipelines for your database. 

### How it Relates to Databases

Liquibase's core function is to provide a structured and automated way to evolve your database schema.

This is crucial in modern software development, where databases often need to be modified as applications are updated.

The key concepts that explain this relationship are:

---

1. Changelogs and Changesets

Instead of writing manual SQL scripts to alter a database, you create **changelog files**.

These are plain text files (often in YAML, XML, JSON, or SQL format) that contain a sequence of **changesets**. A changeset is a single, atomic change to the database, like creating a new table, adding a column, or updating data. Each changeset has a unique ID and author, ensuring that changes are never applied more than once.

---

2. Database-Agnostic Changes

One of Liquibase's most powerful features is its ability to handle multiple database types. 

You can write your changesets using a database-agnostic syntax (like XML or YAML), and Liquibase will translate them into the correct SQL for the target database (e.g., PostgreSQL, MySQL, Oracle, etc.). This allows a single changelog to work across different environments, even if they use different database systems.

---

3. Tracking Tables

When you run Liquibase, it connects to your database and creates two tables: `DATABASECHANGELOG` and `DATABASECHANGELOGLOCK`.

* The `DATABASECHANGELOG` table stores a history of every changeset that has been successfully applied to that specific database.
* The `DATABASECHANGELOGLOCK` table is a temporary lock to prevent multiple instances of Liquibase from running at the same time, which could corrupt the database.

By checking the `DATABASECHANGELOG` table, Liquibase knows exactly which changesets have already been executed and which ones still need to be applied, ensuring a repeatable and consistent deployment process.

{{% /details %}}
