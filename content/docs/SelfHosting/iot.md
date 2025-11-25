---
title: "Tinkering with IoT"
date: 2025-09-04T10:20:21+01:00
draft: false
tags: ["dev"]
summary: 'Interesting IoT stuff'
url: 'cool-iot'
---

I got started with IoT thanks to a [Pi SBC](https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/) and made some public projects, which I documented [also publically, here](https://jalcocert.github.io/RPi/).

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/pi-vs-orange/" title="O"range Pi vs Raspberry Pi image="/blog_img/hardware/RPi4_2_vs4gb.jpg" subtitle="SBC for IoT - Comparison" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker" title="You might get help of some visualizations and BI Tools" image="/blog_img/iot/grafana.png" subtitle="Like Grafana!" >}}  
{{< /cards >}}


After many many hours of tinkering and learning IoT, I've come to the conclusion that it's a great way to learn about hardware and software.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/JAlcocerT/blob/main/Z_ebooks/web-ebook.pdf" title="Get an ebook with IoT Concepts and Projects" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Learn the concepts and tools to get started with IoT" >}}
{{< /cards >}}

## Inspirational Resources

Combining Blender + Arduino + Real Time Accelerometer Data: https://pabramsor.com/blender-and-arduino-accelerometer/

> See in real time where the arduino is moving rendered into blender

> > Impressive that this was [done back in 2011](https://elescritoriodetesla.blogspot.com/2011/09/acelerometro-arduino-y-blender3d.html)

Plot your IoT Data with Grafana or any of these [BI Tools](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/):

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/" title="Bi Tools for the AI era" image="/blog_img/iot/grafana.png" subtitle="BI Tools Post" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/grafana" title="Grafana" image="/blog_img/iot/grafana.png" subtitle="HomeLab Container Setup 🐋 ↗" >}}
{{< /cards >}}


## Sensors

1. The DHT sensors are quite popular and very simple to get started.

![PicoW with DHT22](/blog_img/iot/picoW/picow-dht22.png)

2. MLX

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/" title="MLX90614 with a Pi" image="/blog_img/iot/sensor-mlx.jpg" subtitle="Infrared (Contactless) Temperature Sensor Project with a Raspberry" >}}
{{< /cards >}}


### Lora

<!-- 

RYLR 998, a blue chip equipped with a LoRa ultra-long-range modem, perfect for various hardware integrations including Raspberry Pi, Arduino, and ESP-32.

https://www.youtube.com/watch?v=9azEfCQNhSA

Takeaways

The Ryder 998 is a low-power, low-cost chip that can send messages over 12 miles without any infrastructure.
LoRa technology has the potential to disrupt the status quo of communication technology.
The Ryder 998 can be used in a variety of applications, including IoT, emergency response, and extreme outdoor activities.
The chip's low power consumption and versatility make it an attractive option for many industries. -->



## Pi

A raspberry Pi inside a container - https://github.com/ptrsr/pi-ci

> A Raspberry **Pi emulator in a Docker image** that lets developers easily prepare and flash RPi configurations.


### IoT with a RPi4

### IoT with a PicoW

## IoT with Esp32

## IoT with Arduino

## IoT with RISC-V
