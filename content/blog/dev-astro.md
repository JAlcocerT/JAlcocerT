---
title: "How to use Astro Web Templates"
date: 2024-09-03T23:20:21+01:00
draft: true
tags: ["Dev"]
summary: 'How to get started with a free Astro Template'
url: 'using-astro-templates'
---

## Astro Websites 101

{{% steps %}}

### Find the Theme Source Code

Github is a good starting point.

### Clone it

Make sure you are free to use the theme as per its License and then **clone it**:

```sh
git clone https://github.com/Ruben-Winant/astro_spark_template ./astro_template #it has a cool carousel!
cd ./astro_template
rm -rf .git #remove existing git
```

### Try the Theme

```sh
npm run build
npm run dev
```

> Explore the results at: `localhost:4321`

{{% /steps %}}

{{< details title="Good Practices for Web Repositories📌" closed="true" >}}

* Add a gitignore and include the `node_modules` folder

```
node_modules
```

* Add a docker ignore if you plan to build images:

```
#add .env files if any
```

{{< /details >}}

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Resources to Create Cool Websites" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/" title="Astro Components 101" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/wordpress-migration-to-ssg/" title="Wordpress to SSG" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/guide-web3/" title="Web 3 with Astro" >}}
{{< /cards >}}



{{< details title="More about Web3 with Cloudflare Web3 Gateways📌" closed="true" >}}

* [Web3 and Cloudflare Web3 Gateways Walkthrough](https://www.youtube.com/watch?v=Ws3KBleauMI)

Web3 architecture represents a revolutionary shift in how we interact with the internet. It offers a decentralized, peer-to-peer alternative to the current centralized web. At the foundation of Web3 architecture is **blockchain technology**, providing a secure, transparent, and tamper-proof way of recording transactions and data. This layer is critical to Web3’s ability to enable **trustless** and **permissionless** user interactions. Web3 is not just a technological change—it’s a revolution, and it needs your help to build it.

However, Web3 is more than just the blockchain layer. It includes a **protocol layer** that enables decentralized storage, messaging, and other key functions required for a fully decentralized web. On top of these foundational layers, developers create **decentralized applications (dApps)** that leverage Web3 architecture to run without relying on centralized systems. 

If you're not sure how to build dApps, don’t worry! Join us to learn more and become part of this emerging movement.

- The **foundation** of Web3 architecture.
- The **protocol layers** that enable decentralized storage, messaging, and other essential functions.
- How to build **decentralized applications (dApps)** that run on Web3 architecture.




{{< /details >}}


You will have a similar project structure to:

{{< filetree/container >}}
  {{< filetree/folder name="content" >}}
    {{< filetree/file name="_index.md" >}}
    {{< filetree/folder name="docs" state="closed" >}}
      {{< filetree/file name="_index.md" >}}
      {{< filetree/file name="introduction.md" >}}
      {{< filetree/file name="introduction.fr.md" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
  {{< filetree/file name="hugo.toml" >}}
{{< /filetree/container >}}


---