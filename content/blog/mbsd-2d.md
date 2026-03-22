---
title: "2D Kinematics and Dynamics"
date: 2026-03-24
draft: false
tags: ["MBSD x 2D Simulation","Point Reference Coordinates","ThreeJS x AR"]
description: 'The physics of pedaling with your bicycle.'
url: '2d-mbsd'
math: true
---



**Tl;DR**

A summary of 2D mechanics for multibody systems.

**Intro**

I vibecoded in one shot a static cool page about multibody: https://multibodysystemdynamics.pages.dev/

And ended up taking back mbsd where I left it during [spring of 2023](https://jalcocert.github.io/JAlcocerT/slider-crank-mechanism/).

How much things have changed since then...

I mean, same physics.

But...

Lets say that now migration from Matlab to Python is waaay faster.

## About MBSD

Code is law, specially for multibody system dynamics.

```sh
git clone git clone https://github.com/JAlcocerT/mbsd
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="NEW MBSD" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a Go desktop app for HUD overlays for GoPros" >}}
{{< /cards >}}

* https://github.com/JAlcocerT/Slider-Crank
* https://github.com/JAlcocerT/mechanism


### Kinematics


With *just kinematics* and the learnings inside the 3D-Design repository...

You can do cool stuff already.

```sh
cd ./3D-Design/mbsd-to-render/bicycle_leg
#make help
```

```sh
make all
rsync -avP jalcocert@192.168.1.2:/home/jalcocert/3Design/mbsd-to-render/bicycle-leg/render/bicycle_leg.mp4 .
mpv bicycle_leg.mp4
```

{{< youtube "PBFRIEC9aB8" >}}

<!-- https://youtu.be/PBFRIEC9aB8 -->

### Dynamics

Understand **constrained dynamics** and how to simulate real mechanisms with 2D motions.

```sh
cd ./mbsd/2D-Dynamics
```

Video Sequence in _all.mp4
The combined video now shows the complete causality chain:

Forces (gravity + applied torque)
Constraints (gravity vs constraint forces) ← NEW!
Accelerations (F = ma)
Velocities (∫a dt)
Energy Flow (validation)

What This Proves
The constraint forces visualization will make it crystal clear:

Gravity is indeed constant (red arrows barely move)
Constraint forces vary with mechanism configuration (blue arrows dance around)
When you add them together (green arrows), you get exactly the acceleration pattern
This is why your intuition was right: constant gravity alone can't explain variable accelerations






The Physics: Constrained Lagrangian Mechanics

M·a = Q_total = Q_gravity + Q_constraint + Q_applied

**The Equation We Solve**

```
M(q) @ a + ∇V(q) = Q_ext + C_q^T @ λ
```

Where:
- **M(q)** = Mass matrix (constant in reference coordinates)
- **a** = Acceleration vector (what we compute)
- **∇V(q)** = Potential energy gradient (gravity effects)
- **Q_ext** = External forces (torques, springs, user input)
- **C_q^T @ λ** = Constraint reaction forces (the hidden part!)
- **λ** = Lagrange multipliers (automatic, varies with config)

**The Constraint Equations**

```
C(q, t) = 0              ← Joint constraint (position)
C_q @ v = ∂C/∂t          ← Velocity constraint (automatic)
C_q @ a = -dC_q @ v - d²C/dt²   ← Acceleration constraint
```


## A 2D MBSD Simulator

As Im preparing for 3D, just thought that matplotlib could be insufficient.

I got to know about: https://threejs.org/

Just tweaked the architecture and made it hybrid...

```sh
#git clone https://github.com/JAlcocerT/mbsd
cd /home/jalcocert/Desktop/mbsd/2D-Dynamics && source venv/bin/activate && python3 examples/export_for_viewer.py 
#cp /home/jalcocert/Desktop/mbsd/2D-Dynamics/viewer/data/slider-crank*.json /home/jalcocert/Desktop/mbsd/2D-Simulator/viewer/data/ && ls -lh /home/jalcocert/Desktop/mbsd/2D-Simulator/viewer/data/*.json
```

That will generate a JSON export with what the mechanism do.

To visualize whats coming: *and debug*

```sh
#cd ./mbsd/2D-Dynamics

cd /home/jalcocert/Desktop/mbsd/2D-Simulator
python3 visualize_json.py viewer/data/slider-crank-no-gravity.json --frame 0 --output reference_frame_0.png

# Visualize frame 0 (initial position)
python3 visualize_json.py viewer/data/slider-crank-no-gravity.json

# Visualize a specific frame and save as PNG
python3 visualize_json.py viewer/data/slider-crank-no-gravity.json --frame 50 --output frame_50.png

# Works with any mechanism JSON
python3 visualize_json.py viewer/data/slider-crank.json --frame 100 --output gravity_frame.png
```


Now to visualize it: *thanks to threeJS we have some kind of augmented reality :)*

```sh
cd ./mbsd/2D-Simulator
npm install
```

This installs:
- **Three.js** - 3D WebGL rendering library
- **Vite** - Fast development server
- **dat.gui** - UI controls (for future enhancements)

```bash
npm run dev
```


Yes, we already capture all that data in the JSON! Looking at lines 247-262 of the export function:

```json
trajectory_data = {
    "time": [float(t) for t in t_dyn],
    "positions": [...],
    "velocities": [...],        # ← Already have this
    "accelerations": [...],     # ← Already have this
    "tau_applied": [...],       # ← Constraint forces at joints
    "energy": {                 # ← Already computing
        "kinetic": [...],
        "potential": [...],
        "total": [...]
    }
}
```

What we could visualize (Phase 2):

Velocity vectors — arrows at joints showing speed magnitude/direction
Acceleration vectors — arrows showing acceleration at points
Force vectors — arrows at constraint points showing internal forces
Color-coded bars — bars colored by velocity/acceleration magnitude
Energy flow — animate kinetic↔potential energy transfers
Vector trails — show historical path of joint motion


---

## Conclusions



Some people say that we could be doing our passions only if there would be some kind of magic that pay for it.

Not sure about you, but I dont believe in magic.

And if you want my time you can rent it below: *for that price signal i'd stop doing this and start caring about your problems* 

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

Selfish?

Other people would thank you for the compliment!

If you are here for the free goodies, you can have them at the time of writing at the ebooks site.

Enjoy!

---

## FAQ

* https://brm.io/matter-js/

>  Matter.js is a 2D physics engine for the web 



### Phase Portrait Analysis

In the context of your bicycle simulator—or any complex dynamical system—a **phase portrait** is a visual map of all possible behaviors of the system. 

Instead of plotting a variable (like lean angle) against **time**, you plot the state variables against **each other** (typically position vs. velocity).

### 1. The State Space

For a bicycle, the "state" at any second is defined by its coordinates $q$ and their rates of change $\dot{q}$. 

A phase portrait usually picks two critical variables to show stability. 

* **X-axis:** Position (e.g., Lean Angle $\phi$)
* **Y-axis:** Velocity (e.g., Lean Rate $\dot{\phi}$)

### 2. Key Components of the Map

When you look at a phase portrait, you aren't just looking at one simulation run; you are looking at the "flow" of the entire mathematical universe of that system:

* **Trajectories:** The lines or curves. Each line represents one possible "story" of the bicycle from a specific starting point.
* **Equilibrium Points (Fixed Points):** These are the "resting" spots where the system doesn't change ($\dot{q} = 0$).
    * **Stable (Sink):** If the trajectories spiral inward toward the center, the bike is self-stabilizing.
    * **Unstable (Source/Saddle):** If the trajectories veer away, the bike is falling over.
* **Limit Cycles:** A closed loop. In a bicycle, this might represent a steady, wobbling "weave" where the bike doesn't fall but oscillates forever.

### 3. Why it Matters for Your Simulator

Phase portraits are the ultimate "litmus test" for your physics engine. 

1.  **Stability Detection:** You mentioned the bike is stable at 10 m/s. In a phase portrait of $\phi$ vs. $\dot{\phi}$, you would see a "basin of attraction"—a region where, even if you push the bike, the lines eventually curve back to $(0,0)$ (upright and still).
2.  **Bifurcations:** As you lower the speed in your simulator from 10 m/s to 2 m/s, the phase portrait will physically change. The stable "sink" at the center might split or vanish, visually showing you exactly at what speed the gyroscopic and caster effects are no longer enough to keep the bike upright.
3.  **Sensitivity to Initial Conditions:** It helps you see how much "lean" is too much. The portrait will show a clear boundary (a **separatrix**) where one trajectory leads back to upright and the one right next to it leads to a crash.

### 4. Mathematical Connection

In your documentation, you solve for $\ddot{q} = M(q)^{-1} \cdot Q(q, \dot{q})$. To create the phase portrait, you take that $\ddot{q}$ and use it to draw the **vector field** (the little arrows) that tell the state which way to move at every point in the graph.

In common conversation, people often use the terms interchangeably, but in technical physics and engineering, they actually refer to two different things.

### The Key Difference

* **Phase Portrait (Dynamics):** This is what relates to your bicycle simulator. it maps the **state** of a system (position vs. velocity) over time. It shows how a single system moves, oscillates, or crashes.
    
* **Phase Diagram (Thermodynamics/Chemistry):** This maps the **state of matter** (Solid, Liquid, Gas) based on external conditions like Pressure and Temperature.
    

---

### Why the confusion happens

In the broader field of **Non-linear Dynamics**, some researchers use the term "Phase Diagram" to describe a map of **Stability Regions**. 

For your bicycle model, a "Phase Diagram" might look like this:
* **X-axis:** Forward Velocity ($v$)
* **Y-axis:** Lean Angle ($\phi$)
* **The Map:** Shows colored regions where the bike is "Self-Stable," "Unstable (Capsize)," or "Unstable (Weave)."

In this specific context, the diagram isn't showing a single "trip" or trajectory; it’s showing the **boundary** where the physics of the bike changes fundamentally.

### Summary Table

| Feature | Phase Portrait | Phase Diagram |
| :--- | :--- | :--- |
| **Primary Use** | Mechanical/Dynamical Systems | Materials Science/Thermodynamics |
| **Axes** | Position vs. Velocity ($q$ vs. $\dot{q}$) | Pressure vs. Temperature ($P$ vs. $T$) |
| **What it shows** | A "Path" or "Trajectory" | A "Region" or "State" |
| **Bicycle Context** | Does *this specific* bike fall over? | At *what speeds* is this bike design stable? |

**Would you like to see how the "Self-Stability" region of your bicycle changes if you alter the mass of the front wheel ($m_5$)?**