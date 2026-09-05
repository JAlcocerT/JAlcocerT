---
title: "Time for MultiBodySystemsDynamics (dot) com"
date: 2026-09-03
draft: false
tags: ["Mechanism Analytics x Simulations","JAlcocerTech WhitePaper","Forgejo"]
description: 'Mechanism agentic centered design.'
url: 'whitepaper-mbsd'
math: true
---


**Tl;DR**

**Intro**

* https://multibodysystemdynamics.pages.dev/


Some people are were billing 50$/h and paying 5$/h for such expertise.

Now its OSS and thats fine.

Because ideas are worthless and **execution is everything**



{{< details title="Executing with CC 📌" closed="true" >}}

Claude Code - Start with this agentic coding assistant that runs in your terminal

Computer Use - Explore this set of tools that lets Claude interact with desktop applications

Agents - Understand what makes these applications successful as agents

Claude Code has access to generic, flexible tools like:

bash - Run any command
read - Read any file
write - Create any file
edit - Modify files
glob - Find files
grep - Search file contents

It notably doesn't have specialized tools like "refactor code" or "install dependencies." Instead, Claude figures out how to use the basic tools to accomplish these complex tasks. This abstraction allows it to handle countless programming scenarios that the developers never explicitly planned for.

```sh
claude 
#/goal work until my webaudit framework returns a 100%
#/goal clear
```

Use workflows when you can picture the exact flow or steps that Claude should go through to solve a problem, or when your app's UX constrains users to a set of tasks
Use agents when you're not sure exactly what task or task parameters you'll give to Claude

> Managed Policy > User > Project > Local

Use `Claude.md` for conventions `skills` for procedures tied to tasks and `Hooks` for rules that cant be skipped

A skill isn't just a single skill.md file. The folder around it can carry other things, and this is what makes skills powerful for verification.

Drop a reference.md next to the skill for detailed material, then link to it from skill.md. Claude only reads it when it actually needs that depth. Your main file stays short.
Put scripts in the folder too. Claude executes them rather than loading their contents into context. That means a skill can carry its own tooling, like a check.sh that runs all the gates.

The takeaway: keep skill.md itself lean. Push the heavy material, the long explanations and the executable scripts, into side files. The lean file describes what to do; the side files hold the depth and the tools.

With this one:

```sh
/schedule daily audit for blabla at 9am #this runs at anthropic servers
#/routine #routine can runs on Anthropic infrastructure on a cron trigger
```

```sh
claude -p "summarize the changes in this diff"
```

Get a cold second opinion

The sub-agent code review you'd run before a pull request works here too. Point it at an unsupervised run.

Open a fresh session or sub-agent and have it review the changed code with no memory of how the code was built. Because it has no stake in the approach, it catches the things the original run talked itself past. A second reviewer with fresh eyes finds what the author rationalized away.

**PLUGINS** are how CC packages a setup and moves it between ppl https://agent-plugins.org/

```sh
#these execute code with your user permissions, be careful
/plugin install #marketplace add abc/def
```

![alt text](/blog_img/GenAI/plugins.png)

{{< /details >}}

{{< details title="Executing with CC 📌" closed="true" >}}


{{< /details >}}

**Intro**

* Why Im writting this post: *Bc The engine behind `https://multibodysystemsdynamics.com/` cant be closed source.*
* What [Ive learnt](#conclusions) with it: *Ive ended*

From the [wedding conversation with Gilabert](https://jalcocert.github.io/JAlcocerT/what-do-i-do/), my last mbsd post with [the framework launch](https://jalcocert.github.io/JAlcocerT/design-centric-mbsd/) and [inspired by diode Inc](https://www.youtube.com/watch?v=B8DbMJ1Zr4I).

We are coming from [this agentic mbsd centered design post](https://jalcocert.github.io/JAlcocerT/design-centric-mbsd/#mbsd-framework-applications):

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

PWA coming up as subdomain: http://192.168.1.2:3034/hermesagent/mbsd/src/branch/oss-core-2d/web


## Showcase - Engine Vibrations

Say that you can to simulate a new engine type:

{{< youtube "HVqYlP1MC6E" >}}

<!-- 
https://www.youtube.com/watch?v=HVqYlP1MC6E -->

```sh
git clone 
```

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

Lately Ive seen many people in charge of noisy roadmaps.

Not sure whats the excuse to make a clear: planned / next / released.

  mbsd-examples/docs/release-plan.md:73

  New ladder:

  0.4.0: export schema and CAD handoff bridge
  0.5.0: experimental 3D model vocabulary
  0.6.0: 2D solver hardening and API maturity
  0.7.0: 3D kinematics preview
  0.8.0: 3D dynamics preview
  0.9.0: integration and case-study track
  0.9.1+: additional curated examples, integrations, and case studies

   0.4.0 -> portable exports
  0.5.0 -> 3D vocabulary
  0.6.0 -> stronger 2D foundation
  0.7.0 -> 3D kinematics preview
  0.8.0 -> limited 3D dynamics preview
  0.9.x -> integrations, case studies, validation stories
  1.0.0 -> stable public API and honest capability boundary


  mbsd-core branch stack:

  v0.4.0-dev  1c0c45d  export schema dev
  v0.5.0-dev  dc194b3  spatial vocabulary dev
  v0.6.0-dev  ebd2008  diagnostics dev
  v0.7.0-dev  42f559b  spatial kinematics dev
  v0.8.0-dev  14eb993  spatial dynamics dev

  mbsd-examples branch stack:

  v0.4.0-dev  d90a8a7  export handoff example
  v0.5.0-dev  1be3c09  spatial vocabulary example
  v0.6.0-dev  801da5a  diagnostics panel example
  v0.7.0-dev  9850fbb  spatial kinematics preview example
  v0.8.0-dev  924442d  spatial dynamics preview example

  What’s included locally:

  - 0.4: JSON/CSV export surface for PWA/CAD handoff.
  - 0.5: experimental 3D vocabulary: poses, quaternions, bodies, frames, model payloads.
  - 0.6: PWA-friendly 2D configuration diagnostics.
  - 0.7: experimental 3D point kinematics and spherical-joint residuals.
  - 0.8: limited experimental 3D free-body dynamics preview.

Local-only v0.8.2-dev is ready in both repos.

  mbsd-core:

  - Branch: v0.8.2-dev
  - Commit: b3d24ff Prepare v0.8.2 spatial dynamics solver dev
  - Version: 0.8.2.dev0
  - Added:
      - SpatialMechanism.simulate(...)
      - SpatialDynamicsResult
      - translational mass dynamics
      - fixed-orientation spatial dynamics
      - force inputs
      - finite-difference translational constraint Jacobians
      - Lagrange multiplier acceleration solve
      - position/velocity projection back onto constraints
      - dynamic-result JSON export via result_to_dict() / result_to_json()

  mbsd-examples:

  - Branch: v0.8.2-dev
  - Commit: 254a43e Prepare v0.8.2 spatial dynamics solver examples dev
  - Version: 0.8.2.dev0
  - Added:
      - examples/spatial_dynamics_solver_preview.py
      - generated local artifact:
          - artifacts/spatial/spatial-dynamic-result.json

  Verification:

  - Core: 36 passed, examples ran, Ruff clean.
  - Examples: 27 passed, all examples ran, gallery generated, Ruff clean.

  I also updated the private PWA roadmap at:

  private-pwa-roadmap.md

  Important caveat remains: this is a limited translational constrained spatial dynamics solver with
  fixed orientations. It is useful for a PWA 3D lab/prototype, but still not full rotational
  constrained 3D rigid-body dynamics.

   My Recommendation

  For the private PWA: use v0.8.2-dev now.

  For public OSS: do not publish this as a headline until later. I’d place it in:

  v0.9.0: experimental spatial dynamics preview

  Then keep v0.8.0 focused on:

  v0.8.0: Mechanism.spatial() and constrained 3D kinematics preview

  That gives you a cleaner story:

  0.7.0: spatial vocabulary and point kinematics
  0.8.0: spatial mechanism API and constrained kinematics
  0.9.0: experimental spatial dynamics and case-study integrations

* multibodysystemsdynamics.com - Landing
* app.multibodysystemsdynamics.com - PWA
* multibodysystemsdynamics.com/roadmap
* multibodysystemsdynamics.com/whitepaper

### Compliant Mechanism

Dynamics is trickier when **solids are flexible** -- aka when we stop saying that they are infinitely rigid.

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Bring AI to your workflow" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

---

## FAQ

As long as you do not push the branch or tag, it stays only on your machine.

Local-only means:

```sh
git switch -c v0.4.0-dev
```

  No v0.4.0 tag was created, and neither dev branch has an upstream. GitHub will not see them unless
  you explicitly push them.

  For tomorrow’s v0.3.0 release, remember to switch back to main before pushing:

  cd /home/jalcocert/Desktop/mbsd-framework/mbsd-core
  git switch main
  git push origin main
  git push origin v0.3.0

  cd /home/jalcocert/Desktop/mbsd-framework/mbsd-examples
  git switch main
  git push origin main
  git push origin v0.3.0

>  /home/jalcocert/Desktop/mbsd-framework/mbsd-examples/docs/release-plan.md


  For v0.4.0, I’d define this as: MBSD can write mechanism and result data into clean external formats
  that other tools can consume.

  Not “MBSD becomes a CAD tool.”

  Good 0.4.0 scope:

  - Export mechanism topology:
      - bodies
      - joints
      - drives
      - springs/forces where simple
      - metadata/units

  - Export solved trajectories:
      - time array
      - body poses: x, y, theta
      - optional point traces
      - constraint residual summaries

  - Add a stable JSON format:
      - mechanism.to_dict()
      - mechanism.to_json(path)
      - maybe result_to_dict(result)
      - maybe export_trajectory_csv(...)

  - Examples repo:
      - one JSON export example
      - one CSV trajectory export example
      - one “CAD handoff” example showing how exported points could become CAD/sketch data

  The CAD bridge should probably be data-first:

  mbsd-core -> JSON / CSV / simple neutral data
  examples  -> show FreeCAD / Blender / CADQuery-style handoff later

  I would avoid adding FreeCAD, CadQuery, Blender, or STEP export as core dependencies in v0.4.0.

  3D Track

  For v0.5.0, I’d treat this as the first experimental 3D branch of the framework.

  Not “full production 3D multibody dynamics.”

  Good 0.5.0 scope:

  - Add experimental 3D namespace, maybe:

  from mbsd.experimental import spatial

  or:

  import mbsd.spatial

  - Define basic 3D concepts:
      - body pose
      - rotation representation
      - mass/inertia placeholder
      - simple joints sketch
      - coordinate conventions

  - Provide one or two examples:
      - free rigid body pose representation
      - simple pendulum-like spatial setup
      - maybe visualization/export only, not dynamics yet

  - Keep it clearly labeled experimental:
      - API may change
      - not equivalent to planar solver yet
      - no broad contact/collision/multiphysics claims

  The useful split is:

  v0.4.0: make 2D results portable
  v0.5.0: start a careful 3D model vocabulary

  That sequence is good because exports will also help the 3D story later.


### Cool Builder Channels

* https://www.youtube.com/@MiniDIY0/videos

Paillard fan

<!-- 
https://www.youtube.com/watch?v=DudAEiP6lKU 
-->

{{< youtube "DudAEiP6lKU" >}}

### Omarchy

Some more [omarchy](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-december-2025/#omarchy)

* `https://omarchy.org/`
* `https://tryomarchy.com/`

The name **Omarchy** is a portmanteau of **"Omakase"** and **"Arch"**:

* **Omakase (お任せ):** A Japanese dining concept meaning "I leave it up to you". In an omakase meal, you don't order individual items; the chef curates and prepares the entire progression of dishes based on what is best.
* **Arch:** Refers to **Arch Linux**, the lightweight, rolling-release distribution that forms the base of the operating system.

This brings docker, lazydocker, herdrd, lazygit installed by default :)

Run this to lower the VM to 4 GB RAM and 2 CPUs: *You can get started using 1.2GB of RAM and I could tinker with <4GB*

```sh
virsh --connect qemu:///session shutdown omarchy-4.0.1 2>/dev/null || true

virsh --connect qemu:///session setmaxmem omarchy-4.0.1 4096M --config
virsh --connect qemu:///session setmem omarchy-4.0.1 4096M --config
virsh --connect qemu:///session setvcpus omarchy-4.0.1 2 --config

virsh --connect qemu:///session start omarchy-4.0.1
gnome-boxes
```

If Boxes still acts weird, open the same running VM with:

```sh
virt-viewer --connect qemu:///session --attach omarchy-4.0.1
```

I send some goodies via:

```sh
  ssh -p 2022 dhh@127.0.0.1 \
    'umask 077; mkdir -p ~/Desktop; cat > ~/Desktop/.env; stat -c "%a %s %n" ~/Desktop/.env' \
    < /home/jalcocert/Desktop/JAlcocerT/.env
#  cat ~/Desktop/.env | grep '^OPENAI_API_KEY='
```

Now just add whatever programs you use beyond the browser:

```sh
omarchy pkg add bitwarden gram proton-vpn-gtk-app #this flows from pacman repos, not AUR :)
yay -S helium-browser-bin #alternative chromium based
omarchy pkg add arduino-cli blender freecad
omarhcy install service tailscale
#omarchy bar position bottom #modifies the omarchy/shell.json
```

You can also connect your airpids [via plugins](https://plugins.omarchy.org/explore.html): https://github.com/thisisgm/omarchy-pods

* https://github.com/tharinfernando/omarchy-protonvpn
* https://github.com/patcastle/omarchy-battery-health
* https://plugins.omarchy.org/plugin.html?id=io.github.aryan-techie.bluetooth
* https://plugins.omarchy.org/plugin.html?id=io.github.heyimhere.hardware-panel


```sh
scp -P 2022 dhh@127.0.0.1:/home/dhh/Downloads/wiki-technitium.md /home/jalcocert/Desktop/
```

### PWA Power

From   /home/jalcocert/Desktop/mbsd-framework/mbsd-core-web-later


```sh
cd /home/jalcocert/Desktop/mbsd-framework/app-mbsd
make build
make preview
make deploy
```

> Going to `https://main.app-mbsd.pages.dev/`


• The metadata confirms mbsd-core-web-later is explicitly a static PWA and uses Pyodide to run MBSD in-
  browser. I’ll also check which of these folders are actual git repos, since you asked “a repo.”

• Explored
  └ Search */node_modules/* in mbsd-core-web-later
    Read pyodide-runner.ts, main.ts
    Search .git in .

───────────────────────────────────────────────────────────────────────────────────────────────────────

• Yes: mbsd-core-web-later (mbsd-core-web-later/README.md:1).

  It is explicitly described as a “Static PWA for trying MBSD planar mechanism examples in the
  browser.” It wraps MBSD via Pyodide, syncs the Python package into static assets, and builds with
  Vite using base: "./" for relative/static deployment.

  Key files:

  - mbsd-core-web-later/README.md:1 - says it is the static PWA
  - mbsd-core-web-later/public/manifest.webmanifest:1 - PWA manifest
  - mbsd-core-web-later/public/sw.js:1 - service worker/cache
  - mbsd-core-web-later/src/pyodide-runner.ts:1 - loads Pyodide and mounts MBSD
  - mbsd-core-web-later/vite.config.ts:1 - relative static build config

  One caveat: I did not find a .git directory inside mbsd-core-web-later, so it appears to be a project
  folder in this workspace, not currently a standalone git repo. The actual git repos I found include
  mbsd-core, mbsd-examples, local-mbsd, hermesagent-mbsd, mbsd, etc.


  So the feature shape is clear for app-mbsd:

  1. Static Pyodide PWA.
  2. Run three initial planar demos.
  3. Show animation, plots, residuals, diagnostics.
  4. Export JSON/CSV.
  5. Cache runtime/assets for offline use.
  6. Keep app private and keep mbsd-core clean.

### Solo Design

With Open Deesign, ofc.

