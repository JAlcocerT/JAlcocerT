---
title: "Optimum Path with Genetic Algorithm"
#date: 2026-01-24
date: 2026-01-02
draft: false
tags: ["Car Simulation","","GA vs RL"]
description: 'Finally doing this - ApexSim GA-Edition'
url: 'genetic-algorithm-for-racing'
math: true
---

**TL;DR**

Time to level up the modelling!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

**Intro**

Recently I was exploring the GoPro GPS telemetry to get flying laps information and creating a simple point mass simulator on that same circuit.


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Py Route Tracker ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo Section" icon="github" >}}
{{< /cards >}}

The Problem: Position ≠ Actions

Gradient solver (v1) optimizes: Positions (x, y) - where to be on track

Implicitly: "drive along this line"

Now, the GA (v2) needs: Actions (steering, pedal) - what to do

What's Happening in Gen 0: The ga_converter.py converts gradient results to steering/pedal:


Goes off-track → fitness = 100s penalty + remaining distance ≈ 1000s+

What WILL Happen: the GA will learn from scratch:

Gen 1-10: Random mutations stumble upon "stay on track" strategies
Gen 10-30: Evolution finds basic control patterns that complete laps
Gen 30-100: Refinement toward optimal ~80s
The gradient seeds aren't helping much due to the physics mismatch, but that's OK - the GA will evolve its own solution! 🧬

Let it run - you should see improvement soon!


### The initial genes

From...the gradient seeds!

```sh
python3 apexsim_v1.py
```

✅ All 20 complete the lap (gradient solver guarantees)
✅ Diverse lap times (85.84s → 80.36s)
✅ Different strategies (early vs late optimization)
✅ Only 20 files (manageable)
✅ Actually useful for GA!

Dont overcomplicate it and get the guarantee that at least those are finishing the lap, not crashing and not doing very slow laps.

<!-- 
https://youtu.be/3A6fIKeBTRo 
-->

{{< youtube "3A6fIKeBTRo" >}}


### Running the Genetic Path Optimizer

```sh
#cd 2-pointmass-ga/
#ga_converter.py executed via the apexsim_v1.py script will generate the ga_seed_variations folder
chmod +x test_phase3.py && python3 test_phase3.py

chmod +x apexsim_ga.py
python3 apexsim_ga.py
```

```
✓ Evolution stopped: Max generations (100) reached

Step 5: Generating visualizations...
  ✓ Saved: results/ga_input_profile.png
  ⚠ Skipping G-G diagram (simulation didn't finish)
  ✓ Saved: results/ga_convergence.png
  ✓ Saved: results/ga_racing_line.png

Step 6: Exporting results...
  ✓ Saved: results/ga_best_chromosome.csv
  ⚠ Skipping detailed export (simulation didn't finish)
  ✓ Saved: results/ga_report.txt

============================================================
  EVOLUTION SUMMARY
============================================================
============================================================
  ApexSim GA-Edition - Evolution Report
============================================================

TRACK INFORMATION
  Length: 1781.88 m
  Points: 2651

VEHICLE PARAMETERS
  Top Speed: 85.0 km/h
  Max Lateral G: 1.0g
  Max Braking G: 0.6g
  Max Accel G: 0.3g

GA CONFIGURATION
  Population Size: 200
  Elitism: 10
  Crossover Prob: 70.0%
  Mutation Prob: 20.0%
  Control Nodes: 392

EVOLUTION RESULTS
  Generations: 100
  
  Initial Best Fitness: 1706.90 s
  Final Best Fitness:   1643.77 s
  
  Improvement: 63.13 s (3.7%)

BEST LAP DETAILS
  Finished: False
  Lap Time: 1643.76 s

============================================================

Total evolution time: 3.1 minutes
Time per generation: 1.8 seconds
```

![alt text](/blog_img/karting/ga_convergence.png)

![alt text](/blog_img/karting/ga_input_profile.png)

![Genetic Algorithm - Racing Line fail](/blog_img/karting/ga_racing_line.png)

![alt text](/blog_img/karting/ga_racing_line2.png)