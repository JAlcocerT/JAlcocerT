---
title: "Programmatic Mechanisms"
date: 2026-03-24T23:20:21+01:00
draft: false
tags: ["DA","MBSD","Sympy","2D Simulations","Blender x Tmux"]
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

Then just some rsync magic to bring the generated files home:

```sh

```

## Conclusions


---

## FAQ