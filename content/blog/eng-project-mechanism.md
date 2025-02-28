---
title: "How to setup Gabe's project, Mechanism"
date: 2025-02-03
draft: false
tags: ["Python","Mechanics"]
description: "Mechanisms Animations in Python. From Singer machines to car engines."
url: 'gabemorris12-mechanism-project-setup'
---

Some time ago I got to know this **awsome project**: <https://github.com/gabemorris12/mechanism>

> MIT | A visual tool to aid engineers with the design process for mechanisms, cams, and gears.

Lately, I just saw that Gabe placed some interesting video about it:

<!-- https://www.youtube.com/watch?v=kMmYv8u8824 -->

{{< youtube "kMmYv8u8824" >}}

<!-- 
https://www.youtube.com/watch?v=usY-oBifcM4&list=PLghzFAspn1-eGjPOTT0D_6LXWqMBFRVIW 
-->


```sh
#python -m venv gabe_mechanism_venv #create the venv
python3 -m venv gabe_mechanism_venv #create the venv

#gabe_mechanism_venv\Scripts\activate #activate venv (windows)
source gabe_mechanism_venv/bin/activate #(linux/mac)
```

**Install dependencies** with:

```sh
pip install -e .
#pip freeze > requirements.txt #generate a txt with the ones you have!
```


{{< callout type="info" >}}
I tried with `./examples/engine.py` and worked perfectly! 
{{< /callout >}}

I just added this line at the script to get a `.gif` rendered:

```py
#ani.save('../animations/engine.mp4', dpi=300)
ani.save('../animations/engine.gif', writer='pillow', fps=30)
```

So that you can see the **engine sample animation working**:

![Engine Sample Animation](/blog_img/mec/engine.gif)

As you can guess:

* Bars are represented by red lines
* Acceleration is in orange
* Speed in grey


I exchanged some email with its creator, [GabeMorris12](https://github.com/gabemorris12).

> A visual tool to aid engineers with the **design process for mechanisms**, cams, and gears.

{{< callout type="info" >}}
[I forked the project](https://github.com/JAlcocerT/mechanism) and Im trying to make a systematic approach for mechanism design here.
{{< /callout >}}


Created this simple version with python:

And working on the symbolic one: https://github.com/JAlcocerT/MultiBodySystemDynamics-MBSD-

* https://github.com/JAlcocerT/Slider-Crank


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Chat with Data" image="/blog_img/GenAI/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

* Optimum Gears - https://github.com/JAlcocerT/Private/tree/main/Py_optimum_gears

## Conclusions


{{< callout type="info" >}}
**Kudos again to Gabe!** The project is release under MIT for anyone to use and modify. 
{{< /callout >}}

I created a small slider crank app for motor sport lovers (and with much smaller scope than Gabe's project)

https://github.com/JAlcocerT/Slider-Crank

> Simulation of a Slider-Crank mechanism. Powered by Python and DASH.

Why am I so excited about get this project working on my computer?

Well, I dedicated an important part of my life to Mechanical engineering...

...and mechanisms are everywhere.

Making our lifes better thanks to their smart designs and leverage.

Mechanisms are kind of code that "automates" the physical movement logic.

Some example?

The one of the engine I will reserve for another post.

Today is the turn of a Singer Machine!

### Singer Mechanism

15cm on the bottom
35cm la biela
4cm (x2) crank

---

## FAQ

* What are eigenvectors?

https://www.youtube.com/watch?v=PFDu9oVAE-g

* https://www.goodreads.com/book/show/13237758-in-pursuit-of-the-unknown

### 3D Design

<!-- https://www.youtube.com/watch?v=MwIBTbumd1Q -->
{{< youtube "MwIBTbumd1Q" >}}
