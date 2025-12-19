---
title: "Understanding Calculus...again"
date: 2025-12-19T20:20:21+01:00
draft: false
description: 'Calculus 101'
url: 'calculus-101'
math: true
tags: ["DSc","Bike_dynamic_simulator","Math"]
---


**Tl;DR**

Today Ive had a yearly meeting with a friend and it been f*** amazing.

Also, 10y back I was... better at calculus and worst at...

<!-- matrix bullet -->

<iframe src="https://giphy.com/embed/1yvoDVJQsTfHi" width="480" height="269" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/1yvoDVJQsTfHi">via GIPHY</a></p>

...dodging bullets from life (?)

**Intro**

<!-- https://www.youtube.com/shorts/ha2_x5eJ1OY -->

{{< youtube "ha2_x5eJ1OY" >}}

The first time I got to know calculus, was with **derivatives and integrals**.

> I (kind of liked) derivatives...but hated integrals.

Probably because of the *lack of purpose* that I was given.

I could not be more wrong at that point, as **calculus is both: beautiful and useful**

...if you get it explained properly.

The essence of calculus.

<!-- https://www.youtube.com/watch?v=WUvTyaaNkzM -->
{{< youtube "WUvTyaaNkzM" >}}

Laws of physics are explained with differential equations.

The series that **3Blue1Brown** has made on the topic, are simply **magestic**: https://www.youtube.com/watch?v=p_di4Zn4wz4 and https://www.youtube.com/playlist?list=PLZHQObOWTQDNPOjrT6KVlfJuKtYTftqH6


## Calculus Applications

The classic: the area under a curve!

Why would we want that?

Well, I can think already about few examples:

1. For ML, the [ROC and its AUC](/JAlcocerT/machine-learning-the-roc-curve-in-detail) informs about how good a ML Classification algorithm performs
2. 

**The Jacobian**

This was very useful to do computational mechanics:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Bike_dynamic_simulator" title="Bicycle Dynamic Simulator Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for Bicycle Dynamic Simulator Thesis" >}}
{{< /cards >}}

http://localhost:1313/mechanical-engineering-cool-stuff/

http://localhost:1313/gabemorris12-mechanism-project-setup/

http://localhost:1313/slider-crank-mechanism/

http://localhost:1313/chaos-theory-and-the-double-pendulum-with-python/

<!-- https://www.youtube.com/watch?v=wCZ1VEmVjVo
 -->

{{< youtube "wCZ1VEmVjVo" >}}

**Gradients and Partial Derivatives**

<!-- https://www.youtube.com/watch?v=GkB4vW16QHI -->

{{< youtube "GkB4vW16QHI" >}}


## ODE - 

Ordinary Differential Equations!

<!-- https://www.youtube.com/watch?v=ly4S0oi3Yz8 -->


{{< youtube "ly4S0oi3Yz8" >}}

### The Double Pendulum

<!-- ### Try me with Google Colaboratory

If you have a Google account, you can check these kind of snippets, as well as few useful UDF's to work more efficiently with spark directly with your Google Colab account and the code I made available in Github:

 [![Example image](/img/OpenInColab.svg)](https://colab.research.google.com/github/JAlcocerT/Python_is_awesome/blob/main/Z_GoodToKnow/Getting_Started_with_PYTHON.ipynb) -->

A double pendulum is typically modeled using a system of **ordinary differential equations (ODEs)**, not partial differential equations (PDEs).

* http://jakevdp.github.io/blog/2017/03/08/triple-pendulum-chaos/

Here's why:

*   **Ordinary Differential Equations (ODEs):** ODEs describe how functions of *one* independent variable change. In the case of a double pendulum, the independent variable is *time*. The dependent variables are the angles of the two pendulum arms (θ₁ and θ₂).  We're looking at how these angles change *over time*.

*   **Partial Differential Equations (PDEs):** PDEs describe how functions of *multiple* independent variables change.  PDEs are used when the quantity of interest depends on more than one independent variable.  For example, the temperature distribution in a metal plate depends on both *time* and *position* (x, y coordinates).  This would require a PDE.

**Why ODEs for the Double Pendulum?**

The motion of a double pendulum is described by how the angles θ₁ and θ₂ change over time.

There's no other independent variable involved.

The equations of motion are derived from Newton's laws or Lagrangian mechanics, and they result in a set of coupled second-order ODEs:

```
d²θ₁/dt² = f₁(θ₁, θ₂, dθ₁/dt, dθ₂/dt)
d²θ₂/dt² = f₂(θ₁, θ₂, dθ₁/dt, dθ₂/dt)
```

Where f₁ and f₂ are functions that depend on the angles, their first derivatives (angular velocities), and other parameters like the lengths and masses of the pendulum arms.

**In summary:**

The double pendulum is a classic example of a system that is accurately and effectively modeled using ordinary differential equations because the angles of the pendulum arms depend solely on time.

There are no spatial dependencies that would necessitate the use of partial differential equations.


## PDE - Partial Derivate Equations


{{< youtube "m3hxPxPgSIY" >}}

And these are not only useful for mechanical engineering, but for **modelling heat transfer** as well:

<!-- https://www.youtube.com/watch?v=ToIXSwZ1pJU -->
{{< youtube "ToIXSwZ1pJU" >}}


---

## Conclusions

<!-- I will write a dedicated post about Chaos Theory in the future.  -->


<!-- 
py-chaoos.md -->

<!-- 
relate it with non lineality and caos theory -->




---

## FAQ

### Helping Others

After helping my friend who works as radiophysics and shipped its page at: box2overtake.com

I cant wait to see what this other friend will be able to share with the world with the proper platform.

Material science, diesel injectors, math and piano notes...

I really **cant wait**:

1. Post embrittelment acero h2
2. Hyundai heavy industries dfy subscription making possible a company to thrive
3. Stocastic vs unpredictable effects

In the meantime: *you can also get your website going*

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="SelfHosted Landing Repo" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://diy.jalcocertech.com" title="DIY webs via webook" image="/blog_img/apps/gh-jalcocert.svg" subtitle="A 101 Ive put together about building websites" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/selfhosted-landing" title="SelfHosted Landing Repo - Consulting ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/obfuscate" title="DIY Web eBook x Obfuscation ↗" icon="github" >}}
{{< /cards >}}

The good thing about helping others, is that you get new ideas.

*From team knowledge to internal chatbot knowledge.*

*Avoid silos. Build internal transparency and knowledge sharing.*