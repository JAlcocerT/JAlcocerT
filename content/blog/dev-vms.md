---
title: "Trying NixOS with VMs"
date: 2025-02-07
draft: false
tags: ["QEMU vs GNOME Boxes","WSL","Virtual Machines"]
description: 'How to use virtualization and try any new OS safely via virtual machines.'
url: 'testing-nix-os'
---

**TL;DR**

If you are distro hopping and you are aware of [virtualization](https://jalcocert.github.io/Linux/docs/debian/virtualization/), you might want to give it a try to QEMU or GNOME Boxes.

**Intro**

There are some options to virtualize OS: VMWare, VirtualBox (Free to use) or...**GNOME Boxes**:

```sh
sudo apt update
#sudo apt install gnome-boxes qemu-kvm libvirt-daemon-system libvirt-clients
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients

sudo snap install gnome-boxes
```

Download the latest NixOS `.ISO` and launch gnome-boxes::

```sh
#wget https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso -O nixos.iso
gnome-boxes
```

> You can manage **gnome-boxes via CLI**, but I went the UI way.

As [desktop environment](https://wiki.nixos.org/wiki/Category:Desktop_environment), I went with Plasma 5 (instead of 6).

> The Deepin one was also tempting.

## Getting started with NixOS

I came here for the package manager (stayed for the ease of use? we'll see).

Some useful commands:

```sh
sudo reboot

sudo systemctl start <service>
sudo systemctl stop <service>
sudo systemctl restart <service>
```

Installing stuff is so easy:

```sh
#nix-env -iA nixpkgs.<package-name>
nix-env -iA nixos.librewolf

nix search <query> #search for a pkg
nix search vim

#nix-env -e <package-name> #uninstall

nix-env -q #list installed pkgs
```

Update and upgrade pkgs:

```sh
sudo nix-channel --update
nix-env -u
```

---

## Outro

### Interesting Stuff Regarding Emulation

[GNOME Boxes](https://gitlab.gnome.org/gnome/gnome-boxes) is a virtualization tool for Linux desktop environments (like GNOME on Ubuntu).

It allows you to create, manage, and run virtual machines in a desktop environment.

It’s primarily used to virtualize full operating systems on Linux PCs using technologies like QEMU/KVM.

**Termux**, on the other hand, is a **terminal emulator and Linux environment app for Android devices**.

* It allows users to run a lightweight Linux environment on their Android phone or tablet, providing access to a wide range of command-line utilities and programming environments without rooting the device.
* A native terminal [might come sooner or later](https://www.androidpolice.com/android-linux-terminal/)


![Termux S6 Lite](/blog_img/outro/termux-s6lite.png)