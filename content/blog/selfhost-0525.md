---
title: "SelfHosting Updates - Spring 2025"
date: 2025-05-04T01:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Selfhosted Apps that simplify my workflow as of May 2025: Homarr, Immich'
url: 'selfhosted-apps-may-2025'
---

Ive been following closely the newsletter from: https://selfh.st/icons/

And these have taken my attention: 

1. https://github.com/karakeep-app/karakeep

> aGPL |  A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search 

A replacement for raindrop....

2. https://github.com/vijeeshr/quickretro

> MIT |  A real-time app for conducting a remote sprint retrospective meeting 

Having retrospective is really important when working Agile...

3. https://github.com/formsmd/formsmd

> Apache v2 |  Developer-first, open source Typeform alternative (formerly known as Blocks.md) 

An interesting alternative also to formbricks

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/" title="SelfHosting 101 Script to get containers, tailscale and more ready to go! 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/dev-forms/" title="Forms | Post ↗" >}}
{{< /cards >}}

4. https://github.com/donaldzou/WGDashboard?ref=selfh.st

https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/
https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/


5. https://github.com/Bubka/2FAuth?ref=selfh.st

As I recently had some trouble with my phone...


6. https://github.com/besoeasy/file-drop?ref=selfh.st


filebrowser alternative!

7. BYOD, I mean bring your own music https://github.com/swingmx/swingmusic?ref=selfh.st

8. https://github.com/tiagorangel1/cap?ref=selfh.st

>  Cap is a lightweight, modern open-source CAPTCHA alternative designed using SHA-256 proof-of-work 

### Recap from Spring 2025

https://www.youtube.com/watch?v=Ud9FEmNOgLs

https://github.com/opencloud-eu/opencloud

> Apache v2 | This is the main repository of the OpenCloud server. It contains the golang codebase for the backend services.




## Conclusions

* https://github.com/hollowpnt92/docker-port-viewer?ref=selfh.st
https://github.com/hollowpnt92/docker-port-viewer/blob/main/docker-compose.yml

```sh
docker run -d --name docker-socket-proxy -e CONTAINERS=1 -e POST=0 -e PUT=0 -e DELETE=0 -v /var/run/docker.sock:/var/run/docker.sock:ro tecnativa/docker-socket-proxy && docker run -d --name docker-port-viewer --link docker-socket-proxy -p 3003:80 hollowpnt/docker-port-viewer:latest
```

### Better WebAnalytics

Lately I tried littlyx, but I saw this cool post: https://jakubwolynko.eu/blog/202505-hosting-umami-on-vercel/
