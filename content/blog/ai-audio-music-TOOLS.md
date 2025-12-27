---
title: "How to create music with AI Tools"
date: 2025-11-27T07:20:21+01:00
draft: false
tags: ["Docker","Gen-AI","SunoAI"]
description: 'Tryign to Make music with AI'
url: 'music-with-ai-tools'
---


**TL;DR**

Few years back I helped a friend to create a song and publish it to spotify.

It was ton of fun.

But can we now do music with AI?

**Intro**

Not a post about Gonic nor Sonixd.

Neither to talk about how I ended up collaborating on a troll song that got uploaded to Spotify.

You have multiple options to create music with AI, including ready-to-use platforms and Python-based tools for custom projects.

### General AI Music Creation Options

- **Online AI Music Generators**: Platforms like Suno, AI Song Maker, MusicCreator AI, Soundraw, and Boomy let you create royalty-free music quickly by choosing styles, moods, and instruments. These require no coding and are ideal for instant music creation.

- **Collaborative AI Platforms**: Some tools leverage crowd-sourced or evolving AI models to generate music that you can customize.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/interesting-apis/#11labs" title="Tinkering with 11labs - Post ↗" image="/blog_img/GenAI/elevenlabs/11labs-download-tts.png" subtitle="ElevenLabs music creation via API" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/audio-recap/#the-speech-rater-stack
![Fast API WebApp with audio recording capabilities](/blog_img/GenAI/audio/fastapi-audio-rec.png)

https://jalcocert.github.io/JAlcocerT/interesting-apis/#audio-apis
![alt text](/blog_img/GenAI/elevenlabs/onboard-11labs2.png)

Some of the [AI audio tools](https://jalcocert.github.io/JAlcocerT/local-ai-audio/#tts) can be installed locally.

I particularly enjoyed CoquiTTS
https://jalcocert.github.io/JAlcocerT/local-ai-audio/#tts
![Coqui TTS UI](/blog_img/GenAI/audio/coqui-tts.png)


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/py-speech-rater" title="NEW OpenAI TTS and Transcription Project 🐍" image="/blog_img/GenAI/audio/speechraiter.png" subtitle="Speech rAIter" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="Streamlit Speech Raiter" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Streamlit Speech rater - Source Code on Github" >}}
{{< /cards >}}

https://jalcocert.github.io/JAlcocerT/audio-recap/#the-fastapi-speech-rater
![Fast API x Astro Theme Connected Showing Admin Panel to record or TTS or S2T](/blog_img/GenAI/audio/fastapi-astro-signedin-dash.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gonic" title="Gonic | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin Media Server Tools 🐋 ↗" >}}
{{< /cards >}}

Some people mention `https://lucida.to/`, but I prefer to have my own music server:

```sh
#snap install spotify
```

Gonic is one of the options:

![Gonic music server](/blog_img/selfh/HomeLab/gonic.png)

Navidrome is other OSS selfhostable music server:

![NaviDrome UI](/blog_img/selfh/HomeLab/navidrome.png)

And they both get on pretty well with Metube: *specially if you are [building a media server](https://jalcocert.github.io/JAlcocerT/media-server-with-open-source/#faq)*

![MeTube UI](/blog_img/selfh/HomeLab/metube.png)

You can add more services to the stack, like other [youtube front-ends](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-sept-2025/#youtube-fe) and create a: metube + jdownloader + qbit




### Python-Based AI Music Creation Libraries and Frameworks

- **Magenta**: Google’s open-source project provides powerful tools built on TensorFlow for music generation, including pre-trained models that create melodies, harmonies, and rhythms.
- **music21**: A Python toolkit for musicology, analysis, and symbolic music processing, commonly used with AI models for data preparation and generation.
- **pretty_midi**: Handles MIDI creation, manipulation, and conversion, useful for AI-generated MIDI data.
- **TensorFlow/Keras**: Base libraries to build custom neural networks (e.g., LSTMs, Transformers) for music sequence generation.
- **pydub and fluidsynth**: Useful for audio manipulation and rendering AI-generated MIDI into sound.

**Workflow Example with Python:**

1. Use datasets or MIDI files for training neural networks.
2. Train or use pre-trained models (via Magenta or custom TensorFlow code) to generate music sequences.
3. Convert sequences into MIDI with pretty_midi or music21.
4. Render or process audio with pydub or fluidsynth.

This approach suits developers keen to customize AI music generation or integrate it with other projects.

In summary, for quick music creation, use ready AI platforms; for deeper programming control, leverage Python AI libraries like Magenta and music21 to generate and manipulate music.[1][2][3]

[1](https://suno.com)
[2](https://pyseek.com/2025/04/generate-music-using-python-deep-learning/)
[3](https://github.com/ayeshabasit/AI-Music-Generator)


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/local-ai-audio" title="Local AI Audio 101 ↗ " >}}
{{< /cards >}}


## Open Source AI Tools for Music Creation



This AI Makes you a PRO Singer !

<!--
https://www.youtube.com/watch?v=Sj8hXeMcoUg
-->

{{< youtube "Sj8hXeMcoUg" >}}


Takes a song, separates voice and beat, then inputs your voice to it (not foss)

<https://huggingface.co/spaces/facebook/MusicGen>
<https://gist.github.com/mberman84/45545e48040ef6aafb6a1cb3442edb83>


<https://gist.github.com/mberman84/afd800f8d4a8764a22571c1a82187bad>

<https://github.com/facebookresearch/audiocraft>

audiocraft
How To Install Audiocraft Locally - Meta's FREE And Open AI Music Gen

https://gist.github.com/mberman84/afd800f8d4a8764a22571c1a82187bad

```sh
arm64: apt install ffmpeg
conda install -c pytorch -c conda-forge pytorch


https://www.gyan.dev/ffmpeg/builds/
choco install ffmpeg
ffmpeg –version
```


* {{< newtab url="/" text="The Site" >}}
* {{< newtab url="" text="The Source Code at Github" >}}
    * License: {{< newtab url="" text="MIT" >}} ❤️

### SunoAI

We touched Suno (Bark) some time back here.

* https://github.com/suno-ai/bark

> MIT |  🔊 Text-Prompted Generative Audio Model 

The good things, is 

### Beats with AI

Arent beats just music?

This can be cool as background music for youtube tech videos.

---

## Conclusions


### Lyrics with AI?

You can try simply LLMs!

---

## FAQ

### Interesting Music Related Projects

{{< details title="GraphMuse - Python 📌" closed="true" >}}

* https://github.com/manoskary/graphmuse

**GraphMuse** is a Python library designed for **symbolic music graph processing**, addressing the growing need for efficient and effective analysis of musical scores through graph-based methods.

- **Problem Solved**: Traditional music processing lacks efficient tools for analyzing complex musical scores, which often include various elements beyond just notes. 

- **Functionality**:
  - Converts musical scores into graphs where:
    - Each note is a vertex.
    - Temporal relationships between notes define edges.
  - Supports deep graph models for music analysis.
  - Built on **PyTorch** and **PyTorch Geometric**, offering strong flexibility and performance.

- **Graph Structure**:
  - Edges are categorized into:
    - Onset edges (notes starting simultaneously).
    - Consecutive edges (notes starting after others).
    - During edges (notes overlapping with others).
    - Silent edges (connecting notes separated by silence).

- **Key Features**:
  - Efficient graph creation (up to 300x faster).
  - Built-in utilities for preprocessing musical scores.
  - Sampling methods for handling variable graph sizes during training.

- **Use Case**:
  - Demonstrates pitch spelling tasks using annotated datasets.

- **Future Plans**:
  - Improve installation processes.
  - Expand model and data loader support.
  - Foster community contributions.

GraphMuse is a promising tool for anyone interested in symbolic music analysis, combining music theory with advanced graph neural networks.

In conclusion, GraphMuse simplifies symbolic music processing through advanced graph techniques, fostering innovation and analysis.

**Similar Projects**: MusGViz for music visualization and other graph neural network frameworks in music processing.

{{< /details >}}