---
title: "[Learning] Selfhosted IoT x HA"
date: 2026-06-08
draft: false
tags: ["Home Assistant","Sonoff x Zigbee"]
description: 'IoT.'
url: 'iot-home-lab-tools'
---

https://sonoff.tech/en-pl/products/sonoff-snzb-02d-zigbee-lcd-smart-temperature-humidity-sensor


**TL;DR**

**Intro**




## Protocols

### Connecting to MQTT

1. MqttX
2. Mqtt Explorer
3. MQTTy

## Tools



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