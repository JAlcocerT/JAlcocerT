---
title: "Fluids"
date: 2026-05-08
draft: false
tags: ["Fluid Dynamics"]
description: 'The physics of fluids.'
url: 'fluids'
math: true
---


https://github.com/JAlcocerT/mbsd/tree/master/z-fluid-mechanics

https://github.com/JAlcocerT/mbsd/blob/master/z-destilled-ebook/2d-slidercrank-multicylinder-combustion.md

**TL;DR**

How about bringing fluid mechanics to the ICEs?

**Intro**

A constant speed at the crank?

What kind of model was that?

Reality is: intermitent forces driven by combustions are the ones pushing the slider down!

<!-- 
https://www.youtube.com/watch?v=2bJTkBsiTPc 
-->

{{< youtube "2bJTkBsiTPc" >}}


<!-- 
https://www.youtube.com/watch?v=7xwODOr-xTo 
-->

{{< youtube "7xwODOr-xTo" >}}


## About Fluid Mechanics


## Application of Gas mechanics

### The ICE!

It was a very interesting time back then.

I mean...when I was doing this kind of things in [matlab](https://jalcocert.github.io/JAlcocerT/matlab-vs-octave/).


But similarly as I did with [the bike simulator](https://jalcocert.github.io/JAlcocerT/cycling-and-the-4-bars-mechanism/#from-concepts-to-equations), it is time to bring them to python.



---

## Conclusions

This is being the year of bridging concepts.

I would have never guessed how, where and when I would be coming back to them.

Will I write about heat transfer and electrical engineering?

who knows :)

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

---

## FAQ




### Volumetric efficiency

<!-- <https://www.youtube.com/watch?v=1eRsaOxxiUc> -->

{{< youtube "1eRsaOxxiUc" >}}


VE map - https://www.tactrix.com/index.php?option=com_content&view=category&layout=blog&id=36

### References

The **physics of combustion** is a thing on its own...

{{< youtube "Z3ZvxIz20-c" >}}

<!-- https://www.youtube.com/watch?v=Z3ZvxIz20-c -->

'Bro started the video like an engineer and ended  like a philosopher. Great video!'

**Tl;DR**

**Intro**


## The Analogy

Heat can be related to electro-magnetism, remember?

We can bring fluid variables to that same play:

In fact, the "Triple Analogy" between **Electricity, Heat, and Fluid Mechanics** is one of the most elegant corners of physics. When you combine them, you get what engineers call **Lumped Element Modeling**.

Just as we mapped heat to electricity, we can map fluid flow to both. The "Master Variable" in fluid mechanics that corresponds to Voltage or Temperature is **Pressure**.


1. The Fluid-Electric-Thermal Mapping

If you can visualize water flowing through a pipe, you can understand a circuit or a heat exchanger.

| Electrical | Thermal | Fluid Mechanics |
| :--- | :--- | :--- |
| **Voltage ($V$)** | **Temperature ($T$)** | **Pressure ($P$)** |
| **Current ($I$)** | **Heat Flow ($q$)** | **Volumetric Flow Rate ($Q$)** |
| **Resistance ($R$)** | **Thermal Resistance ($R_{th}$)** | **Hydraulic Resistance ($R_h$)** |
| **Capacitance ($C$)** | **Thermal Mass ($C_{th}$)** | **Compliance / Tank Volume** |
| **Inductance ($L$)** | *(No direct simple analog)* | **Inertance (Fluid Mass/Inertia)** |





2. How Fluid Components "Mimic" the Others

Hydraulic Resistance (The Pipe)

A narrow pipe or a clogged filter acts exactly like a resistor. 
*   **The Math:** $\Delta P = Q \cdot R_h$ (This is essentially Ohm's Law for fluids).
*   **The Physics:** To push more water (Current) through a thin straw (High Resistance), you need to blow harder (Increase Pressure/Voltage).

Fluid Compliance (The Water Tower)

A large tank or an elastic balloon in a plumbing system acts like a capacitor.
*   **In Electricity:** A capacitor stores charge and resists sudden changes in voltage.
*   **In Fluids:** A water tower stores potential energy and keeps the city's water pressure from dropping the second everyone turns on their taps. It "smooths out" the pressure.

Fluid Inertance (The "Water Hammer")

This is a unique fluid property that is the perfect analog for an **Inductor** ($L$) in a circuit. 
*   When you suddenly shut a faucet and hear a "thump" in the walls, that is **Inductance**. The moving fluid has mass and "wants" to keep moving, just like an inductor resists a change in current. Heat transfer doesn't really have a natural version of this, which makes thermal systems much "simpler" (and more sluggish) than fluid or electric ones.



3. The "Power" Connection
In all three systems, **Power** is calculated by multiplying the "Push" (Across variable) by the "Flow" (Through variable):

*   **Electric Power:** $P = V \cdot I$
*   **Thermal Power:** $P = \Delta T \cdot q$ (Though $q$ is already a power unit, Watts)
*   **Fluid Power:** $P = \Delta P \cdot Q$



4. Why this matters for Heat Transfer
In real engineering, these analogies often collide. Think of a **Liquid Cooling System** in a high-end PC:
1.  **The CPU** creates "Current" (Heat).
2.  **The Water** acts as a "Carrier" (Fluid Flow).
3.  **The Pump** provides the "Voltage" (Pressure) to overcome the "Resistance" (Narrow tubes).
4.  **The Radiator** acts as a "Transformer," transferring the "Current" from the fluid system into the air.

### The Limits of the Analogy
While the "math" matches up beautifully for **Laminar Flow** (smooth water), it breaks down once the fluid becomes **Turbulent**. 
*   In electricity, $V=IR$ is almost always a straight line (linear).
*   In fluids, if you double the flow, the pressure required might quadruple (non-linear).

Does adding the "Pressure" and "Pipes" layer make the concept of Heat Resistance feel more like a physical "obstacle" to you?

---

## Conclusions

Problems with cognitive dilution due to AI usage?

Why not starting using AI to make projects you could only dream about?

