---
title: "DBs"
date: 2025-10-06T10:20:21+01:00
draft: false
description: 'Databases use cases and tools'
url: 'databases'
---

You might be a selfhoster looking for the perfect [DB for your homelab](https://jalcocert.github.io/JAlcocerT/databases-101/).

A dev looking for that perfect framework and database to [bootstrap](https://jalcocert.github.io/JAlcocerT/whats-boostrap/) that idea.

Or *,just'* databases for a D&A career.


## Tools for DBs

Whatever your goal is, these are some Databases you can use: https://jalcocert.github.io/JAlcocerT/databases-101/

Even Before that and looking to the tools, make sure to understand what are (and the use cases) of **OLAP (D&A) vs OLTP (Dev)**.

The structured vs object/JSON differenciation is also important...

1. https://github.com/chartdb/chartdb

> Agpl3.0 |  Database diagrams editor that allows you to visualize and design your DB with a single query. 

2. DBCode

> You could also use the [DBCode](https://dbcode.io/) extension, and if you like ipynb, check their [notebooks for DBs](https://dbcode.io/docs/notebooks/getting-started) and related `.dbcnb`

```sh
#Your database. Inside VS Code.
ext install DBCode.dbcode
```

Use the [DBCode](https://dbcode.io/) extension, and if you like `ipynb`, check their [notebooks for DBs](https://dbcode.io/docs/notebooks/getting-started)

![DBCode vscode extension](/blog_img/DA/dbcode.png)

These tools provide a graphical user interface **(GUI) to interact with and manage your databases**, offering a more user-friendly alternative to the command line.

To explore vector DBs we have Vector Admin, but for **regular DB's** we have **WhoDB**

A powerful, lightweight (~20Mi), and user-friendly database management tool that combines the simplicity of Adminer with superior UX and performance.

* https://github.com/clidey/whodb?tab=GPL-3.0-1-ov-file#readme

> A lightweight next-gen **database explorer** - Postgres, MySQL, SQLite, MongoDB, Redis, MariaDB & Elastic Search

> > WhoDB is written in GoLang!

See also **DBChart or DBGate**

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dbchart" title="ChartDB | Docker Config Setup 🐋 ↗" >}}
  {{< card link="https://github.com/dbgate/dbgate" title="See also DBGate | Project ↗" >}}
{{< /cards >}}




## OLAP and Databases

I will focus this section on the D&A goal of databases, which is to **READ and analyze** huge amounts of data.

```sql
SELECT
  gw_type,
  cm_model,
  COUNT(DISTINCT location_id) AS total_locations_in_group,
  -- Conditional count for the filtered locations
  COUNT(DISTINCT CASE
    WHEN parent_node_type = 'gateway' AND child_node_type = 'pod' AND idtype IN ('LG203X', 'LG403Z', 'LG302Z', 'LG312Z')
    THEN location_id
  END) AS conditional_locations,
  -- Calculate the KPI in the same query
  (COUNT(DISTINCT CASE
    WHEN parent_node_type = 'gateway' AND child_node_type = 'pod' AND idtype IN ('LG203X', 'LG403Z', 'LG302Z', 'LG312Z')
    THEN location_id
  END) * 100.0) / COUNT(DISTINCT location_id) AS percentage_kpi
FROM
  `some.where.table_base`
WHERE DATE_TRUNC(ts, DAY) = DATE("2023-12-31")
--WHERE
--  ts >= '2023-12-30'
-- AND ts < '2023-12-31'
  AND gw_type IS NOT NULL
  AND cm_model IS NOT NULL
GROUP BY
  gw_type,
  cm_model
ORDER BY
  total_locations_in_group DESC;
```

### SQL Tricks for OLAP

[SQL for D&A](https://jalcocert.github.io/JAlcocerT/sql-data-analytics/) is awsome.

But ultimately, make sure to keep these **5 strategies** with you:

1. 
2. 
3. 
4. 
5. 


<!-- SQL: Basic retrieval techniques

SQL | **DDL**, DQL, DML, DCL and TCL Commands


The SELECT statement (purpose, syntax).
Set operations (union, union all, intersect, minus).
Joins (inner, outer (left, right, full), Cartesian product).
Subqueries (returning one row, many rows, many columns).
DML constructions - INSERT, UPDATE, DELETE, MERGE, TRUNCATE.
DDL constructions - CREATE, ALTER, DROP.
Basic database theory

Understanding of the basics of relational databases.
Differentiating between a database and a DBMS.
Differentiating between PK, FK, and candidate keys.
Understanding of relationship types (1-to-1, 1-to-many, many-to-many). -->
<!-- 
SQL: Basic retrieval techniques

The SELECT statement (purpose, syntax).
Set operations (union, union all, intersect, minus).
Joins (inner, outer (left, right, full), Cartesian product).
Subqueries (returning one row, many rows, many columns).
DML constructions - INSERT, UPDATE, DELETE, MERGE, TRUNCATE.
DDL constructions - CREATE, ALTER, DROP.
Basic database theory

Understanding of the basics of relational databases.
Differentiating between a database and a DBMS.
Differentiating between PK, FK, and candidate keys.
Understanding of relationship types (1-to-1, 1-to-many, many-to-many). -->

<!-- 
The main concepts of SQL include tables, relationships, ordinality, cardinality, functions, common table expressions (CTEs), recursive CTEs, temporary functions [2], and string formatting. SQL also has several different types of functions [3], such as scalar functions, which take a single value and return a single value [3]. Understanding these concepts is essential for working with databases. -->

<!-- SQL: Data definition and indexing

Stages of SQL execution.
Hierarchical queries basics.
Nested SELECT queries (select from select).
Data comparison and transformation.
Basic aggregate functions.

Database fundamentals 

Awareness of different DB types.
Understanding of the purpose of DB objects (view, materialized view, index, trigger, synonym).
Understanding of constraint types (referential integrity, NOT NULL, unique, etc).
Understanding of cardinality constraints.
Understanding of normalization (1-2-3 NF).
Understanding use-cases for Normalization and Denormalization. -->

<!-- ### OPTIMIZATION:
USE INDEXES, PARTITION KEYS ON THE COLUMNS THAT ARE GOING TO BE USED AND ARE UNIQUE TO AVOID DATA SKEW
USE HASHDIFF  AND HASHES

SET STATISTIC TIME ON 
SET STATISTICS TIME OFF 
 -->
<!-- 
 Use Alias Name
Aliasing renames a table or a column temporarily by giving another name. The use of table aliases means renaming a table in a specific SQL statement. Using aliasing, we can provide a small name to a large name which will save us time.  -->


<!-- 
### Optimizing your SQL Queries

* Select ONLY the columns that you need 
    * AVOID SELECT * 
    * AVOID SELECT DISTINCT 
* Use LIMIT (or equivalent in your SQL version)
* AVOID: too many joins, or, and -->


### Other D&A Tools

* https://github.com/wix-incubator/quix
* https://github.com/pinterest/querybook
* https://github.com/quixio/quix-streams
    * https://quix.io/templates/ai-customer-support



### Data Stories with a Notebook and ipyvizzu

If you feel confortable with Jupyter notebooks, have a look to: https://github.com/vizzuhq/ipyvizzu-story

> See an example of a data story: https://ipyvizzu-story.vizzuhq.com/latest/examples/titanic/

This is food for thought if you normally create presentations with SliDev for [tech talks](https://jalcocert.github.io/JAlcocerT/ai-driven-diagrams/#mermaid-x-tech-talk)!

### Other Interesting F/OSS DBMS's

* [DuckDB](https://github.com/duckdb/duckdb) ~ OLAP
  * [Huey](https://github.com/rpbouman/huey) an UI for DuckDB
  * GetHue - https://hub.docker.com/r/gethue/hue/tags - Hue is an open source SQL Assistant for Database & Data Warehouses. 
    * https://github.com/cloudera/hue

```sh
docker run -d -p 8888:8888 gethue/hue:latest
```