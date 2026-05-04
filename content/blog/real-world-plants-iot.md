---
title: "IoT x Plants x BoM"
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

Particularly, now you have the VPD version: *with just cosmetic changes at the dashboarding side*

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

For MQTT to Prometheus, it’s usually not hard if your data is already a numeric measurement and the topic structure is stable. The common pattern is an MQTT-to-Prometheus exporter or a small bridge service that subscribes to MQTT and exposes metrics on an HTTP endpoint for Prometheus to scrape.

For TimescaleDB to Prometheus, it’s less natural. Prometheus is pull-based and expects current metric values, not arbitrary historical SQL rows, so you normally export a current aggregate or a derived gauge rather than “syncing” the whole database. If the data starts in TimescaleDB, a custom exporter or scheduled job is usually the cleanest bridge.

For MQTT to Elasticsearch, it’s also manageable, but the approach is different: you usually use Logstash, Elastic Agent, a custom consumer, or an ingest pipeline to transform messages into documents before indexing them. Elasticsearch is much better at storing event records and searchable history than at serving as a live metrics endpoint.

#### MQTT x DHT x Prometheus

#### MQTT x DHT x Elastic


#### MQTT x Alerts

1. Initially I thought about webhooks

## Big Data Tech Talk 

A tech talk that goes from embeded systems, to data engineering and to visualizations?

If someone would have let me know that id be doing these sessions so easily:

```sh
#cd selfhosted-landing\y2026-tech-talks\4-iot-to-bigdata
#html :)
```

I mean...so hard, bc Im not using Slidev, not python-pptx nor just html for presentations.

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

### Whats next from here?

Maybe...the 3D print thing to make a custom build with the solar panel mounted properly on top of the plants?

And...designed as a code with CadQuery, of course :)

Yea...that can be an interesting upgrade


---

## FAQ

### The BoM for the project

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