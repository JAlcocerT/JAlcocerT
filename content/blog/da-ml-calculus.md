---
title: "Understanding Calculus"
date: 2025-10-21T23:20:21+01:00
draft: false
description: 'Calculus 101'
url: 'calculus-101'
math: true
---




https://www.youtube.com/shorts/ha2_x5eJ1OY

The first time I got to know calculus, was with derivatives and integrals.

> I kind of like derivatives...but hated integrals.

Probably because of the *lack of purpose* that I was given.

I could not be more wrong at that point, as **calculus is both: beautiful and useful**

...if you get it explained properly.

The essence of calculus.

https://www.youtube.com/watch?v=WUvTyaaNkzM
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

**In summary:** The double pendulum is a classic example of a system that is accurately and effectively modeled using ordinary differential equations because the angles of the pendulum arms depend solely on time.

There are no spatial dependencies that would necessitate the use of partial differential equations.

<!-- https://fossengineer.com/create-chatgpt-clone-streamlit/
https://fossengineer.com/summarize-yt-videos/ -->

<!-- https://fossengineer.com/chaos-theory-and-the-double-pendulum-with-python/
https://github.com/agnanp/Ollama-Streamlit
https://github.com/romilandc/streamlit-ollama-llm
https://github.com/ChingWeiChan/ollama-streamlit-demo -->

<!-- https://github.com/AIDevBytes/Streamlit-Ollama-Chatbot

https://github.com/iamaziz/ollachat -->

<!-- I will write a dedicated post about Chaos Theory in the future.  -->


<!-- 
py-chaoos.md -->

<!-- 
relate it with non lineality and caos theory -->


## PDE - Partial Derivate Equations


{{< youtube "m3hxPxPgSIY" >}}



---


<!-- https://www.youtube.com/watch?v=ToIXSwZ1pJU -->
{{< youtube "ToIXSwZ1pJU" >}}


---