---
title: "[AIoT] How to use LangChain to Chat with Sensor Data"
date: 2025-11-30T21:20:21+01:00
draft: false
tags: ["Dev","AI","IoT","DB2Rest"]
description: 'Using LangChain with OpenAI API to get information about Temperature and Humidity of a DHT22 sensor'
url: 'langchain-chat-with-sensor-data'
---


**TL;DR**

**Intro**

You can also try [PandasAI](https://pypi.org/project/pandasai/) and [Sketch](https://pypi.org/project/sketch/) with Python.

* https://pypi.org/project/sketch/
* https://github.com/approximatelabs/sketch

> MIT | AI code-writing assistant that understands data content. Sketch is usable in seconds and doesn't require adding a plugin to your IDE.

![Graphic Walker UI](/blog_img/hardware/asrockx300-air-temp.jpg)

> Sketch is an AI code-writing assistant for pandas users that understands the context of your data, greatly improving the relevance of suggestions. Sketch is usable in seconds and doesn't require adding a plugin to your IDE.

<!-- 
https://www.quadratichq.com/

> Source Open | Infinite spreadsheet with Python, SQL, and AI.

https://github.com/quadratichq/quadratic/tree/main
https://github.com/quadratichq/quadratic/issues/416
docker build -t quadratic --platform=linux/amd64 .

 -->


It all started with the RPi projects I published here about a [Pi working together with a **DHT22 sensor**.](https://jalcocert.github.io/RPi/posts/rpi-iot-dht11-influxdb/).

Then, I learnt how to use [LangChain to chat with a DB](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-a-db-with-langchain).

The next step is pretty much clear.

To join both worlds.

This is the goal of this post.

To be able to **chat with a DB where the DHT22 sensor data** (temp and humidity) is being stored.

## Chat with DHT22 Sensor

**Pre-Requisites**

0. Recommended - [Setup Containers](#setup-containers) for simpler dependency management


1. Get the **DB Ready** - We will do it with a [MariaDB SQL Container](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MariaDB_docker-compose.yml), but you can use a [MYSQL container](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MySQL_docker-compose.yml) or with [MYSQL baremetal as in the initial example post](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/#chat-with-a-db-with-langchain)


{{< details title="MariaDB with Docker-Compose 📌" closed="true" >}}

We just need a [MariaDB](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MariaDB_docker-compose.yml) or [MySQL](https://github.com/JAlcocerT/Docker/blob/main/Dev/DBs/MySQL_docker-compose.yml) **container deployed**

```yml
version: '3'

services:
  mariadb:
    image: mariadb:10.5
    container_name: mariadb-db
    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_DATABASE=chinook
      - MYSQL_USER=myuser
      - MYSQL_PASSWORD=mypassword
    volumes:
      - ./mariadb-data:/var/lib/mysql
    ports:
      - "3306:3306"
```

{{< /details >}}


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


## Conclusions




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

### Setup Containers


* A Quick [Container setup guide](https://fossengineer.com/understanding-containers-for-selfhosting/)
<!-- https://www.youtube.com/shorts/ox3IsWH-o7g -->

* Or just get ready for SelfHosting:

{{< youtube "ox3IsWH-o7g" >}}


* https://github.com/tensorchord/Awesome-LLMOps