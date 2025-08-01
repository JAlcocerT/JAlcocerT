---
title: Https for your Apps
type: docs
prev: /docs/privacy/
next: docs/arch/
draft: false
---

How to get https for selfhosted apps on a homelab or VPS.

First thing: get a domain!

> You dont need an expensive one, neither fancy.

You can find deals for Top Level Domains: https://tld-list.com/ from any provider like ovhcloud, namesilo, godaddy, porkbun, cloudflare...

There are some deals for first year for around 1-3$ to get you started.

Get ready to learn A LOT.

## Proxies

I started with [NPM](#nginx), but understood that there are few alternatives to get https into your selfhosted services.

Because some people will charge you from having that SSL setup, like [here](https://raiolanetworks.com/certificados-ssl/)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy" title="Proxies Docker Config Files 🐋 ↗" >}}
{{< /cards >}}

See this **example** on how one service ([Multichat](https://github.com/JAlcocerT/Streamlit-MultiChat)), can be deployed with [Https with any of the 3 Proxies](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Project_MultiChat).


[![Star History Chart](https://api.star-history.com/svg?repos=NginxProxyManager/nginx-proxy-manager,traefik/traefik,caddyserver/caddy&type=Date)](https://star-history.com/#NginxProxyManager/nginx-proxy-manager&traefik/traefik&caddyserver/caddy&Date)


### Traefik

Sample Selfhosted Apps with **Traefik support** out of the box:

1. [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/#dokploy)
2. [Claper](https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/#selfhosting-cool-ppt-software) PPTs
3. [The MultiChat](https://jalcocert.github.io/JAlcocerT/selfhosting-python-ai-apps-caddy/#https-options-for-the-multichat-project): which works with traefik/nginx as per [these configs](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Project_MultiChat)

{{< cards cols="2" >}}
  {{< card link="https://www.youtube.com/watch?v=CmUzMi5QLzI" title="Traefik v3.3 Must See Video | From Jims Garage ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Security/Proxy/" title="Traefik | Docker Config 🐋 ↗" >}}
{{< /cards >}}

If the DNS is set properly, these will work:

![alt text](/blog_img/selfh/https/cf-api-token.png)

![alt text](/blog_img/selfh/https/cf-dns-python.png)

![alt text](/blog_img/selfh/https/cf-dns-record.png)

![alt text](/blog_img/selfh/https/Traefik-https.png)

```sh
#nslookup gibme.duckdns.org
nslookup https://jalcocertech.com
```

If the DNS Challenge worked with the [Cloudflare API token](https://dash.cloudflare.com/profile/api-tokens), these will work:

```sh
curl -I https://jalcocertech.com
echo | openssl s_client -servername jalcocertech.com -connect jalcocertech.com:443 2>/dev/null | openssl x509 -noout -dates
```

> [This blog](https://myzopotamia.dev/traefik-reverse-proxy-with-containers) was inspiring and here you have a [Traefik x Groq working sample](https://github.com/JAlcocerT/phidata/tree/main/Z_DeployMe) with the [PhiData Fork](https://github.com/JAlcocerT/phidata)


Whats great about Traefik, is that you can provide HTTPs to other services, just by adding label into their `docker-compose.yml`:


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik" title="Traefik | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/phidata/tree/main/Z_DeployMe" title="Youtube Groq | Docker Config 🐋 ↗" >}}
{{< /cards >}}

And all of that happens programatically, plus we wont have conflict of using the same ports, as the host wont be seeing them!

### Caddy

I tried to close 2024 with a [post about selfhosting AI apps with Caddy](https://jalcocert.github.io/JAlcocerT/selfhosting-python-ai-apps-caddy/#how-to-setup-caddy).

Sample SelfHosted Apps with **Caddy support** out of the box:

### NGINX

NGINX can be used together with Authelia, which provides potentially, an authentication layer.

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX Setup and HTTPs with DuckDNS" >}}
{{< /cards >}}

Example project working with NGINX Proxy Manager:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Security/Proxy/nginx_docker_compose.yaml" title="NginxPM Docker Config File 🐋 ↗" >}}
{{< /cards >}}


{{< callout type="info" >}}
Thanks to Jims Garage and Chrstian Lempa for the explanatory videos!
{{< /callout >}}

## Behind a NAT 

Initially, it was all about [cloudflared](#cloudflare-tunnels), but lately you will also hear about:

1. Pangolin
2. 
3. [Cloudflare Tunnels](#cloudflare-tunnels)

### Cloudflare Tunnels

How to expose Apps safely, through your domain, with https and **without exposing your home public IP**.

That was a blocker for long to me.

Until I discovered [Cloudflared tunnels](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/).

And saw a practical [example to expose a selfhosted app with cf](https://fossengineer.com/selfhosting-timelite-with-docker/).

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/why-i-love-containers/" title="Why I love Containers | Post ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/SelfH/Cloudflared" title="Cloudflared with Docker 🐋 ↗" >}}
{{< /cards >}}

![Cloudflare Zero Trust UI](/blog_img/selfh/CF-Cloudflared.png)

{{< callout type="info" >}}
Remember to use the `cloudflared_tunnel` network on the containers you want to expose!
{{< /callout >}}

* https://one.dash.cloudflare.com

![CF Tunnels](/blog_img/web/Cloudflare/cf-tunnel.png)

```sh
docker network connect cloudflared_tunnel portainer #your_docker_container_to_expose  #network (tunnel) - service
```