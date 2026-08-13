---
title: "Crops Intelligence in the AI era"
date: 2026-08-15
draft: false
tags: ["IoT x DHT22","MQTT x EMQx","JAlcocerTech Leads","18650 x solar","Tech Talk"]
description: 'All the learning after planting tomatoes. Ready to scale.'
url: 'iot-crop-intelligence'
math: true
---

**TL;DR**

I just wanted to [plant tomatoes](https://jalcocert.github.io/JAlcocerT/plants-101/#1-tomato-seeds-pomidor) to stay away from the computer.

Then this happened...

**Intro**

With this chaotic selflearning project, ive made:

1. An [electromagnetism recap to avoid frying my esp32](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/#how-to-avoid-frying-an-esp32-due-to-kickback)
2. Some simulations around PySpice: here and here
3. 


```sh
sqlite3 /home/jalcocert/poc/iot-rpi-dht-insulation/ingester/data/readings.sqlite "SELECT date(received_at) AS day, COUNT(*) AS rows, AVG(value) AS avg_value FROM readings WHERE metric = 'temperature' GROUP BY day ORDER BY day;"
```

## The setup


A 15W solar panel setup is great: 
<!-- 
https://youtu.be/oPznvdWmcTQ -->

{{< youtube "oPznvdWmcTQ" >}}


Just that sometimes, there is not enough juice for the ESP32's

And you'll want to measure temp and humidity during the night as well

But without the 250$ of [a bluetti](https://jalcocert.github.io/JAlcocerT/understanding-batteries/#tomatoes-x-bluetti)



### The sensors you need

1. DHT22 - For air temp & humidity
2. - Soil humidity
3. MLX - If you want leave temp

#### More BoM

4. Battery 18650 - *I got Samsung 35E (INR18650-35E)*
5. ESP32
6. Solar panel
7. TP4056 x DW01A

https://jalcocert.github.io/JAlcocerT/data-driven-insulation-evaluation/#home-solar-test-x-tp4056

* **TP4056** = Stops it from going above $4.2\text{V}$ (Overcharge Protection).
* **DW01A Circuit** = Stops it from dropping below ~$2.4\text{V}$ (Over-discharge Protection).

> With a  `AZDelivery board` has **both**, the Samsung 35E battery is 100% safe in both directions!

The TP with the ~3400mha battery + esp32 deepsleep will take you without power connection to a [lifetime of ~9 days as per my experiment](https://jalcocert.github.io/JAlcocerT/understanding-batteries/#esp32-x-18650)

### The Software for D&A

#### MicroControllers


#### In the server




---

## Conclusions

Too much to digest?

Go ask chatgpt

Or...get real results with a higher time ROI:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Bring AI to your workflow" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


### Tomato Evolution

After ~10 weeks:

{{< youtube sCrMm5sLG-w >}}

<!-- 
https://youtube.com/shorts/sCrMm5sLG-w 
-->

The melisa and mieta p. didnt make it though.

And some time later, the mieta polej also died  *most likely Spider Mites (przędziorki) or Thrips (wciornastki)*

3 months later:

{{< youtube "_YBjNO8urfE" >}}

Tomatoes continued, and after week ~13:

{{< youtube sCrMm5sLG-w >}}

I got a couple of harvests:

{{< youtube "sCrMm5sLG-w" >}}

{{< callout type="info" >}}
The yield so far ~1kg tomatoes out of xyz plants and xyz kg of soil and ~ L of water
{{< /callout >}}

You can buy that kg for xyz $ in the market, so for next season there is definitely room for improvements!

#### Watering System for next seson

https://indystry.cc/diy-solar-powered-garden-watering-system/

{{< youtube "s-xkdfNeIVw" >}}

<!-- 
https://www.youtube.com/watch?v=s-xkdfNeIVw 
-->

<!-- www.youtube.com/watch?v=ijI3iOOcEog -->


{{< youtube "ijI3iOOcEog" >}}


### Interesting yt channels

1. https://www.youtube.com/@FarmCraft101/videos
2. https://www.youtube.com/@kirstendirksen/videos

---

## FAQ

Tomatoe one timer?

1. Get them sun
2. Get them water in the early morning
3. Get them space for the roots: ~20L for 1 plant worked well for me

### Tomatoe Prep for Next Year

What would I do different next year?


### Geo Matters

Ive recaped recently how cool is [geo analytics](https://jalcocert.github.io/JAlcocerT/geo-data-analytics/):

```sh
cd ./poc/building-geo-osm-blender
make osm2world-obj
```

sudo apt update                                                                               
  sudo apt install openjdk-17-jre unzip wget                                                    
                                                                                                
  mkdir -p ~/tools/osm2world                                                                    
  cd ~/tools/osm2world                                                                          
                                                                                                
  wget https://osm2world.org/download/files/latest/OSM2World-latest-bin.zip                     
  unzip OSM2World-latest-bin.zip                                                                
                                                                                                
  Then from this repo:                                                                          
                                                                                                
  make osm2world-obj OSM2WORLD=~/tools/osm2world/osm2world   