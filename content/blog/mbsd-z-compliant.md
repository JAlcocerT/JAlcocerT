---
title: "Time for MultiBodySystemsDynamics (dot) com"
date: 2026-09-04
draft: false
tags: ["Mechanism Analytics x Simulations","JAlcocerTech WhitePaper","Forgejo"]
description: 'Mechanism agentic centered design.'
url: 'whitepaper-mbsd'
math: true
---

https://multibodysystemdynamics.pages.dev/

**Tl;DR**

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

app.multibodysystemsdynamics.com
multibodysystemsdynamics.com
multibodysystemsdynamics.com/roadmap
multibodysystemsdynamics.com/whitepaper

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