---
title: "The physics of Mechanisms in the SPACE"
date: 2026-04-28T09:20:21+01:00
draft: false
tags: ["MBSD x 3D Simulation","CADQuery x Blender"]
description: 'The Dynamics x Kinematics of you ve been waiting for.'
url: '3d-mbsd'
math: true
---


**TL;DR**


**Intro**


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD | Repo" icon="github" >}}
{{< /cards >}}

## About MBSD

I wouldnt let you with just the [3d bicycle model](https://github.com/JAlcocerT/mbsd/tree/master/bike-real-time-simulator) explained here.



Notice the difference between **visual representation** and **mathematical modeling**. 

In engineering software, there is a common trap called the "3D Mirage": the assumption that because a scene *looks* three-dimensional, the underlying physics must be solved in 3D to be valid. 

You’ve correctly identified that for this project, 3D simulation is a massive "Tax" with zero "Refund" for the engine-NVH story.

Here is a deeper dive into why your three points are the correct strategic stance for the repo:

1. The "Quaternion Tax" (Scope)

Rewriting the solver in 3D isn't just "adding a Z-coordinate." 

It changes the fundamental algebra of the system.

* **Non-Commutative Rotations:** In 2D, rotations are scalar additions. In 3D, the order of rotation matters ($\text{Roll} \times \text{Pitch} \neq \text{Pitch} \times \text{Roll}$).

Dealing with Quaternions or Euler Angles to avoid "Gimbal Lock" adds layers of complexity to every Jacobian and every constraint equation.

* **The " sitting" vs. "man-years" reality:** As you noted, the saddle-point solver for a 3D system requires 6-DOF mass matrices and complex 3D contact normals. You would be pivoting from an **NVH E-Book** to a **Numerical Methods Research Project.**


2. The Dimensional Reduction is the "Hero" (Analytical Truth)

The **Dimensional Reduction** chapter is arguably the most "senior engineer" part of the whole book. It proves that you have understood the physics deeply enough to simplify it.
* **Exact vs. Approximate:** Because the reduction is algebraic and exact under your four hypotheses, a 3D solver would simply be a more expensive way to arrive at the same destination. 
* **Insight through Simplicity:** In 2D, a reader can see why a Boxer-4 cancels its primary force ($1 - 1 = 0$). In a 3D solver, that zero would be buried inside a $6 \times 6$ matrix, making the "Why" much harder to see.

3. When 3D is Actually Worth It (The Boundary)

Your table of 3D-necessities is spot-on. I’d emphasize the **Gyroscopic Effect** as the primary "Wall." 
* **The "Hidden" Moment:** In an airplane or a motorcycle leaning into a turn, the spinning crankshaft creates a moment perpendicular to its axis. 
* **The Verdict:** Unless the repo's goal shifts to **"Aircraft Aerobatic Dynamics"** or **"Hypoid Gear Design,"** 3D simulation is "Gold-Plating"—it adds cost without adding value to the core NVH narrative.


This physics reference is a rigorous, high-level blueprint for a 3D Multibody Dynamics engine.

It correctly identifies the "Saddle-Point" system as the common ancestor of both 2D and 3D solvers, while meticulously cataloging the **non-linear taxes** (quaternions, gyroscopic terms, and rotated inertia tensors) that 3D imposes.

To elevate this from a reference doc to a "deep learning" resource, I suggest three targeted technical refinements.

1. The "H-Matrix" Geometric Intuition (Section 1)
You mention $H(q)$ as the bridge between $\omega$ and $\dot{q}$. For a developer or physicist, it is helpful to clarify *why* this is a $4 \times 3$ matrix.
* **Clarification:** Angular velocity $\omega$ lives in the tangent space of the rotation manifold (it has 3 components: $x, y, z$ rates). The quaternion $q$ lives on the 4D unit sphere ($S^3$). The $H(q)$ matrix essentially performs the **projection** of a 3D rotation rate onto the 4D surface of that sphere. Without this mapping, you cannot "step" your orientation forward in time.

2. The Steiner/Parallel-Axis Tensor (Section 2)
In 2D, the parallel axis theorem is a simple addition: $I_{ref} = I_{cg} + md^2$. In 3D, it becomes a matrix operation.
* **Refinement:** The term $m[R \cdot r_G]_\times \cdot [R \cdot r_G]_\times^T$ is actually a **triple cross-product** in matrix form. It creates a "spatial lever arm" that couples translation to rotation. If the reference point is not at the CG, every time the body accelerates linearly, it generates a 3D torque—this is what makes the 6x6 mass matrix "dense" and computationally heavier.


3. The "h(q, v)" Term: The Gyroscopic Ghost (Section 6 & 7)
You correctly identify $\omega \times (I \cdot \omega)$ as the source of gyroscopic effects. 
* **The "Zero-G" Trap:** In 2D, if you stop pushing an object, it just slides. In 3D, if you stop pushing a spinning object with asymmetric inertia (like a T-handle), the $h(q, v)$ term continues to act, causing the body to flip or "tumble" (the Dzhanibekov effect). This is a purely **inertial** force—it requires no external torque to manifest, only the internal "fight" between the different principal moments of inertia.



### 2D MBSD Recap

For some reason, I ended up accelerating with this.

Nothing to do with using SOA cc models. Sure.

Anyways, this is done:

1. The matlab bycicle thesis is translated to python [here](https://jalcocert.github.io/JAlcocerT/3d-mbsd-bicycle/).

2. 2D mechanisms with AR vectors and with blender, done.

```sh
cd /home/jalcocert/Desktop/3Design/mbsd-to-render
printf "file '%s'\n" *.mp4 > concat.txt
ffmpeg -f concat -safe 0 -i concat.txt -c copy all_mechanisms.mp4
mpv all_mechanisms.mp4
```

<!-- https://youtu.be/KA7HloE6IQY -->

{{< youtube "KA7HloE6IQY" >}}

3. Around slidercranks and a NVH stack: engine balance, balance shafts, active damping...

![alt text](/blog_img/mec/i4_nvh_timeseries.gif)

![alt text](/blog_img/mec/v10_nvh_timeseries.gif)


4. 

Close the last mile of the NVH chain — chassis modal response. 

Take F_chassis(ω) from the engine-mounts chapter and propagate it through a simple modal model of a body shell to predict cabin acceleration.

This is the layer the driver actually feels, and it reuses the same transmissibility / phasor language one more time. Smallest scope, finishes a story we explicitly left open.

Branch the framework into a second mechanism — valvetrain (cam-follower) NVH or terrain/wheel (suspension NVH). 

Same framework spine — source spectrum, transmissibility, optional active control — but on a totally different mechanism.

Opens a parallel narrative arc, repo's adjacent examples become first-class citizens. Largest payoff for repo coherence, biggest scope.

Lift the e-book out of raw markdown — top-level TOC chapter, master "field guide" mindmap of all 11 series chapters + 4 reference chapters, possibly a printable PDF build.

Pure consolidation, no new physics.

Since we’ve established that the "Dimensional Reduction" isn't an approximation but a strategic **decomposition**, a high-quality comparison table should focus on where the engineering "effort" is spent versus the "insight" gained.

Here is an improved breakdown comparing the two approaches specifically for the **Multi-Body System Dynamics (MBSD)** and **NVH** use cases.

The 2D vs. 3D Simulator Tradeoff

| Feature | **The 2D Framework (Current)** | **A Full 3D Simulator** |
| :--- | :--- | :--- |
| **Mathematical Core** | Scalar rotations; $3 \times 3$ mass matrices per body. Linear geometry. | Quaternions/Rotation matrices; $6 \times 6$ mass matrices. Non-commutative algebra. |
| **Constraint Logic** | Jacobians are simple $(x, y, \theta)$ partials. Easy to debug by hand. | Complex 3D Jacobians. Requires "Gimbal Lock" prevention (Quaternions). |
| **Performance** | Near-instantaneous. Allows 900-cell Monte Carlo design sweeps in seconds. | Computationally heavy. Sweeps take minutes or hours; optimization is slower. |
| **Engine NVH Truth** | **Exact** for forces and rocking moments (via the Dimensional Reduction Lemma). | Same numerical results, but with higher overhead and "numerical noise" risk. |
| **Contact Physics** | Planar curves. Penalty-contact and friction are stable and fast. | 3D mesh-to-mesh or surface-to-surface contact. Highly complex and prone to "jitter." |
| **Mental Model** | **High Clarity.** You can see the phasor cancellation ($1 - 1 = 0$) visually. | **Obscured.** Results are buried in large matrices; physical intuition is harder to keep. |

---

When 2D is the "Correct" Choice

For the engine and suspension arcs, 2D is the superior tool because it follows the 

**Principle of Sufficient Fidelity**. You are modeling:
* **Coplanar Linkages:** Pistons and rods move in parallel planes.
* **Vertical Dynamics:** Suspension "ride" is primarily a $Z$-axis (vertical) problem.
* **Harmonic Summation:** 3D moments (pitch/yaw) are just $Z$-weighted 2D forces.

### When the "3D Wall" is Hit

You only move to 3D when the physics **cannot be projected** onto a plane without losing the primary effect.

| Phenomenon | Why 3D is Mandatory |
| :--- | :--- |
| **Gyroscopic Precession** | The interaction between a spinning crank and a pitching vehicle creates a moment **perpendicular** to both. |
| **Non-Coplanar Joints** | Any mechanism where the pins/pivots do not share a common parallel axis (e.g., a 3D robotic arm or a steering linkage with "toe" change). |
| **3D Contact Geometry** | Modeling how a **hypoid gear** or a **helical gear** meshes; the force vector has a significant component along the shaft. |
| **Vehicle Roll/Yaw** | Modeling a car taking a corner at the limit, where lateral grip and vertical load-transfer couple into the body's roll and pitch simultaneously. |


In the e-book, we use the **2D Simulator** to do the heavy lifting because it is mathematically transparent and lightning-fast. 

We then use **3D Visualization** (Three.js) to show the phase-shifted pistons. 

This "2D-Math + 3D-Art" hybrid is the global optimum for teaching: it gives the reader the **exact physical answer** without drowning them in the **quaternion tax** of a 3D solver.




#### Engine Balance

This project has successfully built a "Full-Stack" engine simulator. 

Have gone from:

Inverse Kinematics (Position/Velocity)
Inverse Dynamics (Inertial Forces)
Phasor Superposition (Multi-cylinder linear sums)
Spatial Geometry (V-engine vectoring)
Thermodynamic Forcing (Combustion harmonics)

![alt text](/blog_img/mec/i4_nvh_timeseries.gif)

| Engine | Primary Shake ($1\times$) | Secondary Shake ($2\times$) | Rocking Moment ($M$) | The "X-Ray" Visual |
| :--- | :--- | :--- | :--- | :--- |
| **I3** | Balanced | Balanced | **High Unbalance** | Aggressive "See-saw" nodding. |
| **I4** | Balanced | **High Unbalance** | Balanced | Rapid vertical "piston" pulse. |
| **I5** | Balanced | Balanced | **Moderate Unbalance** | Complex "Snaking" thrum. |
| **I6** | **Balanced** | **Balanced** | **Balanced** | **Perfectly still.** |
| **V6 (60°)** | Balanced | Balanced | **Moderate Unbalance** | Steady "Nodding" rock. |
| **V8 (Flat)** | Balanced | **High Unbalance** | Balanced | Horizontal 2× "Buzz." |
| **V8 (Cross)**| Balanced | Balanced | **Rotating Couple** | Constant-magnitude spinning "wobble." |
| **V10 (72°)** | Balanced | Balanced | **Highest Unbalance** | Large, high-leverage rocking. |
| **V12 (60°)** | **Balanced** | **Balanced** | **Balanced** | **Perfectly still.** |

![alt text](/blog_img/mec/v10_nvh_timeseries.gif)


{{< callout type="info" >}}
Possible at 2D thx to some Dimensional Generalization!
{{< /callout >}}

## 3D MBSD

{{< callout type="info" >}}
For my **reference**, its all distilled [here](https://github.com/JAlcocerT/mbsd/tree/master/z-destilled-ebook)
{{< /callout >}}


### MBSD x Coordinates


#### 3D Coordinates


#### 3D MBSD x Reference Coordinates

The bicycle model was not using reference/absolute coordinates as I wanted to reduce the computational load to make the simulation real time back in te days.

With reference coordinates, you have a very systematic approach, at the cost of solving more equations.

If you dont care about performance and what to optimize for reach of mechanism analysis, this is for you.

### 3D Kinematics

But if you want to do 3D mechanics, you need to get 3D kinematics right first.


There are many interesting effects in 3D that simply dont exist in 2D.


### 3D Dynamics


### 3D Strange Effects


---

## Conclusions


We have gone from:



To:




{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a MBSD framework in Python" >}}
{{< /cards >}}

If you want to ship:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}


---

## FAQ

### Interactivity

* https://brm.io/matter-js/

>  Matter.js is a 2D physics engine for the web 

* ThreeJS has been interesting and D3JS promising for D&A

### Bike MultiBody Model

The bicycle is modelled as **4 rigid bodies** connected by joints: *just 9 degrees of freedom remaining!*

| Body | Label | Description | Joints |
|------|-------|-------------|--------|
| 2 | Rear wheel | Spins freely about its axle | Pin joint to frame |
| 3 | Frame + rider | Main rigid body | Free in space (3 translation + 3 rotation DOFs) |
| 4 | Handlebar + fork | Steerable assembly | Revolute joint to frame about head tube axis |
| 5 | Front wheel | Spins freely about its axle | Pin joint to fork |


The simulator uses **multibody dynamics in generalized coordinates** — a classical analytical mechanics approach where the system state is described by the minimum set of independent coordinates that fully describe its configuration.

|Fundamental Assumption | Implication |
|------------|-------------|
| All four bodies are **perfectly rigid** | No structural deformation; mass distribution is fixed in each body frame |
| Ground is a **flat infinite plane** at z = 0 | No road irregularities, no slope, no banking |
| Tire cross-section is a **toroid with elliptical profile** | Contact point shifts with lean angle; no flat-spot approximation |
| Wheel-ground contact is **elastic (soft constraint)** | Modelled as a spring-damper; no kinematic non-penetration constraint |
| Aerodynamics act **only at the frame CoG** | No lift, no side force, no pressure distribution over the bike geometry |
| Gravitational field is **uniform** | `g = 10 m/s²` downward (−z direction) |
| Air is **still** (zero wind) | Aerodynamic force depends only on body velocity |
| Tire friction is a **combined slip bristle model** | No temperature dependence, no progressive wear |
| The bicycle is **symmetric** about its plane of travel | All `y`-offsets of CoGs are zero |
| Joints are **ideal** (no friction, no compliance) | Pin joints at axles transmit forces perfectly |

What the model does NOT capture

- Road camber, bumps, or surface roughness
- Tire sidewall dynamics or pneumatic pressure effects
- Structural flexibility (frame flex, fork flex)
- Suspension (no spring/damper between wheel and frame)
- Rider body dynamics (rider is rigidly attached to frame, body 3)
- Wind, rain, or temperature effects
- Motor/drivetrain dynamics (pedaling torque is applied directly as a generalized force)

Each rigid body has its own local frame, whose orientation relative to the global frame is given by a rotation matrix `Aᵢ(q)`.

Body frames are **right-handed** and aligned with the principal axes of inertia when at zero lean/pitch/steer.

**Angular rotation convention**: Euler angles are applied in this sequence for the frame body (body 3).

1. **Roll** `φ` (phi) — rotation about the X axis (lean)
2. **Yaw** `ψ` (psi) — rotation about the Z axis (heading change)
3. **Pitch** `θ` (theta) — rotation about the Y axis (tilt forward/back)

The resulting rotation matrix A3 maps body-frame vectors to global-frame vectors:

```
r_global = A3(q) · r_body
```

Each body has:

- A **mass** `mᵢ`
- A **center of gravity (CoG)** position expressed in body-frame coordinates
- A **3×3 inertia tensor** `Iᵢ` in body frame

The system has **9 generalized coordinates** `q ∈ ℝ⁹` (0-indexed in Python):

| Index | Symbol | Type | Description | Unit |
|-------|--------|------|-------------|------|
| 0 | Rx3 | translation | X position of frame reference point | m |
| 1 | Ry3 | translation | Y position of frame reference point | m |
| 2 | Rz3 | translation | Z position of frame reference point | m |
| 3 | φ (phi) | rotation | Roll angle of frame (lean) | rad |
| 4 | ψ (psi) | rotation | Yaw angle of frame (heading) | rad |
| 5 | θ (theta) | rotation | Pitch angle of frame | rad |
| 6 | γ (gamma) | rotation | Steering angle (handlebar about head tube axis) | rad |
| 7 | ε (epsilon) | rotation | Front wheel spin angle | rad |
| 8 | ν (nu) | rotation | Rear wheel spin angle | rad |

The frame reference point (Rx3, Ry3, Rz3) is a point fixed to body 3 near the bottom bracket. 

It is **not** the CoG of body 3 — the CoG is offset by `[XG3, 0, ZG3] = [0.20, 0, 0.10]` in the body frame.

The full state vector is `y = [q; q̇] ∈ ℝ¹⁸`, where `q̇` are the generalized velocities.

Why these coordinates?

- The 3 translational DOFs `(Rx3, Ry3, Rz3)` locate the bicycle in space.
- Roll `φ`, yaw `ψ`, pitch `θ` orient the frame. This ordering produces a rotation matrix without singularities at the operating angles of interest.
- Steering `γ` is relative to the frame — it is the handlebar rotation about the (tilted) head tube axis.
- Wheel spin angles `ε` and `ν` are needed to compute tire slip and gyroscopic forces.


#### Equations of Motion

The dynamics follow the **Newton-Euler formulation in generalized coordinates**:

```
M(q) · q̈ = Q(q, q̇)
```

Where:

- `q` — 9-element generalized coordinate vector
- `M(q)` — 9×9 symmetric positive-definite mass matrix (configuration-dependent)
- `Q(q, q̇)` — 9-element generalized force vector (sum of all forces)

`Q` is assembled from four independent contributions:

```
Q = Q_grav + Q_coriolis + Q_aero + Q_contact + Q_steer + Q_pedal
```

**Mass Matrix**

Computed using the **composite rigid body algorithm**:

```
M = Σᵢ [ mᵢ · Jvᵢᵀ Jvᵢ  +  Jwᵢᵀ · Iᵢ_global · Jwᵢ ]
```

Where `Jvᵢ` and `Jwᵢ` are the translational and angular Jacobians of body `i`, and `Iᵢ_global = Aᵢ · Iᵢ_body · Aᵢᵀ` transforms the body-frame inertia tensor to global frame.

Jacobians are computed **numerically via central finite differences** on the rotation matrices and CoG position functions (step size `ε = 1e-7`).

This avoids translating 590 lines of symbolic MATLAB code at the cost of ~18 extra `mass_matrix()` calls per Coriolis evaluation.

**Coriolis & Centrifugal Forces**

Computed from **Christoffel symbols of the first kind**:

```
Qvᵢ = -Σⱼₖ Γᵢⱼₖ · q̇ⱼ · q̇ₖ

Γᵢⱼₖ = ½ (∂Mᵢⱼ/∂qₖ + ∂Mᵢₖ/∂qⱼ − ∂Mⱼₖ/∂qᵢ)
```

`∂M/∂qₖ` is evaluated numerically (central finite differences on `mass_matrix()`).

**Tire-Ground Contact**

Each wheel uses an **elastic contact model**:

**Normal force** — spring-damper with indentation `δ`:

```
Fn = Kn · |δ|  +  c_damp · δ̇ · δ       (active when δ < 0)
```

**Tangential force** — piecewise linear (bristle model) saturated by a friction ellipse:

```
Longitudinal:  Fx = μx · Fn · (κ / κc)      if |κ| ≤ κc
               Fx = μx · Fn · sign(κ)         otherwise

Lateral:       Fy = μy · Fn · (α / αc)       if |α| ≤ αc
               Fy = μy · Fn · sign(α)         otherwise
```

With elliptic saturation: if `(Fx/μx)² + (Fy/μy)² ≥ Fn²`, both components are scaled back onto the friction ellipse.

- `κ` = longitudinal slip ratio (wheel slip vs. rolling speed)
- `α` = slip angle (angle between wheel heading and velocity vector)
- `κc`, `αc` = critical slip thresholds (both default to 0.12 rad)
- `μx = μy = 0.9` — friction coefficients

The contact point geometry accounts for the **toroidal tire cross-section** (ellipse semi-axes `a_n = b_n = 0.02 m`), which shifts the effective contact radius with lean angle.

**Applied Torques**

Steering and pedaling torques are projected into generalized coordinates using the angular Jacobians `G4g` (handlebar) and `G2g` (rear wheel):

```
Q_steer = G4gᵀ · [0, 0, τ_steer]
Q_pedal = G2gᵀ · [0, τ_pedal, 0]
```

State Vector & Generalized Coordinates

The state vector `y` has 18 elements: `y = [q; q̇]`

**Generalized Coordinates `q` (indices 0–8)**

| Index | Symbol | Description |
|-------|--------|-------------|
| 0 | Rx3 | Frame origin — x position (m) |
| 1 | Ry3 | Frame origin — y position (m) |
| 2 | Rz3 | Frame origin — z position (m) |
| 3 | φ (phi) | Roll angle — lean (rad) |
| 4 | ψ (psi) | Yaw angle — heading (rad) |
| 5 | θ (theta) | Pitch angle (rad) |
| 6 | γ (gamma) | Steering angle — handlebar rotation (rad) |
| 7 | ε (epsilon) | Front wheel spin angle (rad) |
| 8 | ν (nu) | Rear wheel spin angle (rad) |

**Generalized Velocities `q̇` (indices 9–17)**

Same ordering as coordinates. Initial conditions:

```python
q0 = [0, 0, 0.97, 0, 0, 0, 0, 0, 0]   # starts at 0.97 m height
v0 = [10, 0, 0, 0, 0, 0, 0, 10/0.34, 10/0.34]  # 10 m/s forward, wheels spinning
```

### Primary vs SecoNdary Balance

It actually **does** make sense to talk about secondary moments!

In many high-performance and luxury engine designs, the secondary moment is the "final boss" of engine refinement.

However, in introductory engineering or basic automotive discussions, it is often ignored for three specific reasons:

1. The Magnitude Gap

In most common engines (like the Inline-4), the **secondary force** is so massive and intrusive that it completely overshadows any small residual moments.

* In an I4, the secondary force is a vertical "hammer" hitting the mounts at twice engine speed.
* Because the I4 is axially symmetric, the secondary **moment** is mathematically zero. 
* People get used to saying "Secondary = Force" because the most common engine on earth only has the force component.

2. The Frequency Problem
Vibrations are felt differently based on their frequency ($Hz$).

* **Primary (1x):** Felt as a low-frequency "shake" or "rock." It moves the whole car.
* **Secondary (2x):** At 3000 RPM, a secondary vibration is at $100\text{ Hz}$. This is felt more as a "buzz" or "hum" in the floorboards and steering wheel rather than a physical rocking of the chassis.
* Because the secondary moment is a high-frequency "twisting" motion, it is often absorbed by the rubber engine mounts before the driver can feel it as a distinct "rocking."

Where it DOES matter (The Exceptions)

There are specific engines where you **cannot** ignore the secondary moment:

* **Inline-5:** As your analysis showed, the I5 has zero secondary force but a non-zero secondary moment. Here, the secondary moment is the *primary* source of the engine's high-frequency "warble."
* **V6 90°:** The secondary moments are large enough here that they can cause "steering wheel nibble" if not addressed with balance shafts.
* **Large Displacement Engines:** Because the secondary moment scales with the square of the stroke and the mass of the pistons, a "big block" engine will have secondary moments that are physically powerful enough to shear bolts if left unchecked.



### References


#### 3D concepts


#### 3D physics