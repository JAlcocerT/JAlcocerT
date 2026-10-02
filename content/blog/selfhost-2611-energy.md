---
title: "Energy on SelfHosted environment"
date: 2026-11-01T18:20:21+01:00
draft: false
tags: ["PV vs SAHP vs HVAC","Shelly x INA226"]
description: 'Its happening'
url: 'selfhosting-energy-monitoring'
math: true
---

**TL;DR**

https://www.youtube.com/@QuantumMakers

---

**Intro**

* Why Im writting this post: *Bc you can do cool stuff with batteries, a tappo and some sensor bring data, you might want to bring sense to a bluetti or custom 18650 packs with BMS*
* What Ive learnt with it: *d*

{{< youtube "UjD94SGqIdM" >}}

<!-- 
https://www.youtube.com/shorts/UjD94SGqIdM 
-->

{{< youtube "IiuDQhFgmq4" >}}

<!-- 
https://www.youtube.com/shorts/IiuDQhFgmq4 
-->

## Home Energy

By inspecting your monthly utility bills you can get some interesting numbers:

* ~100 kwh monthly consumption *with 300 kwh peaks if you live in south europe*
* 

### Shelly 

To get more granular data: you can measure your home consumption.

This also helps to understand your daily patterns if you are wondering about a [solar](#solar) and/or [battery](#batteries) setup

Shelly has been [adquired recently by SE](https://corporate.shelly.com/en/news/shelly-group-has-entered-into-an-investment-agreement-with-schneider-electric-on-the-intended-voluntary-public-takeover)


## Batteries

Not as energy packed as gasoline, more than [pumping](https://github.com/JAlcocerT/poc/tree/main/physics-electronics/bucks) energy up an olimpic pool at 20m and yet pretty useful.

Assuming you mean **2,000 Wh (2 kWh)**—which aligns with modern portable power stations (e.g., a 2 kWh LiFePO4 battery commonly weighs around 19–22 kg)—the water requirement scales by a factor of 10.

You would need roughly **52,400 kg (52.4 metric tons)** of water at real-world efficiency to match it.

---

### Step-by-Step Breakdown

**1. Energy to Match (2 kWh):**


$$E = 2{,}000\text{ W} \times 3{,}600\text{ s} = 7{,}200{,}000\text{ J (7.2 MJ)}$$

**2. Potential Energy of Water at 20 m:**


$$E_p = m \cdot g \cdot h = 1\text{ kg} \times 9.81\text{ m/s}^2 \times 20\text{ m} \approx 196.2\text{ J/kg}$$

**3. Theoretical Mass (100% Efficiency):**


$$m_{\text{theoretical}} = \frac{7{,}200{,}000\text{ J}}{196.2\text{ J/kg}} \approx 36{,}700\text{ kg}$$

**4. Real-World Water Needed ($\sim 70\%$ Water-to-Wire Efficiency):**


$$m_{\text{real}} = \frac{36{,}700\text{ kg}}{0.70} \approx \mathbf{52{,}400\text{ kg}}$$

---

### Physical Scale

* **Volume:** **$52.4\text{ m}^3$** (52,400 liters, or ~13,850 gallons).
* **Pool Size:** A full-sized residential swimming pool (e.g., $8\text{ m} \times 4\text{ m} \times 1.6\text{ m}$ deep).
* **Weight Ratio:** A **$19\text{ kg}$** battery replaces over **$52{,}000\text{ kg}$** of water perched atop a 20-meter tower (about a 6-story building).

Gravity stores very little energy per kilogram compared to chemical bonds—electrochemical batteries are roughly **2,700 times more mass-efficient** than a 20-meter water head.

You would need **around 1 liter of gasoline** (roughly 0.8 to 1.1 liters) to produce that same 2,000 Wh (2 kWh) of electricity.

Step-by-Step Breakdown

**1. Energy Contained in Gasoline:**

* 1 liter of gasoline holds about **32 to 34 MJ (megajoules)** of chemical potential energy, which equals roughly **9 to 9.5 kWh** of raw thermal energy.

**2. Generator Efficiency (Carnot Strikes Back!):**
Unlike the hydro turbine, a gasoline generator **is** a heat engine, so the thermodynamic limits we discussed earlier directly apply:

* Small four-stroke engines have a thermal efficiency of only about **25% to 30%**.
* The alternator and inverter convert mechanical motion into clean electricity at about **80% to 90%** efficiency.
* **Overall "fuel-to-electricity" efficiency:** Typically **20% to 25%** under decent load.

**3. Fuel Required for 2 kWh:**


$$\text{Electrical output per liter} \approx 9.2\text{ kWh} \times 0.22 \approx \mathbf{2.0\text{ kWh per liter}}$$

$$\text{Fuel needed} = \frac{2\text{ kWh}}{2.0\text{ kWh/L}} \approx \mathbf{1.0\text{ liter}}$$

*(In practice, running a small inverter generator delivering 2 kW of power burns around **0.9 to 1.1 liters per hour**.)*

Delivering 2 kWh of Usable Electricity

| Storage Method | Weight / Volume Needed | Form of Energy | Practical Efficiency |
| --- | --- | --- | --- |
| **Gasoline** | **~0.75 kg** (~1 liter) | Chemical (covalent bonds) | ~20% – 25% (heat engine losses) |
| **LiFePO4 Battery** | **~19 kg** (shoebox size) | Electrochemical | ~90% – 95% round-trip |
| **Water at 20 m Head** | **~52,400 kg** (52,400 liters / whole pool) | Gravitational potential | ~70% water-to-wire |

Chemical bonds pack an immense amount of energy into tiny masses. 

Even after wasting 75% to 80% of its energy as heat and exhaust, a single bottle of gasoline still easily matches 52 metric tons of elevated water.

### Bluetti

The bluetti setup as SAI/UPS have saved me from some energy cuts affecting my modem and my x300 homelab.

It stores 18Ah and i can plug solar panels with open circuit voltage of up to 28V.

#### 1s 18650 x TP

I used this one to measure T/H via esp32 deep sleep and mqtt

#### 3s 18650 x BMS x PWM

I applied this one for the watering setup.


## Solar


{{< callout type="info" >}}
See [a panel I-V](https://github.com/JAlcocerT/poc/tree/main/physics-electronics/solar-panel) with the esp32
{{< /callout >}}

### MPPT vs PWM

{{< callout type="info" >}}
See [a panel I-V](https://github.com/JAlcocerT/poc/tree/main/physics-electronics/solar-panel) with the esp32
{{< /callout >}}
### Charging via CC-CV


{{< callout type="info" >}}
MPPT chooses the panel point, but [CC/CV charges the battery safely](https://github.com/JAlcocerT/poc/tree/main/physics-electronics/cc-cv-cn3722) with the esp32
{{< /callout >}}

### Measuring solar W with INA


### Modelling sun rays




---

## Conclusions




### Blackout Prep work

---

## FAQ



### Interesting Pi Ideas


1. Pi off grid - Solar panels

<https://www.reddit.com/r/raspberry_pi/comments/2b0ccl/anyone_running_their_pi_off_of_solar_panels/>

2.  RPi weather station

<!-- 
https://www.youtube.com/watch?v=5JfPzvcm0E8 
-->

{{< youtube "5JfPzvcm0E8" >}}