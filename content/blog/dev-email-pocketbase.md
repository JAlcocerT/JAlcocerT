---
title: "Mailtrap as PocketBase SMTP"
date: 2025-11-25
draft: false
tags: ["MailTrap API","PocketBase","GoLang","Feature Flags","IMAP vs SMTP"]
description: 'Combining PB and Mailtrap for email verification. Optional FF for your SaaS'
url: 'email-verification-pocketbase'
---


**TL;DR**

If someone verifies an email, means that its also valid.

Lets do exactly that: with **Pocketbase BaaS and Mailtrap ESP**.


**Intro**

I was recently tinkering with email APIs and mailtrap got my attention as it was reaching inbox during my tests.

Resend and mailjet also worked, but they were somehow flagged more frequently to spam.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pocketbase/" title="PocketBase 101" image="/blog_img/dev/PB/selfh-pb.png" subtitle="Post where I Tinkered and SelfHosted PocketBase via Container" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/emails-101/#mailtrap" title="Emails for Dev Post - MailTrap 101" image="/blog_img/email/mailtrap-sending-domain-integrations.png" subtitle="Tinkering with email APIs, MailTrap section..." >}}
{{< /cards >}}

Let's just get PocketBase working:


```sh
#git clone 
cd pocketbase
time docker build -t pocketbase:latest . #literally 5s on the x13
#docker image ls pocketbase #and ~54mb


```

Then we go to `http://192.168.1.12:8080/_/?installer#`

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="PocketBase | Docker Config 🐋 ↗" >}}
{{< /cards >}}

You can review how PB auth works: https://pocketbase.io/docs/authentication/#api-keys

Mind the distinction of PocketBase admins (aka. _superusers) vs regular users at the `users` collection - `https://pocketbase.jalcocertech.com/_/#/collections?collectionId=_pb_users_auth_`

```sh
#df -h
#docker system df #see how much docker artifacts are using
#docker system prune -a --volumes -f

docker stop $(docker ps -a -q) #stop all
#docker volume rm $(docker volume ls -q | grep -v '^portainer_data$') #rm all volumes but portainer
#docker volume rm $(docker volume ls -q)

#docker system df
#docker image prune -a 
#docker builder prune -a --force

#docker system prune --all --volumes #just clean all...
```


## MailTrap API vs SMTP and the code

Its not a surprise, than we can do email with code.

And I tinkered superficially with PB and Mailtrap on the previous post:

* https://jalcocert.github.io/JAlcocerT/emails-101/#mailtrap-smtp-x-pocketbase

![Configuring Pocketbase to work with MailTrap SMTP](/blog_img/email/mailtrap-pb-mail-settings.png)

But these deserved a separated section! 

What we are doing is the **MailTrap SMTP** way: https://mailtrap.io/blog/smtp-send-email/

what you should have done already:

1. Register to [MailTrap and configured](https://jalcocert.github.io/JAlcocerT/emails-101/#mailtrap) a sub/custom domain: https://mailtrap.io/sending/domains

I went with a dummy `news.libreportfolio.fyi`

2. Go to https://mailtrap.io/api-tokens

These are bearer tokens (not user/pwd neither API keys).

So you could test that your mailtrap is working again:

```sh
#source .env

curl --location --request POST \
'https://send.api.mailtrap.io/api/send' \
--header "Authorization: Bearer $MAILTRAP_API_TOKEN" \
--header 'Content-Type: application/json' \
--data-raw '{"from":{"email":"noreply@news.libreportfolio.fyi","name":"Mailtrap Test"},"to":[{"email":"test@mail.com"}],"subject":"You are awesome!","text":"Congrats for sending a test email with Mailtrap!","category":"Integration Test"}'
```

3. Go to your PB instance: `http://192.168.1.12:8080/_/#/settings/mail`

Add the following:

* `send.api.mailtrap.io` and port 587
* User `api` with pwd the bearer token you just got.

Then save changes and try the `Send test email`

This time I tried the password reset tempalte

The good thing about having the PB SMTP configured, is that you can also recover the pb superadmin pwd:

![alt text](/blog_img/email/pb-mailtrap/pb-reset-pwd-working-smtp.png)

And again, using mailtrap reached directly the inbox:

![alt text](/blog_img/email/pb-mailtrap/pb-reset-mail.png)

![alt text](/blog_img/email/pb-mailtrap/configuring-pb-smtp.png)

And then, just add:

![alt text](/blog_img/email/pb-mailtrap/configuring-pb-smtp2.png)


### Pocketbase x MailTrap - User mail Verification  

Hit the `API preview` button on the top right: `http://192.168.1.12:8080/_/#/collections?collectionId=_pb_users_auth_&filter=&sort=-created`

See how we got `request verification` and `confirm verification`.

We can get help from [curl's features](https://www.youtube.com/watch?v=3xmD4E2aqxo) you didnt know:
```sh
#curl -I --get https://pocketbase.jalcocertech.com/_/
curl http://192.168.1.12:8080/api/collections/users/request-verification
curl -x GET http://192.168.1.12:8080/api/collections/users/confirm-verification
# curl -s -o /dev/null -w "dns_lookup: %{time_namelookup}s connect: %{time_connect}s appconnect: %{time_appconnect}s pretransfer: %{time_pretransfer}s starttransfer: %{time_starttransfer}s ---------- total: %{time_total}s http_code: %{http_code}" https://graficas.libreportfolio.fyi
```

* /api/collections/users/request-verification

* /api/collections/users/confirm-verification

![Pocketbase API endpoint for Verification](/blog_img/email/pb-mailtrap/pb-api-verification.png)

Even the `/api/collections/users/confirm-verification` is around!

```js
import PocketBase from 'pocketbase';

const pb = new PocketBase('http://192.168.1.12:8080');

await pb.collection('users').requestPasswordReset('test@example.com');
```


<!-- ![httpie UI](/blog_img/iot/httpie.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/interesting-apis/#checking-apis" title="Interesting APIs Post" image="/blog_img/iot/httpie.png" subtitle="Section where I explain how to use API clients for testing endpoints" >}}
{{< /cards >}}


### MailTrap API

* https://mailtrap.io/integrations?current_tab=API%20SDKs

 https://mailtrap.io/blog/python-send-email/


---

## Conclusions

After all of this, you should be able to use Pocketbase + MailTrap to get user email verification working for any SaaS you are going to be building.

With that covered, [plugging Stripe](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/marketing/#integrate-stripe) should not be an issue.


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/#email-verification" title="Email Verification | Docs ↗" >}}
{{< /cards >}}

You can **also get emails verified** ( > > > validated) via **Logto** -> Stripe:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#stripe-x-logto" title="Logto working with Flask WebApp" image="/blog_img/entrepre/webify/webify-logto-login.png" subtitle="Using Logto and then Stripe for a website platform" >}}
{{< /cards >}}

<!-- 
![Logto Login Authentication wall](/blog_img/entrepre/webify/webify-logto-login.png) -->


And with [**firebase** auth](https://jalcocert.github.io/JAlcocerT/firebase-auth-101/):

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/social-signin-101/#1-firebase-authentication-" title="Using Firebase Authentication" image="/blog_img/entrepre/public-build/slidev-editor/firebaseauth-1.png" subtitle="Together with the journal SSG" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/firebase-auth-101/" title="Understanding Firebase Auth" image="/blog_img/web/Firebase/auth/fb-auth1-methods.png" subtitle="Configuring Google Firebase auth" >}}
{{< /cards >}}

<!-- 
![Firebase Authentication in the Web App](/blog_img/entrepre/public-build/slidev-editor/firebaseauth-1.png)
![Choosing authentication method working together with firebase authentication](/blog_img/web/Firebase/auth/fb-auth1-methods.png) -->



This year I have to be impressed about the cool projects around Golang


This seems to be the  year for me to discover the **goodies of GO language**.

> Generate your cute Go avatar: https://gopherize.me/


Its not just HUGO.

But Cadyy and **Traefik**. 

[SFTP-GO](https://jalcocert.github.io/JAlcocerT/sync-file-tools/#sftp-go) or the mighty POCKETBASE...

The [Go language](#about-go-projects) surprised me with another cool project to make better SaaS: [GoFF](#go-feature-flag)

But, we could also simplify this [feature flags setup via PocketBase as BaaS](#feature-flags-with-pb)


I got to know about [Go Feature Flag](#go-feature-flag), a better way to activate functions to Flask Web Apps than via *container + env vars*?

* https://gofeatureflag.org/
* https://gofeatureflag.org/docs/sdk

I have been playing with **cloudflare workers** recently:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/payroll-workers-pb/" title="Payroll Theme with PB as auth" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code Astro Theme + CF Workers + PB users collections as Auth" >}}
{{< /cards >}}

You can see how well it works: <https://fast-payroll-theme.pages.dev/signup/>

And [within that post's conclusions](https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/#conclusions) I reflected on the next steps of the setup.

> If you are logged in...do you have which features available? Is there any logic that activate/deactivates them?


## What are feature flags?

Feature flags, also known as feature toggles, are a software development technique that allows you to turn specific features of an application on or off without deploying new code.

They are essentially **conditional statements** in your codebase that control which features are visible or active for users.

Previously, I have been [adding environment variables](#can-they-be-passed-by-environment-variables) in the `docker-compose.yml` to have this kind of simple behaviour.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/real-estate-moi/blob/main/moirealestate-flaskcms/docker-compose-portainer.yml#L9" title="Flask Hardcoded Auth | Example with Code and Container 🐍🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_DeployMe/docker-compose.yml#L11" title="AIssistant | Prod vs Dev Features flag Example 🐍🐋 ↗" >}}
{{< /cards >}}

But it seems there are better ways to do so: like with [GoFeatureFlag](#go-feature-flag)

### Are Feature Flag Recommended?

Yes, feature flags are highly recommended for modern software development.

They provide significant benefits:

* **Decoupling Deployment from Release:** This is a core benefit. You can deploy a new feature to production and then release it to users later by simply flipping a flag. This reduces risk and allows for more frequent deployments.
* **A/B Testing:** You can use flags to show different versions of a feature to different user segments to gather data and determine which performs better.
* **Kill Switch:** If a new feature causes a critical bug or performance issue, you can immediately disable it with a flag without having to roll back the entire application.
* **Targeted Rollouts:** You can gradually roll out a feature to a small percentage of users (e.g., 1%, then 10%, then 100%) to monitor its stability and gather feedback before a full release.
* **Personalization:** Feature flags can be used to personalize the user experience by enabling or disabling features based on a user's plan, location, or other attributes.
* **Trunk-Based Development:** They are essential for a **trunk-based development** workflow, where all developers merge their code into the main branch frequently. Flags allow unfinished or experimental features to be merged without affecting the live application.


### Can They Be Passed by Environment Variables?

Yes, feature flags can be passed by **environment variables**, but this is typically only suitable for a very simple setup. 

* https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_multichat.py
* https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_DeployMe/Docker-Compose.yml

> Like the ones I was setting with Flask or with Streamlit not long ago

* **Simple Use Cases:** For features that are either entirely on or off for the entire application, an environment variable (e.g., `ENABLE_BETA_FEATURE=true`) can work. This is common for enabling a new API endpoint or a backend service.
* **Limitations:** This method becomes impractical and unmanageable for more complex scenarios. It doesn't allow for:
    * **Per-user or per-group targeting**
    * **Gradual rollouts**
    * **Remote management** without a full application restart or redeployment
    * **A/B testing**

For these reasons, most professional setups use a dedicated **feature flag management system** or service.

These services provide a central dashboard to manage flags, target users, and analyze data without code changes or restarts. 

While feature flags are a powerful tool, they are not a silver bullet and come with their own set of drawbacks if not managed carefully. 

The main cons of feature flags include:

1. Increased Code Complexity and Technical Debt

* **Conditional Logic:** Each feature flag adds conditional logic (e.g., `if (featureEnabled)` statements) to the codebase. As the number of flags grows, the code can become littered with these checks, making it harder to read, understand, and maintain.
* **Code Bloat:** Long-lived or forgotten flags lead to "dead code" that remains in the application, increasing its size and complexity unnecessarily. This technical debt makes it harder for new developers to understand the system and for existing developers to make changes.
* **Combinatorial Explosion:** When multiple flags interact, the number of possible code paths and states can explode exponentially. This makes it difficult to reason about the system's behavior and can introduce subtle bugs that only appear in specific, hard-to-reproduce flag combinations.

2. Testing and Debugging Challenges

* **Complexity:** Testing an application with feature flags is far more complex than testing one without them. You can no longer just test a single code path. You must test every possible combination of flags to ensure the application behaves as expected. This can significantly increase the time and effort required for QA.
* **Reproducing Bugs:** When a bug is reported, it can be very difficult to reproduce if you don't know the exact combination of flags that was active for the user at the time. This can lead to frustrating and time-consuming debugging sessions.
* **Stale Flags:** A bug can be caused by a flag that was meant to be temporary but was left in the codebase for too long. Over time, the code behind the flag may no longer work as intended with the rest of the application, leading to regressions when it is accidentally enabled.

3. Management and Coordination Overhead

* **Lack of Discipline:** Without a clear process for cleaning up flags, they can accumulate over time and become unmanageable. This requires a strong team culture and discipline to regularly review and remove obsolete flags.
* **Knowledge Silos:** If a team doesn't have a central way to track and manage flags, different developers may be unaware of what flags exist, what they control, or how they might interfere with each other's work.
* **Misuse:** Feature flags can be misused as a permanent solution for customer-specific configurations or for personalizing the user experience, rather than as a temporary tool for release management. This can lead to a long-term, unmaintainable mess.

4. Performance Overhead

* **Runtime Checks:** In high-traffic or performance-critical systems, the constant checking of flag states can introduce a small amount of overhead. While this is often negligible, it can become a concern if you have many flags or if the flag evaluation logic is complex.

In conclusion, the cons of feature flags are primarily related to **complexity and technical debt**. They are powerful tools, but they require a strong management process and team discipline to avoid turning a temporary solution into a long-term problem.

There are several open-source software (OSS) solutions that help with feature flags.

These tools typically provide a server component for managing flags and client-side SDKs to integrate with your application.

Some of the most popular open-source options include:

1. Unleash is one of the most widely used open-source feature flag platforms. It's built with a strong focus on core feature flagging capabilities and is designed to be highly scalable. It provides a web UI to manage flags, define activation strategies (like gradual rollouts or targeting specific users), and has official SDKs for many popular languages.

2. Flagsmith is an open-source platform for managing feature flags and remote configuration. It offers a self-hosted option, allowing you to have full control over your data. Flagsmith supports granular user targeting, A/B testing, and provides SDKs for web, mobile, and server-side applications.

3. GrowthBook is an open-source platform that combines feature flags with A/B testing and product analytics. Its unique "warehouse-native" approach means it connects directly to your data warehouse, allowing you to use your existing data for experimentation without moving it to a third-party service. This makes it a great choice for teams who want to make data-driven decisions.

4. Flipt is a self-hosted, open-source feature flag solution built in Go. It's designed to be simple, fast, and easy to run in your own infrastructure. Flipt is a good option if you need a lightweight, no-frills tool for managing flags with a clean API.

5. OpenFeature is a different kind of project. It's a **vendor-agnostic specification** and SDK that provides a standard API for feature flagging.

Think of it as an abstraction layer.

It doesn't provide a back-end for managing flags itself; instead, you can use it with a compatible provider (which can be a commercial service or a self-hosted open-source solution like the ones mentioned above). 

The main benefit is that it allows you to switch your feature flag provider without changing the core logic in your application's code. 


6. The [GoFeatureFlag](#go-feature-flag)

### Go-Feature-Flag

The **Go-Feature-Flag project** is a well-known open-source solution for feature flag management, and it stands out for a few key reasons:

* **Self-Hosted and Lightweight:** Go-Feature-Flag is designed to be simple and easy to deploy.
  * https://github.com/thomaspoignant/go-feature-flag
  * https://gofeatureflag.org/

Instead of requiring a complex database or separate backend, it can retrieve its configuration from a simple file stored in a variety of locations, including a Kubernetes ConfigMap, GitHub, GitLab, or an S3 bucket.

* **Built on Go:** As the name suggests, the core of the project is written in Go, which makes it a high-performance, lightweight, and single-binary solution.

* **OpenFeature-Native:** A major strength is its commitment to the OpenFeature standard. It's one of the few feature flag solutions fully built on this vendor-agnostic API. This means that by using Go-Feature-Flag, you're not locked into a proprietary system; you can easily switch providers in the future without a major code refactor.
  * https://openfeature.dev/

* **Relay Proxy:** To support languages other than Go, the project provides a "Relay Proxy." This is a lightweight service that exposes an API for other languages to use, making it a language-agnostic solution.
* **Advanced Capabilities:** Despite its simplicity, it supports advanced features like progressive rollouts, A/B testing, and complex targeting rules based on user attributes. It also allows you to export evaluation data to a variety of destinations for analysis.

> Go-Feature-Flag is a great choice for teams that want a simple, high-performance, and self-hosted feature flag solution that avoids vendor lock-in by embracing open standards.

### Feature Flags with PB

I could make the signin/up work recently via Pocketbase users collection, see: https://pocketbase.jalcocertech.com/_/

As Im not looking for sth very complex at the moment, i kept vibecoding and ask aobut pros and cons with keep just a simple PB setup.

* https://github.com/JAlcocerT/payroll-workers-pb/blob/main/gofeatureflag-vs-pb.md

Something like you signup, if you pay via stripe, you have it all.





---

## FAQ

### IMAP vs SMTP

An IMAP is a standard internet protocol used by email clients to **retrieve and manage email messages** from a mail server. And **yes, it is related to SMTP**, but they serve different, complementary functions.

**📧 What is IMAP? (Internet Message Access Protocol)**

**IMAP** (**I**nternet **M**essage **A**ccess **P**rotocol) is a **pull** protocol, meaning your email client (like Outlook, Apple Mail, or a web browser) uses it to **pull** messages from the email server.

**Key Characteristics of IMAP:**

* **Server-Based Management:** IMAP allows you to manage your emails directly on the server. When you read, delete, or move an email, those changes are reflected on the server, not just your local device.
* **Multi-Device Access:** Because all your emails and folders live on the server, you can access the exact same view of your mailbox from multiple devices (your phone, your laptop, your tablet).
* **Message Synchronization:** IMAP only downloads a copy of the message headers or a small preview until you open the full message, which saves local storage space and bandwidth.

**🤝 IMAP and SMTP Relationship**

IMAP and SMTP are two sides of the same coin in the email ecosystem:

| Protocol | Function | Role | Analogy |
| :--- | :--- | :--- | :--- |
| **SMTP** | **Sending** (Push) | Used to **push** the email *from* your client *to* the outgoing mail server. | The **postman** who picks up your letter and delivers it to the post office. |
| **IMAP** | **Receiving** (Pull) | Used to **pull** the email *from* the incoming mail server *to* your client. | The **mailbox** at your house where you retrieve your letter. |

**How They Work Together:**

1.  When you click **"Send"** in your email program, the message is sent using **SMTP** to the recipient's mail server.
2.  When the recipient opens their email program, it uses **IMAP** (or POP3, an older alternative) to connect to their incoming mail server and **retrieve** the new message.

In essence, **SMTP handles the delivery** of the mail, while **IMAP handles the retrieval and management** of the mail once it has arrived at the recipient's server.


#### Dovecot 

**Dovecot** is indeed one of the most popular, high-performance, and secure IMAP and POP3 servers available, and it is designed for **open-source** and **self-hosting**.

* https://dovecot.org/

> The Secure IMAP server - The World’s Leading Email Backend Platform

Here's the breakdown:

| Attribute | Status | Details |
| :--- | :--- | :--- |
| **Open Source** | **Yes** | The core Dovecot software is open-source, primarily licensed under the **MIT and LGPLv2** licenses. This means you can freely download, use, and modify the software. |
| **Self-Hostable** | **Yes** | Dovecot's primary purpose is to be the **Mail Storage Server** component of a self-hosted email infrastructure. You install it on your own server (often alongside an SMTP server like Postfix or Exim) to manage user mailboxes. |
| **Function** | **IMAP Server** | It is specifically the application that handles IMAP (and POP3) connections from email clients, allowing users to access and manage their mail on the server. |

In fact, Dovecot is highly dominant in this space, reportedly having a global market share of over **75%** of all IMAP servers.

If you are setting up your own mail server, Dovecot is the industry-standard choice for the **Mail Access** (IMAP/POP3) component.

### Web Paradigms: SPA, MPA, CSR, SSR, SSG

The primary difference between these two paradigms has to do with the way they model evaluation context.

In server usage, the evaluation context changes frequently, as often as every evaluation, while in client-side usage, the evaluation context changes less frequently, often in response to user actions or UI events.

**SPA (Single Page Application)**

* Uses **Client-Side Rendering (CSR)**.
* Loads one HTML page; content updates dynamically via JavaScript.
* Fast interactions after initial load.
* Poor SEO by default (content rendered via JS, not immediately visible to crawlers).
* Needs extra steps for SEO: SSR, hydration, or pre-rendering.

**MPA (Multi-Page Application)**

* Uses **Server-Side Rendering (SSR)**.
* Each page is served as a fully rendered HTML document from the server.
* Full page reloads on navigation.
* Excellent SEO — content is immediately available to crawlers.

**Why Server-Driven Apps (MPA/SSR/SSG) Are Better for SEO**

* HTML is rendered before reaching the browser — search engines can see everything.
* Metadata and structured content are easily indexed.
* No reliance on JavaScript to render core content.

🧱 **WordPress:**

* ✅ Default WordPress is an **MPA** using **SSR** (PHP).
* ✅ SEO-friendly out of the box.
* ❗ Some setups (headless WordPress with React frontend) behave like SPAs and require SEO optimizations.


**SSG + Astro + Chart.js – SEO Implications**

✅ Good for SEO if:

* Astro statically generates HTML at build time.
* Core content is text-based and present in the HTML.
* Charts are for visual enhancement only.

❌ Risk for SEO if:

* Important content (labels, stats, insights) is **only inside `<canvas>`** via Chart.js.
* Search engines can't read canvas contents.

💡 Best Practice:

* Pair charts with **textual summaries, tables, or captions**.
* Use semantic HTML (`<h2>`, `<p>`, `<ul>`, etc.) to describe chart data.
* Let Astro load Chart.js **on the client only** (deferred), so it doesn't block page rendering or SEO.


| Technology/Approach    | SEO Friendly? | Notes                                           |
| ---------------------- | ------------- | ----------------------------------------------- |
| SPA (CSR)              | ❌ By default  | Needs SSR, hydration, or pre-rendering          |
| MPA (SSR)              | ✅ Yes         | Fully rendered HTML is great for SEO            |
| SSG (e.g. Astro)       | ✅ Yes         | Content pre-rendered at build time              |
| Chart.js (canvas only) | ❌ No          | Crawlers can’t read `<canvas>` content          |
| Chart.js + text/table  | ✅ Yes         | Best of both worlds: visual + crawlable content |
| WordPress (classic)    | ✅ Yes         | MPA + SSR setup out of the box                  |