---
title: "Whats an FPV?"
date: 2026-12-31T23:20:21+01:00
draft: true
tags: ["Tinkering","Ardupilot vs pymavlink vs dronekit"]
description: 'From a DJi Tello Drone to one around BetaFPV.'
url: 'fpv-programming'
---

https://www.youtube.com/watch?v=uC9hVyqGvDE

**TL;DR**

At this point, whats stopping you to create a cool app for [the tello DJI](https://jalcocert.github.io/JAlcocerT/dji-tello-python-sdk/)?

**Intro**

First of all, an fpv is probably sth for what you need [such license](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/#about-dron-regulations).

This guy knows what he's talking about: `https://github.com/Bardo91`, aka Pablo ramon soria.

The tello weights around ~ g:

![DJI Tello Dron](/blog_img/hardware/dji-dron.png)

But what if we could build one even lighter and with more range?

https://www.youtube.com/watch?v=7yVFZn87TkY

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion/blob/main/tests/get_price.py" title="DataInMotion yfinance Price ↗" >}}
    {{< card link="https://github.com/JAlcocerT/DataInMotion/blob/main/tests/get_dividends.py" title="DataInMotion yfinance Dividend ↗" >}}
{{< /cards >}}

Remember that for piloting big drones you need a license!


### DIY Drone Resources

* Haga un avión de papel FPV RC que vuele | ESP32


https://www.youtube.com/watch?v=hDjBi0ErDdw

* Open Source Motion Capture for Autonomous Drones

https://www.youtube.com/watch?v=0ql20JKrscQ
https://github.com/jyjblrd/Low-Cost-Mocap
https://github.com/jyjblrd/Low-Cost-Mocap?tab=MIT-1-ov-file#readme

> Low cost motion capture system for room scale tracking



* Haga un PEQUEÑO dron Arduino con cámara FPV: ¿volará?

https://www.youtube.com/watch?v=Sa6EslOHsI0

* https://gitlab.com/fossengineer1/dron
* https://github.com/JAlcocerT/DJITelloPy

https://www.youtube.com/watch?v=KSP4o_WCqVs

https://www.youtube.com/watch?v=k7et0oKxXp8

* Haga un avión de papel FPV RC que vuele | ESP32

https://www.youtube.com/watch?v=hDjBi0ErDdw

* Open Source Motion Capture for Autonomous Drones

https://www.youtube.com/watch?v=0ql20JKrscQ

## BetaFlight

https://www.youtube.com/watch?v=V_mZsiZcy7s

Betaflight is **open-source firmware for flight controllers** used in multirotor aircraft (drones), primarily racing drones and freestyle drones. 

{{< details title="What it is betaflight 📌" closed="true" >}}

Think of it as the operating system for your drone.  It takes the inputs from your radio transmitter (your remote control), interprets them, and then translates those commands into actions for the drone's motors, allowing you to control its flight.

Here's a breakdown of what Betaflight does and why it's popular:

**Key Functions of Betaflight:**

* **Flight Control:**  This is the core function.  Betaflight stabilizes the drone, maintains its orientation, and allows you to precisely maneuver it.  It handles complex calculations to keep the drone flying smoothly and predictably, even when you're performing acrobatic maneuvers.
* **Receiver Input:** Betaflight receives signals from your radio receiver and translates them into commands.  It understands what you want the drone to do based on the stick positions and switch settings on your transmitter.
* **Motor Output:**  Betaflight controls the speed of each individual motor to achieve the desired flight movements.  It constantly adjusts the motor speeds to maintain balance, execute your commands, and compensate for external forces like wind.
* **Sensor Integration:** Betaflight integrates with various sensors on the drone, such as gyroscopes, accelerometers, barometers, and magnetometers.  These sensors provide data about the drone's orientation, movement, and altitude, which Betaflight uses to improve flight performance.
* **Configuration:**  Betaflight is highly configurable.  You can adjust numerous settings to fine-tune the flight characteristics of your drone, customize the way it responds to your inputs, and optimize it for your flying style.
* **Telemetry:** Betaflight can send telemetry data back to your transmitter or a separate display.  This data can include information about the drone's battery voltage, signal strength, altitude, and other parameters.
* **Features:**  Betaflight supports a wide range of features, including flight modes (like angle mode, acro mode, and horizon mode), arming/disarming, failsafe mechanisms, and support for GPS and other advanced features.

**Why Betaflight is Popular:**

* **Open Source:**  Being open source means it's free to use, and a large community of developers constantly improves and updates it.
* **Highly Customizable:**  The extensive configuration options allow pilots to tailor the firmware to their specific needs and preferences.
* **Active Community:**  A large and active community provides support, shares tips and tricks, and develops new features and improvements.
* **Frequent Updates:**  Betaflight is regularly updated with new features, bug fixes, and performance enhancements.
* **Performance:**  Betaflight is known for its excellent flight performance, particularly in acro mode for freestyle flying.

{{< /details >}}

**In simpler terms:** Imagine Betaflight as the brain of your drone. It takes your commands, processes information from the drone's sensors, and tells the motors what to do to make the drone fly the way you want it to. 

Its open-source nature and extensive configurability have made it the go-to choice for many drone enthusiasts, especially those who enjoy racing and freestyle flying.


<!-- https://www.youtube.com/watch?v=FfrRiPhn-LA&t=343s -->

{{< youtube "FfrRiPhn-LA" >}}


There are other open-source flight controller firmware options besides Betaflight, although Betaflight is by far the most popular.  Here are a few notable alternatives:

* **ArduPilot:** This is a very powerful and versatile open-source autopilot software suite. It's often used on larger drones, autonomous vehicles, and even planes and rovers. ArduPilot is known for its advanced features, including GPS navigation, waypoint following, and support for a wide range of hardware.  It's more complex to configure than Betaflight, making it less common for smaller racing or freestyle drones.

https://github.com/Ardupilot/ardupilot

* **INAV:**  INAV is a fork of Betaflight that focuses on navigation and autonomous flight.  It's particularly well-suited for long-range flights and missions where GPS functionality is important.  While it can be used for acro, its strength lies in its navigation capabilities.

* **EmuFlight:**  EmuFlight is another fork of Betaflight that aims to improve performance and stability. It's often used by pilots looking for a slightly different feel than Betaflight.

* **Butterflight:** Similar to EmuFlight, Butterflight is a Betaflight fork focused on performance and handling.

* **Quicksilver:**  A newer flight controller firmware written in Rust.  It's designed to be more efficient and safer than some of the older, C-based firmwares. It's gaining some traction but is still under development.

It's worth noting that some of these are forks of Betaflight, meaning they share a common codebase but have diverged in their development and features. 

Betaflight's large community and constant development make it a moving target, so some of the other options may have features or performance characteristics that are temporarily better, but Betaflight often catches up.


## Mark5 Dron

**What is a Mark5 Drone?**

A "Mark5" drone isn't a specific type of drone in the same way that, say, a "cinewhoop" is.  

Instead, "Mark5" (or sometimes "MK5") usually refers to a specific *frame* design, often for FPV (First Person View) drones.

It's a **popular frame style** known for its durability, performance, and often its aesthetic design.

Here's what you should know about Mark5 frames:

* **Frame Design:**  Mark5 frames typically have a "deadcat" or similar configuration.  This means the front arms are angled slightly backward, moving the props out of the pilot's view in the FPV goggles. This gives a cleaner view.
* **Size:**  Mark5 frames are usually in the 5-inch class (meaning they use 5-inch propellers), which is a very common size for FPV drones.
* **Material:**  They're almost always made of carbon fiber for its strength and light weight.
* **Manufacturer/Designer:**  There isn't one single "Mark5" manufacturer.  The design has become popular, and several companies produce frames based on or inspired by it.  So, you might see frames called "Mark5 style" or similar.
* **Purpose:**  Mark5 frames are versatile and can be used for freestyle flying, racing, or even cinematic FPV.

So, when someone says "Mark5 drone," they are likely referring to an FPV drone built using a frame that follows the Mark5 design principles.

It's not a complete, ready-to-fly drone itself, but rather a frame onto which you would add all the other components (motors, ESCs, flight controller, receiver, camera, etc.).


* https://ardupilot.org/

* https://www.youtube.com/@thedronedojo/videos

* https://www.xda-developers.com/diy-drone-arduino-pro-mini/

* Ardupilot / navio2 +rpi


* https://www.youtube.com/@MichaelKlements/videos

>  I enjoy tinkering with electronics projects and fixing things, so I've put together this channel to share with you a mix of tech repairs, DIY projects, Arduino & Raspberry Pi projects, and tech reviews.

https://youtube.com/shorts/btdBPai3ppU?si=yN8nHFoL9bB1BybA

---

## Conclusions

If you like mechanics, 3d printing and RC: this could be a hobby for you.


Have a look to:

<!-- https://www.youtube.com/watch?v=pdKnIPH3JQs -->

{{< youtube "pdKnIPH3JQs" >}}

---

## FAQ

### BOM for FPV around OSS

For a full setup that embraces the **Open Source (OSS)** and **DIY** philosophy, you want components that run community-driven firmware and offer modularity. 

In 2026, this usually means staying away from "locked" ecosystems like DJI and sticking to **ELRS**, **EdgeTX**, and **Analog/OpenIPC** video.

Here is the recommended Bill of Materials (BOM) for a versatile, sub-100g focused setup.

### 1. The Radio (The Brain)

* **Recommendation:** **RadioMaster Pocket (ELRS Version)**
* **Why:** It runs **EdgeTX** (OSS Operating System) and uses **ExpressLRS** (OSS Protocol). It’s the most "OSS-compatible" radio for the price.
* **Estimated Cost:** $65 – $75.
* **Essential Mods:** Buy two high-quality **18650 Li-ion batteries** (e.g., Molicel P28A) separately, as they aren't usually included.

### 2. The Aircraft (The DIY Tiny Whoop)

Instead of a pre-built BetaFPV, building your own allows for easier repairs and specific OSS tuning.

* **Frame:** **BetaFPV Air65** or **Meteor65 Air Frame** ($5).
* **Flight Controller (AIO):** **BetaFPV Air 5-in-1 G473 FC** ($55).
    * *Why:* It runs **Betaflight** (OSS) and has a built-in ELRS receiver and Analog VTX. The G473 processor is the 2026 standard for micro-builds.
* **Motors:** **0702SE 27,000KV** Brushless Motors ($40 for a set).
* **Props:** **Gemfan 1219-3** or **HQ 31mm Ultralight** ($3).
* **Total Drone Weight:** ~18g (without battery).

3. The Video System (The Eyes)

To stay true to OSS and budget, **Analog** is the "most open" because it has no encryption, but **OpenIPC** is the rising star of 2026.

* **Budget Entry:** **Eachine EV800D** ($80 - $100).
    * *Why:* They can be used as goggles or a standalone monitor, and they are easily "hackable."
* **Mid-Range (Pro-OSS):** **Skyzone SKY04O Pro** ($350+).
    * *Why:* Skyzone uses open-source friendly firmware and allows for modular receivers.
* **The "Open" Digital Choice:** Look into **OpenIPC / ArtLynk** modules if you want digital quality with an open-source spirit.

4. Charging & Power

* **Charger:** **VIFLY Whoop VIPER** or **SkyRC B6neo** ($25 - $35).
    * *Why:* The B6neo is tiny, powerful, and runs open-source-friendly firmware.
* **Batteries:** **LAVA 1S 300mAh (BT2.0)** ($25 for a 4-pack).
    * *Note:* Stick to the **BT2.0 connector**; it’s the community standard for performance in 2026.

5. The Software Stack (All 100% Free/OSS)

* **Configurator:** [Betaflight Configurator](https://github.com/betaflight/betaflight-configurator) (For the drone).
* **Radio Firmware:** [EdgeTX Buddy](https://buddy.edgetx.org/) (For the Pocket).
* **Link Firmware:** [ExpressLRS Configurator](https://www.expresslrs.org/quick-start/installing-configurator/) (For the radio link).
* **Simulator:** **Tiny Whoop GO** or **FPV SkyDive** (Free versions to start).

Total Estimated Budget: $250 – $320

| Category | Item | Price (Approx) |
| :--- | :--- | :--- |
| **Radio** | RadioMaster Pocket ELRS | $70 |
| **Drone** | DIY Air65 Build | $110 |
| **Goggles** | EV800D (Analog) | $90 |
| **Power** | Charger + 4x Batteries | $50 |

**Expert Peer Note:** This setup is completely "interchangeable."

If you decide to build a 2-meter long RC plane next month, your **RadioMaster Pocket** and **Charger** will work perfectly with it—you’ll just need a $15 ELRS receiver for the plane.