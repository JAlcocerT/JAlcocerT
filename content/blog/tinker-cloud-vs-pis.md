---
title: "Cloud vs Pi's: What Should I get?"
date: 2024-08-10T23:20:21+01:00
draft: false
tags: ["Dev","Pi Container","Wireguard"]
description: Comparing SBCs performance with the Cloud - Raspberry Pi, Orange Pi, Mini PC (BMax-B4),...?
url: cloud-vs-single-board-computers
---

Time to choose - where is it worth [to do SelfHosting](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/)?

## Analysis paralysis - Choosing Small Factor Computer 

Sometime ago, I was doing some benchmarks about **[Raspberry Pi vs Orange Pi](https://jalcocert.github.io/RPi/posts/pi-vs-orange/) and also about [Mini PCs vs those SBC](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/)**.

Lately, I have been giving [a try to cloud providers](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#hetzner).

Particularly, to Hetzner.

Is it really worth to SelfHost on our own hardware?

Or can we just use **a Cloud Server for similar performance/price?**

This is what we will be looking at today:

* BMax B4
* Raspberry Pi 4's (2GB and 4GB)

And make [some conclusions](#conclusions)


<!-- 
pdf "/blog_pdf/OrangePi_5_RK3588S_User-Manual_v1.5.pdf"
OrangePi_5_RK3588S_User-Manual_v1.5.pdf

removed to be able to use Cloudflare WorkersandPages with this GH repo
moved to the RPI repo
 -->

### Asrock X300 and the BMAX B4

The **Asrock has 1.92L** (155 x 155 x 80 mm) size in volume, and the **BMax just 0.6L**.

What am I doing talking in liters?

* 1.92L are about 1922 cm³ - Similar to the [displacement of a regular car](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/)
* 0.6L are ~ 600 cm³

Yes, they **both are veeery compact**.

You can have a reference a very popular referece, a pen:

![BMax B4 vs Asrock X300 Size](/blog_img/hardware/bmax-b4.jpg)


The **RAM is not soldered** in the BMAX B4, and also you can **add an additional 2,5 drive** (screws not included).

{{< callout type="warning" >}}
The SSD drive it comes with **is NOT 2280** (I got surprised with that)
{{< /callout >}}

![Bmax B4](/blog_img/mini_pc/bmax.jpg)

### Single Board Computers

And also, I got a **new Raspberry Pi 4** (this time 4GB - ARM64)

Now that prices are *reasonable*:

![Two RPI's 4](/blog_img/hardware/RPi4_2_vs4gb.jpg)

There is a bunch of information on the internet: reddit, youtube and decided to create this post as both, **a systematic guide and the results of testing** that I could perform.

{{< callout type="info" >}}
How to run [these tests/benchmarks](#faq)
{{< /callout >}}

* What I the testing results include:
  * Raspberry Pi 4 2/4GB
  * Raspberry Pi 5 8GB
  * [Orange Pi 5 8GB](https://jalcocert.github.io/RPi/posts/pi-vs-orange/#benchmarking-the-docker-build-process)
  * [BMAX B4](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/)
  * [Hetzner Cloud](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#hetzner) - Amazing internet speed...

> **Big Thanks to [Alex](https://www.linkedin.com/in/dunayeu/) 🙌** - For sharing the results of the Raspberry **Pi 5 8GB**  

### Power Consumption and Temps

| Device | Idle Power | Max (Power & Temp Seen) | Power Adapter | Yearly 🔌 Cost (USD) |
| :-- | :-- | :-- | :-- | :-- |
| Raspberry Pi 4 | ~2/3w | 6W | 5V 3A | **~$5** |
| Orange Pi 5 | ~3/5~W | 8W, 80°C | 5V 4A | **~$8** |
| BMAX B4 | 9W | 18W & 64°C, fan | - | **~$14** |


Disabling Wi-Fi improves power efficiency. On the BMAX B4 by ~10% (~1W).

{{< callout type="info" >}}
* Calculation of energy costs:
  * Annual kWh = Idle Power in Watts × 24 hours/day × 365 days/year ÷ 1000 (to convert W to kW)
  * Cost = Annual kWh × Cost per kWh (USD)
{{< /callout >}}

> At the time of writing, I pay **~0.2$/kWh**

You can say that in terms of energy, having one SBC 24/7 is like a month of cloud or 2 months if you consider the BMax.

### GPIO

No discussion here - The **Raspberries are the absolute winners.**

Also in software support.

> I have to comment that **I prefer BullsEye** over Bookworm for the Pi's for [IoT/CV Projects](https://jalcocert.github.io/RPi/categories/iot-data-analytics/)

{{< details title="OrangePi 5 with Latest Kernel 📌" closed="true" >}}
* [Installing OS](https://jalcocert.github.io/RPi/posts/getting-started/) with latest kernel thanks to [Joshua-Riek](https://joshua-riek.github.io/ubuntu-rockchip-download/boards/orangepi-5b.html)
  * Remember that they are not the [official ones](https://github.com/orangepi-xunlong/orangepi-build)!
  * I have tried the 6.1.75 version, which has HDMI support working
  * Other 3rd party images: **[Armbian](https://www.armbian.com/orangepi-5/)**

{{< /details >}}

{{< callout type="info" >}}
* You can boot RPi5 from NVMe [like so](https://jalcocert.github.io/RPi/posts/pi-vs-orange/#using-nvme-with-the-orange-pi-5)
  * The SD card will still have the boot priority (if it's there)
{{< /callout >}}


### Computing vs Volume

| Device | CPU | GPU | RAM | Dimensions |
| :-- | :-- | :-- | :-- | :-- |
| Raspberry Pi 4 | Broadcom BCM2711 Quad-core (4x ARM Cortex-A72) | VideoCore VI @ 500mhz | 2/4 GB | 85.6mm × 56.5mm × 17mm (0.082L) |
| Orange Pi 5 | Rockchip RK3588S (4x Cortex-A76 @ 2.4GHz + 4x Cortex-A55 @ 1.8GHz) | Mali G510 MP4 | 8 GB | 100mm × 62mm × 18mm (0.112L) |
| BMAX B4 | Intel N95 (x4 cores Alder-Lake) | - | 16 GB | 12.5 x 11.2 x 4.4 cm  (0.608L) |

{{< callout type="info" >}}
* It's very important to use [proper adapter](https://raspberrytips.com/how-to-power-a-raspberry-pi/) or you will risk the SBC and its performance
* The Amperes [A] info on adapters is the MAXIMUM they can deliver at a given voltaje [V]
  * The devices will ask for less current if they dont need that much
{{< /callout >}}

## Testing Results

### Synthetic CPU Benchmarks

#### Sysbench

{{< details title="Results - SysBench 📌" closed="true" >}}

| Device | CPU Benchmark (4 threads) | CPU Benchmark (8 threads) |
| :-- | :-- | :-- |
| Raspberry Pi 4 2GB | ~1.7k events | - |
| Raspberry Pi 4 4GB | ~28k events | - |
| Orange Pi 5 | ~38k events | ~50k events |

```sh
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run
```

{{< /details >}}

#### 7zip

{{< details title="Results - 7ZIP 📌" closed="true" >}}

| Device | Tot (4 threads) |
| :-- | :-- | :-- |
| Raspberry Pi 4 2GB | 1622/6311 | 
| Raspberry Pi 4 4GB | 1442/5508 | 
| Raspberry Pi 5 8GB | 2.7k/10k | 
| Orange Pi 5 |  2.7k/11.8k | 

```sh
7z b -mmt4
```

{{< /details >}}




### Docker Build Time

{{< details title="Results - Building Docker Image for Trip-Planner 📌" closed="true" >}}

* I love using [Docker for SelfHosting](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/)

| Device | Docker Build | Max Temp | Peak Temp (Docker Build) | Avg Temp (Docker Build) |
| :-- | :-- | :-- | :-- | :-- |
| Raspberry Pi 4 2GB | ~3672s | - | ~46°C | ~39°C |
| Raspberry Pi 4 4GB | ~3480s | - | - | - |
| Orange Pi 5 | ~1777s | 80°C | ~65°C | ~50°C |
| BMAX B4 | ~45 seconds | 64°C fan | - | - |

{{< /details >}}

{{< callout type="info" >}}
For some reason, the ARM SBC's were using just one core during the docker builds (25% and 13%)
{{< /callout >}}

The Hetzner x4 SkyLake and 8GB RAM provides similar performance to the BMAX (when used to build the trip-planner container image).

* Hetzner Shared vCPU (2x Skylake @2ghz) 4GB	~77s
* Hetzner Shared vCPU (4x Skylake @2ghz) 8GB	~45s

### Astral-SH Build Time

A comparison between the SBCs and Hetzner.

{{< details title="Building Astral-SH 📌" closed="true" >}}

| Platform | opi    | rpi4b 2gb | RPi 5 8GB | Hetzner  |
|----------|--------|-----------|-----------|----------|
| Build Time | 5min 20s | 10min 7s  | 4min 30s  | 6min 15s |

> I have to mention that the [Alex](https://www.linkedin.com/in/dunayeu/) have way faster internet connection than me - which may influence this result

{{< /details >}}

## Conclusions

You have other options for **hosting services**, in the cloud:


{{< cards cols="1" >}}
  {{< card link="https://fly.io/" title="Dev Focus Public Cloud ↗" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://www.pikapods.com/" title="PikaPods ↗" >}}
  {{< card link="https://elest.io/" title="Elestio ↗" >}}
{{< /cards >}}

For **AI workloads** you will be interested in some **cloud GPU**:

{{< cards cols="3" >}}
  {{< card link="https://www.vultr.com/pricing/#cloud-gpu" title="Vultr Cloud GPUs ↗" >}}
  {{< card link="https://vast.ai/pricing" title="VastAI GPUs ↗" >}}
  {{< card link="https://lambdalabs.com/" title="Lambdalabs GPUs ↗" >}}    
{{< /cards >}}




---

## FAQ


{{% details title="Testing CPU Performance - SysBench, TripPlanner, build Astral-sh..." closed="true" %}}

```sh
#cat /proc/cpuinfo
#uname -a
#nproc
sudo apt install sysbench -y
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run
```

* 7zip

```sh
sudo apt-get install p7zip-full
7z b -mmt
7z b -mmt4
7z b
```

and with 7zr:

```sh
7zr b -mmt1
```

* [Trip Planner](https://github.com/JAlcocerT/Py_Trip_Planner/) docker build time:

```sh
git clone https://github.com/JAlcocerT/Py_Trip_Planner/
cd Py_Trip_Planner

sudo bash -c 'time docker pull python:3.8' #let's remove the time of downloading the Python base image from the equation, it was ~1 min!

#docker build -t pytripplanner .
sudo bash -c 'time docker build --no-cache -t pytripplanner .'
#sudo bash -c 'time podman build -t pytripplanner .'
```

* Astral-sh Python Dependency Manager:

```sh
apt install cargo
#cargo install --git https://github.com/astral-sh/rye rye
time cargo install --git https://github.com/astral-sh/rye rye
```

* Just simple stress test:

```sh
sudo apt-get install stress-ng

sudo stress --cpu  8 --timeout 120
```


{{% /details %}}


{{% details title="Testing Internet Connectivity" closed="true" %}}

```sh
ip addr show
hostname -I

#sudo apt-get install net-tools
#ifconfig

ping -c 4 192.168.3.1 #gateway
ping 9.9.9.9 #quad9
```

```sh
sudo apt-get install dnsutils -y #dns resolution
nslookup github.com 
dig google.com
```

```sh
sudo apt-get install speedtest-cli
speedtest-cli #speedtest-cli --simple
```


```sh
curl -sS https://ipinfo.io/json #the command to use
curl -sS http://ip-api.com/json/ #provides info about country, ISP, ...
curl -6 ifconfig.me #ipv6 info 
```

{{% /details %}}


{{< details title="Measuring Temperature with NetData 📌" closed="true" >}}

```yml
version: '3.8'
services:
  netdata:
    container_name: netdata
    image: netdata/netdata:v1.25.0 #https://hub.docker.com/r/netdata/netdata/tags
    ports:
      - '19999:19999'
    volumes:
      - netdataconfig:/etc/netdata
      - netdatalib:/var/lib/netdata
      - netdatacache:/var/cache/netdata
      - '/etc/passwd:/host/etc/passwd:ro'
      - '/etc/group:/host/etc/group:ro'
      - '/proc:/host/proc:ro'
      - '/sys:/host/sys:ro'
      - '/etc/os-release:/host/etc/os-release:ro'
    restart: unless-stopped
    cap_add:
      - SYS_PTRACE
    security_opt:
      - apparmor=unconfined

volumes:
  netdataconfig:
  netdatalib:
  netdatacache:
```
{{% /details %}}

{{< youtube id="h1kyncK--vQ" autoplay="false" >}}

### How to BackUp Properly

Whatever option you choose - make sure to have proper backups setup.

{{% details title="Why? I had to recover Portainer data the hard way..." closed="true" %}}

```sh
sudo fdisk -l #get the drive
sudo mkdir /mnt/portainer_backup
sudo mount /dev/nvme0n1p2 /mnt/portainer_backup #mount the drive

#it was installed in the other drive with:
#sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

sudo docker volume create portainer_data
sudo cp -r /mnt/portainer_backup/var/lib/docker/volumes/portainer_data/_data/* /var/lib/docker/volumes/portainer_data/_data/
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce #now you can re-use your portainer, as it was
```

{{% /details %}}


{{% details title="How to mount external drives consistently" closed="true" %}}

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

### How to use a RPi - Without a RPi

A raspberry Pi inside a container - https://github.com/ptrsr/pi-ci

> A Raspberry **Pi emulator in a Docker image** that lets developers easily prepare and flash RPi configurations.

### Cloud Interesting Resources

* <https://cloud.google.com/free>
  * PUB/SUB <https://cloud.google.com/free/docs/free-cloud-features#pub-sub>

<https://www.youtube.com/watch?v=jYIgcdIW1yk>

* AWS IoT - <https://www.youtube.com/watch?v=hgQ-Ewrm48c>


> I also had this saved (credits to BasvanKaam)