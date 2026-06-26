---
title: "Electr 101"
date: 2026-06-24
draft: false
tags: ["Electronics","Diode","PySpice","KiCad-CLI","RadioMaster Pocket"]
description: 'The electronics you can learn for free now x Building a custom FPV Drone.'
url: 'electr-diode'
math: true
---

**TL;DR**

Someone is already doing this!

**Intro**

I saw a podcast on the beach and 

https://github.com/diodeinc/pcb


## Conclusions



---

## FAQ

### IoT MQTT


So:

  - connected client from 192.168.1.15 = yes
  - active Pico message traffic right now = not observed in the brief trace

  If you want, I can keep a live trace running for longer or check the exact topic the Pico should be publishing to.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

› can you share with me the commands you run on the container to confirmed all that?


• Yes. These are the commands I ran from the host to confirm it:

  docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'
  docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'

  docker inspect -f 'Status={{.State.Status}} Health={{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}} RestartCount={{.RestartCount}} StartedAt={{.State.StartedAt}}' emqx
  docker logs --tail 40 emqx
  docker logs --since 1h emqx | tail -n 50
  docker inspect -f 'LogPath={{.LogPath}}' emqx

  docker exec emqx sh -lc 'ls -1 /opt/emqx/bin 2>/dev/null && echo --- && /opt/emqx/bin/emqx_ctl status 2>/dev/null || true'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl help | sed -n "1,240p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl broker stats 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics list 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl retainer info 2>&1 | sed -n "1,120p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl retainer topics 1 1000 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients list 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl subscriptions list 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients show e66141040370772c 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients show mqttjs_d61ad246 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics show pico/temperature/dht22 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics show pico/humidity/dht22 2>&1 | sed -n "1,200p"'

  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace start topic pico/temperature/dht22 /tmp/pico-temp.trace info json 2>&1 | sed -n "1,120p"'
  sleep 5; docker exec emqx sh -lc 'wc -c /tmp/pico-temp.trace 2>/dev/null; echo ---; sed -n "1,120p" /tmp/pico-temp.trace 2>/dev/null'

  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace stop topic pico/temperature/dht22 >/dev/null 2>&1; /opt/emqx/bin/emqx_ctl trace start topic pico/# /tmp/pico-all.trace info json 2>&1 | sed -n
  "1,120p"'
  sleep 5; docker exec emqx sh -lc 'wc -c /tmp/pico-all.trace 2>/dev/null; echo ---; sed -n "1,120p" /tmp/pico-all.trace 2>/dev/null'

  A couple of the key ones:

  - emqx_ctl clients list to see connected clients
  - emqx_ctl topics list to see active topics in broker state
  - emqx_ctl trace start topic ... to watch live publishes


docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients list'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics list'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace start topic pico/# /tmp/pico.trace info json'

  To check whether messages arrived after starting the trace:

  sleep 5
  docker exec emqx sh -lc 'wc -c /tmp/pico.trace; echo ---; sed -n "1,120p" /tmp/pico.trace'

  To stop the trace:

  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace stop topic pico/#'

  If you want a single command for live monitoring, I can give you a one-liner that loops and shows new trace output as it lands.

  The usual way is to open a long-lived subscriber and keep it connected.

  If you have mosquitto_sub installed:

  mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/#' -v

  That will stay open and print every message on any pico/... topic.

  Useful variants:

  - All topics:

    mosquitto_sub -h 127.0.0.1 -p 1883 -t '#' -v

  - Only one sensor topic:

    mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/temperature/dht22' -v

  - Show connection/debug details:

    mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/#' -v -d

  If you need TLS on EMQX:

  mosquitto_sub -h 127.0.0.1 -p 8883 --cafile ca.crt -t 'pico/#' -v

  If mosquitto_sub is not installed, I can give you the equivalent using a container or another MQTT client.


  I found it here:

  - poc/iot-rpi-dht-insulation/ingester/data/readings.sqlite

  What I verified:

  - It has a readings table.
  - It currently contains 40 rows.
  - The newest rows are from 2026-06-07, including:
      - pico/temperature/dht22
      - pico/humidity/dht22
      - pico/temperature/internal
      - esp32/temperature/dht11
      - esp32/humidity/dht11

```sh
mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/temperature/dht22' -v
mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/humidity/dht22' -v
```

### Tomatoes

