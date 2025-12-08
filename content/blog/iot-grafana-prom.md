---
title: "Grafana Monitoring: Prometheus"
date: 2026-10-09
tags: ["Homelab","Docker","Self-Hosting","Iotawatt","Prometheus vs Graphite","Grafana vs TelemetryHarbour"]
description: 'Grafana works for IoT Same as for Monitoring a HomeLab'
url: 'selfhosting-grafana'
---

* https://telemetryharbor.com/
* https://docs.telemetryharbor.com/docs/Integrations/home-assistant/


https://docs.telemetryharbor.com/docs/oss-self-hosted/


**Tl;DR**


**Intro**


<!-- GRAFANA + PROMEt
Discover How to Create Grafana Dashboards Easily With Prometheus
https://www.youtube.com/watch?v=JBEWpYy9QDE -->

If you have ever worked with a [DevOps team](https://jalcocert.github.io/JAlcocerT/dev-ops-for-non-devops/) or as D&A with IoT devices like [telecom](https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/), most likely than not you have used Grafana to monitor them.

The thing is that people also do awsome things with Grafana within their homelabs.

See how to use [Iotawatt + Grafana](https://blog.networkprofile.org/power-monitoring-setup-iotawatt-grafana/)


![Solar Panel](/blog_img/outro/solar-panel.jpg)


* https://github.com/boblemaire/IoTaWatt

> GPL 3/0 |  IoTaWatt Open WiFi Electric Energy Monitor


https://github.com/superduper-io/superduper
https://github.com/superduper-io/superduper?tab=Apache-2.0-1-ov-file#readme

> Superduper: Bring AI to your database! Integrate AI models and workflows with your database to implement custom AI applications, without moving your data. Including streaming inference, scalable model hosting, training and vector search.


https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki

## The Grafana Project


> The open and composable observability and data visualization platform.

> > Visualize metrics, logs, and traces from multiple sources like Prometheus, Loki, Elasticsearch, InfluxDB, Postgres and many more.



---


* Check that Prometheus is working at: `http://192.168.1.100:9090/targets`
* Add prometheus database as data source in Grafana: `http://192.168.1.100:9090`

* Customize a Dashboard

* Use pre-existing ones:
    * For node_exporter metrics: <https://grafana.com/grafana/dashboards/1860-node-exporter-full/>
    * For cadvisor metrics: <https://grafana.com/grafana/dashboards/14282-cadvisor-exporter/>




"The TIG Stack: Telegraph InfluxDB and Grafana with Docker"

### The TIG Stack


Grafana + InfluxDB + NodeRed + Mosquitto (broker server) MQTT of the Sensors connected to ESP32

### Bare metal Install

Inspired by: <https://www.youtube.com/watch?v=ffg3_1AgtyA&list=LL&index=1&t=2087s>

<https://simonhearne.com/2020/pi-influx-grafana/#step-5-collecting-some-data>

### Mosquitto

```sh
sudo apt update
sudo apt upgrade
sudo apt install mosquitto mosquitto-clients
```

```sh
echo "mqtt_username:mqtt_password" > pwfile
cat pwfile
mosquitto_passwd -U pwfile
sudo mv pwfile /etc/mosquitto/
```

```sh
sudo nano /etc/mosquitto/mosquitto.conf
```

we will add:

```yml
allow_anonymous false
password_file /etc/mosquitto/pwfile
```

```sh
sudo /etc/init.d/mosquitto restart
```

#to subscribe
```sh
mosquitto_sub -v -t "#" # ----> all the topics
mosquitto_sub -v - u mqtt_username -P mqtt_password -t "#"
```

For now nothing is being published to the broker...

### InfluxDB


<!-- 
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
apt-key is being phased out -->

<!-- 
docker run \
      -p 8086:8086 \
      -v myInfluxVolume:/var/lib/influxdb2 \
      arm32v7/influxdb:latest -->

<https://github.com/influxdata/influxdb/releases>


```sh
curl -s https://repos.influxdata.com/influxdata-archive_compat.key | gpg --import -

wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/os-release
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

sudo apt update
sudo apt-get install influxdb

sudo systemctl unmask influxdb
sudo systemctl enable influxdb
sudo systemctl start influxdb


sudo systemctl status influxdb #this gets us the 1.6.7
```


## The technical Part



<!-- ### MQTT

MQTT, which stands for Message Queuing Telemetry Transport, is a lightweight messaging protocol for use on top of the TCP/IP protocol. It's designed for connections with remote locations where a "small code footprint" is required or the network bandwidth is limited.

MQTT is used widely in the Internet of Things (IoT) and other applications where machine-to-machine communication is needed. It's a publish/subscribe, extremely simple and lightweight messaging protocol, designed for constrained devices and low-bandwidth, high-latency or unreliable networks.

Here are some key features of MQTT:

1. **Lightweight and Efficient**: MQTT is designed to provide lightweight publish/subscribe communication to "Internet of Things" devices. It's perfect for "machine-to-machine" or "Internet of Things" for its lightweight footprint and minimized data packets.

2. **Quality of Service Levels**: MQTT has three Quality of Service (QoS) levels, defining the reliability of message delivery between clients and servers. These levels are QoS 0 (at most once), QoS 1 (at least once), and QoS 2 (exactly once).

3. **Persistent Session**: The persistent session feature is used to store session information to assure the session’s continuity when the connection is broken temporarily.

4. **Last Will and Testament (LWT)**: MQTT allows a client to specify its “last will and testament” message when it connects to an MQTT broker. If the client's connection breaks ungracefully, the broker will publish the LWT message to the specified topic.

5. **Security**: By using TCP/IP for networking, MQTT can utilize the security capabilities of the underlying transport, including encryption (SSL/TLS) and user name/password based security.

6. **Broker and Client**: An MQTT system consists of clients communicating with a server, often called a "broker". A client may be a publisher of information, a subscriber, or both.

MQTT is used in a variety of IoT devices, from smart home systems to industrial IoT applications. Notably, MQTT is the protocol used by Amazon Web Services (AWS) IoT services and by the Facebook Messenger service. -->

<!-- #### MQTT Brokers

Yes, there are several MQTT brokers you can use for your MQTT-based projects. Some of the most popular ones include:

1. **Mosquitto**: Eclipse Mosquitto is an open-source (EPL/EDL licensed) message broker that implements the MQTT protocol versions 5.0, 3.1.1, and 3.1. It's lightweight and suitable for all types of devices from low power single board computers to full servers.

2. **HiveMQ**: HiveMQ is a MQTT broker tailored specifically for enterprises, which supports MQTT protocols 3.x and 5.0. Its key features are its high scalability and its various plugin and extension possibilities.

3. **RabbitMQ**: RabbitMQ is a robust and general purpose message broker that supports several messaging protocols. It has a plugin to support MQTT and offers various features like clustering, high availability and a lot of plugins for further functionalities.

4. **VerneMQ**: VerneMQ is an enterprise ready, high-performance, distributed MQTT message broker system that supports MQTT 3.1.1 and 5.0. It scales horizontally and vertically on commodity hardware to support a high number of concurrent publishers and consumers.

5. **EMQ X**: EMQ X is a fully open source, highly scalable, real-time distributed MQTT message broker for large-scale IoT applications in 5G era. It supports MQTT 3.1, 3.1.1, and 5.0.

6. **Azure IoT Hub and AWS IoT Core**: For cloud solutions, both Azure IoT Hub and AWS IoT Core support MQTT and offer a host of complementary cloud-based services.

When selecting a broker, consider the specifics of your use case, including the MQTT protocol version you need to support, whether you need a standalone broker or a cloud solution, the scale of your IoT deployment, and any other specific features you may require.

Home Assistant, a popular open-source home automation platform, can indeed function as an MQTT broker. In addition to its powerful automation features, Home Assistant includes an embedded MQTT broker called Mosquitto, which is one of the most popular MQTT brokers.

However, please note that as of Home Assistant version 2021.6, the Mosquitto add-on, which includes the MQTT broker, has been deprecated in favor of the MQTT integration and a separate Mosquitto add-on that only functions as a broker. You can still use Mosquitto as a broker, but the two functions are separated.

 -->
<!-- 



### InfluxDB

Telegraf is not an alternative to Mosquitto. They are two different types of software that serve different purposes in a typical IoT stack.

Telegraf is an open-source server agent for collecting and reporting metrics. It's part of the InfluxData platform (which includes InfluxDB). Telegraf has plugins or integrations to source a variety of data from systems, services, or third-party APIs. Once the data is collected, Telegraf then outputs the data to your choice of data stores, services, or message queues, one of which can be InfluxDB.

Eclipse Mosquitto, on the other hand, is an open-source message broker that implements the MQTT (MQ Telemetry Transport) protocol versions 5.0, 3.1.1, and 3.1. MQTT is a lightweight publish/subscribe model, useful for connections in remote locations where a small code footprint is the order of the day. This makes Mosquitto particularly suitable for IoT applications where hundreds or thousands of devices are communicating telemetry data.

In a typical IoT setup, you might use both: Mosquitto would handle receiving data from your devices over MQTT, and then Telegraf would collect this data and forward it to InfluxDB for storage and analysis. -->




<!-- 
## Python and InfluxDB !!!!!!!!!!!!!!!!!!!!!

MQTT and Python - <https://www.youtube.com/watch?v=kuyCd53AOtg&t=62s>

Sensor -> Mosquitto -> Node Red ->InfluxDB2x ->Python -> Streamlit

<https://www.youtube.com/watch?v=CdorS9UgRk4> 

Streamlit + LLMs

https://www.youtube.com/watch?v=Yfu3GYKe0I8
https://streamlit.io/gallery?category=llms
-->


---
title: "MQTTX and NodeRed with Docker"
date: 2024-10-25T23:20:21+01:00
tags: ["Docker","Self-Hosting"]
description: ''
summary: '.'    
url: 'selfhosting-tig-stack-with-docker'
---


https://mqttx.app/downloads?os=docker

https://registry.hub.docker.com/r/emqx/mqttx-web/tags


```sh
docker run -d --name mqttx-web -p 80:80 emqx/mqttx-web
```

only

ws://
wss://

```yml
version: '3'

services:
  mqttx-web:
    image: emqx/mqttx-web
    container_name: mqttx-web
    ports:
      - "80:80"
    restart: always
```

<https://www.youtube.com/watch?v=Fhk-x-QD5XQ>

in windows i can see the mqtt:// option that i used for the new subscription.

## Benchmarking

or:  docker run -it --rm emqx/mqttx-cli

<https://registry.hub.docker.com/r/emqx/mqttx-cli>


```yml
version: '3'

services:
  mqttx-web:
    image: emqx/mqttx-cli
    container_name: mqttx-cli
    restart: always
```

```sh
mqttx conn -h 'broker.emqx.io' -p 1883 -u 'admin' -P 'public'

# Connect Benchmark
mqttx bench conn -c 5000

# Subscribe Benchmark
mqttx bench sub -c 5000 -t bench/%i

# Publish Benchmark
mqttx bench pub -c 5000 -t bench/%i

```


## EMQX (instead of mosquitto)
<https://mqttx.app/docs/get-started>
docker run -d --name emqx -p 1883:1883 -p 8083:8083 -p 8883:8883 -p 8084:8084 -p 18083:18083 emqx/emqx



<https://www.emqx.io/>
<https://github.com/emqx/emqx>

```yml
version: '3'

services:
  emqx:
    image: emqx/emqx
    container_name: emqx
    ports:
      - "1883:1883"
      - "8083:8083"
      - "8883:8883"
      - "8084:8084"
      - "18083:18083"
    restart: always

```

check the ports if you need with: netstat -tuln

inside the emqx container, see the subscriptions with: 

```sh
emqx_ctl subscriptions list
```

with mosquitto installed in the rpi: 

```sh
mosquitto_pub -h 192.168.3.200 -t temperature -m 25 -q 0
```

emqx is running on the orange (.200)

mqttx can run in windows and connect to the orange .200 to see that they are actually received





```yml
version: '3'

services:
  emqx:
    image: emqx/emqx
    container_name: emqx
    ports:
      - "1883:1883"
      - "8083:8083"
      - "8883:8883"
      - "8084:8084"
      - "18083:18083"
    restart: always

  nodered:
    image: nodered/node-red
    container_name: nodered
    ports:
      - "1880:1880"
    restart: always
    volumes:
      - nodered_data:/data    


  influxdb:
    image: influxdb #:1.8 for arm32
    container_name: influxdbnodered
    ports:
      - "8036:8086"
    volumes:
      - influxdb_nodereddata:/var/lib/influxdb


  grafana:
    image: grafana/grafana #:9.5.7 was using this one instead of latest for stability
    container_name: grafana
    ports:
      - "3003:3000"
    depends_on:
      - influxdb
    volumes:
      - grafana_nodereddata:/var/lib/grafana  # Add this line to specify the volume

volumes:
  influxdb_nodereddata:
  grafana_nodereddata:  # Define the volume for Grafana 
  nodered_data:

```

**nodered in depth <https://www.youtube.com/watch?v=WxUTYzxIDns>**

Install influxdb from the pallete: Installing 'node-red-contrib-influxdb'

```sh
influx
CREATE DATABASE sensor_data
SHOW DATABASES
USE sensor_data
select * from sensor_data_table
```

<https://www.youtube.com/watch?v=_DO2wHI6JWQ&t=21s>
<https://learnembeddedsystems.co.uk/easy-raspberry-pi-iot-server>


```json
{
"Temperature": msg.payload
}
```

---


## FAQ

### About Node Red x MQTT


Node-RED is a programming tool for wiring together hardware devices, APIs, and online services in new and interesting ways. 

It's built on Node.js, a server-side JavaScript platform, and offers a browser-based flow editor that makes it easy to wire together flows using the wide range of nodes in the palette.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/node-red" title="NodeRed | Config File 🐳 ↗"  >}}
{{< /cards >}}

Flows can be then deployed to the runtime in a single click.

JavaScript functions can be created within the editor using a rich text editor, and a built-in library allows you to save useful functions, templates or flows for re-use.

Node-RED is particularly popular in IoT because of its easy-to-use visual interface and its support for multiple protocols, including MQTT.

Here's why you might use Node-RED with Mosquitto (or another MQTT broker):

Device Control: You can use Node-RED to control IoT devices. For instance, you could set up a flow that turns on a light when a particular message is published to a certain MQTT topic.

Data Processing: Node-RED can process data from your devices. For instance, you could have a flow that listens for temperature data on an MQTT topic, calculates an average, and publishes the result back to another topic.

Integration with Other Services: Node-RED can be a bridge between your devices and various web services. 

For instance, you could set up a flow that listens for an alert from a motion sensor on an MQTT topic, and sends a tweet or an email when motion is detected.

Visual Programming: Node-RED's flow-based programming model is intuitive and flexible, which makes it a great tool for prototyping, learning, and building complex systems.

While you can use Node-RED without MQTT (and vice versa), they work very well together for creating IoT solutions. 

MQTT provides a light-weight, efficient protocol for communicating between devices, and Node-RED provides an easy way to control devices, process data, and integrate with other systems.

### Observability Platform for LLMs


  https://github.com/traceloop/openllmetry
  https://github.com/langfuse/langfuse
  
  Or with LangSmith
Also DataDog - https://docs.datadoghq.com/llm_observability/ 

