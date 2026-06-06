---
title: "Reference coordinates trade more equations for a systematic solver"
date: 2026-03-21
tags: ["mbsd", "coordinates", "simulation"]
description: "Reference coordinates make MBSD implementation more uniform by accepting redundant coordinates and explicit constraints."
---

Reference coordinates make a multibody solver more systematic.

Instead of hand-picking the minimum number of coordinates for every mechanism, each body receives a standard coordinate set. Joints and drivers are then expressed as constraint equations.

The price is numerical: the solver must handle more coordinates and constraint equations. The benefit is architectural: mechanisms become easier to define, compose, debug, and generalize.

Related:

- [Programatic Mechanisms]({{< relref "/blog/mbsd-constrained-mec.md" >}})
- [2D Kinematics and Dynamics]({{< relref "/blog/mbsd-2d.md" >}})
- [Launching a MBSD framework]({{< relref "/blog/mbsd-full.md" >}})
