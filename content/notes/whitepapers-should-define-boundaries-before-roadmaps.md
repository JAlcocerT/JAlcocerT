---
title: "Whitepapers should define boundaries before roadmaps"
date: 2026-09-05
tags: ["open-source", "engineering", "architecture", "roadmaps"]
description: "A technical whitepaper earns trust by defining the thesis, architecture, and capability limits before promising a release sequence."
---

A technical whitepaper should explain what a system is, why it exists, and where it deliberately stops before it explains when features will ship.

For an engineering library, the durable content is the technical thesis, mathematical or architectural choices, reproducibility assumptions, and honest capability boundaries. The roadmap is a separate planning artifact: it turns that foundation into milestones, release gates, and validation work.

Mixing the two makes both weaker. A whitepaper becomes obsolete project management, while a roadmap hides unresolved technical assumptions behind a list of features. Keeping them separate lets the foundational argument remain stable while implementation priorities change.

Related:

- [A BRD is a thinking tool before it is a document]({{< relref "/notes/a-brd-is-a-thinking-tool-before-it-is-a-document.md" >}})
- [Problem definition precedes solution search]({{< relref "/notes/problem-definition-precedes-solution-search.md" >}})

Source:

- [Time for MultiBodySystemsDynamics (dot) com]({{< relref "/blog/mbsd-z-whitepaper.md" >}})
