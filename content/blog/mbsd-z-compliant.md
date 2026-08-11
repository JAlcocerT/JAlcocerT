---
title: "Time for MultiBodySystemsDynamics (dot) com"
date: 2026-08-19
draft: false
tags: ["Mechanism Analytics x Simulations","JAlcocerTech WhitePaper","Forgejo"]
description: 'Mechanism agentic centered design.'
url: 'whitepaper-mbsd'
math: true
---

**Tl;DR**

Because ideas are worthless and execution is everything

The engine behind `https://multibodysystemsdynamics.com/` cant be closed source.

**Intro**

From the [wedding conversation with Gilabert](https://jalcocert.github.io/JAlcocerT/what-do-i-do/), my last mbsd post with [the framework launch](https://jalcocert.github.io/JAlcocerT/design-centric-mbsd/) and [inspired by diode Inc](https://www.youtube.com/watch?v=B8DbMJ1Zr4I).

```sh
make list-user-repos NEW_USER=hermesagent
make tinker-to-github #https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/mbsd
```

Current behavior in `scripts/tinker-to-github.sh:1`:

- it clones each Forgejo repo as a mirror
- then it pushes only HEAD to one GitHub branch:
    - refs/heads/<prefix>/<source-user>/<repo-name>

So for hermesagent/mbsd:

- if it has 1 branch, that one branch is what gets exported
- if it has 2 or more branches, only the repo’s current HEAD branch is sent
- the other branches are not sent

![alt text](/blog_img/selfh/forgejo-to-github.png)

<!-- 
https://www.youtube.com/watch?v=9aFyLqJWCy0 
-->

{{< youtube "9aFyLqJWCy0" >}}

```md
I have in this folder a multi body system dynamics repository with quite a lot of tinkering pushed to my local forgejo instance at the homelab with the user hermesagent via ssh, what do you think about this?
```

`oss-core-2d` - http://192.168.1.2:3034/hermesagent/mbsd/src/branch/oss-core-2d

Yes. The intended meaning is:

- oss-core-2d / v0.1: clean 2D core
- oss-0.2-plotting: 2D core + plotting/gallery
- oss-0.3-synthesis: previous + 2D synthesis helpers
- oss-0.4-export: previous + export/CAD hooks
- oss-0.5-3d-experimental: previous + experimental 3D API

So 0.5 should include all earlier 2D functionality plus the first public 3D namespace.

## Showcase - Engine Vibrations

Say that you can to simulate a new engine type:

{{< youtube "HVqYlP1MC6E" >}}

<!-- 
https://www.youtube.com/watch?v=HVqYlP1MC6E -->

### Inline

### V

### W

Yep, [these can get 20L displacement](https://jalcocert.github.io/JAlcocerT/understanding-batteries/#w-engine-simulation) and require a huge power spike to get started.

### Rotatory

## The Web x Leads

Inspired by diode inc, i decided to make the core engine OSS.

The landing and the leads are mine :)


---

## Conclusions



### Compliant Mechanism

Dynamics is trickier when solids are flexible

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Bring AI to your workflow" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

---

## FAQ

### Cool Builder Channels

* https://www.youtube.com/@MiniDIY0/videos

Paillard fan

<!-- 
https://www.youtube.com/watch?v=DudAEiP6lKU 
-->

{{< youtube "DudAEiP6lKU" >}}