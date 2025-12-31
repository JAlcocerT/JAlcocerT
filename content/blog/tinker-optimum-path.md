---
title: "Optimum Path in Karting"
#date: 2026-01-03
date: 2025-01-01T07:20:21+01:00
draft: false
tags: ["Karts","GPS Telemetry","Cars","Mechanics","G-Circle"]
description: 'GP2 engine.'
url: 'kart-optimum-path'
math: true
---

**TL;DR**

A simple starting model to find the optimum path in karting.

**Intro**

Based on the gopros data and videos you can find online, you can see whats the G-circle model is all about.

See that generally a kart can accelerate up to: 0.3G

Brake up to: 1G

And turn up to: ~1G

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/tinker-racing/" title="Tinkering with Racing and GoPro GPS" image="/blog_img/data-experiments/kart/matplotlib-driver-comparison.png" subtitle="Using GPS data to compare karting laps and generate HUD overlay videos" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="NEW - Optimum Path Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Few models to get the optimum path on a given track by a given vehicle. For fun." >}}
{{< /cards >}}

## How to find the optimum path in karting?

This is a great moment to step back and look at the "Architecture" of your karting simulator.

You are moving from raw data to a high-level optimization problem.

In real life *unlike (apparently) in modern economics* if you assume that a sferic cow will fly - you will be laughed at (and fail quickly).


So these strategies to estimate that fastest lap have all HYPOTHESIS with pros/cons.

### 1. The Data Foundation (The Input)

* **Source:** You have **NSP** (Haltech) and **CSV** files containing track limits and G-limits.
* **Hypothesis:** The physical limits of the kart are constant (Max , Max ), but acceleration decreases as a function of speed: .
* **Pros:** CSV is universal and easy to manipulate in Python.
* **Cons:** NSP is proprietary; you’ll likely need to export it to CSV to make it "readable" for your script.

---

### 2. The Physics Models (The "Engine")

We discussed two ways to treat the kart:

| Model | Hypothesis | Pros | Cons |
| --- | --- | --- | --- |
| **Point Mass (G-G Circle)** | The kart is a single dot. Grip is a perfect circle (or ellipse). | Very fast to calculate; requires very little data. | Ignores weight transfer, chassis flex, and tire "scrub." |
| **Bicycle Model** | Accounts for CG height and weight transfer. | More realistic "yaw" (rotation) modeling. | Requires more measurements (CG height, wheelbase). |

---

### 3. The Path Strategies (The "Line")

This is where the actual "lap time" is found.

#### Option A: Minimum Curvature Path (MCP)

* **Hypothesis:** The fastest way is the "smoothest" way (maximizing radius ).
* **Pros:** Mathematically elegant; very fast to solve; much better than the centerline.
* **Cons:** Ignores the "Late Apex" advantage. It treats a 10m straight and a 100m straight the same way.

#### Option B: Late Apex (Momentum/Time Bias)

* **Hypothesis:** Sacrificing mid-corner speed for a straighter exit wins time on long straights.
* **Pros:** This is how professional drivers actually drive.
* **Cons:** Harder to calculate with a simple formula; requires "looking ahead" at the track.

---

### 4. The Solver (The "Brain")

Since you have an **AMD 5600G**, you have the power to choose how to find the best line:

#### The Genetic Algorithm (GA) — *Recommended*

* **How it works:** Evolution. It tries 100 lines, keeps the 10 fastest, "mutates" them, and repeats.
* **Pros:** * It will "discover" the late apex on its own because it only cares about the lowest time.
* Easy to code in Python (`PyGAD` or `NumPy`).
* Perfect for your 5600G (you can run 12 "generations" at once).


* **Cons:** Can take a few minutes to converge on the "perfect" lap.

#### Neural Networks / Reinforcement Learning

* **How it works:** An AI "agent" drives the kart millions of times to learn the limits.
* **Pros:** Can handle very complex physics (sliding, grass, etc.).
* **Cons:** Massive overkill for a point-mass model; very high "coding cost" to setup the environment.

Summary of My Recommendations for You:

1. **Format:** Convert everything to **CSV**.
2. **Physics:** Use the **G-G Ellipse** (allowing more braking Gs than acceleration Gs) combined with your ** decay function**.
3. **Pathing:** Use a **Genetic Algorithm**.
* Use **Splines** (don't optimize every point, just "control points").
* Use **Vectorization** (NumPy) so your 5600G can calculate 1,000 laps per second.


4. **The Result:** This will give you a "Theoretical Best" lap time that accounts for the specific top speed (85 km/h) and power drop-off of your kart.


## Optimum Path v1 - The mass point model

```sh
#sudo apt install gh
gh auth login
#gh repo create make-podcast --private --source=. --remote=origin --push
    
git init && git add . && git commit -m "Initial commit: simple landing website" && gh repo create optimum-path --private --source=. --remote=origin --push
```



---

## Conclusions





---

## FAQ


