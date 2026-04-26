---
title: "3D vibrations for aircrafts"
date: 2026-12-25T08:20:21+01:00
draft: false
tags: ["Mechanical Engineering","MBSD x Airplanes Engine Mount"]
description: 'Simulating .'
url: 'aircraft-engine-analysis'
---


https://www.youtube.com/watch?v=TiTb08qBEKY

**Tl;DR**

The moment 2D mechanics is not enough.

**Intro**

The dimension reduction worked great for cars.

But how about airplanes?

Can we use [2D or 3D is a must](#summary-2d-vs-3d-for-aircraft)?






---

## Conclusions

Who could have guessed: for bicycles and for airplanes we have to level up the modelling to 3D


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


---

## FAQ

Spot on. While 2D is the "speed king" for automotive refinement, the airplane use case is where the **Dimensional Reduction Lemma** finally hits a hard wall. 

In an aircraft, you aren't just sitting on a chassis that moves up and down; you are strapped to a power plant that is physically trying to twist the entire airframe.

For an airplane, **3D is a must** for three primary reasons:

### 1. The Gyroscopic Precession (The "Cross-Axis" Moment)

A spinning propeller and crankshaft act as a giant gyroscope. 

In a car, the chassis stays relatively level. 

In a plane, you are constantly pitching (climbing/diving) and yawing (turning).

* **The Physics:** If you have a massive propeller spinning at 2500 RPM and you suddenly kick the rudder to **yaw** the plane left, the gyroscopic effect generates a massive **pitch** moment that tries to pull the nose up or down.

* **The Solver Requirement:** This is a cross-product effect ($\vec{M} = \vec{\omega} \times \vec{L}$).

Since it couples the rotation of one axis to a moment in another, it cannot be modeled in a single 2D plane.


---

### 2. Thrust-Moment Coupling

In our 2D engine model, we focused on "shake" (inertial forces). In an airplane, the **Thrust** is a massive constant vector acting along the $z$-axis (the one we ignored in 2D).

* **The Offset:** If the engine is mounted even slightly above or below the center of gravity of the wing or fuselage, that thrust creates a permanent **pitching moment**.

* **Engine Mounts:** Airplane mounts (often called "Lord mounts") have to handle this constant axial tension/compression while still isolating the $1\times$ and $2\times$ vibration from the cockpit. A 2D model literally cannot see the $z$-axis thrust.

---

### 3. Six-Degree-of-Freedom (6-DOF) Airframe Response

In a car, "Ground" is a stiff, heavy chassis.

In a plane, the "Chassis" is a lightweight, flexible aluminum or carbon fiber tube.

* **Complex Transmissibility:** An engine vibration might start as a vertical shake at the nose, but because the fuselage is long and flexible, it might manifest as a **tail-wagging** vibration at the rear. 

* **The Mount Matrix:** Airplane mounts are often arranged in a "ring" or "dynafocal" configuration, where the mounts are angled so their focal point is the engine's CG. This makes the $K$ (stiffness) matrix a dense 6×6 block that couples every single translation to a rotation.

### Summary: 2D vs. 3D for Aircraft

| Feature | 2D Multi-Body | 3D Multi-Body |
| :--- | :--- | :--- |
| **Piston Inertia** | Perfect | Same |
| **Combustion Force** | Perfect | Same |
| **Propeller Thrust** | **Hidden** | Visible |
| **Propeller Gyroscopics** | **Impossible** | Required |
| **Tail-Wagging (Yaw)** | **Impossible** | Required |

If you are designing the **internal balance** of the engine (e.g., "Do I need counterweights on this Lycoming O-360 crankshaft?"), the **2D phasor framework** is still the best and fastest tool. 

But the moment you want to know **"Will the pilot feel a vibration in the rudder pedals during a steep turn?"**, you have to leave the 2D world and embrace the full 6-DOF 3D dynamics.