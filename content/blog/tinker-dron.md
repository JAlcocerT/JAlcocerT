---
title: "Using DJI Tello Drone with Python"
date: 2024-07-30T23:20:21+01:00
draft: false
tags: ["Tinkering","Dron Regulations and License"]
description: Learning drone programming with Python and a DJI Tello drone.
url: 'dji-tello-python-programming'
---

Last year I got **a drone**.

This is what I've learn with it so far.

![DJI Tello Dron](/blog_img/hardware/dji-dron.png)

The dron has a camera as well, similar to the [RPi Camera tested here](https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/)


## DJI Tello Python

If there are some doubts, I wanted to try and control the **drone with...Python code**.

I have [forked](https://github.com/damiafuentes/DJITelloPy) and created a Docker Image with **Python Code which is able to control the drone**.

{{< callout type="info" >}}
[Dron Code test in Gitlab](https://gitlab.com/fossengineer1/dron) and in GH: https://github.com/JAlcocerT/DJITelloPy 💻
{{< /callout >}}


* **Hardware** Specs for the [Tello](https://www.ryzerobotics.com/tello/downloads):
    * The Battery (LiPo) has 4,18Wh lasts ~10 min with 1100mAh and 3.8V, can be loaded at 10W
    * Weight ~80g
    * Price ~100$
    * It has an Intel CPU which **we can program with python**, 5MP Camera with **720p** Live View Vision System, WIFI 802.11n 2.4G,

So far it can do the following:

1. Test Setup
2. Keyboard Control
3. Camera (Photo/Video) Control

* Photo: 5MP (2592x1936)
* FOV: 82.6°
* Video: HD720P30
* Format: JPG(Photo); MP4(Video)

4. Computer Vision with DJI Tello

Credits to [Murtaza's **YT Video**](https://www.youtube.com/watch?v=LmEcyQnfpDA&t=1286s) that helped me a lot to get started.

<!-- {{< youtube id="v=LmEcyQnfpDA" autoplay="false" >}} -->
{{< youtube "LmEcyQnfpDA" >}}


### Computer Vision without a Dron

Curious about CV, but dont have this kind of dron yet?

A **Pi camera** its about ~5$, much more affordable way to enter the computer vision world!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/" title="Pi Camera" image="/blog_img/hardware/iot/pi-cam.jpg" subtitle="Try OpenCV and yolov8 with the Pi!" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/getting-started/" title="Raspberry 101" image="/blog_img/hardware/wifi_eth.jpg" subtitle="Get started with a RPi" >}}
{{< /cards >}}


---

## FAQ

### How to Control DJI Tello with Mobile Apps

* There are official Apps for DJI Tello (Manufactured by Ryze)
    * [iOS App](https://apps.apple.com/us/app/tello/id1330559633)
    * Android - The **official app seems outdated** and non compatible with my Android
      *  A Free Demo alternative is [this one](https://play.google.com/store/apps/details?id=com.volatello.tellofpv.demo)

### How to Control DJI Tello with Python

{{< youtube "JQQcfHeGaTM" >}}

<!-- https://youtube.com/shorts/JQQcfHeGaTM -->

### About Dron Regulations

* https://drony.gov.pl/
* https://www.seguridadaerea.gob.es/es/particulares/piloto-de-drones

* **Remember** 
    * An exam is generally required for drones weighing over 250 grams (0.55 pounds) in most countries.
    * Check your local regulations to ensure compliance, as rules can differ significantly by region.

### About Flying

A very interesting [**video series about learning to fly**](https://www.youtube.com/watch?v=rPCMsYS-4oE&list=PLJZONA27OlBqEmWMyuyXD6p1xiFxQXk_K) on a Ultra Light Plane.

* They also teach how to pilot drones: www.aeroilipamagna.es
* But i discovered them for their initiation course

{{< details title="What you need to know about ULM's 📌" closed="true" >}}

- **Ultra-Light Motorized (ULM)**: Small, lightweight aircraft for recreational flying, training, and aerial photography. Simpler than traditional airplanes.

- **Key Features**:
  - **Lightweight**: Designed for small takeoff and landing spaces.
  - **Simple controls**: Easier for beginners.
  - **Open cockpit**: Offers an immersive flying experience.
  - **Limited range and speed**: Smaller engines mean lower range and speed.
  - **Regulations**: Specific licensing requirements depending on the country.

- **Types of ULMs**:
  - **Microlights**: Smallest and lightest, often single-seat.
  - **Trikes**: Three-wheeled landing gear, separate pilot seat.
  - **Powered Parachutes**: Parachute-like canopy, motor, and pilot harness.

- **Popular ULM Models**:

  - **Microlights**:
    - **Bréguet 901**: Reliable French microlight.
    - **Skyrider Sport**: Popular American two-seater.
    - **Flight Design CTS**: Modern microlight with advanced avionics.

  - **Trikes**:
    - **Polaris Ranger**: Versatile for both flying and ground use.
    - **Skychaser**: Powerful engine, comfortable seat.
    - **Bensen Gyrocopter**: Unique autorotation capability.

  - **Powered Parachutes**:
    - **Skywalker X2**: Stable and predictable flight.
    - **Paramotor UK Skywing**: British-made, engine options.
    - **Duet Paramotor**: French-made two-seater.

- **Conclusion**: ULMs provide affordable flying, but require proper training and safety regulations. Consider cost, performance, and maintenance when choosing a model.


{{< /details >}}