---
title: "An overview of F/OSS Audio to Text Tools "
date: 2025-12-06T23:20:21+01:00
draft: false
tags: ["Gen-AI","Self-Hosting","Docker"] 
description: 'Audio 2 Text Open Source'
summary: 'An overview to the existing open source alternatives for audio to text conversion' 
url: 'audio-to-text-open-source'    
---

## WrireOut AI

<https://github.com/beyondcode/writeout.ai>

## Whisper

https://github.com/openai/whisper (MIT Licensed ❤️)
https://github.com/openai/whisper?tab=MIT-1-ov-file#readme
https://pypi.org/project/whisper/#history

> Robust Speech Recognition via Large-Scale Weak Supervision

* <https://www.reddit.com/r/Python/comments/xqlay2/speech_to_text_that_actually_works_my_first/>

## Whishper

/selfhosting-whishper-with-docker

## ecoute

* Project Source Code: <https://github.com/SevaSk/ecoute>
    * License: [MIT](https://github.com/SevaSk/ecoute?tab=MIT-1-ov-file#readme)


```sh
git clone https://github.com/SevaSk/ecoute
cd ecoute
pip install -r requirements.txt

pip install whisper==1.10.0
```

* <https://pypi.org/project/whisper/#history>


```sh
#OPENAI_API_KEY="sk-somekey" #linux
#$Env:OPENAI_API_KEY = "sk-somekey" #PS
 #cmd
```

### ecoute requirements

* Record Audio from speakers: <https://github.com/s0d3s/PyAudioWPatch>
* <https://pypi.org/project/PyAudioWPatch/#history>
  * The project has **only wheels for Windows**, and your system is not Windows, hence the error.

* OpenAI Whisper: <https://pypi.org/project/openai-whisper/#history>

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
version: '3'

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

## oTranscribe

* <https://github.com/oTranscribe/oTranscribe>

* <https://otranscribe.com/>


## WHISHPER POST
 bark
 libretranslate...