---
title: "MCP Auth with ToolHive"
date: 2025-09-26
draft: false
tags: ["AI","ToolHive vs FastMCP","agentpass","AgentsMD","markitdown","Homebrew in Linux"]
description: 'MCP Auth with...docker?'
url: 'understading-mcp-toolhive'
---

**Tl;DR**

[MCP](https://jalcocert.github.io/JAlcocerT/ai-understanding-mcp-framework/) is cool.

Yet MCP auth is hard: https://blog.logto.io/mcp-auth?ref=newsletter. 

See: https://www.agentpass.ai/

> Spin Up Secure MCP Servers without writing code

> > Deploy fully-hosted MCP servers that give AI agents controlled and secure access to your systems

**Intro**

In summary, ToolHive facilitates the use of MCPs by providing a user-friendly, secure, and scalable way to deploy and manage MCP servers in different environments. This enhances the practical implementation and usability of MCP technology in AI-driven workflows.[1][2][3][4]

* https://github.com/stacklok/toolhive

And compare it with:

* https://github.com/jlowin/fastmcp
* https://www.jlowin.dev/blog/fastmcp-2-10k-stars

>  🚀 The fast, Pythonic way to build MCP servers and clients 

## About ToolHive


ToolHive is a software platform designed to simplify the discovery, deployment, and management of MCP (Model Context Protocol) servers. 

It allows users to launch MCP servers securely and quickly in isolated containers with a single command, ensuring ease of use, security, and integration with various developer tools and environments.

ToolHive supports running MCP servers locally, on Kubernetes, or as containerized images, and it automates secure management of secrets and tool registration.

MCPs, or Model Context Protocol servers, act as intermediaries between AI models and external tools, enabling structured and secure interactions that extend the capabilities and context of AI models.

The relation between ToolHive and MCPs is that ToolHive is essentially a management and deployment tool specifically for MCP servers. It makes running MCP servers easier, more secure, and more efficient, helping users connect AI models with the right tools at the right time through MCPs.


And there are some tools to bring that authentication to MCPs:

  * https://mcp-auth.dev/?ref=blog
  * https://github.com/orgs/mcp-auth/repositories
    * https://github.com/sooperset/mcp-atlassian
  * https://github.com/stacklok/toolhive
    * https://docs.stacklok.com/toolhive/guides-ui/install


Toolhive Studio – Flatpak Installation (User Scope)

This guide documents the steps we used (Option A) to install Toolhive Studio from a local Flatpak bundle by adding Flathub to the **user** remotes and installing the legacy runtime it requires.

**Prerequisites**

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

Useful Commands

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

Summary

- Added Flathub to user remotes
- Installed Freedesktop 19.08 runtime (EOL but required by this bundle)
- Installed the bundle in user scope
- Launched Toolhive Studio successfully


## Homebrew and ToolHive Installation Guide for Linux

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

The MarkItDown project by Microsoft is a Python tool for converting various types of files and documents into Markdown format.

This is useful particularly for workflows involving large language models (LLMs) and text analysis pipelines, where Markdown's lightweight, structured text format is highly efficient and easy to work with.

Key Uses of MarkItDown

- Convert documents like PDFs, PowerPoint presentations, Word documents, Excel sheets, and others into Markdown.
- Extract and preserve important document structures such as headings, lists, tables, and links in Markdown format.
- Integrate with LLM applications for text analysis, content understanding, or further processing in Markdown.
- Use an MCP (Model Context Protocol) server for integrating with LLM applications like Claude Desktop.
- Utilize optional dependencies to extend support for specific formats or features (e.g., audio transcription, YouTube transcription).
- Run MarkItDown from the command line or use its Python API for programmatic conversion.
- Use Docker for containerized execution of the tool.

Practical Applications

- Automate document conversion for input to AI systems or for content extraction.
- Support document understanding workflows where Markdown's structured format helps LLMs better understand context and content.
- Process a wide array of file types using a single tool with optional plugins.
- Develop custom plugins to extend functionality as needed.

This tool is very practical for developers, data scientists, and AI practitioners who need a reliable and efficient way to convert complex document formats into a format friendly for natural language models and text analysis.[1]

[1](https://github.com/microsoft/markitdown)

MarkItDown is built as a lightweight Python utility focused on converting various file formats directly into Markdown while preserving document structure, but it is not based on or reliant on Pandoc. Instead, it uses Python libraries and its own conversion logic tailored for Markdown output optimized for LLM workflows.

Regarding OpenAI or other LLM keys: MarkItDown itself does not require an OpenAI API key for basic file conversion. However, it supports optional features that enhance conversion quality using LLMs. 

For example, for generating image descriptions (currently for PowerPoint and image files), MarkItDown can integrate with LLM clients like OpenAI's models. In that case, you would need to provide an OpenAI API key or other LLM access credentials to use these advanced capabilities.

To summarize:

- Technology: MarkItDown uses Python-based conversion tools and its own code, not Pandoc.
- OpenAI key: Not required for core conversion functions; only needed for optional LLM-enhanced features like image description generation.

This design allows flexible usage from simple document-to-Markdown conversion to advanced LLM-integrated workflows when desired.[1]
