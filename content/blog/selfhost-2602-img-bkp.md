---
title: "[SelfHosting] Image & Backup Tools"
date: 2026-02-08
draft: false
tags: ["Link Shortener","Immich vs PiGallery vs NextCloud","Jellyfin x HW Acceleration"]
description: 'Testing some NoCode Tools. A recap of media.'
url: 'image-backup-tools'
---

<!-- 

https://www.quadratichq.com/

> Source Open | Infinite spreadsheet with Python, SQL, and AI.

https://github.com/quadratichq/quadratic/tree/main
https://github.com/quadratichq/quadratic/issues/416
docker build -t quadratic --platform=linux/amd64 .

-->

Ente....


**Tl;DR**

**Intro**


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages/" title="Configuring CF WnP with Github and Astro ↗" >}}
{{< /cards >}}

You might have heard about [OpenLTablets](https://jalcocert.github.io/JAlcocerT/understanding-openl-tablets/) or from my worst nightmare ever, [fitnesse](https://github.com/unclebob/fitnesse)

>  The Acceptance Test Wiki 

But today, I want to make a short recap on tools that I find so much valuable.

I grasp the surface on the [No Code Ai Tools Post](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/)

And they are **no code**.

## SelfHostable Image Tools

Mind your attention, stop auto engaging.

Keep the important things at life first.

{{< youtube id="ydG5EtQat_I" autoplay="false" >}}

How does this solution replaces Google Photos?

You can use it together with F/OSS photo services like:

* https://fossengineer.com/selfhosting-Photoview-docker/
* Piwigo
* ... https://awweso.me/photo-and-video-galleries/ 

https://www.youtube.com/watch?v=h_inF-ypMls

https://www.opensourcealternative.to/project/Photprism

Don't Let Apple & Google Harvest Your Photos, Use Immich to Self-Host Your Own Cloud!

https://www.youtube.com/watch?v=URJiQb8PwWo&t=1179s

Self Hosted Photo Backups - Photoprism & Photosync - Let's ditch iCloud...

https://www.youtube.com/watch?v=sIpt4u03mXc

https://opensource.com/alternatives/google-photos





### PiGallery


https://x.com/tom_doerr/status/1979894065400263086?

* https://libreselfhosted.com/project/fluxbb/
* https://awesome-docker-compose.com/apps/photo-server/pigallery-2


```sh
sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d pigallery2
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pigallery" title="PiGallery | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### NC vs Immich


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nextcloud" title="Jellyfin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/immich" title="QBittorrent Docker Config 🐋 ↗" >}}
{{< /cards >}}

https://github.com/immich-app/immich/releases/tag/v2.5.0?ref=selfh.st

```sh

```

### How to backup data?

3-2-1!

Concerned about container backups?

```sh
mkdir -p /media/jalcocertech/68478e63-dcfa-4361-9625-9ac1275c085c/Z_backup_cont/portainer
sudo cp -r /mnt/portainer_backup/var/lib/docker/volumes/portainer_data/_data/* /media/jalcocertech/68478e63-dcfa-4361-9625-9ac1275c085c/Z_backup_cont/portainer/
```


<!-- ### Other F/OSS Backup solutions
Kopia: An Automatic Backup Solution for Your Self-Hosted App Data or Documents
https://www.youtube.com/watch?v=a6GfQy9wZfA
-->

### How to Detect Duplicates files in the system

https://www.linuxfordevices.com/tutorials/linux/install-use-czkawka

---

## Conclusions

Just do something.



### More Media

I set again Jellyfin *and company* at: `192.168.1.2:8096`

```sh
#git clone https://github.com/JAlcocerT/Home-Lab
#cd ~/Home-Lab/jellyfin
#sudo docker compose up -d

##cd ~/Home-Lab
#git pull
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d jellyfin

docker ps -a | grep -i jellyfin
#udo docker stats jellyfin #~135mb idle
```

If you see very high CPU consumption for nothing, try:

1. Subtitles Burn-in

* Click your User Icon (top right) > Settings.
* Go to Subtitles.
* Set Subtitle playback mode to None.
* Click Save.

I just required to move my OA5 videos to:

```sh
#ls -d CAM1-04-14 CAM1-04-16 CAM1-04-17 CAM2
mv CAM1-04-14 CAM1-04-16 CAM1-04-17 CAM2 /home/jalcocert/Desktop/YoutubeVideos/
```

2. Jellyfin Dashboard Settings

Go to **Dashboard > Playback** and set: `https://jellyfin.org/docs/general/post-install/transcoding/hardware-acceleration/amd`

*   **Hardware acceleration**: `Video Acceleration API (VAAPI)`
*   **VA-API Device**: `/dev/dri/renderD128`
*   **Hardware decoding**: Enable H.264, HEVC, VC1, VP9.
*   **Hardware encoding**: Enabled.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/qbittorrent" title="QBittorrent Docker Config 🐋 ↗" >}}
{{< /cards >}}

```sh
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d qbittorrent
docker logs qbittorrent
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d prowlarr
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d metube
```

These dont take much space:

```sh
docker ps -s --format "table {{.Names}}\t{{.Image}}\t{{.Size}}"
#docker system df -v
```

![alt text](/blog_img/selfh/Jellyfin/prowlarr-indexers.png)

But some of your folders might: *like if you used UmbrelOS via container to sync the full BTC chain with ~837GB and 929k blocks as of today*

```sh
#sudo du -h --max-depth=2 /mnt/data1tb/umbrel/app-data/bitcoin | sort -hr
du -sh .
#sudo apt install ncdu -y
sudo ncdu .
```

Specially after connecting these 2: `192.168.1.2:6011`

![alt text](/blog_img/selfh/Jellyfin/prowlarr-qbittorrent.png)

Try searching for: `1337x, The Pirate Bay, LimeTorrents, or EZTV`.

This can be a good test of your internet speed: *Im getting ~60mb/s*

![Simpsons Clouds](/blog_img/outro/old-man-yells-at-cloud-yelling.gif)

Just go to `192.168.1.2:8081`...

### Server Maintainance

Im thinking to use one instance of PGsql with all the services for now and just change the db name used.

For now, im doing some clean up:

```sh
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" | (read -r; printf "%s\n" "$REPLY"; sort -hk 3 -r)
#sudo docker system df
docker stop node portainer mermaidjs-openai-editor listmonk_app listmonk_db traefik sftpgo-sftpgo-1 kreuzberg botpress-botpress-1 n8ncesar n8ncesar-db-1 n8ntest n8ntest-db-1 n8n-n8n-1 freshrss docker-flowise-1 moirealestate-flaskcms n8n-db-1 node portainer
#docker rm node portainer mermaidjs-openai-editor listmonk_app listmonk_db traefik sftpgo-sftpgo-1 kreuzberg botpress-botpress-1 n8ncesar n8ncesar-db-1 n8ntest n8ntest-db-1 n8n-n8n-1 freshrss docker-flowise-1 moirealestate-flaskcms n8n-db-1
sudo docker image prune -a
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/commento" title="Commento | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Have somebody spam in my **commento instance**?

```sh
docker exec -it commento_db-foss psql -U commento -d commento
#SELECT * FROM comments;
#SELECT creationdate, markdown FROM comments ORDER BY creationdate DESC LIMIT 2;
```

How is the **uptime** looking?

```sh
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d uptimekuma

docker ps -a | grep -i uptimekuma
#sudo docker stats uptimekuma 
uv run scripts/bulk_add_monitors.py
```

![alt text](/blog_img/selfh/HomeLab/statuspages/uptimekuma.png)

Any...**unconnected disk**?

```sh
lsblk
#lsblk -f
sudo mount -t exfat /dev/nvme0n1p1 /mnt/data2tb
#echo 'UUID=a123-567b /mnt/data2tb exfat defaults,uid=1000,gid=1000,umask=000 0 0' | sudo tee -a /etc/fstab
```

```sh
sudo apt update && sudo apt install ncdu -y
sudo ncdu /mnt/data2tb
```




---

## FAQ

### Selfhost Postgres

I read this fantastic [post about selfhosting postgres](https://pierce.dev/notes/go-ahead-self-host-postgres?ref=selfh.st).

And how could I not addit to the mix.

As PG is [one of the DBs](https://jalcocert.github.io/JAlcocerT/setup-databases-docker/) that you can set in your servers to do D&A or as a companion to many services.

And [pgsql can do](https://jalcocert.github.io/JAlcocerT/setup-databases-docker/#postgresql) several parts of a tech stack all together

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/postgresql" title="Postgres | Docker Config 🐋 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/databases/" title="DB | Docs ↗" icon="book-open" >}}
{{< /cards >}}

Even if you have a wood PC, this works, its just ~45mb of RAM consumption:

```sh
docker compose up -d
#sudo docker stats

#docker exec postgres_container psql -U admin -d myapp -c "SELECT 1;"

docker exec -it postgres_container psql -U admin -d myapp
#SELECT version();
#\dt       -- List tables (empty for now)
#\q        -- Quit
```

Let's use it with [the sample **chinook DB**](https://github.com/lerocha/chinook-database/releases): *yes, im cooking sth on top of LangChain+DBs again*

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database" title="Chat with DBs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/" title="Chat with CSVs ↗" icon="book-open" >}}  
{{< /cards >}}

This is all you need to ***plug* an existing database** into your just created **PGSQL container instance**:

```sh
curl -L -O https://github.com/lerocha/chinook-database/releases/download/v1.4.5/Chinook_PostgreSql.sql
cat Chinook_PostgreSql.sql | docker exec -i postgres_container psql -U admin -d myapp

docker exec postgres_container psql -U admin -d myapp -c "\l"

docker exec postgres_container psql -U admin -d chinook -c "\dt"

docker exec -it postgres_container psql -U admin -d chinook
#\dt
#SELECT * FROM artist LIMIT 5;
```

We will be using this very soon :)

> In the mentioned article, Pierce Freeman argues that the fear surrounding self-hosting PostgreSQL is largely a marketing narrative pushed by cloud providers. 

> > He suggests that for many developers, self-hosting is not only more cost-effective but also provides better performance and control.

The Case for Self-Hosting

1. The "Cloud Myth"

Cloud providers (like AWS RDS) pitch reliability and expertise as their main value. However, Freeman points out:

* **Identical Engines:** Managed services usually run the same open-source Postgres you can download yourself.
* **False Security:** Managed services also experience outages. When they do, you have fewer tools to fix the problem than if you owned the infrastructure.
* **Cost Gap:** As of 2025, cloud pricing has become aggressive. A mid-tier RDS instance can cost over $300/month, while a dedicated server for the same price offers vastly superior hardware (e.g., 32 cores vs. 4 vCPUs).

2. Operational Reality

Freeman shares his experience running a self-hosted DB for two years, serving millions of queries daily. He notes that maintenance is surprisingly low-effort:

* **Weekly:** 10 mins (Checking backups and logs).
* **Monthly:** 30 mins (Security updates and capacity planning).
* **Quarterly:** 2 hours (Optional tuning and disaster recovery tests).

3. When to Self-Host (and When Not To)

* **Self-Host If:** You are past the "vibe coding" startup phase but aren't a massive enterprise yet. It’s the "sweet spot" for most apps.
* **Stick to Managed If:** You are a total beginner, a massive corporation with enough budget to outsource the labor, or you have strict regulatory compliance needs (HIPAA, FedRAMP).


If you choose to self-host, Freeman emphasizes that standard Docker defaults aren't enough. 

You must tune these three areas:

Memory & Performance Tuning

* **`shared_buffers`**: Set to ~25% of RAM.
* **`effective_cache_size`**: Set to ~75% of RAM to help the query planner.
* **`work_mem`**: Be conservative to avoid running out of memory during complex sorts.

Connection Management

* **Avoid Direct Connections:** Postgres connections are "expensive."
* **Use PgBouncer:** Use a connection pooler by default to handle parallelism efficiently, especially for Python or async applications.

Storage Optimization

* **NVMe Settings:** Modern SSDs change the math on query planning. You should lower `random_page_cost` (to ~1.1) to tell Postgres that random reads are nearly as fast as sequential ones.



### Setup Containers

New to this?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

A Quick [Container setup guide](https://fossengineer.com/understanding-containers-for-selfhosting/)
<!-- https://www.youtube.com/shorts/ox3IsWH-o7g -->

Or just get ready for SelfHosting:

{{< youtube "ox3IsWH-o7g" >}}


* https://github.com/tensorchord/Awesome-LLMOps


The goal of **this post** is:

1. To review some of the [AI projects](#ai-apps) that are helpful on my workflow
2. To learn how to use [Caddy](#how-to-setup-caddy) as [NGINX](#how-to-install-nginx)/[Traefik](#how-to-install-traefik) alternative to get HTTPs certificates

<!-- https://www.youtube.com/watch?v=XH9XgiVM_z4 -->
{{< youtube "XH9XgiVM_z4" >}}

### Voice to Text

* [Piper](https://github.com/rhasspy/piper) - Also works [Text to Voice](https://www.youtube.com/watch?v=SzRF50UwzYk)
  * [Voices at HF](https://huggingface.co/rhasspy/piper-voices/tree/main)

See https://github.com/mumble-voip/mumble

>  Mumble is an open-source, low-latency, high quality voice chat software. 

---

{{% details title="How to Secure my Services?" closed="true" %}}

* [NGINX](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/)
* [Cloudflare](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/)
  * It allows
* Authelia / Zitadel / Authentik

{{% /details %}}

Thanks To:

* https://akashrajpurohit.com/blog/setup-caddy-with-automatic-ssl-certificates-with-cloudflare/
* https://akashrajpurohit.com/blog/setup-authelia-for-sso-authentication/

### How to Back Up my Server?

Duplicati to other location (HD / Mega, One drive, s3...)

You can also try with [Python Venvs or Conda](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/):


## Web x AI

Ive been using a lot vibe coding, like windsurf and CLI tools like gemini since last year.

There were interesting tools: *scrapegraph, firecrawl, crawl4ai...*

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web" title="Tinkering with Scrapping Tools" image="/videos/job_offers.png" subtitle="Scrapped Job Offers Analytics" >}}
{{< /cards >}}

### Audio Book Player

* https://github.com/TortugaPower/BookPlayer