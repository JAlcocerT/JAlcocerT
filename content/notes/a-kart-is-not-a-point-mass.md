---
title: "A kart is not a point mass"
date: 2026-05-26
tags: ["vehicle-dynamics", "racing", "mbsd"]
description: "Racing models need body attitude, load transfer, tires, and constraints once point-mass assumptions become limiting."
---

A kart is not a point mass once handling matters.

Point-mass models are useful for rough path and speed estimates, but they hide body attitude, load transfer, tire forces, steering geometry, and chassis constraints. Those effects decide whether a line is merely short or actually drivable.

Vehicle dynamics starts when the model keeps enough structure to explain why the path works.

Related:

- [A Kart != a point mass](/kart-mbsd-simulation/)
- [The physics of motor/bi cycles]({{< relref "/blog/mbsd-3d-bike.md" >}})
- [F1 Data Animations]({{< relref "/blog/tinker-f1-data.md" >}})
