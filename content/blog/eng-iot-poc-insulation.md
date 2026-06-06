---
title: "Insulation Intelligence in the AI era"
date: 2026-06-09
draft: false
tags: ["IoT x DHT22 x MLX90614","MQTT x EMQx","ESP-Now","JAlcocerTech Leads","Arduino-CLI"]
description: 'Solving Boundary conditions with IoT. Blender and building shadows is possible '
url: 'data-driven-insulation-evaluation'
math: true
---

```sh
git clone https://github.com/JAlcocerT/RPi
```

https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/ESP32/esp32-c/mqtt-dht11-dashboard
https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-dht11-mqtt-emqx.cpp

https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/dht-webapp
https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd-poc
https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/picow-dht-webapp
https://github.com/JAlcocerT/RPi/blob/main/Z_SelfHosting/Emqx/docker-compose.yml

**Tl;DR**

The kind of simulation that people dont ask before commiting 300k+

**Intro**

How confy is going to be a flat that just exists over a conceptual drawing?



## The Sun is cool

With all that push of energy to us via radiation


### What about blender?

```sh
sudo snap install blender --classic --channel=5.1/stable
#cd ./poc/building-to-blender
```

Then, this happened:

https://youtu.be/yS55Clb5_us


## IoT, Walls, Sun and Heat Transfer

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

> EMQX is already running on this laptop at 192.168.1.14:1883.

So you just need the storage layer:

```sh
#make sqlite-count
# cd ./poc/iot-rpi-dht/scripts-microcontrollers/backend-node-sqlite
sqlite3 data/readings.sqlite "select * from readings order by received_ms desc limit 10;"
2|esp32/humidity/dht11|humidity|45.0|2026-06-04T14:42:47.351Z|1780584167351
1|esp32/temperature/dht11|temperature|25.3|2026-06-04T14:42:47.251Z|1780584167251
```


---

## Conclusions


---

## FAQ


### Solar vs Wind

The cost of a small wind turbine for a home ranges from $3,000 to $8,000 per kilowatt installed. 

In contrast, an equivalent 1 kW solar panel system would cost about $2,770 on average in the U.S. (SRT 00:07:46 - 00:08:04).

Source: https://www.youtube.com/watch?v=nPvTH7Siclg
Channel: Undecided with Matt Ferrell
