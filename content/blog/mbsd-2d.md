---
title: "2D Kinematics and Dynamics"
date: 2026-03-23
draft: false
tags: ["MBSD x 2D Simulation","Point Reference Coordinates"]
description: 'The physics of pedaling with your bicycle.'
url: '2d-mbsd'
math: true
---



**Tl;DR**

A summary of 2D mechanics for multibody systems.

**Intro**

I vibecoded in one shot a static cool page about multibody: https://multibodysystemdynamics.pages.dev/

And ended up taking back mbsd where I left it during [spring of 2023](https://jalcocert.github.io/JAlcocerT/slider-crank-mechanism/).

How much things have changed since then...

I mean, same physics.

But...


## About MBSD

Code is law, specially for multibody system dynamics.

```sh
git clone git clone https://github.com/JAlcocerT/mbsd
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="NEW MBSD" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a Go desktop app for HUD overlays for GoPros" >}}
{{< /cards >}}

* https://github.com/JAlcocerT/Slider-Crank
* https://github.com/JAlcocerT/mechanism


### Kinematics




### Dynamics

Understand **constrained dynamics** and how to simulate real mechanisms with 2D motions.

```sh
cd ./mbsd/2D-Dynamics
```

Video Sequence in _all.mp4
The combined video now shows the complete causality chain:

Forces (gravity + applied torque)
Constraints (gravity vs constraint forces) ← NEW!
Accelerations (F = ma)
Velocities (∫a dt)
Energy Flow (validation)

What This Proves
The constraint forces visualization will make it crystal clear:

Gravity is indeed constant (red arrows barely move)
Constraint forces vary with mechanism configuration (blue arrows dance around)
When you add them together (green arrows), you get exactly the acceleration pattern
This is why your intuition was right: constant gravity alone can't explain variable accelerations






The Physics: Constrained Lagrangian Mechanics

M·a = Q_total = Q_gravity + Q_constraint + Q_applied

**The Equation We Solve**

```
M(q) @ a + ∇V(q) = Q_ext + C_q^T @ λ
```

Where:
- **M(q)** = Mass matrix (constant in reference coordinates)
- **a** = Acceleration vector (what we compute)
- **∇V(q)** = Potential energy gradient (gravity effects)
- **Q_ext** = External forces (torques, springs, user input)
- **C_q^T @ λ** = Constraint reaction forces (the hidden part!)
- **λ** = Lagrange multipliers (automatic, varies with config)

**The Constraint Equations**

```
C(q, t) = 0              ← Joint constraint (position)
C_q @ v = ∂C/∂t          ← Velocity constraint (automatic)
C_q @ a = -dC_q @ v - d²C/dt²   ← Acceleration constraint
```





---

## Conclusions



Some people say that we could be doing our passions only if there would be some kind of magic that pay for it.

Not sure about you, but I dont believe in magic.

And if you want my time you can rent it below: *for that price signal i'd stop doing this and start caring about your problems* 

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

Selfish?

Other people would thank you for the compliment!

If you are here for the free goodies, you can have them at the time of writing at the ebooks site.

Enjoy!

---

## FAQ

<!-- engine starting
https://www.youtube.com/shorts/mzWr2ZGf7OU -->

<!-- 


derivatives
The Trillion Dollar Equation
https://www.youtube.com/watch?v=A5w-dEgIU1M
 -->

<!-- 
<https://www.youtube.com/watch?v=ABzKNvJCl28>
<http://firsttimeprogrammer.blogspot.com/2015/02/crankshaft-connecting-rod-and-piston.html>
<http://firsttimeprogrammer.blogspot.com/2015/02/crankshaft-connecting-rod-and-piston.html> -->
<!-- 
https://www.youtube.com/shorts/D8Q0Y6R4NiI -->