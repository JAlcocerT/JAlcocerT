---
title: "Selfhosted Information flow"
date: 2026-09-19T09:20:21+01:00
draft: false
tags: ["FilesMD","Forgejo","Zetlekasten","No Hello x Async","SoloPreneur CheckList"]
description: 'From The algorithm to a daily information frameworks. Company brain.'
url: 'selfhosting-information-flow'
---

**TL;DR**

You better write daily/weekly notes and work with them

**Intro**

* Why Im writting this post: *bc I want to standardize the way i capture information across my forcely [scattered daily flow](https://github.com/JAlcocerT/my-logseq-notes/tree/main/journals) and [create meta-frameworks](https://github.com/JAlcocerT/my-logseq-notes/tree/main/daily-frameworks) with it to apply cross-domain*
* [What Ive learnt](#conclusions) with it: *When principles/ideas/[books are clear](https://github.com/JAlcocerT/jalcocertech-services/blob/master/docs/destilled-ebooks), just [apply them harder](https://jalcocert.github.io/JAlcocerT/poc-107/#destilling-read-books)*

## Why you need this

I dont care if you are a director, an IC that ~~moonlights~~ has independent consilting work, or a solo-preneur:

QnA the team to [avoid accountability laundring](https://github.com/JAlcocerT/my-logseq-notes/blob/main/daily-frameworks/accountability-framework.md)

Use when someone asks for a quick call without enough written context:

{{% details title="...and weaponized incompetence 🚀" closed="true" %}}

I cannot jump on a call right now, but we can probably handle it async.

Can you send:

- the exact error or behavior
- what you already tried
- the doc/wiki section you followed
- what result you expected vs what happened

Once I have that, I can point you to the right fix or doc update.

{{% /details %}}

You better [ask questions](https://jalcocert.github.io/JAlcocerT/questions-for-engineers/) on time. Arent you [QnA'ing Product teams](https://jalcocert.github.io/JAlcocerT/questions-for-engineers/#the-engineers-no-fluff-checklist)?

Yep, make sure meetings are clear and actionable :)

{{< callout type="info" >}}
A good start is *WHO will do WHAT by WHEN*
{{< /callout >}}

**EOD Accountability** Review:

- What did I move forward today?
- What did I make clearer for other people?
- What ambiguity did I convert into owner/action/trigger?
- What is still exposed?
- What should be visible in the weekly summary?

<!-- 
https://youtu.be/6SyqMqIPQiI 
-->

{{< youtube "6SyqMqIPQiI" >}}

When you are a solo-founder, you dont have time for bs.

You can avoid noise, non-sense promises, wishes [with such form](https://github.com/JAlcocerT/jalcocertech-services/tree/master/forms): https://app.formbricks.com/s/cmtljp6ee1j5d01xdkqdqpdyp

```sh
cd ./jalcocertech-services/forms
#make help
```

## The Setup

Earlier this year I got my [read books notes distilled](https://jalcocert.github.io/JAlcocerT/poc-107/#destilling-read-books) with very [interesting feedback](https://github.com/JAlcocerT/jalcocertech-services/blob/master/docs/destilled-ebooks/z-read-books-notes/z-hormozi-curated.md)



### Tools

Earlier this year I [explored some note tools: Affine, Joplin and logseq](https://jalcocert.github.io/JAlcocerT/no-code-tools-for-business/#note-tools), i kept the latter focusing in the pure .md and git capabilities.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/joplin" title="Joplin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/logseq" title="LogSeq | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Last year, [as knowledge management tools](https://jalcocert.github.io/JAlcocerT/knowledge-management/#knowledge-management-tools) I covered: Raneto, Silverbullet
{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Notes" title="Note Tools | Docker Configs 🐋 ↗" >}}
    {{< card link="https://fossengineer.com/selfhostable-note-taking-tools/" title="OSS Note taking tools ↗" >}}
{{< /cards >}}


### The Indie Way

For some cases, you can consider to just write into [your Forgejo instance](#selfhosted-forgejo), in case that github is non accesible.

Ill assume that you are fine with `.md` files

Bc why wouldnt you at this point.

#### YT Summaries

That's exactly what ive done around this Hormozi video *one more time*

```sh
cd ./poc/yt-distil
```

#### Audio Recaps

I was using fireflies *even [with n8n](https://jalcocert.github.io/JAlcocerT/audio-recap/#tools-for-meetings)*, but then I created a setup around google recorder and a openai key to perform transcription (S2T), then let `codex` take it from there.

![Fireflies AI has n8n integration](/blog_img/GenAI/n8n/n8n-audio-fireflies.png)


Last year, I was working on a speech rater around openAI TTS and ST2 as well [here](https://jalcocert.github.io/JAlcocerT/audio-recap/#the-speech-rater-stack)

With files.md you can record audio with the PWA, just that it will stay locally.

#### Gold Info for SoloPreneurs

You need to ship, fix/kill (quick). 

{{% details title="Ideas Checklist 🚀" closed="true" %}}

For this I dedicated a full post few weeks ago.

The general idea checklist is as follows:

{{% /details %}}

{{% details title="Prospects/Clients Checklist 🚀" closed="true" %}}



{{% /details %}}


#### Info to Video

You are already aware, PoC, make a [hyperframe](https://jalcocert.github.io/JAlcocerT/youtube-video-as-a-code/) video [about it, or about yourself](https://github.com/JAlcocerT/poc/tree/main/libg/accountability-communication)

{{< youtube "4sSa28Xk5Yw" >}}

<!-- https://youtu.be/4sSa28Xk5Yw -->

---

## Conclusions

If [it was](https://jalcocert.github.io/JAlcocerT/selfhosting-data-analytics/#anti-patterns-vs-better-framing) not clear, now [communication patterns](https://jalcocert.github.io/JAlcocerT/selfhosting-data-analytics/#six-stakeholder-communication-patterns) have to be.

[No more ~~bs~~ hello](https://fossengineer.com/no-hello-is-not-enough/), [vague work](https://fossengineer.com/turning-vague-work-into-clear-next-actions/), accountability laundring, weaponized incompetence, underf...

...Pardon my French, I meant:

- “weaponized incompetence” -> “repeat low-context dependency requests” 
- “cover my ass” -> “maintain an evidence trail”
- “under-filtering manager” -> “unfiltered upstream directive”
- “take off the mask” -> “raise process issues explicitly”

Yep, i apply and got [my information and workflows](https://github.com/JAlcocerT/my-logseq-notes/tree/main/daily-frameworks) in place: *goes pretty handy together with skills `C:/Users/.../.codex/skills/weekly-work-summarizer/references/templates.md`*

```mermaid
flowchart TD
    Start([Ambiguous work situation]) --> Diagnose{What kind of pattern is this?}

    Diagnose -->|Unclear owner, vague handoff, meeting drift| Accountability[accountability-framework.md]
    Diagnose -->|Busy updates, low verified output| LoudLabor[loud-laboring-framework.md]
    Diagnose -->|Need stakeholder movement| Communication[communication.md]

    Accountability --> Pattern[Name the pattern]
    LoudLabor --> Pattern

    Pattern --> NextState{What next state is needed?}
    Communication --> NextState

    NextState -->|Facts / root cause| DFIR[DFIR / TRACE]
    NextState -->|Ownership transfer| PASS[PASS]
    NextState -->|Owners, status, triggers| COAST[COAST]
    NextState -->|Decision between options| ADAPT[ADAPT]
    NextState -->|Fast response / unblock| DRIVE[DRIVE]

    DFIR --> Script[accountability-response-playbook.md]
    PASS --> Script
    COAST --> Script
    ADAPT --> Script
    DRIVE --> Script

    Script --> Send[Send work-safe message]
    Send --> Evidence[accountability-daily-template.md]
    Evidence --> Weekly[Weekly proof: delivered, unblocked, decisions, risks, ownership]
```

> Turn vague work [into clear next actions](https://fossengineer.com/turning-vague-work-into-clear-next-actions/), with [such communication framework](https://fossengineer.com/stakeholder-communication-framework/) and [accountability playbook](https://fossengineer.com/accountability-communication-playbook/)

### HomeLab Updates 0926

I was trying lately technitium for **custom DNS at Omarchy**:

![alt text](/blog_img/selfh/technitium-sqlite.png)

<!-- 
https://www.youtube.com/watch?v=62crffG6Uw8 -->

{{< youtube "62crffG6Uw8" >}}

Beyond herdr, these CLIs have been helpful:

```sh
#herdr
docker port jellyfin
```

I made **DHCP reservations** at my home CM so that `192.168.1.2` is the x300 and `192.168.1.18` the pi4 with hermes.

Useful CLI tools were:

- ip addr — found your computer’s LAN address/subnet.
- ip route — identified the router and 192.168.1.0/24 network.
- ping — discovered active devices and inspected TTL.
- ip neigh — showed IP-to-MAC mappings (the key discovery tool).
- nc (netcat) — checked ports and read the SSH banner.
- getent hosts — attempted hostname/reverse-DNS lookup.
- curl — inspected the router page and checked MAC-vendor data.

The decisive commands were:

```sh
ip neigh show dev wlan0
ping -c 1 192.168.1.18
nc -zv 192.168.1.18 22
nc 192.168.1.18 22
#nmap or arp-scan would also be ideal, but neither was installed.
```

> [ncdu](https://fossengineer.com/ncdu-terminal-disk-usage-analyzer/) has been very useful to check disk space

I was getting connectivity troubles while testing `iwd`, for which I had to connect via ethernet to resolve as i lost wifi connection:

1. How Ubuntu’s Wi-Fi Architecture Fits Together

Linux networking works in layers, and understanding which tool operates at which layer explains why things broke:

```
[ Frontends / CLIs / UIs ]  -->  nmcli / nmtui, Impala, GNOME Wi-Fi Settings
                                          |
[ Network Daemon ]          -->  NetworkManager (orchestrates connections, DNS, DHCP)
                                          |
[ Wireless Backend ]        -->  wpa_supplicant (Ubuntu default)  OR  iwd (Impala default)
                                          |
[ Kernel & Hardware ]       -->  cfg80211, mac80211, Wi-Fi driver, network card (wlan0)

```


2. Root Cause: Why Installing Impala Broke the Internet

* **Device Lockout:** Only **one** wireless daemon can control the hardware radio interface at a time.
* **Backend Conflict:** Impala installs and relies on `iwd`. When `iwd` starts, it claims exclusive control of the Wi-Fi card (e.g., `wlan0`).
* **Silent Failure:** NetworkManager defaults to expecting `wpa_supplicant`. When `iwd` takes the card without NetworkManager being explicitly configured to talk to `iwd` as its backend, NetworkManager suddenly marks the Wi-Fi device as **unmanaged** or **unavailable**, severing all active connections.

3. The CLI Landscape (Which Tool Does What)

| Command | Role | Layer | Best Used For |
| --- | --- | --- | --- |
| **`nmcli`** | NetworkManager CLI | Manager | Ubuntu's default tool for scanning, connecting, and viewing network device states. |
| **`nmtui`** | NetworkManager Text UI | Manager | Interactive terminal GUI with arrow-key navigation for those who dislike flag syntax. |
| **`iwctl`** | iwd CLI | Backend | Managing Wi-Fi when using `iwd` or Impala (powering adapters on/off, manual scans). |
| **`wpa_cli`** | wpa_supplicant CLI | Backend | Interacting directly with the standard legacy Wi-Fi authentication daemon. |
| **`ip`** | iproute2 suite | Kernel / Low-Level | Checking raw interface status (`ip link`) and assigned IP addresses (`ip a`). |
| **`iw`** | nl80211 CLI | Kernel / Wireless | Low-level wireless device queries directly via the Linux wireless subsystem. |
| **`systemctl`** | systemd service manager | Init / Services | Starting, stopping, enabling, disabling, and masking/unmasking background daemons. |

4. Step-by-Step Restoration Logic

Fixing this problem requires a strict sequence of state changes:

1. **Stop & release the hardware:** Stop and disable `iwd` so it releases its lock on the Wi-Fi card (`sudo systemctl stop iwd && sudo systemctl disable iwd`).
2. **Clear configuration overrides:** Remove drop-in configuration files under `/etc/NetworkManager/conf.d/` that force `wifi.backend=iwd`.
3. **Restore default packages:** Reinstall `wpasupplicant` and `network-manager` if any dependencies were stripped during Impala's installation.
4. **Restart core services:** Unmask and start `wpa_supplicant` first, then restart `NetworkManager` so it detects the restored backend and claims the Wi-Fi card cleanly.
5. **Reconnect:** Bring the interface up and re-associate via `nmcli device wifi connect ...`.

### Architect or Principal

Just in case you are preparing for a promo / [outside CV](https://jalcocert.github.io/JAlcocerT/selfhosting-data-analytics/#when-was-the-last-time-you-applied) or how to frame what you do for prospects.

Currently i observe a huge gap between expectations: *people billing 1k/person/day for adding one line to a csv*

Versus: *the cost per task being literally smashed with every new model released (to cents of a $)*

How long will that gap / arbitrage possibility last?

Looking for a way to elevate yourself from the how, upstream to the what's and why's?

{{% details title="If you are an IC, you might consider" closed="true" %}}

* **The Architect** spends a lot of time in cross-functional stakeholder meetings, drawing system diagrams, analyzing vendor tech, and ensuring the business goals match the technology stack. In many companies, architects rarely touch production code anymore.

* **The Principal Engineer** is usually the **highest-ranking technical hands-on expert** in the room. They design systems too, but they are also expected to build the foundational architecture, debug the most ambiguous, critical outages, and optimize engineering processes.

The easiest way to understand the difference is **scope of execution vs. scope of design**:

+------------------------------------+------------------------------------+
| Software Architect                 | Principal Engineer                 |
+------------------------------------+------------------------------------+
| Focuses on the "Blueprint."        | Focuses on the "Execution & Truth."|
| Works with product and business to | Goes deep into complex systems,    |
| map out *what* to build and how    | enforces standards, and writes core|
| systems interact broadly.          | code/infrastructure.               |
+------------------------------------+------------------------------------+

1. You Own the "Infrastructure of Rules"

As a Principal, you are responsible for defining team standards and dev velocity. 

This means you have the organizational power to unilaterally destroy accountability laundering and useless meetings.

You can literally write a policy that says: *"No sync calls without a written ticket and log,"* and because you are the Principal, it becomes law.

2. Built-In "Deep Work" Shielding

Principals are expected to tackle complex, ambiguous engineering problems.

Everyone expects you to be offline, heads-down, and writing architecture code or documentation for blocks of 4 to 6 hours at a time. 

Nobody questions why your Slack status is "Away" or "Focusing"—they just assume you are solving a high-level problem.

3. High Leverage, Low Meeting Density

Architects get pulled into endless discovery calls with product managers and clients to figure out "what is possible."

Managers get pulled into HR drama.

Principals are insulated from most of that. 

Your value comes from your output, your technical direction, and the documentation (like your wikis) that you build to make the rest of the team self-sufficient.

{{% /details %}}

**So ask honestly**: do you want *status, control, income, or optionality*? 

They are NOT the same game.

> What are you **optimizing for** next?

---

## FAQ

### Useful CLI Tools

Coming from [here](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#homelab-commands)

Ive lately found useful:

```sh
herdr #codex --yolo
```

### Selfhosted Forgejo

I got this ready in my x300 [some time ago to tinker with agents](https://jalcocert.github.io/JAlcocerT/poc-107/):

Having termix ready `http://192.168.1.2:8090/` and Forgejo `http://192.168.1.2:3034/`

```sh
docker ps -a --filter "name=forgejo"
```

The syncing setup to github so that each forgejo repo has a [gh backup in a branch](https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/):

```sh
gh status
```

In this case, what i want is to do: GH <-> Forgejo for [my daily notes](https://github.com/JAlcocerT/my-logseq-notes)

```sh
cd ./Home-Lab/forgejo
make migrate-repo REPO_OWNER=JAlcocerT REPO_NAME=my-logseq-notes #makes a mirror of gh
#make sync-repo REPO_OWNER=JAlcocerT REPO_NAME=my-logseq-notes
```

If you want to expose this:

```sh
docker inspect forgejo --format '{{range $name, $_ := .NetworkSettings.Networks}}{{println $name}}{{end}}'
#docker network connect cloudflared_tunnel forgejo
```

Check that `forgejo:3000` ready:

```sh
#dig fossengineer.com any
```

### Selfhosted Communication

Communication within your team is the information flow and you can also do it with OSS:

1. [Simplex](https://fossengineer.com/selfhosting-simplex-chat/) with `https://github.com/simplex-chat/simplex-chat/releases/tag/v7.0.0`

2. Matrix: with the flavour [conduit](https://fossengineer.com/selfhosting-matrix-conduit-server-with-docker/) or [synapse](https://fossengineer.com/selfhosting-matrix-synapse-docker/)

3. [Fluxer](https://fossengineer.com/selfhosting-fluxer-open-chat-voip/)

### Selfhosted Media

qbit and prowlarr at `6011` and `9696`.

```sh
sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d qbittorrent prowlarr
```

yt-distil: `http://192.168.1.2:8001`

#### Kodi vs Jellyfin

with kodi adons

* <https://www.youtube.com/@proyectosmicropic/videos>

You can have [a look to IPTVs](https://forocoches.com/foro/showthread.php?t=10742800) as seen [here](https://jalcocert.github.io/JAlcocerT/selfhosting-media/#iptv)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin Media Server Tools 🐋 ↗" >}}
{{< /cards >}}

#### Music

Navidrome, subsonic or [gonic](https://github.com/sentriz/gonic) are OSS **selfhostable music servers**.

You need clients:

1. https://github.com/Fingel/gelly

> A native music client for Jellyfin and Navidrome/Subsonic

2.  Sonixd

```sh
winget install sonixd
```

3. Supersonic

![Gonic music server](/blog_img/selfh/HomeLab/gonic.png)

4. [Ultrasonic](https://gitlab.com/ultrasonic/ultrasonic) or [tempus](https://github.com/eddyizm/tempus) worked great as android client and you have them at fdroid or obtenium


5. With [supersonic](https://github.com/supersonic-app/supersonic)  or [sublime](https://github.com/sublime-music/sublime-music) (desktop) you can connect to subsonic or jellyfin servers

![NaviDrome UI](/blog_img/selfh/HomeLab/navidrome.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gonic" title="Gonic | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/navidrome" title="Navidrome Media Server Tools 🐋 ↗" >}}
{{< /cards >}}

#### PDFs

Discovering [Kreuzberg](https://github.com/Goldziher/kreuzberg) some [time back](https://jalcocert.github.io/JAlcocerT/jira-data-model-with-ai) was great, just now that its now at: https://github.com/kreuzberg-dev/kreuzberg-lts?tab=contributing-ov-file

And new development will be: https://github.com/xberg-io/xberg

```sh
#uv add kreuzberg

foreach ($f in Get-ChildItem *.pdf) {
    uvx kreuzberg extract "$f" > "$($f.BaseName).txt"
}
#curl -X POST -F "file=@Ebook-cover-SSGs.pdf" http://192.168.1.2:8027/extract > sample-pdf-to-text.txt
```


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/stirling-pdf/" title="Stirling-pdf | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kreuzberg" title="Kreuzberg | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### How Im using AI to prep for ULM/PPL

* https://github.com/anthropics/claude-cookbooks

* As i prepare for the exam, made this webapp: `https://ulm-ppl-test.pages.dev/`

From `./poc/ulm-ppl`with some books distilled.

### Omarchy

Some more [omarchy](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-december-2025/#omarchy)

* `https://omarchy.org/`
* `https://tryomarchy.com/`

The name **Omarchy** is a portmanteau of **"Omakase"** and **"Arch"**:

* **Omakase (お任せ):** A Japanese dining concept meaning "I leave it up to you". In an omakase meal, you don't order individual items; the chef curates and prepares the entire progression of dishes based on what is best.
* **Arch:** Refers to **Arch Linux**, the lightweight, rolling-release distribution that forms the base of the operating system.

This brings docker, lazydocker, herdrd, lazygit installed by default :)

Run this to lower the VM to 4 GB RAM and 2 CPUs: *You can get started using 1.2GB of RAM and I could tinker with <4GB*

```sh
virsh --connect qemu:///session shutdown omarchy-4.0.1 2>/dev/null || true

virsh --connect qemu:///session setmaxmem omarchy-4.0.1 4096M --config
virsh --connect qemu:///session setmem omarchy-4.0.1 4096M --config
virsh --connect qemu:///session setvcpus omarchy-4.0.1 2 --config

virsh --connect qemu:///session start omarchy-4.0.1
gnome-boxes
```

If Boxes still acts weird, open the same running VM with:

```sh
virt-viewer --connect qemu:///session --attach omarchy-4.0.1
```

I send some goodies via:

```sh
  ssh -p 2022 dhh@127.0.0.1 \
    'umask 077; mkdir -p ~/Desktop; cat > ~/Desktop/.env; stat -c "%a %s %n" ~/Desktop/.env' \
    < /home/jalcocert/Desktop/JAlcocerT/.env
#  cat ~/Desktop/.env | grep '^OPENAI_API_KEY='
```

Now just add whatever programs you use beyond the browser:

```sh
omarchy pkg add bitwarden gram proton-vpn-gtk-app #this flows from pacman repos, not AUR :)
yay -S helium-browser-bin #alternative chromium based
omarchy pkg add arduino-cli blender freecad
omarhcy install service tailscale
#omarchy bar position bottom #modifies the omarchy/shell.json
```

You can also connect your airpods [via plugins](https://plugins.omarchy.org/explore.html): https://github.com/thisisgm/omarchy-pods

* https://github.com/tharinfernando/omarchy-protonvpn
* https://github.com/patcastle/omarchy-battery-health
* https://plugins.omarchy.org/plugin.html?id=io.github.aryan-techie.bluetooth
* https://plugins.omarchy.org/plugin.html?id=io.github.heyimhere.hardware-panel


```sh
scp -P 2022 dhh@127.0.0.1:/home/dhh/Downloads/wiki-technitium.md /home/jalcocert/Desktop/
```