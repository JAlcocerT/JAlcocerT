---
title: "Hydrofoil"
date: 2026-08-18
draft: false
tags: ["IRL","Betaflight vs VESC"]
description: '.'
url: 'hydro-foil-engineering'
---

**Tl;DR**


**Intro**

* Why Im writting this post: 
* What Ive learnt with it: *.*


I finally tried this: `https://wakeschool.pl/oferta/#szkola-e-foil`

What a coincidence that *with some grade of imagination* its a mix of FPV and watering plant technology :)


## The fun part

Those are **hydrofoils** (often called **foilboards** or **hydrofoil surfboards**).

The underwater "wing" works exactly like an airplane wing, but in water. As the board gains speed, water flows over the curved wing and creates **hydrodynamic lift**. 

This pushes the entire board straight up out of the water, leaving only the thin vertical mast cutting through the surface. 

Because there is almost zero surface drag from the board, it feels like flying smoothly over the water.

Few main categories:

1. eFoils (Electric Hydrofoils)

If the rider was cruising effortlessly on flat water without paddling, catching waves, or using a kite/wind, they were likely on an **eFoil**.

* **How it works:** A small, powerful battery is embedded inside the board, and an electric motor (with a propeller or jet drive) is mounted near the underwater wing.
* **Control:** The rider holds a wireless, waterproof hand controller to manage the speed, while shifting their body weight forward or backward to control altitude.

2. Pump Foiling (Human-Powered)

If you saw someone jumping or "pumping" up and down on the board to stay lifted—especially near docks or on flat lakes—that is **pump foiling**.

* **How it works:** By repeatedly rhythmically squatting, pressing down, and unweighting their body on the board, the rider forces the hydrofoil wing through the water column, continuously generating its own lift.
* **No waves needed:** Advanced riders can start from a dock, jump onto the board, and keep "flying" across calm water purely through leg power.

3. Surf, Wing, and Kite Foiling

Hydrofoils can also be attached to boards driven by natural energy:

* **Surf Foiling:** Riding ocean waves—the foil lets you catch tiny, unbroken swells far away from where normal surfboards break.
* **Wing Foiling:** Holding a inflatable hand-held wing to catch the wind while standing on a foilboard.
* **Kite Foiling:** Being pulled by a kite-surfing canopy while riding a foil.


---

## FAQ


### The Electrical Signal Chain

The setup follows a clean chain from the hand held trigger down into the water:

1. **Bluetooth Receiver:** Mounted inside the waterproof compartment in the board (or high up inside the carbon fiber mast). It receives the 2.4 GHz signal from your hand controller.

2. **ESC (Electronic Speed Controller):** The receiver sends a PPM or PWM throttle signal (e.g., "give me 60% power") to a high-power ESC (often a customized **VESC** / VESC-based controller). The ESC acts as the "brain," drawing DC power from the 50V battery pack and switching it to pulse high AC current.

3. **BLDC Motor (Brushless DC):** The ESC connects to a heavy-duty, waterproof **BLDC outrunner or inrunner motor**.

* To keep it tiny enough to fit inside the streamlined pod underwater, these motors spin at high RPMs (**5,000 to 10,000 RPM**).
* They use **water cooling**—taking advantage of the surrounding ocean/lake water directly against the aluminum motor casing (or through small cooling passages in the ESC plate) to dump massive amounts of heat.

### Hydraulic Design: Pressure vs. Thrust

* **Garden Pump (Centrifugal / Positive Displacement):** Built for **Pressure (Head)**.

It sucks water in through a small port and uses a small curved impeller to push water into a narrow hose. The goal is building high pressure to push water up garden pipes or through a spray nozzle, moving low-to-moderate volume slowly.

* **eFoil Jet Pump (Axial Flow Jet Drive):** Built for **Velocity & Mass Thrust** based on Newton's 3rd Law. It works like a scaled-down Jet Ski pump. 

It sucks in a huge volume of water from the front intake ring, compresses it through a pitch-angled **impeller** (a stainless steel or titanium screw), and shoots it out a tapered rear nozzle at high speed.

| Feature | Garden Water Pump | eFoil Jet Drive Pump |
| --- | --- | --- |
| **Power Output** | 50W – 500W (approx. 0.1 to 0.6 HP) | **3,000W – 6,000W+** (4 to 8+ HP) |
| **Operating Voltage** | 12V DC or 120V/230V AC | **44V – 58V DC** (High discharge Li-ion) |
| **Current Draw** | A few amps (2A – 10A) | **100A – 200A+** continuous |
| **Sealing Mechanism** | Basic shaft lip-seals (low RPM) | **Triple ceramic mechanical seals** or magnetic coupling to prevent water intrusion at high RPM |
| **Motor Type** | Basic brushed motor or standard induction AC | **Sensored BLDC** (high torque, high efficiency) |


2. Battery Chemistry: Are They LiPo?

No, commercial eFoils rarely use standard **LiPo** (Lithium Polymer) packs because LiPos are notoriously delicate, sensitive to thermal runaway, and dangerous if exposed to salt water.

Instead, they almost exclusively use **Lithium-ion (Li-ion)** cells—specifically **18650** or **21700** cylindrical cells (the same high-grade cells used in electric vehicles). 

They are wired together in a high-voltage configuration (typically **12S to 14S**, giving around 44V–58V) equipped with a strict Battery Management System (BMS) to handle thermal limits and balance charging.

3. What Kind of "Pump" Is It?

There are actually **two totally different things** people mean when they talk about a "pump" on a foil:

* **Human-Powered "Pumping" (No Motor):** This isn't a mechanical device. "Pumping" refers to the **rider's body motion**. By shifting their weight up and down rhythmically on the board, the board pushes the foil wing through the water column, generating its own propulsion (similar to how a dolphin moves its tail).
* **Motorized Jet Drive / Propeller:** On powered eFoils, the motor mounted on the underwater mast is either a **shielded propeller** or a **jet pump** (an enclosed impeller inside a nozzle, similar to a mini jet ski drive).

4. Typical Power & Performance

eFoil motors are remarkably compact brushless electric motors, but they pack serious power:

| Metric | Typical Range |
| --- | --- |
| **Power Output** | **3 kW to 5 kW** (4 to 6.7 horsepower) |
| **Peak Power** | Up to **8 kW** for short acceleration bursts |
| **Top Speed** | 20 to 30 mph (32 to 50 km/h) |
| **Battery Capacity** | 2 kWh to 3 kWh (weighing 25–35 lbs / 11–16 kg) |
| **Riding Time** | 60 to 120 minutes per charge |