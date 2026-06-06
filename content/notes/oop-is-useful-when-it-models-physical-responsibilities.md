---
title: "OOP is useful when it models physical responsibilities"
date: 2026-04-02
tags: ["oop", "python", "engineering"]
description: "For engineering code, objects are useful when they own state and behavior from the modeled system."
---

OOP helps engineering code when objects map to real responsibilities.

A body, joint, solver, integrator, sensor, or material can own state and behavior that would otherwise spread across scripts. The design fails when classes only wrap functions without clarifying the model.

Good OOP makes the physical system easier to reason about.

Related:

- [OOP 101 for Engineers - Pendulum x 3Bodies]({{< relref "/blog/dev-python-OOP.md" >}})
