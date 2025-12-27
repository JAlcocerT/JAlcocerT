---
title: "If I would have known - Web Apps edition"
date: 2026-03-05
draft: false
tags: ["BiP x Dev","BluePrint x BoilerPlate","N ebooks"]
description: 'The learnings of shipping a few web/apps.'
url: 'learnt-while-building-web-apps'
---

**Tl;DR**

**Intro**


{{% steps %}}


### R Shiny

### Python DASH


* How to develop a python dash app inside a running docker container
    * Docker and Docker extension
    * DevContainer extension
    * Attach to running container 

    https://github.com/RamiKrispin/vscode-python 

https://github.com/RamiKrispin/shinylive
https://www.dataquest.io/blog/install-package-r/

In the meantime, he built this https://github.com/LinkedInLearning/data-pipeline-automation-with-github-actions-4503382



{{% /steps %}}

---

## Conclusions

---

## FAQ

### How can I contribute?

The code is accesible from [my Github Repository of R/Stocks](https://github.com/JAlcocerT/R_Stocks "R Stocks Github {rel='nofollow'}")

Please feel free to fork the repository and experiment with the code. 

```sh
 fossengineer/rstocks_shiny:latest
 docker run --name stocksubuntu -p 3836:3838 --detach fossengineer/rstocks_rbase2:latest
# you may need log out first `docker logout` ref. https://stackoverflow.com/a/53835882/248616 docker login

docker tag firstimage YOUR_DOCKERHUB_NAME/firstimage

docker push YOUR_DOCKERHUB_NAME/firstimage
docker run --name py_trip_planner --network tunnel -p 8050:8050 --detach py_trip_planner

docker run --name py_trip_planner --network tunnel -p 8050:8050 --detach fossengineer/trip_planner:arm64
MANIFEST: to detect that is arm64 directly -> multi-image (?)
https://hub.docker.com/r/fossengineer/trip_planner:arm64
```