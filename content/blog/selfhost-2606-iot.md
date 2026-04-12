---
title: "Selfhosted IoT x HA"
date: 2026-04-12
#date: 2026-06-10
draft: false
tags: ["Home Assistant","Sonoff x Zigbee","Tinkering IRL"]
description: 'A homelab around IoT, sensors and HA.'
url: 'home-lab-tools-for-iot'
---

**TL;DR**

Isnt it time to do some upgrades to IoT, HA and the solar panel?

**Intro**

Summer is coming!

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers" title="MicroControllers scripts | Repo" icon="github" >}}
{{< /cards >}}

Last year, I was able to put together HA with a DHT connected to the Pico W powered by a solar panel.

But I left some few loose ends while documenting how great that setup was.

In the meantime... Ive made a ~~small~~ comeback to ~~mechanisms~~ [electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/).

> With the opportunity to make both, [the esp32 and picow setups better](https://jalcocert.github.io/JAlcocerT/electronics-101/#quick-iot-samples)

And planted couple of seeds for the first time.

Its time to make that IoT/Selfhosted setup better than I ever had.


## Protocols

Among all [messaging protocols](https://jalcocert.github.io/JAlcocerT/messaging-protocols/), mqtt has something to say.


### Connecting to MQTT

1. MqttX
2. Mqtt Explorer
3. MQTTy

Or simply with:

```sh
mosquitto_sub -h 192.168.1.2 -t "esp32/#" -v
#mosquitto_sub -h 192.168.1.2 -t "esp32/temperature/dht11"
```

### Tools for MQTT

You can get inspired at: https://selfh.st/apps/?search=mqtt

Previously, Ive tinkered with:

1. httpie

2. reqable

3. emqx - which i recommend via container

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}


### HA

There has been few releases since the last time:

<!-- https://www.youtube.com/watch?v=QwCR0h8_KyE -->

{{< youtube "QwCR0h8_KyE" >}}


Including the releases of the MCP integrations:

* https://github.com/homeassistant-ai/ha-mcp/
* https://www.home-assistant.io/integrations/mcp_server/

```sh
#git clone https://github.com/JAlcocerT/Home-Lab
#cd ~/Home-Lab/home-assistant
#sudo docker compose up -d

##cd ~/Home-Lab
#git pull
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d home-assistant

docker ps -a | grep -i home-assistant
#docker stats home-assistant
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/termix" title="Termix with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/home-assistant" title="HA with Docker 🐋 ↗" >}}
{{< /cards >}}


---

## Conclusions

After writing [about electronics](https://jalcocert.github.io/JAlcocerT/electronics-101/) and the [electro-magnetic foundations](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/), this post was the next step.

What else am I running?

```sh
sudo docker compose -f 2604_docker-compose.yml up -d uptime....pihole nextcloud ncdb.......uptimekuma pocketbase termix lunalytics...littlyx jellyfin
```

* https://jellyfin.org/posts/state-of-the-fin-2026-01-06/
* https://github.com/jellyfin/jellyfin-desktop

I removed the services for my ebooks and consulting subdomains.

They are now...static!


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

And you have one IoT basics ebook waiting for you in there.
---

## FAQ

### HomeLab Tools I cant live w/o

For the CLI:

```sh
lazydocker
glances #htop btop
#sudo snap install ghostty --classic
#tmux
```


### Interesting Sensors

* https://sonoff.tech/en-pl/products/sonoff-snzb-02d-zigbee-lcd-smart-temperature-humidity-sensor
