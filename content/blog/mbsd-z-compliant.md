---
title: "Compliant mechanisms and MultiBodySystemsDynamics dot com"
date: 2026-07-15
draft: false
tags: ["Mechanism Analytics x Simulations","JAlcocerTech WhitePaper"]
description: 'Dynamics is trickier when solids are flexible. Mechanism agentic centered design.'
url: 'whitepaper-mbsd'
math: true
---

```sh
make list-user-repos NEW_USER=hermesagent
make tinker-to-github #https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/mbsd
```

 Current behavior in scripts/tinker-to-github.sh:1:

  - it clones each Forgejo repo as a mirror
  - then it pushes only HEAD to one GitHub branch:
      - refs/heads/<prefix>/<source-user>/<repo-name>

  So for hermesagent/mbsd:

  - if it has 1 branch, that one branch is what gets exported
  - if it has 2 or more branches, only the repo’s current HEAD branch is sent
  - the other branches are not sent

![alt text](/blog_img/selfh/forgejo-to-github.png)

https://www.youtube.com/watch?v=9aFyLqJWCy0

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

**Tl;DR**

From the wedding conversation with Gilabert, my last mbsd post with [the framework launch](https://jalcocert.github.io/JAlcocerT/design-centric-mbsd/) and inspired by diode

**Intro**

Because ideas are worthless and execution is everything

The engine under `https://multibodysystemsdynamics.com/` cant be closed source.

## Showcase - Engine Vibrations

Say that you can to simulate a new engine type:

https://www.youtube.com/watch?v=HVqYlP1MC6E

## Conclusions

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Bring AI to your workflow" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


---

## FAQ

### Cool Builder Channels

* https://www.youtube.com/@MiniDIY0/videos

paillard fan

https://www.youtube.com/watch?v=DudAEiP6lKU
