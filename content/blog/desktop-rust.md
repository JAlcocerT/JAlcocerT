---
title: "Desktop Apps with RUST"
date: 2026-09-25
draft: false
tags: ["Rust x Vue vs Qt vs PWAs","RemotionJS","DJI Tello","stlite","CNN x libfacedetection"]
description: 'Using Rust Tauri instead of CustomTkinter or GoLang Wails.'
url: 'desktop-apps-with-rust'
---

**Tl;DR**

From [Go](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/) and [Python](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/) to Rust desktop apps

**Intro**

* WHY Im writting this post: *bc [the tkinter](https://github.com/JAlcocerT/optimum-path/tree/master/4-apexsim-desktop) and [go-karting](https://github.com/JAlcocerT/go-karting) desktop were cool. The [PWA Gopro version with ffmpeg](https://github.com/JAlcocerT/optimum-path/tree/master/overlay-pwa) even more and the [dji tello Qt Desktop](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-version) could be better*
* What [Ive learnt](#conclusions) with it: *Ive ended up having nice desktop versions to control the tello with [Go](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-go?ref_type=heads), Python QT and [Rust](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-rust?ref_type=heads), including [facedetection ](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-rust-face?ref_type=heads)and [appimage bundle](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-rust.md?ref_type=heads)*

This year I have [used Go to make one of my first desktop apps](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/#why-go-and-wails) *around the GoPro telemetry and ffmpeg*

* https://github.com/JAlcocerT/go-karting - Tinkered [here](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/)
* https://github.com/JAlcocerT/optimum-path/tree/master/4-apexsim-desktop

Also...[flutter](https://jalcocert.github.io/JAlcocerT/dji-tello-python-sdk/#conclusions) to some extent for the [tello here](https://github.com/JAlcocerT/dron-tello-flutter)

So im just curious, if there are so nice RUST apps like: Zed, Gram, [open drone log](https://github.com/arpanghosh8453/open-dronelog)

And also [rust can make things be cross-platform](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/#cross-platform-comparison)...

## Rust vs Go for Desktop

For **Rust**, the [equivalent to Wails](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-with-go/#why-go-and-wails) is **Tauri**. 

As of today, `Tauri 2.0` is the industry standard for combining a Rust backend with a Vue frontend.

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

* **Mobile Support:** Tauri 2.0 allows you to turn that same Vue HUD into an **Android or iOS app** with almost zero changes. Wails is currently focused almost entirely on Desktop.
* **Security:** Tauri has a "Capabilities" system. You can strictly forbid your Vue frontend from touching the internet or specific folders unless you explicitly allow it in a config file.
* **Plugins:** Tauri has a massive ecosystem of pre-built plugins (for Biometrics, NFC, Deep Linking, etc.) that are easier to drop in than Wails equivalents.


* **Go + Wails** is your "Speed Demon": You’ll have a working prototype by lunch.
* **Rust + Tauri** is your "Tank": It takes longer to build, but it’s more secure, slightly faster, and can run on your phone.


## Tello x Rust

At desktop-rust: `Rust + Tauri 2 + Vue` controller with UDP commands, telemetry, video, photos, recording, logs, safety controls, and Wi-Fi preflight detection.

Run it offline with:

```sh
#git clone git@gitlab.com:fossengineer1/dron.git
#cd dron
make run-rust
```

Other targets:

```sh
make dev-rust
make test-rust
make build-rust
```

Captures go to `~/Pictures/Tello-Rust/`.

The optimized Linux binary is 8.7 MB. Builds, tests, strict linting, and launch smoke-test pass.

It has not yet been flight-tested.

Control and video use separate paths: commands use UDP 8889, while video uses UDP 11111 plus FFmpeg. So flying can work while decoding fails.

I rebuilt the app with:

- Fresh streamoff → streamon reset
- More reliable FFmpeg probing
- Robust JPEG framing
- Visible video diagnostics

Reconnect to Tello and run:

make run-rust

The status will now identify:

- No UDP video packets
- FFmpeg decoder failure
- Video feed ready

Size comparison:

- Rust binary: 8.7 MB
- Python bundle: 553 MB

Rust is smaller because Tauri reuses installed WebKitGTK and FFmpeg. 

The Python bundle includes Python, PySide6/Qt, OpenCV, NumPy, and their native libraries.

Thus the Rust binary is small, but not completely dependency-free.

Your captures are in `~/Pictures/Tello-Rust/`:

- Two JPEG photos
- tello_video_20260926_205706.mp4
- Flight CSV log

Added Linux build/install support with your jalcocertech2.svg logo.

Build and install:

```sh
make install-rust
```

Then open Tello Desktop Control (Rust) from the application menu for correct taskbar icon matching.

```sh
make build-rust     # build only (took 1min with the x13)
make uninstall-rust # remove app, preserving captures
```

Installed under:

~/.local/share/tello-desktop-rust/
~/.local/share/applications/
~/.local/share/icons/hicolor/

### Released version
<!-- 
z-learnings-facial-recognition-detection.md. -->

[Face detection](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-facial-recognition-detection.md?ref_type=heads) is entirely possible in Rust.

Best fit for this app:

1. Sample the decoded video at roughly 3–5 FPS.
2. Run detection in a separate Rust worker.
3. Send face rectangles to Vue through Tauri events.
4. Draw boxes over the video with CSS/SVG.

I’d use Rust’s OpenCV bindings with OpenCV’s lightweight YuNet face detector. A Haar cascade would be simpler for an initial experiment but less reliable.

The important trade-offs:

- Requires native OpenCV development libraries.
- Installation/package size grows substantially.
- Cross-platform packaging becomes more involved.
- Detection must run outside the flight-control thread.
- A latest-frame-only queue prevents detection lag from accumulating.

Alternatively, Rust can run YuNet directly through ONNX Runtime, avoiding the full OpenCV stack, but preprocessing and model integration require more work.

Difficulty estimate:

- Face detection: about 5/10
- Face recognition/identity matching: about 7/10

So yes: the disabled FACE DETECTION button could absolutely become functional while keeping the entire application native and local.

We established that Rust face detection is feasible: sample decoded video at 3–5 FPS, detect in a background worker, emit rectangles through Tauri, and overlay them in Vue. No implementation was requested; the task is complete.

For lightweight Rust face detection, I would not use the note’s OpenCV → YuNet route.

Best option: `libfacedetection_rs`

- Pure Rust
- Embedded CNN model
- No OpenCV or ONNX Runtime
- Returns boxes, confidence and five landmarks
- Uses runtime AVX2 acceleration
- Standalone stripped test binary measured only 1.2 MB

Your app is currently 8.7 MB. With this detector, I’d expect roughly 9–11 MB, not hundreds of megabytes.

One concern: although its README advertises crates.io usage, Cargo cannot currently find it there. We would need to pin a specific Git commit, so it is promising but still experimental.

Other options:

- OpenCV + YuNet: good detection, but heavy native dependencies and packaging. Not suitable for the small-build goal. Rust OpenCV requirements
- tract + YuNet: self-contained Rust ONNX inference, but a general ML runtime is more machinery than detection needs. It does include face-detection examples. tract
- RTen + YuNet: also pure Rust and portable, but requires model compatibility and custom preprocessing/postprocessing. RTen
- rustface: lightweight and pure Rust, but visibly older and less attractive than the new detector.
- Frigate/Immich: far too heavy and poorly matched to live in-app overlays.

My recommendation would be libfacedetection_rs, running at 3–5 FPS in a dedicated worker while the video remains at 15 FPS. It preserves the small Rust architecture remarkably well.

Created desktop-rust-face (desktop-rust-face/README.md).

It includes:

- Pure-Rust CNN face detection
- Face boxes, confidence scores, and five landmarks
- Detection limited to 5 FPS on a separate worker
- Only the latest frame queued, protecting flight controls
- Separate captures in ~/Pictures/Tello-Rust-Face/
- Linux installation with your logo
- Original Rust controller code left unchanged

Commands:

```sh
make build-rust-face
make run-rust-face
make install-rust-face
```

Enable it using the FACE DETECTION: OFF button after connecting.

The optimized binary is 9.3 MB, versus 8.7 MB without detection.

Validation passed: Vue build, 42 Rust tests, release build, startup smoke test, and isolated install/uninstall. The remaining test is with your physical Tello video feed.

> The face detection in Rust worked [beautifully](https://youtube.com/shorts/mEOrIkIpkOo), and the video feed improved [the python one](https://youtu.be/znWRlLyBDxQ)

The gigabytes shown by ncdu are development artifacts:

- Regular Rust target/: 3.7 GB
- Face Rust target/: 3.9 GB
- Detector test cache: 218 MB
- Each node_modules: about 40 MB

Actual optimized applications:

- Regular Rust: 8.7 MB
- Face detection: 9.3 MB
- Installed regular app: 8.7 MB
- Source excluding caches: 636 KB / 1.3 MB

Cargo stores compiled dependencies, debug symbols and incremental build data in target/. These can safely be regenerated. To reclaim the space later:

```sh
cargo clean --manifest-path desktop-rust/src-tauri/Cargo.toml #4.3gb cleaned
cargo clean --manifest-path desktop-rust-face/src-tauri/Cargo.toml #4.4gb
cargo clean --manifest-path desktop-rust-face/vendor/libfacedetection_rs/Cargo.toml #250mb
```

> That won’t remove the installed applications or your photos/videos.

The 9.3 MB executable contains:

  - Tello UDP control and telemetry
  - Vue UI compiled into the binary
  - Video-stream handling
  - Photo and recording logic
  - Flight logging and safety controls
  - The pure-Rust face-detection CNN model
  - Face boxes and landmark logic

  It stays small because it uses system-provided WebKitGTK for the window and ffmpeg for video decoding/recording. Those two large components are not embedded.

  So it’s a compact native app, but not completely dependency-free: the destination Linux machine still needs WebKitGTK and FFmpeg. The deleted ~8 GB was only Cargo’s reusable compilation cache, debug output, and intermediate dependencies
  —not application content.

Yes—on a compatible x86-64 Linux with:

  - WebKitGTK 4.1 and GTK3
  - ffmpeg available in PATH
  - A sufficiently recent compatible glibc

  …it should run essentially the same.

  The caveat is that the raw 9.3 MB binary is not guaranteed on every Linux distribution. Older distributions, ARM computers, or machines missing WebKitGTK 4.1 may reject it. Tauri recommends building on the oldest Linux version you
  intend to support; Ubuntu 22.04 or Debian 12 are good baselines. Tauri AppImage guidance

  For friendly distribution, the next evolution would be:

  - .deb for Ubuntu/Debian, declaring required packages automatically
  - AppImage for broader Linux compatibility, around 70+ MB because dependencies are bundled
  - Separate ARM64 build if desired

So the **9.3 MB build is genuinely the whole custom application and face model**—Linux supplies the heavyweight graphical foundation underneath it. That architecture is wonderfully efficient.

Portable AppImage setup is ready and tested.

Build it with:

```sh
make bundle-rust-face
```

Output: `desktop-rust-face/appimage-dist/Tello Desktop Control Rust Face_0.1.0_amd64.AppImage`

Current bundle:

- Size: 81 MB
- Architecture: x86-64
- Includes the app, face model, WebKitGTK and GUI libraries
- Still requires ffmpeg in PATH
- Successfully passed a launch smoke test
- Uses your application icon

Run it directly: `./desktop-rust-face/appimage-dist/*.AppImage`

The portable copy is outside target/, so you can reclaim the build cache without deleting it:

```sh
cargo clean --manifest-path desktop-rust-face/src-tauri/Cargo.toml
```

AppImages are larger because they bundle Linux dependencies for broader compatibility.

• You can integrate it manually without extra software.

  From the repository root:

  mkdir -p ~/.local/opt/tello-rust-face
  mkdir -p ~/.local/share/applications
  mkdir -p ~/.local/share/icons/hicolor/scalable/apps

  install -m 755 \
    desktop-rust-face/appimage-dist/*.AppImage \
    ~/.local/opt/tello-rust-face/TelloDesktopControl.AppImage

  install -m 644 \
    jalcocertech2.svg \
    ~/.local/share/icons/hicolor/scalable/apps/tech.jalcocer.tello-rust-face.svg

  Create the application-menu entry:

```sh
  cat > ~/.local/share/applications/tech.jalcocer.tello-rust-face.desktop <<EOF
  [Desktop Entry]
  Type=Application
  Name=Tello Desktop Control (Rust Face)
  Comment=Control a DJI Tello with pure-Rust face detection
  Exec=$HOME/.local/opt/tello-rust-face/TelloDesktopControl.AppImage
  Icon=tech.jalcocer.tello-rust-face
  Terminal=false
  Categories=Utility;
  StartupNotify=true
  StartupWMClass=tello-desktop-rust-face
  EOF
```

  Refresh the menu:

  update-desktop-database ~/.local/share/applications 2>/dev/null || true

  You should then find Tello Desktop Control (Rust Face) in your application menu with your logo. You can pin it to the taskbar from there.

> Now I have my own appimage like open-design t3 code or pencip do :)

For the Rust version without face detection:

```sh
make uninstall-rust
```
  For the Python version, only its application-menu launcher was installed:
```sh
rm -f ~/.local/share/applications/com.jalcocertech.TelloDesktopControl.desktop
update-desktop-database ~/.local/share/applications 2>/dev/null || true
```

These commands preserve:

- Your source code
- Python bundle/build files
- Photos and videos
- The new face-detection AppImage

You should then only see the Rust Face AppImage in the application menu.

### AppImage and Learnings

Documented [rust learnings here](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-rust.md?ref_type=heads):

- Complete Rust/Tauri/Vue architecture
- Tello UDP control, telemetry and H.264 pipeline
- Networking and video-decoding challenges
- Flight-safety decisions
- Pure-Rust `libfacedetection CNN` and pinned commit
- Bounded face-detection worker
- 8.7 MB versus 9.3 MB binaries
- Why Cargo caches consumed gigabytes
- Native installation and 81 MB AppImage
- Logo and AppImageLauncher integration
- Runtime dependencies and portability limits
- Testing and physical-drone validation

--- 

## Conclusions

[Every codebase has tradeofs](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-codebase-tradeoffs.md?ref_type=heads).

Putting together **[python](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-version) into a full fledge desktop app** have been interesting and [full of learnings](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-py-desktop.md?ref_type=heads)

I [gave up on using flutter](https://gitlab.com/fossengineer1/dron/-/blob/main/z-mobile-dji-tello.md?ref_type=heads) with the intention to make an Android/iOS app better than the official one.

If you get a tello, it wont be for the FPV experience nor [openess](https://gitlab.com/fossengineer1/dron/-/blob/main/z-open-dron.md?ref_type=heads), but for the tinkering [around facial recognition / detection setups](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-facial-recognition-detection.md?ref_type=heads)

{{< callout type="info" >}}
The key distinction is [one cross-platform codebase](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-crossplatform.md) versus “one universal binary.
{{< /callout >}}

[PySide](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-version?ref_type=heads) is already cross-platform; a CI build matrix can produce Linux, Windows and macOS artifacts from the existing source.

Choose [Go x Wails](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-go?ref_type=heads) if you want to reuse your frontend instincts and learn Go. Choose Tauri if learning Rust is itself part of the goal.

> A truly universal native desktop binary—one file running unchanged on Windows, Linux, and macOS—does not practically exist.

Each OS uses different:

- Executable formats: PE, ELF and Mach-O
- System APIs and UI frameworks
- Security/signing systems
- CPU architectures
- Runtime libraries

“Universal binary” usually means multiple CPU architectures for the same OS, such as a macOS app containing Intel and Apple Silicon code.

Closest alternatives are:

- A web app or PWA running in a browser
- A Java .jar, provided a compatible JVM exists
- WebAssembly, provided an appropriate runtime exists
- Portable source code with separate platform builds

So the realistic goal is:

> One codebase, automated builds, multiple platform-specific packages.

That applies to PySide, Wails, Tauri, Electron, Flutter, .NET and nearly every desktop framework.

Flutter provides one cross-platform codebase, but you still build separate desktop artifacts:

- Windows → .exe and supporting files or installer
- Linux → executable bundle/package
- macOS → .app or .dmg

Each build uses its platform’s native Flutter engine and system integration. Generally, you build Windows on Windows, macOS on macOS, and Linux on Linux.

A CI matrix can automate all three builds whenever you publish a release. Flutter removes most platform-specific application development—it does not create one universal executable.

xactly—that’s the core beauty of PWAs.

You deploy one application, and any supported browser can run it across Windows, Linux, macOS, Android and iOS. Updates happen centrally without rebuilding installers.

The trade-off is hardware access. A normal PWA cannot directly open the Tello’s arbitrary UDP ports or decode its raw UDP H.264 stream. For this drone controller, you would still need a local native bridge/service that communicates with
the Tello while the PWA talks to that bridge through HTTP, WebSocket or WebRTC.

So:

- Typical business app: PWA can genuinely be “write once, run almost everywhere.”
- Tello controller: PWA supplies the portable UI, but a platform-specific native bridge remains necessary.

Browsers achieve portability partly by deliberately restricting direct operating-system and network access.

A normal browser/PWA cannot open arbitrary UDP sockets to the Tello.

Browser networking is primarily restricted to:

- HTTP/HTTPS
- WebSocket
- WebRTC, whose UDP transport is controlled by the browser—not exposed as arbitrary UDP sockets
- WebTransport, which also cannot communicate with a raw Tello UDP endpoint

The Tello expects **direct UDP communication** on:

- 8889 — commands
- 8890 — telemetry
- 11111 — H.264 video

Therefore, a pure [PWA cannot control it directly despite being a nice concept](https://gitlab.com/fossengineer1/dron/-/blob/main/z-learnings-codebase-tradeoffs.md?ref_type=heads#why-pwas-feel-universal)

You would need:

PWA
↕ HTTP / WebSocket / WebRTC
Local native bridge
↕ Tello UDP
Drone

The bridge could be your existing Python backend, a Go service, or a Rust service. It would still need a platform-specific executable, although the entire UI could remain one centrally deployed PWA.

The UI could be implemented in two ways:

1. Embedded Vue UI — recommended

Package the Vue frontend inside an Android app and render it in a WebView. Kotlin communicates with it through a controlled JavaScript bridge. Android WebView integration

2. Independent PWA plus local service

A native Android service exposes localhost HTTP/WebSocket endpoints, and Chrome/PWA connects to them. This preserves a more independent PWA, but background-service rules, CORS, lifecycle management and browser security make it more
complicated.


---

## FAQ

### Where to find OSS?

1. Sourceforge.net
2. Github / Gitlab
3. Ubuntu's PPA's
4. GHCR, dockerhub, QUAY

### Ways to Tello

I was very dissapointed that the official Android app was not available when I bough the DJI tello 3 years ago.

Now, thanks to AI, Ive learnt a few things and put together different ways to control the drone.

### Tello x PyQT

Python captures:

- make run-pyqt: desktop-version/captures/
- Installed/bundled app: ~/Pictures/Tello/

> Videos like [this one](https://youtu.be/znWRlLyBDxQ)

```sh
#ssh -T git@gitlab.com #Edit profile → Access → SSH keys
git clone git@gitlab.com:fossengineer1/dron.git
cd dron
#uv run --project desktop-version desktop-version/main.py
make run-cli
make run-pyqt
```

That gets you the old CLI way, a [new PyQT desktop](https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-version?ref_type=heads).

Previoulsy, i tried python tkinter at [this repo](https://github.com/JAlcocerT/optimum-path/tree/master/4-apexsim-desktop)

```sh
make bundle-py #took 17s and 500mb
#desktop-py-pkg/dist/TelloDesktopControl/
```

Then I could launch with 

```sh
./desktop-py-pkg/dist/TelloDesktopControl/TelloDesktopControl
```

Or to do so natively:

```sh
make install-bundle-py #launch Tello Desktop Control from your apps :)
# This registration lets GNOME/Wayland associate the running window with its icon.
#It doesn’t install Python dependencies; those are already inside the ~500mb bundle
```



### Tello Go x Wails

Created a complete isolated desktop-go (desktop-go/README.md) comparison using Go, Vue 3, and Wails.

* https://gitlab.com/fossengineer1/dron/-/tree/main/desktop-go

Implemented:

- Raw Go UDP connection to the Tello
- Telemetry parsing
- Takeoff, land and emergency landing
- 20 Hz RC control with input watchdog
- Slow/fast modes and acceleration
- Flips and simultaneous movement
- FFmpeg H.264 video decoding
- Photos, MP4 recording and CSV logs
- Vue HUD and controls matching the PySide app
- Safe focus-loss and shutdown behavior
- JAlcocerTech icon
- Four Go unit tests

Commands:

```sh
make run-go
make test-go
make build-go
```

The production binary already exists at: `./desktop-go/build/bin/desktop-go`

It is approximately 8.9 MB, although FFmpeg remains an external dependency.

The goal is to run either controller successfully; the PySide failure was caused by the Go controller still holding **UDP ports 8890 and 11111**. 

Stop the Go process before run-pyqt; the Go UDP timeout remains to diagnose.

```sh
nmcli device wifi connect TELLO-9BE292 ifname wlan0
```

Verify:
```sh
ip route get 192.168.10.1
```

It should report src 192.168.10.x. Then:
```sh
make run-go
```

### Face Detection vs Face Recognition

Detecting a face is not the same as recognice it!

Currently:

- Video: Tello H.264 → UDP 11111 → djitellopy → OpenCV frames.
- Face detection: OpenCV Haar Cascade, haarcascade_frontalface_default.xml.
- Face recognition: None.

Lowest-hanging upgrade:

- Detection: Replace Haar with YuNet.
- Recognition: Add SFace.
- Storage: Save enrolled face embeddings in a small SQLite database.
- Reliability: Require consistent matches across several frames; otherwise show Unknown.

So the practical stack is:

Tello → OpenCV → YuNet → SFace → SQLite → Name / Unknown

This stays local, works on CPU, integrates directly with the existing Python/OpenCV application, and avoids the infrastructure required by Frigate or Immich.