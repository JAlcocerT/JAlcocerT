---
title: "Frigate - Cam with object detection"
date: 2026-07-01T23:20:21+01:00
draft: false
tags: ["Dashboards","NVR","Self-Hosting","Pi-Camera","Side-Quest26"]
description: 'Computer vision'
url: 'selfhosting-frigate'
---

**Tl;DR**

https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/
https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/

If you like computer vision and homelabs, you will enjoy this one :)

**Intro**

The **computer vision** is an interesting topic that I have just tinkered with superficially...*two years ago*.

With plain python on [this repo](https://gitlab.com/fossengineer1/cv) and with the DJI Dron on this one: [DJI Tello Python](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/)

It kind of related to the dji drone as well, as I also played with its camera.

And Im aware that there are dron deployed on fields even during the night with some sort of vision recognition.

But there are cool projects for computer vision that combine

https://frigate.video/
<https://github.com/blakeblackshear/frigate>
* https://docs.frigate.video/

> MIT | NVR with realtime local object detection for IP cameras


<https://www.youtube.com/watch?v=sCkswrK0G3I>


```yml
services: #https://github.com/DoTheEvo/selfhosted-apps-docker/blob/master/frigate/readme.md

  frigate:
    image: ghcr.io/blakeblackshear/frigate:0.13.2
    container_name: frigate
    hostname: frigate
    restart: unless-stopped
    env_file: .env
    privileged: true
    shm_size: "256mb"
    devices:
      - /dev/dri/renderD128 # for intel hwaccel, needs to be updated for your hardware
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./frigate_config:/config
      - /mnt/frigate_hdd/frigate_media:/media/frigate
      - type: tmpfs # 1GB of memory
        target: /tmp/cache
        tmpfs:
          size: 1000000000
    ports:
      - "5000:5000" # Web GUI
      - "8554:8554" # RTSP feeds
      - "8555:8555/tcp" # WebRTC over tcp
      - "8555:8555/udp" # WebRTC over udp

networks:
  default:
    name: $DOCKER_MY_NETWORK
    external: true
```

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