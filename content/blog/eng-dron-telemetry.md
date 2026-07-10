---
title: "Dron Telemetry 101"
date: 2026-07-10
draft: false
tags: ["Electronics","RC","Betaflight x BBL Logs","DC Motor",]
description: 'Creating a PWA around dron flight data.'
url: 'betaflight-dron-telemetry'
math: true
---

**TL;DR**

**Intro**

<!-- 
https://youtube.com/shorts/KeT0DuWryEI 
-->

{{< youtube "KeT0DuWryEI" >}}


{{< youtube "ndUVyEo2URM" >}}

## Betaflight

Recently I got to know how OSS is baked into a PWA https://app.betaflight.com/#

![alt text](/blog_img/dron/betaflight-setup-calibrate.png)


### Betaflight Telemetry

* https://github.com/betaflight/blackbox-log-viewer/releases

Also available as PWA: https://blackbox.betaflight.com/

![alt text](/blog_img/dron/betaflight-logs.png)

For the meteor 75 pro, one session of 6min filled ~13mb of the 16mb available for BBL logs.


```sh
Start-Process .\meteor75_blackbox_report.html 
#python .\run_blackbox_report.py --list
#python .\run_blackbox_report.py --index 1 
python .\run_blackbox_report.py --index 1 --mass-g 44.0
```

```sh
  For your July 10 segment 0, full duration is about 192.3s, so run: 
                                                                     
  python .\telemetry_video.py --decoded .                            
  \BTFL_BLACKBOX_LOG_METEOR75_PRO_20260710_103204_BETAFPVG473_decoded
  .json --log-index 0 --start-s 0 --duration-s 192.3 --fps 30        
                                                                     
  Or add a Make override:                                            
                                                                     
  make telemetry DURATION=192.3   
```


---

## Conclusions

---

## FAQ