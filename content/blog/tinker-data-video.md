---
title: "Just Data Animations"
date: 2026-03-10
draft: false
tags: ["Telemetry x F1 vs Kart","Geo x Statistics","YFinance","Real Estate","Mechanism x MBSD"]
description: 'Unfolding Data this time with some order. WIth gitlab x Roo x Zed.'
url: 'ai-scripts-and-animated-data'
math: true
---


**Tl;DR**

Time to put all those **animations** together.

{{< cards >}}
  {{< card link="https://gitlab.com/fossengineer1/unfolding-data" title="Unfolding Data | NEW Gitlab Repo" icon="github" >}}
{{< /cards >}}

**Intro**

This is going to be a Python master class.

Or a sneek into the future on how cheap*er* information will be.








## F1

Let's continue where I left this at [the previous post](https://jalcocert.github.io/JAlcocerT/f1-data-animated/): `read-wiki.md`

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-f1" title="eda-f1 Github ↗" icon="github" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-geospatial" title="eda-geospatial Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo Section" icon="github" >}}
{{< /cards >}}


### Kart On Boards

Uploading you action cam session is nice.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

Specially when you use ffmpeg to join parts and ship fast.

But you can also create **overlay HUDs** with data from GoPro GPS and accelerometer: *jump out of the kart and do this*

```sh
rsync -avP *.MP4 /home/jalcocert/Desktop/oa5pro/ #speeds of ~32mb/s
sudo apt install mpv
mpv "DJI_20260308T3031.0002.0.MP4"

#git clone

```

Trust me that [karting after raining](https://youtu.be/cQULovJU3Uc) is fun. [Trust me :)](https://www.youtube.com/watch?v=0oBr9mLWfL8)

But so much is to embed the telemetry.

<!-- {{< youtube "ctfGunPZwJ4" >}} -->

{{< youtube "c0YkQhsUNrg" >}}

No need to overcomplicate it with PhyPhox as your action cam already detects 3 axis acceleration for estabilization purposes.

{{< youtube "ctfGunPZwJ4" >}}

You just wont get real time speeds to get the track references right.

### Karts x Optimal Track Models

From the tinkering around karting sessions, where I extracted GoPro GPS telemtry and play with it

This has been the most practical model among the ones I tried:

{{< youtube "3A6fIKeBTRo" >}}


## Real Estate

This is a snapshot in time of real estate situation in France:

```sh
#git clone

```

{{< youtube "ctfGunPZwJ4" >}}

When we see something, we form a mental model of why things are the way they are.

Asking questions is important.

Because inside the questions we have implicit hypothesis, not only in the answers.

So: which explanation do we give to the rising housing prices ($/m2)?

{{< youtube "lRIWm1oQI54" >}}

Before that, lets look how housing prices are changing per region and time.

Because real estate...kind of relates with population...

```mermaid
graph TD
    subgraph Input_Files
        CSV["Censuses2011_2.csv (Census Data)"]
        SHP_P["Municipios ETRS89 (Peninsula)"]
        SHP_C["Municipios REGCAN95 (Canary Islands)"]
    end

    subgraph Processing_Logic
        EXT_CSV["Extract 5-digit INE Code from Name"]
        EXT_SHP["Extract 5-digit INE Code from NATCODE"]
        CRS["Align CRS (EPSG:4326) & Shift Canarias"]
        JOIN["PD Merge (Join on Code)"]
    end

    subgraph Visualization
        MAP["GeoPandas Plot (Magma Map)"]
    end

    CSV --> EXT_CSV
    SHP_P --> EXT_SHP
    SHP_C --> EXT_SHP
    
    EXT_CSV --> JOIN
    EXT_SHP --> CRS
    CRS --> JOIN
    
    JOIN --> MAP
    MAP --> PNG["high_res_census_map.png"]
```

right?

```sh
cd dk && uv run animate_dk_pop.py
uv run animate_dk_pop_delta.py
```

Maybe other factors like: *ease of credit have sth to do?*

```sh

```

Specially for those booms?

Just asking: *bring your own theory of how the world works here*

## Geospatial

nuts2 arcgis

https://www.arcgis.com/home/item.html?id=48f0d1a2006c4e89a85712a618fcff89



## Financial Data x YFinance

Because its too simple and too cool to make such graphs.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-f1" title="eda-f1 Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion x yfinance x libreportfolio" icon="github" >}}
{{< /cards >}}

Plus you can get some insights in between the noise: *does it really matter when you start doing sth?*

```sh
#git clone DataInMotion

```

{{< youtube "ctfGunPZwJ4" >}}
<!-- https://www.youtube.com/watch?v=ctfGunPZwJ4 -->

Or is it just about getting started?

In case you thought the volatility was because of ~2010

Let me show you that is just because of beginnings being inherently volatile:

<!-- 
https://youtu.be/8sToNvTpwVQ -->

{{< youtube "8sToNvTpwVQ" >}}

Again: *do we have to just get started?*

```sh
uv run tests/plot_year_end_close_cagr_to_date_animated_rolling_start.py ^GSPC ^DJI ^IXIC ^N225 ^GDAXI ^FTSE --start 2005-01-01 \
  --num-years 20 --duration-per-year 3 --fps 30 --brand "@UnfoldingData" --preset twitter_hd

  uv run tests/plot_year_end_close_cagr_to_date_table.py ^GSPC ^DJI ^IXIC --start 2010-01-01 --out tests/cagr_stats_test.png
```

<!-- 
https://youtu.be/4zE-mYMefak 
-->

{{< youtube "4zE-mYMefak" >}}


```mermaid
flowchart LR
    %% Styles
    classDef state fill:#E3F2FD,stroke:#1565C0,stroke-width:2px,color:#0D47A1;
    classDef start fill:#43A047,stroke:#1B5E20,stroke-width:2px,color:white;

    %% Nodes
    Start((Start)):::start --> More
    More(Doing MORE):::state
    Better(Doing BETTER):::state
    Newer(Doing NEWER):::state

    %% Internal Feedback Loops (The Grind)
    More -- "Scale Up" --> More
    Better -- "Refine" --> Better
    Newer -- "Test" --> Newer

    %% The Progression Journey
    More -- "Capacity Hit" --> Better
    Better -- "Optimized" --> Newer
    
    %% The Upward Spiral
    Newer -- "New Baseline" --> More
```

> If you are finding excuses not to get started with what you always wanted to do, maybe its [time to change that](#conclusions)


1. GWeiss

```sh
git clone datainmotion
uv run tests/plot_historical_gweiss.py ADM --start 2000-01-01 --brand "@LibrePortfolio" --warmup-days 400
```

2. Nominal CAGR vs Real CAGR vs in EUR vs in GOLD

<!-- https://youtu.be/ctfGunPZwJ4 -->

{{< youtube "ctfGunPZwJ4" >}}


What else does gold have to say?

{{< youtube "xqtzYbHIrMo" >}}

<!-- 
https://youtu.be/xqtzYbHIrMo -->

3. RSP vs SP500



4. Prices are a reflection of future cashflows corrected by....these:

```
=GOOGLEFINANCE("INDEXCBOE:TYX")/1000
=GOOGLEFINANCE("INDEXCBOE:TNX";"price")/1000
=GOOGLEFINANCE("INDEXCBOE:IRX")/1000
```

5. Whats going on with software? `IGV` tells us

6. There are some interesting indexes: `^VIX`, `^Move` or `^OVX` for oil!

As someone said: *you dont understand stock market if you dont understand bonds first*

7. How about other commodities like `CL.F` oil?

## Physics

How about...3 bodies, mechanism and a double pendulum?

It's always a good time to refresh what [loop equations](#what-are-loop-equations) and the [lagrangian](#what-it-is-the-lagrangian) are.

But lets have some fun:

```sh
git clone https://github.com/JAlcocerT/ThreeBodies/
#cd ThePoincareLab #for the cool new webapp!
./renderer_env/bin/python3 generate_animation.py --vel 0.2 -0.2 0.2 0.2 -0.3 0.0 --duration 300.0 --output simulation3.mp4
```

Initially, I thought about creating a separated repo.

But...what for?

This can be a sub-folder and use one of the latest ways to do [cool greenfield UIs](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-with-dao/#for-vibe-coders) I have got to know:

{{< youtube "b35XuJI98kI" >}}
<!-- 
https://youtu.be/b35XuJI98kI -->



### Mechanism


[Gabe's mechanism project](https://github.com/gabemorris12/mechanism) was an inspiriration to me to come back at some point to mechanical engineering.

This time with python, not with Matlab:

```sh
#git clone https://github.com/JAlcocerT/Slider-Crank
git clone https://github.com/JAlcocerT/mechanism #this is my fork of his original project

```

There is no problem to [deploy statically a cool page](https://multibodysystemdynamics.pages.dev/) that uses JS via CSR to solve the slider-crank simple and beautiful loop equations:

The Loop Equation: *there are 2 equations inside here, as these are 2D vectors!*

$$\vec{r}_2 + \vec{r}_3 - \vec{d} = 0$$

The Scalar equivalent Breakdown:

This \(\sigma(z) = \frac{1}{1 + e^{-z}}\) is an inline expression.

$$F(\omega) = \int_{-\infty}^{\infty} f(t)\, e^{-j \omega t} \, dt$$

$$
\begin{aligned}
  \nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
  \nabla \cdot \mathbf{B} &= 0 \\
  \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
  \nabla \times \mathbf{B} &= \mu_0 \left( \mathbf{J} + \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)
\end{aligned}
$$

Horizontal: $r_2 \cos(\theta_2) + r_3 \cos(\theta_3) - d = 0

$Vertical: $r_2 \sin(\theta_2) + r_3 \sin(\theta_3) = 0$

> Yea, [katex](https://katex.org/docs/supported.html) x [Hugo Hextra](https://imfing.github.io/hextra/docs/guide/latex/) is great


{{< youtube "2xMOxiRz6F4" >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/things-as-a-code/#animations-as-a-code" title="Animations as a Code | Post" >}}
{{< /cards >}}

Synthesis has always been a thing...

https://youtube.com/shorts/9b19b7SmovU


https://youtube.com/shorts/ipi437M6g5A

https://youtube.com/shorts/r8G3XRBn24s?is=sDOxquD4fxU6yKns

I just have not been focusing on mechanism for long time.

But shortly will be allocating some time to tinker back :)

### Double Pendulum

The double pendulum is the "chaotic cousin" of the slider-crank. While it looks like a simple linkage, its motion is governed by **energy and dynamics** rather than just static geometry.

Unlike the slider-crank, where you use simple algebraic loop equations, the double pendulum requires **Lagrangian mechanics** to describe how it evolves over time.

The Lagrangian Equations

To find the equations of motion, we define the system by its kinetic energy ($T$) and potential energy ($V$). The Lagrangian ($L$) is:


$$L = T - V$$

For two masses ($m_1, m_2$) and two lengths ($l_1, l_2$) at angles ($\theta_1, \theta_2$), the resulting equations of motion are a pair of coupled, non-linear second-order differential equations.

1. Equation for $\theta_1$

This describes the acceleration of the top arm:


$$(m_1 + m_2) l_1 \ddot{\theta}_1 + m_2 l_2 \ddot{\theta}_2 \cos(\theta_1 - \theta_2) + m_2 l_2 \dot{\theta}_2^2 \sin(\theta_1 - \theta_2) + (m_1 + m_2) g \sin \theta_1 = 0$$

2. Equation for $\theta_2$

This describes the acceleration of the bottom arm:


$$l_2 \ddot{\theta}_2 + l_1 \ddot{\theta}_1 \cos(\theta_1 - \theta_2) - l_1 \dot{\theta}_1^2 \sin(\theta_1 - \theta_2) + g \sin \theta_2 = 0$$

Why is it so different from the Slider-Crank?

While both involve links and pins, the double pendulum is a **dynamic system**, not a **kinematic mechanism**:

* **Degrees of Freedom:** In a slider-crank, if you move the crank $1^\circ$, the piston moves a specific, predictable distance. In a double pendulum, the arms are free to swing; their position depends on gravity and momentum, not just the "input" angle.
* **Coupling:** Notice the $\cos(\theta_1 - \theta_2)$ terms. This means the movement of the bottom arm physically "tugs" on the top arm and vice-versa.
* **Chaos:** At high energies, the double pendulum is famously chaotic. A change of $0.001^\circ$ in the starting position will result in a completely different path after just a few swings.

Comparison at a Glance

| Feature | Slider-Crank | Double Pendulum |
| --- | --- | --- |
| **Equation Type** | Algebraic (Trig) | Differential (Calculus) |
| **Input** | Forced (Motor/Crank) | Gravity/Initial Push |
| **Path** | Fixed (Circular/Linear) | Chaotic/Unpredictable |
| **Goal** | Position Mapping | Predicting Motion over Time |

Would you like to see the **State-Space** version of these equations? (That's what you'd use if you wanted to write a Python or MATLAB simulation to animate it).

### The 3 Body problem

From **3 bodies** you can jump to the 4 bar mechanism quite easily:

<!-- 
https://www.youtube.com/watch?v=b35XuJI98kI 
-->

{{< youtube "b35XuJI98kI" >}}

In fact, for kinematics: you just need geometry and time. 

Forget about forces *at least for now*

The sympy and https://github.com/KmolYuan/Pyslvs-UI will be for another post :)

The "Three-Body Problem" is a massive jump in complexity from the slider-crank. While the slider-crank is a **constrained kinematic chain** (predictable movement), the three-body problem is a **dynamical system** governed by gravity.

In this case, "loop equations" don't apply because the bodies aren't physically linked by rods or joints—they are linked by the invisible force of gravity.

The Equations of Motion

To describe the motion of three masses ($m_1, m_2, m_3$) at positions ($\vec{r}_1, \vec{r}_2, \vec{r}_3$), we use Newton's Second Law combined with the Law of Universal Gravitation.

The acceleration of the first body ($m_1$) is determined by the gravitational pull from the other two:

$$\ddot{\vec{r}}_1 = -G m_2 \frac{\vec{r}_1 - \vec{r}_2}{|\vec{r}_1 - \vec{r}_2|^3} - G m_3 \frac{\vec{r}_1 - \vec{r}_3}{|\vec{r}_1 - \vec{r}_3|^3}$$

The System of Equations

Because each body affects every other body, you have a system of three second-order differential equations:

1. **For Body 1:** $\ddot{\vec{r}}_1 = G \sum_{j \neq 1}^{3} \frac{m_j (\vec{r}_j - \vec{r}_1)}{|\vec{r}_j - \vec{r}_1|^3}$
2. **For Body 2:** $\ddot{\vec{r}}_2 = G \sum_{j \neq 2}^{3} \frac{m_j (\vec{r}_j - \vec{r}_2)}{|\vec{r}_j - \vec{r}_2|^3}$
3. **For Body 3:** $\ddot{\vec{r}}_3 = G \sum_{j \neq 3}^{3} \frac{m_j (\vec{r}_j - \vec{r}_3)}{|\vec{r}_j - \vec{r}_3|^3}$

Why is it so famous?

Unlike the slider-crank, where you can easily solve for the piston's position with basic trig, the Three-Body Problem is **analytically unsolvable** for the general case.

* **Chaos:** Small changes in the starting positions lead to wildly different results (the "Butterfly Effect").
* **No General Solution:** There is no simple formula (like $d = \dots$) that tells you where the bodies will be at any time $t$.
* **Special Cases:** We only have solutions for specific setups, like the **Lagrange Points** or specific periodic orbits (like the "Figure-8" orbit).


| Feature | Slider-Crank | Three-Body Problem |
| --- | --- | --- |
| **Connection** | Physical links/joints | Gravitational fields |
| **Math Tool** | Algebraic Loop Equations | Differential Equations |
| **Predictability** | Deterministic/Periodic | Often Chaotic |
| **Solution** | Closed-form (exact) | Numerical (simulated) |



---

## Conclusions

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-f1" title="eda-geospatial Github ↗" icon="github" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/eda-geospatial" title="eda-geospatial Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/ThreeBodies" title="eda-geospatial Github ↗" icon="github" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="eda-geospatial Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/mechanism" title="eda-geospatial Github ↗" icon="github" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video-animations/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

### Animations or Dashboards?

[Roo code](https://github.com/RooCodeInc/Roo-Code) extension has been interesting to use together with OpenAI API.

> When doing some scripts, lately I have tried `Roo Code` extension and Zed: `https://zed.dev/pricing`

You guessed it.

Currently making animations is simple.

So is to understand and create dashboards: *including with PBi*

```md
i have made a pbip export and brought to this files 3 files, would those be enough for you to infer all the goodies of the data model, ui, transformations etc? 
```

| File | Contents |
|---|---|
| `model.bim` | Full semantic model — tables, Power Query (M) transformations, DAX measures, calculated columns, relationships, hierarchies |
| `report.json` | Report layout — pages, visuals, positions, filters, slicers, bookmarks, field bindings |
| `diagramlayout.json` | Visual positioning of tables in the model relationship diagram (cosmetic only) |

These three files are sufficient to fully reconstruct the data model, all transformations, all DAX logic, all report visuals, and all relationships.

> Same with [Kilo Code](https://kilo.ai/pricing)!

So...What if I told you that all this is very cheap to do nowadays?

It is if you have the right knowledge: *part of today's know-how are [prompts](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-with-dao/#for-vibe-coders)* 

Or in other words, how good are you at [making questions](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-after-learning/#questions).

Questions like the ones you can have solved:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Service for the Ones with Questions" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge for the ones who want to create step by step" >}}
{{< /cards >}}

### About Gitlab

I have created all this consolidation in Gitlab.

Mainly bc I wanted to save the French DVF data somwhere and Github just allows for 100mb files.

But as I formatted recently, I needed to do the Gitlab Setup again: *all powered by [sha256](https://jalcocert.github.io/JAlcocerT/encryption-101/#the-sha256-algorithm) under the hood!*

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
#ssh -T git@gitlab.com #Preferences -> SSH Keys -> Paste public key -> you are in!
sudo apt install glab # For Debian/Ubuntu
glab auth login
glab repo create my-awesome-project --public
#git push --set-upstream git@gitlab.com:fossengineer/unfolding-data.git main
```

> See how to do so with this file

| Protocol | Hashing (SHA-256) | Actual Encryption |
| :--- | :--- | :--- |
| **Purpose** | Verification & Integrity | Privacy & Secrecy |
| **SSH** | Fingerprints & MACs | AES, ChaCha20 |
| **HTTPS** | Certificates & Handshakes | AES |


---

## FAQ

### What are Loop Equations?

Loop equations (also known as vector loop equations) are a fundamental tool in kinematics used to analyze the position, velocity, and acceleration of interconnected bodies in a mechanism.

In mechanical engineering, a mechanism is essentially a "closed loop" of links connected by joints. 

If you follow the path from one joint, through all the links, and back to the starting point, the total displacement must be zero.

Mathematically, we represent each link as a **vector** with a specific magnitude (length) and direction (angle). 

The loop equation is the vector sum of these links:

$$\sum_{i=1}^{n} \vec{r}_i = 0$$

To solve these for specific positions, the vector equation is typically broken down into two scalar algebraic equations using trigonometry:

* **X-component:** $\sum r_i \cos(\theta_i) = 0$
* **Y-component:** $\sum r_i \sin(\theta_i) = 0$

Application to the Slider-Crank

**Yes, loop equations apply directly to the slider-crank mechanism.** 

In fact, they are the standard method for determining the piston's position relative to the crank angle.

Why do they apply?

The slider-crank is considered a "closed" kinematic chain.

Even though the slider moves linearly, we can treat the distance from the ground origin to the slider pin as a "link" of varying length.

1. **Geometric Constraint:** The physical connection between the crank, the connecting rod, and the slider creates a fixed geometric relationship.
2. **Solvability:** A standard slider-crank has one degree of freedom (the crank angle $\theta$). By using the loop equations, you can solve for the unknown variables: the angle of the connecting rod and the linear position of the slider.
3. **Vector Closure:** If you define a vector for the crank ($\vec{r}_2$), the connecting rod ($\vec{r}_3$), and the slider position ($\vec{r}_d$), the loop is closed by the "ground" distance.

The Equation for a Slider-Crank

For a typical slider-crank where the crank is $r_2$, the rod is $r_3$, and the slider displacement is $d$, the vector loop looks like this:

$$\vec{r}_2 + \vec{r}_3 - \vec{d} = 0$$

By solving the $y$-component equation ($r_2 \sin \theta_2 + r_3 \sin \theta_3 = 0$), you can find the rod angle. Then, using the $x$-component, you find the exact position of the piston.

### What it is the Lagrangian?

It's a kind of magic.

Only that its not magic, its Physics.