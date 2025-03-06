---
title: Edge Analytics with Raspberry Pi. AIoT.
author: JAlcocerT
date: 2025-12-31
draft: true
---

Stream Processing at the IoT Edge, or...AIoT?

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

<!-- 
arduino
https://www.youtube.com/watch?v=DPqiIzK97K0 -->

<!-- 

RYLR 998, a blue chip equipped with a LoRa ultra-long-range modem, perfect for various hardware integrations including Raspberry Pi, Arduino, and ESP-32.

https://www.youtube.com/watch?v=9azEfCQNhSA

Takeaways

The Ryder 998 is a low-power, low-cost chip that can send messages over 12 miles without any infrastructure.
LoRa technology has the potential to disrupt the status quo of communication technology.
The Ryder 998 can be used in a variety of applications, including IoT, emergency response, and extreme outdoor activities.
The chip's low power consumption and versatility make it an attractive option for many industries. -->



<!-- SHODAN

Search engine similar to Google
What Is Shodan? Shodan is a search engine similar to Google. But while Google searches for websites, Shodan searches for devices that are connected to the internet. Users can perform a search using the Shodan search engine based on an IP address, device name, city, and/or a variety of other technical categories. -->