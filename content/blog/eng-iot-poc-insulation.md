---
title: "[Energy Solutions] Insulation Intelligence in the AI era"
date: 2026-06-09
draft: false
tags: ["IoT x DHT22 x MLX90614","MQTT x EMQx","ESP-Now","JAlcocerTech Leads","Arduino-CLI"]
description: 'Solving Boundary conditions with IoT (ESP32 and PicoW). Blender x building shadows is possible '
url: 'data-driven-insulation-evaluation'
math: true
---


**Tl;DR**

The kind of simulation that people dont ask before commiting 300k+

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/poc/genbi-energy-solutions" title="Energy Solutions↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/poc/genbi-energy-solutions" title="building-to-blender↗" icon="github" >}}
{{< /cards >}}


**Intro**

How confy is going to be a flat that just exists over a conceptual drawing?

Coming from [this post with a solar experiment](https://jalcocert.github.io/JAlcocerT/how-to-check-hot-pump-viability/)


```sh
git clone https://github.com/JAlcocerT/RPi
```

* https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/ESP32/esp32-c/mqtt-dht11-dashboard
* https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-dht11-mqtt-emqx.cpp
* https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/dht-webapp
* https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd-poc
* https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/picow-dht-webapp


## The Sun is interesting

With all that push of energy to us via radiation


### What about blender?

I made some simulations recently on how sun rays are hitting our buildings:

```sh
sudo snap install blender --classic --channel=5.1/stable
#cd ./poc/building-to-blender
#make help
```

Then, this happened: https://github.com/JAlcocerT/poc/tree/main/building-to-blender

{{< youtube xycErOBk9mI >}}

<!-- https://youtu.be/xycErOBk9mI -->
<!-- https://youtu.be/yS55Clb5_us -->


## IoT, Walls, Sun and Heat Transfer

Previoulsy I thought that Linux was tricky compared to W11 to push code towards microcontrollers.

It seems that we dont even need arduino GUI, and a proper data cable + arduino CLI does the job:

```sh
cd ./poc/iot-rpi-dht
arduino-cli board list #make serial-list
```

1. Fix serial access for this session:

```sh
sudo setfacl -m u:$USER:rw /dev/ttyACM0
```

2. Edit WiFi in: `iot-rpi-dht/scripts-microcontrollers/firmware-esp32/esp32-dht11-mqtt-emqx-deepsleep.cpp`

```cpp
const char* WIFI_SSID     = "your-wifi";
const char* WIFI_PASSWORD = "your-password";
const char* MQTT_BROKER   = "192.168.1.14";
```

3. Upload:

```sh
cd /home/jalcocert/Desktop/poc/iot-rpi-dht/scripts-arduino-setup
./upload-deepsleep.sh /dev/ttyACM0
```

> [EMQX](https://github.com/JAlcocerT/RPi/blob/main/Z_SelfHosting/Emqx/docker-compose.yml) is already running on this laptop at `192.168.1.14:1883`.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}

So you just need the storage layer:

```sh
#make sqlite-count
# cd ./poc/iot-rpi-dht/scripts-microcontrollers/backend-node-sqlite
sqlite3 data/readings.sqlite "select * from readings order by received_ms desc limit 10;"
2|esp32/humidity/dht11|humidity|45.0|2026-06-04T14:42:47.351Z|1780584167351
1|esp32/temperature/dht11|temperature|25.3|2026-06-04T14:42:47.251Z|1780584167251
```

I made it better: *because hardcoding wifi/pwd is not nice*

```sh
#make serial-sketch
make serial-fix PORT=/dev/ttyACM0
make flash
```

See that the ESP32 is having proper logs while still connected and that emqx is getting the messages:

```sh
make serial-log PORT=/dev/ttyACM0 #see whats flowing
#http://192.168.1.2:18083/#/
make emqx-remote #admin/public.18083 #this one can work not only with the local emqx as the previous ones
make mqtt-listen MQTT_HOST=192.168.1.2 MQTT_TOPIC='esp32/#
```

Thensimilarly for the **picow DHT22**:

```sh
make serial-fix PORT=/dev/ttyACM0
make flash-picow

make mqtt-listen MQTT_HOST=192.168.1.2 MQTT_TOPIC='pico/#'
```

So with both pushing data:

```sh
#git clone /poc
cd ./poc/iot-rpi-dht/


```

We can have this view:

![alt text](/blog_img/entrepre/rpi-dht.png)

And improve it with these:

![alt text](/blog_img/iot/mqtt-esp-pushing.png)

```sh
make mqtt-listen MQTT_HOST=192.168.1.2 MQTT_TOPIC='pico/#'
#  make arduino-compile
# make serial-fix PORT=/dev/ttyACM0
# make flash # make flash PORT=/dev/ttyACM0
make mqtt-listen MQTT_HOST=192.168.1.2 MQTT_TOPIC='esp32/#'
```

![alt text](/blog_img/iot/mqtt-dht.png)

Running this at the homelab for a few days: *yea, there is a cool UI*

```sh
cd ./poc/iot-rpi-dht-insulation
```

![alt text](/blog_img/data-experiments/energy-insulation-dht.png)

{{< callout type="warning" >}}
The ESP32 deepsleep mode and pushing every 60s instead of 5s made the same battery to last instead of 12h/24h
{{< /callout >}}

### We need the MLX

The DHT's are great, but they only measure ambient temperature. 

We need the MLX90614 to measure the surface temperature of the wall, because that is what will determine the heat transfer from the wall to the inside. 

Of course there is a lot of work on this topic, as you may guess:

https://github.com/JAlcocerT/poc/tree/main/iot-rpi-mlx

```sh
cd ./poc/iot-rpi-mlx/
```

> im levereging the public scripts for this sensor here


### And the final dashboard

https://github.com/JAlcocerT/poc/tree/main/iot-rpi-mlxdht-insulation

The one that combines all the goodies of previous steps, with the UI/X ive polished:


```sh
cd ./poc/iot-rpi-dht-insulation
#docker compose up -d --build dashboard
MQTT_HOST=192.168.1.2 docker compose up -d --build dashboard #so that emqx at homelab is reachable to sqlite and webapp
```

Run this any time to check:
sqlite3 ingester/data/readings.sqlite \
  "SELECT device, metric, COUNT(*), ROUND(AVG(value),1) FROM readings GROUP BY device, metric;"
Or see the latest readings:
sqlite3 ingester/data/readings.sqlite \
  "SELECT device, metric, value, received_at FROM readings ORDER BY received_ms DESC LIMIT 10;"


![alt text](/blog_img/iot/mqtt-insulation.png)

I also tried it from the homelab: `MQTT_HOST=192.168.1.2 docker compose up -d --build`

---

## Conclusions

Measure, dont model:


---

## FAQ


### Solar vs Wind

The cost of a small wind turbine for a home ranges from $3,000 to $8,000 per kilowatt installed. 

In contrast, an equivalent 1 kW solar panel system would cost about $2,770 on average in the U.S. (SRT 00:07:46 - 00:08:04).

Source: https://www.youtube.com/watch?v=nPvTH7Siclg
Channel: Undecided with Matt Ferrell
