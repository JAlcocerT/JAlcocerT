---
title: "Selfhosted Tools for your"
date: 2027-04-05
draft: false
tags: ["Zetlekasten","Knowledge Management"]
description: 'A look to F/OSS '
url: 'daily-notes-with-oss'
---

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/silverbullet" title="silverbullet | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/raneto" title="LogSeq | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

Logseq Web is the wrong model for your specific setup.

  If you want to use Logseq from another laptop and have notes write into the repo on your home machine, that won’t happen automatically. Logseq Web in the browser writes to a folder
  the browser can access on that same laptop, not to a remote folder on your home server.

  So the practical split is:

  - Good fit
      - Using Logseq on a machine that has the notes folder locally
      - Or using Logseq on each laptop with its own local clone of the repo
      - Then syncing via git, Syncthing, etc.

  - Poor fit
      - Opening Logseq Web from a work laptop and expecting it to write directly into /home/jalcocert/my-logseq-notes on another machine

  If your goal is simply “capture daily notes from anywhere and keep them in this repo,” then Logseq is only a good fit if you use it with local storage + sync.