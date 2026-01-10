---
title: "Optimum Path for Karting x CustomTkinter"
date: 2026-01-25
#date: 2026-02-28
draft: false
tags: ["GoPro GPS Telemetry","GD Simulation","G-Elypse","Racing","Sodis Series"]
description: 'A Python CustomTkinter Desktop App.'
url: 'gopro-telemetry-desktop-python'
---

**Tl;DR**


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

**Intro**

There are many things free *and open source* in life.

A Desktop App to extract your go pro telemetry, do some cool HUDs overlays and get some sort of optimum path seems to not be one of those.

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

I manage to make this as simple as

```sh
git clone

cd 4-apexsim-desktop && python3.10 main.py
```

![CustomTkinter | ApexSim Python Desktop](/blog_img/karting/apexsim-desktop.png)

Want to build something similar?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Reach out via my Consulting Service Tier and Calendar" >}}
{{< /cards >}}


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