---
title: "Weddings are expensive. Bee smart with the software."
date: 2025-01-18
draft: false
tags: ["OSS"]
summary: 'Interesting software for Weddings'
url: 'software-for-weddings'
---

* Weddings...
* bodas.net


## Website for Weddings


## Selfhostable Software for Weddings

1. https://noted.lol/event-photos-and-self-hosting/
2. https://github.com/Cirx08/WeddingShare

> GPL3.0 | A place for guests to view and drop pictures of the big day

https://docs.wedding-share.org/
https://docs.wedding-share.org/docs/Setup/docker
https://hub.docker.com/r/cirx08/wedding_share
https://www.redditmedia.com/r/selfhosted/comments/1gugnku/weddingshare_a_basic_selfhosted_drop_box_and/

```yml
services:
  wedding-share:
    container_name: WeddingShare
    image: cirx08/wedding_share:latest
    ports:
      - '${HTTP_PORT:-8080}:5000/tcp'
    environment:
      TITLE: 'WeddingShare'
      LOGO: 'Url'
      GALLERY_COLUMNS: 4
      ALLOWED_FILE_TYPES: '.jpg,.jpeg,.png'
      MAX_FILE_SIZE_MB: 10
      SECRET_KEY: 'password'
    volumes:
      - data-volume-config:/app/config
      - data-volume-thumbnails:/app/wwwroot/thumbnails
      - data-volume-uploads:/app/wwwroot/uploads
    network_mode: bridge
    hostname: wedding-share
    restart: always

volumes:
  data-volume-config:
    name: WeddingShare-Config
  data-volume-thumbnails:
    name: WeddingShare-Thumbnails
  data-volume-uploads:
    name: WeddingShare-Uploads
```