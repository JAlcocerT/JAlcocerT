---
title: "Website knowledge updates"
date: 2025-10-05T10:20:21+01:00
draft: false
tags: ["just-ssg","Astro 101","Hugo 101","IG Gallery OSS","Komodo","Dev","BCMS vs PagesCMS"]
description: 'New ATH for my SSG knowledge. Landing Pages that convert.'
url: 'selling-with-a-landing-website'
---

**Tl;DR**

Last year I made couple of 101 guides for [HUGO](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/) and [ASTRO](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/).

But it was time to put cool components like this [ig gallery](https://github.com/JAlcocerT/real-estate-moi/blob/main/moirealestate-astro-theme/src/components/InstagramGalleryLocalFolder.astro) used [on this mdxhere](https://github.com/JAlcocerT/real-estate-moi/blob/main/moirealestate-astro-theme/src/content/property/beachfront-paradise-instagram-gallery.mdx)


**Intro**

Ok, ok, you have embraced the power of SSGs and aware of how many cool things can be done *,statically'* aka [in browser with CSR](https://jalcocert.github.io/JAlcocerT/csr-and-js/).

And surprisingly, [Front End can do many cool things, *including authentication*](https://jalcocert.github.io/JAlcocerT/front-end-and-auth/#whats-forward-auth)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg" title="Just SSG Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Making SSG look cool with shortcodes and components" >}}
{{< /cards >}}

There is one thing still stucked...

**How to make SSG edit friendly**?

Some WYSIWYG approach? 

Repurposing md note taking tools?

Or...giving a try to F/OSS CMS?

One more time, because I already gave a try to these from a [recent post](https://jalcocert.github.io/JAlcocerT/mailerlite-for-saas/#a-theme-to-test-this): [bcms](https://github.com/bcms/cms) and [pagescms](https://github.com/pages-cms/pages-cms)

This can be used to get [a cool ig like gallery](https://github.com/JAlcocerT/just-ssg/tree/main/astro-ssg/ig-gallery-folder) without importing each file independently, just the folder where they are saved:

![IG Gallery astro and jsx for beyondajourney](/blog_img/web/udf/ig-gallery-beyondajourney.png)

```mdx
<GalleryLocalFolder
  folder="content/articles/exploring-netherlands-by-bike/imgs"
  initialLoadCount={6}
/>
```

Place those youtube videos:

```mdx
<div style="display: flex; justify-content: center;">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/hj0MfciILEc" title="Vistula near Kazimierz Dolny Video" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>
```

---

## Conclusions

If you are building software, check: https://github.com/moghtech/komodo#screenshots

> GPl3.0 |  🦎 a tool to build and deploy software on many servers 🦎 


---

## FAQ

### SSG Setup Installs

For Astro, see: https://stateofjs.com/en-US

```sh
#sudo apt install npm #this is ~180mb, but it will be an older version

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install --lts

node --version
npm --v
```

For HUGO, based in GO:

```sh
hugo version
```

> Be mindful about HUGO extended versions for some themes to work!

#### Testing SSG Themes Locally

```sh
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/

time npm run build

#npm install -g http-server
#http-server ./dist

#cd ./dist
#python3 -m http.server 8009

#npm run build
#npx serve -s dist
#rm -rf .git
```

```sh
#hugo server 
hugo server --bind="0.0.0.0" --baseURL="http://192.168.1.106" --port=1319
```


#### SSG with Containers

To put astro/hugo inside a container is as simple as: *and you can also develop in this way, inside a container, without installing node/hugo/whatever:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ssg-hugo" title="HUGO SSG Selfhosted | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ssg-astro" title="Astro SSG Selfhosted | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}
