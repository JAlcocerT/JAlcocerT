---
title: "A look to Reverse Proxy options. Pangolin"
date: 2025-11-20
draft: false
tags: ["Dev"]
description: 'Pangolin. Compared with other https tools like Cloudflared, Caddy, Traefik and NGINX.'
url: 'how-to-expose-homelab-safely'
---

* https://github.com/fosrl/pangolin
    * https://docs.fossorial.io/

> Tunneled Mesh Reverse Proxy Server with Identity and Access Control and Dashboard UI


<!-- 
https://www.youtube.com/watch?v=a-a-Xk1hXBQ&t=402s 
-->

{{< youtube "a-a-Xk1hXBQ" >}}

https://docs.fossorial.io/Newt/install

To the home server yo use:

```yml
services:
    newt:
        image: fosrl/newt
        container_name: newt
        restart: unless-stopped
        environment:
            - PANGOLIN_ENDPOINT=https://example.com
            - NEWT_ID=2ix2t8xk22ubpfy
            - NEWT_SECRET=nnisrfsdfc7prqsp9ewo1dvtvci50j5uiqotez00dgap0ii2
```


Pangolin: Your Own Self-Hosted Cloudflare Tunnel Alternative

Watch the Video
Overview

This report summarizes a YouTube video by DB Tech that discusses Pangolin, a self-hosted alternative to Cloudflare Tunnels. Pangolin provides remote access to self-hosted resources without requiring port forwarding and offers various authentication methods for resources. The video goes through the installation requirements, Pangolin overview, site and resource setup, authentication setup, and site and resource connection.
Section 1: Introduction

Pangolin is a self-hosted alternative to Cloudflare Tunnels that allows remote access to self-hosted resources without port forwarding. It is still in beta and requires a domain name and access to another Docker server outside the home.
Section 2: Installation Requirements

Pangolin requires a domain name and access to another Docker server outside the home. The installation process involves changing the DNS record for the domain and installing Pangolin using the installer script or using the manual install method.
Section 3: Pangolin Overview

Pangolin uses Gerbil for reverse proxying, Traffic for TLS termination, Badger as a plugin for Traffic, and Newt as the tunnel agent installed locally.
Section 4: Site and Resource Setup

Sites are used to create tunnels, and resources include applications running on the network. The video demonstrates adding a Hortus Fox and Excalidraw resource.
Section 5: Authentication Setup

Pangolin offers authentication methods for resources, including platform SSO, password protection, pin code, and one-time passwords. The video demonstrates setting up these authentication methods for a resource.
Section 6: Site and Resource Connection

A site and resource are connected by installing the Newt agent on the local node using a Docker Compose file.
Takeaways

Pangolin allows remote access to **self-hosted resources without port forwarding.**
It provides various authentication methods for resources.
Pangolin **requires a domain name and access to another Docker server outside the home**.
Site and resource connection is established by installing the Newt agent on the local node.

Report generated on: February 18, 2025 (11:29 AM)