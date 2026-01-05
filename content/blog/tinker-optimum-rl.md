---
title: "Optimum Path x Reinforced Learning"
date: 2026-01-25
#date: 2026-01-02
draft: false
tags: ["Car Simulation","RL Neuronal Network"]
description: 'Finally doing this - ApexSim RL-Edition'
url: 'reinforce-learning-racing-simulator'
math: true
---

**Tl;DR**

In RL, the model doesn't learn a "sequence" like the GA.

It learns a **Policy ()**.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Py Route Tracker ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo Section" icon="github" >}}
{{< /cards >}}

<!-- 
https://youtu.be/-fY5OpiBNjI
-->

{{< youtube "-fY5OpiBNjI" >}}


**Intro**

To compare **Genetic Algorithms (GA)** and **Reinforcement Learning (RL)** for your karting project, it helps to see them as two different ways to solve the same mystery: **"What is the fastest way around this track?"**

While both will eventually find a fast lap, the process and the "final product" they produce are very different.

1. Comparison Overview

| Feature | Genetic Algorithm (GA) | Reinforcement Learning (RL) |
| --- | --- | --- |
| **What it finds** | The **Optimal Path** (A static list of commands). | The **Driving Policy** (A "brain" that knows how to drive). |
| **Learning Style** | **Survival of the Fittest:** Breeds thousands of laps and keeps the winners. | **Trial and Error:** A single "driver" learns from millions of mistakes. |
| **Computational Cost** | High during optimization, but direct math. | Very high during training (needs millions of "steps"). |
| **Generalization** | None. If you change the track, you must re-run the whole GA. | High. A trained RL agent can often drive a new track reasonably well. |
| **Best Use Case** | **Lap Time Estimation.** You want the absolute theoretical limit. | **AI Development.** You want a "ghost" to race against. |

2. How they handle the G-G Ellipse

This is where the math gets interesting for your **AMD 5600G** implementation. Both must respect your **1.0g (lat) / 0.5g (brk) / 0.4g (acc)** limits, but they "feel" them differently.

The GA Approach: The "Physics Filter"

In a GA, the "DNA" is a pre-determined sequence of inputs.

The GA doesn't know about physics; it just tries numbers.

* The code acts as a **hard filter**.
* If the GA "proposes" 100% steering and 100% braking, your code automatically "clips" those values down to the edge of the ellipse.
* The GA eventually "evolves" toward the edges of the ellipse because that’s where the most speed is.

The RL Approach: The "Sensory Reward"

In RL, the agent "feels" the G-load through its *,sensors'*.

* You give the agent a **negative reward (penalty)** every time it tries to exceed the ellipse.
* The RL agent learns to "trail-brake" naturally because it realizes that if it doesn't reduce braking, it can't turn. It effectively "learns" the shape of the ellipse through experience.


## The RL Specifics

To answer simply: **Yes**, both require specific inputs, but they look at those inputs through different lenses.

For the **GA**, your "inputs" are the **instructions** for the lap. For **RL**, your "inputs" are the **senses** the agent uses to drive.

```sh
cd 3-pointmass-rl && python3 kart_env.py
```

### 1. Data Requirements for the GA (The "Recipe")

The Genetic Algorithm doesn't "see" the track in real-time; it just follows a script. You need to provide:

* **Fixed Control Nodes:** You must decide how many "genes" the kart has. For example, one gene every 5 meters of the track. If the track is 1000m, your DNA is a list of 200 Steering/Pedal pairs.
* **Realistic Seed (Optional but Recommended):** While a GA can start with 100% random numbers, it will take ages to finish a lap. Providing a "Baseline" (like your centerline path converted into rough steering inputs) helps the GA start with a kart that at least stays on the road.
* **The Physics "Bible":** The GA needs your hard limits (**1.0g lat / 0.5g brk / 0.4g acc**) to calculate the result of its inputs.

---

### 2. Data Requirements for RL (The "Sensors")

The RL agent doesn't need a "script" of the lap. It needs to know its **State** at every millisecond so it can make a decision. This is called the **Observation Space**:

| Input Category | Specific Data Points |
| --- | --- |
| **Vehicle State** | Current Speed, Current G-Load, Current Heading (Angle). |
| **Track Awareness** | Distance to Left Boundary, Distance to Right Boundary. |
| **Look-Ahead** | The curvature of the track 10m, 20m, and 50m ahead. (This is how the AI "sees" a corner coming). |

**Do you need "Training Data" for RL?**
No. Unlike a typical AI that learns from photos, an RL agent learns by **interacting** with your physics engine. You don't give it a log of a pro driver; you give it a **Reward Function** (e.g., `+1` point for every meter traveled, `-100` points for hitting a wall).

### 3. Summary of "Inputs"

|  | Genetic Algorithm (GA) | Reinforcement Learning (RL) |
| --- | --- | --- |
| **Primary Input** | A sequence of **Timed Actions** (The DNA). | A stream of **Sensor Data** (The Observations). |
| **What you define** | How many nodes and the mutation rate. | The "Rewards" and the Neural Network layers. |
| **Starting Point** | Usually random "ghosts" or a baseline path. | A completely "clueless" agent that explores. |

Which one should you build first?

If you want to use the **track limits (CSV)** you already have, the **GA** is much easier to set up because you are just optimizing a "shape" (the sequence of inputs).

For **RL**, you would have to build a "Gym Environment"—essentially a mini-game where the AI can reset every time it crashes. This takes more coding "plumbing" before you see any results.

**Would you like me to generate the "Observation Space" logic in Python for the RL version, or should we stick to the GA "Chromosome" structure first?**


To answer simply: **Yes**, both require specific inputs, but they look at those inputs through different lenses.

For the **GA**, your "inputs" are the **instructions** for the lap. For **RL**, your "inputs" are the **senses** the agent uses to drive.


---

## Conclusions

I didnt manage to bring a complete lap for both GA nor RL setups.

But this was quite interesting anyways.


### RL Compared to GA

That is the fundamental distinction between the two. 

You have isolated the "memory" of the system in both cases:

* **GA (Genetic Algorithm):** The memory is the **Chromosome**. It is a fixed "tape" of commands. If the kart is at 50 meters, the GA looks at "Slot 50" on the tape and executes that specific steering and pedal % regardless of what is happening.

* **RL (Reinforcement Learning):** The memory is the **Neural Network**. It is a set of "synapses" (weights). The AI looks at its current speed and the track, and the network "fires" to decide the best steering and pedal % based on the situation.

1. The GA Chromosome (A "Static Script")

In a GA, you are evolving a **Look-Up Table**.

* **Structure:** `[Point 1: (S, P), Point 2: (S, P), ... Point 500: (S, P)]`
* **How it works:** It’s like a "Ghost" in a video game that always does the exact same thing at the exact same spot.
* **Pros:** It finds the "Perfect Lap" very efficiently because it can fine-tune every single meter of the track independently.
* **Cons:** If you start the kart 2 meters to the left of the starting line, the GA will fail because the "script" no longer matches the location. It has no "intelligence."

2. The RL Neural Network (A "Dynamic Brain")

In RL, you are evolving a **Function**.

* **Structure:** A mathematical equation: .
* **How it works:** The neural network doesn't have a "script." It has learned patterns. If it "sees" a sharp right turn, the weights in the network are configured to output "High Steering" and "Low Throttle."
* **Pros:** It is **Robust**. If the kart gets bumped or starts in a different position, the AI knows how to get back on the racing line because it understands the *relationship* between the track and the kart.
* **Cons:** It takes much longer to train. The "Brain" has to learn what a corner is before it can learn how to take it fast.

3. Comparison for your Karting Project

| Feature | GA Chromosome | RL Neural Network |
| --- | --- | --- |
| **Storage** | A simple array of numbers. | A complex matrix of weights. |
| **Logic** | "At 100m, steer 30%." | "If the corner is sharp, steer more." |
| **Hardware Use** | Simple, fast math on your 5600G. | Heavy matrix multiplication (better with GPU, but 5600G is okay). |
| **Result** | An **Optimal Line**. | An **Optimal Driver**. |

4. Which one should you use?

Since your goal is to **estimate the fastest lap time** for a specific track using your CSV data:

**Stick with the GA (or your current Gradient-based solver).** **Why?** Because you don't need the kart to be "smart." You just need it to be **fast**. 

A GA chromosome is much better at squeezing out that last 0.001s of lap time because it can optimize the entry into Turn 1 without affecting how it handles Turn 10. 

In a Neural Network, changing the weights to fix Turn 1 might accidentally make the AI worse at Turn 10.

> Learning a circuit *by heart* vs *learning to drive*.

Summary of the "Asymmetrical Ellipse" in both:

Whether you use a Chromosome or a Neural Network, the **Ellipse (1.0g / 0.5g / 0.4g)** is the "Law" that sits between the memory and the track.

1. **Memory** (GA or RL) proposes: "I want to steer 100% and accelerate 100%."
2. **The Law** (Ellipse) says: "Impossible. I will give you 70% of each so you don't exceed the grip limit."
3. **The Result**: The kart moves, and the lap time is recorded.


**Genetic Algorithm (GA) is the winner for your current goal.**

Since you want to estimate the fastest lap, the GA is much more direct. You can use all 12 threads of your 5600G to run hundreds of "virtual karts" in parallel.

Because a GA doesn't require a complex Neural Network to be updated every millisecond, it will likely reach the "optimal" lap time much faster than an RL agent would.

**Reinforcement Learning (RL)** is amazing if you want to see a "living" driver that reacts to things, but it requires much more "tuning" (reward functions, neural layers, etc.) just to get it to stay on the track.

Hybrid: The "Pro" Setup

Many professional racing simulations actually use a **Hybrid Approach**:

1. Use a **GA** to find the absolute "Perfect Line" (The Global Optimum).
2. Use that perfect line to **train an RL agent** (Imitation Learning).

This gives you a driver that is as fast as the math, but as flexible as an AI.




### Next Steps

1. A desktop app to boundle the best working optimum path seen so far. *And the HUD overlay for the mp4*.
2. If at some point tinkering with IoT, particularly micro-controllers: to create a DIY GPS module -> ESP32 -> telemetry to box tool. For those going into the race tracks.
3. To review how good (orhow bad) PhyPhox smartphone GPS sensor info was. Example of a Oa5pro + external gpx overlay [test 1](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#dji-and-gpx-overlay)
4. If someone is doing sim-racing and want to share some track - I could see how to tweak the scripts to make it work there


* https://github.com/mikalhart/TinyGPSPlus

>  A new, customizable Arduino NMEA parsing library 


Put together at some point this year the MBSD simulator for good. Cool animations and mechanism synthesis *coming up?*

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/things-as-a-code/#animations-as-a-code" title="Animations as a Code | Post" image="/blog_img/mechanics/fourbarlinkage.gif" subtitle="Mechanism Animation" >}}
{{< /cards >}}

<!-- 
![Matplotlib GIF Animation of a mechanism](/blog_img/mechanics/fourbarlinkage.gif) -->



---
