---
title: "Hugo can also be cool"
date: 2025-08-05
draft: false
tags: ["Dev","SSG","Photo-Gallery","Flask CMS"]
description: 'Improving HUGO Themes'
url: 'cool-hugo-themes'
---


## Cool HUGO Themes

My favourite is still **hugo-theme-gallery**: https://github.com/nicokaiser/hugo-theme-gallery

I have used it for some projects:

As described here - https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/

{{< cards cols="1" >}}
  {{< card link="https://whilecyclingthere.web.app/" title="Cycling There Photo Gallery" >}}
  {{< card link="http://entreagujaypunto.com/" title="Portfolio Aguja&Punto" >}}
{{< /cards >}}

Here is my forked version of it (also **MIT**):

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="Chat with Data" image="/blog_img/biz/RE/RE-Calc.png" subtitle="Simple Real Estate calculator POST" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked" title="Hugo Theme Gallery Forked" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Hugo Gallery x Custom Flask CMS" >}}
{{< /cards >}}

I was playing a lot with this theme to make it more accesible:

* Via a Telegram Bot
* With some integration with Filebrowser

It was about time to vibe code something:

```sh
git clone https://github.com/JAlcocerT/hugo-theme-gallery-flasked
cd ./hugo-theme-gallery-flasked/exampleSite

# Install Hugo module
hugo mod get

# Pull example images from Unsplash
./pull-images.sh
```

If your go and hugo version allows: 
```sh
#hugo server
hugo server --bind="0.0.0.0" --baseURL="http://192.168.1.7" --port=1319
```

![HUGO Theme Gallery](/blog_img/web/hugo-theme-gallery.png)

```sh
make prod-build
make prod-up
```

> isn't it great?


I saw some people doing cool things:

* https://github.com/thuliteio/thulite
* https://github.com/thuliteio/doks

Which it seems to

### Flask for HugoThemeGallery



![Flask WebAPP x HUGO Theme](/blog_img/web/hugo-themegallery-flask.png)

> See the [FlaskCMS Post](https://jalcocert.github.io/JAlcocerT/make-cms/), where Im bringing few ways to edit live into a webapp

> > As I was tinkering also with the [SliDevCMS Post](https://jalcocert.github.io/JAlcocerT/make-slidev/)

As per the different options described here.

I went for the EasyMDE as GPT5 mentioned is the lightest weight.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked/blob/flask-hugo-gallery/flask_app/app.py" title="Flask x HUGO ↗" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked/blob/flask-hugo-gallery/markdown-edit-alternatives.md" title="Editing md from Flask | Alternatives explored for this vibe-coded WebApp ↗" >}}
{{< /cards >}}



## Saasify Theme

* https://github.com/chaoming/hugo-saasify-theme
* https://saasify-demo.chaoming.li/
* https://dev.to/chaoming/open-source-hugo-theme-for-building-saas-websites-saasify-3onj