---
title: "Weddings are expensive. Be smart with the right software."
date: 2025-02-03
draft: false
tags: ["OSS"]
description: "Interesting software for Weddings (WeddingShare)."
url: "software-for-weddings"
---


## Website for Weddings

With astro, you can build pretty cool **weddings ssgs themes**:

1. https://github.com/Boston343/horizon
Ive forked it to https://github.com/JAlcocerT/horizon (could not resist!)

## Selfhostable Software for Weddings

1. Few [Selfhostable Alternatives](https://noted.lol/event-photos-and-self-hosting/) for events
2. https://github.com/Cirx08/WeddingShare

> GPL3.0 | A place for guests to view and drop pictures of the big day

### WeddingShare Setup

* https://docs.wedding-share.org/
  * https://docs.wedding-share.org/docs/Setup/docker
  * https://hub.docker.com/r/cirx08/wedding_share
  * https://www.redditmedia.com/r/selfhosted/comments/1gugnku/weddingshare_a_basic_selfhosted_drop_box_and/


```yml
services:
  wedding-share:
    container_name: WeddingShare
    image: cirx08/wedding_share:latest
    ports:
      - '${HTTP_PORT:-8080}:5000/tcp'
    environment:
      TITLE: 'WeddingShare'
      LOGO: 'Url'
      GALLERY_COLUMNS: 4
      ALLOWED_FILE_TYPES: '.jpg,.jpeg,.png'
      MAX_FILE_SIZE_MB: 10
      SECRET_KEY: 'password'
    volumes:
      - data-volume-config:/app/config
      - data-volume-thumbnails:/app/wwwroot/thumbnails
      - data-volume-uploads:/app/wwwroot/uploads
    network_mode: bridge
    hostname: wedding-share
    restart: always

volumes:
  data-volume-config:
    name: WeddingShare-Config
  data-volume-thumbnails:
    name: WeddingShare-Thumbnails
  data-volume-uploads:
    name: WeddingShare-Uploads
```

Default credentials to `localhost:8080/Admin` are...`admin/admin`


![Wedding Share](/blog_img/apps/weddingshare.png)

{{< callout type="warning" >}}
Make sure you setup the `BASE_URL` env variable [as per readme](https://github.com/Cirx08/WeddingShare?tab=readme-ov-file#basic)
{{< /callout >}}

## Making Deployments Easy


{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/" title="With a Raspberry/SBC/MiniPC ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="Or with a Server ↗" >}}
{{< /cards >}}

Once you are **connected** to the device/server:

```sh
ssh someuser@192.168.0.232 #pi 2gb
ssh someuser@192.168.0.155 #pi 4gb
# hetzner vps server
```

1. Go to [Hetzner](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#hetzner) - https://www.hetzner.com/cloud/

![Hetzner VPS](/blog_img/selfh/hetzner.png)


2. See your projects and select OS + Hardware- https://console.hetzner.cloud/projects


![Hetzner VPS](/blog_img/selfh/hetzner-sharedcpu.png)

3. Create SSH keys and give the public key to Hetzner

```sh
ssh-keygen
cat id_ed25519.pub #provide this 
```

* `/home/your_username/.ssh/id_rsa`: This is your **private key**. Keep this file secret! Never share it with anyone.
* `/home/your_username/.ssh/id_rsa.pub`: This is your **public key**. You can share this file. You'll add the contents of this file to the authorized_keys file on the server you want to access.

4. Create the VPS (you can tweak the name), then just login:

```sh
ssh cx22@88.198.ip.address
```

5. Get ready for SelfHosting with Containers

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh
#nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING

chmod +x Selfhosting_101.sh
sudo ./Selfhosting_101.sh
```

{{< callout type="info" >}}
See the script I prepared [here](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/)
{{< /callout >}}

6. Check that **Docker and Portainer** are ready:

```sh
docker --version
Docker version 27.5.1, build 9f9e405
```

Go to `ip:9000` and setup Portainer properly:

![Portainer setup](/blog_img/selfh/portainer.png)

7. Use the docker-compose stack for weddings share

See that it works at `ip:8080`

* `http://ip:8080/Admin/Login`

> Example: https://elenayjosesecasan.top/

8. **Choose a Reverse Proxy Manager:**

As seen on [this post](https://jalcocert.github.io/JAlcocerT/selfhosting-python-ai-apps-caddy/), there are few alternatives:

* [NGINX](https://jalcocert.github.io/JAlcocerT/get-started-with-flask/)
* Caddy
* Traefik

{{< callout type="info" >}}
**Cloudflare tunnels** is other of my go to options, yet you also have: [ngrok](https://www.reddit.com/r/selfhosted/comments/10n1h0p/cloudflare_tunnel_alternative/), [Pangolin](https://www.youtube.com/watch?v=a-a-Xk1hXBQ),...
{{< /callout >}}








{{< details title="NGINX Setup Details with Cloudflare 📌" closed="true" >}}

Dont forget to add **this A record**, pointing to the VPS, so that it will be able to create sub domains from it with https:

![CF DNS Records to hetzner VPS](/blog_img/selfh/cloudflare-hetzner-nginx.png)

And also the CNAME, to be able to create certificates for subdomains with cloudflare:


But like this, **also with the CNAME record for CF** if using CF:

![Cloudflare Aname Cname for https](/blog_img/selfh/cloudflare-hetzner-nginx2.png)

[Setup NGINX](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/)

```yml
version: "3"
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    container_name: nginx
    ports:
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port - UI
    volumes:
      - ~/Docker/Nginx/data:/data
      - ~/Docker/Nginx/letsencrypt:/etc/letsencrypt
    networks:  # Only ONE networks section
      - nginx_network  # Use the desired network name here

networks:  # Only ONE networks section
  nginx_network:  # Define the network with the desired name
```

9. Connect the wedding share container with **nginx network**

```sh
sudo docker network ls
docker network connect nginx_nginx_network WeddingShare

#docker network connect nginx_nginx_default WeddingShare

#docker network inspect nginx_nginx_network #now its connected
```

10. Setup **Https with NGINX**


* Email: `admin@example.com`
* Password: `changeme`

![Hetzner VPS](/blog_img/selfh/portainer.png)

For the **DNS Challenge**, you need input from your domain registrar, like: Cloudflare, duckDNS, Porkbun,...

{{< callout type="warning" >}}
With DNS challenge, we dont need any port forwarding!
{{< /callout >}}

![DNS Challenges](/blog_img/selfh/nginx-challenges.png)


{{< /details >}}


<!--
https://www.youtube.com/watch?v=qlcVx-k-02E
-->

> Thanks to this awsome video!

{{< youtube "qlcVx-k-02E" >}}

{{< callout type="warning" >}}
Dont forget that you will need both, **A and CNAME DNS** records!
{{< /callout >}}

Do you need a powerfull VPS?

Not really, see how much im using a CX22: Portainer + NGINX + Wedding share **~500mb RAM**

![NGINX Example](/blog_img/selfh/weddingshare-hetzner.png)




{{< details title="Dont forget the DNS challenge | Cloudflare + NGINX 📌" closed="true" >}}

> As seen at https://jalcocert.github.io/JAlcocerT/firebat-ak2-plus-minipc-review/


* Point your DNS to your server:

![Cloudflare DNS for NGINX Example](/blog_img/mini_pc/cloudflare_dns_nginx.png)

> I like to have the internal IP and other for the device tailscale VPN IP


* In the SSL tab, you will need to Add a **DNS Challenge**, for Cloudflare would be:

![DNS Challenge CF](/blog_img/mini_pc/DNS_Challenge_Cloudflare.png)

* With Cloudflare, you will need their [API Token from here](https://dash.cloudflare.com/profile/api-tokens)
  * Go to **Edit zone DNS**. Zone Resources -> Include all zones (or a specific domain only) and create it. Add it as `dns_cloudflare_api_token=`
* In NginX UI, you will add the: **container name and port** of the services

{{< /details >}}



{{< details title="DNS challenge | PorkBun + NGINX 📌" closed="true" >}}

* https://porkbun.com/account/api

* https://kb.porkbun.com/article/190-getting-started-with-the-porkbun-api

* https://porkbun.com/account/domainsSpeedy

{{< /details >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages/" title="Astro Github + Cloudflare Pages ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cool-link-in-bios/" title="Gitlab + Cloudflare Pages ↗" >}}
{{< /cards >}}

## Conclusions

Using cloudflared for a sub.sub.domain.com is **problematic with the https/SSL**.

So I restarted everything (with a CPX11, AMD x86).

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh
#nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING

chmod +x Selfhosting_101.sh
sudo ./Selfhosting_101.sh
```

This took ~42s.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/" title="Tech for a Trip" image="/blog_img/hardware/travel-pakc.jpg" subtitle="Software for Vacations" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/" title="Wireguard with Hetzner as VPS" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Vacations after a wedding? VPN Setup" >}}
{{< /cards >}}


```yml
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest' #admin@example.com / changeme
    restart: always
    container_name: nginx    
    ports:
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port - UI
    volumes:
      - nginx_data:/data #  - ~/Docker/Nginx/data:/data
      - nginx_letsencrypt:/etc/letsencrypt #  - ~/Docker/Nginx/letsencrypt:/etc/letsencrypt    

volumes:
  nginx_data:
  nginx_letsencrypt:      

networks:
  nginx_default:
    name: nginx_default      
```

```yml
services:
  filebrowser:
    image: filebrowser/filebrowser
    container_name: filebrowser
    ports:
      - 8080:80
    volumes:
      - /root/Docker/FileBrowser/config:/config
      - /root/Docker/FileBrowser/data:/srv
    restart: unless-stopped    
    networks:
      - nginx_default #this will allow communication between chevereto service and the existing nginx service  
  
networks:
  nginx_default:
    external: true
```

This requires ~309mb/1.87GB of RAM.

And for **DNS Challenge** with Cloudflare:

You will need their [API Token from here](https://dash.cloudflare.com/profile/api-tokens)

* Go to Create token: **Edit zone DNS**. `Zone Resources` -> `Include all zones` (or a specific domain only) and create it. Add it as `dns_cloudflare_api_token=`
* In NginX UI, you will add the: **container name and port** of the services

![CName and A Record DNS CLoudflare with NGINX](/blog_img/selfh/duckdns-hetzner-nginx2.png)


{{< callout type="warning" >}}
Dont forget: Point the DNS records **BEFORE** adding the SSL certificates in NGINX.
{{< /callout >}}

Then you will be done in under a minute:

![CName and A Record DNS CLoudflare with NGINX](/blog_img/selfh/nginx-cloudflare-filebrowser.png)

And...if you are looking for a Theme for a Wedding landing page, you can have a look to **Astro Theme Horizon**.

---

## FAQ

### Getting a Domain Name

* https://sered.net/dominios

With an API...

0. Porkbun
1. NameCheap
2. Cloudflare Domains (but does not allow to buy via API)


### Alternatives to Weddingshare

The good thing about Weddingshare, is that it creates a **QR** to point to the url.


{{< callout type="info" >}}
You can also make [QR's with Python](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt)!
{{< /callout >}}

But, it does NOT support `.HEIC` files.

And having the https was a headache.

So I went with [**FileBrowser**](https://fossengineer.com/selfhosting-filebrowser-docker/)

[![shields.io Stars](https://img.shields.io/github/stars/filebrowser/filebrowser)](https://github.com/filebrowser/filebrowser/stargazers)

```yml
services:
  filebrowser:
    image: filebrowser/filebrowser
    container_name: filebrowser
    ports:
      - 8080:80
    volumes:
      - /home/Docker/FileBrowser/config:/config
      - /home/Docker/FileBrowser/data:/srv #same as Syncthing!
    restart: unless-stopped    

networks:
  nginx_nginx_default:
    external: true
```

Not like this:

![CF Hetzner NGINX](/blog_img/selfh/cloudflare-hetzner-nginx.png)

But like this, **also with the CNAME record for CF** if using CF:

![FireBat NGINX Example](/blog_img/selfh/cloudflare-hetzner-nginx2.png)

![FireBat NGINX Example](/blog_img/selfh/duckdns-hetzner-nginx2.png)


And this is how they get to work, **with the container port**:

![FireBat NGINX Example](/blog_img/selfh/nginx-duckdns-cf.png)

#### More

{{< callout type="info" >}}
Kudos to [awsome-docker-compose](https://awesome-docker-compose.com/apps/photo-server)
{{< /callout >}}

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-Photoview-docker/" title="Photoview" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/Photos/Piwigo_Docker-compose.yml" title="Piwigo" >}}
  {{< card link="" title="PiGallery" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="NGINX" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Backups/Photos" title="Docker Repo" >}}
{{< /cards >}}

### What I learnt

1. Another HUGO cool theme! https://tmuguet.gitlab.io/hugo-split-gallery/

2. To generate [**QR's with logo** thanks to Python](https://github.com/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb) 

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)

> QRs can also be done with [Inkscape](https://flathub.org/apps/org.inkscape.Inkscape) or with [IT-Tools as a container](https://github.com/JAlcocerT/Docker/tree/main/Z_Dockge/stacks/it-tools) or [emn178](https://emn178.github.io/online-tools/qr-code/generator/)

3. Make sure to **secure your Hetzner Server**

{{< details title="Some Ports might be Open and you can receive a BSI mail 📌" closed="true" >}}

```sh
sudo apt update
sudo apt install ufw
```

```sh
sudo ufw deny 111/tcp
sudo ufw deny 111/udp

sudo ufw allow ssh

sudo ufw status
#sudo ufw enable
```

{{< /details >}}

4. For https, cloudflared tunnels are tricky for `sub.sub.domain.com` (ok for `sub.domain.com` ). With the NGINX setup and proper DNS records (A and CNAME) before creating the certificates, it works.

Creating a tunnel is fine:

![CF Tunnel creation](/blog_img/selfh/https/cloudflared-tunnel1.png)


But this will not create SSLs:

![CF Tunnel creation](/blog_img/selfh/https/cloudflared-tunnel2.png)

Fortunately, we can get that SSL for the sub sub domain with NGINX and these records set:

![DNS Records for NGINX https on sub sub domain](/blog_img/selfh/https/cloudflare-vs-nginx-subdomains.png)

5. After the event has finished, you just have to copy the files to your own laptop. You can try with rSync:

```sh
rsync -avz root@157.678.45.123:/root/Docker/FileBrowser/ ./
```

6. [Optionally] You can use **[Selfhostable Photo Management tools](/JAlcocerT/photo-management-tools)** and see what have been uploaded to Filebrowser