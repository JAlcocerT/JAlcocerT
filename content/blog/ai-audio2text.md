---
title: "An overview of F/OSS Audio to Text Tools. Speech rAIter"
date: 2025-05-12T09:20:21+01:00
draft: false
tags: ["Gen-AI","Self-Hosting","Docker"] 
description: 'Audio 2 Text Open Source and commercial transcription (S2T) Tools. ST Audio input and creation of a speech rater.'
url: 'audio-to-text-tools'    
---

An overview to the existing open source alternatives for audio to text conversion (also called Speech to Text).


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/local-ai-audio" title="Local AI Audio 101 ↗ " >}}
{{< /cards >}}



[![Star History Chart](https://api.star-history.com/svg?repos=openai/whisper,SevaSk/ecoute,oTranscribe/oTranscribe,beyondcode/writeout.ai,pluja/whishper&,type=Date)](https://star-history.com/openai/whisper&SevaSk/ecoute&oTranscribe/oTranscribe&beyondcode/writeout.ai&pluja/whishper&Date)


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher/tree/main/" title="Local Deep Researcher" image="https://github.com/JAlcocerT/local-deep-researcher/raw/main/local-research-sample.png" subtitle="Ollama x DDG x LangGraph" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main" title="Data Chat Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

## S2T

{{< callout type="info" >}}
Make sure to have the right PyTorch installed: https://pytorch.org/get-started/locally/
{{< /callout >}}


### OpenAI Whisper

This one requires OpenAI API Key.

But its worth to give it a try.

* https://github.com/openai/whisper (MIT Licensed ❤️)
  * https://pypi.org/project/whisper/#history

> MIT | Robust Speech Recognition via Large-Scale Weak Supervision

* <https://www.reddit.com/r/Python/comments/xqlay2/speech_to_text_that_actually_works_my_first/>


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-youtube-ai-workflow/" title="I used Whisper with my YT Workflow ↗ " >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openais2t.py" title="Sample Script OpenAI Whisper ↗" >}}
{{< /cards >}}



### Ecoute

* Project Source Code: https://github.com/SevaSk/ecoute
    * License: [MIT](https://github.com/SevaSk/ecoute?tab=MIT-1-ov-file#readme)

> Ecoute is a live transcription tool that provides real-time transcripts for both the user's microphone input (You) and the user's speakers output (Speaker) in a textbox. 


```sh
git clone https://github.com/SevaSk/ecoute
cd ecoute
```

```sh
#python -m venv solvingerror_venv #create the venv
python3 -m venv ecoute_venv #create the venv

#solvingerror_venv\Scripts\activate #activate venv (windows)
source ecoute_venv/bin/activate #(linux)


pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
```

```sh
pip install -r requirements.txt
pip install whisper==1.10.0
```

* <https://pypi.org/project/whisper/#history>


```sh
#OPENAI_API_KEY="sk-somekey" #linux
#$Env:OPENAI_API_KEY = "sk-somekey" #PS
 #cmd
```

#### ecoute requirements

* Record Audio from speakers: <https://github.com/s0d3s/PyAudioWPatch>
  * https://pypi.org/project/PyAudioWPatch/#history


{{< callout type="warning" >}}
The project has **only wheels for Windows**, and your system is not Windows, hence the error
{{< /callout >}}

* OpenAI Whisper: <https://pypi.org/project/openai-whisper/#history>


{{< details title="Trying to bundle Ecoute 📌" closed="true" >}}


```sh
python main.py
# python main.py --api
```

```Dockerfile
# Use the specified Python base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    build-essential

#choco install ffmpeg

# Clone the private repository
RUN git clone https://github.com/SevaSk/ecoute

WORKDIR /app/ecoute

# Copy the project files into the container
COPY . /app

RUN pip install -r requirements.txt

# Keep the container running
#CMD ["tail", "-f", "/dev/null"]

```

Ecoute is a live transcription tool that provides real-time transcripts for both the user's microphone input (You) and the user's speakers output (Speaker) in a textbox.

It also generates a suggested response using OpenAI's GPT-3.5 for the user to say based on the live transcription of the conversation.

```sh
docker build -t ecoute .
#docker tag ecoute docker.io/fossengineer/ecoute:latest
#docker push docker.io/fossengineer/ecoute:latest
```

```yml
#version: '3'

services:
  ai-ecoute:
    image: fossengineer/ecoute  # Replace with your image name and tag
    container_name: ecoute
    ports:
      - "8001:8001"
    volumes:
      - ai-privategpt:/app
    command: /bin/bash -c "main.py && tail -f /dev/null" #make run
    
volumes:
  ai-ecoute:

```

{{< /details >}}


### oTranscribe

* https://github.com/oTranscribe/oTranscribe
  * <https://otranscribe.com/>

> MIT |  A free & open tool for transcribing audio interviews 

### WriteOutAI

* https://github.com/beyondcode/writeout.ai

> MIT |  Transcribe and translate your audio files - for free 


### WHISHPER

* https://github.com/pluja/whishper
* https://whishper.net/

>  aGPL | Transcribe any audio to text, translate and edit subtitles 100% locally with a web UI. Powered by whisper models! 


{{< cards cols="1" >}}
  {{< card link="https://github.com/LibreTranslate/LibreTranslate" title="It uses LibreTranslate ↗ " >}}
{{< /cards >}}

![alt text](/blog_img/GenAI/audio/whishper.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Whishper" title="Whishper Docker Config 🐋 ↗" >}}
{{< /cards >}}


* https://whishper.net/guides/install/

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/flask_sensor_display" title="Flask Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

---

## Conclusions

Now we have seen the differences between **TTS and S2T** (Transcription) frameworks out there!

Time to do [cool things](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Audio/audio-input.py) with them.

Like...putting together a voice assistant with Streamlit:

{{< cards cols="1" >}}
  {{< card link="https://docs.streamlit.io/develop/api-reference/media/st.audio" title="ST Audio Component DOCS ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Python_apps/Python_Streamlit" title="Python Streamlit App Docker Config 🐋 ↗" >}}
{{< /cards >}}

For TTS, lately OpenAI have made interesting upgrades: https://platform.openai.com/docs/models/gpt-4o-mini-tts



### Streamlit Audio

With the `st.audio_input` component, a lot of cool stuff can be done: https://docs.streamlit.io/develop/api-reference/widgets/st.audio_input

See `st.audio_input` - https://docs.streamlit.io/develop/api-reference/widgets/st.audio_input

Thanks to benji youtube video: https://www.youtube.com/watch?v=UnjaSkrfWOs

{{< youtube "UnjaSkrfWOs" >}}


I have added a sample working script at the [MultiChat project](https://github.com/JAlcocerT/Streamlit-MultiChat), here: https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Audio/audio-input.py

See also [another way to do T2S](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openait2a.py) with openAI: https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Audio/openai-tts.py