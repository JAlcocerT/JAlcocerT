---
title: "A Website for a Phd: Pylinac and QaTrack+"
date: 2025-02-23T13:20:21+01:00
draft: false
tags: ["dev"]
description: 'Helping to improve scientific knowledge. Improving the day to day of a radiotherapy researcher. Containers with WSL.'
url: 'web-for-phd-researcher'
---

It all started when a friend discovered some parts to improve withing this library.

An image analysis library for **medical physics**

* https://github.com/jrkerns/pylinac

> MIT | An image analysis library for medical physics

And also...

* https://github.com/qatrackplus/qatrackplus

> QATrack+ is an open source program for managing the quality control program of radiotherapy and diagnostic imaging clinics.


---

Then I proposed to start documenting his learning process.

## HUGO HEXTRA with Github Pages

I suggested to start by cloning this very same repository.

As the HUGO Hextra theme is just ready to roll:

* https://imfing.github.io/hextra/docs/guide/shortcodes/tabs/

To run it locally, it was required to:

0. Git was already installed!
1. Download Go: from `go.dev`
2. Download HUGO from [github releases: 0.117](https://discourse.gohugo.io/t/hugo-0-117-0-released/45644) as its the ones that works on Github Actions
3. Get in love with [Hextra Hugo Theme](https://github.com/imfing/hextra)
4. Discover [diagrams with mermaid.js](https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/) (with preview at https://mermaid.live/ ) and get in love with [Katex](https://imfing.github.io/hextra/docs/guide/latex/#supported-functions)!


Commands to know:

```sh
hugo server #.\hugo server if you are on windows
hugo #to render, if you want, aka to build it locally
```

But...changes were pushed to the repo, and nothing happened.

And its all about that when you are forking a repo with **Github Actions workflows**, you need to enable them (understandable, security reasons):

![KeyStatic CMS with LandingPad Theme](/blog_img/dev/gha-workflows-fork-repo.png)

After you have accepted that (one time), all will flow.

And...here it is: https://jlleongarcia.github.io/jlleongarcia/


## Conclusions

I hope that this is the beginning of a new journey for jlleongarcia.

A journey where the rest of the world can benefit from his amazing effort and discoveries in the radiophysics area of expertise.

No wonder, he already knows that Im there to help with any Python that could make the world a better place!

{{< callout type="info" >}}
JLL was involved in the crearion of [RStocks](https://jalcocert.github.io/JAlcocerT/R-Stocks/)
{{< /callout >}}

### Next Steps

1. Learn to use containers
2. Setup wsl within Windows

Right-click on "Windows PowerShell" and select "Run as administrator."

```sh
wsl --install #this install linux

sudo apt update #this is ubuntu already!
sudo apt upgrade -y

#to access it at another moment, just write:
#wsl
```

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/why-i-love-containers/" title="Reasons to love containers" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/#for-the-real-estate-project" title="See the post about the first iteration of the tool" icon="book-open" >}}
{{< /cards >}}

---

## Cool stuff for Researchers

1. If you are building on top of existing libraries...

* https://github.com/mvantellingen/localshop

> MIT | **local pypi server** (custom packages and auto-mirroring of pypi)

2. https://github.com/vinta/awesome-python

> A great source to get Python ideas (good for the Python unknown unknowns!)