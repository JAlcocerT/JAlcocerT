---
title: "Local Text to Speech with xTTS2 UI"
date: 2025-12-15T23:20:21+01:00
draft: false
tags: ["Gen-AI","Docker","Self-Hosting"]
cover:
  image: "https://socialify.git.ci/BoltzmannEntropy/xtts2-ui/image?description=1&descriptionEditable=Discovering%20weather%20patterns%20with%20Python%20%0A%0A&font=Inter&name=1&owner=1&pattern=Solid&theme=Auto" # image path/url 
  alt: "SelfHosting xTTS2 with Docker." # alt text
  caption: "Succesfull installation of xTTS2 with Docker." # display caption
description: 'Clone audio with xTTS2'
summary: 'Installing xTTS2 with Docker. Clone audio locally.'    
url: 'guide-xtts2-ui-docker'
---

https://github.com/BoltzmannEntropy/xtts2-ui
https://github.com/BoltzmannEntropy/xtts2-ui?tab=MIT-1-ov-file#readme

The model used

https://coqui.ai/cpml.txt

Hardware needed: works with CPU ✅




```yml
version: '3'

services:
  audio:
    image: python:3.10-slim
    container_name: audio
    command: tail -f /dev/null
    volumes:
      - ai_audio:/app
    working_dir: /app  # Set the working directory to /app
    ports:
      - "7865:7865"

volumes:
  ai_audio:
```

```sh
podman exec -it audio /bin/bash
python --version
```


```sh
apt update
apt install git
#git --version
git clone https://github.com/BoltzmannEntropy/xtts2-ui
cd xtts2-ui

#python -m venv venvaudio
#pip3 install torch torchvision torchaudio && pip install -r requirements.txt && pip install --upgrade TTS && streamlit run app2.py
pip3 install torch torchvision torchaudio #https://pytorch.org/get-started/locally/
pip install -r requirements.txt
pip install --upgrade TTS

streamlit run app2.py 
```

## Streamlit UI



```sh
streamlit run app2.py
```

---

## FAQ

https://github.com/kanttouchthis/text_generation_webui_xtts/?tab=readme-ov-file

With **Oobaboga Gradio UI**

And its extensions: https://github.com/oobabooga/text-generation-webui-extensions


#### Voice?

Generally, here you can get many ideas: <https://github.com/sindresorhus/awesome-whisper>

Also, in [HF there are already interesting projects](https://jalcocert.github.io/Linux/docs/linux__cloud.md/llms/#how-to-use-hf).

* <https://www.futuretools.io/tools/uberduck>
* [Audiocraft](/whishper-docker/#how-to-install-audiocraft)
* ecoute (OpenAI API needed)
* Meeper (OpenAI API needed)
* Bark
* Whisper - https://github.com/openai/whisper
  * https://github.com/Vaibhavs10/insanely-fast-whisper
  * https://github.com/ggerganov/whisper.cpp
  * https://huggingface.co/openai/whisper-large-v2#long-form-transcription
  * https://github.com/SYSTRAN/faster-whisper
* [Whishper](https://fossengineer.com/whishper-docker)
  * <https://github.com/pluja/whishper>
  * https://libretranslate.com/
* https://github.com/CorentinJ/Real-Time-Voice-Cloning

* Linux Desktop App:

```sh
flatpak install flathub net.mkiol.SpeechNote
flatpak run net.mkiol.SpeechNote
```

* Not F/OSS: 
  * https://www.gladia.io/pricing
  * https://bigwav.app/
