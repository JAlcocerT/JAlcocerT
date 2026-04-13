---
title: "Electronics 101"
date: 2026-04-03
draft: false
tags: ["Simulations","KiCad vs Atopile","PySpice x RemotionJS"]
description: 'Simulating electronics components.'
url: 'electronics-101'
math: true
---

**Tl;DR**

Prep-work for watering plants :)

**Intro**

You might have tinkered with IoT

But without really understanding the under lying layer.

This sits on top of Electromagnetism, yet below IoT and [messaging protocols](https://jalcocert.github.io/JAlcocerT/messaging-protocols/).


## Circuit Boards Design

Everything is...[code](https://jalcocert.github.io/JAlcocerT/things-as-a-code/). 

Same applies to circuit boards:

* https://github.com/atopile/atopile

> **MIT | Design circuit boards with code**! ✨ Get software-like design reuse 🚀, validation, version control and collaboration in hardware; starting with electronics ⚡️ 

> > Write hardware like software. atopile is a language, compiler, and toolchain for electronics—declarative .ato files, deep validation, and layout that **works natively with KiCad**.


---

## Conclusions

So...mbsd is code, CAD and blender renders are code:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics" image="/blog_img/apps/gh-jalcocert.svg" subtitle="IoT and electronics projects" >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3D Design Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Blender, CadQuery..." >}}
{{< /cards >}}

Electronics board design...yep, also code from now on.


```sh
#git init && git add . && git commit -m "Initial commit: Starting electronics 101" && gh repo create electronics-101 --private --source=. --remote=origin --push
#uv init
#uv add -r requirements.txt
#uv sync
#cd sample-pyscipe
uv run main.py

#make run #requires .env.local
```

You know whats coming

right?

![alt text](/blog_img/electronic/esp32-pump-plants.png)

Wait...if this is code...can it be [animated with remotion](https://jalcocert.github.io/JAlcocerT/video-creation-with-remotion/)?

```md
In this folder i have added a pyscipe that simulates a particular circuit    
  (see the makefile entries), I have also added a video remotion folder, with   
  agents skills you can use. My idea is to generate a video animation of what   
  happens in that given circuit with the intensities and voltages. Do you need  
  to clarify sth?  
```

Ive dare to generate such **explanatory video**: *do you beliave you need that Diode now? :)*

```sh
#git clone VideoEditingRemotion
cd ./remotion-electronics/my-video
# npx remotion render MosfetProtected mosfet_protected.mp4
#npx remotion render MosfetUnprotected mosfet_unprotected.mp4

npx remotion render SchematicKickback schematic_kickback.mp4
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditionRemorion" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}


```sh
#sudo apt update && sudo apt install ffmpeg
ls *.mp4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4 #original audio
```

Toy models can NOT predict.

No model is perfect, reality is far to complex.

Its just that some are based on garbage and produce (surprise) more non sense garbage.

{{< youtube "JbixCdhRzDo" >}}

*Why would someone pay you if you can just overfit past and give just a vague range of possibilities for the future?*

*Will the mosfet be fried, yes or no?*

<!-- https://youtu.be/JbixCdhRzDo -->

No more: will I get an unexpected quickback due to transitory behaviour?

![Vibe Coding - Simpsons Halloween S2](/blog_img/dev/vibe-coding.png)

Just...simulate: *see thats going to happen, before it happens*

```sh
#cd sample-pyscipe
uv run main.py --only mosfet --scenario compare   # overlay: with vs without diode 
```

### The Meta-Lesson

All of these curiosities point to one theme:

**Linear analysis predicts steady state. Nonlinearities dominate transients.**

- The motor inrush looks linear for 100µs, then saturation takes over.
- The capacitor impedance is Ohmic for DC, but ESR-dominated for 150kHz ripple.
- The MOSFET is a resistor at steady state, but an avalanche diode in stress.
- The flyback diode's nonlinearity is the only thing preventing the circuit from killing itself.

Real circuit design is about:

1. **Identifying which nonlinearities matter** (flyback diode → essential; parasitic R → helpful)
2. **Ensuring they trigger safely** (clamp at 12.7V, not 101.7V)
3. **Controlling their speed** (ESR damping, gate slew rate)
4. **Testing edge cases** (cold start, aged battery, old capacitors)

That's why the simulations included these three scenarios: **protected**, **unprotected**, and **compare**.



The math alone doesn't tell you the story. 

You have to see it.

---

## FAQ

### About Electronical Simulations

Interesting [engineering tools](https://jalcocert.github.io/Linux/docs/debian/foss_engineering/):

1. KiCad
2. Atopile

To **simulate** the behaviour of ESP32, picoW, even arduinos: https://github.com/davidmonterocrespo24/velxio

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="Velxio | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Quick IoT Samples

{{< callout type="info" >}}
See **Cpp sample Codes** for the ESP32 MicroController [here](https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/ESP32/esp32-c) and for the [PicoW here](https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW)
{{< /callout >}}

```sh
git clone https://github.com/JAlcocerT/RPi
cd ./RPi/Z_MicroControllers
```

With [the PicoW](https://jalcocert.github.io/JAlcocerT/pico-w/#raspberry-pi-pico-w)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/RPiPicoW/MQTT-InternalTemp/main.py" title="PicoW + InternalTemp + Push to MQTT Topic 🐍 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/MLX90614" title="PicoW + MLX906014 🐍 ↗" >}}
{{< /cards >}}

```sh
cd ./RPiPicoW/DHT22
```

For something more advance, see how the [PicoW can read and send DHT22 data via MQTT](https://jalcocert.github.io/JAlcocerT/messaging-protocols/#mqtt-x-picow-x-dht22)

```sh
#cd ..
cd ./MQTT-DHT22
```

Remember about going to `http://192.168.1.2:18083/#/clients` and later to `http://192.168.1.2:18083/#/websocket` so you can subscribe, for example to `pico/temperature/dht22` as explained with [details here](https://jalcocert.github.io/JAlcocerT/messaging-protocols/#mqtt-x-picow-x-dht22)

```sh
#git clone
#cd ./Home-Lab/emqx
#docker compose up -d
# Check if the container is running
docker ps | grep emqx

# Watch EMQX logs live
docker logs emqx -f
```

Or if you prefer a quick CLI way to check the pushed data:

```sh
mosquitto_sub -h 192.168.1.2 -t "pico/#" -v
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/MQTT-DHT22" title="PicoW + DHT22 + MQTT 🐍 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}

With [the ESP32](https://jalcocert.github.io/JAlcocerT/microcontrollers-setup-101/#the-esp32): *its very important to see which language was installed, as Thonny will just work with MicroPython!*

*So go ahead and install [arduinoIDE like so](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-languages-ide.md)

```sh
#choco install arduinoide
#pnputil /enum-devices /class Ports
#git clone https://github.com/JAlcocerT/RPi
# cd ./RPi/Z_MicroControllers/ESP32/esp32-c
```

Select  ~~`ESP32-WROOM-DA`~~* `ESP32 Dev Module` + `CTRL + U` to compile the sketch `esp32-internal-temp-mqtt.cpp` into the board.

> I got a ESP32 DevKitV1 printed on the back of it, despite on the chip it says ESP32 wroom 32

See your **MQTT data flowing** to the server:

```sh
mosquitto_sub -h 192.168.1.2 -t "esp32/#" -v          
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/messaging-protocols/#mqtt" title="MQTT and Messaging Protocols" image="/blog_img/iot/mqttx-desktop.png" subtitle="Tools for MQTT - MQTTx Desktop" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/" title="Micro-Controller Scripts" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github inside the RPi repository." >}}
{{< /cards >}}

To send DHT11 information via mqtt with the esp32, just: *install `Adafruit Unified Sensor` & `DHT sensor library for ESPx` at arduino ide -> Tools -> Manage Libraries*

```sh
mosquitto_sub -h 192.168.1.2 -t "esp32/#" -v
#mosquitto_sub -h 192.168.1.2 -t "esp32/temperature/dht11"
```

After compiling and uploading this one, the data is flowing `CTRL+shift+m`as expected :)

| Choice | GPIO Numbers | Why? |
| :--- | :--- | :--- |
| **Best** | 4, 14, 25, 26, 27, 32, 33 | No special boot functions; very stable. |
| **Okay** | 12, 13, 15 | Strapping pins; might cause boot/flash issues. |
| **Bad** | 34, 35, 36, 39 | **Input only.** Cannot trigger the DHT11. |
| **Avoid** | 0, 1, 2, 3 | Critical for booting and USB communication. |

Made one upgrade to the [simple dht webapp](https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/dht-webapp), so that now it can plot both sensors:

```sh
# stop old sessions 
#tmux kill-session -t mqtt                                                            
#tmux kill-session -t webapp                                                             
# verify they're gone                                                                
#tmux ls
#git clone https://github.com/JAlcocerT/RPi
#git pull
cd ./RPi/Z_MicroControllers/dht-webapp
#  tmux new-session -d -s mqtt 'cd ~/dht-webapp && uv run mqtt_to_db.py'
#   tmux new-session -d -s webapp 'cd ~/dht-webapp && uv run uvicorn main:app --host     
#   0.0.0.0 --port 8077'
tmux new-session -d -s mqtt 'uv run mqtt_to_db.py'
#uv run uvicorn main:app --host 0.0.0.0 --port 8077
tmux new-session -d -s webapp 'uv run uvicorn main:app --host 0.0.0.0 --port 8077'
```

This will give you the trend and the last value read in real time:

```sh
docker exec -it timescaledb psql -U pico -d sensors -c \
  "SELECT DISTINCT ON (topic)
          topic,
          ROUND(value::numeric, 2) AS value,
          ts
   FROM readings
   WHERE topic IN (
     'pico/temperature/dht22',
     'pico/humidity/dht22',
     'esp32/temperature/dht11',
     'esp32/humidity/dht11'
   )
   ORDER BY topic, ts DESC;"
```

### ESP32 vs PicoW Consumption

I could not avoid to make a quick experiment [around power consumption](https://jalcocert.github.io/JAlcocerT/microcontrollers-setup-101/#microcontroller-power-consumption).

How long would each of these micocontrollers be sending data via MQTT before consuming the same battery?

In theory, the a [PicoW should be the winner](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/RPiPicoW/MQTT-DHT22/picow-consumption.md).

The Pico W is roughly 2× more [efficient than the ESP32](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/ESP32/esp32-c/esp32-consumption.md) on the same battery — mainly because its WiFi chip (CYW43439) draws less than the ESP32's radio at idle.

The DHT11/22 itself contributes almost nothing to consumption.

```sh
#docker exec -it timescaledb psql -U pico -d sensors -c "SELECT DISTINCT topic FROM readings LIMIT 10;"
docker exec -it timescaledb psql -U pico -d sensors -c \
    "SELECT time_bucket('1 hour', ts) AS hour, AVG(value) FROM readings WHERE topic = 
  'pico/temperature/dht22' GROUP BY hour ORDER BY hour DESC LIMIT 24;"

docker exec -it timescaledb psql -U pico -d sensors -c \
  "SELECT time_bucket('1 hour', ts) AS hour,
          topic,
          ROUND(AVG(value)::numeric, 2) AS avg_value
   FROM readings
   WHERE topic IN (
     'pico/temperature/dht22',
     'pico/humidity/dht22',
     'esp32/temperature/dht11',
     'esp32/humidity/dht11'
   )
   AND ts > NOW() - INTERVAL '24 hours'
   GROUP BY hour, topic
   ORDER BY topic, hour DESC;"
```

Lets check this out.

![PicoW working with a DHT22](/blog_img/iot/picoW/picow-dht22.png)

1. Connected the PicoW a Saturday 11pm to a 4000mAh battery
2. When did the data stop flowing to TimescaleDB? Expected ~3/4 days, real: 21 hours

Maybe the battery was no 4000mAh at all?

for a relative comparison with the esp32, it doesnt matter

So i recharged the battery and tried with the ESP+dht11 setup

Surprisingly, the ESP32 just lasted ~11h instead of ~21h

For another time, ill be testing the deep sleep option to see how it improves

Also, I have to test using Zigbee instead of Wifi as it should also lower the power consumption 


### Interesting Tools

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}


1. https://schemdraw.readthedocs.io/en/stable/usage/start.html

```sh
uv add schemdraw #https://github.com/cdelker/schemdraw/
```

2. 