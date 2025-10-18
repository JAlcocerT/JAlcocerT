---
title: "[IoT] Meets AI. AIoT with a Raspberry Pi."
date: 2025-11-18
draft: false
tags: ["Tinkering","Ekuiper","Leds","DataBricks"]
description: 'IoT Meets AI. Using MQTT and AI Together.'
url: 'edge-ai-with-raspberry-pi'
---

Internet of the things.

AI

And now AI on the edge?

AI-IOT?

* https://jalcocert.github.io/RPi/

## IoT on Raspberry Pi

- **MQTT** https://jalcocert.github.io/RPi/posts/rpi-mqtt/
- **GCP IoT Core** vs [ThingsBoard](https://thingsboard.io/)
  - [ThingsBoard on Open Source Alternative](https://www.opensourcealternative.to/project/ThingsBoard)
- **Edge Computing**: Info collecting and processing closer to the source (IoT).

<!-- 
Expertise:
    MQTT
    CAN Bus
    Sensors: ESP32…
    https://esp32io.com/tutorials/esp32-gps
-->


### IoT with DataBricks

Databricks is 


![Karting Adventure](/blog_img/dev/databricks-mongo.JPG)

1. https://a1karting.pl/cennik/
2. https://sklep.drive-position.pl/kategoria-produktu/quady-i-adv/




---

## Edge AI - AIoT

* https://github.com/9tigerio/db2rest

> Instant no code DATA API platform. Connect any database, run anywhere. Power your GENAI application function/tools calls in seconds.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/db2rest" title="db2rest | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### About DB2Rest

DB2Rest is blazing fast - It has no Object Relational Mapping (ORM) overhead, uses Single round-trip to databases, no code generation or compilation, and supports Database Query Caching and Batching.

* https://github.com/9tigerio/db2rest
  * https://db2rest.com/docs/run-db2rest-on-docker

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/db2rest" title="DB2Rest with Docker 🐋 ↗" >}}
{{< /cards >}}

> Apache v2 | Instant no code **DATA API platform**. Connect any database, run anywhere. Power your GENAI application [function/tools calls](https://jalcocert.github.io/JAlcocerT/how-to-use-openai-function-calling/) in seconds.


---

## Conclusions


If worked on few IoT projects with the Pi. See [more here](https://jalcocert.github.io/RPi/categories/iot-data-analytics/)

Push to MongoDB. See the data properly.

* https://github.com/anasjaber/mongo-explorer

* Edge Computing - https://github.com/qijianpeng/awesome-edge-computing
* Domotica para pobres - https://forocoches.com/foro/showthread.php?t=6655749

* MicroPython - https://awesome-micropython.com/

* https://github.com/ahundt/awesome-robotics


### Pi Cool Stuff

https://pabramsor.com/graphical-interface-for-raspberry-pi-gpio/

```sh
git clone https://github.com/Bardo91/rpi_gpio_gui
#pip install PyQt5 RPi.GPIO
#pip3 install PyQt5 RPi.GPIO

python3 rpi_gpio_gui.py
```



---

## FAQ

### Running LLMs in SBCs


https://www.youtube.com/watch?v=N0718RfpuWE

* https://github.com/tensorchord/Awesome-LLMOps
    * https://github.com/tensorchord/Awesome-LLMOps?tab=readme-ov-file#llmops


* Open-source tools for prompt testing and experimentation, with support for both LLMs (e.g. OpenAI, LLaMA) and vector databases (e.g. Chroma, Weaviate, LanceDB).

* https://github.com/hegelai/prompttools

### How to Enhance a Raspberry Pi for AI

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

> Ekuiper works great when combined with [EMQx Broker](https://jalcocert.github.io/RPi/posts/rpi-mqtt/#install-mqtt-broker)

## IoT Tools

### Setup Ekuiper

Lets use the [Ekuiper Docker Image](https://hub.docker.com/r/lfedge/ekuiper)

```sh
docker run -p 9081:9081 -d --name ekuiper -e MQTT_SOURCE__DEFAULT__SERVER=tcp://broker.emqx.io:1883 lfedge/ekuiper:latest
```

`http://localhost:9081/`

### Using Ekuiper

https://ekuiper.org/docs/en/latest/getting_started/quick_start_docker.html


---

## FAQ

https://github.com/lf-edge/ekuiper

### AI/ML

* TF Lite - https://ekuiper.org/docs/en/latest/guide/ai/python_tensorflow_lite_tutorial.html
    * https://www.tensorflow.org/lite/guide





<!-- shodan related to internet of the things

Shodan is a specialized search engine that allows users to find Internet-connected devices. Unlike traditional search engines that index websites and pages, Shodan collects information about network-connected devices such as servers, security cameras, routers, printers, and IoT (Internet of Things) devices1. Here are some key points about Shodan:

Search Engine for Internet-Connected Devices: Shodan is often referred to as the “world’s first search engine for Internet of Things (IoT) devices.” It provides a way to discover various types of servers, webcams, routers, and other devices connected to the Internet. -->





<!-- SHODAN

Search engine similar to Google
What Is Shodan? Shodan is a search engine similar to Google. But while Google searches for websites, Shodan searches for devices that are connected to the internet. Users can perform a search using the Shodan search engine based on an IP address, device name, city, and/or a variety of other technical categories. 
-->

### Pi and leds

**LEDs**

* https://github.com/awawa-dev/HyperHDR

* https://github.com/appleimperio/docker-hyperhdr

> MIT |  Highly optimized open source ambient lighting implementation based on modern digital video and audio stream analysis for Windows, macOS and Linux (x86 and Raspberry Pi / ARM). 