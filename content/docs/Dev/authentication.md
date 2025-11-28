---
title: Authentication
type: docs
prev: /docs/video/
next: docs/
draft: false
---

Password Protected Static Routes with NGINX:  NginX Static Routes?

Think about having: SSG -> CMS, like `/keystatic` for UI edits -> CI/CD Builds as per git changes -> exposed via NGINX with https with some kind of authentication.


Sometimes, you can get away with 'serverless' authentication: https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/

## Authentication

* https://github.com/voidauth/voidauth

> Agpl v3 | An Easy to Use and Self-Host Single Sign-On Provider 🐈‍⬛🔒

### Streamlit Auth

I started with [Streamlit Authenticator](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Streamlit_Pages/Auth_functions.py).

But then, discovered that there are more ways to do it: https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/Z_Auth_Ways

Like using SQLITE: https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/Auth_sqlite

Or Streamlit x Pocketbase as seen [here](https://jalcocert.github.io/JAlcocerT/stonks/#streamlit)

![st authentication script connected to pocketbase users collection](/blog_img/entrepre/public-build/pystonks/st-auth-pocketbase.png)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/py-stonks/blob/main/hardcoded-auth-streamlit/st_auth_hardcoded_compose.py" title="St authenticator hardcoded on the compose | Script  ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/py-stonks/blob/main/hardcoded-auth-streamlit/st_auth_hardcoded_pb.py" title="St authenticator as per Pocketbase users collection info | Script ↗"  >}}
{{< /cards >}}


### Authentication with Logto

I used Logto for Python Web Apps, other than streamlit.

And also for NextJS webapps.

I have been tinkering with LogTo via:

The 3 Bodies post and app.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}

### Firebase Authentication

This one is...serverless!

So you dont care about the server, it just works.

## Email Verification

Use any of the following to not just [authenticate](#authentication), but verify emails:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#stripe-x-logto" title="Logto working with Flask WebApp" image="/blog_img/entrepre/webify/webify-logto-login.png" subtitle="Using Logto and then Stripe for a website platform" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/email-verification-pocketbase/" title="PB x Mailtrap" image="/blog_img/email/pb-mailtrap/pb-reset-pwd-working-smtp.png" subtitle="Using PocketBase and Mailtrap for user email verification" >}}  
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/social-signin-101/#1-firebase-authentication-" title="Using Firebase Authentication" image="/blog_img/entrepre/public-build/slidev-editor/firebaseauth-1.png" subtitle="Together with the journal SSG" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/firebase-auth-101/" title="Understanding Firebase Auth" image="/blog_img/web/Firebase/auth/fb-auth1-methods.png" subtitle="Configuring Google Firebase auth" >}}
{{< /cards >}}