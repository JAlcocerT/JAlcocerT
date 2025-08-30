---
title: "MCP Auth with ToolHive"
date: 2025-09-23
draft: false
tags: ["AI","ToolHive","AgentsMD","markitdown"]
description: 'MCP Auth with...docker?'
url: 'understading-mcp-toolhive'
---

# Toolhive Studio – Flatpak Installation (User Scope)

This guide documents the steps we used (Option A) to install Toolhive Studio from a local Flatpak bundle by adding Flathub to the **user** remotes and installing the legacy runtime it requires.

## Prerequisites

- Flatpak installed.
  - Ubuntu/Debian: `sudo apt update && sudo apt install -y flatpak`
  - Arch: `sudo pacman -S --needed flatpak`
  - Fedora: Flatpak is preinstalled
- The bundle file downloaded to your Desktop:
  - `~/Desktop/toolhive.flatpak`
  - Source: https://github.com/stacklok/toolhive-studio/releases (v0.5.2 link)

## Steps (Option A – User remotes)

1. Add Flathub to **user** remotes (separate from system remotes):
   ```bash
   flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
   ```

2. Install the required legacy runtime (Freedesktop 19.08):
   ```bash
   flatpak install --user flathub org.freedesktop.Platform//19.08
   ```
   - Flatpak will also pull `org.freedesktop.Platform.GL.default//19.08` and locale packs.
   - You’ll see an EOL notice; that’s expected for this older runtime.

3. Install the Toolhive Studio bundle (user scope):
   ```bash
   flatpak install --user --bundle ~/Desktop/toolhive.flatpak
   ```

4. Run Toolhive Studio:
   ```bash
   flatpak run io.github.stacklok.toolhive_studio
   ```

## Notes & Troubleshooting

- Missing runtime error:
  - If you see: `requires the runtime org.freedesktop.Platform/x86_64/19.08 which was not found`, ensure you added **Flathub as a user remote** and completed step 2.
- System vs user remotes:
  - `flatpak remotes` shows both. We added Flathub with `--user` to satisfy user-scope installs.
  - Alternatively, you can install the runtime system-wide with `sudo flatpak install flathub org.freedesktop.Platform//19.08`.
- GTK module messages (e.g., `canberra-gtk-module`):
  - These are usually harmless; sound theme support may be missing but the app still runs.
- Electron auto-update on Linux:
  - Log may mention autoUpdater not supported on Linux; that’s normal.
- EOL Runtime:
  - Freedesktop 19.08 is end-of-life; if it disappears from Flathub in the future, install a newer Toolhive Studio release targeting a supported runtime (e.g., 22.08/23.08), or use a distribution package if available.

## Useful Commands

- List remotes:
  ```bash
  flatpak remotes
  ```

- Launch the app:
  ```bash
  flatpak run io.github.stacklok.toolhive_studio
  ```

- Uninstall the app:
  ```bash
  flatpak uninstall io.github.stacklok.toolhive_studio
  ```

- Remove the legacy runtime (if no longer needed by any app):
  ```bash
  flatpak uninstall org.freedesktop.Platform//19.08 org.freedesktop.Platform.GL.default//19.08
  ```

## Summary

- Added Flathub to user remotes
- Installed Freedesktop 19.08 runtime (EOL but required by this bundle)
- Installed the bundle in user scope
- Launched Toolhive Studio successfully


# Homebrew and ToolHive Installation Guide for Linux

This guide walks through installing Homebrew (package manager) and ToolHive (thv) on Linux systems.

## Prerequisites

- Linux system (Ubuntu/Debian recommended)
- `sudo` access
- Internet connection
- `curl` and `git` (usually pre-installed)

## Step 1: Install Homebrew

### 1.1 Download and Run the Installation Script

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This command will:
- Check for `sudo` access
- Create necessary directories in `/home/linuxbrew/.linuxbrew/`
- Download and install Homebrew
- Set up the basic structure

### 1.2 Configure PATH for Current Session

After installation, add Homebrew to your PATH for the current terminal session:

```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### 1.3 Configure PATH Permanently

Add Homebrew to your shell configuration for future sessions:

```bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
```

### 1.4 Install Build Dependencies (Recommended)

Install essential build tools:

```bash
sudo apt-get install build-essential
```

### 1.5 Verify Installation

Check that Homebrew is working:

```bash
brew --version
```

Expected output: `Homebrew 4.6.7` (or similar version)

## Step 2: Install ToolHive (thv)

### 2.1 Add Stacklok Tap

Add the Stacklok repository to Homebrew:

```bash
brew tap stacklok/tap
```

This downloads formulas from the Stacklok GitHub repository.

### 2.2 Install ToolHive

Install the ToolHive package:

```bash
brew install thv
```

This will:
- Download the latest version of ToolHive
- Install it to `/home/linuxbrew/.linuxbrew/Cellar/thv/`
- Create necessary symlinks

### 2.3 Verify ToolHive Installation

Check the version and available commands:

```bash
thv version
thv --help
```

Expected output for version:
```
ToolHive v0.2.13
Commit: 145bddd6c761b0ef82bc66b73734ba4f965a9567
Built: 2025-08-26 15:37:54 UTC
Go version: go1.24.1
Platform: linux/amd64
```

## Step 3: Verify Commands Are Available

### 3.1 Check PATH Configuration

Verify that Homebrew paths are in your PATH:

```bash
echo $PATH | grep linuxbrew
which brew
which thv
```

### 3.2 Test in New Terminal

Open a new terminal session and verify commands work:

```bash
brew --version
thv version
```

## What You Now Have

### Homebrew Features
- **Package Manager**: Install software packages easily
- **Formula System**: Access to thousands of packages
- **Dependency Management**: Automatic dependency resolution
- **Update System**: Easy package updates with `brew update`

### ToolHive Features
- **MCP Server Management**: Run and manage Model Context Protocol servers
- **Container Isolation**: Secure container-based server isolation
- **Server Registry**: Manage MCP server registries
- **Inspector UI**: Debug MCP connections with web interface
- **Proxy Support**: Create authenticated proxies for servers
- **Log Management**: View and manage server logs

## Common Commands

### Homebrew Commands
```bash
brew install <package>     # Install a package
brew search <package>      # Search for packages
brew update               # Update Homebrew
brew upgrade              # Upgrade installed packages
brew list                 # List installed packages
brew info <package>       # Show package information
```

### ToolHive Commands
```bash
thv run <server>          # Run an MCP server
thv list                  # List running servers
thv logs <server>         # View server logs
thv search <server>       # Search for MCP servers
thv inspector <server>    # Launch inspector UI
thv stop <server>         # Stop a server
thv restart <server>      # Restart a server
```

## Troubleshooting

### Commands Not Found in New Terminals
If `brew` or `thv` commands aren't available in new terminals:

1. **Check .bashrc**: Ensure the PATH line was added correctly
```bash
tail -5 ~/.bashrc
```

2. **Reload configuration**:
```bash
source ~/.bashrc
```

3. **Manual PATH addition** (if needed):
```bash
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
```

### Permission Issues
If you encounter permission errors:

1. **Check ownership**:
```bash
ls -la /home/linuxbrew/.linuxbrew/
```

2. **Fix permissions** (if needed):
```bash
sudo chown -R $USER:$USER /home/linuxbrew/.linuxbrew/
```

### Installation Location
- **Homebrew**: `/home/linuxbrew/.linuxbrew/`
- **Packages**: `/home/linuxbrew/.linuxbrew/Cellar/`
- **Taps**: `/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/`

## Additional Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Homebrew on Linux](https://docs.brew.sh/Homebrew-on-Linux)
- [ToolHive GitHub Repository](https://github.com/stacklok/toolhive)
- [MCP (Model Context Protocol)](https://modelcontextprotocol.io/)

## System Requirements

- **OS**: Linux (Ubuntu 18.04+, Debian 9+, CentOS 7+, etc.)
- **Architecture**: x86_64, ARM64
- **Memory**: 512MB RAM minimum
- **Disk Space**: 1GB free space minimum
- **Network**: Internet connection for downloads

---

*This guide was created based on installation on Ubuntu 22.04 with kernel 6.8.0-65-generic.*


---

## FAQ

* https://github.com/openai/agents.md

> MIT | AGENTS.md — a simple, open format for guiding coding agents

* https://github.com/microsoft/markitdown

> MIT | Python tool for converting files and office documents to Markdown.