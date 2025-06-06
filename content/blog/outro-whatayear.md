---
title: "What a Year..."
date: 2024-12-30
draft: false
tags: ["Year-Review"]
description: 'Looking back to the learnings of the year 2024.'
url: 'this-year-was-crazy'
---

This year was **crazy**.

But...on the tech side, it was quite interesting.

And diverse.

**Let me recap** a little bit.

The most **interesting concepts** Ive learn this year:

1) **Bike-Shedding** 

2) **Show your Work** - Together with the [First 5 Clients Framework](https://www.acquisition.com/training/leads4) and finding  a balance between what I do and what I show.

> Probably 80 do / 20 show is the way to go?

3) **Finish what you Start**

4) It does not matter how fast your are going if you are going in the wrong direction

5) When you think you are on the top, you stop getting better

A very **impactful video** I saw:

<!-- 
{{< youtube id="v=KSaS9m8O2Rc" autoplay="false" >}}
-->

{{< youtube "KSaS9m8O2Rc" >}}


With this channels: https://www.youtube.com/@TheDiaryOfACEO

And cool **food for thoughs** on these posts:

* https://www.nickgracilla.com/posts/stop-doing-a-place/
  * https://www.nickgracilla.com/posts/year-in-review-template/
* https://blog.cavelab.dev/2022/01/a-person-that-writes/


*I was lucky to find them! As the "search algorithms" are not placing this high valuable content in front of your eyes*


{{< details title="Examples of People Doing Cool Stuff 📌" closed="true" >}}

* https://blog.cavelab.dev/2021/11/wifi-relays-for-ventilation/

{{< /details >}}


---

*Most interesting things i've completed...*


## Webs

{{% steps %}}

### Webs101

This is the first step: [Setup HUGO](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/) or [Setup Astro](/JAlcocerT/using-astro-as-website).

You can also deploy [SSG with Containers](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/#containers-for-webs)

```sh
#hugo server --bind="0.0.0.0" --baseURL="http://192.168.0.117" --port=1313
#npm run dev
```

```mermaid
graph TD
    A[Build SSG] -->|Choose one | B[GitHub Pages]
    A -->|of these | C[Firebase]
    A -->|deployments| D[Cloudflare Pages]
    B --> E[Add your custom domain - OPTIONAL]
    C --> E
    D --> E

    click B href "https://jalcocert.github.io/JAlcocerT/portfolio-website-for-social-media/#demo-results" "Visit GitHub Pages"
    click C href "https://fossengineer.com/hosting-with-firebase/#getting-started-with-firebase-hosting" "Visit Firebase Hosting"
    click D href "https://jalcocert.github.io/JAlcocerT/astro-web-cloudflare-pages/" "Visit Cloudflare Pages"
```

* Explore new libraries to improve Themes:
  * [CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-css/)
  * [JS](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/#chartjs)

### Webs with AI

From an [AI driven content](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#automatic-blog-creation) web, to [migrating webs with AI](https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/)

### Get Better at Webs

Good recap of whats going on at JS: https://stateofjs.com/en-US
* Web Analytics: with [Umami](https://fossengineer.com/selfhosting-umami-with-docker/) or [Tianji...](https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics)
* CMS for Webs: DecapCMS, ...

After few months if [CI/CD build](https://jalcocert.github.io/JAlcocerT/github-actions-use-cases/#github-actions-for-web-projects) errors, fixed [my RPi site](https://jalcocert.github.io/RPi/), as there was sth wrong with the Jekyll automatic CI/CD build.

Maybe, just maybe, will need to [migrate from Jekyll](https://simplyexplained.com/blog/migrating-this-blog-from-jekyll-to-eleventy/) at some point to HUGO/Astro.

{{% /steps %}}


{{< details title="Python is the most popular language - Again 📌" closed="true" >}}

- **Python** has surpassed **JavaScript** as the most-used language on GitHub, largely due to the growing focus on **data science** and **machine learning**.
- There has been a **59% increase** in contributions to **generative AI** projects, showing the rise of AI-related work on the platform.
- **1.4 million new developers** joined open source globally, with most contributing to **AI and commercially backed projects**.
- Python's **simple syntax** and strong capabilities in **data handling** have made it especially popular with newcomers, particularly those entering the **AI field**.
- As a feature of **Linux distributions**, Python is easy to access and commonly used to create **desktop applications** with frameworks like **Qt** and **GTK**.
- **Jupyter Notebooks** experienced a significant surge in usage, thanks to its adoption for **AI/ML** tasks.
- Despite the **hype** around **Rust**, its usage still lags behind Python, JavaScript, TypeScript, and Java.
- The rise in **Python projects** may also be fueled by **GitHub Copilot**, which aids developers working on **AI/LLM** projects.
- **India** is expected to surpass the **USA** in the number of developers on GitHub sooner than anticipated.

{{< /details >}}

> There is something about the AI, LLMs, [**LangChain**](https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data/) that has sth to do with it...


## Servers

A new Windows setup is easy [with **Chocolatey**](https://jalcocert.github.io/JAlcocerT/how-to-use-chocolatey-windows/)

I played with the Pi's a little bit: 

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/rpi-mjpg-streamer" title="RPi Streamer Forked Repo" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/pi-vs-orange/#the-raspberry-pi-4" title="A Raspberry Pi? A SBC?" >}}
{{< /cards >}}

And the 'family' got bigger:

![SBCs vs Laptop](/blog_img/hardware/sbcs-x13.jpg)

There was also time to improve how I do SelfHosting.

{{% steps %}}

### Better SelfHosting

With [this post](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/) and [**this SelfHosting script**](https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/Selfhosting_101.sh)


* Understood better [how DNS works](https://jalcocert.github.io/Linux/docs/privacy/#changing-linux-dns) and went fully with *BitWarden + 2FAS Auth*

### Doing Better with Pi's

I got an additional **Pi4** (this time 4GB Ram, 64 bits) and was helpful to:

* Explored **Computer Vision**
  * With a [RPi Camera](https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/)
  * And a [DJI Drone that can be controlled with python](https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/)
* Tinker with [VPNs, Wireguard and Wifi2Eth Bridge](https://jalcocert.github.io/JAlcocerT/raspberry-pi-networking/)
* Learnt more about **device efficiency** and its relation with [power consumption](https://jalcocert.github.io/JAlcocerT/laptop-lenovo-thinkpad-x13-benchmark/)
  * A pi can be powered with the original 15W usb-c adapter (5.1V/3A DC)
    * But as long as your adapter is able to sustain at 5V a current up to 3A it will work
    * In idle the Pi4 sits ~4W, meaning ~0.8A (Voltage is the constant)
* [Used **Ansible**!](https://jalcocert.github.io/Linux/docs/linux__cloud/ansible/) Combined an [IoT Project (DHT-Mongo-Metabase)](https://jalcocert.github.io/RPi/posts/rpi-ansible/)
* Put together few **AI Projects** to work on the RPi [here](https://jalcocert.github.io/RPi/posts/raspberry-ai-projects/)

{{< callout type="warning" >}}
Definitely want to go back to the **IoT Projects** and do sth with Small Solar Panels
{{< /callout >}}

**Sources of inspiration**: [randomgarage](https://www.randomgarage.com/2018/12/raspberry-pi-automated-irrigation-system.html)

### Built a new PC!

Finally got the chance to [build a compact x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server)

* Learnt more about **benchmarks** and compared it with: [Firebat](https://jalcocert.github.io/JAlcocerT/firebat-ak2-plus-minipc-review/), [BMAX-B4](https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/#asrock-x300-and-the-bmax-b4) and...even the [ThinkPad](https://jalcocert.github.io/JAlcocerT/laptop-lenovo-thinkpad-x13-benchmark/)
* Also got amazed one more time with ARM CPUs efficiency, thanks to both [Opi5 and the RPi's](https://jalcocert.github.io/RPi/posts/pi-vs-orange/)

{{< youtube "4qLgpJc2Ghs" >}}
<!-- https://youtu.be/4qLgpJc2Ghs -->

### Third Party Servers

It was the year to go [beyond Google Compute Engine](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#gcp-free-tier-deploy---cli) and the (as per my experience) arbitrary Oracle Free Tier.

* I tried [Hetzner Cloud](https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/#analysis-paralysis---choosing-small-factor-computer)

> Also gave it a try to Podman Containers, [Termux Virtualization](https://jalcocert.github.io/Linux/docs/privacy/android/#how-to-use-linux-on-android-with-termux). Oh and with [QEMU i can create **MultiArch containers** images with Github Actions](https://jalcocert.github.io/JAlcocerT/create-streamlit-chatgpt/#conclusion---and-what-i-learnt)!

* And as you might now already, [container creation can be automatized with GH Actions CI/CD](https://jalcocert.github.io/JAlcocerT/github-actions-use-cases/)

{{% /steps %}}


{{< details title="Starting with a RPi-101 | version 2024 📌" closed="true" >}}

* Get an [OS for the RPi with RPi-Imager](https://jalcocert.github.io/RPi/posts/getting-started/)
  * I suggest BullsEye/Debian11
  * I got some docker image issue with some [IoT Project](https://jalcocert.github.io/RPi/categories/iot-data-analytics/) 
    * Was unable to install the Python sensor dependencies with Bookworm (strange, I know)

```sh
lsfblk -f #check whats the SD Card to install the OS
sudo umount /dev/sda1
#sudo lsof +f -- /dev/sda1 #whats using the partition?
```

* Use the **SelfHosting Script** - https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/

```sh
#ssh jalcocert@192.168.0.155 #SSH has to be enabled with CLI or during OS Installation with RPi-Imager
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh
#nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING

chmod +x Selfhosting_101.sh
sudo ./Selfhosting_101.sh
```

* Get to know the **relevant private IPs** of your Pi with:

```sh
ifconfig #I can see that my Pi is 192.168.0.155 when connected via ETH and that the mac starts with D8:3A:...
ifconfig eth0 | grep -A 10 "<global>" #check mac, and transfered packages
#ifconfig eth0 | grep "inet " | awk '{ print $2 }' #if ETH Connected
#ifconfig tailscale0 | grep "inet " | awk '{ print $2 }' #for Tailscale
```

**Optional** - Save the OS image and share it with the torrent for others.

Normally the RPi team keeps them [here](https://www.raspberrypi.com/software/operating-systems/), with links pointing to [this repo](https://downloads.raspberrypi.com/raspios_oldstable_lite_arm64/images/raspios_oldstable_lite_arm64-2024-10-28/), but just in case!

```sh
wget https://downloads.raspberrypi.com/raspios_oldstable_lite_arm64/images/raspios_oldstable_lite_arm64-2024-10-28/2024-10-22-raspios-bullseye-arm64-lite.img.xz.torrent
```

{{< /details >}}


{{< callout type="info" >}}
You can share with others the **RPi OS Image via Torrent** [with Docker, QBitrorrent & VPN](https://fossengineer.com/selfhosting-qBittorrent-with-docker-and-VPN/)
{{< /callout >}}

{{< details title="Better Networking 📌" closed="true" >}}

This year I changed [my router](https://github.com/Exafunction/CodeiumVisualStudio)!
Went from a **Compal MV1 to a NE6037** (still COAX, I know!)


* I got one of these [portable 4g usb routers with sim - OLAX-U90](https://allegro.pl/oferta/modem-router-4g-lte-wifi-olax-car-audio-hotspot-13172600554)
  * Once plugged in, you get a wifi SSID to connect to and manage the router: `192.168.0.1`
    * Credentials are written on the device & it will ask you about SIM pin
  * If a valid sim is plugged, you can see the SMS and also make it provide internet connectivity

![4g-OLAX-Portable-Router](/blog_img/mini_pc/4g-router.png)

* Networking with the Pi was improved
  * [Wifi2Ethernet bridge with Wireguard](https://jalcocert.github.io/JAlcocerT/raspberry-pi-networking/)


{{< /details >}}


I learnt a few things **about Servers** with the [X300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/)
* Better [Benchmarks](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#benchmarks-101)
* Easier SelfHosting
  

{{< details title="Not more, but better SelfHosting 📌" closed="true" >}}

Thanks to this sites:

* <https://Selfhosted.show>
* <https://selfh.st/>
* [This blog post](https://fossengineer.com/selfhosting-favourite-aug-2024/)

{{< /details >}}


## D&A

A huge consolidation of knowledge in this area.

{{% steps %}}

### The Big Picture

* Before going to Big Data, dont forget **the Big Picture**
  * [**Diagrams** saved me hours](https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/) of explaining hard concepts.
    * They can be done with: [DrawIO](https://fossengineer.com/selfhosting-drawio-with-docker/), [MermaidJS](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#diagrams-with-ai), Python Diagrams, [ExcaliDraw](https://fossengineer.com/selfhosting-excalidraw/), ...
    * They help me explain from `brainstorm sessions output` to `MQTT & RabbitMQ` workflows!!

* Share knowledge with a Presentation as a Code: [**SliDev**](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#slides-creation-agent) or [Marp, RemarkJS](https://fossengineer.com/create-ppt-with-code/)
    * [**SliDev example** with GHPages + Github Actions](https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/slidev)

> **Domain Knowledge** is always key - https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/

### Big Data & Cloud

* Got the chance to work with Google Cloud/GCP...
* Could use interesting tools: Databricks, Trino (ex Presto-SQL), ...

### Python is Easy!

* [Environments](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/#python-virtual-envs) are not a secret anymore 
  * Its not just [Python](https://jalcocert.github.io/JAlcocerT/guide-python/)
  * Or [PySpark](https://jalcocert.github.io/JAlcocerT/guide-python-PySpark/) is not a big secret
* Neither it is having a [cool readme](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/README.md)


{{< details title="But having a Python env is this simple 📌" closed="true" >}}

```sh
#git clone https://github.com/JAlcocerT/DataChat

#python --version
python3 -m venv video_python_venv #create a Python virtual environment
python -m venv video_python_venv

video_python_venv\Scripts\activate #activate venv (windows)
source video_python_venv/bin/activate #(linux)

#deactivate #when you are done

#pip install -r requirements.txt

source .env
#export GROQ_API_KEY="your-api-key-here"
#set GROQ_API_KEY=your-api-key-here
#$env:GROQ_API_KEY="your-api-key-here"
echo $GROQ_API_KEY $OPENAI_API_KEY $ANTHROPIC_API_KEY

streamlit run Z_ST_AIssistant_v1.py

# git add .
# git commit -m "better st offer analyzer"
# git push
```

{{< /details >}}

* Always **use GIT**...
  * With [Github](https://jalcocert.github.io/JAlcocerT/github-gists), [Gitlab](https://jalcocert.github.io/JAlcocerT/how-to-use-gitlab/), or [whatever you want](https://fossengineer.com/selfhosting-Gitea-docker/). But *backup* your code.
  * You can also do [remote/docker dev](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/)

### Cool AI Stuff

* I touched the Surface of [Flask](https://jalcocert.github.io/JAlcocerT/get-started-with-flask/)
* But went quite **deep into Streamlit** with few Projects
  * [Multi-Purpose Assistant](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/)
  * [Multi-Chat](https://github.com/JAlcocerT/Streamlit-MultiChat)
  * Learnt more about [**Scrapping** and combined it with AI](https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/)
* Went from the Ollama API to try several **3rd party LLMs**
  * OpenAI
  * Anthropic
  * Groq: LLama3 / 3.1 / 3.2 models are really good!
* Made another test to the latest T2I (text 2 image) models
  * https://jalcocert.github.io/JAlcocerT/stable-difussion-free-generation/

{{% /steps %}}


{{< callout type="warning" >}}
I know, have to give it a try to **these APIs**: [Mistral](https://docs.mistral.ai/api/), Grok, Gemini...maybe [Sambanova](https://www.reddit.com/r/LocalLLaMA/comments/1d3hw9r/sambanova_system_reaches_1000_tokens_per_second/) [cloud](https://cloud.sambanova.ai/)?
{{< /callout >}}

![Cat product Meme](/blog_img/memes/features-vs-needs.png)
*The final user always has the last word on rating what you've built*

{{< callout type="warning" >}}

Need to see how to use [DLT](https://github.com/dlt-hub/dlt) - data load tool (dlt) is an open source Python library that makes data loading easy 🛠️


{{< /callout >}}

<!-- 
## Crypto

* https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/

> A recap on [BlockChain](https://simplyexplained.com/videos/how-does-a-blockchain-work/)

{{< details title="Crypto is...back? 📌" closed="true" >}}

With KYC both, Binance and Kraken worked fine to me.

According to [reddit](https://www.reddit.com/r/BitcoinBeginners/comments/k6gm2d/best_exchange_without_needing_to_verify_id/), hodlhodl is a place to exchange BTC without KYC.

> No keys, no coins - Make sure you understand how wallets work. 

```sh
flatpak install flathub org.electrum.electrum #BTC

flatpak install flathub org.featherwallet.Feather #Monero
#flatpak install flathub org.getmonero.Monero
```

{{< /details >}}

{{< callout type="warning" >}}
Its probably time to go back and make [a better Web3](https://jalcocert.github.io/JAlcocerT/guide-web3/)
{{< /callout >}}
 -->

---

## Looking Forward

As always, a new year comes with **opportunities to get better**.

{{< details title="SuperProductivity... 📌" closed="true" >}}

* https://github.com/johannesjo/super-productivity

Super Productivity is a comprehensive to-do list app designed to enhance productivity through time management and tracking features.

- It integrates with platforms like **Jira**, **GitHub**, and **GitLab** to import tasks directly.
  
- The app allows users to **organize tasks** with sub-tasks, projects, and tags, promoting effective time management.

- **Timeboxing** and **tracking** features enable users to create detailed reports for time sheets.

- Built-in tools include:
  - **Break reminders** to promote healthy work habits.
  - An **anti-procrastination feature** to help users stay focused.
  - A **Pomodoro timer** for structured work sessions.

- The app emphasizes **privacy** by not collecting user data or requiring accounts.

- It's **free** and **open-source**, ensuring accessibility to all.

Conclusions: Super Productivity merges task management with time tracking, enhancing productivity without compromising privacy. 

Similar projects include **Todoist** and **Trello**, which also focus on task management but may require user accounts and collect data.


{{< /details >}}


Would be amazing **to be better at what matters the most for us**.

In the meantime...

* https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/

{{< details title="Im getting better at photo/video edditing 📌" closed="true" >}}

* https://github.com/JAlcocerT/YT-Video-Edition

And to be investigated...

* https://github.com/k4yt3x/video2x
* You could also do it by applying UpScayl to each photogram of a video...

{{< /details >}}


{{< callout type="info" >}}
For Photos I am using [this kind of Hugo Gallery](https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/) - <https://while.cyclingthere.com/>
{{< /callout >}}

### Closing Thoughts for 2024

It's been a year of a lot of trial and errors.

And not only on the TECH side.

![Karting Adventure](/blog_img/memes/Accidente_karting-min.gif)

But also with a lot of learnings.

---

### Next Year 

For 2025?

1. Get few more websites going for close people.
2. Leveraging on AI
3. Doing less in total and more of what has a real impact

Use [LiteLLM](https://github.com/BerriAI/litellm) to unify the LLMs API calls across providers..and use [screenshot2code](https://github.com/abi/screenshot-to-code) to make cooler website designs

[Cline/ClaudeDev](https://www.youtube.com/watch?v=TPjZ-E9WR6c)

{{< details title="Maybe next year...Dev Stuff 📌" closed="true" >}}

**Go**

Go has become a popular language due to several key strengths that align with the needs of modern software development. Here's why:

- **Performance**: As a compiled language, Go provides high execution speed, making it ideal for performance-critical applications.
- **Concurrency**: With built-in support for concurrency through goroutines and channels, Go excels in managing multiple tasks simultaneously, which is essential for scalable systems.
- **Simplicity**: Go's minimal and clean syntax reduces complexity, making it easy to write and maintain code.
- **Type Safety**: Static typing in Go catches errors during compilation, reducing the chance of runtime issues and ensuring more reliable code.
- **Tooling**: Go has a powerful standard library and extensive third-party tools that help developers build efficient and maintainable applications.

The popularity of **Go** has been further driven by the rise of **Kubernetes**, which is written in Go and has become a core part of cloud-native environments.

Summary of Transitioning to Go for Node.js Developers:

- **Go's Performance**: As a compiled language, it offers faster execution compared to interpreted languages like JavaScript.
- **Concurrency in Go**: Goroutines and channels allow for easy management of concurrent tasks, making Go ideal for scalable applications.
- **Simplicity**: Go’s clean, minimal syntax makes it easier to learn and reduces cognitive load.
- **Type Safety**: Static typing ensures fewer runtime errors, making Go more reliable.
- **Tooling**: Go provides an excellent set of libraries and tools that help streamline the development process.

For Node.js developers, learning Go can open doors to better performance and scalability, especially when working with cloud-native technologies like **Kubernetes**.

Personal Takeaways for Node.js Developers:

- Embrace Go's **strict type system** and **error handling** methods to write robust code.
- Take time to understand **Go's concurrency model** to fully utilize its potential.
- Leverage **tutorials** and **community resources** to ease the learning curve.

In conclusion, Go is a great language for developers aiming to build high-performance, scalable applications, and it serves as a valuable addition to a developer’s toolkit. Similar languages, like **Rust** and **Deno**, also focus on performance and safety, making them worth exploring.

{{< /details >}}





{{< details title="Maybe next year...[Linux Stuff] 📌" closed="true" >}}

SysLinuxOS is a specialized Debian-based Linux distribution tailored for system administrators. 

It addresses the need for a robust operating system equipped with tools for networking and system management. 

**Key Features:**
1. Debian-based with extensive networking and systems tools pre-installed.
2. Supports multiple languages; offers GNOME and MATE desktop environments.
3. Includes a variety of security and monitoring tools for enhanced system management.

**Pros:**
- Comprehensive selection of pre-installed tools for system administration.
- User-friendly with improved hardware support and customization options.
- Regular updates aligned with Debian releases.

**Cons:**
- Desktop may appear cluttered due to numerous monitoring displays.
- May require additional configuration for specific user needs.

**Alternatives:**
- Ubuntu Server
- CentOS
- Fedora Server

SysLinuxOS provides a solid foundation for system administrators, but users should be aware of its potential clutter.


{{< /details >}}


#### Things to Continue Doing

1. Focusing on the Process

* Keep documenting my learning process as blog post
* Share more videos about it (for this I need to find a workflow)


{{< details title="Certainly next year...[Video Stuff] 📌" closed="true" >}}

* Create and Publish 15 YT Videos of content I already have blog documentation
* Explore further python/[chartJS](https://www.chartjs.org/docs/latest/configuration/animations.html) animations
* Start exploring RemotionJS framework


{{< /details >}}


#### Stop Coding as in 2023


{{< details title="AI Asisted Dev Tools...Codeium?ContinueDev? Copilot?Aide?Cursor?Cline...? 📌" closed="true" >}}

* ClaudeDev / [Cline](https://github.com/cline/cline) - https://www.youtube.com/watch?v=vU0LY8-P52A
* ContnueDev - https://www.youtube.com/watch?v=qXNecVIxRi0&t=13s


{{< /details >}}




{{< details title="AI Asisted Web Search... 📌" closed="true" >}}

Perplexity? Or **Perplexica**?

* https://github.com/rashadphz/farfalle - 🔍 AI search engine - self-host with local or cloud LLMs
* https://github.com/InternLM/MindSearch - 🔍 An LLM-based Multi-agent Framework of Web Search Engine (like Perplexity.ai Pro and SearchGPT)
* Tavily
* https://github.com/developersdigest/llm-answer-engine - Build a Perplexity-Inspired Answer Engine Using Next.js, Groq, Llama-3, Langchain, OpenAI, Upstash, Brave & Serper





{{< /details >}}



---



## VectorDBs

When you are using [embedding models](https://www.youtube.com/watch?v=QdDoFfkVkcw) to give LLMs context about your files, this is where that knowledge goes.

And there are many Vector DBs that you can use with Linux

{{< tabs items="VectorAdmin,ChromaDB,Other Vector DBs" >}}

  {{< tab >}}
  Manage them with [VectorAdmin and Docker](https://fossengineer.com/what-are-vector-dbs/#selfhosting-vectoradmin-with-docker)
  {{< /tab >}}
  {{< tab >}}
  [ChromaDB with Docker](https://fossengineer.com/selfhosting-chroma-vector-db/)
  {{< /tab >}}
  {{< tab >}}QDrant{{< /tab >}}

{{< /tabs >}}

All of this tech will work in Linux and **with just CPU**, if you dont have a GPU handy.

{{< youtube "zNLSwy_DJ_U" >}}

<!-- https://www.youtube.com/shorts/zNLSwy_DJ_U -->

---

## More & More

### Can I use LLMs to Code?

Yes, there are many ways to replace Github Copilot for Free:

* [Tabby](https://fossengineer.com/selfhosting-Tabby-coding-assistant/)
* [LLama Coder](https://github.com/ex3ndr/llama-coder) in a [vscode extension](https://marketplace.visualstudio.com/items?itemName=ex3ndr.llama-coder&ssr=false#review-details)
  * [CodeLLama in HF](https://huggingface.co/codellama/CodeLlama-70b-hf)
* Others: Bito, Codeium, or [Adrenaline](https://github.com/shobrook/adrenaline/)

### Choosing the Right Model


{{% details title="LLM Quantization" closed="true" %}}
* GPTQ quantization, a state-of-the-art method featured in research papers, offers minimal performance loss compared to previous techniques. It's most efficient on NVIDIA GPUs when the model fits entirely in VRAM.
* GGML, a machine learning library by Georgi Gerganov (who also developed llama.cpp for running local LLMs on Mac), performs best on Apple or Intel hardware.

Thanks: https://aituts.com/local-llms/#Which_Quantization

{{< /details >}}

#### Which LLMs are Trending?

{{% details title="You can always check the LLM's Leaderboards" closed="true" %}}

* <https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard>
* With **ELO** Rating: <https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard>
    * <https://chat.lmsys.org/?arena>

* Examples: use them also with GPT4All or TextGenWebUI
  * <https://huggingface.co/TheBloke/Llama-2-13B-Chat-fp16/tree/main>
  * <https://huggingface.co/docs/transformers/main/model_doc/mpt>
    * And [this one](https://www.mosaicml.com/mpt) you can train it and use commercially: https://www.mosaicml.com/training

> You can also check this repository: https://github.com/sindresorhus/awesome-chatgpt and https://github.com/f/awesome-chatgpt-prompts
{{< /details >}}


### Where to host in the Cloud?

If you need big GPU power, you can always try https://www.runpod.io/gpu-instance/pricing and similar services.

* https://accounts.hetzner.com/_ray/pow (I tried the CX22 model x2 vCPU)
* https://cloud.digitalocean.com

Clouds ( & GPU Clouds)

* RunPod, Linode, DigitalOcean, Paper Space, Lambda Cloud, [Hetzner](https://jalcocert.github.io/Linux/docs/linux__cloud/cloud/#hetzner)...
* vast.ai, 
* Google Colab TPU...