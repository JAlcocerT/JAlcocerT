---
title: "Raspberry Pi First Steps on Github Pages"
date: 2021-08-25T23:20:21+01:00
draft: false
tags: ["Self-Hosting","Web"]
cover:
    image: "https://socialify.git.ci/JAlcocerT/RPi/image?description=1&language=1&name=1&owner=1&pattern=Solid&theme=Light" # image path/url 
    alt: "My Github Pages with RPi setup information." # alt text
description: 'A quick guide to Raspberry Pi 4. Shared via Github Pages with Jekyll [Chirpy Theme].'
summary: 'I have just deployed on Github Pages content regarding Raspberry Pi'
url: 'raspberrypi-starting-guide'
---

During this month, have decided to create a more **detailed guide on Github Pages on how to get started with a Raspberry Pi.**

I will use this content as a **personal wiki**, so whenever I find some block that requires some effort to find out on the internet, will make a concise guide right here: <https://jalcocert.github.io/RPi/>

So this is kind of website project + IoT and Linux with a Raspberry Pi kind of thing.

## Raspberry Pi Blog with Jekyll Chirpy Theme

Jekyll uses **Ruby language**.

And thanks to the community, there are Themes that you can use completely free.

So: Free Theme, Free Hosting, Free Github(sub)domain...Let's create something interesting with it.

{{< details title="Ruby + jekyll + Chirpy Setup 📌" closed="true" >}}

There are two ways!

1. Clone the [starter](https://github.com/cotes2020/chirpy-starter) and name it as `urusername.github.io`

This will spin up GHPages & GH Action automatically and provide the theme ready for action.


2. Pro way: Also with [GH Pages + Actions WF](https://github.com/JAlcocerT/RPi/blob/main/.github/workflows/jekyll-pages-deploy.yml)

```sh
git clone https://github.com/cotes2020/jekyll-theme-chirpy && cd ./jekyll-theme-chirpy
```

```sh
sudo apt install ruby-full build-essential zlib1g-dev

#https://jekyllrb.com/docs/ruby-101/#gems
echo '# Install Ruby Gems to ~/.gem' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/.gem"' >> ~/.bashrc
echo 'export PATH="$HOME/.gem/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

gem update --system
gem install jekyll bundler

##ARM64 not there yet
# curl -sSL https://get.rvm.io | bash -s stable
# source ~/.rvm/scripts/rvm
# rvm install 3.1
# sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev
# rvm install 3.1 --disable-binary
```

See the magic of **Jekyll+Chirpy** at work:

```sh
#git clone https://github.com/cotes2020/jekyll-theme-chirpy && cd ./jekyll-theme-chirpy

sudo apt install -y nodejs npm #you need npm, (tried with 7.2.0)
bash tools/init.sh #initialize
bundle
bundle exec jekyll s #local server - http://127.0.0.1:4000
#bundle exec jekyll serve --host 192.168.1.100 --port 4000
```

The page logo (favicon) can be changed thanks to the folder `/assets/img`.

Another **important files** are `_data/authors.yml` and `_config.yml`

```yml
baseurl: "/internetofthings"
url: "https://jalcocert.github.io"
```

{{< /details >}}

{{< callout type="info" >}}
My Raspberry **Pi related blog** is publically available at: https://jalcocert.github.io/RPi/
{{< /callout >}}

---

### More about Jekyll

**References:**

* The **Jekyll Theme** I use - https://github.com/cotes2020/jekyll-theme-chirpy
* https://zweilosec.github.io/posts/jekyll-chirpy-github-pages-blog/
* Adding **Web Analytics to Jekyll Chirpy** - https://aouledissa.com/posts/Jekyll-Google-Analytics-4-Integration-With-Chirpy-Theme/

* Other [Interesting jekyll Themes](https://github.com/planetjekyll/awesome-jekyll): [Theme memories](https://github.com/wowthemesnet/jekyll-theme-memoirs)

---

## More About Raspberry Pi

**Wi-Fi Setup on Raspberry Pi**

- Configure network priority in `/etc/wpa_supplicant/wpa_supplicant.conf`
  - [StackExchange Guide](https://raspberrypi.stackexchange.com/questions/58304/how-to-set-wifi-network-priority)

**Privacy Tools with a Pi**:

- [AdguardHome](https://github.com/AdguardTeam/AdGuardHome#getting-started)
- [Pi-hole](https://github.com/AdguardTeam/AdGuardHome#getting-started)
- [Unbound](https://nlnetlabs.nl/projects/unbound/about/)
- **No-IP**
- [PostHog](https://posthog.com/)


### HA

**Home Assistant with a Pi** 
- Be aware of the differences between **[HA OS](https://jalcocert.github.io/RPi/posts/getting-started/#home-assistant-os)** and **HA Docker** container!
- [Open Source Alternative for Home Assistant Core](https://www.opensourcealternative.to/project/Core)


{{% details title="HAOS vs HA Docker" closed="true" %}}

When considering Home Assistant OS (HAOS) versus a Docker image installation, it boils down to **ease of use versus flexibility and control**. 

**Home Assistant OS (HAOS)**

* **Pros:**
    * **Ease of Use:**
        * HAOS is designed to be a "ready-to-go" solution. It simplifies the installation and management of Home Assistant.
        * The add-on system provides a user-friendly way to install and manage additional services.
        * Automatic updates and simplified backup/restore processes.
    * **Optimized for Home Assistant:**
        * HAOS is specifically tailored to run Home Assistant, which can lead to better performance and stability.
        * Hardware integration is often smoother.
    * **Integrated Supervisor:**
        * The supervisor handles many of the underlying system tasks, making it less necessary for the user to have deep linux system knowledge.

* **Cons:**
    * **Limited Flexibility:**
        * HAOS restricts access to the underlying operating system, which can limit advanced customization.
        * Less control over the system's configuration.
        * Limitations regarding access to hardware drivers.
    * **Less Multi-Purpose:**
        * HAOS is designed primarily for Home Assistant, so it's less suitable for running other applications on the same hardware.

**Home Assistant in Docker**

* **Pros:**
    * **Increased Flexibility:**
        * Docker allows for greater control over the Home Assistant environment.
        * You can easily run other applications alongside Home Assistant on the same machine.
        * You have more control over networking, resource allocation, and updates.
    * **Portability:**
        * Docker containers can be easily moved between different systems.
        * Enables use of existing infrastructure, if you already use docker.
    * **Resource Management:**
        * Docker allows you to precisely manage the resources allocated to Home Assistant.

* **Cons:**
    * **Increased Complexity:**
        * Setting up and managing Home Assistant in Docker requires more technical knowledge.
        * Managing add-ons becomes a manual process, as they are not directly supported in the same way as HAOS.
        * Updates and backups require more manual intervention.
    * **Potential Compatibility Issues:**
        * Hardware integration can be more complex, and some devices may require additional configuration.
    * Losing the ease of use of the supervisor, and add-on store.

{{% /details %}} 

{{< callout type="info" >}}
HA Docker is more portable, but add-ons not supported out of the box in there!
{{< /callout >}}

* If you prioritize simplicity and ease of use, HAOS is likely the better choice.
* If you need maximum flexibility and control, or if you plan to run other applications on the same hardware, Docker is the way to go.

{{% details title="Integrations vs add-ons in Home Assistant" closed="true" %}}

Integrations and add-ons in Home Assistant serve distinct purposes, and it's important to understand the difference. Here's a breakdown:

**Integrations:**

* **Purpose:**
    * Integrations allow Home Assistant to connect and communicate with various devices, services, and platforms. They essentially act as "translators," enabling Home Assistant to understand and interact with different systems.
    * Examples: Philips Hue integration, Z-Wave integration, MQTT integration.
    * They bring data into Home assistant, and allow home assistant to control external devices and services.
* **Function:**
    * They define how Home Assistant interacts with specific devices or services, defining the entities (sensors, switches, etc.) that represent those devices within Home Assistant.
    * Integrations are core to Home Assistant's functionality, allowing it to control and monitor your smart home devices.

**Add-ons:**

* **Purpose:**
    * Add-ons are additional, standalone software packages that run alongside Home Assistant.
    * They provide extra functionalities or services that Home Assistant can utilize.
    * Examples: Mosquitto MQTT broker, Node-RED, a file editor.
* **Function:**
    * They are essentially Docker containers that are managed by the Home Assistant Supervisor (in HAOS or Supervised installations).
    * They often provide services that integrations can then connect to. For example, the MQTT add-on provides an MQTT broker, and the MQTT integration allows Home Assistant to use that broker.
    * Addons expand the abilities of the Home assistant operating system, by adding extra software.

**Key Differences:**

* **Functionality:**
    * Integrations enable Home Assistant to talk to devices and services.
    * Add-ons provide additional software and services that Home Assistant can use.
* **Implementation:**
    * Integrations are typically built into Home Assistant or installed as custom components.
    * Add-ons are separate applications that run in Docker containers.
* **Dependancy:**
    * Often an integration will require an addon to function. For example, using Zwave devices, often requires a zwave management addon.

{{% /details %}} 

> Integrations are how Home Assistant "talks" to things, while add-ons are extra "tools" that Home Assistant can use.

**Interesting HA Integrations**: these works on Home assistant as container as well

- [Raspberry Pi Installation](https://www.home-assistant.io/installation/raspberrypi/)
- [Raspberry Pi GPIO](https://www.home-assistant.io/integrations/remote_rpi_gpio)
- [GPIO Zero Remote GPIO Documentation](https://gpiozero.readthedocs.io/en/stable/remote_gpio.html)
- [Blockchain Integration](https://www.home-assistant.io/integrations/blockchain/)
- [Bitcoin Integration](https://www.home-assistant.io/integrations/bitcoin/)
- **AddGuardHome**
- **Jellyfin**
- **ESPHome**
- **MQTT**
- **MySensors**
- **Plex**
- **Raspberry Pi Power Supply Checker**
- **Radarr**
- **Sonarr**
- **Tailscale**
- **Transmission + TG**