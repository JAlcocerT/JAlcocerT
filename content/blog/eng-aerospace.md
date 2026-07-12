---
title: "Aerospace 101 x DIY 1S Drone"
date: 2026-06-25
draft: false
tags: ["Fluids","Electronics","Betaflight FPV","ERLS x Edge TX","Propulsion x Aerodynamics"]
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

### Aerodynamics

<!-- 
https://youtube.com/shorts/RGh4EBOy-E0 
-->

{{< youtube "RGh4EBOy-E0" >}}

<!-- 
https://youtube.com/shorts/fkx65D_QE7o
-->

{{< youtube "fkx65D_QE7o" >}}


## Propulsion

For inline and V engines you have some simulations already:

See the differences with mechanism vibrations

versus how uniform is the power output of these engines: *which obviusly is better as the number of cylinder increases*

Even rotary: *not the mazda RX8 ones, the one of ww1 planes*

{{< youtube "-pxpNivvpw8" >}}

<!-- 
https://www.youtube.com/watch?v=-pxpNivvpw8 
-->

### Dron Props

Combining **Motor RPM/Amperes** with **Accelerometer G-forces** is exactly how aerodynamic engineers and professional FPV tuners measure a propeller's performance and efficiency without a wind tunnel.

By analyzing these variables in Python, you can calculate the exact physics of your drone's propulsion.

Three most fascinating things you can infer about your propellers using that data:

1. 💨 Propeller Efficiency (Thrust-to-Power Ratio)

You can calculate how much mechanical "push" your propellers give you for every unit of electrical energy they consume.

* **The Inputs:** * `vbatLatest` $\times$ `amperageLatest` = **Total Electrical Power (Watts)**
* `accSmooth[2]` (Z-axis acceleration) = **Raw Thrust Force**

* **The Python Analysis:** Plot your vertical acceleration against the total Watts consumed during a sharp throttle punch.
* **What it tells you:** A highly efficient propeller will give you a steep spike in vertical G-force while drawing minimal Amps. If you ever swap to a different brand of propellers, you can run the exact same test; the propeller that achieves the same G-force with fewer Watts is the aerodynamically superior prop!

---

2. 🛞 Propeller Slip (Aerodynamic "Grip")

Propellers act like screws turning through the air, but because air is a fluid, they "slip" (like car tires spinning on ice).

* **The Inputs:** `motor RPM` vs. `accSmooth` (Acceleration).
* **The Python Analysis:** When you slam the throttle up, the RPMs instantly skyrocket to 90,000+. However, the drone's actual speed and acceleration take a split second to catch up because the propellers have to "bite" into the air.
* **What it tells you:** By measuring the time delay (latency) between the motor hitting maximum RPM and the accelerometer hitting maximum G-force, you are measuring **propeller slip**. A propeller with more blades (e.g., a quad-blade vs. a tri-blade) will usually have less slip and bite the air faster, showing a shorter delay in your Python timestamps.

3. 🚨 Propeller Damage & Deformation (The "Vibration" Test)

This is the most practical use of Python analysis for FPV. When tiny plastic props bend, get nicked by furniture, or spin so fast that the blades flex out of shape, they generate high-frequency mechanical noise.

* **The Inputs:** Raw Gyroscope data (`gyroData[0,1,2]`).
* **The Python Analysis:** You can run a Fast Fourier Transform (FFT) on your gyro data to look at the frequency spectrum.
* **What it tells you:** Healthy propellers will show a very clean, tiny spike at the exact frequency of your motor RPM. If a propeller is bent or structurally weak, it will create a massive, chaotic "noise blanket" across all frequencies (seen as jagged, thick "grass" on your data plots). If you see your gyro noise increasing over several flight logs, it means your plastic props are wearing out and need to be replaced!

Propeller thrust and power consumption do NOT scale linearly with RPM—they scale **exponentially**. 

This is one of the most fundamental laws of aerodynamics, known as the **Propeller Affinity Laws**.

1. Thrust vs. RPM (The Square Law)

Thrust scales with the **square** of the RPM ($Thrust \propto RPM^2$).

* If you double your motor RPM, your propellers don't get double the thrust—they generate **4 times** more thrust.

2. Power vs. RPM (The Cube Law)

Power consumption (the Watts pulled from your 680mAh battery) scales with the **cube** of the RPM ($Power \propto RPM^3$).

* This is the killer for battery life. If you double your RPM to go fast, the aerodynamic drag increases so brutally that your motors require **8 times** more electrical power to turn the blades!

If you write a script to plot **Thrust-to-Power Efficiency** (Vertical G-force divided by Watts) against **RPM**, you will get a graph that looks like this:

| RPM Range | What's Happening Aerodynamically | Efficiency Status |
| --- | --- | --- |
| **Low RPM** (Smooth Hover) | The propeller blades easily slice through clean air with minimal drag. | **Highest Efficiency:** You get a lot of float for very little battery drain. This is why your indoor cruising gets an amazing 6 minutes! |
| **High RPM** (100% Throttle Punch) | The propeller tips approach supersonic speeds (nearly 100,000 RPM!). The blades stall slightly, creating massive air turbulence and drag. | **Lowest Efficiency:** The battery sags instantly as Amps skyrocket, but you gain diminishing returns on actual upward acceleration. |

How to use this for tuning:

In Python, you can find the "sweet spot" RPM of your Meteor75 Pro by looking for the peak of that efficiency curve.

FPV pilots look at this data to set a **Throttle Limit** or a **Throttle Curve** in Betaflight.

If the data shows that pushing your motors past 85,000 RPM gives you almost zero extra acceleration but destroys 30% of your battery life, you can cap your radio stick to stop right at that aerodynamic cliff!

---

You have fantastic intuition—this is one of the most critical design bottlenecks in all of aviation engineering!

Aeronautical engineers absolute tweak the length (diameter) and the rotation speed of propellers to keep the tips from crossing into the supersonic zone.

When a propeller blade tip approaches or breaks the speed of sound (Mach 1), it triggers a massive aerodynamic crisis. Here is exactly what happens, how the physics limits big aircraft, and how it applies to your tiny Meteor75 Pro.

---

### 🛑 The "Sound Barrier" Crisis: Shockwaves & Stall

As a propeller spins, the center of the prop moves slowly, but the tips have to cover a much larger distance in the exact same amount of time. The tips are always moving the fastest.

If the tips hit the speed of sound, a local **shockwave** forms right on the blade.

This shockwave causes three catastrophic problems:

1. **Extreme Wave Drag:** Drag increases exponentially, acting like an invisible brick wall. The engine has to work brutally hard just to push through it.
2. **Aerodynamic Stall:** The smooth airflow over the blade completely detaches, causing the propeller to instantly lose its lifting efficiency (thrust drops off a cliff).
3. **Deafening Noise:** It creates a continuous sonic boom. This is why the historical *Republic X-84H "Thunderscreech"* airplane (which had supersonic prop tips) was so loud it literally caused nausea and seizures in ground crews.

---

### 📐 The Engineering Trade-off: Diameter vs. RPM

To prevent this, engineers use a strict mathematical limit for Tip Speed ($V_{tip}$), which combines how fast the drone/plane is moving forward ($V_{forward}$) with how fast the propeller is spinning rotationally ($V_{rotational}$):

$$V_{tip} = \sqrt{V_{forward}^2 + (\pi \times \text{Diameter} \times \text{RPS})^2}$$

*(Where RPS is Revolutions Per Second)*

To keep $V_{tip}$ safely below Mach 1, engineers have to play a balancing game:

* **On Big Airplanes:** Because the propeller diameter is massive (e.g., 3 to 4 meters), the tips travel a huge distance per turn. To keep them subsonic, the engines must spin **incredibly slowly** (often only 1,200 to 2,000 RPM), utilizing gearboxes to drop the engine speed.
* **On Commercial Turbofans (Airliners):** The fan blades inside a Boeing 777 engine are so large that their tips naturally push right up against Mach 1.05. Engineers use advanced supercomputers to twist and sculpt the blade tips to handle the shockwaves smoothly.

---

### 🛸 How this applies to your Meteor75 Pro

Your tiny drone actually exploits the opposite end of this physics equation!

Because your propellers are incredibly tiny (a diameter of only **45mm**, or $0.045\text{ meters}$), they have a very small circumference. Let's look at the math for your drone at its absolute maximum speed of 95,700 RPM (1,595 RPS):

$$V_{rotational} = \pi \times 0.045\text{m} \times 1,595\text{ RPS} \approx 225.5\text{ m/s}$$

The speed of sound is roughly **$343\text{ m/s}$**.

Your tiny whoop's prop tips are traveling at roughly **$225\text{ m/s}$ (about 810 km/h / 500 mph)**. That means even at full throttle, your tips are sitting safely around **Mach 0.65**.

Because the props are so small, you can spin them at a mind-boggling 100,000 RPM without ever worrying about breaking the sound barrier! It’s the ultimate loophole of micro-drone physics.

Yes, you are exactly right! Mathematically, that formula calculates the **magnitude (or module) of the resultant velocity vector** at the absolute tip of the propeller blade.

Because the propeller is doing two motions simultaneously—spinning around in a circle and moving forward through the air—its tip speed is a combination of two perpendicular velocity vectors.

Here is how those vectors break down geometrically:

### 1. The Rotational Velocity Vector ($V_{rotational}$)

This vector represents the speed of the tip spinning around the motor axis. It acts tangentially to the propeller's circular path:

$$V_{rotational} = \pi \times \text{Diameter} \times \text{RPS}$$

### 2. The Forward Velocity Vector ($V_{forward}$)

This vector represents the speed of the entire drone (or airplane) moving forward through space. It acts perpendicular to the rotation plane.

---

### 📐 Combining Them (Pythagorean Theorem)

Because these two vectors are at a perfect $90^\circ$ angle to each other, they form a right triangle. To find the total actual speed of the tip slicing through the air mass (the resultant vector), engineers use the Pythagorean theorem:

$$\text{Total Tip Speed} = \sqrt{V_{forward}^2 + V_{rotational}^2}$$

### 💡 Why this matters for real flight:

This vector math reveals a sneaky trap for aeronautical engineers: an airplane's propeller tips actually get **faster** the faster the plane flies forward, even if the engine RPM stays exactly the same!

If an engineer designs a propeller tip to sit right at Mach 0.9 while the plane is parked on the runway ($V_{forward} = 0$), the moment the pilot takes off and starts flying fast down the runway, that extra $V_{forward}$ vector will push the total magnitude right over Mach 1.0, sending the propeller into a supersonic stall.

When evaluating drone flight physics and analyzing data logs, looking at **energy efficiency per kilometer** and **total flight time** covers the core of logistics. However, aeronautical engineers and FPV pilots look at several other crucial metrics to fully measure a drone's performance.

If you expand your Python analysis, here are the other major performance pillars you can extract from your flight data:

---

### 1. 🎛️ Volumetric and Aerodynamic Efficiency (The Lift Coefficient)

This measures how effectively your propeller shape converts motor spinning speed into actual vertical lifting force.

* **The Metric:** **Thrust per RPM ($\text{Grams} / \text{RPM}$)**.
* **Why it matters:** As a propeller spins faster, air resistance increases exponentially. By plotting your vertical G-force divided by your average motor RPM, you can map out exactly where your propeller blades begin to stall or slip. This tells you the aerodynamically optimal speed for your specific blade shape.

---

### 2. 🧮 Specific Power (The Weight-to-Power Penalty)

This looks at how hard the drone has to work just to carry its own structural weight.

* **The Metric:** **Watts per Gram ($\text{W}/\text{g}$)**.
* **Why it matters:** If you add a heavier battery (like moving from $550\text{mAh}$ to $680\text{mAh}$), your drone gains capacity, but it also demands more Watts just to stay in a hover. By calculating the total Watts divided by the takeoff weight, you can find the mathematical point of diminishing returns—the exact weight where adding a bigger battery actually *decreases* your performance because the motors waste too much energy just carrying the fuel tank.

---

### 3. 🌡️ Thermal Efficiency & Motor Health

Motors convert electrical energy into kinetic energy (spinning), but a portion of that energy is always lost as wasted heat.

* **The Metric:** **Core Temperature & Resistance Degradation**.
* **Why it matters:** In your very first Betaflight screenshot, you can see a readout for **Temperature: 62°C** inside the *System Info* box. While the flight controller has a thermometer, the motors do not. In Python, you can infer motor heating by tracking **Voltage vs. Expected RPM**. As motors get hot, their copper windings become less efficient and draw more Amps to maintain the same RPM. If a log shows a motor drawing rising current over a 6-minute flight while your throttle stick stays perfectly still, it means the motor is heating up and losing thermal efficiency.

---

### 4. 🎚️ Control Responsiveness & Latency (The Delay Factor)

For FPV pilots, how the drone *feels* is just as important as how long it flies. This tracks the system's reaction time.

* **The Metric:** **Stick-to-Gyro Latency (Milliseconds)**.
* **Why it matters:** You can use Python to calculate the exact millisecond delay between moving your finger on the RadioMaster Pocket (`rcCommand`) and the physical drone actually rotating (`gyroData`).

A highly efficient, rigid frame with crisp propellers will have a tiny latency (e.g., under $10\text{ms}$), making the drone feel perfectly locked into your hands. If your propellers get bent or the frame gets soft, that latency number will spike, and the drone will start to feel sluggish and delayed.

When you start digging into your code, combining all of these metrics gives you a complete, top-to-bottom aerodynamic profile of your quad! Which of these data paths sounds like the most fun to plot out first?

### Turboshaft

<!-- 
https://www.youtube.com/watch?v=cxQ-Ef4uIpw 
-->

{{< youtube "cxQ-Ef4uIpw" >}}

### TurboJet



## You will also need

### Structures

### Electronics



---

## Conclusions

Now, im building a dron.

### Building a DIY Dron


Inspired [to get into FPV](https://www.youtube.com/watch?v=Xs_P7T9G49o) by these [summarized videos](https://github.com/JAlcocerT/poc/blob/main/yt-distil/docker-compose.yml):

```sh
cd ./poc/yt-distil
make up #nano .env
```


{{% details title="How to Get Into FPV Drones (Beginners Guide) 🚀" closed="true" %}}

Getting into FPV drones can be overwhelming, but starting with a budget-friendly setup is key. 

Begin with a simple radio, a **tiny whoop quadcopter**, and analog goggles to practice flying in a simulator or indoors, minimizing costs and crashes.

Key points:
- FPV drones differ from cinematic drones; they require manual control and offer a more immersive flying experience.
- Start with a budget radio like the Radio Master Pocket ELRS, priced around $75.
- Use a simulator like Lift-Off (costing $10-20) to practice flying before using a real drone.
- Tiny whoops are recommended for beginners; they are durable, cost around $100, and can be flown indoors.
- Choose analog goggles for cost-effectiveness; the **Eachine 800D** is a popular beginner option at around $100.
- Essential gear includes: **a radio, goggles, a tiny whoop, a charger, and batteries**.
- Practice throttle control and camera angle adjustments to improve flying skills.
- Always charge batteries properly and monitor voltage levels during flights.

Notable quotes:
- "This puts you on a roller coaster in three-dimensional space, and you're the pilot."
- "Do yourself a favor: just go analog... it's not like you're gonna be filming crazy stuff in HD."

Action items / takeaways:
- Purchase a budget radio and a tiny whoop to start practicing.
- Invest in analog goggles and a simulator for initial training.
- Focus on practicing throttle control and navigating indoor spaces.

{{% /details %}}



> `http://192.168.1.2:8001/`

{{< youtube "nuyB-qCQLR0" >}}


{{< youtube "4nRgEmdwtJo" >}}

> I went for parts to replicate a [Meteor75 Pro](https://betafpv.com/products/meteor75-pro-brushless-whoop-quadcopter?srsltid=AfmBOooBxjLk7PHA3ndjBqdQq0y1dVYGTmZ8IihKwFFLER1TUZqD0Cam) (Matrix 1S 5IN1 FC version) with 22k kv, ELRS signal a MCU STM32G473CEU6 and as FC a [Matrix 1S](https://betafpv.com/products/matrix-1s-brushless-flight-controller)

> > https://support.betafpv.com/hc/en-us/articles/16846305078297-CLI-for-Meteor75-Pro-2026

```sh
#Betaflight Configurator
flatpak install flathub org.betaflight.BetaflightConfigurator
#radio link to test the pocket
#flatpak install flathub org.expresslrs.ExpressLRSConfigurator
```

---


## FAQ


### Cool Aerospace Channels

1. https://www.youtube.com/@LetsGoAviate

2. https://www.youtube.com/@neuronautics_Lab/videos


<!-- 
https://www.youtube.com/watch?v=m2O8MBCbXy0 
-->

{{< youtube "m2O8MBCbXy0" >}}

3. https://www.youtube.com/watch?v=geljbqJz1ro

{{< youtube "geljbqJz1ro" >}}

https://www.youtube.com/watch?v=geljbqJz1ro&list=PLL1VnFOukxRUQJ23OKtzp6Ws3ftkHIjCM&index=2

https://www.youtube.com/watch?v=hL31UtWpVAo

4. https://www.youtube.com/watch?v=AT6d3Jk7CeY

https://www.youtube.com/watch?v=hL31UtWpVAo

5. https://www.youtube.com/watch?v=cU1I7qbWosg

https://www.youtube.com/watch?v=y_kCA_rvtJI

6. https://www.youtube.com/watch?v=d2R0BU_1qBo

{{< youtube "d2R0BU_1qBo" >}}


![alt text](/blog_img/apps/yt-distill.png)

### Steam vs CO2 turbines

The main differences between supercritical CO2 turbines and steam turbines are:

Working Fluid: Supercritical CO2 turbines use CO2 as the working fluid, while steam turbines use water vapor (steam).

Phase Change: Supercritical CO2 does not undergo a phase change in the energy cycle, which is a wasteful step in steam turbines that goes from liquid to gas or gas to liquid. This allows for greater efficiency in supercritical CO2 systems (00:02:40).

Size and Efficiency: Supercritical CO2 turbines can be around 10 times smaller than equivalent steam turbines, making them more compact and potentially leading to efficiency improvements (00:02:33).

Energy Cycle: The compression of supercritical CO2 is more efficient because it can be compressed without needing to convert from liquid to gas, unlike steam which requires additional energy for this phase change (00:03:07).

These differences contribute to the potential for supercritical CO2 turbines to be more efficient and compact compared to traditional steam turbines.

### Dron BOM

1. RadioMaster Pocket ELRS ~ 70$ *I got this one by [selling my broken pixel 8pro](https://jalcocert.github.io/JAlcocerT/pixel-8-pro-tricks/)*

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

{{< youtube "AKUXxsIrtek" >}}
<!-- 
https://youtube.com/shorts/AKUXxsIrtek -->


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
* **Estimated Cost:** $75 – $85.
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


You’ve hit on the exact core debates of the DIY drone world! You understand the landscape perfectly.

Let's break down how these firmware giants compare, and exactly how that 2.4GHz digital signal keeps your drone safely under your control.


Think of these like specialized operating systems for different types of vehicles. 

While any of them *can* fly a quadcopter, they are tuned for completely different missions.

| Firmware | Best For | Pros | Cons |
| --- | --- | --- | --- |
| **Betaflight** | **Freestyle & Racing** | • Unmatched flight performance and stick feel.<br>

<br>• Lightning-fast response to acro inputs.<br>

<br>• Massive community and endless tutorials. | • Terrible at GPS autonomy (it can only "Rescue" a drone by flying back blindly and crashing softly). |
| **iNav** | **Long Range & Exploration** | • Excellent balance of freestyle and GPS functions.<br>

<br>• True Return-to-Home and position hold.<br>

<br>• Great for fixed-wing planes and exploration quads. | • Flight feel is slightly "heavier" and less snappy than Betaflight for hardcore acro tricks. |
| **Ardupilot** | **Commercial & Autonomous** | • Incredibly robust enterprise-grade software.<br>

<br>• Can fly completely pre-programmed waypoint missions.<br>

<br>• Supports advanced sensors (lidar, optical flow). | • Massive learning curve.<br>

<br>• Setting it up feels like configuring a commercial satellite rather than a fun hobby drone. |

> **The Verdict for You:** Since you want to **freestyle**, start with **Betaflight**. It is the absolute king of acro stick feel. If you later decide to add a GPS module and want to do long-range mountain cruising with automated flight paths, you can flash **iNav** onto that exact same hardware for free.




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

### More about flight controllers

To understand these boards, it helps to look at them not just as "drone parts," but as highly integrated, specialized mini-computers.

**They are microcontrollers paired with sensors (like accelerometers) and specialized chips.**

When you buy an All-In-One (AIO) board like the **HappyModel SuperX ELRS** or the **BetaFPV F4 1S**, you are buying **5 separate electronic devices** shrunk down and printed onto a single piece of fiberglass that weighs less than 5 grams.

🔬 Anatomy of an FPV All-In-One (AIO) Board

1. The Brain: The Microcontroller (MCU - Microcontroller Unit)

Just like an Arduino or a Raspberry Pi Pico, the board features a main processor chip.

* **What it is:** Usually an **STM32F411** or an **STM32G473** chip.
* **What it does:** It runs **Betaflight** (the open-source drone operating system). It loops thousands of times per second, calculating physics equations to keep the drone stable reading data from the gyroscope/accelerometer sensor.

2. The Inner Ear: The Gyroscope & Accelerometer (IMU - inertial measurement unit)

* **What it is:** A tiny MEMS (micro-electromechanical system) chip, usually the **BMI270** or **ICM-42688-P**.
* **What it does:** This is the sensor that measures rotation (gyroscope) and gravity/acceleration (accelerometer). It tells the processor exactly how many degrees the drone is tilting. If a gust of wind pushes the drone left, the accelerometer feels it instantly and alerts the brain.

3. The Musketeers: The Electronic Speed Controllers (ESCs)

* **What it is:** A collection of tiny MOSFETs (electronic switches) and dedicated driver chips.
* **What it does:** A microcontroller cannot power a high-speed brushless motor directly—it would fry the chip. The ESCs take raw power straight from your 1S battery and pump high-frequency electrical pulses into the 4 motors to **control their RPM with microsecond precision**.

4. The Ear: The ELRS Receiver (RX)

* **What it is:** A 2.4GHz radio frequency chip (usually an **SX1280** or **SX1281** paired with an ESP32 or an ESP8285 chip).
* **What it does:** This is the link that listens for your **RadioMaster Pocket**. It catches those LoRa packets flying through the air, extracts your stick inputs (throttle, pitch, roll), and hands them over to the main processor.

5. The Megaphone: What is a VTX?

**VTX stands for Video Transmitter.**

* **What it is:** It is an analog radio transmitter tuned to the **5.8GHz frequency band**.
* **What it does:** It takes the raw, live analog picture feed coming out of your tiny Caddx Ant camera via a copper wire, encodes it into a radio wave, and blasts it out into the room through the drone’s antenna. Your FPV monitor or USB dongle listens to that same 5.8GHz frequency to show you the video in real-time with zero delay.

🥊 MEPS King vs. HappyModel SuperX vs. BetaFPV F4 1S

While all three contain the items listed above, *how* they are built is what makes or breaks your DIY build:

| Feature | MEPS King 1S | HappyModel SuperX ELRS | BetaFPV F4 1S 5A AIO |
| --- | --- | --- | --- |
| **Processor (MCU)** | STM32F411 (Standard) | **STM32G473** (Faster, newer) | STM32F411 (Standard) |
| **Weight** | ~5.5g | **~4.4g** (Insanely light) | ~4.6g |
| **VTX Power** | Up to 200mW | **Up to 400mW** (Stronger video through walls) | Up to 400mW |
| **Motor Connections** | Must be soldered directly | **Plug-and-play sockets** (or solder pads) | **Plug-and-play sockets** |
| **Linux / Betaflight Support** | Poor. Uses obscure firmware targets. | **Flawless.** Fully integrated into modern Betaflight. | **Flawless.** The global benchmark for 1S whoops. |

#### Why avoid the MEPS King for a DIY project?

Because the MEPS board requires you to solder everything directly to microscopic pads, a single tiny solder bridge (accidental blob connecting two pads) can easily let 4.2V from the battery instantly fry your MCU or Gyro sensor.

With the **BetaFPV** or **HappyModel** boards, they come with tiny white plastic sockets pre-soldered onto the edges. 

Your motors just plug straight in like a Lego piece—meaning **zero soldering required for the motors**. 

You only have to solder three basic wires for the camera, making it vastly safer and friendlier for your first hardware build!

### What it is UART?

**UART** stands for **Universal Asynchronous Receiver-Transmitter**.

It isn't a physical wire or a specific plug; it is a **hardware communication protocol** built directly into the silicon of microcontrollers to let them talk to each other over a simple pair of copper lines.

Think of it as the ultimate minimalist, text-messaging system for computer chips.

How it Works (The 2-Wire Principle)

When two chips want to talk via UART, they only require two communication data lines:

1. **TX (Transmit):** The line used to *send* data out.
2. **RX (Receive):** The line used to *listen* for incoming data.

To link two devices (like your drone's radio receiver and the main flight controller brain), you cross the wires: **TX goes to RX**, and **RX goes to TX**.

```
┌─────────────────┐                ┌─────────────────┐
│     ESP32       │   TX ───►─── RX│     STM32       │
│ (Radio Receiver)│   RX ◄───◄─── TX│(Flight Computer)│
└─────────────────┘                └─────────────────┘

```

What makes it "Asynchronous"?

In many computer protocols (like USB or HDMI), there is a third wire called a **Clock line (CLK)**.

The clock line acts like a digital metronome, ticking constantly so both chips know exactly when to send and read a bit of data.

UART is **Asynchronous**, meaning **there is no shared clock wire.**

To prevent the data from turning into absolute gibberish, both chips have to agree completely on two rules *before* they start talking:

1. **The Speed (Baud Rate):** They agree on exactly how fast they will shout bits across the wire (measured in bits-per-second). For example, your RadioMaster Pocket and drone talk over UART at a standard lightning-fast speed of **420,000 bits per second** (or even 3.75 Million bits per second on modern ELRS links!).
2. **The "Start" Flag:** Because the wire is usually completely silent (sitting at a constant high voltage), the transmitting chip drops the voltage to zero for exactly one bit-period to signal: *"Hey! Wake up, a packet of data is starting right now!"*

Why FPV Drones rely entirely on UARTs

Your drone's All-In-One flight controller board has several sets of these TX and RX pins printed right onto the board, labeled as **UART1, UART2, UART3**, etc.

Because UART is completely uncomplicated, lightweight, and uses almost zero processing power, it is the primary way everything connects to the brain:

* **UART 1** might be connected to your **ESP32 ELRS Receiver** to feed stick inputs.
* **UART 2** might be connected to your **Caddx Ant / VTX system** to stream text telemetry (like battery voltage and flight time) onto your video screen.
* **UART 3** could be left open so you can solder an external **GPS module** onto the drone later.

It is an absolute foundational concept in electronics, and as a Linux user, you'll love it because Linux natively handles UART devices as simple serial streams (like `/dev/ttyUSB0`) that you can read, write to, and debug straight from your terminal!

#### Why not canbus or mqtt

This is a brilliant architectural question. You have exactly the right intuition for systems design—why use an old, basic 2-wire serial protocol when much more modern network options exist?

The answer comes down to three things: **extreme latency limits, weight/hardware simplicity, and network overhead.**

Here is exactly why **UART** beats **CAN bus** and **MQTT** in the specialized world of micro FPV drones:

1. Why not MQTT? (The Internet Protocol)

MQTT is a phenomenal "Publish/Subscribe" protocol for IoT (Internet of Things) devices, but it is built on top of **TCP/IP** (the internet layer).

* **The Speed Problem:** MQTT requires a network stack. Packaging a simple stick movement into an MQTT message means wrapping it in TCP headers, IP routing headers, and network handshakes.
* **The Latency Nightmare:** MQTT network latency is measured in tens or hundreds of milliseconds. In an FPV drone, if your stick latency goes above **5 to 10 milliseconds**, the drone becomes unflyable. You will over-correct, drift, and crash.
* **The Linux Analogy:** MQTT is what you use to send a sensor update from a weather station over Wi-Fi to a server. UART is what you use when you need two chips on the exact same motherboard to talk at millions of bits per second with zero software lag.

2. Why not CAN bus? (The Automotive Standard)

CAN bus is a beautifully engineered, message-based network protocol. It is used in cars because it is heavily shielded against electrical noise and lets 50 different microcontrollers (brakes, windows, airbags) all share the same pair of wires safely.

While heavy enterprise industrial drones *do* use CAN bus, micro whoops avoid it for three reasons:

* **The Hardware Tax:** To use CAN bus, every chip needs a physical hardware component called a **CAN Transceiver** built into the circuit board next to it. On a tiny 4-gram whoop board, adding 3 or 4 transceiver chips adds physical weight, consumes precious circuit board space, and sucks extra power from your tiny 1S battery.
* **Overkill for the Size:** CAN bus is designed to send signals down a 5-meter copper wire past a noisy car engine. On your drone, the distance between the ESP32 radio chip and the STM32 brain chip is **less than 2 centimeters**. At that short distance, electrical interference is practically zero, so the heavy data protection of CAN bus isn't needed.
* **Data Overhead:** CAN bus has built-in priority arbitration, identifiers, and error-checking bits attached to every single message. UART has zero metadata—it just slams raw, uncompressed bytes across the trace instantly.

---

A micro drone is a high-speed physics machine. It doesn't need a complex computer network or an automotive communication bus.

**UART is chosen because it is beautifully dumb.** It strips away all the software layers, requires absolutely zero extra chips or transceivers on the board, and delivers your stick coordinates from the receiver chip to the flight computer brain with the absolute lowest latency physically possible.

### How to assemble the DIy Dron

Here is your optimal, zero-motor-soldering, high-value **Bill of Materials (BOM)** to build a modern 1S Indoor Tiny Whoop.

This list ditches the awkward adapters and cheap parts from that video, giving you a clean, plug-and-play machine that will connect perfectly with your RadioMaster Pocket and Linux PC.

#### 🚁 Core Drone Components (The Aircraft)

| Component | What to Buy | Est. Price (PLN) | Connection Type | Why This Choice? |
| --- | --- | --- | --- | --- |
| **Flight Controller (AIO)** | **BetaFPV F4 1S 5A AIO (ELRS)** | ~250 PLN | Solder Camera / Plug Motors | Contains the brain, speed controllers, ELRS receiver, and 400mW video transmitter all in one board. |
| **Motors** | **BetaFPV 0802SE 19500KV** (Pack of 4) | ~120 PLN | **Plug & Play** | Tiny, super-fast brushless motors that plug straight into the flight controller sockets. |
| **Frame & Canopy** | **Meteor65** or **Meteor75** Frame + Micro Canopy | ~40 PLN | Screws together | Indestructible plastic duct frames that protect your props and home furniture from impacts. |
| **Camera** | **Caddx Ant Nano** (Analog) | ~70 PLN | **Requires Solder** (3 Wires) | The single best budget camera available. Unmatched lighting control for indoors. |
| **Propellers** | **Gemfan 31mm** (for 65mm frame) or **40mm** (for 75mm frame) | ~15 PLN | Push-fit onto motor shafts | Durable, cheap, and quiet matching sets. |


#### Power & Video Setup (No Goggles Phase)

| Component | What to Buy | Est. Price (PLN) | How It Connects | Why This Choice? |
| --- | --- | --- | --- | --- |
| **Batteries** | **Tattu 1S 300mAh (or 450mAh) BT2.0** | ~20 PLN each (Get 4) | Natively plugs into drone | Modern solid-pin BT2.0 connectors mean no power sag or fading performance. |
| **Main Charger** | **VIFLY WhoopStor V3** | ~160 PLN | USB-C Power Input | The absolute gold standard charger. It can automatically bring your LiPos to a safe "Storage Voltage" so they don't break over time. |
| **Video Receiver** | **5.8GHz UVC USB Receiver** (e.g., Rotguts / Skydroid) | ~90 PLN | USB into Linux PC / Phone | Acts like a digital webcam. Connect it to your PC, open a tool like `guvcview`, and watch your drone video live on your computer monitor! |

> 💰 Total Estimated Cost: ~725 PLN (~$180 USD)

#### What Your Building Process Looks Like

Because you selected the premium AIO board layout, your building process is incredibly low-stress:

1. **Solder the Camera:** Cut the camera wires to size, and solder its **3 lines** (Power, Ground, Video) to the clearly labeled pads on the Flight Controller. (This is the *only* soldering step!).
2. **Mount to Frame:** Use the rubber grommets and small screws to mount the flight controller flat into the center of the plastic frame.
3. **Plug the Motors:** Drop the 4 motors into their holes on the frame, screw them down, and simply feed their wires up to **plug into the white sockets** on the sides of the flight controller board.
4. **Assemble the Top:** Pop your Caddx Ant camera inside the plastic protective canopy, and screw the canopy onto the frame directly over the circuit board.
5. **Program via Linux:** Connect a USB-C cable from your Linux computer into the flight controller, open **Betaflight Configurator**, paste the standard setup profile, bind it to your RadioMaster Pocket, and you are ready to lift off!