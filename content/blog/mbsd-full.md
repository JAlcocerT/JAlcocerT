---
title: "Launching a MBSD framework"
date: 2026-05-02
draft: false
tags: ["Mechanism Analytics x Simulations","JAlcocerTech ebook x WhitePaper"]
description: 'A Dynamics x Kinematics HUB. Agentic centered design via CADQuery x Blender.'
url: 'design-centric-mbsd'
math: true
---


**TL;DR**

The start of a system to **ship mechanisms as a code**.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd/tree/master/z-fluid-mechanics" title="Previous MBSD | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/mbsd/3Design" title="3Design | Repo" icon="github" >}}
{{< /cards >}}

**Intro**

You know whats coming right?

The era of drag and drop its slowly going to an end.

And the time for concepts, semantics and **orchestrating outcomes**.

I consolidated the initial mbsd repo via: https://github.com/juliusbrussee/caveman just to save tokens.

## Gabe Morris - Mechanism

The one I forked because its so great: https://github.com/JAlcocerT/mechanism

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

Every engine in the MBSD series was analysed using the same tool: **phasor analysis**. Each cylinder's reciprocating inertia force is represented as a rotating vector at a given harmonic order ($1\times$, $2\times$, ... engine speed). Sum the vectors for all cylinders — if they cancel, that order is balanced; if they don't, you have a free force or moment that will shake the engine.

The two sources of imbalance are:

- **Free forces** — net unbalanced force transmitted to the mounts and chassis
- **Free moments (couples)** — net unbalanced torque that rocks the engine about its mounts

#### The Phasor Method

For a multi-cylinder engine with crank throws at angles $\phi_k$, the $n$-th order force phasor for cylinder $k$ is:

$$\vec{F}_k^{(n)} = F_0 \cdot e^{j n \phi_k}$$

where $F_0 = m_r \cdot r \cdot \omega^2$ (rotating equivalent mass × crank radius × angular velocity squared). Balance requires $\sum_k \vec{F}_k^{(n)} = 0$ for each order of interest.

For in-line engines the moment check adds a $z_k$ arm (cylinder spacing along the crankshaft axis): $\sum_k z_k \cdot \vec{F}_k^{(n)} = 0$.

#### Engine Family Balance Map

| Engine | Config | Primary ($1\times$) | Secondary ($2\times$) | Free moment | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **I3** | Inline 3 | Balanced | Balanced | Yes — rocking couple | Characteristic 3-cyl rumble |
| **I4** | Inline 4 | Balanced | **Not balanced** | No | $2\times$ shakers standard; balance shafts optional |
| **I6** | Inline 6 | Balanced | Balanced | No | Perfectly balanced — smoothest inline config |
| **Flat-4 / Boxer-4** | Horizontally opposed | Balanced | Balanced | **Yes — offset couple** | Cylinder offset creates hidden rocking moment |
| **V6 (60°)** | V-angle 60° | Balanced | Balanced | Yes — rocking couple | Mount tuning critical; dominant in compact cars |
| **V8 Cross-plane** | 90° V, 90° firing | Balanced | Balanced | No | Uneven bank firing → characteristic burble; US muscle |
| **V8 Flat-plane** | 90° V, 180° firing | Balanced | **Not balanced** | No | Even firing → high-RPM power; needs counter-rotating shafts |
| **V10** | 72° V | Balanced | Balanced | No | Near-ideal; F1 standard before displacement limits |
| **V12** | 60° V | Balanced | Balanced | No | Two I6 joined → inherently perfect |

Key takeaways from the series:

- **I4** is the most common compromise: primary balance achieved cheaply, secondary $2\times$ shaking accepted or suppressed with Lanchester balance shafts spinning at $2\omega$ in opposite directions.
- **Flat-plane V8** (Ferrari 458, Ford GT500R) trades the cross-plane's moment advantage for even $90°$ firing intervals — every bank fires evenly, which improves exhaust scavenging and high-RPM breathing, but the $2\times$ secondary forces require counter-rotating balance shafts or stiff mounts.
- **Boxer-4** feels balanced on paper but the lateral offset between opposing cylinders ($\Delta z \neq 0$) produces a rocking couple that a true opposed-piston engine (with zero offset) would not have.
- **V12** is the engineering endpoint: two I6 crankshafts joined at the middle — every order cancels, no free moments, no balance shafts needed. Cost and length are the only constraints.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/inline-4-engine-analysis/" title="I4 Engine | Post" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/v8-engine-analysis/" title="V8 Engine | Post" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/v6-engine-analysis/" title="V6 + Engine Mounts | Post" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/v10-v12-engine-analysis/" title="V10 / V12 | Post" icon="book-open" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/flat-boxer-engine/" title="Flat vs Boxer | Post" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/simulating-the-shape-of-engine-balance/" title="Engine Balance Visuals | Post" icon="book-open" >}}
{{< /cards >}}

#### NVH


#### Synthesis

https://jalcocert.github.io/JAlcocerT/2d-mechanism-synthesis/
https://github.com/JAlcocerT/mbsd/tree/master/2D-Synthesis

I just have not been focusing on mechanism for long time.

But...that time allocation has changed recently.

Ive been tinkering back :)



---


## Conclusions

Believe it or not: this is another industry getting shaped by AI capabilities:

- **Blender**: photorealistic rendering, rigged animation, organic shapes, video editing — see `z-cadquery/blender_scene.py`.
- **FreeCAD**: assembly constraints, FEM simulation, technical drawings (TechDraw workbench), importing STEP/IGES from suppliers.

```sh
sudo apt install openscad
#cd ./Design/z-openscad
make animate FRAME=60
#  ffmpeg -stream_loop 9 -i slider_crank_os.mp4 -c copy slider_crank_os_10x.mp4
```

The sweet spot for OpenSCAD is **parametric mechanical parts and automated STL pipelines** — exactly what this folder does.


Because if mechanism 3D dynamics its *kind of* trivial now: *at least with improved workflows like this one!*

```
kinematics.py  ──►  OpenSCAD  ──►  CadQuery  ──►  FreeCAD  ──►  Blender
  (math)           (quick check)   (BREP/STEP)    (FEM/draw)   (render)
```

See [the mindmap](https://mermaid.live/edit#pako:eNplVE1vGzcQ_SsDnhJAFbxWLNW6OZJduJBRN3YvhS40OdpltfzokLS9MfwXigbJPceiQNBr_1Z-QmdX2k2q6CBwl4-cN--92SehvEYxF9Y4bWVYOwDyPr14MVliNKVbr93ZJVybgLVx-PJlCwD4_PGvf-BKpgpWskHavQTYMsTKZFQch6Z_qWWS49-id7DFZkPSYuy3zkp0aQ7xATHAG5BOwwpIuvIbiMaEKkE0rsy1JJNMD_n88f2f8FNAd7M4W_anLmRMUKK3mKiBKJ1JDagK1bZHLFaXXb0rucWNqRE0mXt0_fYVH9n4WsPN7Qo2niCQTz41gQkcUON_JJkQxlFJDRvyFmJAdQC7k0lVQOg0ElcuuWTXd9_Fh79hIfXPGWlQ7vWb8-uO5M0tL_AxeEr93vmjZD2YeY0pdqBUEUo9CHedCeG6SZV3I3AefvjlEhyiRn1A7IHVRAiSWF5FJvB1XQ_a2EMXZAh1sy8KEWu2xNPgw4dPcEGIX9twfgUxEcYdQ15KM0h8i6paknxoC6GLxjtkSIXcTw_p-ja27Xuva2YGBumQWNv5rkS2luMRsavtcwo5HWA3tSyh8ikG3yp35--x0y5W7Hffyx-f4HXdeTXoyUc816lN5ICD8tYiKSPrvadDFWd4BLgVxUkn2bGqTVmlr5JzF5p93qBi5jULVDeHecmG4xcVp2vvRz9HB8CUGdGWJCYT_1cPyJSDPe_-hVUr07kreUw5hBde5UHIJU8B30P4ezaEbMg-Vcq7nW1fXFlU3rPAlv3jKYkWkg--9uXQwY9ZlzsDWNVc800OJTEra77cchZ4pFrpfc0yOYWxmzMrXd5wtDm9Qz1WPbFYHBTixHFQOiTz_Ub8JSqjER4qVjZ54GB3k3kfOViGR02MRElGi3mijCPBBlnZPoqn9oa1SBW3vhZzXmpJ27VYu2c-E6T71XvbHyOfy0rMNyw3P-XAzuDSyJK_bQOko7Xw2SUxPz3urhDzJ_Eo5t8VRTE-fVUUr46ns2I6mRXfj0Qj5sXpeNL-Tk4nRydH0-nx80i87aoWYwafnEyLYjI7nkyPZrPn_wDcPuWa)

Each tool has a distinct role — they are not interchangeable:

| Stage | Tool | Job | Output |
|-------|------|-----|--------|
| 1 | **Python** (`kinematics.py`) | Solve positions, angles, constraints per frame | `data.json` |
| 2 | **OpenSCAD** | Fast visual sanity check; lightweight STL for prototyping | `.stl`, `.png` |
| 3 | **CadQuery** | Production-quality BREP geometry, exact fillets/threads | `.step`, `.stl` |
| 4 | **FreeCAD** | FEM stress analysis, tolerance checks, technical drawings | `.pdf`, `.fcstd` |
| 5 | **Blender** | Photorealistic commercial renders and animations | `.mp4`, `.png` |


> Yea, openScad does [not render as beautiful](https://youtu.be/fPi-L7Qn7Xw) as blender does

You need some guardrails not to end up like [the engine balance test](https://github.com/JAlcocerT/engine-balance)



So... even more trivial is web development:

```sh
#git clone https://github.com/JAlcocerT/Slider-Crank
cd ./Slider-Crank/landing #https://multibodysystemdynamics.pages.dev/
```

And here is the JAlcocerTech whitepaper about **AI powered design**.

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