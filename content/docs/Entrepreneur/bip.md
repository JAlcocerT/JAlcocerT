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

If you are by yourself, I recommend you to brainstorm with your LLMs about your ideas.

The outcome should be a clear goals (like a [BRD](https://jalcocert.github.io/JAlcocerT/brd-vs-frd-for-data-analytics/)) and execution plan for the agents to code for you.

{{< details title="Vibe Coding a Modern Landing Page x Shadcn x AuthJS | Setup  📌" closed="true" >}}

Go to whatever LLM you are using and ask: `do you think that these requirements are clear enough?`

```md
Create a Landing Page based on NextJS with a cool and modern UI

Include a `dockerfile` and `docker-compose.yml` that will control the title, description, open-graph image, favicon location and other global website variables via environment variables.

Create also a makefile with the following commands:

* `make help` - Show available commands
* `make install` - Prepare the dependencies for local development
* `make dev` - Run development server
* `make container` - Build and Run in Docker container

Create the z-development-plan.md with independent and testable phases that can be completed sequentially.

When it is completed, create a z-walkthrough.md with the steps to deploy the application and what each part of the tech stack does on a high level to bring the features to life.
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
```

```sh
#sudo apt install gh
gh auth login
#gh repo create make-podcast --private --source=. --remote=origin --push
    
git init && git add . && git commit -m "Initial commit: simple landing website" && gh repo create make-landing --private --source=. --remote=origin --push
###du -sh .
#docker stop $(docker ps -a -q) #stop all
#docker system df
```

**Technical Stack and Design Requirements**

To develop a **modern, secure, and scalable web platform** for hosting and streaming a single-user podcast.

The platform must offer a seamless, content-driven user interface and a flexible content management system supporting both web uploads and direct file system access.

{{< /details >}}

Before starting any project, you should have clarity on:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **Backend/Database** | | |
| **Authentication** | | |


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
