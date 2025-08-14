---
title: "Whats Typescript?"
date: 2025-08-14
draft: false
tags: ["SSG","Web","Yarnness","Gitea WebHooks"]
description: 'Typescript and how easy is for everyone to get a blog.'
url: 'whats-typescript'
---

**TL;DR:** It was about time to recap with it can be done with [TypeScrypt](#ts) (and what not) + Update on [knitting blog](#a-blog-for-all)

**Intro**



## TS

If you know [JS](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/), going to ts should be relatively simple.



### TS x PB


{{% details title="About LiquiBase... 🚀" closed="true" %}}

{{% /details %}}

A TypeScript class is *not* limited to being the UI client.

TypeScript is a superset of JavaScript, and since JavaScript can run on both the front-end (in a browser) and the back-end (using a runtime like Node.js), TypeScript can be used in both places.

{{% details title="About TS Classes and PB... 🚀" closed="true" %}}

However, the key distinction in the original comparison was about the **location and nature of the logic**, not the language itself.

* When I said **"TypeScript class connected to PocketBase"**, I was assuming a common and simple use case: a class within a **client-side application** (like a React or Angular app) that directly uses the PocketBase SDK to interact with the database. In this scenario, the TypeScript code is the "UI client" because it's running in the user's browser, handling the user interface and making direct calls to the PocketBase server.

* The **"Flask + PocketBase"** setup, on the other hand, describes a separate **backend server**. This server is not running in the user's browser; it's a completely different application. The UI client (which could be written in TypeScript, or any other language) makes requests to the Flask server, and the Flask server then handles the complex logic before communicating with PocketBase.

**Where TypeScript can be a backend**

You can absolutely use TypeScript to build a backend server, just like you would with Flask or any other backend framework.

For example, you could use a framework like **NestJS** or **Express.js** with TypeScript to create a powerful backend API.

In that case, the architecture would look like this:

**TypeScript UI Client** ---(API calls)---> **TypeScript Backend Server** ---(database calls)---> **PocketBase**

In this architecture, the "TypeScript Backend Server" would be the equivalent of the "Flask" part in the original comparison. It would have the same ability to handle complex logic, middleware, and custom API endpoints.

So, to clarify:

* A **TypeScript class** in a simple client-side application is the "client."
* A **TypeScript class** (or an entire application) can also be a backend server, which would allow it to handle complex logic in the same way Flask does.

The original comparison was designed to highlight the difference between a direct client-to-database connection and a more robust client-to-backend-to-database architecture, regardless of the language used for the client or backend.

{{% /details %}}



---

## Conclusions

Thats about typescript.

Now: Do you need to be a WebDev to get a cool blog and write publically on the internet?

Not really.

### A blog for All

See how quickly you can get a cool (and OSS'ed) Astro Theme going:

Knitting blogging theme: 

```sh
git clone https://github.com/hasinhayder/storyteller-astro
cd storyteller-astro
npm install
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

> MIT | An elegant and minimal blogging/coding/programming theme for Astro


You can ask now coding agents (Cursor, Windsurf, Copilot...) to guide you.

But basically you can do `CTRL+F` to find which files drive which content.

A good starting point is always `./src/content` where you will see some kind of `/blog` or `/article` folder with the markdowns that drive the content of your blog.

> Just edit one and start writing your thing, is that simple!

> > Normally the themes bring some instruction on [how to edit them](https://github.com/hasinhayder/storyteller-astro?tab=readme-ov-file#-content-creation)

When you are confortable with this, *if you want to share it publically*, you have one more step.

Deploy your new blog statically to your preferred solution:

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/alternatives-for-hosting-static-websites/" title="Pocketbase Docker Config 🐋 ↗" >}}
  {{< card link="https://fossengineer.com/alternatives-for-hosting-static-websites/" title="Pocketbase Docker Config 🐋 ↗" >}}
{{< /cards >}}


You can also create a quick `make` command that will build and push your changes (manually) to CF, Firebase or any of those.

```makefile
# Default make goal
.DEFAULT_GOAL := help

.PHONY: dev
dev: ## Install Python deps for Flask app using uv (manages .venv automatically)
	npm run dev -- --host 0.0.0.0 --port 4321

.PHONY: build
build: ## Run the Flask app on http://localhost:5050 using uv
	npm run build

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"}; /^[a-zA-Z0-9_.-]+:.*?##/ {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
```

If you are using Windows, install npde/npm fast: *thanks to [chocolatey](https://jalcocert.github.io/JAlcocerT/how-to-use-chocolatey-windows/)*

1. Open the Start Menu and search for cmd or PowerShell.
2. Right-click on the search result.
3. Select "Run as administrator".
4. If a User Account Control (UAC) prompt appears, click "Yes".

```sh
choco upgrade all -y
choco install chocolateygui

choco install nodejs -y
#node -v
#npm -v
```

As seen with the [moto bloger post](https://jalcocert.github.io/JAlcocerT/web-for-moto-blogger/): *you can try with firebase with your gmail account*

```sh
#npm install -g firebase-tools

firebase login
firebase init
#firebase projects:list
```

You might also need some git tricks:

```sh
choco install gh
gh auth login
```

### Gitea x GHA

With Github you can get GHA for free on public repos.

But how about setting Github to Gitea webhooks and then build your site on your homelab automatically?

