---
title: "Ryze Robotics "
date: 2026-04-29
draft: false
tags: ["Tinkering","Ardupilot","DJi Tello"]
description: Drone.
url: 'fpv-programming'
---


**Tl;DR**

More tinkeringin the real world.

**Intro**

As software is cheap, if plants are not for you

maybe drones/robotics are?



### Claude x Python

https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/#how-to-control-dji-tello-with-python

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/" title="Pi Camera" image="/blog_img/iot/pi-cam.jpg" subtitle="Try OpenCV and yolov8 with the Pi!" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/getting-started/" title="Raspberry 101" image="/blog_img/hardware/wifi_eth.jpg" subtitle="Get started with a RPi" >}}
{{< /cards >}}



```md
sometime ago i was using python to control my dji tello dron, do you understand the logic i built? create a wiki.md with ur understanding
```

```sh
uv init
uv add kreuzberg
```

```sh
for f in Chapter*.pdf; do
  uvx kreuzberg extract "$f" > "${f%.pdf}.txt"
done
```

```sh
uv run main.py
```

After a quick test, I thought about adding face detection capabilities:

```sh
uv run face_detection_poc.py
```