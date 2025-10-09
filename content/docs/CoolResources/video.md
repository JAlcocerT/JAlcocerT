---
title: Video
type: docs
prev: /docs/android/
next: docs/
draft: false
---


1. https://github.com/OpenCut-app/OpenCut

>  The open-source CapCut alternative

2. KDEnlive

![Applying KDENLIVE LUT](/blog_img/outro/kdenlive-lut.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/" title="OA5Pro" image="/blog_img/hardware/dji_oa5pro.jpg" subtitle="Action Cam Review" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#kdenlive" title="KDenLive with OA5Pro" image="/blog_img/outro/kdenlive.png" subtitle="Editing video with kdenlive" >}}
{{< /cards >}}

3. Others like: Shotcut


---

## Video as a Code

It's all about using: https://github.com/FFmpeg/FFmpeg

For Linux:

```sh
#sudo apt update && sudo apt install ffmpeg
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4 #original audio
#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4 #silenced video
```

You can also do same tricks for [Windows like so](https://github.com/JAlcocerT/YT-Video-Edition/tree/main/With_FFmpeg/W11), as seen [here](https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/#chocolatey-and-ffmpeg)

```sh
#choco install ffmpeg -y
#ffmpeg -version #I got the version 7.1-essentials_build
Get-ChildItem -Filter "*.MP4" | ForEach-Object { "file '$($_.Name)'" } | Set-Content file_list.txt
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output.mp4 #simple join
```

### Converting Video

If people around you have iphones...

The main difference between iPhone .mov and .mp4 files is the format, compatibility, and intended use: .mov is Apple's native format designed for high-quality video editing on Apple devices, while .mp4 is a globally accepted standard optimized for compatibility and efficient sharing across platforms.


| Feature           | .mov                | .mp4                  |
|-------------------|---------------------|-----------------------|
| Developer         | Apple               | MPEG                  |
| File Size         | Larger[4]       | Smaller[4]        |
| Compression       | Lossless/Lossy[4]| Usually Lossy[4]  |
| Quality           | High[15]        | Good[15]          |
| Compatibility     | Best with Apple[4]| Universal[4]    |
| Editing Ease      | Easier (Apple)[5]| Harder[5]         |


**Lossless Container Conversion (no re-encoding):** This transmuxes your MOV to MP4 instantly if both audio and video codecs are already compatible with MP4, preserving quality.[3][5]

```sh
ffmpeg -i input.mov -c:v copy -c:a copy output.mp4
```

### Extracting Video Data

For crazy people that like [trackdays](https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/), D&A [geospatial geeks](https://jalcocert.github.io/JAlcocerT/geospatial-data/) or somebody with a [gopro](https://jalcocert.github.io/JAlcocerT/geospatial-data/#gopro-metadata-extraction)



https://jalcocert.github.io/JAlcocerT/geospatial-data/#gopro-metadata-extraction


<!-- 
![GoPro Metadata Speed trackday](/blog_img/karting/gopro-gps-trackday-speed.png)
 -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/" title="TrackDays and GoPro Telemetry " image="/blog_img/karting/gopro-gps-trackday-speed.png" subtitle="GPS Telemetry from a GoPro | Post" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9" title="GoPro MetaData Magic 101 " image="/blog_img/karting/gopro-speed-sample.png" subtitle="OA5 Firmware and comparison with GoPro" >}}
{{< /cards >}}



---

## Animations


If you like to create video as a code, and among all the [things we can create as a code](https://jalcocert.github.io/JAlcocerT/things-as-a-code/#animations-as-a-code) - you might also enjoy making cool [animations as a code](https://jalcocert.github.io/JAlcocerT/animations-as-a-code/)




{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/keystaticcms-astrodb/#animations" title="Tinkering with Animations | Post" image="https://img.youtube.com/vi/YuvHXyFeRV4/hqdefault.jpg" subtitle="Posting to Twitter or Youtube those animations 101." >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="NEW Source Code on Github. Generating mp4 animations with Matplotlib and Python..." >}}
{{< /cards >}}