---
title: Audio
type: docs
prev: /docs/android/
next: docs/
draft: false
---

You can record audio as you record with OBS Studio.

Or with [audacity](https://jalcocert.github.io/Linux/docs/debian/content_creation/#audio-editing-in-linux) and bring it later.

```sh
sudo snap install audacity
#sudo snap remove audacity
```

In between [your notes](https://jalcocert.github.io/JAlcocerT/knowledge-management/#conclusions), you can also do it with LogSeq.

But what to do / how to process audio?

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/local-ai-audio/" title="TTS Related | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/audio-to-text-tools/#s2t" title="Transcription Related | Post ↗" >}}
{{< /cards >}}

With those, I created:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/audio-to-text-tools/#conclusions" title="Speech Rater Creation" image="/blog_img/GenAI/audio/speechraiter.png" subtitle="st audio and OpenAI | Post" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="Speech Raiter" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Streamlit Speech rater - Source Code on Github" >}}
{{< /cards >}}

I have been [building](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/) TTS/S2T Web Apps:

<!-- 
![Fast API x Astro Theme Connected Showing Admin Panel to record or TTS or S2T](/) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/audio-recap/#the-fastapi-speech-rater" title="FastAPI Speech Rater" image="/blog_img/GenAI/audio/fastapi-astro-signedin-dash.png" subtitle="Using OpenAI with fastAPI for audio" >}}
{{< /cards >}}

## TTS

You can do local TTS as I was doing [here](https://jalcocert.github.io/JAlcocerT/local-ai-audio/#tts)

![CoquiTTS for RealEstate](/blog_img/biz/RE/re-coquitts.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/TTS_Coqui/" title="Coqui TTS Docker Config 🐋 ↗" >}}
{{< /cards >}}

I was initially using transcription [here](https://jalcocert.github.io/JAlcocerT/my-youtube-ai-workflow/#obs--openai-whisper) to create the audio for my tech yt videos.

That was based on OpenAI keys, see : https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openait2a.py

* https://github.com/resemble-ai/chatterbox

> MIT | SoTA open-source TTS

## S2T / Transcription

See also: https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/openais2t.py

## Other OSS Audio Apps


* https://github.com/beyondcode/writeout.ai

> MIT |Transcribe and translate your audio files - for free
