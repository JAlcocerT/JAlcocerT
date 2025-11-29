---
title: "[AIoT] How to use LangChain to Chat with Sensor Data"
date: 2025-12-04T21:20:21+01:00
draft: false
tags: ["Dev","AI","IoT","DB2Rest","ekuiper"]
description: 'Using LangChain with OpenAI API to get information about Temperature and Humidity of a DHT22 sensor'
url: 'langchain-chat-with-sensor-data'
---


**TL;DR**


<!-- A compute framework for turning complex data into vectors.
https://github.com/superlinked/superlinked -->

**Intro**

You can also try [PandasAI](https://pypi.org/project/pandasai/) and [Sketch](https://pypi.org/project/sketch/) with Python.

* https://pypi.org/project/sketch/
* https://github.com/approximatelabs/sketch

> MIT | AI code-writing assistant that understands data content. Sketch is usable in seconds and doesn't require adding a plugin to your IDE.

![Graphic Walker UI](/blog_img/hardware/asrockx300-air-temp.jpg)

> Sketch is an AI code-writing assistant for pandas users that understands the context of your data, greatly improving the relevance of suggestions. Sketch is usable in seconds and doesn't require adding a plugin to your IDE.

It all started with the RPi projects I published here about a [Pi working together with a **DHT22 sensor**.](https://jalcocert.github.io/RPi/posts/rpi-iot-dht11-influxdb/).

Then, I learnt how to use [LangChain to chat with a DB](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-a-db-with-langchain).

> Particularly [the Chinook sample DB](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#database-setup).

The next step is pretty much clear.

To join both worlds.

This is the goal of this post.

To be able to **chat with a DB where the DHT22 sensor data** (temp and humidity) is being stored.

## Chat with DHT22 Sensor

**Pre-Requisites**

0. Recommended - [Setup Containers](#setup-containers) for simpler dependency management

1. Get the **DB Ready** - We will do it with a [MariaDB SQL Container](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MariaDB_docker-compose.yml), but you can use a [MYSQL container](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MySQL_docker-compose.yml) or with [MYSQL baremetal as in the initial example post](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-a-db-with-langchain)



We just need a [MariaDB](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MariaDB_docker-compose.yml) or [MySQL](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MySQL_docker-compose.yml) **container deployed**

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mariadb" title="MariaDB | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```sh
docker-compose up -d
```

Once the **DB container** is running:

```sh
docker exec -it mariadb-db bash
#mysql -u root -p

# CREATE DATABASE chinook;
# USE chinook;
# SOURCE /path/to/chinook.sql; -- Update this path to your SQL file
# SOURCE /path/to/Chinook_MySql.sql; -- Update this path to your SQL file if needed

#SHOW TABLES;
```

## Part 1 - IoT

### Hardware Setup

```sh
pinout
```

### Software Setup

We need two things:

1. The **Database** (MariaDB / MySQL) to store the IoT data
2. The **Python Script** to push the **DHT sensor** information

```sh
pip install -r requirements.txt

#pip install Adafruit_DHT==1.4.0
#pip show Adafruit_DHT
```

#### Saving IoT Data

Lets save all the sensor reads into a **SQL database**.

{{< details title="Python | DHT Data to SQL DB 📌" closed="true" >}}


```py
import Adafruit_DHT
import time
import os
import mysql.connector

# Replace with your MySQL connection credentials
MYSQL_HOST = "localhost"
MYSQL_USER = "username"
MYSQL_PASSWORD = "password"
MYSQL_DATABASE = "sensor_data"

DHT_SENSOR = Adafruit_DHT.DHT11  # Example with DHT11, we can use DHT22 as well
DHT_PIN = 4

while True:
    humidity, temperature = Adafruit_DHT.read(DHT_SENSOR, DHT_PIN)

    if humidity is not None and temperature is not None:
        # Connect to the MySQL database
        try:
            connection = mysql.connector.connect(
                host=MYSQL_HOST, user=MYSQL_USER, password=MYSQL_PASSWORD, database=MYSQL_DATABASE
            )
            cursor = connection.cursor()

            # Prepare the SQL INSERT statement
            sql = "INSERT INTO dht_sensor (timestamp, temperature, humidity) VALUES (%s, %s, %s)"
            data = (time.strftime("%Y-%m-%dT%H:%M:%SZ"), temperature, humidity)

            # Execute the SQL statement
            cursor.execute(sql, data)
            connection.commit()

            print("Data sent to MySQL")

        except mysql.connector.Error as err:
            print("Error connecting to MySQL database:", err)

        finally:
            if connection:
                connection.cursor().close()
                connection.close()

    else:
        print("Sensor failure. Check wiring.")

    time.sleep(3)
```

{{< /details >}}


```sh
docker build -t dht_sensor_mariadb .
```

#### Visualize the IoT Data

Lets use **Metabase** as BI Tool to visualize the IoT data that we are storing already.

## Part 2 - AIoT Setup

Is the IoT Part already working?

Lets go with the **AI part**.

{{< details title="What it is ? 📌" closed="true" >}}


{{< /details >}}



When you are done:

```sh
#sudo docker stop $(sudo docker ps -aq) && sudo docker rm $(sudo docker ps -aq)
#docker system prune -a
```

---

## Conclusions

When thinking about the Internet of the things

I just cant help but think of the Raspberry Pi, that I got [some time back](https://jalcocert.github.io/JAlcocerT/blog/summary21/).

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/" title="Raspberry Pi Projects" image="/blog_img/hardware/sbcs-x13.jpg" subtitle="Jekyll site with Pi Projects and their related code" >}}
{{< /cards >}}


Then it was AI.

And now AI on the edge - Edge AI? and... AI-IOT or...AIoT?!?

For **IoT on Raspberry Pi** we have:

- **MQTT** https://jalcocert.github.io/RPi/posts/rpi-mqtt/
- **GCP IoT Core** vs [ThingsBoard](https://thingsboard.io/)
  - [ThingsBoard on Open Source Alternative](https://www.opensourcealternative.to/project/ThingsBoard)
- **Edge Computing**: Info collecting and processing closer to the source (IoT).

If worked on few IoT projects with the Pi.

See [more here](https://jalcocert.github.io/RPi/categories/iot-data-analytics/)

Push to MongoDB. See the data properly.

* https://github.com/anasjaber/mongo-explorer

* Edge Computing - https://github.com/qijianpeng/awesome-edge-computing
* Domotica para pobres - https://forocoches.com/foro/showthread.php?t=6655749

* MicroPython - https://awesome-micropython.com/


### IoT with DataBricks

Databricks is one of those D&A Tools that you should know.

We can do IoT projects with the Pi that push sensor data to Databricks.

https://jalcocert.github.io/RPi/posts/rpi-iot-mongodatabricks/

![Mongo to Databricks](/blog_img/dev/databricks-mongo.JPG)


### Pi Cool Stuff

I keep finding more and more cool things about the Raspberry Pis, like:

* https://pabramsor.com/graphical-interface-for-raspberry-pi-gpio/

```sh
git clone https://github.com/Bardo91/rpi_gpio_gui
#pip install PyQt5 RPi.GPIO
#pip3 install PyQt5 RPi.GPIO

python3 rpi_gpio_gui.py
```

#### Pi and leds

**LEDs**

* https://github.com/awawa-dev/HyperHDR

* https://github.com/appleimperio/docker-hyperhdr

> MIT |  Highly optimized open source ambient lighting implementation based on modern digital video and audio stream analysis for Windows, macOS and Linux (x86 and Raspberry Pi / ARM). 

#### Zigbee

If you have been playing with IoT and some home devices, you will come to know Zigbee.

* https://www.zigbee2mqtt.io/supported-devices/#

Probably also https://esphome.io if you like ESP32 boards!

---

## FAQ

{{< details title="How to install Adafruit from its source? 📌" closed="true" >}}

```sh
git clone https://github.com/adafruit/Adafruit_Python_DHT.git
cd Adafruit_Python_DHT
python3 setup.py install --force-pi

#This will bypass any issues you may encounter when doing pip install Adafuit_DHT==1.4.0
```

{{< /details >}}

### Python CLI Tools

* https://pypi.org/project/questionary/ - Create CLI utilities with python
* https://docs.pytest.org/en/stable/

### Running LLMs in SBCs

It should not be strange, we can do so by using tools like Ollama:

<!-- https://www.youtube.com/watch?v=N0718RfpuWE -->

{{< youtube "N0718RfpuWE" >}}


* https://github.com/tensorchord/Awesome-LLMOps
    * https://github.com/tensorchord/Awesome-LLMOps?tab=readme-ov-file#llmops


* Open-source tools for prompt testing and experimentation, with support for both LLMs (e.g. OpenAI, LLaMA) and vector databases (e.g. Chroma, Weaviate, LanceDB).

* https://github.com/hegelai/prompttools

#### How to Enhance a Raspberry Pi for AI

1.  Edge TPU on RPi - Coral Edge TPU (Tensor Processing Unit - an USB acccelerator )

TPU (Tensor Processing Unit):

* Focus: TPUs are specifically **designed for running Google's TensorFlow** machine learning framework. They are optimized for high-performance matrix multiplication, a fundamental operation in many deep learning algorithms.
* Architecture: TPUs are custom-designed by Google with a focus on maximizing performance for TensorFlow workloads. They prioritize speed and efficiency for * specific tasks within the TensorFlow ecosystem.

2. You will hear more and more about NPU's - **Neural Processing Units**

While both are designed to **handle AI workloads**, they have distinct differences in their focus, architecture, and availability.

NPUs are designed to mimic the structure and function of the human brain, excelling at tasks that involve large-scale parallel processing.

They are particularly well-suited for **various AI applications**, including:

- 🖼️ Image recognition
- 💬 Natural language processing
- 🗣️ Speech recognition


NPUs typically utilize a manycore architecture with specialized instructions and data formats optimized for AI algorithms. 

This allows them to handle complex neural networks efficiently.

NPUs are often integrated into mobile processors from companies like Apple, Huawei, and Samsung. 

You can also see them in SBCs like the OrangePi or new Pis.

Stream Processing at the IoT Edge, or...**AIoT**?


## IoT Tools

Ekuiper works great when combined with [EMQx Broker](https://jalcocert.github.io/RPi/posts/rpi-mqtt/#install-mqtt-broker)

### Setup Ekuiper

You can get started with Ekuiper by following the [quick start guide](https://ekuiper.org/docs/en/latest/getting_started/quick_start_docker.html).

* https://github.com/lf-edge/ekuiper

> Apache v2 | Lightweight **data stream processing engine** for IoT edge

Lets use the [Ekuiper Docker Image](https://hub.docker.com/r/lfedge/ekuiper)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ekuiper" title="Ekuiper | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```sh
docker run -p 9081:9081 -d --name ekuiper -e MQTT_SOURCE__DEFAULT__SERVER=tcp://broker.emqx.io:1883 lfedge/ekuiper:latest
```

> Go to `http://localhost:9081/`


You could also do AI/ML with Ekuiper

* TF Lite - https://ekuiper.org/docs/en/latest/guide/ai/python_tensorflow_lite_tutorial.html
    * https://www.tensorflow.org/lite/guide