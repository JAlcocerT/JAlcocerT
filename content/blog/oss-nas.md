---
title: "Which OS for a NAS?"
date: 2025-03-17
draft: false
tags: ["Gen-AI","Python","Dev"]
description: 'Testing Operative System for a NAS. Improving a Homelab.'
url: 'os-for-nas'
---

Ive been pretty much **comfortable with these OS's**:

1. Ubuntu
2. Zorin OS
3. Garuda Linux 
4. If you miss XP, see https://xpq4.sourceforge.io/

> With Garuda, you unlock the superpower of saying: *I use Arch, btw*


Time to try something new, getting ready for a **network attached storage**:

* OpenMediaVault (OMV)
* Synology
* CasaOS

### Tailscale

```sh
tailscale status
#tailscale up --exit-node=jalcocert-x300
#tailscale down
```

{{< details title="How to Setup Tailscale DNS 📌" closed="true" >}}

TBD

{{< /details >}}

### Benchmarks

```sh
sudo apt install hardinfo
lscpu
```

**Testing the Memory**

```sh
sudo apt install hwinfo
hwinfo --memory

sudo apt install sysbench
sysbench memory run
```

> The **[x13](https://jalcocert.github.io/JAlcocerT/laptop-lenovo-thinkpad-x13-benchmark/)** got **~8164 MiB/sec** and the Pi 4 4GB ~175MiB/sec (x86)

Your server *most likely* will be in between.

---

## Conclusions

At the time of writing, my **energy costs** are ~0.28$/Kwh

**Space for Home Lab**


```sh
df -h | awk '$2 ~ /G/'
#df -h | awk '$2 ~ /G/' | sort -rh -k 2 #sorted
df -h | awk '$5 > "5G" {print $0}' #list the partitions greater than 5GB

#gio trash --empty
#du -sh ~/.local/share/Trash/files
```

![Graphic Walker UI](/blog_img/hardware/sd-samsung.png)


![Graphic Walker UI](/blog_img/hardware/sd-kingston.png)

### My Home Lab Setup

As of today, this is my homelab setup.

Which is connected to my family servers as well:

```mermaid
graph LR
    A[Raspberry Pi 4] --> B(128GB);
    A --> C(512GB);
    A --> D(0.5 external);
    E[Pexd & Poo] --> F(128GB);
    G[OA5Pro] --> H(128GB);
    I[ThinkPad X300] --> J(2TB ext);
    I --> K(2TB);
    L[ThinkPad] --> M( ~476GB Total);
    L --> N(Linux 106 EB);
    L --> O(25-);
    P[SSD USB-C] --> Q(2TB);
    P --> R(650mb/s);
    P --> S(NTFS);
    T[HDD USB] --> U(2TB);
    T --> V(0.5);
    W[HDD] --> X(4TB);
    Y[music server] --> I;
    Z[tailsete VPN] --> I;
    AA[edrive] --> I;
    AB[ProtonDrive!] --> I;
    AC[onedrive] --> L;
    AD[customize KPE/Gorder] --> L;
    
    style B fill:#f9f,stroke:#333,stroke-width:2px
    style C fill:#f9f,stroke:#333,stroke-width:2px
    style D fill:#f9f,stroke:#333,stroke-width:2px
    style F fill:#f9f,stroke:#333,stroke-width:2px
    style H fill:#f9f,stroke:#333,stroke-width:2px
    style J fill:#f9f,stroke:#333,stroke-width:2px
    style K fill:#f9f,stroke:#333,stroke-width:2px
    style M fill:#f9f,stroke:#333,stroke-width:2px
    style N fill:#f9f,stroke:#333,stroke-width:2px
    style O fill:#f9f,stroke:#333,stroke-width:2px
    style Q fill:#f9f,stroke:#333,stroke-width:2px
    style R fill:#f9f,stroke:#333,stroke-width:2px
    style S fill:#f9f,stroke:#333,stroke-width:2px
    style U fill:#f9f,stroke:#333,stroke-width:2px
    style V fill:#f9f,stroke:#333,stroke-width:2px
    style X fill:#f9f,stroke:#333,stroke-width:2px
```


**Networking for Home Lab**

```sh
ifconfig
#ip a show wlp3s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1
##ip a show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1
###ip a show enp2s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1
```

1. Pi4 192.168.0.155 (4GB) and 192.168.0.232 (2GB) both via ethernet
2. x300 Ethernet: 192.168.0.12
3. x13 wifi 192.168.0.124

**Containers**
<!-- 
https://www.youtube.com/watch?v=Z5uBcczJxUY -->

{{< youtube "Z5uBcczJxUY" >}}

One of my favourite containers, are **Cloudflared** and FileBrowser

```yml
services:
  filebrowser:
    image: filebrowser/filebrowser
    container_name: filebrowser
    ports:
      - 8080:80
    volumes:
      - /mnt/crucial500/Docker/FileBrowser/config:/config
      - /mnt/crucial500/Docker/FileBrowser/data:/srv #same as Syncthing!
    restart: unless-stopped    

# networks:
#   nginx_nginx_default:
#     external: true
```

To use Cloudflare tunnels, you will need:

```yml
services:
  cloudflared:
    image: cloudflare/cloudflared:latest
    container_name: cloudflared
    command: tunnel --no-autoupdate run --token yourtokenhere
    networks:
      - tunnel
    restart: always

networks:
  tunnel:
```



{{< youtube "Z5uBcczJxUY" >}}



### Better PKG management in Debian

From time to time you will need to make some clean up to keep things perfect.

Are you getting some error when doing `apt update`?

Then, just...

### Maintainance in Linux

1. https://github.com/oguzhaninan/Stacer

> GPL 3.0 |  Linux System Optimizer and Monitoring - https://oguzhaninan.github.io/Stacer-Web 


---

## Other 

You can check from time to time https://haveibeenpwned.com/.

They also provide an [API](https://haveibeenpwned.com/API/Key), which you would have to pay for.

### Photo Video Management

1. https://github.com/KDE/digikam

```sh
flatpak install flathub org.kde.digikam
```

2. PhotoQT

### Cool Blogs Ive found recently

1. https://selfhosted.show/
2. https://selfh.st/
3. https://theselfhostingblog.com/
4. https://howitlooks.dev/
5. https://www.reddit.com/r/selfhosted/?rdt=43112
6. https://www.reddit.com/r/SelfHosting/
7. https://akashrajpurohit.com/blogs/?ref=nav
8. https://alternateoss.com/
9. https://star-history.com/blog/knowledge-management

### Interesting Software for Servers

1. https://github.com/moghtech/komodo

> 🦎 a tool to build and deploy software on many servers 🦎

<!-- https://www.youtube.com/watch?v=acDVwwLklas -->
{{< youtube "acDVwwLklas" >}}

2. https://github.com/safing/portmaster

> 🏔 Love Freedom - ❌ Block Mass Surveillance

You can also have a look to: ModSecurity, Naxsi, Open AppSec, SafeLine,...

---

## FAQ

{{% details title="How to check for duplicate images - dupeGuru" closed="true" %}}

```sh

```

{{% /details %}} 

### What do I look in a MiniPC?

1. Removable RAM
2. Removable nmve 2280 drive and 2.5 expandable bay
