---
title: Race
type: docs
prev: /docs/android/
next: docs/
draft: false
---

I started tinkering with geolocation data on [this repo](https://github.com/JAlcocerT/Py_RouteTracker).

But my goal was: to create a **Race Analytics solution**.

For which we need:

1. Data Collection
2. Data Visualization (offline)
3. IoT / Telemetry setup
4. Data based feedback on your racing like a PRO

## Racing Data


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/BI/" title="BI | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cool-iot/" title="ioT | Docs ↗" icon="book-open" >}}
{{< /cards >}}



### Geo Data

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9" title="GoPro GPS Telemetry Magic" image="/blog_img/karting/gopro-speed-sample.png" subtitle="OA5 versus GoPro data extraction" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/#trackday-and-gopro-metadata" title="GoPro Metadata Speed trackday " image="/blog_img/karting/gopro-gps-trackday-speed.png" subtitle="Getting GPS info during while driving on circuits" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/#trackday-and-gopro-metadata


![GoPro Metadata Speed trackday](/blog_img/karting/gopro-gps-trackday-speed.png)


<!-- 
https://youtu.be/tQOxnCz2lwM?si=XTgvyi-qnm3ZKiAl
 -->

{{< youtube "tQOxnCz2lwM" >}}


### F1 Data

Amazon AWS handles F1 telemetry data with very high frequency/granularity that any data geek would dream.

There are some people that put together some formula 1 data for analysis:

* https://github.com/IAmTomShaw/f1-race-replay 
    * https://github.com/JAlcocerT/f1-race-replay

> Uses fastf1 package to [source the data via API](https://jalcocert.github.io/JAlcocerT/interesting-apis/#formula-1)

```sh
python main.py --year 2025 --round 12 --qualifying
```

{{< youtube "TiQEElXyY2w" >}}

<!-- 
https://www.youtube.com/watch?v=TiQEElXyY2w 
-->


## Improving your Racing with Data


![IoRacing IoTechCrafts IoTrack](/blog_img/web/WebsSnapshots/web_ioracing.png)


### Optimum Gears

### Optimum Path


## Other Racing Resources

