---
title: "Generating Images with AI - Stable Diffusion updates"
date: 2026-12-31
draft: true
tags: ["AI"]
description: "Using Stable Difussion with DreamBooth"
url: 'stable-difussion-free-generation'
---

Exactly **Three years ago** from this moment I was able to generate the following:

![Stable Difussion Sample](/blog_img/GenAI/jalcocert-author.png)

How much is **3** years in GenAI? 

Well...lets find that out.


{{< details title="Stable Diffusion Models📌" closed="true" >}}

{{< /details >}}

## Using APIs to Generate Images from Text 

If you are building your own apps, most certainly, you will try first with OpenAI Models:

{{< callout type="info" >}}
I tested **Dalle3 Model via OpenAI API** (while dev [StreamlitMultichat](https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main)), at [this script](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/Pict_for_SliDev-DaLLe/Dalle3SliDev.py)
{{< /callout >}}

### Other Interesting APIs for Image Generation

0. https://mammouth.ai/pricing

> Get access to multiple AI models for the price of one.

1. https://leonardo.ai/api/

2. You can always do with ChatGPT, yet I was impressed with **Gemini** image generation!

> Used it for a few tech talks

3. **Replicate** - You can fine tune the paid model with your images, then get access to their API

<!--
https://www.youtube.com/watch?v=lV82LDKT16A 
-->

{{< youtube "lV82LDKT16A" >}}

> Example with FastAPI to do a GenAI App

---

## FAQ


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


### Gradio?

Typical port is 7860

### Wait, What is...?

<!-- CUDA?? -->
<!-- 
**Ray Tracing:** Imagine you're playing a video game and you see reflections in water, shadows from trees, and light coming through windows. Ray tracing is a way to make these scenes look super realistic. 

**Integrated GPU (iGPU):** An integrated GPU (Graphics Processing Unit) is like a small artist living inside your computer's main brain (the CPU). 

Unlike a separate, big artist (a dedicated graphics card), this small artist shares the same space and resources with the main brain. This means that while it's good for everyday tasks like watching videos, doing homework, or playing simple games, it's not as powerful for heavy-duty tasks like playing big, graphics-heavy video games or doing 3D design. It's like having a helper for graphics inside your computer without needing extra space or power. -->


### Stable Difussion + DreamBooth to make custom Pictures

It was all possible thanks to [this DotCSV YT Video](https://www.youtube.com/watch?v=rgKBjRLvjLs)

<!-- {{< youtube id="v=rgKBjRLvjLs" autoplay="false" >}} -->
{{< youtube "rgKBjRLvjLs" >}}

> Does it work now?

### Foocus

* <https://github.com/ttio2tech/Fooocus>


### Confy-UI

* ConfyUI: <https://www.youtube.com/watch?v=Z0BYc-w-jaI>


### Flux



https://www.youtube.com/watch?v=r-uH1C_Vi08

### Using HuggingFace




### GPUs for AI

* RunPod
* Kutrim


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/rpi-mjpg-streamer" title="RunPod" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/pi-vs-orange/#the-raspberry-pi-4" title="Kutrim" >}}
{{< /cards >}}