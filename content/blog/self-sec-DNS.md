---
title: "Improving Privacy with Open Source DNS "
date: 2026-12-15T23:20:21+01:00
draft: true
tags: ["Docker","Self-Hosting"]
description: ''
summary: 'How to change DNS Servers and why it matters'
url: 'private-dns-with-docker'
---


https://github.com/TechnitiumSoftware/DnsServer

> agpl 3 | Technitium DNS Server

<!-- Interested to discover similar services that you can self-host with Docker? - Check this out:

* {{< gist jalcocert 302f787db6f6d75e978674e0e18d1185
"Docker-Security-ConfigFiles">}}
* <https://fossengineer.com/tags/self-hosting/> -->

<!-- ### Choosing a DNS for PiHole

* Unbound
* Bind9
* Other resolvers:
    * Quad9
    * CLoudflare/Google... -->

<!-- * How to use Raspberry Pi as WIFI **A**ccess **P**oint: https://jalcocert.github.io/RPi/posts/rpi-raspap/
* How to use a RPi as a Wifi 2 Ethernet + VPN: https://jalcocert.github.io/RPi/posts/rpi-wifi-ethernet-bridge/ -->

<!-- ### Best DNS to use with PiHole -->

<!-- 
## Pihole regexp
https://github.com/mmotti/pihole-regex
https://avoidthehack.com/best-pihole-blocklists
https://github.com/mmotti/pihole-regex -->

<!-- 
## Wireshark - Checking which adds are going through
https://docs.linuxserver.io/images/docker-wireshark/

 -->


<!-- 
https://awweso.me/dns/ -->


<!-- 
 https://hub.docker.com/r/pihole/pihole
 
 DNSMASQ_LISTENING
 
 https://github.com/pi-hole/docker-pi-hole/?tab=readme-ov-file#environment-variables
     -->

<!-- {{< gist jalcocert 302f787db6f6d75e978674e0e18d1185
"Docker-Security-Pihole.yml">}} -->



#### PiHole

This service has been with my [for a while](https://jalcocert.github.io/RPi/posts/selfh-internet-better/).

But now *PiHole is reloaded* with its **v6**.

> Replacing any v5 image (2024.07.0 and earlier) with a v6 image will result in updated configuration files.

> > These changes are irreversible.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/DNS" title="DNS Config Files 🐳 ↗"  >}}
  {{< card link="https://github.com/JamesTurland/JimsGarage/blob/main/Piholev6/docker-compose.yaml" title="PiHole v6 Config File 🐳 ↗"  >}}  
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=mnry95ay0Bk -->

{{< youtube "mnry95ay0Bk" >}}

> If you are looking for other Selfhosted DNS, see: GoAdblock

https://blog.foxxmd.dev/posts/redundant-lan-dns/


https://awesome-docker-compose.com/apps/dns

<!-- https://www.youtube.com/@TokinPrivacy/videos

Cybersecurity for Beginners: Basic Skills
https://www.youtube.com/watch?v=aRbKFCY4tjE -->


https://github.com/plaintextpackets/netprobe_lite
Simple internet performance tester written in Python



* quad9
* cloudflare
* adguar
* google
* PiDNS - url: 'selfhosting-PiHole-docker'

* https://www.dnsleaktest.com/
* https://www.techradar.com/news/best-dns-server

Verify DNS Server Functionality:

Test if the DNS server is reachable and functioning properly. You can ping the DNS server:

```sh
ping 192.168.3.1
```

If the ping is successful, try using a direct DNS query to see if DNS resolution is working:

```sh
dig @192.168.3.1 google.com
```

If dig is not installed, you can install it using `sudo apt-get install dnsutils`

<!-- 
Is Your VPN Leaking?
https://www.youtube.com/watch?v=GxVIa3eDdnM -->



##

https://0xerr0r.github.io/blocky/latest/?ref=selfh.st

https://github.com/0xERR0R/blocky

 Fast and lightweight DNS proxy as ad-blocker for local network with many features 

> Blocky is a DNS proxy and ad-blocker for the local network **written in Go** with following features:

{{< dropdown_docker title="Really, Just Get Docker 🐋" closed="true" >}}

https://github.com/getdnsapi/stubby

## Stubby DNS

DNS over TLS

https://www.youtube.com/watch?v=VCTiR_Ny4Sc


### DNSCrypt

https://github.com/DNSCrypt/dnscrypt-proxy

## Unbound DNS

## Pi-Hole DNS

PiHole + Wireguard - https://www.youtube.com/watch?v=R29YBmYxXAk

https://www.youtube.com/watch?v=-5Fwyl73C7g

## Bind9

https://hub.docker.com/r/ubuntu/bind9#!

https://www.youtube.com/watch?v=4IuNKK2y49s

> CÓMO configurar tu DNS - Configuración de BIND [Parte 1]


https://www.youtube.com/watch?v=syzwLwE3Xq4

https://www.youtube.com/watch?v=syzwLwE3Xq4&t=745s
> You want a real DNS Server at home? (bind9 + docker)


## CoreDNS

It is great for Docker: https://www.youtube.com/watch?v=tE9YjEV1T4E

## Conclusions

How to **test your ad-blocks** - https://d3ward.github.io/toolz/ -->>> https://d3ward.github.io/toolz/adblock.html


--- 


## FAQ

1. https://github.com/hagezi/dns-blocklists
2. https://github.com/blacklanternsecurity/baddns

### How can I Check my DNS?


https://dnsprivacy.org/dns_privacy_daemon_-_stubby/

### ControlD (Windscribe DNS)


### Other Free Tools for monitoring Internet


* Monitoring Internet quality
* Wireshark
* PiHole

https://docs.linuxserver.io/images/docker-wireshark/

### Interesting Security Tools

* 2fas - https://github.com/twofas/2fas-android