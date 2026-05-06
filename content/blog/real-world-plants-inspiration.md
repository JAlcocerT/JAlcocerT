---
title: "Plants while travelling"
date: 2026-05-05T01:20:21+01:00
draft: false
tags: ["Tinkering IRL","Watering Plants x Pi Camera","VPD","Frigate"]
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


Watchout for [that EMF kickback](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/#how-to-avoid-frying-an-esp32-due-to-kickback) when the DC switches off

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101/tree/master/sample-pyscipe" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditingRemotion/tree/main/remotion-electronics" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}

This was possible by combining PySpice with RemotionJS:

{{< youtube "1veGKSFzqcQ" >}}




### The Capilarity approach

Aka just physics approach.


## Monitoring Plants while Travelling

<!-- ![Pi Camera](/blog_img/hardware/RPi4_2gb_cam.jpg) -->

Some time ago I put together [this repo folder](https://github.com/JAlcocerT/RPi/tree/main/Z_RPi_Cam) to use your Pi as a streaming camera:

```sh
choco install rpi-imager
#ip neigh
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/" title="Pi Cam 101" image="/blog_img/hardware/RPi4_2gb_cam.jpg" subtitle="Using the raspberry camera for the first time" >}}
{{< /cards >}}

Particularly [with mjpg-streamer](https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/#pi-camera---video-streaming)

```sh
ip neigh show 192.168.1.18
git clone https://github.com/JAlcocerT/RPi
#git clone https://github.com/JAlcocerT/Home-Lab 
cd ./RPi/Z_SelfHosting
sudo bash homelab-selfhosting.sh
#docker --version #Docker version 26.1.5+dfsg1, build a72d7cd
```

{{< callout type="warning" >}}
Remember to enable the pi camera!
{{< /callout >}}

```sh
#vcgencmd get_camera
sudo raspi-config #OV5647 sensor (the classic 5MP Camera Module v1.3)
```

Now, these are the ones working: *for Debian Trixie*

```sh
rpicam-hello #Linux jalcocert 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux
rpicam-still -t 1000 -o pico.jpg --nopreview
scp jalcocert@192.168.1.18:~/pico.jpg .
```

As you can imagine, this worked back in time, but for the latest Trixie OS its...tricky

```sh
rpicam-vid -t 15000 --width 1920 --height 1080 --framerate 30 \
--bitrate 10000000 --codec h264 -o clean_1080p.h264

ffmpeg -framerate 30 -i clean_1080p.h264 -c:v copy clean_1080p.mp4

scp jalcocert@192.168.1.18:/home/jalcocert/RPi/Z_SelfHosting/Frigate/clean_1080p.mp4 .
```

There where [some gotchas](https://github.com/JAlcocerT/RPi/tree/main/Z_SelfHosting/Frigate#gotchas-we-hit-in-order), but [this Frigate stack](https://github.com/JAlcocerT/RPi/blob/main/Z_SelfHosting/Frigate/docker-compose.yaml) also does the trick.

As i just wanted to see, I disabled the recordings at the `config.yml` [like so](https://github.com/JAlcocerT/RPi/tree/main/Z_SelfHosting/Frigate#enabling-recording-later-if-you-want-it)


```sh
cd ./RPi/Z_SelfHosting/Frigate
sudo docker compose stop      # stop both containers (keeps them, fast restart)
sudo docker compose start     # start them again
sudo docker compose down      # stop + remove containers (network too)
sudo docker compose up -d     # recreate from compose files (use after editing them)
```

![DHT22 x VPD x pgsql Webapp](https://raw.githubusercontent.com/JAlcocerT/RPi/main/Z_SelfHosting/frigate.png)


{{< callout type="info" >}}
More about Frigate in a future post, for now [enjoy the setup](https://github.com/JAlcocerT/RPi/tree/main/Z_SelfHosting/Frigate) at `http://192.168.1.18:5000/`
{{< /callout >}}

#### The DHT Home Monitoring


I modified it recently to just be Node x PGsql (TimescaleDB)

Going from this:

![DHT Webapp](https://raw.githubusercontent.com/JAlcocerT/RPi/main/Z_MicroControllers/dht-webapp/dht-webapp.png)


To [such stack](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd-poc/docker-compose.yml):

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

We still rely on EMQX for MQTT like the [previous version](#prior-picoesp-dht)!

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pi-dht22-vpd" title="RPi DHT22 NodeJS - Docker Config 🐋 ↗" >}}
{{< /cards >}}

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

So far, one of the best experiments of the year:

{{< youtube "yrQ3Tjy8rPU" >}}

<!-- https://youtube.com/shorts/yrQ3Tjy8rPU -->

### Growth Experiment

How are the plants doing after ~6 weeks of planting them?

The most developed tomatoe plants are having small flowers already at the top.

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


### Pi x Cam is trickier


```sh
#git clone https://github.com/meinside/rpi-mjpg-streamer 
git clone https://github.com/JAlcocerT/rpi-mjpg-streamer
cd rpi-mjpg-streamer
#curl -fsSL https://claude.ai/install.sh | bash
# echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
#source ~/.bashrc
sudo apt install gh
gh auth login #with a PAT for 30d
cd ~/RPi && git push
```

{{< callout type="warning" >}}
This worked with bullseye debian v11, but notanymore
{{< /callout >}}

So I got to know about: https://github.com/bhaney/rtsp-simple-server#docker 

```sh
podman run --rm -it \
  --name camera-stream \
  --network=host \
  --privileged \
  --tmpfs /dev/shm:exec \
  -v /run/udev:/run/udev:ro \
  -e MTX_PATHS_CAM_SOURCE=rpiCamera \
  docker.io/bluenviron/mediamtx:1-rpi
```

> http://192.168.1.18:8889/cam/

And finally: https://github.com/AlexxIT/go2rtc

```sh
podman run -d --name go2rtc \
  --restart always \
  --privileged \
  --network host \
  --tmpfs /dev/shm:exec \
  -v /run/udev:/run/udev:ro \
  --device /dev/video0:/dev/video0 \
  --device /dev/media0:/dev/media0 \
  --device /dev/dma_heap/linux,cma:/dev/dma_heap/linux,cma \
  --device /dev/dma_heap/system:/dev/dma_heap/system \
  -e GO2RTC_STREAMS_TOMATO_CAM='exec:rpicam-vid -t 0 --nopreview --codec h264 --inline --listen -o -' \
  -e GO2RTC_ALLOW_ARBITRARY_EXEC=true \
  docker.io/alexxit/go2rtc:latest
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/rpi-mjpg-streamer" title="RPi mjpg streamer | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Prior Pico/ESP DHT

```sh
#git clone https://github.com/JAlcocerT/RPi
#git pull
cd ./RPi/Z_MicroControllers/dht-webapp
tmux new-session -d -s mqtt 'uv run mqtt_to_db.py'
tmux new-session -d -s webapp 'uv run uvicorn main:app --host 0.0.0.0 --port 8077'
#tmux ls
```