---
title: "How I Setup Windows [Quickly] with Chocolatey"
date: 2023-12-27T23:20:21+01:00
draft: false
tags: ["Tinkering","Choco"]
summary: 'How to install and use Chocolatey with Windows to make any format C simpler.'
url: 'how-to-use-chocolatey-windows'
---


For some time already, I have been improving my guide on Linux.

I like how simple it is to format and setup Linux again, but I found that we can do exactly the samer thing in windows.

The trick is called [Chocolatey](https://jalcocert.github.io/Linux/docs/#how-to-start-my-linux-journey)

And here is how you can use it too:

Open powershell **as admin**:

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco --version
```

Install podman desktop on windows to get your containers running:

```sh
choco install podman-desktop
```

![Podman Desktop](/blog_img/selfh/podmandesktop.png)

Run podman compose up (podman CLI v4.7.0+) or docker-compose in a directory with a compose.yaml.

Podman Desktop will automatically detect the Compose deployment and show it in the container list.

```sh
podman compose up
```

You will need Windows Subsystem for Linux (**WSL**)

```sh
wsl --install
wsl --version
```

```sh
podman machine init
```

I have this **gist** with my favourite choco commands - https://gist.github.com/JAlcocerT/76f22ddf886277ef2653f82898c634d8       