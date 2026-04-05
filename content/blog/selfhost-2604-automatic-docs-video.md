---
title: "From Repo Docs to Promo Video"
date: 2026-04-05
draft: false
tags: ["AI Docs","RemotionJS Video","F/OSS"]
description: 'Automatic repository 2 Docs x Videos .'
url: 'oss-automatic-docs-and-tech-video'
---



**Tl;DR**

Last year...https://jalcocert.github.io/JAlcocerT/tech-for-podcast/ I was working

https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#vibe-coded-project-docs

**Intro**

But models have improved a lot

Specially: [Claude...](https://www.anthropic.com/news/claude-opus-4-6)



## Extracting Repo Info

### From Repo to Post


### From Repo to Video

---

## Conclusions

This is the kind of post that makes me realize this year ill be doing 99 posts...instead of the much less planned.

Talking about f/oss I tested mac OS with Zed and CodeEdit

Interestingly, there is a fork of zed called GRAM that has been quite interesting.


### Other High Signal Videos


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="DataInMotion | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Remotion | Repo" icon="github" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-scripts-and-animated-data/" title="A Summary of Animations" image="/blog_img/karting/long_g_trace_L4.png" subtitle="Post with animated F1, Real Estate, yfinance..." >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/f1-data-animated/" title="F1 Animated Data" image="/blog_img/karting/long_g_trace_L4.png" subtitle="Creating animations around F1 Data | Post" >}}
{{< /cards >}}

### Marketing Videos for your Services

If all previous is true...

Why not.........

```sh
/jalcocertech-services
```

---


## FAQ


### What ive tried recently

More [mac M2](https://jalcocert.github.io/JAlcocerT/cad-design-mbsd/#rendering-on-a-mac-m2) and...

```sh
#sudo snap install ghostty --classic
ghostty
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/Termix" title="Termix with Docker 🐋 ↗" >}}
{{< /cards >}}


Which reminds me somehow to tmux *the one I used [here with blender](https://jalcocert.github.io/JAlcocerT/about-constrained-mechanism/) and my x300*


```sh
#brew install ffmpeg #you didnt know you need FFMPEG, but you DO NEED IT
brew install gh
#gh auth login
#gh auth status
git clone https://github.com/JAlcocerT/3Design
cd ./3Design/mbsd-to-render/four-bar

make check #make help
#make scene-ui #this starts blender UI
time make all #makes all the steps, including the render programatically!
#make render #or do this one for just the render of the scene-ui was OK

#tmux new-session -d -s cad "make all" #if you will be leaving this for the night
#tmux attach-session -t cad #to see hows going
```

Wait....56 seconds to render?

On battery power?!

My 5600G was taking like...10 min?!

that was for 1080p, so i went ahead and made it harder:

```sh
cd four-bar-mac
make clean-all
mae install UV_PYTHON=3.12
.venv/bin.python --version

#make scene-ui
time make render all
```

Say thx to pairdrop, see the difference

<!-- https://youtu.be/r0eg5onWbn0 -->

{{< youtube "r0eg5onWbn0" >}}

Oh the time for **4K with final presets**?

This was 26min at the M2 and I did not dare to try it with my x13 nor the x300.
