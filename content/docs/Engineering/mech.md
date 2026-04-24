---
title: Mech
type: docs
draft: false
---






## Computational Mechanics

Some years back I fell [into this](https://ereding.etsi.us.es/bibing/proyectos/abreproy/90128/).

<!-- https://youtu.be/0CLNWADDrtY -->

{{< youtube 0CLNWADDrtY >}}

Which I ended up [porting into Python](https://github.com/JAlcocerT/mbsd/tree/master/bike-real-time-simulator).

Is it something that Devs can do?

Well...yes, they can.

Providing that you communicate the physics accordingly.

### MBSD x Coordinates




### MBSD x Reference Coordinates

The bicycle model was not using reference/absolute coordinates as I wanted to reduce the computational load to make the simulation real time back in te days.

With reference coordinates, you have a very systematic approach, at the cost of solving more equations.

If you dont care about performance and what to optimize for reach of mechanism analysis, this is for you.