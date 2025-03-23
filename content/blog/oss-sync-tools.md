---
title: "SelfHosted Cloud vs Syncs vs WebDav"
date: 2025-03-15
draft: false
tags: ["OSS"]
description: 'Alternatives to sync your files. From Nextcloud Web Dav to SFTP Go'
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

### GoMFT

* https://github.com/StarFleetCPTN/GoMFT

> MIT | Go Managed File Transfer

### Personal Drive

* https://github.com/gyaaniguy/personal-drive?ref=selfh.st

> Apache v2 | Self Hosted Google drive alternative


## Just Sync

### Syncthing

![alt text](/blog_img/selfh/Sync/syncthing-folder-setup.png)

## Conclusions

These tools can be used together with your [Photo Management Tools](https://jalcocert.github.io/JAlcocerT/photo-management-tools/).

Sea also: 

1. #https://github.com/maxime1907/docker-filegator
2. FIlerun

```yml
version: '2'

services:
  db:
    image: mariadb:10.1
    environment:
      MYSQL_ROOT_PASSWORD: your_mysql_root_password
      MYSQL_USER: your_filerun_username
      MYSQL_PASSWORD: your_filerun_password
      MYSQL_DATABASE: your_filerun_database
    volumes:
      - /home/Docker/filerun/db:/var/lib/mysql

  web:
    image: filerun/filerun:8.1
    environment:
      FR_DB_HOST: db
      FR_DB_PORT: 3306
      FR_DB_NAME: your_filerun_database
      FR_DB_USER: your_filerun_username
      FR_DB_PASS: your_filerun_password
      APACHE_RUN_USER: www-data
      APACHE_RUN_USER_ID: 33
      APACHE_RUN_GROUP: www-data
      APACHE_RUN_GROUP_ID: 33
    depends_on:
      - db
    links:
      - db:db
    ports:
      - "80:80"
    volumes:
      - /home/Docker/filerun/html:/var/www/html
      - /home/Docker/filerun/user-files:/user-files
```

3. Filezilla

```yml
#https://filezilla-project.org

---
version: "2.1"
services:
  filezilla:
    image: lscr.io/linuxserver/filezilla:latest
    container_name: filezilla
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/Docker/filezilla/config:/config
    ports:
      - 3000:3000
      - 3001:3001
    restart: unless-stopped
```

4. Picoshare

```yml
version: '2'
services:
  picoshare:
    environment:
      - PORT=3002
      - PS_SHARED_SECRET=yosuacerdo
    ports:
      - 3002:3002
    volumes:
      - picoshare:/data
    container_name: picoshare
    image: mtlynch/picoshare:latest
    networks:
      - cloudflare_tunnel
    #restart: always     
      

volumes:
  picoshare:

networks:
  cloudflare_tunnel:
    external: true  
```

5. Pingvin

```yml
#https://github.com/stonith404/pingvin-share/blob/main/docker-compose.yml


version: '3.8'
services:
  pingvin:
    image: stonith404/pingvin-share
    container_name: pingvin
    restart: unless-stopped
    ports:
      - 3055:3000
    volumes:
      - "/home/Docker/pingvin/data:/opt/app/backend/data"
      - "/home/Docker/pingvin/data/images:/opt/app/frontend/public/img"
    networks:
      - cloudflare_tunnel
    #restart: always     

networks:
  cloudflare_tunnel:
    external: true              
```

6. vsftpd


```yml
#https://hub.docker.com/r/fauria/vsftpd/
#X86

version: '3'
services:
  vsftpd:
    image: fauria/vsftpd
    container_name: vsftpd
    volumes:
      - /home/Docker/vsftpd:/home/vsftpd
    ports:
      - "20:20"
      - "21:21"
      - "21100-21110:21100-21110"
    environment:
      - FTP_USER=myuser
      - FTP_PASS=mypass
      - PASV_ADDRESS=127.0.0.1
      - PASV_MIN_PORT=21100
      - PASV_MAX_PORT=21110
    restart: always


# version: '2.1'
# services:
#   ftp:
#     image: fauria/vsftpd
#     ports:
#       - 21:21
#     environment:
#       - FTP_USER=one
#       - FTP_PASS=StrongPassword1
#       - PASV_ADDRESS=your_server_ip_address #192.168.3.200 #localhost #greatdomain.com
#     volumes:
#       - /home/Docker/delfer/one:/home/vsftpd/one
```

7. Anonupload

```yml
#https://github.com/supernova3339/anonupload

version: '3'

services:
  anonupload:
    image: ghcr.io/supernova3339/anonfiles:1
    container_name: anonupload
    ports:
      - "77:80"
    volumes:
      - /etc/anonupload/files:/var/www/html/files
    environment:
      - ADMIN_EMAIL=admin@admin.com
      - ADMIN_PASSWORD=password
      - APP_FILELIST=jpeg,jpg,gif,png,zip,xls,doc,mp3,mp4,mpeg,wav,avi,rar,7z,txt
      - APP_SIZE_VERIFICATION=true
      - APP_FILE_DESTINATION=files
      - APP_BASE_URL=https://xxx.xxx/
      - APP_MAX_SIZE=10000000000
      - APP_MIN_SIZE=0
      - APP_CONTACT_EMAIL=changemecerdo
      - APP_DOWNLOAD_TIME=30
```