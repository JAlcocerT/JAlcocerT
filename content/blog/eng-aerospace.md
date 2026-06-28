---
title: "Aerospace 101 x DIY Drone"
date: 2026-06-25
draft: false
tags: ["Fluids","Electronics","Drons vs FPV","ERLS x Edge TX x Lua scripts","Propulsion"]
description: 'What are aerospace engineers having in mind? Dron BOM to figure out.'
url: 'aerospace-101'
math: true
---

**Tl;DR**

I almost became an aerospace student

**Intro**

This is everything that I did (and what not) missed.


## Fluid Recap

I tinkered a little bit with [fluid mechanics basics on this post](https://jalcocert.github.io/JAlcocerT/fluids/#the-governing-equations).

All to get the ICE with [a nicer model](https://jalcocert.github.io/JAlcocerT/fluids/#volumetric-efficiency) than the matlab one I had.

## Propulsion

For inline and V engines you have some simulations already:


See the differences with mechanism vibrations

versus how uniform is the power output of these engines: *which obviusly is better as the number of cylinder increases*


Even rotary: *not the mazda RX8 ones, the one of ww1 planes*

https://www.youtube.com/watch?v=-pxpNivvpw8

### Turboshaft

https://www.youtube.com/watch?v=cxQ-Ef4uIpw



## You will also need

### Structures

### Electronics



---

## Conclusions

Now, im building a dron.


## FAQ


### Cool Aerospace Channels

1. https://www.youtube.com/@LetsGoAviate

2. https://www.youtube.com/@neuronautics_Lab/videos


![alt text](/blog_img/apps/yt-distill.png)

### Steam vs CO2 turbines

The main differences between supercritical CO2 turbines and steam turbines are:

Working Fluid: Supercritical CO2 turbines use CO2 as the working fluid, while steam turbines use water vapor (steam).

Phase Change: Supercritical CO2 does not undergo a phase change in the energy cycle, which is a wasteful step in steam turbines that goes from liquid to gas or gas to liquid. This allows for greater efficiency in supercritical CO2 systems (00:02:40).

Size and Efficiency: Supercritical CO2 turbines can be around 10 times smaller than equivalent steam turbines, making them more compact and potentially leading to efficiency improvements (00:02:33).

Energy Cycle: The compression of supercritical CO2 is more efficient because it can be compressed without needing to convert from liquid to gas, unlike steam which requires additional energy for this phase change (00:03:07).

These differences contribute to the potential for supercritical CO2 turbines to be more efficient and compact compared to traditional steam turbines.

### Dron BOM

1. RadioMaster Pocket ELRS ~ 70$

{{% details title="Why the Pocket? 🚀" closed="true" %}}

* **Screen & EdgeTX:** It has a small screen that lets you save **dozens of models**. You select "Meteor65" when you want to fly your drone, then scroll to "My Plane" when you switch aircraft. The settings for each stay saved.
* **More Switches:** Planes often need extra switches for things like "Flaps" or "Stabilization Modes" (Beginner/Expert). The Pocket has enough switches to handle these easily.

{{% /details %}}

{{% details title="Pocket x OSS (ExpressLRS x EdgeTX) 🚀" closed="true" %}}

The **RadioMaster Pocket** is widely considered the "gold standard" for open-source compatibility in its price bracket. 

In the world of RC, "compatibility" usually refers to the **Operating System (OS)** and the **Radio Protocol**.

1. Operating System: EdgeTX (The "Linux" of Radios)

The Pocket runs **EdgeTX** as its native OS. This is currently the most advanced, open-source firmware for radio controllers.

* **Fully Open:** It isn't locked down like a DJI or a high-end Futaba. You can customize every sound, screen, and logic switch.
* **Model Memory:** Unlike the T8 or BetaFPV LiteRadios, the Pocket lets you store **60+ different models**. You can have one setup for your BetaFPV Meteor65 and another for an RC Plane, and switch between them in seconds.
* **Lua Script Support:** You can run "mini-apps" (Lua scripts) on the radio. This is how you change your drone's camera settings or VTX power directly from the radio screen.

2. Protocol Compatibility (The "Radio Link")

The Pocket is sold in two versions.

Your choice here determines how "compatible" you are with different drones:

* **The ELRS Version (Recommended):** ExpressLRS is the modern open-source standard. It is compatible with almost all new BetaFPV drones (like the Meteor series) and most FPV planes. It offers the best range and the most frequent open-source updates.
* **The CC2500 Version:** This is for "legacy" compatibility. It works with older FrSky (D8/D16), Futaba (S-FHSS), and RadioLink protocols.
* **The "Secret Weapon":** The Pocket has a **Nano Module Bay** on the back. If you buy the ELRS version but later want to fly a plane that uses a different system (like TBS Crossfire), you can just plug a module into the back. 

This makes it effectively "compatible with everything."

3. Hardware "Openness"

* **USB-C Simulator Support:** You can plug the Pocket into any PC/Mac/Linux machine, and it will be recognized as a standard "Joystick." This makes it 100% compatible with flight simulators like **Liftoff** or **Uncrashed**.

* **Battery:** It uses standard **18650 Li-ion cells** (the same ones found in many flashlights and power tools). You aren't forced to buy a proprietary battery pack from the manufacturer.



{{% /details %}}


{{% details title="ELRS Tech x 2.4ghz vs WIFI/Bluetooth 🚀" closed="true" %}}

ELRS operates on the **2.4GHz ISM band**, which is the same crowded frequency space where home Wi-Fi and Bluetooth live.

However, ExpressLRS doesn't use standard Wi-Fi or Bluetooth protocols.

It is built on **LoRa** technology.

Here is the difference between them:

* **Wi-Fi / Bluetooth:** Designed to send *massive amounts of data* (like streaming high-def music or video) over *very short distances*. If a wall gets in the way or it gets too far, the signal immediately drops because it doesn't handle interference well.

* **LoRa (Long Range):** Designed to send *tiny amounts of data* (just your stick coordinates and simple switch states) over *extreme distances*.

* **How it beats interference:** LoRa uses a trick called **Chirp Spread Spectrum (CSS)**. Instead of staying on one static frequency, the radio signal constantly "chirps" up and down across the band, and the transmitter and receiver hop frequencies hundreds of times per second in perfect sync.

> **Why this matters for your setup:** Because of LoRa, your tiny Pocket radio putting out just **100mW** of power can easily maintain a rock-solid, zero-latency connection over **2 to 5 kilometers away**, completely blasting straight through Wi-Fi noise from nearby houses.

{{% /details %}}



{{% details title="is ELRS enrypted?" closed="true" %}}

This is where ExpressLRS shines. 

Another pilot cannot just pull up, turn on their radio, and take over your drone.

It is practically impossible for someone to steal your control link while flying, thanks to how ELRS manages connections via your **Binding Phrase**.

**How the "Binding Phrase" Locks Your Drone**

When you set up your RadioMaster Pocket and your BetaFPV drone, you will type in a custom secret passphrase (for example: `"YosuaCerdoFPV2026"`).

The radio doesn't actually broadcast this text over the air. Instead, it uses a cryptographic algorithm (MD5 hashing) to turn your text into a unique string of 6 numbers called **UID Bytes**.

Those UID bytes do two major things to secure your connection:

1. **The Seed for Frequency Hopping:** Remember how LoRa hops frequencies hundreds of times per second? Your UID bytes are used as the mathematical "seed" to generate that specific, randomized frequency hopping pattern. A thief's radio won't even know *which* frequency your drone is listening to at any given millisecond.

2. **The Key Check:** Even if someone miraculously lands on the exact same frequency at the exact same millisecond, every tiny packet of data your Pocket sends contains an integrated check code based on those UID bytes. If a receiver gets a packet from a radio with a different phrase, it immediately ignores it as background noise.

**Is it actually encrypted?**

Technically speaking, standard ExpressLRS is **not encrypted** for security secrecy—it is designed this way for *anti-collision*.

The developers intentionally don't encrypt the core stick data because encryption adds processing lag (latency), and in FPV, every microsecond matters.

However, because the mathematical hopping pattern is unique to your passphrase, it serves as an incredibly effective lock.

Someone would have to actively sit near you with a specialized RF hacking rig, intercept your packets over the air, calculate your UID mathematical signature, and clone it in real-time to hijack your drone.

Nobody is doing that at a local park or a model flying field.

If someone turns on another RadioMaster Pocket using a different phrase, their radio will hop on an entirely different sequence, and your drone won't even notice they are there.

What about "Model Match"?

EdgeTX and ELRS also have an extra safety feature called **Model Match**.

If you turn it on, your radio binds not just to your passphrase, but to the specific *slot* on your radio. 

If you accidentally leave your radio on your "RC Plane" profile and try to plug in your "BetaFPV Drone," the drone won't arm or connect.

It prevents you from accidentally launching the wrong aircraft!

{{% /details %}}

{{< callout type="warning" >}}
The Pocket's battery bay is tight and only fits Flat Top `18650s` at 3.7V, not the 1.5V from AA's. It has a built-in charger for those `Molicel P28A` or `Samsung 30Q`
{{< /callout >}}


| Feature | BetaFPV LiteRadio 3 | RadioMaster Pocket |
| --- | --- | --- |
| **OS** | Proprietary (Limited) | **EdgeTX (Full Open Source)** |
| **Screen** | None | **Monochrome LCD** |
| **Gimbals** | Standard | **Hall Effect (Magnetic/Long Lasting)** |
| **Model Memory** | None (Single model) | **Unlimited (SD Card)** |
| **Compatibility** | Locked to one protocol | **Expandable via Module Bay** |


Most BetaFPV gear is **2.4GHz**, which is the standard for the Pocket. 

Do not accidentally buy a 915MHz/868MHz module unless you are doing extreme long-range flying!

Because the **RadioMaster Pocket** runs **EdgeTX** (an open-source operating system), it can run **Lua scripts**.

Think of these as "apps" for your radio that let you control your drone or plane without ever needing to plug into a computer.

Here are the most typical community scripts every pilot uses:

1. The "Essential" Scripts

* **ExpressLRS (ELRS) Configurator:** This is the most important one. It lets you change your radio's transmit power, "packet rate" (speed of connection), and binding settings directly from the screen. In 2026, the new **ELRS 4.0** script even includes "Automatic Antenna Mode" for pilots using Gemini (dual-link) hardware.
* **Betaflight TX Script:** This is a game-changer. It allows you to change your drone's internal settings via the radio screen. You can adjust:
* **PIDs & Rates:** How fast the drone flips and how it handles wind.
* **VTX Settings:** Change your video channel or boost your signal strength (e.g., from 25mW to 400mW) if you're getting static.


* **INAV / ArduPilot Scripts:** If you start flying **RC Planes**, these scripts show you a "mini-cockpit" on your radio screen with your GPS coordinates, battery voltage, and distance from home.

2. Utility & "Quality of Life" Scripts

* **ELRS Finder:** If you crash your drone in tall grass, this script turns your radio into a "metal detector." It uses the signal strength (RSSI) to show you if you are getting closer or further from the wreck.
* **Battery Loggers:** These scripts can announce your battery percentage over the radio's speaker every 30 seconds so you never have to look down at your screen while flying.
* **QR GPS Code Tool:** A newer script for 2026 that generates a QR code on your radio screen if you crash. You scan it with your phone, and it opens the drone’s last known location directly in Google Maps.

3. Fun & Customization

* **Model Image Scripts:** Since the Pocket has a small screen, people write scripts to display custom icons for each drone or plane you own.
* **Games:** Because it's open-source, people have actually ported simple games like *Snake* or *Tetris* to the radio. Not very useful for flying, but great for when you're waiting for your batteries to charge!


You don't "program" them yourself (unless you want to). Most pilots use the **EdgeTX Buddy** website or the **ExpressLRS Configurator** on their PC. 

You just plug your radio in via USB-C, and it "sideloads" the scripts onto the SD card for you.

**Pro Tip for the Pocket:** Because the Pocket has a monochrome (black and white) screen, make sure you download the **"B&W" versions** of these scripts. The "Color" versions won't fit or look right on the smaller display.

For a full setup that embraces the **Open Source (OSS)** and **DIY** philosophy, you want components that run community-driven firmware and offer modularity. 

In 2026, this usually means staying away from "locked" ecosystems like DJI and sticking to **ELRS**, **EdgeTX**, and **Analog/OpenIPC** video.

#### The Radio (The Brain)

* **Recommendation:** **RadioMaster Pocket (ELRS Version)**
* **Why:** It runs **EdgeTX** (OSS Operating System) and uses **ExpressLRS** (OSS Protocol). It’s the most "OSS-compatible" radio for the price.
* **Estimated Cost:** $65 – $75.
* **Essential Mods:** Buy two high-quality **18650 Li-ion batteries** (e.g., Molicel P28A) separately, as they aren't usually included.

#### The Aircraft (The DIY Tiny Whoop)

Instead of a pre-built BetaFPV, building your own allows for easier repairs and specific OSS tuning.

* **Frame:** **BetaFPV Air65** or **Meteor65 Air Frame** ($5).
* **Flight Controller (AIO):** **BetaFPV Air 5-in-1 G473 FC** ($55).
* *Why:* It runs **Betaflight** (OSS) and has a built-in ELRS receiver and Analog VTX. The G473 processor is the 2026 standard for micro-builds.


* **Motors:** **0702SE 27,000KV** Brushless Motors ($40 for a set).
* **Props:** **Gemfan 1219-3** or **HQ 31mm Ultralight** ($3).
* **Total Drone Weight:** ~18g (without battery).

#### The Video System

To stay true to OSS and budget, **Analog** is the "most open" because it has no encryption, but **OpenIPC** is the rising star of 2026.

* **Budget Entry:** **Eachine EV800D** ($80 - $100).
* *Why:* They can be used as goggles or a standalone monitor, and they are easily "hackable."


* **Mid-Range (Pro-OSS):** **Skyzone SKY04O Pro** ($350+).
* *Why:* Skyzone uses open-source friendly firmware and allows for modular receivers.


* **The "Open" Digital Choice:** Look into **OpenIPC / ArtLynk** modules if you want digital quality with an open-source spirit.

{{% details title="OpenIPC vs Goggles vs Phone screen 🚀" closed="true" %}}

To receive the video feed on the setup we’ve discussed, you need a **Video Receiver (VRX)**. 

In the FPV world, your choice of receiver is dictated by the **Video Transmitter (VTX)** inside the drone.

Since the DIY BOM we built uses the **BetaFPV Air 5-in-1 FC**, it has an **Analog 5.8GHz VTX** built-in. Here is what you need to see through its eyes:

1. The Goggles (The Standard Way)

For a true FPV experience, you wear goggles. They have the receiver and the screens built into one unit.

* **Recommendation:** **Eachine EV800D**.
* **Why:** They are the "budget king" because they are a **2-in-1**. You can wear them as goggles, or you can pop the front off and use them as a **standalone monitor** on a tripod. This is great for sharing the view with friends or if you find goggles disorienting at first.
* **OSS Factor:** While the firmware isn't strictly open-source, the hardware is completely modular and widely documented for DIY repairs/mods.

2. The "Phone/Tablet" Way (The DIY Way)

If you don't want goggles yet, you can use a **UVC OTG Receiver**.

* **The Device:** A small dongle (like the **Skydroid FUAV**) that plugs into the USB-C port of your Android phone or laptop.
* **How it works:** It picks up the 5.8GHz signal and turns it into a webcam feed. You use an app (like *GoFPV*) to see the video.
* **Warning:** This has **latency** (lag). It’s fine for watching someone else fly or for very slow cruising, but if you try to fly a fast BetaFPV drone through a gap, you will likely crash because what you see is ~50-100ms behind reality.

3. The Digital OSS Alternative (OpenIPC)

If you want to go full "Open Source Software," there is a project called **OpenIPC**.

* **VTX:** You would replace the drone's analog VTX with an OpenIPC-compatible camera/transmitter (like a modified IP camera).
* **Receiver:** You can use a **Raspberry Pi** or a **laptop with a specific WiFi card** (like the RTL8812AU) as your receiver.
* **Status in 2026:** It is incredible for enthusiasts, but it requires a lot of Linux command-line knowledge. For your first build, stick to **Analog** so you spend more time flying and less time debugging code.

| Method | Hardware Needed | Experience | Cost |
| --- | --- | --- | --- |
| **Goggles** | Eachine EV800D | Immersive, zero lag. | ~$90 |
| **Monitor** | EV800D (Screen detached) | Great for beginners/friends. | (Included above) |
| **Phone/PC** | UVC OTG Dongle | Laggy, but cheap/portable. | ~$20 |

Stick with the **Eachine EV800D** goggles.

They match the "value for money" and "DIY" spirit of your BetaFPV/RadioMaster setup.

Since they can convert into a monitor, they are the most versatile piece of gear you can buy as a beginner.


{{% /details %}}


#### 4. Charging & Power

* **Charger:** **VIFLY Whoop VIPER** or **SkyRC B6neo** ($25 - $35).
* *Why:* The B6neo is tiny, powerful, and runs open-source-friendly firmware.


* **Batteries:** **LAVA 1S 300mAh (BT2.0)** ($25 for a 4-pack).
* *Note:* Stick to the **BT2.0 connector**; it’s the community standard for performance in 2026.


Total Estimated Budget: $250 – $320

| Category | Item | Price (Approx) |
| --- | --- | --- |
| **Radio** | RadioMaster Pocket ELRS | $70 + batteries x6 $15|
| **Drone** | DIY Air65 Build | $110 |
| **Goggles** | EV800D (Analog) | $90 |
| **Power** | Charger + 4x Batteries | $50 |

**Expert Peer Note:** This setup is completely "interchangeable." 

If you decide to build a 2-meter long RC plane next month, your **RadioMaster Pocket** and **Charger** will work perfectly with it—you’ll just need a $15 ELRS receiver for the plane.

### The Dron Software Stack Free/OSS

* **Configurator:** [Betaflight Configurator](https://github.com/betaflight/betaflight-configurator) (For the drone).
* **Radio Firmware:** [EdgeTX Buddy](https://buddy.edgetx.org/) (For the Pocket).
* **Link Firmware:** [ExpressLRS Configurator](https://www.expresslrs.org/quick-start/installing-configurator/) (For the radio link).
* **Simulator:** **Tiny Whoop GO** or **FPV SkyDive** (Free versions to start).


### Dron Flight time

Because they prioritize agility and staying under that 100g weight limit, they use very small batteries that offer short, high-intensity bursts of flight.

1. Typical Flight Times (BetaFPV Series)

As of 2026, here is what you can realistically expect from the most popular models:

| Model Type | Battery Size | Average Flight Time |
| --- | --- | --- |
| **Micro Whoops ([Meteor65](https://megadron.pl/pl/products/dron-betafpv-meteor65-pro-o4-dji-o4-31596.html?srsltid=AfmBOopfNaEihEMHAZW6evNfb9038BoEHNN-S_nU9Ly7TmXxgwMsL0RZ), Air65)** | 1S (300mAh) | **3 to 4.5 minutes** |
| **Pavo Pico / Pavo20 (Cinewhoops)** | 2S (450–550mAh) | **3 to 5 minutes** |
| **Pavo25 / Pavo30 (HD Video)** | 4S (650–850mAh) | **5 to 8 minutes** |

2. Why is the time so short?

It feels brief compared to a DJI drone (which can fly for 30+ minutes), but the physics are different:

* **Weight vs. Power:** These drones are basically "flying batteries." A **Meteor65** weighs about 20g, and the battery weighs 8g. If you added a bigger battery to get 10 minutes of flight, the drone would become too heavy to lift itself efficiently or handle well.
* **High Discharge:** FPV drones are designed for "punch-outs" and fast maneuvers. This drains the battery much faster than a drone that just hovers in one spot.
* **Voltage Sag:** Small 1S (single cell) batteries experience "sag." You might start at $4.35V$, but as soon as you hit the throttle, it drops. You generally land when the battery hits $3.3V$ to avoid damaging it.

RC planes are fundamentally different from drones because they use **aerodynamics** to stay in the air rather than just brute force.


| Feature | BetaFPV Drone | Small RC Plane |
| --- | --- | --- |
| **Typical Flight Time** | 3–5 mins | 12–20 mins |
| **Software** | Betaflight | INAV / ArduPilot |
| **Hovering** | Yes (Excellent) | No (Usually) |
| **Space Needed** | Backyard / Indoors | Large open field |
| **Ease of Learning** | Hard (Manual) / Easy (Stabilized) | Moderate (Requires space to turn) |

While you *can* technically put Betaflight on a plane, it is designed specifically for the physics of 4+ spinning rotors. For planes, pilots use different software (firmware):

* **INAV:** This is the most popular choice for FPV planes. It’s a cousin of Betaflight but designed for "Fixed Wing" aircraft. It includes features Betaflight lacks, like **Auto-Launch** (you throw the plane and it flies itself until you take control) and **Cruise Mode** (it keeps the plane level and on course automatically).
* **ArduPilot:** This is the "professional grade" software. It’s more complex but allows for total autonomy—you can program a 20km mission with waypoints and the plane will fly it and land itself.
* **ELRS (The Radio Link):** Even though the internal software is different, you can use the same **ExpressLRS** radio and goggles you use for your BetaFPV drones to fly a plane.




### Flying a DRON

Registration & ID

* UK: If your drone is under 100g, you generally do not need a Flyer ID or Operator ID. If it is 100g or more (including the battery), you must pass a free online test and pay a small registration fee.

* EU: Registration is required if the drone has a camera and is not officially classified as a "toy" (most FPV drones are considered "equipment," not toys).

#### DRON Simulators

Most flight simulators are **not** fully Open Source Software (OSS) in the way your radio's operating system (EdgeTX) is. 

While the hardware and radio software are very "open," the simulator market is a mix of commercial games and free tools.

{{% details title="About simulators 🚀" closed="true" %}}


1. Popular Simulators (Closed Source, Paid)

The big names you’ll hear most often are commercial products. You own the game, but you can't see or modify the "code" (the physics engine).

* **Liftoff / Liftoff: Micro Drones:** The most popular. Great graphics and very easy to use with your RadioMaster Pocket. It is **closed source**, but has a huge community-made map and drone database.
* **Uncrashed:** Known for having the most modern graphics and very "snappy" physics. Also **closed source**.
* **VelociDrone:** The choice for professional racers because the physics are ultra-accurate. It’s **closed source** and requires a license.

2. The "Semi-Open" and Free Options

If you are looking for things that align more with the OSS philosophy:

* **FPV SkyDive:** This is **Free-to-Play** (on Steam). While the core code isn't fully open for you to rewrite, it's the best "zero-cost" way to start.
* **Tiny Whoop GO:** A free simulator specifically for the kind of small drones BetaFPV makes. It’s excellent for practicing in "house" environments.
* **[Crazysim](https://github.com/gtfactslab/CrazySim):** This is a true **Open Source** simulator (available on GitHub) often used for "Crazyflie" nano drones. It’s more for developers and researchers, so it’s less "plug-and-play" than Liftoff.

3. Why the "Openness" of your Radio still matters

Even if the simulator itself is closed source, having an **OSS Radio (EdgeTX)** like the RadioMaster Pocket gives you a huge advantage:

1. **Universal Compatibility:** Because EdgeTX is open, it uses a standard "USB HID" protocol. This means it works instantly with **any** simulator (Open or Closed) on Windows, Mac, or Linux.
2. **Rate Matching:** You can export your "Rates" (how fast the drone flips) from the **Betaflight** (OSS) on your real drone and paste them into most simulators so the virtual drone feels exactly like your real one.
3. **Community Scripts:** You can run open-source scripts on your radio while playing the sim to track your battery life or stick accuracy.


{{% /details %}}

