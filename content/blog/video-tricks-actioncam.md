---
title: "More video Tricks [with FFMPEG]"
date: 2025-03-09
draft: false
tags: ["Dev"]
description: 'Quick videos with action cameras. Testing Python GPX overlay to MP4 compared to Gyroflow.'
url: 'my-action-cam-video-workflow'
---

So far, ive been doing couple of things with the **action cam**.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/" title="OA5 Pro 101 ↗"  >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/" title="OA5Pro Firmware Update ↗" >}}
{{< /cards >}}


Even apply **data analytics for action cams** andfor karting!

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/geospatial-data/" title="Geospatial Analysis (with action cams) ↗" >}}
{{< /cards >}}

Now its time for a recap on my **latest video tricks**.


## High vs Low Bit Rate

**Bit rate for video** simply refers to the **amount of data used per second** to store the video. It's usually measured in **bits per second (bps)**, often expressed as kilobits per second (kbps) or megabits per second (Mbps).

**Higher bit rate = More data = Better video quality (more detail, less compression artifacts) = Larger file size.**

**Lower bit rate = Less data = Lower video quality (more compression, potential for blurriness or blockiness) = Smaller file size.**

Think of it like the "flow" of information for the video. 

A higher bit rate means a richer, faster flow of visual data, resulting in a better picture.

### FHD - 1080/30

1. With the [updated firmware](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/) and **high bit rate**, `1080p30 UW RS` I got these files with `H.265` codec:

* 38.9GB total MP4 files (every 17.2gb or 1h 12min there is a file reset)
* Bitrate 31168 kbps, with an average size of **~4.03MB/s**
* Using 80% of the total battery for those ~2h 45min of video

> This happened while recording at ~0C


2. With the [updated firmware](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/) and **low bit rate**, `1080p30 UW RS` I got:

* 41.6GB total MP4 files (every 17.2gb or 1h 13min there is a file reset)
* Bitrate 30739 kbps, with an average size of **~3.98MB/s**
* Using 93% of the total battery for those ~2h 45min of video

> This happened while recording at room temperature ~20C

3. How about 1080/60?

### 4K

3. **At 60fps**

Three files with a total size of 35.5GB and draining battery to 67% (-33%) for 42min and 50s video.

Recording at **4K/60fps RS+** and standard (no UW, h.265) and **high bitrate**.

<!-- https://www.youtube.com/watch?v=Ke-8yhgC_uU&t=775s -->

{{< youtube "Ke-8yhgC_uU" >}}

To fill the internal memory, you get around ~57 min of video.

> All of this at -2C. For YT these are `2160p60`.

4. **With 4K/120 RS+**

Recording with **high bitrate**, I got 4 different files with total size of 48GB (full internal memory) and battery drained from 100 to 37% (-63%)

> In youtube will be as `2160p60` (4k), but 60 fps as well 

### 2.7K

5. **2.7k/30 RS+** and high bit rate

<!-- https://www.youtube.com/watch?v=-Pv-EKYv1vA -->

{{< youtube "-Pv-EKYv1vA" >}}

> In youtube you will see those as `1440p`

6. **2.7/60/RS+/high BR**




> `1440p60`

---

## Data Overlay with Python

I was already **analyzing GoPro Metadata**:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/geospatial-data/" title="Go Pro Telemetry Post" image="/blog_img/karting/gopro-speed-sample.png" subtitle="Karting and MetaData 101" >}}
  {{< card link="https://github.com/JAlcocerT/Py_RouteTracker/tree/main/Z_GoPro" title="Go Pro Telemetry EDA" image="/blog_img/apps/gh-jalcocert.svg" subtitle="EDA Metadata Extraction at PyRouteTracker" >}}
{{< /cards >}}


But how about adding **telemetry overlays to MP4's**?


### GoPro Python Metadata Overlay

Python MoviePy...

...actually uses **FFMPEG**, but makes it more scriptable, in theory.

### DJI and GPX Overlay

And for action cams without GPS... like my DJI OA5Pro.

How about recording the route on another app and just syncing it?

{{< details title="Gemini Overlay explanation 📌" closed="true" >}}

Building a Python tool to overlay GPX data onto MP4 videos is a **challenging but rewarding project**. 

Steps and libraries you'll need:

**1. Libraries:**

* **`gpxpy`:** For parsing and working with GPX files.  `pip install gpxpy`
* **`moviepy`:** For video editing and overlaying. `pip install moviepy`
* **`opencv-python` (cv2):** For image and video processing. `pip install opencv-python`
* **`matplotlib` (optional):** For creating graphs or custom visualizations. `pip install matplotlib`
* **Potentially others:** Depending on your specific visualization needs (e.g., for map tiles if you want a map background).

**2. Core Logic:**

* **GPX Parsing:** Use `gpxpy` to load and parse the GPX file. Extract the latitude, longitude, time, and optionally speed data points.
* **Video Handling:** Use `moviepy` to load the MP4 video.
* **Synchronization:** This is the trickiest part. You'll need to establish a correspondence between the timestamps in your GPX data and the frames in your video.  Here are a couple of approaches:
    * **Manual Synchronization:**  Allow the user to specify a start time offset or identify a specific event in both the video and the GPX data to align them.  This is often the most practical.
    * **Automated Synchronization (Advanced):**  This could involve analyzing audio or video features to find matching points, but it's significantly more complex.
* **Visualization:**
    * **Position Overlay:** Use `opencv-python` to draw the GPS track on each frame of the video. You can convert latitude/longitude to pixel coordinates. Consider using a map image as a background for better visualization.
    * **Speed Graph:** Use `matplotlib` to create a graph of speed over time. Then, use `moviepy` to add this graph as an overlay on the video.
    * **Other Data:** You can overlay any data from your GPX file (heart rate, altitude, etc.) using similar techniques.
* **Video Composition:** Use `moviepy` to combine the original video with the overlays you've created.

**3. Code Structure (Conceptual):**

```python
import gpxpy
import gpxpy.gpx
from moviepy.editor import VideoFileClip, ImageClip, CompositeVideoClip
import cv2
import matplotlib.pyplot as plt
import numpy as np

def overlay_gpx_on_video(video_path, gpx_path, output_path):
    # 1. Load video and GPX data
    video = VideoFileClip(video_path)
    with open(gpx_path, 'r') as gpx_file:
        gpx = gpxpy.parse(gpx_file)

    # 2. Synchronization (Manual example)
    time_offset = float(input("Enter time offset (seconds) between video and GPX: "))  # User input

    # 3. Visualization (Position Overlay Example)
    frames = []
    for i, track in enumerate(gpx.tracks):
        for j, segment in enumerate(track.segments):
            for k, point in enumerate(segment.points):
                timestamp = point.time + timedelta(seconds=time_offset)
                frame_time = timestamp.timestamp() - video.start # Time relative to video start
                if frame_time >= 0 and frame_time <= video.duration:
                    frame = video.get_frame(frame_time)
                    # Convert lat/lon to pixel coordinates (You'll need a mapping function)
                    x, y = lat_lon_to_pixels(point.latitude, point.longitude)  # Implement this
                    cv2.circle(frame, (x, y), 5, (0, 0, 255), -1)  # Draw a circle
                    frames.append(ImageClip(frame).set_duration(1/video.fps)) #add frame to the list of frames

    final_clip = concatenate_videoclips(frames)
    final_clip.write_videofile(output_path, fps=video.fps)


def lat_lon_to_pixels(lat, lon):  # Example (You'll need a proper projection)
    # This is a VERY simplified example and won't be accurate for real-world use.
    # You'll need to use a proper map projection library (e.g., pyproj) for accurate conversion.
    # Assume a simple linear mapping for demonstration:
    map_width = 1000  # Example
    map_height = 500  # Example
    min_lat = 0       # Example (Get from your map data)
    max_lat = 90      # Example
    min_lon = 0       # Example
    max_lon = 180     # Example

    x = int((lon - min_lon) / (max_lon - min_lon) * map_width)
    y = int((lat - min_lat) / (max_lat - min_lat) * map_height)
    return x, y

# Example usage:
video_path = "your_video.mp4"
gpx_path = "your_gpx.gpx"
output_path = "output_video.mp4"
overlay_gpx_on_video(video_path, gpx_path, output_path)

```

**4. Key Challenges and Improvements:**

* **Accurate Synchronization:**  This is the most crucial and often the most difficult part.
* **Map Projection:**  For accurate position overlays, you'll need to use a proper map projection library (like `pyproj`) to convert latitude/longitude to pixel coordinates on a map image.  You'll likely want to use a tile server or download map tiles.
* **Performance:** Processing video frame by frame can be slow. Consider optimizing your code for performance.
* **User Interface:** For a more user-friendly tool, you could create a graphical user interface (GUI) using libraries like `Tkinter`, `PyQt`, or `Kivy`.
* **Error Handling:** Add robust error handling to your code.

This detailed breakdown should give you a solid starting point for building your Python GPX overlay tool.

Remember that this is a complex project, so break it down into smaller, manageable steps.

Start with the basics (loading video and GPX, basic visualization) and then gradually add more features (synchronization, map integration, speed graphs, etc.).  Good luck!


{{< /details >}}

---

## Conclusions

Its great to look back and see **how far ive gone regarding videos**.

At least compared from where I started!

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-youtube-ai-workflow/" title="YT AI Workflow ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/" title="Video edition at x300 ↗" >}}  
{{< /cards >}}

{{< callout type="info" >}}
Watching **4k video on Linux** might not be **fluent** until you install these:
{{< /callout >}}


```sh
sudo apt install vlc
sudo apt install ubuntu-restricted-extras
```

---

## FAQ

### Transfering Files

**Moving just MP4's** will save you ~23% of the transfer load.

I prefer to do it with **rsync**:

```sh
#cp *.MP4 /home/jalcocert/Desktop/oa5pro/
#rsync -avP *.MP4 /home/jalcocert/Desktop/oa5pro/ #it creates the folder if its not there | no overwrite
#rsync -avP *.MP4 /media/jalcocert/Backup2TB/DJI-OA5Pro #copy it to an external SSD

rsync -avP --include='*.MP4' --exclude='*' /media/jalcocert/OsmoAction/DCIM/DJI_001/ ~/Desktop/CAM/
rsync -avP --include='*.MP4' --exclude='*' . ~/Desktop/CAM3/
mkdir -p "$HOME/Desktop/CAM1-$(date +%m-%d)" && rsync -avP --include='*.MP4' --exclude='*' . "$HOME/Desktop/CAM1-$(date +%m-%d)"


#rm *.LRF #clean if needed LRF
```

![Graphic Walker UI](/blog_img/selfh/rsync.png)

> When moving the full 48GB, it will take ~20min

If later on you want to **group them per record date**:

```sh
for file in *; do
  if [[ -f "$file" ]]; then
    date_str=$(stat -c %y "$file" | cut -d ' ' -f 1 | tr -d '-')
    mkdir -p "$date_str"
    mv "$file" "$date_str/"
  fi
done
```

> This will create directories like 20250318, 20250319, and 20250320 and move the respective files into them.

### Quick Videos - FFMPEG CLI

Making things simpler with CLI.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition" title="YT Video Edition Github ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/#ffmpeg-video-workflow-for-windows" title="FFMPeg Windows Samples | Post ↗" >}}
{{< /cards >}}



{{< details title="FFMPEG CLI Tricks within Linux 📌" closed="true" >}}

1. **Simply Join**: Keeping original audio and **no reencoding**.

```sh
###ffmpeg -i "concat:$(ls *.mp4 | tr '\n' '|')" -c copy output_video.mp4 #all from a folder
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .MP4 of current folder to a list
#du -sh ./* #check their size

#Generate a video with the mentioned files (IT PRESERVES THE ORIGINAL FORMATS, BITRATE...)
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
##different output folder (if you do it from OA5 to desktop you will be limited by transfer speed)
ffmpeg -f concat -safe 0 -i file_list.txt -c copy /home/jalcocert/Desktop/output_video.mp4 

#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4 #silenced video
#ffmpeg -i output_video.mp4 -filter:v "setpts=PTS/4" -an fast_output_video.mp4 #fast output
```

2. **Join (Silenced) + Song**

```sh
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list

#du -sh ./* #check their size

#generate a video from few parts
#ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4 #silenced video
#ffmpeg -i output_video.mp4 -filter:v "setpts=PTS/4" -an fast_output_video.mp4 #

#ffmpeg -stream_loop -1 -i "AETHER - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4
ffmpeg -stream_loop -1 -i "TRAVELATOR - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4

### 🎵 Music by: 
```

3. **Extract images** from a video:

```sh
4ffmpeg -i input_video.mp4 -vf "select='gte(t\,120)',fps=1" -vsync vfr frame_%03d.png
ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.png
#ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.jpg


#between 2 seconds, 1fps extracts and creates a folder
#ffmpeg -i DJI_20250116072528_0035_D.MP4 -vf "select='between(t,90,105)',fps=1" -vsync vfr frame_%03d.png
mkdir -p "./$(basename DJI_20250215215547_0006_D.MP4 .MP4)" && ffmpeg -i DJI_20250215215547_0006_D.MP4 -vf "select='between(t,260,262)',fps=1" -vsync vfr "./$(basename DJI_20250215215547_0006_D.MP4 .MP4)/frame_%03d.png"
```

4. How to **reduce image quality** in Linux - To upload as **youtube thumbnail**:

```sh
#ffmpeg -i thumbnail.png -c:v libwebp -quality 80 compressed_thumbnail.webp
#ffmpeg -i PXL_20241030_115355466.jpg -q:v 3 compressed_PXL_20241030_115355466.jpg
ffmpeg -i thumbnail.png -qscale:v 2 compressed_thumbnail.jpg
```


{{< /details >}}


{{< details title="Extracting images from a video...and making a gif 📌" closed="true" >}}


1. From a timeframe until the end, 1 frame:

```bash
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

{{< tabs items="FFMPEG Scripts,For Linux,For Windows" >}}

  {{< tab >}}
  After using this commands several times...

  I thought about creating the scripts.

  See **music for your videos**, *from youtube, [here](https://www.youtube.com/audiolibrary)*: https://www.youtube.com/audiolibrary
  {{< /tab >}}

  {{< tab >}}
  **[Linux script](https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/FFMpeg/Video_ffmpeg.sh)**


```sh
sudo apt install ffmpeg
#scp /home/jalcocert/Desktop/'Jungle Atmosphere Morning.mp3' jalcocert@192.168.0.12:/home/jalcocert/Desktop/CAM2/

#rsync -avP *.MP4 /home/jalcocert/Desktop/oa5pro/ #it creates the folder if its not there | no overwrite
#rsync -avP *.MP4 /media/jalcocert/Backup2TB/DJI-OA5Pro #copy it to an external SSD
rsync -avP --include='*.MP4' --exclude='*' /media/jalcocert/OsmoAction/DCIM/DJI_001/ ~/Desktop/CAM2/

#rm *.LRF #clean just LRF files
#ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list
#ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
#ffmpeg -stream_loop -1 -i "Jungle Atmosphere Morning.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4

#wget https://raw.githubusercontent.com/JAlcocerT/Linux/refs/heads/main/Z_Linux_Installations_101/FFMpeg/Video_ffmpeg.sh
chmod +x Video_ffmpeg.sh
./Video_ffmpeg.sh
```

  {{< /tab >}}

  {{< tab >}}**Windows script**
  {{< /tab >}}

{{< /tabs >}}





#### Telemetry Data

Extracting data from action camera `.MP4` files.

> It all started with [PhyPhox](https://jalcocert.github.io/JAlcocerT/blog/tinker-phyphox/) and [PyRouteTracker](https://jalcocert.github.io/JAlcocerT/polar-data-python-analysis/)

```sh
sudo apt-get install libimage-exiftool-perl
exiftool -ee ./GX030390.MP4
#exiftool -ee ./GX030390.MP4 > output.txt
```

If you do similarly with a OA5Pro video and **see the metadata**, the output is **much more reduced**

```sh
exiftool -ee ./DJI_20241008163958_0031_D.MP4 #no GPS - no party
```

* Make the magic happen with moviepy: https://zulko.github.io/moviepy/getting_started/updating_to_v2.html

#### FFMPEG

Some tricks with **ffmpeg package**.

> No reencoding = Quick 

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition" title="Video Edition Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Tricks for quick videos as a code from action cams" >}}
{{< /cards >}}

1. **Simply Join**: Keeping original audio and no reencoding.

```sh
###ffmpeg -i "concat:$(ls *.mp4 | tr '\n' '|')" -c copy output_video.mp4 #all from a folder
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .MP4 of current folder to a list
#du -sh ./* #check their size

#Generate a video with the mentioned files (IT PRESERVES THE ORIGINAL FORMATS, BITRATE...)
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
ffmpeg -f concat -safe 0 -i file_list.txt -c copy /home/jalcocert/Desktop/output_video.mp4 #different folder (if you do it from OA5 to desktop you will be limited by transfer speed)

#ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4 #silenced video
#ffmpeg -i output_video.mp4 -filter:v "setpts=PTS/4" -an fast_output_video.mp4 #
```

2. **Join (Silenced) + Song**

```sh
ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list

#du -sh ./* #check their size

#generate a video from few parts
#ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4 #silenced video
#ffmpeg -i output_video.mp4 -filter:v "setpts=PTS/4" -an fast_output_video.mp4 #

#ffmpeg -stream_loop -1 -i "AETHER - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4
ffmpeg -stream_loop -1 -i "TRAVELATOR - Density & Time.mp3" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4

### 🎵 Music by: 
```

3. Extract images from video:

```sh
4ffmpeg -i input_video.mp4 -vf "select='gte(t\,120)',fps=1" -vsync vfr frame_%03d.png
ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.png
#ffmpeg -i DJI_20250116072852_0036_D.MP4 -vf "select='gte(t\,90)',fps=1" -vsync vfr frame_%03d.jpg


#between 2 seconds, 1fps extracts and creates a folder
#ffmpeg -i DJI_20250116072528_0035_D.MP4 -vf "select='between(t,90,105)',fps=1" -vsync vfr frame_%03d.png
mkdir -p "./$(basename DJI_20250215215547_0006_D.MP4 .MP4)" && ffmpeg -i DJI_20250215215547_0006_D.MP4 -vf "select='between(t,260,262)',fps=1" -vsync vfr "./$(basename DJI_20250215215547_0006_D.MP4 .MP4)/frame_%03d.png"
```

4. How to reduce image quality in Linux to upload as **youtube thumbnail**:

```sh
#ffmpeg -i thumbnail.png -c:v libwebp -quality 80 compressed_thumbnail.webp
#ffmpeg -i PXL_20241030_115355466.jpg -q:v 3 compressed_PXL_20241030_115355466.jpg
ffmpeg -i thumbnail.png -qscale:v 2 compressed_thumbnail.jpg
```

5. If you record on a chest mount and sometimes take the cam in the regular position, you will have to use the **rotation variable for the joins** and you wont escape the **reencoding** this time.

```sh
#sudo apt install mediainfo

for video in *.MP4; do
    echo "File: $video"
    mediainfo "$video" | grep -E 'Rotation|Width|Height|Format|Duration'
    ffprobe -v error -select_streams v:0 -show_entries stream=width,height,duration,codec_name,r_frame_rate -show_entries stream_tags=rotate "$video" | grep -E "TAG:rotate|width|height|duration|codec_name|r_frame_rate"
    echo "-----------------------"
done
```

> Just record consistently in one orientation the videos you want to join later (maybe?)

**Space what?**

You might need some space after playing around with action cams.

```sh
df -h | awk '$2 ~ /G/'
#df -h | awk '$2 ~ /G/' | sort -rh -k 2 #sorted
df -h | awk '$5 > "5G" {print $0}' #list the partitions greater than 5GB
```

1. Have a look to the **trash**

```sh
#gio trash --empty
du -sh ~/.local/share/Trash/files
```

2. Maybe unused **container** images?

```sh
docker builder prune
#docker system prune -a
#docker volume prune
docker image prune -a
```

**Summary Table:**

| Command             | Focus                     | Cleans                                     | Data Loss Risk |
|----------------------|---------------------------|---------------------------------------------|----------------|
| `docker builder prune` | Build Cache               | Unused build layers                       | Low            |
| `docker system prune`  | All Unused Resources       | Containers, Networks, Dangling Images, Build Cache | Medium         |
| `docker volume prune`  | Unused Volumes            | Volumes not attached to any container       | **HIGH**       |
| `docker image prune`   | Dangling/Untagged Images | Dangling images, optionally all untagged images | Medium         |

**Which one to use?**

* Start with `docker system prune` if you want a general cleanup.
* Use `docker builder prune` if you're only concerned about build cache.
* Be *extremely* careful with `docker volume prune` as it can delete data.
* Use `docker image prune` with the `-a` option if you want to remove all untagged images (including older versions that might be taking up space).  Be sure you don't need those older versions!

### Night Video

People keeps doing cool things and giving cool recommendations: https://www.youtube.com/watch?v=_mHT8RGDHos

Example with OA4:


<!-- https://www.youtube.com/watch?v=koD1RXSyR1c -->

{{< youtube "koD1RXSyR1c" >}}

2.7K and 4K in 4:3 aspect ratio at 24-60fps.
2.7K and 4K in 16:9 aspect ratio at 100/120fps.
Wide-angle mode.

> They also add the important detail that the in camera stabilization must be turned off to record the gyro data.


#### Gyroflow

**Gyroflow** is an application that can **stabilize your video by using motion data** from a gyroscope and optionally an accelerometer.

Modern cameras record that data internally (GoPro, Sony, Insta360 etc), and this application stabilizes the captured footage precisely by using them. 

{{< callout type="warning" >}}
To capture gyro data with the OA5Pro, make sure to have **RS disabled + Wide** video mode
{{< /callout >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-telemetry-trackdays/" title="Telemetry Trackdays | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#extracting-telemetry-data-from-gph9" title="Go Pro H9 telemetry extraction | Post ↗" >}}
{{< /cards >}}

```sh
#choco install exiftool
#exiftool -ver
exiftool -ee .\DJI_20250504152345_0011_D.MP4 #working when recorded W and no RS!
```

> I got a sample acelerometer data every 0.3s *when recording at 30FPS*

It can also use gyro data from an external sources (eg. from Betaflight blackbox).

* https://github.com/gyroflow/gyroflow
  * https://gyroflow.xyz/download

> GPL v3.0 | **Video stabilization** using gyroscope data

For Windows you have it on the [microsoft store](ms-windows-store://pdp?hl=en-us&gl=pl&productid=9NZG7T0JCG9H&mode=mini&pos=1920%2C0%2C1920%2C1080&referrer=storeforweb&source=https%3A%2F%2Fgyroflow.xyz%2F), for linux:

```sh
sudo apt update
sudo apt install fuse
sudo apt install libc++1

#https://github.com/gyroflow/gyroflow/releases

wget https://github.com/gyroflow/gyroflow/releases/download/v1.6.0/Gyroflow-linux64.AppImage
chmod +x Gyroflow-linux64.AppImage
./Gyroflow-linux64.AppImage


#alternatively
wget https://github.com/gyroflow/gyroflow/releases/download/v1.6.0/Gyroflow-linux64.tar.gz
tar -xzvf Gyroflow-linux64.tar.gz
cd Gyroflow
chmod +x gyroflow
./gyroflow

```

{{< callout type="info" >}}
Cross-platform - works on Windows/Linux/Mac/Android/iOS and it uses FFMPEG internally :)
{{< /callout >}}

#### KDEnLive

> I was also using kdenlive as seen [here](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#kdenlive)


```sh
flatpak install flathub org.kde.kdenlive
```

<!-- ![alt text](/blog_img/outro/kdenlive.png) -->
<!-- 
![DJI Osmo Action 5 Pro](/blog_img/hardware/dji_oa5pro.jpg) -->


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/" title="OA5Pro" image="/blog_img/hardware/dji_oa5pro.jpg" subtitle="Action Cam Review" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#kdenlive" title="KDenLive with OA5Pro" image="/blog_img/outro/kdenlive.png" subtitle="Editing video with kdenlive" >}}
{{< /cards >}}

### Youtube video Descriptions

```md
Kampinos, 8 xyz 2025
DJI OA5Pro 4k/30/RS/UW

0:00 Introduction
1:46 Section Two
4:57 Final Section

[Any other relevant description text can go here]
```