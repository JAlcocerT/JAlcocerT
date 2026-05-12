---
title: "IoT x Plants x PyScipe BoM"
date: 2026-04-11
draft: false
tags: ["Real World","DHT22 vs MLX90614 x VPD","Tinkering IRL","Velxio x ESPHome"]
description: 'Watering Plants, VPD and future plans that made it for a tech talk.'
url: 'plants-102-and-iot'
math: true
---

**Tl;DR**

When you start [planting tomatoes](https://jalcocert.github.io/JAlcocerT/plants-101/#growth-experiment), make an elect[ronic catch up](https://jalcocert.github.io/JAlcocerT/electronics-101/) and prepare an IoT/Big Data [tech talk](#big-data-tech-talk).


**Intro**

[Velxio has been](https://fossengineer.com/selfhosting-velxio-arduino/) a recent surprise to me, when doing a [small come back to IoT and electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/#quick-iot-samples).

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="Velxio | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/esp-home/" title="ESPHome | Docker Config 🐋 ↗" >}}
{{< /cards >}}

The big win with ESPHome for these sensor projects: the entire DHT22+MQTT setup that
took a `main.py`, `boot.py`, `DHT22.py` and manual error handling is replaced by ~15 lines of YAML.

## MQTT x IoT

### Current Setup: MQTT DHT22 PGSQL

From [this section](https://jalcocert.github.io/JAlcocerT/electronics-101/#quick-iot-samples) and [these scripts](https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW):

{{< callout type="info" >}}
Thonny IDE + W11 + proper cable to push the MicroPython code made the trick 
{{< /callout >}}


```sh
#mosquitto_sub -h 192.168.1.2 -t "pico/#" -v #if this is receiving data already
git clone https://github.com/JAlcocerT/RPi
cd ./RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp

#docker ps | grep emqx
#cd ./RPi/Z_SelfHosting/pgsql
docker run -d --name timescaledb \
    -e POSTGRES_USER=pico \
    -e POSTGRES_PASSWORD=pico \
    -e POSTGRES_DB=sensors \
    -p 5432:5432 \
    timescale/timescaledb:latest-pg16

#docker ps | grep timescaledb
docker exec -it timescaledb psql -U pico -d sensors
```

See this file for the full commands (we need to make a one time setup at TimescaleDB):

```sql
CREATE TABLE readings (
    ts          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    topic       TEXT        NOT NULL,
    value       DOUBLE PRECISION NOT NULL
);

SELECT create_hypertable('readings', 'ts');
-- .............
```

As we need one script to push the data, and another (FastPI) to push it via websockets...

we better use tmux: *similarly for those lenghty blender runs*

```sh
#tmux ls
cd ./home/jalcocert/RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp
tmux new-session -d -s mqtt "uv run mqtt_to_db.py"
tmux new-session -d -s webapp "uv run uvicorn main:app --host 0.0.0.0 --port 8077"
#tmux attach -t mqtt #see the logs flowing CTRL B + D to go out w/stopping it
#docker exec -it timescaledb psql -U pico -d sensors -c "SELECT * FROM readings ORDER 
#BY ts DESC LIMIT 5;" 
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Termix | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}


By the time you are reading this, there is already [one version that combines DHT22 from a PicoW and a DHT11 from a ESP32](https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/dht-webapp):

```sh
cd ./home/jalcocert/RPi/Z_MicroControllers/dht-webapp
```

![DHT Webapp](https://raw.githubusercontent.com/JAlcocerT/RPi/main/Z_MicroControllers/dht-webapp/dht-webapp.png)


### From T and H to VPD

VPD (vapor preassure deficit) is slightly more complex than just a "subtraction" of humidity from temperature.

It represents the difference (the deficit) between how much moisture the air **can** hold when saturated and how much it **is** currently holding.

While it is based on temperature and humidity, the math involves the **Saturated Vapor Pressure ($SVP$)**, which is a non-linear relationship—air's ability to hold water increases exponentially as it gets hotter.

1. The Core Components

To calculate $VPD$, you need to find two values:
1.  **$SVP$ (Saturated Vapor Pressure):** The maximum amount of water vapor the air can hold at a specific temperature.
2.  **$AVP$ (Actual Vapor Pressure):** The amount of water vapor currently in the air.

The formula is:
$$VPD = SVP - AVP$$

2. The Detailed Formulas

To calculate this in your microcontroller code, you usually use the **Tetens Equation** to find the pressure in kilopascals (kPa).

Step A: Find $SVP$

Using the air temperature ($T$ in °Celsius):

$$SVP = 0.61078 \times \exp\left(\frac{17.27 \times T}{T + 237.3}\right)$$

Step B: Find $AVP$

Once you have $SVP$, you use your Relative Humidity ($RH$ as a percentage) to find the actual pressure:

$$AVP = SVP \times \left(\frac{RH}{100}\right)$$

Step C: Calculate $VPD$

$$VPD = SVP \times \left(1 - \frac{RH}{100}\right)$$

3. Why This "Beats" Standard Humidity

Standard Relative Humidity ($RH$) is misleading for a greenhouse. For example:
* At **15°C** and **70% RH**, the $VPD$ is approximately **0.51 kPa**.
* At **30°C** and **70% RH**, the $VPD$ is approximately **1.27 kPa**.

Even though the "Humidity" is 70% in both cases, the plants in the second scenario are losing water **more than twice as fast**. 

If you only controlled for 70% RH, your plants might dry out or stop growing when it gets hot because the "thirst" of the air changed.

4. Implementing in your PID

If you use $VPD$ as your "Process Variable" (your input) for your PID loop:

1.  **Input:** Your code calculates $VPD$ every second using the formulas above.
2.  **Setpoint:** You set a target $VPD$ (usually between **0.8 and 1.2 kPa** for most plants).
3.  **Output:** The PID opens the window if the $VPD$ gets too high (air too dry) or closes it/turns on a mister if it gets too low (air too stagnant).

5. The "Leaf Temp" Nuance

In professional systems, engineers don't use air temperature for $SVP$; they use **Leaf Temperature** (measured with an infrared sensor).

Because plants transpire, they are usually $1$–$2$°C cooler than the air.

If you want the "Ultimate Greenhouse," measuring the leaf temp gives you the most accurate $VPD$ possible.

Since you're looking at outside vs. inside temp anyway, calculating $VPD$ is just a few extra lines of math in your Python or C++ code.

Particularly, now you have the **VPD** version: *with just cosmetic changes at the dashboarding side*

```sh
#tmux ls
#cd ./home/jalcocert/RPi/Z_MicroControllers/dht-webapp
cd ./home/jalcocert/RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd
tmux new-session -d -s mqtt "uv run mqtt_to_db.py"
tmux new-session -d -s webapp "uv run uvicorn main:app --host 0.0.0.0 --port 8077"
```

### MQTT to Sources

We have seen towards timescaleDB

A good mental model is: Prometheus wants metrics, Elastic wants documents, TimescaleDB wants rows, and MQTT is just the transport.

For MQTT to Prometheus, it’s usually not hard if your data is already a numeric measurement and the topic structure is stable. 

The common pattern is an MQTT-to-Prometheus exporter or a small bridge service that subscribes to MQTT and exposes metrics on an HTTP endpoint for Prometheus to scrape.

For TimescaleDB to Prometheus, it’s less natural.

Prometheus is pull-based and expects current metric values, not arbitrary historical SQL rows, so you normally export a current aggregate or a derived gauge rather than “syncing” the whole database. 

If the data starts in TimescaleDB, a custom exporter or scheduled job is usually the cleanest bridge.

For MQTT to Elasticsearch, it’s also manageable, but the approach is different: you usually use Logstash, Elastic Agent, a custom consumer, or an ingest pipeline to transform messages into documents before indexing them.

Elasticsearch is much better at storing event records and searchable history than at serving as a live metrics endpoint.

<!-- #### MQTT x DHT x Prometheus

#### MQTT x DHT x Elastic -->


## Big Data Tech Talk 

A [tech talk](https://github.com/JAlcocerT/selfhosted-landing/tree/master/y2026-tech-talks/4-iot-to-bigdata/tech-talk) that goes from embeded systems, to data engineering and to visualizations?

If someone would have let me know that id be doing [these sessions](https://github.com/JAlcocerT/selfhosted-landing/tree/master/public/presentations) so easily...:

```sh
#npx skills add https://github.com/alchaincyf/huashu-design --skill huashu-design
#cd selfhosted-landing\y2026-tech-talks\4-iot-to-bigdata
#html powered:)
```

> `https://consulting.jalcocertech.com/presentations/techtalk-from-iot-to-big-data-engineering/ppt`

I mean...so hard, bc Im not using Slidev, not `python-pptx` nor just html for presentations.

But also promo videos via:

```sh
cd .\tech-talk\sensor-to-dashboard
#npx skills add heygen-com/hyperframe
npx hyperframes render --quality high
#npx hyperframes render --fps 30 --quality high --output renders/jalcocertech-dhtwebapp.mp4
```

{{< youtube "51kgUUPyIWY" >}}

{{< callout type="info" >}}
The learnings are stored [here](https://github.com/JAlcocerT/selfhosted-landing/tree/master/y2026-tech-talks/4-iot-to-bigdata/tech-talk)
{{< /callout >}}


---

## Conclusions

No, I didnt try hydroponics in the end :)

**Design Margins:** as per [this doc](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/interesting-simulations.md).
- System properly sized for nominal 25°C, 5-year warranty
- Cold start marginal at -20°C with 5-year-old battery (pre-warm or foldback current needed)
- Capacitor aging requires replacement every 7-10 years (field maintenance)
- [Watchdog](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/watchdog.md) timeout critical: must trigger <300ms during stall to prevent fuse melt-down

### Whats next from here?

Maybe...the 3D print thing to make a custom build with the solar panel mounted properly on top of the plants?

```sh
#streamlit run electronics-101/sample-pyscipe/solar_optimizer.py
uv run streamlit run .\solar_optimizer.py
#uv run  uv run .\home-scale-pv\compare_systems.py
```

Key findings (30kWh/month @ $0.15/kWh example):
- Grid-connected: $1.02/kWh (cheapest, net-zero generation)
- Hybrid: $1.31/kWh (+battery cost, but resilience)
- Off-grid: $2.33/kWh (most expensive, requires huge panel/battery for winter)

{{< callout type="info" >}}
Yes, this setup can [go solar](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/go-solar.md) pretty easily. Imagine a [home pv setup](https://github.com/JAlcocerT/electronics-101/tree/master/sample-pyscipe/home-scale-pv).
{{< /callout >}}

And...designed as a code with CadQuery, of course :)

Yea...that can be an interesting upgrade


---

## FAQ

### The BoM for the project

I thought initially about doing it with gravity + a NC solenoid valve.

Buuut...some of them need more preassure than gravity will do for me at my use case

So water pump with an electric motor it is.

Every component has a **specific failure mode it prevents**: *there is [a why behind](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/why.md) each*

| Layer | Failure | Mitigation | Cost |
|-------|---------|-----------|------|
| Fuse (5A) | Wire short → fire/explosion | Weak link melts first | $0.10 |
| Diode (1N4007) | Back-EMF spike (100V) → MOSFET destroyed | Clamps to 12.7V | $0.03 |
| Cap C1 (1000µF) | Inrush droop (500mV) → ESP32 brownout reset | Supplies fast current | $0.50 |
| Cap C2 (0.1µF) | HF noise on 5V rail → false logic transitions | Bypass cap at pin | $0.05 |
| Gate resistor (47Ω) | Fast edge (dI/dt) → EMI, ringing, gate overstress | Slows switching, reduces EMI | $0.02 |
| MOSFET gate drive | GPIO alone can't fully saturate standard MOSFET | Use logic-level MOSFET | $0.30 |
| Ground plane | Ground bounce → floating reference → logic glitches | Star grounding, low impedance | (PCB layout) |

The components are [dimensioned accordingly](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/output.txt):

```sh
python .\component_sizing.py > output.txt
```

1. temperature_effects.py → plots/1_temperature_effects.png
- ESR vs temperature (-20°C to +60°C)
- Shows 3× ESR increase in cold, marginal operation <-5°C
2. capacitor_aging.py → plots/2_capacitor_aging.png
- 10-year degradation model (exponential ESR growth)
- System OK for 5 years, failure >8 years
3. diode_reverse_recovery.py → plots/3_diode_reverse_recovery.png
- Reverse recovery current pulse (8A over 35ns)
- Drain spike 0.15V with good PCB layout, gate coupling 7mV
4. pump_cycles.py → plots/4_pump_cycles.png
- 100 pump cycles with ESR aging + thermal stress
- Stall event at cycle 50: 288 A²*s fuse heating (critical)
5. gate_coupling.py → plots/5_gate_coupling.png
- Cgd coupling sweep (20-100pF) with RC filtering
- Max 0.215V gate coupling after 47Ω resistor (SAFE)
6. buck_startup.py → plots/6_buck_startup.png
- Startup overshoot for 3 damping scenarios
- Good design: 7.3% overshoot, marginal: 30%, poor: 51%
7. cold_start.py → plots/7_cold_start.png
- Voltage cascade at -10°C with aged battery
- Logic supply 5.00V margin (0.50V above 4.5V minimum)

{{< callout type="info" >}}
I also made additional [interesting simulations](https://github.com/JAlcocerT/electronics-101/blob/master/sample-pyscipe/interesting-simulations.md) that validate the design sizing
{{< /callout >}}

This is the final, definitive **"Safety-First" Bill of Materials** for the indoor 5L reservoir project.

With the specific pump, the protection components, and the connectors needed to make this "plug-and-play" and house-safe.

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


### How much solar is enough for the ESP32?

I checked recently how much the consumption of both micro-c was as per how much time they send data to TimeScaleDB before killing a small battery.

And...it was not that much: ~12/24h

Now the questions is different: *is [deep sleep](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/deep-sleep.md) + internal clock + a solar panel enough to power an ESP32 directly during sun hours?*

Yep, this is in preparation for the upcoming watering setup :)

### Is the sun hitting hard? x MLX90614

As seen at the SVP section, the leaf temperature matters.

We are so lucky that we have IR sensors that can measure exactly that:

* https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="Wireguard (wg-easy) Server" image="/blog_img/hardware/wifi_eth.jpg" subtitle="A Pi can also get you started with IoT and sensors" >}}
{{< /cards >}}