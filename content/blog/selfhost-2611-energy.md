---
title: "Energy on SelfHosted environment"
date: 2026-11-01T18:20:21+01:00
draft: false
tags: ["PV vs SAHP vs HVAC","Shelly x INA226"]
description: '.'
url: 'selfhosting-energy-monitoring'
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

Not as energy packed as gasoline, yet pretty useful.



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