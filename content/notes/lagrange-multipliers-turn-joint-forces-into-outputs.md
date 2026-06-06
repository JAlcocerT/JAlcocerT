---
title: "Lagrange multipliers turn joint forces into outputs"
date: 2026-03-21
tags: ["mbsd", "lagrangian-mechanics", "forces"]
description: "Constraint reactions become computable outputs when MBSD equations include Lagrange multipliers."
---

Lagrange multipliers make hidden joint forces visible.

In a constrained multibody system, the equations solve motion and constraint reactions together. The multipliers are not bookkeeping artifacts; they are the forces and torques required to enforce the joints.

That matters because a simulation should not only answer "where does it move?" It should also answer "what loads does the mechanism create?"

Related:

- [Programatic Mechanisms]({{< relref "/blog/mbsd-constrained-mec.md" >}})
- [2D Kinematics and Dynamics]({{< relref "/blog/mbsd-2d.md" >}})
- [The physics of Mechanisms in the SPACE]({{< relref "/blog/mbsd-3d.md" >}})
