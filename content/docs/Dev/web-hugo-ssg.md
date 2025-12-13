---
title: "Websites - HUGO"
draft: false
url: 'create-your-website-hugo-ssg'
type: docs
sidebar:
  open: false
---

Why bother with HUGO SSG?

Well, you just write markdown and when you get tired of a theme, you can just [change to another HUGO theme](https://fossengineer.com/changing-hugo-theme/) and keeping all your data as is: **flat files**.

Pretty awsome, ah?

This means that you wont have to worry about [databases](https://jalcocert.github.io/JAlcocerT/databases/), their [hosting](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/) neither their backup.

Well, I havent mentioned yet that *potentially*, you dont have to pay for [hosting these sites](#deploying-hugo-static-sites).


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg" title="Just SSG - Github ↗" icon="github" >}}
  {{< card link="https://books.jalcocertech.com" title="Create a DIY website with Astro" icon="tag" >}}
{{< /cards >}}

## HUGO Themes


New to SSGs and HUGO?

{{< callout type="info" >}}
See the [**101 HUGO** Guide](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/)
{{< /callout >}}


This is the typical file structure of a HUGO Theme:

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

### Blogs

1. https://github.com/statichunt/geeky-hugo

> MIT Geeky is a Personal Hugo blog theme focused on high speed. Geeky is fully responsive, Superfast, and powered by Bootstrap v5.

2. [Tweaked](https://github.com/JAlcocerT/JAlcocerT/tree/main/themes/hextra/layouts/blog) HUGO HEXTRA - This site!

{{< callout type="info" >}}
You can clone this HUGO site and run it locally [with HUGO v0.117](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/)
{{< /callout >}}

### Presentations with HUGO

1. https://github.com/joshed-io/reveal-hugo

{{< details title="What I like about RevealJS with HUGO 📌" closed="true" >}}

* You can combine HUGO with RevealJS to create [awsome presentations](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#slides-creation-agent)!
  * Similarly to what we can do with [**SliDev** - Example at MultiChat](https://jalcocert.github.io/JAlcocerT/create-streamlit-chatgpt/#a-multichat-with-streamlit)
  * HUGO + RevealJS - [Sample1](https://github.com/joshed-io/reveal-hugo), [Sample2](https://github.com/RealOrangeOne/hugo-theme-revealjs)

{{< /details >}}


> MIT | 📽️ Create rich HTML-based presentations with Hugo and Reveal.js

### Links

1. https://github.com/jpanther/lynx

> MIT | A simple links theme for Hugo built with Tailwind CSS.


---

## FAQ


### Deploying HUGO Static Sites

Select any of these [website deployment methods](https://jalcocert.github.io/JAlcocerT/create-your-website/#select-the-deployment-method)

For example, you can do **host HUGO for free** with [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/)

<!-- ![alt text](/blog_img/web/astro-gitlab-cloudflarepages.png) -->

{{< cards >}}
  {{< card link="https://fossengineer.com/alternatives-for-hosting-static-websites/" title="NGINX on VPS" image="/blog_img/selfh/hetzner-sharedcpu.png" subtitle="Free Static hosting vs VPS hosting" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cool-link-in-bios/#how-to-deploy-ssgs-link-in-bio/" title="Cloudflare x Gitlab" image="/blog_img/web/astro-gitlab-cloudflarepages.png" subtitle="Deploying Astro with CI/CD" >}}
{{< /cards >}}

See how easy is to deploy HUGO sites inside containers:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-hugo/" title="HUGO SSG Static Hosting | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### HUGO with Github Pages & CICD

Its very important to know the **HUGO Version** that makes the theme work.

Like when you are using [this sample Github Actions Workflow](https://github.com/JAlcocerT/JAlcocerT/blob/main/.github/workflows/pages.yaml).

{{< callout type="info" >}}
The workflow configures [the base path to work properly](https://github.com/JAlcocerT/JAlcocerT/blob/main/.github/workflows/pages.yaml#L57) as per your repo name
{{< /callout >}}

This Hextra Theme, as it is, for example, [runs fine with v0.117.0](https://github.com/gohugoio/hugo/releases/tag/v0.117.0):

```sh
hugo v0.117.0-b2f0696cad918fb61420a6aff173eb36662b406e+extended linux/amd64 BuildDate=2023-08-07T12:49:48Z VendorInfo=gohugoio
```

But **not with higher versions, like v0.124**.

{{< callout type="info" >}}
Dont forget to [Setup HUGO](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/) properly!
{{< /callout >}}


### HUGO Shortcodes

Shortcodes for HUGO are like components for Astro.

They help us provide interesting funcitonality to our themes.

So you create them once, and reuse forever.

1. If you are using HUGO, embed your images with [this **shortcode**](https://raw.githubusercontent.com/gohugoio/hugo/master/tpl/tplimpl/embedded/templates/shortcodes/figure.html)

2. You can also embed [GISTS with this shortcode](https://raw.githubusercontent.com/gohugoio/hugo/refs/heads/master/tpl/tplimpl/embedded/templates/shortcodes/gist.html)

**Remember** that shortcodes are `.html` files to be placed at `/themes/theme_name/layouts/shortcodes/gist_file.html`

Just use it like so in your markdown ,**example with the gist**:

```md
{{< gist "username" "gistID" "filename.js" >}}
{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - PayoutRatioEvolution.JPG">}}
```

* First parameter (jalcocert): This is the GitHub username or organization that owns the Gist.
* Second parameter (879fecd6ae9bccaa0175d1c180a032cd): This is the unique Gist ID.
* Third parameter ("RStocks - PayoutRatioEvolution.JPG"): This is the specific file within the Gist that you want to load.

3. You can also [bring cool charts](#mermaidjs-and-chartjs), thanks to shortcodes

4. Even bring mastodon info: https://magnus919.com/notes/embed-mastodon-shortcode/

5. Pull info from `.yml` into your `.md` posts with [such shortcode](https://jalcocert.github.io/JAlcocerT/cool-hugo-themes/#shortcode-to-parse-yml)

6. Bring audio via ttps://github.com/JAlcocerT/JAlcocerT/blob/main/layouts/shortcodes/audio.html as seen [here](https://jalcocert.github.io/JAlcocerT/interesting-apis/#11labs)

### MermaidJS and ChartJS

* https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/#charts-in-hugo
* https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/#mermaidjs

### Math with Katex

Katex is similar to Latex.

You can bring cool formulas to HUGo with Katex.

> See an example on this [HUGO Hextra post](https://jalcocert.github.io/JAlcocerT/making-soap-at-home/#the-chemistry-of-lye)

### Tweaking HUGO Themes

[**HUGO**](https://fossengineer.com/web-guide-Hugo/) is great.

The [HUGO **Setup**](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/) was the first SSG that I could get working back in the days.