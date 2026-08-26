---
title: "Batteries are a thing"
date: 2026-08-01
draft: false
tags: ["Bluetti elite 30 v2 x UVX","DC Motor","Cupra","LiPo vs Li-Ion","BLE","W Engine"]
description: 'Another rabbit-hole. Testing a 18860 x ESP32 and bluetooth BLE.'
url: 'understanding-batteries'
math: true
---

**TL;DR**

From 3v to a [car](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/) battery

**Intro**

Its been inspiring [this post from Sean](https://www.seangoedecke.com/blog-about-things-you-dont-understand-yet/), with a framework that ill be copying in my intros:

* Why Im writting this post: 
* What Ive learnt with it: *Ive ended up learning sth about batteries thx to the FPV drones, electric car tests and a now...a portable bluetti for home project.*

## About Batteries

Dealing with three distinctly different types of lithium battery chemistries.?

Each one is engineered for a completely different purpose: one values balanced driving performance, one is built for extreme safety and longevity, and the other is optimized for pure, lightweight power.
<!-- 
https://www.youtube.com/watch?v=454yPdhbPWs -->

{{< youtube "454yPdhbPWs" >}}


### Car batteries

The EV I rented uses **Lithium NMC** chemistry.

* **The Goal:** Maximizing energy density (range) while keeping weight reasonable.
* **How it compares:** NMC batteries can pack a massive amount of energy into a heavy vehicle chassis. They offer incredible power delivery for acceleration and handle fast-charging stations well.

However, they are chemically more sensitive than a Bluetti — which is why EV manufacturers built in software buffers (the "zombie cells" we talked about) and recommend only charging them to 80% or 90% for daily use to prevent faster degradation.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/" title="Civic 6" image="/blog_img/outro/honda-road.jpg" subtitle="With car analytics" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/electr-diode/#canbus-electronics" title="Car telemetry" image="/blog_img/outro/honda-road.jpg" subtitle="Canbus x AI" >}}
{{< /cards >}}

The financial and energy breakdown for a trip in the Cupra EV:

* **Inferred Battery Size:** **$62.60 \text{ kWh}$** (This aligns perfectly with Cupra’s standard **$62 \text{ kWh}$ Gross / $58 \text{ kWh}$ Usable** battery pack option found in the Cupra Born).
* **Energy Consumption:** **$13.03 \text{ kWh}$ per $100 \text{ km}$** (or $0.13 \text{ kWh}$ per single km).
* **Financial Running Cost:** **$0.05 \text{ USD}$ per km** (which translates to $4.98 \text{ USD}$ per $100 \text{ km}$, or roughly $0.50 \text{ NOK}$ per km based on the total $811.40 \text{ NOK}$ spent over the $1630 \text{ km}$ trip).

### Bluetti 

This has been very useful for my automatic watering setup

<!-- https://youtube.com/shorts/1nK0-MDh7LY -->

{{< youtube "1nK0-MDh7LY" >}}


Also learnt along the way about [DC plugs anatomy](https://youtube.com/shorts/HwavCMkah0o)

And that the bluetti can bring interesting MQTT data:

* https://github.com/warhammerkid/bluetti_mqtt 3/4 yo
* https://github.com/empicano/aiomqtt 3/4 months

{{< callout type="warning" >}}
I didnt manage to use [uvx to connect via BLE to the bluetti](https://github.com/JAlcocerT/poc/tree/main/iot-bluetti)
{{< /callout >}}

Your portable power station utilizes **LiFePO4** chemistry, LFP (Lithium Iron Phosphate)

* **The Goal:** Absolute longevity, safety, and stability.
* **How it compares:** This is the marathon runner of the group. LFP batteries can easily handle 3,000 to 3,500+ charge cycles before dropping to 80% health (compared to the ~1,000 to 1,500 typical of an automotive NMC battery). 

They are highly resistant to thermal runaway (catching fire) and you can safely charge them to 100% regularly without heavily damaging their lifespan.

The trade-off? 

They are significantly heavier and bulkier per kWh than NMC, which is fine for a power station sitting on the ground, but tougher for a nimble sports car.

> To load my x13 from ~low to 100% took ~35% of the bluetti capacity

> > To charge back again the bluetti you do it at 200W, so expected ~

That "click" sound is **100% normal and expected**. 

You are hearing the sound of a physical, **mechanical switch** moving inside the Bluetti.

There is some engineering difference between why AC clicks and DC is silent

#### ⚡ The AC Side: Physical Mechanical Relay

Because AC electricity runs at high voltage ($230\text{V}$), safety standards require physical separation between the inverter board and the outlets when the port is turned off.

* Inside the Elite 30 V2, there is an **electromechanical relay** (a physical switch operated by a tiny electromagnet).
* **When you hit AC ON:** The unit sends a current through a tiny coil, creating a magnetic field that physically slams a metal contact arm shut to complete the circuit. **(CLICK!)**
* **When you hit AC OFF:** The coil de-energizes, and an internal spring snaps the metal arm back open to isolate the outlets. **(CLICK!)**

#### 🔋 The DC Side: Solid-State Semiconductors (MOSFETs)

Low-voltage DC power (like your 12V car outlet and USB-C ports) doesn't need physical mechanical switches to be safe.

* Instead of mechanical arms, the DC circuit is controlled by **MOSFETs** (solid-state semiconductor transistors).
* These are digital chips with **zero moving mechanical parts**. Turning a DC port on or off is done purely by changing voltage on a silicon gate—making it completely instantaneous and dead silent.

> **Bottom Line:** The click is actually a reassuring safety feature. It tells you the high-voltage relay just physically clamped shut and is ready to safely handle up to 600W of AC power!

#### Power vs Energy Density

1. Capacity: 288 Wh (18 Ah)

Following our previous calculation logic ($\text{Wh} = \text{Ah} \times \text{Voltage}$):

$$\text{Voltage} = \frac{288 \text{ Wh}}{18 \text{ Ah}} = 16 \text{ Volts}$$

This indicates the power station uses a **4S LiFePO4 battery pack configuration** (4 cells connected in series):

* Nominal voltage per LiFePO4 cell = $3.2 \text{ V}$
* Pack nominal voltage = $4 \times 3.2 \text{ V} = 12.8 \text{ V}$ to $16 \text{ V}$ (depending on whether it is calculated using nominal or full charge voltage)


{{< callout type="warning" >}}
You wont be able to carry this on a flight as they are limited to 100 Wh at the time of writing!
{{< /callout >}}

2. Weight vs. Chemistry: 4.3 kg with LiFePO4

LiFePO4 (Lithium Iron Phosphate) cells are heavier and slightly less energy-dense than standard Li-ion cells, but they offer **3,000+ charge cycles** and superior thermal safety.

* A **4.3 kg (9.5 lbs)** total weight for a **288 Wh** rugged power station (including inverter, casing, internal copper wiring, screen, and cooling fans) is very light for LiFePO4.

3. Ports & Output Design

The output specs line up with modern power delivery requirements:

* **USB-C (100 W & 140 W):** The inclusion of a 140 W USB-C port (Power Delivery 3.1 standard) allows it to fast-charge high-power devices like a 16-inch MacBook Pro directly without needing the AC wall adapter.
* **DC Outputs (12V Car + 2x DC5521):** Runs on standard 12 V DC bus power, which bypasses the AC inverter for higher efficiency when running 12 V mini-fridges or camping gear.

Realistic Expectations for Usage

With **288 Wh** of total energy (accounting for typical 85% inverter conversion losses $\approx 245 \text{ Wh}$ of usable AC power):

| Device | Power Draw | Estimated Runtime / Charges |
| --- | --- | --- |
| **Smartphone** | 15 W | $\approx 16 \text{ full charges}$ |
| **Laptop** | 60 W | $\approx 4 \text{ full charges}$ |
| **CPAP Machine** | 30 W | $\approx 8 \text{ hours}$ |
| **Starlink Mini** | 25 W | $\approx 9.5 \text{ hours}$ |
| **Mini Camping Fridge** | 40 W (50% duty cycle) | $\approx 12 \text{ hours}$ |

When evaluating power stations, it is important to distinguish between **Power Density** (watts of instantaneous output power per kg/L) and **Energy Density** (watt-hours of total stored energy per kg/L).

Here are the exact figures calculated for the **BLUETTI Elite 30 V2** (4.3 kg | 7.45 Liters | 600 W Output | 288 Wh Capacity):

1. Power Density (Speed of Power Delivery)

*Measures how much power output the unit can deliver relative to its size and weight.*

* **Per Kilogram (Gravimetric Power Density):**
* **Continuous Output (600 W):** **$\approx 139.5\text{ W/kg}$**
* **Peak Output (1,500 W Power Lifting):** **$\approx 348.8\text{ W/kg}$**


* **Per Volume / Liter (Volumetric Power Density):**
*(Dimensions: $25.0 \times 17.8 \times 16.75\text{ cm} = 7.45\text{ Liters}$)*
* **Continuous Output (600 W):** **$\approx 80.5\text{ W/L}$**
* **Peak Output (1,500 W Power Lifting):** **$\approx 201.3\text{ W/L}$**

2. Energy Density (Total Stored Energy)

*Measures how much runtime storage is packed into the unit.*

* **Per Kilogram:** $288\text{ Wh} \div 4.3\text{ kg} =$ **$\approx 67\text{ Wh/kg}$**
* **Per Volume / Liter:** $288\text{ Wh} \div 7.45\text{ L} =$ **$\approx 38.6\text{ Wh/L}$**

Why system density is lower than raw cell density

If you look up bare LiFePO4 battery cells alone, they typically offer **$\approx 140\text{--}160\text{ Wh/kg}$** and **$\approx 300\text{ Wh/L}$**.

The unit as a whole yields lower overall density ($\approx 67\text{ Wh/kg}$) because the remaining weight and volume are occupied by:

1. **The Inverter & Electronics:** Convert DC battery power to 110V/230V AC output.
2. **Cooling Systems:** Internal fans and heatsinks to manage heat during high power discharge.
3. **Outer Casing & Structure:** Ruggedized ABS plastic outer casing and internal fireproof insulation.

### A 1S Drone 

A tiny 1S drone battery uses **LiPo** Lithium Polymer or **LiHV** Lithium High Voltage chemistry.

* **The Goal:** Maximum power punch with absolute minimum weight.
* **How it compares:** Drones need to fight gravity, so weight is the enemy. LiPo batteries don't use a heavy rigid metal casing like your car or Bluetti cells; instead, they use a soft polymer pouch.

They have a massive "C-rating," meaning they can discharge almost their entire capacity in just 3 to 5 minutes of aggressive flying without melting. 

The catch is that they are fragile, have a short lifespan (often showing degradation after just 100–200 cycles), and require strict care (like discharging them to a storage voltage of 3.8V when not in use) to prevent them from puffing up or becoming fire hazards.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/" title="DJI Tello 101" image="/blog_img/outro/honda-road.jpg" subtitle="With car analytics" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/electr-diode/#canbus-electronics" title="Car telemetry" image="/blog_img/outro/honda-road.jpg" subtitle="Canbus x AI" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/dji-tello-python-sdk/

#### Be careful with FPV bateries

Get a good charger

I got ahead with a `ISDT 608AC charger`and so far no issues

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

**How they behave compared to your other batteries:**

* **Compared to your 1S Drone:** Your drone also uses soft LiPo pouches for pure weight savings, but your drone battery is optimized for *explosive discharge* (high C-rate) to fight gravity, meaning it degrades within 150–200 cycles. 

Your laptop and Pixel 8 batteries are optimized for *slow, steady endurance* (low C-rate). 

They are built to cycle about 800 to 1,000 times before dropping to 80% health.

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

* **The Chemistry:** Unlike your rechargeable phone or drone, this is a **primary (non-rechargeable)** lithium chemistry. 

It uses lithium metal as the anode and manganese dioxide as the cathode.

* **The Voltage:** It sits perfectly at **$3.0\text{V}$ nominal** when fresh (often reading around $3.2\text{V}$ or $3.3\text{V}$ on a multimeter).

* **The Design Intent:** It is engineered for ultra-low, steady power drain over an incredibly long time (sometimes lasting 5 to 10 years in a device that sleeps most of the time).

It cannot dump massive current like an 18650 or your drone battery; if you try to draw a lot of power out of it quickly, the voltage will collapse instantly.

* The Multimeter Battery: **9V Rectangular Block**

Here is the little mix-up: your multimeter almost certainly uses a **9V battery** (the rectangular block with two snaps on top), rather than a 5V one.

Traditional standalone 5V batteries don't really exist in consumer electronics, but **9V Alkaline or Carbon-Zinc** blocks are the global standard for multimeters.

* **The Chemistry:** If it's a standard supermarket battery, it's **Alkaline** (Zinc/Manganese Dioxide). Inside that rectangular 9V shell, there are actually **six tiny 1.5V cells** stacked in a row (series) to add up to $9\text{V}$.

* **Why it's in your multimeter:** Multimeters need to measure high resistance and test things like diodes or LEDs. To do that, the meter needs to push a small "sensing voltage" out of its probes into the component you are testing. 

A 1.2V AA or a 1.5V cell isn't high enough voltage to illuminate or read many types of diodes, but a 9V source gives the multimeter plenty of headroom to do its job.

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


### Bluetti x MQTT x BLE

Here's my take: **NimBLE is a lightweight, open-source Bluetooth Low Energy (BLE) software stack** designed specifically for microcontrollers.

Originally developed under the Apache Mynewt project, it is the engine that lets low-power chips (like your ESP32) talk to Bluetooth devices.

In the context of your ESP32 project, **NimBLE** (specifically the `NimBLE-Arduino` library) is the software tool you use to scan, connect to, and read data from your Bluetti power station over Bluetooth.

---

### Why Engineers Use NimBLE Over Standard Bluetooth

The ESP32 comes by default with a built-in Bluetooth library called **Bluedroid**. 

However, Bluedroid has a major downside: it was built to handle both old-school Bluetooth Classic (like wireless audio) and Bluetooth Low Energy at the same time. 

Because of that, Bluedroid is huge, slow to boot up, and consumes a massive chunk of your ESP32’s RAM and flash memory.

NimBLE was created to fix this:

1. **Massive Memory Savings:** NimBLE drops all legacy Bluetooth Classic features. It uses **~50% less RAM** and significantly less flash storage on your ESP32.
2. **More Room for Code:** Because NimBLE is so light, your ESP32 has plenty of leftover RAM to run Wi-Fi, MQTT connections, and handle sensor readings from your DHT22 simultaneously without running out of memory.
3. **Faster Connections:** It initializes rapidly, meaning your ESP32 can connect to the Bluetti, grab the battery/solar numbers, and send them to your Raspberry Pi in milliseconds.
4. **Multiple Devices:** NimBLE can comfortably maintain connections to multiple BLE sensors at the same time.

How it Fits into Your Setup

```
[ Bluetti Elite 30 V2 ]
         │ (BLE Radio Signal)
         ▼
 [ ESP32 Microcontroller ]  ◄── ( NimBLE Library handles the BLE connection )
         │ (Wi-Fi / MQTT)
         ▼
 [ Raspberry Pi Homelab ]
```

When you write your C++ sketch in the Arduino IDE, calling `#include <NimBLEDevice.h>` tells the ESP32 to use this lightweight engine to pair with your Bluetti.

---

## Conclusions

<!-- 
https://youtube.com/shorts/_msLOGVlX-I 
-->

{{< youtube "_msLOGVlX-I" >}}


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

1. An experiment with a [18650 x ESP32](#esp32-x-18650)

2. Upcoming offgrid [experiment for crops/tomatoes x bluetti](#tomatoes-x-bluetti)

### ESP32 x 18650

Ive been doing one more experiment around battery duration

Checking it with a multimeter is completely safe and a great way to double-check that your DIY setup is working exactly as intended.

📊 The Voltage Scale for a Samsung 18650:

* **$4.20\text{ V}$(or very close, like $4.15\text{ V} - $4.19\text{ V}$):** This means the battery is **100% fully charged** and the AZDelivery board did its job and cut off the power perfectly.
* **$3.6\text{ V} - 3.7\text{ V}$:** This is the nominal/halfway voltage.
* **$3.0\text{ V}$:** The battery is empty.

When we talk about "battery life," there are two different ways to look at it: *how long the drone/ESP32 will run if the sun completely disappears (Autonomy)*, and *how many years the physical battery will last before it degrades and needs to be thrown away (Lifespan)*.

1. Running Time with Zero Sun (Autonomy): *just in case you are [in a cabin between mountains](https://github.com/JAlcocerT/poc/tree/main/building-geo-to-blender) and snow covering your panels during winter*

```sh
cd ./poc/iot-rpi-dht-insulation/ingester #http://192.168.1.2:3011/
#configure the mqtt host properly and
docker compose up -d && docker compose logs --tail 10
#mosquitto_sub -h 127.0.0.1 -p 1883 -t 'esp32/temperature/dht11' -v
```

If there is a massive storm and your solar panel gets **absolutely zero light** for days, how long will your project stay powered on a single full charge?

Precisely: [11 days](https://jalcocert.github.io/JAlcocerT/engineering-101/#iot) @ 60 seconds!

```sh
sqlite3 /home/jalcocert/poc/iot-rpi-dht-insulation/ingester/data/readings.sqlite "SELECT date(received_at) AS day, COUNT(*) AS rows, AVG(value) AS avg_value
  FROM readings WHERE metric = 'temperature' GROUP BY day ORDER BY day;"
```

> The battery stopped with xyz V

> > I tried again with bigger `@ 10 min` deep sleep and got xyz days

Assuming you are using a standard, high-quality **$3000\text{ mAh}$ 18650 battery**:

* **At constant $100\text{ mA}$ draw (ESP32 fully awake 24/7):**

$$\text{Running Time} = \frac{3000\text{ mAh}}{100\text{ mA}} = \mathbf{30\text{ hours}}$$


* *Verdict:* Your project will survive for exactly **1.2 days** of total darkness.


* **Using Deep Sleep (Average draw of $5\text{ mA}$):**

$$\text{Running Time} = \frac{3000\text{ mAh}}{5\text{ mA}} = 600\text{ hours} = \mathbf{25\text{ days}}$$

* *Verdict:* Your project will easily survive almost **a full month** of complete darkness!

2. Physical Lifespan: *How many years before replacing it*

Standard 18650 Lithium-Ion chemistry is incredibly durable, but it does degrade slowly over time as you charge and discharge it.

The Cycle Count

A typical quality 18650 cell (like a Samsung, LG, or Sony/Murata) is rated for **300 to 500 full charge/discharge cycles** before its maximum capacity drops to 80% of its original state.

Since your solar setup will cycle once per day (discharging at night, charging during the day), 500 cycles theoretically equals about **1.5 years of daily use**.

The "Shallow Discharge" Cheat Code (Why it will actually last longer!)

Batteries only degrade quickly if you drain them down to 0% and charge them up to 100% every time.

Because your ESP32 only uses about **$1400\text{ mAh}$** during the night (which is only about 45% of a $3000\text{ mAh}$ battery's total capacity), you are doing what is called **shallow cycling**.

* Discharging a battery only halfway and recharging it is incredibly gentle on the chemistry.
* Because of this, your battery's lifespan will easily double, lasting **1,000 to 1,500 partial cycles**.

> 📅 **Real-World Lifespan:** You can realistically expect your single 18650 cell to run your solar ESP32 station for **2 to 3 years** of continuous daily outdoor operation before you need to swap it out for a fresh one!

#### TP4056 x DW01A

The TP4056 chip itself does **not** protect against over-discharge!

That is one of the biggest misconceptions with these boards. 

The TP4056 is strictly a **charging** chip—it only controls power *going into* the battery from the USB port.

The component that stops your 18650 from dropping below a safe voltage (around $2.4\text{V} - 2.8\text{V}$) is a separate **protection circuit** built onto that black AZDelivery board.

The Two Chips Working Together:

If you look closely at the little black board, you'll see two tiny 8-pin chips near the USB ports:

1. **TP4056 (The Charger):** Handles incoming power, limits current to ~$600\text{ mA}$, and cuts power off when the battery reaches $4.2\text{ V}$.

2. **DW01A + FS8205A MOSFET (The Guard Dogs):** This is the **protection circuit**.

* **DW01A:** Constantly measures the battery voltage. The moment the voltage drops below about $2.4\text{V}$, it commands the MOSFET to instantly **cut the connection** between the battery and your ESP32.
* This completely shuts down the circuit so the battery doesn't drain into the "dead zone" where lithium chemistry gets permanently ruined.

* **TP4056** = Stops it from going above $4.2\text{V}$ (Overcharge Protection).
* **DW01A Circuit** = Stops it from dropping below ~$2.4\text{V}$ (Over-discharge Protection).

> Because my `AZDelivery board` has **both**, the Samsung 35E battery is 100% safe in both directions!

### Tomatoes x Bluetti

Coming from [this section](https://jalcocert.github.io/JAlcocerT/electr-diode/#tomatoes) for the tomatoes.

They already gave me x2 harvests, say ~1kg total (first bigger)

---

## FAQ

Rigid, standard Lithium-Ion (Li-ion) batteries store slightly more energy per kilogram (gravimetric energy density) than Lithium Polymer (LiPo) batteries.

* **Li-ion (Standard Rigid Cells):** $\approx 150 \text{ to } 250 \text{ Wh/kg}$
* **LiPo (Flexible Soft-Pouch Cells):** $\approx 100 \text{ to } 200 \text{ Wh/kg}$

Why Standard Li-ion Holds More Energy per kg

1. **Electrolyte Composition:** Traditional Li-ion uses a liquid organic electrolyte, which allows lithium ions to move very quickly and efficient chemical packing. LiPo uses a gel-like or polymer matrix electrolyte, which is slightly bulkier and less energy-dense at a chemical level.
2. **Active Material Ratio:** Standard cylindrical cells (like 18650 or 21070 cells) can compress active chemistry inside a rigid metal shell very tightly, packing more energy into the internal material relative to its weight.

The Trade-off: System vs. Cell Level

While pure **Li-ion chemistry wins on raw energy density (Wh/kg)**, LiPo often wins on **usable design efficiency** depending on the application:

* **Packaging & Casing:** Standard Li-ion requires heavy metal cans (steel/aluminum) for individual cells. LiPo uses a lightweight aluminum-laminate foil pouch.
* **Dead Space:** Cylindrical Li-ion cells leave gaps when packed together. LiPo pouches lie flat, making them easier to fit into thin spaces (like smartphones, laptops, and custom drone frames) without wasting volume.
* **Power Output (C-Rating):** LiPo batteries deliver massive spikes of instant current (high burst power), making them preferred for RC drones and racing applications despite their slightly lower total Wh/kg capacity.

Standard Li-ion is optimal when aiming for maximum total energy capacity per kilogram (such as in long-range drones, power tools, or electric vehicles).

### Car batteries

<!-- https://www.youtube.com/watch?v=NMkQib8CTZs -->

{{< youtube "NMkQib8CTZs" >}}

{{< youtube "VnGRFwDrLHo" >}}

<!-- 
<https://www.youtube.com/watch?v=VnGRFwDrLHo> 
-->

#### W Engine simulation

Recently I got to know that the W engine inside m4a's was 5xI6 with 20L

<!-- 
https://youtube.com/shorts/x6NAMwPo6hI 
-->

{{< youtube "x6NAMwPo6hI" >}}

Thats x30 of these:

![alt text](/blog_img/mechanics/inline1_thermo.gif)

Or x5 of these:

![alt text](/blog_img/mechanics/inline6_combustion.gif)

This is the **W30** in action:

{{< youtube "0rjA6ua8oUk" >}}
<!-- 
https://youtu.be/0rjA6ua8oUk -->


Those had a 24V battery system for the startup, which required ~500-1000A

meaning... ~24KW or ~30hp!

All of that to get started a ~300-400 hp @ 2400 rpm engine

Its crazy how much more compact and efficient engines had got along the way

example: a laguna 1.9 td has 110cv and is fine with a 660Ah 12V battery

But, im telling this just to give you the simulation of the W engine, following the previous [Inline](https://jalcocert.github.io/JAlcocerT/visualizing-engine-nvh/#inlines) and [V posts](https://jalcocert.github.io/JAlcocerT/simulating-the-shape-of-engine-balance/):

### Battery vs Gasoline

Gasoline completely dwarfs batteries in energy density—it is in an entirely different order of magnitude.

1. Stored Energy Density (Raw Fuel vs. Power Station)

| Metric | Gasoline (Raw Fuel) | BLUETTI Power Station | Difference |
| --- | --- | --- | --- |
| **Gravimetric (Energy per kg)** | **$\approx 12,200 \text{ Wh/kg}$** | **$\approx 67 \text{ Wh/kg}$** | Gasoline is **$\approx 180\times$ denser** |
| **Volumetric (Energy per Liter)** | **$\approx 9,700 \text{ Wh/L}$** | **$\approx 38.6 \text{ Wh/L}$** | Gasoline is **$\approx 250\times$ denser** |

2. Real-World Usable Energy (Accounting for Efficiency)

Gasoline must be burned in an internal combustion engine (like a portable gas generator) to generate electricity.

* Small portable gas generators convert heat into electricity at **$\approx 15\%\text{--}20\%$ thermal efficiency** (the remaining $80\%\text{--}85\%$ is lost as waste heat, noise, and friction).
* Battery power stations (like the BLUETTI) output electricity through an electronic inverter at **$\approx 85\%\text{--}90\%$ electrical efficiency**.

Practical Comparison: 1 Litre of Gasoline vs. the BLUETTI

* **1 Litre of Gasoline ($\approx 0.75 \text{ kg}$):**

$$\text{Raw Energy} = 9,700 \text{ Wh} \xrightarrow{20\% \text{ generator efficiency}} \mathbf{1,940 \text{ Wh usable electricity}}$$

* **BLUETTI Power Station ($4.3 \text{ kg}$ total weight):**

$$\text{Raw Stored Energy} = 288 \text{ Wh} \xrightarrow{85\% \text{ inverter efficiency}} \mathbf{245 \text{ Wh usable electricity}}$$

**Even after losing 80% of its energy as waste heat, 1 liter of gasoline (weighing under 1 kg) delivers roughly 8 times more usable electricity than this entire 4.3 kg power station.**

3. If Gasoline is So Dense, Why Use Portable Power Stations?

Gasoline wins on energy density, but batteries win on operational advantages:

1. **Zero Emissions & Quiet:** Can be safely run indoors, inside tents, or in enclosed living spaces without carbon monoxide poisoning or engine noise.
2. **Instant Power Delivery:** No pull cords, choke settings, or warming up.
3. **No Consumables / Zero Maintenance:** No oil changes, spark plugs, carburetors cleaning, or fuel stabilization.
4. **Rechargability:** Can be recharged directly from solar panels for off-grid sustainability.

### Conversions

A **770 mAh** capacity matches **5.5 Wh** because the battery operates at a nominal voltage of **7.2 V** (commonly used in 2-cell / 2S lithium-ion battery packs, such as camera batteries like the Panasonic DMW-BLG10).

The Formula

$$\text{Energy (Wh)} = \frac{\text{Capacity (mAh)} \times \text{Voltage (V)}}{1000}$$

The Calculation

1. **Convert mAh to Ah:**

$$770 \text{ mAh} \div 1000 = 0.77 \text{ Ah}$$

2. **Multiply by Nominal Voltage (7.2 V):**

$$0.77 \text{ Ah} \times 7.2 \text{ V} = 5.544 \text{ Wh} \approx 5.5 \text{ Wh}$$

* **mAh (milliamp-hours)** measures **electric charge** (how many current units the battery can release over time).
* **Wh (watt-hours)** measures total **energy** (taking into account the electrical force, or voltage, pushing that current).

Batteries use **mAh** and **Wh** instead of **Joules** because they align directly with how electrical devices are measured, used, and rated in real-world engineering and everyday life.

While **Joules** ($J$) is the SI unit for energy ($1 \text{ Wh} = 3,600 \text{ Joules}$), converting to Joules creates three major practical problems:

1. The Numbers Get Unmanageably Large

A standard, small phone battery (e.g., 4,000 mAh at 3.85 V) holds **55,440 Joules**.

* **Joules:** "This battery holds 55,440 Joules."
* **Wh:** "This battery holds 15.4 Watt-hours."

Watt-hours keep numbers in clean, human-friendly ranges (usually between 5 and 100 Wh for consumer electronics).

2. Direct Math with Device Power Ratings

Electrical devices are rated in **Watts** ($W$), not Joules per second, in consumer markets.

Having the battery capacity in **Watt-hours** ($Wh$) makes calculating runtime instant:

$$\text{Runtime (Hours)} = \frac{\text{Battery Energy (Wh)}}{\text{Device Power Draw (W)}}$$

* **Example:** A laptop draws 15 W. If its battery is 60 Wh, it runs for $60 \div 15 = 4 \text{ hours}$.
* If capacity were given as $216,000 \text{ Joules}$, you would have to divide by $3,600$ every single time to calculate simple runtime.

3. Current (mA) and Time (h) are What We Measure

Batteries deliver current over time.

* **mAh (milliamp-hours)** tells an electrical engineer how many milliamps of current the battery can output for how many hours at a given voltage.
* Since circuit components, LED displays, and chips draw specific amounts of current (e.g., a chip drawing 50 mA), knowing the mAh rating instantly tells you how many hours the system will run.

Unit Conversion Summary

| Unit | What it Measures | Formula | Best Used For |
| --- | --- | --- | --- |
| **Joule (J)** | Raw Energy | $1 \text{ J} = 1 \text{ Watt-second}$ | Physics, thermodynamics, fundamental science |
| **Watt-hour (Wh)** | Practical Energy | $1 \text{ Wh} = 3,600 \text{ J}$ | Battery capacity, airline travel limits, electricity bills |
| **Milliamp-hour (mAh)** | Electric Charge | $\text{Current (mA)} \times \text{Time (h)}$ | Single-cell battery sizing, device current draw |

**Generally, yes.** Rigid, standard Lithium-Ion (Li-ion) batteries store slightly more energy per kilogram (gravimetric energy density) than Lithium Polymer (LiPo) batteries.

* **Li-ion (Standard Rigid Cells):** $\approx 150 \text{ to } 250 \text{ Wh/kg}$
* **LiPo (Flexible Soft-Pouch Cells):** $\approx 100 \text{ to } 200 \text{ Wh/kg}$

---

### Why Standard Li-ion Holds More Energy per kg

1. **Electrolyte Composition:** Traditional Li-ion uses a liquid organic electrolyte, which allows lithium ions to move very quickly and efficient chemical packing. LiPo uses a gel-like or polymer matrix electrolyte, which is slightly bulkier and less energy-dense at a chemical level.

2. **Active Material Ratio:** Standard cylindrical cells (like 18650 or 21070 cells) can compress active chemistry inside a rigid metal shell very tightly, packing more energy into the internal material relative to its weight.

### The Trade-off: System vs. Cell Level

While pure **Li-ion chemistry wins on raw energy density (Wh/kg)**, LiPo often wins on **usable design efficiency** depending on the application:

* **Packaging & Casing:** Standard Li-ion requires heavy metal cans (steel/aluminum) for individual cells. LiPo uses a lightweight aluminum-laminate foil pouch.
* **Dead Space:** Cylindrical Li-ion cells leave gaps when packed together. LiPo pouches lie flat, making them easier to fit into thin spaces (like smartphones, laptops, and custom drone frames) without wasting volume.
* **Power Output (C-Rating):** LiPo batteries deliver massive spikes of instant current (high burst power), making them preferred for RC drones and racing applications despite their slightly lower total Wh/kg capacity.

Standard Li-ion is optimal when aiming for maximum total energy capacity per kilogram (such as in long-range drones, power tools, or electric vehicles).