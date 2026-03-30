---
title: "Ryze Robotics "
date: 2026-04-29
draft: false
tags: ["Tinkering","Ardupilot","DJi Tello","RC","Computer Vision"]
description: A toy Drone, claude code and computer vision.
url: 'fpv-programming'
---


**Tl;DR**

More tinkeringin the real world.

**Intro**

As software is cheap, if plants are not for you

maybe drones/robotics are?



### Claude x Python



{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/" title="Pi Camera" image="/blog_img/iot/pi-cam.jpg" subtitle="Try OpenCV and yolov8 with the Pi!" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/#how-to-control-dji-tello-with-python" title="DJi Tello 101" image="/blog_img/hardware/wifi_eth.jpg" subtitle="Get started with a cheap toy dron." >}}
{{< /cards >}}



```md
sometime ago i was using python to control my dji tello dron, do you understand the logic i built? create a wiki.md with ur understanding
```

I also extracted the documentation for claude:

```sh
uv init
uv add kreuzberg
```

```sh
for f in Chapter*.pdf; do
  uvx kreuzberg extract "$f" > "${f%.pdf}.txt"
done
```

Once the context is ready, its about creating a `FRD.md` and let CC split the work in few phases:

```sh
uv run main.py
```

This is all based on OSS libraries, so you wont need ever again the official app which is no longer in the google play store.

#### Computer Vision

After a quick test, I thought about adding face detection capabilities:

```sh
uv run face_detection_poc.py
```

Same thing we learnt with the pi, using the CV2 library (executed at your laptop, not the dron)

---

## Conclusions

Wouldnt it be nice to do a come back to electrical engineering?

The level of abstraction that there is in such a drone so that by pressing one key, that goes to one command and goes to...somewhere

and that somewhere makes the motors do something in particular to rotate, acelerate...