---
title: "The physics of Mechanisms in the space"
date: 2026-04-10
draft: false
tags: ["MBSD x 3D Simulation","","CADQuery x Blender Rendering"]
description: 'The Dynamics x Kinematics of youve been waiting for.'
url: '3d-mbsd'
math: true
---


<!-- engine starting
https://www.youtube.com/shorts/mzWr2ZGf7OU

https://www.youtube.com/watch?v=gmV4qwLfOMY
derivatives

The Trillion Dollar Equation
https://www.youtube.com/watch?v=A5w-dEgIU1M
 -->


<!-- 
https://www.youtube.com/shorts/D8Q0Y6R4NiI -->

**TL;DR**

Some [algebra](https://jalcocert.github.io/JAlcocerT/algebra-101/), [calculus](https://jalcocert.github.io/JAlcocerT/calculus-101/), physics put together to create.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3Design | Repo" icon="github" >}}
{{< /cards >}}

**Intro**

The kind of thing that you put together in *few afternoons* nowadays.

You thought that your 9-5 is killing you?

Is your 5pm-9pm giving you some life?

Have you ever thought about [whats Ikigai for you](https://jalcocert.github.io/JAlcocerT/ideas-to-execution-with-dao/#about-ikigai)?

Ops, wrong post to talk about this.

Let me go back: 3D mechanisms! YES!

Here it goes all that *unseen talent* that the world was [eager to consume](#mbsd-x-web-dev).

##


## About MBSD

Code is law, specially for multibody system dynamics.

```sh
#git clone https://github.com/JAlcocerT/mbsd
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="NEW MBSD" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a Python fwk to simulate mechanisms" >}}
{{< /cards >}}

The next sections will be theoretical, but they will be a [base to simulate cool thingies](#conclusions).

### 2D MBSD is cool but


With *just* 2D kinematics in place you can create very nice 3D renders.

For example, this geneva drive:

```sh
cd ./3Design/mbsd-to-render/geneva-drive
#make help
make all
rsync -avP jalcocert@192.168.1.2:/home/jalcocert/3Design/mbsd-to-render/geneva-drive/render/geneva_drive.mp4 .
mpv geneva_drive.mp4
```

Or this Scotch...the pantograph...you name it:

```sh
cd ./3Design/mbsd-to-render/scotch-yoke
make all
rsync -avP jalcocert@192.168.1.2:/home/jalcocert/3Design/mbsd-to-render/scotch-yoke/render/scotch_yoke.mp4 .
mpv scotch_yoke.mp4
cd ./3Design/mbsd-to-render/pantograph
make all
rsync -avP jalcocert@192.168.1.2:/home/jalcocert/3Design/mbsd-to-render/pantograph/render/pantograph.mp4 .
mpv scotch_yoke.mp4
```

```sh
cd /home/jalcocert/Desktop/3Design/mbsd-to-render
printf "file '%s'\n" *.mp4 > concat.txt
ffmpeg -f concat -safe 0 -i concat.txt -c copy all_mechanisms.mp4
mpv all_mechanisms.mp4
```

<!-- https://youtu.be/KA7HloE6IQY -->

{{< youtube "KA7HloE6IQY" >}}


### 3D Kinematics

But if you want to do 3D mechanics, you need to get 3D kinematics right first.


There are many interesting effects in 3D that simply dont exist in 2D.




### 3D Dynamics





### CAD x Blender

I was using a simple slider-crank to test that its possible to go from a ~mbsd to STL's and blender renders.

Call it [blender as a code](https://jalcocert.github.io/JAlcocerT/using-blender-with-ai/#blender-as-a-code) or [how to bring mechanisms to life](https://jalcocert.github.io/JAlcocerT/cad-design-mbsd/).

```sh
git clone https://github.com/JAlcocerT/3Design
cd ./3Design/z-cadquery
make check #make help
#make scene-ui #this starts blender UI
#make all
tmux new-session -d -s cad "make all" #if you will be leaving this for the night
#tmux attach-session -t cad #to see hows going
#rsync -avP jalcocert@192.168.1.2:/home/jalcocert/3Design/z-cadquery/render/slider_crank.mp4 .
#mpv slider_crank.mp4
```

Even though...bringing them to life would be to manufacture them, right?

```sh
#git clone git clone https://github.com/JAlcocerT/mbsd
cd ./mbsd/z-cad-render

```

Well...give me some time for that :)


### Real Time Bike Simulator in Python

A 9-DOF multibody dynamics simulator for a bicycle, ported from MATLAB to Python.

```sh
cd ./mbsd/bike-real-time-simulator/Python_version
# Install tkinter (system dependency for matplotlib GUI)
sudo apt install python3-tk
# Install Python dependencies
#pip install -r requirements.txt
```

Yea...this is also 3D :) 

Just that it does not uses the reference coordinate system

Why?

Because this has to be solved in real time

For that, i needed to think and optimize the model:

```sh
#uv init --no-readme .

# Add packages from requirements.txt one-shot
#uv add numpy matplotlib pynput
uv pip install -r requirements.txt
#uv sync

# Basic run — bicycle rolls forward at ~10 m/s with 3D animation
#python3 main.py

# With keyboard steering
#python3 main.py --keyboard
uv run main.py --keyboard

# Without animation (faster, plots results at the end)
#python3 main.py --no-animate
```

Keyboard Controls (with `--keyboard`)

| Key | Action |
|-----|--------|
| Left / Right arrows | Steer |
| Up / Down arrows | Pedal / Brake |
| Ctrl+C | Stop simulation early |

Project Structure

| File | Description |
|------|-------------|
| `main.py` | Entry point, RK2 integrator, equations of motion |
| `parameters.py` | All physical parameters and system data structure |
| `kinematics.py` | Rotation matrices, positions, and Jacobians (12 functions) |
| `forces.py` | Mass matrix, gravity, Coriolis, aerodynamic drag, tire-ground contact |
| `visualization.py` | Real-time 3D matplotlib animation |

**Execution flow:**

```
main.py  →  run_simulation()
              │
              ├── MBodySystem()          [parameters.py]
              ├── runge_kutta_2()        [main.py]
              │     └── equations_of_motion()  at each step
              │           ├── mass_matrix()    [forces.py]
              │           ├── gravity_forces() [forces.py]
              │           ├── coriolis_forces()[forces.py]
              │           ├── aero_forces()    [forces.py]
              │           ├── contact_forces() [forces.py]
              │           │     └── A2, A5, H2, H5, H2p, H5p  [kinematics.py]
              │           └── G2g, G4g         [kinematics.py]
              └── BicycleAnimator.update()  [visualization.py] (every 2 steps)
```

The theoretical basis for this is at: https://github.com/JAlcocerT/Bike_dynamic_simulator

> Dont forget about the *steer to the fall* concept!

It computes how the vehicle moves over time under the influence of gravity, aerodynamic drag, **tire-ground contact forces**, and externally applied steering/pedaling torques.

The Python code is [a direct port](#bike-multibody-model) of the original MATLAB simulator (`Matlab_version/`).


---

## Conclusions


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a MBSD framework in Python" >}}
{{< /cards >}}

```sh
#git clone https://github.com/JAlcocerT/VideoEditingRemotion
#cd remotion-cc
```

```sh
#git clone https://github.com/JAlcocerT/3Design
cd ./3Design/mbsd-to-render
```

You see how I write about many different stuff?

```sh
find ./content/blog -maxdepth 1 -type f -name "*.md" | wc -l #this post is 350+ and 80+ expected for this year!

find content/blog -name '*.md' -print0 |
xargs -0 awk '
  FNR==1 { 
    post_date=""; 
    printed=0 
  }

  /^date:/ && !printed {
    gsub(/^date:[[:space:]]*/, "", $0)
    post_date = substr($0, 1, 10)
    if (post_date >= "2019-01-01" && post_date <= "2026-03-31") {
      print FILENAME ": " post_date
      printed=1
      count++
    }
  }

  END {
    print "TOTAL:", count+0
  }'
```

If any of the things I wrote about catches your attention and you want my time:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

Upcoming topics with 3D mechanics:


1. Engine configuration analysis
2. Suspensions: Double Wishbone, macpherson...

https://youtu.be/y-ANdaUthxg

### MBSD x Web Dev

Because if mechanism 3D dynamics its kind of trivial now.

So is web development.

```sh
#git clone https://github.com/JAlcocerT/Slider-Crank
cd ./Slider-Crank/landing #https://multibodysystemdynamics.pages.dev/
```



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

### Interactivity

* https://brm.io/matter-js/

>  Matter.js is a 2D physics engine for the web 

* ThreeJS and D3JS

### Bike MultiBody Model

The bicycle is modelled as **4 rigid bodies** connected by joints: *just 9 degrees of freedom remaining!*

| Body | Label | Description | Joints |
|------|-------|-------------|--------|
| 2 | Rear wheel | Spins freely about its axle | Pin joint to frame |
| 3 | Frame + rider | Main rigid body | Free in space (3 translation + 3 rotation DOFs) |
| 4 | Handlebar + fork | Steerable assembly | Revolute joint to frame about head tube axis |
| 5 | Front wheel | Spins freely about its axle | Pin joint to fork |


The simulator uses **multibody dynamics in generalized coordinates** — a classical analytical mechanics approach where the system state is described by the minimum set of independent coordinates that fully describe its configuration.

|Fundamental Assumption | Implication |
|------------|-------------|
| All four bodies are **perfectly rigid** | No structural deformation; mass distribution is fixed in each body frame |
| Ground is a **flat infinite plane** at z = 0 | No road irregularities, no slope, no banking |
| Tire cross-section is a **toroid with elliptical profile** | Contact point shifts with lean angle; no flat-spot approximation |
| Wheel-ground contact is **elastic (soft constraint)** | Modelled as a spring-damper; no kinematic non-penetration constraint |
| Aerodynamics act **only at the frame CoG** | No lift, no side force, no pressure distribution over the bike geometry |
| Gravitational field is **uniform** | `g = 10 m/s²` downward (−z direction) |
| Air is **still** (zero wind) | Aerodynamic force depends only on body velocity |
| Tire friction is a **combined slip bristle model** | No temperature dependence, no progressive wear |
| The bicycle is **symmetric** about its plane of travel | All `y`-offsets of CoGs are zero |
| Joints are **ideal** (no friction, no compliance) | Pin joints at axles transmit forces perfectly |

What the model does NOT capture

- Road camber, bumps, or surface roughness
- Tire sidewall dynamics or pneumatic pressure effects
- Structural flexibility (frame flex, fork flex)
- Suspension (no spring/damper between wheel and frame)
- Rider body dynamics (rider is rigidly attached to frame, body 3)
- Wind, rain, or temperature effects
- Motor/drivetrain dynamics (pedaling torque is applied directly as a generalized force)

Each rigid body has its own local frame, whose orientation relative to the global frame is given by a rotation matrix `Aᵢ(q)`. Body frames are **right-handed** and aligned with the principal axes of inertia when at zero lean/pitch/steer.

**Angular rotation convention**: Euler angles are applied in this sequence for the frame body (body 3).

1. **Roll** `φ` (phi) — rotation about the X axis (lean)
2. **Yaw** `ψ` (psi) — rotation about the Z axis (heading change)
3. **Pitch** `θ` (theta) — rotation about the Y axis (tilt forward/back)

The resulting rotation matrix A3 maps body-frame vectors to global-frame vectors:

```
r_global = A3(q) · r_body
```

Each body has:

- A **mass** `mᵢ`
- A **center of gravity (CoG)** position expressed in body-frame coordinates
- A **3×3 inertia tensor** `Iᵢ` in body frame

The system has **9 generalized coordinates** `q ∈ ℝ⁹` (0-indexed in Python):

| Index | Symbol | Type | Description | Unit |
|-------|--------|------|-------------|------|
| 0 | Rx3 | translation | X position of frame reference point | m |
| 1 | Ry3 | translation | Y position of frame reference point | m |
| 2 | Rz3 | translation | Z position of frame reference point | m |
| 3 | φ (phi) | rotation | Roll angle of frame (lean) | rad |
| 4 | ψ (psi) | rotation | Yaw angle of frame (heading) | rad |
| 5 | θ (theta) | rotation | Pitch angle of frame | rad |
| 6 | γ (gamma) | rotation | Steering angle (handlebar about head tube axis) | rad |
| 7 | ε (epsilon) | rotation | Front wheel spin angle | rad |
| 8 | ν (nu) | rotation | Rear wheel spin angle | rad |

The frame reference point (Rx3, Ry3, Rz3) is a point fixed to body 3 near the bottom bracket. 

It is **not** the CoG of body 3 — the CoG is offset by `[XG3, 0, ZG3] = [0.20, 0, 0.10]` in the body frame.

The full state vector is `y = [q; q̇] ∈ ℝ¹⁸`, where `q̇` are the generalized velocities.

Why these coordinates?

- The 3 translational DOFs `(Rx3, Ry3, Rz3)` locate the bicycle in space.
- Roll `φ`, yaw `ψ`, pitch `θ` orient the frame. This ordering produces a rotation matrix without singularities at the operating angles of interest.
- Steering `γ` is relative to the frame — it is the handlebar rotation about the (tilted) head tube axis.
- Wheel spin angles `ε` and `ν` are needed to compute tire slip and gyroscopic forces.


#### Equations of Motion

The dynamics follow the **Newton-Euler formulation in generalized coordinates**:

```
M(q) · q̈ = Q(q, q̇)
```

Where:

- `q` — 9-element generalized coordinate vector
- `M(q)` — 9×9 symmetric positive-definite mass matrix (configuration-dependent)
- `Q(q, q̇)` — 9-element generalized force vector (sum of all forces)

`Q` is assembled from four independent contributions:

```
Q = Q_grav + Q_coriolis + Q_aero + Q_contact + Q_steer + Q_pedal
```

**Mass Matrix**

Computed using the **composite rigid body algorithm**:

```
M = Σᵢ [ mᵢ · Jvᵢᵀ Jvᵢ  +  Jwᵢᵀ · Iᵢ_global · Jwᵢ ]
```

Where `Jvᵢ` and `Jwᵢ` are the translational and angular Jacobians of body `i`, and `Iᵢ_global = Aᵢ · Iᵢ_body · Aᵢᵀ` transforms the body-frame inertia tensor to global frame.

Jacobians are computed **numerically via central finite differences** on the rotation matrices and CoG position functions (step size `ε = 1e-7`). This avoids translating 590 lines of symbolic MATLAB code at the cost of ~18 extra `mass_matrix()` calls per Coriolis evaluation.

**Coriolis & Centrifugal Forces**

Computed from **Christoffel symbols of the first kind**:

```
Qvᵢ = -Σⱼₖ Γᵢⱼₖ · q̇ⱼ · q̇ₖ

Γᵢⱼₖ = ½ (∂Mᵢⱼ/∂qₖ + ∂Mᵢₖ/∂qⱼ − ∂Mⱼₖ/∂qᵢ)
```

`∂M/∂qₖ` is evaluated numerically (central finite differences on `mass_matrix()`).

**Tire-Ground Contact**

Each wheel uses an **elastic contact model**:

**Normal force** — spring-damper with indentation `δ`:
```
Fn = Kn · |δ|  +  c_damp · δ̇ · δ       (active when δ < 0)
```

**Tangential force** — piecewise linear (bristle model) saturated by a friction ellipse:
```
Longitudinal:  Fx = μx · Fn · (κ / κc)      if |κ| ≤ κc
               Fx = μx · Fn · sign(κ)         otherwise

Lateral:       Fy = μy · Fn · (α / αc)       if |α| ≤ αc
               Fy = μy · Fn · sign(α)         otherwise
```

With elliptic saturation: if `(Fx/μx)² + (Fy/μy)² ≥ Fn²`, both components are scaled back onto the friction ellipse.

- `κ` = longitudinal slip ratio (wheel slip vs. rolling speed)
- `α` = slip angle (angle between wheel heading and velocity vector)
- `κc`, `αc` = critical slip thresholds (both default to 0.12 rad)
- `μx = μy = 0.9` — friction coefficients

The contact point geometry accounts for the **toroidal tire cross-section** (ellipse semi-axes `a_n = b_n = 0.02 m`), which shifts the effective contact radius with lean angle.

**Applied Torques**

Steering and pedaling torques are projected into generalized coordinates using the angular Jacobians `G4g` (handlebar) and `G2g` (rear wheel):

```
Q_steer = G4gᵀ · [0, 0, τ_steer]
Q_pedal = G2gᵀ · [0, τ_pedal, 0]
```

State Vector & Generalized Coordinates

The state vector `y` has 18 elements: `y = [q; q̇]`

**Generalized Coordinates `q` (indices 0–8)**

| Index | Symbol | Description |
|-------|--------|-------------|
| 0 | Rx3 | Frame origin — x position (m) |
| 1 | Ry3 | Frame origin — y position (m) |
| 2 | Rz3 | Frame origin — z position (m) |
| 3 | φ (phi) | Roll angle — lean (rad) |
| 4 | ψ (psi) | Yaw angle — heading (rad) |
| 5 | θ (theta) | Pitch angle (rad) |
| 6 | γ (gamma) | Steering angle — handlebar rotation (rad) |
| 7 | ε (epsilon) | Front wheel spin angle (rad) |
| 8 | ν (nu) | Rear wheel spin angle (rad) |

**Generalized Velocities `q̇` (indices 9–17)**

Same ordering as coordinates. Initial conditions:

```python
q0 = [0, 0, 0.97, 0, 0, 0, 0, 0, 0]   # starts at 0.97 m height
v0 = [10, 0, 0, 0, 0, 0, 0, 10/0.34, 10/0.34]  # 10 m/s forward, wheels spinning
```