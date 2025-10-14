---
title: "Journal via Astro and markdown Editors"
date: 2025-09-13T06:20:21+01:00
draft: false
tags: ["TOAST UI vs React md","WYSIWYG","Local Edits","NextJS","JustJournalviaSSG"]
description: 'Do that SSG tweak once. Edit via UI, NextJS empowers your to journal via SSGs.'
url: 'astro-journal-theme'
---


**Tl;DR**

I created a simple NextJS app the visualizes `.md` files in folders and let you edit them via React md with a UI.

Changes are reflected locally.

**Intro**

Cant we just have a simple way to add / modify posts from themes other people have created?

Kind of...a one time setup for tinkers.

People who dont mind cloning a hugo or astro theme.

But they just want to write later on via a cool UI.

I have just been trying to do that on the most post with a cool astro theme:

* https://github.com/moeyua/astro-theme-typography
    * https://github.com/JAlcocerT/astro-theme-typography
* https://jalcocert.github.io/JAlcocerT/nextjs-toast-ui-editor/


## Tech for SSG Editor

I decided to keep scope simpler and [start over](#how-to-create-just-journal-via-ssg).

I can vibe code again a NextJS app, that will be in the root of a repo:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Just-Journal-via-SSG" title="NEW - Just Journal via SSG" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for a NextJS app with Reactmd UI editor for posts" >}}
{{< /cards >}}

Then, as part of the environment variables, we will have the local path to one of our favourite hugo/astro themes.

And what this app will do, is to go and see that local path where the .md/.mdx are stored.

Just **local first** edits.

Cursor decided to use the [react md](https://www.npmjs.com/package/react-markdown) (instead of ToastUI) we get a simpler: https://www.npmjs.com/package/react-markdown

![NextJS Reactmd editing astro sphere theme](/blog_img/web/nextjs-admin/journal-nextjs-admin-reactmd.png)


---

## Conclusions

Its possible to do this.

Spin the NextJS app, clone any astro theme.

Let their `.md` or `.mdx` be updated locally via UI:

![Journal with SSG edited via NextJS and ToastUI](/blog_img/web/nextjs-admin/journal-nextjs-admin-clonethemes.png)

**Using the journal**

```sh
git clone https://github.com/JAlcocerT/Just-Journal-via-SSG
#clone one of the repos below inside ./ssg-themes
make setup
make ssg-dev
```


Choose a cool astro theme text centered, like: https://www.astrothemes.dev/category/blog/

* https://github.com/moeyua/astro-theme-typography

* https://github.com/markhorn-dev/astro-sphere

> MIT | Astro Sphere is a static, minimalist, lightweight, lightning fast portfolio and blog.

```sh
git clone https://github.com/markhorn-dev/astro-sphere
#npm install
#npm run dev
```

* https://github.com/markhorn-dev/astro-nano

> MIT | Astro Nano is a static, minimalist, lightweight, lightning fast portfolio and blog.

* https://github.com/CaiJimmy/hugo-theme-stack

> GPL3.0 | Card-style Hugo theme designed for bloggers

```sh
git clone https://github.com/CaiJimmy/hugo-theme-stack
#hugo server --bind="0.0.0.0" --baseURL="http://192.168.1.8" --port=1319
```

```sh
npm install -g http-server
http-server dist #http-server .vercel/output/static
```

**you might need clean up**

```sh
docker system prune -a --volumes
```


---

## FAQ

### How to create Just-Journal-via-SSG

```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Starting journal via ssg"

#sudo apt install gh
gh auth login
gh repo create Just-Journal-via-SSG --private --source=. --remote=origin --push
```