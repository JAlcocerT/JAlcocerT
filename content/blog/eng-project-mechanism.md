---
title: "How to setup Gabe's project, Mechanism"
date: 2025-03-02T10:20:21+01:00
draft: false
tags: ["Python","Mechanics","Engineering","TinaCMS","Plotly","Animations","Katex"]
description: "Mechanisms Animations in Python. From Singer machines to car engines. Project Docs with Astro."
url: 'gabemorris12-mechanism-project-setup'
math: true
---

Some time ago I got to know this **awsome project**: <https://github.com/gabemorris12/mechanism>

> MIT | A visual tool to aid engineers with the design process for mechanisms, cams, and gears.

Lately, I just saw that Gabe placed some **interesting video** about it:

<!-- https://www.youtube.com/watch?v=kMmYv8u8824 --> 

{{< youtube "kMmYv8u8824" >}}

<!-- 
https://www.youtube.com/watch?v=usY-oBifcM4&list=PLghzFAspn1-eGjPOTT0D_6LXWqMBFRVIW 
-->

## The Mechanism Project with Python


{{< cards >}}
  {{< card link="https://github.com/gabemorris12/mechanism" title="Gabe Mechanism Project" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code" >}}
  {{< card link="https://github.com/JAlcocerT/mechanism" title="My Fork of the Mechanism Project" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

To get started with this python project: https://pypi.org/project/mechanism/

```sh
#python -m venv gabe_mechanism_venv #create the venv
python3 -m venv gabe_mechanism_venv #create the venv

#gabe_mechanism_venv\Scripts\activate #activate venv (windows)
source gabe_mechanism_venv/bin/activate #(linux/mac)
```

**Install dependencies** with:

```sh
pip install -e .
#pip freeze > requirements-output.txt #generate a txt with the ones you have!
```


{{< callout type="info" >}}
I tried with `./examples/engine.py` and worked perfectly! 
{{< /callout >}}

```py
python3 ./examples/engine.py
#uv run ./examples/engine.py
```

I just added this line at the script to get a `.gif` rendered: [See the code line](https://github.com/JAlcocerT/mechanism/blob/master/examples/offset_crankslider_with_speed.py#L86)

```py
#ani.save('../animations/engine.mp4', dpi=300)
ani.save('../animations/engine.gif', writer='pillow', fps=30)
```

You can uploads those to [youtube](https://youtube.com/shorts/2xMOxiRz6F4)
<!--  -->
<!-- {{< youtube "2xMOxiRz6F4" >}} -->


So that you can see the **engine sample animation working**: Go to `./animations`

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


### Creating Docs for the Mechanism Project

For more people to be able to use **the fantastic mechanism project**...

...how about making some Docs to it?

I had a look to these Astro Docs projects:

1. https://github.com/mickasmt/astro-nomy

> MIT | Differents pages and examples apps built with Astro v4.5, shadcn/ui & react js. Open Source.

```sh
git clone https://github.com/mickasmt/astro-nomy
```

2. https://github.com/HYP3R00T/CelestialDocs Which has Search capability implemented!

> MIT | Documentation template using Astro and Shadcn

```sh
git clone https://github.com/HYP3R00T/CelestialDocs
```

![Astro celestial Docs for Gabe mechanism](/blog_img/web/GHAnPages/gha&pages-celestialdocs-mechanism.png)

It required a couple of adjustment to the `basepath`... but it works

3. HUGO Theme (with MermaidJS, ChartJS TinaCMS support) https://github.com/onweru/compose

> MIT | A Hugo theme for documentation sites - With TinaCMS

{{< callout type="info" >}}
**Add ChartJS to HUGO** Themes with this [shortcode](https://github.com/shen-yu/hugo-chart) 
{{< /callout >}}

I followed the installation guide https://composedocs.netlify.app/docs/compose/install-theme/

You have to **install vercel and tinacloud app** into your github:

* https://github.com/tinacms/tina-barebones-starter

> We are good to go: https://jalcocert.github.io/mechanism/

---

## Conclusions

Here you have the results of some of my tweaks: https://github.com/JAlcocerT/mechanism/tree/master/animations

I kept the project docs with the Astro Celestial Docs theme for now.

The Astro-nomy its cool, but for not for this kind of purpose :)

Recently I also discovered about https://www.divergent3d.com/ which seems to be a very cool application of Mechanical Engineering!

Its been very helpful to use [this gemini extension](https://marketplace.visualstudio.com/items?itemName=Google.geminicodeassist):

![Gemini Code Assistant](/blog_img/dev/GeminiCodeAssist.png)



{{< callout type="info" >}}
**Kudos again to Gabe!** The project is release under MIT for anyone to use and modify. 
{{< /callout >}}

I created a small slider crank app for motor sport lovers (and with much smaller scope than Gabe's project)

* https://github.com/JAlcocerT/Slider-Crank

> Simulation of a Slider-Crank mechanism. Powered by Python and DASH.

Why am I so excited about get this project working on my computer?

Well, I dedicated an important part of my life to Mechanical engineering...

...and **mechanisms are everywhere**.

Making our lifes better thanks to their smart designs and leverage.

Mechanisms are kind of code that "automates" the physical movement logic.

> Some example?

>> The one of the engine I will reserve for another post.

Today is the turn of a [Singer Machine](#singer-mechanism!)

### Singer Mechanism

* 15cm on the bottom
* 35cm la biela
* 4cm (x2) crank

### Check Also

* https://github.com/simupy/simupy

>  A framework for modeling and simulating dynamical systems 

---

## FAQ

* What are eigenvectors? The math inside mechanisms.

<!-- https://www.youtube.com/watch?v=PFDu9oVAE-g -->

{{< youtube "PFDu9oVAE-g" >}}


* https://www.goodreads.com/book/show/13237758-in-pursuit-of-the-unknown

### Animations in Python

See these plotly examples with: https://plotly.com/python/animations/

* Point moving over a curve
* Moving Frenet Frame Along a Planar Curve

> How cool is that to learn mechanics?

### 3D Design

See these tools: https://jalcocert.github.io/Linux/docs/debian/foss_engineering/

And these ones SelfHosted

<!-- https://www.youtube.com/watch?v=MwIBTbumd1Q -->
{{< youtube "MwIBTbumd1Q" >}}

## Outro

Created this simpler version with python, for anyone just starting with mechanics.

Dont worry, I said simpler :)


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Slider Crank Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Understanding SliderCrank Mechanism with Python - The Source Code" >}}
  {{< card link="https://github.com/JAlcocerT/Slider-Crank" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

And working on the **symbolic Python**: https://github.com/JAlcocerT/MultiBodySystemDynamics-MBSD-


* Optimum Gears - https://github.com/JAlcocerT/Private/tree/main/Py_optimum_gears

* Car power curve with Python

### What Ive learnt with this one

#### TinaCMS

A **headless CMS setup**, finally!

Or...almost finally.

> All thanks to the HUGO Theme, Compose: https://github.com/onweru/compose/

Its great to see that:

1. There is a UI to modify post
2. Changes in the UI are captured in the github repository (working both ways!)
3. There is CI/CD with Vercel, which is the configured deployment option for the static files