---
title: "My Fav browsers and their automation"
date: 2025-09-22
draft: false
tags: ["Web","Zen vs Firefox vs LibreWolf","Brave vs Chrome","PlayWright MCP"]
description: 'Neko vs KASM vs webtops. Web Automation'
url: 'how-to-browse'
---


Lately I tried Zen browser.

Which *we could say* is a modern UI version of firefox.


https://www.youtube.com/watch?v=799uhYUxtvA

https://browser.networkchuck.com/

## Automating your Browser

Playwright is an open-source browser automation library developed by Microsoft. It is primarily used for fast, reliable, and cross-browser end-to-end testing of web applications. Playwright allows developers to programmatically control browsers such as Chromium, Firefox, and WebKit through a unified API, supporting automation of user interactions, UI testing, and even web scraping.

Yes, Playwright is open source, available under the MIT license, and supports multiple programming languages including JavaScript, Python, C#, and Java. It relates to web scraping because it can automate browser actions including navigation, interaction with page elements, and data extraction, thus enabling scraping of dynamically rendered web pages that simpler HTTP request libraries cannot handle effectively.

In summary:
- Playwright is a web automation tool focused on end-to-end testing.
- It is open source.
- It can be used for web scraping as well as testing, especially for sites with complex, dynamic, or JavaScript-rendered content.[2][3][4][7][10]

[1](https://playwright.dev)
[8](https://playwright.dev/agents/playwright-mcp-browser-automation)
[10](https://github.com/microsoft/playwright)


### MCP x PlayWright

* https://github.com/microsoft/playwright-mcp

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": [
        "@playwright/mcp@latest"
      ]
    }
  }
}
```

## Self-hostable browsers

Several self-hostable browsers running via containers are available, including:

- **Neko**: A self-hosted virtual browser running in Docker containers using WebRTC technology for streaming. It supports multiple browsers like Firefox, Chromium, and Brave and focuses on privacy, multi-user collaboration, and lightweight browser isolation.[1][2][3][4]

- **Kasm Workspaces**: A container streaming platform that can spin up various browsers or full desktops in ephemeral Docker containers accessible via the web browser. It’s designed for enterprise use, secure browser isolation, and remote workspace management.[5][6][7]

- **Browserless**: An open-source Docker container allowing deployment of headless Chrome browsers for remote web automation, scraping, and testing. It supports Puppeteer and Playwright libraries and offers robust API access for automation tasks.[8][9][10]

- **linuxserver/firefox**: A Firefox browser Docker image maintained by LinuxServer which can be run as a container, offering a self-hosted Firefox instance though without the streaming or remote interactive features of Kasm or Neko.[11]

These options differ in focus from lightweight isolated self-hosted browsers (Neko), full containerized workspaces/desktops with browser support (Kasm), to headless browser automation and scraping (Browserless), and a simple containerized Firefox for local or network access.[2][1][8][11]

[2](https://fossengineer.com/selfhosting-neko-browser/)
[7](https://www.reddit.com/r/selfhosted/comments/1isc94o/kasm_open_source_self_hosted_disposable_browsing/)
[8](https://github.com/browserless/browserless)



## Conclusions


| Feature / Aspect             | Kasm                                | Virtual Machines (VMs)                | Webtop via Docker Containers           | Neko Browser Container                 | Typical Desktop Browser (Firefox)      |
|-----------------------------|-----------------------------------|-------------------------------------|---------------------------------------|---------------------------------------|---------------------------------------|
| **Technology Base**          | Docker containers with streaming  | Full hardware virtualization        | Docker containers                     | Docker containers                     | Native application on OS              |
| **Isolation**                | Container-level, app & desktop    | Full OS-level hardware isolation    | Container-level Linux desktop         | Container-level browser isolation    | None (runs on host OS)                |
| **Resource Efficiency**      | Lightweight, low overhead         | Heavy, requires CPU, RAM, storage   | Lightweight, low overhead             | Lightweight                          | Depends on host system (moderate)     |
| **Startup Time**             | Fast (seconds)                    | Slow (minutes depending on setup)  | Fast                                 | Fast                                 | Instant to few seconds                |
| **Access Method**            | Web browser                       | Various (RDP, VNC, etc.)            | Web browser                          | Web browser                          | Direct on host OS                     |
| **Workspace Types**          | Full desktops, apps, browsers     | Full OS desktop                     | Linux desktop                        | Browser session only                  | Browser only                         |
| **Persistence**              | Ephemeral, stateless workspaces  | Persistent state                    | Mutable Linux desktop                | Usually ephemeral browser sessions   | Persistent user data and history     |
| **Security**                 | High, container isolated + controls | Very high, full VM isolation       | Moderate, container isolated          | Moderate, browser container isolation| Depends on OS security, browser sandbox |
| **Scalability**              | High, easy to spin up/down        | Limited by heavy resources          | High, container based                | High, container based                | Limited to device                     |
| **Use Case Focus**           | Secure workspace access & collaboration | Full virtualization for diverse workloads | Linux desktop in browser            | Secure containerized browser         | General web browsing on local machine|
| **Additional Features**      | Workspace lifecycle, collaboration, user management | Full OS control and customizability | Basic desktop with browser access   | Browser automation, multi-user control| Extensions, bookmarks, plugins        |
| **Typical Users**            | Enterprises, remote workers       | Enterprises, developers, testers    | Developers, Linux users              | Security-conscious browser users     | Everyday web users                   |

This puts the typical desktop Firefox browser in context with containerized and virtualized environments, showing it lacks isolation compared to container or VM solutions but provides instant local access and persistent user state on the host OS.[1][2][3][4][5][6][7][8][9]

[1](https://kasmweb.com)
[2](https://docs.linuxserver.io/images/docker-kasm/)
[3](https://ambientnode.uk/kasm-immutable-apps-vms/)
[4](https://www.aiknow.io/en/what-is-kasm-a-browser-based-workspace-platform/)
[5](https://www.liquidweb.com/blog/virtual-desktop-environment-configuring-kasm-workspaces/)
[6](https://www.reddit.com/r/selfhosted/comments/16cdppe/kasm_vs_webtop_20/)
[7](https://www.reddit.com/r/selfhosted/comments/x4r6si/browser_in_a_browser/)
[8](https://news.ycombinator.com/item?id=42690983)
[9](https://www.libhunt.com/compare-neko-vs-KasmVNC)


---

## FAQ


### What is KASM?

Kasm is a container streaming platform that delivers browser-based access to secure, isolated workspaces such as desktops, applications, and web browsers via Docker containers. It essentially provides containerized virtual desktops or browser sessions accessible through a web browser, designed for security, scalability, and ease of access without heavy traditional VM overhead. Kasm workspaces are ephemeral, isolated, and can run full desktops or just apps within containers, allowing quick spin-up and destruction with robust access control and security features.

#### How Kasm compares with a Virtual Machine (VM)

- Kasm uses lightweight Docker containers instead of full virtual machines, resulting in much lower resource overhead, faster startup times, and easier scalability.
- VMs emulate complete hardware environments running full OS installations, which provide thorough isolation but require more CPU, memory, and storage.
- Kasm workspaces are immutable and disposable like lightweight virtual machines but lack some deep system-level isolation VMs provide.
- Kasm is designed for web-browser access and rapid ephemeral usage rather than persistent state typical for VMs.

#### How Kasm compares with a Webtop via Docker containers
- Webtop is also a Docker-based Linux desktop inside a container accessible via a browser or web interface.
- Kasm offers a full platform around container orchestration, access control, workspace management, session isolation, and security with features like chat, collaboration, and automated container lifecycle.
- Webtop focuses on providing a Linux desktop container image and environment, which can integrate with Kasm, but lacks Kasm’s broader workspace management and multi-user features.
- Kasm is more of an enterprise-grade container desktop delivery platform, whereas Webtop is more minimalist for running individual GUI desktops inside containers.

#### How Kasm compares with Neko (a browser running in a container)
- Neko is a self-hosted virtual browser in a container, primarily focused on secure, containerized browser sessions streamed via WebRTC.
- Kasm can run full desktops, multiple applications, or browsers inside containers, providing more versatility beyond just browsers.
- Both aim to isolate browsing or apps in containers for security, but Neko focuses on browser isolation and features like session broadcasting, multi-user control, and automation.
- Kasm offers a broader platform for workspace provisioning, workspace types, user management, and collaboration, whereas Neko targets secure browser use cases specifically.

In summary, Kasm can be seen as a comprehensive container desktop/workspace platform optimized for secure, scalable browser access to virtualized desktops and apps. It is more lightweight and scalable than traditional VMs, more fully featured than minimal container desktop solutions like Webtop, and more versatile than single-browser container solutions like Neko.[1][2][3][4][5][6][7][8][9]

[1](https://kasmweb.com)

[12](https://github.com/kasmtech)

[15](https://www.linuxserver.io/blog/webtop-2-0-the-year-of-the-linux-desktop)
