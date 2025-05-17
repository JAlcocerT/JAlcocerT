---
title: Tools for Tinkers and SelfHosters
type: docs
prev: docs/debian
next: docs/arch
sidebar:
  open: false
---

Whatever you plan to **Selfhost**, there will be a moment that you will be looking for:

1. [HTTPs and SSL](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/) Setup
2. [Monitoring](https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/)
3. [Benchmarking](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/)


{{< callout type="info" >}}
Great Reference for ideas: https://github.com/awesome-selfhosted/awesome-selfhosted
{{< /callout >}}

## General OSS Resources

- [Open Source Alternative - Add Project](https://www.opensourcealternative.to/add-project)
- [Privacy Tools](https://www.privacytools.io/)
- [Selfh.st](https://selfh.st/)

## SelfHosted Email

{{< callout type="warning" >}}
This is advanced
{{< /callout >}}

Self-hosted [Stalwart mail server](https://gist.github.com/chripede/99b7eaa1101ee05cc64a59b46e4d299f?ref=selfh.st)

[SMTP2Go](https://www.reddit.com/r/selfhosted/comments/1hr7bi5/smtp2go_free_plan_spam_score/)

---

## FAQ


{{% details title="Hot to mount external drives consistently?" closed="true" %}}

```sh
lsblk #list them again
lsblk -f /dev/sda1 /dev/sdb2 #see the format and the UUID of a couple of blocks
df -h /dev/sda1 #you will see if its mounted
```

```sh
sudo apt install ntfs-3g

sudo nano /etc/fstab #forever
UUID=some-uuid /mnt/data_ntfs_500 ntfs-3g defaults,uid=1000,gid=1000,umask=0022 0 1
UUID=some-uuid-of-your-drive /mnt/ext4_mount_point_folder ext4 defaults 0 1
```

For one time:

```sh
sudo mkdir -p /mnt/data_ntfs_500
sudo mount -t ntfs /dev/sda1 /mnt/data_ntfs_500/ #example with ntfs

sudo mkdir -p /mnt/data_ext_2tb
sudo mount -t ext4 /dev/sdb2 /mnt/data_ext_2tb/ #example with ntfs
```

{{% /details %}}

{{% details title="Screen Rotation? 🚀" closed="true" %}}

```sh
xrandr --output HDMI-A-0 --rotate normal
xrandr --output HDMI-A-0 --rotate right
```

{{% /details %}}


{{% details title="Whats my Local IP? 🚀" closed="true" %}}

```sh
ifconfig

#ifconfig eth0 | grep -A 10 "<global>" #check mac, and transfered packages

ifconfig eth0 | grep "inet " | awk '{ print $2 }' #if ETH Connected - SEE THE LOCAL IP

#ifconfig tailscale0 | grep "inet " | awk '{ print $2 }' #for Tailscale
```

{{% /details %}}

### What do I like to SelfHost?

1. Container UI's 🐳: Portainer, 

2. Syncthing 🐳

3. Tools 🐳: IT-Tools, CosmosServer, OmniTools

```yml
version: '3'
services:
  cosmos-server:
    image: azukaar/cosmos-server:latest
    container_name: cosmos-server
    hostname: cosmos-server
    privileged: true
    restart: always
    ports:
      - "800:80"
      - "4433:443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /:/mnt/host
      - /var/lib/cosmos:/config
    networks:
      - default

networks:
  default:
```

4. [Webs 🐳](https://github.com/JAlcocerT/Docker/tree/main/Web/CMS): Wordpress, Ghost, LinkInBio selfhosted alternatives...

> Wrote a post about the most popular CMS [here](https://jalcocert.github.io/JAlcocerT/no-code-websites/) and about LinkStack [here](https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/#selfhosted-solutions-for-linkinbio)

5. Productivity Tools 🐳: Get [proper focus](https://jalcocert.github.io/JAlcocerT/tools-to-improve-focus/)

6. [GenAI Tools 🐳](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen) 

7. HTTPs Tools: Like NGINX, Traefik, Cloudflare Tunnels or Pangolin.

8. PaaS Tools, like [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/)

9. [Photo Tools](https://jalcocert.github.io/JAlcocerT/photo-management-tools/)

> The docker files are [here 🐳](https://github.com/JAlcocerT/Docker/tree/main/Backups/Photos)

10. SSGs 🐳

Like Hugo Theme Gallery

Even SliDevJS PPTs!

11. Change Detection

```yml
#https://docs.linuxserver.io/images/docker-changedetection.io/#application-setup
#https://github.com/dgtlmoon/changedetection.io

---
version: "2.1"
services:
  changedetection:
    image: lscr.io/linuxserver/changedetection.io:latest
    container_name: changedetection
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - BASE_URL= #optional
    volumes:
      - /home/Docker/changedetection/config:/config
    ports:
      - 5000:5000
    restart: unless-stopped
```

12. DUckDNS

https://hub.docker.com/r/linuxserver/duckdns


```yml
docker run -d \
  --name=duckdns \
  --net=host `#optional` \
  -e PUID=1000 `#optional` \
  -e PGID=1000 `#optional` \
  -e TZ=Etc/UTC `#optional` \
  -e SUBDOMAINS=subdomain1,subdomain2 \
  -e TOKEN=token \
  -e UPDATE_IP=ipv4 `#optional` \
  -e LOG_FILE=false `#optional` \
  -v /path/to/appdata/config:/config `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/duckdns:latest
```



#https://docs.nextcloud.com/server/latest/user_manual/en/files/file_drop.html#setting-up-your-own-file-drop

If it is here -**YOU ARE LUCKY** - https://docs.linuxserver.io/images/docker-vscodium/#docker-cli-click-here-for-more-info


=====================================

WIRESHARK 

https://docs.linuxserver.io/images/docker-wireshark/


* <https://docs.linuxserver.io/images/docker-steamos/#supported-architectures>


* <https://docs.linuxserver.io/images/docker-kdenlive/>
* <https://docs.linuxserver.io/images/docker-cura/>
FREE CAD


*<https://docs.linuxserver.io/images/docker-faster-whisper/#supported-architectures>

MEDIA SERVER

* <https://docs.linuxserver.io/images/docker-emby/>

**DATABASELESS KNOWLEDGE BASE**

<https://docs.linuxserver.io/images/docker-raneto/#miscellaneous-options>
<https://docs.linuxserver.io/images/docker-hedgedoc/>
<https://js.wiki/>


CRON JOBS UI

<https://docs.linuxserver.io/images/docker-healthchecks/>

FAIL2BAN

<https://docs.linuxserver.io/images/docker-fail2ban/#docker-compose-recommended-click-here-for-more-info>


---
version: "2.1"
services:
  grav:
    image: lscr.io/linuxserver/grav:latest
    container_name: grav
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/Docker/grav/config:/config
    ports:
      - 80:80
    restart: unless-stopped


https://hub.docker.com/r/honeygain/honeygain


docker run honeygain/honeygain -tou-accept -email ACCOUNT_EMAIL -pass ACCOUNT_PASSWORD -device DEVICE_NAME

```yml
version: '3'
services:
  honeygain:
    image: honeygain/honeygain
    command: -tou-accept -email ACCOUNT_EMAIL -pass ACCOUNT_PASSWORD -device DEVICE_NAME
```

#https://github.com/gristlabs/grist-core
#https://github.com/gristlabs/grist-electron
https://hub.docker.com/r/gristlabs/grist#!


```yml
docker pull gristlabs/grist
docker run -p 8484:8484 -it gristlabs/grist
```

```yml
#version: '3'
services:
  appflowy:
    image: appflowyio/appflowy_client:main
    volumes:
      - $HOME/.Xauthority:/root/.Xauthority:rw
      - /tmp/.X11-unix:/tmp/.X11-unix
      - /dev/dri:/dev/dri
      - /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket
      - appflowy-data:/home/appflowy
    environment:
      - DISPLAY=${DISPLAY}

volumes:
  appflowy-data:
```

#https://github.com/huginn/huginn/blob/master/doc/docker/install.md

version: '3'
services:
  huginn:
    image: ghcr.io/huginn/huginn
    ports:
      - "3000:3000"


#Log in to your Huginn instance using the username admin and password password
