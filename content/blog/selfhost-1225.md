---
title: "SelfHosting is easy with PaaS"
date: 2025-12-17T19:20:21+01:00
draft: false
tags: ["HomeLab ebook","Excalidraw","1toN ebooks","Omarchy OS"]
description: 'Selfhosting with your HomeLab and PaaS.'
url: 'selfhosted-apps-december-2025'
---


**Tl;DR**

A random server for ~4$/month is all you need.

* https://one.one.one.one/

There was another attack to npm affecting Posthog!

And...one for REACT.

Which is why i added this security faq for a refresh.

**Intro**

I tend to get inspired with this kind of [vm and containers that im running](https://blog.networkprofile.org/vms-and-containers-i-am-running-2023/) posts.

As I played with PaaS, wanted to proove how easy and quick is to set them into a VPS for ~4$/month.

> If you need a NAS, you can check HexOS

> > But as is paid, consider

* https://fleet.linuxserver.io/

## Excalidraw x Notes x SSGs

Im a big fan of Excalidraw for D&A, specially architectural diagrams.

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/career/" title="Career | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/diagrams_ppts/" title="Diagrams and PPTs | Docs ↗" >}}
{{< /cards >}}

For those times when you dont want to use MermaidKS, but just to make a quick drawing.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/excalidraw" title="Selfhosted Excalidraw - Docker Config 🐋 ↗" >}}
{{< /cards >}}

https://www.youtube.com/watch?v=P_Q6avJGoWI


https://blog.excalidraw.com/

We all need to tell data stories sometimes: https://blog.excalidraw.com/tell-your-story-with-charts/ 

Even before jumping to a Streamlit PoC, you can mockup very quickly via Excalidraw, like: https://excalidraw.com/#json=6443031091740672,amxJZJxlZAlUBLADWIukFg

Once everyone is onboard, we can continue and end up with some cool [PBi](https://jalcocert.github.io/JAlcocerT/about-powerbi/) or a [GCP Looker](https://jalcocert.github.io/JAlcocerT/understanding-google-cloud-platform/#what-it-is-looker-modelling-language) Dashboard.

Venn diagrams for data modelling and architecture are also appreciated

What's also great? 

That Excalidraw can interprete MermaidJS Syntax an render also the diagrams :)

Oh...and also excel tables are rendered into cool graphs.

![Excalidraw is fantastic](/blog_img/selfh/HomeLab/excalidraw.png)

> Yea, thats this [DevOps diagram](https://jalcocert.github.io/JAlcocerT/dev-ops-for-non-devops/)

That's a great question, as Excalidraw is very popular in the open-source and PKM (Personal Knowledge Management) communities!

Yes, there are several excellent **open-source note-taking tools** and even a few ways to incorporate Excalidraw into an **SSG (Static Site Generator)**.

#### 📝 Open Source Note-Taking Tools

Here are a few prominent open-source note-taking applications that support Excalidraw:

| Tool | Type | Excalidraw Support | Notes |
| :--- | :--- | :--- | :--- |
| **Obsidian** | Desktop/Mobile Note App (Free, not fully open-source, but local-first) | **Community Plugin** (Obsidian Excalidraw Plugin) | The most popular option. The plugin is open-source and integrates Excalidraw seamlessly, allowing you to embed Excalidraw drawings in your notes and link between them. |
| **Logseq** | Desktop/Web/Mobile Outliner & PKM (Open Source) | **Built-in Support** | Logseq is an open-source outliner that uses local Markdown files and has excellent native support for Excalidraw diagrams as a block type. |
| **Trilium Notes** | Self-Hosted Knowledge Base (Open Source) | **Native Canvas** | Trilium has a built-in *Canvas* feature that uses the same underlying technology as Excalidraw, making it ideal for diagrams and visual planning within your knowledge base. |
| **Standard Notes**| Encrypted Note App (Open Source) | **Built-in Plugin/Editor** | Standard Notes offers an Excalidraw editor as a built-in plugin/extension. |

> **Note on Excalidraw Itself:** **Excalidraw** is *entirely open-source* and you can self-host the editor itself if you just need a drawing tool. Many tools integrate the open-source Excalidraw npm package.

---

#### 💻 SSG (Static Site Generator) Support

Direct, built-in support in major SSGs is less common, but you can usually achieve it by converting the Excalidraw file data (which is JSON) into a renderable format like SVG or PNG during the build process.

* **Obsidian-based SSGs:** Since Obsidian has such good Excalidraw integration, SSGs designed to publish Obsidian vaults often handle Excalidraw files:
    * **[Quartz](https://github.com/jackyzha0/quartz):** An open-source, fast SSG built for Obsidian. It has mechanisms to handle various Obsidian-specific elements, and often community plugins or configurations exist to ensure Excalidraw diagrams are correctly rendered when building the static site.
    * **Obsidian Garden / Digital Garden SSGs:** Many small, open-source SSGs built specifically for "Digital Gardens" (sites published from Obsidian/Markdown notes) will have community-contributed support for the Obsidian Excalidraw plugin's output.

* **General SSGs:** For general SSGs like **Hugo**, **Jekyll**, or **Next.js**, the approach is typically:
    1.  Save your Excalidraw file (`.excalidraw`).
    2.  Use a **script or build step** (often involving the Excalidraw CLI) to convert the `.excalidraw` JSON into a static **SVG** or **PNG** file.
    3.  Embed the resulting SVG/PNG image in your Markdown note, which the SSG then publishes.

---

## Conclusion

Probably having a **VPS** as compute backup is not a bad idea.

Neither is to review these selfhosting CLIs and monitoring tools.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/#homelab-commands" title="HomeLab CLIs | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/monitoring/" title="Monitoring | Docs ↗" icon="book-open" >}}
{{< /cards >}}

And **[hetzner](https://accounts.hetzner.com/login)** has been leveling up their game: https://docs.hetzner.com/

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-hetzner-vps-setup" title="Hetzner VPS Setup | Script ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/where-to-deploy/" title="To Which VPS deploy | Post ↗" >}}
{{< /cards >}}

> [CX23](https://www.hetzner.com/cloud/) > CX22 in performance?

> > Pay only for the hours you use, if you have a server for less than a month. No minimum contract period required!

Keeping NS outside cloudflare and using the NGINX setup, instead of the Traefik one.



### Random

2 years ago I put together couple of words with thoughts and snapshots that the world never got to see.

Now I have 3 ebooks ready to be consumed, while the world ends *one more time*

https://x.com/shanaka86/status/1990231121976811961?s=20


I started another ebook: because everything has potential failures

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/1toN-ebooks" title="NEW - 1 WebApp to n eBooks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code a Web App to serve md content via web/book and also downlodable as PDFs" >}}
{{< /cards >}}

Expect ,n' to be:

1. Webpage creator: Because you can own your brand - DIY ofc
2. Homelabs/Servers
3. IoT

#### Outages x Status x PlansB


Not only [AWS](https://health.aws.amazon.com/health/status) will have outages.

But also [cloudflare](https://www.cloudflarestatus.com/)...and [Github](https://www.githubstatus.com/)

Its curious that even X ressited the AWS outage, but not the CF one.

![alt text](/blog_img/outro/x-cf-down.png)


![Cloudflare outage due to...sql aparently](/blog_img/outro/cf-down.png)


So that makes me think on the reliability of the wedding setup with R2.

And im glad I tried the captcha via CapJS here.

> Cloudflare Turnstile is a user-friendly, privacy-focused alternative to CAPTCHA for protecting websites from bots and automated abuse.

If you have a NAT and use Cloudflare tunnels, maybe is time to try Pangolin as a Plan B.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/pangolin/" title="Pangolin | Docker Config 🐋 ↗" >}}
{{< /cards >}}



[ngrok](https://www.reddit.com/r/selfhosted/comments/10n1h0p/cloudflare_tunnel_alternative/), [Pangolin](https://www.youtube.com/watch?v=a-a-Xk1hXBQ),...

3. [NetGoat](https://github.com/netgoat-xyz/netgoat)


See also zoraxy or Pangolin

https://github.com/tobychui/zoraxy
https://github.com/tobychui/zoraxy?tab=AGPL-3.0-1-ov-file#readme

General purpose (reverse) proxy and forwarding tool for networking noobs. Now written in Go!

#### Airpods vs Sony

The **Sony- WF-1000XM3** and linux.

https://www.youtube.com/watch?v=m_Mr4bw8Pow

* https://github.com/kavishdevar/librepods

> GPL 3.0 |  AirPods liberated from Apple's ecosystem. 

https://frantzroulet.com/blog/jekyll/update/2021/02/26/how_to_use_sony_wf-1000xm3_on_ubuntu_20.04_with_i3wm.html

https://askubuntu.com/questions/1269083/ubuntu-20-04-bluetooth-true-wireless-headphones-not-working-work-in-previous-v

https://askubuntu.com/questions/1139404/sony-noise-cancelling-headphones-wh-1000xm2-3-and-bluetooth-initial-autoconnec

The **airpods pro** worked out of the box though...

![Airpods connected to bluetooth to Linux](/blog_img/hardware/airpods-linux.png)


If you just made your HomeLab, consider any of these media tools: pairdrop or nextcloud

![Pairdrop UI](/blog_img/selfh/media/pairdrop-ui.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/pairdrop/" title="Pairdrop | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/nextcloud/" title="Nextcloud | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Omarchy

I was [testing OS's](https://jalcocert.github.io/JAlcocerT/os-for-nas/) some time back.

And SteamOS recently [here](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#thoughts-on-steamos-and-os-for-nas) :)

When you think nothing can surprise you...

You get to know a new Arch based OS:

* https://omarchy.org/

That is done by...a [racing driver](https://www.youtube.com/watch?v=iNQl0x6WS3M)?

And that [same person](https://dhh.dk/) is the creator of [ruby](https://jalcocert.github.io/JAlcocerT/raspberrypi-starting-guide/) *on rails* web app framework!

What?!  

![GNOME Boxes to spin VMs](/blog_img/selfh/omarchy/gnome-boxes.png)

![alt text](/blog_img/selfh/omarchy/omarchy-memtest.png)

I downloaded the `omarchy-3.2.0.iso` of the OS and tried it via VM. 

![alt text](/blog_img/selfh/omarchy/omarchy-setup.png)

It took ~5min to complete the install.

![alt text](/blog_img/selfh/omarchy/omarchy-ui.png)

![Omarchy OS](/blog_img/selfh/omarchy/omarchy-desktop.png)

### Gaming and Linux

I got to know about [another OS](https://jalcocert.github.io/JAlcocerT/os-for-nas/) for linux gaming: https://bazzite.gg/

It seems that W11 is going all in with AI and at the same time gaming performance is going down the drain.

I guess is not too late to [use a VM via Gnome Boxes](https://jalcocert.github.io/JAlcocerT/testing-nix-os/) to test [any OS](https://jalcocert.github.io/JAlcocerT/os-for-nas/)

Virtualization made simple: https://flathub.org/apps/org.gnome.Boxes

```sh
flatpak install flathub org.gnome.Boxes
```

https://jalcocert.github.io/JAlcocerT/selfhosted-apps-nov-2025/#thoughts-on-steamos-and-os-for-nas

![download steam os](/blog_img/outro/steamos.png)

For a **general OS purposes**, as of today I would:

- Use [Lubuntu](https://ubuntu.com/lubuntu/releases/noble/release/) - As it requires just ~700mb of RAM
- Try [ZorinOS](https://zorin.com/os/download) if you are a regular user with good enough hardware but cant run W11

{{< youtube "hTw9DBEksx4" >}}

### Selfh 2025 Results

People seem to be loving Immich and Nextcloud!

* https://selfh.st/survey/2025-results/

Who could have guessed, that donations are low: https://ko-fi.com/jalcocertech

> Intelligence is the ability to adapt to change

If you enjoy my homelab repo, see also:
```sh
#git clone https://github.com/JAlcocerT/Home-Lab
git clone https://github.com/atareao/self-hosted.git atareao
```

---

## FAQ

https://bobpony.com/downloads/


* https://github.com/Abdenasser/neohtop

> MIT |  💪🏻 Blazing-fast system monitoring for your desktop (built with Rust, Tauri & Svelte) 

```sh
#https://github.com/Abdenasser/neohtop/releases/download/v1.2.0/NeoHtop_1.2.0_x86_64.AppImage
#neohtop
```

But as of now, It was not a smooth setup, so its not going to the monitoring docs.

### How to run Windows Apps in Android

If what you are looking for is a way to run Windows Apps in new ways, you could also check:

* {{< newtab url="https://github.com/brunodev85/winlator" text="The winlator Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/brunodev85/winlator?tab=MIT-1-ov-file#readme" text="MIT" >}} ❤️

>  Android application for running Windows applications with Wine and Box86/Box64 

### I simply Love Cal

You can get started very quickly, create a **cal.com meeting and embed it** into your websites in few ways:

{{< youtube id="qFMN0oDeCFg" autoplay="false" >}}
https://awweso.me/booking-and-scheduling/

<!-- https://youtu.be/qFMN0oDeCFg -->

![Calcom Email x Stripe ](/blog_img/email/cal-email-stripe.png)

![Cal.com stripe integration for booking a meeting](/blog_img/email/cal-email-stripe.png)


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/cal/" title="Cal.com | Docker Config 🐋 ↗" >}}
{{< /cards >}}



### Improving HomeLab Security

Whatever you are deploying, specially if you are managing your own VPS...

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/where-to-deploy/" title="Where to Deploy" image="/blog_img/selfh/hetzner-sharedcpu.png" subtitle="A VPS Recap on Hetzner, DO to ship PoCs and more" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/homelab-security/" title="About HomeLab Security | POST" image="/blog_img/hardware/ram-test.png" subtitle="BackUps x Privacy Apps x Private AI" >}}
{{< /cards >}}


<!-- 
SECURITY TOOLS
https://www.politie.nl/informatie/checkjehack.html
https://haveibeenpwned.com/ 

https://www.privacytools.io/privacy-email

-->

1. Setup a Proxy with HTTPs

2. Proper SSH Keys

```sh
ssh-keygen -t rsa -b 4096 -C "somemail@domain.ch"
```

```sh
ssh root@yourhetznerserverip
```

3. Create a non root user to run containers

{{< callout type="warning" >}}
This is a must for any VPS. It avoids attacks like the recent REACT Hack!
{{< /callout >}}

### Business Canvas

This is one of those entrepreneurship tools that I find useful: **The business model canvas**

* https://en.wikipedia.org/wiki/Business_model_canvas

* https://leantime.io/mastering-business-model-a-guide-to-completing-the-lean-canvas-model/

### Other services to deploy?

Interested to discover similar services that you can [self-host](https://fossengineer.com/tags/self-hosting/) with [Docker](https://fossengineer.com/tags/docker/)? - Check this out:

{{< gist jalcocert c043e6645a8786f55640e5fbccbaea00
"Docker-Business-ConfigFiles">}}

{{< gist jalcocert 302f787db6f6d75e978674e0e18d1185
"Docker-Security-ConfigFiles">}} 