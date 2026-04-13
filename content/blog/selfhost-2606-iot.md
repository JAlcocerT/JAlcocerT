---
title: "Selfhosted IoT x HA"
date: 2026-04-12
#date: 2026-06-10
draft: false
tags: ["Home Assistant","Sonoff x Zigbee","Tinkering IRL"]
description: 'A homelab around IoT, sensors and HA.'
url: 'home-lab-tools-for-iot'
---

**TL;DR**

Isnt it time to do some upgrades to IoT, HA and the solar panel?

**Intro**

Summer is coming!

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers" title="MicroControllers scripts | Repo" icon="github" >}}
{{< /cards >}}

Last year, I was able to put together HA with a DHT connected to the Pico W powered by a solar panel.

But I left some few loose ends while documenting how great that setup was.

In the meantime... Ive made a ~~small~~ comeback to ~~mechanisms~~ [electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/).

> With the opportunity to make both, [the esp32 and picow setups better](https://jalcocert.github.io/JAlcocerT/electronics-101/#quick-iot-samples)

And planted couple of seeds for the first time.

Its time to make that IoT/Selfhosted setup better than I ever had.


## Protocols

Among all [messaging protocols](https://jalcocert.github.io/JAlcocerT/messaging-protocols/), mqtt has something to say.


### Connecting to MQTT

1. MqttX
2. Mqtt Explorer
3. MQTTy

Or simply with:

```sh
mosquitto_sub -h 192.168.1.2 -t "esp32/#" -v
#mosquitto_sub -h 192.168.1.2 -t "esp32/temperature/dht11"
```


### Tools for MQTT

You can get inspired at: https://selfh.st/apps/?search=mqtt

Previously, Ive tinkered with:

1. httpie

2. reqable

3. emqx - which i recommend via container, as is a good companion for such [DHT11](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-dht11-mqtt.cpp) or [DHT22](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/RPiPicoW/MQTT-DHT22/DHT22.py) scripts

> Like done at: https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/dht-webapp combining [fastapi be](https://jalcocert.github.io/JAlcocerT/learnt-while-building-web-apps/#full-stack-web-apps), [websockets](https://jalcocert.github.io/JAlcocerT/web-apps-with-flask/) and [pgsql x timescaledb](https://github.com/JAlcocerT/RPi/tree/main/Z_SelfHosting/pgsql)

![DHT Webapp](https://raw.githubusercontent.com/JAlcocerT/RPi/main/Z_MicroControllers/dht-webapp/dht-webapp.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}


## ESP32 x MQTT x MLX90614

Few years ago, I [wrote this post](https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/) explaining how to use the MLX sensor with a Pi4 2GB.

Its time to make the setup work with a ESP32 and MQTT.

```sh
#git clone /RPi
cd ./Z_MicroControllers/ESP32/esp32-c #just copy paste this one to Arduino IDE + CTRL U, 
```

then `CTRL+M` to see that it flows...

Or try with:

```sh
mosquitto_sub -h 192.168.1.2 -t "esp32/temperature/mlx/#" -v
```

{{< callout type="warning" >}}
Mind that Im using a MLX90614 **GY-906**
{{< /callout >}}


The "GY-906" part refers to the small blue or purple PCB (breakout board) that the sensor sits on.

As we discussed with the 3-pin DHT11, these breakout boards are designed to be "plug-and-play." 

If you look at the back of a GY-906 module, you will see tiny surface-mount resistors (usually labeled 103 or 472).

These are the I2C Pull-up resistors already soldered in place for you. 

Because they are there, you don't need to add your own on a breadboard.

2. The Raspberry Pi has Built-in Pull-ups

This is a key difference between your previous Raspberry Pi project and your current ESP32 project:

Raspberry Pi: The specific pins you used (SDA/GPIO2 and SCL/GPIO3) have physical 1.8kΩ pull-up resistors hardwired onto the Raspberry Pi board itself.

Even if your sensor module didn't have resistors, the Pi provides them automatically for I2C.

ESP32: Unlike the Pi, the ESP32 does not have physical pull-up resistors on its pins. 

It only has "weak" internal software pull-ups.

## ESP32 x MQTT x HM

How about sensing if some obstacle is present?

You can do it with [this .cpp script](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-mh-ir-mqtt.cpp), arduino IDE and `CTRl+U`


```sh
mosquitto_sub -h 192.168.1.2 -t "esp32/ir/#" -v
```


## ESP32 x LCD



## ESP32 x MQTT x HMC5883L

Adding the **HMC5883L** (a 3-axis digital compass/magnetometer) is actually very easy because it uses the exact same "language" as the MLX90614: **I2C**.

> Aka ESP32 x MQTT x Magnetometer

Since you already have the MLX90614 connected to **D21** and **D22**, you don't need to find new data pins.

You can simply "chain" them together.

* https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-hmc5883l-mqtt.cpp


### 1. The Wiring (The I2C "Bus")

In I2C, multiple sensors share the same two data lines.

The ESP32 tells them apart by their unique internal "address."

| HMC5883L Pin | ESP32 Pin (GPIO) | Note |
| :--- | :--- | :--- |
| **VIN / VCC** | **3V3** | Power (keep everything on 3.3V) |
| **GND** | **GND** | Ground |
| **SDA** | **D21** | Shares this pin with the MLX90614 |
| **SCL** | **D22** | Shares this pin with the MLX90614 |
| **DRDY** | *Leave Empty* | "Data Ready" - usually not needed for basic projects |


### 2. Is there anything "special" for this one?

Yes, the HMC5883L has one specific quirk you should be aware of:

**The Voltage/Chip Confusion:**
There are two chips that look identical: the original **HMC5883L** and the newer **QMC5883L**. 
* If you bought it recently, it’s likely a **QMC5883L**.
* They look the same, but the code for one won't work for the other because they have different I2C addresses. 
* **Tip:** If your code says "Sensor not found," try a library specifically for the *QMC* version.

### 3. Does it need a resistor?

Like your other modules, if the HMC5883L is on a small PCB (usually blue), it has the pull-up resistors built-in. 

However, because you are now putting **three** devices on the same power line (DHT11, MLX90614, and HMC5883L), make sure your wires are tight. 

If the power dips, the compass is usually the first thing to give weird readings.

---

### 4. Why add a Compass?

While the DHT11 tells you the "environment" and the MLX tells you the "target," the HMC5883L tells you **orientation**. 

* **Orientation:** It measures the Earth's magnetic field.
* **Interference:** Because it's a magnetometer, try to keep it away from magnets, motors, or even the ESP32’s own metal shield, as they can interfere with the "North" reading.

### Summary of your "Super-Sensor" ESP32:

* **D4:** DHT11 (Temperature/Humidity)
* **D21:** SDA for **both** MLX90614 and HMC5883L
* **D22:** SCL for **both** MLX90614 and HMC5883L

## SelfHosted IoT Tools

OpenHUB

ESPHome

### HA

There has been few releases since the last time:

<!-- https://www.youtube.com/watch?v=QwCR0h8_KyE -->

{{< youtube "QwCR0h8_KyE" >}}


Including the releases of the MCP integrations:

* https://github.com/homeassistant-ai/ha-mcp/
* https://www.home-assistant.io/integrations/mcp_server/

```sh
#git clone https://github.com/JAlcocerT/Home-Lab
#cd ~/Home-Lab/home-assistant
#sudo docker compose up -d

##cd ~/Home-Lab
#git pull
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d home-assistant

docker ps -a | grep -i home-assistant
#docker stats home-assistant
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/termix" title="Termix with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/home-assistant" title="HA with Docker 🐋 ↗" >}}
{{< /cards >}}


---

## Conclusions

After writing [about electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/) and the [electro-magnetic foundations](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/), this post was the next step.

What else am I running?

```sh
sudo docker compose -f 2604_docker-compose.yml up -d uptime....pihole nextcloud ncdb.......uptimekuma pocketbase termix lunalytics...littlyx jellyfin
```

* https://jellyfin.org/posts/state-of-the-fin-2026-01-06/
* https://github.com/jellyfin/jellyfin-desktop

I removed the services for my ebooks and consulting subdomains.

They are now...static!


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

And you have one IoT basics ebook waiting for you in there.
---

## FAQ

### HomeLab Tools I cant live w/o

For the CLI:

```sh
lazydocker
glances #htop btop
#sudo snap install ghostty --classic
#tmux
```


### Interesting Sensors

* https://sonoff.tech/en-pl/products/sonoff-snzb-02d-zigbee-lcd-smart-temperature-humidity-sensor


### One ESP - Few Sensors

For the **MLX90614**, it makes the most sense to use the **default I2C pins** on the ESP32. While the ESP32 is flexible and allows you to map I2C to almost any pin, using the defaults ensures that almost every library (like the Adafruit one) will work instantly without you having to write extra lines of code to "remap" the pins.

### The Best Choice: GPIO 21 and 22

On your 30-pin ESP-WROOM-32, these are labeled as **D21** and **D22**.

| MLX90614 Pin | ESP32 Pin (GPIO) | Label on Board |
| :--- | :--- | :--- |
| **SDA (Data)** | **GPIO 21** | **D21** |
| **SCL (Clock)** | **GPIO 22** | **D22** |
| **VCC** | **3V3** | **3.3V** |
| **GND** | **GND** | **GND** |

1.  **Hardware Support:** GPIO 21 and 22 are connected to the ESP32's internal I2C hardware peripheral. This means the chip handles the communication timing very efficiently.

2.  **No "Strapping" Conflicts:** Unlike GPIO 15 (which you asked about earlier) or GPIO 0, these pins don't affect how the ESP32 boots up. You can have the sensor plugged in while you upload code, and it won't cause any errors.

3.  **Library Compatibility:** Most code examples you find online for the MLX90614 will assume you are using 21 and 22. It saves you the headache of debugging "Sensor not found" errors.


Can you use the DHT11 and MLX90614 at the same time?

Absolutely! This is a very common setup.

Since they use different communication methods, they won't interfere with each other. 

Here is your "Master Plan" for wiring both:

| Sensor | Data Pin 1 | Data Pin 2 | Power |
| :--- | :--- | :--- | :--- |
| **DHT11** | **D4** (Digital) | *None* | 3.3V & GND |
| **MLX90614** | **D21** (SDA) | **D22** (SCL) | 3.3V & GND |

> **Pro Tip:** Since the ESP32 only has one `3V3` pin and a couple of `GND` pins, you might need a small **breadboard** to share the power and ground lines between the two sensors. 


---

Yes, that is exactly right! In fact, most **MLX90614 modules** (the GY-906 version) come with those 4 pins. 

The "extra" pins you might see on the bare sensor (which has 4 pins in a circle) are usually combined or simplified on the PCB module to make it easy to use with microcontrollers like your ESP32.

---

### Understanding the 4 Pins

Here is what each pin does and where it goes on your **ESP-WROOM-32**:

| Pin Label | Function | ESP32 Connection | Why? |
| :--- | :--- | :--- | :--- |
| **VIN** | Voltage In | **3V3** | Powers the sensor. Even if the module can handle 5V, 3.3V is safer for the ESP32. |
| **GND** | Ground | **GND** | Completes the electrical circuit. |
| **SCL** | Serial Clock | **D22 (GPIO 22)** | This is the "metronome" that keeps the data timing in sync. |
| **SDA** | Serial Data | **D21 (GPIO 21)** | This is the actual pipe where the temperature data travels. |



---

### Why 4 pins instead of 3 (like the DHT11)?

The DHT11 uses a custom **1-wire protocol** where the "clock" and "data" are mashed into a single wire. It’s simple, but a bit slow and error-prone.

The MLX90614 uses **I2C (Inter-Integrated Circuit)**. This requires two wires for data communication:
1.  **SDA:** Sends the actual bits of temperature data.
2.  **SCL:** Sends a steady pulse (the clock) so the ESP32 knows exactly when to "read" each bit on the SDA line.

This makes I2C much faster and more reliable than the DHT11's method. Plus, you can actually hook up **multiple different I2C sensors** to the same two pins (D21 and D22), and the ESP32 can talk to them individually using their "addresses."

---

### A Quick Tip for your ESP-WROOM-32

Since you are likely using a breadboard now to connect both sensors:
* **The "Power Rail":** Connect the ESP32's **3V3** pin to the red (+) rail on your breadboard and **GND** to the blue (-) rail. 
* **Shared Power:** Now you can just plug the VIN and GND from both the DHT11 and the MLX90614 into those rails.

Are you planning to port your Raspberry Pi Python code over to the ESP32, or are you looking to start fresh with a C++ (Arduino) sketch?