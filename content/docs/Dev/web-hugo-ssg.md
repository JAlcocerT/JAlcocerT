---
title: "HUGO Websites"
draft: false
url: 'create-your-website-hugo-ssg'
type: docs
sidebar:
  open: false
---

Why bother with HUGO SSG?

Well, you just write markdown and when you get tired of a theme, you can just [change to another HUGO theme](https://fossengineer.com/changing-hugo-theme/) and keeping all your data as is, flat files.

Pretty awsome, ah?

Well, I havent mentioned yet that *potentially*, you dont have to pay for [hosting these sites](https://fossengineer.com/alternatives-for-hosting-static-websites/).

{{< callout type="info" >}}
New to SSGs and HUGO? See the [**101 HUGO** Guide](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/)
{{< /callout >}}

## HUGO Themes

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

{{< callout type="info" >}}
You can do **host HUGO for free** with [Github Pages](https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/)
{{< /callout >}}

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

1. If you are using HUGO, embed your images with [this **shortcode**](https://raw.githubusercontent.com/gohugoio/hugo/master/tpl/tplimpl/embedded/templates/shortcodes/figure.html)

2. You can also embed [GISTS with this shortcode](https://raw.githubusercontent.com/gohugoio/hugo/refs/heads/master/tpl/tplimpl/embedded/templates/shortcodes/gist.html)

**Remember** that shortcodes are `.html` files to be placed at `/themes/theme_name/layouts/shortcodes/gist_file.html`

Just use it like so in your markdown ,**example with the gist**:

` {{< gist "username" "gistID" "filename.js" >}} `
` {{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - PayoutRatioEvolution.JPG">}} `

* First parameter (jalcocert): This is the GitHub username or organization that owns the Gist.
* Second parameter (879fecd6ae9bccaa0175d1c180a032cd): This is the unique Gist ID.
* Third parameter ("RStocks - PayoutRatioEvolution.JPG"): This is the specific file within the Gist that you want to load.

3. You can also [bring cool charts](#mermaidjs-and-chartjs), thanks to shortcodes

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

{{< details title="How to add `ads.txt` to a HUGO Website 📌" closed="true" >}}

1. **Create an `ads.txt` file** in your Hugo project’s `static` directory. The `static` folder in Hugo is where you put any files you want to be copied directly to the root of your build output.

2. **Add your content** to the `ads.txt` file:

```txt
google.com, pub-123456, DIRECT, abcdef123456
```

3. **Build your Hugo site**:

4. **Verify the output** by checking the `public` directory (Hugo's default output folder). You should find the `ads.txt` file in the root of `public`:

5. **Deploy your site** as usual. The `ads.txt` file should now be available at `https://yourdomain.com/ads.txt`. 

This method ensures that `ads.txt` is part of your site’s root directory in the final build output, as required by ad networks.

![HUGO adsense txt](/blog_img/web/ads-txt-public-hugo.png)

{{< /details >}}