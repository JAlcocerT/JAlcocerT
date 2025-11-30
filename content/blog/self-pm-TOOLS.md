---
title: "PM Tools for Business"
date: 2025-09-03T23:20:21+01:00
draft: false
tags: ["OSS for Business","Self-Hosting","PPTs","AppFlowy"]
description: 'Become the project manager that can do REAL work. Project Management 101'   
url: 'selfhosting-pm-tools-docker'    
---


**Tl;DR**

We want it all "Good, Fast, Cheap". 

> This is the project management trilemma.

Fortunately, there are **project management tools** to help you!

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

You might be interested in F/OSS to [Communicate with the Team](https://jalcocert.github.io/JAlcocerT/communication-management).

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Communication" title="Communication Related | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/huly" title="Huly | Docker Configs 🐋 ↗" >}}  
{{< /cards >}}

There is one tool, that can do kind of all at once: PM + [communication](https://jalcocert.github.io/JAlcocerT/communication-management) + [KowledgeBase](https://jalcocert.github.io/JAlcocerT/knowledge-management/)

### Huly

Huly is an open-source all-in-one project management and team collaboration platform designed to replace or integrate the functionalities of tools like Linear, Jira, Slack, Notion, and Motion.

* https://github.com/hcengineering/platform

>  Huly — All-in-One Project Management Platform (alternative to Linear, Jira, Slack, Notion, Motion) 


Key features of Huly:

- **Workflow, project, and process management** tailored to dynamic real-world team needs.
- Team planner and calendar for scheduling and tracking tasks.
- Real-time collaborative editing of documents with rich text, images, code blocks, and action items.
- **Integrated chat**, video, and audio conferencing to create virtual office spaces for remote teams.
- Notifications and time-blocking to boost productivity.
- Two-way synchronization with GitHub to manage tasks across repositories.
- Customizable virtual offices and meeting rooms.
- **Knowledge base** creation with powerful linking and tagging.
- Focus on streamlining team communication, coordination, and document management.

In essence, Huly is designed as a comprehensive "everything app" for teams to manage projects, communicate, plan, and collaborate seamlessly in one platform.

## Creating Presentations (PPTs)

You can also create PDFs with [stirling-pdf](https://fossengineer.com/selfhosting-stirling-pdf)

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/diagrams_ppts/" title="Diagrams and PPTs | Docs ↗" >}}
{{< /cards >}}

### Creating Diagrams

1. ExcaliDraw

* https://libraries.excalidraw.com/?theme=dark&sort=downloadsTotal

2. DrawIO

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/excalidraw" title="Excalidraw | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/drawio" title="DrawIO | Docker Config 🐋 ↗" >}}
{{< /cards >}}


## F/OSS to Manage Projects

A project is also a lot about Time Management.

These tools help to get an overview of *where are we* for your daily: 

1. OpenProject
2. [LeanTime](https://fossengineer.com/selfhosting-Leantime-docker/) as per [config](https://github.com/JAlcocerT/Docker/blob/main/Business/PM/leantime_docker-compose.yaml)
3. TimeLite


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
3. OverLeaf - Latex driven CV as a Code, as commented [here](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/)

### How to BackUp My Projects

1. Syncthing, together with https://github.com/nware-lab/sm2

> Syncthing Multi Server Monitor aka smsm aka sm²

2. Just use NextCloud, *,bro'*.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/syncthing" title="Syncthing | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nextcloud" title="NextCloud | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

### Other Related PM F/OSS Tools

* Vikunja
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