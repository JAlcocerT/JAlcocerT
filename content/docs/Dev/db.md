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


### SQL Tricks for OLAP

[SQL for D&A](https://jalcocert.github.io/JAlcocerT/sql-data-analytics/) is awsome.

But ultimately, make sure to keep these **5 strategies** with you:

1. 
2. 
3. 
4. 
5. 

### Other D&A Tools

* https://github.com/wix-incubator/quix
* https://github.com/pinterest/querybook
* https://github.com/quixio/quix-streams
    * https://quix.io/templates/ai-customer-support



### Data Stories with a Notebook and ipyvizzu

If you feel confortable with Jupyter notebooks, have a look to: https://github.com/vizzuhq/ipyvizzu-story

> See an example of a data story: https://ipyvizzu-story.vizzuhq.com/latest/examples/titanic/

This is food for thought if you normally create presentations with SliDev for [tech talks](https://jalcocert.github.io/JAlcocerT/ai-driven-diagrams/#mermaid-x-tech-talk)!