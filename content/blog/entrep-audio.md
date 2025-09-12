---
title: "[Recap] on Audio. Creating Speech rAIter micro SaaS"
date: 2025-09-12
draft: false
tags: ["LandThatJob","SpeechPractice","TTS","S2T","Transcription","BiP with OBS for Youtube"]
description: "Audio with AI. Together with an Astro Landing Page + signup/in via FastAPI and sqlite"
url: 'audio-recap'
---


**Tl;DR**

[Doing TTS/S2T with streamlit](https://jalcocert.github.io/JAlcocerT/audio-to-text-tools/#the-speech-rater) and the [st speechraiter](https://github.com/JAlcocerT/Streamlit-Speech) was fun.

Now its time to build sth similar **with Flask**.

You can get started with this kind of project [like so](#how-to-get-started-and-build-a-speech-rater-with-ai).

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="From Streamlit-Speech | Repo ↗" >}}
  {{< card link="https://github.com/JAlcocerT/py-speech-rater" title="To a general SpeechRater with Python | Repo ↗" >}}
{{< /cards >}}



**Intro**

Recently I heard about `myminutes.ai` so summarize meetings.

What can we build around audio/speech?

Do you imagine practicing job interviews in front of an ai?

Some kind of way to *LandThatJob*

Or practicing that very important presentation with a *SpeechPractice* service.


## The Speech Rater Stack

Previously I made a PoC streamlit version:

{{< cards >}}
  {{< card link="" title="OpenAI TTS and Transcription Project 🐍" image="/blog_img/GenAI/audio/speechraiter.png" subtitle="Speech rAIter" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-Speech" title="NEW Speech Raiter" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Streamlit Speech rater - Source Code on Github" >}}
{{< /cards >}}


{{< details title="Choosing from Streamlit to Flask vs FastAPI 📌" closed="true" >}}

I just went with FastAPI as per gemini and this doc.

{{< /details >}}

I just went forward with cursor and fastAPI:

![Fast API](/blog_img/GenAI/audio/fastapi-audio-rec.png)

And quickly made that simple UI, connected to OpenAI TTS/S2T capabilities.

With such architecture, see [mermaid](https://mermaid.live/view#pako:eNqFVU1v2zgQ_SsEi96oJJLsyBGKAo6_4sSOnY0XBXa9WDASFROxSZWiGneDANt7DwsssIdeeukP3J_QERnJkgEjOhh-5HtvhjND6QlHMmY4xPeKpiu0OF8KBE-W39mFoZJCMxH_vsT_f__6T4XRL-xjzjKdLfEfVlI8XaD9mjGFupHmUuw2QWH_7Nl352Pj_O1vNKSZBogGIk4lF3vO50AbDRbo-N2dOn4_pVygMSSiEhqxBrEHxPnsFph5upY0dmgec2lUt_QTg7wjqWIu7huqfmmvyu3sOOFrJuiGGW1fPorCDnULu4Z2UGrXPNPOzsDoJrCGHrleoVtNdd481LDKVSsqskjxO9YMO2KCKaoZWrwQUt1wGJWxdbV_KPEDDhe7HPalu-CL24ZmXEXVma3voZh7wstSSFPuZKYgRtBbsegB9aRI-H0OIWF2Xh2dwRbaL-jazM-P_ypczFSzzFdAmaVMdMfow4pnaTGf87EdiZSxaOVo6SzYtlmYyU5lWZWooBYSu_xqokMozSzNTJ7_fjEQgbE9ZjPTKZDMlE7nPtIS1aaxwbuueP2CVm9-gzfb84N-_Wn71aDNgWZbULQRsS0MLRN7F-um8GIKzIrG8chwD97wLnKc9-i8Dnp1MKiDYR1c1MFl3bNnlqYWDA24suDCgIkFVwZcWzAxYGbBwIC5BX0DbiwY1cG4Duzv27dwfz-vi9eGwdGaZlmfJSgp34dQjXX4hvmJl8Qk00o-sPDNiRcEdyV0HnmsV6GXbvc84DK8yBM36bCzSu77p2cue03OysF_8UjAw608knaQuMFrHqaXpUHEWiyqDGjsttqHDGo20LGyGPXVc9IjfTIgQzIiF2RMLovj1glXZFIdob4-JddkRubk5mXQBCbwkeIxDrXKGcEbpja0gPipkC2xXrENjGwIf2OqHpZ4KZ5Bk1Lxm5SbUqZkfr_CYULXGaA8jeEF1-cUruqOAkdgqidzoXHYPu0YDxw-4S0OHTc4agWtwHV9t9PyvQB2P-PQ67SOOl4nCDwfqnVy5j4T_JeJenJ01mnD4qnX9vzgxPdOCWYx11JN7YfXfH-ffwKgkkvm)

<!-- https://youtu.be/mDMGtMOx-Fk -->

{{< youtube "mDMGtMOx-Fk" >}}

As you can see on the video, where I show how it works while doing BiP, **this already helps with my quick youtube video creation.**

{{< callout type="warning" >}}
The audio record does not work oh phones. *Probably due to permissions*.
{{< /callout >}}

> Hey, what about the [speech rater stuff](#the-fastapi-speech-rater)?

### Simple md Editor

Later, on I added simple markdown edition capabilities (there were few candidates)


1. Monaco Editor (VS Code Editor) - RECOMMENDED ⭐
Pros: Full VS Code experience, syntax highlighting, IntelliSense, built-in markdown preview
Cons: Larger bundle size (~2MB)
Best for: Professional editing experience
2. CodeMirror 6 - LIGHTWEIGHT ⭐
Pros: Lightweight, fast, good markdown support, customizable
Cons: Less features than Monaco
Best for: Balanced performance and features
3. SimpleMDE (Markdown Editor) - SIMPLE
Pros: Very lightweight, live preview, easy to use
Cons: Less advanced features
Best for: Simple editing needs
4. Toast UI Editor - MODERN
Pros: WYSIWYG + markdown, good mobile support
Cons: Medium bundle size
Best for: User-friendly editing

{{< callout type="info" >}}
A wysiwyg markdown editor post is coming soon
{{< /callout >}}

Thanks to the implemented monaco editor, we can just quickly tweak the content of the transcript before saving the .md

### The FastAPI Speech Rater

I wanted to combine finally FastAPI (BE) x SQLITE for simple user management x A cool Astro SSG Theme

because...

How could I not try and astro theme...

> MIT | Idol is an elegant landing page template for **micro SaaS products** built with AstroJS & Skeleton CSS


```sh
git clone https://github.com/LaB-CH3/Astro-idol
```


After asking to Cursor to connect the astro theme with FastAPI and make login possible via sqlite...

![alt text](/blog_img/GenAI/audio/fastapi-astro-signup.png)

This happened:

```sh
# Start both servers
make dev-full
make docker-dev-up  # Start both servers in containers

#cd /home/jalcocert/Desktop/py-speech-rater/fastapi-speech-rater && sqlite3 ./users.db ".schema users"
# Check all users
sqlite3 ./users.db "SELECT id, email, first_name, last_name, created_at FROM users;"

# Check specific user by email
sqlite3 ./users.db "SELECT * FROM users WHERE email = 'test@example.com';"

# Count total users
sqlite3 ./users.db "SELECT COUNT(*) FROM users;"

#sqlite3 ./users.db
#.tables
#SELECT id, email, first_name, last_name, created_at FROM users;
```

![Fast API x Astro Connected](/blog_img/GenAI/audio/fastapi-astro-signedin-dash.png)

---

## Conclusions

This simple FastAPI recorder and transcript web app already helps me.

Now I can try to do those **yt tech videos** I wanted to do this year.

Just recording with OBS, cutting quickly with KDEnlive and recording my audio with audacity.

Then it gets uploaded into this new `py-speech-rater` and we get the voice via Onyx thx to OpenAI ST2 & TTS :)


{{< callout type="info" >}}
So now i got for my yt: OBS -> Audacity -> FastAPI with OpenAI -> KDEnlive -> YT
{{< /callout >}}

### Preparing Interviews with AI

I saw something interesting at `interviewsby.ai`, where you upload your resume for feedback

### Preparing Speech with AI



---

## FAQ

### How to get started and build a Speech Rater with AI?


```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Python Speech Rater project with OpenAI TTS/S2T"

#sudo apt install gh
gh auth login
gh repo create  --private --source=. --remote=origin --push
```
