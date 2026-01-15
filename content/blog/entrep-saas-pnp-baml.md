---
title: "Connecting to T-SQL and OracleSQL"
date: 2026-02-01T23:20:21+01:00
draft: false
tags: ["BAML","AI Tech Talk 3"]
description: 'Enterprise insights are behind Connecting to T-SQL and OracleSQL - Go get them.'
url: 'using-baml-to-query-a-database'
---

**Tl;DR**

**Intro**

This is all around:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/langchain-db-ui" title="LangChain x DB QnA x UI ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="All withing the Data Chat Repo ↗" icon="github" >}}
{{< /cards >}}


## Enterprise Insights

We are going to simulate these with containers.

Just as demostrated here with pgsql.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/postgresql" title="PostgreSQL | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### TSQL

### Oracle SQL

### DuckDB vs ClickHouse

### Using BAML

I was testing BAML last year [here](https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli/#baml).

And it resonated a lot with the way langchain generates the query to the databases.

So could not resist to explore how to do a custom and more controlable solution around BAML.



[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Data-Chat/blob/main/LangChain/ChatWithDB/test_langchainChatDB.ipynb)

### UI Wrapper

To make the solution sellable to enterprises, we need a UI.

And the good news is that we already vibe coded that: here.



---

## Conclusions

From how to what and why.

Code is cheap now. Software isnt *at least for now*.

> From [this great post](https://www.chrisgregori.dev/opinion/code-is-cheap-now-software-isnt) and [video](https://www.youtube.com/watch?v=28z6OjsNsUk)

The danger is now more on not to get distracted with the daily tool or workflow that gets released.

Go with cursor, antigravity, claude code, lovable, opencode, crush...

But just go and try.

The challenge is now the **distribution / orchestration / marketing**, not the coding thing.

Do you even know the audience? is it even listening?

Are you building sth for an empty room?

Time to go from builder to **creator and finding people to care** about your thing.

### The related tech talk

```sh
git clone https://github.com/JAlcocerT/selfhosted-landing
cd y2026-tech-talks/4-baml-db-insights
```

---

## FAQ