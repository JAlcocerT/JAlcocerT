---
title: "Geospatial Data Tricks and a GoPro"
date: 2025-01-05T23:20:21+01:00
draft: false
tags: ["Dev","FFMPeg","Python GeoData","PhyPhox"]
description: 'What Ive learnt so far about GeoSpatial/Geolocation Data Analysis. Applied to GoPro MetaData and Telemetry Extraction. And karting!'
url: 'geospatial-data'
math: true
---



## GeoSpatial Data Formats


{{< callout type="info" >}}
Geospatial learnings are placed at [RouteTracker Repo](https://github.com/JAlcocerT/Py_RouteTracker) 💻
{{< /callout >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/keystaticcms-astrodb/#animations" title="Tinkering with Animations | Post" image="https://img.youtube.com/vi/YuvHXyFeRV4/hqdefault.jpg" subtitle="Posting to Twitter or Youtube those animations 101." >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="RouteTracker Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Tinkering with GPX" >}}
{{< /cards >}}


### GeoJSON

With [R language](https://jalcocert.github.io/JAlcocerT/useful-r-stuff/) I learnt about many other formats.

One of them was **GeoJson**.

### GPX

While [riding bikes](https://jalcocert.github.io/JAlcocerT/buying-bicycle-through-data-analytics/), I got to know GPX format.

Phone apps like Komoot or even [PhyPhox can save the GPS records as GPX files](https://www.leafwindow.com/en/get-gps-log-with-phyphox-and-plot-it-with-wp-gpx-maps-en/)


https://github.com/exiftool/exiftool/blob/master/fmt_files/gpx.fmt

## GoPro Metadata Extraction

* https://github.com/gopro/gpmf-parser

> Parser for GPMF™ formatted telemetry data used within GoPro® cameras.


{{< callout type="info" >}}
Related Projects Files are at [RouteTracker](https://github.com/JAlcocerT/Py_RouteTracker/tree/main/Z_GoPro) 💻
{{< /callout >}}


* https://github.com/exiftool/exiftool
    * https://medium.com/@jrballesteros/a-simple-guide-to-extract-gps-information-from-gopro-photos-and-videos-cf6edf6dc601
    * https://github.com/exiftool/exiftool/blob/master/fmt_files/gpx.fmt

> GPLv3 | ExifTool meta information reader/writer


People do this kind of **cool stuff**:

<!-- https://www.youtube.com/watch?v=2eDWxUTfZHY -->

{{< youtube "2eDWxUTfZHY" >}}


### Garmin VIRB Edit

[Garmin **VIRB** Edit](https://www8.garmin.com/support/download_details.jsp?id=6591), which works for Windows
 and does not work out of the box for Linux:

<!-- https://www.youtube.com/watch?v=s5v9ZCwcung -->

{{< youtube "s5v9ZCwcung" >}}

### Telemetry Overlay

There is a possibility to use paid Programs to create these kind of videos:

<!-- https://www.youtube.com/watch?v=3Y-lh6hbp14 -->
<!-- https://www.youtube.com/watch?v=Oimk7-vG5pk -->

{{< youtube "3Y-lh6hbp14" >}}

{{< callout type="info" >}}
Veeeery interesting how those 390cc and 15cv (77) differ from the 390cc 18 cv (80) and 460cc 22cv (88km/h topspeed)
{{< /callout >}}

### Exif and Python with GoPro

We can extract Go Pro Metadata with this simple CLI tool in Linux:

```sh
sudo apt-get install libimage-exiftool-perl #install exif
#exiftool -ee ./GX030390.MP4 #you will see it on CLI
exiftool -ee ./GX030390.MP4 > output-GX030390.txt #saves it
```

And now you got a `.txt` with all the information, ready to get it analyzed with python.



{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9" title="GoPro MetaData Magic 101 " image="/blog_img/karting/gopro-speed-sample.png" subtitle="OA5 Firmware and comparison with GoPro" >}}
{{< /cards >}}

#### Extracting Location Data from GoPro MP4

For this kind of videos, can be done as per the notebook.

{{< youtube "BTJS-2hD2qk" >}}

<!-- https://www.youtube.com/watch?v=BTJS-2hD2qk -->

The GoPro provides ~10Hz GPS information.

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Z_GoPro/gopro_explore.ipynb)

#### Extracting Speed Data from GoPro MP4

You can just do:

```sh
sudo apt-get install libimage-exiftool-perl
exiftool -ee ./GX030390.MP4 #adapt as per your GoPro file name
#exiftool -ee ./GX030390.MP4 > output.txt
```

And Plotly, to get such map graphs from the GoPro:

![GoPro Metadata Map](/blog_img/karting/gopro-speed-sample.png)


---

## PhyPhox Data Extraction


Hey, but why would you want to...

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/" title="PhyPhox" image="/blog_img/iot/phyphox-android.jpg" subtitle="Physical Experiments with an Android Phone" >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Route Tracker on Github" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Analyzing Routes,karting Data...with Python" >}}
{{< /cards >}}

<!-- 
![Phyphox Android Karting](/blog_img/iot/phyphox-android.jpg) 
-->

You can even see what happens when a plane takes off:

{{< youtube "Z9xNMP3nW0A" >}}


---

## Polar Data Extraction

<!-- [![Python Notebook - RoutePolar](/img/OpenInColab.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Py_RoutePolar.ipynb) -->
<!-- 
[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Py_RoutePolar.ipynb) -->

You can try the Polar Devices Metadata extractions:

You can also open it with: [![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Py_RouteTracker/blob/main/Py_RoutePolar.ipynb)

<!-- ![PhyPhox Karting](/blog_img/iot/phyphox-android.jpg) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/" title="Polar Data" image="/blog_img/iot/Zonas-Cardiacas.png" subtitle="With Python" >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Route Tracker" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Analyzing Routes Data with Python" >}}
{{< /cards >}}

<!-- ![Heart zones](/blog_img/iot/Zonas-Cardiacas.png) -->


---

## FAQ

### DJi Metadata Extraction

The DJi OA5Pro does **NOT** have a **GPS**.

Videos can look like this one, really interesting image quality!

<!--
https://studio.youtube.com/video/2ZSDeD3HzHg/edit
 -->

{{< youtube "2ZSDeD3HzHg" >}}



Im now using **rsync** to move the **big video files**:

```sh
#cp *.MP4 /home/jalcocert/Desktop/oa5pro/
rsync -avP *.MP4 /home/jalcocert/Desktop/oa5pro/ #speeds of ~32mb/s from internal card!
#rsync -avP *.MP4 /media/jalcocert/Backup2TB/DJI-OA5Pro #copy it to an external SSD

#rm *.LRF #clean if needed LRF
```

## Learn with this one

### Video to Image to GIF

How about: **extracting images** from a video...and **making a gif** with them?

The choice between PNG and JPG depends on the trade-off between **image quality** and **file size**:  

1. From a timeframe until the end, 1 frame:

```bash
#from second 90 of the video, give me 1fps
ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.png
ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.jpg
```

- **Use PNG** if you need **high-quality**, lossless images.
- **Use JPG** if you want smaller file sizes and are okay with slight quality loss.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/Video2Images" title="Video2Images ↗" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/Images2Gif" title="Images2Gif ↗" >}}
{{< /cards >}}

2. And just **between 90s and 105s** timeframe, 1fps:

```sh
ffmpeg -i DJI_20250116072528_0035_D.MP4 -vf "select='between(t,90,105)',fps=1" -vsync vfr frame_%03d.png
```

> This is an interesting way to **generate Images for YT** Videos!

{{< callout type="info" >}}
And if the image is too big, [you can reduce it](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#image-caption).
{{< /callout >}}


### More power is good BUT

But!

Speed wont increase that quick.

Its all about physics.

Remember that the **kinetic energy** of a body goes as: $KE = \frac{1}{2}mv^2$

**The relationship isn't linear**, so these percentages describe the *change* but don't explain the *why* behind the change (as discussed in the previous response about non-linear relationships).

Let's break down the relationship between force, acceleration, power, and kinetic energy using KaTeX for the equations.


Newton's second law of motion states: $F = ma$

where:

* `F` is the force applied to the object
* `a` is the acceleration of the object (the rate of change of velocity)


Power (P) is defined as the rate at which work is done, or the rate at which energy is transferred.  

When a force is applied to an object and causes it to move, work is done.  

**Power** can be expressed as: $P = Fv$

where `v` is the *instantaneous* velocity of the object.

> So more power, gives you a higher force (to keep accelerating), at a given speed.

The *work-energy theorem* states that the work done on an object is equal to the change in its kinetic energy.  

When a force causes an object to accelerate, it does work on the object, and this work appears as an increase in the object's kinetic energy.

Let's consider a small change in kinetic energy (`dKE`) due to a small change in velocity (`dv`).  We can differentiate the kinetic energy equation:

$$
d(KE) = d(\frac{1}{2}mv^2) = \frac{1}{2}m(2v \, dv) = mvdv
$$

Now, we know that acceleration `a` is the rate of change of velocity with respect to time:  `a = dv/dt`.  Therefore, `dv = a dt`. Substituting this into the equation above:

$$
d(KE) = mv(a \, dt) = (ma)v \, dt
$$

Since `F = ma`, we have:

$$
d(KE) = Fv \, dt
$$

The change in kinetic energy (`dKE`) over a small time interval (`dt`) is equal to the force (`F`) times the velocity (`v`) times the time interval (`dt`).


Notice that `Fv` is the power (P). So, we can write: $d(KE) = P \, dt$

This equation tells us that the change in kinetic energy is equal to the power applied multiplied by the time interval over which the power is applied.

Integrating both sides with respect to time gives the total change in kinetic energy:

$$
\Delta KE = \int P \, dt
$$

If the power is constant over a time interval `Δt`, then:

$$
\Delta KE = P \Delta t
$$

> The change in kinetic energy is equal to the work done, which is equal to the power applied multiplied by the time interval.


{{< callout type="info" >}}
Thanks to [Hextra and Katex](https://imfing.github.io/hextra/docs/guide/latex/)
{{< /callout >}}


**Calculations:**

* **Percentage Change = (New Value - Old Value) / Old Value * 100%**

**1. 390cc 15 cv (77 km/h) to 390cc 18 cv (80 km/h):**

* **Power Increase:** (18 - 15) / 15 * 100% = 20%
* **Speed Increase:** (80 - 77) / 77 * 100% ≈ 3.9%

**2. 390cc 15 cv (77 km/h) to 460cc 22 cv (88 km/h):**

* **Power Increase:** (22 - 15) / 15 * 100% ≈ 46.7%
* **Speed Increase:** (88 - 77) / 77 * 100% ≈ 14.3%

**3. 390cc 18 cv (80 km/h) to 460cc 22 cv (88 km/h):**

* **Power Increase:** (22 - 18) / 18 * 100% ≈ 22.2%
* **Speed Increase:** (88 - 80) / 80 * 100% = 10%

**Summary Table:**

| Comparison                                 | Power Increase (%) | Top Speed Increase (%) |
| ------------------------------------------- | ----------------- | ----------------- |
| 15 cv to 18 cv (same cc)                   | 20                | 3.9               |
| 15 cv to 22 cv (different cc)              | 46.7              | 14.3              |
| 18 cv to 22 cv (different cc)              | 22.2              | 10                |


<!-- https://www.youtube.com/watch?v=pjnHdBSDm6A&pp=ygUkNSBjaWx5bmRlcnMgdnMgNiBjaWx5bmRlcnMgZm9ybXVsYSAx -->

{{< youtube "pjnHdBSDm6A" >}}

> You can see there 6 cyl goes to 325 and 5 cyl goes up to 304km/h (6% diff)


**Important Reminder:**

These percentage increases show the *change* in power and speed, but they *do not* imply a direct, proportional relationship.

Factors like aerodynamic drag, gearing, weight, and other variables play a crucial role, especially at higher speeds.

The smaller speed increase from 15 cv to 18 cv illustrates this point—even with a 20% power increase, the speed gain was relatively small due to the influence of these other factors.

Also, these are top speed at different days, by different drivers.

Lower temperatures can benefit lap times due to increased engine power, but it's crucial to consider tire temperature.

The optimal temperature for the best lap times is a balance between these two factors and can vary depending on the track, kart setup, and driver skill.