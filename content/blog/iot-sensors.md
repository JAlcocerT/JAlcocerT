---
title: "[IoT] Sensors x PCB x Gerber"
date: 2026-09-15
draft: false
tags: ["Polanduino x Arduino","Solar x DHT x MLX","RiscV","KiCad x Power Stage"]
description: Sensors for ESP32, a Raspberry Pi Pico W [Microcontrollers] or your Arduino.
url: 'iot-sensors-101'
---

**Tl;DR**

Isnt it time to build something real?

**Intro**

* WHY Im writting this post: *bc I need a recap and all [the BoM](#bom) that Id wish to have found years back to get started with IoT* 
* WHAT [Ive learnt](#conclusions) with it: *Ive ended up understanding why Mosfet GDS controlled with 3.3v is ok for my smaller pump, but not for the 20w one, also sent my [first pcb for manufacturing](#kicad-x-power-stage-pcb-design)*



## Home Automation

### Home Assistant

https://works-with.home-assistant.io/certified-products/

### DIY Custom HA

```sh
cd ./poc/
```

### Pi

A raspberry Pi inside a container - https://github.com/ptrsr/pi-ci

> A Raspberry **Pi emulator in a Docker image** that lets developers easily prepare and flash RPi configurations.


### IoT with a RPi4

### IoT with a PicoW

## IoT with Esp32

## IoT with Arduino

## IoT with RISC-V

{{< details title="AI Asisted Web Search... 📌" closed="true" >}}

**Arduino and Open-Source Principles**

- Arduino's hardware schematics and PCB layouts are open-source.
- The firmware and Arduino IDE are licensed permissively, fostering widespread community modification and distribution.
- This open stance has led to a vast ecosystem of compatible clones, embedded projects, and community innovations.

**RISC-V and Open-Source**

RISC-V, an open instruction set architecture (ISA), is also fully open. 

It was designed to be a free and open standard, allowing anyone to develop compatible chips, tools, and implementations without licensing fees. 

This openness aims to promote innovation and democratize access to processor design, similar to Arduino’s ethos in hardware and firmware.

**Similarities and Differences**

- Both Arduino and RISC-V embody open-source principles, but they operate in different layers of hardware design: **Arduino in microcontroller boards and firmware, RISC-V at the processor architecture level.**

- RISC-V's openness is in the ISA itself, encouraging a broad ecosystem of CPUs and chips, while Arduino’s openness is in the hardware and development tools for embedded devices.

- The recent Qualcomm-Arduino deal may impact Arduino's traditional open-source stance, especially if proprietary chips and closed support ecosystems become more prominent, whereas RISC-V remains fully open by design and community advocacy.

In summary, both Arduino's hardware/software and RISC-V are open-source principles, but with different scopes—Arduino in microcontroller hardware and software, and RISC-V in CPU architecture.

[1](https://www.jeffgeerling.com/blog/2025/qualcomms-buying-arduino-%E2%80%93-what-it-means-makers)

{{< /details >}}

> WIth open hardware, things like https://github.com/mfolejewski/Polanduino happen :)

> >  Polanduino - Arduino from Poland (RP2040 board) 

## Motivation for Arduino

Arduino + Acelerometer data in real time?

Wait.

People are doing... what?

Combining Blender + Arduino + Real Time Accelerometer Data: https://pabramsor.com/blender-and-arduino-accelerometer/

I have pending a post about Blender.

But what this guy created on that **article is simply fantastic**.

> See in real time where the arduino is moving rendered into blender https://github.com/Bardo91

> > Impressive that this was [done back in 2011](https://elescritoriodetesla.blogspot.com/2011/09/acelerometro-arduino-y-blender3d.html)


What?!

{{< youtube "ijX3CeVUTPh9yz7Z" >}}

We could use one of these for trackdays / karting and so on?

<!-- https://youtu.be/Cu7VlrpoVZY?si=ijX3CeVUTPh9yz7Z -->

<!-- 
arduino
https://www.youtube.com/watch?v=DPqiIzK97K0 -->

### PolanDuino

## Sensors Ive tried

### DHT11 and DHT22

These were really easy to setup and if you are getting started they are perfect.

### MLX

The MLX will get you ambient temp and IR temp of an object

### DS18B20

### a

The movement sensor


### b

Soil humidity!


---

## Conclusion


Interesting YT channels for IoT and sensors.

Tom Stanton - https://www.youtube.com/watch?v=6gchoHrsCp4 ~DIY

Also these: https://www.youtube.com/@homeassistant_facil/videos - https://www.youtube.com/@homeassistant_facil/videos


### **RISC-V open source arquitecture**


---

## FAQ


### Arduino x QCOM

Recently, arduino has been bought by QCOM.

Historically, Arduino has maintained a strong open-source philosophy for both its hardware and software.

The schematics, PCB designs, and core firmware for Arduino boards like the Uno, Mega, and others have been openly available, allowing manufacturers and hobbyists to create compatible clones or customize designs. 

The Arduino Integrated Development Environment (IDE) and associated libraries are also open-source, supporting collaborative development and community-driven improvements.

https://github.com/855princekumar/sense-hive

### Lora

<!-- 

RYLR 998, a blue chip equipped with a LoRa ultra-long-range modem, perfect for various hardware integrations including Raspberry Pi, Arduino, and ESP-32.

https://www.youtube.com/watch?v=9azEfCQNhSA

Takeaways

The Ryder 998 is a low-power, low-cost chip that can send messages over 12 miles without any infrastructure.
LoRa technology has the potential to disrupt the status quo of communication technology.
The Ryder 998 can be used in a variety of applications, including IoT, emergency response, and extreme outdoor activities.
The chip's low power consumption and versatility make it an attractive option for many industries. -->


### BoM

you can get cables with 3a/60w support

ToolBest Household RoleYour Clamp MeterHigh-Current AC Testing Hands-Free. Clamping over a live wire at your breaker panel to see how many Amps an induction hob, oven, heat pump, or EV charger is pulling without breaking the circuit.

`UT61E+` MultimeterPrecision Probing & Fault Finding. Measuring actual wall voltage, checking micro-currents, tracing broken wires, inspecting capacitors, and bench work (FPV & IoT).

For electronics you will be working a lot with DC.

Beyond the basic inventory with R,C, MOSFETs, Diodes, bread and perf/protoboards...

<!-- https://youtube.com/shorts/9hrpytHT5fs -->

{{< youtube "9hrpytHT5fs" >}}


<!-- https://youtube.com/shorts/M9cDkwMA-bo -->

{{< youtube "M9cDkwMA-bo" >}}


<!-- 
https://youtube.com/shorts/oxZVchAZV0U -->

{{< youtube "oxZVchAZV0U" >}}

Good easy replacements for the 20 W / 3S pack: to work instead of the 1N4007 (1A rated)                          
                                                                                                           
  - SS34 — 3 A, 40 V Schottky; a very good fit                                                             
  - 1N5822 — 3 A, 40 V Schottky; also good                                                                 
  - 1N5408 — 3 A, 1000 V conventional diode; workable, though Schottky is preferable  

You will probably need:

1. Get some buck converts to convert DC up to DC down: LM2596 or MP1584EN will do for ~10$/10units

<!-- https://youtube.com/shorts/k25uMBmTulA -->

{{< youtube "k25uMBmTulA" >}}

{{% details title="LM2596 or MP1584EN " closed="true" %}}

| Feature | LM2596 (Previous Blue Module) | MP1584EN (Current Green Module) |
| --- | --- | --- |
| **Size** | Bulky | Very compact |
| **Efficiency & Tech** | Older (150 kHz switching) | Modern & more efficient (1.5 MHz) |
| **Adjustment Dial** | Multi-turn pot (easy to dial in precisely) | Single-turn pot (extremely twitchy) |
| **Max Input** | ~40V | ~28V |

For the LM256 the brass slotted screw on top of the blue trimmer.

Use a precision flathead screwdriver to turn it while your multimeter probes are on **OUT+** and **OUT-**:

* Turn **counter-clockwise** to decrease the output voltage.
* Turn **clockwise** to increase it.

Because this is a multi-turn trimmer (typically 25 turns), you often have to rotate it **10 to 15 full turns counter-clockwise** before the output voltage starts dropping from the input level.

Once it enters the active range, small turns will make fine adjustments.

{{% /details %}} 

2. For powering: you can make an [overkill with a bluetti](https://youtube.com/shorts/1nK0-MDh7LY) and a [DC connector](https://youtube.com/shorts/HwavCMkah0o), or get [some 18650 batteries](https://youtube.com/shorts/_msLOGVlX-I) 

with a TP4056 for a 1s setup

{{< youtube "WAKNiSjsrOw" >}}
<!-- https://youtube.com/shorts/WAKNiSjsrOw -->

See how the data has been flowing for a while:

```sh
#cd ./poc/iot-rpi-dht-insulation
sqlite3 /home/jalcocert/poc/iot-rpi-dht-insulation/ingester/data/readings.sqlite "
SELECT 
  date(received_at) AS day,
  ROUND(AVG(CASE WHEN device = 'esp32' AND metric = 'humidity' THEN value END), 2) AS esp_humidity,
  ROUND(AVG(CASE WHEN device = 'esp32' AND metric = 'temperature' THEN value END), 2) AS esp_temp,
  ROUND(AVG(CASE WHEN device = 'pico' AND metric = 'humidity' THEN value END), 2) AS pico_humidity,
  ROUND(AVG(CASE WHEN device = 'pico' AND metric = 'temperature' THEN value END), 2) AS pico_temp,
  COUNT(*) AS total_readings
FROM readings 
WHERE device IN ('esp32', 'pico') 
  AND metric IN ('humidity', 'temperature')
GROUP BY day 
ORDER BY day;"
```


or with a **BMS for the 3s** to avoid them to be used below their operating voltage

{{< youtube "W4AZVNudnyQ" >}}

<!-- https://youtube.com/shorts/W4AZVNudnyQ -->


{{% details title="Tp4056 vs BMS vs Shield " closed="true" %}}

| Feature / Board | **18650 Battery Shield V3** (Your black board) | **Standard TP4056 Module** (With protection) | **3S–5S 100A BMS** (Your large green board) |
| --- | --- | --- | --- |
| **Cell Configuration** | 1S (1 cell, 3.7V nominal) | 1S (1 cell, 3.7V nominal) | 3S, 4S, or 5S (configurable multi-cell) |
| **Output Voltages** | Regulated **5V** (USB & pins) and **3V** pins | Direct battery voltage (~3.0V – 4.2V) | Raw pack voltage (~9.0V – 12.6V in 3S) |
| **Max Continuous Current** | ~1A – 2A (5V boosted rail) | ~1A – 3A (limited by protection chip) | 60A – 100A |
| **Built-in Charging** | Yes (Micro-USB / 5V input, ~0.5A charge) | Yes (Micro/Type-C, adjustable up to 1A) | No (Requires external CC/CV 12.6V charger) |
| **Primary Use Case** | Low-power 5V/3.3V boards (ESP32, Arduino) | 1S DIY power banks, single-cell sensors | Power tools, heavy inverters, 12V motors |
| **Pros** | • All-in-one (holder, charger, boost, protection)<br>

<br>• Direct plug-and-play 5V output for ESP32<br>

<br>• Works directly with a 5V solar panel | • Tiny footprint and very cheap<br>

<br>• Extremely low idle parasitic draw<br>

<br>• Easy to integrate into custom enclosures | • Handles massive current & high motor startup spikes<br>

<br>• Active cell balance monitoring across series cells<br>

<br>• Heavy copper pads for thick wiring |
| **Cons** | • Zero reverse polarity protection (burns instantly)<br>

<br>• Boost circuit wastes ~10–15% efficiency<br>

<br>• Cannot drive 12V loads (like your pump) | • No 5V boost (needs external step-up for 5V)<br>

<br>• Requires separate battery holder / soldering<br>

<br>• Cannot handle 12V loads | • No built-in charger circuit<br>

<br>• High idle standby drain for small projects<br>

<br>• Physical overkill and tricky 3S pin-jumping |

{{% /details %}} 

### Sensors

<!-- 
https://youtube.com/shorts/lJm9zmdMi1I 
-->

{{< youtube "lJm9zmdMi1I" >}}




#### MLX90614 GY-906 - IR

* https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/

The MLX90614 GY-906 is an **infrared (IR) temperature sensor** module commonly used for non-contact temperature measurements.

It's also known as a pyrometer or non-contact thermometer.

This sensor is produced by Melexis and can measure the temperature of an object without making physical contact with it, which makes it useful in various applications.

{{% details title="More about the MLX90614 " closed="true" %}}

Working Principle: The sensor measures the infrared radiation emitted by an object to determine its temperature.

All objects emit thermal radiation based on their temperature, and this radiation falls within the infrared spectrum. 

The sensor detects this radiation and converts it into an electrical signal that can be used to calculate the object's temperature.

Accuracy and Range: The MLX90614 GY-906 sensor can offer a relatively high level of accuracy for non-contact temperature measurements. 

It has a wide temperature measurement range, typically spanning from **-70°C to 380°C** (-94°F to 716°F), depending on the specific model and calibration.

Two Sensors in One: The sensor actually contains two separate sensors within a single package: one to measure the temperature of the object being measured (object temperature) and another to measure the temperature of the sensor itself (ambient temperature). 

This dual-sensor setup helps improve accuracy, as it compensates for changes in the sensor's ambient temperature.

{{% /details %}} 

Communication Interface: The MLX90614 GY-906 sensor can communicate with microcontrollers or other devices using the **I2C (Inter-Integrated Circuit) communication protocol**. 

This makes it relatively easy to integrate the sensor into various projects and systems.

It already has a built-in 3.3V voltage stabilizer and pull-up resistors of the I2c bus to be powered by 4.7 kΩ resistors. 

We also know that the ranges of measured temperatures are: -40°C…85°C for the ambient temperature and -40°C…380°C for the temperature of the tested object. 

The module has a measurement accuracy of 0.5°C for the measurement range To=0°C…60°C ( object temperature ), Ta=0°C…50°C ( surrounding temperature ) with a resolution of 0.2°C. 

The largest measurement error we will encounter is ±4°C, but for very high temperatures.

{{% details title="MLX90614 Python, Influx and grafana " closed="true" %}}

<https://www.youtube.com/watch?v=CftxT8k0jww&t=5s>

* <https://raw.githubusercontent.com/STJRush/handycode/master/ALT4%20Sensors%20Inputs%20Outputs/Raspberry%20PI%20Sensors/MLX90614%20Infrared%20Thermal%20Sensor/MLX90614_Therm_Sensor.py>


Vin to 3.3V - 
GND to gnd
SCL to GPIO3 (SCL)
SDA to GPIO2 (SDA)

```sh
sudo raspi-config
interfacing options
enable I2C

reboot

i2cdetect -y 1
```

you should see something different than -- in at least one of the buckets.

Install Adafruit-blinka <https://pypi.org/project/Adafruit-Blinka/>
and also: adafruit-circuitpython-mlx90614 <https://pypi.org/project/adafruit-circuitpython-mlx90614/>


```py
# This is the code to run the MLX90614 Infrared Thermal Sensor
# You'll need to import the package "Adafruit Blinka"
# You'll need to import the package "adafruit-circuitpython-mlx90614/"
# You'll need to enable i2c on the pi https://pimylifeup.com/raspberry-pi-i2c/
# Reboot after enabling i2C
# Sensor is connected to 3.3V, GND and the i2C pins 3(SDA) and 5(SCL)

import board
import busio as io
import adafruit_mlx90614

from time import sleep

i2c = io.I2C(board.SCL, board.SDA, frequency=100000)
mlx = adafruit_mlx90614.MLX90614(i2c)

ambientTemp = "{:.2f}".format(mlx.ambient_temperature)
targetTemp = "{:.2f}".format(mlx.object_temperature)

sleep(1)

print("Ambient Temperature:", ambientTemp, "°C")
print("Target Temperature:", targetTemp,"°C")
```


**to run inside the container**

```yml

version: '3.8'

services:
  mlx_rpi:
    image: mlx_sensor_app_influxdb
    privileged: true
    command: tail -f /dev/null #keep it running
```




```dockerfile
# Use an official Python runtime as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y python3-dev python3-pip && \
    python3 -m pip install --upgrade pip setuptools wheel

# Copy the local code to the container
COPY mlx.py /app/

# Install additional dependencies
RUN pip install board adafruit-circuitpython-mlx90614 Adafruit-Blinka RPi.GPIO influxdb

# Run the Python script
CMD ["python", "mlx.py"]
```


When saved, just run: 

```sh
docker build -t mlx_sensor_app_influxdb .
```

```yml
version: '3.8'

services:
  my_python_dev_container:
    image: mlx_sensor_app_influxdb #python:3.10
    privileged: true
    command: tail -f /dev/null #keep it running
```

I have tagged and uploaded it to my DockerHub so that it works with InfluxDB:

docker tag mlx_sensor_to_influxdb docker.io/fossengineer/iot:mlx_sensor_to_influxdb

docker push docker.io/fossengineer/iot:mlx_sensor_to_influxdb

Check it at <https://hub.docker.com/repository/docker/fossengineer/iot/general>


Try that it works with:


```py
import board
import busio as io
import adafruit_mlx90614
from influxdb import InfluxDBClient
from time import sleep, strftime

i2c = io.I2C(board.SCL, board.SDA, frequency=100000)
mlx = adafruit_mlx90614.MLX90614(i2c)

# Configure InfluxDB connection
influx_client = InfluxDBClient(host='influxdb', port=8086)

# Try to create the database, or use it if it already exists
database_name = 'sensor_data'
existing_databases = influx_client.get_list_database()

if {'name': database_name} not in existing_databases:
    influx_client.create_database(database_name)
    print(f"Database '{database_name}' created.")

influx_client.switch_database(database_name)

while True:
    ambientTemp = mlx.ambient_temperature
    targetTemp = mlx.object_temperature

    if ambientTemp is not None and targetTemp is not None:
        data = [
            {
                "measurement": "mlx_sensor",
                "tags": {},
                "time": strftime('%Y-%m-%dT%H:%M:%SZ'),
                "fields": {
                    "ambient_temperature": ambientTemp,
                    "target_temperature": targetTemp
                }
            }
        ]
        influx_client.write_points(data)
        print("Ambient Temperature:", ambientTemp, "°C")
        print("Target Temperature:", targetTemp,"°C")
        print("Data sent to InfluxDB")
    else:
        print("Sensor failure. Check wiring.")
    
    sleep(1)
```

```yml
version: '3'
services:
  mlx_sensor:
    image: mlx_sensor_to_influxdb
    container_name: mlx_sensor_app
    privileged: true
    #command: tail -f /dev/null #keep it running for testing
    dns:
      - 8.8.8.8
      - 8.8.4.4    
    depends_on:
      - influxdb

  influxdb:
    image: influxdb:1.8 #for arm32
    container_name: influxdb
    ports:
      - "8086:8086"
    volumes:
      - influxdb_data:/var/lib/influxdb
    environment:
      - INFLUXDB_DB=sensor_data
      - INFLUXDB_ADMIN_USER=admin
      - INFLUXDB_ADMIN_PASSWORD=mysecretpassword

  grafana:
    image: grafana/grafana:9.5.7 #was using this one instead of latest for stability
    container_name: grafana3
    ports:
      - "3000:3000"
    depends_on:
      - influxdb
    volumes:
      - grafana_data:/var/lib/grafana  # Add this line to specify the volume
    dns:
      - 8.8.8.8
      - 8.8.4.4   

volumes:
  influxdb_data:
  grafana_data:  # Define the volume for Grafana


```


```py
import board
import busio as io
import adafruit_mlx90614
from influxdb import InfluxDBClient
from time import sleep, strftime
import os  # Import the os module

i2c = io.I2C(board.SCL, board.SDA, frequency=100000)
mlx = adafruit_mlx90614.MLX90614(i2c)

# Get values from environment variables (with default values if not set)
INFLUX_HOST = os.environ.get('INFLUX_HOST', 'influxdb')
INFLUX_PORT = int(os.environ.get('INFLUX_PORT', 8086))
DATABASE_NAME = os.environ.get('DATABASE_NAME', 'sensor_data')
MEASUREMENT = os.environ.get('MEASUREMENT', 'mlx_sensor')
SLEEP_TIME = int(os.environ.get('SLEEP_TIME', 1))

# Configure InfluxDB connection
influx_client = InfluxDBClient(host=INFLUX_HOST, port=INFLUX_PORT)

# Try to create the database, or use it if it already exists
existing_databases = influx_client.get_list_database()

if {'name': DATABASE_NAME} not in existing_databases:
    influx_client.create_database(DATABASE_NAME)
    print(f"Database '{DATABASE_NAME}' created.")

influx_client.switch_database(DATABASE_NAME)

while True:
    ambientTemp = mlx.ambient_temperature
    targetTemp = mlx.object_temperature

    if ambientTemp is not None and targetTemp is not None:
        data = [
            {
                "measurement": MEASUREMENT,
                "tags": {},
                "time": strftime('%Y-%m-%dT%H:%M:%SZ'),
                "fields": {
                    "ambient_temperature": ambientTemp,
                    "target_temperature": targetTemp
                }
            }
        ]
        influx_client.write_points(data)
        print("Ambient Temperature:", ambientTemp, "°C")
        print("Target Temperature:", targetTemp,"°C")
        print("Data sent to InfluxDB")
    else:
        print("Sensor failure. Check wiring.")
    
    sleep(SLEEP_TIME)

```


**Locally you will do:**

```yml
version: '3'
services:
  mlx_sensor:
    image: mlx_sensor_to_influxdb
    container_name: mlx_sensor_app
    privileged: true
    #command: tail -f /dev/null #keep it running for testing
    dns:
      - 8.8.8.8
      - 8.8.4.4    
    depends_on:
      - influxdb
    environment:
      - INFLUX_HOST=reisikei.duckdns.org
      - INFLUX_PORT=8086
      - DATABASE_NAME=sensor_data
      - MEASUREMENT=mlx_sensor_sec
      - SLEEP_TIME=1

  influxdb:
    image: influxdb:1.8 #for arm32
    container_name: influxdb
    ports:
      - "8086:8086"
    volumes:
      - influxdb_data:/var/lib/influxdb
    environment:
      - INFLUXDB_DB=sensor_data
      - INFLUXDB_ADMIN_USER=admin
      - INFLUXDB_ADMIN_PASSWORD=mysecretpassword


  grafana:
    image: grafana/grafana:9.5.7 #was using this one instead of latest for stability
    container_name: grafana3
    ports:
      - "3000:3000"
    depends_on:
      - influxdb
    volumes:
      - grafana_data:/var/lib/grafana  # Add this line to specify the volume
    dns:
      - 8.8.8.8
      - 8.8.4.4   

volumes:
  influxdb_data:
  grafana_data:  # Define the volume for Grafana
```

> Grafana can connect to: `http://influxdb:8086` or to `http://yoursubdomain.duckdns.org:8086` *if you included the DNS in the stack*

Go to the Influx container and then:

```sh
Influx
USE sensor_data
show measurements
SELECT * FROM mlx_sensor #this is the measurement where we are pushing this data
```


I tested this with DuckDNS: `http://reisipi.duckdns.org` pinting to `http://192.168.3.101:8086`


**and using influxdb in the cloud**


<https://www.influxdata.com/influxdb-cloud-pricing/>

USD 0.002
/mebibyte

> versus GCP E2 small That's about $0.02 hourly


```yml
version: '3'
services:
  mlx_sensor:
    image: mlx_sensor_app_influxdb
    container_name: mlx_sensor_app
    privileged: true
    dns:
      - 8.8.8.8
      - 8.8.4.4
    # depends_on: #make sure influxdb its ready
    #   - influxdb
    environment:
      - INFLUX_HOST=reisikei.duckdns.org
      - INFLUX_PORT=8086
      - DATABASE_NAME=sensor_data
      - MEASUREMENT=mlx_sensor_sec
      - SLEEP_TIME=1
    #command: tail -f /dev/null #keep it running for testing
    restart: unless-stopped      


  grafana:
    image: grafana/grafana:9.5.7 #was using this one instead of latest for stability
    container_name: grafana3
    ports:
      - "3000:3000"
    depends_on:
      - influxdb
    volumes:
      - grafana_data:/var/lib/grafana  # Add this line to specify the volume
    dns:
      - 8.8.8.8
      - 8.8.4.4
    restart: unless-stopped      


volumes:
  grafana_data:  # Define the volume for Grafana
```


**in GCP** i was running portainer, influxdb and duckdns
remember that you will need a firewall rule for the TCP port 8086 (influxDB)


Adding [nginx](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/) and [duckdns](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/#https-locally-nginx--duckdns)


{{% /details %}} 

### KiCad x Power Stage PCB Design

Coming from this [high level overview of the watering design](https://jalcocert.github.io/JAlcocerT/home-lab-tools-for-iot/#esp32-x-water-pump).

Yep, the one that [could become a product](https://jalcocert.github.io/JAlcocerT/home-lab-tools-for-iot/#could-this-be-a-product)

Its about time to remove some of [the cables at my table](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-101/components.json)

<!-- 
https://youtube.com/shorts/1tAaPIVKSoM -->

{{< youtube "1tAaPIVKSoM" >}}

{{< youtube "1tAaPIVKSoM" >}}

{{< youtube "ijX3CeVUTPh9yz7Z" >}}


I got [a PRD](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-101/prd.md) and some instructions / [concerns](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-101/concerns2.md) of what i need to get a cleaner power stage prototype for the watering setup:

```sh
#choco install kicad
winget install --id KiCad.KiCad --exact --source winget  
```

Placed here [all the kicad learnings](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-101/z-learnings.md) to generate the gerber files for production

#### My First PCB

For [my first order](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-101/order-1.md) which ended up being [this one](https://github.com/JAlcocerT/poc/tree/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-104/fabrication-release-r2-staging-20260915)

Got to know about these

* Satland `https://www.prototypy.com/t/61,Home`
* Tecno service `https://tspcb.pl/en/order-inquiry/`
* Aisler, JLCPCB / PCBWay...


When ordering bare boards (no assembly required), compress these files into a single .zip:

*.GTL / *.GBL (Top and Bottom Copper)

*.GTS / *.GBS (Top and Bottom Solder Mask)

*.GTO / *.GBO (Top and Bottom Silkscreen)

*.GM1 or *.GKO / *-Edge_Cuts.gbr (Board Outline)

*.DRL / *-PTH.drl, *-NPTH.drl (Excellon Drill files)

Standard specs to select in their order forms: 2 Layers, 1.6 mm thickness, FR4, 1 oz (35 µm) copper, HASL lead-free (or ENIG gold), and green mask with white silkscreen.



{{< callout type="warning" >}}
I got another agent's second opinion on the PCB design before manufacturing
{{< /callout >}}

DRC means Design Rules Check. KiCad examines the board for problems such as:                        
                                                                                                    
- copper tracks too close together                                                                  
- tracks not connected to pads                                                                      
- overlapping objects                                                                               
- copper too close to the board edge
- silkscreen printed over pads
- missing or invalid board outline       

A summary of [the order](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-104/order-104.md), with [clarifications](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-104/z-clarification.md) and [assumptions](https://github.com/JAlcocerT/poc/blob/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-104/z-assumptions.md):

Before submitting, confirm the uploaded project  
name is power-stage-104-fabrication-release-r2-2026-09-   
15.zip and the form still shows:                          
                                                          
- 65 × 45 mm                                              
- 2 layers                                                
- 1.55 mm FR-4 / TG135                                    
- 35 µm copper                                            
- lead-free HASL                                          
- green mask both sides                                   
- front white silkscreen, back without                    
- routing only                                            
- bare PCB, quantity 3 

> One board was 45 euros, 3 63 euros


### Electronics Simulations

{{< youtube "nwK4nr8uqpo" >}}

<!-- https://youtube.com/shorts/nwK4nr8uqpo -->

{{< details title="Measure & Simulate like so before buying the Diode Resistors and Mosfet  📌"closed="true" >}}

```sh
git clone 
```

{{< /details >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditionRemorion" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}


## IoT - LangChain x PG

This is coming up as some shape of tech talk this year.

And will be using a db2rest setup finally, to avoid the complexities of pulling life data from pgsql to a slidev component


### What it is esp home

https://github.com/espressif/esptool

## What it is tasmota

https://github.com/arendst/Tasmota

https://github.com/tasmota/tasmotizer