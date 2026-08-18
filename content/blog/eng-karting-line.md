---
title: "Optimal Karting Line"
date: 2026-08-12
draft: false
tags: ["Racing x PWA GPS Overlay","Nürburgring x SPA","Proton CLI","OSS Photo stack"]
description: 'Go-Pro Telemetry gone wild wia a PWA.'
url: 'optimal-karting-line'
---

**TL;DR**


**Intro**


* WHY Im writting this post: *Want to share with my friends my refreshed gopro telemetry setup*
* What [Ive learnt](#conclusions) with it: *Ive ended up making my first [PWA around ffmpeg](#pwa---gopro-telemetry-extractor)*

Coming from [here](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/) and [here](https://jalcocert.github.io/JAlcocerT/reinforce-learning-racing-simulator/#conclusions)

The GD was the one that [worked best so far](https://jalcocert.github.io/JAlcocerT/kart-optimum-path/#the-results)

## Go Pro Telemetry Overlay

Tinker around your [gopro gps telemetry](https://jalcocert.github.io/JAlcocerT/geo-data-analytics/) and the **Spa and Nurburgring** circuits:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker" title="Py Route Tracker ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/optimum-path" title="Optimum Path | Github ↗" icon="github" >}}
{{< /cards >}}

```sh
git clone https://github.com/JAlcocerT/optimum-path
cd ./optimum-path/overlay
```

For a quick check before rendering video:

```sh
uv run python gopro_h13_hud_fastlap.py \
  --config ../configs/GX010021_spa.json \
  --yes \
  --png 5
```

when happy, just:

```sh
uv run python gopro_h13_hud_fastlap.py \
    --config ../configs/GX010021_spa.json \
    --yes \
    --embed
```

<!-- https://youtu.be/CPR7IV0UaBw -->

{{< youtube "CPR7IV0UaBw" >}}


### Spa

With the VW Golf:

```sh
uv run python gopro_h9_racing_hud.py --config ../configs/GH010437_GH020437_spa_francorchamps.json --yes --embed
```

<!-- 
https://youtu.be/hqBfgEptcJs 
-->

{{< youtube "hqBfgEptcJs" >}}


With the laguna mk2:

```sh
make -C /home/jalcocert/Desktop/optimum-path spa-francorchamps-hud
```

{{< youtube "VDa-78bc-dk" >}}

<!-- 
https://youtu.be/VDa-78bc-dk 
-->

Yep, sth was terribly wrong with the GPS here...

This is a great reason to finally get a separated GPS module for my FPVs and other experiments


{{< youtube "v1I5b4-JE00" >}}



#### Karting and Theoretical Optimum Path


| Method | Result | Status | Notes |
|---|---:|---|---|
| Real best lap from GoPro/HUD | `61.27s` | valid reference | From generated HUD output `flying_lap_61.27s.mp4`. |
| GPS best lap used for track generation | `61.20s` | valid reference | From raw Hero 13 GPS rows after DOP filtering. |
| Centerline theoretical | `59.71s` | valid model result | Point-mass velocity model on generated Spa centerline. |
| Gradient/SLSQP racing line | `59.25s` | valid model result | Direct lap-time optimizer, same vehicle parameters. |
| Minimum-curvature path + velocity profile | `60.68s` | valid model result | Optimizes smoothness first, then computes speed profile. |
| GA direct-control quick run | `1001.80s` | DNF / invalid comparison | Quick 24-pop, 8-generation pass did not complete a lap. |
| RL/PPO evaluation | n/a | not run | `stable_baselines3` is not installed locally; existing model was trained on a different track. |

<!-- 
https://youtu.be/qeWhYHjU6X8
 -->

{{< youtube "qeWhYHjU6X8" >}}

For gradient-descent artifacts and the driver-action/circuit-position video:

```sh
make spa-gd-all

#Or step by step:

make spa-track
make spa-gd
make spa-gd-video
```

<!-- 
https://www.youtube.com/watch?v=v1I5b4-JE00&t=9s 
-->

{{< youtube "v1I5b4-JE00" >}}


> Where are these videos from? An [European roadtrip](#tools-and-tech-for-trips)!


{{< details title="What I learnt prior to this about real vs simulated results 📌" closed="true" >}}

Under the honest κ-fix physics, the real driver is 3.35 s faster than the model says is theoretically possible. 

The exact numbers:

- Real fastest lap (GX020010 lap 2): 78.20 s  
- κ-fix N=400 honest theoretical optimum: 81.55 s
- Gap: −3.35 s (real beats the calibrated model)

That doesn't mean the driver is magically beating physics — it means the model is under-stating what the kart can actually do. Two consistent stories from today's analyses:

1. The driver is faster in both corners and straights, but more on straights:    

- corners: −1.08 s (driver gains 1.1 s net)

- straights: −2.26 s (driver gains 2.3 s)
- total: −3.35 s

2. The sensitivity sweep says the model's max_lateral_g = 0.95 is the most sensitive parameter at −27.5 s/g. Bumping it to 1.07 g (+12%) would bring the sim down to ~78 s and match your fast lap. That's a believable  correction: the calibrated 0.95 g came from yaw-rate-κ-based lap-time matching, which slightly under-counts true peaks. The sustained-vs-transient-peak distinction is exactly what Phase 4's load-transfer model would
capture.

3. The pro's 75 s sits another ~3 s below your 78.20, which the sensitivity sweep says needs another +0.12 g of lateral — total 1.19 g. That's high-but-plausible for harder/fresher tires (the pro likely had different  equipment too).

So the honest, today-as-of-now reading is:

he calibrated point-mass model is slightly conservative — about 1.07 g of "true effective" lateral grip vs. the 0.95 g it has calibrated. 

Once Phase 4's bicycle model captures the transient grip from load transfer, the gap to your real laps should close (and possibly close further toward the pro). 

The driver isn't superhuman; the model is leaving 3 s on the table because it can't represent trail-braking and load transfer.


{{< /details >}}

> Real-beats-sim by 3 s, mostly explainable by transient grip the ellipse can't represent is exactly what richer dynamics should fix, [tinkered here](https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/optimum-path).

### Nurburgring

The kind of track day that you wouldnt miss with your friends for anything in the world

With the VW Golf:

{{< youtube "v1I5b4-JE00" >}}

With the laguna mk2:

#### Nurburgring World Record

And what do i get by adding the car parameters to my model?


#### Golf vs Laguna Fast Lap Comparison


---

## Conclusions

Despite not having gps in my action cam...

I had a lot of fun in this circuit :)

{{< youtube "orzYl6u35ec" >}}

<!-- https://youtu.be/orzYl6u35ec -->




### PWA - GoPro telemetry extractor

Not enough with the [ulm/ppl exam prep](https://ulm-ppl-test.pages.dev/) to get traffic at jalcocretech?

here is sth more: https://gopro-telemetry-overlay.pages.dev

```sh
cd ./optimum-path/overlay-pwa
make dev #make deploy
# npm cache clean --force

#npx wrangler pages deployment list 
#npx wrangler pages deploy dist

npx wrangler pages deploy dist --project-name=gopro-telemetry-overlay
```

<!-- https://youtu.be/1l7Q3Ul4Yh0 -->

{{< youtube "1l7Q3Ul4Yh0" >}}


{{< filetree/container >}}
  {{< filetree/folder name="config" >}}
    {{< filetree/file name="acme.json" >}}
    {{< filetree/file name="config.yml - Automatically created" >}}
    {{< filetree/file name="traefik.yml" >}}
    {{< /filetree/folder >}}
  {{< filetree/file name="docker-compose.x300.yaml" >}}
  {{< filetree/file name=".env" >}}
  {{< filetree/file name="cf-token" >}}
{{< /filetree/container >}}


---

## FAQ

### Linux 101

Download an [OS like **ZorinOS**](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-sept-2025/#which-linux-to-get-started) to get started.

#### Files Sync

1. Nextcloud: a personal cloud, one of the first setups for any homelab and working perfectly in Linux. Now with a [native linux desktop client](https://fossengineer.com/nextcloud-native-client/).

2. [Proton CLI](https://proton.me/support/drive-cli): finally arrived!

Download https://proton.me/download/drive/cli/index.html

```sh
https://proton.me/download/drive/cli/index.html

  cd /home/jalcocert/Downloads
  chmod +x proton-drive
  install -m 0755 proton-drive "$HOME/.local/bin/proton-drive"

```

You will auth with a link and get https://account.proton.me/auth-desktop

```sh
proton-drive auth login
proton-drive filesystem list /
proton-drive filesystem list /my-files
```

 To upload one local file with the Proton Drive CLI:

  proton-drive auth login
  proton-drive filesystem upload /path/to/local-file "/destination/folder"

  Example, uploading ~/Downloads/report.pdf to the root of Proton Drive:

  proton-drive filesystem upload ~/Downloads/report.pdf "/"

  To see folders first:

  proton-drive filesystem list "/"

  To create a folder:

  proton-drive filesystem create-folder "/" "Uploads"
  proton-drive filesystem upload ~/Downloads/report.pdf "/Uploads"

```sh
proton-drive filesystem upload ~/Desktop/DJI_20260726095445_0040_D.MP4 /my-files/Oa5Pro-Rysy
```

3. Rsync

4. You can play your own music and videos via: jellyfin and ultrasonic in android / ios / [supersonic](https://github.com/supersonic-app/supersonic/releases) or [sonixd](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-oct-2025/#more-stuff-lately) (connects to subsonic or jellyfin) for desktop

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gonic" title="Gonic | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin Media Server Tools 🐋 ↗" >}}
{{< /cards >}}

```sh
winget install sonixd
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/qbittorrent" title="QBittorrent Docker Config 🐋 ↗" >}}
{{< /cards >}}

#### OSS Photo Video

For photo:

1. Upscayl
2. [RawTherapee](https://github.com/RawTherapee/RawTherapee)

For video I tend to get away with ffmpeg

If you need more:

1. KDEnlive
2. OBSStudio for recording
3. Openshot

#### Gaming

You should be good with [gaming via Steam in Linux](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#thoughts-on-steamos-and-os-for-nas) for most games.

Just be careful with online ones as some anticheats dont work outofthebox.

I also [tested SteamOS](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-december-2025/#gaming-and-linux) via a VM with [gnome boxes](https://jalcocert.github.io/JAlcocerT/testing-nix-os/#getting-started-with-nixos):


Download the ~3gb and:

```sh
#flatpak install flathub org.gnome.Boxes
```



### Tools and Tech for Trips

[Tech for a trip](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/), like a [travel router with VPN](https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/) and some interesting 

1. https://github.com/spliit-app/spliit

2. A trip planner like [this](https://github.com/JAlcocerT/Py_Trip_Planner/tree/main/poc-trip-planner-v4) https://trip-planner-9lt.pages.dev/?sid=07621&lat=43.1833&lon=0&name=Tarbes+Ossun+Lourdes&country=FR

```sh
cd ./poc/z-poc-trip-planner-adk # cd ../z-poc-trip-planner-v4
make compose #http://192.168.1.2:3021
```

```sh
cd ./poc/z-poc-trip-planner-mama
#docker compose -f docker-compose.prod.yml up --build #3022
docker compose -f docker-compose.prod.yml up --build -d # http://trip-planner-web:3000
```

![trip planner with weather time zone and costs](/blog_img/data-experiments/trip-planner-tz.png)

3. https://github.com/itskovacs/trip/releases/tag/1.47.0

### My fav PWAs

[Spliit](https://spliit.app/), and a [quick pwa poc](https://github.com/JAlcocerT/poc/tree/main/pwa-spliit-analyzer) i created around it

```sh
cd ./poc/pwa-spliit-analyzer
C:\Python312\python.exe -m http.server 5173 --bind 127.0.0.1
```


[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/spliit_analyzer.ipynb)

Some, like https://app.files.md/ allow you to interact with your local files!

Or with your fpv/drones hardware: `https://app.betaflight.com/#`