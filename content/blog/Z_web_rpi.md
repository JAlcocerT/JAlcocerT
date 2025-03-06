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
My Raspberry Pi related blog is publically available at: https://jalcocert.github.io/RPi/
{{< /callout >}}

---

### More about Jekyll

* References
    * The Jekyll Theme I use - https://github.com/cotes2020/jekyll-theme-chirpy
    * https://zweilosec.github.io/posts/jekyll-chirpy-github-pages-blog/
    * Adding **Web Analytics to Jekyll Chirpy** - https://aouledissa.com/posts/Jekyll-Google-Analytics-4-Integration-With-Chirpy-Theme/

* Other Interesting jekyll Themes
    * https://github.com/wowthemesnet/jekyll-theme-memoirs

### More About Raspberry Pi

**Wi-Fi Setup on Raspberry Pi**
- Configure network priority in `/etc/wpa_supplicant/wpa_supplicant.conf`
  - [StackExchange Guide](https://raspberrypi.stackexchange.com/questions/58304/how-to-set-wifi-network-priority)

**Privacy Tools with a Pi**
- [AdguardHome](https://github.com/AdguardTeam/AdGuardHome#getting-started)
- [Pi-hole](https://github.com/AdguardTeam/AdGuardHome#getting-started)
- [Unbound](https://nlnetlabs.nl/projects/unbound/about/)
- **No-IP**
- [PostHog](https://posthog.com/)

**Home Assistant** 
- Be aware of the differences between HA OS and HA as Docker container!
- [Open Source Alternative for Home Assistant Core](https://www.opensourcealternative.to/project/Core)


**Interesting HA Integrations**

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
