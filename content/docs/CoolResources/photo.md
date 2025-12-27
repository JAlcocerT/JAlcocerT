---
title: Photo
type: docs
prev: /docs/video/
next: docs/
draft: false
---

If you are a photographer or just like to [go on adventures](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/), chances are you have a camera and a smartphone.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/#backups" title="Tech for a Trip" image="/blog_img/hardware/travel-pakc.jpg" subtitle="Hardware & Softw setup for traveling" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-management-tools/" title="Photo Tools" image="/blog_img/selfh/Photo/PiGallery-PhotoInfo.png" subtitle="PiGallery, PhotoView, Immich..." >}}
{{< /cards >}}



---


1. https://github.com/KDE/digikam

```sh
flatpak install flathub org.kde.digikam
```

2. PhotoQT


3. dupeGuru

```sh
sudo add-apt-repository universe
sudo apt install dupeguru-se
```

{{% details title="How to check for duplicate images - dupeGuru" closed="true" %}}

```sh
sudo apt install dupeguru
```

{{% /details %}} 

4. Upscayl

{{< cards cols="1" >}}
  {{< card link="https://github.com/upscayl/upscayl" title="Upscayl to enhance images locally" >}}
{{< /cards >}}

5. Darktable, RawTherapee *as OSS alternatives to adobe lightroom*

5. For background removal, try...


The best open source background removal tool currently known is **withoutbg**, an open-source application that works locally on your device without uploading images to the cloud, ensuring privacy.

It offers a Python package and an API and is available under the MIT license. 

Other notable open-source tools or models often mentioned include Python libraries such as **rembg** and AI models hosted on platforms like Hugging Face, but withoutbg stands out for local operation and ease of use.

If you want a powerful, privacy-respecting background remover that is free, open source, and runs locally, withoutbg is a leading choice as of 2025.

For simple needs or GUI apps, tools like **GIMP** with plugins can also do background removal but may be less automated.

If you're open to using online tools with open-source backends, platforms like remove.bg offer APIs but are not open source themselves.

In summary:

| Tool        | Type          | Key Feature                       | License     | Runs Locally? |
|-------------|---------------|---------------------------------|-------------|--------------|
| withoutbg   | CLI, API, lib | Open source, local operation     | MIT License | Yes          |
| rembg       | Python lib    | AI model-based background removal | Open Source | Yes          |
| GIMP with plugin | GUI       | Manual and semi-automated removal | GPL         | Yes          |
| remove.bg   | SaaS/Online   | High accuracy, easy to use       | Proprietary | No           |

Withoutbg is the best if you want open-source, local, privacy-focused background removal

* https://github.com/withoutbg/withoutbg

* https://github.com/danielgatis/rembg

> MIT |  Rembg is a tool to remove images background 