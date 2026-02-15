---
title: "Improving a HomeLab Privacy with OSS DNS"
date: 2026-03-01T07:20:21+01:00
draft: false
tags: ["Self-Hosting x ProtonDrive","Pihole v6 x UnboundDNS","DNS as Distributed DB","Privacy x Euria"]
description: 'How to change DNS Servers and why it matters. From Portainer to Homepage-Lite.'
url: 'private-dns-with-docker'
---

**Tl;DR**

Pros tend to say `its always DNS`...

```sh
resolvectl status #here is how you check yours (DNS)
```

**Intro**

AdguardHome is a good starter for any homelab.

But DNS is a rabbithole of its own.

With this post, I want to explore the [latests on PiHole v6](#pihole) and use it as the default DNS for a smart TV.

https://www.youtube.com/watch?v=mnry95ay0Bk

* https://hub.docker.com/r/pihole/pihole/tags

```sh
ss -tulpn | grep :53 #most likely, you have sth running
```

Let me tell you a secret: whatever you have at `/run/systemd/resolve/stub-resolv.conf`

```sh
sudo nano /etc/resolv.conf #say algo hi to tailscale, the reason why you can go to uptime kuma via http://jalcocert-x300-1:3001
```

Is the one resolving this:

```sh
nslookup google.com #see that you have systemd doing this for you by default
```

You can change from nameserver 127.0.0.1 to nameserver 1.1.1.1 to free the port 53

```sh
docker pull pihole/pihole:2025.11.0
sudo docker compose -f 2603_docker-compose.yml up -d pihole
docker compose -f piholev6-docker-compose.yml logs -f
```

Then just go to `http://localhost:500/admin/login`, use the `FTLCONF_webserver_api_password` as password.


Once you are done:


```sh
#dig @9.9.9.9 google.com
dig @localhost google.com #this is using pihole right now, not the 1.1.1.1 or whatever is in the .config

; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> @localhost google.com
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42021
;; flags: qr rd ra; QUERY: 1, ANSWER: 6, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;google.com.                    IN      A

;; ANSWER SECTION:
google.com.             196     IN      A       142.250.120.113
google.com.             196     IN      A       142.250.120.138
google.com.             196     IN      A       142.250.120.101
google.com.             196     IN      A       142.250.120.100
google.com.             196     IN      A       142.250.120.102
google.com.             196     IN      A       142.250.120.139

;; Query time: 107 msec
;; SERVER: 127.0.0.1#53(localhost) (UDP)
;; WHEN: Mon Feb 09 15:15:33 CET 2026
;; MSG SIZE  rcvd: 135
```

Btw, now your tailscale ip number:port will work, but not the `http://jalcocert-x300-1:3001/`

Withing the dashboard, you will see queries done via: unless you change back to `127.0.0.1` which now is pihole

```sh
dig @localhost youtube.com
```

* https://github.com/TechnitiumSoftware/DnsServer

> agpl 3 | Technitium DNS Server

### Choosing a DNS for PiHole

Will you keep cloudflare 1.1.1.1, or wanna try sth?

* Unbound
* Bind9
* Other resolvers:
    * Quad9
    * CLoudflare/Google...


* How to use Raspberry Pi as WIFI **A**ccess **P**oint: https://jalcocert.github.io/RPi/posts/rpi-raspap/
* How to use a RPi as a Wifi 2 Ethernet + VPN: https://jalcocert.github.io/RPi/posts/rpi-wifi-ethernet-bridge/


### Pihole regexp

Not blocking all you'd like to?

Not a problem, you can add more domains so that they dont resolve:

* https://docs.pi-hole.net/database/domain-database/?h=adlist#list-table-adlist
* https://github.com/mmotti/pihole-regex
* https://avoidthehack.com/best-pihole-blocklists
* https://github.com/mmotti/pihole-regex

| Category      | Source URL                                                                                                    | Notes discourse.pi-hole+2                      |
| ------------- | ------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| Ads/Trackers  | https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts                                              | Reliable starter list.                         |
| Malware       | https://mirror1.malwaredomains.com/files/justdomains                                                          | Pi-hole default.                               |
| Comprehensive | https://blocklistproject.github.io/Lists/everything.txt                                                       | Full (ads + malware + NSFW); overlaps heavily. |
| Adult         | https://raw.githubusercontent.com/chadmayfield/my-pihole-blocklists/master/lists/pi_blocklist_porn_top1m.list | Family-friendly option.                        |
| YouTube       | https://raw.githubusercontent.com/anudeepND/youtubeadsblacklist/master/domainlist.txt                         | Blocks YouTube ads.                            |


Surprise, surprise, **sqlite** is around:

```sh
sudo apt install sqlite3
sqlite3 ./pihole/gravity.db "INSERT INTO adlist (address, enabled, comment) VALUES ('https://example.com/list.txt', 1, 'Scripted List');"
#docker exec pihole sqlite3 /etc/pihole/gravity.db "INSERT INTO adlist (address, enabled, comment) VALUES ('https://example.com/list.txt', 1, 'Scripted List');"
docker exec pihole pihole -g #update
```

You can interact with pihole sqlite with:

```sh
sqlite3 ./pihole/gravity.db "SELECT * FROM adlist;" #list all
sqlite3 ./pihole/gravity.db "DELETE FROM adlist WHERE address = 'https://example.com/list.txt';" #remove the fake
```

Link checker https://github.com/JAlcocerT/JAlcocerT/actions/runs/20968565017/job/60265649025

https://www.youtube.com/watch?v=U9NgRShXFgk

* [Redis](https://www.youtube.com/watch?v=qucL1F2YEKE)
* SandStorm [SelfHost WebApps](https://docs.sandstorm.io/en/latest/)

**Cloudflare alternatives?**

* https://github.com/rapiz1/rathole

> A lightweight and high-performance reverse proxy for NAT traversal, written in Rust. An alternative to frp and ngrok.

* https://noted.lol/cgnat-and-rathole/

When creating websites for you and others, you have to learn about some basic DNS config:

```sh
dig guideventuretour.com
```

We can say that some domain name and their [DNS management is the 101 basic for webs](https://jalcocert.github.io/JAlcocerT/web-domain-basics/)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/listmonk/listmonk-api-py/Ebook-cover-SSGs.pdf" title="Get an ebook with all Data Analytics concepts you need" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Learn the concepts and tools to land a job in D&A" >}}
{{< /cards >}}

You can blame the raspberry Pi on how ive started learning about DNS
You also learn a lot about DNS when tinkering with networking and setting your own VPN - wireguard server

https://jalcocert.github.io/RPi/projects/rpi_wifi_ethernet_bridge/

> Even Tailscale has its DNS so you can communicate with your devices appearing at `tailscale status` w/o their IP, but their name

RPi DHCP Server

https://radar.cloudflare.com/dns

https://awweso.me/dns/ 

 
DNSMASQ_LISTENING
 
https://github.com/pi-hole/docker-pi-hole/?tab=readme-ov-file#environment-variables

{{< gist jalcocert 302f787db6f6d75e978674e0e18d1185 "Docker-Security-Pihole.yml">}}

### DuckDNS vs Traefikme

The **DuckDNS** service is pretty cool.

You can learn how domain and DNS works with it for free.

Even getting https on them is possible with NGINX.

And that setup can work together with your nextcloud.

```sh
docker exec nextcloud php occ config:system:set trusted_domains 1 --value=somesub.duckdns.org
```

That one I knew for some time, but I also heard about **TraefikMe**

* https://traefik.me/

#### Traefik

I havent talked about Traefik for a while.

But so far is my favourite way of having local https on my sub/domains.

{{< details title="DNS challenge | PorkBun 📌" closed="true" >}}


{{< /details >}}

With Traefik, you can also learn about protecting your web/apps:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/traefik" title="Traefik | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/tiny-auth" title="Tiny Auth Docker Config 🐋 ↗" >}}
{{< /cards >}}


#### PiHole

This service has been with my [for a while](https://jalcocert.github.io/RPi/posts/selfh-internet-better/).

But now *PiHole is reloaded* with its **v6**.

*  https://hub.docker.com/r/pihole/pihole

```sh
#git clone https://github.com/JAlcocerT/Home-Lab

##cd ~/Home-Lab
#git pull
#sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d jellyfin

sudo docker compose -f ./z-homelab-setup/evolution/2603_docker-compose.yml up -d pihole
sudo docker compose -f ./z-homelab-setup/evolution/2602_docker-compose.yml logs -f pihole
```

> Replacing any v5 image (2024.07.0 and earlier) with a v6 image will result in updated configuration files.

> > These changes are irreversible.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/DNS" title="DNS Config Files 🐳 ↗"  >}}
  {{< card link="https://github.com/JamesTurland/JimsGarage/blob/main/Piholev6/docker-compose.yaml" title="PiHole v6 Config File 🐳 ↗"  >}}  
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=mnry95ay0Bk -->

{{< youtube "mnry95ay0Bk" >}}

> If you are looking for other Selfhosted DNS, see: GoAdblock

https://blog.foxxmd.dev/posts/redundant-lan-dns/

Pi-Hole can even be running into lower power SBCs

{{< youtube "IapRcHzIFZ0" >}}


https://awesome-docker-compose.com/apps/dns

<!-- https://www.youtube.com/@TokinPrivacy/videos

Cybersecurity for Beginners: Basic Skills
https://www.youtube.com/watch?v=aRbKFCY4tjE -->


https://github.com/plaintextpackets/netprobe_lite

Simple internet performance tester written in Python

* quad9
* cloudflare
* adguard
* google
* PiDNS - url: 'selfhosting-PiHole-docker'

* https://www.dnsleaktest.com/
* https://www.techradar.com/news/best-dns-server

Verify DNS Server Functionality:

Test if the DNS server is reachable and functioning properly. 

You can ping the DNS server:

```sh
ping 192.168.1.1
```

If the ping is successful, try using a direct DNS query to see if DNS resolution is working:

```sh
#sudo apt-get install dnsutils
dig @192.168.3.1 google.com
```

If dig is not installed, you can install it using `sudo apt-get install dnsutils`

<!-- 
Is Your VPN Leaking?
https://www.youtube.com/watch?v=GxVIa3eDdnM -->


### Blocky

* https://0xerr0r.github.io/blocky/latest/?ref=selfh.st
* https://github.com/0xERR0R/blocky

Fast and lightweight DNS proxy as ad-blocker for local network with many features 

> Blocky is a DNS proxy and ad-blocker for the local network **written in Go** with following features:

{{< dropdown_docker title="Really, Just Get Docker 🐋" closed="true" >}}

* https://github.com/getdnsapi/stubby

## Pi-Hole and DNS

PiHole + Wireguard - https://www.youtube.com/watch?v=R29YBmYxXAk

https://www.youtube.com/watch?v=-5Fwyl73C7g


### Stubby DNS

DNS over TLS

* https://www.youtube.com/watch?v=VCTiR_Ny4Sc


### DNSCrypt

* https://github.com/DNSCrypt/dnscrypt-proxy

### Unbound DNS

### Bind9

* https://hub.docker.com/r/ubuntu/bind9#!

https://www.youtube.com/watch?v=4IuNKK2y49s

> CÓMO configurar tu DNS - Configuración de BIND [Parte 1]


https://www.youtube.com/watch?v=syzwLwE3Xq4

https://www.youtube.com/watch?v=syzwLwE3Xq4&t=745s
> You want a real DNS Server at home? (bind9 + docker)

### CoreDNS

It is great for Docker: https://www.youtube.com/watch?v=tE9YjEV1T4E

---

## Conclusions

To configure your domains, you know you had: https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#programmatic-dns-updates

See that everything is fine with your network:

```sh
sudo apt-get install dnsutils -y #dns resolution
nslookup github.com 
dig google.com

ip route | grep default #see your CM
ping -c 4 192.168.1.1 #gateway
#ip neigh #and other devices connected to the same CM
ping 9.9.9.9 #quad9

sudo apt-get install speedtest-cli
#curl -sS https://ipinfo.io/json #the command to use to see your IP
curl -sS http://ip-api.com/json/ #provides info about country, ISP, ...
#curl -6 ifconfig.me #ipv6 info 
```

Optionally, have  alook to **Portmaster**: *just be aware that it might cause issues with tailscale*

And check your uptime kuma monitoring: `http://192.168.1.2:3001/dashboard/`

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/beszel" title="Beszel | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Im sure that you are already using qb and prowlarr at `6011` and `9696`.

```sh
## For Tinkering with more video parts from your action cam
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list
#Clean the LRF
##rm *.LRF #clean (if needed) all LRF files
#Generate a video from few parts and share it :)
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4 #original audio
```

How to **test your ad-blocks?**

* https://d3ward.github.io/toolz/ and https://d3ward.github.io/toolz/adblock.html


* NetBird - wireguard based
* Netmaker  - https://www.netmaker.io
* Tailscale or Headscale


If you are concerned about privacy and the use of LLMs, consider:

* [Proton](#proton-for-all) Apps, like [LumoAI](https://lumo.proton.me/u/0/)
* `https://euria.infomaniak.com/`
* Go with Ollama x Goose fully local :)

### From Portainer to homepage-lite

I got issues with Portainer couple of times.

So, gave a shot to HomePage-Lite: *I like that it can be configured via yaml :)*

```sh
#git clone https://github.com/JAlcocerT/Home-Lab
#cd ~/Home-Lab/homepage-lite
#sudo docker compose up -d

##cd ~/Home-Lab
#git pull
#sudo docker compose -f ./z-homelab-setup/evolution/2602_docker-compose.yml up -d homepage-lite

docker ps -a | grep -i homepage-lite
#sudo docker stats homepage-lite
sudo docker compose -f ./z-homelab-setup/evolution/2602_docker-compose.yml logs -f homepage-lite
```

If you are not 100% confortable with the terminal yet or need some place to bookmark your containers, these are good options.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/homepage-lite" title="HomePage Lite | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dockge" title="Dockge | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

### Proton for all?

Well, not for all as they dont have a proton drive linux desktop app....yet.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/rclone" title="Rclone | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/sftp-go" title="STFP-Go | HomeLab Config 🐳 ↗"  >}}
{{< /cards >}}

Dont confuse Rclone *which can help you sync local to ProtonDrive*, with rsync: *same that to [pull from weddings](https://youtu.be/h6-3X60QHR8)*

```sh
#sudo ncdu /mnt/data2tb/testftp
#du -sh * | sort -rn #du -sh * | sort -h
rsync -avzP jalcocert@192.168.1.2:/mnt/data2tb/testftp/DJI_20250117084726_0009_D.MP4 ~/Downloads/ #~15MB/s
rsync -avzP jalcocert@192.168.1.2:/mnt/data2tb/IoT ~/Downloads/ #~15MB/s
rsync -avzP jalcocert@192.168.1.2:/mnt/data2tb/2tbe ~/Downloads/ #~15MB/s
#ot back to the server
rsync -avzP /home/jalcocert/Downloads/Music/ jalcocert@192.168.1.2:/home/jalcocert/Desktop/YoutubeMusic #https://lucida.to/
```

They have managed to integrate several apps: *proton mail, authenticator, proton vpn...*

* https://github.com/orgs/protonpass/repositories
    * https://github.com/protonpass/proton-pass-common/releases

```sh
curl -LO https://proton.me/download/authenticator/linux/ProtonAuthenticator_1.0.0_amd64.deb
sudo dpkg -i ProtonAuthenticator_1.0.0_amd64.deb
sudo apt-get install -f
#rm ProtonAuthenticator_1.0.0_amd64.deb
```

* https://account.proton.me/u/0/vpn/vpn-apps
    * https://protonvpn.com/download-linux
    * https://github.com/ProtonVPN/proton-vpn-gtk-app

```sh
#https://protonvpn.com/support/official-linux-vpn-debian/
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
#echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -
sudo apt install proton-vpn-gnome-desktop
```

```sh
sudo apt update  
sudo apt install thunderbird

# wget https://proton.me/download/mail/linux/1.9.0/ProtonMail-desktop-beta.deb
# sudo dpkg -i ProtonMail-desktop-beta.deb
# sudo apt-get install -f
```

If you are not sure, you can also go with NextCloud in your homelab, as I [covered last month](https://jalcocert.github.io/JAlcocerT/image-backup-tools/):

```sh
#sudo docker compose -f /home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml exec nextclouddb env
#sudo docker compose -f /home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml config
sudo docker compose -f /home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml up -d nextcloud-app nextclouddb
#sudo docker compose -f /home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml stop nextcloud-app nextclouddb
#sudo docker compose -f /home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml rm -s -v nextcloud-app nextclouddb
nano /home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml
nano /home/jalcocert/Home-Lab/z-homelab-setup/evolution/.env
docker exec nextcloud php occ config:system:get trusted_domains #see that now is added
#cd /mnt/data1tb/nextcloud/html/config
#cat config.php | grep -A 10 trusted_domains
docker exec nextcloud php occ config:system:set trusted_domains 2 --value=your.new.domain.com
docker exec nextcloud php occ config:system:set trusted_domains 1 --value=192.168.1.2
```

You should see at `192.168.1.2:8099` or your configured domain in the `.env`

> If you are going to expose it to the open internet, make sure is at least accesible by one country with cloudflare WAF

> > Expose it via `nextcloud-app:80` and give access to your family with `https://wha.tever.com/settings/users`


```sh
du -sh /mnt/data1tb/* #see the space taken
du -sh /mnt/data1tb/nextcloud/html/data/jelimoreli
#which user is taking how much space
```

Btw, surprise surpsie when trying to connect via the https one to a nextcloud desktop:

```sh
#docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep nextcloud
docker exec -u www-data nextcloud php occ config:system:set overwriteprotocol --value="https"

docker exec -u www-data nextcloud php occ config:system:set overwrite.cli.url --value="https://nube.jalcocertech.com"
#docker logs --tail 100 nextcloud
grep data1tb /etc/fstab
docker compose -f /home/jalcocert/Home-Lab/z-homelab-setup/evolution/2602_docker-compose.yml down

```

So you can be more specific with: `(http.host eq "nc.jalcocertech.com" and not ip.src.country in {"ES" "PL"})`

```sh
curl -X PUT \
	"https://api.cloudflare.com/client/v4/zones/abcdef123456/rulesets/phases/http_request_firewall_custom/entrypoint" \
	-H "Authorization: Bearer $CF_AUTH_TOKEN" \
	-d '{
    "rules": [
        {
            "description": "allow countries",
            "expression": "(ip.src.country ne \"PL\") or (ip.src.country ne \"ES\")",
            "action": "block"
        }
    ]
}'
```

### Privacy and OS

How could I not mention this.

If you dont want random CPU spikes because someone has decided to record your screen 

Or that your hardware is too old to allow for browsing the web.

Just...*avoid been forced to generate electronical waste, try linux*

0. [ZorinOS](https://zorin.com/) - If you come from Windows, this is for you. *Zorin 18 requires >1.6GB of RAM*

```sh
lsb_release -a #noble or the 24.04!
```

1. [Lubuntu](https://cdimage.ubuntu.com/lubuntu/releases/noble/release/) - *It requires just ~700mb of RAM with UI*

2. Ubuntu if you want the same, but with GNOME :)

> You can have Ubuntu without UI, if you plan to use your server's terminal only

> > For server, id recommend to have the [previous to latest LTS release](https://releases.ubuntu.com/), as of now that 'd be `22.04`, but `26.04` is coming soon


3. If you want to say I use ARCH BTW. 

* [Garuda](https://garudalinux.org/editions)

> Mind the steep*er* learning curve.

4. A Gamer?

* SteamOS
* [CachyOS](https://cachyos.org/) 

Plus, your home server / miniPC will consume less than if you keep it with W11.

Arent you eco yet?

The [Tapo P100](https://jalcocert.github.io/JAlcocerT/tapo-p110-review/) shows you nicely.

Scared?

Try linux with a VM: *like gnome boxes*

```sh
#sudo apt install gnome-boxes
gnome-boxes
```

Once you are happy:

{{< callout type="info" >}}
Have a look to [Ventoy](https://github.com/ventoy/Ventoy) to create **ISO Multi-Boots**
{{< /callout >}}

Time to go to the x13 bios with `F12`?

Once you are done: *there are some goodies waiting for you [here](https://github.com/JAlcocerT/Home-Lab/tree/main/z-desktop-x-homelab), from [the old big list](https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/Ubuntu_installations_bash)*


```sh
sudo apt install git
git config --global user.name "JAlcocerT"
git config --global user.email "JAlcocerT"

#flatpak install flathub app.zen_browser.zen
git clone https://github.com/JAlcocerT/Home-Lab

#sudo ./z-benchmarks/Benchmark_101.sh
sudo ./z-desktop-x-homelab/Linux_Setup_101.sh #You are good to go with browsers OBS tailscale etc https://brave.com/linux/
#wget -P ~/Applications https://github.com/jeffvli/feishin/releases/download/v1.4.2/Feishin-linux-x86_64.AppImage

#flatpak install -y flathub org.telegram.desktop
#flatpak install -y flathub org.kde.kdenlive
#flatpak install flathub org.electrum.electrum #BTC
sudo snap install ytdownloader
```

It shouldnt take you *not more than* 30 min and check that you need just ~15gb for the OS and typical software.

You can be **back to business** quickly:

```sh
flatpak install flathub it.mijorus.gearlever #great for appimages
lazydocker
#git clone https://github.com/JAlcocerT/my-logseq-notes

#as antigravity companion
sudo rm /etc/apt/sources.list.d/appimagelauncher-team-ubuntu-stable-noble.sources && \
sudo apt update && \
sudo apt install -y /home/jalcocert/Downloads/google-chrome-stable_current_amd64.deb
```

You can do `ctrl+shift+P` write user settings JSON and paste:

```json
{
    "git.autofetch": true,
    "terminal.integrated.defaultProfile.linux": "bash"
}
```

Amazon AWS workspace?

Not a problem via `https://clients.amazonworkspaces.com/linux-install`

```sh
Ubuntu 22.04 (amd64) - DCV only

wget -q -O - https://workspaces-client-linux-public-key.s3-us-west-2.amazonaws.com/ADB332E7.asc | sudo tee /etc/apt/trusted.gpg.d/amazon-workspaces-clients.asc > /dev/null

echo "deb [arch=amd64] https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/amazon-workspaces-clients.list

sudo apt-get update

Ubuntu 24.04 (amd64) - DCV only

wget -q -O - https://workspaces-client-linux-public-key.s3-us-west-2.amazonaws.com/ADB332E7.asc | sudo tee /etc/apt/trusted.gpg.d/amazon-workspaces-clients.asc > /dev/null

echo "deb [arch=amd64] https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/amazon-workspaces-clients.list

sudo apt-get update

2. Install Amazon Workspaces

#Once the deb file has been downloaded, you can install Amazon Workspaces with the following command.

sudo apt-get install workspacesclient
```

```sh
git clone https://github.com/JAlcocerT/selfhosted-landing
cd ./selfhosted-landing/y2026-tech-talks/langchain-postgres
#sudo apt install npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 22
node -v # Should show v22.x.x

npm install
npm run build
#npm i -D playwright-chromium
#npm run export #default as pdf! http://localhost:3030/export
```

No longer using localsend via app image, just pairdrop via web :)

And after all this, you go to ~22gb taken, which I believe is what W11 takes for starters.


{{< youtube "hTw9DBEksx4" >}}



--- 


## FAQ

What else am I running?

Syncthing or sftpgo where nice, but...

```sh
docker compose -f 2602_docker-compose.yml up -d
docker compose -f 2602_docker-compose.yml up -d nextcloud-app nextclouddb
#sudo du -sh /mnt/data1tb/nextcloud/html/data/jelimoreli
```

See `httops://what.ever.jalcocertech.com/status.php`

```sh
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep jellyfin
docker compose -f 2602_docker-compose.yml up -d jellyfin metube navidrome qbittorrent prowlarr homepage-lite termix pigallery2 uptimekuma-monitoring neko logseq
```

I wouldnt have done this without: Termix, UptimeKuma and

```sh
sudo apt install glances
#uv tool install glances
glances

lazydocker

#sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64 -O /usr/local/bin/ctop && sudo chmod +x /usr/local/bin/ctop
ctop
```

1. https://github.com/hagezi/dns-blocklists
2. https://github.com/blacklanternsecurity/baddns

Before LLMs, you might have needed: https://github.com/composerize/composerize  🏃→🎼 docker run asdlksjfksdf > docker-composerize up 

**Programmatic DNS updates**

* https://developers.cloudflare.com/api/resources/dns/
* https://github.com/cloudflare/cloudflare-python

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-dns-scripts" title="CF x Porkbun DNS API Py Scripts ↗" >}}
{{< /cards >}}

### Wireshark - Checking which adds are going through

* https://docs.linuxserver.io/images/docker-wireshark/


### Business OSS Driven

The year has just started and you might be motivated to finally launch your business.

<!-- tags: ["OSS for Business","Serverless-Invoices","Payments","BillaBear"] -->

Make sure to understand the licenses.

MIT, Apache v2 will work.

Some examples?

You can get around with open source for:

1. Creating Invoices: There are [several ways to](https://fossengineer.com/open-source-invoice-creator) do so, but I like the simplicity of serverless-invoices.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serverless-invoices" title="Serverless Invoices | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

Your invoices can be backed up with their PDF or just the JSON to save space.

* Remember about: https://jsonformatter.org/

2. Receiving payments: *Stripe API is great and simplify a lot of things.*

* https://github.com/BillaBear/billabear


#### Monitoring

So you are already having few SaaS.

Most of the sites are reciving no traffic.

But there is that idea taking over.

Is your VPS server fried already?

Figure that out with these OSS Monitoring Tools:

* Monitor your vendors
    * https://pingbot.dev/#pricing

Monitoring for your servers, vendors, and infrastructure.

And for **status pages**, like the pros have:

* ps://health.aws.amazon.com/health/status
* https://www.cloudflarestatus.com
* https://www.37status.com/
* https://pocketbitcoin.com/status

You can also with Uptime Kuma pages or kener!

#### Chats

Just see this dedicated post.


#### Project Management

If you are already a [BA](https://jalcocert.github.io/JAlcocerT/business-analytics-skills/)/PM and are very mindful about your [time](https://jalcocert.github.io/JAlcocerT/time-management-data-analytics/) and creation proper project docs like [BRD's](https://jalcocert.github.io/JAlcocerT/brd-vs-frd-for-data-analytics/)

* Project management and issue tracking for everyone - https://github.com/makeplane/plane
    * https://github.com/makeplane/plane?tab=AGPL-3.0-1-ov-file#readme

>  🔥 🔥 🔥 Open Source JIRA, Linear and Asana Alternative. Plane helps you track your issues, epics, and product roadmaps in the simplest way possible. 

* https://github.com/nfoert/cardie - GPL 3.0

> An open source business card designer and sharing platform

#### Billing

There will come a time to invoice someone.

Why not doing [billing with OSS](https://fossengineer.com/open-source-invoice-creator/) as well?

* Lago - https://github.com/getlago/lago?tab=AGPL-3.0-1-ov-file#readme

> Open Source Metering and Usage Based Billing API ⭐️ Consumption tracking, Subscription management, Pricing iterations, Payment orchestration & Revenue analytics

See also

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/invoice-ninja" title="Invoice Ninja | Docker Config for HomeLab 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serverless-invoices" title="Serverless Invoices | Docker Config for HomeLab 🐋 ↗" >}}
{{< /cards >}}

### Browsers

1. Librewolf vs Zen vs waterfox vs firefox

2. Chromium vs brave vs [Helium](https://github.com/imputnet/helium) vs Tor browser

```sh
flatpak install flathub app.zen_browser.zen -y
#https://github.com/imputnet/helium-linux/releases
wget -P ~/Applications https://github.com/imputnet/helium-linux/releases/download/0.8.5.1/helium-0.8.5.1-x86_64.AppImage
```

> Version 0.8.5.1 allowed me to use logseq via browser, unlike Brave 1.86.148 Chromium: 144.0.7559.133

If you want Chromium, minimal UI, and no crypto/ads stack: Helium is closer to your taste than Brave, as long as you accept rough edges and a smaller project.

If you want “it just works” privacy with maximal site compatibility and do not mind the BAT model existing: Brave is the pragmatic choice.

If you prefer Gecko and Firefox’s ecosystem with a nicer UI and no Mozilla telemetry: Zen is a good daily driver, but not a hardcore anonymity tool.

If you want the strictest privacy and are OK with friction and some breakage: LibreWolf is the strongest stance of the four.

* TightVNC
* Remote Ripple VNC Viewer

**Extensions**

* Kanban board with our bookmarks: <https://github.com/d3ward/b2ntp>
    Again, awsome job of <https://d3ward.github.io/about.html>
* ublock origin
* bitwarden

**Add-ons** for firefox that I tried

* Privacy Badger
* https everywhere
* ublock origin

### How can I Check my DNS?

* https://dnsprivacy.org/dns_privacy_daemon_-_stubby/

### ControlD (Windscribe DNS)


### Other Free Tools for monitoring Internet


* Monitoring Internet quality
* Wireshark - https://docs.linuxserver.io/images/docker-wireshark/
* PiHole


### Interesting Security Tools

* 2fas - https://github.com/twofas/2fas-android
* Proton Auth

### What do I like to bring to my HomeLab?

HomeLab Essentials - https://jalcocert.github.io/JAlcocerT/docs/selfhosting/

These have been apps that I have used at some point at my homelab and might also be of your interest

1. Container UI's 🐳: [Portainer](https://github.com/JAlcocerT/Home-Lab/tree/main/portainer), Rancher, Dockge...

2. Syncing 🐳: [Syncthing](https://github.com/JAlcocerT/Home-Lab/tree/main/syncthing)

3. Tools 🐳: [IT-Tools](https://github.com/JAlcocerT/Home-Lab/tree/main/it-tools), CosmosServer, [OmniTools](https://github.com/JAlcocerT/Home-Lab/tree/main/omni-tools)

4. [Webs 🐳](https://github.com/JAlcocerT/Docker/tree/main/Web/CMS): *Wordpress, Ghost, LinkInBio selfhosted alternatives...*

> Wrote a post about the most popular CMS's [here](https://jalcocert.github.io/JAlcocerT/no-code-websites/) and about LinkStack [here](https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/#selfhosted-solutions-for-linkinbio)

> > And Web Analytics like https://github.com/rybbit-io/rybbit

5. Productivity Tools 🐳: Get [proper focus](https://jalcocert.github.io/JAlcocerT/tools-to-improve-focus/)

6. [GenAI Tools 🐳](https://github.com/JAlcocerT/Docker/tree/main/AI_Gen) 

7. [HTTPs Tools](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/): via proxies like NGINX, Traefik or tunneling solutions like Cloudflare Tunnels ...

> I also enjoyed [DuckDNS](https://hub.docker.com/r/linuxserver/duckdns).

8. PaaS Tools, like [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas/)

9. [Photo Tools](https://jalcocert.github.io/JAlcocerT/photo-management-tools/)

> The docker related files are [here 🐳](https://github.com/JAlcocerT/Docker/tree/main/Backups/Photos)

10. [SSGs](https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-astro) combined with a headlessCMS and [selfhosted static server](https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-static-hosting) 🐳 

But if you are starting, just use static hosting for those and forget about servers.