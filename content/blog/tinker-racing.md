---
title: "Racing and Data Overlay"
date: 2025-12-23T09:20:21+01:00
draft: false
tags: ["Karts","Accelerometer Sensor","RacheChrono","Cars x OBD2","GoPro GPS"]
description: 'From Action Camera Data to Matplotlib HUDs for your trackdays.'
---

**Tl;DR**

People are doing cool videos with [racechrono paid software](https://racechrono.com/), Garmin Virb or other paid software for video edition.

Could not avoid thinking on the GoPro GPS Telemetry *again* for those **Racing addicts** around!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/video/" title="Video | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/" title="Racing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

**Intro**

~~Karting~~ racing is expensive.

If you want to make the most of it, tracking every lap gives you the possibility to know where to improve.


I got to know about Race Chrono Pro that allows to do:

<!-- https://www.youtube.com/watch?v=9vidTq12des -->

{{< youtube "9vidTq12des" >}}

This can potentially guide you on the [optimum gears](https://github.com/JAlcocerT/Private/tree/main/Py_optimum_gears) to be and potentially, on the [optimum path](https://github.com/JAlcocerT/Private/tree/main/Py_OptimumPath).

Last year, I tinkered with [random APIs](https://jalcocert.github.io/JAlcocerT/interesting-apis/#random-apis): among which there was telemetry for [F1](https://jalcocert.github.io/JAlcocerT/interesting-apis/#formula-1)

If you are into [f1](https://jalcocert.github.io/JAlcocerT/interesting-apis/#formula-1) / cars / trackdays or simply enjoy tinkering with IoT Data...

![Karting Adventure](/blog_img/memes/Accidente_karting-min.gif)
<!-- https://www.youtube.com/watch?v=LToBbKTHAkw -->

Lets get started!

## OnBoard Telemetry

Getting the **GPS position** in real time would be great.

But there is latency and battery drain.

Also the frequency of updates is not high enough.

But anyways, can we represent data into a dashboard with Open Street Maps?

Basically, to represent into every data point of OSM what was the temperature, speed, acceleration...

1. Data Collection first!
2. Offline data visualization
3. On board life telemetry - *Im aware that people with [bmw](https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/#bmw-e36-and-canbus) have made this possible!*

#### GoPros Telemetry Data

Not the first time Im tinkering with [geospatial data](https://jalcocert.github.io/JAlcocerT/geospatial-data/) nor with [GoPro built in GPS](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#oa5pro-vs-goprohero9)


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9" title="GoPro GPS Telemetry Magic" image="/blog_img/karting/gopro-speed-sample.png" subtitle="OA5 versus GoPro data extraction" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/#trackday-and-gopro-metadata" title="GoPro Metadata Speed trackday " image="/blog_img/karting/gopro-gps-trackday-speed.png" subtitle="Getting GPS info during while driving on circuits" >}}
{{< /cards >}}

Can you do something if you dont have bought the [GoProTelemetryExtractor](https://goprotelemetryextractor.com/telemetry-overlay-gps-video-sensors) nor RaceChrono?

Grab my drink and see.

1. Clone this repo:

```sh
git clone https://github.com/JAlcocerT/Py_RouteTracker
cd Z_GoPro
#cd overlay
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Py Route Tracker ↗" icon="github" >}}
{{< /cards >}}

Previously I was using:

* https://github.com/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds.ipynb
* https://github.com/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_TrackDay.ipynb

You can also open it with **Google Colab**: 

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_kart.ipynb)


2. Get **exiftool** ready: *this allow to extract the GPS info from the MP4*

```sh
#choco install exiftool -y
#choco install python -y

#extract the info
exiftool -ee ./GX030411.MP4 > output-kartdec-1a.txt
#exiftool -ee ./GX020410.MP4 > output-kart1.txt #here you will have all go pro data including the gps
```

> Do this before joining the MP4's with ffmpeg or you will loose the acelerations and gps info!

3. Use Python to extract (and plot) GPS info from the txt:

Ive created a new ipynb with addititional *matplotlib based this time* graphs

![Driver lap comparison based on Matplotlib](/blog_img/data-experiments/kart/matplotlib-driver-comparison.png)

Which looks very similar to what it was covered:

<!-- https://www.youtube.com/watch?v=41BHPU7lDIY -->

{{< youtube "41BHPU7lDIY" >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/" title="Matplotlib x YFinance" image="/blog_img/data-experiments/sample-matplotlib-timeseries.png" subtitle="Using Matplotlib to generat TimeSeries Styles Snapshots" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/things-as-a-code/#animations-as-a-code" title="Matplotlib x Flask WebApp" image="/blog_img/AIBI/fastapi-custom-matplotlib.png" subtitle="Custom matplotlib x Graficas LibrePortfolio" >}}
{{< /cards >}}

<!-- ![Custom matplotlib x fastAPI x Graficas LibrePortfolio](/blog_img/AIBI/fastapi-custom-matplotlib.png) -->


**Along the way** I found about: https://github.com/time4tea/gopro-dashboard-overlay

[![shields.io Stars](https://img.shields.io/github/stars/time4tea/gopro-dashboard-overlay)](https://github.com/time4tea/gopro-dashboard-overlay/stargazers)


> GPL 3.0 | Programs to process GoPro MP4 & Generic GPX/FIT files and **create video dashboards** & maps

```sh
#python -m venv venv
#venv/bin/pip install gopro-overlay
uv init
uv add gopro-overlay  #https://github.com/time4tea/gopro-dashboard-overlay/tree/main
#pacman -S ttf-roboto
apt install truetype-roboto
apt install fonts-roboto
```

```sh
#venv/bin/gopro-dashboard.py --gpx ~/Downloads/Morning_Ride.gpx --privacy 52.000,-0.40000,0.50 ~/gopro/GH020073.MP4 GH020073-dashboard.MP4

uv run gopro-dashboard.py /home/jalcocert/Desktop/Py_RouteTracker/Z_GoPro/GX020410.MP4 /home/jalcocert/Desktop/Py_RouteTracker/Z_GoPro/GX020410-dashboard.MP4
```

And **it worked** briliantly: *with rencoding required, so sit back*

But how could I not follow the suck-suck less approach:

<!-- https://youtu.be/jqzzkexAx2I -->

{{< youtube "jqzzkexAx2I" >}}

That was promising, but not so good looking.

So I made a smaller HUD and merge it to the original video:

{{< youtube "7KMAZgdMqGc" >}}
<!-- 
https://youtu.be/7KMAZgdMqGc -->

Then I also tried the output of the gopro dashboard overlay: *see the [video](https://youtu.be/b3hP1J_YVSk)*

![suck vs gopro dashboard overlay python](/blog_img/data-experiments/kart-data.png)

{{< youtube "w2wwC7j882k" >}}

<!-- 
https://youtu.be/w2wwC7j882k 
-->

```sh
time python3.10 /home/jalcocert/Desktop/Py_RouteTracker/overlay/racing_hud_v3c.py
#https://youtu.be/pAhEI2xUxcM
ffmpeg -i /home/jalcocert/Desktop/Py_RouteTracker/Z_GoPro/GX020410.MP4 \
       -i /home/jalcocert/Desktop/Py_RouteTracker/overlay/racing_hud_v3c.mp4 \
       -filter_complex "[1:v]format=rgba,colorkey=0x000000:0.1:0.1[ckout];[0:v][ckout]overlay=W-w-50:H-h-50" \
       -codec:a copy \
       -preset superfast \
       racing_v3c_output.mp4
```

{{< youtube "VJxFuVhYAWQ" >}}

<!-- 
https://youtu.be/VJxFuVhYAWQ
 -->

What else...maybe...automatic lap time?

```sh
python3.10 /home/jalcocert/Desktop/Py_RouteTracker/overlay/lap_timer.py
```

<!-- https://github.com/JAlcocerT/Py_RouteTracker/blob/main/overlay/lap_analysis_v4a.png -->

<!-- ![Lap Analysis](https://raw.githubusercontent.com/JAlcocerT/Py_RouteTracker/main/overlay/lap_analysis_v4a.png) -->

[![Lap Analysis](https://raw.githubusercontent.com/JAlcocerT/Py_RouteTracker/main/overlay/lap_analysis_v4a.png)](https://github.com/JAlcocerT/Py_RouteTracker/blob/main/overlay/lap_analysis_v4a.png)

And as I liked the look n feel of that graph, I brought it to the video overlay:

{{< youtube "G1esduZUw4E" >}}

<!-- 
https://youtu.be/G1esduZUw4E -->


---

## Conclusions

Improve your lap times with RaceChrono.

The Go Pro GPS' Telemetry is great to get started anyways.

And now you can plot those **onboard HUDs** with garmin virb or with any of the seen **custom ways**:

```sh
python3.10 /home/jalcocert/Desktop/Py_RouteTracker/overlay/lap_timer_v5.py #extracts the telemtry txt on its own and you can use it to compare the best laps of a group of friends #https://youtu.be/Ae8CyefuxgY
ffmpeg -f concat -safe 0 \
  -i <(printf "file '$PWD/overlay/Best_Lap_4_81.33s.mp4'\nfile '$PWD/overlay/Best_Lap_1_78.61s_v5.mp4'") \
  -c copy overlay/Joined_Best_Laps.mp4
```

<!-- https://youtu.be/Ae8CyefuxgY -->

{{< youtube "Ae8CyefuxgY" >}}


That will generate the exif telemetry into a `GX020411_telemetry.txt` kind of file.

And will also create a Matplotlib png with the speed profile and the max and min ones per lap.

Together with the video of the fastest lap.

To share your videos without loosing metadata, use localsend, [snapdrop](https://github.com/SnapDrop/snapdrop) or **[pairdrop](https://github.com/schlagmichdoch/pairdrop)**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="Fe vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}

After all: *this has been so much fun*

```sh
time python3.10 /home/jalcocert/Desktop/Py_RouteTracker/overlay/racing_hud_v7.py
```

And got the HUD rendered in ~20min for the 2 GoPro mp4's (the full session) that I wanted to analyze:

<!-- 
https://youtu.be/1qkIjxl47ac 
https://youtu.be/c0YkQhsUNrg
-->

{{< youtube "c0YkQhsUNrg" >}}


As you can see, I ended up adding the 200HZ accerelometer data as well into a G-Circle to complete the HUD:

[![Lap Analysis](https://raw.githubusercontent.com/JAlcocerT/Py_RouteTracker/main/overlay/gforce_debug.png)](https://github.com/JAlcocerT/Py_RouteTracker/blob/main/overlay/gforce_debug.png)

<!-- 
https://youtu.be/c0YkQhsUNrg
 -->

{{< youtube "c0YkQhsUNrg" >}}

Then, added some comments via KDEnlive:

```sh
python3.10 /home/jalcocert/Desktop/Py_RouteTracker/overlay/lap_timer_v7.py
```

![KDENlive Comments](/blog_img/karting/kdenlive-gopro-gps-comments.png)

{{< youtube "Cv0-m9B3l_Y" >}}

[![Lap Analysis](https://raw.githubusercontent.com/JAlcocerT/Py_RouteTracker/main/overlay/lap_compare_table_L1_vs_L5.png)](https://github.com/JAlcocerT/Py_RouteTracker/blob/main/overlay/lap_compare_table_L1_vs_L5.png)


<!-- https://youtu.be/Cv0-m9B3l_Y -->

As you can see, the code is completely free and open.

If you got doubts or need a custom implementation, you can reach out:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="My Consulting Service Tier" >}}
{{< /cards >}}

**Next steps**

If anything, when doing sth related to racing + Data *will probably be*:

0. Next GoPro videos will have the HUD + the kdenlive comments all in one
1. A Desktop App to embed the cool telemetry seen here!
2. The optimum Path thingy
3. Go all in with embeded analytics and IoT with that u-blox GPS module and a micro-controller

### Others

#### Lap Timer

I put together a script based on the Go Pro GPS telemetry to infer the lap times (based on the seconds when we are going through the start line the first time as reference):

```sh
python3.10 /home/jalcocert/Desktop/Py_RouteTracker/overlay/lap_timer_v4c.py
```

It will get you a Matplotlib based graph with the speed profile, the max and min ones per lap and also will cut the video +-5 seconds to **give you the fastest lap**!

> It generates something like `Best_Lap_4_81.33s.mp4`

So you can compare with your friends and see how to improve. Or just share it to youtube.


From v6, it also allows to compare 2 laps of the same video:

```sh
python3.10 /home/jalcocert/Desktop/Py_RouteTracker/overlay/lap_timer_v6.py
```

[![Laps Comparison](https://raw.githubusercontent.com/JAlcocerT/Py_RouteTracker/main/overlay/lap_compare_L1_vs_L5.png)](https://github.com/JAlcocerT/Py_RouteTracker/blob/main/overlay/lap_compare_L1_vs_L5.png)


---

## FAQ

<!-- 
https://youtu.be/tQOxnCz2lwM?si=XTgvyi-qnm3ZKiAl
 -->

{{< youtube "tQOxnCz2lwM" >}}


### Android Apps

1. [Torque](#torquelite-and-torquepro)
2. inCarDoc
3. Car Scanner
4. ScanMaster-ELM
5. https://github.com/fr3ts0n/AndrOBD/

> Android **OBD** diagnostics with any ELM327 adapter

* https://f-droid.org/packages/com.fr3ts0n.ecu.gui.androbd/


{{< youtube "LToBbKTHAkw" >}}

AndrOBD (Connect to your car's OBD system)

* https://f-droid.org/packages/com.fr3ts0n.ecu.gui.androbd/
* https://github.com/offa/android-foss

{{< details title="OBD...CANBUS...? 📌" closed="true" >}}

**OBD-II (On-Board Diagnostics II):**

OBD-II is a standardized system used in most cars since the mid-1990s.  Its primary purpose is to monitor the vehicle's emissions systems and report any faults.

When a problem is detected (like a misfiring engine or a faulty sensor), a Diagnostic Trouble Code (DTC) is stored, and the "check engine" light (or similar warning light) is illuminated on the dashboard.

OBD-II also provides access to a wealth of real-time data from the car's various sensors and systems, such as engine speed (RPM), vehicle speed, coolant temperature, and more.  

This data can be very useful for diagnostics, performance monitoring, and even custom applications.

**CAN Bus (Controller Area Network):**

**CAN bus** is a robust and efficient communication protocol widely used in vehicles.

It's a serial communication system that allows different electronic control units (ECUs) within the car to communicate with each other.  

For example, the engine control unit (ECU), transmission control unit, anti-lock braking system (ABS), and airbag control unit can all communicate over the CAN bus.

Think of CAN bus as the *nervous system* of the car, allowing different components to exchange information.  

OBD-II typically uses CAN bus as its physical layer for communication. 

So, when you access OBD-II data, you're usually doing so by reading data transmitted over the CAN bus.

{{< /details >}}

{{< details title="ELM327...ESP32? 📌" closed="true" >}}

**The ELM327 Chip:**

The ELM327 is a **popular microcontroller** chip that acts as a bridge between a computer (or other device) and the car's OBD-II port (and thus, the CAN bus).

It's a pre-programmed chip that handles the complex task of translating OBD-II requests into CAN bus messages and vice versa.

* **Ease of Use:**  The ELM327 simplifies OBD-II access significantly.  It provides a standardized command set that makes it relatively easy to read data from the car's systems. You don't need to deal with the low-level details of the CAN bus protocol directly.
* **Cost-Effective:** ELM327-based devices are readily available and affordable.  This has led to a proliferation of OBD-II scanners and software.
* **Open Source and Community Support:**  There's a large community of developers who have created open-source tools and libraries for working with the ELM327.  This makes it easier to develop custom applications.

**ELM327 vs. ESP32:**

While both are microcontrollers, they serve different purposes in this context:

* **ELM327:** Specifically designed for OBD-II communication. It has built-in firmware to handle the intricacies of OBD-II protocols and CAN bus.
* **ESP32:** A general-purpose microcontroller with Wi-Fi and Bluetooth capabilities.  It can be used for a wide range of tasks.  To use an ESP32 for OBD-II communication, you would typically need to add a CAN bus transceiver chip (like the MCP2515) and write firmware to implement the OBD-II protocols.

Think of it this way:  The ELM327 is like a specialized translator for OBD-II.  The ESP32 is a more general-purpose computer that *could* be used for OBD-II communication, but it requires more setup and programming.

**In summary:**

* OBD-II is the standardized diagnostic system.
* CAN bus is the communication network used by OBD-II.
* The ELM327 is a chip that makes it easy to interface with OBD-II over CAN bus.
* The ELM327 is purpose-built for OBD-II, while the ESP32 is a general-purpose microcontroller that can be *used* for OBD-II with additional hardware and software.


{{< /details >}}

#### TorqueLite and TorquePro

You can buy (or not) the Pro version.

I did so to support the project and see what else can i get from the OBD2.


### CANBUS with UBUNTU

You can read and interact with a CAN bus using the Ubuntu command-line interface (CLI).

However, it requires some setup and the use of specialized tools.

**1. Hardware Requirements:**

* **CAN Interface:** You'll need a CAN interface device. This could be a USB-to-CAN adapter, a PCI card with CAN capabilities, or even a Raspberry Pi with a CAN shield.  There are many options available.  The key is that it needs to be compatible with Linux and have drivers available.

* **Cables:** You'll need the appropriate cables to connect your CAN interface to the CAN bus of your target system (e.g., a car, industrial equipment, etc.).

**2. Software Installation (using `apt`):**

The primary tools you'll need are from the `can-utils` package:

```bash
sudo apt update  # Update package lists
sudo apt install can-utils
```

This package provides command-line utilities for working with CAN buses.

**3. Configuring the CAN Interface:**

* **Bring Up the Interface:**  After connecting your CAN interface, you'll need to bring it up.  The exact command depends on your interface, but it's often something like this (replace `can0` with the actual interface name if different):

```bash
sudo ip link set up can0 type can bitrate 500000  # Set bitrate (adjust as needed)
```

The bitrate (500000 in this example) *must* match the bitrate of the CAN bus you're trying to connect to. 

If you don't know the bitrate, you might need to experiment or consult documentation. 
   
You can find out existing interface names and their status by running `ip a`.

* **Verify Interface:** Check if the interface is up:

```bash
ip a  # Look for the can0 (or your interface) and check its status. It should say "UP"
```

**4. Reading CAN Data:**

* **`candump`:** This utility displays CAN messages in real-time:

```bash
candump can0  # Listen on can0
candump can0 -c 10 # Listen on can0 for 10 messages
candump can0 -t a # Add timestamps to the messages
```

This will show you the CAN ID, data bytes, and other information for each message.

**5. Sending CAN Messages:**

* **`cansend`:** This utility allows you to transmit CAN messages:

```bash
cansend can0 123#0102030405060708  # Send message with ID 123 and data 01 02 03 04 05 06 07 08
```

Replace `123` with the CAN ID and the data bytes with the information you want to send.

5. https://github.com/Schildkroet/CANgaroo

> An open source can bus analyzer with support for transmit/receive of standard and FD frames and DBC decoding of incoming frames

**6. Other Useful Tools:**

* **`can-config`:**  Used for configuring CAN interfaces.
* **`cananalyze`:** A simple GUI tool for analyzing CAN traffic (you might need to install it separately: `sudo apt install cananalyzer`).

**Example Workflow:**

1. Connect your CAN interface.
2. `sudo ip link set up can0 type can bitrate 500000` (adjust bitrate).
3. `candump can0` (to see what's on the bus).
4. `cansend can0 123#...` (to send messages).

**Important Considerations:**

* **Bitrate:** Getting the correct bitrate is crucial.  If it's wrong, you won't be able to communicate.
* **CAN ID:**  You need to know the correct CAN IDs to send messages to specific devices.
* **Data Format:**  CAN data is raw bytes.  You'll need to understand the protocol used on the CAN bus to interpret the data correctly.  This often involves looking at the documentation for the device you're communicating with.
* **Safety:** When working with CAN bus, especially in vehicles, be very careful. Sending incorrect messages can have unintended consequences.  Always double-check your commands and make sure you understand what you're doing.

**Python Integration (Optional):**

You can also use Python libraries like `python-can` to interact with CAN buses programmatically.  

This gives you more flexibility for processing and analyzing CAN data.  

You would still need to install the `can-utils` and configure the interface as described above.

This information should get you started with reading and writing to a CAN bus using the Ubuntu CLI. 

Remember to consult the documentation for your specific CAN interface and the device you're communicating with.

#### CANBUS and Py

* https://python-can.readthedocs.io/en/stable/

<!-- 
https://www.youtube.com/watch?v=fKz4TSvme6Q
-->

{{< youtube "fKz4TSvme6Q" >}}


---

## Interesting Racing Software

For bookings:

* https://www.aim-sportline.com/en/sw-fw-download.htm
* https://www.aim-sportline.com/docs/racestudio3/html/release/download-release.html

<!-- 
https://www.youtube.com/watch?v=qhyeRS892uM 
-->

{{< youtube "qhyeRS892uM" >}}