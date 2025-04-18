---
title: "[IoT] Ansible and Raspberry Pi"
date: 2025-08-27
draft: false
tags: ["Dev"]
description: Learning about Ansible with SBCs. Together with the IoT Project DHT/InfluxDB
url: ansible-with-raspberry-pi
---

So you have a **Raspberry Pi** and want to get started with **IoT Project**.

But let me guess, you dont have time to read all the Docs, you just want to connect the wirings and get the **Data Flowing**.

If that resonates with you, keep reading - I will show you how to **leverage Ansible**.

[Ansible is an automation tool](https://jalcocert.github.io/Linux/docs/linux__cloud.md/ansible/) that Pros are using all around and it can Spin up with one liners your IoT Projects with the RPi.

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/Linux/docs/linux__cloud/ansible/" title="Linux Ansible 101 ↗" icon="book-open" >}}
{{< /cards >}}

> Yep, still, you will have to connect the cables 😝
{: .prompt-info }

## Ansible with Raspberry Pi

0. Get a Pi :)

![alt text](/blog_img/hardware/sbcs-x13.jpg)

1. Get Raspbian Installed

2. Install Ansible - Just like you would [in any other Debian](https://jalcocert.github.io/Linux/docs/linux__cloud.md/ansible/#installing-ansible).

```sh
#sudo apt update
#sudo apt upgrade
sudo apt install ansible

#ansible --version
```

3. Clone this Repo

```sh
git clone https://github.com/JAlcocerT/RPi ./RPi
#cd ./RPi/Z_ansible
```

So this is it from the Setup side. Now choose the IoT Project you want to have running and execute just one more command.

## IoT Projects with Ansible

### Mongo Project

> Im Talking about: [Raspberry Pi - DHT to MongoDB](https://jalcocert.github.io/RPi/posts/rpi-iot-dht1122-mongo/)

So you want to have the project that pulls data from DHT11 or DHT22, sends it from Python to Mongo and then Display it in Metabase?

No issues, just execute:

```sh
ansible-playbook ./RPi/Z_ansible/Ansible_py_dht_mongo_arm32.yml -i inventory.ini #execute Meta Project Playbook
#ansible-playbook ./RPi/Z_ansible/Ansible_py_dht_mongo_arm64.yml -i inventory.ini #execute Meta Project Playbook


#docker-compose -f ./RPi/Z_IoT/DHT-to-MongoDB/Ansible_py_dht_mongo_arm64.yml up -d # Basically it spins up Docker and This Stack
```

You can always get inside the created containers with:

```sh
docker exec -it mongodb sh
docker exec -it dht_sensor_mongo sh
```


> Working for me on [RaspiOS Bullseye](https://downloads.raspberrypi.com/raspios_armhf/images/raspios_armhf-2023-05-03/), **not in Bookworm** due to Adafruit not detecting the platform properly.


### Influx Project

```sh
ansible-playbook ./RPi/Z_ansible/Ansible_py_dht_influx_grafana.yml -i inventory.ini #execute Influx Project Playbook
```

> This is the one - [Raspberry Pi - DHT to InfluxDB](https://jalcocert.github.io/RPi/posts/rpi-iot-dht11-influxdb/). There is a GHCR Image too <https://github.com/JAlcocerT/RPi/blob/main/.github/workflows/python-dht-build.yml>


---

## FAQ

### Containers? What's that?

Container are a way to encapsule all Software Project dependencies.

For example to encapsule: MongoDB, Influx or the Python Script with all the libraries installed at a specified version.

To run containers, Ansible is actually using [Docker](https://jalcocert.github.io/RPi/posts/selfhosting-with-docker/).

You can check the installed versions with:

```sh
docker --version
docker-compose --version
```

### Why Ansible for SelfHosting?

Because it as a powerful Automation Tool that the Pros are using to do crazy stuff with the cloud.

Why shouldnt we do it with our Pi's?

### Why Docker for SelfHosting?

<https://jalcocert.github.io/RPi/posts/selfhosting-with-docker/>

You can also try [containers with **Podman**](https://fossengineer.com/docker-alternatives-for-data-analytics/)

### How to Find proper RPi Pins?

* https://pinout.xyz/