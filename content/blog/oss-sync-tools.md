---
title: "SelfHosted Cloud vs Syncs vs WebDav"
date: 2025-03-16
draft: false
tags: ["OSS"]
description: 'Alternatives to sync your files.'
url: 'sync-file-tools'
---


## SelfHosted Cloud

### NextCloud

1. [Nextcloud Docker Compose 🐳](https://github.com/JAlcocerT/Docker/blob/main/Backups/NextCloud/NextCloud_RPi_Stack.yaml)

```sh
sudo flatpak install flathub com.nextcloud.desktopclient.nextcloud -y
#See how quick you are transfering data
#sudo apt install nload
#nload
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/" title="Crucial SSD for a Pi" image="/blog_img/hardware/crucial-1tb-ssd.jpg" subtitle="Ready to Plug to MiniPC or SBc" >}}
{{< /cards >}}

## WebDavs

## Just Sync

### Syncthing

![alt text](/blog_img/selfh/Sync/syncthing-folder-setup.png)

## Conclusions

These tools can be used together with your Photo Management Tools.