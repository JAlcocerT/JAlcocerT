---
title: "Desktop Apps with RUST"
date: 2026-05-16
draft: false
tags: ["Rust x Vue","RemotionJS"]
description: 'Using Rust Tauri instead of CustomTkinter and GoLang Wails.'
url: 'desktop-apps-with-rust'
---


**Tl;DR**

From [Go](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/) and Python to Rust desktop apps

**Intro**

A collection of stupid ideas that I just do to test AI models.

1. App for dogs
2. App counter for knitting
3. Pomodoro / Focus to do

## Rust vs Go for Desktop

For **Rust**, the equivalent to Wails is **Tauri**. 

In 2026, Tauri 2.0 is the industry standard for combining a Rust backend with a Vue frontend.

While Wails feels like "Go with a web UI," Tauri feels like "a secure Rust core that happens to have a web UI." 

The workflow is almost identical to what you’ve seen with Go, but the folders and commands change slightly.

1. The Quick Start (The "Tauri" Way)

To scaffold a Rust + Vue project, you use the `create-tauri-app` utility.

It handles all the boilerplate for you.

```bash
# 1. Start the interactive wizard
npm create tauri-app@latest
```

**During the prompts, choose:**
* **Project Name:** `my-rust-hud`
* **Frontend Language:** `TypeScript / JavaScript`
* **Package Manager:** `npm` (or `pnpm` / `bun`)
* **UI Template:** `Vue`
* **UI Flavor:** `Vue - (Vite)`


2. Project Structure Comparison

If you looked at both folders side-by-side, you’d see they are "cousins":

| Feature | **Go + Wails** | **Rust + Tauri** |
| :--- | :--- | :--- |
| **Backend Folder** | `/main.go` or `/app.go` | `/src-tauri/src/main.rs` |
| **Frontend Folder** | `/frontend` | `/src` (at the root) |
| **Config File** | `wails.json` | `src-tauri/tauri.conf.json` |
| **Dev Command** | `wails dev` | `npm run tauri dev` |
| **Build Command** | `wails build` | `npm run tauri build` |

3. How the "Bridge" Looks in Rust

In Wails, you "bind" a Go struct. In Tauri, you define **Commands** and register them in your main loop.

**The Rust Backend (`main.rs`):**
```rust
// A simple function to get CPU data for your HUD
#[tauri::command]
fn get_stats() -> String {
    "CPU: 12% | RAM: 4GB".into()
}

fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![get_stats]) // Register it
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
```

**The Vue Frontend (`App.vue`):**
```javascript
import { invoke } from '@tauri-apps/api/core'

async function updateHUD() {
  // Call the Rust function directly
  const stats = await invoke('get_stats')
  console.log(stats)
}
```

4. Why choose Rust/Tauri over Go/Wails?

If you are already leaning toward **Vue**, here is why you might pick the Rust version:
* **Mobile Support:** In 2026, Tauri 2.0 allows you to turn that same Vue HUD into an **Android or iOS app** with almost zero changes. Wails is currently focused almost entirely on Desktop.
* **Security:** Tauri has a "Capabilities" system. You can strictly forbid your Vue frontend from touching the internet or specific folders unless you explicitly allow it in a config file.
* **Plugins:** Tauri has a massive ecosystem of pre-built plugins (for Biometrics, NFC, Deep Linking, etc.) that are easier to drop in than Wails equivalents.



* **Go + Wails** is your "Speed Demon": You’ll have a working prototype by lunch.
* **Rust + Tauri** is your "Tank": It takes longer to build, but it’s more secure, slightly faster, and can run on your phone.

**Since you've already installed Zed (which uses Rust), would you like to try running the Tauri init command to see if your Rust environment is ready?**


--- 

## Conclusions


### Why not just RemotionJS

```sh

```

---

## FAQ

### Where to find OSS?

1. Sourceforge.net
2. Github / Gitlab
3. Ubuntu's PPA's
4. GHCR, dockerhub, QUAY