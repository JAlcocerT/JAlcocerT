---
title: "Ryze Robotics Dron and Python SDK"
date: 2026-04-04
draft: false
tags: ["Ardupilot","DJi Tello","RC","Computer Vision"]
description: A toy Drone, claude code and computer vision.
url: 'dji-tello-python-sdk'
---


**Tl;DR**

More tinkering the real world.

**Intro**

As software is cheap, if plants are not for you

maybe drones/electronic/robotics are?


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/dron" title="Dron | Repo" icon="github" >}}
{{< /cards >}}




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

You can skip Kreuzberg container, just:

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

Not gonna lie to you

```md
i have a dji tello dron and succesfully got a python script that uses its SDK to control it. Here is the python code and the documentation I used to do so. The android official apps is no longer valid, so i want to use flutter to build a crossplatform one that does precisely what my python script does. Can we do a flutter-version.md with all the features and clarifications?
```

```sh
# 1. Verify you're on Tello's Wi-Fi
iwconfig  # or check Network settings

# 2. Ping the drone
ping 192.168.10.1

# Test with netcat (simple UDP)
echo -n "command" | nc -u -w1 192.168.10.1 8889
```

This is happening already

```sh
sudo snap install flutter --clasic
#git init && git add . && git commit -m "Initial commit: Starting flutter dji tello dron" && gh repo create dron-tello-flutter --private --source=. --remote=origin --push

#uv init
#uv add -r requirements.txt
#uv sync
#cd sample-pyscipe
uv run main.py

#make run #requires .env.local
```