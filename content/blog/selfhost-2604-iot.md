---
title: "[Learning] Selfhosted IoT x HA"
date: 2026-04-15
draft: false
tags: ["Home Assistant","Sonoff x Zigbee","Solar Panel"]
description: 'IoT.'
url: 'iot-home-lab-tools'
---

https://sonoff.tech/en-pl/products/sonoff-snzb-02d-zigbee-lcd-smart-temperature-humidity-sensor



**TL;DR**

Isnt it time to do some upgrades to IoT, HA and the solar panel?

**Intro**

Spring has come!

Last year I was able to put together HA with a DHT connected to the Pico W powered by a solar panel.

But I left some few loose ends while documenting how great that setup was.

Its time to make that better.


## Protocols

### Connecting to MQTT

1. MqttX
2. Mqtt Explorer
3. MQTTy

## Tools for MQTT

httpie

reqable

emqx 




### HA

There has been few releases since the last time:

https://www.youtube.com/watch?v=QwCR0h8_KyE

https://github.com/homeassistant-ai/ha-mcp/

https://www.home-assistant.io/integrations/mcp_server/

```sh
#git clone https://github.com/JAlcocerT/Home-Lab
#cd ~/Home-Lab/home-assistant
#sudo docker compose up -d

##cd ~/Home-Lab
#git pull
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d home-assistant

docker ps -a | grep -i home-assistant
#udo docker stats home-assistant
```



---

## Conclusions

What else am I running?

```sh
sudo docker compose -f 2604_docker-compose.yml up -d uptime....pihole nextcloud ncdb.......uptimekuma pocketbase termix lunalytics...littlyx jellyfin
```

* https://jellyfin.org/posts/state-of-the-fin-2026-01-06/
* https://github.com/jellyfin/jellyfin-desktop

I removed the services for my ebooks and consulting subdomains.

They are now...static!

---

## FAQ


