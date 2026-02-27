---
title: "Optimum Path for Karting x CustomTkinter"
date: 2026-02-28
draft: false
tags: ["GoPro GPS Telemetry","GD Simulation","G-Elypse","Racing","Sodis Series","F1 x PolyMarket"]
description: 'A first Python CustomTkinter Desktop App. GA vs RL vs GD.'
url: 'gopro-telemetry-desktop-python'
---

**Tl;DR**


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

~~The launch strategy: aka, focus strategy~~

This is not full Ikigai as I dont [get paid](#conclusions), but its the part of it that I just do because I want to.


**Intro**

There are many things free *and open source* in life.

A Desktop App to extract your go pro telemetry, 

do some cool HUDs overlays 

and get **some sort of optimum path** seems to NOT be [one of those](#conclusions).

So Im going to dare and try to combine what Ive learnt on these projects:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Py Route Tracker ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Repo Section" icon="github" >}}
{{< /cards >}}

And create my first desktop app.

We come from tinkering with GA and RL models.

But this is going to focus on putting together the HUD *for gopros based on gps and accelerometer* plus the gradient descent best lap estimation:

<!-- https://youtu.be/zm0OJcpuLV8 -->

{{< youtube "zm0OJcpuLV8" >}}

{{< cards cols="1" >}}
  {{< card link="https://www.firecrawl.dev" title="ApexSim | GD Post ↗ " >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/tinker-racing/" title="GoPro GPS Custom HUD ↗" >}}
{{< /cards >}}


**Options to create GoPro overlays**

This worked https://github.com/time4tea/gopro-dashboard-overlay

Also the custom script I placed: *you need to provide the location/s of the MP4/s to be analyzed*

```sh
git clone https://github.com/JAlcocerT/Py_RouteTracker
time python3.10 ./Py_RouteTracker/overlay/racing_hud_v7.py
```

{{< youtube "c0YkQhsUNrg" >}}

Can this be shipped as a desktop app?

If I will ever want to share this, I dont want to do it via webapp and have a constrain on my CPU power.


### Creating

```sh
pip install customtkinter
cd 4-apexsim-desktop && python3.10 main.py
```

![CustomTkinter | ApexSim Python Desktop](/blog_img/karting/apexsim-desktop.png)

---

## Conclusions

I manage to make this as simple as:

```sh
git clone https://github.com/JAlcocerT/optimum-path
cd 4-apexsim-desktop && python3.10 main.py
```

![CustomTkinter | ApexSim Python Desktop](/blog_img/karting/apexsim-tkin.png)

Want to build something similar?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Reach out via my Consulting Service Tier and Calendar" >}}
{{< /cards >}}

The time spent in building can calm the stress by the upcoming F1 season:

* https://github.com/JAlcocerT/f1-race-replay

### Learnt with The ApexSim Concept

For the pure animation part, you can make assumptions and model a faster path for next sessions.

```sh
git clone https://github.com/JAlcocerT/optimum-path

```

You can try different models and see what works best for you: *[see how](https://youtu.be/6IAm_-uQpn4) min curvature wont be the fastest!*

![Min Curv Path Speed distribution](/blog_img/karting/min_curvature_performance_viz.png)

[Gradient descent based](https://jalcocert.github.io/JAlcocerT/kart-optimum-path/) can possibly surprise you:

{{< youtube "3A6fIKeBTRo" >}}

{{< youtube "ctfGunPZwJ4" >}}

{{< youtube "-fY5OpiBNjI" >}}

Take those to the next level and [create your own ApexSim](#conclusions).

| Feature | GA Chromosome | RL Neural Network |
| --- | --- | --- |
| **Storage** | A simple array of numbers. | A complex matrix of weights. |
| **Logic** | "At 100m, steer 30%." | "If the corner is sharp, steer more." |
| **Hardware Use** | Simple, fast math on your 5600G. | Heavy matrix multiplication (better with GPU, but 5600G is okay). |
| **Result** | An **Optimal Line**. | An **Optimal Driver**. |

1. **GA (Genetic Algorithm):** The memory is the **Chromosome**.
2. **RL (Reinforcement Learning):** The memory is the **Neural Network**. It is a set of "synapses" (weights).

How **GA (Genetic Algorithms)** and **RL (Reinforcement Learning)** store their "knowledge," we can look at **Gradient Descent** as the engine that actually updates those RL matrices.

While a GA uses "survival of the fittest" (random mutation and crossover) to find the best chromosome, Gradient Descent uses **calculus** to find the fastest way "downhill" to the lowest error.

Imagine you are standing on a rugged mountain in a thick fog. 

You want to reach the very bottom of the valley (the **Minimum Error** or **Maximum Reward**).

1. **The Gradient:** You can’t see the valley, but you can feel the slope under your boots. The "Gradient" is simply the direction and steepness of that slope.
2. **The Descent:** You take a step in the direction that goes down the most.
3. **The Learning Rate:** This is your **stride length**.
* Step too big? You might overleap the valley and end up on the opposite peak.
* Step too small? It will take you a million years to reach the bottom.

| Feature | Genetic Algorithm (GA) | Gradient Descent (RL/NN) |
| --- | --- | --- |
| **Search Style** | **Random/Heuristic:** It "guesses" by jumping around the map. | **Deterministic/Mathematical:** It follows the slope of the math. |
| **Feedback** | Only knows *how good* the result was (Fitness Score). | Knows *which way* to change every single weight to improve. |
| **Efficiency** | Great for "messy" problems where you can't calculate a slope. | Extremely fast for "smooth" problems (like tuning a Neural Network). |
| **The "Local Trap"** | Good at jumping out of small pits to find the big valley. | Can get stuck in a small "pothole" (Local Minimum) and think it's the bottom. |

In Your "Optimal Driver" Context

In RL, your **Neural Network** starts with random weights (a terrible driver).

1. The driver takes a turn and crashes (High Error).
2. **Gradient Descent** calculates: *"If I change Weight A by +0.01 and Weight B by -0.05, the crash would have been slightly less severe."*
3. It updates the **Matrix of Weights** using that math.
4. Repeat this 10,000 times, and the "Slope" eventually leads the weights to the configuration of a Pro Driver.

$$w_{new} = w_{old} - \eta \cdot \nabla Q(w)$$

*(Where $\eta$ is your stride length/learning rate and $\nabla Q$ is the direction of the slope.)*

### About Sodis Series

I got to know about: `https://www.sodiwseries.com/es-es/tracks/`

* Prices 70/90 pln aka 20$ per 8 min
* Versus 45eur aka 50$ 30 min

https://www.sodiwseries.com/es-es/tracks/karting-sevilla-699.html

<!-- https://www.youtube.com/watch?v=KyhZhERS2XE -->

{{< youtube "KyhZhERS2XE" >}}


Ten years ago i Tried [this one](https://gokartarena.pl/cennik/).

### Next Steps

0. Package and distribute the app as freemium *social signin required*
0. Gather feedback and improve
0. Ship the desktop app (cross-platform) (Nuitka?)


OBS to MQTT: is this even possible?

ACELEROMETER BASED: https://racechrono.com/article/faq/which-obd-ii-adapter-should-i-buy		

People build budget lap timers - https://www.youtube.com/watch?v=mdGOuhEq6g8

{{< youtube "mdGOuhEq6g8" >}}

If you dont have a GoPro, you can still play with your smartphone and PhyPhox:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker/tree/main/Data_PhyPhox" title="PhyPhox" image="/blog_img/iot/phyphox-android.jpg" subtitle="EDA on Phyphox Data with Python - Repo" >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Route Tracker" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Analyzing Routes Data with Python" >}}
{{< /cards >}}

All this resonated with a PoC i built `iotrack.iotechcrafts.com`:

* A multi-language site: EN/ES
* In theory with a web3 domain (not sure what for)
* Some video as proof, possibility to ask for a demo and signin
* And some marketing:
  * you are yoing with your friends and you always get the GP2 engine?
  * Stop looking behind and focus on winning (get better)
  * How it works?
    * Pros are using telemtry to get better - and its costing them a buch of money
    * But you are smarter than then. You use IoTrack.
    * Get daster & receive feedback of your laps like a Pro

### Outro

* https://upstash.com/

> Serverless Data Platform (redis, vector DBs....)

* https://github.com/DrewThomasson/sound-monitor

Is your engine generating too much noise?

---

## FAQ

When it comes to building desktop applications with Python, there are several frameworks available, each with its own strengths and weaknesses.

Here's a breakdown of some of the most popular options: **Key Python GUI Frameworks:**

* **Tkinter:**
    * This is Python's standard GUI toolkit.
    * It's relatively easy to learn and is included with most Python installations, making it a good choice for beginners.
    * However, its appearance can be somewhat dated.
    * Good for simple applications.
    * Ive tinkered with it [here](https://github.com/JAlcocerT/YT-Video-Edition/tree/main/VideoApp_tkinter)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/trip-planner-with-weather/" title="Python Web apps with DASH" image="/blog_img/apps/TripPlanner/TripPlanner.JPG" subtitle="Python Trip Planner with DASh" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition" title="Youtube Video Edition" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Quick Vlogs with ffmpeg and Tkinter 101" >}}
{{< /cards >}}

* **PyQt/PySide:**
    * These frameworks provide Python bindings for the Qt library, a powerful cross-platform GUI toolkit.
    * They offer a wide range of widgets and customization options, allowing you to create sophisticated and visually appealing applications.
    * PyQt has licensing considerations, while PySide is LGPL-licensed.
    * Excellent for complex applications.
* **Kivy:**
    * Kivy is designed for creating cross-platform applications with a focus on touch-enabled interfaces.
    * It's suitable for developing applications that can run on desktop and mobile platforms.
    * Good for multi-touch applications.
* **wxPython:**
    * wxPython provides Python bindings for the wxWidgets library, which allows you to create native-looking applications on various platforms.
    * It offers a good balance of features and performance.
    * Good for applications that need to have a native operating system look and feel.
* **Flet:**
    * Flet is a framework that enables you to build cross platform applications, including desktop applications. It is based on flutter, and allows for very quick UI development.

* https://pypi.org/project/PyAutoGUI/

**Key Considerations:**

* **Cross-platform compatibility:** If you need your application to run on multiple operating systems, choose a framework that supports cross-platform development.
* **Complexity:** Consider the complexity of your application and choose a framework that matches your needs. Tkinter is suitable for simple applications, while PyQt/PySide and wxPython are better for more complex ones.
* **Appearance:** If you want your application to have a modern and visually appealing interface, PyQt/PySide or Kivy might be good choices.
* **Licensing:** Be aware of the licensing terms of the framework you choose, especially if you plan to distribute your application commercially.

### Who will win F1 2026?

Nobody knows.

But people bet on that: see that people in Polymarket gave Mercedes a premium even before the winter tests.

`https://polymarket.com/event/fed-decision-in-april`

The primary smart contract address for Polymarket on the Ethereum network is:

0x0d08db747095e91780711724267a183e8522aa64 

* https://etherscan.io/address/0x0d08db747095e91780711724267a183e8522aa64

Additionally, Polymarket uses proxy wallet contracts and multisig safes for user accounts, which are deployed on the Polygon network. For example, a Polymarket proxy wallet factory address on Polygon is:

0xaB45c5A4B0c941a2F231C04C3f49182e1A254052

* https://polygonscan.com/address/0xaB45c5A4B0c941a2F231C04C3f49182e1A254052

These proxy wallet contracts hold users' positions and USDC used within Polymarket's ecosystem, facilitating a smooth user experience.