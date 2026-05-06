---
title: "Heat Transfer"
date: 2026-05-06
draft: false
tags: ["Black-Scholes","Fluid Dynamics","Ptolomeo","VPD","HeatraPy vs PyScipe"]
description: 'The physics of heat and thermodynamics. The solar plan B.'
url: 'heat-transfer-ice'
math: true
---

**Tl;DR**

Lisa, in this house...

**Intro**

Who could have guessed that behind some IoT for watering plants you could find out the VPD concept.

That can be also very helpful if your are planning to automate the windows of a future greenhouse with a PID.

who.could.have.guessed.

## The HEAT Physics

In Electromagnetism, you have the four **Maxwell’s Equations** which cover everything from how charges create fields to how moving magnets create electricity.

In Heat Transfer, while there is one "Master Equation," the complexity comes from the fact that heat moves in three fundamentally different ways. You can think of it as one law that wears three different "outfits."


### The "Master" Equation (The Heat Equation)

The single equation you are likely thinking of is the **Heat Diffusion Equation**:

$$\frac{\partial T}{\partial t} = \alpha \nabla^2 T$$

This equation is the "boss." 

It describes how temperature ($T$) changes over time ($t$) across a space.

However, this primarily governs **Conduction**. 

To actually solve a real-world problem, you have to "plug in" the specific laws for how heat enters or leaves the system.


### The "Three Laws" of Heat Transfer

Unlike Maxwell's equations, which are usually solved together, heat transfer is often broken down into these three distinct physical mechanisms:

A. Conduction (Fourier’s Law)

This is heat moving through a solid.

*   **The Law:** $q = -k \nabla T$
*   **The Logic:** Heat flows from hot to cold at a rate proportional to the material's "conductivity" ($k$).

B. Convection (Newton’s Law of Cooling)

This is heat moving between a surface and a moving fluid (air or water).
*   **The Law:** $q = h(T_s - T_\infty)$
*   **The Logic:** The faster the fluid moves or the larger the surface area, the more heat is stripped away.

C. Radiation (Stefan-Boltzmann Law)

This is heat moving via electromagnetic waves (no medium required).
*   **The Law:** $q = \epsilon \sigma (T_s^4 - T_{sur}^4)$
*   **The Logic:** This is the "wild card." Because it is $T^4$, doubling the temperature doesn't double the heat—it increases it **16x**. This is why lightbulbs and stars are so intense.


3. Why it feels like "One Equation"

The reason it feels like there is only one equation compared to Electromagnetism is **Energy Conservation**.

In EM, you have to track Electric fields ($E$) and Magnetic fields ($B$)—two different entities that interact. In Heat Transfer, you are only tracking one thing: **Internal Energy (Temperature)**. 

Every heat transfer problem is essentially just an accounting balance:

> **[Energy In] - [Energy Out] + [Energy Generated] = [Change in Stored Energy]**


#### The "Math Fight"

The reason people "fight" with this math isn't because there are too many equations, but because of **Boundary Conditions**.

*   **Electromagnetism:** You often deal with vacuum or uniform materials.
*   **Heat Transfer:** You have to deal with the "real world" at the edges. One side of your metal plate might be touching cold water (Convection), while the other side is being hit by a laser (Radiation), and the inside is generating heat because of electricity (Joule Heating).

**In short:** You have one main "accounting" equation (The Heat Equation), but you have to use the three specific laws (Fourier, Newton, Stefan-Boltzmann) to define what is happening at the borders of your object.

Does comparing it to Maxwell's equations make the "thermal circuit" idea (where $V=T$ and $I=q$) feel more or less intuitive to you?

#### Analogy - Heat vs Electr

The thermal-electrical analogy is a powerful mental model because it allows you to take the highly developed tools of circuit analysis—like Kirchhoff’s Laws and SPICE simulators—and apply them to physical cooling and heating problems.

This works because the fundamental physics of both systems follow the same **diffusion** and **storage** logic.

1. The Core Mapping

To build a thermal "circuit," you simply replace electrical variables with thermal ones:

| Electrical Component | Thermal Equivalent | Units |
| :--- | :--- | :--- |
| **Voltage ($V$)** | **Temperature ($T$)** | Volts $\rightarrow$ Kelvin ($K$) |
| **Current ($I$)** | **Heat Flow ($q$)** | Amps $\rightarrow$ Watts ($W$) |
| **Charge ($Q$)** | **Thermal Energy** | Coulombs $\rightarrow$ Joules ($J$) |
| **Resistance ($R$)** | **Thermal Resistance ($R_{\theta}$)** | Ohms $\rightarrow$ $K/W$ |
| **Capacitance ($C$)** | **Thermal Mass ($C_{th}$)** | Farads $\rightarrow$ $J/K$ |



2. Translating the Components

When you look at a physical object, you "see" it as a circuit board:

Resistors (The Barriers)

In a circuit, a resistor slows down electrons. In heat transfer, a "thermal resistor" represents anything that slows down heat:
*   **Conduction:** A thick piece of plastic has high thermal resistance; a thin piece of copper has low resistance.
*   **Convection:** The air layer sitting on a heatsink acts like a resistor. If you turn on a fan, you are effectively "turning the knob" to lower that resistance.

Capacitors (The Buffers)

In electronics, a capacitor stores charge. In heat, a capacitor represents **Thermal Mass**. 

*   A giant cast-iron skillet is like a massive high-voltage capacitor. It takes a long time to "charge up" (get hot), but once it's charged, it holds that energy for a long time even after the "power" (the stove) is turned off.

Current Sources (The Heat Gen)

A CPU, a laser, or a chemical reaction is modeled as a **Constant Current Source**. 

It is pushing a specific amount of "Current" (Watts) into the system regardless of what the temperature is.


3. Applying Circuit Laws
This is where the magic happens. You can use standard circuit rules to solve complex heat problems:

*   **Ohm’s Law ($V = IR$):** Becomes **$\Delta T = q \cdot R_{\theta}$**. If you know your CPU is putting out 65W ($q$) and your heatsink has a resistance of 0.5 K/W ($R$), you instantly know the temperature rise will be 32.5 degrees above the room temperature.
*   **Kirchhoff’s Current Law (KCL):** The heat flowing into a junction must equal the heat flowing out. This helps you track how heat splits between moving through a thermal pad versus moving through the air.
*   **Series vs. Parallel:** 
    *   **Series:** Heat moving through a CPU lid, then through thermal paste, then through a heatsink (like resistors in a single wire).
    *   **Parallel:** Heat escaping through the top of a device via a fan while simultaneously leaking through the bottom into the table.


4. Where the Analogy Breaks Down

While brilliant, the analogy isn't perfect. You have to be careful with two things:

1.  **Radiation:** As we discussed, radiation is non-linear ($T^4$). In a circuit, this would be like having a resistor whose value changes drastically depending on the voltage. Most SPICE tools struggle with this without custom math.

2.  **Speed of Light vs. Speed of Heat:** Electricity moves at near the speed of light. Heat is a "diffusion" process—it is slow and "sluggish." While the equations look the same, the **time constants** ($\tau = RC$) in thermal systems are usually measured in seconds or minutes, rather than nanoseconds.

Does thinking of a "heatsink" as just a "resistor to ground" make it easier to visualize how to keep a component cool?


## Applications

### Heat transfer x VPD x DHT

```sh
#docker ps | grep emqx
cd ./RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd-poc
docker compose up -d --build
#Web → http://<host>:8001 · DB → localhost:5433.
docker compose up -d --build webapp
#docker compose up -d #and here it goes timescaleDB + all the webApp
#docker exec -it timescaledb psql -U pico -d sensors
#docker ps | grep timescaledb
```

### Heat transfer x MBSD x ICE

Some time ago I had to make one fluid mechanics project in Matlab.

its also time to have it in python, specially this month that im paying claude max.

### Solar (Thermal) Power

Ive noticed some ppl doing cool things on the internet with these.

I could not resist to join the party.

No, i dont mean that you have to go off-grid

```sh
#streamlit run electronics-101/sample-pyscipe/solar_optimizer.py
#uv run streamlit run .\solar_optimizer.py
uv run  uv run ./electronics-101/sample-pyscipe\home-scale-pv\compare_systems.py
```

Just that you can estimate pretty acurately according to your latitude and few parameters how much can you get from the sun: *coming frm this [previous streamlit app](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/go-solar.md#solar-optimizer-interactive-tool) and shaped by this brd*

```sh
git clone /poc
cd ./poc/go-solar/
```

## Tools

Assuming you are referring to **PySpice** (the Python interface for SPICE circuit simulators), the search for a direct equivalent in heat transfer depends on whether you want to solve thermal problems using **electrical analogies** or **physical simulation**.

In engineering, heat transfer is often modeled using "Lumped Element" models where:

*   **Voltage ($V$)** = Temperature ($T$)
*   **Current ($I$)** = Heat Flow ($q$)
*   **Resistance ($R$)** = Thermal Resistance ($R_{th}$)
*   **Capacitance ($C$)** = Thermal Mass ($C_{th}$)

Because of this direct analogy, many engineers actually use **PySpice** itself to solve heat transfer problems by building a "thermal circuit."

However, if you are looking for dedicated thermal libraries, here are the best equivalents:

1. The Direct Functional Equivalent: **Heatrapy**

If you want a library that feels like a "simulator" where you define materials and watch heat flow, **Heatrapy** is the closest match.

*   **What it does:** It is a lightweight framework for 1D and 2D thermal simulations using finite-difference methods.
*   **Best for:** Simulating phase-change materials, caloric effects, and multi-material systems without needing a full CFD (Computational Fluid Dynamics) suite.
*   **Install:** `pip install heatrapy`

2. The Professional Standard: **OpenMDAO / NASA OpenSource**

For complex thermal-fluid systems (like spacecraft or engines), many professionals use **OpenMDAO**.
*   **What it does:** It’s an open-source framework for multidisciplinary analysis and optimization.
*   **Thermal link:** It is frequently paired with thermal plugins to solve large-scale steady-state and transient heat transfer problems.

3. The "Object-Oriented" Modeling: **Modelica (via PyMarl / OMPython)**

SPICE is to electronics what **Modelica** is to general physical systems (heat, mechanics, fluids).

*   **What it does:** Modelica uses a "connector" approach very similar to a SPICE netlist. You can connect a "Heat Port" to a "Thermal Conductor."
*   **Python Interface:** You can use **OMPython** (OpenModelica) or **PyMarl** to script and simulate thermal models using the Modelica Standard Library.

4. Specialized Tool: **ThermoSim**

For those specifically working on thermodynamic cycles and heat exchangers:
*   **What it does:** Focuses on mass and energy balances, heat exchanger design (evaporators, condensers), and power cycles.
*   **Best for:** Industrial applications and energy system design.


*   If you want to stay in the **SPICE mindset** (nodes, resistors, capacitors): Stick with **PySpice** and just label your units as Kelvin and Watts.
*   If you want to simulate **physical objects/materials** in 1D/2D: Use **Heatrapy**.
*   If you are building a **complex machine** (like a fridge or a motor): Use **OpenModelica** via Python.


To model the specific modes of heat transfer—**conduction, convection, and radiation**—the choice of tool depends on whether you want "Lego-style" connectivity or "Grid-style" physics.

Here is how those tools handle the specific physics:

1. Modelica (via OMPython / PyMarl)

[Modelica](https://modelica.org/libraries/) uses a **Lumped Parameter** approach. It treats physical parts as "components" with ports.

*   **Conduction:** You use a `Thermal.Conduction` element. You input the thermal conductivity ($k$), area ($A$), and thickness ($L$). It solves $Q = \frac{k \cdot A}{L} \Delta T$.
*   **Convection:** You use a `Convection` element. You must provide the heat transfer coefficient ($h$). It is excellent for "Fluid-to-Solid" interfaces.
*   **Radiation:** It has a specific `Radiation` element that handles the $T^4$ math (Stefan-Boltzmann Law). You input the emissivity and the view factor.
*   **Pros:** It’s the only one that easily handles **Radiation** and **Convection** out of the box for complex systems (like a radiator cooling an engine).


2. Heatrapy (Pure Python)

Heatrapy is a **Field-based** solver. It divides a solid block into a grid of tiny points.

*   **Conduction:** This is Heatrapy’s bread and butter. It calculates how heat "diffuses" through a material over time. It is much more accurate for seeing *where* a hot spot develops in a solid object.
*   **Convection/Radiation:** This is where it struggles. You usually have to "fake" these by setting boundary conditions (e.g., telling the edge of the grid that it is losing a certain amount of energy to the air).
*   **Pros:** If you want to see a heat map of a 2D metal plate, this is the tool.


3. The "Electrical Analogy" (PySpice)

As mentioned before, if you use PySpice, you have to manually convert the physics into electrical components.

| Heat Mode | SPICE Component | Parameter |
| :--- | :--- | :--- |
| **Conduction** | **Resistor** | $R_{th} = \frac{L}{k \cdot A}$ |
| **Convection** | **Resistor** | $R_{conv} = \frac{1}{h \cdot A}$ |
| **Thermal Mass** | **Capacitor** | $C_{th} = m \cdot c_p$ |
| **Radiation** | **Non-linear Resistor** | Requires a "Voltage Controlled Current Source" because radiation is non-linear ($T^4$). |

> **The Radiation Problem:** SPICE and Heatrapy struggle with radiation because radiation isn't "linear." Doubling the temperature doesn't double the heat loss—it increases it by 16 times ($2^4$). **Modelica** is the only one in this list that handles this "natively" without you having to write custom math.

Which should you choose?

*   **Choose Modelica (OMPython)** if you are building a **System**.
    *   *Example:* Modeling a satellite where heat comes from the sun (Radiation), moves through the frame (Conduction), and is released by a radiator (Radiation).
*   **Choose Heatrapy** if you are analyzing a **Part**.
    *   *Example:* Modeling how long it takes for a specific iron rod to get hot at one end when the other end is in a fire.
*   **Choose PySpice** if you are an **Electrical Engineer**.
    *   *Example:* You already have a circuit board designed in SPICE and you want to add a few "thermal resistors" to make sure the chips don't melt.

Are you looking to create a visual "heat map" of an object, or just calculate the final temperature at a single point?

---

## Conclusions


---

## FAQ

### About Tools

**Modelica** is a standalone language, while **OMPython**, **PyMarl**, and **Heatrapy** are Python-based tools or interfaces that allow you to stay within the Python ecosystem while solving physics problems.

1. Modelica (The Language)

Modelica is a non-proprietary, object-oriented, equation-based language used to model complex physical systems (thermal, electrical, mechanical, etc.). 

Think of it as a "Lego set" for engineers: you connect a "heat source" block to a "pipe" block, and Modelica handles the underlying math.

*   **Pros:** Extremely powerful; handles "multi-physics" (e.g., how a hot motor affects a cooling fluid); huge library of pre-built components (Modelica Standard Library).
*   **Cons:** It is a **separate language** from Python; has a steep learning curve; requires a "compiler" like OpenModelica or Dymola to actually run.

2. OMPython (The Bridge)

**OMPython** is the official Python interface for **OpenModelica**. It allows you to control Modelica from within a Python script. You can load a Modelica model, change parameters, run the simulation, and pull the results back into a NumPy array for plotting.

*   **Pros:** Best of both worlds—you get Modelica’s simulation power with Python's data analysis (Matplotlib, Pandas).
*   **Cons:** It requires a full installation of OpenModelica on your computer to function; the syntax for sending commands can feel a bit clunky compared to native Python.

3. PyMarl (The Automation Specialist)

**PyMarl** is a more specialized Python wrapper for Modelica. It is often used for automating large batches of simulations or performing "parameter sweeps" (e.g., "What happens to the temperature if I test 100 different thicknesses of insulation?").

*   **Pros:** Simplified API compared to OMPython; great for researchers who need to run thousands of simulations in the background.
*   **Cons:** Less flexible than OMPython if you need to build models "on the fly" from scratch in Python.

4. Heatrapy (The Native Python Choice)

Unlike the others, **Heatrapy** is a "pure" Python library. It doesn't need Modelica. It uses the **Finite Difference Method** to solve heat transfer specifically in solids and phase-change materials.

*   **Pros:** **No external software needed** (just `pip install heatrapy`); very easy to learn if you already know Python; specialized for things like phase-change materials (e.g., ice melting or solid-state cooling).
*   **Cons:** Much slower than Modelica for huge systems; limited to 1D and 2D heat transfer; doesn't handle complex fluids (CFD) or mechanical parts well.


| Tool | Language Basis | Best For... | Difficulty |
| :--- | :--- | :--- | :--- |
| **Modelica** | Modelica (Unique) | Heavy industrial systems, vehicles, power plants. | High |
| **OMPython** | Python + Modelica | Using Python to analyze complex Modelica models. | Medium |
| **PyMarl** | Python + Modelica | Large-scale automation and "what-if" testing. | Medium |
| **Heatrapy** | Pure Python | Rapid prototyping of simple heat flow in solids. | Low |

**Modelica** itself is its own language. 

Its files end in `.mo`. 

However, the "Py" in **PySpice**, **PyMarl**, and **PyMAPDL** (another thermal tool) indicates that they are **interfaces**. 

They act like a translator: you write Python code, and the interface translates it into the "native tongue" of the heavy-duty simulation engine running in the background.