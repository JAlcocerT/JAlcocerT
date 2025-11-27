---
title: "SelfHosting is easy with PaaS"
date: 2025-12-10T01:20:21+01:00
draft: false
tags: ["HomeLab ebook","Hetzner VPS","Anti-Gravity","Excalidraw","1toN ebooks","Omarchy"]
description: 'Selfhosting ebook.'
url: 'selfhosted-apps-december-2025'
---


Google have been improving their stack.

From the https://notebooklm.google/ to...a desktop IDE:

* https://antigravity.google/
  * https://antigravity.google/download/linux
  * https://chromewebstore.google.com/detail/antigravity-browser-exten/eeijfnjmjelapkebgockoeaadonbchdd

![Google AntiGravity IDE](/blog_img/dev/IDEs/antigravity.png)

```sh
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/antigravity-repo-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
  sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null

sudo apt update
sudo apt install antigravity

```

**Tl;DR**

A random server for ~4$/month is all you need.

* https://one.one.one.one/


**Intro**

I tend to get inspired with this kind of [vm and containers that im running](https://blog.networkprofile.org/vms-and-containers-i-am-running-2023/) posts.

As I played with PaaS, wanted to proove how easy and quick is to set them into a VPS for ~4$/month.


Mind your attention, stop auto engage and keep the important things at life first.

{{< youtube id="ydG5EtQat_I" autoplay="false" >}}

<!-- 
https://www.youtube.com/watch?v=ydG5EtQat_I -->

gollama


<!-- 
https://x.com/tom_doerr/status/1979894065400263086?

* https://libreselfhosted.com/project/fluxbb/
* https://awesome-docker-compose.com/apps/photo-server/pigallery-2

 -->



## Excalidraw x Notes x SSGs

Im a big fan of Excalidraw for D&A, specially architectural diagrams.

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

Would you like me to find a specific tutorial or guide for integrating Excalidraw diagrams with an open-source SSG like Quartz or Hugo?

---


## Conclusion

Probably having a **VPS** as compute backup is not a bad idea.

And **[hetzner](https://accounts.hetzner.com/login)** has been leveling up their game: https://docs.hetzner.com/

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-hetzner-vps-setup" title="Hetzner VPS Setup | Script ↗" >}}
{{< /cards >}}

> [CX23](https://www.hetzner.com/cloud/) > CX22 in performance?

> > Pay only for the hours you use, if you have a server for less than a month. No minimum contract period required!

Keeping NS outside cloudflare and using the NGINX setup, instead of the Traefik one.



The **Sony- WF-1000XM3** and linux.

https://www.youtube.com/watch?v=m_Mr4bw8Pow

* https://github.com/kavishdevar/librepods

> GPL 3.0 |  AirPods liberated from Apple's ecosystem. 

https://frantzroulet.com/blog/jekyll/update/2021/02/26/how_to_use_sony_wf-1000xm3_on_ubuntu_20.04_with_i3wm.html

https://askubuntu.com/questions/1269083/ubuntu-20-04-bluetooth-true-wireless-headphones-not-working-work-in-previous-v

https://askubuntu.com/questions/1139404/sony-noise-cancelling-headphones-wh-1000xm2-3-and-bluetooth-initial-autoconnec

The **airpods pro** worked out of the box though...

![Airpods connected to bluetooth to Linux](/blog_img/hardware/airpods-linux.png)

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

### Omarchy

When you think nothing can surprise you...

You get to know a new Arch based OS:

* https://omarchy.org/

That is done by...a [racing driver](https://www.youtube.com/watch?v=iNQl0x6WS3M)?

And that [same person](https://dhh.dk/) is the creator of [ruby](https://jalcocert.github.io/JAlcocerT/raspberrypi-starting-guide/) *on rails* web app framework!

What?!  

![alt text](/blog_img/selfh/omarchy/gnome-boxes.png)

![alt text](/blog_img/selfh/omarchy/omarchy-memtest.png)

I downloaded the `omarchy-3.2.0.iso` of the OS and tried it via VM. 

![alt text](/blog_img/selfh/omarchy/omarchy-setup.png)

It took ~5min to complete the install.

![alt text](/blog_img/selfh/omarchy/omarchy-ui.png)

![Omarchy OS](/blog_img/selfh/omarchy/omarchy-desktop.png)

### Random

> Intelligence is the ability to adapt to change


<!-- https://www.classcentral.com/ -->

<!-- ## Spaced learning -->


<!-- <https://www.futuretools.io/>

<https://github.com/SevaSk/ecoute>

<https://github.com/beyondcode/writeout.ai>

<https://github.com/Significant-Gravitas/Auto-GPT>
<https://docs.agpt.co/setup/>>


<https://ugeek.github.io/blog/post/2023-04-06-listado-de-webs-de-ia-para-busquedas-desarrollo-y-productividad.html> -->

<!-- ultra learning 
range - why generalist...
-->

<!-- [never forget](https://fossengineer.com/machine-learning-data-analytics/#the-bias-variance-trade-off) -->



<!-- * Vast.AI / Tensordock.com / runpod.io -->


<!-- 
If you plan to use openAI:

* Organization ID -> https://platform.openai.com/settings/organization/general
* API Keys -> https://platform.openai.com/settings/profile?tab=api-keys
* endpoint -> https://api.openai.com/ , yes without /v1/models

You can also create knowledge for DifyAI:

* From notion
* text file
* from website- cooming soon -->

<!-- 
## Create Posts as per Inputs



* Festival_Name
* Location
* Date_Event
* Discount_Link
 -->


<!-- https://superlinked.com/vector-db-comparison -->
<!-- https://github.com/superlinked/VectorHub -->


<!-- A compute framework for turning complex data into vectors.
https://github.com/superlinked/superlinked -->

git clone https://github.com/atareao/self-hosted.git atareao


**Tl;DR**

2 years ago I put together couple of words with thoughts and snapshots that the world never got to see.

Now I have 3 ebooks ready to be consumed, while the world ends *one more time*
https://x.com/shanaka86/status/1990231121976811961?s=20


**Intro**

I started this ebook because everything has potential failures

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/1toN-ebooks" title="NEW - 1 WebApp to n eBooks" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code a Web App to serve md content via web ebook and also downlodable as PDFs" >}}
{{< /cards >}}

Expect ,n' to be:

1. Webpage creator: Because you can own your brand
2. Homelabs: 
3. IoT


---

## FAQ

https://bobpony.com/downloads/

Virtualization made simple

* https://flathub.org/apps/org.gnome.Boxes

```sh
flatpak install flathub org.gnome.Boxes
```


### How to run Windows Apps in Android

If what you are looking for is a way to run Windows Apps in new ways, you could also check:

* {{< newtab url="https://github.com/brunodev85/winlator" text="The winlator Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/brunodev85/winlator?tab=MIT-1-ov-file#readme" text="MIT" >}} ❤️

>  Android application for running Windows applications with Wine and Box86/Box64 

### I simply Love Cal

You can get started very quickly, create a meeting and embed it into your websites in few ways:

{{< youtube id="qFMN0oDeCFg" autoplay="false" >}}


<!-- https://youtu.be/qFMN0oDeCFg -->

![Calcom Email x Stripe ](/blog_img/email/cal-email-stripe.png)

![Cal.com stripe integration for booking a meeting](/blog_img/email/cal-email-stripe.png)


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/cal/" title="Cal.com | Docker Config 🐋 ↗" >}}
{{< /cards >}}

https://awweso.me/booking-and-scheduling/

### CMS x Astro

From the experience: Dont do more than 3 websites to very close people if you they are not able to self-server.

Thats where [selfhosted tools](https://docs.vrite.io/self-hosting/configuration/) like: https://github.com/vriteio/vrite are supposed to shine.

>  Open-source developer content platform 

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/directus" title="DirectusCMS | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/strapi" title="StrapiCMS | Docker Config 🐋 ↗" >}}
{{< /cards >}}

I also got inspired by tools listed: https://www.awesome-homelab.com/category/writing

Particularly by https://www.awesome-homelab.com/item/novel-editor


<!--
* https://builtwith.com/theinstituteofskills.com/
* https://www.similarweb.com/website/theinstituteofskills.com/#traffic
* https://radar.cloudflare.com/scan?url=https://fossengineer.com/
-->

#### Headless DirectusCMS Example

* https://astro.build/themes/details/directus-cms-template/
* https://github.com/directus-labs/starters/tree/main/cms/astro

#### Headless StrapiCMS Example



![Strapi UI](/blog_img/web/cms/strapi-admin-ui.png)



## The Penpot Project

* https://github.com/Figma-Linux/figma-linux


Penpot is a powerful and customizable design and prototyping tool that offers a wide range of features and benefits for users.

In this blog post, we'll explore what Penpot is, how it works, and why you might want to consider using it for your own design and prototyping needs. 

Are you looking for a powerful and flexible design and prototyping tool that is **free and open-source**? Look no further than Penpot. 

```sh
#https://flathub.org/apps/com.sudovanilla.penpot-desktop
```

It can also be configured via docker: https://github.com/jmlcas/penpot

Penpot is a versatile and customizable design tool that allows you to create beautiful and interactive designs for web and mobile applications.

With its intuitive interface and extensive customization options, Penpot is a great choice for anyone who wants to create stunning visual designs and prototypes. 

* https://help.penpot.app/technical-guide/getting-started/#start-penpot


{{< dropdown title="Pre-Requisites!! Just Get Docker 🐋" closed="true" >}}

Important step and quite recommended for any SelfHosting Project - [Get Docker Installed](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/)

It will be one command, this one, if you are in Linux:

```sh
apt-get update && sudo apt-get upgrade && curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh && docker version
```

{{< /dropdown >}}


### Improving HomeLab Security

<!-- 
SECURITY TOOLS
https://www.politie.nl/informatie/checkjehack.html
https://haveibeenpwned.com/ 

https://www.privacytools.io/privacy-email

-->

1. Setup a Proxy with HTTPs


See also zoraxy or Pangolin

https://github.com/tobychui/zoraxy
https://github.com/tobychui/zoraxy?tab=AGPL-3.0-1-ov-file#readme

General purpose (reverse) proxy and forwarding tool for networking noobs. Now written in Go!


2. Proper SSH Keys

```sh
ssh-keygen -t rsa -b 4096 -C "somemail@domain.ch"
```

```sh
ssh root@yourhetznerserverip
```

<!-- ### Other Interesting Services to SelfHost

* You can also check how to block adds for all home devices by [SelfHosting PiHole with Docker](https://fossengineer.com/selfhosting-PiHole-docker/) -->

<!-- ### Check Similar Services

Interested to discover similar services that you can [self-host](https://fossengineer.com/tags/self-hosting/) with [Docker](https://fossengineer.com/tags/docker/)? - Check this out:

{{< gist jalcocert 302f787db6f6d75e978674e0e18d1185
"Docker-Security-ConfigFiles">}} 

# Traefik Proxy

Traefik 3 and FREE Wildcard Certificates with Docker
https://www.youtube.com/watch?v=n1vOfdz5Nm8
https://technotim.live/posts/traefik-3-docker-certificates/


We have already seen how to use PiHole and Cloudflare Tunnels.

<https://www.youtube.com/watch?v=liV3c9m_OX8&t=723s>

<https://www.youtube.com/watch?v=b83S_N1kkJM>

SSL will be provided by Cloudflare instead of let's encrypt.

We could use DuckDNS, but our home public ip address would be exposed.

 -->

### Business Canvas

This is one of those entrepreneurship tools that I find useful: The business model canvas

* https://en.wikipedia.org/wiki/Business_model_canvas

* https://leantime.io/mastering-business-model-a-guide-to-completing-the-lean-canvas-model/



### Other services to deploy?

Interested to discover similar services that you can [self-host](https://fossengineer.com/tags/self-hosting/) with [Docker](https://fossengineer.com/tags/docker/)? - Check this out:

{{< gist jalcocert c043e6645a8786f55640e5fbccbaea00
"Docker-Business-ConfigFiles">}}