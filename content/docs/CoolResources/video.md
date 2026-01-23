---
title: Video
type: docs
prev: /docs/android/
next: docs/
draft: false
---


1. https://github.com/OpenCut-app/OpenCut

>  The open-source CapCut alternative

2. KDEnlive: *which imo, is fantastic*


![KDENlive Comments](/blog_img/karting/kdenlive-gopro-gps-comments.png)

![alt text](/blog_img/outro/kdenlive-zoom.png)

1. Apply the Effect
Open Kdenlive and drag your video clip onto the Timeline.

Go to the Effects tab (usually in the top-left or middle-left panel).

Search for "Transform".

Drag and drop the Transform effect directly onto your video clip in the timeline.

2. Adjust the Zoom (Static Zoom)
Once the effect is applied, look at the Effect Stack panel (usually on the right):

Size: Change the percentage (e.g., set it to 150% to zoom in).

Position: You will see a red rectangle in the Project Monitor. Grab the center of the rectangle to move the video until the specific part you want to highlight is centered.

Tip: You can also adjust the X and Y coordinates in the Effect Stack for more precision.

![Obfuscate an area with KDEnlive](/blog_img/outro/kdenlive-blur.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/" title="OA5Pro" image="/blog_img/hardware/dji_oa5pro.jpg" subtitle="Action Cam Review" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#kdenlive" title="KDenLive with OA5Pro" image="/blog_img/outro/kdenlive.png" subtitle="Editing video with kdenlive" >}}
{{< /cards >}}

![Applying KDENLIVE LUT](/blog_img/outro/kdenlive-lut.png)


3. Others like: Shotcut

<!-- https://www.youtube.com/shorts/ls_66dIM9-4 -->

{{< youtube "ls_66dIM9-4" >}}


Motion Canvas is great for interactive, visually rich web animations. 

Remotion is best for React developers needing video automation and scaling.

Manim is the tool for deep mathematical visualization with powerful programmatic control.


| Feature/Aspect          | Motion Canvas                       | Remotion                          | Manim                              |
|------------------------|-----------------------------------|----------------------------------|-----------------------------------|
| Programming Language   | TypeScript (Web, JS)               | React (JavaScript)                | Python                            |
| Main Use Case          | Vector animations & presentations | Programmatic video creation      | Math & educational animations     |
| Preview/Interactivity  | Real-time visual preview           | React-driven dynamic rendering   | No live preview, manual rendering |
| Complexity & Control   | Moderate, web tech based           | High for UI/UX videos            | High for math/algorithm detail    |
| Target Users           | Web developers, educators          | React developers, marketers      | Educators, researchers, math pros |
| Learning Curve         | Moderate                         | Moderate                        | Steep (programming + math)        |
| Community & Docs       | Growing, good docs                 | Strong community & documentation | Mature community, rich resources  |


{{< youtube "x4tzWt6-I7c" >}}


* https://github.com/mifi/lossless-cut

* https://github.com/HandBrake/HandBrake - an OSS UI for Video compression (which does not use FFMPEG)


---

## Video as a Code

It's all about using **FFMPEG**: https://github.com/FFmpeg/FFmpeg

For Linux: *I was doing some tricks*

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

But this guy takes FFMPEG to the next level:

<!-- https://www.youtube.com/watch?v=6uB65PdasQI -->

{{< youtube "6uB65PdasQI" >}}

And I have a dedicated repository for ffmpeg video creation:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition" title="YT Video Edition | Github ↗" icon="github" >}}
{{< /cards >}}



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


<!-- 
![GoPro Metadata Speed trackday](/blog_img/karting/gopro-gps-trackday-speed.png)
 -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/" title="TrackDays and GoPro Telemetry " image="/blog_img/karting/gopro-gps-trackday-speed.png" subtitle="GPS Telemetry from a GoPro | Post" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9" title="GoPro MetaData Magic 101 " image="/blog_img/karting/gopro-speed-sample.png" subtitle="OA5 Firmware and comparison with GoPro" >}}
{{< /cards >}}

If you enjoy these kind of [geo/racing](https://jalcocert.github.io/JAlcocerT/geospatial-data/#gopro-metadata-extraction) analytics, ive placed particular [docs for that](https://jalcocert.github.io/JAlcocerT/docs/coolresources/race/).