---
title: "[IoT] Sensors"
date: 2025-09-01
draft: false
tags: ["Tinkering"]
description: What Ive learnt while using a ESP32 and a Raspberry Pi Pico W [Microcontrollers]
url: 'iot-sensors-101'
---


### BME280

Temp Hum and Preassure

I2C

<https://www.youtube.com/watch?v=GQOqvvei5Do>

### DHT - Temp and Hum

{{< details title="DHT with Kibana 📌" closed="true" >}}



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

### BME680 - Air Quality





### MLX90614 GY-906 - IR

The MLX90614 GY-906 is an infrared (IR) temperature sensor module commonly used for non-contact temperature measurements.

It's also known as a pyrometer or non-contact thermometer.

This sensor is produced by Melexis and can measure the temperature of an object without making physical contact with it, which makes it useful in various applications.

{{% details title="More about the MLX90614 " closed="true" %}}


Working Principle: The sensor measures the infrared radiation emitted by an object to determine its temperature. All objects emit thermal radiation based on their temperature, and this radiation falls within the infrared spectrum. The sensor detects this radiation and converts it into an electrical signal that can be used to calculate the object's temperature.

Accuracy and Range: The MLX90614 GY-906 sensor can offer a relatively high level of accuracy for non-contact temperature measurements. It has a wide temperature measurement range, typically spanning from **-70°C to 380°C** (-94°F to 716°F), depending on the specific model and calibration.

Two Sensors in One: The sensor actually contains two separate sensors within a single package: one to measure the temperature of the object being measured (object temperature) and another to measure the temperature of the sensor itself (ambient temperature). This dual-sensor setup helps improve accuracy, as it compensates for changes in the sensor's ambient temperature.


{{% /details %}} 



Communication Interface: The MLX90614 GY-906 sensor can communicate with microcontrollers or other devices using the **I2C (Inter-Integrated Circuit) communication protocol**. This makes it relatively easy to integrate the sensor into various projects and systems.


It already has a built-in 3.3V voltage stabilizer and pull-up resistors of the I2c bus to be powered by 4.7 kΩ resistors. We also know that the ranges of measured temperatures are: -40°C…85°C for the ambient temperature and -40°C…380°C for the temperature of the tested object. The module has a measurement accuracy of 0.5°C for the measurement range To=0°C…60°C ( object temperature ), Ta=0°C…50°C ( surrounding temperature ) with a resolution of 0.2°C. The largest measurement error we will encounter is ±4°C, but for very high temperatures.

{{% details title="MLX90614 Python, Influx and grafana " closed="true" %}}



<https://www.youtube.com/watch?v=CftxT8k0jww&t=5s>

<https://raw.githubusercontent.com/STJRush/handycode/master/ALT4%20Sensors%20Inputs%20Outputs/Raspberry%20PI%20Sensors/MLX90614%20Infrared%20Thermal%20Sensor/MLX90614_Therm_Sensor.py>


Vin to 3.3V - 
GND to gnd
SCL to GPIO3 (SCL)
SDA to GPIO2 (SDA)


sudo raspi-config
interfacing options
enable I2C

reboot

i2cdetect -y 1

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


When saved, just run: docker build -t mlx_sensor_app_influxdb .

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





Grafana can connect to: http://influxdb:8086 or to http://yoursubdomain.duckdns.org:8086 (if you included the DNS in the stack)

Go to the Influx container and then:

Influx
USE sensor_data
show measurements
SELECT * FROM mlx_sensor #this is the measurement where we are pushing this data




http://reisipi.duckdns.org 
http://192.168.3.101:8086



**and using influxdb in the cloud**


<https://www.influxdata.com/influxdb-cloud-pricing/>

USD 0.002
/mebibyte

versus GCP E2 small That's about $0.02 hourly




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


<https://hub.docker.com/r/linuxserver/duckdns>


```yml
version: '3'
services:

  influxdb:
    image: influxdb:1.8
    container_name: influxdb
    ports:
      - "8086:8086"
    volumes:
      - influxdb_data:/var/lib/influxdb
    environment:
      - INFLUXDB_DB=sensor_data
      - INFLUXDB_ADMIN_USER=admin
      - INFLUXDB_ADMIN_PASSWORD=mysecretpassword

  duckdns:
    image: lscr.io/linuxserver/duckdns:latest
    container_name: duckdns
    environment:
      - SUBDOMAINS=subdomain1,subdomain2
      - TOKEN=yourtoken
      - LOG_FILE=false #optional
    volumes:
      - duckdns_data:/config #optional
    restart: unless-stopped      

volumes:
  influxdb_data:
  duckdns_data:
```

Adding [nginx](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/) and [duckdns](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/#https-locally-nginx--duckdns)

```yml
  nginx:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    container_name: nginx    
    ports:
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
    volumes:
      - nginx_data:/data #  - ~/Docker/Nginx/data:/data
      - nginx_letsencrypt:/etc/letsencrypt #  - ~/Docker/Nginx/letsencrypt:/etc/letsencrypt
    networks:
      nginx_network:
        aliases:
          - default      


volumes:
  nginx_data:
  nginx_letsencrypt:

networks:
  nginx_network:
    internal: true
```



{{% /details %}} 


### Other Sensors

## MPU6050


There are many 3-axis accelerometers that you can use with the Raspberry Pi Pico. Some of the most popular options include:

MPU-6050: This is a popular and versatile accelerometer that is also compatible with the Raspberry Pi Pico. It has a wide range of features, including a built-in gyroscope.

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

It is a **triple-axis magnetometer** that can measure the Earth's magnetic field in three dimensions. The GY-273 has a measuring range of ±1.3 to 8 gauss and a resolution of 0.01 gauss. It is powered by a 3 to 5V supply and communicates using the I2C protocol.

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

#### KY008




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

## Outro

Interesting YT channels

Tom Stanton - https://www.youtube.com/watch?v=6gchoHrsCp4 ~DIY

https://www.youtube.com/@homeassistant_facil/videos - https://www.youtube.com/@homeassistant_facil/videos