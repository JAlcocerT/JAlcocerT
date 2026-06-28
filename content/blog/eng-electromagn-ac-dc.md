---
title: "Electro-Magnetism for AC/DC engines"
date: 2026-05-04
draft: false
tags: ["PyScipe Simulations","Electric Motors vs L-R Model","KV","Solenoids","EMF"]
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

{{< cards >}}
  {{< card link="https://github.com/clidey/electronics-101" title="Electronics-101 Github ↗" icon="github" >}}
{{< /cards >}}



## Electric Engines

Wondering about [buying a car](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/)?

### DC

### AC

### Modelling Electrical Engines

Is the classical R-L model enough?

enough for what, right?

These are not powered by slider cranks and powerful combustions

But arent they simple, beautiful, elegant and massively efficient?

#### AC Engines




#### DC Engines

These are the kind of motors propelling your [DJi Tello Dron](https://jalcocert.github.io/JAlcocerT/dji-tello-python-sdk/).

Yea, the same for which I was recently making a [nicer desktop app](https://jalcocert.github.io/JAlcocerT/dji-tello-python-sdk/#tello-x-flutter) with computer vision plugged in.

```sh
#git clone /dron
cd ./dron
uv sync
uv run main.py
```

<!-- {{< youtube "nNMUY_GUw9s" >}} -->

Yep, [private video](https://youtu.be/nNMUY_GUw9s) :)




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

As experimented and summarized [here](https://github.com/JAlcocerT/electronics-101/tree/master/samples-theory/0e-dc-vs-ac-power):

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


### What is KV in motors

You are completely right to catch that! I snuck it into the component chart a few messages back when we built the initial blueprint for the indoor Whoop.

I wrote down: **"0802SE 19500KV (Brushless)"** for the motors.

Since KV is a highly specific and slightly confusing number in the drone world, let's look at exactly what it means and why that specific number matters for your build:

What does "KV" actually mean?

In FPV drones, KV does **not** stand for kilovolts, and it has nothing to do with television.

It stands for the **Velocity Constant** of the motor.

{{< callout type="info" >}}
**The Rule:** KV is the theoretical number of Revolutions Per Minute (RPM) that a motor will spin for every **1 Volt** of electricity you feed it, with no propeller attached.
{{< /callout >}}

Let's look at the math for the **19500KV** motors on a fully charged 1S drone battery ($4.2\text{V}$):

$$19,500 \text{ KV} \times 4.2 \text{ V} = 81,900 \text{ RPM}$$

Those tiny brushless motors are spinning the propellers at over **81,000 times per minute** when you punch the throttle!

---

#### Why such a high KV for a small indoor drone?

* **Small Propellers = Less Leverage:** Indoor Whoop propellers are tiny (only 31mm wide). Because the blades are so small, they don't grab a lot of air. To create enough thrust to lift the drone, they have to spin at astronomical speeds. High KV motors give you that raw speed.

* **Low Voltage (1S):** Since you are only using a single-cell battery ($3.7\text{V}$ to $4.2\text{V}$), the voltage is quite low. To get high RPMs out of low voltage, the motor needs a high KV rating.

* **The Contrast:** If you were building a massive 5-inch outdoor camera drone that runs on a heavy 6S battery ($25.2\text{V}$), you would use low KV motors (like **1700KV to 1900KV**) because the larger propellers grab massive amounts of air and would burn out the motor if spun too fast.

When you go to buy your motors, sticking around **19500KV to 22000KV** in the **0802** size is the absolute sweet spot for a snappy, controllable indoor flyer!

#### KV x Dron size

Choosing the right motor KV isn’t *just* about the drone’s size—it is a balancing act between **Propeller Size** and **Battery Voltage (Cell Count / "S")**.

The fundamental rule of thumb is: **Big propellers and higher voltage need lower KV (more torque). Small propellers and lower voltage need higher KV (more raw RPM).**

If you pair a big propeller with a high KV motor, the motor will try to spin way too fast, overheat, draw massive current, and likely burn out your ESC or the motor itself.

The drone's "size" is typically measured by its propeller diameter (in inches).

| Drone Type / Prop Size | Motor Size (Stator) | 4S Battery Platform | 6S Battery Platform | Best Use Case |
| --- | --- | --- | --- | --- |
| **Tiny Whoop** (1.6" - 2") | 0802 to 1103 | *N/A (Uses 1S/2S)*<br>
<br>**18,000–25,000 KV** | *N/A* | Micro indoor flying / Backyard racing |
| **Micro / Toothpick** (3") | 1404 to 1505 | **3500 – 4000 KV** | **2500 – 3000 KV** | Lightweight freestyle, sub-250g builds |
| **Cinewhoop** (3" protected) | 2004 to 2203.5 | **2500 – 3500 KV** | **1800 – 2200 KV** | Heavy, stable cinematic filming around people |
| **Standard FPV** (5") | 2207 or 2306 | **2400 – 2700 KV** | **1750 – 1950 KV** | The standard choice for racing and freestyle |
| **Long Range / Cinematic** (7") | 2806.5 to 2808 | **1500 – 1900 KV** | **1100 – 1350 KV** | Heavy GoPro haulers, mountain surfing, ArduPilot |
| **Heavy Lift / Commercial** (10"+) | 3110 to 4114+ | *N/A* | **400 – 900 KV** *(Uses 6S to 12S)* | Large mapping planes, multi-kg cameras, endurance |


💡 Understanding the Stator Numbers

> When you see a motor size like **2207**, the numbers stand for the internal dimensions in millimeters:
> * **22** = Stator Width (Wider = more torque and efficiency at low RPM)
> * **07** = Stator Height (Taller = more raw power and bite at high RPM)


### DC vs BLDC vs AC Engines

