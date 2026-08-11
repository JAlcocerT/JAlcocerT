---
title: "Optimal Karting Line"
date: 2026-08-14
draft: false
tags: ["Racing x PWA","GPS","Nürburgring x SPA","Proton CLI","OSS Photo stack"]
description: 'Go-Pro Telemetry gone wild.'
url: 'optimal-karting-line'
---

**TL;DR**

The tailwind is strong as long as you dont get 529 status on CC.

**Intro**

Coming from [here](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/) and [here](https://jalcocert.github.io/JAlcocerT/reinforce-learning-racing-simulator/#conclusions)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/obfuscate" title="DIY JAlcocerTech x Obfuscation | Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/1ton-ebooks" title="ebboks JAlcocerTech | Github ↗" icon="github" >}}
{{< /cards >}}

The GD was the one that [worked best so far](https://jalcocert.github.io/JAlcocerT/kart-optimum-path/#the-results)

{{< youtube "orzYl6u35ec" >}}

<!-- https://youtu.be/orzYl6u35ec -->

## Go Pro Telemetry Overlay

Tinker around your [gopro gps telemetry](https://jalcocert.github.io/JAlcocerT/geo-data-analytics/) and the **Spa and Nurburgring** circuits:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/obfuscate" title="DIY JAlcocerTech x Obfuscation | Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/1ton-ebooks" title="PyRouteTracker | Github ↗" icon="github" >}}
{{< /cards >}}


```sh
git clone 
```

### Nurburgring

The kind of track day that you wouldnt miss with your friends for anything in the world


{{< youtube "v1I5b4-JE00" >}}


### Spa




#### Karting


<!-- 
https://www.youtube.com/watch?v=v1I5b4-JE00&t=9s 
-->

{{< youtube "v1I5b4-JE00" >}}


> Where are these videos from? An [European roadtrip](#tools-and-tech-for-trips)!


## Optimum path

Under the honest κ-fix physics, the real driver is 3.35 s faster than the model says is theoretically possible. 

The exact numbers:

- Real fastest lap (GX020010 lap 2): 78.20 s  
- κ-fix N=400 honest theoretical optimum: 81.55 s
- Gap: −3.35 s (real beats the calibrated model)

That doesn't mean the driver is magically beating physics — it means the model is under-stating what the kart can actually do. Two consistent stories from today's analyses:

1. The driver is faster in both corners and straights, but more on straights:    - corners: −1.08 s (driver gains 1.1 s net)

  - straights: −2.26 s (driver gains 2.3 s)
  - total: −3.35 s

2. The sensitivity sweep says the model's max_lateral_g = 0.95 is the most sensitive parameter at −27.5 s/g. Bumping it to 1.07 g (+12%) would bring the sim down to ~78 s and match your fast lap. That's a believable  correction: the calibrated 0.95 g came from yaw-rate-κ-based lap-time matching, which slightly under-counts true peaks. The sustained-vs-transient-peak distinction is exactly what Phase 4's load-transfer model would
capture.

3. The pro's 75 s sits another ~3 s below your 78.20, which the sensitivity sweep says needs another +0.12 g of lateral — total 1.19 g. That's high-but-plausible for harder/fresher tires (the pro likely had different  equipment too).

So the honest, today-as-of-now reading is:

he calibrated point-mass model is slightly conservative — about 1.07 g of "true effective" lateral grip vs. the 0.95 g it has calibrated. 

Once Phase 4's bicycle model captures the transient grip from load transfer, the gap to your real laps should close (and possibly close further toward the pro). 

The driver isn't superhuman; the model is leaving 3 s on the table because it can't represent trail-braking and load transfer.

> Real-beats-sim by 3 s, mostly explainable by transient grip the ellipse can't represent is exactly what richer dynamics should fix.


### Nurburgring World Record

## PWA - gopro telemetry extractor

Not enough with the ulm/ppl exam to get traffic at jalcocretech?

here is sth more:

---

## Conclusions


---

## FAQ

### Linux 101


#### Files Sync

1. Nextcloud

2. Proton CLI

3. Rsync

4. You can play your own music and videos via: jellyfin and ultrasonic in android / ios / [supersonic](https://github.com/supersonic-app/supersonic/releases) (connects to subsonic or jellyfin) for desktop

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/qbittorrent" title="QBittorrent Docker Config 🐋 ↗" >}}
{{< /cards >}}

#### OSS Photo Video

For photo:

1. Upscayl
2. 

For video I tend to get away with ffmpeg

If you need more:

1. 
2. 
3. 

#### Gaming



### Tools and Tech for Trips

1. https://github.com/spliit-app/spliit
2. A trip planner like [this](https://github.com/JAlcocerT/Py_Trip_Planner/tree/main/poc-trip-planner-v4) https://trip-planner-9lt.pages.dev/?sid=07621&lat=43.1833&lon=0&name=Tarbes+Ossun+Lourdes&country=FR

3. https://github.com/itskovacs/trip/releases/tag/1.47.0

### My fav PWAs



[Spliit](https://spliit.app/), and a [quick pwa poc](https://github.com/JAlcocerT/poc/tree/main/pwa-spliit-analyzer) i created around it

```sh
cd ./poc/pwa-spliit-analyzer
C:\Python312\python.exe -m http.server 5173 --bind 127.0.0.1
```

Some, like https://app.files.md/ allow you to interact with your local files!

Or with your fpv/drones hardware: `https://app.betaflight.com/#`