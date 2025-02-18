---
title: "[Comparison] Performance of different Computers"
date: 2025-12-30
draft: true
tags: ["Dev"]
description: 'CPU, Memory, Disks, Internet speed...'
url: ''
---


## CPU Benchmarks

The first CPU at home was an Intel and then a AMD Athlon 64 3200+ (both 1 core!).

And look at them now...


```sh
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run #4 cores
7z b -mmt4
```

x300 7960 events/s, total 79.6k events
x300 7zip 6.2k/24.7k

and a max power from the wall seen of 53 with the Tapo P110

> For now, the x300 with the 5600G is the most powerful CPU I ever had (a little bit more than the x13 and )

## Memory Benchmarks


```sh
sudo apt install sysbench
sysbench memory run
```

x300 got 8099Mib/sec

the x13 8164 Mib/sec 

and the Pi 4 4GB ~175MiB/sec (x86)


## Internet Benchmark

```sh
ip addr show
hostname -I

#sudo apt-get install net-tools
#ifconfig
#ifconfig eth0 | grep -A 10 "<global>" #check mac, and transfered packages
ifconfig eth0 | grep "inet " | awk '{ print $2 }' #if ETH Connected - SEE THE LOCAL IP
#ifconfig tailscale0 | grep "inet " | awk '{ print $2 }' #for Tailscale

ping -c 4 192.168.0.1 #gateway
ping -c 4 192.168.0.117 #ping the orange pi which is connected to same device
ping 9.9.9.9 #ping quad9 dns server
```

Ideally, do this with ethernet connection.

```sh
sudo apt-get install speedtest-cli
speedtest-cli #speedtest-cli --simple

sudo snap install fast
fast
#npm install --global fast-cli && fast
```

## Disk Benchmarks

```sh
sudo lshw -C disk  # You'll need sudo and to filter for disks
sudo hdparm -I /dev/sda  # Example for /dev/sda (detailed info of the disk)
```


{{< details title="Mount Drives Properly 📌" closed="true" >}}


```sh
lsblk #list them again
lsblk -f /dev/sda1 /dev/sdb2 #see the format and the UUID of a couple of blocks
df -h /dev/sda1 #you will see if its mounted
#df -h | awk '$2 ~ /G/'
#df -h | awk '$2 ~ /T/'
df -h | grep '[GT]' #see both
```

```sh
sudo apt install ntfs-3g

sudo nano /etc/fstab #forever
UUID=some-uuid /mnt/data_ntfs_500 ntfs-3g defaults,uid=1000,gid=1000,umask=0022 0 1
UUID=some-uuid-of-your-drive /mnt/ext4_mount_point_folder ext4 defaults 0 1
```

For one time mount:

```sh
sudo mkdir -p /mnt/data_ntfs_500
sudo mount -t ntfs /dev/sda1 /mnt/data_ntfs_500/ #example with ntfs

sudo mkdir -p /mnt/data_ext_2tb
sudo mount -t ext4 /dev/sdb2 /mnt/data_ext_2tb/ #example with ext4
```

Mounting the Crucial 500gb (CT500MX5) - **Example 2**

```sh
sudo mkdir /mnt/crucial500
lsblk -f
sudo mount /dev/sdb1 /mnt/crucial500
```


{{< /details >}}




{{< details title=" 📌" closed="true" >}}


{{< /details >}}
