---
title: "How to use HUGO [101] and make quick Websites"
date: 2024-09-06
draft: false
tags: ["Dev","Website"]
summary: 'How to get started with HUGO as SSG and create Webs. GO & HUGO Setup with ChartJS.'
url: 'using-hugo-as-website'
---

To use HUGO, you just need **2 things**:

*GO language and HUGO*:

* https://github.com/gohugoio/hugo/releases
* https://go.dev/dl/

> Why HUGO? It builds sites **veeeery fast**

## HUGO Setup

{{< details title="Setup GO & HUGO - x86 📌" closed="true" >}}

Example with: https://github.com/gohugoio/hugo/releases/tag/v0.108.0

```sh
sudo apt update -y
sudo apt install wget

#install go
# wget https://go.dev/dl/go1.21.1.linux-armv6l.tar.gz
# sudo tar -C /usr/local -xvzf go1.21.1.linux-armv6l.tar.gz
# export PATH=$PATH:/usr/local/go/bin
# source ~/.bashrc
# go version

#install hugo: example v0.108 and tar.gz
# wget https://github.com/gohugoio/hugo/releases/download/v0.108.0/hugo_extended_0.108.0_linux-amd64.tar.gz \
# && tar -xvzf hugo_0.108.0_linux-arm.tar.gz \
# && sudo mv hugo /usr/local/bin/ \
# && rm hugo_0.108.0_linux-amd64.tar.gz \
# && hugo version

#https://github.com/gohugoio/hugo/releases/download/v0.108.0/hugo_0.108.0_linux-amd64.deb
go version && \
wget https://github.com/gohugoio/hugo/releases/download/v0.108.0/hugo_0.108.0_linux-amd64.deb -O hugo_specific_version.deb && \
sudo dpkg -i hugo_specific_version.deb && \
rm hugo_specific_version.deb

# wget https://github.com/gohugoio/hugo/releases/download/v0.117.0/hugo_0.117.0_linux-amd64.deb -O hugo_specific_version.deb && \
# sudo dpkg -i hugo_specific_version.deb && \
# rm hugo_specific_version.deb && \
# source ~/.bashrc
```
{{< /details >}}

Now you can spin a server and make HUGO [Remote Development](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker) in it.

But...you can also use **ARM SBCs with HUGO**


{{< details title="Setup GO & HUGO - ARM64 📌" closed="true" >}}

* Example with: https://github.com/gohugoio/hugo/releases/tag/v0.117.0

```sh
ssh jalcocert@192.168.0.155
ssh jalcocert@192.168.0.12
ssh reisipi@192.168.0.117
```


```sh
sudo apt update -y && \
sudo apt install wget -y && \
wget https://go.dev/dl/go1.22.5.linux-arm64.tar.gz && \
sudo tar -C /usr/local -xzf go1.22.5.linux-arm64.tar.gz && \
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc && \
source ~/.bashrc && \
go version && \
wget https://github.com/gohugoio/hugo/releases/download/v0.117.0/hugo_extended_0.117.0_linux-arm64.deb -O hugo_latestarm.deb && \
sudo dpkg -i hugo_latestarm.deb && \
hugo version && \
rm go1.22.5.linux-arm64.tar.gz && \
rm hugo_latestarm.deb
```

Or if you want, **step by step**:

```sh
sudo apt update -y
sudo apt install wget

#install go
wget https://go.dev/dl/go1.22.5.linux-arm64.tar.gz
sudo tar -C /usr/local -xzf go1.22.5.linux-arm64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.bashrc
go version

#install hugo: example v0.108
# wget https://github.com/gohugoio/hugo/releases/tag/v0.108.0/hugo_extended_0.108.0_linux-amd64.deb -O hugo_latest.deb
# wget https://github.com/gohugoio/hugo/releases/download/v0.117.0/hugo_extended_0.117.0_linux-arm64.deb -O hugo_latestarm.deb

sudo dpkg -i hugo_latest.deb
hugo version 
#sudo dpkg -r hugo
```

{{< /details >}}

But this *thing* also works in older SBC, like the RPi4

{{< details title="Setup GO & HUGO - ARM32 📌" closed="true" >}}

```sh
ssh reisipi@192.168.0.232
```

```sh
sudo apt update -y
sudo apt install wget

#install go
wget https://go.dev/dl/go1.21.1.linux-armv6l.tar.gz
sudo tar -C /usr/local -xvzf go1.21.1.linux-armv6l.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.bashrc
go version

#install hugo: example v0.108
wget https://github.com/gohugoio/hugo/releases/download/v0.108.0/hugo_0.108.0_linux-arm.tar.gz \
&& tar -xvzf hugo_0.108.0_linux-arm.tar.gz \
&& sudo mv hugo /usr/local/bin/ \
&& rm hugo_0.108.0_linux-arm.tar.gz \
&& hugo version
```

{{< /details >}}

---

If you want to be sure that **HUGO works...**

1. See that you got the desired version installed

```sh
go version
hugo version 
```

2. Clone **this Website** Repository and try to **run it locally**:

```sh
git clone https://github.com/JAlcocerT/JAlcocerT && cd ./JAlcocerT

#git clone https://github.com/JAlcocerT/JAlcocerT.git && cd ./JAlcocerT
#git checkout 0026818a2661094d37c958a75535fe2e0daf938c #https://github.com/JAlcocerT/JAlcocerT/commit/0026818a2661094d37c958a75535fe2e0daf938c

```

```sh
#hugo server
#hugo server --bind="0.0.0.0" --baseURL="http://192.168.0.155" --port=1313
#hugo server --bind="0.0.0.0" --baseURL="http://100.104.143.77" --port=1319

ifconfig
#ifconfig eth0 | grep -A 10 "<global>" #check mac, and transfered packages
ifconfig eth0 | grep "inet " | awk '{ print $2 }' #if ETH Connected - SEE THE LOCAL IP
#ifconfig tailscale0 | grep "inet " | awk '{ print $2 }' #for Tailscale
```

---


> Talking from the experience:

HUGO is great to have a quick blog going for free.

Thats what ive done with my [Linux Repo](https://github.com/JAlcocerT/Linux)

{{< callout type="info" >}}
You can use [HUGO with Github Pages + GH Actions](https://github.com/JAlcocerT/Linux/actions). Look at those **~5s build times** ~30/40s e2e!
{{< /callout >}}

This video can be helpful to get going (hugo blowfish theme)

{{< youtube "-05mOdHmQVc" >}}

---

{{< callout type="info" >}}
Looking for features to add for your website? See [some ideas **here**](https://jalcocert.github.io/JAlcocerT/create-your-website/)
{{< /callout >}}

---

## Outro

### Charts in HUGO

Using **mermaidJS** is one option

But you can also try with [**ChartJS**](https://www.chartjs.org/docs/latest/), as discussed at [the HUGO forum](https://discourse.gohugo.io/t/a-chart-js-component-for-hugo/28581), like in

* Thanks to https://github.com/shen-yu/hugo-chart

> a Chart.js component for Hugo. 📈


<!-- https://www.chartjs.org/docs/latest/charts/doughnut.html#pie -->

{{< chart 90 200 >}}
{
  type: 'pie',
  data: {
    labels: [
      'Water',
      'Oil',
      'NaOH'
    ],
    datasets: [{
      label: 'My First Dataset',
      data: [6, 6, 1],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)'
      ],
      hoverOffset: 4
    }]
  },
  options: {
    maintainAspectRatio: false
  }
}
{{< /chart >}}

* https://github.com/MrCroxx/hugo-theme-monument
    * https://github.com/hugo-theme-monument/hugo-theme-monument.github.io
    * https://hugo-theme-monument.github.io/posts/demo-of-katex-chartjs/

```sh
hugo new site your-site-name
cd your-site-name

git init
git submodule add https://github.com/mrcroxx/hugo-theme-monument.git themes/Monument
git submodule add https://github.com/shen-yu/hugo-chart themes/hugo-chart #this is the one doing the trick
```

Add the theme in the `config.toml`

```yml
#theme = "Monument"
theme= ["hugo-chart", "Monument"]
```

```sh
#hugo server
hugo server --bind="0.0.0.0" --baseURL="http://192.168.0.12" --port=1319

#hugo
```

> Tested it with hugo v0.108.0-a0d64a46e36dd2f503bfd5ba1a5807b900df231d linux/amd64 BuildDate=2022-12-06T13:37:56Z VendorInfo=gohugoio

### More about ChartJS

https://github.com/chartjs/Chart.js

> MIT Simple HTML5 Charts using the <canvas> tag


With ChartJS you can also do [Animations](https://www.chartjs.org/docs/latest/configuration/animations.html)!


```sh
npm install chart.js
```

And by using the chart.html shortcode:

1. https://www.chartjs.org/docs/latest/charts/doughnut.html#pie

```md
{{< chart 90 200 >}}
{
  type: 'pie',
  data: {
    labels: [
      'Water',
      'Oil',
      'NaOH'
    ],
    datasets: [{
      label: 'My First Dataset',
      data: [6, 6, 1],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)'
      ],
      hoverOffset: 4
    }]
  },
  options: {
    maintainAspectRatio: false
  }
}
{{< /chart >}}
```

2. Or with a Bar chart:

```md

```

### HUGO Container

Thanks to https://github.com/JamesTurland/JimsGarage/tree/main/Web-Servers from where I got to know:

* https://github.com/klakegg/docker-hugo

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/SSGs" title="HUGO Container | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}

This is a very cool way to [selfhost your SSG](https://fossengineer.com/alternatives-for-hosting-static-websites/) - The HUGO website instance!