---
title: "Science is so Cool!"
date: 2026-12-10T23:20:21+01:00
draft: false
# cover:
#   image: "https://socialify.git.ci/jalcocert/streamlit-multichat/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto"
#   alt: "What about science?" # alt text
#   caption: "Science Recap with LLMs" # display caption under cover
tags: ["Heat Transfer vs Electrical Engineering","Atopile","3 Bodies vs SliDer Crank"]
description: 'A Science recap with LLMs'
url: 'cool-science'
---

**Tl;DR**

A post about...Simply science.

**Intro**

<!-- https://youtu.be/FPvFHcQEEj0?si=-ZnOycL8qsgJ4xKN -->

{{< youtube "FPvFHcQEEj0" >}}

## Termodinamics

https://en.wikipedia.org/wiki/Boyle%27s_law

PV=nrT

And i could feel that while riding my bicycle during winter.


## Electrical Engineering

Everything is...[code](https://jalcocert.github.io/JAlcocerT/things-as-a-code/). 

Same applies to circuit boards:

* https://github.com/atopile/atopile

> **MIT | Design circuit boards with code**! ✨ Get software-like design reuse 🚀, validation, version control and collaboration in hardware; starting with electronics ⚡️ 

> > Write hardware like software. atopile is a language, compiler, and toolchain for electronics—declarative .ato files, deep validation, and layout that **works natively with KiCad**.

<!--
https://www.youtube.com/watch?v=1spW6vkpPMU 
-->
{{< youtube "1spW6vkpPMU" >}}

{{< callout type="info" >}}
Only for AC (not DC!)
{{< /callout >}}

{{< youtube "me6034BrwN8" >}}
<!-- 
https://www.youtube.com/watch?v=me6034BrwN8 -->

{{< details title="More about Reactive Power 📌" closed="true" >}}

Reactive power is crucial for efficient electricity transmission and distribution.
*   **Real Power:** The power that performs actual work (measured in watts).
*   **Reactive Power:** The power needed to create and maintain electromagnetic fields for energy transmission (measured in VAR).
*   Reactive power is consumed by:
    *   **Inductive Loads:** Motors and transformers (causing lagging power factor).
    *   **Capacitive Loads:** Capacitor banks (causing leading power factor).
*   Poor reactive power management leads to:
    *   Higher transmission losses.
    *   Increased energy costs.
    *   Greater power plant emissions.
*   **Power Factor (PF):** The ratio of real power (kW) to apparent power (kVA). It shows how effectively power is used.  A low PF (below 0.9) means poor real power utilization and increased reactive power needs.
*   PF improvement solutions:
    *   **Passive PF Correction:** Adding fixed capacitors or inductors.
    *   **Active PF Correction:** Installing controllable VAR compensators or SVCs.
*   Reactive power control aims to:
    *   Improve PF.
    *   Minimize losses.
    *   Maintain voltage stability.
*   Reactive power compensation methods:
    *   **Series Compensation:** Capacitors in series with the transmission line.
    *   **Shunt Compensation:** Capacitors or reactors in parallel with a load or line section.
    *   **Hybrid Compensation:** Combining series and shunt compensation.
*   Understanding and managing reactive power leads to:
    *   Better electrical network performance.
    *   Reduced losses and costs.
    *   Lower emissions.
    *   Increased equipment lifespan and efficiency.

{{< /details >}}


## Mechanical Engineering

https://github.com/JAlcocerT/ThreeBodies
https://github.com/JAlcocerT/ThreeBodies/blob/main/Z_DeployMe/3bodes-flask.png

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/mechanical-engineering-cool-stuff/" title="Summarizer" image="/blog_img/GenAI/yt-summaries/yt-summaries-groq.png" subtitle="With Groq API" >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Slider Crank" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Slider Crank Mechanism in Python" >}}
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=DT-1REn31eQ -->
{{< youtube "DT-1REn31eQ" >}}


{{< youtube "C-FEVzI8oe8" >}}

https://www.youtube.com/watch?v=C-FEVzI8oe8


$$
\begin{aligned}
  \nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
  \nabla \cdot \mathbf{B} &= 0 \\
  \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
  \nabla \times \mathbf{B} &= \mu_0 \left( \mathbf{J} + \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)
\end{aligned}
$$


### Sailing

Sailing...3 times faster than wind speed?

Magic? 

Or just physics?

https://www.youtube.com/watch?v=kk4AV3d4v3E

https://www.youtube.com/watch?v=NefnpuxS2uM

Yes, it is absolutely true. In sailing, a **beam reach** (sailing perpendicular to the wind) is significantly faster than **running** (sailing directly away from the wind).

This might seem counter-intuitive—one would think "pushing" the boat from behind would be fastest—but the physics of aerodynamics and "apparent wind" prove otherwise.

1. The "Push" vs. The "Lift"

The difference lies in how the sail interacts with the air:

* **Running (Downwind):** The sail acts like a **parachute**. It uses **drag** to catch the wind and "push" the boat forward. In this mode, you can never go faster than the wind speed itself because once you match the wind speed, the sail feels zero pressure.
* **Beam Reach:** The sail acts like an **airplane wing**. Air flows across both sides of the sail, creating a pressure difference that generates **lift**. Lift is a much more efficient force than drag and can pull a boat forward with incredible speed.

2. The Power of "Apparent Wind"

This is the most critical factor. As a boat moves, it creates its own wind (like sticking your hand out of a moving car window).

* **When Running:** The wind you create by moving *subtracts* from the true wind. If the wind is 20 knots and you sail downwind at 10 knots, the sail only "feels" 10 knots of wind.
* **On a Beam Reach:** The wind you create by moving *adds* to the true wind at an angle. This creates **Apparent Wind**, which is stronger than the actual wind blowing across the water. Because the sail "feels" more wind than actually exists, it can generate enough lift to propel the boat faster than the true wind speed.

3. Hull Resistance and Stability

* **Running:** The wind is pushing the stern (back) of the boat down into the water, increasing drag on the hull.
* **Beam Reach:** While the boat tilts (heels) more, it tends to "slice" through the water more efficiently. In high-performance boats (like the ones you see in the America's Cup or high-end karts with sails), they can reach speeds 2 or 3 times faster than the wind on a reach.


| Point of Sail | Sail Physics | Top Speed Potential |
| --- | --- | --- |
| **Running** | Drag (Parachute) | Limited to slightly less than wind speed. |
| **Beam Reach** | Lift (Wing) | Can exceed wind speed significantly. |

### Connection to your ApexSim Project

This concept is very similar to why you are modeling **Lateral vs. Longitudinal G-forces** in your kart. Just as a sail is most efficient when the force is applied at an angle (Reach), a tire's grip is most complex when you are "blending" forces (Trail Braking).

**Would you like to see a "Polar Diagram"? It's a graph sailors use (similar to your G-G Ellipse) to show exactly how fast a boat can go at every different wind angle.**


https://www.youtube.com/watch?v=WfJbF0xkUOY

## Chemistry


$$\ce{Hg^2+ ->[I-] HgI2 ->[I-] [Hg^{II}I4]^2-}$$

https://jalcocert.github.io/JAlcocerT/making-soap-at-home/

{{< details title="Cool chemistry 📌" closed="true" >}}

Reacción del nitrato de potasio con azúcar y del ácido nítrico con aluminio

**Nitrato de potasio y azúcar**

La mezcla de nitrato de potasio (KNO3) y azúcar (sacarosa, C12H22O11) produce humo al calentarse debido a una reacción de combustión. El nitrato de potasio actúa como un oxidante, proporcionando el oxígeno necesario para que el azúcar se queme. La reacción general es compleja y produce varios productos, incluyendo dióxido de carbono (CO2), vapor de agua (H2O), nitrógeno (N2) y óxido de potasio (K2O).

La ecuación química simplificada de la reacción sería:

```
KNO3 + C12H22O11 → CO2 + H2O + N2 + K2O
```

$$\ce{KNO3 + C12H22O11 -> CO2 + H2O + N2 + K2O}$$


Esta reacción es exotérmica, lo que significa que libera calor, lo que a su vez mantiene la reacción en marcha y produce el humo característico. El humo está compuesto por partículas sólidas (principalmente óxido de potasio) y gases (dióxido de carbono, vapor de agua y nitrógeno).

**Ácido nítrico y aluminio**

La reacción del ácido nítrico (HNO3) concentrado con aluminio (Al) es una reacción redox compleja que produce nitrato de aluminio (Al(NO3)3), óxidos de nitrógeno (NOx) y agua (H2O). La reacción es altamente exotérmica y puede ser peligrosa si no se realiza con precaución.

La ecuación química simplificada de la reacción sería:

```
Al + HNO3 → Al(NO3)3 + NOx + H2O
```


$$\ce{Al + HNO3 -> Al(NO3)3 + NOx + H2O}$$


El aluminio se oxida, perdiendo electrones, mientras que el ácido nítrico se reduce, ganando electrones. Los óxidos de nitrógeno (NOx) son los que producen el humo marrón característico de esta reacción.

Es importante tener en cuenta que esta reacción puede ser muy violenta y generar gases tóxicos, por lo que se debe realizar únicamente en un laboratorio con las medidas de seguridad adecuadas.

**Precauciones**

Tanto la mezcla de nitrato de potasio y azúcar como la reacción de ácido nítrico con aluminio pueden ser peligrosas si no se manejan correctamente. Se recomienda no intentar estos experimentos en casa y buscar la guía de un profesional en caso de ser necesario.


{{< /details >}}

---


* Thanks to [HUGO Hextra Theme and katex](https://imfing.github.io/hextra/docs/guide/latex/)!


---


**TL;DR**


**Intro**

THis year i discovered that for simple calculations some JS vibe coded and shipped statically into your browser can do.

You can get [your MRR](https://libreportfolio.pages.dev/recursos/calculadora-mrr/) *super complex* operation done.

Even CAGR or [FIRE calculator](https://libreportfolio.pages.dev/recursos/fire-calculator/) represented and packed as astro component.

But what happens when you need something more complex?

I used Wolfram and Matlab during my studies.





3. Wolfram alfa, but FOSS calculator: <https://www.opensourcealternative.to/project/Kalker>

* https://kalker.xyz

> **MIT** | A scientific calculator that supports math-like syntax with user-defined variables, functions, differentiation, integration, and complex numbers. 

4. See also the [Sympy](https://pypi.org/project/sympy/) Python library for symbolic mathematics

> Matlab had a similar feature, which I used on [this thesis](https://github.com/JAlcocerT/Bike_dynamic_simulator)

### SelfHosted Calculators

1. IT-Tools

2. OmniTools