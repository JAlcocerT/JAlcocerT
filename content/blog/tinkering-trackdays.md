---
title: "People out there are really creative. Trackdays and Telemetry"
date: 2025-02-24
draft: false
tags: ["Outro","Mechanics","Data Experiment","VK-162","kalman Filter"]
description: 'What I learnt after exchanging few words about car racing, canbus and telemetry.'
url: 'tinkering-telemetry-trackdays'
---

**TL;DR** Cool geodata with a GoPro, an [e36](#bmw-e36-and-canbus) and [VK-162 sensor](#gps-rpi-iot-project---gps-data-vk-162-with-apache-superset)

**Intro**

You never know what people is up to until you ask and listen.

Thats what happened to me during a wedding.

I got the chance to catchup with a friend who was into car racing, and it seems he was into trackdays and records its [BMWe36 telemetry](#bmwe36-telemetry).

Which is a master piece for 6 cylinder and a great place to practice what you lean in great books about practical mechanics like the *Arias Paz*

## Trackday and GoPro MetaData

<!-- 
https://www.youtube.com/watch?v=xoOZMAEtqBc 
-->

By the end of last year, a friend got the chance to do this:

{{< youtube "xoOZMAEtqBc" >}}

And apparently, it was all recorded with a Go Pro!

So...we can do our [GoPro telemetry trick](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9)

Which basically tells us a lot about **speeds recorded by GoPro GPS** on the 3 video parts which were recorded at 4K30:

You can also open it with **Google Colab**: [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_TrackDay.ipynb)

<!-- 
https://github.com/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_TrackDay.ipynb
 -->


**Max Speed**: 41.35 m/s (**148.86 km/h**)
Average Speed: 22.03 m/s (79.30 km/h)
Median Speed: 21.62 m/s (77.84 km/h)

Max Speed: 40.74 m/s (146.65 km/h)
Average Speed: 22.13 m/s (79.66 km/h)
Median Speed: 21.24 m/s (76.46 km/h)

Max Speed: 41.16 m/s (148.18 km/h)
Average Speed: 21.30 m/s (76.68 km/h)
Median Speed: 19.88 m/s (71.57 km/h)

![GoPro Metadata Speed trackday](/blog_img/karting/gopro-gps-trackday-speed.png)

## BMW E36 and Canbus

**Six** in line cilynders of pure joy.

This project ESP32 based and json configurable sounds just amazing:

* https://github.com/handmade0octopus/gauge.s-sorek.uk

> [Gauge.S](https://sorek.uk/) is all-car datalogger and development board.



For the future...maybe a **contactless brake temperature system**?

We can, with a **MLX Sensor**!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/" title="MLX90614 with a Pi" image="/blog_img/iot/sensor-mlx.jpg" subtitle="Infrared Temperature Sensor Project" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


{{< details title="ELM32 vs ESP32 📌" closed="true" >}}

It's important to clarify that the ELM327 and ESP32 are fundamentally different types of electronic components, although they can be used together in automotive and other applications. 

**ELM327:**

* **Purpose:**
    * The ELM327 is a microcontroller chip (or, more commonly, a device based on that chip) designed to interface with a vehicle's On-Board Diagnostics II (OBD-II) system.
    * It translates the complex OBD-II protocols into simpler serial data that can be read by other devices, such as smartphones, laptops, or other microcontrollers.
    * Essentially, it's a bridge between your car's diagnostic system and other electronic devices.
* **Functionality:**
    * It reads diagnostic trouble codes (DTCs), displays sensor data (like engine temperature, RPM, etc.), and allows for some basic vehicle parameter monitoring.
    * It handles various OBD-II protocols (CAN, ISO, etc.).
* **Common Use:**
    * Used in OBD-II scanners and diagnostic tools.

**ESP32:**

* **Purpose:**
    * The ESP32 is a low-cost, low-power system-on-a-chip (SoC) microcontroller with integrated Wi-Fi and Bluetooth capabilities.
    * It's a general-purpose microcontroller that can be programmed to perform a wide range of tasks.
* **Functionality:**
    * It can process data, control other devices, and communicate wirelessly.
    * It's used in IoT (Internet of Things) devices, home automation, and many other applications.
* **Common Use:**
    * Used in various projects needing wifi or bluetooth connectivity, and general purpose microcontroller functions.

**Similarities:**

* Both are **microcontrollers** or devices containing microcontrollers.
* Both can be used in automotive-related projects. For example, an ESP32 can be used to receive and display data from an ELM327.

**Differences:**

* **Primary Function:**
    * ELM327: Specifically designed for OBD-II communication.
    * ESP32: A general-purpose microcontroller with wireless capabilities.
* **Connectivity:**
    * ELM327: Primarily communicates via serial protocols (often through Bluetooth or Wi-Fi adapters that are bundled with ELM327 based devices).
    * ESP32: Has built-in Wi-Fi and Bluetooth.
* **Application:**
    * ELM327: Primarily used for vehicle diagnostics.
    * ESP32: Used in a wide range of applications.

{{< /details >}}

**In essence:**

* An ELM327 helps you "talk" to your car's computer.
* An ESP32 is a versatile computer that can do many things, including receiving and processing the information from an ELM327.

Therefore, they are often used in conjunction with each other. 

For example, an ESP32 could be used to receive data from an ELM327, then send that data to a smartphone or a cloud server via Wi-Fi.

---

## More Software for Track

1. Harris Lap Timer
2. [Gauge 5S](https://shop.sorek.uk/) for BMW
3. [Dashware](https://dashware.software.informer.com/)

> Synchronizes data from applications with a camera recording

### What about PhyPhox

{{< callout type="info" >}}
Sometime ago, I was **tinkering with [PhyPhox](https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/)**
{{< /callout >}}

And lately...I recorded how it feels (the data behind) an **airplane take-off**:

<!-- 
https://youtube.com/shorts/Z9xNMP3nW0A?feature=share 
-->

{{< youtube "Z9xNMP3nW0A" >}}

```sh
ffmpeg -i IMG_5294.MOV -ss 00:03:35 -to 00:05:25 -c copy output.MOV
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="More Video Tricks ↗" >}}
{{< /cards >}}

How does it look the data?

You guessed it, you can process **PhyPhox Data with Python:**

You can also open it with **Google Colab**: [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_TrackDay.ipynb)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/" title="PhyPhox Post" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Physical experiments with a Phone" >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker/tree/main/Data_PhyPhox" title="Route Tracker Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code PhyPhox Airplane EDA" >}}
{{< /cards >}}

---

## FAQ


**CANBUS VS ETHERLOOP**

<!-- 
https://www.youtube.com/watch?v=38H_8asDUfY
 -->

{{< youtube "38H_8asDUfY" >}}


## GPS RPi IoT Project - GPS Data (VK-162) with Apache Superset

* <https://www.youtube.com/watch?v=Z7cJ59sixpk&t=197s>
<https://www.youtube.com/watch?v=3ysOqliO6F8>

### ToDo list

- [ ] Job Done!
  + [ ] Setup BI - Superset
  + [ ] Hardware Checks
  + [ ] Connecting everything

<https://www.youtube.com/watch?v=Z7cJ59sixpk>

### Apache Superset Setup

Apache Superset is a [Free BI Web Tool](https://superset.apache.org/docs/intro/) that we can [use with our RPi projects locally](https://superset.apache.org/docs/installation/installing-superset-using-docker-compose/).


```sh
git clone https://github.com/apache/superset.git
cd superset

docker compose -f docker-compose-non-dev.yml up -d

#git checkout 3.0.0
#TAG=3.0.0 docker compose -f docker-compose-non-dev.yml up
```

Then, just use Superset with its UI at: **http://localhost:8088/login/**

![Desktop View](/img/superset-working.png){: width="972" height="589" }
_DHT22 connection to a Raspberry Pi 4_

*Default credentials are: admin/admin*

- [ ] Job Done!
  + [x] Setup BI - Superset
  + [ ] Hardware Checks
  + [ ] Connecting everything


### Sensors

* VK-162
* Columbus V-800 + [gpsd-gps](https://gpsd.io/) client
* BY-353 USB GPS

* GPS GNSS GPS MTK3333 adafruit 4279
* https://www.reddit.com/r/robotics/comments/18jgsmr/rtk_gps_lap_timing/
* https://www.reddit.com/r/UAVmapping/comments/10utv7b/cheapest_way_to_get_cmlevel_gps/
* ublox f9p

* Neo 6M GPS Sensor
  * https://www.youtube.com/watch?v=N8fH0nc9v9Q

### Comercial Sensors

* mychron 5s gos
& mylaps transponders
* tag heuer transponders

* https://www.reddit.com/r/rccars/comments/15iukhz/made_my_own_lap_timer_that_reads_mylaps/

### Software

* https://github.com/GPSBabel/gpsbabel

---

## FAQ

### Apache Supserset DS's and API

* Data Sources: <https://superset.apache.org/docs/databases/db-connection-ui>
* API info: <https://superset.apache.org/docs/api>

### PhyPhox

* You can also save GPS data thanks to the [F/OSS PhyPhox](https://github.com/phyphox/phyphox-android) - An app that allow us to use phone's sensors for physics experiments:
  * Also available for [ESP32 with micropython](https://github.com/phyphox/phyphox-micropython)
  * And [also for Arduino](https://github.com/phyphox/phyphox-arduino)