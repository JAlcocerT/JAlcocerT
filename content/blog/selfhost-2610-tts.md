---
title: "Selfhosted TTS"
date: 2026-10-16
draft: false
tags: ["Kokoro","VoiceBox","SunoAI x music"]
description: 'A homelab that speaks.'
url: 'selfhosted-tts'
---

**Tl;DR**

https://mermaid.js.org/syntax/entityRelationshipDiagram.html 

https://github.com/swingmx/swingmusic

**Intro**

* WHY Im writting this post: *bc i was surprised with [voicebox](https://fossengineer.com/voicebox-local-ai-voice-studio/), [chatterbox](https://fossengineer.com/chatterbox-local-open-source-tts/) and [kittenTTS](https://fossengineer.com/kittentts-local-cpu-tts/), but got to know simpler [local audio workflows with kokoro-82M](https://github.com/JAlcocerT/poc/blob/main/fpv-kpis/z-learnings.md) and this needs a checkpoint.
* WHAT [Ive learnt](#conclusions) with it: *Ive ended*

## T2S

You can go an use an OpenAI key:

```sh

```

Or as I got to know recently, `Kokoro TTS` surprised me locally with python to create such video with hyperframes autonomously.

https://jalcocert.github.io/JAlcocerT/blog/selfhost-2605-ollama-cloud/#local-audio

## S2T aka Transcription

This is a good addition to `margin-cms`

Imagine having the audio record capabilities and transcription from meetings directly into your notes.

> [Files.md](https://fossengineer.com/files-md-local-first-markdown-notes/) has recording capabilities via pwa

Then you can use some skills to bring the sauce to your daily summary, or just skip it.

## Selfhosted AI-Gen Audio

Earlier this year I was trying: [chatterbox](https://fossengineer.com/chatterbox-local-open-source-tts/), [qwen TTS](https://fossengineer.com/comfyui-qwen-tts/), [kitten TTS](https://fossengineer.com/kittentts-local-cpu-tts/) and [Voicebox](https://fossengineer.com/voicebox-local-ai-voice-studio/)

From all those: voicebox was the clear winner to me.



https://jalcocert.github.io/JAlcocerT/cad-design-mbsd/#rendering-on-a-mac-m2

### Selfhosted music server

Just [setup Gonic](https://fossengineer.com/selfhosting-gonic/) or Navidrome.

If you like CLIs: https://fossengineer.com/cliamp-terminal-music-player/

## AI x Music

https://jalcocert.github.io/JAlcocerT/music-with-ai-tools/#open-source-ai-tools-for-music-creation

https://jalcocert.github.io/JAlcocerT/music-with-ai-tools/#sunoai


[1](https://suno.com)
[2](https://pyseek.com/2025/04/generate-music-using-python-deep-learning/)
[3](https://github.com/ayeshabasit/AI-Music-Generator)

---

## Conclusions

A friend tried `https://pr.tn/ref/RHJ7YZE8` proton unlimited https://account.proton.me/u/3/mail/users-addresses

  1. Your friend creates a free Proton account with a Proton Mail address.
  2. You upgrade your account to Proton Duo.
  3. In Proton settings, create a family group.
  4. Go to Users and addresses → Invite user.
  5. Enter your friend’s Proton address and allocate storage.
  6. They accept the invitation and switch to your Duo plan.



### FOSS

Just [get gitlab setup](https://jalcocert.github.io/JAlcocerT/oss-automatic-docs-and-tech-video/), use skills and continuing [the F/OSS brand](https://jalcocert.github.io/JAlcocerT/a-better-fossengineer/):

```sh
#ssh jalcocert@192.168.1.2
#cat ~/.ssh/id_ed25519.pub
#ssh -T git@gitlab.com
git clone git@gitlab.com:fossengineer1/fossengineerpapermod.git
```

```md
Added Zoneless as an optional USDC payout method to this marketplace while preserving checkout and every existing payout method; start by reading https://zoneless.com/docs/agent-marketplace-quickstart.md and follow it.
```

### HomeLab Updates 1026

Coming from [the 0926 updates](https://jalcocert.github.io/JAlcocerT/selfhosting-information-flow/#homelab-updates-0926).

Ive been using [Dawarich](https://fossengineer.com/selfhosting-dawarich/) for [a while](https://jalcocert.github.io/JAlcocerT/home-lab-tools-for-iot/#homelab-updates-0826), which reminded me about a potential [synergia with wanderer](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#selfhosted-adventures)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wanderer" title="Selfhosted Wanderer - Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/dawarich" title="Dawarich Config 🐋 ↗" >}}
{{< /cards >}}

![Wanderer vs strava/komoot](/blog_img/selfh/umbrel-os/wanderer-integrations.png)


Tinkered a bit with [Technitium](https://fossengineer.com/selfhosting-technitium-dns/#technitium-vs-pi-hole-vs-adguard-home) inside [Omarchy via VM](https://jalcocert.github.io/JAlcocerT/selfhosting-information-flow/#omarchy).

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/technitium" title="Technitium | Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< callout type="warning" >}}
Mind the contamination that live data might provide to the LLMs.
{{< /callout >}}

Also, got to know about mDNS - *which can be useful to ship the automatic watering setup with the esp32 available at a `pump.local` domain*

Both the pi and x300 are working right now without local SSLs `192.168.1.18` `192.168.1.2`

Regarding **useful CLIs**: [herdr](https://fossengineer.com/herdr-terminal-agent-multiplexer/), [ncdu](https://fossengineer.com/ncdu-terminal-disk-usage-analyzer/), [lazydocker](https://fossengineer.com/lazydocker-terminal-ui-for-docker/)

```sh
herdr #code --yolo | opencode | claude 
#ncdu /

# sudo docker compose -f ./z-homelab-setup/evolution/2601_docker-compose.yml up -d qbittorrent prowlarr
sudo docker compose -f 2610_docker-compose.yml up -d termix nextcloud ncdb sftpgo forgejo forgejo-forgejo-db-1 ntfy pocketbase mailpit uptimekuma maintenant technitium jellyfin qbittorrent prowlarr dawarich_app dawarich_db #umami lunalytics littlyx
#docker port iot-dashboard-v2
#lazydocker
```

To do some clean up:

```sh
comm -23 \
    <(docker network ls --format '{{.Name}}' | sort -u) \
    <(docker ps --format '{{.Networks}}' | tr ',' '\n' | sort -u)
#docker network prune
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gonic" title="Gonic | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/jellyfin" title="Jellyfin Media Server Tools 🐋 ↗" >}}
{{< /cards >}}

```sh
winget install sonixd
```

Been also working with notifications in the homelab lately:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gotify" title="gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ntfy" title="notify | Docker Config 🐋 ↗" >}}
{{< /cards >}}

> https://github.com/Aetherinox/ntfy-desktop#linux-1 and connection with uptime kuma (mqtt too?)

Oh, and with [oss link shorteners](https://fossengineer.com/selfhosted-open-source-url-shorteners/): [snapp](https://github.com/urania-dev/snapp) was interesting, dub too feature heavy, [kutt](https://github.com/thedevs-network/kutt), shlink, yourls and [ha.mr](https://github.com/p2r3/ha.mr) whose creator has a very [interesting video about how link shorteners work](https://www.youtube.com/watch?v=TOr1Vvji6jA)

> But finding [Sink](https://github.com/miantiao-me/Sink) and [Slite](https://github.com/miantiao-me/Slite) that are a good match if you already use CF KV and D1

The video presents a novel approach to link shortening and QR code generation that eliminates the need for a database, ensuring links remain recoverable even if the service goes down. The method focuses on optimizing link encoding and compression, resulting in potentially smaller QR codes and links without ads or registration.
Key points

    Traditional link shorteners store full links in a database, raising privacy concerns and potential link loss if the service shuts down.
    The proposed "link compressor" removes redundant parts of URLs, significantly reducing their length without losing essential information.
    Encoding techniques are employed to represent common URL components with fewer bits, allowing for more efficient storage.
    The system uses a fixed dictionary for compression, optimizing the encoding of frequently used characters in URLs.
    The QR code generation process is improved by using the alphanumeric character set, resulting in smaller and more efficient QR codes compared to existing tools.
    The project is experimental and not intended as a commercial product, but it demonstrates the potential for more efficient link management.

> Once you are done, you make sure that all links in your website work with `https://github.com/linkchecker/linkchecker`

These are also useful:

```sh
#whois ebooks.jalcocertech.com| grep -i -E "(creation|created|registered)"
nslookup ebooks.jalcocertech.com
dig ebooks.jalcocertech.com

#sudo docker stop qbittorrent
#docker rm -f $(docker ps -aq --filter "name=entre")
#docker system prune --all
docker inspect forgejo --format '{{range $name, $_ := .NetworkSettings.Networks}}{{println $name}}{{end}}'
#docker network connect cloudflared_tunnel forgejo
#cd ./Home-Lab/forgejo
#make migrate-repo REPO_OWNER=JAlcocerT REPO_NAME=my-logseq-notes #makes a mirror of gh
#make sync-repo REPO_OWNER=JAlcocerT REPO_NAME=my-logseq-notes
```

[Nextcloud is working reliably](https://jalcocert.github.io/JAlcocerT/selfhosted-connectivity/#self-hosting-updates) and accesible via CF only from the countries I [configured via WAF](https://jalcocert.github.io/JAlcocerT/image-backup-tools/#cf-waf-vs-zero-trust-access).

Is good to have [opencode](https://fossengineer.com/opencode-ai-coding-agent-cli/) and [lazygit](https://fossengineer.com/lazygit-terminal-ui-git/) handy too.

```sh
#docker ps --filter "status=running"
#docker ps -a --filter "name=home-assistant"
#docker stats home-assistant
glances #htop btop
```

You can also connect to wifi via CLI, see `iwd` and https://fossengineer.com/impala-tui-wifi-manager/

Having a look to **commento** to check that there is no spam [from time to time](https://jalcocert.github.io/JAlcocerT/image-backup-tools/#server-maintainance):

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/commento" title="Commento | Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/#homelab-commands" title="HomeLab CLIs | Docs ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-dns-scripts" title="Cloudflare x Porkbun DNS API Scripts ↗" >}}
{{< /cards >}}


* https://jalcocert.github.io/JAlcocerT/selfhosted-apps-oct-2025/#traefik-x-x300-homelab
* https://fossengineer.com/selfhosting-traefik/

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/traefik" title="Traefik | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/tiny-auth" title="Tiny Auth Docker Config 🐋 ↗" >}}
{{< /cards >}}

For media: `https://selfh.st/apps/?tag=Photos`

https://github.com/paulomarques742/imago
https://imago.742studio.eu/

https://foldergram.github.io/?ref=selfh.st
> Point it at your folders, browse everything through a fast feed-style interface. No cloud, no accounts — just your files and SQLite.

https://github.com/open-noodle/gallery a fork of immich :)

> Some time back i tried immich but i didnt like that my folder order is not respected and also neither need the heavy face recognition

High performance self-hosted photo and video management solution.

https://github.com/storytold?ref=selfh.st

https://github.com/andrii-kryvoviaz/slink

---

## FAQ

```sh
#git init #gh secret list
```

https://github.com/mortennordbye/homelab

https://github.com/lfnovo/open-notebook

https://github.com/Priveetee/TypeType

`yt-distill` poc



### The Software for D&A

#### MicroControllers


#### In the server


# Project Learnings — fossengineer.com

A consolidated reference of what each batch of projects taught me, organized by category. 

The AI agent stack (May 2026 batch) is the most detailed because it's a coherent ecosystem worth understanding as a unit.

Each entry captures the **non-obvious insight** — not the feature list, the *design choice* or *honest constraint* that distinguishes the project.

---

## ⭐ The AI Agent Stack (May 2026 batch)

The biggest learning from this batch: **modern self-hosted AI tooling is splitting into five distinct layers** that don't compete, they compose. 

Most readers (and most projects' own marketing) conflate these layers. 

The honest map:

```
┌─────────────────────────────────────────────────────────────────┐
│  Orchestration layer ──── Paperclip          (the "company")    │
│                           Symphony           (vendor-flavored)  │
├─────────────────────────────────────────────────────────────────┤
│  Personal assistant ───── OpenClaw           (maximalist)       │
│  (messenger-resident)    NanoClaw           (minimalist)        │
│                           Hermes Agent       (self-improving)   │
├─────────────────────────────────────────────────────────────────┤
│  Coding agent harness ─── Pi                 (open + extensible)│
│  (terminal-resident)     Claude Code         (Anthropic)        │
│                           Codex CLI          (OpenAI)           │
│                           Cursor CLI         (Cursor)           │
├─────────────────────────────────────────────────────────────────┤
│  Coding standards ─────── Agent OS           (capture + inject) │
├─────────────────────────────────────────────────────────────────┤
│  Coding workflow ──────── OpenSpec           (propose → apply)  │
└─────────────────────────────────────────────────────────────────┘
```

**The layers don't just stack — they cross.** OpenClaw's SDK integration embeds Pi as its agent runtime, so a single message routed through OpenClaw can ultimately be processed by a Pi session in OpenClaw's container, which in turn might invoke an Agent OS standard or an OpenSpec workflow inside that session. 

The boundaries blur productively.

The right AI-first developer stack today might combine: **Hermes/OpenClaw/NanoClaw** (your messenger-resident assistant) + **Pi or Claude Code** (your terminal-resident coding agent) + **Agent OS** (your codebase's standards) + **OpenSpec** (your coding workflow) + **Paperclip or Symphony** (orchestration when you have many agents working in parallel).

Each post in this batch surfaces five "design principle" claims, not just feature bullets, because the design philosophies are what actually differentiate them.

---

### Orchestration layer

#### Paperclip — `paperclipai/paperclip` (MIT)

**Tagline:** "If OpenClaw is an _employee_, Paperclip is the _company_."

**Key insight:** Treats AI agents as **persistent organizational members** with roles, budgets, reporting lines, and audit logs — not ephemeral chat sessions. Heartbeats wake agents on a schedule; budgets are **hard stops** enforced atomically at every tick (no "you spent $50 this week" warnings — actual cancellation of queued work).

**Distinctive features:**
- Multi-company isolation in a single deployment (portfolio of autonomous AI businesses)
- 12 systems: Identity, Work, Heartbeat, Governance, Org Chart, Workspaces, Plugins, Budget, Routines, Secrets, Activity, Portability
- Adapter set: Claude Code, Codex, Cursor, OpenClaw, bash, HTTP/webhooks
- Export/import entire orgs with secret scrubbing → Clipmart roadmap

**Stack:** Node 20+ / TypeScript / React UI / PostgreSQL 17 / Better Auth. Port 3100. Auth modes: trusted loopback (default) or authenticated (LAN/Tailnet).

#### Symphony — `openai/symphony` (Apache 2.0)

**Tagline:** OpenAI's spec for "manage work, not coding agents."

**Key insight:** **The spec IS the product.** A 2,169-line RFC-2119 specification with the Elixir code as "one reference, build your own." The README explicitly endorses asking Claude/Codex to re-implement Symphony from `SPEC.md` in any language.

**Distinctive features:**
- Linear-only, Codex-only, single-tenant (deliberately narrow)
- `WORKFLOW.md` is repo-owned — the agent's policy lives in the target codebase
- No persistent database — restart recovery from tracker + filesystem
- Trust posture is implementation-defined; Elixir reference defaults to `approval_policy: never` for trusted environments

**Stack:** Elixir/OTP 1.19 / Phoenix LiveView / mise version manager.

**vs Paperclip:** Symphony is opinionated and narrow (Codex + Linear); Paperclip is configurable and broad. Same architectural slot, different design point.

---

### Assistant runtime layer

#### OpenClaw — `openclaw/openclaw` (MIT)

**Tagline:** 🦞 "EXFOLIATE! EXFOLIATE!"

**Key insight:** The **maximalist** answer to "personal AI assistant." 14,406 TS files, 134 plugins, 23+ messaging channels, native macOS/iOS/Android apps, voice (Wake + Talk Mode), Live Canvas (A2UI agent-driven UI). Sponsored by OpenAI, GitHub, NVIDIA, Vercel, Blacksmith, Convex.

**Distinctive features:**
- 23+ channels: WhatsApp, Telegram, Slack, Discord, Signal, iMessage, Matrix, plus Feishu/LINE/Mattermost/Synology/Tlon/Twitch/Zalo/WeChat/QQ/WebChat
- 30+ provider adapters (Anthropic, OpenAI, Bedrock, Vertex, DeepSeek, Cerebras, vLLM, Cloudflare AI Gateway…)
- Main vs non-main session split: main = full host access, non-main = sandbox (Docker/SSH/OpenShell)
- DM pairing as security default; `openclaw doctor` flags misconfigurations

**Operational note:** Docker compose hard-pins `OPENCLAW_*_DIR` and `HOME` to prevent macOS host paths leaking through `.env` into Linux container (issue #77436). This pattern is worth remembering across other Node + Docker projects.

#### NanoClaw — `nanocoai/nanoclaw` (MIT)

**Tagline:** Personal Claude assistant. Lightweight, secure, customizable.

**Key insight:** The **minimalist** answer to the same problem. Small codebase you can audit (one process, handful of files), per-session Docker containers by default, no config files — customization via code edits. The bet: "small enough that Claude Code can safely modify it" beats "large enough that no human can audit it."

**Distinctive features:**
- Per-session two-SQLite-DB design (inbound.db + outbound.db, host vs container as single writers, even/odd seq parity)
- Two-runtime split: Node + pnpm on host (supply-chain controls via `minimumReleaseAge: 4320`), Bun in the container (fast cold-start, native SQLite)
- Credentials via OneCLI Agent Vault — never enter the container
- Channels and providers install via `/add-<channel>` skills that `git fetch` from sibling branches into your fork

**Honest constraint:** Per-fork rebuilt image — no `nanoclaw/nanoclaw:latest` to pull because every fork has different installed skills/MCPs/packages.

#### Hermes Agent — `NousResearch/hermes-agent` (MIT)

**Tagline:** The self-improving AI agent.

**Key insight:** The defining feature is the **closed learning loop** — agent-curated memory, autonomous skill creation after complex tasks, skills self-improving during use, FTS5 cross-session search with LLM summarization, Honcho dialectic user modeling. The agent gets better at being *your* agent over time, not just generically smarter when the underlying model upgrades.

**Distinctive features:**
- 22 messaging platforms (incl. LINE, SimpleX, Microsoft Teams via Graph foundation)
- **7 terminal backends** including Modal and Daytona for **serverless hibernate-on-idle** — 24/7 agent costing cents/month at rest
- `hermes proxy` — OpenAI-compatible local proxy for OAuth providers (Claude Pro, ChatGPT Pro, SuperGrok) → Codex/Aider/Cline can use your subscription
- First-class `hermes claw migrate` from OpenClaw — auto-detected during setup
- `pip install hermes-agent` (new in v0.14.0)

**Supply-chain hardening** (worth flagging across all Python projects): every direct dependency exact-pinned (no `>=` ranges), explicitly because of the Mini Shai-Hulud worm hitting `mistralai 2.4.6` on PyPI in May 2026. v0.14.0 adds an advisory checker that scans on every install.

---

### Coding agent harness layer

#### Pi — `earendil-works/pi` (MIT)

**Tagline:** "Adapt pi to your workflows, not the other way around."

**Key insight:** Same architectural slot as Claude Code / Codex CLI / Cursor CLI — terminal-resident coding agent — but **MIT, aggressively extensible, and SDK-embeddable**. Six explicit non-features in the README (no MCP, no sub-agents, no plan mode, no permission popups, no built-in to-dos, no background bash) — each rejected with a stated rationale and a "build it with an extension if you want it" pointer.

**Distinctive features:**
- 5-package monorepo: `pi-coding-agent` (CLI) + `pi-agent-core` (runtime) + `pi-ai` (provider API) + `pi-tui` (terminal UI) + `pi-web-ui` (web components)
- Four operating modes: interactive (TUI), print/JSON (one-shot), RPC (stdin/stdout JSONL with strict LF framing), SDK (embed in your app)
- 30+ providers including OAuth subscription auth (Claude Pro, ChatGPT Plus, GitHub Copilot)
- Cross-provider handoffs mid-session (Claude → GPT mid-conversation with context preserved)
- Sessions as trees — `/tree`, `/fork`, `/clone` for branching
- TypeScript extensions API with full surface area (register tools, commands, keybindings, UI components, even replace built-in tools)
- Pi packages: `pi install npm:@foo/pi-tools` or `pi install git:github.com/user/repo`
- Public OSS session sharing via `pi-share-hf` → Hugging Face datasets (research-friendly stance)

**The OpenClaw connection — the layer cross-reference:** OpenClaw's SDK integration uses `pi-coding-agent`'s SDK as its agent backend. When OpenClaw answers a Slack message and generates code, that code is being produced by a Pi session running inside OpenClaw's per-agent container. Pi is both a standalone CLI and a library that personal-assistant projects can embed.

**Honest design contrast:** Where OpenClaw is maximalist (134 plugins, voice, Canvas, native apps) on the *personal assistant* axis, Pi is minimalist on the *coding agent* axis. Same author-philosophy split visible in NanoClaw vs OpenClaw at the personal-assistant layer — there's a consistent "minimal core + extensions" pattern across the open-source AI tooling ecosystem in 2026.

**Author:** Mario Zechner (`@badlogicgames`). Domain `pi.dev` donated by `exe.dev`. Auto-close on new-contributor issues/PRs as a deliberate scope-control mechanism (maintainers review daily).

---

### Coding augmenter layer

#### Agent OS — `buildermethods/agent-os` (MIT)

**Tagline:** "Agents that build the way you would."

**Key insight:** **Retreated to its strongest niche in v3.** Brian Casel explicitly dropped spec writing, task breakdown, and implementation orchestration in v3 (January 2026) because Claude Code's Plan Mode + extended thinking now do those better. What remains: standards capture/injection, the part AI tools don't do well on their own.

**Distinctive features:**
- `/discover-standards` reads your codebase and surfaces patterns into versioned `.md` files
- `/inject-standards` picks relevant standards from `index.yml` per context (Plan Mode / Skill / conversation)
- Profile inheritance (`config.yml`) for cross-project reuse
- Pure bash + markdown — no runtime, no daemon, no API keys

**v3 install gotchas (fixed):** `((var++))` under `set -e` failed silently on some shells (PR #328); `tac` is GNU-only, not on macOS without coreutils (PR #327).

#### OpenSpec — `Fission-AI/OpenSpec` (MIT)

**Tagline:** "AI-native system for spec-driven development."

**Key insight:** **29 AI tools supported out of the box** is the unusual feat. OpenSpec auto-installs the correct adapter files for each tool's specific convention (`.claude/`, `.cursor/`, `.codex/`, `.github/`, `.gemini/`, `.windsurf/`, …) — the bet is that you'll switch between 2-3 AI tools depending on the task, and the workflow needs to be consistent across all of them.

**Distinctive features:**
- `/opsx:propose` → `/opsx:apply` → `/opsx:archive` workflow
- Brownfield-first delta model: `openspec/specs/` is the truth, `openspec/changes/` are proposals that merge in on archive
- "Fluid not rigid" — no phase gates; create artifacts in any order
- Core profile (5 commands) or expanded (11) via `openspec config profile`

**vs Agent OS:** OpenSpec captures *changes*; Agent OS captures *standards*. Both are pure-markdown + small CLI, both MIT, both install into your project — they're complementary, not competing.

**vs alternatives:** Spec Kit (GitHub) is more thorough but rigid + Python; Kiro (AWS) is polished but IDE-locked + Claude-only; OpenSpec aims at the everyday case.

---

### Cross-cutting patterns in the AI batch

**Polite-but-clear positioning via migration tooling.** Hermes ships `hermes claw migrate` that auto-detects `~/.openclaw` and imports settings/memories/skills/keys. That's not casual — it's saying "if OpenClaw isn't working for you, here's the door." This is a useful pattern when entering a category with an incumbent.

**Single-process vs micro-service.** NanoClaw is one Node host + Bun container per session, **no IPC**, all communication through SQLite files. OpenClaw is one Gateway daemon + plugin loader for 134 plugins. Paperclip is one server + Postgres. Symphony is one orchestrator + Codex subprocesses. **None of them are micro-service architectures** — the modern self-hosted agent platform is almost always a single process plus per-session/per-task isolation.

**Supply-chain hardening is becoming a default.** Hermes exact-pins every dep + advisory checker. NanoClaw has `minimumReleaseAge: 4320` (pnpm 3-day quarantine). Symphony's `WORKFLOW.md` includes `shell_environment_policy.inherit=all` as a deliberate trust posture. The Mini Shai-Hulud worm hitting `mistralai 2.4.6` on PyPI is now a frequent reference point in pyproject comments.

**MIT dominates.** Of the seven AI projects: 6× MIT, 1× Apache 2.0 (Symphony). No AGPL, no Fossorial Commercial-style dual licensing. The license norm for AI agent tooling appears to be permissive-default.

**Slash-command markdown is the lingua franca.** Agent OS, OpenSpec, NanoClaw, OpenClaw, and Hermes all ship markdown-based slash commands as their primary user interface. Cursor / Claude Code / Codex / 29 tools all read this convention. Markdown-as-prompt-template is the de facto AI-tool integration protocol.

**"Heartbeat" over "chat session" is the orchestration pattern.** Paperclip, Symphony, and Hermes scheduling all use periodic ticks rather than continuous chat. The agent wakes, checks work, acts, sleeps. This makes budgeting, cost control, and "what is the agent doing right now?" tractable.

**"Minimal core + extension API" is a convergent design.** NanoClaw deliberately ships a tiny core with channels installed via `/add-<channel>` skills. Pi deliberately ships a minimal core with six explicit non-features and a TypeScript extension API. Both projects' authors explicitly state the rationale: a small core you can read + a powerful extension surface beats a maximalist core that fights every user's preference. The pattern shows up independently at the personal-assistant layer (NanoClaw vs OpenClaw) and the coding-agent layer (Pi vs Claude Code) — likely an emerging consensus design for open-source AI tooling.

**Open-source vs vendor split is starkest at the coding-agent layer.** Pi is the only MIT-licensed option in the "terminal-resident coding agent" category — Claude Code (Anthropic), Codex CLI (OpenAI), and Cursor CLI (Cursor) are all vendor products. At the personal-assistant layer (OpenClaw / NanoClaw / Hermes) and the orchestration layer (Paperclip / Symphony), open source is the norm. The vendor lock-in pattern concentrates around the agent that actually writes the code.

**Layers cross via SDK embedding.** OpenClaw uses Pi's SDK as its agent runtime — so a Slack message routed through OpenClaw is ultimately processed by a Pi session in OpenClaw's container, which might invoke an Agent OS standard or an OpenSpec workflow inside that session. The five-layer stack isn't strictly hierarchical; it's a graph where SDK-embeddable projects (Pi, Honcho, OneCLI) become primitives that higher-layer projects compose.

**Two patterns at the vertical-application layer: open research vs vendor content.** TradingAgents (finance, UCLA) and Claude for Financial Services (finance, Anthropic) ship the same week, both Apache 2.0, both target FSI — and they're opposite in nearly every design dimension. TradingAgents is an *open research framework* (Python + LangGraph, 15+ LLM providers, runs anywhere, makes trading decisions). Claude for FS is *vendor reference content* (markdown + JSON, Claude-only, runs on Anthropic platforms, drafts work product for human sign-off, never decides). This **isn't a competitive overlap — they're at different layers of the same vertical**. The pattern is likely to repeat: every domain will see both an open research framework (MedAgents, LegalAgents) and vendor-provided reference content (Claude for Legal, Claude for Healthcare) emerge in parallel. The contrasts to flag when comparing them: who authored (academia vs vendor), decision authority (makes decisions vs drafts for review), provider lock-in (multi-provider vs single-provider), data sources (free APIs vs commercial MCP subscriptions), and self-host shape (Python on your machine vs vendor-hosted runtime).

---

---

## Vertical applications

This is the **layer above** the AI infrastructure stack — what all the infrastructure is actually *for*. Two distinct shapes here, both Apache 2.0, both shipped May 2026, both target financial services. They illustrate the open-research-vs-vendor-content pattern that's emerging across every AI vertical.

### TradingAgents — `TauricResearch/TradingAgents` (Apache 2.0)

**Tagline:** Multi-agent LLM financial trading framework.

**Key insight:** Open academic research framework that models a trading firm — analysts (fundamentals/sentiment/news/technical) → researcher debate (bullish vs bearish) → trader → risk team → portfolio manager — using LangGraph for orchestration. Makes trading decisions in a simulated exchange. Decision log persists across runs with realised-return + reflection feedback loop.

**Distinctive features:**
- 15+ LLM providers with dual-region China endpoints (`qwen` vs `qwen-cn`, `glm` vs `glm-cn`, `minimax` vs `minimax-cn`)
- Two-tier model config (`deep_think_llm` for reasoning, `quick_think_llm` for data fetch) — cost-management knob
- Closed feedback loop via `~/.tradingagents/memory/trading_memory.md` — each run fetches realised return + alpha vs SPY, generates reflection, injects past lessons into next Portfolio Manager prompt
- LangGraph checkpoint resume for long debate runs
- Backtrader integration
- Apache 2.0 with citable arXiv paper (2412.20138)

**Stack:** Python 3.10+, LangChain + LangGraph, Docker compose with optional Ollama profile for fully-local runs.

### Claude for Financial Services — `anthropics/financial-services` (Apache 2.0)

**Tagline:** Reference agents, skills, and data connectors for FSI workflows.

**Key insight:** Vendor-provided reference content for Claude in financial services. 10 named agents (Pitch / Meeting Prep / Market Researcher / Earnings Reviewer / Model Builder / Valuation Reviewer / GL Reconciler / Month-End Closer / Statement Auditor / KYC Screener) shipped as Cowork plugins AND Managed Agents cookbooks from the same source. **Drafts work product for human sign-off — explicitly does not make decisions.**

**Distinctive features:**
- Two deployment paths from one source — Cowork plugin (interactive) AND Managed Agents API (headless) reference the same prompt + skill files
- 6 vertical skill bundles (IB / equity research / PE / wealth / fund admin / operations) + 2 partner-built (LSEG, S&P Global)
- 11 commercial MCP data connectors (Daloopa, Morningstar, FactSet, Moody's, PitchBook, LSEG, S&P Global, MT Newswires, Aiera, Chronograph, Egnyte) — largest commercial MCP integration set in any open repo
- Pure markdown + JSON — no build step, no Node toolchain
- Skill drift detection via `check.py` (fails if agent-plugin skill copies diverge from vertical-plugin sources)
- Pre-commit version-bump hook (`.githooks` via `git config core.hooksPath`, no Husky)
- Microsoft 365 add-in install tooling for self-hosted routing (Vertex / Bedrock / internal LLM gateway)

**Stack:** No runtime stack — it's reference content. Runs on Anthropic's platforms (Cowork, Managed Agents API) or Claude Code.

### The contrast (worth memorizing for future vertical-content reviews)

| Axis | TradingAgents | Claude for FS |
|------|---------------|---------------|
| **Author** | UCLA research group | Anthropic (model vendor) |
| **Purpose** | Research framework | Enterprise enablement |
| **Output authority** | Makes decisions (simulated) | Drafts for human sign-off |
| **LLM provider lock-in** | None (15+ providers) | Claude only |
| **Architecture** | Python + LangGraph | Markdown + JSON, no code |
| **Self-host runtime** | Yes (Docker / Ollama) | Partial (only MSFT 365 routing) |
| **Data sources** | Free APIs + scraping | Commercial MCP subscriptions |
| **Cost shape** | LLM API only (~$0.20-$2/run) | Cowork + Anthropic API + each MCP subscription |
| **Audience** | Researcher / quant developer | FSI firm with paid Anthropic + data subscriptions |

The pattern this represents — **open research framework + vendor content shipping in parallel** — will repeat across legal (LegalAgents vs Claude for Legal), healthcare (MedAgents vs Claude for Healthcare), engineering, etc. When analyzing future projects in those domains, the question to ask is *which kind* it is, not whether it's "better" — they coexist at different layers.

---

## Media & Library

### MediaLyze — `frederikemmer/MediaLyze` (MIT)

**Key insight:** **Read-only by design** — mount media `:ro`, never modifies/renames/transcodes. Complement to Plex/Jellyfin (not replacement), opposite of Tdarr (no write path at all).

**Stack:** Python 3.12 / FastAPI / SQLAlchemy / SQLite + Sidekiq / Redis + PostgreSQL + PostGIS. Frontend: React 19 + Vite + ECharts. Image: `ghcr.io/frederikemmer/medialyze:latest`, port 8080.

**Cool feature:** Same FastAPI+React stack runs as both containerized server *and* native Electron desktop app (`.exe`, `.dmg`, `AppImage`). Unusual — most projects pick one.

**Operational note:** Change detection uses path+size+mtime triple — incremental scans on 10TB libraries take seconds, not hours.

### SnapOtter — `snapotter-hq/snapotter` (AGPL-3.0 + Commercial)

**Key insight:** Single container, SQLite-only image-manipulation suite with local AI (background removal, upscaling, OCR, photo restoration, colorization). 51 tools + Pipelines feature lets you chain tools into reusable workflows.

**Stack:** TypeScript/Fastify backend + Python 3.12 AI venv (rembg, ONNX, PyTorch). Port 1349. **`shm_size: 2gb` is mandatory for GPU compose** (PyTorch CUDA shared memory) — easy to strip on copy-paste, breaks GPU silently.

**Mirror detection learning:** `stirling-image/stirling-image` and `ashim-hq/ashim` are identical mirrors with same commit hash `6e103d3`. Same `package.json.name`, same homepage. Fingerprint check now codified in `z-agent-learnings.md` and in the foss-post skill's style guide.

---

## Self-Hosting Infrastructure

### Nextcloud — `nextcloud/server` (AGPL-3.0-or-later)

**Key insight:** The flagship full-platform Google Workspace replacement. PHP 8.2+ backend, Vue 3 frontend, 28 bundled apps + 300+ in the App Store. v34, MariaDB recommended, Redis required for HA.

**Cool feature:** Nextcloud AIO (All-In-One) image manages MariaDB+Redis+Collabora+Talk through a single management interface — the recommended production path.

**FAQ patterns that worked well:** Nextcloud vs rsync (platform vs file-transfer primitive), Nextcloud vs BorgBackup (live access vs disaster recovery — complement each other with append-only Borg for ransomware resilience).

### Pangolin — `fosrl/pangolin` (AGPL-3 + Fossorial Commercial)

**Key insight:** Cloudflare Tunnel + Tailscale in one self-hosted platform. Three-container stack: `pangolin` (Next.js control plane) + `gerbil` (WireGuard data plane, needs `CAP_NET_ADMIN` + `SYS_MODULE`) + `traefik` v3.6 (sharing gerbil's network namespace via `network_mode: service:gerbil`).

**Compose gotcha worth preserving:** Ports `80`/`443` are declared on the `gerbil` service in the compose, not on `traefik` — because Traefik shares gerbil's network namespace. Not a typo, the design.

**Workaround:** Rootless Podman / locked-down Kubernetes can't grant `SYS_MODULE`. Load WireGuard kernel module on the host first (`modprobe wireguard`), then `SYS_MODULE` can be dropped from the compose.

### Technitium DNS — `TechnitiumSoftware/DnsServer` (GPL v3)

> https://jalcocert.github.io/JAlcocerT/selfhosting-information-flow/#homelab-updates-0926

> > https://jalcocert.github.io/JAlcocerT/private-dns-with-docker/ 

**Key insight:** Full authoritative + recursive DNS server (vs Pi-hole's "blocking layer bolted onto a DNS resolver"). C#/.NET 10, DoT/DoH/DoQ both client and server side, DNSSEC signing of your own zones, native clustering, SSO via OIDC, 27+ DNS Apps plugins, built-in DHCP.

**Pi-hole comparison FAQ pattern:** Position "what's actually different" with 6 concrete capabilities (authoritative zones, DNSSEC signing, serve encrypted DNS to clients, native clustering, plugin API, SSO/RBAC) and an honest assessment of where Pi-hole still wins (community size, simplicity, ecosystem).

### Tinyauth — `tinyauthapp/tinyauth` (GPL-3.0)

**Key insight:** Forward-auth middleware for Traefik / Nginx (`auth_request`) / Caddy (`forward_auth`) in one Go binary + SQLite. Built-in users + OAuth (Google, GitHub, Microsoft, Tailscale, generic OIDC) + LDAP + TOTP 2FA. The lean alternative to Authelia / Authentik.

**Pattern preserved:** `TINYAUTH_AUTH_USERS=user:$$2a$$10$$...` requires `$$` escaping for literal `$` in compose env values.

**Three forward-auth endpoints:** `/api/auth/traefik`, `/api/auth/nginx`, `/api/auth/caddy` — each formatted for the specific proxy's expected response shape.

---

## Privacy & Communications

### SimpleX Chat — `simplex-chat/simplex-chat` (AGPL-3.0)

**Key insight:** **No user identifier of any kind** — no phone number, no username, no public key, no UUID. Routes messages through per-contact unidirectional queues with rotating addresses. Servers can't even tell who's talking to whom, let alone read content.

**Crypto stack:** X3DH + Double Ratchet (Signal-equivalent) + PQXDH/Kyber-1024 (post-quantum) + AES-256-GCM + NaCl secretbox (second encryption layer on relay transport) + TLS 1.3. Two Trail of Bits audits (2022 implementation, 2024 protocol design).

**Self-host pattern:** SMP server (`simplexchat/smp-server:latest`) on port 5223 + Caddy for auto-TLS Let's Encrypt. Optional Tor onion address via standard `HiddenServicePort` config. Per-contact server migration via "Change receiving address" in each contact.

---

## Location & Tracking

### Dawarich — `Freika/dawarich` (AGPL-3.0)

**Key insight:** Self-hosted Google Timeline replacement (Google killed Timeline as a cloud feature in 2024). Rails 8 + PostgreSQL 17 + **PostGIS 3.5** + Sidekiq + Redis. Four-container stack.

**Critical setup details:**
- ARM hosts need `imresamu/postgis:17-3.5-alpine` instead of `postgis/postgis` (amd64-only)
- `SELF_HOSTED=true` env var bypasses the two-tier plan system (Lite/Pro) — without it, your self-hosted instance silently behaves like the Cloud free tier with 12-month data window
- Cloud product is dual-tier; self-hosted should always set the bypass

**Strong project warning preserved:** "DO NOT UPDATE AUTOMATICALLY" — under active development with breaking migrations. Watchtower-style auto-updaters explicitly discouraged.

**Import sources:** Google Takeout, OwnTracks, Strava, Immich, GPX, GeoJSON, photo EXIF. Tracker apps: Dawarich iOS/Android, OwnTracks, Overland, GPSLogger, Home Assistant.

---

## Earlier batch (pre-May 2026, for completeness)

Already shipped wiki+post pairs: **atria, blender, conar, corecontrol, forgejo, freecad, homeassistant, nutify, onionshare, openscad, pequeroku, teable, velomate, velxio, vito**.

These are individually in `Z_Codex_Posts/`. Cross-cutting learnings from that batch:
- Non-Docker tools (Blender, FreeCAD, OpenSCAD, OnionShare) need an alternative framing — headless CLI, batch processing, Docker-wrap of binary, CI/CD relevance
- selfh.st newsletter scraping requires authenticated browser save (Ghost CMS paywall blocks unauthenticated curl)
- Project discovery now goes through `v5.py` (star-sorted) instead of just `v4.py` (grouped by section)

---

## Process Learnings (Skill / Workflow Improvements)

**Three durable patterns codified in this batch:**

1. **Mirror / re-brand fingerprint check before generation.** Three repos (`stirling-image/stirling-image`, `ashim-hq/ashim`, plus the original `snapotter-hq/snapotter`) shipped identical SnapOtter code at the same commit hash. The fingerprint check (`head -10 package.json` + `git log --oneline -3`) takes ~5 seconds and prevents redundant artifacts. Codified in `z-agent-learnings.md` and the foss-post skill's `post-style-guide.md`.

2. **Honesty about validation.** The Claude Code shell runs inside a Flatpak sandbox with no Docker access. Compose blocks ship written-from-source, not boot-tested. The skill style guide now explicitly says: never imply the compose was tested, hand back a copy-paste recipe instead, flag risky deltas (`shm_size`, `cap_add`, `network_mode`, `SELF_HOSTED=true`) so users don't strip them.

3. **Wrong-flag correction loop.** I flagged NanoClaw as "suspicious stars" because I conflated "OpenClaw" (the Claude-assistant framework it references) with the 1997 Captain Claw game re-implementation. Cost ~5 minutes of investigation; recovered cleanly by cloning and reading the actual README. Lesson: if a description doesn't track, **clone and inspect** rather than relying on description alone. Don't anchor on the first interpretation.

---

## License Distribution Across All Shipped Posts (May 2026 batch)

| License | Count | Projects |
|---------|------:|----------|
| MIT | 11 | NanoClaw, OpenClaw, Hermes, Paperclip, Agent OS, OpenSpec, MediaLyze, Pi, **Transmute**, **TapMap**, ConvertX-ish |
| AGPL-3.0 | 4 | Nextcloud, SimpleX Chat, Dawarich, **TREK** |
| Apache 2.0 | 3 | Symphony, **TradingAgents**, **Claude for FS** |
| GPL-3.0 | 2 | Technitium DNS (GPLv3), Tinyauth |
| AGPL + Commercial dual | 2 | SnapOtter, Pangolin |

**Pattern:** Permissive (MIT/Apache) dominates AI tooling; copyleft (AGPL/GPL) dominates traditional self-hosted infrastructure. Dual-license (AGPL + Commercial) appears in newer SaaS-parallel projects (SnapOtter, Pangolin) where the maintainers want a path to fund development.
