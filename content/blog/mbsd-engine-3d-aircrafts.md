---
title: "3D Dynamics - Vibrations for aircrafts"
date: 2026-10-17T08:20:21+01:00
draft: false
tags: ["Mechanical Engineering","MBSD v0-9-0 x Airplanes Engine Mount","ULM/PPL"]
description: 'Simulating before jumping to a plane.'
url: 'aircraft-engine-analysis'
---

**Tl;DR**

The moment 2D mechanics is not enough.

**Intro**

* WHY Im writting this post: *Bc I want to fully understand all 3d effects that will affect me during my ULM/PPL prep and as a way to test my mbsd oss fwk*
* What [Ive learnt](#conclusions) with it: *Ive ended*


<!-- www.youtube.com/watch?v=ijI3iOOcEog -->

{{< youtube "ijI3iOOcEog" >}}

{{< youtube "TiTb08qBEKY" >}}

<!-- 
https://www.youtube.com/watch?v=TiTb08qBEKY -->


The dimension reduction worked great for cars.

But how about airplanes?

Can we use [2D or 3D is a must](#summary-2d-vs-3d-for-aircraft)?



## 3D Dynamics x Airplanes

 While 2D is the "speed king" for automotive refinement, the airplane use case is where the **Dimensional Reduction Lemma** finally hits a hard wall. 

In an aircraft, you aren't just sitting on a chassis that moves up and down; you are strapped to a power plant that is physically trying to twist the entire airframe.

For an airplane, **3D is a must** for three primary reasons:

1. The Gyroscopic Precession (The "Cross-Axis" Moment)

A spinning propeller and crankshaft act as a giant gyroscope. 

In a car, the chassis stays relatively level. 

In a plane, you are constantly pitching (climbing/diving) and yawing (turning).

* **The Physics:** If you have a massive propeller spinning at 2500 RPM and you suddenly kick the rudder to **yaw** the plane left, the gyroscopic effect generates a massive **pitch** moment that tries to pull the nose up or down.

* **The Solver Requirement:** This is a cross-product effect ($\vec{M} = \vec{\omega} \times \vec{L}$).

Since it couples the rotation of one axis to a moment in another, it cannot be modeled in a single 2D plane.


---

2. Thrust-Moment Coupling

In our 2D engine model, we focused on "shake" (inertial forces). In an airplane, the **Thrust** is a massive constant vector acting along the $z$-axis (the one we ignored in 2D).

* **The Offset:** If the engine is mounted even slightly above or below the center of gravity of the wing or fuselage, that thrust creates a permanent **pitching moment**.

* **Engine Mounts:** Airplane mounts (often called "Lord mounts") have to handle this constant axial tension/compression while still isolating the $1\times$ and $2\times$ vibration from the cockpit. A 2D model literally cannot see the $z$-axis thrust.

---

3. Six-Degree-of-Freedom (6-DOF) Airframe Response

In a car, "Ground" is a stiff, heavy chassis.

In a plane, the "Chassis" is a lightweight, flexible aluminum or carbon fiber tube.

* **Complex Transmissibility:** An engine vibration might start as a vertical shake at the nose, but because the fuselage is long and flexible, it might manifest as a **tail-wagging** vibration at the rear. 

* **The Mount Matrix:** Airplane mounts are often arranged in a "ring" or "dynafocal" configuration, where the mounts are angled so their focal point is the engine's CG. This makes the $K$ (stiffness) matrix a dense 6×6 block that couples every single translation to a rotation.

Summary: 2D vs. 3D for Aircraft

| Feature | 2D Multi-Body | 3D Multi-Body |
| :--- | :--- | :--- |
| **Piston Inertia** | Perfect | Same |
| **Combustion Force** | Perfect | Same |
| **Propeller Thrust** | **Hidden** | Visible |
| **Propeller Gyroscopics** | **Impossible** | Required |
| **Tail-Wagging (Yaw)** | **Impossible** | Required |

If you are designing the **internal balance** of the engine (e.g., "Do I need counterweights on this Lycoming O-360 crankshaft?"), the **2D phasor framework** is still the best and fastest tool. 

But the moment you want to know **"Will the pilot feel a vibration in the rudder pedals during a steep turn?"**, you have to leave the 2D world and embrace the full 6-DOF 3D dynamics.

### MBSD 0-9-0 Simulation

Coming from [the 0-7-0 release](https://jalcocert.github.io/JAlcocerT/jalcocertech-services-oct/#mbsd), its time for the 0-9-0

```sh
#scp jalcocert@192.168.1.2:/home/jalcocert/multibody-tests/*.md . #v-0-7-0-concerns.md
scp jalcocert@192.168.1.2:/home/jalcocert/multibody-tests/v-0-8-0-concerns.md . 
```

I got inspired by this project roadmap: `https://dbackup.app/roadmap/`

{{% details title="For the 0-9-0 was like 🚀" closed="true" %}}

```sh
#http://192.168.1.2:3034/hermesagent/mbsd/src/branch/oss-core-2d/web
cd /home/jalcocert/Desktop/mbsd-framework/mbsd-core

git switch main
git merge --ff-only v0.8.0-dev
git tag -a v0.8.0 -m "MBSD Core v0.8.0"
git push origin main
git push origin v0.8.0

awk '
  /^## v0\.8\.0 / { found=1; next }
  /^## / && found { exit }
  found { print }
' CHANGELOG.md | gh release create v0.8.0 \
  --repo JAlcocerT/mbsd-core \
  --verify-tag \
  --title "MBSD Core v0.8.0 - Constrained spatial kinematics" \
  --notes-file - \
  --latest
```

Then examples:

```sh
cd /home/jalcocert/Desktop/mbsd-framework/mbsd-examples

git switch main
git merge --ff-only v0.8.0-dev
git tag -a v0.8.0 -m "MBSD Examples v0.8.0"
git push origin main
git push origin v0.8.0

awk '
  /^## v0\.8\.0 / { found=1; next }
  /^## / && found { exit }
  found { print }
' CHANGELOG.md | gh release create v0.8.0 \
  --repo JAlcocerT/mbsd-examples \
  --verify-tag \
  --title "MBSD Examples v0.8.0 - Constrained spatial kinematics" \
  --notes-file - \
  --latest
```

The remaining roadmap:

4. 0.8.2: fixed-orientation constrained translational dynamics.
5. 0.9.0: real rotational dynamics and orientation integration.
6. 0.9.1: rotational joints, forces and torques.
7. 0.9.2: 2D/3D API symmetry, documentation and API freeze.
8. 1.0.0: stable minimal 2D/3D kinematics and dynamics.

v0.8.1 contains no dynamics. All four v0.8.0 concerns are now addressed:

  - Contradictory drive value/velocity laws are rejected.
  - Trajectory diagnostics compare pose derivatives with reported linear and angular velocities.
  - model_id identifies structure; excitation_id identifies sampled drive behavior.
  - Highly underconstrained systems use rank-aware minimum-norm projection.
  - Nested result validation remains fully hardened.

  Verification:

  - Core: 95 tests passed.
  - Examples: 28 tests plus all runnable examples passed.
  - Ruff, builds, Twine and isolated wheel smoke tests passed.
  - Both dev branches are clean.

  Latest commits:

  - Core: 3c81df0
  - Examples: 7a4c19c

  And yes: the former 0.8.2 dynamics preview belongs in 0.9.0. After releasing 0.8.1, we should create
  a fresh v0.9.0-dev from it and selectively bring over the useful old dynamics work rather than
  releasing v0.8.2-dev.

 All six findings are addressed on v0.8.1-dev.

  - Correct rotating-frame centrifugal, Coriolis and Euler forces.
  - Correct physical reaction sign: -Cq.T @ lambda.
  - Reject non-unit quaternions and invalid/mismatched diagnostics.
  - Export and validate unit-separated spatial residual metrics.
  - Include CAM and point-on-line Jacobian time derivatives.
  - Clearly label the spherical example as an underdetermined kinematic path.

  Verification:

  - Core: 101 tests passed.
  - Examples: 28 tests and all examples passed.
  - Ruff, builds, Twine and isolated-wheel smoke tests passed.
  - Both repositories are clean.

  Latest commits:

  - Core: 8ca7d01
  - Examples: 6e956c5

  No spatial dynamics was added. That work starts with the fresh v0.9.0-dev line after releasing 0.8.1.

{{% /details %}}

> https://app.multibodysystemsdynamics.com/?demo=slider-crank&r=0.35&l=1.15&e=0&rpm=60&steps=241


---

## Conclusions

Who could have guessed: for bicycles and for airplanes we have to level up the modelling to 3D


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


---

## FAQ
