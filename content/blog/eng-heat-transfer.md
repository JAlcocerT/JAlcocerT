---
title: "Heat Transfer"
date: 2026-06-01
draft: false
tags: ["Black-Scholes","Fluid Dynamics","Ptolomeo"]
description: 'The physics of heat and thermodynamics.'
url: 'heat-transfer-ice'
math: true
---

**Tl;DR**

Lisa, in this house...

**Intro**

Who could have guessed that behind some IoT for watering plants you could find out the VPD concept.

That can be also very helpful if your are planning to automate the windows of a future greenhouse with a PID.

who.could.have.guessed.

## Heat transfer x VPD x DHT

```sh
#tmux ls
#cd ./home/jalcocert/RPi/Z_MicroControllers/dht-webapp
cd ./home/jalcocert/RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd
tmux new-session -d -s mqtt "uv run mqtt_to_db.py"
tmux new-session -d -s webapp "uv run uvicorn main:app --host 0.0.0.0 --port 8077"
```

## Heat transfer x MBSD x ICE

Some time ago I had to make one fluid mechanics project in Matlab.

its also time to have it in python


---

## Conclusions


---

## FAQ

