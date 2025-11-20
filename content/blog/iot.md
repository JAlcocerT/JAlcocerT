---
title: "[IoT] Meets AI. AIoT with a Raspberry Pi."
date: 2025-11-29
draft: false
tags: ["Tinkering","DB2Rest","TelemetryHarbor","IoT ebook","From obfuscaste towards 1toN eBooks"]
description: 'IoT Meets AI. Using MQTT and AI Together.'
url: 'just-iot'
---

IOT -> TASMOTA

https://siytek.com/what-is-tasmota-an-introduction-to-the-cloud-free-smart-home/

https://acurast.com/

**TL;DR:** Putting together some ~2year old scripts that I made for the Pi/PicoW/ESP32 with their associated projects

+++ DB2Rest

* https://telemetryharbor.com/?ref=selfh.st
* https://docs.telemetryharbor.com/docs/Integrations/home-assistant/

**Intro**

I saw this post coming up next and inmediately thought that I should put an IoT related ebook after this.

Specially after the learnings of the [Obfuscator project](https://github.com/JAlcocerT/obfuscate), where I merged the source code of serving an ebook via FastAPI to the one of rendering the PDF via R.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/1toN-ebooks" title="NEW - 1 WebApp to n eBooks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code a Web App to serve md content via web ebook and also downlodable as PDFs" >}}
{{< /cards >}}

Expect ,n' to be:

1. Webpage creator: Because you can own your brand
2. Homelabs: I started this ebook because everything has potential failures
3. IoT: This is the one I want to put together as I write this post :)

This time, adding bring more languages for the ebooks is on the table. Locale i18n!

In the end of the day, its been alrady 150+ posts this year (totally unexpected).

So a distilled version with less noise, less chaos and more ordered for others to get value from.

I need more of:

![Cal.com stripe integration for booking a meeting](/blog_img/email/cal-email-stripe.png)


## Hardware and Projects


* Raspberry Pi

1. Pushing sensor data to ES via Python
2. Pushing sensor DB18B20 to TimeScale via Python

* Raspberry Pico W
  * https://picow.pinout.xyz/

* ESP 32
  * https://esp32c3.pinout.xyz/

### Raspberry Pi

#### Python x Elastic Search

Python can push data to Elasticsearch. 

Elasticsearch is a popular open-source search and analytics engine that is often used for storing, searching, and analyzing large volumes of data in real-time. 

It is designed to handle various types of structured and unstructured data, making it useful for a wide range of applications, including log and event data analysis, full-text search, and more.

To push data to Elasticsearch from Python, you can use the official Elasticsearch Python client library, which provides a convenient way to interact with Elasticsearch from your Python code.


{{< details title="DHT - Temp & Humidity with Kibana 📌" closed="true" >}}

[ES Container supports RPi 64](https://hub.docker.com/_/elasticsearch) by default, but thanks to [alinjie](https://github.com/alinjie/elasticsearch-docker-armv7/blob/main/Dockerfile), also ARM32 

> For [Kibana container](https://hub.docker.com/_/kibana/tags?page=7) - See <https://github.com/jamesgarside/kibana-arm>

<https://www.youtube.com/watch?v=x5A5S0hoyJ0&t=211s>

```dockerfile
FROM arm32v7/openjdk:11-jdk

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199#23
RUN apt update && apt install wget -y
RUN wget -O /tmp/elasticsearch.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.12.1-no-jdk-linux-x86_64.tar.gz
RUN mkdir /usr/share/elasticsearch
RUN tar -xf /tmp/elasticsearch.tar.gz -C /usr/share/elasticsearch --strip-components=1
RUN adduser --disabled-password --gecos '' elastic
RUN chown -R elastic:root /usr/share/elasticsearch && chmod -R 777 /usr/share/elasticsearch
USER elastic
ENV ES_JAVA_HOME=${JAVA_HOME}
EXPOSE 9200 9300
CMD [ "bash", "/usr/share/elasticsearch/bin/elasticsearch" ]

```sh
docker build -t elasticsearch_local .
```


```python
import Adafruit_DHT
import time
from elasticsearch import Elasticsearch

DHT_SENSOR = Adafruit_DHT.DHT11
DHT_PIN = 4

# Configure Elasticsearch connection
es = Elasticsearch(hosts=['http://localhost:9200'])  # Replace with your Elasticsearch host

# Define the index mapping (optional but recommended)
index_name = "sensor_data"  # Replace with your desired index name

mapping = {
    "mappings": {
        "properties": {
            "temperature": {"type": "float"},
            "humidity": {"type": "float"},
            "timestamp": {"type": "date"}
        }
    }
}

# Create the index with the specified mapping
es.indices.create(index=index_name, ignore=400, body=mapping)

print(f"Index '{index_name}' created.")


while True:
    humidity, temperature = Adafruit_DHT.read(DHT_SENSOR, DHT_PIN)
    if humidity is not None and temperature is not None:
        data = {
            "temperature": temperature,
            "humidity": humidity,
            "timestamp": int(time.time()) * 1000  # Elasticsearch expects timestamp in milliseconds
        }

        index_name = "sensor_data"  # Replace with your desired index name
        es.index(index=index_name, body=data)
        print("Data sent to Elasticsearch")
    else:
        print("Sensor failure. Check wiring.")
    time.sleep(3)

```


```dockerfile
# Use an official Python runtime as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y python3-dev python3-pip libpq-dev gcc && \
    python3 -m pip install --upgrade pip setuptools wheel

# Copy the local code to the container
COPY your_modified_python_script.py /app/

# Install additional dependencies
RUN pip install Adafruit_DHT elasticsearch

# Run the Python script
CMD ["python", "your_modified_python_script.py"]

```

```sh
docker build -t dht_sensor_es .
```

The stack:

```yml
version: '3'
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.15.0
    container_name: elasticsearch_container
    environment:
      - "discovery.type=single-node"
    ports:
      - "9200:9200"
    networks:
      - app_network

  kibana:
    image: docker.elastic.co/kibana/kibana:7.15.0
    container_name: kibana_container
    environment:
      - "ELASTICSEARCH_HOSTS=http://elasticsearch:9200"  # Connect Kibana to Elasticsearch
    ports:
      - "5601:5601"
    depends_on:
      - elasticsearch
    networks:
      - app_network

  dht_sensor_timescale:
    image: dht_sensor_es # Use your pre-built image name
    container_name: dht_sensor_es_container
    privileged: true  # Run the container in privileged mode (GPIO access)
    depends_on:
      - elasticsearch
    networks:
      - app_network      

networks:
  app_network:

```


{{< /details >}}



#### Py x TimeScaleDB


I made this small projec tiwh the **DS18B20 sensor**

> But it can work also with the DHT11

The DS18B20 can detect: -55 to 125 Celsius

* Connection:
  * Black cable - gnd
  * Red - 3.3 to 5v
  * Yellow - data --> to pin 7
  * It needs a resistor. A 4.7K Ohm Resistor (Colour Code: Yellow Purple Red Gold)
    * or 4.7k/10k resistor between data and 3.3v


* These videos were of great help to me:

  * <https://www.youtube.com/watch?v=wDdJ6stXQi0&t=10s>
  * <https://bigl.es/ds18b20-temperature-sensor-with-python-raspberry-pi/>



**RPi 1-wire must be enabled!!!**

connect the wiring and go to /sys/bus/w1/devices and find the folder with the serial number, then select the w1_slave file

the file should contain a YES in the first line.

The video from ReefSpy helped me a lot with the initial setup :<https://www.youtube.com/watch?v=76CD_waImoA>

And also to get the general idea of the Python code that can be used.

Execute it with: `python3 dsb-read.py`


I also included a Dockerfile, so you can `docker build -t dsb_to_timescale`

There is a Stack ready to run the Python script and push the data to timescale - all in Docker containers:

I have tagged and uploaded it to my DockerHub so that it works with timescaleDB:

```sh
docker tag dsb_to_timescale docker.io/fossengineer/iot:dsb_sensor_to_timescale

docker push docker.io/fossengineer/iot:dsb_sensor_to_timescale
```

> Check it at https://hub.docker.com/repository/docker/fossengineer/iot/general


```sh
docker run -it --rm --network=dsbtimescale_dsb_network postgres psql -h timescaledb_dsb_container -U myuser -d mydb --username=myuser

\l

psql -U myuser -d mydb

\d
```

```sql
SELECT * FROM ds18b20_sensor;
SELECT MAX(temperature) FROM ds18b20_sensor;
SELECT * FROM ds18b20_sensor ORDER BY time DESC LIMIT 1;
```




<!-- 
blackc able - gnd
red - 3.3 to 5v
yellow - data --> to pin 7

It needs a resistor. A 4.7K Ohm Resistor (Colour Code: Yellow Purple Red Gold)



<https://www.youtube.com/watch?v=wDdJ6stXQi0&t=10s>
<https://bigl.es/ds18b20-temperature-sensor-with-python-raspberry-pi/>

or 4.7k 10k resistor between data and 3.3v

<https://www.youtube.com/watch?v=iqImMHMXRSw>

---

## Conclusions

With this post, I pretend to 


As I plan to write about less new things next year, but gain depth:

```sh
find content/blog -name '*.md' -print0 |
xargs -0 awk '
  FNR==1 { post_date=""; printed=0 }

  /^date:/ && !printed {
    gsub(/^date:[[:space:]]*/, "", $0)
    post_date = substr($0, 1, 10)
    if (post_date > "2025-12-01") {
      print FILENAME ": " post_date
      printed=1
      count++
    }
  }

  END {
    print "TOTAL:", count
  }
'
```

As of now I have 'just' planned 33 posts for JAlcocerT for the rest of 2025/2026.

## FAQ

### Languages

C/C++
MicroPython
TinyGo (?)
CircuitPython (?)

O.S FreeRTS ??? <https://www.youtube.com/watch?v=5pUY7xVE2gU>




### Sensors

#### BME680 - Air Quality

#### BME280

Temp Hum and Preassure

I2C

<!-- <https://www.youtube.com/watch?v=GQOqvvei5Do> -->

{{< youtube "GQOqvvei5Do" >}}


#### DHT22 Pico

A temperature and humidity sensor.

{{< youtube "eNF3X3D0cH4" >}}

<!-- 
https://www.youtube.com/watch?v=eNF3X3D0cH4 -->

* https://github.com/neeraj95575/Temperature-sensor-connect-to-raspberry-pi-pico


#### MPU6050

There are many 3-axis accelerometers that you can use with the Raspberry Pi Pico.

MPU-6050: is a popular and versatile accelerometer that is also compatible with the Raspberry Pi Pico.

It has a wide range of features, including a built-in gyroscope.


This video from **biblioman09** was useful to me:
<!-- 
<https://www.youtube.com/watch?v=JXyHuZyqjxU> -->

{{< youtube "JXyHuZyqjxU" >}}


#### KY-008

Laser Transmitter Module Overview

- **Remote Signaling**: Use the laser to send signals to a receiver module for remote controls or presence detection.
- **Line Following**: Implement in robots to follow a laser-drawn path.
- **Distance Measurement**: Measure distances by timing the laser reflection from objects.
- **Obstacle Avoidance**: Detect and navigate around obstacles using the laser.
- **Security Systems**: Set up alarms that trigger if the laser path is interrupted.

Usage Considerations:
- **Safety**: The laser can harm eyes; avoid direct exposure.
- **Environment**: Operate in dim environments to minimize interference from sunlight or other bright lights.
- **Alignment**: Ensure the path of the laser beam is clear of obstructions.
- **Adjustability**: Modify beam intensity using the onboard resistor.

Connecting KY-008 to Raspberry Pi Pico

- **Power Requirements**: KY-008 operates with 5V, compatible with Pico’s 5V output.
- **Connection**:
  - `VCC` on KY-008 to `5V` on Pico
  - `GND` on KY-008 to `GND` on Pico




<https://www.youtube.com/watch?v=KX_-MPOJNXY>


The KY-008 is a laser transmitter module emitting a red laser beam, suitable for various projects.

**Applications:**

* **Remote Signaling:** Transmit signals to a receiver for remote control or object detection.
* **Line Following:** Guide robots along a laser beam path.
* **Distance Measurement:** Calculate distance based on laser reflection time.
* **Obstacle Avoidance:** Detect and avoid obstacles using the laser beam.
* **Security System:** Trigger alarms upon laser beam interruption.

**Important Considerations:**

* **Safety:** The laser beam is harmful to eyes; use with caution.
* **Straight Line:** The beam travels in a straight line, requiring clear paths.
* **Light Interference:** Sunlight and bright lights can affect the beam. Use in darker environments.
* **Brightness Adjustment:** The resistor on the module allows for dimming.

**Raspberry Pi Pico Compatibility:**

* The KY-008 can be used with the Raspberry Pi Pico.
* Connect VCC of the laser module to the 5V pin of the Pico.
* Connect GND of the laser module to the GND pin of the Pico.
* Software control is possible, with numerous online tutorials available.
* **Safety Reminder:** Always avoid pointing the laser directly at eyes.



#### GY-273 Magnetometer


Using the GY-273 sensor with the Raspberry Pi Pico.

**The GY-273 is a magnetometer sensor** that measures the strength and direction of magnetic fields.

It can be used to create a digital compass or to detect the presence of magnetic objects.

**Connections**

The GY-273 is compatible with the **Raspberry Pi Pico's I2C bus**.

To connect the GY-273 to the Pico, you will need to use a four-wire cable. The following table shows the connections:

| **GY-273** | **Raspberry Pi Pico** |
|------------|-----------------------|
| VCC        | 3.3V                  |
| GND        | GND                   |
| SCL        | SCL                   |
| SDA        | SDA                   |

**Overview**

The GY-273 is a digital compass module based on the QMC5883L chip.

It is a **triple-axis magnetometer** that can measure the Earth's magnetic field in three dimensions. The GY-273 has a measuring range of ±1.3 to 8 gauss and a resolution of 0.01 gauss.

It is powered by a 3 to 5V supply and communicates using the I2C protocol.

The GY-273 is commonly used in robotics, drones, and other applications that require accurate orientation sensing. It can also be used in navigation systems, such as GPS receivers.

**Features**

- **Triple-axis magnetometer:** Measures the Earth's magnetic field in three dimensions.
- **Measuring range of ±1.3 to 8 gauss:** Can measure weak to strong magnetic fields.
- **Resolution of 0.01 gauss:** Accurately measures small changes in the magnetic field.
- **Powered by a 3 to 5V supply:** Widely compatible with different power sources.
- **Communicates using the I2C protocol:** Easy to interface with microcontrollers.

If you are looking for a precise and versatile magnetometer sensor, the GY-273 is a good option to consider.

**Applications**

- **Robotics:** Used to determine the orientation of robots, such as self-driving cars and drones.
- **Navigation:** Used in GPS receivers and other navigation systems to determine the position of an object.
- **Avionics:** Used in aircraft to determine the attitude of the aircraft.
- **Marine:** Used in ships and boats to determine the heading of the vessel.
- **Surveying:** Used to measure the magnetic field of the Earth.
- **Geology:** Used to study the magnetic properties of rocks and minerals.

### RPi x LCDs

https://www.youtube.com/watch?v=3XLjVChVgec

HOWTO Raspberry Pi + LCD 16x2 i2c



https://github.com/the-raspberry-pi-guy/lcd

https://www.youtube.com/watch?v=3XLjVChVgec

HOWTO Raspberry Pi + LCD 16x2 i2c



https://github.com/the-raspberry-pi-guy/lcd
