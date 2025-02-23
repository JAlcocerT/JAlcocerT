---
title: "A website for a Moto Blogger."
date: 2025-02-23
draft: false
tags: ["dev"]
description: 'Creating a website for a moto blogger. Or how to make two websites during a morning.'
url: 'web-for-moto-blogger'
---


## Moto Blogger Setup

My friend wanted to have the following **Astro theme**:

The **theme** - https://github.com/Boston343/horizon
<!-- 
https://github.com/JAlcocerT/horizon
https://github.com/JAlcocerT/ProyectoYosu
https://github.com/Boston343/horizon -->

> Original (and fantastic) job was done by https://github.com/Boston343/horizon and released under GPL3.0

There was a Windows setup in between, so...

...the setup took just a little bit more clicks than in linux:

1. Install node and npm (nodejs.org and docs.npmjs.org)
2. Install git and vscode
3. Install firebase CLI - in windows that means pasting the .exe to the repo folder and adding it as gitignore
4. Install npm firebase package
5. Do the one time Firebase Project setup: `.\firebase init`

Why firebase and not cloudflare?

Just using Google account was enough after accepting firebase T&C's.

And...thats all the one time things required.

**In a nutshell,** from now on, just these **3 commands** are enough:

```sh
npm run dev #to see locally the changes
npm run build #to render the site to /dist
firebase deploy #to push dist to proyectorutasmoto.web.app
```

> There you go: https://proyectorutasmoto.web.app/


Next steps - To link a custom domain and to not forget to sync it to github for a free code backup!