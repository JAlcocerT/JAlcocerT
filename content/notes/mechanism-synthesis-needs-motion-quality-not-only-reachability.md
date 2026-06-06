---
title: "Mechanism synthesis needs motion quality, not only reachability"
date: 2026-04-28
tags: ["mechanism-synthesis", "mbsd", "design"]
description: "A mechanism that reaches a pose can still be a poor design if transmission and singularity behavior are bad."
---

Mechanism synthesis is not finished when a linkage reaches the desired positions.

A useful mechanism must also move through those positions with acceptable transmission angle, force transfer, clearance, singularity margin, and load behavior. A mathematically valid path can still be mechanically fragile.

This is why synthesis needs both design metrics and solver health checks.

Related:

- [2D Mechanism Synthesis]({{< relref "/blog/mbsd-2d-synthesis.md" >}})
- [The hidden Mechanism behind Cyclying]({{< relref "/blog/mbsd-cycling-4bars.md" >}})
- [Launching a MBSD framework]({{< relref "/blog/mbsd-full.md" >}})
