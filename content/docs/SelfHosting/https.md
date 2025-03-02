---
title: Https for your Apps
type: docs
prev: /docs/privacy/
next: docs/arch/
draft: false
---


## Proxies


### Traefik

> See https://myzopotamia.dev/traefik-reverse-proxy-with-containers

### Caddy

### NGINX

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11" title="FFMpeg and Windows GH Reference" >}}
{{< /cards >}}
{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11" title="FFMpeg and Windows GH Reference" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11" title="FFMpeg and Windows GH Reference" >}}  
{{< /cards >}}


{{< callout type="info" >}}
Thanks to for the video!
{{< /callout >}}

## Cloudflare Tunnels

How to expose Apps safely, through your domain, with https and **without exposing your home public IP**.

https://jalcocert.github.io/JAlcocerT/why-i-love-containers/

```sh
sudo docker network tunnel
```


```yml
services:
  cloudflared:
    image: cloudflare/cloudflared:latest
    container_name: cloudflared
    command: tunnel --no-autoupdate run --token yourfantastictoken
    networks:
      - tunnel #Cloudflare Network
    restart: always

networks:
  tunnel: #Cloudflare Network
```

{{< callout type="info" >}}
Remember to use the `tunnel` network on the containers you want to expose!
{{< /callout >}}

```sh
docker network connect tunnel portainer #your_docker_container_to_expose  #network (tunnel) - service
```