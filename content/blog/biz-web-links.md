---
title: "One link for Social Bios: LinkinBios vs Bento like websites"
date: 2025-01-24
draft: false
tags: ["OSS"]
description: 'Simple Link Website Hosting Services. SSGs vs Selfhostable LittleLink and LinkStack.'
url: 'linktree-web-alternative'
---

I know we cant know about everything.

But the amount of close people that its trying to build something on social media, yet does not have a website still amazes me.

Why not giving a try to `linktree`, `many.link`... 

Is it all about pricing?

Vendor lock up?

Then, lets have a look to solutions that will **just require your time**:

1. Using Static Site Generators, aka **SSG**'s (Advance)
2. Keep it simple with containers and **[SelfHostable solutions](#selfhosted-solutions-for-linkinbio)**

## SSG Solutions for LinkInBios

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101" >}}
{{< /cards >}}

**Hugo example** and Lynx Theme!

We can use [HUGO SSG](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/) together with the [Lynx Theme](https://jalcocert.github.io/JAlcocerT/portfolio-website-for-social-media/) and have a quick Linktree alternative.

You dont really need anything to get started, as we can make this work [with **Github Pages**](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/).

{{< callout type="info" >}}
See my [HUGO Lynx deployed at GHPages](https://jalcocert.github.io/Portfolio/) and its [source code](https://github.com/JAlcocerT/Portfolio)
{{< /callout >}}

**Astro** Link examples

1. https://github.com/nevthereal/linktree-template
2. https://astro.build/themes/details/ltree/


### SSG LinkinBio with CMS

1. [Astro + Tina](https://darko.io/posts/linktree-and-linkinbio-clone-with-astro-and-tinacms/)

---

## SelfHosted Solutions for LinkinBio


1. **Little Link**: A lightweight DIY Linktree alternative.

* Deployable as static: https://github.com/sethcottle/littlelink?ref=noted.lol
* But also Selfhostable https://github.com/techno-tim/littlelink-server

Thanks to [Noted.lol to cover Little Link](https://noted.lol/littlelink/)

{{< callout type="info" >}}
See the config file [here](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/LittleLink_docker-compose.yml)
{{< /callout >}}

2. [**LinkStack**](https://linkstack.org/docker/) - Selfhostable with [this docker config](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/LinkStack_docker-compose.yml). I covered this one [here already](https://jalcocert.github.io/JAlcocerT/portfolio-website-for-social-media/).

* It has a cool UI to manage users: `http://192.168.0.155/admin/config`
* Each of them gets a different static path, like `url.com/@user123`
* Built in Link Analytics
* Cool themes working out of the box: https://linkstack.org/themes/
* Add also custom WebAn tools `http://192.168.0.155/admin/config#2`
* Allows for instance backups via UI `http://192.168.0.155/admin/config#3`

>  A simple to set up [docker variant of LinkStack](https://github.com/linkstackorg/linkstack-docker). LinkStack is a highly customizable link sharing platform with an intuitive, easy to use user interface. 

Both are really light weight to use even on Raspberry Pis:

```sh
#htop
sudo docker stats linkstack
#sudo docker prune
```

## Bento Portfolio as LinkinBio Alternative

There is the possibility to use **Bento Themes with Astro**:

1. For example, this astro bento portfolio, which I used with Github Pages for the web3 sample blog:

{{< cards cols="2" >}}
  {{< card link="https://github.com/IoTechCrafts/astro-bento-portfolio-ssg" title="Astro Bento Template">}}
  {{< card link="https://jalcocert.github.io/Web3/" title="Example of bento Portfolio - Web3 blog with Astro and Github Pages Setup" >}}
{{< /cards >}}

You can also have a look to:

2. https://github.com/tim-hub/techtim-astro-bento-portfolio


> I have forked this one here - https://github.com/JAlcocerT/techtim-astro-bento-portfolio

And you can use it by:

```sh
npm install

npm run dev
#npm run build

#rm -rf .git
```

Remember to tweak:

1. All content from `/public` and `/src/content` as per the original theme License
2. The `index.astro` file calls the individual components, like `../components/sections/AboutMe.astro`


<!-- 
libreportfolio.fyi
https://gitlab.com/fossengineer1/libreportfolio 
-->


{{< callout type="warning" >}}
Gitlab wont let you upload **>100mb individual files**
{{< /callout >}}

```sh
git ls-tree -r HEAD | grep f35b79d689c8cbc89c0fd03f04dd35d1aa198b6a

du -sh src/assets/memes/cable-rojo.gif

gifsicle --resize 480x480 --colors 64 --optimize=3 src/assets/memes/cable-rojo.gif -o src/assets/memes/cable-rojo-optimized.gif
```

--- 

## Interesting Posts

1. https://darko.io/posts/but-auth-is-hard

## Comercial bento

1. bento.me (owned by linktree)