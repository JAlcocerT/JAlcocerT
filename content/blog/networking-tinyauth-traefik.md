---
title: "How to setup TinyAuth x Traefik. Compared to LogTo."
date: 2025-05-27T23:20:21+01:00
draft: false
tags: ["Dev","HomeLab"]
description: 'TinyAuth  Authentication Setup. Together with a Flask App and Traefik Reverse Proxy for https.'
url: 'testing-tinyauth'
---

I was having a look to https://selfh.st/newsletter/2025-02-07/ and found out about **TinuAuth**

Which seems to integrate with https services and provide an **auth layer**.


* https://tinyauth.doesmycode.work/docs/guides/github-oauth.html
* https://github.com/steveiliop56/tinyauth
* https://tinyauth.doesmycode.work/docs/getting-started.html

But what's **TinyAuth**?

*Just* a [Okta alternative](https://opensourcealternative.to/?searchTerm=okta), similarly to [Authentik](https://opensourcealternative.to/project/authentik)

{{< cards cols="2" >}}
  {{< card link="https://www.youtube.com/watch?v=CmUzMi5QLzI" title="Traefik v3.3 Must See Video | From Jims Garage ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Security/Proxy/" title="Traefik & other Proxies| Docker Config 🐋 ↗" >}}
{{< /cards >}}

We will be setting up a **Flask Web app** with https via **Traefik** and auth via **TinyAuth**. [Jump](#conclusions).

## TinyAuth


Remember, [generate your keys](https://jalcocert.github.io/JAlcocerT/encryption-101/):

```sh
openssl rand -base64 32
```

{{< details title="TinyAuth Compose with traefik and nginx 📌" closed="true" >}}


This `docker-compose.yml` file defines a setup using Traefik as a reverse proxy, Nginx as a web server, and TinyAuth for authentication.

Let's break down each service:

**1. `traefik` Service:**

*   `container_name: traefik`: Assigns the name "traefik" to the container.
*   `image: traefik:v3.3`: Specifies the Traefik image version to use.
*   `command: --api.insecure=true --providers.docker`: Configures Traefik.
    *   `--api.insecure=true`: Enables the Traefik API in insecure mode.  **This is generally discouraged for production.**  It's useful for development and testing, but in production, you should use a secure API.
    *   `--providers.docker`: Tells Traefik to use Docker as a provider, meaning it will automatically discover and configure routing for other containers based on their labels.
*   `ports: - 80:80`: Maps port 80 on the host to port 80 in the container.  This means that requests to port 80 on your host machine will be forwarded to Traefik.
*   `volumes: - /var/run/docker.sock:/var/run/docker.sock`: Mounts the Docker socket into the Traefik container. This is how Traefik can communicate with the Docker daemon to discover other containers and configure routing.  **This is a security consideration.**  Only grant access to the Docker socket to trusted containers.
*   `labels:`: These labels are used by Traefik to configure routing and middleware.
    *   `traefik.http.middlewares.tinyauth.forwardauth.address: http://tinyauth:3000/api/auth`: Defines a middleware named "tinyauth".  This middleware uses forward authentication, meaning it will send authentication requests to the TinyAuth service running at `http://tinyauth:3000/api/auth`.

**2. `nginx` Service:**

*   `container_name: nginx`: Assigns the name "nginx" to the container.
*   `image: nginx:latest`: Specifies the Nginx image to use.
*   `labels:`:  Traefik uses these labels for configuration.
    *   `traefik.enable: true`: Tells Traefik to enable routing for this container.
    *   `traefik.http.routers.nginx.rule: Host(\`nginx.example.com\`)`: Defines a router named "nginx".  This router will handle requests to the host `nginx.example.com`.
    *   `traefik.http.services.nginx.loadbalancer.server.port: 80`: Defines a service that points to port 80 of the Nginx container.
    *   `traefik.http.routers.nginx.middlewares: tinyauth`: Applies the "tinyauth" middleware to the "nginx" router.  This means that requests to `nginx.example.com` will be authenticated by TinyAuth before being forwarded to Nginx.

**3. `tinyauth` Service:**

*   `container_name: tinyauth`: Assigns the name "tinyauth" to the container.
*   `image: ghcr.io/steveiliop56/tinyauth:latest`: Specifies the TinyAuth image to use.
*   `environment:`: Sets environment variables for TinyAuth.
    *   `SECRET=some-random-32-chars-string`: Sets the secret used for JWT signing.  **Change this to a strong, randomly generated secret.**
    *   `APP_URL=https://tinyauth.example.com`: Sets the URL of your application.
    *   `USERS=user:$$2a$$10$$UdLYoJ5lgPsC0RKqYH/jMua7zIn0g9kPqWmhYayJYLaZQ/FTmH2/u`: Defines a user "user" with a bcrypt hashed password.  **You should generate a strong password and hash it using bcrypt.**  The `$$` are needed because `$` has a special meaning in YAML.
*   `labels:`:
    *   `traefik.enable: true`: Enables Traefik routing for this container.
    *   `traefik.http.routers.tinyauth.rule: Host(\`tinyauth.example.com\`)`: Defines a router for `tinyauth.example.com`.
    *   `traefik.http.services.tinyauth.loadbalancer.server.port: 3000`: Defines a service pointing to port 3000 of the TinyAuth container.

**How it Works Together:**

1.  A request comes in to `nginx.example.com`.
2.  Traefik, acting as a reverse proxy, receives the request.
3.  Traefik checks the labels and sees that the "tinyauth" middleware is applied to this route.
4.  Traefik forwards the request to the TinyAuth service at `http://tinyauth:3000/api/auth`.
5.  TinyAuth checks the credentials (if any) and authenticates the user.
6.  If authentication is successful, TinyAuth redirects the request back to Traefik.
7.  Traefik then forwards the request to the Nginx container.
8.  Nginx serves the content.

**Key Security Considerations:**

*   **`--api.insecure=true`:**  **Do not use this in production.**  Use a secure API with TLS.
*   **`SECRET`:** Change the `SECRET` environment variable to a strong, randomly generated value.
*   **`USERS`:** Generate a strong password and hash it using bcrypt.  Do not store passwords in plain text.
*   **Docker Socket:** Mounting the Docker socket is a security risk.  Only do this if you trust all the containers that have access to it.  Consider alternative methods if possible.

This setup provides a basic example of how to use Traefik, Nginx, and TinyAuth together.  Remember to address the security concerns before deploying this in a production environment.

{{< /details >}}

With TinyAuth, we will be able to login via GITHUB or with particular users and passwords

When hitting: Forgot your password?

You can reset your password by changing the **USERS environment variable**.


https://www.youtube.com/watch?v=qmlHirOpzpc
{{< youtube "qmlHirOpzpc" >}}


## About Traefik

If you have ever faced with the problem of [http vs https](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/#proxies), 

* https://doc.traefik.io/traefik/plugins/
* https://plugins.traefik.io/plugins

<!-- https://www.youtube.com/watch?v=vVKMey6SfSw -->

<!-- {{< youtube "vVKMey6SfSw" >}} -->

**Traefik is an open-source reverse proxy** and load balancer that's designed to be easy to use, flexible, and scalable. 

It's written in Go, which makes it lightweight and efficient. Traefik is ideal for modern web applications, microservices, and containerized environments.

{{< details title="Benefits of Traefik? 📌" closed="true" >}}

Ease of use, high performance, and flexibility. You'll learn how Traefik can help you simplify your infrastructure, improve your application's scalability, and reduce errors.

Traefik offers a range of features that make it an attractive choice for developers.

Some of its key features include:

* Automatic service discovery
* Load balancing and routing
* SSL termination and encryption
* Support for multiple protocols (HTTP, WebSocket, TCP)
* Integration with popular technologies like Docker, Kubernetes, and Mesos

{{< /details >}}

Traefik is a powerful and flexible reverse proxy that's worth considering for your next project. 

With its ease of use, high performance, and scalability, Traefik can help you improve your application's reliability and performance.


### How to Install Traefik

Not enough with Nginx or Caddy?

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX" >}}
  {{< card link="https://fossengineer.com/selfhosting-traefik/" title="Traefik Setup" >}}
{{< /cards >}}

Have a look to **Traefik**

We can also get **SSL certificates thanks to LetsEncrypt**.

And it also provides a UI dashboard.

* https://github.com/traefik/traefik
* https://hub.docker.com/_/traefik
* https://doc.traefik.io/traefik/getting-started/install-traefik/
    * https://doc.traefik.io/traefik/user-guides/docker-compose/basic-example/

> MIT | The Cloud Native Application Proxy


![Traefik Logs OK](/blog_img/selfh/https/traefik-logs-ok.png)


* **Strengths:**
    * **Dynamic Configuration:** Traefik excels at automatically discovering and configuring services based on service discovery mechanisms like Docker, Kubernetes, and Consul.
    * **Extensive Plugin Ecosystem:** Offers a wide range of plugins for various use cases, including authentication, rate limiting, and middleware.
    * **Ease of Use:** Relatively easy to set up and configure, especially with dynamic configurations.
* **Weaknesses:**
    * **Configuration Complexity:** While dynamic configuration is a strength, it can also lead to complex configurations for more advanced setups.
    * **Performance:** May not be as performant as Nginx for very high-traffic scenarios.


> Container first proxy, configurable via code

<!-- https://www.youtube.com/watch?v=XH9XgiVM_z4 -->
{{< youtube "XH9XgiVM_z4" >}}


#### Traefik JimGarage

* https://doc.traefik.io/traefik/user-guides/docker-compose/basic-example/
* https://doc.traefik.io/traefik/user-guides/docker-compose/acme-dns/


> Thanks to https://github.com/JamesTurland/JimsGarage/blob/main/Traefik/docker-compose.yml

What we will need:

1. Docker
2. NGINX to serve a website
3. Traefik providing SSL with your Domain

{{< callout type="info" >}}
To validate that we own the domain, we can do **DNS or TLS Challenge** (the latter requires Port FWD)
{{< /callout >}}

For the **DNS Challenge**, we just need the **API access**, for example to Cloudflare Domains.


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik" title="HUGO Container | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}


```sh
nano docker-compose.yaml
```


Important:

* `/home/ubuntu/docker/traefik/acme.json` stores the private keys of the certificates
* `/home/ubuntu/docker/traefik/traefik.yml` entry points for traefik
* `/home/ubuntu/docker/traefik/config.yml`

With that, LetsEncrypt will login to the Domain registrar and creates a temporary record.

Then, it will know that you are the one that really own the domain and therefore you can get certificates for that domain.

**How to get API Token from Cloudflare** - DNS Challenge!

Go to My Profile on the top right -> `API Tokens` -> `Create Token` -> Select the `Edit Zone DNS` Template

![Zone DNS CF](/blog_img/selfh/CF-APITokens-ZoneDNS.png)

> Keep Permissions Zone: DNS And as Zone Resources you can specify the particular domain (optional).

> > You will need to point DNS to your server via Cloudflare UI or [programatically](#updating-dns-records)

You will get a way to verify that the **token works**:

```sh
curl -X GET "https://api.cloudflare.com/client/v4/user/tokens/verify" \
     -H "Authorization: Bearer some-cf-token" \
     -H "Content-Type:application/json"
```

You can use that API into the **Traefik docker-compose below** at `CF_DNS_API_TOKEN`

See that we also have a `traefik.yml` linked in the volumes of this compose.

And the docker network:

```sh
sudo docker network create proxy
```

Acme file will be created blank (and fill later automatically).

 

```sh
mkdir -p /home/docker/traefik
cd /home/docker/traefik

touch /home/docker/traefik/acme.json #blank, just change the permissions to 600 later (private key)
touch /home/docker/traefik/acme.yml
touch /home/docker/traefik/traefik.yml
```

```sh
chmod 600 ./acme.json && \
chmod 600 ./traefik.yml #or it will be a security risk for other users to see the privatekey
```
    
> See https://github.com/JamesTurland/JimsGarage/blob/main/Traefik/traefik-config/traefik.yml


And last but not least, we need to **create a strong password**

```sh
sudo apt install apache2-utils

#generating a hashed password for the user "admin" using the htpasswd utility
echo $(htpasswd -nb "admin" "admin") | sed -e s/\\$/\\$\\$/g #place the full result into the dockercompose for the dash creds
```

Right on this label of the docker compose: `traefik.http.middlewares.traefik-auth.basicauth.users`

And now, we just do:

```sh
##https://github.com/JamesTurland/JimsGarage/blob/main/Traefik/docker-compose.yml
sudo docker-compose up -d
```

And I got this kind of error:

`2025-02-08T22:54:03Z ERR Error while building configuration (for the first time) error="error reading configuration file: /config.yml - read /config.yml: is a directory" providerName=file`

But it worked for me with the **Traefik v3.3 version** and this guide: https://www.jimgogarty.com/installing-traefik-on-docker-with-docker-compose/


#### Traefik JimGarage v3.3

Thanks to this, finally I got my head around Traefik, for good:


{{< cards cols="1" >}}
  {{< card link="https://github.com/JamesTurland/JimsGarage/tree/main/Traefikv3" title="Traefik v3 Container Jimsgarage | Docker Configs 🐋✅ ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik" title="Traefik v3 Container | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=CmUzMi5QLzI -->
{{< youtube "CmUzMi5QLzI" >}}

---

## Conclusions

With Traefik working, its time to combine it with a sample Flask Web App and **Tinyauth**.

### Traefik x TinyAuth x Flask

I have [vibe coded](https://jalcocert.github.io/JAlcocerT/vide-coding/#windsurf) this [Flask](https://jalcocert.github.io/JAlcocerT/web-apps-with-flask/) App:

It's the **3 body problem**, baby!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/comparing-rag-and-use-cases/" title="Three Body Repo" image="/blog_img/dev/flask-vibe-coded.png" subtitle="Flask Post" >}}
  {{< card link="https://github.com/JAlcocerT/ThreeBodies" title="Three Bodies Web App" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Flask Web App" >}}
{{< /cards >}}

<!-- ![Flask 3 Bodies](/blog_img/dev/flask-vibe-coded.png) -->



How about using this **Flask web app** with https thanks to Traefik?

Easy.

We will need to create a **Github OAUTH App**:

![alt text](/blog_img/selfh/https/TinyAuth/gh-apps.png)

1. Go to https://github.com/settings/applications/new

Add the link as per your subdomain: https://tinyauth.jalcocertech.com/api/oauth/callback/github

![alt text](/blog_img/selfh/https/TinyAuth/gh-oauth-apps.png)

2. Then, registre the application. Get its ID and and its client secret:

![alt text](/blog_img/selfh/https/TinyAuth/gh-client-secret.png)

Those are required for

```yml
    environment:
      - GITHUB_CLIENT_ID=${GITHUB_CLIENT_ID} #For GitHub OAuth
      - GITHUB_CLIENT_SECRET=${GITHUB_CLIENT_SECRET}
```

3. When its done, we will be Seeing the application: https://github.com/settings/applications/3023538

particularly at the [OAUTH developer section](https://github.com/settings/developers). 

![alt text](/blog_img/selfh/https/TinyAuth/oauth-app-created.png)

Just sping up Tiny Auth with:

```sh
sudo docker compose up -d
```
And go to `https://tinyauth.jalcocertech.com` or whatever subdomain you placed.


![alt text](/blog_img/selfh/https/TinyAuth/tinyauth-https-ui.png)

Authorize the app

![alt text](/blog_img/selfh/https/TinyAuth/tinyauth-authorize-app.png)

And you will be logged in:

![alt text](/blog_img/selfh/https/TinyAuth/tinyauth-logged-in.png)

```sh
docker compose -f PiwigoTraefik_docker-compose.yml up -d
##command: tail -f /dev/null #in case you need to keep running


# docker builder prune
# #docker system prune -a
# docker volume prune
# docker image prune -a
```



---


### Updating DNS Records

Before moving forward...make sure that you have **proper DNS records** at your domain provider.

I have tested this with **Cloudflare**.

> See [this script](https://github.com/JAlcocerT/Docker/tree/main/Security/DNS/Cloudflare_DNS), also at [3bodies](https://github.com/JAlcocerT/ThreeBodies/blob/main/Z_DeployMe/update_dns.py)

We will need the Cloudflare API and zoneID, which you can get from:

```sh
curl -X GET "https://api.cloudflare.com/client/v4/zones?name=whateveryourdomainis.com" \
  -H "Authorization: Bearer whateveryourAPIis" \
  -H "Content-Type: application/json"
```

Or, if you just want it simple, get the **ZoneID parsed** with:

```sh
curl -X GET "https://api.cloudflare.com/client/v4/zones?name=whateveryourdomainis.com" \
  -H "Authorization: Bearer whateveryourAPIis" \
  -H "Content-Type: application/json" | jq -r '.result[0].id'
```

### Logto Authentication

https://docs.logto.io/quick-starts/python

* https://cloud.logto.io/