---
title: "SelfHosted Cloud vs Syncs vs WebDav"
date: 2025-03-15
draft: false
tags: ["OSS"]
description: 'Alternatives to sync your files. From nextcloud dav to SFTP Go'
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

With Nextcloud you can also have your files visible via WebDav.

> Add them with: `davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav` or `dav://your_nc_user@192.168.0.12:8080/remote.php/webdav`

But there are specific apps if you just need a simple web dav.

### SFTP-GO

* https://docs.sftpgo.com/latest/

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/WebDav/sftpgo_docker-compose.yml" title="See STFP-Go Config File 🐳 ↗"  >}}
{{< /cards >}}

```sh
#docker run --name some-sftpgo -p 8080:8080 -p 2022:2022 -d "drakkan/sftpgo:tag"
docker run -d \
  --name sftpgo \
  -p 8066:8080 \
  -p 2022:2022 \
  -v /home/jalcocert/Desktop:/srv \
  --restart unless-stopped \
  drakkan/sftpgo:latest
```

![alt text](/blog_img/selfh/media/sftpgo-webadmin.png)


Files will be reflected at `/home/jalcocert/Desktop`, particularly: `./sftpgo/data/yourcreateduser`,

![alt text](/blog_img/selfh/media/sftpgo.png)


And to connect with your Linux Files, you can add `sftp://jalcocert@192.168.0.12:2022` As the 2022 is the **SFTP Port** and your username. 


![alt text](/blog_img/selfh/media/sftpgo-check.png)


> aGPL 3.0 | Full-featured and highly configurable SFTP, HTTP/S, FTP/S and WebDAV server - S3, Google Cloud Storage, Azure Blob

* http://192.168.0.12:8011/web/admin/users
* http://192.168.0.12:8011/web/client/profile

To add it to ubuntu:

```sh
sudo apt install davfs2
```

> Then use `http://192.168.0.12:8011/web/admin/folders`, `davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav` or `dav://your_nc_user@192.168.0.12:8080/remote.php/webdav`

## Just Sync

### Syncthing

![alt text](/blog_img/selfh/Sync/syncthing-folder-setup.png)

## Conclusions

These tools can be used together with your [Photo Management Tools](https://jalcocert.github.io/JAlcocerT/photo-management-tools/).