---
title: Https for your Apps
type: docs
prev: /docs/privacy/
next: docs/arch/
draft: false
---

How to get https for selfhosted apps on a homelab or VPS.

## Proxies

I started with [NPM](#nginx), but understood that there are few alternatives to get https into your selfhosted services.

### Traefik

Selfhosted Apps with Traefik support out of the box:
* [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/#dokploy)
* [Claper](https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/#selfhosting-cool-ppt-software) PPTs
* The MultiChat!

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11" title="FFMpeg and Windows GH Reference" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11" title="FFMpeg and Windows GH Reference" >}}  
{{< /cards >}}

> See https://myzopotamia.dev/traefik-reverse-proxy-with-containers

### Caddy

### NGINX

NGINX can be used together with Authelia, which provides a authentication layer.


{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX Setup and HTTPs with DuckDNS" >}}
{{< /cards >}}


{{< callout type="info" >}}
Thanks to for the video!
{{< /callout >}}

## Behind a NAT 

Initially, it was all about [cloudflared](#cloudflare-tunnels), but lately you will also hear about:

1. Pangolin

### Cloudflare Tunnels

How to expose Apps safely, through your domain, with https and **without exposing your home public IP**.

That was a blocker for long to me.

Until I discovered [Cloudflared tunnels](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/).

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/why-i-love-containers/" title="Why I love Containers | Post ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH/Cloudflared" title="Cloudflared with Docker 🐋 ↗" >}}
{{< /cards >}}

![Cloudflare Zero Trust UI](/blog_img/selfh/CF-Cloudflared.png)

{{< callout type="info" >}}
Remember to use the `cloudflared_tunnel` network on the containers you want to expose!
{{< /callout >}}

* https://one.dash.cloudflare.com

![alt text](/blog_img/web/Cloudflare/cf-tunnel.png)

```sh
docker network connect cloudflared_tunnel portainer #your_docker_container_to_expose  #network (tunnel) - service
```