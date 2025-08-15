---
title: "SelfHosting Updates - Summer 2025"
date: 2025-08-30T01:20:21+01:00
draft: false
tags: ["Dev","SSGs"]
description: 'Selfhosting Updates: SelfHosting SSGs & Python WebApps + Leds and API with the Pi'
url: 'selfhosted-apps-autumn-2025'
---


Summer is almost gone...

**TL;DR:** 


Lately I have been [tinkering with Python Web Apps](https://jalcocert.github.io/JAlcocerT/web-apps-with-python/)

So I have updated the docker-compose and Dockerfiles at:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Python_apps" title="Python WebApps | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Web/SSGs" title="SSGs | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}

**Intro**



## Pi and IoT

### LEDs

* https://github.com/awawa-dev/HyperHDR

https://github.com/appleimperio/docker-hyperhdr

> MIT |  Highly optimized open source ambient lighting implementation based on modern digital video and audio stream analysis for Windows, macOS and Linux (x86 and Raspberry Pi / ARM). 

### HA

* https://www.home-assistant.io/docs/automation/

---

## Conclusions

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Docker Configs" >}}
{{< /cards >}}



### Lately I...


1. Tried [Zen browser](https://github.com/zen-browser/desktop/releases/tag/1.14.11b): https://zen-browser.app/download/

With `CTRL+ALT+C` it gets really compact!

```sh
flatpak install flathub app.zen_browser.zen
```
> Welcome to a calmer internet | Firefox based 

> > Zen offers a "Sync" feature, which is implemented using Mozilla Firefox's Sync feature.

**Had a look to couple of tools for diagrams**

2. https://github.com/stan-smith/FossFLOW

>  Make beautiful isometric infrastructure diagrams 

3. https://markmap.js.org/ and https://github.com/markmap/markmap

It renders text to diagram and can reference files: https://gist.githubusercontent.com/raw/af76a4c245b302206b16aec503dbe07b/markmap.md

> MIT | Build mindmaps with plain text 

### Other

Link analytics solutions, like Kutt:

![SelfHosting Kutt](/blog_img/selfh/links/kutt-selfh.png)

![Kutt Links](/blog_img/selfh/links/kutt-link-creation.png)

## FAQ

### How to Change USB Size

```sh
Diskpart
List disk
select disk N
clean 
create partition primary
```