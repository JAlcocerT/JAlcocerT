---
title: "3D MBSD complexity comes from orientation and reaction loads"
date: 2026-04-30
tags: ["mbsd", "3d", "simulation"]
description: "The jump from 2D to 3D MBSD is mostly a jump in orientation representation and joint reaction complexity."
---

The hard part of moving from 2D to 3D MBSD is not adding one more position coordinate.

The hard part is orientation. Euler angles can create singularities, quaternions add a unit-norm constraint, and each spatial joint blocks multiple translational and rotational directions. The reaction loads also become forces and torques, not simple planar reactions.

This is the real 3D wall: richer geometry means richer constraints.

Related:

- [The physics of Mechanisms in the SPACE]({{< relref "/blog/mbsd-3d.md" >}})
- [The physics of motor/bi cycles]({{< relref "/blog/mbsd-3d-bike.md" >}})
- [Bringing Mechanisms to Life]({{< relref "/blog/creativity-mbsd-design.md" >}})
