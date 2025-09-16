---
title: "Social Auth"
date: 2025-09-15T10:20:21+01:00
draft: false
tags: ["Firebase vs Logto vs ","BaaS vs AaaS","LTV > 3CAC","SliDevJS Editor"]
url: 'social-signin-101'
description: 'Firebase Auth as your WebApp login method. A Serverless Authenticator'
---

**Tl;DR**

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/slidev-editor" title="A SliDevJS Editor with social auth walls" image="/blog_img/apps/gh-jalcocert.svg" subtitle="NextJS + ToastUI + Auth Tests" >}}
{{< /cards >}}

https://sli.dev/guide/hosting#spa

slidev build

Social Signin > One Time Link > Email and PWD


**Intro**

If you are into [marketing/social media](https://jalcocert.github.io/JAlcocerT/social-media-automation/) and have used its related tools, you know that its a game of volume.

Say that for every 1000 cold emails you do, 2-4% will move towards the next step (and you will be lucky).

You dont want to throw away the mkt efforts, by having a landing and SaaS login that provides too much friction.

And if you have ever worked on ecommerce, you should know that a social sign in converts ~95%, instead of the ~80+% of a email/pwd.

With this post, lets try to understand how to make those social signins for good.

With the goal of not working our [SaaS KPIs](#faq)

And...in the mean time play with a wrapper of a SliDEvJS editor.

You can get started with such project and cursor like:


**The Stack** [NextJS + ToastUI](#how-to-create-an-slidev-editor) + [SliDev](#slidev-goodies).

Just as I have been using recently on the [astro-editor for the multilang astro editor](https://jalcocert.github.io/JAlcocerT/astro-i18/). 

```sh
git clone https://github.com/JAlcocerT/slidev-editor
cd slidev-editor && make run-detached #localhost:3000 for the editor

# npm list -g @slidev/cli
# /usr/lib
# └── @slidev/cli@51.4.0

## docker exec -it slidev-sample sh
#docker system prune --all --volumes
```

![alt text](/blog_img/entrepre/public-build/slidev-editor/slidev.png)

Remember you had presenter mode at `localhost:3030/presenter` and you can even record your presentation



## SliDev Goodies


* https://github.com/slidevjs/slidev
* https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/#slidev

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-slidevjs" title="SliDev | Docker Config 🐋 ↗" >}}
{{< /cards >}}


{{% details title="SliDev x VueJS x CSR 🚀" closed="true" %}}

Yes, **Slidev is a web-based presentation tool built on top of Vue.js** and it primarily uses a **Client-Side Rendering (CSR)** approach.

It's designed for developers to create presentations using a combination of Markdown and Vue components.


Slidev and Vue.js

Slidev is an application built with the **Vue.js framework**, specifically Vue 3. It leverages Vue's component-based architecture to make the slides highly customizable and interactive. For example, you can embed your own custom Vue components directly into a slide to create live demos or interactive visualizations.

The entire presentation is a **Single-Page Application (SPA)** that is powered by Vue. When you create your slides in Markdown, Slidev parses the content and renders it into Vue components. This allows for features like:

* **Dynamic content:** You can use Vue's data reactivity to create dynamic elements.
* **Animations:** It integrates with Vue's transition system to handle slide transitions and element animations.
* **Customization:** You can create your own layouts and components using Vue's syntax, giving you complete control over the design and functionality.

CSR Only?

For a typical presentation, **Slidev is a CSR-only framework**. When you build your presentation for production, it generates static HTML, CSS, and JavaScript files that are meant to be served from a web server. The browser then downloads these files and renders the entire presentation dynamically on the client-side. There's no server-side rendering (SSR) involved in the core functionality of presenting the slides.

This CSR approach is what makes Slidev presentations so portable. 

They can be hosted on any static hosting service like GitHub Pages or Netlify, and they don't require a dedicated backend server to run. 

The entire logic for navigating slides, playing animations, and handling interactive elements resides in the client's browser.

{{% /details %}}

1. MermaidJS

2. Katex: so that you get [good looking expressions](https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/#cagr) $CAGR = \left( \frac{V_f}{V_i} \right)^{\frac{1}{t}} - 1$.

3. Monaco Editor: yea...the one I used [here as simple .md editor](https://jalcocert.github.io/JAlcocerT/audio-recap/#simple-md-editor)



{{< details title="More on Monaco Editor and CSR 📌" closed="true" >}}


Client-Side Rendering (CSR): The entire editor is built on client-side rendering.

The browser downloads the necessary JavaScript and CSS files, and the editor is then constructed and rendered dynamically on the web page.

There is no server-side rendering involved in the editor's core functionality itself.

The **Monaco editor itself does not have a built-in runtime environment** to execute the code.

Its sole purpose is to provide a rich code-editing experience in the browser. 


1. The Editor Itself is Client-Side

The entire Monaco editor interface—the text, syntax highlighting, autocompletion, and even the diagnostics (the red squiggly lines for errors)—is a result of **Client-Side Rendering (CSR)**. The JavaScript and TypeScript code that makes the editor work runs directly in your browser. This includes the "language services" that provide the intelligent features, which are often run in a **Web Worker** to avoid freezing the main browser thread. 

However, this is all **static analysis** of the code, not execution. The editor understands the syntax and structure of the code, but it doesn't run it.

2. Runtime Environment is a Separate Component

To actually execute the code written in the Monaco editor, you need to connect it to a separate runtime environment. This can be done in two ways:

* **In-Browser Execution (for JavaScript/TypeScript):** You can use the browser's native JavaScript engine to run the code. This is how many online code sandboxes or playgrounds work. When you click "Run," the website takes the code from the editor and either puts it into an `<iframe>` or runs it directly in the main browser context, displaying the output in a separate console-like area. This is a form of CSR, but it's separate from the editor's core function. 

* **Server-Side Execution (for other languages):** For languages like Python, C++, Java, or even Node.js, the code must be sent to a backend server. This server would have the necessary runtime and security sandboxing in place to execute the code and return the output. This is the most common approach for online coding challenges or platforms like Replit and Glitch. The server handles all the actual execution, while the browser only handles the input (the editor) and output.

{{< /details >}}


---

## BaaS

Many popular Backend-as-a-Service (BaaS) platforms offer Google social sign-in.

This is a common and important feature for user authentication. 

The most prominent players in this space are **Firebase Authentication**, **Supabase**, and **PocketBase**.

Once the **main branch** was ready with some SliDev Editor PoC working powered by NextJS...

It was time to do [some git branching](https://jalcocert.github.io/JAlcocerT/git-recap/)...

```sh
git branch -a

#create a new branch from main
git checkout -b firebaseauth main #git checkout -b <new-branch-name> main

#git checkout main && git pull origin main
#git checkout -b business-feature
```

### 1. Firebase Authentication 🤖

**Firebase Authentication** is a Backend-as-a-Service provided by Google, so it naturally has deep integration with Google Sign-in.

It provides a robust, pre-built authentication system that is easy to integrate into web and mobile apps. It supports various sign-in methods, including Google, Facebook, Twitter, and email/password.

Its tight integration with other Firebase services like Firestore and Cloud Functions makes it a popular choice for developers already in the Google ecosystem.

* **Pros:**
    * **Extremely easy setup** for Google Sign-in.
    * **Generous free tier** for getting started.
    * **Seamless integration** with the entire Firebase suite.
    * **Managed and scalable**, so you don't have to worry about infrastructure.

* **Cons:**
    * **Vendor lock-in** to the Google ecosystem.
    * Can become **expensive at scale** depending on your read/write operations.
    * Uses a **NoSQL database (Firestore)**, which can be a limitation for projects requiring complex relational queries.



{{% details title="Firebase Auth branch with Cursor 🚀" closed="true" %}}


I have just created a new branch to experiment with firebase authentication

can you create a z-firease-auth.md to explain what I need to get from google to get this going?

and also implement a email/password sign in sign up, which also will allow for google social signin?

the landing page should be visible for all, and the demo presentation as well, but the editor itself it has to be auth protected

for now, all users will see the very same editor


{{% /details %}}

![alt text](/blog_img/entrepre/public-build/slidev-editor/firebaseauth-1.png)

![alt text](/blog_img/entrepre/public-build/slidev-editor/firebaseauth-2.png)

![alt text](/blog_img/entrepre/public-build/slidev-editor/firebaseauth-3.png)

```sh
#git clone https://github.com/JAlcocerT/slidev-editor ./slidev-editor-firebasebranch
#cd slidev-editor-firebasebranch

git branch -a
git checkout firebaseauth #this brings the remote branch to your PC
```

Get your Firebase Setup and fill the `env.local`: https://github.com/JAlcocerT/slidev-editor/blob/firebaseauth/.env.example

```sh
#nano .env.local
#npm run dev
#docker compose build slidev-editor
make run #or make run-detached
```

![NextJS + Firebase Auth working](/blog_img/entrepre/public-build/slidev-editor/firebaseauth-4.png)

As this was the 3rd time I did this, it was 2 min, instead of the initial 45 and the 5 min later on.

BTW: email verification when not doing the social signup also working (goes to spam though) from domain `dmproperties.firebaseapp.com`

https://jalcocert.github.io/JAlcocerT/stonks/#astro-x-data-x-chartjs
https://jalcocert.github.io/JAlcocerT/firebase-auth-101/

And for the server x300:

```sh
#docker compose -f docker-compose.server.yml up --build
docker compose -f docker-compose.server.yml up --build -d
#docker network connect cloudflared_tunnel slidev-editor #network -> container name
docker inspect slidev-editor --format '{{json .NetworkSettings.Networks}}' | jq #publish it via Zero Trust with pystonks-app-streamlit:8501
```

With that ready, just do your CF setup: `slidev-editor:3000`


{{< callout type="warning" >}}
Unlike with FastAPI + PyStonks, The Firebase Auth setup **worked on smartphones** too. Remember to config **custom domains**!
{{< /callout >}}

![Configuring firebase auth domains to work via cloudflare tunnels](/blog_img/entrepre/public-build/slidev-editor/fb-auth-domains.png)

![Firebase Auth pwd policy](/blog_img/entrepre/public-build/slidev-editor/fb-pwd-policy.png)

{{< callout type="info" >}}
You can pull the firebase registered users via CLI!
{{< /callout >}}

### 2. Supabase 🚀

**Supabase** is an open-source alternative to Firebase, often referred to as "Firebase for PostgreSQL."

It provides a full suite of BaaS features, including authentication, a real-time database, and serverless functions.

Supabase Auth supports various social providers, including Google.

Because it's open-source and uses a **relational database (PostgreSQL)**, it gives developers more flexibility and control.

* **Pros:**
    * **Open-source**, which offers flexibility and the ability to self-host.
    * Uses **PostgreSQL**, a powerful and widely-used relational database.
    * Has a **built-in authentication system** that integrates seamlessly with its database using Row Level Security (RLS).
    * **Predictable pricing** and a clear path to self-hosting.

* **Cons:**
    * A newer platform compared to Firebase, so its feature set is still maturing.
    * Can have a steeper learning curve for developers not familiar with PostgreSQL.

***

### 3. PocketBase ⚡

**PocketBase** is a unique, lightweight BaaS platform packaged as a **single-file binary** that includes a Go backend and an embedded SQLite database. It's a great choice for quick prototypes and small-to-medium-sized applications. 

PocketBase supports OAuth2 authentication, which means you can easily implement Google Sign-in.

Because it's **self-hosted**, you have full control over your data and infrastructure.

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pocketbase" title="Pocketbase 101 | Post ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="Pocketbase Docker Config Setup 🐋 ↗" >}}
{{< /cards >}}

* **Pros:**
    * **Extremely simple and fast to deploy** (just one file).
    * **Built-in features** (auth, database, file storage) work out of the box.
    * **Free to use** (you only pay for your hosting costs).
    * Offers a **real-time API** out of the box.

* **Cons:**
    * **Not a managed service**, so you are responsible for hosting, scaling, and backups.
    * The embedded SQLite database may not be suitable for large-scale, high-concurrency applications.
    * Doesn't have a built-in serverless functions feature like Firebase or Supabase.

## AaaS

When you need robust user management, including social sign-in and email verification, but don't need the entire suite of backend services (like a database, file storage, etc.), you're looking for an **Authentication-as-a-Service (AaaS)** or **Identity and Access Management (IAM)** provider.

These services specialize in handling user authentication and authorization, and they often integrate with your existing backend and application architecture. Here are some of the most popular and powerful options:

### 1. Clerk 💼

**Clerk** is a modern and developer-friendly platform that focuses on providing a seamless, full-stack user management experience. 

It's particularly popular with front-end developers using frameworks like Next.js, as it provides pre-built, customizable UI components for sign-up, sign-in, user profiles, and more. It offers a generous free tier and is known for its excellent developer experience.

* **Key Features:**
    * **Pre-built UI components:** This is a huge time-saver. You can drop in components for authentication flows, user profiles, and organization management.
    * **Full-stack integration:** It provides SDKs for both front-end and back-end frameworks, ensuring secure and seamless authentication.
    * **Extensive authentication methods:** Supports Google, GitHub, and other social sign-ins, along with email/password, magic links, and more.
    * **Email and SMS verification:** Built-in email verification and password reset flows.

### 2. Okta 🏢

**Okta** is a massive, enterprise-grade identity platform.

It's a leader in the IAM space, focusing on both workforce identity (managing employee access) and customer identity (CIAM) for your applications.

Okta's solutions are incredibly comprehensive, scalable, and secure. They offer a huge range of features, from simple social login to complex B2B authentication and single sign-on (SSO).

* **Key Features:**
    * **Enterprise-grade security:** Provides robust features like multi-factor authentication (MFA), threat detection, and advanced session management.
    * **Highly customizable:** You can configure authentication flows with "rules" and "hooks" to fit complex business logic.
    * **Wide protocol support:** Supports all major identity protocols, including OAuth 2.0, OpenID Connect (OIDC), and SAML.
    * **Extensive integrations:** Integrates with thousands of applications and services out of the box.
    * **Email verification:** Handles email verification and other user management tasks.

### 3. Auth0 (by Okta) 🚀

**Auth0** was acquired by Okta and is often considered the developer-centric, more flexible arm of the company. 

It's known for its powerful, yet easy-to-use platform that allows developers to add authentication and authorization to their applications with minimal effort. It's a great middle ground between the full BaaS platforms and the more complex enterprise solutions.

* **Key Features:**
    * **Universal Login:** Provides a customizable hosted login page, so you don't have to build your own UI.
    * **Actions and Rules:** Allows for deep customization of the authentication flow using serverless functions.
    * **Wide range of social connections:** Supports Google and many other social providers, including enterprise connections.
    * **Email verification:** Built-in and configurable email verification and password reset flows.

### 4. Logto 🦊

**Logto** is a strong, open-source alternative to the proprietary AaaS platforms. 

It's a self-hostable identity platform that provides a complete set of features for authentication and user management. 

Because it's open-source, it's a great choice for developers who want more control over their data and infrastructure without the vendor lock-in of a managed service.

* https://logto.io/

> Modern auth infrastructure for developers

> > Logto adds multi-tenancy, enterprise SSO, and RBAC to your SaaS or AI apps. All with OIDC and OAuth 2.1 made simple, fast, and developer-friendly.

* **Key Features:**
    * **Open-source and self-hostable:** Gives you full ownership and control.
    * **All-in-one:** Includes authentication, authorization, user management, and multi-tenancy.
    * **Framework-free:** Provides SDKs for a wide range of languages and frameworks.
    * **Customizable login experiences:** You can tailor the user-facing parts of the platform to match your brand.

![alt text](/blog_img/entrepre/public-build/slidev-editor/logto1-panel.png)



```sh
git branch -a
#create a new branch from main
git checkout -b logtojseauth main #git checkout -b <new-branch-name> main
#git checkout main && git pull origin main
```

```
and can we implement similar setup to the firebase authentication, but with LogtoJS?

Add a z-logto-setup.md explaining what I need to do from logto web UI and also create the required env.sample
```

```sh
npm install @logto/next
```

---

## Conclusions

Firebase Auth with email/pwd + social signin working on desktop and mobile ✅



### Comparison and Summary

| Platform | Type | Best for... | Key Differentiator |
| :--- | :--- | :--- | :--- |
| **Clerk** | AaaS | Modern web apps, startups, and developers who want a quick, easy, and aesthetically pleasing solution. | Best-in-class, pre-built UI components and a focus on developer experience. |
| **Okta** | IAM | Large enterprises and organizations with complex security and identity management requirements. | The most comprehensive, enterprise-grade identity platform on the market. |
| **Auth0** | AaaS/IAM | Developers building applications that need flexible and customizable authentication. | Powerful extensibility with "Actions" and a wide array of social connections. |
| **Logto** | Open-source IAM | Teams that want a free, self-hostable, and transparent alternative to proprietary services. | Full control over your data and infrastructure with an active open-source community. |



---

## FAQ


### How to create an SliDev-Editor

{{< details title="My Initial requirements for the SliDevJSEditor for Cursor 📌" closed="true" >}}

We want to build a local-first markdown editor for SliDev presentations

The application should be built with a focus on an efficient content edition via markdown, specifically for SliDEVJS.

**Core Requirements** - The following features are mandatory for the initial build of the application, which should be created in the root of the repo.

Folder Selection: The user must be able to select a local folder to scan for files inside `./slidev`.
This should be implemented via a visible input field or a file picker dialog, by default, it can be `./slidev/slidev-sample`

File Tree/List: After selecting a folder, the application must display the related `slides.md`. If a toggle is ON, a full a list of all `.md` and `.mdx` files found within that folder will also be visible to select.

Side-by-Side Editor: When a file is selected from the list, the **ToastUI Editor** should open on the right-hand side of the screen, with the file list remaining visible on the left.

Editor Functionality: The ToastUI Editor must be fully functional, including markdown editing, saving the .md or .mdx to local storage and a live preview of the content.

Focus Mode: A button or toggle that hides the file list, expanding the editor to full width for a distraction-free writing experience.

File Saving: The application must have a clear mechanism to save the current editor content directly back to the selected local `.md` or `.mdx` file.

We can use **NextJS** as backend as it should be easier to integrate with Slidev than fastAPI.

Consider that the main page of the app will be a landing page, where we describe what it does.

Then it will have a path called /app, where all the editor will be visible and in /app/slidev/slidev-example we will see the statically render of the presentation

Make the UI layout look sleek and modern (gradients and all goodies). 

Make it also mobile friendly.

You can also add the docker containers setup with a Dockerfile.dev a docker-compose.dev.yml and a Makefile with just 3 commands: spin the nextjs editor baremetal, another to build the container and another to build and run the container within this dev mode.


**Good-to-Have Features** - I did not mentioned these on the first go

These features are highly recommended to elevate the user experience and create a more complete tool.

Frontmatter Editor: A dedicated UI panel, separate from the main markdown content, for editing a file's frontmatter (e.g., title, date, tags, description). This prevents syntax errors and provides a structured way to manage metadata.

Asset Handling: The ability to drag and drop images directly into the editor. The application should handle placing the image file into a specified local directory (e.e., src/assets/images) and automatically insert the correct markdown link into the document.

File Management: Add basic file management capabilities such as creating new files, creating new folders, and deleting existing files directly from the UI.


{{< /details >}}

I got this after the first iteration:

![alt text](/blog_img/entrepre/public-build/slidev-editor/nextjs-slidev-editorlanding.png)

```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Starting slidev-editor via NextJS and ToastUI"

#sudo apt install gh
gh auth login
gh repo create slidev-editor --private --source=. --remote=origin --push

#git init && git add . && git commit -m "Initial commit: Starting astro editor via NextJS and ToastUI" && gh repo create astro-editor --private --source=. --remote=origin --push
```

> On this one, created main for the base functionalities and created branch to test the authentication methods.

* https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/#slidev


```sh
node --version
```

```sh
npm init slidev #yarn create slidev
npm run dev
#npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/

#rm -rf .git
npm run build
#cd ./dist
#npx serve
```

### KPIs for SaaS

LTV
CAC

> People say to aim for LTV > 3*CAC