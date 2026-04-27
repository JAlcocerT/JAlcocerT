---
title: "Launching a MBSD framework"
date: 2026-04-26
draft: false
tags: ["Mechanism Analytics x Simulations","CADQuery x Blender","JAlcocerTech ebook x WhitePaper"]
description: 'A Dynamics x Kinematics HUB to perform agentic centered mechanism design.'
url: 'design-centric-mbsd'
math: true
---

https://github.com/JAlcocerT/engine-balance
https://github.com/JAlcocerT/mbsd/tree/master/z-fluid-mechanics

**TL;DR**

The start of a system to ship mechanisms as a code.

**Intro**

You know whats coming right?

The era of drag and drop its slowly going to an end.

And the time for concepts, semantics and orchestrating outcomes.


I consolidated the initial repo via: https://github.com/juliusbrussee/caveman just to save tokens

```sh
##git clone https://github.com/JAlcocerT/mechanism
#git clone https://github.com/JAlcocerT/mbsd
git init https://github.com/JAlcocerT/multi-body
```

## Computational Mechanics


Familiar now. Repo = 2D MBSD simulator (Python) + e-book chaining engine NVH source→driver and
  suspension arc.                                                                                       

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

I just have not been focusing on mechanism for long time.

But...that time allocation has changed recently.

Ive been tinkering back :)



---


## Conclusions

Believe it or not: this is another industry getting shaped by AI capabilities.

Because if mechanism 3D dynamics its kind of trivial now.

So is web development.

```sh
#git clone https://github.com/JAlcocerT/Slider-Crank
cd ./Slider-Crank/landing #https://multibodysystemdynamics.pages.dev/
```

And here is JAlcocerTech whitepaper about it:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


### Whats next?

Understanding suspensions?

<!-- https://www.youtube.com/watch?v=VbReLNi2JP4 -->

{{< youtube "VbReLNi2JP4" >}}

---

## FAQ

The **launch strategy**: *aka, focus strategy*

Non for comercial purposes :)

The **Tier of Service**: DIY (1b - *leverages on actual tech stack Ive put together - PaaS x (WP/Ghost or SSG+CMS)*)

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


https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/

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