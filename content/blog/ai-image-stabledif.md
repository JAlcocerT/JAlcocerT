---
title: "Generating Images with AI - Stable Diffusion updates"
date: 2027-11-01
draft: true
tags: ["AI"]
description: "Using Stable Difussion with DreamBooth"
url: 'stable-difussion-free-generation'
---

pwa
https://github.com/kiri-art/stable-diffusion-react-nextjs-mui-pwa


Image Generation:  GUI's to use Stable Difussion Models

* Foocus
* Stable Difussion Web UI
* Easy Difussion

Exactly **FOUR years ago** from this moment I was able to generate the following:

![Stable Difussion Sample](/blog_img/GenAI/jalcocert-author.png)

I was testing at that time for the first time https://huggingface.co

Guided by a dotcsv video.

How much is **4** years in GenAI? 

Well...lets find that out.




{{< details title="Stable Diffusion Models📌" closed="true" >}}

{{< /details >}}

GUI's to use Stable Difussion Models

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


---

https://www.gradio.app/	

https://github.com/AbdBarho/stable-diffusion-webui-docker


OPTIMIZED Stable Diffusion 🤯 Vladmandic SD.Next + One-line install
https://github.com/TCNOco/TcNo-TCHT/blob/main/PowerShell/AI/vlad.ps1

iex (irm vlad.tc.ht)
https://tc.ht/PowerShell/AI/vlad.ps1


Write-Host "-------------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Welcome to TroubleChute's Vladmandic SD.Next (Automatic) installer!" -ForegroundColor Cyan
Write-Host "Vladmandic SD.Next (Automatic) as well as all of its other dependencies and a model should now be installed..." -ForegroundColor Cyan
Write-Host "[Version 2023-06-06]" -ForegroundColor Cyan
Write-Host "`nThis script is provided AS-IS without warranty of any kind. See https://tc.ht/privacy & https://tc.ht/terms."
Write-Host "Consider supporting these install scripts: https://tc.ht/support" -ForegroundColor Green
Write-Host "-------------------------------------------------------------------`n`n" -ForegroundColor Cyan

Set-Variable ProgressPreference SilentlyContinue # Remove annoying yellow progress bars when doing Invoke-WebRequest for this session
 
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script needs to be run as an administrator.`nProcess can try to continue, but will likely fail. Press Enter to continue..." -ForegroundColor Red
    Read-Host
}


nano installer0.sh
chmod +x installer0.sh
./installer0.sh


#!/bin/bash

echo "-------------------------------------------------------------------" | awk '{print "\033[36m" $0 "\033[39m"}'
echo "Welcome to TroubleChute's Vladmandic SD.Next (Automatic) installer!" | awk '{print "\033[36m" $0 "\033[39m"}'
echo "Vladmandic SD.Next (Automatic) as well as all of its other dependencies and a model should now be installed..." | awk '{print "\033[36m" $0 "\033[39m"}'
echo "[Version 2023-06-06]" | awk '{print "\033[36m" $0 "\033[39m"}'
echo ""
echo "This script is provided AS-IS without warranty of any kind. See https://tc.ht/privacy & https://tc.ht/terms."
echo "Consider supporting these install scripts: https://tc.ht/support" | awk '{print "\033[32m" $0 "\033[39m"}'
echo "-------------------------------------------------------------------"

#!/bin/bash

# Set variable to suppress progress bars
ProgressPreference="SilentlyContinue"

# Check if the user is running the script with sudo/admin privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script needs to be run as an administrator."
    echo "The process can try to continue, but it will likely fail."
    read -p "Press Enter to continue..." -r
fi



# Allow importing remote functions
iex (irm Import-RemoteFunction.tc.ht)
Import-RemoteFunction("Get-GeneralFuncs.tc.ht")

https://tc.ht/PowerShell/Modules/Import-RemoteFunction.ps1


# Source the script to make the functions available in the current shell session
source import_remote_function.sh

# Now you can use the functions
#import_remote_function "https://example.com/my_function.sh"
#import_function_if_not_exists "my_function" "https://example.com/my_function.sh"



# 1. Install Chocolatey
Clear-ConsoleScreen
Write-Host "Installing Chocolatey..." -ForegroundColor Cyan
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Import-FunctionIfNotExists -Command Get-TCHTPath -ScriptUri "Get-TCHTPath.tc.ht"
$TCHT = Get-TCHTPath -Subfolder "vladmandic"
 
# If user chose to install this program in another path, create a symlink for easy access and management.
$isSymlink = Sync-ProgramFolder -ChosenPath $TCHT -Subfolder "vladmandic"


#!/bin/bash

# Clear the terminal screen
clear

# Source the import_remote_function.sh file to make the function available
source import_remote_function.sh

# Use the import_function_if_not_exists function
import_function_if_not_exists "Get-TCHTPath" "https://example.com/Get-TCHTPath.tc.ht"
$TCHT=$(Get-TCHTPath -Subfolder "vladmandic")

# Rest of your script...

NOT SURE OF THIS PART


# 2. Install or update Git if not already installed
Clear-ConsoleScreen
Write-Host "Installing Git..." -ForegroundColor Cyan
iex (irm install-git.tc.ht)

git installed


# 3. Install aria2c to make the model downloads MUCH faster
Clear-ConsoleScreen
Write-Host "Installing aria2c (Faster model download)..." -ForegroundColor Cyan
choco upgrade aria2 -y



#!/bin/bash

# Clear the terminal screen
clear

# Display a message
echo "Installing aria2c (Faster model download)..."

# Update the package index before installing
sudo apt-get update

# Install or upgrade aria2
sudo apt-get install aria2 -y

aria2c --version


# 4. Install CUDA and cuDNN
if ((Get-CimInstance Win32_VideoController).Name -like "*Nvidia*") {
    Import-FunctionIfNotExists -Command Install-CudaAndcuDNN -ScriptUri "Install-Cuda.tc.ht"
    Install-CudaAndcuDNN -CudaVersion "11.8" -CudnnOptional $true
}


Not needed - cpu only


# 5. Check if Conda or Python is installed
# Check if Conda is installed
Import-FunctionIfNotExists -Command Get-UseConda -ScriptUri "Get-Python.tc.ht"
 
# Check if Conda is installed
$condaFound = Get-UseConda -Name "Vladmandic SD.Next" -EnvName "vlad" -PythonVersion "3.10.11"
 
# Get Python command (eg. python, python3) & Check for compatible version
if ($condaFound) {
    conda activate "vlad"
    $python = "python"
} else {
    $python = Get-Python -PythonRegex 'Python ([3].[1][0-1].[6-9]|3.10.1[0-1])' -PythonRegexExplanation "Python version is not between 3.10.6 and 3.10.11." -PythonInstallVersion "3.10.11" -ManualInstallGuide "https://github.com/vladmandic/automatic#install" 
    if ($python -eq "miniconda") {
        $python = "python"
        $condaFound = $true
    }
}
 
Not needed - cpu only





# 6. Check if has Vladmandic SD.Next directory ($TCHT\vladmandic) (Default C:\TCHT\vladmandic)
https://github.com/vladmandic/automatic

Clear-ConsoleScreen
if ((Test-Path -Path "$TCHT\vladmandic") -and -not $isSymlink) {
    Write-Host "The 'vladmandic' folder already exists. We'll pull the latest updates (git pull)" -ForegroundColor Green
    Set-Location "$TCHT\vladmandic"
    git pull
    if ($LASTEXITCODE -eq 128) {
        Write-Host "Could not find existing git repository. Cloning Retrieval-based-Voice-Conversion-WebUI...`n`n"
        git clone https://github.com/vladmandic/automatic.git .
    }
} else {
    Write-Host "I'll start by installing Vladmandic SD.Next first, then we'll get to the models...`n`n"
    
    if (!(Test-Path -Path "$TCHT\vladmandic")) {
        New-Item -ItemType Directory -Path "$TCHT\vladmandic" | Out-Null
    }
    Set-Location "$TCHT\vladmandic"
 
    git clone https://github.com/vladmandic/automatic.git .
}
 
if ($condaFound) {
    python -m venv ./venv
    ./venv/Scripts/python.exe -m pip install --upgrade pip
    ./venv/Scripts/python.exe -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
    ./venv/Scripts/python.exe -m pip install -r requirements.txt
    ./venv/Scripts/python.exe -m pip install clip_interrogator sqlalchemy rembg timm transformers==4.26.1
}


#!/bin/bash

# 6. Check if Vladmandic SD.Next directory ($TCHT/vladmandic) (Default /TCHT/vladmandic)
clear

if [[ -d "$TCHT/vladmandic" && ! -L $isSymlink ]]; then
    echo "The 'vladmandic' folder already exists. We'll pull the latest updates (git pull)" 
    cd "$TCHT/vladmandic"
    git pull
    if [ $? -eq 128 ]; then
        echo "Could not find existing git repository. Cloning Retrieval-based-Voice-Conversion-WebUI..."
        git clone https://github.com/vladmandic/automatic.git .
    fi
else
    echo "I'll start by installing Vladmandic SD.Next first, then we'll get to the models..."

    if [ ! -d "$TCHT/vladmandic" ]; then
        mkdir -p "$TCHT/vladmandic"
    fi
    cd "$TCHT/vladmandic"

    git clone https://github.com/vladmandic/automatic.git .
fi

if [[ $condaFound == true ]]; then
    python3 -m venv ./venv
    ./venv/bin/python -m pip install --upgrade pip
    ./venv/bin/python -m pip install torch torchvision torchaudio
    ./venv/bin/python -m pip install -r requirements.txt
    ./venv/bin/python -m pip install clip_interrogator sqlalchemy rembg timm transformers==4.26.1
fi





# 9. Download Stable Diffusion 1.5 model
https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors
Clear-ConsoleScreen
Write-Host "Getting started? Do you have models?" -ForegroundColor Cyan
do {
    Write-Host -ForegroundColor Cyan -NoNewline "`n`nDo you want to download the Stable Diffusion 1.5 model? (y/n) [Default: n]: "
    $defaultModel = Read-Host
} while ($defaultModel -notin "Y", "y", "N", "n", "")
 
if ($defaultModel -eq "Y" -or $defaultModel -eq "y") {
    Import-FunctionIfNotExists -Command Get-Aria2File -ScriptUri "File-DownloadMethods.tc.ht"
    Get-Aria2File -Url "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors" -OutputPath "models\Stable-diffusion\v1-5-pruned-emaonly.safetensors"
}


Get-Aria2File "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors" "./vladmandic/models/Stable-diffusion/v1-5-pruned-emaonly.safetensors"





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


<!-- https://learnwithhasan.com/remove-image-background-with-python/ -->


<!-- 
<https://github.com/AUTOMATIC1111/stable-diffusion-webui>
https://github.com/AUTOMATIC1111/stable-diffusion-webui -->

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

> [Agpl Licensed ✅ ](https://github.com/vladmandic/automatic?tab=AGPL-3.0-1-ov-file#readme)



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


https://www.youtube.com/watch?v=gHI6PjTkBF4

## How to use StableDifussion with GIMP/Blender?

https://www.youtube.com/watch?v=pA_tZCscOFg
{{< youtube "pA_tZCscOFg" >}}

https://www.youtube.com/watch?v=x60zHw_z4NM

---

## FAQ

### LoRa

.CSV Video



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

