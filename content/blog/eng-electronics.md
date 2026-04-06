---
title: "Electronics 101"
date: 2026-04-03
draft: false
tags: ["Simulations","KiCad vs Atopile","PySpice x RemotionJS"]
description: 'Simulating electronics components.'
url: 'electronics-101'
math: true
---

**Tl;DR**

Prep-work for watering plants :)

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

So...mbsd is code, CAD and blender renders are code:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics" image="/blog_img/apps/gh-jalcocert.svg" subtitle="IoT and electronics projects" >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3D Design Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Blender, CadQuery..." >}}
{{< /cards >}}

Electronics board design...yep, also code from now on.


```sh
#git init && git add . && git commit -m "Initial commit: Starting electronics 101" && gh repo create electronics-101 --private --source=. --remote=origin --push
#uv init
#uv add -r requirements.txt
#uv sync
#cd sample-pyscipe
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

Ive dare to generate such **explanatory video**: *do you beliave you need that Diode now? :)*

```sh
#git clone VideoEditingRemotion
cd ./remotion-electronics/my-video
# npx remotion render MosfetProtected mosfet_protected.mp4
#npx remotion render MosfetUnprotected mosfet_unprotected.mp4

npx remotion render SchematicKickback schematic_kickback.mp4
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/electronics-101" title="Electronics 101 | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditionRemorion" title="Remotion x Video | Repo" icon="github" >}}
{{< /cards >}}


```sh
#sudo apt update && sudo apt install ffmpeg
ls *.mp4 | sed "s/^/file '/; s/$/'/" > file_list.txt #add .mp4 of current folder to a list
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4 #original audio
```

Toy models can NOT predict.

No model is perfect, reality is far to complex.

Its just that some are based on garbage and produce (surprise) more non sense garbage.

{{< youtube "JbixCdhRzDo" >}}

*Why would someone pay you if you can just overfit past and give just a vague range of possibilities for the future?*

*Will the mosfet be fried, yes or no?*

<!-- https://youtu.be/JbixCdhRzDo -->

No more: will I get an unexpected quickback due to transitory behaviour?

![Vibe Coding - Simpsons Halloween S2](/blog_img/dev/vibe-coding.png)

Just...simulate: *see thats going to happen, before it happens*

```sh
#cd sample-pyscipe
uv run main.py --only mosfet --scenario compare   # overlay: with vs without diode 
```

### The Meta-Lesson

All of these curiosities point to one theme:

**Linear analysis predicts steady state. Nonlinearities dominate transients.**

- The motor inrush looks linear for 100µs, then saturation takes over.
- The capacitor impedance is Ohmic for DC, but ESR-dominated for 150kHz ripple.
- The MOSFET is a resistor at steady state, but an avalanche diode in stress.
- The flyback diode's nonlinearity is the only thing preventing the circuit from killing itself.

Real circuit design is about:

1. **Identifying which nonlinearities matter** (flyback diode → essential; parasitic R → helpful)
2. **Ensuring they trigger safely** (clamp at 12.7V, not 101.7V)
3. **Controlling their speed** (ESR damping, gate slew rate)
4. **Testing edge cases** (cold start, aged battery, old capacitors)

That's why the simulations included these three scenarios: **protected**, **unprotected**, and **compare**.



The math alone doesn't tell you the story. 

You have to see it.

---

## FAQ

### About Electronical Simulations

1. KiCad
2. Atopile

To simulate the behaviour of ESP32, picoW, even arduinos: https://github.com/davidmonterocrespo24/velxio

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="Velxio | Docker Config 🐋 ↗" >}}
{{< /cards >}}