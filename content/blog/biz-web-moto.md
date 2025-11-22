---
title: "A website for a Moto Blogger!"
date: 2025-02-23T19:20:21+01:00
draft: false
tags: ["Dev","Chocolatey","SSG","FFMPEG"]
description: 'Creating a website for a moto blogger. Or how to make two websites during a morning.'
url: 'web-for-moto-blogger'
---

Today I have managed to help **two friends** to get their own website up and running.

{{< cards cols="2" >}}
  {{< card link="#conclusions" title="This one, the moto vlog one" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/" title="The PDH website, revisited | Post ↗" >}}
{{< /cards >}}

## Moto Blogger Setup

A friend wanted to have the following **Astro theme**:

The **theme** - https://github.com/Boston343/horizon

* https://github.com/JAlcocerT/horizon
* https://github.com/JAlcocerT/ProyectoYosu

As always, when trying a new astro theme, we just need to:

1. Clone the theme:

```sh
git clone https://github.com/WhitePaper233/yukina
```

You can also fork it to your github and sync your edits in there.

> Make sure about the license of the theme before moving forward: MIT, GNU, Apache...are good starting points.

2. Install the dependencies:

```sh
npm install
```

3. Test how it feels

This will allow you to see the changes live:

```sh
#npm run dev
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/ #useful to see from your phone how it looks
```

> With the second command, you will be able to see how the website looks from your phone, if its connected to the same wifi as your laptop

This is required to check that its all ready for static hosting:

```sh
#npm run build
```

The horizon theme, which initially seems oriented to [weddings](https://jalcocert.github.io/JAlcocerT/software-for-weddings/), can be **fully photo centered**:


> Original (and fantastic) job was done by https://github.com/Boston343/horizon and released under GPL3.0

There was a **Windows Web-Dev setup** in between, so...

...the setup took just a little bit more clicks than in linux:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101 Setup for Linux">}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101 Setup" >}}
{{< /cards >}}

1. Install node and npm ([nodejs.org](https://nodejs.org/en) and [docs.npmjs.org](https://docs.npmjs.org/))

```sh
node --version
npm --v
```

2. Install git and vscode

3. Install **firebase CLI** - in windows that means pasting the `.exe` to the repo folder and adding it as gitignore to avoid pushing it to the repo

4. Install npm firebase package to configure the hosting


{{< details title="Google Firebase | Setup for Static Site Hosting 📌" closed="true" >}}

Using **Firebase Free Tier Hosting**

```sh
#npm install -g firebase-tools

firebase login
firebase init
#firebase projects:list
```

> As seen during [this project](https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/)

![Firebase Free Tier Limits](/blog_img/web/success5-aga/FirebaseHosting-FreeTier-Limits.png)

And to have the a **custom domain linked**...

Went to [firebase UI](https://console.firebase.google.com/) -> Compilation -> hosting.

Add a custom domain *,if you have one*.

Select my subdomain, and added a **CName + TXT record to the DNS**.

![Firebase Custom Domain](/blog_img/web/success5-aga/firebase-own-domain.png)

For that domain, Im using cloudflare - so made sure that its **DNS only and not proxied records**

{{< /details >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Domains" image="/blog_img/web/porkbun.png" subtitle="Get a domain first!" >}}
{{< /cards >}}


{{< callout type="info" >}}
Alternatively, do the [**Web-Dev setup** for Astro at Windows with Chocolatey](#chocolatey-setup-for-astro)
{{< /callout >}}


5. Do the one time Firebase Project setup: `.\firebase init`

**Why firebase and not cloudflare?**

Just using Google account was enough after accepting firebase T&C's.

![FirebaseAuth to Deploy Static Pages](/blog_img/web/Firebase/firebase-auth.png)

![Firebase Deploy from GHA](/blog_img/web/Firebase/firebasedeploy-gha.png)

![Firebase GHA Auth](/blog_img/web/Firebase/firebase-gha-auth.png)

At this point, we have **authorized firebase CLI**:

![Firebase GHA Authentication](/blog_img/web/Firebase/firebase-gha-auth2.png)


And...thats all the one time things/setup required to get your website.

## Conclusions

We just created a free website with Firebase and Astro SSG!

Isnt it like 1M times better looking than such webs (that are making money): https://unamoteracualquiera.com/

**In a nutshell,** from now on, just these **3 commands** are enough, as the setup is completed:

```sh
npm run dev #to see locally the changes live, as you tweak your website
npm run build #To render the site to /dist

#optional
#npm install -g serve
#serve -s dist #See locally the built website
```

Deploy to firebase: *for example, to proyectorutasmoto.web.app*
 
```sh
#As all the files are ready, we just upload them to firebase free static hosting
firebase deploy #to push dist to proyectorutasmoto.web.app
```

When the firebase deploy command is executed, we are sending the built static files of our website, to firebase free static hosting!

> There you go, your public website with a free firebase subdomain: https://proyectorutasmoto.web.app/

**Next steps** - To link a **custom domain** (optional) and to not forget to sync it to github for a free code backup!

<!-- 
https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/

![HUGO Theme Gallery Carbon](/blog_img/web/success5-aga/photogallery-hugo-whilecyclingthere-carbon.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/" title="SSGs are Crazy Efficient" image="/blog_img/web/success5-aga/photogallery-hugo-whilecyclingthere-carbon.png" subtitle="See how this other HUGO Gallery Project was delivered" method="Resize" options="600x q80 webp" >}}
{{< /cards >}}

To make the user experience better when starting with SSGs and markdown:

1. Add **FrontMatter CMS** support
  * https://frontmatter.codes/ -  A CMS that works seamlessly with any static site generator 
      * https://github.com/estruyf/vscode-front-matter

> Front Matter is a CMS running straight in Visual Studio Code.

Can be used with static site generators like Hugo, Jekyll, Hexo, NextJs, Gatsby, and many more... 

2. Add the vscode [MDX extension](https://marketplace.windsurf.com/vscode/item?itemName=unifiedjs.vscode-mdx)

---

## Outro

I encouraged this *client* to also do somethign with his **awsome action camera video content**.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="Some video tricks" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#video-workflow" title="Video Edition Post" icon="book-open" >}}
{{< /cards >}}

### Chocolatey and FFMPeg

You can **install ffmpeg** without [chocolatey](https://jalcocert.github.io/JAlcocerT/how-to-use-chocolatey-windows/).

But thats *'en plan pringao'*.

I prefer to leverage chocolatey: https://community.chocolatey.org/packages

So that programs will get installed programatically (instead of downloading `.exe`, executing and clicking next few times).

{{< callout type="info" >}}
If you have ffmpeg installed already, jump [here](#ffmpeg-video-workflow-for-windows)
{{< /callout >}}

With **[Chocolatey](https://jalcocert.github.io/JAlcocerT/how-to-use-chocolatey-windows/) as package manager** you just need to use these 4 commands to get **ffmpeg ready**.

Open powershel *as administrator* and copy paste these (one by one):

```sh
# Install Chocolatey (Run as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest -UseBasicParsing 'https://community.chocolatey.org/install.ps1' | Invoke-Expression

# Verify Chocolatey Installation
choco --version

# Install FFmpeg (Run as Administrator)
choco install ffmpeg -y
#choco install chocolateygui #optionally, install a UI to install other packages with GUI

# Verify FFmpeg Installation
ffmpeg -version #I got the version 7.1-essentials_build
```

If you are here already, you are **ready to join videos** with ffmpeg!

### FFmpeg Video Workflow for Windows

This is how I prepare simple videos **avoiding repetitive edition**.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11" title="FFMpeg and Windows GH Reference" >}}
{{< /cards >}}

Within *POWERSHELL as admin*, do:

**Copy the files** with CLI (optional) - I like to use such command to do it with CLI, but you can drag and drop:

```sh
Copy-Item -Path "E:\DCIM\DJI_001\*.MP4" -Destination "C:\Users\Escritorio\cadiz" -Force
#Robocopy "E:\DCIM\DJI_001" "C:\Users\j--e-\OneDrive\Escritorio\cadiz" *.MP4 /MT:8 /R:3 /W:2 /ETA /TEE /LOG+:copy_log.txt
```
1. Place all the videos you want to join into a folder, and place the powershell session on that folder:

```sh
cd C:\Users\Escritorio\cadiz #this is a sample folder on my desktop
```

2. Create the **`.txt` list**: this will create a file with all the mp4 that will be joined

```sh
Get-ChildItem -Filter "*.MP4" | ForEach-Object { "file '$($_.Name)'" } | Set-Content file_list.txt
```

> You can review that all the mp4 are considered once generated

3. Last step: Just **use ffmpeg** to join all the files accordingly. You have few alternatives:

* Just join them (keeping the original audio) - *This is the one uncommented* 
  * You can trim this output between two given time (in seconds)
* Join them but silence the audio
* Place music on top of the silenced combined video

```sh
#1)
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output.mp4 #simple join
#ffmpeg -ss 120 -to 900 -i output.mp4 -c copy trimmed_output.mp4 #trim and take only between 120s and 900s

#2) Silenced video
#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4 #silenced video

#3) 🎵 Music by
#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4 #silenced video
#ffmpeg -stream_loop -1 -i "TRAVELATOR - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp 
```

> Every time you do this for ~20min GOPro 4K videos, you are saving ~3h, which at ~65W *as of today ~0.05$*

Optionally, you can **extract the mp3 audio** of your joined video, edit it with [Audacity](https://github.com/audacity/audacity) and place it back as in step 3:

```sh
ffmpeg -i output.mp4 -vn output.mp3
```

#### Automatic Video Chapters

Dont forget to add **chapters to your video description**:

```sh
$files = Get-ChildItem -Filter "*.MP4" | Sort-Object Name; $currentTime = 0; function Format-Time ($seconds) { [TimeSpan]::FromSeconds($seconds).ToString("g") }; $files | ForEach-Object { $formattedTime = Format-Time $currentTime; try { $duration = (ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$($_.FullName)") -as [double] } catch { Write-Warning "ffprobe failed for $($_.Name).  Assuming 0 seconds."; $duration = 0 }; $currentTime += $duration; "$formattedTime $($_.Name)" } | Set-Content file_list.txt
```

#### About HEVC Format

**HEVC** (High Efficiency Video Coding), also known as **H.265**, is a video compression standard. 

To play HEVC videos, your system needs the appropriate codecs in Windows.

{{< callout type="info" >}}
I have created a [**script** to automatically](https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/FFMpeg/Video_ffmpeg_w.sh) copy `.mp4` from the Camera to the PC and prepare the output
{{< /callout >}}

> Still, imo it performs better in Linux! 

---

## FAQ

### Chocolatey Setup for Astro

Astro [QUICK] web development setup for windows

{{< details title="Node NPM and VSCode with Chocolatey 📌" closed="true" >}}

1. Open **Powershel as administrator**

2. Copy paste these (one by one):

```sh
# Install Chocolatey (Run as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest -UseBasicParsing 'https://community.chocolatey.org/install.ps1' | Invoke-Expression

# Verify Chocolatey Installation
choco --version

choco install nodejs-lts -y
#choco install nodejs -y
```

{{< callout type="info" >}}
Remember to restart vscode to see the new installation
{{< /callout >}}

3. Close Powershell and Open it again. See that both, **npm and node are now installed**:

```sh
node -v
npm -v
```

4. Optionally, install vscode:

```sh
choco install vscode -y
```

{{< /details >}}

> For additional installs with Chocolatey, see [this **gist**](https://gist.github.com/JAlcocerT/76f22ddf886277ef2653f82898c634d8) and packages [here](https://community.chocolatey.org/packages/rpi-imager)

---

### Other Interesting Tools for Astro

* Maps ✅
    * https://github.com/roblabs/maps-withastro ✅
        * Leaflet + OSM ✅
        * MapLibre ✅ - https://github.com/roblabs/maps-withastro/blob/main/src/MapLibre.astro
            * An open source **visual editor** for the '**MapLibre Style** Specification'  - https://github.com/maplibre/maputnik
      * komoot embed OK

* Adding interactive globe with the countries you have visited
    * From [astro bento portfolio](https://github.com/IoTechCrafts/astro-bento-portfolio-ssg/blob/master/src/components/Globe.tsx) (d3 & solid-js library) ✅

* ig embed ✅
    * https://developers.facebook.com/docs/instagram/oembed
    * https://about.instagram.com/blog/announcements/introducing-web-embedding-instagram-content-on-websites
        * must be a public profile to be shared!

* Use [gpx.studio](https://gpx.studio/) to visualize your GPX, or see [my Route Tracker repo](https://github.com/JAlcocerT/Py_RouteTracker)

* https://www.youtrack.es
* metabase/superset/redash - Can also represent GPX data
* OSM Widgets
    * https://snorpey.codes/en/articles/self-host-openstreetmaps-widgets
    * https://github.com/maplibre/maplibre-gl-js?tab=License-1-ov-file#readme

* rawhtml shortcode from hugo - translate to astro ->> *can this bring gpx support?*

* with peertube
* https://www.vidstack.io/
    * https://github.com/vidstack/player

* https://vimejs.com/
    * https://github.com/vime-js


YouTube Videos

Or, in pure Markdown, but losing the image sizing and border:

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/PCvrcyV3_hI/maxresdefault.jpg)](https://www.youtube.com/watch?v=PCvrcyV3_hI)


* Carousel - Even with CSS Only as per [this video](https://www.youtube.com/watch?v=g03Yldh9Nkw) like [so](https://developer.chrome.com/blog/carousels-with-css) and [so](https://flackr.github.io/carousel/)

* with react (v1) as per astro project: https://github.com/gio-del/Astro-Theme-Astroway
* with embla - v2
    * https://www.embla-carousel.com/
    * https://github.com/davidjerleke/embla-carousel
* with v3 -  Astro + Alpine + Tailwind Starter - as per https://github.com/cssninjaStudio/dokto

* Photo galleries
  * https://github.com/tvoma/cube-gallery
  * https://github.com/jomaendle/astro-photo-gallery
  * https://jankraus.net/2024/04/05/how-to-build-a-simple-photo-gallery-with-astro/

pop up at time or location of page

* Others: if traffic is directed here, ever
    * booking maps - https://affiliates.support.booking.com/kb/s/article/Map-Widget-everything-you-need-to-know
    * https://www.travelocity.com/Flights
    * Search
    * Booking/expedia widgets