---
title: "Performance of different Servers"
date: 2025-12-30
draft: true
tags: ["Dev"]
description: 'CPU, Memory, Disks.'
summary: ''
url: ''
---


## CPU Benchmarks

```sh
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run #4 cores
7z b -mmt4
```

x300 7960 events/s, total 79.6k events
x300 7zip 6.2k/24.7k

and a max power from the wall seen of 53 with the Tapo P110

## Memory Benchmarks


```sh
sudo apt install sysbench
sysbench memory run
```

x300 got 8099Mib/sec

the x13 8164 Mib/sec 

and the Pi 4 4GB ~175MiB/sec (x86)