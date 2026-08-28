---
title: "Forward auth wraps apps without changing them"
date: 2025-05-27
tags: ["authentication", "forward-auth", "tinyauth", "traefik"]
description: "Forward auth is useful when a reverse proxy should protect an app before the request reaches the app."
---

Forward auth protects services from the outside.

With TinyAuth, Authelia, or a similar service behind Traefik or Nginx, the reverse proxy checks the request before forwarding it to the application. 

The app does not need to implement login screens, sessions, OAuth callbacks, or whitelists itself.

That is ideal for dashboards, internal tools, homelab services, and apps that were not built with authentication. The auth service owns login, cookies, JWT/session checks, OAuth/OIDC delegation, and email or domain whitelists.

**Forward auth is a gateway pattern**, not an app feature.

Related:

- [How to setup TinyAuth x Traefik with DNS Challenge]({{< relref "/blog/networking-tinyauth-traefik.md" >}})
- [FrontEnd 101. SPAs and ways to do Auth]({{< relref "/blog/dev-fe.md" >}})
- [SSO tools centralize trust and blast radius](/notes/sso-tools-centralize-trust-and-blast-radius/)
- [ThreeBodies repo](https://github.com/JAlcocerT/ThreeBodies)
- [TinyAuth Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/tinyauth)
- [Traefik Docker config](https://github.com/JAlcocerT/Home-Lab/tree/main/traefik)
- [Traefik proxy configs](https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik)
- [ThreeBodies DNS updater](https://github.com/JAlcocerT/ThreeBodies/blob/main/Z_DeployMe/update_dns.py)
