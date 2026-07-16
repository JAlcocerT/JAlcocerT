---
title: "Batteries 101"
date: 2026-08-15
draft: false
tags: ["Bluetti elite 30 v2","DC Motor","Cupra"]
description: '.'
url: 'understanding-batteries'
math: true
---

**TL;DR**



**Intro**

From 3v to a car battery


https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/


## About Batteries

You are dealing with three distinctly different types of lithium battery chemistries. 

Each one is engineered for a completely different purpose: one values balanced driving performance, one is built for extreme safety and longevity, and the other is optimized for pure, lightweight power.



### Car batteries

The EV you rented uses **Lithium NMC** chemistry.

* **The Goal:** Maximizing energy density (range) while keeping weight reasonable.
* **How it compares:** NMC batteries can pack a massive amount of energy into a heavy vehicle chassis. They offer incredible power delivery for acceleration and handle fast-charging stations well. However, they are chemically more sensitive than your Bluetti—which is why EV manufacturers built in software buffers (the "zombie cells" we talked about) and recommend only charging them to 80% or 90% for daily use to prevent faster degradation.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/" title="Civic 6" image="/blog_img/outro/honda-road.jpg" subtitle="With car analytics" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/electr-diode/#canbus-electronics" title="Car telemetry" image="/blog_img/outro/honda-road.jpg" subtitle="Canbus x AI" >}}
{{< /cards >}}

The financial and energy breakdown for a trip in the Cupra EV::

* **Inferred Battery Size:** **$62.60 \text{ kWh}$** (This aligns perfectly with Cupra’s standard **$62 \text{ kWh}$ Gross / $58 \text{ kWh}$ Usable** battery pack option found in the Cupra Born).
* **Energy Consumption:** **$13.03 \text{ kWh}$ per $100 \text{ km}$** (or $0.13 \text{ kWh}$ per single km).
* **Financial Running Cost:** **$0.05 \text{ USD}$ per km** (which translates to $4.98 \text{ USD}$ per $100 \text{ km}$, or roughly $0.50 \text{ NOK}$ per km based on the total $811.40 \text{ NOK}$ spent over the $1630 \text{ km}$ trip).


### Bluetti 

Your portable power station utilizes **LiFePO4** chemistry. LFP (Lithium Iron Phosphate)

* **The Goal:** Absolute longevity, safety, and stability.
* **How it compares:** This is the marathon runner of the group. LFP batteries can easily handle 3,000 to 3,500+ charge cycles before dropping to 80% health (compared to the ~1,000 to 1,500 typical of an automotive NMC battery). They are highly resistant to thermal runaway (catching fire) and you can safely charge them to 100% regularly without heavily damaging their lifespan. The trade-off? They are significantly heavier and bulkier per kWh than NMC, which is fine for a power station sitting on the ground, but tougher for a nimble sports car.

### A 1S Drone 

A tiny 1S drone battery uses **LiPo** or **LiHV** chemistry. (Lithium Polymer / Lithium High Voltage).

* **The Goal:** Maximum power punch with absolute minimum weight.
* **How it compares:** Drones need to fight gravity, so weight is the enemy. LiPo batteries don't use a heavy rigid metal casing like your car or Bluetti cells; instead, they use a soft polymer pouch. They have a massive "C-rating," meaning they can discharge almost their entire capacity in just 3 to 5 minutes of aggressive flying without melting. The catch is that they are fragile, have a short lifespan (often showing degradation after just 100–200 cycles), and require strict care (like discharging them to a storage voltage of 3.8V when not in use) to prevent them from puffing up or becoming fire hazards.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/" title="DJI Tello 101" image="/blog_img/outro/honda-road.jpg" subtitle="With car analytics" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/electr-diode/#canbus-electronics" title="Car telemetry" image="/blog_img/outro/honda-road.jpg" subtitle="Canbus x AI" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/dji-tello-python-sdk/

### Laptops and Phones

Both the **Lenovo ThinkPad X13** and the **Google Pixel 8** belong to the same core chemical family as your Cupra EV and your 1S drone—they use variations of **Lithium-ion** technology.

However, they share a very specific structural and packaging style that matches your drone battery more than anything else:

> Li-Polymer (Lithium-ion Polymer)

Instead of using a rigid metal cylinder (like your 18650 cells) or a massive heavy metal block (like your Bluetti), portable everyday electronics like thin laptops and smartphones use **Lithium Polymer pouch cells**.

* **The Chemistry:** Chemically, they are nearly identical to standard Lithium-ion (often using a Lithium Cobalt Oxide or NMC variant as the base).
* **The Difference:** The big change is the *electrolyte container*. Instead of a liquid electrolyte held inside a rigid metal tube, a polymer pouch uses a gel-like or porous polymer matrix inside a flexible, laminated aluminum foil pouch.
* **Why they are used here:**
* **Space & Shape:** Manufacturers can press these pouches into incredibly thin, flat rectangles or specific shapes. This allows Lenovo to fit a flat 41Wh or 54.7Wh battery flush under your laptop keyboard, and lets Google cram a thin 4,575 mAh battery right behind the Pixel 8 screen.
* **Weight:** Removing the heavy steel or aluminum cylindrical walls saves a massive amount of weight, keeping your phone and laptop highly portable.

### How they behave compared to your other batteries:

* **Compared to your 1S Drone:** Your drone also uses soft LiPo pouches for pure weight savings, but your drone battery is optimized for *explosive discharge* (high C-rate) to fight gravity, meaning it degrades within 150–200 cycles. 

Your laptop and Pixel 8 batteries are optimized for *slow, steady endurance* (low C-rate). They are built to cycle about 800 to 1,000 times before dropping to 80% health.

* **Compared to your 18650:** While an 18650 is rugged and tough to puncture because of its steel armor shell, a laptop or phone battery is physically vulnerable. 

If you bend, puncture, or crush a Li-Polymer pouch cell, it can easily short-circuit internally.

{{< callout type="info" >}}
Maximum (Fully Charged): 8.4V | Nominal (Middle of the pack): 7.4 | Safe Low Limit (Time to Charge): 6.6V - 6.8V
{{< /callout >}}

* **Compared to your Bluetti (LFP):** Your laptop and phone will degrade much faster than your Bluetti.

While your Bluetti can sit at 100% charge with very little stress, keeping your laptop plugged into the wall at 100% all day, or letting your Pixel 8 fast-charge to 100% in a hot environment overnight, accelerates degradation.

### Others

* **The RadioMaster Pocket takes two 18650s:** Because your transmitter needs to broadcast a rock-solid, high-frequency signal (especially running an ELRS module) and power a backlit operating system for hours, it skips old-school AA batteries entirely and opts for the punchier **3.7V Lithium-ion 18650s**.

* **Your mouse uses standard AA (NiMH):** Computer mice draw a tiny, slow trickle of current.

A **1.2V NiMH AA** is the perfect fit—extremely safe, cheap, and capable of keeping a mouse awake for months before needing a charge.

So, in your current setup, you've got an incredibly diverse, high-tech battery ecosystem running everything from your desk to the sky!

**The Flat 3V Battery**: Lithium Coin Cell (CR2032, CR2016, etc.)

If your "flat 3V" is a shiny, button-shaped battery like a CR2032 (often found in PC motherboards, car key fobs, or small smart home sensors), it is a **Lithium Manganese Dioxide ($\text{Li-MnO}_2$)** disposable cell.

* **The Chemistry:** Unlike your rechargeable phone or drone, this is a **primary (non-rechargeable)** lithium chemistry. It uses lithium metal as the anode and manganese dioxide as the cathode.

* **The Voltage:** It sits perfectly at **$3.0\text{V}$ nominal** when fresh (often reading around $3.2\text{V}$ or $3.3\text{V}$ on a multimeter).

* **The Design Intent:** It is engineered for ultra-low, steady power drain over an incredibly long time (sometimes lasting 5 to 10 years in a device that sleeps most of the time). It cannot dump massive current like an 18650 or your drone battery; if you try to draw a lot of power out of it quickly, the voltage will collapse instantly.

* The Multimeter Battery: **9V Rectangular Block**

Here is the little mix-up: your multimeter almost certainly uses a **9V battery** (the rectangular block with two snaps on top), rather than a 5V one.

Traditional standalone 5V batteries don't really exist in consumer electronics, but **9V Alkaline or Carbon-Zinc** blocks are the global standard for multimeters.

* **The Chemistry:** If it's a standard supermarket battery, it's **Alkaline** (Zinc/Manganese Dioxide). Inside that rectangular 9V shell, there are actually **six tiny 1.5V cells** stacked in a row (series) to add up to $9\text{V}$.

* **Why it's in your multimeter:** Multimeters need to measure high resistance and test things like diodes or LEDs. To do that, the meter needs to push a small "sensing voltage" out of its probes into the component you are testing. A 1.2V AA or a 1.5V cell isn't high enough voltage to illuminate or read many types of diodes, but a 9V source gives the multimeter plenty of headroom to do its job.

* **The Behavior:** These are also non-rechargeable primary cells. They have very low self-discharge, which is why your multimeter can sit in a drawer for two years and still turn on perfectly when you need it.


**Traditional Car Battery**: Lead-Acid (Flooded or AGM)

Whether it is a classic "flooded" wet cell or a modern sealed **AGM** (Absorbent Glass Mat) battery, the chemistry is fundamentally the same: lead plates submerged in sulfuric acid.

Despite all the incredible breakthroughs in lithium technology, almost every internal combustion car on the planet still uses a variant of the same chemistry invented all the way back in 1859.

* **The Goal:** Massive, explosive cranking power to turn over a heavy engine, even in freezing temperatures, paired with dirt-cheap manufacturing costs.
* **The Performance:** These are **12V** batteries built for a single job: dumping 500 to 1,000 Amps of current for just 2 seconds to start your car, and then immediately getting recharged by the alternator while you drive.
* **How it compares to your setup:**
* **Weight:** They are ridiculously heavy for how little energy they actually hold (poor energy density). Your $62\text{ kWh}$ Cupra pack weighs roughly $350\text{ kg}$. If you tried to build a $62\text{ kWh}$ pack out of traditional car batteries, it would weigh well over **1.5 tons**!
* **Discharge Abuse:** They absolutely *hate* being drained. If you accidentally leave your headlights on and drain a lead-acid battery to 0% just a few times, permanent chemical damage (sulfation) occurs, and the battery dies. Your Bluetti or phone can handle deep discharges much more gracefully.


**Old Power Tools** or Cordless Home Phones: NiCd (Nickel-Cadmium)

If you have an older cordless drill or a landline cordless phone from the 2000s sitting in a drawer, it might use **NiCd** cells.

* **The Reality:** This chemistry is largely being phased out because cadmium is highly toxic. These were the infamous batteries that suffered from the **"memory effect"**—if you didn't fully empty them before recharging, they would "forget" their full capacity and lose their runtime drastically. Lithium completely solved this issue.


## Testing the Bluetti v2



---

## Conclusions

| Metric | Cupra EV (NMC) | Your Bluetti (LiFePO4) | Your 1S Drone (LiPo) |
| --- | --- | --- | --- |
| **Priority** | High range + power density | Longevity + safety | Featherweight + explosive power |
| **Lifespan** | Moderate (~1,000–1,500 cycles) | Extremely High (3,500+ cycles) | Low (~150–200 cycles) |
| **Daily 100% Charge** | Not recommended (prefer 80%) | Perfectly fine | Yes, but don't store them full |
| **Structure** | Rigid, heavily cooled pack | Heavy, protected block | Soft, exposed pouch |

* **Heavy-Duty Energy Storage:** Bluetti (**LiFePO4** — Safe, long-lasting, heavy)
* **High-Range Vehicles:** Cupra EV (**Lithium NMC** — Energy-dense, fast-charging)
* **Portable Tech:** Laptop & Pixel 8 (**Lithium Polymer** — Paper-thin, molded pouches)
* **Extreme Flight Performance:** 1S Drone (**LiPo / LiHV** — Featherweight, explosive power, fragile)
* **RC Control & Household:** RadioMaster & Mouse (**18650 Li-ion** or **AA NiMH** — Steady, reusable)
* **Legacy Engine Starters:** Gas/Diesel Car (**Lead-Acid** — Cheap, heavy, massive cold-cranking power)


What is this for?

