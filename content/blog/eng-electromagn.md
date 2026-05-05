---
title: "Electro-Magnetism for tinkerers"
date: 2026-04-12
draft: false
tags: ["Simulations","Electric Motors","Solenoids","EMR","Maxwell","PyScipe"]
description: 'The physics you need for electronic projects.'
url: 'electromagnetism-101'
math: true
---

**Tl;DR**

Before [tinkering with electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/), how about understanding what we are doing?

**Intro**

Lately, I was getting surprised on [how neccesary a Diode is](https://jalcocert.github.io/JAlcocerT/electronics-101/#conclusions) to avoid EMR blowing up such systems.

This \(\sigma(z) = \frac{1}{1 + e^{-z}}\) is an inline expression.

then

$$F(\omega) = \int_{-\infty}^{\infty} f(t)\, e^{-j \omega t} \, dt$$

more

$$
\begin{aligned}
  \nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
  \nabla \cdot \mathbf{B} &= 0 \\
  \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
  \nabla \times \mathbf{B} &= \mu_0 \left( \mathbf{J} + \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)
\end{aligned}
$$

$$
\begin{aligned}
  2x + 3 &= 7 \\
  2x &= 4 \\
  x &= 2
\end{aligned}
$$

To ensure each of your original equations sits on its own line while maintaining the proper mathematical formatting, here is the corrected version. 

I have separated the inline expression into its own block and used the `aligned` environment for the Maxwell equations to keep them structured.

---

### Corrected LaTeX Layout

The logistic function:
$$\sigma(z) = \frac{1}{1 + e^{-z}}$$

The Fourier Transform:
$$F(\omega) = \int_{-\infty}^{\infty} f(t)\, e^{-j \omega t} \, dt$$

Maxwell’s Equations:
$$
\begin{aligned}
  \nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
  \nabla \cdot \mathbf{B} &= 0 \\
  \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
  \nabla \times \mathbf{B} &= \mu_0 \left( \mathbf{J} + \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)
\end{aligned}
$$

### What changed?

* **Separation:** Each equation is now wrapped in its own set of `$$` delimiters.
* **Alignment:** In the Maxwell section, the `\\` at the end of each line acts as a "hard return," and the `&` symbols ensure the equals signs stay perfectly stacked.
* **Readability:** Breaking them up this way prevents the text from looking cluttered and makes each operation stand out.

Are you planning to export these to a document or a Markdown editor?

Maxwell’s equations are essentially the "Four Commandments" of electromagnetism. 

They describe how electric fields, magnetic fields, charges, and currents interact.

### 1. Gauss’s Law (Electricity)

$$\nabla \cdot \mathbf{E} = \frac{\rho}{\varepsilon_0}$$

**What it means:** Electric charges produce electric fields. 

This law states that the "outward flow" (divergence) of an electric field from a volume is proportional to the charge inside it. 

If you have a positive charge, field lines point away from it; if you have a negative charge, they point toward it.


### 2. Gauss’s Law for Magnetism

$$\nabla \cdot \mathbf{B} = 0$$

**What it means:** There are no "magnetic charges" (monopoles).

In electricity, you can have a lone proton.

In magnetism, you can never have just a "North" pole without a "South" pole. 

Because of this, magnetic field lines always form closed loops—whatever goes out must come back in, making the total divergence zero.

### 3. Faraday’s Law of Induction

$$\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}$$
**What it means:** A changing magnetic field creates an electric field.

This is the principle behind power generators and wireless charging. 

If you move a magnet through a coil of wire, the magnetic field changes over time, which "curls" (creates) an electric field that pushes electrons through the wire as current.

### 4. Ampère’s Circuital Law (with Maxwell’s Addition)

$$\nabla \times \mathbf{B} = \mu_0 \left( \mathbf{J} + \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)$$
**What it means:** Magnetic fields are created by moving charges (current) **OR** by changing electric fields.

Ampère originally figured out that current ($J$) creates a magnetic field (like in an electromagnet).

Maxwell added the second part: even if there is no physical wire, a changing electric field ($\frac{\partial \mathbf{E}}{\partial t}$) creates a magnetic field. 

This addition was the "missing link" that proved light is an electromagnetic wave.

---

### Why they matter together

When you combine these, you see a beautiful cycle: a changing electric field creates a magnetic field, which (if it changes) creates an electric field, and so on. 

This self-sustaining loop allows **electromagnetic waves** (light, Wi-Fi, X-rays) to travel through the vacuum of space.

Which of these four feels the most intuitive to you, or is there a specific one that's still a bit fuzzy?

The phenomenon you're describing—often called **inductive kickback** or **flyback**—is primarily driven by **Faraday’s Law of Induction**, though it's the result of a "disagreement" between Faraday’s Law and **Ampère’s Law**.

Here is how the physics plays out the moment you cut the power:

### The Primary Culprit: Faraday’s Law

$$\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}$$

This equation tells us that a **changing magnetic field** ($\frac{\partial \mathbf{B}}{\partial t}$) creates an **electric field** ($\mathbf{E}$). 

1.  **The Setup:** When the valve motor (which is essentially a big inductor/coil) is running, Ampère’s Law is at work: the current flowing through the coils creates a steady magnetic field.
2.  **The Disconnection:** When you flip the switch, the current tries to drop to zero instantly. This causes the magnetic field to collapse almost at the speed of light.
3.  **The Kickback:** Because that magnetic field is changing so rapidly (a massive $-\frac{\partial \mathbf{B}}{\partial t}$), Faraday’s Law dictates that a massive electric field must be generated to "oppose" that change.

### The Supporting Actor: Lenz's Law

While not one of the four main Maxwell equations (it's actually wrapped inside the negative sign of Faraday's Law), **Lenz's Law** explains the *direction* of the kickback.

It states that the induced voltage will always try to keep the current flowing in the same direction it was going before the break.

### What actually happens in the valve?

Since the circuit is now open (disconnected), that generated energy has nowhere to go. The voltage across the switch or the motor terminals skyrockets—often to thousands of volts—to try and "push" the electricity through the air. 

* **The Spark:** If the voltage gets high enough, it ionizes the air, creating an **arc** (a literal spark) across the switch contacts.
* **The Damage:** This "kickback" is why engineers put **flyback diodes** in parallel with motor coils. The diode gives that "kicked" current a safe path to loop back and dissipate slowly, rather than frying your electronics or pitting your switch contacts.

In short: **Ampère’s Law** built the magnetic "momentum," and **Faraday’s Law** creates the violent "jolt" when you try to stop that momentum instantly.

Does that help clarify why those sparks happen when you unplug high-power inductive loads?

## Applications

### How to avoid frying an ESP32 due to kickback

Even the simplest project has **some meta-lessons** and curiosities behind it.

Like this [simple diode simulation](https://jalcocert.github.io/JAlcocerT/electronics-101/):
<!-- 
https://youtu.be/1veGKSFzqcQ 
-->

{{< youtube "1veGKSFzqcQ" >}}

After [such investigation](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/consequences.md) you also get [interesting](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/curiosities.md) next steps.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101/tree/master/sample-pyscipe" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditingRemotion/tree/main/remotion-electronics" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}

After sich simple project you can continue that [come back with more ad-ons](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/next-steps.md).

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3Design | Repo" icon="github" >}}
{{< /cards >}}

Like pluggint it to [a solar panel](https://jalcocert.github.io/JAlcocerT/microcontrollers-setup-101/#solar-power--microcontrollers).

### Electrical Engines

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

---

## Conclusions

Beyond food and warm, do you have passions?

Some project that wanted to complete for long

but not sure on the how?

<!-- {{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
{{< /cards >}} -->

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Get some of my time ↗" icon="user" >}}
{{< /cards >}}