---
title: "HUGO can also be cool"
date: 2025-08-04
draft: false
tags: ["Dev","SSG","Photo-Gallery","Flask CMS","Shortcode parsing","yml parsed to md"]
description: 'Improving HUGO Themes: Flasked x Theme Gallery, HUGO Doks Tweaks.'
url: 'cool-hugo-themes'
---


Time for a HUGO recap: *the [crazy fast SSG](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/)*

And to make some updates to:

1. [Entreagujaypunto](#entreagujaypunto-updates)
2. [EnjoyLittleThings](#enjoylittlethings-updates)
3. [FossEngineer](#fossengineer-updates)

## Cool HUGO Themes

My favourite is still **hugo-theme-gallery**: https://github.com/nicokaiser/hugo-theme-gallery

I have used it for some projects:

As described here - https://jalcocert.github.io/JAlcocerT/creating-photo-centric-blog-with-hugo/

{{< cards cols="1" >}}
  {{< card link="https://whilecyclingthere.web.app/" title="Cycling There Photo Gallery" >}}
  {{< card link="https://entreagujaypunto.com/" title="Portfolio Aguja&Punto" >}}
{{< /cards >}}

Here is my forked version of it (also **MIT**):

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="Python RE Calculator" image="/blog_img/biz/RE/RE-Calc.png" subtitle="Simple Real Estate calculator POST" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked" title="NEW - Hugo Theme Gallery Forked" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Hugo Gallery x Custom Flask CMS" >}}
{{< /cards >}}

I was playing a lot with this theme to make it more accesible:

* Via a [Telegram Bot](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#tg-bots)
* With some integration with Filebrowser...

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
#hugo
```

![HUGO Theme Gallery](/blog_img/web/hugo-theme-gallery.png)

```sh
make prod-build
make prod-up
```

> isn't it great?


I saw some people doing **cool things with HUGO Themes**

* https://github.com/thuliteio/thulite - They will be shipping paid TinaCMS integration [soon](https://thulite.io/anna/)
* https://github.com/thuliteio/doks

> “With Thulite, it’s super easy to build content-driven websites that are production-ready out of the box.”

* https://github.com/HugoRCD/canvas - *The creator name is HUGO though, but its a different framework*


### Flask for HugoThemeGallery

I decided to create a new branch to the HUGO Theme gallery and vibecode a little:

![Flask WebAPP x HUGO Theme](/blog_img/web/hugo-themegallery-flask.png)

> See the [FlaskCMS Post](https://jalcocert.github.io/JAlcocerT/make-cms/), where Im bringing few ways to edit live into a webapp

> > As I was tinkering also with the [SliDevCMS Post](https://jalcocert.github.io/JAlcocerT/make-slidev/)

As per the different options described here.

I went for the EasyMDE as GPT5 mentioned is the lightest weight.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked/blob/flask-hugo-gallery/flask_app/app.py" title="Flask x HUGO ↗" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked/blob/flask-hugo-gallery/markdown-edit-alternatives.md" title="Editing md from Flask | Alternatives explored for this vibe-coded WebApp ↗" >}}
{{< /cards >}}

And...this thing works:

- Edit `_index.md` or `index.md` via Flask WebApp, containerized at `hugo-flaskapp`
- Build the Hugo changes (THIS IS FAST) via UI 
- Visualize your hugo changed theme live with the `hugo_container` or via the serve built from `hugo-static-python`

It's all on the `flask-hugo-gallery` branch and this compose: https://github.com/JAlcocerT/hugo-theme-gallery-flasked/blob/flask-hugo-gallery/docker-compose-hugoflask.yml

```sh
git clone https://github.com/JAlcocerT/hugo-theme-gallery-flasked
#git clone -b flask-hugo-gallery --single-branch https://github.com/user/repo.git
cd hugo-theme-gallery-flasked/
```


```sh
git branch -a
git switch flask-hugo-gallery
```

And just **build + spin** the containers:

```sh
# Install Hugo module
hugo mod get

# Pull example images from Unsplash
./pull-images.sh

#make help

make hugoflask-build #to get go and hugo into a container
make hugoflask-up
#docker exec -it hugo-flaskapp sh
```

Add any photo, hit **Build Hugo** and you are done:

![alt text](/blog_img/web/WebsSnapshots/hugo-flask-build.png)

See the changes via: `localhost:5050`, `localhost:8089`, `localhost:1318`

## Saasify Theme

* https://github.com/chaoming/hugo-saasify-theme
* https://saasify-demo.chaoming.li/
* https://dev.to/chaoming/open-source-hugo-theme-for-building-saas-websites-saasify-3onj

## HUGO Doks

I had to fork the theme:

https://github.com/JAlcocerT/hugo-doks

> Which it reminds me a lot to Astro Starlight :)

See: https://docs.thulite.io/getting-started/


---

## Conclusions


### Theme Gallery + Flask

This superseeds the telegram bot thing that I plugged [here to the theme](https://github.com/JAlcocerT/EntreAgujayPunto/tree/main/TelegramBot) as per this [post](https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#tg-bots)

And the filebrowser + Hugo approach described [here](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/#filebrowser-x-hugo)

All that people wants is a simple UI to upload images with this kind of themes.

So why not doing so via Flask?

> This is my first try: https://github.com/JAlcocerT/hugo-theme-gallery-flasked

> > At some point...could UI be modifed via Flask as per Codex commands? Who knows...

### FossEngineer Updates

**PaperMod** has been great so far.

```sh
git clone https://gitlab.com/fossengineer1/fossengineerpapermod
cd fossengineerpapermod
hugo server
# Start building sites … 
# hugo v0.108.0-a0d64a46e36dd2f503bfd5ba1a5807b900df231d linux/amd64 BuildDate=2022-12-06T13:37:56Z VendorInfo=gohugoio

#                    | EN   
# -------------------+------
#   Pages            | 228  
#   Paginator pages  |  63  
#   Non-page files   |   0  
#   Static files     | 248  
#   Processed images |   0  
#   Aliases          |  45  
#   Sitemaps         |   1  
#   Cleaned          |   0  

# Built in 759 ms
```

The first HUGO Theme that I tried.

But I feel like I need now something more than a blog like theme for this project.

I like the doc feeling of **Hextra**.

#### Shortcode to parse YML

I was thinking on a way to have proper mantainance of the `docker-compose` on the posts.

As im just one, I thought to take help from others (and also take feedback).

Some kind of general readme would be fine, like: https://github.com/rokbenko/ai-playground/tree/main


{{< cards cols="1" >}}
  {{< card link="https://gitlab.com/fossengineer1/fossengineerpapermod/-/blob/main/layouts/shortcodes/includeyaml.html?ref_type=heads" title=" HUGO Shortcode | Parsing ymls into blog posts  ↗" >}}
{{< /cards >}}

This shortcode looks into `./assets/snippets` and just renders the content into the markdown post:

<!-- 
* `includeyaml "assets/snippets/it-tools/Dockerfile" linenos="true" #`
* `includeyaml path="assets/snippets/it-tools/Dockerfile" lang="dockerfile" #forcing a language` 
-->



#### FossEngineer x HomeLab

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="Home-Lab Public Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of several docker configs sorted by folder and ready for the HUGO theme" >}}
{{< /cards >}}