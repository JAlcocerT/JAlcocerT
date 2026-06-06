---
title: "FEM begins where the rigid body assumption breaks"
date: 2026-05-08
tags: ["fem", "mechanics", "design"]
description: "Rigid-body simulation handles motion; FEM enters when deformation and stress matter."
---

FEM begins when a body can no longer be treated as perfectly rigid.

Multibody dynamics can predict motion, joint loads, and system-level behavior. But once deformation, stress concentration, stiffness, vibration modes, or material limits matter, the model needs a mesh and a structural solve.

The useful workflow is not MBSD or FEM. It is MBSD to find loads, then FEM to check whether the parts survive them.

Related:

- [FEM and a Self-Optimizing design loop]({{< relref "/blog/eng-fem.md" >}})
- [Launching a MBSD framework]({{< relref "/blog/mbsd-full.md" >}})
- [Compliant mechanisms and MultiBodySystemsDynamics dot com](/design-centric-mbsd/)
