---
title: "Ryze Robotics Dron and Python SDK"
date: 2026-04-04
draft: false
tags: ["Ardupilot","DJi Tello","RC","Computer Vision x PySymverse","DART"]
description: A toy Drone, claude code and CV2.
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

This is all it takes recently:

```sh
#claude
```

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

Its just the same ppl take this to the next level 

see this video 'pre-ai'

<!-- https://www.youtube.com/watch?v=LmEcyQnfpDA -->
{{< youtube "LmEcyQnfpDA" >}}

* https://github.com/murtazahassan/OpenCV-Python-Tutorials-and-Projects
  * https://github.com/murtazahassan/Drone-Face-Tracking/tree/master
  * https://github.com/murtazahassan/Tello-Object-Tracking


#### About PySymverse

From the same channel, i got to know about: https://pypi.org/project/pysimverse/

> From scripts to the Sky (if you have an account)

<!-- https://www.youtube.com/watch?v=VBamzxfYHgA -->

{{< youtube "VBamzxfYHgA" >}}

{{< youtube "hedBZ_ViAGo" >}}

{{< youtube "dFudZiQ5ocY" >}}

<!-- https://www.youtube.com/watch?v=hedBZ_ViAGo
https://www.youtube.com/watch?v=dFudZiQ5ocY -->

{{< youtube "v5a7pKSOJd8" >}}

<!-- https://www.youtube.com/watch?v=v5a7pKSOJd8 -->

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

[This](#tello-x-flutter) is happening already...

```sh
sudo snap install flutter --clasic
#git init && git add . && git commit -m "Initial commit: Starting flutter dji tello dron" && gh repo create dron-tello-flutter --private --source=. --remote=origin --push

#uv init
#uv add -r requirements.txt
#uv sync
#cd sample-pyscipe
uv run main.py

#make run #requires .env.local
#git remote set-url origin git@gitlab.com:fossengineer1/dron.git
#git push
```

<!-- https://youtube.com/shorts/XNG57Co1lXA -->

{{< youtube "XNG57Co1lXA" >}}


### What I learnt

Want this DFY?

~~f* off~~


```mermaid
flowchart LR
    %% --- Styles ---
    classDef free fill:#E8F5E9,stroke:#2E7D32,stroke-width:2px,color:#1B5E20;
    classDef low fill:#FFF9C4,stroke:#FBC02D,stroke-width:2px,color:#F57F17;
    classDef mid fill:#FFE0B2,stroke:#F57C00,stroke-width:2px,color:#E65100;
    classDef high fill:#FFCDD2,stroke:#C62828,stroke-width:2px,color:#B71C1C;

    %% --- Nodes ---
    L1("Free Content<br/>(Blog/YT $0)"):::free
    L2("DIY<br/>(Templates / Platform) $"):::low
    L3("Done With You<br/>(Consulting) $$"):::mid
    L4("Done For You<br/>(Services) $$$"):::high

    %% --- Connections ---
    L1 --> L2
    L2 --> L3
    L3 --> L4
```


I mean, here you go:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Get some of my time ↗" icon="book-open" >}}
  {{< card link="https://cal.com/jalcocertech/consulting" title="Collaborations ↗" icon="user" >}}
{{< /cards >}}

---

## FAQ

### Tello x Flutter

I got some problems with the connection to the tello.

CC went to the route of we're using dart:io's built-in RawDatagramSocket, but some how was not getting there.

So went out and look for existing projects:

1. https://github.com/mateustoin/Flutter-app-DJI-Tello-Drone/tree/main

Cool! but it has 6yo and depends on https://pub.dev/packages/tello/versions which is Dart3 incompatible.

next

2.  https://pub.dev/packages/udp/versions that does not shows incompatibilities

```sh
#ping 192.168.10.1
flutter run -d linux
```

![alt text](/blog_img/apps/flutter-dron.png)

> This is the one, btw :)

3. https://pub.dev/packages/ryze_tello with 5yo and *also in theory*, no incompatibilities

### Whats ArduPilot?

ArduPilot is an open-source autopilot system for vehicles like:

  - drones
  - planes
  - helicopters
  - rovers
  - boats
  - submarines

  It is both:

  - software: the flight/control stack that runs on the vehicle
  - ecosystem: firmware, ground control tools, hardware support, simulation, and documentation

  What it does:

  - stabilizes and flies the vehicle
  - handles GPS navigation and waypoint missions
  - supports telemetry, failsafes, return-to-home, geofencing
  - integrates sensors like GPS, IMU, compass, barometer, lidar, cameras, etc.

  Typical setup:

  - flight controller hardware running ArduPilot firmware
  - a ground station such as Mission Planner or QGroundControl
  - optional radio/telemetry link, RC transmitter, GPS, companion computer

  In practice, people use it for:

  - hobby drones
  - research robots
  - industrial UAVs
  - autonomous boats and ground vehicles

### Software for Drones

* https://github.com/arpanghosh8453/open-dronelog

> Drone Log analyzer: A high-performance universal dashboard application for organizing and analyzing DJI/Litchi flight logs privately in one place. Built with **Tauri v2, DuckDB, and React**.

### About computer vision

If OpenCV is the heavy-duty engine, CVZone is the ergonomic dashboard and steering wheel that makes it much easier to drive.

1. What is CVZone?

CVZone is a high-level Python package designed to make computer vision tasks—like hand tracking, face detection, and object tracking—accessible with just a few lines of code. 

It was created largely by Murtaza Hassan (Computer Vision Zone) to simplify the often complex boilerplate code required by standard libraries.

* **Core Logic:** It is built on top of **OpenCV** (for image processing) and **Mediapipe** (for high-performance AI tracking).
* **Key Features:** It includes "ready-to-use" modules for:
    * **Hand Tracking:** Finding 21 landmarks on a hand and detecting gestures.
    * **Face Detection & Mesh:** Real-time facial landmark mapping.
    * **Pose Estimation:** Tracking body joints for fitness or motion apps.
    * **Utilities:** Easy functions for drawing styled rectangles, putting text on screen, or stacking multiple images together.

2. Does it relate with `cv2` (OpenCV)?

**Yes, they are best friends.** CVZone does not replace `cv2`; it **complements** it. In a typical script, you will import both. CVZone takes the "raw" outputs from OpenCV or Mediapipe and handles the math and drawing for you.

* **Example Comparison:** * To draw a "fancy" cornered rectangle in standard `cv2`, you might need 10+ lines of `cv2.line()` calls. 
    * In `cvzone`, you simply call `cvzone.cornerRect(img, bbox)`.

> **The Flow:** You use `cv2` to capture your webcam feed and display the window, but you use `cvzone` to process the AI logic and draw the overlays.

3. Open-Source Models (The "Heavy Hitters" of 2026)

If you want to move beyond the basic tracking in CVZone, here are the top open-source models currently dominating the field:

| Model Category | Top Open-Source Recommendation | Best For... |
| :--- | :--- | :--- |
| **Object Detection** | **YOLOv11** (Ultralytics) | Lightning-fast detection of 80+ types of objects. |
| **Segmentation** | **SAM 2** (Segment Anything) | "Click-to-cutout" any object in a video or image. |
| **Face Recognition** | **DeepFace** / **InsightFace** | Identifying specific individuals, not just finding "a face." |
| **Multimodal** | **Qwen2.5-VL** | Models that can "see" and then "talk" about what they see in detail. |
| **Hand/Face/Body** | **Mediapipe** (The engine of CVZone) | Low-latency tracking that runs perfectly on CPUs/Mobile. |

Which should you choose?

* **For Beginners:** Stick with **CVZone**. It abstracts the scary math and lets you build projects like "Virtual Paint" or "Gesture Volume Control" in an afternoon.
* **For Professional Apps:** Use **YOLOv11** or **SAM 2** directly. They offer more precision and are the industry standards for tasks like self-driving car logic or medical imaging.