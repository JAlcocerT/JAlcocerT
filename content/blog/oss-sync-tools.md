---
title: "SelfHosted Cloud vs Syncs vs WebDav"
date: 2025-03-15
draft: false
tags: ["OSS","Homelab","SFTPGo"]
description: 'Alternatives to sync your files. From Nextcloud Web Dav to SFTP-Go'
url: 'sync-file-tools'
---

I was confortable so far thinking that it was all about Nextcloud and Syncthing.

But lets have a closer look, as ftp and webdavs can also make the trick in some cases.

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
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Backups/NextCloud/nc_mariadb.yml" title="NextCloud Config File 🐳 ↗"  >}}
{{< /cards >}}

* Recommended Apps inside Nextcloud: cospend (moneybuster Android)
* You can use also NC as a file drop: https://docs.nextcloud.com/server/latest/user_manual/en/files/file_drop.html#setting-up-your-own-file-drop

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
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/sftp-go" title="STFP-Go | HomeLab Config 🐳 ↗"  >}}
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

![SFTPGo UI verification](/blog_img/selfh/media/sftpgo-webadmin.png)


Files will be reflected at `/home/jalcocert/Desktop`, particularly: `./sftpgo/data/yourcreateduser`,

![SFTP-GO verification check](/blog_img/selfh/media/sftpgo.png)

And to connect with your Linux Files, you can add `sftp://jalcocert@192.168.0.12:2022` As the 2022 is the **SFTP Port** and your username. 

![SFTP GO server checked via UI from a laptop](/blog_img/selfh/media/sftpgo-check.png)


> **aGPL 3.0** | Full-featured and highly configurable SFTP, HTTP/S, FTP/S and WebDAV server - S3, Google Cloud Storage, Azure Blob

* `http://192.168.0.12:8011/web/admin/users`
* `http://192.168.0.12:8011/web/client/profile`

To add SFTPGo to ubuntu as a space to browse files:

```sh
sudo apt install davfs2
```

> Then use `http://192.168.0.12:8011/web/admin/folders`, `davs://your_nc_user@nextcloud.yourdomain.duckdns.org/remote.php/webdav` or `dav://your_nc_user@192.168.0.12:8080/remote.php/webdav`


{{< callout type="info" >}}
If you are on windows, install **WINSCP** or Filezilla
{{< /callout >}}

```sh
choco install winscp
```

SFTP is a secure way to transfer files over a network. It uses SSH (Secure Shell) to encrypt the data, protecting it from unauthorized access.

```sh
apt-get install iperf3
iperf3 -s #server
iperf3 -c <server IP address> #on the client
```

![alt text](/blog_img/selfh/Sync/iperf3-eth.png)

![alt text](/blog_img/selfh/Sync/iperf3-wifi.png)

```sh
scp /home/user/Downloads/DJI_20250117084726_0009_D your_username@192.168.0.12:/home/your_username/uploads/
```

![alt text](/blog_img/selfh/Sync/scp-file-send.png)

From Windows you can:

```sh
sftp your_username@192.168.0.12
#your_username@192.168.0.12's password:
```

```sh
sftp> cd /home/your_username/uploads
sftp> put "C:\Users\j--e-\Proton Drive\jalcocer\My files\folder\DJI_20250112113040_0012_D.MP4"
sftp> exit
```

![alt text](/blog_img/selfh/Sync/sftp-file-send.png)

You can see the disk load:

```sh
sudo apt install iotop

sudo iotop
```

Yes, when you connect to an SFTP server, you typically need to provide the username and password (or SSH key) of a valid user account on the remote system where the SFTP server is running.

It's not necessarily your Windows user/password unless those credentials happen to be the same on the remote system.

That's a very important distinction! The speed you get with SFTP over your home Wi-Fi will be limited by your **local Wi-Fi speeds**, not your internet upload speed from your ISP. Here's why:

**Local Network vs. Internet Connection**

* **Local Network (LAN):**
    * Your home Wi-Fi network creates a local area network (LAN).
    * When you transfer files between your laptop and server within your home, the data stays within this LAN.
    * The speed of this transfer is determined by your Wi-Fi router's capabilities and the factors mentioned earlier (Wi-Fi standard, interference, etc.).
* **Internet Connection (WAN):**
    * Your internet upload speed from your ISP is relevant when you're transferring files *over the internet* to a server that's located outside your home network.
    * For example, if you were uploading files to a cloud server or a remote server hosted by a different company.

**Why Wi-Fi Speed Matters for Home SFTP:**

* Since your laptop and server are on the same local network, the data doesn't travel through your ISP's network.
* The transfer happens directly between your laptop and server, with the router acting as the intermediary.
* Therefore, the bottleneck is your Wi-Fi speed, not your internet upload speed.

**In summary:**

* **Local transfers (laptop to server on the same Wi-Fi):** Limited by Wi-Fi speed.
* **Internet transfers (laptop to remote server):** Limited by your internet upload speed.

Therefore, if you are transferring files between two computers on your local home network, your internet upload speed is irrelevant.


### GoMFT

* https://github.com/StarFleetCPTN/GoMFT

> MIT | Go Managed File Transfer

### Personal Drive

* https://github.com/gyaaniguy/personal-drive?ref=selfh.st

> Apache v2 | Self Hosted Google drive alternative


## Just Sync

### Syncthing

![alt text](/blog_img/selfh/Sync/syncthing-folder-setup.png)

---

## Conclusions

These tools can be used together with your [Photo Management Tools](https://jalcocert.github.io/JAlcocerT/photo-management-tools/).

If you need to convert **heic to png**:

```sh
sudo apt update
sudo apt install libheif-examples
#heif-convert input.heic output.png
for file in *.heic; do heif-convert "$file" "${file%.heic}.png"; done
```

### Sync Speed

This will depend on the router you are using:

<!-- 
[text](/blog_img/outro/telecom/2cm.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/" title="Travel Router" image="/blog_img/hardware/travel-router.jpg" subtitle="GL-MT3000 Review" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/" title="More Telco Stuff" image="/blog_img/outro/telecom/2cm.png" subtitle="Concepts and Tools for the telecom industry" >}}
{{< /cards >}}

I used **iperf and iotop** to check that I get

* ~730Mbits/sec on Wifi and ~916Mbits/sec on eth

### More Tools


{{< details title="See 7 other tools to setup with Docker 📌" closed="true" >}}


1. https://github.com/maxime1907/docker-filegator

2. Filerun

3. Filezilla

4. Picoshare

5. Pingvin

6. vsftpd

7. Anonupload

{{< /details >}}