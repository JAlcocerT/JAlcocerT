---
title: "Energy Solutions in the AI era"
date: 2026-05-26
draft: false
tags: ["Rankine x Aerotermia PoC","IoT x DHT22 x Solar Experiment x ERA5","PV vs SAHP vs HVAC","EMQx x DHT11"]
description: 'Boundary conditions are hard. Abstract them with sensors.Blender and building shadows'
url: 'how-to-check-hot-pump-viability'
math: true
---

In retrospective, 12m2 of solar panels are enough to pay no electricity bill in south Spain.

But how can we now this in advance?

Ive also seen invoices with less than 100kwh in regular months, then spike to 360wkh in august

Guess why :)

```sh
git clone /poc
cd ./poc/go-solar-trajectory
#npm run build
#npx wrangler pages deploy dist --project-name=solar-trajectory
```

> https://solar-trajectory.pages.dev/

> > https://17e286bf.trip-planner-9lt.pages.dev/?sid=06380&lat=50.9167&lon=5.7833&name=Maastricht+Airport+Zuid+Limburg&country=NL

There are now two concepts:      
- Face sun now: sets the panel normal directly toward the current sun vector. This is the tracker-style    instantaneous optimum.                                                                               
- Use annual fixed: finds the best fixed tilt/azimuth for the selected latitude using a clear-sky      
  geometry proxy: it samples the year and maximizes max(0, sun · panelNormal) * sin(solarAltitude).    
                                                                                                        
Important: this is not yet a real PV yield optimum. It ignores clouds, shading, roof constraints, DNI/ DHI split, temperature losses, and self-consumption.
  
It answers: “geometrically, what fixed panel orientation catches the most clear-sky sun at this latitude?”    

Is this for you if your kwh is 0.26 eur?

go-solar.pages.dev/era5-cities/

```sh
sudo docker ps -q | xargs -r sudo docker stop
sudo docker start mqtt-dht11-dashboard emqx 0ce58d132af6
sudo docker container prune -f   
```
* https://jalcocert.github.io/JAlcocerT/messaging-protocols/#mqtt-x-picow-x-dht22

```sh
git clone https://github.com/JAlcocerT/RPi/
#npm start
docker compose up --build -d
```
1. Stop the local Node process.                                                                                        
2. From mqtt-dht11-dashboard, run docker compose up --build -d                                                         
3. The container should continue using the existing data/readings.sqlite           

![alt text](/blog_img/data-experiments/dht11-telemetry.png)

{{< youtube "d6PyYCBft44" >}}



{{< youtube "cHIPjAG2dkk" >}}

<!-- 
https://youtube.com/shorts/cHIPjAG2dkk 
-->

```sh
     sudo ufw status
sudo ufw allow 1883/tcp
mosquitto_sub -h 192.168.1.106 -p 1883 -t "esp32/temperature/dht11" -v
mosquitto_sub -h 192.168.1.106 -p 1883 -t "esp32/humidity/dht11" -v
```

> the esp32 got `192.168.1.109`

> > see Tools -> Serial Monitor at arduinoIDE for the logs


// ---- Configuration ----
const char* WIFI_SSID     = "your-wifi";
const char* WIFI_PASSWORD = "your-password";  // const char* handles special chars ($, @, etc.)
const char* MQTT_BROKER   = "192.168.1.106";
const int   MQTT_PORT     = 1883;
const int   DHT_PIN       = 4;   // GPIO4 (D4) — best category, no special boot functions
const int   PUBLISH_MS    = 5000;

https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/arduino-idea-esp32-internal-temp.png

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-dht11-mqtt.cpp" title="ESP32 + DHT1 + MQTT ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}


> Open ArduinoIDE and select `ESP32 Dev Module` + `CTRL + U` to compile the sketch `esp32-internal-temp-mqtt.cpp` into the board with the right wifi pwd.

* https://jalcocert.github.io/JAlcocerT/electronics-101/#quick-iot-samples

```sh
ssh casa@192.168.1.106
#cd ./Home-Lab/emqx
#docker compose up -d
# Check if the container is running
docker ps | grep emqx
# Watch EMQX logs live
docker logs emqx -f
```

> Connect to the UI via: `http://192.168.1.106:18083` then add `admin/public`

> > the new node app is at `http://192.168.1.106:3000/`

* https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/mqtt-dht11-dashboard/dht11-telemetry.png

* https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/ESP32/esp32-c/mqtt-dht11-dashboard
* https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-dht11-mqtt-emqx.cpp

https://www.youtube.com/shorts/ZcsaFZgWoEc

Poprawne podsumowanie:
  - Prąd: ~100 kWh/m (avg 95.9)
  - Ciepło worst month: ~2.5 GJ (Feb 2025) ≈ 684 kWh thermal
  - Ciepło avg: ~0.8 GJ/m ≈ 220 kWh thermal/m

  coming from https://jalcocert.github.io/JAlcocerT/thermodynamics/ and from

  Where some magic happend: `https://go-solar.pages.dev/era5-cities/`

```sh
#git clone /poc
#cd ./poc/go-solar
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

![alt text](/blog_img/mechanics/heat_pump.gif)

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

2. The IoT setup: *sensor pushing data via mqtt*

```sh
git clone /RPi
cd ./RPi/
```

3. The historical invoice records: *use kreuzberg or your eyes for once*

> If you dont go crazy, 100kwh/m avg seems reasonable, invoices in spain inform about neighbours, they do x2 (lol)

4. Wrapping all together:

### What about blender?



---

## FAQ

### How much Tilt matters for FV

Depending on: latitude, day of the year, hour

* https://github.com/JAlcocerT/poc/blob/main/aerothermics/z-tilt-101.md