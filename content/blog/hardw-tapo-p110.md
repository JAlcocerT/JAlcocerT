---
title: "[Review] Tapo P110"
date: 2022-11-03
draft: false
tags: ["Dev"]
description: Checking my first Smart Plug Connecting it with Home Assistant [HA].
url: tapo-p110-review
---

It needs **2.4G Wifi** connection (5G wont be discoverable).

It will work with a dualband capable network as well (2.4 and 5G on the same SSID).

It costed me ~20$.

And it **helps me monitor** such things:

![Tapo Monitoring W](/blog_img/hardware/energy/tapo-p110-1.jpg)

![Tapo Monitoring](/blog_img/hardware/energy/tapo-p110-2.jpg)

<!--
 https://www.youtube.com/watch?v=Mbzdlxxn3cw
 -->

{{< youtube "Mbzdlxxn3cw" >}}

## Tapo P110 Features

1. Connectivity: 2.4GHz Wifi Only
2. Allowed power: up to 3680W (16A max)
3. Android App: [TP-Link Tapo](https://play.google.com/store/apps/details?id=com.tplink.iot&pcampaignid=web_share)

### Tapo P110 and Home Assistant

* https://community.home-assistant.io/t/is-a-tapo-p110m-from-tp-link-compatible-with-home-assistant/738579/5

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/getting-started/#home-assistant-os" title="HA with a Pi | Post ↗" >}}
{{< /cards >}}



**Home Assistant Community Store - HACS**

* https://hacs.xyz/docs/setup/prerequisites
* https://www.youtube.com/watch?v=Q8Gj0LiklRE

Click Your user name -> Advance Mode: Enable

Add-ons ---> not visible? try a previous HA??

```sh
wget -O - https://get.hacs.xyz | bash -
```

To connect the Tapo P110 with HA:

1. <https://www.youtube.com/watch?v=KSYldphgE5A&t=13s>
2. <https://github.com/petretiandrea/home-assistant-tapo-p100>


### Adding InfluxDB to HA

TBD

Adapt config

> Put them in the same docker network?

- [x] Get MQTT Ready
  + [x] Install a MQTT Client
  + [x] Install a MQTT Broker
  + [x] Testing the MQTT Broker
  + [x] Test the Connection
- [X] Get HA Installed
- [ ] Add Graphs to HA


### Adding Graphs to HA

We need **HACS activated** (any of those will be add-ons, so we can use our HA with Docker)

<https://github.com/RomRider/apexcharts-card>

---

## FAQ

### Thanks to

https://www.youtube.com/watch?v=r9BshEzz4bo

### HA OS vs HA Docker

* [Home Assistant add-ons](https://www.home-assistant.io/addons/) can be used just with [Home Assistant OS](https://jalcocert.github.io/RPi/posts/getting-started/#home-assistant-os) 📌
* [Home Assistant Integrations](https://www.home-assistant.io/integrations/#all) are compatible with both options ☑️

> [Home Assistant](https://github.com/home-assistant) - A great Project that can make your home smarter, together with a RPi.

## HA Integrations

You can check more HA integrations in the [official page](https://www.home-assistant.io/integrations/).

### Get HA Community Store

* Enable advance mode: user profile -> Advance mode
* On the Add-on Store - Install and Start SSH -> http://ip:8123/hassio/addon/core_ssh/info
    * Make it visible in the left panel
* Follow rest of steps from **HACS** - <https://hacs.xyz/docs/setup/download> and <https://hacs.xyz/docs/configuration/basic>

```sh
ha core restart
#clear browser cache
```

* Looks for: Settings -> Devices & Services  -> Add Integration -> `HACS`
    * Authorize HACS + Github Account

* Congrats, you can now:
    * go to HACS -> Integrations -> 3 dots -> Custom Repositories
    * Then Add repository URL + Select Integration

### Switches with HACS

You will need **HACS Installed**.

Then just look for the **integration**: http://ip:8123/hacs/repository/323923603

* Source <https://github.com/petretiandrea/home-assistant-tapo-p100>

NO need to add as custom integration with HACS >1.6.0

Tried with P110 and working. You will need P110 local IP + user and pass to tplink cloud

There are another ways to control such devices (with Python): <https://github.com/fishbigger/TapoP100>

![Desktop View](/img/p110.png){: width="772" height="489" }

## Outro

### Gen AI with Ollama and HA

* <https://github.com/ej52/hass-ollama-conversation>

You will need HACS Installed.

* Congrats, you can now:
    * go to HACS -> Integrations -> 3 dots -> Custom Repositories
    * Then Add repository URL + Select Integration (Ollama conversation)

![Desktop View](/img/ha-ollama-config.png){: width="772" height="489" }

Connect to the server where [Ollama is running](https://fossengineer.com/selfhosting-llms-ollama/).

You will need a local ip for example to the PC where you run Ollama: `http://homeassistant.local:11434`