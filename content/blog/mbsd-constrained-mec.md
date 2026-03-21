---
title: "Programmatic Mechanisms"
date: 2026-03-21T06:20:21+01:00
draft: false
tags: ["DA","MBSD","Sympy","2D Simulations","Blender x Tmux","Lagrangian"]
description: 'Im Back.'
url: 'about-constrained-mechanism'
math: true
---


**Tl;DR**



**Intro**

A multibody dynamics simulation framework written in MATLAB. 

It solves the equations of motion for constrained mechanical systems — assemblies of rigid bodies connected by joints, acted upon by forces, and potentially in contact with surfaces.


```sh
#git clone https://github.com/JAlcocerT/mbsd
cd mbsd/2D-Kinematics
#python examples/slider_crank.py

#cd examples
# echo -e "file 'p1.mp4'\nfile 'p2.mp4'" > list.txt
# # 2. Join them
# ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4
# mpv "output.mp4"
python examples/pantograph.py
```

If you have been following my latest post about blender and bringin to life mechanism...

You could imagine that it was a matter of time for me to join these 2 worlds.


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3Design | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD | Repo" icon="github" >}}
{{< /cards >}}

But first, as I have wood PCs, I needed to install **tmux on my x300** to leave it thinking during the night via termix:

```sh
sudo apt update && sudo apt install tmux -y
#nano ~/.tmux.conf
loginctl enable-linger $USER
#tmux new -s cad_mbsd_render
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/Termix" title="Termix with Docker 🐋 ↗" >}}
{{< /cards >}}


```sh
git clone https://github.com/JAlcocerT/3Design
cd ./3Design/z-cadquery
make check #make help
#make scene-ui #this starts blender UI
#make all
tmux new-session -d -s cad "make all" #if you will be leaving this for the night
#tmux attach-session -t cad #to see hows going
```

After having the x300 processing at 100% and consuming 80-90W...

Then just some rsync magic will bring the generated files home:

```sh
rsync -avP jalcocert@192.168.1.2:/home/jalcocert/3Design/z-cadquery/render/slider_crank.mp4 .
#Then play it:
mpv slider_crank.mp4
```

https://youtu.be/1WzRJM8HVKg

{{< youtube "1WzRJM8HVKg" >}}


So...


How hard is to make this work for any of the 2D kinematics I got ready?

## 2D Kinematics x Blender

As mentioned before, its about bridging the 2 worlds.

Why would this be impossible, if we are just stating:

1. A solid is infinitely rigid and 2 points always keep their distance constant
2. ~~F=ma~~ actually not yet. [But later](#2d-dynamics-for-mbsd)

The `blender_scene.py` is the one doing the cool rendered end result

 One line to rule them all: change PRESET = "preview" to PRESET = "final" and the whole render pipeline switches (resolution, samples, motion blur, quality)
  - FPS and FRAME_COUNT are now top-level variables alongside the file paths
  - The render settings section now just reads from _p[...] — no more buried comments saying "change this for final render"
  - Added a print line so you can confirm what preset is active when the script runs

Three presets now:

  ┌────────────┬────────────┬─────────┬─────────────┬───────────────────┐
  │   Preset   │ Resolution │ Samples │ Motion blur │     Use case      │
  ├────────────┼────────────┼─────────┼─────────────┼───────────────────┤
  │ preview    │ 1280×720   │ 8       │ off         │ Quick local test  │
  ├────────────┼────────────┼─────────┼─────────────┼───────────────────┤
  │ production │ 1920×1080  │ 16      │ off         │ Overnight on x300 │
  ├────────────┼────────────┼─────────┼─────────────┼───────────────────┤
  │ final      │ 3840×2160  │ 64      │ on          │ Cinematic 4K   


## 2D Dynamics for MBSD

Its time for some: F=ma





---

## Conclusions

No 3D speeds and forces for the mbsd.

But dont worry, they are coming.

<!-- https://www.youtube.com/watch?v=fO_4eN-IyOo -->

{{< youtube "fO_4eN-IyOo" >}}

That one even has some fluid mechanics going on...

What would be the problem? :)



---

## FAQ

### The lagrangian is awsome


L = T - V