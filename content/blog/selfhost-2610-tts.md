---
title: "Selfhosted TTS"
date: 2026-10-31
draft: false
tags: ["Kokoro","VoiceBox","SunoAI x music","VPS x DR Test","ONT x DHCP"]
description: 'A homelab that speaks.'
url: 'selfhosted-tts'
---

**Tl;DR**

https://mermaid.js.org/syntax/entityRelationshipDiagram.html 

https://github.com/swingmx/swingmusic

**Intro**

* WHY Im writting this post: *bc i was surprised with [voicebox](https://fossengineer.com/voicebox-local-ai-voice-studio/), [chatterbox](https://fossengineer.com/chatterbox-local-open-source-tts/) and [kittenTTS](https://fossengineer.com/kittentts-local-cpu-tts/), but got to know simpler [local audio workflows with kokoro-82M](https://github.com/JAlcocerT/poc/blob/main/fpv-kpis/z-learnings.md) and this needs a checkpoint.
* WHAT [Ive learnt](#conclusions) with it: *Ive ended*

## T2S

You can go an use an OpenAI key:

```sh

```

Or as I got to know recently, `Kokoro TTS` surprised me locally with python to create such video with hyperframes autonomously.

https://jalcocert.github.io/JAlcocerT/blog/selfhost-2605-ollama-cloud/#local-audio

## S2T aka Transcription

This is a good addition to `margin-cms`

Imagine having the audio record capabilities and transcription from meetings directly into your notes.

> [Files.md](https://fossengineer.com/files-md-local-first-markdown-notes/) has recording capabilities via pwa

Then you can use some skills to bring the sauce to your daily summary, or just skip it.

## Selfhosted AI-Gen Audio

Earlier this year I was trying: [chatterbox](https://fossengineer.com/chatterbox-local-open-source-tts/), [qwen TTS](https://fossengineer.com/comfyui-qwen-tts/), [kitten TTS](https://fossengineer.com/kittentts-local-cpu-tts/) and [Voicebox](https://fossengineer.com/voicebox-local-ai-voice-studio/)

From all those: voicebox was the clear winner to me.



https://jalcocert.github.io/JAlcocerT/cad-design-mbsd/#rendering-on-a-mac-m2

### Selfhosted music server

Just [setup Gonic](https://fossengineer.com/selfhosting-gonic/) or Navidrome.

If you like CLIs: https://fossengineer.com/cliamp-terminal-music-player/

## AI x Music

https://jalcocert.github.io/JAlcocerT/music-with-ai-tools/#open-source-ai-tools-for-music-creation

https://jalcocert.github.io/JAlcocerT/music-with-ai-tools/#sunoai

[1](https://suno.com)
[2](https://pyseek.com/2025/04/generate-music-using-python-deep-learning/)
[3](https://github.com/ayeshabasit/AI-Music-Generator)

---

## Conclusions

A friend tried `https://pr.tn/ref/RHJ7YZE8` proton unlimited `https://account.proton.me/u/3/mail/users-addresses`

1. Your friend creates a free Proton account with a Proton Mail address.
2. You upgrade your account to Proton Duo.
3. In Proton settings, create a family group.
4. Go to Users and addresses → Invite user.
5. Enter your friend’s Proton address and allocate storage.
6. They accept the invitation and switch to your Duo plan.

### FOSS

Just [get gitlab setup](https://jalcocert.github.io/JAlcocerT/oss-automatic-docs-and-tech-video/), use skills and continuing [the F/OSS brand](https://jalcocert.github.io/JAlcocerT/a-better-fossengineer/):

```sh
#ssh jalcocert@192.168.1.2
#cat ~/.ssh/id_ed25519.pub
#ssh -T git@gitlab.com
git clone git@gitlab.com:fossengineer1/fossengineerpapermod.git
```

I discovered interesting services, in case that you are tired of stripe:

```md
Added Zoneless as an optional USDC payout method to this marketplace while preserving checkout and every existing payout method; start by reading https://zoneless.com/docs/agent-marketplace-quickstart.md and follow it.
```

### HomeLab Updates 1026

Coming from [the 0926 updates](https://jalcocert.github.io/JAlcocerT/selfhosting-information-flow/#homelab-updates-0926).

Ive been using [Dawarich](https://fossengineer.com/selfhosting-dawarich/) for [a while](https://jalcocert.github.io/JAlcocerT/home-lab-tools-for-iot/#homelab-updates-0826), which reminded me about a potential [synergia with wanderer](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#selfhosted-adventures)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wanderer" title="Selfhosted Wanderer - Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dawarich" title="Dawarich Config 🐋 ↗" >}}
{{< /cards >}}

![Wanderer vs strava/komoot](/blog_img/selfh/umbrel-os/wanderer-integrations.png)

Tinkered a bit with [Technitium](https://fossengineer.com/selfhosting-technitium-dns/#technitium-vs-pi-hole-vs-adguard-home) inside [Omarchy via VM](https://jalcocert.github.io/JAlcocerT/selfhosting-information-flow/#omarchy).

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/technitium" title="Technitium | Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< callout type="warning" >}}
Mind the contamination that live data might provide to the LLMs.
{{< /callout >}}

Also, got to know about mDNS - *which can be useful to ship the automatic watering setup with the esp32 available at a `pump.local` domain*

Both the pi and x300 are working right now without local SSLs `192.168.1.18` `192.168.1.2`

Regarding **useful CLIs**: [herdr](https://fossengineer.com/herdr-terminal-agent-multiplexer/), [ncdu](https://fossengineer.com/ncdu-terminal-disk-usage-analyzer/), [lazydocker](https://fossengineer.com/lazydocker-terminal-ui-for-docker/)

For AI: *~~windsurf, cursor, zed, gram, antigravity, kilo code, roo code, gemini cli, Goose Desktop~~ claude code, codex CLI, T3 Code, opencode....*.

Combined with [gitpane](https://github.com/affromero/gitpane) or [mgitstatus](https://github.com/fboender/multi-git-status/blob/master/mgitstatus):

```sh
herdr #code --yolo | opencode | claude
#opencode upgrade
mgitstatus #this has been interesting to try and superseed an IDE

glances #htop #btop
#lazygit #lazydocker
#cargo install gitpane
```

For [maintainance](https://github.com/JAlcocerT/Home-Lab/blob/main/maintenance.md):

```sh
#ncdu /
find . -type d -name ".venv" ### -exec rm -rf {} +
find . -type f \( -iname '*.sqlite' -o -iname '*.sqlite3' -o -iname '*.db' \)

# sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d qbittorrent prowlarr
sudo docker compose -f 2610_docker-compose.yml up -d termix nextcloud ncdb sftpgo forgejo forgejo-forgejo-db-1 ntfy pocketbase mailpit uptimekuma maintenant technitium jellyfin qbittorrent prowlarr dawarich_app dawarich_db #umami lunalytics littlyx
#docker port iot-dashboard-v2
#lazydocker
#lazygit
```

For notifications im using now ntfy instead of gotify:

```sh
#cd jalcocertech-core/leads-hub/hub
docker compose run --rm hub digest --send #weekly summaries towards ntfy
```

Im very happy with dawarich [komoot integration](https://dawarich.app/blog/12-best-apps-for-mapping-your-walks-in-2025/?_highlight=komoo#5-komoot), it also support immich and Photoprism!

To do some clean up:

```sh
comm -23 \
    <(docker network ls --format '{{.Name}}' | sort -u) \
    <(docker ps --format '{{.Networks}}' | tr ',' '\n' | sort -u)
#docker network prune
docker builder prune -a
```


#### Homelab hardening

Are you `readyforlinux.com`?

That questions comes now with extra security implications.

Luckily you have agents and tools to wrap: https://github.com/aquasecurity/trivy

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/trivy" title="Trivy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```sh
sudo apt install lynis
sudo lynix audit system --quick
#sudo lynis audit system --quick --no-colors --log-file /home/jalcocert/lynis.log --report-file /home/jalcocert/lynis-report.dat > /home/jalcocert/lynis-output.txt 2>&1
```

> For runtime defense and containment: `falco` & [wazuh](https://github.com/wazuh/wazuh)

{{< callout type="warning" >}}
Aim for **0 critical**!
{{< /callout >}}

As i really dont want to install many GUI apps at [the new Dell](#macbookor-omarchy), ill be using rustdesk with the homelab and i wont be needing x11 for ssh.

If you are at a big corp, you might use `orca.security` for the same

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gonic" title="Gonic | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin Media Server Tools 🐋 ↗" >}}
{{< /cards >}}

```sh
winget install sonixd #supersonic also allows subsonic or jellyfin servers
```

Been also working with [notifications in the homelab](https://jalcocert.github.io/JAlcocerT/blog/entrep-saas-waiting-x-ebook/#oss-notifications) lately: *it has been cool [for inbound marketing](https://jalcocert.github.io/JAlcocerT/blog/entrep-saas-waiting-x-ebook/#conclusions)*

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gotify" title="gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ntfy" title="notify | Docker Config 🐋 ↗" >}}
{{< /cards >}}

> `https://github.com/Aetherinox/ntfy-desktop#linux-1` and connection with uptime kuma (mqtt too?)

Oh, and with [oss link shorteners](https://fossengineer.com/selfhosted-open-source-url-shorteners/): [snapp](https://github.com/urania-dev/snapp) was interesting, dub too feature heavy, [kutt](https://github.com/thedevs-network/kutt), shlink, yourls and [ha.mr](https://github.com/p2r3/ha.mr) whose creator has a very [interesting video about how link shorteners work](https://www.youtube.com/watch?v=TOr1Vvji6jA)

> But finding [Sink](https://github.com/miantiao-me/Sink) and [Slite](https://github.com/miantiao-me/Slite) that are a good match if you already use CF KV and D1

The video presents a novel approach to link shortening and QR code generation that eliminates the need for a database, ensuring links remain recoverable even if the service goes down.

The method focuses on optimizing link encoding and compression, resulting in potentially smaller QR codes and links without ads or registration.

Traditional link shorteners store full links in a database, raising privacy concerns and potential link loss if the service shuts down.

The proposed "link compressor" removes redundant parts of URLs, significantly reducing their length without losing essential information.

Encoding techniques are employed to represent common URL components with fewer bits, allowing for more efficient storage.

The system uses a fixed dictionary for compression, optimizing the encoding of frequently used characters in URLs.

The QR code generation process is improved by using the alphanumeric character set, resulting in smaller and more efficient QR codes compared to existing tools.

The project is experimental and not intended as a commercial product, but it demonstrates the potential for more efficient link management.

> Once you are done, you make sure that all links in your website work with `https://github.com/linkchecker/linkchecker`

These are also useful:

```sh
#whois ebooks.jalcocertech.com| grep -i -E "(creation|created|registered)"
nslookup ebooks.jalcocertech.com
dig ebooks.jalcocertech.com

#sudo docker stop qbittorrent
#docker rm -f $(docker ps -aq --filter "name=entre")
#docker system prune --all
docker inspect forgejo --format '{{range $name, $_ := .NetworkSettings.Networks}}{{println $name}}{{end}}'
#docker network connect cloudflared_tunnel forgejo
#cd ./Home-Lab/forgejo
#make migrate-repo REPO_OWNER=JAlcocerT REPO_NAME=my-logseq-notes #makes a mirror of gh
#make sync-repo REPO_OWNER=JAlcocerT REPO_NAME=my-logseq-notes
```

[Nextcloud is working reliably](https://jalcocert.github.io/JAlcocerT/selfhosted-connectivity/#self-hosting-updates) and accesible via CF only from the countries I [configured via WAF](https://jalcocert.github.io/JAlcocerT/image-backup-tools/#cf-waf-vs-zero-trust-access).

Is good to have [opencode](https://fossengineer.com/opencode-ai-coding-agent-cli/) and [lazygit](https://fossengineer.com/lazygit-terminal-ui-git/) handy too.

```sh
#docker ps --filter "status=running"
#docker ps -a --filter "name=home-assistant"
#docker stats home-assistant
glances #htop btop
```

You can also connect to wifi via CLI, see `iwd` or [impala TUI](https://fossengineer.com/impala-tui-wifi-manager/)

Having a look to **commento** to check that there is no spam [from time to time](https://jalcocert.github.io/JAlcocerT/image-backup-tools/#server-maintainance):

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/commento" title="Commento | Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/#homelab-commands" title="HomeLab CLIs | Docs ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-dns-scripts" title="Cloudflare x Porkbun DNS API Scripts ↗" >}}
{{< /cards >}}


* https://jalcocert.github.io/JAlcocerT/selfhosted-apps-oct-2025/#traefik-x-x300-homelab
* https://fossengineer.com/selfhosting-traefik/

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/traefik" title="Traefik | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/tiny-auth" title="Tiny Auth Docker Config 🐋 ↗" >}}
{{< /cards >}}

For media: `https://selfh.st/apps/?tag=Photos`

* https://github.com/paulomarques742/imago
* https://imago.742studio.eu/

* https://foldergram.github.io/

```sh
git clone /JalcocerT/foldergram
```

> Point it at your folders, browse everything through a fast feed-style interface. No cloud, no accounts — just your files and SQLite.

* https://github.com/open-noodle/gallery a fork of immich :)

> Some time back i [tried immich](https://fossengineer.com/selfhosting-immich/) but i didnt like that my folder order is not respected and also neither need the heavy face recognition

High performance self-hosted photo and video management solution.

https://github.com/storytold

https://github.com/andrii-kryvoviaz/slink

Ive also kept using my `yt-distill` poc to go through [interesting videos](https://github.com/JAlcocerT/my-logseq-notes/tree/main/distilled-videos/business-hormozi):

```sh
git clone ./poc/yt-distill
```

From here, [*destilling* is not the problem](https://github.com/JAlcocerT/jalcocertech-services/blob/master/docs/destilled-ebooks/z-read-books-notes/z-hormozi-curated.md), its just doing.


---

## FAQ

```sh
#git init #gh secret list
```

### Preparing backups

Frist of all, some cleanup:

```sh
containers_to_stop=(
  z-poc-trip-planner-adk-web-1
  z-poc-trip-planner-adk-adk-1
  libreportfolio-flask
  chartbrew-foss-trial-app
  chartbrew-foss-trial-db
  chartbrew-foss-trial-redis
  inbucket-safe
  dbackup
  ppp-caddy
  ppp-app
  ppp-db
  feedlog
  feedlog-db
  gladys
  gladys-ext-prohand-gladys-electricity-maps
  filebrowser
  kener
)

docker stop --timeout 60 "${containers_to_stop[@]}"

#docker rm "${containers_to_stop[@]}"

docker builder prune -a
docker image prune -a
```

It has been [a while](https://github.com/JAlcocerT/Home-Lab/blob/main/z-homelab-setup/evolution/2605_docker-compose.yml) since I updated these configs.

But first, I moved from the OS drive towards `/mnt/data1tb/services` all the containers.

```sh
cd ./Home-Lab/tree/main/z-homelab-setup/evolution
docker compose -f 202610_docker-compose.yml up -d build
```

{{< callout type="warning" >}}
Remember to setup [CF Geoblocking](https://github.com/JAlcocerT/Home-Lab/blob/main/cf-security.md) for your public services *like nextcloud*
{{< /callout >}}

You have this nice client: `https://github.com/Obiente/native`

```sh
cd /home/jalcocert/Downloads && sudo apt install -y ./nextcloud-native-linux-amd64.deb
#docker exec -it nextcloud php -v
```

> You better are aware of [whats going on with PHP](https://fossengineer.com/php-drama-ssl-certificates-october-2026/) and update accordingly

In fact, you better master your security:

```sh

```

https://github.com/kopia/kopia

Cross-platform backup tool for Windows, macOS & Linux with fast, incremental backups, client-side end-to-end encryption, compression and data deduplication. CLI and GUI included.

https://github.com/restic/restic

Fast, secure, efficient backup program


### Testing a backup Strategy in the cloud

I recently saw [this post](https://akashrajpurohit.com/blog/choosing-the-right-vps-provider-comparing-digitalocean-linode-vultr-hetzner-for-different-use-cases/) that compares few VPS providers

It reminded my that some time back, i also tested as a wg server VPS's like DO droplet and hetzner 

Also, i put together some [101 vps setup](https://github.com/JAlcocerT/Home-Lab/tree/main/z-hetzner-vps-setup) that we can reuse.

As [now im energy aware](https://jalcocert.github.io/JAlcocerT/starting-with-3dprinting/#energy-consumption-data-points) that my CM+x300 home server are costing me ~20kwh/month@0.25eur/kwh = 5 eur/month which is far lower than the ~60 eur/month id be paying.

But... renting on of those servers for an afternoon can be interesting to:

1. Test in Batch all my Home-Lab OSS projects docker compose with agents and flag which ones are not working anymore

2. Test that my backup strategy and DR (disaster recovery works) 

### Travel Router as Home Router

I was wondering of the Glnet could be my home router, if i can use https://opnsense.org/ or if i need a CM at all.

**No, you do not need a cable modem at all.**

The standalone **ONT on your wall is already your modem.**

Why People Get Confused by the Term "Modem"

Historically, internet types used different devices:

* **DOCSIS (Coaxial cable TV network like legacy UPC):** Needed a dedicated **Cable Modem** to translate high-frequency coaxial RF signals into Ethernet.
* **DSL / VDSL (Old copper phone lines like Neostrada):** Needed an **ADSL/VDSL Modem** to demodulate phone line frequencies.
* **Fiber Optic (Your setup):** Uses an **ONT (Optical Network Terminal)**. It demodulates light pulses coming through the glass fiber and turns them directly into standard Gigabit Ethernet frames.


The box Play delivered to you is a **router + Wi-Fi access point**, not a modem. It does no optical conversion.

```
[ Glass Fiber in Wall ]
           │
           ▼
┌─────────────────────────┐
│     Orange ONT Box      │  <-- THIS IS YOUR MODEM (Keep this plugged in)
│ (Demodulates light)     │
└──────────┬──────────────┘
           │
           │ (Standard RJ45 Ethernet Cable carrying VLAN 35)
           ▼
┌─────────────────────────┐
│ Play Factory Box        │  <-- THIS IS JUST A ROUTER / AP (You can remove it)
│ (Currently routing)     │
└─────────────────────────┘
```

When you replace the Play router with your GL.iNet, a UniFi Gateway, or your Ubuntu homelab running **OpenWrt**:

```
[ Orange ONT Box ]
       │
       │ (Standard RJ45 Ethernet Cable carrying VLAN 35)
       ▼
[ Your Custom Router / GL.iNet / Homelab VM ]
       │
       ▼
[ Your Devices & Wi-Fi ]

```

As long as the **ONT on the wall stays connected to power and fiber**, you can plug that incoming Ethernet cable directly into any router you want and send the factory box back into storage.

### Macbook...or Omarchy?

I tried omarchy 4 in [a VM](https://github.com/JAlcocerT/Home-Lab/blob/main/z-benchmarks/vm-101.md) not long [ago](https://jalcocert.github.io/JAlcocerT/selfhosting-information-flow/#omarchy) and i pretty much enjoyed the flow of the window manager.

Just discovered that there is a similar project that does the same for macbooks: https://github.com/asmvik/yabai

What to do in this case? to linux? or to go with the flow?

Also this project can be interesting https://github.com/Saffsanity/sill

I tried a macbook Pro M2 that weights the same as my x13 gen2 (1.3kg), the build quality is excellent...but I have some [desktop/homelab goodies for starters](https://github.com/JAlcocerT/Home-Lab/tree/main/z-desktop-x-homelab)

There are interesting options: asus expertbook a7, thinkpads x1 with little over 1kg...

Its just that any alternative goes too much into the diminishing returns part.

I ended up going with a **Dell XPS 9350** this time and with `Omarchy 4.0.4`

> It was all about F12 for bios, ventoy, GRUB2 option and <1min to install

> > You can apply brand to your laptop as per `https://github.com/omacom/omarchy/blob/quattro/manual/41-branding.md`

As a companion i got a keychron J2 75%, dygma was an interesting alternative :)

To pair it it was as simple as: 

#### Omarchy x Pomodoro

Couldnt resist to add this to omarchy:

* https://github.com/JAlcocerT/omarchy-pomodoro