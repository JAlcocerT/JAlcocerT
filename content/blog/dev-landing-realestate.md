---
title: "Landing (and more) for Real Estate"
date: 2025-09-02T08:20:21+01:00
draft: false
tags: ["Web","Astro Payroll Theme for Real Estate Landing"]
description: 'Landing page and components for galleries and .'
url: 'real-estate-landing'
---


**Intro** 

Ive been playing quite a lot with PB and quick astro themes lately.

I could not waste the opportunity to make some tech upgrades for a friend.




## The Stack

### New Theme

Its a combination of:


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/real-estate-moi/tree/main/moirealestate-astro-theme" title="Moi Real Estate" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code Astro x Flask as CMS" >}}
  {{< card link="https://github.com/JAlcocerT/payroll-workers-pb" title="Astro Payroll x PB SDK" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro with login auth via Cloudflare Workers" >}}
{{< /cards >}}


1. Simplifcation of the Astro Payroll Theme, that I forked [here](https://github.com/JAlcocerT/payroll-workers-pb)
2. The gallery look and feel from the [previous version source code](https://github.com/JAlcocerT/real-estate-moi/tree/main/moirealestate-astro-theme). Commented [here](https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/#real-estate), as I tried to combined [FlaskCMS](https://github.com/JAlcocerT/real-estate-moi/tree/main/moirealestate-flaskcms) x the Astro theme.


```sh
git clone https://github.com/JAlcocerT/real-estate-moi
cd moirealestate-astro-theme

npm run dev -- --host 0.0.0.0 --port 4324
#sudo docker-compose up -d astro-dev
```

![Astro IG Gallery inpost for Properties](/blog_img/web/moi-realestate/ig-gallery.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg/tree/main/astro-ssg" title="Astro Components Repo | WA Bouble, IG Gallery... ↗" >}}
  {{< card link="https://github.com/JAlcocerT/cybernetik-realestate-moises/blob/main/astro-nomy/src/components/InstagramGallery.astro" title="Astro Component | Make a in-post Gallery, zoomable and that allows to move to next  ↗" >}}
{{< /cards >}}

I just followed this steps to initiate the repo programatically and push it with `gh`: <https://github.com/JAlcocerT/moi-realestate-pb>

```sh
git add .
git commit -m "Initial commit"
#sudo apt install gh
gh auth login
gh repo create moi-realestate-pb --private --source=. --remote=origin --push
```

I brought the repos as submodules 101, for the first time ever:

```sh
git status
git submodule status
git remote -v
```

So to use this in the future

```sh
git clone --recurse-submodules https://github.com/JAlcocerT/moi-realestate-pb.git
# or, after a normal clone:
#git submodule update --init --recursive
```

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/moi-realestate-pb" title="NEW - Real Estate Landing x PB SDK Gallery" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro + PB for Real Estate" >}}
{{< /cards >}}