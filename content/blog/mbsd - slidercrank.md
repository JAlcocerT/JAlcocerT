---
title: "The Slider-Crank Mechanism"
date: 2023-09-15T23:20:21+01:00
draft: false
tags: ["Python","My Projects","Slider-Crank","Mechanism","MBSD","DASH"]
description: 'Understanding the insights and creating an interactive representation of a Slider-Crank mechanism with Python.'
url: 'slider-crank-mechanism'
---


**TL;DR**

The Slider-Crank mechanism is one of the most well known mechanism in the world. 

It powers...our life.

**Intro**

In this post we will understand the physics behind it.

**The Slider and Crank Mechanism** is just so beautiful

* See https://demonstrations.wolfram.com/SliderAndCrankMechanism/

From car engines to industrial machinery, this simple yet ingenious device has revolutionized the way we convert rotational motion into linear motion and vice versa. 

In this blog post, we will delve into the basic principles behind the slider-crank mechanism, explore some interesting physical effects, and discuss its widespread applications.

```yml
version: '3.8'

services:
  Your_Stack_Name:
    image: fossengineer/slider-crank:v1-amd64 #2-amd64 #1_3
    container_name: slider-crank
    ports:
      - "8050:8050"
    restart: always     
```


## The Slider-Crank Mechanism: A Cornerstone of Modern Engineering

The slider-crank mechanism may not be a household name, but it plays a crucial role in our everyday lives. 

### A Simple and Ingenious Design

At its core, the slider-crank mechanism comprises three main components: a crank, a connecting rod, and a slider. 

The crank is a rotating component, usually attached to a circular wheel or a shaft, while the connecting rod serves as a link between the crank and the slider.

As the crank rotates, it drives the connecting rod, which in turn causes the slider to move in a straight line. 

This simple design effectively **converts rotational motion into linear motion**, making it an invaluable tool in various engineering applications.

### Interesting Physical Effects

The slider-crank mechanism is governed by principles of classical mechanics, and its motion can be described using kinematic equations.

One fascinating aspect of the mechanism is that the **speed of the slider is not constant throughout its travel**. 

The slider's speed depends on the crank's angular velocity and the angle between the connecting rod and the crank. As the crank rotates, this angle changes, resulting in variations in the slider's speed.

The non-uniform motion can be both advantageous and disadvantageous, depending on the specific application. Engineers often design slider-crank systems to minimize or exploit these variations in speed to suit their needs.

### Real-World Applications

The slider-crank mechanism has a myriad of applications across different industries. 

Here are some examples:

* Internal Combustion Engines (ICE): The mechanism plays a vital role in converting the reciprocating motion of the engine's pistons into the rotational motion of the crankshaft. This motion powers the vehicle's wheels, allowing it to move.

* Pumps and Compressors: In devices like reciprocating pumps and compressors, the slider-crank mechanism is used to transform the rotational motion of an electric motor into the linear motion needed to move fluid or compress gas.

* Robotic Arms: The mechanism is employed in the design of robotic arms to achieve precise linear and rotational movements, enabling the robot to perform various tasks accurately and efficiently.

* Mechanical Presses: In industrial settings, the slider-crank mechanism is often used to power mechanical presses that shape or cut materials. By converting rotational motion into linear motion, the mechanism allows for precise and powerful pressing actions.


Content like the one that this channel provide, are really motivating:

<!-- <https://youtu.be/NvtcTXey0U8?list=LL&t=601> -->

{{< youtube "NvtcTXey0U8" >}}


Would definitely watch the full video (and explore his channel).


## Slider and Crank Representation


## Interacting with a Slider and Crank Mechanism

I have built a **DASH App** to interact and visualize a Slider-Crank mechanism, it has been possible thanks to the perfect integration of the DASH App with Docker and deployed at Google Cloud Run.

* The source code <https://github.com/JAlcocerT/Slider-Crank>
* The App <https://slider-crank.fossengineer.com>