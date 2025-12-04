---
title: BiP
type: docs
prev: /docs/android/
next: docs/
draft: false
---

For the ones who like to **B**uild **i**n **P**ublic.

## AI

If you are one of those entrepreneurs who has managed to learn how to code:

Chances are that you are using AI/vibe coding techniques to build your next product.


### Initial Prompts for Success



{{< details title="Vibe Coding a Modern Landing Page x Shadcn x AuthJS | Setup  📌" closed="true" >}}

Go to whatever LLM you are using and ask: `do you think that these requirements are clear enough?`

```md
Create a Landing Page based on NextJS with a cool and modern UI

There will be a login button that directs to `/login` from which via better-auth and a sqlite with a unique username and password provided as per .env that is the one who can access the `/admin`

Include a `dockerfile` and `docker-compose.yml` that will control the title, description, open-graph image, favicon location and other global website variables via environment variables.

Create also a makefile with the following commands:

* `make help` - Show available commands
* `make install` - Prepare the dependencies for local development
* `make dev` - Run development server
* `make container` - Build and Run in Docker container
```

> This time I was more specific than others on the [UI, with **MUI** ](https://jalcocert.github.io/JAlcocerT/blog/dev-web-code-css/#material-ui---mui)

> > Also, [MIU has now its llm.txt](https://mui.com/material-ui/llms.txt)

Then go to [AntiGravity IDE](#antigravity-ide) and ask if the `brd.md` refined already with Gemini is clear enough.

If it is clear define the `z-development-plan.md` and proceed with the development phases.

```sh
# git init
# git branch -m main
# git config user.name
# git config --global user.name "JAlcocerT"
# git config --global user.name
# git add .
# git commit -m "Initial commit: Starting simple make podcast platform"

#sudo apt install gh
gh auth login
#gh repo create make-podcast --private --source=. --remote=origin --push
    
git init && git add . && git commit -m "Initial commit: simple landing website" && gh repo create make-landing --private --source=. --remote=origin --push
```

{{< /details >}}


https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#tc-and-privacy

![Terms and Conditions / Privacy](/blog_img/entrepre/webify/flask-terms-privacy.png)


## BiP Examples

With all that clear, how about some examples?

Even [a simple waiting list](https://github.com/JAlcocerT/simple-waiting-list) counts:  

![CapJS + NextJS Working as a Simple Waiting List](/blog_img/dev/nextjs/capjs-nextjs-pow.png)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing" title="Waiting to Landing Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of the BiP waiting2landing concept" >}}
{{< /cards >}}

Bringing leads towards your sales pipeline is one of the crucial steps to succeed as an entrepreneur:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/micro-saas/#creating-a-quick-landing" title="NEW - Make landing" image="/blog_img/shipping/make-landing2.png" subtitle="Landing Page x TailWind x VanillaJS x email to SQLITE" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-create-a-waiting-list/#ssg-astro-waiting-list" title="NEW - Make landing" image="https://raw.githubusercontent.com/JAlcocerT/waiting-to-landing/main/screens/demoLight.webp" subtitle="Creating the Waiting2Landing Concept x Formbricks" >}}
{{< /cards >}}


Even your agentic IDE that you use to code your business, are using Stripe to bill you:

![Stripe Subscriptions](/blog_img/entrepre/webify/stripe-windsurf-sample.png)
