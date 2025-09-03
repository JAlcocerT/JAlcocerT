---
title: "Take a Break - Gaming with OSS"
date: 2026-12-23T23:20:21+01:00
draft: true
tags: ["Self-Hosting"]
description: '.'
summary: 'The , my new toy.'
url: 'open-source-gaming'
---

Overtime, I have covered many different topics.

From having your own blog, to host your own whatsapp alternative with matrix, using Gen AI... if you need a break of all that you might be right.

Let's see how to install some **games (legally) with Docker**.

> And before we move on, never forget how important is to get your attention where it matters.

* https://docker-minecraft-server.readthedocs.io/en/latest/
* https://www.xda-developers.com/raspberry-pi-projects-consoles-retro-gaming/

* https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/minecraft
* https://github.com/Lodestone-Team/lodestone

## Emuladores

https://pacochan.net/es/links/


## Ryujinx

* {{< newtab url="https://.github.io//" text="The  Official Site" >}}
* {{< newtab url="https://github.com//" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com//?tab=AGPL-3.0-1-ov-file#readme" text="aGPL 3.0" >}} ❤️

**ryujinx** 
    <https://www.google.com/search?q=ryujinx+raspberry+pi&oq=ryujinx+rasp&aqs=chrome.1.69i57j0i512.4942j0j7&client=ms-android-huawei-rev1&sourceid=chrome-mobile&ie=UTF-8>

* RPI arcade

## EmulatorJS

* lscr.io/linuxserver/emulatorjs:latest
    together with YACHT - selfhostedpro/yacht

* {{< newtab url="https://.github.io//" text="The  Official Site" >}}
* {{< newtab url="https://github.com//" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com//?tab=AGPL-3.0-1-ov-file#readme" text="aGPL 3.0" >}} ❤️

```yml
---
version: "2.1"
services:
  emulatorjs:
    image: lscr.io/linuxserver/emulatorjs:latest
    container_name: emulatorjs
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/Docker/emulatorjs/config:/config
      - /home/Docker/emulatorjs/data:/data
    ports:
      - 3057:3000
      - 87:80
      - 4071:4001 #optional
    restart: unless-stopped

    #https://docs.linuxserver.io/images/docker-emulatorjs/?h=game#versions
```

---


## FAQ

https://emulatorjs.org/

* elamigos games
* geforce now
* steam link

<gg.deals>

---




https://github.com/rommapp/romm

>  A beautiful, powerful, self-hosted rom manager 

### Useful F/OSS Tools for Gaming

* https://github.com/Rem0o/FanControl.Releases

* https://github.com/flightlessmango/MangoHud
https://github.com/flightlessmango/MangoHud?tab=MIT-1-ov-file#readme

> A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more. Discord: https://discordapp.com/invite/Gj5YmBb

* Farming Steam - https://github.com/JustArchiNET/ArchiSteamFarm

### Raspberry Pi - Retro Pi

https://www.youtube.com/watch?v=AaseHnf0k2o

RetroPie: A Raspberry Pi Gaming Machine


* https://retropie.org.uk/

RetroPie sits on top of a full OS, you can install it on an existing Raspbian, or start with the RetroPie image and add additional software later. It's up to you.

* Consoles - https://retropie.org.uk/docs/Nintendo-Entertainment-System/