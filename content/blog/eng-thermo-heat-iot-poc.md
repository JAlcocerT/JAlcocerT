---
title: "Energy Solutions in the AI era"
date: 2026-05-22
draft: false
tags: ["Rankine x Aerotermia PoC","IoT x DHT22 x Solar Experiment","PV vs SAHP vs HVAC"]
description: 'Boundary conditions are hard. Abstract them with sensors.'
url: 'how-to-check-hot-pump-viability'
math: true
---

https://www.youtube.com/shorts/ZcsaFZgWoEc

Poprawne podsumowanie:
  - Prąd: ~100 kWh/m (avg 95.9)
  - Ciepło worst month: ~2.5 GJ (Feb 2025) ≈ 684 kWh thermal
  - Ciepło avg: ~0.8 GJ/m ≈ 220 kWh thermal/m

  coming from https://jalcocert.github.io/JAlcocerT/thermodynamics/ and from

  Where some magic happend: https://go-solar.pages.dev/era5-cities/

```sh
#make eu-capitals-raw
make eu-capitals-status #-missing
#make era5-cities-bake       # resumable, only fetches new 31
make era5-cities-bake-local
make ship
```
  
> `https://go-solar.pages.dev/era5-cities/`

![alt text](/blog_img/data-experiments/gosolar-eu-ui.png)


  What to bring from the experiment:
  - The 5 IR readings + DHT22 (T_surface_in_u, T_surface_in_t, T_air_in, optional T_surface_out_u, T_surface_out_t)
  - Date + hour of the measurement (to look up the matching ERA5 GHI / T_air_out for that timestamp)
  - Material used + €/m² actually paid
  - Any photos of the patch + sensor placement (just nice to have)

  What to bring from the bills:
  - 12 monthly kWh totals
  - Their real €/kWh (bill total ÷ kWh)
  - Contracted power (kW)
  - AC unit age/model if known
  
  The flow we'll run:
  1. Plug measurements into /era5-cities/Sevilla measured-seasonal section
  2. Calibrate AC COP using bills vs model prediction (per zzzzz-post-experiment.md step B5)
  3. Run the three-scenario projection (best/likely/worst)
  4. Generate the parent-facing one-pager from the template
  5. Decide whether to scale to full roof
  
  The docs to reference when you're back:
  - zzz-azotea-experiment-actionplan.md — execution checklist
  - zzz-experiment-expectations.md — sanity-check bands for the readings
  - zzzzz-post-experiment.md — workflow → parent presentation

  Good luck with the measurement weekend. Pick a clear-sky day, 14:30–16:30, AC steady-state for an hour beforehand, and remember the slab needs 12+ hours after patch
  application to equilibrate. See you on the other side of the empirical confirmation.

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