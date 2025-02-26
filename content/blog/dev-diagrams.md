---
title: "How to make Quick Diagrams: MermaidJS and more"
date: 2023-12-29T23:20:21+01:00
draft: false
tags: ["Dev"]
description: 'How to use Mermaid Diagrams for Quick diagrams. Compared with Python Diagrams, DrawIO'
url: 'how-to-use-mermaid-diagrams'
---

An image is worth a 1000 words.

I cant disagree with that sentece since I discovered these tools:

1. [MermaidJS](#mermaidjs)
2. [Python Diagrams and DrawIO](#other-diagram-tools)

## MermaidJS

A game changer for documenting processes and architecture diagrams:

* https://mermaid.live/

**Example** A top down flow chart:

```
graph TD;
    Apps-->Double-Click;
    Double-Click-->.deb
    Double-Click-->.Appimage
    Apps-->Terminal;
    Terminal-->APT/NALA;
```

Dont be afraid, the **MermaidJS docs are just amazing** to follow: https://mermaid.js.org/intro/


## Other Diagram Tools

How could it not be a possibility with Python?
1. [Python Diagrams](https://fossengineer.com/free-diagram-tools/#python-diagrams)

And if you want, you have a SelfHosted option:

2. [DrawIO](https://fossengineer.com/selfhosting-drawio-with-docker/)

{{< callout type="info" >}}
These tools play great with **PPTs as a code**: SliDev, Remark, MARP
{{< /callout >}}