---
title: "More Photo and Video fun stuff"
date: 2025-05-12T13:20:21+01:00
draft: false
tags: ["Dev"]
description: 'From ffmpeg CLIs to color grading LUTs. And AI generated audio for shorts.'
url: 'photo-video-tinkering'
---

We come from...

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="Video Tricks ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/#chocolatey-and-ffmpeg" title="Chocolatey and FFMPEG ↗" >}}
{{< /cards >}}


https://www.youtube.com/watch?v=kaa1vPHqKdw


## Photo Editing

Spending a lot on smartphone with cool cameras to...use snapseed?

Come on... whats next?

Uploading to social media in low resolution?


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


## Video Editing


### CLI Tricks


{{< details title="FFMPEG CLI Tricks | Ubuntu 📌" closed="true" >}}

**Extracting images from a video...and making a gif**

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


#### Shorts

How about adding [TTS generated audio](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Audio/openai-tts.py) to shorts?

### Kdenlive

### Gyroflow

* https://github.com/gyroflow/lens_profiles/tree/main/DJI

## Filters

### ND Filters
<!-- 
https://allegro.pl/oferta/zestaw-6-filtrow-nd-8-16-32-64-1000-cpl-dji-osmo-action-4-3-fw-oa4-ald-15143043373
https://allegro.pl/oferta/etui-pokrowiec-na-kamere-sportowa-dji-osmo-action-3-4-5-pro-gopro-13-16982113322?reco_id=cc5aea34-1efb-11f0-9d44-c214b156ab4e&sid=662c7a15915b4ff7cbe3591dc77c5ba25a9c6e61630a3346ef7abf0742c8b1f5&dd_referrer=https%3A%2F%2Fallegro.pl%2Fkategoria%2Fkamery-kamery-sportowe-147894%3Fstring%3Ddji%2520osmo%2520action%25205 -->

A **Neutral Density (ND) filter** is essentially a **sunglass for your camera lens**. It's a filter made of darkened glass or resin that reduces the amount of light entering the camera sensor **without affecting the color** or **hue** of the scene.

Here's a more detailed breakdown:

**How they work:**

* ND filters are designed to reduce the intensity of **all wavelengths of light equally**. This means they dim the overall brightness of the scene without introducing any color casts (in theory; some cheaper ND filters might have slight color shifts).
* They work by absorbing or reflecting a certain percentage of the incoming light.

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

**In the context of video:**

ND filters are particularly crucial for video because you typically want to maintain a consistent frame rate and shutter speed for natural motion. Adjusting the aperture and ISO (sensitivity) are the primary ways to control exposure, but aperture also affects depth of field, and increasing ISO can introduce noise. ND filters provide an additional way to control the amount of light without sacrificing your desired cinematic motion or depth of field.

While a good quality ND filter should ideally not affect color, some cheaper ones might introduce a slight color cast. It's generally recommended to invest in reputable brands to minimize this issue. Post-processing can often correct minor color casts if they occur.

Essentially, ND filters give you greater control over your exposure settings in bright light, allowing you to achieve creative effects and maintain the desired look and feel of your video or photographs.


https://www.youtube.com/watch?v=00e8XDRoge4

{{< youtube "00e8XDRoge4" >}}


<!-- https://www.youtube.com/watch?v=oIJlSP0u6FU -->



---

## Conclusions


<!-- https://www.youtube.com/watch?v=-OO6Qrw6NWE -->

{{< youtube "-OO6Qrw6NWE" >}}



<!-- https://www.youtube.com/watch?v=7CnjKua865Y -->

{{< youtube "7CnjKua865Y" >}}



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

Yes, you can definitely apply color grading LUTs using both **Kdenlive** and **FFmpeg**. Here's how:

Applying LUT with KDEnlive: https://www.dji.com/pl/downloads/softwares/dji-osmo-action-5-pro-d-log-m-to-rec-709-vivid-lut

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

https://www.youtube.com/watch?v=-g0E4ntS8qA

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