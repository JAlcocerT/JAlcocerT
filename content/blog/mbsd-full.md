---
title: "Launching a MBSD framework"
date: 2026-05-02
draft: false
tags: ["Mechanism Analytics x Simulations","JAlcocerTech ebook x WhitePaper"]
description: 'A Dynamics x Kinematics HUB. Agentic centered design via CADQuery x Blender.'
url: 'design-centric-mbsd'
math: true
---

https://github.com/JAlcocerT/engine-balance
https://github.com/JAlcocerT/mbsd/tree/master/z-fluid-mechanics
https://github.com/JAlcocerT/mechanism

**TL;DR**

The start of a system to **ship mechanisms as a code**.

**Intro**

You know whats coming right?

The era of drag and drop its slowly going to an end.

And the time for concepts, semantics and **orchestrating outcomes**.


I consolidated the initial mbsd repo via: https://github.com/juliusbrussee/caveman just to save tokens.

## Gabe Morris - Mechanism


```sh
git clone https://github.com/JAlcocerT/mechanism
#choco install blender --version=4.2.2 -y #5.1.1
uv add mapbox-earcut
uv run blender-export/cam_to_stl.py 
uv run blender-export/gear_to_stl.py 
```

You can import the STLs to blender manually or with:

```sh
blender --background --python blender-export/blender_import.py
```

Kinematics only. No dynamics.                                   
                  
  Evidence:                                                                                                     
  - Zero mass/inertia/torque/force-balance code in mechanism/. Sole "forces" mention = stray word in origin       docstring (mechanism.py:270).                                                                                 
  - Solver = vector-loop position/velocity/acceleration via numerical iteration. No Newton-Euler, no kinetics.  
  - Cam output = SVAJ (geometric). No follower spring/preload force calc.
  - Gears = involute geometry only. No bending/contact stress, no power transmission.
  - README confirms: "perform kinematic analysis by utilizing degrees of freedom".

  What you get = θ, ω, α, position, velocity, acceleration of points/vectors. What you don't get = required     
  input torque, joint reaction forces, link stresses, dynamic balancing.

```sh
#git clone https://github.com/JAlcocerT/multi-body

git init && git add . && git commit -m "Initial commit: better ai docs" && gh repo create multi-body --private --source=. --remote=origin --push
```

```sh
#The trick
git submodule add https://github.com/JAlcocerT/mechanism.git external/mechanism
git commit -m "Add mechanism repo as submodule"
git submodule add https://github.com/JAlcocerT/mbsd.git external/mbsd
git commit -m "Add mbsd repo as submodule"
#git clone --recurse-submodules https://github.com/JAlcocerT/multi-body.git
```

## Computational Mechanics


Familiar now. Repo = 2D MBSD simulator (Python) + e-book chaining engine NVH source→driver and suspension arc.

Simulator core (2D-Dynamics/)

- Saddle-point system: M·a + Cqᵀ·λ = Q, Cq·a = γ. Bodies, joints, constraints, contact, cam, terrain.   - Outputs motions + Lagrange reactions.
                                                                                                      
E-book (z-destilled-ebook/) = 12 engine-NVH chapters + 4 suspension + 4 reference. Pipeline: cylinder
→ block → mounts → chassis → cabin → driver.

Examples under 2D-Dynamics/examples/:
- multi-cylinder-nograv/ — i4, boxer4, flat4, V, combustion, balance shafts, mounts, active damping,  
chassis modal
- suspension-terrain/ — quarter_car, road_profile_psd, design_space_sweep, active_suspension
- Adjacent: cam-follower, four-bar, pendulums, scotch-yoke, terrain-wheel


## MBSD Framework Applications


### Augmented Reality Simulations

### Engine Balance

https://jalcocert.github.io/JAlcocerT/simulating-the-shape-of-engine-balance/

#### NVH


#### Synthesis

https://jalcocert.github.io/JAlcocerT/2d-mechanism-synthesis/
https://github.com/JAlcocerT/mbsd/tree/master/2D-Synthesis

I just have not been focusing on mechanism for long time.

But...that time allocation has changed recently.

Ive been tinkering back :)



---


## Conclusions

Believe it or not: this is another industry getting shaped by AI capabilities.

Because if mechanism 3D dynamics its *kind of* trivial now.

So is web development.

```sh
#git clone https://github.com/JAlcocerT/Slider-Crank
cd ./Slider-Crank/landing #https://multibodysystemdynamics.pages.dev/
```

And here is the JAlcocerTech whitepaper about it.

All models are wrong; some are useful.

To decide which one is the best fit for you:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}



### Launching MultiBodySystemsDynamics

How could have I guessed that this domain was available to buy.


I made a quick web wrap: `https://trends.google.com/`

```sh
#git clone https://github.com/JAlcocerT/Slider-Crank #kineo bridge :) #https://multibodysystemdynamics.pages.dev/
#git clone https://github.com/JAlcocerT/multi-body

```

Superseeding [this](https://github.com/JAlcocerT/Slider-Crank/blob/main/prompt-blueprint.md).

```sh
npm run build
#npx wrangler pages project create multibodysystemsdynamics
#https://multibodysystemsdynamics.pages.dev/
ping multibodysystemsdynamics.com
#whois multibodysystemsdynamics.com| grep -i -E "(creation|created|registered)"
#nslookup multibodysystemsdynamics.com
#dig multibodysystemsdynamics.com
```

With [programmatic contact form](https://jalcocert.github.io/JAlcocerT/poc-101/#programmatic-formbricks-via-api), ofc.

About the **"Authority Funnel"** strategy. 

In a high-stakes engineering field, this structure solves three problems at once: **Identity**, **Validation**, and **Lead Generation**.

Here is how those three components work together as a machine:

1. The Landing Page (The "Hook")

Since `multibodysystemsdynamics.com` is a long, formal name, the landing page must be **visually light but technically heavy**.

* **The Hero Section:** A high-quality 3D render or animation of a mechanism.
* **The Value Prop:** "We solve the mechanisms that others guess."
* **The Problem/Solution:** Clearly state that you eliminate mechanical lock-up, branch defects, and vibration through rigorous algebraic synthesis.

2. The Blog Section (The "Magnet")

This is where you handle the "0 search volume" issue.

You don't write for the masses; you write for the **Search Intent**.

* **Topic Clusters:** Write one post per chapter of your work.
    * *Example:* "Why your 2D simulation is lying to you about gyroscopic stability."
    * *Example:* "Solving the 3-position synthesis problem in Python: A Burmester approach."

3. The Contact Form (The "Filter")

Don't just ask for an email. Use the form to **qualify the lead**.

Ask 2-3 technical questions:

* "What is your primary design challenge? (e.g., Path Generation, Force Balancing, 3D Dynamics)"
* "Are you looking for custom software, a one-time analysis, or a consultation?"
* **Why?** High-end clients *prefer* a form that asks for specifics. It tells them you are a professional who values time and understands the complexity of their problem.



### Whats next?

Understanding suspensions?

<!-- https://www.youtube.com/watch?v=VbReLNi2JP4 -->

{{< youtube "VbReLNi2JP4" >}}

---

## FAQ


### Is this an epic launch?

The **launch strategy**: *aka, focus strategy*

In theory, for Non comercial purposes :)

1. maximizar active income
2. ahorrar
3. **Value based or nothing**

The **Tier of Service**: DFY 

The **Tech Stack**:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)/Database** | | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | | |

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | Astro | |
| **Styling/UI Library** | Sassify MIT like theme | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)** | | |
| **Database** | FireStore | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | Firebase Auth | |
| **E-mail/ESP** | MailTrap | |
| **Analytics** | Posthog | |
| **Hosting** | Container | |

### How did you started doing mechanical simulations?

It was actually long ago.

I got re-inspired by [GabeMorris](https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/) few years back.

Now with agents, there is no excuse not to do this just bc is not my job.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/chaos-theory-and-the-double-pendulum-with-python/" title="Double Pendulum Repo" image="https://raw.githubusercontent.com/JAlcocerT/Py_Double_Pendulum/main/Z_Outro/DoublePendulum.gif" subtitle="Python Double Pendulum" >}}
  {{< card link="https://github.com/JAlcocerT/Py_Double_Pendulum" title="Double Pendulum Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code a chaos theory in motion webapp" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/mechanical-engineering-cool-stuff/" title="Summarizer" image="/blog_img/GenAI/yt-summaries/yt-summaries-groq.png" subtitle="With Groq API" >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Slider Crank" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Slider Crank Mechanism in Python" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth/" title="Three Body x Flas" image="/blog_img/dev/flask-vibe-coded.png" subtitle="Flask web app 101 | Blog Post" >}}
  {{< card link="https://github.com/JAlcocerT/ThreeBodies" title="Three Bodies Web App" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Flask Web App to test Traefik x TinyAuth" >}}
{{< /cards >}}

### Agentic Blender?

 https://www.youtube.com/watch?v=LZMWsZbZU5w

Some references: `https://github.com/agmmnn/awesome-blender`

`https://blendercam.com/` -  An Open Source solution for CAM with Blender 3D