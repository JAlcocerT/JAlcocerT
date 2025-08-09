---
title: "Interacting with SSGs and md via Flask"
date: 2025-08-08
draft: false
tags: ["Entrep","Astro x Flask","PocketBase"]
description: 'Markdown and a FlaskCMS that works.'
url: 'making-flask-cms-for-ssg'
---


Because of the makereadme and this post

I got to know about:

* https://github.com/sparksuite/simplemde-markdown-editor

* https://github.com/pandao/editor.md

> MIT | EasyMDE: A simple, beautiful, and embeddable JavaScript Markdown editor. Delightful editing for beginners and experts alike. Features built-in autosaving and spell checking.

* https://github.com/nhn/tui.editor
  * https://ui.toast.com/tui-editor

> MIT | 🍞📝 Markdown WYSIWYG Editor. GFM Standard + Chart & UML Extensible.



{{% details title="About SimpleMDE, editormd, toast UI editor... 🚀" closed="true" %}}

We dont want to embed the Front Matter application itself, but rather replicate the user experience of having a powerful Markdown editor with a frontmatter UI within your Flask app.

How you can build a Flask web app with an editor like Front Matter CMS:

**The Core Components**

To achieve this, you'll need to combine a few key technologies:

  * **Flask:** The Python web framework to handle the backend logic.
  * **A Frontend Markdown Editor:** This is the most crucial part. You'll need a robust, JavaScript-based Markdown editor that you can embed in your web pages. This will provide the real-time preview and editing features you're looking for.
  * **A Backend for File Handling:** Your Flask routes will need to handle saving the content from the editor to your file system.
  * **A "Frontmatter" Interface:** You'll build a simple form or a more integrated UI to let users edit the metadata (title, date, slug, etc.) that goes into the YAML frontmatter block.


**For the Markdown Editor**

You have several excellent options for a client-side Markdown editor. These libraries provide the visual interface, the live preview, and often more advanced features like image uploads.

  * **[SimpleMDE](https://github.com/sparksuite/simplemde-markdown-editor)** or its successor, **[EasyMDE](https://github.com/Ionaru/easy-markdown-editor):** These are popular, lightweight, and easy-to-integrate Markdown editors. They have a clean interface and are a great starting point.
  * **[Editor.md](https://pandao.github.io/editor.md/):** A more feature-rich editor that's also popular. It's known for its extensive functionality, including image uploads and full-screen mode.
  * **[Toast UI Editor](https://github.com/nhn/tui.editor):** A modern, powerful editor that supports both Markdown and WYSIWYG modes. It's used in many projects and provides a great user experience.

**For Flask Integration**

  * **Flask extensions:** Many of these JavaScript editors have a corresponding Flask extension that makes integration a breeze.
      * **[Flask-SimpleMDE](https://flask-simplemde.readthedocs.io/en/latest/):** An extension for SimpleMDE.
      * **[Flask-MDEditor](https://pypi.org/project/Flask-MDEditor/):** An extension for Editor.md.
      * **[Flask-MDE](https://github.com/bittobennichan/Flask-MDE):** Another good option for integrating a Markdown editor.
  * **Parsing Markdown and Frontmatter:** On the backend, you'll need a Python library to read and process the Markdown files.
      * **`python-frontmatter`:** This library is perfect for your use case. It can parse a Markdown string, separating the YAML frontmatter from the content body.
      * **`Flask-FlatPages`:** This extension provides a more complete, but opinionated, solution for building a file-based CMS with Flask. It automatically handles reading and parsing Markdown files with frontmatter, making it a good choice for a blog or documentation site.


This approach gives you a complete, file-based CMS with a rich, client-side editing experience that feels very much like using Front Matter CMS, but fully integrated into your Flask application.

{{% /details %}}


The idea:

1. Take a SSG Theme
2. Get the main page stuff configurable via `.env`
3. Give possibility to easy add/edit/remove the posts


## Astro x Flask

Last year I was doing a custom website via astro as covered:


![Sample Web Result](/blog_img/web/WebsSnapshots/Web_Nevin.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docplanner-web-migration//" title="Chat with Data" image="/blog_img/biz/RE/RE-Calc.png" subtitle="Simple Real Estate calculator POST" >}}
  {{< card link="https://github.com/JAlcocerT/morita-web" title="Morita Web v1 - Source Code Y24/5" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro" >}}
{{< /cards >}}


> It was all thanks to the awsome [**Astro Portfolio** example](https://github.com/withastro/astro/tree/main/examples/portfolio)

> > And I vibecoded couple of extra goodies, like: [whatsapp bouble](https://github.com/JAlcocerT/WebifAI/blob/main/Astro-Themes/morita-web/src/components/TelegramBubble.astro) and [TG bouble](https://github.com/JAlcocerT/WebifAI/blob/main/Astro-Themes/morita-web/src/components/WhatsappBubble.astro) as covered [here](https://jalcocert.github.io/JAlcocerT/ghost-cms-for-astro/#why-that-much-love-to-astro)


```sh
git clone https://github.com/JAlcocerT/morita-web
cd morita-web

# DANGER: this deletes all repo history locally
rm -rf .git
```



{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/morita-astroportfolio-flasked" title="Morita Web v2 - Source Code Y25" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro x Flask CMS" >}}
{{< /cards >}}


You can just do:

```sh
npm install
npm run dev -- --host 0.0.0.0 --port 4321
```

And see that the theme still works.

But lets apply some new good practices: **Makefile first** as readme.md can get out-dated

Local Dev:

```sh
make local-install
make local-dev
npm run dev -- --host 0.0.0.0 --port 4321

make local-build
```

Via containers:

```sh
web-containers-up
#sudo docker compose -f docker-compose.yml down
```

That will sping 2 node containers: 

* One for the astro dev, [this one](https://github.com/JAlcocerT/Docker/blob/main/Web/SSGs/Astro/docker-compose.yml#L33)
* Another for astro prod (which serves the built files at `./dist`)

Ok, so what it worked before still works.

Great.

Now, lets do some Flask with GPT5:

```sh
make local-flask-install
make local-flask
```

> And now you will get the ewb app into `localhost:5050` and from any home device as well

![alt text](/blog_img/web/morita-flask/flask-ui1.png)

Famous last words: *can you make it look cooler?*

![alt text](/blog_img/web/morita-flask/flask-ui2.png)

> The `app.py` tech explanation is [here](https://github.com/JAlcocerT/morita-astroportfolio-flasked/blob/main/flask.md)


Not bad.

Now, how about the edit?

From the recent [HUGO Theme Gallery x Flask](https://jalcocert.github.io/JAlcocerT/cool-hugo-themes/), I got this info from [gpt5 about web app flask editing.](https://github.com/JAlcocerT/hugo-theme-gallery-flasked/blob/flask-hugo-gallery/markdown-edit-alternatives.md).

But this time Windsurf just made its own and quick way of editing files.

Which works and affects the local markdown files at `./src/content/work/*.md`

So...for now thats not bad at all!

And the goals/implementation/limitations/possible next steps are [here](https://github.com/JAlcocerT/morita-astroportfolio-flasked/blob/main/flask-md-edit.md)




### Flask x PocketBase

I was put in front of PB quite recently as I covered [here](https://jalcocert.github.io/JAlcocerT/pocketbase-redux/).

And I could not wait to try this combination!

So we will get a Flask Container + PB Container:

https://github.com/JAlcocerT/Docker/tree/main/Dev/BaaS/PB

That are working together.

All plugged with the other 2 node containers for Astro.


### Flask x Stripe

This is going to be a one time thing.

Still, I wanted to try the integration.


### Traefik x VPS

Time to share this.

And time to bring yet one more container: **Traefik** for those https and stuff