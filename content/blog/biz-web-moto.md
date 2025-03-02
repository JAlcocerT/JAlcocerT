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

There was a Windows setup in between, so...

...the setup took just a little bit more clicks than in linux:

1. Install node and npm (nodejs.org and docs.npmjs.org)
2. Install git and vscode

3. Install **firebase CLI** - in windows that means pasting the `.exe` to the repo folder and adding it as gitignore to avoid pushing it to the repo
4. Install npm firebase package


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

And to have the my domain linked...

Went to [firebase UI](https://console.firebase.google.com/) -> Compilation -> hosting.

Add a custom domain.

Select my subdomain, and added a **CName + TXT record to the DNS**.

![Firebase Custom Domain](/blog_img/web/success5-aga/firebase-own-domain.png)

For that domain, Im using cloudflare - so made sure that its **DNS only and not proxied records**

{{< /details >}}


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

You can install ffmpeg without chocolatey.

But thats *'en plan pringao'*.

With **Chocolatey as package manager** you just need to do:

```sh
# Install Chocolatey (Run as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest -UseBasicParsing 'https://community.chocolatey.org/install.ps1' | Invoke-Expression

# Verify Chocolatey Installation
choco --version

# Install FFmpeg (Run as Administrator)
choco install ffmpeg -y

# Verify FFmpeg Installation
ffmpeg -version# 7.1-essentials_build
```

### FFmpeg Video Workflow for Windows


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11" title="FFMpeg and Windows GH Reference" >}}
{{< /cards >}}


**Copy the files**

```sh
Copy-Item -Path "E:\DCIM\DJI_001\*.MP4" -Destination "C:\Users\j--e-\OneDrive\Escritorio\cadiz" -Force
#Robocopy "E:\DCIM\DJI_001" "C:\Users\j--e-\OneDrive\Escritorio\cadiz" *.MP4 /MT:8 /R:3 /W:2 /ETA /TEE /LOG+:copy_log.txt
```

Create the **txt list**: all withing POWERSHELL

```sh
Get-ChildItem -Filter "*.MP4" | ForEach-Object { "file '$($_.Name)'" } | Set-Content file_list.txt
```

And just **use ffmpeg** to join all the files accordingly:

1. Just join them (keeping audio)
2. Join them but silence the audio
3. Place music on top of the silenced combined video

```sh
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output.mp4 #simple join
#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4 #silenced video

### 🎵 Music by
#silence & music
#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4 #silenced video
#ffmpeg -stream_loop -1 -i "TRAVELATOR - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp 
```

HEVC (High Efficiency Video Coding), also known as **H.265**, is a video compression standard. 

To play HEVC videos, your system needs the appropriate codecs in Windows.

{{< callout type="info" >}}
Still, it will perform better in Linux!
{{< /callout >}}