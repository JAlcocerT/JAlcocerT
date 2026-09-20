---
title: "Screws are a thing"
date: 2026-10-09
draft: false
tags: ["3D"]
description: 'Another rabbit-hole..'
url: 'understanding-screws'
math: true
---

**Tl;DR**


**Intro**

* Why Im writting this post: 
* What [Ive learnt](#conclusions) with it: *Ive ended*

1. My 5 inch FPV carbon fiber frame uses M3 (hex 2mm to use them)


https://youtube.com/shorts/ZBMt_urbh-o

https://youtube.com/shorts/hlBfrZnJ07g

### FPV screws

**Yes, absolutely.**

Almost every 5-inch FPV drone is built standard around **M3 hardware**:

* **Frame hardware:** Top plates, bottom plates, and standoffs are almost always **M3**.
* **Motors:** 5-inch drone motors (e.g., 2207, 2306 sizes) use **M3 mounting screws** on a 16×16 mm bolt circle.
* **Why the 2 mm hex fits:** The industry-standard fastener for drone frames and motor mounts is an **M3 button head screw** (or socket cap), which uses exactly a **2.0 mm hex driver**.

*(By comparison, micro drones like 3-inch or toothpicks use M2 screws with 1.5 mm hex keys, while 20×20 stacks use M2 or M3).*

For a 5-inch drone component or 3D-printed accessory (like an antenna mount, GoPro/action cam mount, or arm protector), design your through-holes for **M3** (use a **3.2 mm to 3.4 mm hole diameter** in your CAD so the screw slides in smoothly).

---

## FAQ

### 1. The Anatomy of a Screw

| Parameter | What It Is | How to Measure It | Why It Matters |
| --- | --- | --- | --- |
| **Nominal Diameter (The "M" Size)** | The outermost thickness of the threaded shaft (crest-to-crest). | Caliper across the threads. $M3 = 3\text{ mm}$, $M2 = 2\text{ mm}$. | Dictates through-hole size, tap hole size, and mating nut/standoff size. |
| **Pitch** | The linear distance (in mm) between one thread peak and the next. | Pitch gauge, or $\text{Length} / \text{Number of turns}$. Standard coarse M3 is $0.5\text{ mm}$. | Must match the internal threads of nuts/standoffs. (Metric defaults to standard coarse pitch). |
| **Nominal Length ($L$)** | The usable portion going into the material. | From **under the head** to the tip. *(Exception: Flat countersunk screws include the head).* | Determines penetration depth, standoff engagement, or clearance past drone arms. |
| **Drive Size (Tool Size)** | The size of the hex key / bit needed. | Flat-to-flat distance of the wrench or internal socket. | A 2.0 mm key fits an M3 button head, but a 2.5 mm key fits an M3 standard cylinder cap head. |
| **Head Profile** | The shape of the top (Button, Socket/Cap, Flat/Countersunk, Pan). | Visual shape. | Affects clearance, aerodynamics, flushness, and wrench size. |
| **Strength / Material Class** | Load rating of the metal (e.g., 8.8, 10.9, 12.9, or A2/A4 stainless). | Markings on the head (e.g., `12.9`). | Class 12.9 is high-tensile alloy steel—standard for crash-resistant FPV frames and motors. |

---

### 2. Standard Metric Hex-Drive Reference

Because head styles use different tool sizes, here is how common FPV/hobby metric sizes pair with hex wrenches:

| Thread Size | Standard Pitch | Button Head (ISO 7380) Drive | Socket Cap (DIN 912) Drive | Countersunk (ISO 10642) Drive |
| --- | --- | --- | --- | --- |
| **M2** | $0.4\text{ mm}$ | 1.3 mm hex | 1.5 mm hex | 1.3 mm hex |
| **M2.5** | $0.45\text{ mm}$ | 1.5 mm hex | 2.0 mm hex | 1.5 mm hex |
| **M3** | $0.5\text{ mm}$ | **2.0 mm hex** | 2.5 mm hex | 2.0 mm hex |
| **M4** | $0.7\text{ mm}$ | 2.5 mm hex | 3.0 mm hex | 2.5 mm hex |

---

### 3. FPV Drone Rules of Thumb

* **5-inch Drones:** Standardized on **M3** hardware (motor mounts, frame standoffs, top/bottom plates, arm bolts).
* **3-inch / Sub-250g Drones:** Typically standardized on **M2** hardware.
* **Toothpicks / Tinywhoops:** Standardized on **M1.4** to **M2**.
* **Motor Screw Length Safety Rule:** Screws that are too long will press past the motor base into the copper motor windings, causing an instant electrical short and smoking your ESC/motor. Always check that the tip stops at least $0.5\text{ mm}$ to $1\text{ mm}$ shy of the windings.

---

### 4. 3D Printing CAD Tolerances (for M3 Hardware)

3D printers squish molten plastic outward, making vertical holes print smaller than nominal CAD models:

* **Clearance Hole (slip-fit):** Model at **$\varnothing$ 3.2 mm – 3.4 mm** (never 3.0 mm, or it will bind).
* **Direct Self-Tap (biting into plastic):** Model at **$\varnothing$ 2.6 mm – 2.8 mm**.
* **Heat-Set Insert Pocket:** Model at **$\varnothing$ 4.0 mm – 4.2 mm** (check insert specsheet; leave $\ge 1.5\text{ mm}$ wall thickness).
* **Nut Trap / Pocket:** Model flat-to-flat width at **5.7 mm – 5.8 mm** (standard M3 nut is $5.5\text{ mm}$).
* **Button Head Recess (Counterbore):** Model pocket at **$\varnothing$ 6.0 mm** wide, **$1.8\text{ mm} - 2.0\text{ mm}$** deep.