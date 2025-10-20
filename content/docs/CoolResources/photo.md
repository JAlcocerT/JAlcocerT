---
title: Photo
type: docs
prev: /docs/video/
next: docs/
draft: false
---

The best open source background removal tool currently known is **withoutbg**, an open-source application that works locally on your device without uploading images to the cloud, ensuring privacy. It offers a Python package and an API and is available under the MIT license. This tool focuses on background removal for images, providing effective AI-powered extraction with the advantage of running totally offline for enhanced security.[1]

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

Withoutbg is the best if you want open-source, local, privacy-focused background removal.[2][3][1]

https://github.com/danielgatis/rembg

> MIT |  Rembg is a tool to remove images background 

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

For background removal, try...