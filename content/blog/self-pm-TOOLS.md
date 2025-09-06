---
title: "PM Tools for Business"
date: 2025-09-03T23:20:21+01:00
draft: false
tags: ["Web","OSS for Business","Self-Hosting","PPTs","AppFlowy"]
description: 'Become the project manager that can do real work'   
url: 'selfhosting-pm-tools-docker'    
---


**Intro**: As a PM in any project, you will need to:

1. Take good [notes](#note-taking-apps)
2. Create proper [PPTs](#creating-presentations-ppts) and diagrams
3. Be aware of the [PRD/BRD/FRD](https://jalcocert.github.io/JAlcocerT/brd-vs-frd-for-data-analytics/)...
4. How much [time](https://jalcocert.github.io/JAlcocerT/time-management-data-analytics/) and [focus](https://jalcocert.github.io/JAlcocerT/tools-to-improve-focus/) matter
5. Be good with your [Architect](https://jalcocert.github.io/JAlcocerT/data-analytics-architecture/) and [BA](https://jalcocert.github.io/JAlcocerT/business-analytics-skills/)

## Note Taking Apps

Call it [note taking](https://jalcocert.github.io/JAlcocerT/knowledge-management/).

Call it knowledge management.

The thing is that you needs this in the information era.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Business/PM" title="PM Related | Docker Configs 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/knowledge-management/" title="Note Taking / KM | Post ↗" >}}
{{< /cards >}}


### AppFlowy

<!-- https://itsfoss.com/appflowy/ -->

* {{< newtab url="https://www.appflowy.io/" text="The AppFlowy Official Site" >}}
* {{< newtab url="https://github.com/AppFlowy-IO/AppFlowy" text="The Source Code at Github" >}}

> AGPL-3.0 license | AppFlowy is an **open-source alternative to Notion**. You are in charge of your data and customizations.

> > Built with Flutter and Rust.

Install appflowy is per: <https://docs.appflowy.io/docs/appflowy/install-appflowy/installation-methods/installing-with-docker>

```yml
#version: '3'
services:
  appflowy:
    image: appflowyio/appflowy_client:main
    volumes:
      - $HOME/.Xauthority:/root/.Xauthority:rw
      - /tmp/.X11-unix:/tmp/.X11-unix
      - /dev/dri:/dev/dri
      - /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket
      - appflowy-data:/home/appflowy
    environment:
      - DISPLAY=${DISPLAY}

volumes:
  appflowy-data:
```

AppFlowy, an open source project mgmt, documentation, and note-taking app for extreme productivity

{{< youtube "5_WwDt0A4LA" >}}


<!-- <https://www.youtube.com/watch?v=5_WwDt0A4LA> -->

## Communication

F/OSS to [Communicate with the Team](https://jalcocert.github.io/JAlcocerT/communication-management).

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Communication" title="Communication Related | Docker Configs 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/communication-management/" title="Communication Tools | Post ↗" >}}  
{{< /cards >}}

## Creating Presentations (PPTs)

You can also create PDFs with [stirling-pdf](https://fossengineer.com/selfhosting-stirling-pdf)

### Creating Diagrams

1. ExcaliDraw

* https://libraries.excalidraw.com/?theme=dark&sort=downloadsTotal

2. DrawIO

## F/OSS to Manage Projects

A project is also a lot about Time Management.

These tools help to get an overview of *where are we* for your daily: 

1. OpenProject
2. [LeanTime](https://fossengineer.com/selfhosting-Leantime-docker/)
3. TimeLite

https://github.com/JAlcocerT/Docker/blob/main/Business/PM/leantime_docker-compose.yaml

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Business/PM" title="PM Related | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/leantime" title="LeanTime | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

## F/OSS Alternatives to Excel

Build AI-native spreadsheets. Univer is a full-stack framework for **creating and editing spreadsheets** on both web and server.

With Univer MCP, Univer Spreadsheets is driven directly through natural language. 

* https://github.com/dream-num/univer

> Apache v2 | Univer is an open-source alternative to Google Sheets, Slides, and Docs

Airtable alternatives...


---

## FAQ


### How to Make a CV with Open Software

Already tired?

Looking for a [**job change** because the market is bullish](https://jalcocert.github.io/JAlcocerT/playwright-101/)?

1. Open Resume
2. Reactive Resume
3. OverLeaf - Latex driven CV as a Code, as commented [here](https://jalcocert.github.io/JAlcocerT/playwright-101/)

### How to BackUp My Projects

1. Syncthing, together with https://github.com/nware-lab/sm2

> Syncthing Multi Server Monitor aka smsm aka sm²

2. Just use NextCloud, bro.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/syncthing" title="Syncthing | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nextcloud" title="NextCloud | Docker Configs 🐋 ↗" >}}
{{< /cards >}}


---

## FAQ

### Other F/OSS

* Vikunja
* Leantime
* Taiga
* Plane - https://mariushosting.com/how-to-install-plane-on-your-synology-nas/

* Timeline on Linux - Visualize events in chronological order

* https://github.com/plankanban/planka

> Free open source kanban board for workgroups.

* https://github.com/RestyaPlatform/board/

>  Trello like kanban board. Based on Restya platform. 

* https://github.com/wekan/wekan

* https://github.com/Peppermint-Lab/Peppermint

>  An open source ticket management & help desk solution. A zendesk/freshdesk alternative - Elevate Your Customer Support