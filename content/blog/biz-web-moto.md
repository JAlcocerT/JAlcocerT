---
title: "A website for a Moto Blogger. With SSG,  FFMpeg and Chocolatey"
date: 2025-02-23T19:20:21+01:00
draft: false
tags: ["dev"]
description: 'Creating a website for a moto blogger. Or how to make two websites during a morning.'
url: 'web-for-moto-blogger'
---


## Moto Blogger Setup

My friend wanted to have the following **Astro theme**:

The **theme** - https://github.com/Boston343/horizon

<!-- 
https://github.com/JAlcocerT/horizon
https://github.com/JAlcocerT/ProyectoYosu
https://github.com/Boston343/horizon -->

> Original (and fantastic) job was done by https://github.com/Boston343/horizon and released under GPL3.0

There was a **Windows Web-Dev setup** in between, so...

...the setup took just a little bit more clicks than in linux:

1. Install node and npm ([nodejs.org](https://nodejs.org/en) and [docs.npmjs.org](https://docs.npmjs.org/))

```sh
node --version
npm --v
```

2. Install git and vscode

3. Install **firebase CLI** - in windows that means pasting the `.exe` to the repo folder and adding it as gitignore to avoid pushing it to the repo

4. Install npm firebase package to configure the hosting


{{< details title="Google Firebase Setup 📌" closed="true" >}}

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

Add a custom domain.

Select my subdomain, and added a **CName + TXT record to the DNS**.

![Firebase Custom Domain](/blog_img/web/success5-aga/firebase-own-domain.png)

For that domain, Im using cloudflare - so made sure that its **DNS only and not proxied records**

{{< /details >}}

{{< callout type="info" >}}
Alternatively, do the [Web-Dev setup for Astro at Windows with Chocolatey](#chocolatey-setup-for-astro)
{{< /callout >}}


5. Do the one time Firebase Project setup: `.\firebase init`

**Why firebase and not cloudflare?**

Just using Google account was enough after accepting firebase T&C's.

![Firebase Custom Domain](/blog_img/web/Firebase/firebase-auth.png)

![Firebase Custom Domain](/blog_img/web/Firebase/firebasedeploy-gha.png)

![Firebase Custom Domain](/blog_img/web/Firebase/firebase-gha-auth.png)

![Firebase Custom Domain](/blog_img/web/Firebase/firebase-gha-auth2.png)


And...thats all the one time things required.

**In a nutshell,** from now on, just these **3 commands** are enough:

```sh
npm run dev #to see locally the changes
npm run build #to render the site to /dist
firebase deploy #to push dist to proyectorutasmoto.web.app
```

> There you go: https://proyectorutasmoto.web.app/


**Next steps** - To link a **custom domain** and to not forget to sync it to github for a free code backup!

<!-- 
https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/

![HUGO Theme Gallery Carbon](/blog_img/web/success5-aga/photogallery-hugo-whilecyclingthere-carbon.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/" title="SSGs are Crazy Efficient" image="/blog_img/web/success5-aga/photogallery-hugo-whilecyclingthere-carbon.png" subtitle="See how this other HUGO Gallery Project was delivered" method="Resize" options="600x q80 webp" >}}
{{< /cards >}}

## Outro


I encouraged this client to also do somethign with his **awsome action camera video content**.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="Some video tricks" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#video-workflow" title="Video Edition Post" icon="book-open" >}}
{{< /cards >}}

### Chocolatey and FFMPeg

You can **install ffmpeg** without chocolatey.

But thats *'en plan pringao'*.

I prefer to leverage chocolatey: https://community.chocolatey.org/packages

So that programs will get installed programatically (instead of downloading `.exe`, executing and clicking next few times).

{{< callout type="info" >}}
If you have ffmpeg installed already, jump [here](#ffmpeg-video-workflow-for-windows)
{{< /callout >}}

With **Chocolatey as package manager** you just need to use these 4 commands to get **ffmpeg ready**.

Open powershel as administrator and copy paste these (one by one):

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

If you are here already, you are ready to join videos!

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
* Join them but silence the audio
* Place music on top of the silenced combined video

```sh
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output.mp4 #simple join

#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4 #silenced video

### 🎵 Music by
#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4 #silenced video
#ffmpeg -stream_loop -1 -i "TRAVELATOR - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp 
```

> Every time you do this for ~20min GOPro 4K videos, you are saving 3h and 65W *as of today ~0.05$*

**HEVC** (High Efficiency Video Coding), also known as **H.265**, is a video compression standard. 

To play HEVC videos, your system needs the appropriate codecs in Windows.

{{< callout type="info" >}}
Still, it will perform better in Linux!
{{< /callout >}}

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
