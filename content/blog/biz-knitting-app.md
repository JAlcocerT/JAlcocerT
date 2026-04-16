---
title: "Knitting patterns are all about...math?"
date: 2025-02-17
draft: false
tags: ["Tinkering","Littlyx Web Analytics","FreeSewing","Geometry"]
description: 'From geometric primitives to a future clothing size calculator?'
url: 'knitting-pattern-calculator'
math: true
---


**Intro**

I recently found about: https://freesewing.eu/ and the source code https://codeberg.org/freesewing/freesewing

* https://freesewing.dev/


{{< callout type="info" >}}
Before starting, **credits to lowkey.bold.knit** - `https://instagram.com/p/DE7cDTdMn5k/?utm_source=qr`
{{< /callout >}}


## Before Starting

1. Wool
2. Gaugeswatch measures
3. Pattern Ready or the idea!
4. Know some [cool Knitter](https://cozyknittingclub.com/) to explain you how it works!

![Like this pattern](/blog_img/apps/knitting/pattern.png)

### GaugesWatch

You need to create a test of the pattern:

![Gauges Watch Example](/blog_img/apps/knitting/gaugeswatch.jpeg)

With that, you will know: the **weight ~12g**

* Before blocking:
    * Area = 12.5x13.5cm

* After blocking:
    * Area = 12.5x15.0cm

> The material will let you know its *density*, like **100m / 50g**.

## The Math

We just need to sum areas...of the designed completed.

You’ve hit on the core of **topological construction**.

Whether you are building an engine, a 3D model, or a sweater, the process is the same: you decompose a complex, organic shape into its fundamental **geometric primitives**.

Think of it as the "low-poly" version of your final project.

### 1. The Geometric Primitives

Most things we wear or use can be broken down into these four basic shapes:

* **Cylinders:** Sleeves, pant legs, socks, hat bodies.
* **Cones/Frustums:** Flared skirts, tapered sleeves, the crown of a hat.
* **Spheres/Hemispheres:** The heel of a sock, the elbow of a sweater, the cap of a hat.
* **Planes:** Scarf, the back of a vest, pockets.

### 2. Identifying the "Transition Zones"

The real "geometry" happens where these shapes meet. 

This is where you use math to change the topology of the piece:

* **Increases/Decreases:** These change the radius of a cylinder, effectively turning it into a cone.
* **Short Rows (in knitting):** This is how you "bend" a cylinder (like a sock heel) without cutting the fabric. You are essentially adding a triangular wedge of surface area on one side, forcing the shape to curve.
* **Yokes:** In a sweater, a "circular yoke" is just a large 2D circle with a hole in the middle that eventually splits into three smaller cylinders (the torso and two arms).



### 3. The "Boolean" Approach (Sewing)

In sewing, you aren't building the shapes stitch-by-stitch; you are "subtracting" and "joining."

* If you want a curve to fit a shoulder, you don't just cut a curve; you calculate the **arc length** of the sleeve head to match the **circumference** of the armhole. 
* If they don't match, the geometry fails, and you get "puckering" (which is just the fabric's way of saying it has too much surface area for the space provided).

### 4. How to Decompose Your Project

If you’re looking at something complex you want to make, ask yourself:

1.  **What is the "Parent" shape?** (Is it a box? A tube?)
2.  **Where does the volume change?** (Where does it get wider or narrower?)
3.  **Are the surfaces Developable?** (Can this shape be flattened out without stretching, like a cylinder, or does it have "double curvature" like a sphere?) 

> **Pro Tip:** If a shape has double curvature (like a ball), you cannot make it out of a single flat sheet of paper/fabric without wrinkling it. You *must* decompose it into smaller "gores" (triangular slices) or use a material that stretches (like knit yarn) to cheat the physics.

Are you trying to figure out the "blueprint" for a specific project right now? If you describe the shape, we can try to deconstruct it together.

## The Linen Knit

[Punto de lino](https://www.youtube.com/watch?v=ejKCGqQXC8o) (o tela) in spanish

<!--
https://www.youtube.com/watch?v=ejKCGqQXC8o
-->

{{< youtube "ejKCGqQXC8o" >}}


---

## Learnt with This!

Its also possible to do **QR to link** with Python and CV!

Why i needed that?

I got the ig profile shared via email, and they are...making you go back to the app, with a QR code.

[Unless...](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt) :)

Im now using https://github.com/Litlyx/litlyx for the **web analytics** of this project

![Cookies Meme](/blog_img/web/COOKIES.jpg)

> With no cookie monster involved!

---

## FAQ

* https://github.com/aaronphaneuf/stitch_tracker?tab=readme-ov-file

> Self hosted app for your knitting or crochet projects


### Knitting vs Sewing

The fundamental difference lies in **how the surface is created.** 

In geometry terms, sewing is **subtractive/assembly** of existing planes, while knitting is **additive/generative** growth.

Think of it like the difference between building a house out of plywood sheets (sewing) versus 3D printing it (knitting).

---

1. Top-Down vs. Bottom-Up Geometry

In **sewing**, you start with a 2D plane (the fabric). The geometry is already fixed. Your job is to manipulate that plane using **Euclidean transformations**—cutting, folding, and joining. 

* **The Constraint:** The fabric has a fixed surface area. You can't make a piece of silk bigger, you can only make it smaller or change its orientation.

In **knitting**, you start with a 1D line (the yarn). You are creating the 2D surface and the 3D shape simultaneously. 

* **The Freedom:** You can change the surface area at any moment. If you want more "volume" in the middle of a row, you just add a stitch. You are creating **Non-Euclidean** surfaces (like the Lorenz manifold) much more easily than a seamstress can.

---

2. Darts vs. Rates of Change

Both crafts have to deal with curves (like a bust or a shoulder), but they solve them with different math:

| Feature | Sewing Geometry (Subtractive) | Knitting Geometry (Additive) |
| :--- | :--- | :--- |
| **Curvature** | Created by **Darts**: You cut out a triangle and sew the edges to create a cone. | Created by **Increases/Decreases**: You change the "density" of the grid. |
| **Surface** | **Developable Surfaces**: You are limited to shapes that can be "unfolded" into a flat piece of paper. | **Grown Surfaces**: You can create hyperbolic geometry (ruffles) that can never lay flat. |
| **Grain/Axis** | **Orthogonal**: You have to worry about the "grainline" (horizontal vs. vertical) for stability. | **Radial/Spiral**: You can knit in a continuous circle, meaning there is no "beginning" or "end" to the plane. |

---

3. The "Seam" as a Structural Joint

In **sewing**, the seam is a geometric necessity. Since you are joining two separate planes, the seam acts like a **hinge or a ridge**. It provides structural integrity, much like the frame of a kite.

In **knitting**, a seam is often seen as a failure of the design or a necessary evil. Because you can "knit in the round," you can create a **topological manifold**—a shape like a tube or a donut (torus) that has no edges and no breaks. 

---

4. Tension and Elasticity (The "Cheat")

Knitting uses **Topology** to cheat **Geometry**. 

Because knit fabric is a series of interlocking loops, it is inherently stretchy.

This means a knitter can create a "rough approximation" of a shape (like a heel), and the elasticity of the loops will "math itself out" to fit the body. 

A sewist doesn't have that luxury. 

If the geometry of a tailored wool suit is off by $1cm$, the fabric will pucker or pull because the geometry of the woven threads is rigid.

#### Which one fits your brain better?

* **Sewing** is for people who like **Architectural Geometry**: blueprints, flat patterns, and precise angles.
* **Knitting** is for people who like **Calculus or Fractal Geometry**: thinking about "rates of change" and growing a shape row by row.

Are you more of a "blueprint" person or a "growth" person?