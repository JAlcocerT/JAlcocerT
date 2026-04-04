---
title: "Electronics 101"
date: 2026-08-01
draft: false
tags: ["IoT","KiCad vs Atopile","PySpice x RemotionJS"]
description: 'Simulating electronics components.'
url: 'electronics-101'
math: true
---

**Tl;DR**

**Intro**

You might have tinkered with IoT

But without really understanding the under lying layer.

This sits on top of Electromagnetism, yet below IoT


## Circuit Boards Design

Everything is...[code](https://jalcocert.github.io/JAlcocerT/things-as-a-code/). 

Same applies to circuit boards:

* https://github.com/atopile/atopile

> **MIT | Design circuit boards with code**! ✨ Get software-like design reuse 🚀, validation, version control and collaboration in hardware; starting with electronics ⚡️ 

> > Write hardware like software. atopile is a language, compiler, and toolchain for electronics—declarative .ato files, deep validation, and layout that **works natively with KiCad**.


---

## Conclusions

So...mbsd is code, CAD and blender renders are code

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics" image="https://github.com/JAlcocerT/local-deep-researcher/raw/main/local-research-sample.png" subtitle="Ollama x DDG Search x LangGraph" >}}
  {{< card link="https://github.com/JAlcocerT/local-deep-researcher" title="Local Deep Researcher Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Local Deep Researcher with langGraph - Source Code on Github" >}}
{{< /cards >}}

Electronics board design...yep, also code from now on.


```sh
#git init && git add . && git commit -m "Initial commit: Starting electronics 101" && gh repo create electronics-101 --private --source=. --remote=origin --push
#uv init
#uv add -r requirements.txt
#uv sync
uv run main.py

#make run #requires .env.local
```

You know whats coming

right?

![alt text](/blog_img/electronic/esp32-pump-plants.png)

Wait...if this is code...can it be [animated with remotion](https://jalcocert.github.io/JAlcocerT/video-creation-with-remotion/)?

```md
In this folder i have added a pyscipe that simulates a particular circuit    
  (see the makefile entries), I have also added a video remotion folder, with   
  agents skills you can use. My idea is to generate a video animation of what   
  happens in that given circuit with the intensities and voltages. Do you need  
  to clarify sth?  
```

```sh
#git clone VideoEditingRemotion
cd ./remotion-electronics/my-video
npx remotion render SchematicKickback schematic_kickback.mp4
```

Toy models can NOT predict

{{< youtube "JbixCdhRzDo" >}}

*Why would someone pay you if you can just overfit past and give just a vague range of possibilities for the future?*

*Will the mosfet be fried, yes or no?*

<!-- https://youtu.be/JbixCdhRzDo -->

No more: will I get an unexpected quickback due to transitory behaviour?

![Vibe Coding - Simpsons Halloween S2](/blog_img/dev/vibe-coding.png)

Just...simulate: *see thats going to happen, before it happens*

```sh
uv run main.py --only mosfet --scenario compare   # overlay: with vs without diode 
```