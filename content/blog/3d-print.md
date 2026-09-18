---
title: "[Learning] 3D Printing"
date: 2026-09-15
draft: false
tags: ["Tinkering IRL","Blender","Dron Stand","FreeCad x Calculix Beso"]
description: 'Toys? or Additive manufacturing at home?'
url: '3d-printing-101'
---


**Tl;DR**


**Intro**

* Why Im writting this post: 
* What [Ive learnt](#conclusions) with it: *Ive ended up sending for [manufacturing STLs for the first time](#my-first-3dprint)*



## Design Hello World

### Design Files 101

1. .STL
2. 

### Blender can do?

```sh
choco install blender --version=4.2.2 -y
#  choco info blender 
#brew install --cask blender #this got me the latest 5.1
```


---

## Conclusions

Wherever you see `price = cost + margin`, you are looking to a commodity

https://github.com/JAlcocerT/poc/tree/main/blender/dron-standing

### Where to get Models



### Where to get them printed

I recently got to know that pcbway can estimate the cost and send you plastic and even metal 3dprints.



---

## FAQ

### My First 3dPrint

Thanks to `https://aetherfpv.com/pages/gravity-drone-stand` I got a STL with a fantastic design that brings a dron stand

1.  via `https://drukex.pl/en/pricing/#wycena-form` I got my first quote

```sh
cd ./poc/blender/dron-standing #https://github.com/JAlcocerT/3Design
make inspect-print-ready-quote
make inspect-quote-8
```

> The estimated price for FDM 3D printing starts from *just PLN 0.9 per gram* of the finished print. For larger quantities of identical parts, the cost may drop to approximately PLN 0.7 per gram.

The editable scene and reproducible generator are also
included:

- Blender scene (reference/
  original_assembly_mechanism_15s.blend)

- Animation script (animate_original_assembly.py)

```sh
make animate-original-assembly
make open-original-animation
make animate-original-assembly-detail-180
make open-original-animation-detail-180
```

<!-- https://youtu.be/ON7J_xA55Io -->

{{< youtube "ON7J_xA55Io" >}}


2. I also tried an ordered from: `https://drukarex.pl/`

>  Materiał PETG, warstwa 0,20 mm, 4 ścianki, wypełnienie 30%

3. Also got to know that there is an agregator `https://craftcloud3d.com/` which can also print in metals like aluminum or titanium (they also have cnc machining and molding - crazy that this can be some kind of manufacturing as a service!)

> And [it worked](https://youtube.com/shorts/KN0YrPE9GO8)

<!-- https://youtube.com/shorts/fugTKhjW-FQ -->

{{< youtube "fugTKhjW-FQ" >}}

yup

{{< youtube "VgRgUhA66Kk" >}}

<!-- https://youtube.com/shorts/VgRgUhA66Kk -->

#### Improvements

So for v102, we would replace: four-finger snap-fit collar → two-jaw snap-fit collar

> Yep, i snapped one!

  it is not a rack-and-pinion.

  The best name is a rack-and-pawl ratchet—more broadly, a discrete ratcheting linkage. The toothed long rod is the
  rack; the arm/slider engagement acts as the locking pawl/detent.

  There is no rotating circular gear (a pinion) driving the rack.

> this part was strong enough thought


### FEM x Calculix x Beso

Skipping my oss mbsd framework this time, just curious to see how stress flow through the 3d print I got:

* https://jalcocert.github.io/JAlcocerT/fem/
* https://fossengineer.com/beso-topology-optimization-calculix/