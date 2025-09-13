---
title: "Journal via Astro and ToastUI Editor"
date: 2025-09-13T06:20:21+01:00
draft: false
tags: ["TOAST UI vs React md","WYSIWYG","NextJS"]
description: 'Do that SSG tweak once. Edit via UI with the NextJS powered JustJournalviaSSG.'
url: 'astro-journal-theme'
---


**Intro**

Cant we just have a simple way to add / modify posts from themes other people have created?

Kind of...a one time setup for tinkers.

People who dont mind cloning a hugo or astro theme.

But they just want to write later on via a cool UI.

I have just been trying to do that on the most post with a cool astro theme:

* https://github.com/moeyua/astro-theme-typography
    * https://github.com/JAlcocerT/astro-theme-typography
* https://jalcocert.github.io/JAlcocerT/nextjs-toast-ui-editor/


## Tech for Astro Editor via ToastUI

I decided to keep scope simpler and [start over](#how-to-create-just-journal-via-ssg).

I can vibe code again a NextJS app, that will be in the root of a repo:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Just-Journal-via-SSG" title="Scrapping" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

Then, as part of the environment variables, we will have the local path to one of our favourite hugo/astro themes.

And what this app will do, is to go and see that local path where the .md/.mdx are stored.

Just **local first** edits.


By using the react md (instead of ToastUI) we get a simpler:

![NextJS Reactmd editing astro sphere theme](/blog_img/web/nextjs-admin/journal-nextjs-admin-reactmd.png)



## Conclusions

**Using the journal**

```sh
git clone
```


Choose a cool astro theme text centered, like:

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
