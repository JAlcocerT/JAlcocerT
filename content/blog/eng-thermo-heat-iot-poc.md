---
title: "Energy Solutions in the AI era"
date: 2026-05-22
draft: false
tags: ["Rankine x Aerotermia PoC","IoT x DHT22","PV vs SAHP vs HVAC"]
description: 'Boundary conditions are hard. Abstract them with sensors.'
url: 'how-to-check-hot-pump-viability'
math: true
---

Poprawne podsumowanie:
  - Prąd: ~100 kWh/m (avg 95.9)
  - Ciepło worst month: ~2.5 GJ (Feb 2025) ≈ 684 kWh thermal
  - Ciepło avg: ~0.8 GJ/m ≈ 220 kWh thermal/m

  coming from https://jalcocert.github.io/JAlcocerT/thermodynamics/ and from

  Where some magic happend: https://go-solar.pages.dev/era5-cities/

```sh
make eu-capitals-raw
make era5-cities-bake       # resumable, only fetches new 31

```
  

**Tl;DR**

How about doing `energysolutions` NOW?

+++ Solar assisted heat pump simulation (SAHP)

**Intro**

Coming from these [next steps](https://github.com/JAlcocerT/poc/blob/main/aerothermics/z-next-steps.md) to improve [the existing features](https://github.com/JAlcocerT/poc/blob/main/aerothermics/all-features.md).


Its just all about [heat pumps](https://en.wikipedia.org/wiki/Heat_pump).


---

## Conclusions

```sh
cd ./poc/go-solar
make ship #https://go-solar.pages.dev/era5-cities/
#cd ./poc/aerothermics
make deploy #https://main.aerothermics-landing.pages.dev/
```

Anti-barbell example (what I steered you away from):
  - Free tier (limited)
  - €9/mo (more bins, more years)
  - €29/mo (API, batch)
  - €99 consult
  - Result: 4-way choice, weak free tier, no clear premium positioning

Barbell example (what you have):
- Free, unlimited tool
- € paid call
- Done


### CheckList

1. The aerotermia PoC:

```sh
git clone /poc
cd ./poc/aero
```

2. The IoT setup: sensor pushing data via mqtt

```shsh

```

3. The historical invoice records:


4. Wrapping all together:


## FAQ

### How much Tilt matters for FV

https://github.com/JAlcocerT/poc/blob/main/aerothermics/z-tilt-101.md