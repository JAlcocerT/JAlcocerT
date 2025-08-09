---
title: "Interacting with SSGs and md via Flask"
date: 2025-08-09
draft: false
tags: ["Astro x Flask","PocketBase"]
description: 'Markdown and FlaskCMS that works for Mental Health and Real Estate'
url: 'making-flask-cms-for-ssg'
---


Because of the makereadme project and this [related post](https://jalcocert.github.io/JAlcocerT/make-slidev/)

I got to know about: *its possible to edit md from webapps!*

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

Last year I was doing a custom website via astro as covered on these:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docplanner-web-migration//" title="Morita x DocPlanner Web proposal" image="/blog_img/web/WebsSnapshots/Web_Nevin.png" subtitle="Mental Health Astro Web Creation | POST" >}}
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

Now, **lets do some Flask** with GPT5:

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

But this time Windsurf just made its own and quick way of editing files:

![alt text](/blog_img/web/morita-flask/flask-md-editor.png)

Which works and affects the local markdown files at `./src/content/work/*.md`

So...for now thats not bad at all!

And the goals/implementation/limitations/possible next steps are [here](https://github.com/JAlcocerT/morita-astroportfolio-flasked/blob/main/flask-md-edit.md)


Lets put the flask functionality into containers:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Python_apps" title="Morita Web v2 - Source Code Y25" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro x Flask CMS" >}}
  {{< card link="https://github.com/JAlcocerT/morita-astroportfolio-flasked" title="Morita Web v2 - Source Code Y25" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Astro x Flask CMS" >}}
{{< /cards >}}

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/Python_apps" title="Python Apps | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/morita-astroportfolio-flasked/blob/main/docker-compose-flask.yml" title="The Project Flask Docker-compose.yml  ↗" >}}
{{< /cards >}}




And quickly check that it works:

```sh
docker compose -f docker-compose-flask.yml build

docker run --rm -d --name flask-cms \
  -p 5050:5050 \
  -e CONTENT_DIR=/app/src/content \
  flask-cms sh -lc "uv run app.py"
```

Aaaall good on `localhost:5050`

But I got to know that **using gunicorn** is better when the webapp has to bring concurrency of users among other details that you can read [here](https://github.com/JAlcocerT/morita-astroportfolio-flasked/blob/main/gunicorn.md).

So remember to do `uv add gunicorn` and `uv sync`.

uv run app.py:
Flask’s built-in dev server.
Single-process, auto-reload, debugger.
Not hardened for production.

gunicorn app:app:
Production WSGI server.
Multiple workers/threads, timeouts, graceful restarts.
Better throughput and robustness.

Then rebuild and:

```sh
docker run --rm -d --name flask-cms \
  -p 5050:5050 \
  -e CONTENT_DIR=/app/src/content \
  flask-cms sh -lc "uv run gunicorn app:app -b 0.0.0.0:5050 --workers 2 --threads 4 --timeout 60"
```

We are good to move forward.

Lets create the `docker-compose` for the flask web and just sping it via make:

```sh
make flask-up
#curl -fsS http://127.0.0.1:5050/api/list 
```

The curl command should return you the list of folders, as part of the healthcheck of the compose.

With that ready, next step is to add some custom login.

As this is a one person app, Ill go the user/password way: this time, using [pocketbase](#flask-x-pocketbase)

### Flask x PocketBase

I was put in front of PB *quite recently* as I covered [here](https://jalcocert.github.io/JAlcocerT/pocketbase-redux/).

And I could not wait to try this combination!

> I asked windsurf for some architectural help on how to get PB to be the one dictating who logs in and who does not as per [this project doc](https://github.com/JAlcocerT/morita-astroportfolio-flasked/blob/main/pb-flask.md)

So we will get a Flask Container + PB Container: *you could also vibe code a simpler auth with just Flask, as Ill do for this [RE tweaks](#real-estate)*

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev/BaaS/PB" title="PB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/morita-astroportfolio-flasked/blob/main/docker-compose-flask.yml" title="PB Docker-compose.yml in the project ↗" >}}
{{< /cards >}}

> I didnt manage to create the initial admin and pass programatically

![SelfHosting PocketBase](/blog_img/dev/PB/selfh-pb.png)

> > Just create your admin: `localhost:8080/_/` and lets move forward


But anyways:

```sh
make pb-build
make pb-up
```

Will get your PB container spinned and waiting for your flask user creation.

Now we needed a script to create the user of the flask app (the ones who can get authenticated):

```sh
PB_ADMIN_EMAIL=you@example.com \
PB_ADMIN_PASSWORD=change-me-strong \
uv run scripts/create_user.py --email new.user@example.com --password change-me-strong
```

Or better, via Make:

```sh
cp .env.sample .env #adapt the .env with the PB admin credentials and url
source .env

make pb-create-user
```


```sh
#uv run app.py
make flask-up #in case that you stopped the flask container
```

And now you can go to `localhost:5050/` and see that you get redirected to: `localhost:5050/login`

![Flask UI Login as per PocketBase user collectio](/blog_img/web/morita-flask/flask-login-pb.png)

Via CLI, these wont get you a 200 now, as we cant access them without being one of the registered users under PB collection `users`:

```sh
curl -I http://localhost:5050/
curl -I http://localhost:5050/api/list
```

```
HTTP/1.1 302 FOUND
Server: Werkzeug/3.1.3 Python/3.12.10
Date: Sat, 09 Aug 2025 20:18:55 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 199
Location: /login
Vary: Cookie
Connection: close
```

Those two (Flask and PB) are working together pretty nicely!


All plugged, with the other 2 node containers for Astro as per `docker-compose.yml`:

```sh
make stack-up #spins flask + pb + dev astro
```

When done editing:

```sh
npm run build
#docker compose -f docker-compose.yml logs -f astro-prod
make web-prod-up
```

From this point, you have to ways forward:

1. Spend time to put billing with [stripe](#flask-x-stripe)
2. Spin the stack publically with [https via Traefik setup](#traefik-x-vps) or just do a quick view at your [homelab with CF tunnels](#mental-health)

### Flask x Stripe

This is going to be a one time thing.

Still, I wanted to try the integration: *has an user paid, or not really?*

I have been messing around with Stripe as per:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#stripe" title="Stripe API | Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#stripe-x-logto" title="Stripe x Logto | Post ↗" >}}
{{< /cards >}}


### Traefik x VPS

Time to share this with the public.

Get some VPS and authenticate your github: https://github.com/settings/keys `Add new SSH Key`

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Take the output of this:

```sh
cat ~/.ssh/id_ed25519.pub #paste it int gh UI
```

And just:

```sh
ssh -T git@github.com
#Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
#Hi JAlcocerT! You've successfully authenticated, but GitHub does not provide shell access.
```

And time to bring yet one more container: **Traefik** for those https and stuff


---

## Conclusions

### Mental Health


```sh
git clone git@github.com:JAlcocerT/morita-astroportfolio-flasked.git
cd morita-astroportfolio-flasked

make stack-up
```

You will have to:

1. Go to `192.168.1.11:8080/_/` to create that pb admin user/pass.

2. Create the user who can use the app

```sh
cp .env.sample .env #adapt the .env with the PB admin credentials and url
source .env

#make pb-create-user #in case that you have not synced the PB data
```

3. Login to Flask via `192.168.1.11:5050`
4. See live changes to astro via `192.168.1.11:4321`

How about the https?

If you havent gone the Traefik v3.3 way.

You can still just plug/attach your flask container to the **CF tunnel network**

```sh
#docker network ls | grep cloudflared_tunnel
docker network connect cloudflared_tunnel flask-cms #connect

#verify
#docker inspect flask-cms --format '{{json .NetworkSettings.Networks}}' | jq
```

> You can also connect flask to the existing CF network via docker-compose!

>> Dont forget to go to CF UI: `Zero Trust` -> `Networks` -> `Tunnels` -> `Public Hostnames`

![alt text](/blog_img/web/morita-flask/flask-cf-ui.png)

And we are good to go!

![FlaskCMS for Mental health Astro portfolio theme working via CF tunnel](/blog_img/web/morita-flask/https-flask-cf.png)

### Real Estate


```sh
git clone https://github.com/JAlcocerT/real-estate-moi
```