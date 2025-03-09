---
title: "How to use ASTRO [101] and make Stunning Websites"
date: 2024-09-07
draft: false
tags: ["Dev"]
summary: 'How to get started with Astro as SSG to create Webs. NPM & Node Setup.'
url: 'using-astro-as-website'
---

To use **ASTRO**, you just need **2 things**: NPM and NodeJS.

* https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
* https://nodejs.org/en/download/package-manager

> Why ASTRO? It builds sites **cool Websites**, taking **components** from here & there

{{< details title="Setup Node and NPM - x86/ARM64/ARM32 📌" closed="true" >}}

```sh
sudo apt update && sudo apt upgrade

#install NodeJS https://deb.nodesource.com/
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs
#FOR MAC #brew install node

# Verify installation
node -v   # Should show Node.js version - 20.18.1
npm -v    # Should show npm version - 10.8.2
```
{{< /details >}}

Now you can spin a server and make **ASTRO [Remote Development](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker)** in it.


---

If you want to be sure that **ASTRO works...**

1. See that you got the desired versions installed

```sh
node -v   # Should show Node.js version - 20.18.1
npm -v    # Should show npm version - 10.8.2
```

2. Clone **this Website** Repository and try to **run it locally**:

```sh
git clone https://github.com/JAlcocerT/web3 && cd ./web3

npm install
npm run dev
```

3. [optional] - Use [Astro within a Container](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/#node)

---



```sh
ifconfig
#ifconfig eth0 | grep -A 10 "<global>" #check mac, and transfered packages
ifconfig eth0 | grep "inet " | awk '{ print $2 }' #if ETH Connected - SEE THE LOCAL IP
#ifconfig tailscale0 | grep "inet " | awk '{ print $2 }' #for Tailscale
```

---

{{< callout type="info" >}}
You can use [Astro with Github Pages + GH Actions](https://github.com/JAlcocerT/web3/actions)
{{< /callout >}}

See **Interesting Astro Themes**.

Like AstroWind (which uses [Tailwind CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-css/#competitors-to-tailwind-css))

## Features for Astro Websites


{{< details title="Sitemap and Robots for Astro Themes 📌" closed="true" >}}

At `astro.config.mjs` you will need:

```js
import robots from "astro-robots";
import sitemap from "@astrojs/sitemap";

//....

integrations:[sitemap(), robots()],
```

{{< /details >}}



{{< details title="OpenGraph Photo, Tittle and Description for Main Site and Posts 📌" closed="true" >}}

The `og-image.jpg` image (or whatever you name your image file) should be placed directly in the `./public` directory at the root of your Astro project.

**Why the public directory?**

Static Assets: The public directory in Astro (and many other web frameworks) is specifically designated for static assets. These are files that are served directly to the browser without any processing by Astro.

Examples include:
Images (like your Open Graph image)
Favicons
robots.txt
sitemap.xml
Fonts

Direct URL Access: Files in the public directory are accessible directly via their path relative to the root of your website.

So, if you place og-image.jpg in public, it will be accessible at yourdomain.com/og-image.jpg (or localhost:3000/og-image.jpg during development).

This is precisely what we want for an Open Graph image, as social media platforms need to be able to fetch it directly.

Build process: during the build process, files located on the public folder are copied to the dist folder (output folder).

{{< /details >}}

{{< details title="MDX Blog Posts 📌" closed="true" >}}

At `astro.config.mjs` you will need:

```js
import mdx from "@astrojs/mdx";

//...

  integrations: [
    mdx({
      syntaxHighlight: "shiki",
      shikiConfig: {
        theme: "github-dark-dimmed",
      },
      gfm: true,
    })
  ],

//...
```


{{< /details >}}

{{< details title="Search Built in 📌" closed="true" >}}



{{< /details >}}


{{< details title="Multilanguage Support - i18N 📌" closed="true" >}}



{{< /details >}}
