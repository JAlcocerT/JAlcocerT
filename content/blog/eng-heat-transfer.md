---
title: "Heat Transfer"
date: 2026-05-07
draft: false
tags: ["Black-Scholes","Fluid Dynamics","Ptolomeo","VPD"]
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
#docker ps | grep emqx
cd ./RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp-vpd-poc
docker compose up -d --build
#Web → http://<host>:8001 · DB → localhost:5433.
docker compose up -d --build webapp
#docker compose up -d #and here it goes timescaleDB + all the webApp
#docker exec -it timescaledb psql -U pico -d sensors
#docker ps | grep timescaledb
```

## Heat transfer x MBSD x ICE

Some time ago I had to make one fluid mechanics project in Matlab.

its also time to have it in python


---

## Conclusions


---

## FAQ

