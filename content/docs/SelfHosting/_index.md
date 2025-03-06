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

## General OSS Resources
- [Open Source Alternative - Add Project](https://www.opensourcealternative.to/add-project)
- [Privacy Tools](https://www.privacytools.io/)
- [Selfh.st](https://selfh.st/)

## SelfHosted Email

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