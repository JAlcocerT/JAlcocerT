---
title: "Electro-Magnetism for AC/DC engines"
date: 2026-05-09
draft: false
tags: ["PyScipe Simulations","Electric Motors vs L-R Model","Solenoids","EMF"]
description: 'The physics you need for building. Drones and electric cars.'
url: 'electromagnetism-for-ac-dc-motors'
math: true
---

**Tl;DR**

Post [electro-magnetism 101](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/) and [electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/)

**Intro**

Ive been doing [additional electronics recaps](https://github.com/JAlcocerT/electronics-101/tree/master/samples-confidence) before going all in with more [electronics ideas](https://github.com/JAlcocerT/electronics-101/blob/master/z-ideas.md)

```sh
git clone /electronics-101/samples-motors
```

## Circuits Recap



## Electric Engines

### DC

### AC

### Modelling

#### The L-R



---

## Conclusions

Why all of this?

| Property | DC (Brushed) | Induction (Squirrel Cage) | Synchronous | BLDC | Stepper |
|----------|---|---|---|---|---|
| **Torque-Current** | Linear (τ ∝ I) | Slip-dependent | Sine (τ ∝ sin δ) | Linear (τ ∝ I) | Detent only |
| **Starting Torque** | High (max I) | Medium (slip ↑) | Very low (needs sync) | High (if commutated) | None (steps) |
| **Max Efficiency** | 70-90% | 85-95% | 90-98% | 85-98% | <50% (intermittent) |
| **Maintenance** | Brushes (wear) | Minimal | Slip rings (if EC) | None | None |
| **Speed Control** | Easy (V variation) | Needs VFD | Needs exciter | Easy (PWM) | Open-loop steps |
| **Speed Range** | 0-max (smooth) | ~±5% around sync | Fixed at sync | 0-max (smooth) | Fixed (cogging) |
| **Power Factor** | N/A (DC) | Inductive (0.7-0.9) | Controllable | N/A (DC control) | N/A (DC control) |
| **Size/Weight** | Medium | Large (for same torque) | Large | Small | Tiny |
| **Cost (small, <1 kW)** | Low | Medium | High | Medium | Very low |
| **Cost (large, >10 kW)** | High | Low | Medium | High | N/A (not used) |
| **Typical Uses** | Old tools, low speed | Industrial baseline | Power plants, precision | EV, robotics, drones | CNC, 3D printers |


Well, you can use this knowledge for fpv/drons:

<!-- https://www.youtube.com/watch?v=MxG22nbBNvQ -->

{{< youtube "MxG22nbBNvQ" >}}

See also [this one](https://www.youtube.com/watch?v=SMymlTtM1w8).

The drone brushless DC motors will have present [Faraday law](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/#3-faradays-law-of-induction) with their [Back EMF](https://github.com/JAlcocerT/electronics-101/blob/master/samples-theory/motors-ac-dc/backemf_vs_emf_kickback.md), same principle of [the EMF kickback of the watering project](https://jalcocert.github.io/JAlcocerT/electronics-101/#conclusions).

$$\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}$$

Remember: A changing magnetic field creates an electric field!

{{< callout type="info" >}}
"kV" on drone motors is **NOT kilovolts.** It's **motor constant:** volts of back-EMF per 1000 RPM. More [about dron motors](https://github.com/JAlcocerT/electronics-101/blob/master/samples-theory/motors-ac-dc/drone_motors.md).
{{< /callout >}}


Or to understand electric cars [before buying one](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/#car-costs-analytics)


**Total Energy Spent:** Approximately **211 kWh**.
**Efficiency:** $211\text{ kWh} / 16.3\text{ (units of 100km)} = \mathbf{12.9\text{ kWh/100km}}$.
> **Note:** You actually drove *more efficiently* than your initial 15 kWh estimate!

| Metric | Your Trip (EV) | Diesel Equivalent (Est.) |
| :--- | :--- | :--- |
| **Total Distance** | 1,630 km | 1,630 km @ 6L/100km |
| **Total "Fuel" Cost** | **~810 NOK** | **~2,050 NOK** (at 6L/100km & 21 NOK/L) |
| **Effort** | 8 charging stops | 1 or 2 fuel stops |
| **Efficiency** | 12.9 kWh/100km | ~60 kWh/100km (energy equiv.) |
| **Efficiency $** | ~5,36$/100km | ~11,96$/100km |

**Unit Cost Comparison ($ USD per 1 kWh)**

| Energy Source | Cost per kWh (USD) | Relative Price |
| :--- | :--- | :--- |
| **Home Charging** | **$0.15** | 1.0x (Baseline) |
| **Diesel Fuel** | **$0.23** | 1.5x more expensive |
| **Public Charging (My electric Trip)** | **$0.46** | 3.0x more expensive |

{{< callout type="info" >}}
More about [electric cars motors](https://github.com/JAlcocerT/electronics-101/blob/master/samples-theory/motors-ac-dc/cars_motors.md), including [srm](https://github.com/JAlcocerT/electronics-101/blob/master/samples-theory/motors-ac-dc/srm_faq.md)
{{< /callout >}}


| Application | Motor Type | Power | Voltage | Why | Duty |
|---|---|---|---|---|---|
| **Starter** | DC Brushed | 1-2 kW | 12V | Max torque from zero | ~2 sec burst |
| **Window** | DC Brushed | 0.1 kW | 12V | Simple, cheap | ~5 sec per use |
| **Steering** | PMSM | 5-10 kW | 12-48V | Smooth, precise, continuous | Variable |
| **Cooling Fan** | BLDC/Induction | 1-2 kW | 12-48V | Long-running, efficient | ~30% duty |
| **A/C Compressor** | BLDC | 3-5 kW | 400V (EV) | Precise control, efficient | ~40% duty |
| **EV Traction (old)** | Induction | 100-300 kW | 400V | Proven, robust, simple control | Continuous variable |
| **EV Traction (modern)** | PMSM | 100-300+ kW | 400-900V | Higher efficiency, compact | Continuous variable |
| **Mild Hybrid** | BLDC/PMSM | 10-50 kW | 48V | Efficient, regenerates | ~30% duty |
| **Plug-in Hybrid** | PMSM | 50-100 kW | 400V | Full electric mode, regenerative | 40-60% duty |

---

## FAQ

### AC vs DC Power Transmission

As experimented and summarized here:

| Scenario | Winner | Margin | Why |
|----------|--------|--------|-----|
| Same voltage, no transformers | DC | ~0.5-1% | No skin, eddy, corona, proximity losses. But negligible compared to... |
| Distance < 100 km | AC (regional grid) | 100× | Transformers. Cheap, proven. Converter cost not justified. |
| Distance 100-500 km | AC (765 kV step-up) | 50× | Step-up transformer reduces loss exponentially. Still beats DC converters. |
| Distance > 500 km | HVDC emerging | 10-20% | DC cable footprint advantage starts dominating. Converters now efficient enough. |
| Submarine cable | HVDC clear | 100× | AC cables leak capacitive current. DC avoids repeater amplifiers every 50 km. |
| Async grid tie (different frequencies) | HVDC only | ∞ | AC requires phase sync. DC is frequency-agnostic. |
| Pure DC renewable (solar arrays) | HVDC | 20% | Avoid AC inversion. DC stays DC all the way. |

{{< callout type="info" >}}
More [about HVDC](https://github.com/JAlcocerT/electronics-101/blob/master/samples-theory/0e-dc-vs-ac-power/hvdc_faq.md)
{{< /callout >}}

### Converting Electrical Energy

1. Rectifier (AC $\rightarrow$ DC)

A **Rectifier** converts Alternating Current (**AC**) into Direct Current (**DC**). 

*   **How it works:** It uses diodes (which act like one-way valves) to block or redirect the "backwards" part of the AC wave so the electricity only flows in one direction.
*   **Common Example:** Your phone charger. It takes the AC from your wall and rectifies it into the DC your battery needs.

2. Inverter (DC $\rightarrow$ AC)

An **Inverter** converts Direct Current (**DC**) into Alternating Current (**AC**).

*   **How it works:** It uses high-speed switches (transistors) to "chop up" the flat DC signal and flip its polarity back and forth to mimic the wave shape of AC.
*   **Common Example:** Solar panels. They produce DC, but your home appliances need AC, so a "Solar Inverter" sits in the middle.

> [Home pv](https://github.com/JAlcocerT/electronics-101/tree/master/sample-pyscipe/home-scale-pv) setups tend to have one of these! 

3. Transformer (AC $\rightarrow$ AC)

You are exactly right—a **Transformer** stays within the same "lane" (AC to AC).
*   **How it works:** It uses magnetic induction to change the **voltage** and **current** levels, but it cannot change the nature of the current. It cannot work with DC because it requires a changing magnetic field (which only AC provides).
*   **Common Example:** Those big grey cans on utility poles. They take high-voltage AC from the power lines and "step it down" to the 110V/230V AC used in your house.

| Device | Input | Output | Common Use |
| :--- | :--- | :--- | :--- |
| **Rectifier** | AC | **DC** | Powering electronics from a wall outlet. |
| **Inverter** | DC | **AC** | Using a car battery to run a laptop or TV. |
| **Transformer**| AC | **AC** | Stepping voltage up/down for the grid. |

**Pro Tip:** If you want to go from **DC to DC** (like changing the voltage of a battery), you use something called a **DC-DC Converter** (often a "Buck" or "Boost" converter).