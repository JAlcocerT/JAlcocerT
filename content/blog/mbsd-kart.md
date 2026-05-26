---
title: "A Kart != a point mass"
date: 2026-05-26
draft: true
tags: ["MBSD x Simulation","Racing"]
description: 'The physics of a Kart that is no longer a single point in the space.'
url: 'kart-mbsd-simulation'
math: true
---


**Tl;DR**


Everything is good as long as you dont get 529 status on CC.


```

```

https://github.com/JAlcocerT/mbsd/tree/master/z-kart

A kart is not a point in the space.

**Intro**

Do you like racing / karting / sim racing?

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

<!-- 
https://www.youtube.com/shorts/pi18gTkrP7c 
-->

{{< youtube "pi18gTkrP7c" >}}


Then you would be very angry with my previous series of the kart simulators.


```sh
#git clone mbsd

```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD | Repo ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo" icon="github" >}}
{{< /cards >}}




**Intro**


Coming from [here](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/) and [here](https://jalcocert.github.io/JAlcocerT/reinforce-learning-racing-simulator/#conclusions)

The GD was the one that worked best so far: https://jalcocert.github.io/JAlcocerT/kart-optimum-path/#the-results


## Claude fix

under the honest κ-fix physics, the real driver is 3.35 s faster than the model says is theoretically possible. The exact numbers:

  - Real fastest lap (GX020010 lap 2): 78.20 s  - κ-fix N=400 honest theoretical optimum: 81.55 s
  - Gap: −3.35 s (real beats the calibrated model)
  That doesn't mean the driver is magically beating physics — it means the model is under-stating what the kart can actually do. Two consistent stories from today's analyses:
  1. The driver is faster in both corners and straights, but more on straights:    - corners: −1.08 s (driver gains 1.1 s net)
    - straights: −2.26 s (driver gains 2.3 s)
    - total: −3.35 s
  2. The sensitivity sweep says the model's max_lateral_g = 0.95 is the most sensitive parameter at −27.5 s/g. Bumping it to 1.07 g (+12%) would bring the sim down to ~78 s and match your fast lap. That's a believable  correction: the calibrated 0.95 g came from yaw-rate-κ-based lap-time matching, which slightly under-counts true peaks. The sustained-vs-transient-peak distinction is exactly what Phase 4's load-transfer model would
  capture.
  3. The pro's 75 s sits another ~3 s below your 78.20, which the sensitivity sweep says needs another +0.12 g of lateral — total 1.19 g. That's high-but-plausible for harder/fresher tires (the pro likely had different  equipment too).

  So the honest, today-as-of-now reading is:

  ▎ The calibrated point-mass model is slightly conservative — about 1.07 g of "true effective" lateral grip vs. the 0.95 g it has calibrated. Once Phase 4's bicycle model captures the transient grip from load transfer,   ▎ the gap to your real laps should close (and possibly close further toward the pro). The driver isn't superhuman; the model is leaving 3 s on the table because it can't represent trail-braking and load transfer.
  That's the cleanest narrative the data supports. Sub-text: Phase 4 was the right next move — today's evidence (real-beats-sim by 3 s, mostly explainable by transient grip the ellipse can't represent) is exactly what  richer dynamics should fix.

## Toy Models be Like

Imagine that i mentioned to you that [my GD model](https://jalcocert.github.io/JAlcocerT/kart-optimum-path/) predicts how fast you can be at a circuit.

```sh
#git clone /optimum-path
cd ./optimum-path
#python3.10 1-pointmass-lap-gradient-based/apexsim_v1.py
cd 1-pointmass-lap-gradient-based/
python3.10 apexsim_v1.py #configured as per vehicle_config.json including the track
```

{{< youtube "zm0OJcpuLV8" >}}

Oh, but thats just on the circuit.

And for the next one you are going...you will be between P1 and P20

Now pay me please

What'd you say?




---

## Conclusions





---

## FAQ