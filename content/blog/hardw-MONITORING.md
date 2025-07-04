---
title: "Server Monitoring [Recap]. Know your hardware' health."
date: 2025-02-05
draft: false
tags: ["Dev","HomeLab","SelfHosting"]
description: 'Container Server Monitoring with Beszel. Compared with Netdata, Grafana...'
url: 'how-to-setup-beszel-monitoring'
---

Recently I was setting a VPS to [software for weddings](https://jalcocert.github.io/JAlcocerT/software-for-weddings/).

And i found this on reddit - https://www.reddit.com/r/selfhosted/comments/1eb4bi5/i_just_released_beszel_a_server_monitoring_hub/

So I went back to the [VPS provider](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#other-clouds) https://console.hetzner.cloud/projects to try the setup.


## Beszel

* https://github.com/henrygd/beszel
    * https://hub.docker.com/r/henrygd/beszel
    * https://beszel.dev/

> MIT | Lightweight **server monitoring hub** with historical data, docker stats, and alerts.

Following the docs - https://beszel.dev/guide/getting-started

```yml
services:
  beszel:
    image: henrygd/beszel:latest
    container_name: beszel
    restart: unless-stopped
    extra_hosts:
      - host.docker.internal:host-gateway
    ports:
      - 8090:8090
    volumes:
      - ./beszel_data:/beszel_data

  beszel-agent:
    image: henrygd/beszel-agent:latest
    container_name: beszel-agent
    restart: unless-stopped
    network_mode: host
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
    environment:
      PORT: 45876
      # Do not remove quotes around the key
      KEY: 'UPDATE WITH YOUR PUBLIC KEY (copy from "Add system" dialog)' #you will take it from the UI when adding a new monitor, copy the compose for the agent, and there it is
```

Then, you will **create the admin user** at first login.

And you will be at this point:

![Beszel](/blog_img/Monitoring/beszel.png)

From where you can add the first PC to monitor

![Beszel](/blog_img/Monitoring/beszel-addmonitor.png)


See how DBTech does the full process:
<!-- https://www.youtube.com/watch?v=Bz7gPYBH0AU -->
{{< youtube "Bz7gPYBH0AU" >}}

And you can add the agent as CLI (instead of a docker service):

![Beszel](/blog_img/Monitoring/beszel-agent-cli.png)

{{< callout type="info" >}}
Remember to add the Public server IP as host (or the private IP of your home network like `192.168.0.12`)
{{< /callout >}}

![Beszel](/blog_img/Monitoring/beszel-hetzner.png)

{{< youtube "O_9wT-5LoHM" >}}
<!-- https://www.youtube.com/watch?v=O_9wT-5LoHM&t=602s -->



## Other Monitoring Solutions

### Tianji


Its not just a **web analytics** tool!

![Tianji Server Monitoring](/blog_img/Monitoring/tianji-server-monit.png)

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/setup-tianji-with-docker/" title="Tianji Setup 101" >}}
{{< /cards >}}

You just need to setup the given **script on your server** that pops up when you try to add it.

![Tianji Server Setup](/blog_img/Monitoring/tianji-server-script.png)

To stop Tianji:

```sh
systemctl --type=service --state=running
# sudo systemctl stop tianji-reporter.service
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Web/Analytics/medama_docker-compose.yml" title="For just web analytics - See Medama Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Netdata and Grafana

My first monitoring at the homelab were possible thanks to:

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-netdata/" title="NetData Setup 🐋 ↗" >}}
{{< /cards >}}

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/selfh-grafana-monit/" title="Grafana Setup with a Pi 🐋 ↗" >}}
{{< /cards >}}

And you can actually use Netdata + Grafana + Prometheus to make a cool monitoring setup.

{{< cards cols="1" >}}
  {{< card link="https://noted.lol/netdata-prometheus-and-grafana/" title="See how to build such monitoring at noted.lol ↗" >}}
{{< /cards >}}

### Internet Monitoring Tools

1. With a [Raspberry Pi](https://jalcocert.github.io/RPi/posts/self-internet-monit/)
2. [Internet Speed Tracker](https://fossengineer.com/selfhosting-internet-speed-tracker-with-docker/)
3. [WatchYourLan Setup](https://fossengineer.com/selfhosting-WatchYourLAN-docker/)
4. Gatus - OSS website monitoring!
5. https://akashrajpurohit.com/blog/monitor-internet-speed-with-speedtest-tracker/

<!-- https://www.youtube.com/watch?v=vlifG8dCqU8 -->
{{< youtube "vlifG8dCqU8" >}}