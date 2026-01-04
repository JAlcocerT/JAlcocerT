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


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker/overlay" title="Py Router Tracker | Overlay Section" icon="github" >}}
{{< /cards >}}



### Geo Data

Geolocation data is fantastic:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9" title="GoPro GPS Telemetry Magic" image="/blog_img/karting/gopro-speed-sample.png" subtitle="OA5 versus GoPro data extraction" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/#trackday-and-gopro-metadata" title="GoPro Metadata Speed trackday " image="/blog_img/karting/gopro-gps-trackday-speed.png" subtitle="Getting GPS info during while driving on circuits" >}}
{{< /cards >}}

If you got a GoPro with GPS, you can have lot of fun:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/tinker-racing/#gopros-telemetry-data" title="Racing Analytics" image="/blog_img/data-experiments/kart/matplotlib-driver-comparison.png" subtitle="Driver lap comparison based on Matplotlib x GPS" >}}
{{< /cards >}}





### F1 Data

This is one of the cool ones that you can get [via API](https://jalcocert.github.io/JAlcocerT/interesting-apis/#formula-1)

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




{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" icon="book-open" >}}
{{< /cards >}}


### Optimum Path

If you know a **circuit's geometry**, why not estimating the best path for a given kart to go for those hot laps?

<!-- ![IoRacing IoTechCrafts IoTrack](/blog_img/web/WebsSnapshots/web_ioracing.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/kart-optimum-path" title="Optimum Path | part 1" image="/blog_img/data-experiments/kart/optimum-path.png" subtitle="Mass Point Model + G-circle" >}}
{{< /cards >}}

{{< youtube "zm0OJcpuLV8" >}}


This is also a chance to try more complex algorithm: 

### Optimum Gears

Probably you Kart have no gears.

But in case it does, you will need to take this into consideration: *Maaax Poweeeer...*

* https://github.com/JAlcocerT/Private/tree/main/Py_optimum_gears


## Other Racing Resources

If you like Mechanisms and animations [as a code](https://jalcocert.github.io/JAlcocerT/things-as-a-code/#animations-as-a-code)

You will probably enjoy this section:

![Engine Sample Animation](/blog_img/mec/engine.gif)