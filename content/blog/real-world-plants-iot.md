---
title: "IoT x Plants x BoM"
date: 2026-04-10
draft: false
tags: ["Real World","Solar","Tinkering IRL","Velxio x ESPHome"]
description: 'Plants, ESP32 and future plans.'
url: 'plants-102-and-iot'
---


**Tl;DR**


**Intro**



{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="Velxio | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="ESPHome | Docker Config 🐋 ↗" >}}
{{< /cards >}}


---

## Conclusions

### Whats next from here?

Maybe...the 3D print thing to make a custom build with the solar panel mounted properly on top of the plants?

And...designed as a code with CadQuery, of course :)

Yea...that can be an interesting upgrade


---

## FAQ

## The BoM for the project

I thought initially about doing it with gravity + a NC solenoid valve.

Buuut...some of them need more preassure than gravity will do for me at my use case

So water pump it is

This is the final, definitive **"Safety-First" Bill of Materials** for your indoor 5L reservoir project.

I’ve updated it to include the specific pump, the protection components, and the connectors needed to make this "plug-and-play" and house-safe.

1. The "Brain" (Logic & Time)

| Item | Purpose | Est. Cost |
| :--- | :--- | :--- |
| **ESP32 DevKit V1** | The microcontroller that handles Wi-Fi, NTP time, and Deep Sleep. | $6.00 |
| **Micro-USB Cable** | To program the ESP32 from your computer initially. | $2.00 |

2. The "Muscle" (Water & Power)

| Item | Purpose | Est. Cost |
| :--- | :--- | :--- |
| **12V 7Ah SLA Battery** | The 2kg "Lead Acid" brick. Safe for indoors, high capacity. | $20.00 |
| **AD20P 12V Brushless Pump** | Submersible, quiet, and doesn't need gravity pressure. | $8.00 |
| **8mm ID Vinyl/Silicone Tubing** | To carry water from the pump inside the 5L bottle to the plant. | $3.00 |

3. The "Translator" (Voltage Regulation)

| Item | Purpose | Est. Cost |
| :--- | :--- | :--- |
| **LM2596 Buck Converter** | Efficiently drops 12V Battery power to 5V for the ESP32. | $3.00 |
| **IRLZ44N MOSFET** | The "Logic-Level" switch that allows 3.3V to control 12V. | $1.50 |

4. The "Safety Trio" (Protection)

| Item | Purpose | Est. Cost |
| :--- | :--- | :--- |
| **Inline Fuse Holder + 5A Fuse** | **Fire Protection:** Cuts power if a short circuit occurs. | $4.00 |
| **1N4007 Diode** | **Kickback Protection:** Blocks voltage spikes from the pump. | $0.10 |
| **1000µF 25V Capacitor** | **Stability:** Prevents "voltage dips" when the pump starts. | $0.50 |
| **0.1µF Ceramic Capacitor** | **Noise Filter:** Keeps the Wi-Fi signal clean. | $0.10 |

5. Hardware & Connectors (The "Glue")

| Item | Purpose | Est. Cost |
| :--- | :--- | :--- |
| **F1/F2 Female Spade Terminals** | To slide onto the battery tabs securely (no soldering to battery). | $2.00 |
| **220Ω & 10kΩ Resistors** | To protect the ESP32 pin and keep the pump closed during sleep. | $0.50 |
| **18-22 AWG Stranded Wire** | Proper thickness for 12V power (Red and Black). | $5.00 |
| **Heatshrink Tubing** | To waterproof the pump wire connections. | $2.00 |
| **Plastic Project Box** | To house the electronics and keep them dry if the bottle leaks. | $5.00 |

**Total Estimated Cost: ~$62.00**

---

Critical Assembly Reminders:

* **The Multimeter Test:** Before you connect the ESP32, you **must** use a multimeter to set the Buck Converter output to exactly 5.0V.
* **The Stripe on the Diode:** Make sure the silver stripe on the 1N4007 diode is facing the **Positive (Red)** wire of the pump. 
    
* **The Common Ground:** Ensure the Battery (-), Buck Converter IN(-), MOSFET Source, and ESP32 GND all share one single, solid connection point.
* **Siphoning Check:** Place your 5L bottle **lower** than your plant pot. This way, if the pump stops, gravity pulls the water back into the bottle rather than letting it continue to drip onto the floor.
    
This list covers everything you need to build a system that is safe for your house, reliable for your plants, and ready for vacations.