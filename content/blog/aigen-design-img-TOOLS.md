---
title: "GUI's to use Stable Difussion Models"
date: 2030-08-15T23:20:21+01:00
draft: true
tags: ["Blender","Gen-AI"]
description: ''
url: ''
---


## Flux Models

https://mer.vin/2024/08/flux-fine-tuning/

https://huggingface.co/black-forest-labs/FLUX.1-schnell
https://github.com/ostris/ai-toolkit?tab=readme-ov-file#flux1-training

---

* SDXL Local LORA Training Guide: Unlimited AI Images of Yourself 
https://www.youtube.com/watch?v=y2J7EZUk_a0

## Fooocus AI

https://www.youtube.com/watch?v=9d6w90pAyrQ

https://github.com/lllyasviel/Fooocus

>  Focus on prompting and generating  - Fooocus is an image generating software (based on Gradio).

They provide a docker image (based on NVIDIA CUDA 12.4 and PyTorch 2.1) - https://github.com/lllyasviel/Fooocus/blob/main/docker.md

## Automatic111

https://github.com/AUTOMATIC1111/stable-diffusion-webui?tab=AGPL-3.0-1-ov-file#readme

>  Stable Diffusion web UI 

--->> /selfhosting-stable-difussion-docker

https://www.youtube.com/watch?v=QEbI6v2oPvQ
 How to use Stable Diffusion XL locally with AMD ROCm. With AUTOMATIC1111 WebUI and ComfyUI on Linux. 

https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/2334
https://www.youtube.com/watch?v=QEbI6v2oPvQ

`selfhosting-automatic111`


```sh
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
apt install wget git python3 python3-venv libgl1 libglib2.0-0


wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh

chmod +x webui.sh
./webui.sh
```

## ConfyUI

The most powerful and modular stable diffusion GUI with a graph/nodes interface.

<https://github.com/comfyanonymous/ComfyUI>

It can be run as portable and with CPU only - https://github.com/comfyanonymous/ComfyUI/tags

>  The most powerful and modular stable diffusion GUI, api and back-end with a graph/nodes interface. 

For Windows, there is even a portable `.exe` that you can try.

## LocalAI Image Generation

* https://localai.io/features/image-generation/

## How to use StableDifussion with GIMP?

---

## FAQ

### LoRa

CSV Video


## Tools for Image Generation with GenAI

### DaLLe

https://platform.openai.com/docs/guides/images/language-specific-tips

![alt text](/blog_img/GenAI/image/openai-dalle-t2i.png)

<!-- 
PPT with DaLle + SliDev 
-->

---------------

## The Stable Difussion Project

### Prompts for Stable Difussion Models




## Interfaces for Stable Difussion

SDXL Local LORA Training Guide: Unlimited AI Images of Yourself 
https://www.youtube.com/watch?v=y2J7EZUk_a0

Text2Image:

* Automatic111
    * https://github.com/lllyasviel/ControlNet - to get consistent results, like poses, faces and so on.
* Fooocus

* Flux versus stable difussion
    * https://huggingface.co/black-forest-labs/FLUX.1-schnell
    

#### What about Image Generation?

You can find them in [Hugging Face](https://huggingface.co/spaces):

* Stable Difussion: Quick Setup -> https://github.com/AbdBarho/stable-diffusion-webui-docker/wiki/Setup (Thanks to Jim Garage https://www.youtube.com/watch?v=5XHSV56hsJM)
  * <https://huggingface.co/runwayml/stable-diffusion-v1-5/tree/main>
  * <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/tree/main>
  * <https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/tree/main>
  * <https://huggingface.co/stabilityai/stable-diffusion-2-base>
  * <https://github.com/AUTOMATIC1111/stable-diffusion-webui> or <https://github.com/vladmandic/automatic>
    * <https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features#stable-diffusion-20>

* Foocus: <https://www.youtube.com/watch?v=zIhODzEVZqg> https://github.com/lllyasviel/Fooocus
* Speech to IMG?!: https://www.youtube.com/watch?v=IAc-G-enRII

What are other people building? https://civitai.com/

* <https://prompthero.com/prompt/ccc554cf355-stable-diffusion-1-5-renaissance-painting-of-darth-vader-in-pink-fur-as-a-fashion-model-vogue-oil-paint-on-dark-background-masked-darth>


### Fooocus AI

https://www.youtube.com/watch?v=9d6w90pAyrQ


If you want to use Anaconda/Miniconda, you can

```sh
    git clone https://github.com/lllyasviel/Fooocus.git
    cd Fooocus
    conda env create -f environment.yaml #conda config --set auto_activate_base false
    #source ~/.bashrc
    #conda --version
    conda activate fooocus
    pip install -r requirements_versions.txt
    #conda deactivate
```

Then download the models: download [default models](#models) to the folder "Fooocus\models\checkpoints". **Or let Fooocus automatically download the models** using the launcher:

```sh
    conda activate fooocus
    python entry_with_update.py
```

Or, if you want to open a remote port, use

    conda activate fooocus
    python entry_with_update.py --listen

Use `python entry_with_update.py --preset anime` or `python entry_with_update.py --preset realistic` for Fooocus Anime/Realistic Edition.

### Automatic111

https://www.youtube.com/watch?v=QEbI6v2oPvQ
 How to use Stable Diffusion XL locally with AMD ROCm. With AUTOMATIC1111 WebUI and ComfyUI on Linux. 

https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/2334
https://www.youtube.com/watch?v=QEbI6v2oPvQ

`selfhosting-automatic111`


1. Install the dependencies:
```bash
conda create -n ai-tools python=3.9
conda activate ai-tools
python --version

# Debian-based:
sudo apt install wget git python3 python3-venv
# Red Hat-based:
sudo dnf install wget git python3
# Arch-based:
sudo pacman -S wget git python3
```
2. Navigate to the directory you would like the webui to be installed and execute the following command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/JAlcocerT/stable-diffusion-webui/master/webui.sh)

```
3. Run `webui.sh`.
4. Check `webui-user.sh` for options.

---

Stable Difussion Web UI

RUn it with CPU:

```sh
python --version #3.12
conda create -n sd python=3.10.6
conda activate sd

python launch.py --skip-torch-cuda-test --exit
# Make sure Python version is 3.10+
python -m venv sd_env
source sd_env/bin/activate
git clone https://github.com/openvinotoolkit/stable-diffusion-webui.git
cd stable-diffusion-webui

python launch.py --skip-torch-cuda-test --exit
python launch.py --skip-torch-cuda-test

# export PYTORCH_TRACING_MODE=TORCHFX
# export COMMANDLINE_ARGS="--skip-torch-cuda-test --precision full --no-half" 

# # Launch the WebUI
# ./webui.sh 

```

> Torch for CPU ->> https://pytorch.org/get-started/locally/


### Vladmandic Automatic

https://github.com/vladmandic/automatic

https://github.com/vladmandic/automatic?tab=AGPL-3.0-1-ov-file#readme 

✅ 

### ConfyUI

The most powerful and modular stable diffusion GUI with a graph/nodes interface.

<https://github.com/comfyanonymous/ComfyUI>

### Easy Difussion



* {{< newtab url="https://github.com/easydiffusion/easydiffusion" text="Easydiffusion Source Code at Github" >}}
  * {{< newtab url="https://easydiffusion.github.io/" text="Easy Difussion Docs" >}}

```sh
wget https://github.com/cmdr2/stable-diffusion-ui/releases/latest/download/Easy-Diffusion-Linux.zip -O Easy-Diffusion-Linux.zip
unzip Easy-Diffusion-Linux.zip -d Easy-Diffusion
cd Easy-Diffusion
./start.sh
```

In Settings, you will see the Folder for the models: `/home/user/Desktop/easy-diffusion/models`

By default, it will be ready at `localhost:9000`, but you can also change it from the settings.

> Easiest 1-click way to create beautiful artwork on your PC using AI, with no tech knowledge - It supports SDXL, ControlNet, Lora's and Embeddings among others features

It runs on CPU out of the box - ~1min per image with SD1.5 and AMD Ryzen APU


## How to use StableDifussion with GIMP/Blender?

---

## FAQ

### LoRa

.CSV Video



### F/OSS Tools for Image

https://github.com/motion-canvas/motion-canvas

### How to use OpenVINO

https://github.com/openvinotoolkit/stable-diffusion-webui/wiki/Installation-on-Intel-Silicon


---


## The Stable Difussion Project

### Prompts for Stable Difussion Models




## Interfaces for Stable Difussion

SDXL Local LORA Training Guide: Unlimited AI Images of Yourself 
https://www.youtube.com/watch?v=y2J7EZUk_a0



### Fooocus AI

https://www.youtube.com/watch?v=9d6w90pAyrQ


If you want to use Anaconda/Miniconda, you can

```sh
    git clone https://github.com/lllyasviel/Fooocus.git
    cd Fooocus
    conda env create -f environment.yaml #conda config --set auto_activate_base false
    #source ~/.bashrc
    #conda --version
    conda activate fooocus
    pip install -r requirements_versions.txt
    #conda deactivate
```

Then download the models: download [default models](#models) to the folder "Fooocus\models\checkpoints". **Or let Fooocus automatically download the models** using the launcher:

```sh
    conda activate fooocus
    python entry_with_update.py
```

Or, if you want to open a remote port, use

    conda activate fooocus
    python entry_with_update.py --listen

Use `python entry_with_update.py --preset anime` or `python entry_with_update.py --preset realistic` for Fooocus Anime/Realistic Edition.

### Automatic111

https://www.youtube.com/watch?v=QEbI6v2oPvQ
 How to use Stable Diffusion XL locally with AMD ROCm. With AUTOMATIC1111 WebUI and ComfyUI on Linux. 

https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/2334
https://www.youtube.com/watch?v=QEbI6v2oPvQ

`selfhosting-automatic111`


1. Install the dependencies:
```bash
conda create -n ai-tools python=3.9
conda activate ai-tools
python --version

# Debian-based:
sudo apt install wget git python3 python3-venv
# Red Hat-based:
sudo dnf install wget git python3
# Arch-based:
sudo pacman -S wget git python3
```
2. Navigate to the directory you would like the webui to be installed and execute the following command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/JAlcocerT/stable-diffusion-webui/master/webui.sh)

```
3. Run `webui.sh`.
4. Check `webui-user.sh` for options.

---

Stable Difussion Web UI

RUn it with CPU:

```sh
python --version #3.12
conda create -n sd python=3.10.6
conda activate sd

python launch.py --skip-torch-cuda-test --exit
# Make sure Python version is 3.10+
python -m venv sd_env
source sd_env/bin/activate
git clone https://github.com/openvinotoolkit/stable-diffusion-webui.git
cd stable-diffusion-webui

python launch.py --skip-torch-cuda-test --exit
python launch.py --skip-torch-cuda-test

# export PYTORCH_TRACING_MODE=TORCHFX
# export COMMANDLINE_ARGS="--skip-torch-cuda-test --precision full --no-half" 

# # Launch the WebUI
# ./webui.sh 

```

> Torch for CPU ->> https://pytorch.org/get-started/locally/


### Vladmandic Automatic

https://github.com/vladmandic/automatic

https://github.com/vladmandic/automatic?tab=AGPL-3.0-1-ov-file#readme 

✅ 

### ConfyUI

The most powerful and modular stable diffusion GUI with a graph/nodes interface.

<https://github.com/comfyanonymous/ComfyUI>

### Easy Difussion



* {{< newtab url="https://github.com/easydiffusion/easydiffusion" text="Easydiffusion Source Code at Github" >}}
  * {{< newtab url="https://easydiffusion.github.io/" text="Easy Difussion Docs" >}}

```sh
wget https://github.com/cmdr2/stable-diffusion-ui/releases/latest/download/Easy-Diffusion-Linux.zip -O Easy-Diffusion-Linux.zip
unzip Easy-Diffusion-Linux.zip -d Easy-Diffusion
cd Easy-Diffusion
./start.sh
```

In Settings, you will see the Folder for the models: `/home/user/Desktop/easy-diffusion/models`

By default, it will be ready at `localhost:9000`, but you can also change it from the settings.

> Easiest 1-click way to create beautiful artwork on your PC using AI, with no tech knowledge - It supports SDXL, ControlNet, Lora's and Embeddings among others features

It runs on CPU out of the box - ~1min per image with SD1.5 and AMD Ryzen APU


## How to use StableDifussion with GIMP/Blender?

---

## FAQ

### LoRa

.CSV Video



### F/OSS Tools for Image

https://github.com/motion-canvas/motion-canvas