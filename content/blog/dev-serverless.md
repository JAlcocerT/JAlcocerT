---
title: "Just be Serverless"
date: 2025-11-23T23:20:21+01:00
draft: false
tags: ["SaaS","Firebase Auth","Logto JS SDK","ChatGPT Clone","T3.Chat","Publii CMS","Cloudflare Workers"]
url: 'serverless-101'
description: 'Your WebApps, with Serverless Authentication and AI on the backend.'
---




**Tl;DR**

Just go serverless.

+++ Using Logto JS SDK with CF Workers (?)
+++ You can even get web analytics to work on Cloudflare Workers



**Intro**

Just recently, I wrote about [Firebase Auth](/JAlcocerT/firebase-auth-101) and the [LogTo JS SDK](https://jalcocert.github.io/JAlcocerT/social-signin-101/#4-logto-).

I was suspecting all this was possible as per the [serverless-invoices setup](https://github.com/JAlcocerT/serverless-invoices)...

The [SSG (astro payroll) with pocketbase setup](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/) to register and signin...confirmed it.

Now, tell me that the [CF Pages + CF Workers + CF R2 setup](https://jalcocert.github.io/JAlcocerT/hugo-pocketbase-and-r2/) was not impressive...

What Im looking to put together now:

A serverless way to authenticate your users: then allow them to do certain actions.

Why not applying these to a theme: *which kind of reminds me of t3.chat*: https://t3.chat

![alt text](t3-chat-register-wall/blog_img/GenAI/t3.png)

* https://www.astrothemes.dev/theme/anse-app-chatgpt-demo/
* https://github.com/anse-app/chatgpt-demo

> MIT | Minimal web UI for ChatGPT.

And on the recent [Audio with AI Post](https://jalcocert.github.io/JAlcocerT/audio-recap/), I was supposed to create a [Speech rater with FastAPI](https://github.com/JAlcocerT/py-speech-rater) that superseeds the [previous streamlit version](https://github.com/JAlcocerT/Streamlit-Speech).

But I got an improvement of [my yt audio workflow](https://jalcocert.github.io/JAlcocerT/audio-recap/#conclusions) instead.

The prep work was done anyways: SSG + FastAPI + Audio recording/storing/processing worked.

How about the rating part now?

Meaning: to somehow plug the AI/LLMs/Agents to do/check stuff

### Static Pages and Edition

Bringing to the SSGs finally some cool editor has given me several head-aches.

Recently I discovered about **BCMS and pages-cms**, which I wanted to try [as per this post](https://jalcocert.github.io/JAlcocerT/mailerlite-for-saas/#podcast).

Aaaand...https://github.com/GetPublii/Publii

> GPL3.0 The most intuitive **Static Site CMS** designed for SEO-optimized and privacy-focused websites. 

In theory, all those can be selfhostable.

## Auth withtin SSGs

We saw on [this post](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/#ssg-x-pb) how to deploy a purely static site into CF Pages: https://github.com/JAlcocerT/payroll-workers-pb?tab=readme-ov-file

That is having a connection to a PB user collection: https://fast-payroll-theme.pages.dev/signup/

> Pocketbase has handling perpectly those signins/ups and the `https://fast-payroll-theme.pages.dev/secret` was protected

![alt text](/blog_img/dev/FE/payroll-authenticated-via-pb.png)

> > We saw the a cool message `You are authenticated. This is a protected page served by a Cloudflare Pages Function.`

If you would go to incognito - you were asked to login again

### LogtoJS SDK or Firebase x Astro

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth" title="Slidev Editor LogToJS Auth branch | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/slidev-editor/tree/firebaseauth" title="Slidev Editor Firebase Auth branch | Docker Config 🐋 ↗" >}}
{{< /cards >}}


![SliDevJS editor with NextJS and Logto/firebase working for social authentication](/blog_img/DA/ppt/slidev-editor.png)

With Firebase Auth 

For phones and with FastAPI, I did not manage to get fb auth social sign in/up  working:

* https://jalcocert.github.io/JAlcocerT/firebase-auth-101/
* https://jalcocert.github.io/JAlcocerT/stonks/

---

## FAQ


### Firebase Auth x SSG x CF Workers

You can combine Firebase Authentication with an Astro static site deployed to Cloudflare Pages to protect certain pages.

However, because Astro in "static" mode builds a purely static site, you cannot use server-side authentication directly on the pages themselves. 

The recommended solution for this is to use **Cloudflare Workers** (or more specifically, **Pages Functions**) to handle the server-side validation.

#### How It Works

This setup requires a **mix of client-side and server-side** logic:

1.  **Client-Side Authentication:** On the front end, your Astro site's client-side JavaScript uses the Firebase client SDK to handle the user sign-in and sign-up process. When a user successfully signs in, the Firebase client SDK provides an **ID token**. This token is a JSON Web Token (JWT) that proves the user's identity.

2.  **Protecting Static Pages:** The "protection" of a static page is not done at the server level by Cloudflare. Instead, you need to use client-side routing.
    * For a protected page, you check for the presence of a valid ID token.
    * If a token is found, you show the page content.
    * If no token is found, or if the token is invalid, you redirect the user to a sign-in page.

    This is a common approach for static sites, but it's important to understand that the content is still publicly accessible in the site's source code; it's just hidden from unauthorized users via JavaScript.

3.  **Server-Side Validation with Cloudflare Workers (Pages Functions):** For true server-side protection where you need to restrict API calls or dynamic content, you would use **Cloudflare Pages Functions**. When a client makes a request to a serverless function, it sends the user's ID token in the request header.
    * The Pages Function uses the Firebase Admin SDK to **verify the ID token**.
    * If the token is valid, the function can proceed with its logic and return the requested data.
    * If the token is invalid or missing, the function can return an unauthorized (401) or forbidden (403) status code, completely denying access to the content. 

#### The Need for Cloudflare Workers

Yes, you **would need Cloudflare Workers** (or Pages Functions) for *any server-side validation* or for truly protecting sensitive data.

* **Static sites cannot perform server-side checks.** An Astro static site is a collection of HTML, CSS, and JavaScript files. It has no server-side process to verify a user's token or to handle authentication logic.

* **Firebase Admin SDK requires a server environment.** The powerful Firebase Admin SDK, which is necessary to verify the authenticity of ID tokens and manage users, can only run in a trusted environment, such as a Cloudflare Worker, a Node.js server, or a Python backend.

It [cannot be used in a web browser](#why-its-a-security-risk), aka CSR.

In summary, for a static site on Cloudflare Pages, Firebase Auth handles the user-facing login flow, while Cloudflare Workers serve as the secure back-end to validate user sessions and provide access to protected data or APIs.

##### Why It's a Security Risk

You can't run the Firebase Admin SDK in a web browser because it's a huge security risk that would allow a malicious user to **tamper with your entire backend**.

The Firebase Admin SDK is designed for **trusted server environments** because it uses a **service account key**. 

This key is not tied to a specific user and has "super-admin" privileges.

It can bypass all of your database security rules, create new users, delete data, and perform any administrative action on your entire project.

If you were to include this key in your client-side code (which is what runs in the user's browser), any user could:

1.  Inspect your website's source code.
2.  Find the service account key.
3.  Use that key to run their own malicious scripts to access or destroy all of your data.

This is why the Admin SDK is only meant to be used on your own servers, like a Cloudflare Worker, a Google Cloud Function, or a Node.js backend. 

> In these environments, the service account key is never exposed to the public.

### Web Analytics x Cloudflare Workers

Just in case your home electricity goes away more often than not.

Instead of using selfhostable web analytics like Umami, you can try...


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umami" title="Umami | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics" title="Specially, when those are SelfHostable WebAn 🐋✅ ↗" >}}
{{< /cards >}}