---
title: "Selfhosted Tools for your Car"
date: 2027-02-05
draft: false
tags: ["OpenPilot","LubeLog","Canbus Mapping","GPS"]
description: 'A look to F/OSS '
url: 'open-source-car-tools'
---

https://github.com/hargata/lubelog

https://github.com/commaai/openpilot


https://fossengineer.com/savvycan-canbus-reverse-engineering/
https://fossengineer.com/opendbc-python-api-for-your-car/

### Wiring a Canbus Properly


To sniff and reverse-engineer CAN messages from a Renault, you only need **3 connections** between your USB CAN FD analyzer and the male OBD-II plug:

1. Required Wiring Setup

| USB CAN FD Terminal | Plug Connection | OBD-II Male Plug Pin |
| --- | --- | --- |
| **`CAN H >`** | Connects to | **Pin 6** (CAN High) |
| **`CAN L >`** | Connects to | **Pin 14** (CAN Low) |
| **`GND`** ($\stackrel{\text{}}{\text{⏚}}$) | Connects to | **Pin 4** or **Pin 5** (Ground) |

> **Note on Power:** You do **not** need to connect the vehicle's +12V (Pin 16) to this analyzer. The USB port on your laptop powers the board completely.

2. Pin Identification on Your Male Plug

When looking at the **front face** of your male OBD-II plug (pins pointing toward you, wider edge on top):

```text
       WIDER TOP EDGE
  ┌─────────────────────────────────┐
  │ 1   2   3  [4] [5] [6]  7   8   │  <- Pins 4, 5, 6 (Top row)
   \ 9  10  11  12  13 [14] 15  16 /   <- Pin 14 (Bottom row)
    └───────────────────────────────┘

```

* **Pin 6 ($CAN\_H$):** 6th pin from the left on the top row.
* **Pin 14 ($CAN\_L$):** 6th pin from the left on the bottom row (directly below Pin 6).
* **Pin 4 or 5 ($GND$):** 4th or 5th pin from the left on the top row.


<!-- 
https://youtube.com/shorts/q-BlvhkLqcU -->

{{< youtube "q-BlvhkLqcU" >}}


3. Recommended Settings for Reverse Engineering

1. **Baud Rate:** High-Speed powertrain CAN on most Renault vehicles operates at **500 kbps** (500,000 bps).
2. **Termination Resistor ($120\,\Omega$):** Since you are plugging into an active, already-terminated vehicle bus, you generally **do not** need to enable an extra $120\,\Omega$ resistor on your USB tool. If you experience frame drops or errors, test with the $120\,\Omega$ jumper/setting enabled.
3. **Software:** You can use tools like **SavvyCAN**, **CANDump / SocketCAN** (Linux), or the dedicated software provided with your USB-CAN tool to record and analyze traffic when pressing buttons, changing gears, or starting the engine.


## Conclusions

When was the last time tat you questioned if you are optimizing sth that is worth to be optimized?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Bring AI to your workflow" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled free value!" >}}
{{< /cards >}}


## FAQ

- DetherKit: A charting library with five chart types, generating avatars, buttons, and gradient washes with impressive animations and simple code integration.
- Aistack: A platform to compare AI tool stacks used by developers, allowing users to share their workflows and expenditures on AI tools.
- WebClaw: An open-source web scraper API that can handle complex scraping tasks, available for self-hosting or as a cloud service.
- Evil Buttons: A collection of 29 unique buttons with various functionalities and animations, including fun and interactive designs.
- icons0: A fast icon search tool that aggregates icons from 223 different libraries, allowing easy access for both developers and AI agents.

### Location

https://github.com/dedicatedcode/reitti

1. [Wanderer](#wanderer) - awsome way to track your routes
2. [Dawarich](#dawarich) - Self-hosted alternative to Google Location History - Privacy-focused location tracking with API key authentication
3. Endurain - https://github.com/joaovitoriasilva/endurain
4. [AdventureLog](https://github.com/seanmorley15/AdventureLog)
5. GeoPulse - A self-hosted, privacy-first location timeline platform: an open-source alternative to Google Timeline with automatic trip detection, Immich integration, and rich analytics.

Quick Setup Guide
OwnTracks
Open-source location tracking with HTTP or MQTT connections

GPSLogger
Android GPSLogger app via HTTP + Basic Auth (OwnTracks-compatible payload)

Overland
Simple HTTP endpoint with token-based authentication

Traccar
Traccar Position Forwarding (JSON) with Bearer token authentication


Home Assistant
Integrate with Home Assistant automation for automatic location tracking

Colota
Privacy-focused GPS tracker with batch sync and smart tracking

https://github.com/Flomp/wanderer
https://github.com/Flomp/wanderer?tab=AGPL-3.0-1-ov-file#readme

> wanderer is a self-hosted trail database. Save your adventures!

https://wanderer.to/getting-started/installation/#from-source

It uses meilisearch - https://github.com/meilisearch/meilisearch



```yml
version: '3'

x-common-env: &cenv
  MEILI_URL: http://search:7700
  MEILI_MASTER_KEY: vODkljPcfFANYNepCHyDyGjzAMPcdHnrb6X5KyXQPWo

services:
  search:
    container_name: wanderer-search
    image: flomp/wanderer-search
    environment:
      <<: *cenv
      MEILI_NO_ANALYTICS: true
    ports:
      - 7700:7700
    networks:
      - wanderer
    volumes:
      - ./data/data.ms:/meili_data/data.ms
    restart: unless-stopped
    healthcheck:
      test: curl --fail http://localhost:7700/health || exit 1
      interval: 15s
      retries: 10
      start_period: 20s
      timeout: 10s
  db:
    container_name: wanderer-db
    image: flomp/wanderer-db
    depends_on:
      search:
        condition: service_healthy
    environment:
      <<: *cenv
    ports:
      - "8090:8090"
    networks:
      - wanderer
    restart: unless-stopped
    volumes:
      - ./data/pb_data:/pb_data
  web:
    container_name: wanderer-web
    image: flomp/wanderer-web
    depends_on:
      search:
        condition: service_healthy
      db:
        condition: service_started
    environment:
      <<: *cenv
      ORIGIN: http://localhost:3000 #change this accordingly, like 192.168.3.200
      BODY_SIZE_LIMIT: Infinity
      PUBLIC_POCKETBASE_URL: http://db:8090
      PUBLIC_DISABLE_SIGNUP: false
      UPLOAD_FOLDER: /app/uploads
      UPLOAD_USER:
      UPLOAD_PASSWORD:
      PUBLIC_VALHALLA_URL: https://valhalla1.openstreetmap.de
    volumes:
      - ./data/uploads:/app/uploads
    ports:
      - "3000:3000"
    networks:
      - wanderer
    restart: unless-stopped
  # valhalla:
  #   image: ghcr.io/gis-ops/docker-valhalla/valhalla:latest
  #   ports:
  #     - "8002:8002"
  #   volumes:
  #     - ./data/valhalla:/custom_files
  #   environment:
  #     - tile_urls=https://download.geofabrik.de/europe/germany/bayern/oberbayern-latest.osm.pbf
  #     - use_tiles_ignore_pbf=True
  #     - force_rebuild=False
  #     - force_rebuild_elevation=False
  #     - build_elevation=True
  #     - build_admins=True
  #     - build_time_zones=True

networks:
  wanderer:
    driver: bridge
```


https://github.com/pyston/pyston

https://github.com/Freika/dawarich


https://github.com/pbogre/jetlog
https://github.com/pbogre/jetlog?tab=readme-ov-file#docker-recommended

> Personal flight tracker and viewer

### Forums

### Chats

https://fossengineer.com/bitchat-mesh-messaging/

https://github.com/chattocorp/chatto?ref=selfh.st
https://github.com/fluxerapp/fluxer?ref=selfh.st

### Notes

LogSeq splitted a while back into a simple vs more features https://logseq.io/p/e3YDyX5AYr