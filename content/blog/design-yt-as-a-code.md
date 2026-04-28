---
title: "How hard is to go viral?"
date: 2026-04-23T06:20:21+01:00
draft: false
tags: ["Remotion x Hyperframe","Video HUB","JAlcocerTech Branding"]
description: 'Youtube Videos as a code.'
url: 'youtube-video-as-a-code'
math: true
---


**TL;DR**

An excuse to upgrade to Claude Max plan and [burn tokens](https://claude.ai/settings/usage).

Drop if the wordd free still has meaning for you.
* https://github.com/carboneio/carbone

>  Fast and simple report generator, from JSON to pdf, xslx, docx, odt... 


**Intro**

You can tell that i like animations and videos.

```sh
#git clone /yt-videos-as-a-code
git init && git add . && git commit -m "Initial commit: YT Videos as a Code HUB" && gh repo create yt-videos-as-a-code --private --source=. --remote=origin --push

#The trick
git submodule add https://github.com/JAlcocerT/VideoEditingRemotion.git external/VideoEditingRemotion
git commit -m "Add VideoEditingRemotion repo as submodule"
#git clone --recurse-submodules https://github.com/JAlcocerT/yt-videos-as-a-code.git

git submodule add https://github.com/JAlcocerT/DataInMotion.git external/DataInMotion
git commit -m "Add DataInMotion repo as submodule" #remember that the goodies are not in the main branch

git submodule add -b libreportfolio https://github.com/JAlcocerT/DataInMotion.git external/DataInMotion-libreportfolio
git submodule update --remote external/DataInMotion-libreportfolio

git submodule add https://github.com/JAlcocerT/eda-f1.git external/eda-f1
git commit -m "Add eda-f1 repo as submodule"
```

{{< callout type="info" >}}
With agents having skills for [remotion](https://jalcocert.github.io/JAlcocerT/about-motion-graphics/#remotionjs) or [hyperframe](https://jalcocert.github.io/JAlcocerT/about-motion-graphics/#hyperframe)...
{{< /callout >}}

yea...

Same as Ive distilled my brand assets [here](https://jalcocert.github.io/JAlcocerT/poc-101/)

It was time to put together all those nice animations related repositories to ship consistently.


### Science Animations

### Financial Animations


{{< youtube "MZTt8ICeF0Y" >}}


{{< youtube "OL5UQaZc97E" >}}

### Formula 1 Animations

This engine is a yoke

---

## Conclusions

There are 2 HUBs so far:

1. the jalcocertech one

2. the general video as a code:

```sh

```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/yt-videos-as-a-code" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="NEW - Source Code HUB for multi-purpose video as a code" >}}
  {{< card link="https://github.com/JAlcocerT/jalcocertech-services" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code brand HUB for jalcocertech" >}}
{{< /cards >}}

And a 3rd one coming...

Does this mean that...is possible to... do 1, do on top and...3 HUBs?

oh shat...


## FAQ


