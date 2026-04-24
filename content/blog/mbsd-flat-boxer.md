---
title: "MBSD 2D. Flat > Boxer?"
date: 2026-04-24T09:20:21+01:00
draft: false
tags: ["Volumetric Efficiency","Holonomic vs Non Holonomic Constrains"]
description: 'Comparing two popular engines NVH.'
url: 'flat-versus-boxer-simulation'
math: true
---

**Tl;DR**

After the [*,failed'* I4 attempt](https://jalcocert.github.io/JAlcocerT/inline-4-engine-balance/) it goes...

**Intro**

All Boxer are flat 180, but not viceversa.

flat are v at 180 degrees that share crank pin, but boxer have different crank pins


## MBSD 2D x Vibrations

Trying to make a quick bypass with LLMs was not a good idea here.

So I upgraded the mbsd framework to make such kind of analysis.

{{< callout type="info" >}}
If you were waiting for proper engine balance mbsd driven explanation, this is it!
{{< /callout >}}


### About Vibrations, FTT and NVH

Dominant harmonic content (for any slider-crank at constant ω):

* 1st harmonic (once per rev) — gravity + translating-mass imbalance
* 2nd harmonic (twice per rev) — the famous "secondary" inertia force, caused by the finite rod length (R/L term in the acceleration expansion). *This is exactly why 4-cylinder engines need balance shafts*

How come, [FFTs again](https://jalcocert.github.io/JAlcocerT/inline-4-engine-balance/#fast-fourier-transform) when jumping to the frequency domain.

#### One Slider Crank + Gravity


{{< youtube "DlmN-Z_Ry6M" >}}


#### Slider Crank No Gravity

![alt text](/blog_img/mec/vibration_slider_crank_no_gravity_polar.png)


## Engine Configuration vs Vibrations

Im getting away with the 2D implementation so far :)

### Flat 4

### Boxer

<!-- 
https://www.youtube.com/watch?v=5SFxPu-K2xw 
-->

{{< youtube 5SFxPu-K2xw >}}


### Flat vs Boxer


### A proper I4 Analysis

I wont let you with the ai slop previous analysis.


---

## Conclusions

I was not happy with the [quick engine-balance concept](https://github.com/JAlcocerT/engine-balance) and this has been the fix.

This has been a good excuse to test `opus 4.7` via the CC Max plan:

![alt text](/blog_img/mec/mec-cc.png)


Beyond food and warm, what do you like?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


---

## FAQ

### What are those concepts?

1. FFT

2. Phasors/harmonics

Vibration spectrum

3. DC

4. Saddle-point system

5. Signal Processing

The **Saddle-Point System** is the mathematical engine under the hood of most professional multibody dynamics solvers.

It is a specific structure of linear equations that arises whenever you need to solve for motion subject to constraints—like a piston head that is forced to stay within a cylinder.

In our project, this system allows us to solve for both the **accelerations** of the parts and the **reaction forces** at the joints simultaneously.

**The Matrix Structure**

The system is organized into a block matrix that looks like this:

$$\begin{bmatrix} M & C_q^T \\ C_q & 0 \end{bmatrix} \begin{bmatrix} a \\ \lambda \end{bmatrix} = \begin{bmatrix} Q_{total} \\ \gamma \end{bmatrix}$$


* **$M$ (Mass Matrix):** This top-left block contains the masses and moments of inertia for all bodies in the system.
* **$C_q$ (Constraint Jacobian):** This represents the "geometry of the joints." It defines how the coordinates are locked together.
* **$a$ (Accelerations):** The primary unknown. These are the linear and angular accelerations we need to integrate to find the next position.
* **$\lambda$ (Lagrange Multipliers):** These represent the **constraint forces**. In our analysis, this is where we extract $R_x$, $R_y$, and the driving torque $\tau$.
* **The Zero Block:** The bottom-right $0$ is the defining "saddle" feature. It exists because constraints don't "push back" with their own mass; they only enforce geometric rules.

**Why It Is Called a "Saddle Point"**

The name comes from optimization theory. If you view the engine as a system trying to minimize its energy while staying on the track of its constraints, the solution $(a, \lambda)$ is a **minimum** with respect to the accelerations but a **maximum** with respect to the constraint forces. This creates a "saddle" shape in the mathematical landscape.

**Application in the Series**

* **Forward Dynamics:** We provide the forces ($Q_{total}$) and solve for $a$.
* **Inverse Dynamics:** We provide the motion ($a$ is known via constraints) and solve for the $\lambda$ values required to make that motion happen.
* **Vibration Source:** By solving this system at every time step, we generate a high-fidelity time-series of $\lambda(t)$. When we feed those multipliers into an FFT, we get the vibration spectrum that identifies the "I4 buzz" or the "Subaru hum."

### Volumetric efficiency

<!-- <https://www.youtube.com/watch?v=1eRsaOxxiUc> -->

{{< youtube "1eRsaOxxiUc" >}}


VE map - https://www.tactrix.com/index.php?option=com_content&view=category&layout=blog&id=36


### Holonomic vs Non Holonomic Constrains

A **holonomic** constraint is an equation of the form `C(q, t) = 0` that
must hold at every time. 

"Holonomic" means it depends only on positions (and possibly explicit time), not on velocities. 

Expanding into **non-holonomic** constraints moves the physics from "geometry of position" to "geometry of motion."

{{< callout type="warning" >}}
As somebody told me once: with non-holonomic, *you can go anywhere, but not however you want*
{{< /callout >}}

While holonomic constraints reduce the space of where a body *can be*, non-holonomic constraints restrict how a body *can move* between those positions.

#### 1. The Definition: Velocity Dependence

A **non-holonomic** constraint is typically expressed at the velocity level and cannot be integrated back into a position-only equation. It takes the form:

$$C(q, \dot{q}, t) = 0$$

Unlike a slider-crank joint (where if you know the crank angle, you know the piston position), a non-holonomic system's position depends on the **path taken**, not just the current state.

#### 2. Classic Example: The Rolling Disk (Knife-Edge)

Imagine a vertical coin rolling on a plane without slipping. 

* **Holonomic part:** The coin stays on the ground ($y = R$).
* **Non-holonomic part:** The coin must move in the direction it is pointing. 

If the coin's orientation is $\theta$ and its position is $(x, z)$, the velocity constraint is:

$$\dot{x} \sin \theta - \dot{z} \cos \theta = 0$$

You cannot turn this into an equation like $f(x, z, \theta) = 0$. If you could, you would be saying the coin is trapped on a specific curve on the floor.

Instead, by rolling and steering, the coin can eventually reach **any** $(x, z)$ position on the floor, but it can't move sideways *instantly*.

#### 3. Implications for the "Computational Machinery"

Adding non-holonomic constraints to your solver changes the math in three significant ways:

A. Degrees of Freedom Paradox

In a holonomic system, $DOF = \text{coordinates} - \text{constraints}$. 
In a non-holonomic system, you have a split:

* **Kinematic DOFs:** The number of independent velocities you can choose (restricted).
* **Configuration DOFs:** The number of coordinates needed to describe the position (unrestricted).

A car has 2 kinematic DOFs (gas and steer) but 3 configuration DOFs (it can reach any $x, y, \theta$ in a parking lot).

B. The Saddle-Point System Update

Your saddle-point matrix still works, but the $\gamma$ term and the Jacobian change. For a velocity constraint $A(q)\dot{q} = 0$, the acceleration-level constraint becomes:

$$A(q)\ddot{q} + \dot{A}(q, \dot{q})\dot{q} = 0$$

The Lagrange multipliers ($\lambda$) now represent the **forces of constraint** required to prevent slipping or sideways sliding (e.g., the lateral friction of a tire).

C. Path Dependency (The "Parallel Parking" Effect)

Because you can't integrate these constraints to find a position, you cannot use a simple **Newton-Raphson** position solver to find a valid state. 

You must integrate the velocities over time to know where the system ended up. 

This makes "Inverse Kinematics" for non-holonomic systems (like autonomous driving) much harder than for a simple robotic arm.


| Feature | Holonomic | Non-Holonomic |
| :--- | :--- | :--- |
| **Equation Type** | $C(q, t) = 0$ | $C(q, \dot{q}, t) = 0$ |
| **Integrability** | Integrable to positions | Not integrable |
| **Constraint Focus** | Restricts "where" you can be | Restricts "how" you can move |
| **Example** | Revolute joint, gear pair | Rolling wheel, ice skate, sled |
| **Solver Impact** | Reduces coordinate space | Restricts velocity space only |

**Does your current simulator need to handle "pure rolling" for the vehicle examples, or are you sticking to the "penalty-friction" approach which mimics non-holonomic behavior without the hard algebraic constraint?**