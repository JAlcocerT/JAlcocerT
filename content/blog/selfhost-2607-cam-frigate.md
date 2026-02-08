---
title: "Frigate - Cam with object detection"
date: 2026-07-01T23:20:21+01:00
draft: false
tags: ["Dashboards","NVR","Self-Hosting","Pi-Camera","Side-Quest26"]
description: 'Computer vision'
url: 'selfhosting-frigate'
---

**Tl;DR**

If you like computer vision and homelabs, you will enjoy this one :)

**Intro**

The **computer vision** is an interesting topic that I have just tinkered with superficially...*two years ago with [the Pi](https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/)*.

With plain python on [this repo](https://gitlab.com/fossengineer1/cv) and with the DJI Dron on this one: [DJI Tello Python](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/)

It kind of related to [the dji drone](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/) as well, as I also played with its camera.

And Im aware that there are dron deployed on fields even during the night with some sort of vision recognition.

But there are cool projects for computer vision that combine

```sh
sudo docker compose -f ./z-homelab-setup/evolution/2607_docker-compose.yml logs -f frigate
```

##

### Frigate

* https://frigate.video/
  * https://github.com/blakeblackshear/frigate
  * https://docs.frigate.video/

> MIT | NVR with realtime local object detection for IP cameras

<https://www.youtube.com/watch?v=sCkswrK0G3I>


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/frigate" title="Frigate | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```env
# GENERAL
DOCKER_MY_NETWORK=caddy_net
TZ=Europe/Bratislava

# FRIGATE
FRIGATE_RTSP_USER=admin
FRIGATE_RTSP_PASSWORD=dontlookatmekameras
# FRIGATE_MQTT_USER=
# FRIGATE_MQTT_PASSWORD=
```

### Others

https://tldraw.dev/

---

## Conclusions

Perseverencia (el talento de los que no tenemos talento ) sin autocritica es worthless.

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://genbi.jalcocertech.com" title="Generative BI" image="/blog_img/web/astro/astro-datanova-animated-graph.png" subtitle="The insights that you could not afford to have until now" >}}
{{< /cards >}}


---

## FAQ

### Integrating Frigate with Home Assistant

<https://www.scrypted.app/>
<https://homebridge.io/>
<https://www.home-assistant.io/>

### Frigate OSS Alternatives

* https://github.com/roflcoopter/viseron

> Self-hosted, **local only NVR and AI Computer Vision software**. With features such as object detection, motion detection, face recognition and more, it gives you the power to keep an eye on your home, office or any other place you want to monitor.

### Scrypted


---

## FAQ

### Other

* https://github.com/ispysoftware/iSpy

### Uptime Kuma x Gotify

Talking about monitoring...

how about getting notified when some service goes down?

https://github.com/BigBoot/AutoKuma

> MIT | AutoKuma is a utility that automates the creation of Uptime Kuma monitors based on Docker container labels. With AutoKuma, you can eliminate the need for manual monitor creation in the Uptime Kuma UI.