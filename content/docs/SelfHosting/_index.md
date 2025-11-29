---
title: Tools for Tinkers
type: docs
prev: docs/debian
next: docs/arch
sidebar:
  open: false
---

Whatever you plan to **Selfhost**, there will be a moment that you will be looking for:

1. [HTTPs and SSL](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/) Setup
2. [Monitoring](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/monitoring/)
3. [Benchmarking](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/benchmarks/) hardware


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/JAlcocerT/blob/main/Z_ebooks/web-ebook.pdf" title="Get an ebook to get started with Selfhosting" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Learn the concepts and tools to SelfHost confortable" >}}
{{< /cards >}}

{{< callout type="info" >}}
Great Reference for ideas: https://github.com/awesome-selfhosted/awesome-selfhosted
{{< /callout >}}

**General SelfHosted Resources**

- [Open Source Alternative - Add Project](https://www.opensourcealternative.to/add-project)
- [Privacy Tools](https://www.privacytools.io/)
- [Selfh.st](https://selfh.st/)
- https://awweso.me/

---

## FAQ


{{% details title="How to mount external drives consistently? 🚀" closed="true" %}}

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

Specially when [tinkering with **VPNs**](https://jalcocert.github.io/JAlcocerT/how-to-use-wg-easy-with-a-vps/), you will want to know:

{{% details title="Whats my Local IP? 🚀" closed="true" %}}

```sh
ifconfig

#ifconfig eth0 | grep -A 10 "<global>" #check mac, and transfered packages

ifconfig eth0 | grep "inet " | awk '{ print $2 }' #if ETH Connected - SEE THE LOCAL IP

#ifconfig tailscale0 | grep "inet " | awk '{ print $2 }' #for Tailscale
```

{{% /details %}}

### HomeLab Commands



### What do I like to SelfHost?

Created a repository with clean compose files for anyone to try these services: https://github.com/JAlcocerT/Home-Lab/

> See [this folder for stacks](https://github.com/JAlcocerT/Home-Lab/tree/main/z-homelab-setup/evolution) on what im Selfhosting at a certain month/year.