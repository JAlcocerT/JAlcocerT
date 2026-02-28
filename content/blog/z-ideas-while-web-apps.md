---
title: "If I would have known - Web Apps edition"
date: 2026-04-01
draft: false
tags: ["BiP x Dev","BluePrint x BoilerPlate","N ebooks"]
description: 'The learnings of shipping a few web/apps.'
url: 'learnt-while-building-web-apps'
---

**Tl;DR**

Just create.

It's easier than ever.

**Intro**


{{% steps %}}


### R Shiny

Thanks to a yearly subscription I got to datacamp

and to be very much invested with R language for consumer intelligence application back in the days

I got to know R Shiny for dashboarding and kind of quick web app prototyping

I was not expecting back in the days that in general a full dashboard should involved a team of 5 and that they end up been expansive as f*

the excuse back then had to be that googling and reading stackoverflow is not for everyone

today?

I guess...

well, i dont know whats the excuse

### Python DASH


* How to develop a python dash app inside a running docker container
    * Docker and Docker extension
    * DevContainer extension
    * Attach to running container 

* https://github.com/RamiKrispin/vscode-python
* https://github.com/RamiKrispin/shinylive
* https://www.dataquest.io/blog/install-package-r/

In the meantime, he built this https://github.com/LinkedInLearning/data-pipeline-automation-with-github-actions-4503382

### Streamlit

But streamlit is a big tentation if you are in D&A.

For quick web apps, data centered for PoCs, this is still my go to.

Leave the distraction and super custom things for the MVP stage.

### Full Stack Web Apps

The last ones I have been confortable enought to have Python as BE and keep JS/TS for the FE.

Because its 2026.

And when you do some repetitions with AI

which basically mean you learn how to aks for things to get done by algorithms consuming energy somewhere in the world


{{% /steps %}}

---

## Conclusions

Creating (supply digital products) is easier than ever.

Distribution is most likely your constrain today - aka demand for what you create.




---

## FAQ

### What have you created?

Some time ago, I made this one with a friend: *my very first published web app with R Shiny*.

How can you contribute?

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

But why contributing to that when you can create your own!

Specially with lovable...cursor...etc etc

All those tools that you might have heard of, but havent really bother to install and try.