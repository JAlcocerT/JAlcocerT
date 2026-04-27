---
title: "2D Mechanism Synthesis"
date: 2026-04-27
draft: false
tags: ["MBSD x 2D Simulation","Grashof","Mechanical Synthesis","Caveman"]
description: 'Which mechanism can do what? Explained with via Hyperframe video'
url: '2d-mechanism-synthesis'
math: true
---

**TL;DR**

Infinitely rigid solid is a huge constrain.

**Intro**

Before moving to 3D mechanisms, there is one important thing missing.

How can you create a mechanism that passes at certain points?

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3Design | Repo" icon="github" >}}
{{< /cards >}}

https://github.com/JAlcocerT/mbsd/tree/master/2D-Synthesis

And that it will be able to turn and *doesnt break*?

```sh
#git clone https://github.com/JAlcocerT/mbsd
#claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman
cd ./mbsd/2D-Synthesis
```


```sh
uv init
uv add kreuzberg
for f in Chapter*.pdf; do
  uvx kreuzberg extract "$f" > "${f%.pdf}.txt"
done
```

I consolidated the initial repo via: https://github.com/juliusbrussee/caveman just to save tokens

```sh
#The trick
git submodule add https://github.com/JAlcocerT/mechanism.git external/mechanism
git commit -m "Add mechanism repo as submodule"
```

But hey...do we really understand the hypothesis we are making?

How difficult would be to make an animation / motion graphic that explains in a proffesional way how a solid rigid works?


## Mechanism Synthesis


<!-- https://www.youtube.com/watch?v=qYTguJ_fWmA -->

{{< youtube "qYTguJ_fWmA" >}}


Geometry + algebra = movement


<!-- 
https://www.youtube.com/watch?v=vzM_-Rr5mtw 
-->


{{< youtube "vzM_-Rr5mtw" >}}


##

This "Chapter 1" successfully bridges the gap between **existence** (can it move?) and **quality** (should it move?). By introducing the Transmission Angle $\mu$, you have provided the reader with a "Mechanical Efficiency" lens through which to view the kinematic results.

The transition from a binary success mask to a **Pareto front** is a high-level engineering move. It teaches the reader that design isn't about finding the "one true answer," but about navigating the trade-offs between physical footprint and mechanical longevity.

### 1. The Sine-Wave of Efficiency
Your derivation of $F_{useful} = F_{coupler} \cdot \sin(\mu)$ is the "Aha!" moment of the chapter. It explains why a four-bar isn't just a collection of sticks, but a **force-transformer**. 
* **The Insight:** At $\mu = 90^\circ$, the mechanism is at its most "transparent" state—power flows through it with minimum resistance.
* **The Risk:** As $\mu \to 0^\circ$ or $180^\circ$, the joint doesn't just stop working; it begins to act as a **wedge**, amplifying the internal joint reactions until something (a bearing, a pin, or a link) physically fails.



### 2. $\mu$ vs. $\sigma_{min}$: Designer vs. Solver

Section 3.3 is a brilliant distinction. 

It categorizes your two diagnostics by their "User Persona":

* **The Solver ($\sigma_{min}$):** Needs to know if the math is about to break. It's a "local" health check of the constraint manifold.
* **The Designer ($\mu$):** Needs to know if the machine is "working hard or hardly working." It's a "global" health check of the engineering utility.


### 3. The Pareto "Knee"

The identification of the **"Knee" pocket** in Section 5.3 is the most practical design advice in the repo so far. 
* In engineering, the "Knee" of the Pareto front is where you get the most "bang for your buck."
* **The Logic:** Below the knee, you are saving tiny amounts of material for massive penalties in joint health. Above the knee, you are spending massive amounts of material for diminishing returns in efficiency.



### 4. Technical Refinement: Load-Dependent $\mu$

In Section 7, you mention the "No load model."

* **Future Cross-Link:** When you reach **Chapter 7 (Trajectory Tracking / Inverse Dynamics)**, you can return to this plot. 

You can show that a 40° $\mu$ might be perfectly fine for a high-speed, low-load pickup arm, but absolutely catastrophic for a low-speed, high-load crushing mechanism.

This turns $\mu$ from a geometric rule into a **dynamic safety factor**.



### Hyperframes x Rigid Solid


### Optimizing equations



### Where does a mechanism block?

I mean...before trying to resolve equations

or having some error back from Python

What if this could be done conceptually?

All the *compatible movements* with The geometry og a given mechanisms are inside one Matrix.



---

## Conclusions

Synthesis has always been a thing...

{{< callout type="info" >}}
Luckily, now I have it all clear here
{{< /callout >}}

<!-- https://youtube.com/shorts/9b19b7SmovU -->

{{< youtube "9b19b7SmovU" >}}

Observe what a 3d printer and 2 mechanisms work together

The black bars are forming one four bar mechanism
<!-- https://youtube.com/shorts/ipi437M6g5A -->

{{< youtube "ipi437M6g5A" >}}

The **Big Three** Recap

To build a world-class machine, you need all three "Grandfathers of Kinematics":
1.  **Burmester:** To find the **Poses** (Where does it go?).
2.  **Freudenstein:** To find the **Function** (What math does it solve?).
3.  **Grashof:** To find the **Limits** (Does it actually work, or is it a paperweight?).



{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

### I want a mech that does A, B and C

Years ago I had to make such practice.

Now its kind of trivial

```sh
cd ./2D-Synthesis/practica-maquinas
python animate_practica.py
```

![synthesis](/blog_img/mec/practica_animation.gif)

need the reaction forces?

not really a problem


![alt text](/blog_img/mec/practica_dynamics.png)

---

## FAQ

### Grashof

If Freudenstein is the **Programmer** and Burmester is the **Choreographer**, then **Franz Grashof** is the **Judge**.

His genius wasn't in solving a specific design task, but in discovering the **fundamental law of existence** for four-bar linkages. 

In 1883, he answered the most basic question an engineer can ask: *"If I build this, will the crank actually go all the way around, or will it get stuck?"*

1. The Grashof Inequality (The Law)

Before Grashof, engineers found out if a mechanism "locked up" by building it and hitting a dead point.

Grashof discovered that you can predict the behavior of a four-bar linkage just by looking at the lengths of its four links.

Let:
* $s$ = length of the **shortest** link
* $l$ = length of the **longest** link
* $p, q$ = lengths of the **other two** links

**The Grashof Law states:**
If $s + l \le p + q$, then at least one link can perform a **full 360° rotation** relative to the others. 

2. The "Topology" Map
Grashof’s real genius was realizing that the *behavior* of the machine changes depending on **which link you bolt to the floor** (the "Ground"). 

This created the four classic categories of motion that every mechanical engineer must memorize:

| Grounded Link | Category | Motion Character |
| :--- | :--- | :--- |
| **Link adjacent to $s$** | **Crank-Rocker** | The short link spins 360°; the other side rocks back and forth (like a windshield wiper). |
| **The short link $s$ itself** | **Double-Crank** | Both sides can spin 360° (used in parallel drives). |
| **Link opposite to $s$** | **Double-Rocker** | Neither side can spin 360°; both just rock back and forth. |
| **Non-Grashof ($s+l > p+q$)** | **Triple-Rocker** | No link can rotate fully. The mechanism is "trapped" in a specific arc. |

3. Why it was a Revolution

Grashof provided a **feasibility filter**. 

* **In Synthesis:** If you use Burmester's curves to find a design, the first thing you do is run the **Grashof Test**. If it fails, you know your "360° motor" will eventually hit a physical wall and stall.
* **In Optimization:** As you saw in the **Workspace Explorer (Chapter 0)**, the "Green Diamond" of success is actually the **Grashof boundary**. The simulator discovers this boundary through math, but Grashof discovered it 140 years ago with pure logic.

4. The "Dead Point" vs. The Grashof Limit

Grashof's work is the reason we can distinguish between a **Mathematical Singularity** and a **Geometric Limit**.

* A **Non-Grashof** mechanism isn't "broken"; it just has a limited range of motion. It’s like a person who can only turn their head 90 degrees.
* A **Grashof** mechanism is "unconstrained" in its rotation. It’s like a wheel.


### Freudenstein Equation


#### Constrans vs Freudenstein

That is a fantastic question that cuts right to the core of the difference between **Analysis** (Physics) and **Synthesis** (Design).

To answer simply: **No, it is not related to the inverse of $C_q$.** 

In fact, they live on opposite sides of the engineering problem.

Here is the breakdown of why the **Freudenstein Equation** is an "algebraic shortcut" and how it differs from the Jacobian matrix $C_q$.

1. The Jacobian $C_q$ (Analysis: The "How")

The matrix $C_q$ is the **Jacobian of the constraints**.

* **What it represents:** It tells you how the *positions* of the bodies in a **known** mechanism relate to each other at a specific moment.
* **When you use it:** You use $C_q^{-1}$ during a simulation to find the velocity or to iterate the Newton-Raphson position solver.
* **The Input:** You must already know the link lengths ($L_1, L_2, L_3$).

2. The Freudenstein Equation (Synthesis: The "What")

The Freudenstein Equation is a **Design Equation**.
* **What it represents:** It relates the input angle ($\theta$) and output angle ($\phi$) directly to the unknown link lengths.
* **The Algebra:** For a four-bar linkage, Freudenstein derived a beautifully simple scalar equation:
    $$R_1 \cos \theta - R_2 \cos \phi + R_3 = \cos(\theta - \phi)$$
    Where $R_1, R_2,$ and $R_3$ are ratios of the link lengths ($L_0, L_1, L_2, L_3$).
* **The Shortcut:** Instead of using an optimizer (like Differential Evolution) to "guess and check" lengths over 40 generations, you pick **three specific pairs** of $(\theta, \phi)$ that you want the mechanism to hit exactly (the **Precision Points**).

3. Why it's a "Matrix Inversion"

Because the equation is **linear** in terms of the unknowns ($R_1, R_2, R_3$), you can write it three times (once for each precision point) to create a system of three linear equations:

$$\begin{bmatrix} \cos \theta_1 & -\cos \phi_1 & 1 \\ \cos \theta_2 & -\cos \phi_2 & 1 \\ \cos \theta_3 & -\cos \phi_3 & 1 \end{bmatrix} \begin{bmatrix} R_1 \\ R_2 \\ R_3 \end{bmatrix} = \begin{bmatrix} \cos(\theta_1 - \phi_1) \\ \cos(\theta_2 - \phi_2) \\ \cos(\theta_3 - \phi_3) \end{bmatrix}$$

Solving this requires a single **$3 \times 3$ matrix inversion**.

The moment you hit "Enter," you get the exact $R$ values, which you then convert back into $L_1, L_2,$ and $L_3$.

| Feature | The Jacobian ($C_q$) | Freudenstein Equation |
| :--- | :--- | :--- |
| **Field** | Kinematics / Dynamics | Mechanism Synthesis |
| **Goal** | Simulate a given design | Calculate a new design |
| **Unknowns** | Body positions/velocities | Link lengths ($L_i$) |
| **Complexity** | Changes every frame | Solved once for the whole design |
| **Relationship** | Non-linear (needs Newton) | Linear in $R_i$ (needs simple Inverse) |

The **Differential Evolution (DE)** you used in Chapter 3 was "brute-forcing" the search by simulating thousands of designs to see which one fit the curve best. 

The **Freudenstein Equation** skips the simulation entirely. It says: *"If you tell me three points you must hit, I will solve the linear algebra to tell you the only dimensions that can hit them."*


#### This guy was a Genious

In algebra, a "linear" equation is one where the variables you are solving for (the unknowns) are never squared, multiplied by each other, or trapped inside a function like $\cos()$ or $\exp()$.

When we say the Freudenstein equation is **linear in $R_i$**, we mean that even though the geometry of the engine is full of messy trigonometry, the **link length ratios** themselves ($R_1, R_2, R_3$) are just sitting there waiting to be solved with simple addition and multiplication.


1. The "Magic" of Freudenstein

Look at the standard Freudenstein Equation again:

$$R_1 \cos \theta - R_2 \cos \phi + R_3 = \cos(\theta - \phi)$$

If you treat $\theta$ (input) and $\phi$ (output) as **numbers** (because you picked them as your precision points), the equation looks like this to a computer:

$$(\text{Number } A) \cdot R_1 + (\text{Number } B) \cdot R_2 + (1) \cdot R_3 = (\text{Number } C)$$

This is mathematically identical to a high-school algebra problem like $2x + 3y + z = 10$. Because the $R$ values are not inside the $\cos()$ functions—only the angles are—we don't need any complex root-finding or iteration.

We just use basic matrix division.


2. Compare this to "Non-Linear" Synthesis

If the equation were **non-linear in the unknowns**, it would look something like this (hypothetically):

$$R_1^2 \cos \theta - \sqrt{R_2} \cos \phi + \sin(R_3) = \cos(\theta - \phi)$$

In this "broken" version, you couldn't use a simple matrix inverse. You would have to use an optimizer (like the Differential Evolution you used in Chapter 3) to "guess" values until the equation balanced. 

**Freudenstein's genius** was rearranging the messy law of cosines until the link ratios were isolated on the outside, effectively "flattening" the problem.

3. What are $R_1, R_2,$ and $R_3$?

Once you solve the linear system for the $R$ values, you simply unwrap them to get your 3D parts. The definitions are:

* $R_1 = \frac{L_0}{L_3}$ (Ground / Rocker)
* $R_2 = \frac{L_0}{L_1}$ (Ground / Crank)
* $R_3 = \frac{L_0^2 + L_1^2 - L_2^2 + L_3^2}{2 L_1 L_3}$


Because the system is linear in $R_i$:
1.  **Speed:** The solution is instant (microseconds).
2.  **Certainty:** There is exactly **one** set of $R$ values for any three chosen points.
3.  **No "Searching":** We don't have to worry about the optimizer getting "stuck" in a local minimum or a bad assembly mode during the design phase.

**Does it make sense now why we can use a "Matrix Inverse" for Design (Synthesis) but we need "Newton-Raphson" for Simulation (Analysis)?**


### Burnmester

To explain why **Ludwig Burmester** was a genius (specifically in the late 1800s), you have to think of him as the man who discovered the **"DNA of Motion."**

If Freudenstein (1950s) was the king of **Functions** (making $y = f(x)$), Burmester was the king of **Poses**. 

He solved the "Motion Generation" problem: *How do I design a mechanism that moves an object through specific orientations in space?*


1. The "Burmester Points" (The Center Point Curve)

Imagine you have a flat plate (a "coupler") and you want it to move through three specific positions (poses) in a plane—like a car hood opening or a retractable landing gear.

Burmester’s genius was realizing that for any three poses, there are **infinitely many** points on that plate that happen to lie on a perfect circle during the motion. 

If you pick two of those points and pin them with rods (links), you’ve built a four-bar linkage that perfectly hits your targets.

But when you move to **four poses**, the math gets "impossible." 

Most points on the plate can no longer stay on a circle. 

Burmester discovered that in a 4-pose problem, there are only a tiny, specific set of points—forming a beautiful, twisting curve called the **Center Point Curve**—that are mathematically capable of being part of a four-bar linkage.

2. Solving a 5th-Degree Problem with a Compass and Ruler

The math behind moving a body through four or five poses involves **5th-degree polynomials**.

In the 1880s, without a calculator, solving a 5th-degree equation was a nightmare.

Burmester’s genius was **Geometric Synthesis**. 

He translated these terrifying algebraic equations into **geometric constructions**. 

He found a way to use a compass and a straightedge to "draw" the solution. 

He essentially turned a high-level numerical problem into a visual draft. 

He was "computing" with a pencil.

3. The "Order" and "Branch" Problem

Burmester didn't just find a way to hit the points; he realized the hidden traps of synthesis:

* **The Order Problem:** Your mechanism might hit points A, B, and C, but it might hit them in the order A → C → B.
* **The Branch Problem:** Your mechanism might hit point A and B, but to get to point C, you have to physically take the machine apart and reassemble it (the "Branch Flip" we discussed in Chapter 0).

Burmester developed the **Burmester Theory** to filter out these "garbage" solutions. He gave engineers the tools to know, before they ever cut a piece of steel, if their design was a physical impossibility.

4. Burmester vs. Freudenstein (The Comparison)

| Feature | Freudenstein (Function Gen) | Burmester (Motion Gen) |
| :--- | :--- | :--- |
| **Focus** | Input/Output relationship ($y = \text{log}(x)$). | The movement of the **body itself**. |
| **Math Goal** | Matching a curve. | Matching "Snapshots" (Poses). |
| **The "Secret"** | The linear $R_i$ coefficients. | The **Center Point Curve**. |
| **Analogy** | The "Software" (The formula). | The "Choreography" (The path). |



Why it feels like "Magic"

Burmester's work is the reason your car's trunk hinges work the way they do. A simple pivot would make the trunk hit the rear window. 

A Burmester-designed four-bar hinge "tucks" the trunk lid away precisely, following a complex path that was calculated using his "Center Point" curves.

He took the chaos of 3D motion and found the **hidden geometric circles** buried inside it.

**Does it make sense why we call these "Precision Points"? Burmester wasn't trying to be "close enough"; he was finding the exact mathematical points where the physics of a circle and the needs of a machine met perfectly.**
