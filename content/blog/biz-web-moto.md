---
title: "A website for a Moto Blogger"
date: 2025-02-23T19:20:21+01:00
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

3. Install **firebase CLI** - in windows that means pasting the `.exe` to the repo folder and adding it as gitignore to avoid pushing it to the repo
4. Install npm firebase package


{{< details title="Google Firebase Setup 📌" closed="true" >}}

Using **Firebase Free Tier Hosting**

```sh
#npm install -g firebase-tools

firebase login
firebase init
#firebase projects:list
```

> As seen during [this project](https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/)

![Firebase Free Tier Limits](/blog_img/web/success5-aga/FirebaseHosting-FreeTier-Limits.png)

And to have the my domain linked...

Went to [firebase UI](https://console.firebase.google.com/) -> Compilation -> hosting.

Add a custom domain.

Select my subdomain, and added a **CName + TXT record to the DNS**.

![Firebase Custom Domain](/blog_img/web/success5-aga/firebase-own-domain.png)

For that domain, Im using cloudflare - so made sure that its **DNS only and not proxied records**

{{< /details >}}


5. Do the one time Firebase Project setup: `.\firebase init`

**Why firebase and not cloudflare?**

Just using Google account was enough after accepting firebase T&C's.

![Firebase Custom Domain](/blog_img/web/Firebase/firebase-auth.png)

![Firebase Custom Domain](/blog_img/web/Firebase/firebasedeploy-gha.png)

![Firebase Custom Domain](/blog_img/web/Firebase/firebase-gha-auth.png)

![Firebase Custom Domain](/blog_img/web/Firebase/firebase-gha-auth2.png)


And...thats all the one time things required.

**In a nutshell,** from now on, just these **3 commands** are enough:

```sh
npm run dev #to see locally the changes
npm run build #to render the site to /dist
firebase deploy #to push dist to proyectorutasmoto.web.app
```

> There you go: https://proyectorutasmoto.web.app/


**Next steps** - To link a **custom domain** and to not forget to sync it to github for a free code backup!

<!-- 
https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/

![HUGO Theme Gallery Carbon](/blog_img/web/success5-aga/photogallery-hugo-whilecyclingthere-carbon.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/" title="SSGs are Crazy Efficient" image="/blog_img/web/success5-aga/photogallery-hugo-whilecyclingthere-carbon.png" subtitle="See how this other HUGO Gallery Project was delivered" method="Resize" options="600x q80 webp" >}}
{{< /cards >}}

## Outro

I encouraged this person to also do somethign with his awsome action camera content.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/" title="Some video tricks" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#video-workflow" title="Video Edition Post" icon="book-open" >}}
{{< /cards >}}