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
