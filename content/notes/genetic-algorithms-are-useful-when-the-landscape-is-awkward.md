---
title: "Genetic algorithms are useful when the landscape is awkward"
date: 2026-02-26
tags: ["optimization", "genetic-algorithms", "simulation"]
description: "Genetic algorithms trade precision for broad search when gradients are unavailable or unreliable."
---

Genetic algorithms are useful when the search landscape is awkward.

If the objective is discontinuous, noisy, constrained, or difficult to differentiate, population-based search can explore candidate solutions without requiring clean gradients. The tradeoff is efficiency and tuning effort.

They are a practical search tool, not a universal optimizer.

Related:

- [Optimum Path x Genetic Algorithm]({{< relref "/blog/tinker-optimum-ga.md" >}})
