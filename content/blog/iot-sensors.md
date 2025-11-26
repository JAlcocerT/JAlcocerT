---
title: "[IoT] Sensors and Arduino"
date: 2025-12-05
draft: false
tags: ["Tinkering","Polanduino","DHT","MLX","Robotics"]
description: Sensors for ESP32, a Raspberry Pi Pico W [Microcontrollers] or your Arduino.
url: 'iot-sensors-101'
---


**Tl;DR**


**Intro**

Recently, arduino has been bought by QCOM.

Historically, Arduino has maintained a strong open-source philosophy for both its hardware and software.

The schematics, PCB designs, and core firmware for Arduino boards like the Uno, Mega, and others have been openly available, allowing manufacturers and hobbyists to create compatible clones or customize designs. 

The Arduino Integrated Development Environment (IDE) and associated libraries are also open-source, supporting collaborative development and community-driven improvements.

{{< details title="AI Asisted Web Search... 📌" closed="true" >}}


**Arduino and Open-Source Principles**

- Arduino's hardware schematics and PCB layouts are open-source.
- The firmware and Arduino IDE are licensed permissively, fostering widespread community modification and distribution.
- This open stance has led to a vast ecosystem of compatible clones, embedded projects, and community innovations.[1]

**RISC-V and Open-Source**

RISC-V, an open instruction set architecture (ISA), is also fully open. It was designed to be a free and open standard, allowing anyone to develop compatible chips, tools, and implementations without licensing fees. 

This openness aims to promote innovation and democratize access to processor design, similar to Arduino’s ethos in hardware and firmware.[2]

**Similarities and Differences**

- Both Arduino and RISC-V embody open-source principles, but they operate in different layers of hardware design: **Arduino in microcontroller boards and firmware, RISC-V at the processor architecture level.**
- RISC-V's openness is in the ISA itself, encouraging a broad ecosystem of CPUs and chips, while Arduino’s openness is in the hardware and development tools for embedded devices.
- The recent Qualcomm-Arduino deal may impact Arduino's traditional open-source stance, especially if proprietary chips and closed support ecosystems become more prominent, whereas RISC-V remains fully open by design and community advocacy.[3]

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

But what this guy created on that article is simply fantastic.

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


---

## Conclusion


Interesting YT channels for IoT and sensors.

Tom Stanton - https://www.youtube.com/watch?v=6gchoHrsCp4 ~DIY

Also these: https://www.youtube.com/@homeassistant_facil/videos - https://www.youtube.com/@homeassistant_facil/videos


### **RISC-V open source arquitecture**


### Linux and Robotics?

* https://github.com/ahundt/awesome-robotics

<!-- https://www.youtube.com/watch?v=-JVHvU3Oor8 -->

{{< youtube "-JVHvU3Oor8" >}}

---

## FAQ

### Sensors



#### MLX90614 GY-906 - IR

The MLX90614 GY-906 is an **infrared (IR) temperature sensor** module commonly used for non-contact temperature measurements.

It's also known as a pyrometer or non-contact thermometer.

This sensor is produced by Melexis and can measure the temperature of an object without making physical contact with it, which makes it useful in various applications.

{{% details title="More about the MLX90614 " closed="true" %}}


Working Principle: The sensor measures the infrared radiation emitted by an object to determine its temperature. All objects emit thermal radiation based on their temperature, and this radiation falls within the infrared spectrum. 

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

The module has a measurement accuracy of 0.5°C for the measurement range To=0°C…60°C ( object temperature ), Ta=0°C…50°C ( surrounding temperature ) with a resolution of 0.2°C. The largest measurement error we will encounter is ±4°C, but for very high temperatures.

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