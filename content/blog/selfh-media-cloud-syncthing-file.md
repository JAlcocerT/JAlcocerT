---
title: "A DBLess Cloud - Syncthing and FileBrowser"
date: 2023-03-02T23:20:21+01:00
draft: false
tags: ["Self-Hosting","Home-Lab"]
cover:
   image: "/img/SelfHosting/FileBrowser/filebrowser_landing.png" # image path/url 
   Width: 360
   Height: 200
   sizes: 360
   alt: "Creating a Resilient Home Cloud." # alt text
   caption: "Home Cloud with Syncthing and FileBrowser." # display caption
description: 'A guide to SelfHost FileBrowser and Syncthing with docker.'
summary: 'A Free alternative to one drive/google drive / apple cloud - Your Cloud with Syncthing and Filebrowser.'    
url: 'selfhosting-filebrowser-docker'
isPinned: true
---

In an era where cloud storage is ubiquitous, not everyone is comfortable entrusting their personal files to third-party services. 

Here's why and how setting up a personal cloud server with Syncthing and FileBrowser might be the right solution for you:

- **Data Privacy and Control**: If you prefer a solution that keeps **your data close to home** and under your control, consider:
  - **Syncthing**: Securely [synchronize your files across all your devices](#syncthing) using a peer-to-peer network. This ensures that your data remains private and is not stored on servers owned by third parties.
  - **FileBrowser**: [Access your synchronized files](#filebrowser) through a convenient, intuitive web-based interface from any browser. This eliminates the need for software installations and provides easy access to your files.

- **Long-term Reliability**: Choose a solution that **won't shut down tomorrow** due to corporate policy changes. Both Syncthing and FileBrowser are [open-source projects](#an-open-source-cloud-at-home), reducing the risk of sudden discontinuation:
  - **No Database Required**: These tools [do not require a database](#why-a-dbless-cloud), simplifying setup and maintenance while enhancing performance and stability.

By leveraging Syncthing and FileBrowser, you can create a robust, dependable cloud storage solution that prioritizes your privacy and gives you full control over your data.

> Trust me [Syncthing and FileBrowser](#an-open-source-cloud-at-home) is ALL YOU NEED.

## An Open Source Cloud at Home

A personal cloud server offers:
* 🔒 **Privacy and Control**: Manage your data privately without relying on external service providers.
* 🏠 **Home-Based Solution**: Operate your cloud server from the comfort of your own home.
* 🔐 **Security**: Keep your personal files secure and protected within your private network.
* 🛠️ **Flexibility**: Tailor the setup to meet your specific storage needs.
  * - Customizable storage configurations
  * - Ability to install additional software for specific use cases
* 📈 **Scalability**: Easily expand your storage capacity as your data grows.
  * - Add new hard drives or upgrade existing ones
  * - Scale up resources as needed
* 💰 **Cost-Effective**: Avoid the ongoing costs associated with third-party cloud storage services.

> We are going to use **two Open Source Projects** in this guide.

### Syncthing

Syncthing is an **open-source file synchronization program** that allows you to keep your files in sync across multiple devices like computers, laptops, and even mobile phones. 

- These are the features that made me choose Syncthing:
  - ⚙️ **Decentralized Control**:
    - There's no single point of failure since there's no central server. Each device in the network acts as a peer, meaning they all contribute to keeping the data synchronized.

  - {{< dropdown title="Syncthing can also...✌️" closed="true" >}}

  - 🔐 **Encryption and Authentication**:
    - All communication between devices is secured with TLS encryption. Additionally, devices are identified using strong cryptographic certificates, ensuring only authorized devices can access your files.

  - 🛠️ **Flexible Configuration**:
    - You can choose which folders to sync, set bandwidth limitations, and define which devices have access to specific data.

  {{< /dropdown >}}    

  - 🖥️ **Cross-Platform Compatibility**:
    - Syncthing works on various operating systems including Windows, macOS, Linux, Android, Solaris, Darwin, and BSD.

* And of course, you can have a look to **Syncthing code**:
  * {{< newtab url="https://syncthing.net/" text="The Syncthing Project Official Site" >}}
  * {{< newtab url="https://github.com/syncthing/syncthing" text="The CrewAI Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/syncthing/syncthing?tab=MPL-2.0-1-ov-file#readme" text="MPL v2" >}} ❤️

> Yes,Syncthing will handdle the syncing part.

### FileBrowser

**FileBrowser** is a free and open-source web application designed for managing files and folders on a web server. 

- The best of all?
  - 🌐 **Web-Based Convenience**:
    - Access Filebrowser through a web browser on any device, eliminating the need for software installation on individual computers.

  - {{< dropdown title="With Filebrowser we also get...🙀" closed="true" >}}
  - 👥 **Multiple User Management**:
    - Create accounts for different users with designated directories for their files.

  - 🔄 **Standalone or Integration**:
    - Use Filebrowser as a standalone application or integrate it into other projects using its API.

  - 🔒 **Security Focus**:
    - Filebrowser prioritizes security through features like:
      - Configurable authentication methods for user login.
      - Pre/post event command runners for specific actions.
      - Access control restrictions to manage user permissions for different directories.
  {{< /dropdown >}}    

  - 📂 **Essential File Management**:
    - Perform basic file operations like:
      - Copy, move, rename, edit, create, and delete files.
      - Preview images and documents within the interface.
      - Zip and unzip compressed folders.
      - Download and upload single or multiple files with drag-and-drop support and progress tracking.
- And FileBrowser is **completely FREE**
  * {{< newtab url="https://filebrowser.org/" text="The FileBrowser Project Official Site" >}}
  * {{< newtab url="https://github.com/filebrowser/filebrowser" text="The FileBrowser Source Code at Github" >}}
      * License: {{< newtab url="https://github.com/filebrowser/filebrowser?tab=Apache-2.0-1-ov-file#readme" text="Apache v2" >}} ❤️

> And FileBrowser will allow us to **have an UI**, with different users and permisions that can upload/download files.

### Why a DBLess Cloud?

There are F/OSS Cloud alternatives which are great, like **Nextcloud**.

The cool thing about this solution with Syncthing and FileBrowser, is that we dont have a Database at all.

So the solution is much more efficient and **resilient to failure**.

Just make sure to backup the real data you care about and **forget about those SQL DataBases**.


## How to Create a Home Cloud

<!-- ## Creating your F/OSS Cloud -->

{{< dropdown title="Pre-Requisites!! Just Get Docker 🐋" closed="true" >}}

Important step and quite recommended for any SelfHosting Project - [Get Docker Installed](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/)

It will be one command, this one, if you are in Linux:

```sh
apt-get update && sudo apt-get upgrade && curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh && docker version
```

{{< /dropdown >}}

### SelfHosting your Cloud with Docker


We just need this Docker-compose to deploy both services:


```yml
---
version: "2.1"
services:
  syncthing:
    image: syncthing/syncthing #ghcr.io/linuxserver/syncthing
    container_name: syncthing
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Rome
    volumes:
      - /home/Docker/Syncthing/config:/config
      - ~/user/Sync-Folder-Data:/data1 #
      - /media/user/TOSHIBA\ EXT/A-SYNC-CLOUD:/data2 #You can add more than one folder, even if different disk
      #- "C:\\DOCKER\\Syncthing\\config:/config" #Example for Windows
      #- "D:\\Z_Sync:/dataD" ##Example for Windows
    ports:
      - 8384:8384
      - 22000:22000/tcp
      - 22000:22000/udp
      - 21027:21027/udp
    restart: unless-stopped

  filebrowser:
    image: filebrowser/filebrowser
    container_name: filebrowser
    ports:
      - 8080:80
    volumes:
      - /home/Docker/FileBrowser/config:/config
      #- /home/Docker/FileBrowser/data:/srv
      - ~/user/Sync-Folder-Data:/srv #same as Syncthing!
    restart: unless-stopped    
```

Now access your Syncthing at `localhost:8384` and FileBrowser UI at `localhost:8080`

The default user/pass for FileBrowser are: `admin/admin` - Make sure to change them!

![Message after successfully Connecting to FileBrowser](/img/SelfHosting/FileBrowser/filebrowser.png)

> Feel free to adapt the ports and the Data Paths are you need.

When **connecting to Syncthing**, Add the Folder just as you named the Path, in this case `data1`

![Message after successfully Connecting to FileBrowser](/img/SelfHosting/FileBrowser/syncthing-ui.png)


<!-- ### Syncthing with Desktop UI

https://github.com/zocker-160/SyncThingy -->



## Closing Thoughts

Now you have syncing capabilities at home between your devices, without the need of a database.

{{< dropdown title="You can use external storage... ⏬" closed="true" >}}

```sh
lsblk #check the disk is recognized
sudo mount /dev/sda1 /media/sda1_BackUp # mount it (in this case sda1) #==>> Reference this mount point in the docker compose!

#optional - sudo apt install exfatprogs
```

{{< /dropdown >}}


You might be intrested to have some sort of **Photo Gallery associated with your files**.

Some time ago I was showing how to use [Photoview with Docker](/selfhosting-Photoview-docker/) as a Google Photos replacement.

But in this case a solution like **[PiGallery](/selfhosting-Photoview-docker/#free-alternatives-to-google-photos)** will be best suitable as it does not require for a DB as well.

{{< dropdown title="A Photo Gallery that Syncs your Phone - PiGallery with Syncthing 🖼️ 🗺️ 👇" closed="true" >}}

```yml
version: "3.7"
services:
  syncthing:
    image: syncthing/syncthing
    container_name: syncthing
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Rome
    volumes:
      - /home/Docker/Syncthing/config:/config
      - ~/user/Sync-Folder-Data:/data1
      - /media/user/TOSHIBA\ EXT/A-SYNC-CLOUD:/data2
    ports:
      - 8384:8384
      - 22000:22000/tcp
      - 22000:22000/udp
      - 21027:21027/udp
    restart: unless-stopped

  filebrowser:
    image: filebrowser/filebrowser
    container_name: filebrowser
    ports:
      - 8081:80
    volumes:
      - /home/Docker/FileBrowser/config:/config
      - ~/user/Sync-Folder-Data:/srv
    restart: unless-stopped   

  # db:
  #   image: linuxserver/mariadb
  #   container_name: mariadb
  #   environment:
  #     - MYSQL_DATABASE=photoview
  #     - MYSQL_USER=photoview
  #     - MYSQL_PASSWORD=photosecret
  #     - MYSQL_RANDOM_ROOT_PASSWORD=1
  #   volumes:
  #     - db_data:/var/lib/mysql
  #   restart: always

  # photoview:
  #   image: viktorstrate/photoview:2
  #   container_name: photoview
  #   ports:
  #     - 8082:80
  #   depends_on:
  #     - db
  #   environment:
  #     - PHOTOVIEW_DATABASE_DRIVER=mysql
  #     - PHOTOVIEW_MYSQL_URL=photoview:photosecret@tcp(db)/photoview
  #     - PHOTOVIEW_LISTEN_IP=photoview
  #     - PHOTOVIEW_LISTEN_PORT=80
  #     - PHOTOVIEW_MEDIA_CACHE=/app/cache
  #   volumes:
  #     - api_cache:/app/cache
  #     - /home/your/path/with/files/photos:/photos:ro
  #   restart: always

  pigallery2:
    image: bpatrik/pigallery2:latest
    container_name: pigallery2
    environment:
      - NODE_ENV=production
    volumes:
      - /home/Docker/pigallery/config:/app/data/config
      - /home/Docker/pigallery/tmp:/app/data/tmp
      - db_data:/app/data/db
      - /home/Docker/:/app/data/images:ro
    ports:
      - 8088:80
    restart: unless-stopped

# volumes:
#   db_data:
#   api_cache:

```

Login to `localhost:8088` and change the default user and pass `admin/admin`

{{< /dropdown >}}

### Adding WebDav Support

You can combine the stack [together with these WebDav's](#free--open-source-webdav)


---

## FAQ

* https://www.stsoftware.com.au/site/ST/blog/article/how-to-use-the-web-folders-from-windows-explorer/

### Free & Open Source WebDav

* Filetash:  🦄 A modern web client for SFTP, S3, FTP, WebDAV, Git, Minio, LDAP, CalDAV, CardDAV, Mysql, Backblaze, ... 
  * https://github.com/mickael-kerjean/filestash
  * https://www.filestash.app/

> Integrate your existing Storage, Authentication, and Authorisation Systems altogether

* https://github.com/drakkan/sftpgo - aGPLv3.0
  * https://hub.docker.com/r/drakkan/sftpgo
  * https://sftpgo.com/

```yml
services: 
#https://github.com/jmlcas/sftpgo/blob/main/docker-compose.yaml
#https://www.youtube.com/watch?v=ME5t2UREY_Q - Thanks to Jose Maria Labarta
    sftpgo:
        image: drakkan/sftpgo:v2.6
        container_name: some-sftpgo
        ports:
            - '8080:8080'
            - '2022:2022'
            - '2121:2121'
            - '10080:10080'
        volumes:
            - sftpgodata:/srv/sftpgo
            - sftpgohome:/var/lib/sftpgo              
        environment:
            - SFTPGO_HTTPD_BINDINGS_0_PORT=8080
            - SFTPGO_HTTPD_BINDINGS_0_ADDRESS=0.0.0.0
            - SFTPGO_DATA_PROVIDER_CREATE_DEFAULT_ADMIN=true
            - SFTPGO_WEBDAVD_BINDINGS_0_PORT=10080
            - SFTPGO_FTPD_BINDINGS_0_PORT=2121
            - SFTPGO_FTPD_BINDINGS_0_FORCE_PASSIVE_IP='127.0.0.1:8080'
        restart: unless-stopped   
volumes:
    sftpgodata:
    sftpgohome:
```

> Full-featured and highly configurable SFTP, HTTP/S, FTP/S and **WebDAV server** - S3, Google Cloud Storage, Azure Blob



### Other Free Project for File Management

* rsync
* Duplicati
* Nextcloud
* https://freefilesync.org/

You can also use Syncthing and FileBrowser together with **[PhotoView](/selfhosting-Photoview-docker)**
and create your own [Google Photos Alternative](/selfhosting-Photoview-docker/#free-alternatives-to-google-photos)

### Other Free Projects for Photo Gallery Management

- Immich
- Lychee
- Nextcloud
- https://github.com/cbenning/fussel#fussel
- PiGallery
- HomeGallery
- Piwigo
- Zenphoto
- Ownphotos
- Photoview
- LibrePhotos
- Photonix
- Photoprism
- Syncthing + WebDav + Any of the previous tools

<!-- https://www.extrema.is/blog/2022/02/08/photo-gallery-part-5-fussel -->
<!-- https://www.vanwerkhoven.org/blog/2021/self-hosted-photo-albums-with-pigallery2/ -->

### How to Find a File recursively

```sh
find . -type f -name "*_20200519_*"
```
### How to Remove background from Photos

* https://github.com/danielgatis/rembg

### How to Take a SnapShot From a Video

* With **KDEnlive** - https://www.youtube.com/watch?v=uSaPatpuINI

```sh
flatpak install flathub org.kde.kdenlive
```

### How to find duplicate files

* https://github.com/arsenetar/dupeguru

### How to Share Files with PicoShare

```yml
version: '2'
services:
  picoshare:
    environment:
      - PORT=3002
      - PS_SHARED_SECRET=somepasswordfortheinterface #change_this
    ports:
      - 3002:3002 #UI Port
    volumes:
      - picoshare:/data
    container_name: picoshare
    image: mtlynch/picoshare:latest #https://github.com/mtlynch/picoshare
    # networks:
    #   - cloudflare_tunnel
    #restart: always     
      

volumes:
  picoshare:

# networks:
#   cloudflare_tunnel:
#     external: true  
```

> Alternatively, you can use [AnonUpload](https://github.com/Supernova3339/anonupload/blob/main/docker-compose.yml)

<!-- ### How to backup data?

3-2-1

### How does this solution replaces Google Photos?

You can use it together with F/OSS photo services like:

* https://fossengineer.com/selfhosting-Photoview-docker/
* Piwigo
* ... https://awweso.me/photo-and-video-galleries/ 


immage
https://www.youtube.com/watch?v=h_inF-ypMls

https://www.opensourcealternative.to/project/Photprism

Don't Let Apple & Google Harvest Your Photos, Use Immich to Self-Host Your Own Cloud!
https://www.youtube.com/watch?v=URJiQb8PwWo&t=1179s

Self Hosted Photo Backups - Photoprism & Photosync - Let's ditch iCloud...
https://www.youtube.com/watch?v=sIpt4u03mXc


https://opensource.com/alternatives/google-photos
-->

<!-- ### Other F/OSS Backup solutions




Kopia: An Automatic Backup Solution for Your Self-Hosted App Data or Documents
https://www.youtube.com/watch?v=a6GfQy9wZfA

-->




<!-- ### How to Reset user/pass in FileBrowser?
 -->

<!-- ### How to Detect Duplicates files in the system

https://www.linuxfordevices.com/tutorials/linux/install-use-czkawka -->

### Understanding WebDAV

WebDAV is a protocol that extends the capabilities of HTTP, transforming the web from a read-only medium into a read-write medium. It enables users to create, modify, and move documents on a web server, which is essential for collaborative work environments. Here are the key features and benefits of WebDAV:

- **Editable Web Medium**: Unlike basic HTTP, which is designed for reading web pages, WebDAV allows for creating and modifying content directly on the web server.
- **Supports Locking and Conflict Management**: WebDAV includes features like locking, which prevents conflicts when multiple users are editing the same document, making it ideal for collaborative applications.

#### Notable Open Source WebDAV Servers

Several open-source servers implement the WebDAV protocol, offering a variety of features and integration capabilities. Here are some of the top choices:

1. **Apache HTTP Server with mod_dav**: Apache's mod_dav transforms the Apache HTTP server into a WebDAV server, allowing document editing and versioning capabilities over the web.

2. **Sabre/dav**: A PHP-based WebDAV server that is easy to integrate into existing web applications. It supports a broad range of WebDAV clients.

3. **Nextcloud**: More than just a WebDAV server, Nextcloud offers a comprehensive suite of office and collaboration tools with strong emphasis on data security and privacy.
<!-- 
https://jalcocert.github.io/RPi/posts/selfhosting-nextcloud/ -->

4. **Caddy Server**: A modern, Go-based web server that features automatic HTTPS. It can be extended with plugins, including one that adds WebDAV functionality. Caddy simplifies web server management while providing robust support for WebDAV.

These open-source WebDAV servers provide powerful options for organizations and individuals looking to facilitate collaborative work online with reliable versioning and document management systems.

<!-- 
OWL

https://github.com/seemoo-lab/owl
The Open Wireless Link (OWL) project, which investigates the Apple Wireless Direct Link (AWDL) protocol, is indeed an open-source initiative. However, it’s essential to clarify that OWL focuses on assessing security, privacy, and cross-platform compatibility for wireless applications rather than specifically sharing files.

Here are some key points about OWL:

AWDL Protocol:
AWDL is a protocol used by Apple devices for ad hoc communication over Wi-Fi.
It enables peer-to-peer connections without relying on external networks.
AWDL is crucial for features like AirDrop, Continuity, and location tracking.
Recent OWL Contributions:
PrivateDrop: Researchers discovered privacy leaks in Apple’s AirDrop mutual authentication mechanism, allowing strangers to learn phone numbers and email addresses of AirDrop users.
Who Can Find My Devices?: OWL revealed undisclosed components of Apple’s crowd-sourced Bluetooth location tracking system.
OpenWifiPass: An open-source implementation of Apple’s Wi-Fi Password Sharing.
Open Source Implementation:
OWL provides an open implementation of the AWDL protocol for Linux and macOS. The code is available on GitHub.
While OWL doesn’t directly focus on file sharing, its research and contributions can indirectly impact wireless communication and security. If you’re interested in exploring more about OWL, feel free to visit t -->