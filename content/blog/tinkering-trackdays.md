---
title: "People out there are really creative. Trackdays and Telemetry"
date: 2025-02-24
draft: false
description: 'What I learnt after exchanging few words about car racing, canbus and telemetry.'
url: 'tinkering-telemetry-trackdays'
---

ELM32 vs ESP32

## Trackday and GoPro MetaData

<!-- 
https://www.youtube.com/watch?v=xoOZMAEtqBc 
-->

By the end of last year, a friend got the chance to do this:

{{< youtube "xoOZMAEtqBc" >}}

And it was all recorded with a Go Pro apparently!

So...we can do our [GoPro telemetry trick](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9)

Which basically tells us a lot about **speeds recorded by GoPro GPS** on the 3 video parts which were recorded at 4K30:

You can also open it with **Google Colab**: [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_TrackDay.ipynb)

<!-- 
https://github.com/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_TrackDay.ipynb
 -->


**Max Speed**: 41.35 m/s (**148.86 km/h**)
Average Speed: 22.03 m/s (79.30 km/h)
Median Speed: 21.62 m/s (77.84 km/h)

Max Speed: 40.74 m/s (146.65 km/h)
Average Speed: 22.13 m/s (79.66 km/h)
Median Speed: 21.24 m/s (76.46 km/h)

Max Speed: 41.16 m/s (148.18 km/h)
Average Speed: 21.30 m/s (76.68 km/h)
Median Speed: 19.88 m/s (71.57 km/h)

![GoPro Metadata Speed trackday](/blog_img/karting/gopro-gps-trackday-speed.png)

## BMW E36 and Canbus

**Six** in line cilynders of pure joy.

This project ESP32 based and json configurable sounds just amazing:

* https://github.com/handmade0octopus/gauge.s-sorek.uk

> [Gauge.S](https://sorek.uk/) is all-car datalogger and development board.



For the future...maybe a contactless brake temperature system?

We can, with a MLX Sensor!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-iot-MLX90614/" title="MLX90614 with a Pi" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Infrared Temperature Sensor" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}




---

## More Software for Track

1. Harris Lap Timer
2. [Gauge 5S](https://shop.sorek.uk/) for BMW
3. [Dashware](https://dashware.software.informer.com/)

> Synchronizes data from applications with a camera recording

### What about PhyPhox

{{< callout type="info" >}}
Sometime ago, I was **tinkering with [PhyPhox](https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/)**
{{< /callout >}}

And lately...I recorded how it feels (the data behind) an **airplane take-off**:

<!-- 
https://youtube.com/shorts/Z9xNMP3nW0A?feature=share 
-->

{{< youtube "Z9xNMP3nW0A" >}}

```sh
ffmpeg -i IMG_5294.MOV -ss 00:03:35 -to 00:05:25 -c copy output.MOV
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="More Video Tricks ↗" >}}
{{< /cards >}}

How does it look the data?

You guessed it, you can process PhyPhox Data with Python:

You can also open it with **Google Colab**: [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore_speeds_TrackDay.ipynb)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/" title="PhyPhox Post" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Physical experiments with a Phone" >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker/tree/main/Data_PhyPhox" title="Route Tracker Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code PhyPhox Airplane EDA" >}}
{{< /cards >}}