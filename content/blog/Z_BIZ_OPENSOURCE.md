---
title: "Business ideas with Open Source"
date: 2025-12-10T23:20:21+01:00
draft: true
tags: ["OSS for Business"]
description: ''
url: 'open-source-software-for-business'
---

## Business OSS Driven

Make sure to understand the licenses.

MIT, Apache v2 will work.

## Hotels


https://qloapps.com/qloapps-installation-process/

docker run -d \
   -p 80:80 \
   -p 3306:3306 \
   -p 2222:22 \
   --name qloapp_srv \
   --restart unless-stopped \
   -e USER_PASSWORD=qloappsuserpassword \
   -e MYSQL_ROOT_PASSWORD=myrootpassword \
   -e MYSQL_DATABASE=qloappsdb \
   -v qloapps_mysql:/var/lib/mysql \
   webkul/qloapps_docker:latest

   > https://peppe8o.com/qloapps-raspberry-pi/

   https://www.ezeefrontdesk.com/ alternative

## Monitoring

* Monitor your vendors
    * https://pingbot.dev/#pricing

Monitoring for your servers, vendors, and infrastructure.

## Chats

* https://www.chaport.com/powered-by-chaport
* https://www.livechat.com/pricing/

## Project Management


* Project management and issue tracking for everyone - https://github.com/makeplane/plane
https://github.com/makeplane/plane?tab=AGPL-3.0-1-ov-file#readme

>  🔥 🔥 🔥 Open Source JIRA, Linear and Asana Alternative. Plane helps you track your issues, epics, and product roadmaps in the simplest way possible. 

* https://github.com/nfoert/cardie - GPL 3.0

> An open source business card designer and sharing platform



## Billing

There will come a time to invoice someone.

Why not doing [billing with OSS](https://fossengineer.com/open-source-invoice-creator/) as well?

* Lago - https://github.com/getlago/lago?tab=AGPL-3.0-1-ov-file#readme

> Open Source Metering and Usage Based Billing API ⭐️ Consumption tracking, Subscription management, Pricing iterations, Payment orchestration & Revenue analytics