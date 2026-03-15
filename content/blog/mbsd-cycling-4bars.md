---
title: "The Mechanism behind Cyclying"
date: 2026-04-10T23:20:21+01:00
draft: false
tags: ["DA","MBSD","Sympy","MatterJS","Double Wishbone","2D Simulation"]
description: 'Im Back.'
url: 'cycling-and-the-4-bars-mechanism'
math: true
---


**Tl;DR**

Is the 4 bar mechanism everywhere?

Or is it just ~~my head~~ deployed at [this CSR](https://multibodysystemdynamics.pages.dev/)?

**Intro**

Some math, some physics, some mechanics.

And some [personal journey](#about-mbsd) for starters before going all in with MBSD.

Some economist say that time does not matter.

In this post, [times does matter for the model](#from-concepts-to-equations).

{{< callout type="info" >}}
It also assumes that solids are infinitely rigid!
{{< /callout >}}

Otherwise...how could we describe reality?

In fact, this can be simulated in real-time without problems: https://link.springer.com/book/10.1007/978-1-4612-2600-0

4 bars: leg-leg-biela bicicleta


<!-- 
https://www.youtube.com/shorts/D8Q0Y6R4NiI -->


Its all about 4 bars and a Rigid Solid.

https://jalcocert.github.io/JAlcocerT/slider-crank-mechanism/

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/" title="Data Chat Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}


<!-- engine starting
https://www.youtube.com/shorts/mzWr2ZGf7OU -->

<!-- 


derivatives
The Trillion Dollar Equation
https://www.youtube.com/watch?v=A5w-dEgIU1M
 -->

<!-- 
<https://www.youtube.com/watch?v=ABzKNvJCl28>
<http://firsttimeprogrammer.blogspot.com/2015/02/crankshaft-connecting-rod-and-piston.html>
<http://firsttimeprogrammer.blogspot.com/2015/02/crankshaft-connecting-rod-and-piston.html> -->


## About MBSD

How...have I arrived here?

Its a long story.

I got sold on been a good student.

Wanted to have a career on sth solid, so went for engineering instead of physics.

Decisions taken on verbal information - *like a pro, w/o validating / cross-checking*

{{% steps %}}

### Some Math Wont Hurt

Spent time understanding calculus and algebra.

Again: understanding, not operating.

### Love for physics

### Bike Dynamics Thesis

How could i not go all in on real time 3d motion simulation for bicycles?

* https://github.com/JAlcocerT/Bike_dynamic_simulator

They are crazy efficient in [$/km terms](https://jalcocert.github.io/JAlcocerT/buying-bicycle-through-data-analytics/)

### D&A has real demand

And thats why I pivoted to D&A career.

The dev part was just to sell at scale

### Found Mechanism Project

Forked it and created a personal PoC from scratch:

* https://github.com/JAlcocerT/Slider-Crank
* https://github.com/JAlcocerT/mechanism

and put together some 101 with the equations with [python sympy](#about-python-sympy)

### Today

Fast-forward until today.

Because from 2023 it has all been learn/do/learn/do around AI.

{{% /steps %}}



## Suspension

Long ago I was reading the book:

Among the suspension types, you can understand Double Wishbone Suspension System with the 4B:

<!-- 
https://www.youtube.com/watch?v=XTM4Mqa617o 
-->

{{< youtube "XTM4Mqa617o" >}}

<!-- 
https://www.youtube.com/watch?v=_wUSd-OVZX8 
-->


{{< youtube "_wUSd-OVZX8" >}}

Which is much cooler [than mcpherson](https://www.youtube.com/watch?v=X6JejXjGQiQ), isnt it?

---

## Conclusions

Some time ago, I was wondering if: Julia: optimization, eq solver, symbolic algebra, jump library would be the way to go.

Would Python be the best approach to find the math behind mechanism that cant block along their movement?

Some kind of automated mechanism synthesis.

Matlab ---> a python – programa sintesis mec generalizado.

The passion of your live is to create such systems?

<!-- https://www.youtube.com/shorts/bJBk09S7HQM -->

{{< youtube "bJBk09S7HQM" >}}


Stay with me for the series about MBSD.

```sh 
git clone https://github.com/JAlcocerT/mbsd
cd mbsd/2D-Kinematics
python examples/slider_crank.py
```

---

## FAQ

* https://brm.io/matter-js/

>  Matter.js is a 2D physics engine for the web 


 
### Maximum piston speed with formula

You can demonstrate it step by step:

https://youtu.be/EhOl9Uh_nyw?t=83

Or...simulate it: *under the hood its just same hypothesis and equations*

### From Concepts to Equations


```sh
cd jalon
# Extract text from any file to text format
#uvx kreuzberg extract Chapter01.pdf > output.txt
#uvx 'kreuzberg[cli]' extract jira-estimation.pdf > output.txt
for f in Chapter*.pdf; do
  uvx kreuzberg extract "$f" > "${f%.pdf}.txt"
done

###with container even better!
#docker run -p 8027:8000 goldziher/kreuzberg
#curl -X POST -F "file=@jira-estimation.pdf" http://localhost:8027/extract

```

```sh
#curl -fsSL https://claude.ai/install.sh | bash
claude --help
```

The work i put in the prompts:


see the bicycle simulator inside the matlab folder, do you understand how it works?
could you make an equivalent of that in python on the other folder of the repository?


quote again: AI does not apply to me / my industry


```sh
cd ~/Desktop/Bike_dynamic_simulator/Python_version #migrated from matlab in 2 prompts
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 main.py --keyboard
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kreuzberg" title="Kreuzberg | Docker Config 🐋 ↗" >}}
{{< /cards >}}

<!-- https://youtu.be/0CLNWADDrtY -->

{{< youtube "0CLNWADDrtY" >}}



### About python SymPy


```sh
#rm -rf .git

git init && git add . && git commit -m "Initial commit: MultiBody" && gh repo create mbsd --private --source=. --remote=origin --push

#make install && make dev #requires .env.local
```