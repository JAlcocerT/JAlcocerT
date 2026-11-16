---
title: "Company brains should capture context before retrieval"
date: 2026-09-19
tags: ["knowledge-management", "company-brain", "context", "agents"]
description: "Organizational memory becomes useful when systems capture decisions and relationships before asking AI to synthesize them."
---

An organizational knowledge system should capture context before it tries to answer questions.

Daily conversations, tickets, pull requests, meetings, and decisions contain more than isolated facts. They contain ownership, causes, dependencies, tradeoffs, and evidence. If those relationships are lost during ingestion, retrieval can return relevant text while still missing the reason something happened.

The useful company brain is therefore not just a searchable document store. It is an operational memory that preserves who decided what, why it changed, what it affected, and how the result was verified. AI can synthesize that memory at read time, but it cannot reliably reconstruct context that was never captured.

Related:

- [AIoT needs time-series context before language]({{< relref "/notes/aiot-needs-time-series-context-before-language.md" >}})
- [Agents need postmortems as much as prompts]({{< relref "/notes/agents-need-postmortems-as-much-as-prompts.md" >}})

Source:

- [Selfhosted Information flow with Omarchy]({{< relref "/blog/selfhost-2609-info.md" >}})
