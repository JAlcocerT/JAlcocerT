---
title: "Inline 4 Engines: Balance and Vibrations"
date: 2026-04-01T06:20:21+01:00
draft: false
tags: ["Multi-Body","Inline 4","Primary vs Secondary Balance","Remotion","FFT"]
description: 'Understanding the most popular engine (once and for all) with a Force Locus.'
url: 'inline-4-engine-balance'
math: true
---


**TL;DR**

Getting right the slider-crank mechanism (2D) via MBSD to later form a 3D ICE I4 Vibration Simulation

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}


**Intro**

This channel has awsome [videos explaining engine balance](#about-engine-balance)

But i wanted to make my own.

{{< youtube "ABzKNvJCl28" >}}


<!-- <https://www.youtube.com/watch?v=ABzKNvJCl28> -->

* http://firsttimeprogrammer.blogspot.com/2015/02/crankshaft-connecting-rod-and-piston.html


### Enough Theory for Balance

In other words: whats the minimum physics context for an LLM to do this right?

+++ some [references](#references) below

$$
\begin{aligned}
  \nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
  \nabla \cdot \mathbf{B} &= 0 \\
  \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
  \nabla \times \mathbf{B} &= \mu_0 \left( \mathbf{J} + \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)
\end{aligned}
$$

Wait...arent you gonna extend [the MBSD 2D simulator](https://jalcocert.github.io/JAlcocerT/2d-mbsd/) already to 3D for this?

Nop, im not.

This is going to be equation based.

No point reference coordinates this time :)



## Engine Balance

Balance...what is it?

Vibrations? 

[FFT](#fast-fourier-transform)?

Forces?

I just wanted to create my engine balance simulations as proof:

```sh
#git clone https://github.com/JAlcocerT/mbsd
cd ./mbsd
```

You might do this without a mbsd framework like the one ive built.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3Design | Repo" icon="github" >}}
{{< /cards >}}

Just...make the magic of the model and equation happen.

You got x4 slider-cranks connected to a common axis

{{< youtube "cFHyobRjcK0" >}}

> Yes, this one is [based on remotion](https://jalcocert.github.io/JAlcocerT/video-creation-with-remotion/) :)

So you can model it as one axis that receives variable forces (the reaction ones that makes the crank stay in position) over time as it rotates

```sh
cd ./mbsd/2D-Dynamics
make run-slider-crank-no-gravity
```

{{< youtube "iNl3s09BLoA" >}}

Or you can start from the beginning.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditionRemorion" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}




### Inline 4

After all of this modelling: *how about visualizing?*

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditionRemorion" title="Remotion x Video | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/engine-balance" title="Engine Balance | Repo" icon="github" >}}
{{< /cards >}}

For this post, i want to test how good the current LLMs are without much context:

```sh
#git init && git add . && git commit -m "Initial commit: Starting engine balance repo" && gh repo create engine-balance --private --source=. --remote=origin --push
git clone /engine-balance
#claude
```

Will it be able to generate a proper physics engine

with an output data model that can be re-used for remotion animations?

oh and also...

being able to say in the future which of the engine configuration is best for the balance

with...proper why's?

```md
i want to create a way to simulate in python a slider-crank, being able to animate it and to have in any given point the position, speed, aceleration and forces (including the reaction forces between the bars). 

The later goal will be to take few of this slider cranks and make simulation of engine balance at the axis for few configurations, like I4, I6, V8 etc

can we create a brd.md to define all of this?
```

```md
thats sounds good, with the export data we would be able to animate it later on with other frameworks like remotionJS, blender etc?
```

* BRD.md: "What & Why" (requirements, architecture, scope)
* equations.md: "The Physics" (math model, coordinate system, all equations)
* dev-phases.md: "The Code" (concrete tasks, references, examples, testing)

```md
before starting, can you define a Out of Scope section? Also, for starters we can make the tests with matplotlib, I will let you know later own which ultimamte presentation layer I want, as the output will go mostlikely to  youtube
```

Here is where you noticed those P1 estimations of 2-3 weeks still.

When its...20-30 minutes already:

```md
then create a dev-phases.md where you can reference from brd and equations.md what we are doing, the uv python environment is ready for you
```

{{< youtube "iNl3s09BLoA" >}}


```sh
make explore #from the p3.1
```

With this we can understand the expected engine balance in a table:

```sh

```

![alt text](/blog_img/mec/force_vector_animation.gif)


And with this one, the force locus of the I4:

```sh
. .venv/bin/activate && pytest tests/test_balance.py::TestForceAnimation -v
```

![alt text](/blog_img/mec/force_locus_3d.png)

It's a 3D curve showing how the magnitude and direction of the total bearing force evolves from 0° to 360° of crank rotation.

I also made couple more tinkering with the p3.3
```sh
make decompose              # Output: output/i4_harmonics/, output/i6_harmonics/
make rpm-sweep              # Output: output/i4_rpm/, output/i6_rpm/
```

What it is: 3D trajectory of bearing force over one crank cycle

The 3D space: X (Fx) × Y (Fy) × Z (crank angle), color-coded by progression

Engine comparisons:

I4: Large tilted bowtie (secondary-heavy, needs balancer shafts)
I6: Thin vertical line near origin (nearly perfect balance)
I3/I5: Symmetric stars (excellent primary balance)
V8: Moderate bowtie (good compromise)
V12: Smallest locus (pinnacle of smoothness)

How to interpret: Shape = balance quality, size = imbalance magnitude, pattern = harmonic content

Why it matters: Makes abstract force numbers visceral — seeing I4's force vector wildly swing vs I6's barely moving is instant physics understanding

Generation methods: make explore, make animate-forces, or Python script

Physical explanation: Why I4 needs balancer shafts, why I6 is perfect despite having 6 cylinders



## About Engine Balance

The best video I found about engine balance:

{{< youtube "mTS48jX68YU" >}}

<!-- can you summarize this video? https://www.youtube.com/watch?v=mTS48jX68YU&t=82s -->

Then provide a summary and pros and cons of the balance of each engine type discussed

The video titled **"ENGINE BALANCE: Inline 6 vs. V6 vs. VR6 vs. Flat / Boxer 6"** compares the balance, packaging, strengths, and weaknesses of four common six-cylinder engine layouts: the **inline-six**, **V6**, **VR6**, and **flat-six/boxer-six**.

Inline 6

The **inline-six** is widely regarded as the smoothest and simplest of the group. Its layout gives it excellent inherent balance and an even firing interval, which helps it run very smoothly without
needing major balancing aids. It is also mechanically straightforward, typically using only one cylinder head and a simpler overall design than split-bank engines. Its main drawback is packaging:
because all six cylinders are arranged in a straight line, the engine is long and can be difficult to fit in tighter engine bays, especially in transverse layouts.

**Pros:** Simple design, excellent inherent balance, smooth operation, even firing interval.
**Cons:** Long overall length makes packaging more difficult.

V6

The **V6** was largely developed to solve the packaging problems of the inline-six. By splitting the cylinders into two banks, it becomes much shorter and easier to fit into a wider range of
vehicles, including transverse-engine layouts. The tradeoff is that it does not usually have the same natural balance as an inline-six, so smoothness often depends more heavily on bank angle,
crankshaft design, and sometimes balancing aids. It is also mechanically more complex, since it typically uses two cylinder heads and more duplicated components.

**Pros:** More compact, easier to package, well suited to many engine bays.
**Cons:** Generally less inherently balanced than an inline-six, more mechanically complex.

VR6

The **VR6** is a narrow-angle six-cylinder design that blends characteristics of the inline-six and V6. Its main advantage is compactness: it is narrower than a conventional V6 and can be packaged
very efficiently, while also avoiding some of the bulk of a traditional split-bank design. However, it should not be thought of as having the same inherent balance or simplicity as an inline-six. It
is best understood as a clever packaging compromise that offers a unique middle ground between size, smoothness, and complexity.

**Pros:** Very compact, efficient packaging, simpler overall package than some conventional V6 designs.
**Cons:** Still more of a compromise than an inline-six, not as naturally balanced, can involve uneven port geometry and added engineering complexity.

Flat / Boxer 6

The **flat-six**, especially in true boxer form, is also an extremely smooth and well-balanced engine design. It benefits from a low center of gravity and a short crankshaft, which can help both
handling and responsiveness. However, its width makes packaging more difficult, and this layout can be more complex and expensive to manufacture depending on the application. While it offers major
dynamic advantages, it is not always easy to fit into a vehicle platform.

**Pros:** Excellent balance, low center of gravity, short crankshaft, strong performance character.
**Cons:** Wide layout makes packaging difficult, often more expensive and complex to manufacture.

Each six-cylinder layout reflects a different engineering priority. The **inline-six** emphasizes smoothness and simplicity, the **V6** prioritizes compact packaging, the **VR6** is a specialized
compromise designed to save space, and the **flat-six/boxer-six** delivers excellent balance and a low center of gravity at the cost of width and complexity. Rather than there being one universally
best design, each configuration makes sense in different applications depending on what engineers value most.

<!-- The video titled "ENGINE BALANCE: Inline 6 vs. V6 vs. VR6 vs. Flat / Boxer 6" discusses the engine balance, strengths, and weaknesses of four popular six-cylinder engine configurations: the inline six, the V6, the VR6, and the flat six.

Here are the summaries and pros and cons of each engine type discussed:

Inline 6: This engine configuration is simple and balanced. 

It only needs one cylinder head, one or two cams, and one exhaust manifold. 

However, its length is a downside as it's difficult to fit transversely in an engine bay.

It's hard to fault the inline six other than its length.

Pros: Simple design, beautifully balanced, even firing interval.
Cons: Its length makes it difficult to fit in some engine bays.
V6: The V6 was created to address the length issue of the inline six. It's shorter and easier to fit transversely in an engine bay. However, it loses the inherent primary balance of the inline six and needs engineering aids like balancing shafts or crankshaft counterweights to achieve smoothness.

Pros: Compact design, easier to fit in engine bays.
Cons: Loses inherent primary balance of inline six, needs engineering aids for smoothness, more complex with double the number of cylinder heads, cams, and exhaust manifolds compared to inline six.
VR6: The VR6 is essentially a V6 but with an extremely narrow angle between the banks. It's compact like a V6 but without the double cylinder heads, cams, exhaust manifolds, and other components, while preserving the inherent balanced nature of the inline six.

Pros: Compact, better balanced than a generic V6, simpler than a V6.
Cons: Not as simple as an inline six, needs slanted pistons and additional crankshaft counterweights, differences in length between intake and exhaust ports can result in different power and torque curves.
Flat / Boxer 6: The flat six, or more accurately a boxer six, is perfectly balanced and has a very short and light crankshaft. However, it's the most complex engine configuration of all four discussed and is difficult to package due to its width.

Pros: Perfectly balanced, light crankshaft, rev-happy engine.
Cons: Most complex engine configuration, difficult to package due to its width, most expensive and complex engine to manufacture.
In conclusion, each engine type has its own strengths and weaknesses. The inline six is simple and balanced but long, the V6 is compact but less balanced, the VR6 is a compact and simpler version of a V6 but not as simple as an inline six, and the flat/boxer six is perfectly balanced and light but complex and wide.  -->




#### Primary Balance

#### Secondary Balance

Blame it to ~~the boogie~~ Archimedes.

Some time ago I recorded this unexpected video *in a restaurant*:

{{< youtube "DlmN-Z_Ry6M" >}}

<!-- https://www.youtube.com/watch?v=DlmN-Z_Ry6M -->


### Who said Remotion?

And the thing goes from [this RemotionJS experience](https://jalcocert.github.io/JAlcocerT/video-creation-with-remotion/)

```md
if someone would like to take the script you have prepared to make a V8 engine video using the python scripts that are having perfectly defined the slider-cranks and the angles and so on, what should it know?

create a hand over for the next agent to take advantage of all our work at a summary-for-remotion.md
```

```sh
#git clone /engine-balance
#claude #/skills 
```

```md
if someone would like to take the script you have prepared to make a V8 engine video using the python scripts that are having perfectly defined the slider-cranks and the angles and so on, what should it know?

create a hand over for the next agent to take advantage of all our work at a summary-for-remotion.md
```

```md
 lets write these choices at a summary-remotion-choices.md

  i want a 3D realistic engine model were we can see the pistons moving according to the data
  generated by python. for now, lets create a single static video (i guess we can add
  diferent remotion scripts later on). The data generation part is done in python, read the
  summary-for-remotion and see the makefile to know how. Id like a modern polished UI.
  1920x1080 and 30fps is fine. No forces with augmented reality for now.
```

```sh
cd ./engine-balance/remotion-balance-video

```

---

## Conclusions

Someone told me that she sees the difference when I talk with passion

Versus when I talk for the money

If you want to convince her that there is no such gap:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
{{< /cards >}}




---

## FAQ

### Cars for Track Days?

[Some say](https://www.reddit.com/r/BMW/comments/1ez7ims/why_is_the_z4_e86_so_underrated/) that the BMW z4 e86 is underated.

You have ~2007 units for ~10k$ as shown [here](https://www.youtube.com/watch?v=5hRuWLrdV6k)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

Im well aware that some people do cool stuff on the tracks with their bmw (BMW e86).

### Fast Fourier Transform?

### References

**Engine Balance Theory**:
- Norton, R.L. "Design of Machinery" 5th ed., Chapter 14 (Engine Balance)
- Heywood, J.B. "Internal Combustion Engine Fundamentals", Chapter 3 (Kinematics & Dynamics)
- SAE J670e "Engine Sound Quality"

**FFT & Harmonic Analysis**:
- Welch, P.D. "The use of fast Fourier transform for estimation of power spectra" (IEEE Trans. Audio Electroacoustics, 1967)
- NumPy FFT documentation: https://numpy.org/doc/stable/reference/fft.html

**This Project**:
- BRD.md § 4.3 — Balance Analysis Requirements
- equations.md § 3-4 — Kinematics & Dynamics Equations
- dev-phases.md § 2.2 — Phase 2.2 Specification