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
2. [Monitoring](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/monitoring/) Servers
3. [Benchmarking](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/benchmarks/) Hardware



{{< callout type="info" >}}
Great Reference for ideas: https://github.com/awesome-selfhosted/awesome-selfhosted
{{< /callout >}}

* https://github.com/hotheadhacker/awesome-selfhost-docker

**General SelfHosted Resources**

- [Open Source Alternative - Add Project](https://www.opensourcealternative.to/add-project)
- [Privacy Tools](https://www.privacytools.io/)
- [Selfh.st](https://selfh.st/)
- https://awweso.me/

---

## FAQ

For networking, consider: https://github.com/Lissy93/networking-toolbox

> MIT | 🛜 100+ offline-first networking tools and utilities

* https://networkingtoolbox.net/diagnostics/dns/query-performance

See also: https://github.com/Lissy93/awesome-privacy

> 🦄 A curated list of privacy & security-focused software and services


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

{{% details title="PRO SelfHosting and HomeLab CLI 🚀" closed="true" %}}

```sh
df -h
#du -sh . #space under current folder
```

```sh
htop
#btop
```


1. Whats taking that much space?

```sh
#sudo du -ahx / | sort -rh | head -n 50
sudo du -ahx . | sort -rh | head -n 50 #from current folder and below
```

2. I want to clean old container stuff

```sh
#df -h
#docker system df #see how much docker artifacts are using

docker stop $(docker ps -a -q) #stop all
#docker volume rm $(docker volume ls -q | grep -v '^portainer_data$') #rm all volumes but portainer

#docker system df #similar to df -h but for container resources
#docker image prune -a 
#docker builder prune -a --force

#docker system prune --all --volumes #just clean all...

docker builder prune
#docker system prune -a
docker volume prune
docker image prune -a
```

3. Stop all containers, but portainer:

```sh
#docker ps -a -q --filter 'name=!portainer'
docker ps -q | grep -v portainer | xargs docker stop
```

4. How much resources are those containers cosuming?

```sh
docker-compose stats
#sudo docker stats 7dfdfce97523
#sudo docker stats nextcloud
#docker stats typebot-builder typebot-viewer typebot-db

docker stats $(docker ps --filter "name=typebot" --format "{{.Names}}")
#docker stats -a
```

{{% /details %}}



### Inspiration for a HomeLab?

Created a repository with clean compose files for anyone to try these services: https://github.com/JAlcocerT/Home-Lab/


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/JAlcocerT/blob/main/Z_ebooks/web-ebook.pdf" title="Get an ebook to get started with Selfhosting" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Learn the concepts and tools to SelfHost confortable" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="HomeLab Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Containerized Selfhosted Apps for your Server" >}}
{{< /cards >}}

> See [this folder for stacks](https://github.com/JAlcocerT/Home-Lab/tree/main/z-homelab-setup/evolution) on what im Selfhosting at a certain month/year.


{{% details title="SelfHosting Resources 🚀" closed="true" %}}


{{% /details %}}