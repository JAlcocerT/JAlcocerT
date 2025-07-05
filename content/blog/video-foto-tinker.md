---
title: "More Photo and Video fun stuff with PostIZ"
date: 2025-05-13T13:20:21+01:00
draft: false
tags: ["Tinkering","PostIZ","n8n","OpenAI TTS"]
description: 'From ffmpeg CLIs to color grading LUTs and ND Filters. With AI generated audio for shorts.'
url: 'photo-video-tinkering'
---

We come from...getting to know what [ffmpeg is for benchmarks](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#ffmpeg-benchmark-in-linux) to compare [CPU performance](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/).

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="Video Tricks ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/#chocolatey-and-ffmpeg" title="Chocolatey and FFMPEG ↗" >}}
{{< /cards >}}

Wait, there is even a repo for video stuff!

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition" title="Video Edition Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Quick videos as a code from Action Cams" >}}
{{< /cards >}}

I will be showing you how to put your videos into social media with:

1. [PostIZ](#how-to-setup-postiz)
2. [N8N](#how-to-setup-n8n)
3. [AI Powered Shorts](#ai-powered-shorts) (Audio and description)

And now there is a chance to do a **photo & video recap**

<!-- https://www.youtube.com/watch?v=kaa1vPHqKdw -->

{{< youtube "kaa1vPHqKdw" >}}

{{< callout type="info" >}}
For night video and [the oa5pro](https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/), for me it has worked better: -0.7EV, 50fps, S 1/400, ISO 100 ~25600 (max range), AWB, Texture -1 and Noise Reduction -2.
{{< /callout >}}

And all of this is great, but [consider this](#conclusions) while creating.

> Never forget: share your content, specially if its easy with Postiz


## Video Editing


{{< callout type="warning" >}}
If you are planning to use [Gyroflow](#gyroflow) for custom video estabilization, make sure that the OA5Pro records **without RS** modes and **Wide**!
{{< /callout >}}

In that way the acelerometer information will be captured in the `mp4` file.

### CLI Tricks

There is people outthere doing cool things with ffmpeg: https://blog.bartzz.com/create-stunning-timelapses-with-ffmpeg/

#### Transfering Files

```sh
mkdir -p "$HOME/Desktop/CAM1-$(date +%m-%d)" && rsync -avP --include='*.MP4' --exclude='*' . "$HOME/Desktop/CAM1-$(date +%m-%d)"
#rsync -avP --include='*.MP4' --exclude='*' . "/media/jalcocert/Backup2TB/OA5Pro/May-Jul25"
```

1.  **Create a dated folder:** A new directory like `CAM1-07-05` will be created on your Desktop. If it already exists from a previous run on the same day, `mkdir -p` will just do nothing and succeed.
2.  **Conditional Execution:** If the directory creation is successful, `rsync` will proceed.
3.  **Copy MP4s:** `rsync` will then scan the *current directory* you are in, and copy *only* files that end with `.MP4` into the newly created (or existing) dated folder on your Desktop. It will do this efficiently, preserve file attributes, and show you the progress.

> This command is perfect for quickly backing up or moving only video files (from a OA5Pro) into a clearly dated folder on your desktop.

#### Videos with FFMPeg

Just put [your video parts](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#ffmpeg) together / silenced / with a given .mp3 audio:

```sh
#Cut between two second or from a second to the end
#ffmpeg -i DJI_20250515200111_0003_D.MP4 -ss 10 -to 90 -c copy output.mp4
#ffmpeg -i DJI_20250515200111_0003_D.MP4 -ss 91 -c copy output_.mp4
ffmpeg -i "$(ls *.MP4)" -ss 26 -c copy output_.mp4

#Last 52s
ffmpeg -sseof -52 -i DJI_20250520200235_0006_D.MP4 -c copy output_last_52s.mp4

## For Tinkering with more video parts
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list

#Generate a video from few parts
#ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4 #silenced video
#ffmpeg -i output_video.mp4 -filter:v "setpts=PTS/4" -an fast_output_video.mp4 #x4

#ffmpeg -stream_loop -1 -i "AETHER - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4
ffmpeg -stream_loop -1 -i "output.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4

### 🎵 Music by...
```


{{< details title="FFMPEG CLI Tricks | Ubuntu 📌" closed="true" >}}

**Extracting images from a video...and making a gif**

1. From a timeframe until the end, 1 frame:

```sh
#from second 90 of the video, give me 1fps
ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.png
ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.jpg
```

2. And just **between 90s and 105s** timeframe, 1fps:

```sh
ffmpeg -i DJI_20250116072528_0035_D.MP4 -vf "select='between(t,90,105)',fps=1" -vsync vfr frame_%03d.png
```

3. Make a gif with the pulled images

{{< /details >}}

4. Applying custom luts with ffmpeg:

```sh
#https://video.stackexchange.com/questions/21483/apply-custom-lut-via-ffmpeg
ffmpeg -i "Input.mov" -vf lut3d="ARRIP3D65PQ108-33.cube" -s 1920x1080 -c:v dnxhd -pix_fmt yuv422p -b:v 120M DNxHD_for_Editing.mxf
```


#### Shorts

While 1080p (Full HD: 1920x180) is a very common and recommended resolution for YouTube, you can definitely upload videos in other resolutions, both higher and lower.

* Frame Rate: Upload your video in the same frame rate it was recorded. Common frame rates include 24, 25, 30, 48, 50, and 60 frames per second.

* Aspect Ratio: The standard aspect ratio for YouTube is 16:9. While other aspect ratios are supported, 16:9 generally provides the best viewing experience across different devices.

4K UHD (Ultra High Definition): This is the most common 4K resolution for televisions, monitors, and streaming services. Its dimensions are 3840 pixels wide by 2160 pixels high (3840 x 2160). This resolution has exactly four times the number of pixels as 1080p (1920 x 1080).



How about adding [TTS generated audio](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Audio/openai-tts.py) to shorts?


1. Generate the AI Audio with TTS:

```sh
soxi -D audio_reply.wav #video duration
```

2. Get your short content [transfered](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#transfering-files):

```sh
mkdir -p "$HOME/Desktop/CAM1-$(date +%m-%d)" && rsync -avP --include='*.MP4' --exclude='*' . "$HOME/Desktop/CAM1-$(date +%m-%d)"
```

> From SD card I get transfers at 68MB/s and from the internal ~200MB/s (when using an external nvme case usb-c)

3. Make 175s pieces max:

```sh
#Shorts (limited to 3min or generated audio duration)

#As per audio duration, which is passed to the CLI
ffmpeg -i DJI_2025abc123.MP4 -t $(soxi -D audio_reply.wav) -c copy cut_output.mp4
ffmpeg -i "$(ls *.MP4)" -t $(soxi -D audio_reply.wav) -c copy cut_output.mp4

#As per hardcoded duration
#ffmpeg -i DJI_2025abc123.MP4 -t 175 -c copy output.mp4
```

4. Extract the audio of the `.MP4` piece, and combine it with the ai generated audio:

```sh
#Take the cut video and combine its audio with the AI generated
ffmpeg -i cut_output.mp4 -i audio_reply.wav \
-filter_complex "[0:a:0]volume=0.6[vid_audio];[1:a:0]volume=1.4[reply_audio];[vid_audio][reply_audio]amix=inputs=2:duration=longest[aout]" \
-map "[aout]" -c:a libmp3lame output.mp3
# ffmpeg -i DJI_20250511143231_0004_D.MP4 -i audio_reply.wav \
# -filter_complex "[0:a:0][1:a:0]amix=inputs=2:duration=longest[aout]" \
# -map "[aout]" -c:a libmp3lame output.mp3

# ffmpeg -i DJI_20250511143231_0004_D.MP4 -i audio_reply.wav \
# -filter_complex "[0:a:0]volume=0.6[vid_audio];[1:a:0]volume=1.4[reply_audio];[vid_audio][reply_audio]amix=inputs=2:duration=longest[aout]" \
# -map "[aout]" -c:a libmp3lame output.mp3

#with just one video in the folder:
ffmpeg -i "$(ls *.MP4)" -i audio_reply.wav \
-filter_complex "[0:a:0]volume=0.6[vid_audio];[1:a:0]volume=1.4[reply_audio];[vid_audio][reply_audio]amix=inputs=2:duration=longest[aout]" \
-map "[aout]" -c:a libmp3lame output.mp3
```

5. Put back the combined audio to the `.mp4`:

```sh
#For a Quick Short:
ffmpeg -i cut_output.mp4 -i output.mp3 -map 0:v -map 1:a -c:v copy -c:a libmp3lame -q:a 0 -shortest final_output.mp4
```

<!-- https://www.youtube.com/shorts/u3-5yN9xIv0 -->

{{< youtube "u3-5yN9xIv0" >}}

You can also take a 1080p part from a 4K video withour rencoding:

```sh
ffmpeg -i DJI_20250518172824_0001_D.MP4 -c copy -bsf:v hevc_metadata=crop_left=960:crop_right=960:crop_top=0:crop_bottom=1080 output_horizontal_1080p_no_encode.mp4
```

#### Thumbnails

```sh
ffmpeg -i extracted-image.png -c:v libwebp -quality 80 ./compressed_thumbnail.webp
```

#### AI Powered shorts

A friend told me recently to have a look to the following to create **interesting youtube shorts**:

* Suno.ai for audio/songs...
* Klingai.com for video generated from images/text
* Ilevenlabs to create TTSpeech
  * Thanks to GitPodcast, I saw that its also possible to do with [Azure AI Speech](https://azure.microsoft.com/en-us/pricing/details/cognitive-services/speech-services/)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/OpenAI/Audio" title="Testing OpenAI API + Audio for YT  ↗" >}}
{{< /cards >}}

Whatever you do, dont forget to add proper [video description](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#youtube-video-descriptions)

Its kind of what [these channels](https://www.youtube.com/watch?v=UhvMylLrKw8) do!


#### Telemetry

Initially I tought that would be possible only [with the GoPro...](https://jalcocert.github.io/JAlcocerT/geospatial-data/#exif-and-python-with-gopro)

* https://goprotelemetryextractor.com/cycling-stats-video-overlay?affi=safabrian#download_0
* https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/

But I was wrong, action cameras, including the oa5pro, have built in acelerometers (just that not all of them have GPS's):

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#gyroflow" title="OA5Pro Acelerometer Data Extraction | Post exploring Gyroflow ↗ " >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/geospatial-data/#gopro-metadata-extraction" title="GoPro Telemetry | Karting Post Section ↗ " >}}  
{{< /cards >}}

```sh
#choco install exiftool
#exiftool -ver
exiftool -ee DJI_20250518182847_0015_D.MP4 #working when recorded W and no RS!
```

{{< callout type="info" >}}
On the OA5Pro, you need to record without RS and with Wide mode to get such data.
{{< /callout >}}

##### Adding Telemetry to MP4s

How to Telemetry Overlay a Video

I tried to bypass this with: https://jalcocert.github.io/JAlcocerT/polar-data-python-analysis/

and with https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/

Then the geospatial analysis came...https://jalcocert.github.io/JAlcocerT/geospatial-data/

### Kdenlive

I was tinkering with KDEnlive sometime ago, [with the x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#video-editing-101/)...

```sh
flatpak install flathub org.kde.kdenlive
```

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="Video Tricks ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/#chocolatey-and-ffmpeg" title="Chocolatey and FFMPEG ↗" >}}
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=V0_yp-ziqvI -->

This video was very helpful to understand additional KDE tricks:

{{< youtube "V0_yp-ziqvI" >}}


Have rediscovered KDEnlive [for LUT](https://docs.kdenlive.org/en/effects_and_filters/video_effects/color_image_correction/applylut.html) (`.cube` files) color grading application!

![Applying KDENLIVE LUT](/blog_img/outro/kdenlive-lut.png)

I personally like the `CINEMATIC.cube` that KDE brings:

```sh
#find / -name "*.cube" 2>/dev/null
#cd /var/lib/flatpak/app/org.kde.kdenlive/x86_64/stable/1e36391e875577fd4cd61f5a02e7e52d1cf22598a625d235d49546fd39b77c0c/files/share/kdenlive/luts
cp CINEMATIC.cube /home/jalcocert/Desktop
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/" title="OA5Pro" image="/blog_img/hardware/dji_oa5pro.jpg" subtitle="Action Cam Review" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#kdenlive" title="KDenLive with OA5Pro" image="/blog_img/outro/kdenlive.png" subtitle="Editing video with kdenlive" >}}
{{< /cards >}}

Those LUT `.cube` files can *potentially* be applied via FFMPEG CLI:

```sh
# ffmpeg -i DJI_20250518175448_0005_D.MP4 -ss 0 -to 10 -c copy output_first_10_seconds.mp4
# ffmpeg -i output_first_10_seconds.mp4 -i ./CINEMATIC.cube -filter_complex "lut3d" -c:a copy output_first_10_seconds_cinematic.mp4
```

### Gyroflow

I already had [a look to Gyroflow](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#gyroflow) on the last video post.

* https://github.com/gyroflow/lens_profiles/tree/main/DJI

And it can also be done with [gyroflow-CLI](https://docs.gyroflow.xyz/app/advanced-usage/command-line-cli):

```sh
gyroflow-cli --input DJI_20250518182847_0015_D.MP4 --output stabilized_video.mp4
```

{{< callout type="info" >}}
Watching **4k video on Linux** might not be **fluent** until you install these:
{{< /callout >}}

## Photo Editing

Spending a lot on smartphone with cool cameras to...use snapseed?

Come on... whats next?

Uploading to social media in low resolution?


Lets do some CLI Photo tinkering:

```sh
file libreportfolio.png
#libreportfolio.png: PNG image data, 2048 x 2048, 8-bit/color RGBA, non-interlaced
```

```sh
convert libreportfolio.png -resize 1200x630^ -gravity Center -extent 1200x630 -quality 85% libreportfolio-og.jpeg
convert libreportfolio.png -resize 1200x630^ -gravity Center -extent 1200x630 libreportfolio-og.png
```


### Darktable

As a light room alternative:

<!-- 
https://www.youtube.com/watch?v=rMhe2gYJa9s 
-->

{{< youtube "rMhe2gYJa9s" >}}



### Other photo editing

1. GIMP
2. digiKam
3. Photoflow

* Darktable is an open source photography workflow application and raw developer - https://github.com/darktable-org/darktable
* GIMP: The GNU Image Manipulation Program - https://gitlab.gnome.org/GNOME/gimp


---

## Conclusions

Tools for Creator Mode:

* OBS Studio
   * SHAREX
* OpenShot ~~Shotcut~~
* Audacity



<!-- https://www.youtube.com/watch?v=-OO6Qrw6NWE -->

{{< youtube "-OO6Qrw6NWE" >}}



<!-- https://www.youtube.com/watch?v=7CnjKua865Y -->

{{< youtube "7CnjKua865Y" >}}

Never forget about proper photo/video backup before your trips!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/#backups" title="Tech for a Trip" image="/blog_img/hardware/travel-pakc.jpg" subtitle="Hardware & Softw setup for traveling" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-management-tools/" title="Photo Tools" image="/blog_img/selfh/Photo/PiGallery-PhotoInfo.png" subtitle="PiGallery, PhotoView, Immich..." >}}
{{< /cards >}}


### ND Filters

<!-- 
https://allegro.pl/oferta/zestaw-6-filtrow-nd-8-16-32-64-1000-cpl-dji-osmo-action-4-3-fw-oa4-ald-15143043373
https://allegro.pl/oferta/etui-pokrowiec-na-kamere-sportowa-dji-osmo-action-3-4-5-pro-gopro-13-16982113322?reco_id=cc5aea34-1efb-11f0-9d44-c214b156ab4e&sid=662c7a15915b4ff7cbe3591dc77c5ba25a9c6e61630a3346ef7abf0742c8b1f5&dd_referrer=https%3A%2F%2Fallegro.pl%2Fkategoria%2Fkamery-kamery-sportowe-147894%3Fstring%3Ddji%2520osmo%2520action%25205 -->

A **Neutral Density (ND) filter** is essentially a **sunglass for your camera lens**. It's a filter made of darkened glass or resin that reduces the amount of light entering the camera sensor **without affecting the color** or **hue** of the scene.

**How they work:**

* ND filters are designed to reduce the intensity of **all wavelengths of light equally**. This means they dim the overall brightness of the scene without introducing any color casts (in theory; some cheaper ND filters might have slight color shifts).
* They work by absorbing or reflecting a certain percentage of the incoming light.


{{< details title="What ND Filders do | Types of ND 📌" closed="true" >}}


**What they do:**

By reducing the amount of light reaching the sensor, ND filters allow you to:

* **Shoot with wider apertures in bright conditions:** This lets you achieve a shallow depth of field (blurry background) even in bright sunlight, which would otherwise overexpose your image if you tried to open up the aperture.
* **Use slower shutter speeds in bright conditions:** This enables you to capture motion blur in subjects like flowing water, moving clouds, or passing vehicles, creating a smoother, more artistic look. Without an ND filter in bright light, using a slow shutter speed would result in an overexposed image.
* **Maintain a desired shutter speed for cinematic motion:** As you mentioned, the 180-degree shutter rule often dictates a shutter speed double your frame rate. In bright conditions, without an ND filter, you might be forced to use a faster shutter speed than desired, resulting in less natural-looking motion. An ND filter allows you to stick to your desired shutter speed even when there's plenty of light.
* **Balance exposure:** In situations with a very bright sky and a darker foreground, graduated ND filters (darker on one half, clear on the other with a gradual transition) can help balance the exposure across the scene, preventing the sky from being overexposed while keeping the foreground well-lit.

**Types of ND Filters:**

* **Fixed ND Filters:** These filters have a fixed density, meaning they reduce the light by a specific amount (e.g., 1-stop, 2-stop, 10-stop). You would need a set of these for different lighting conditions.
* **Variable ND Filters:** These filters consist of two polarizing layers that can be rotated relative to each other to control the amount of light reduction. They offer more flexibility but can sometimes introduce an "X" pattern or uneven darkening at their extreme settings, especially on wide-angle lenses.
* **Graduated ND Filters (GND):** These are dark on one half and gradually become clear on the other. They are typically rectangular and used in a filter holder to allow for precise positioning of the dark area (often used for landscapes).

{{< /details >}}


{{< details title="In the context of video | Summarized 📌" closed="true" >}}

ND filters are particularly crucial for video because you typically want to maintain a consistent frame rate and shutter speed for natural motion. Adjusting the aperture and ISO (sensitivity) are the primary ways to control exposure, but aperture also affects depth of field, and increasing ISO can introduce noise. ND filters provide an additional way to control the amount of light without sacrificing your desired cinematic motion or depth of field.

While a good quality ND filter should ideally not affect color, some cheaper ones might introduce a slight color cast. It's generally recommended to invest in reputable brands to minimize this issue. Post-processing can often correct minor color casts if they occur.

Essentially, ND filters give you greater control over your exposure settings in bright light, allowing you to achieve creative effects and maintain the desired look and feel of your video or photographs

{{< /details >}}

<!-- https://www.youtube.com/watch?v=00e8XDRoge4 -->

{{< youtube "00e8XDRoge4" >}}

<!-- https://www.youtube.com/watch?v=oIJlSP0u6FU -->


### Color Grading

A **Color Grading LUT (Lookup Table)** is essentially a **preset color filter** that you can apply to your video footage or images to quickly alter and enhance its colors. Think of it as a shortcut for complex color adjustments.

Here's a breakdown of what that means:

* **Lookup Table:** At its core, a LUT is a file containing a series of numerical values. These values act as a map, instructing your editing software how to transform the existing colors in your footage to a new set of colors.
* **Color Transformation:** When you apply a LUT, the software analyzes the original color values of each pixel in your video or image and then uses the LUT's data to change those values according to a predetermined formula. This can affect various aspects of color, including:
    * **Hue:** The actual color (e.g., red, blue, green).
    * **Saturation:** The intensity or purity of a color.
    * **Luminance:** The brightness or darkness of a color.
    * **Contrast:** The difference between the light and dark areas.
    * **Gamma:** The overall tonal range and distribution of brightness.
* **Predetermined Look:** LUTs are designed to achieve a specific visual style or look. This could be anything from a subtle color correction to a dramatic cinematic effect, or even emulating the look of specific film stocks.
* **Efficiency:** Instead of manually tweaking numerous color parameters for each shot, applying a LUT provides a one-click solution to achieve a consistent look across your project, saving significant time in the color grading process.

**Think of it like this:** Imagine you have a recipe (the LUT) that tells you exactly how much of each color ingredient (the original footage colors) you need to mix to get a specific final color dish (the color-graded footage).

**Key things to understand about LUTs:**

* **Not a Replacement for Color Correction:** While LUTs handle color *grading* (the creative aspect of establishing a look), they are generally not a substitute for basic **color correction**. It's often best to first balance your footage for white balance, exposure, and contrast before applying a creative LUT.
* **Different Types of LUTs:**
    * **Technical LUTs (Conversion LUTs):** These are designed to convert footage from a specific camera's log format (a flat, high dynamic range format) to a standard color space like Rec. 709, providing a more natural starting point for grading.
    * **Creative LUTs (Look LUTs):** These are designed to impart a specific aesthetic or style to your footage, such as a vintage feel, a cinematic look, or a specific color palette.
* **File Formats:** Common LUT file formats include `.cube`, `.3dl`, and `.look`.
* **Software Compatibility:** LUTs are widely supported by most professional video editing and color grading software (e.g., DaVinci Resolve, Adobe Premiere Pro, Final Cut Pro).

In essence, a color grading LUT is a powerful tool that offers a quick and efficient way to apply complex color transformations to your footage, helping you achieve a desired visual style and maintain consistency across your projects.

{{< callout type="info" >}}
You can definitely apply color grading LUTs using both **Kdenlive** and **FFmpeg**.
{{< /callout >}}

* Applying LUT with KDEnlive + `.Cube`'s for the DJI Oa5pro: https://www.dji.com/pl/downloads/softwares/dji-osmo-action-5-pro-d-log-m-to-rec-709-vivid-lut

{{< details title="KDEnlive | Color Grading with Cube files 📌" closed="true" >}}


Kdenlive has a built-in effect specifically for applying LUTs. Here's how you can use it:

1.  **Open the Effects Tab:** In Kdenlive, go to the "Effects" tab (usually on the right side).
2.  **Search for "Apply LUT":** In the search bar at the top of the Effects tab, type "Apply LUT".
3.  **Add the Effect:** Drag the "Apply LUT" effect onto the clip you want to color grade on the timeline. You can also apply it to a track or the master track to affect multiple clips.
4.  **Open Effect Settings:** Select the clip with the "Apply LUT" effect and go to the "Effect/Composition Stack" tab (often in the same area as the Project Bin or Properties). You should see the settings for the "Apply LUT" effect.
5.  **Select the LUT File:**
    * In the "LUT file to apply" dropdown menu, you might see some default LUTs.
    * To use a custom LUT file (e.g., a `.cube` or `.3dl` file you've downloaded), select "Custom...". This will open a file dialog where you can browse to and select your LUT file.
6.  **Interpolation Mode (Optional):** You can choose the interpolation mode (Nearest, Trilinear, Tetrahedral). Trilinear or Tetrahedral usually offer smoother results but might be slightly more resource-intensive.

Kdenlive supports `.3dl` (After Effects) and `.cube` (Iridas) LUT file formats.

{{< /details >}}



FFmpeg + LUT



{{< details title=" | CLI Details 📌" closed="true" >}}

FFmpeg, being a command-line tool, requires you to use the appropriate filter to apply LUTs. The primary filter for this is `lut3d`.

Here's the basic syntax:

```bash
ffmpeg -i input.mp4 -vf lut3d="path/to/your/lutfile.cube" output.mp4
```

**Explanation:**

* `ffmpeg`: The command-line tool.
* `-i input.mp4`: Specifies the input video file.
* `-vf lut3d="path/to/your/lutfile.cube"`: This is the video filter option (`-vf`) that applies the 3D LUT. Replace `"path/to/your/lutfile.cube"` with the actual path to your LUT file. FFmpeg commonly supports the `.cube` format.
* `output.mp4`: Specifies the name of the output video file with the LUT applied.

**Example for other LUT formats (using `haldclut` which can be generated from various LUTs):**

If you have a LUT in a format that `lut3d` doesn't directly support, you might need to convert it to a Hald CLUT PNG image and then use the `haldclut` filter in FFmpeg:

1.  **Generate Hald CLUT:** You might need a separate tool or script to convert your `.3dl` or other LUT format into a Hald CLUT PNG image.
2.  **Apply with FFmpeg:**

```bash
ffmpeg -i input.mp4 -i haldclut.png -filter_complex haldclut output.mp4
```

* `-i haldclut.png`: Specifies the Hald CLUT image as a second input.
* `-filter_complex haldclut`: Uses the `haldclut` filter.

**Important Considerations for FFmpeg:**

* **File Paths:** Make sure the path to your LUT file is correct.
* **Output Encoding:** You might want to add encoding options (e.g., `-c:v libx264 -crf 23` for H.264 encoding) to control the quality and format of your output video.
* **Complex Filtering:** You can chain other FFmpeg filters with `lut3d` for more advanced processing.

In summary, both Kdenlive (with its dedicated "Apply LUT" effect) and FFmpeg (using the `lut3d` filter) provide ways to apply color grading LUTs to your video footage. Kdenlive offers a more graphical and user-friendly approach, while FFmpeg provides powerful command-line control and flexibility.


{{< /details >}}



Yes, **you can definitely apply `.cube` files to any MP4 video file** using the right software. Here's how it works with the tools you mentioned:

**1. Kdenlive:**

* **Yes**, Kdenlive has a built-in "Apply LUT" effect that directly supports `.cube` files.
* You can apply this effect to individual clips, tracks, or even the master track to affect the entire project.
* You'll need to import the `.cube` file through the effect's settings.

**2. FFmpeg:**

* **Yes**, FFmpeg can apply `.cube` LUT files to MP4 videos using the `lut3d` video filter.
* You'll need to use the command-line interface and specify the path to your `.cube` file in the filter options.

**In general, `.cube` is a widely supported LUT format** in many video editing and color grading applications beyond just Kdenlive and FFmpeg. This includes popular software like:

* DaVinci Resolve
* Adobe Premiere Pro
* Adobe After Effects
* Final Cut Pro

**The process generally involves:**

1.  **Importing the MP4 video** into your chosen software.
2.  **Applying a LUT effect or filter** to the video clip.
3.  **Loading or selecting the `.cube` file** within the LUT effect's settings.
4.  **Rendering or exporting** the video to permanently apply the color grading.

So, regardless of the MP4 file itself (as long as it's a standard, decodable video), you can use `.cube` LUTs to change its color appearance using compatible software like Kdenlive or FFmpeg.

#### D-log

<!-- https://www.youtube.com/watch?v=-g0E4ntS8qA -->

{{< youtube "-g0E4ntS8qA" >}}


### Shutter Speed

Yes, in most standard video production scenarios, it **absolutely makes sense and is generally recommended** to have your shutter speed roughly double your frame rate. This is often referred to as the **"180-degree shutter rule."**

Here's why it's a good practice:

* **Natural Motion Blur:** This combination creates a level of motion blur that looks natural to the human eye. It mimics how we perceive motion in the real world. Each frame captures movement over roughly half of the time it takes for the next frame to be captured.
* **Cinematic Look:** This is a key element in achieving a cinematic feel. Too little motion blur can make movement look stroboscopic and unnatural, while too much can make everything appear smeary and soft.
* **Standard Practice:** It's a widely accepted and followed guideline in filmmaking and video production, making your footage fit seamlessly with other professionally shot material.
* **Balance:** It strikes a good balance between sharpness and motion portrayal. Objects in motion will have a natural blur, helping to convey speed and movement without sacrificing too much detail in static parts of the frame.

**Here's how it breaks down with common frame rates:**

* **24 fps (cinematic standard):** Shutter speed around 1/48th of a second (often rounded to 1/50th on many cameras).
* **30 fps (common for broadcast and online content):** Shutter speed around 1/60th of a second.
* **60 fps (for slow-motion playback at 30 fps):** Shutter speed around 1/120th of a second.
* **120 fps (for even slower slow-motion at 30 or 60 fps):** Shutter speed around 1/240th of a second.

**When might you deviate from the 180-degree shutter rule?**

While the double frame rate rule is a great starting point, there are creative reasons to deviate:

* **Faster Shutter Speed (less motion blur):**
    * **Stroboscopic Effect:** To create a sharp, almost stop-motion-like effect, often used for action sequences or dreamlike states (e.g., the opening of "Saving Private Ryan").
    * **Increased Clarity in Fast Motion:** To reduce motion blur and make fast-moving objects appear sharper.
* **Slower Shutter Speed (more motion blur):**
    * **Dreamy or Ethereal Look:** To create a soft, flowing feel.
    * **Exaggerated Sense of Speed:** To make fast-moving objects leave long trails of blur.
    * **Low Light Situations (as a last resort):** If you absolutely need more light and can't open your aperture or increase ISO further, a slower shutter speed will let in more light, but at the cost of increased motion blur.

**In conclusion:**

For the vast majority of your video work, aiming for a shutter speed that is double your frame rate is a solid foundation for achieving natural-looking and aesthetically pleasing motion. Deviating from this rule should be a conscious creative choice made to achieve a specific visual effect.


### F/OSS Tools for Video

* Create Animations with Code: https://github.com/motion-canvas/motion-canvas
  * https://github.com/motion-canvas/motion-canvas?tab=MIT-1-ov-file#readme

A TypeScript library for creating animated videos using the Canvas API.

>  Visualize Your Ideas With Code 

<!-- Motion Canvas is a tool that bridges the gap between code and animation, specifically targeted at creating animated videos. Here's a breakdown of what I know about it:


Library & Editor: Motion Canvas offers two main parts:

Library (written in TypeScript): This library allows you to write animation code using generators, providing a structured approach for creating animations.
Web-based Editor: This editor provides a real-time preview of your animations as you write the code.
Animation with Canvas API: Motion Canvas leverages the Canvas API, a built-in functionality of web browsers that allows for dynamic manipulation of graphics. This gives you control over various visual elements of your animation.

Benefits:

Combined Power of Code and UI:  Motion Canvas offers the benefits of both writing code for precise control and a visual editor for intuitive adjustments, making it suitable for users with different comfort levels. -->
<!-- 
To use Motion Canvas, you'll need a few things:

Node.js and npm: Motion Canvas relies on Node.js, a JavaScript runtime environment, and npm (Node Package Manager) for managing dependencies. You can download and install them together from the official Node.js website: https://nodejs.org/en

Code editor: You'll need a code editor of your choice to write and edit your Motion Canvas code. Popular options include Visual Studio Code, Atom, or Sublime Text.

(Optional) ffmpeg: While not strictly necessary for basic functionality, ffmpeg is a powerful tool for video encoding and manipulation. Motion Canvas can leverage ffmpeg for exporting your animations as videos. You can find installation instructions for ffmpeg based on your operating system through a web search. -->

<!-- 

---

## FAQ

* https://github.com/TheLastBen/fast-stable-diffusion
  * With DreamBooth and others -->

<!-- 

```Dockerfile
# Use the specified Python base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    build-essential

```

```yml
version: '3'

services:
  automatic:
    image: python:3.11-slim
    container_name: ai-automatic
    command: tail -f /dev/null
    volumes:
      - ai_automatic:/app
    working_dir: /app  # Set the working directory to /app
    ports:
      - "7865:7865"

volumes:
  ai_automatic:
```

## Fooocus

Fooocus is an image generating software (based on Gradio).

 **It supports GPU and M1/M2**.

https://www.youtube.com/watch?v=mKuhY3LSLwY
* <https://github.com/lllyasviel/Fooocus>



```sh
apt update
apt install git
git clone https://github.com/lllyasviel/Fooocus
#python3 -m vend fooocus_env
#source fooocus_env/bin/activate
cd Fooocus
pip install -r requirements_versions.txt

python entry_with_update.py
#python entry_with_update.py --listen
```

The default model is [Juggernaut-XL](https://huggingface.co/stablediffusionapi/juggernaut-xl)

```yml
version: '3'

services:
  sd-fooocus:
    image: python:3.11-slim
    container_name: fooocus
    command: tail -f /dev/null
    volumes:
      - ai_fooocus:/app
    working_dir: /app  # Set the working directory to /app
    ports:
      - "7865:7865"

volumes:
  ai_fooocus:
```

## ComfyUI

* https://github.com/comfyanonymous/ComfyUI
  * NVIDIA OR CPU WINDOWS PORTABLE - https://github.com/comfyanonymous/ComfyUI/releases
  * <https://github.com/comfyanonymous/ComfyUI#installing>



Fully supports SD1.x, SD2.x, SDXL and Stable Video Diffusion

Works even if you don't have a GPU with: --cpu (slow)





```Dockerfile
# Use the specified Python base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    build-essential

RUN git clone https://github.com/comfyanonymous/ComfyUI
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm5.6

WORKDIR /app/ComfyUI
RUN pip install -r requirements.txt

#python main.py --cpu

```

```sh

```

```sh
apt update
apt install git
git clone https://github.com/comfyanonymous/ComfyUI
#
#
#pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm5.6
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm5.7

cd ComfyUI
pip install -r requirements.txt
#python main.py
python main.py --cpu
```


```yml
version: '3'

services:
  sd-comfyui:
    image: comfyui #python:3.11-slim
    container_name: comfyui
    command: tail -f /dev/null
    volumes:
      - ai_comfyui:/app
    working_dir: /app  # Set the working directory to /app
    ports:
      - "8188:8188"

volumes:
  ai_comfyui:
```

---

## FAQ

### Other AIGen for (SD) and Generate Images

* <https://github.com/ttio2tech/Fooocus>
* ConfyUI: <https://www.youtube.com/watch?v=Z0BYc-w-jaI>

### Gradio?

Typical port is 7860

### Wait, What is...?

<!-- CUDA?? -->
<!-- 
**Ray Tracing:** Imagine you're playing a video game and you see reflections in water, shadows from trees, and light coming through windows. Ray tracing is a way to make these scenes look super realistic. 

**Integrated GPU (iGPU):** An integrated GPU (Graphics Processing Unit) is like a small artist living inside your computer's main brain (the CPU). 

Unlike a separate, big artist (a dedicated graphics card), this small artist shares the same space and resources with the main brain. This means that while it's good for everyday tasks like watching videos, doing homework, or playing simple games, it's not as powerful for heavy-duty tasks like playing big, graphics-heavy video games or doing 3D design. It's like having a helper for graphics inside your computer without needing extra space or power. -->

---

## FAQ

### How to Setup PostIZ

Schedule post on social media:

* https://docs.postiz.com/introduction

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Postiz" title="PostIZ Container | Docker Configs 🐋✅ ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik" title="Traefik Container | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

![PostIZ working with https](/blog_img/selfh/postiz/postiz-https-ui.png)

Once logged into PostIZ:

![Postiz UI](/blog_img/selfh/postiz/postiz-ui.png)

### How to setup n8n

As long as you have docker ready, you are good to go:

![N8N Creating user and password](/blog_img/selfh/postiz/n8n-setup.png)

![N8N UI Panel](/blog_img/selfh/postiz/n8n-ui.png)

```yml
services:
  n8n:
    image: n8nio/n8n
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=user
      - N8N_BASIC_AUTH_PASSWORD=password
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=db
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=n8n
      - NODE_FUNCTION_ALLOW_EXTERNAL=axios,qs
      #- N8N_SECURE_COOKIE=False
    depends_on:
      - db
    restart: unless-stopped

  db:
    image: postgres:12
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=n8n
      - POSTGRES_DB=n8n
    restart: unless-stopped

volumes:
  db-data:
```