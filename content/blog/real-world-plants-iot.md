---
title: "IoT x Plants x BoM"
date: 2026-04-12
draft: false
tags: ["Real World","DHT22 vs MLX90614","Tinkering IRL","Velxio x ESPHome"]
description: 'Plants, ESP32 and future plans.'
url: 'plants-102-and-iot'
---


**Tl;DR**


**Intro**

[Velxio has been](https://fossengineer.com/selfhosting-velxio-arduino/) a recent surprise to me, when doing a [small come back to IoT and electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/#quick-iot-samples)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="Velxio | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="ESPHome | Docker Config 🐋 ↗" >}}
{{< /cards >}}

 The big win with ESPHome for these sensor projects: the entire DHT22+MQTT setup that
  took a main.py, boot.py, DHT22.py and manual error handling is replaced by ~15 lines 
  of YAML.


## Current Setup: MQTT DHT22 PGSQL

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

Now the questions is different: *is [deep sleep](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/deep-sleep.md) + internal clock + a solar panel enough to power an ESP32 directly during sun hours?*

Yep, this is in preparation for the upcoming watering setup :)

### Is the sun hitting hard? x MLX90614

* https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/