---
title: "Plants while travelling"
date: 2026-05-05T01:20:21+01:00
draft: false
tags: ["Tinkering IRL","Watering Plants x Pi Camera","VPD"]
description: 'Inspiration for real world projects before a trip.'
url: 'plants-103-inspiration'
---

**Tl;DR**

Prep work for when you [go on a trip](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/) and you have [tomatoes at home](https://jalcocert.github.io/JAlcocerT/plants-101/#growth-experiment)


**Intro**

We come from:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditionRemorion" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}

And I know you love [travelling](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/).

You can use the setups I will explain accordingly to [the typical weather](#when-is-the-best-weather-to-plant-what) while you are not at home.


### The IoT and Controlled Watering


Watchout for [that EMR kickback](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/#how-to-avoid-frying-an-esp32-due-to-kickback) when the DC switches off

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101/tree/master/sample-pyscipe" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditingRemotion/tree/main/remotion-electronics" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}

{{< youtube "1veGKSFzqcQ" >}}




### The Capilarity approach

Aka just physics approach.


## Monitoring Plants while Travelling

<!-- ![Pi Camera](/blog_img/hardware/RPi4_2gb_cam.jpg) -->


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/" title="Pi Cam 101" image="/blog_img/hardware/RPi4_2gb_cam.jpg" subtitle="Using the raspberry camera for the first time" >}}
{{< /cards >}}

Particularly [with mjpg-streamer](https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/#pi-camera---video-streaming)

```sh
#git clone https://github.com/meinside/rpi-mjpg-streamer 
git clone https://github.com/JAlcocerT/rpi-mjpg-streamer
cd rpi-mjpg-streamer
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/rpi-mjpg-streamer" title="RPi mjpg streamer | Docker Config 🐋 ↗" >}}
{{< /cards >}}

#### The DHT Home Monitoring


I modified it recently to just be Node x PGsql (TimescaleDB)

Going from this:

![DHT Webapp](https://raw.githubusercontent.com/JAlcocerT/RPi/main/Z_MicroControllers/dht-webapp/dht-webapp.png)

To:

```sh
#docker ps | grep emqx
#cd ./RPi/Z_SelfHosting/pgsql
#docker ps | grep timescaledb
cd ./RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd-poc
docker compose up -d --build
#Web → http://<host>:8001 · DB → localhost:5433.
docker compose up -d --build webapp
#docker compose up -d #and here it goes timescaleDB + all the webApp
#docker exec -it timescaledb psql -U pico -d sensors
```

![DHT22 x VPD x pgsql Webapp](https://raw.githubusercontent.com/JAlcocerT/RPi/main/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd-poc/dht22-vpd.png)


> The one you can visit anytime at `http://192.168.1.2:8077/`

#### MQTT x Alerts

1. Initially I thought about webhooks
2. Then, I reminded that I [tried gotify last year](https://jalcocert.github.io/JAlcocerT/wedding-photo-galleries/#gotify)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/gotify/" title="Gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ntfy/" title="Ntfy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

---


## Conclusions

{{< youtube "MZTt8ICeF0Y" >}}

### Growth Experiment

How are the plants doing after ~6 weeks of planting them?



---

## FAQ

### When is the best weather to plant what?

You can use my [latest trip-planner v4](https://github.com/JAlcocerT/Py_Trip_Planner/tree/main/poc-trip-planner-v4) as launched [here]()

```sh
git clone https://github.com/JAlcocerT/Py_Trip_Planner
cd ./Py_Trip_Planner/poc-trip-planner-v4
#npm run dev
```

![alt text](/blog_img/apps/TripPlanner/trip-planner-v4.png)


Get the patters to know what to expect depending when you will be leaving your plants alone.

### Inspiring resources


You get a walk around AC/DC power transmission

{{< youtube "45DNG8eUhwY" >}}


{{< callout type="info" >}}
For transmiting power at same V, DC is more efficient than AC
{{< /callout >}}

<!-- https://www.youtube.com/watch?v=45DNG8eUhwY -->


{{< youtube "lYdx68V2jt0" >}}

<!-- https://www.youtube.com/watch?v=lYdx68V2jt0 -->


{{< callout type="info" >}}
Turbines are a thing:
{{< /callout >}}


### Concepts

1. VPD - 