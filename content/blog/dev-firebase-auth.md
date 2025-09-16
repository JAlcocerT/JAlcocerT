---
title: "Firebase Auth SDK. Social Login and email verification."
date: 2025-09-13T10:20:21+01:00
draft: false
tags: ["Journal","SaaS MAU","Social signin/up","JustJournalviaSSG","GCP BaaS"]
url: 'firebase-auth-101'
description: 'Firebase Auth as your WebApp login method. A Serverless Authenticator'
---

**Tl;DR**

Bringing firebase auth to nextjs webapps [seems to be simple](#conclusions).


**Intro**

Because LogTo email verifications works.

But if you want the gmail social signup/in, you need the paid tier (??? TBC WIP)

Today we are going to use:

* https://firebase.google.com/
    * https://console.firebase.google.com/


## Testing Firebase Auth

Ive done so with the project started on the [previous post](https://jalcocert.github.io/JAlcocerT/astro-journal-theme/).

* Following this instructions: https://github.com/JAlcocerT/Just-Journal-via-SSG/blob/main/z-firebase.md
    * I continued with the https://jalcocert.github.io/JAlcocerT/astro-journal-theme/


```sh
npm install firebase
```

Go to the site and:
![alt text](/blog_img/web/Firebase/auth/fb-auth-sdk.png)

Then, you get something like:

```js
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "-",
  authDomain: ".firebaseapp.com",
  projectId: "afagf",
  storageBucket: "afagf.firebasestorage.app",
  messagingSenderId: "123456790",
  appId: "1:adafwage:web:1234455"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
```

![alt text](/blog_img/web/Firebase/auth/fb-auth-app.png)


### Firebase Setup

![alt text](/blog_img/web/Firebase/auth/fb-auth1-methods.png)

> You can even bring your own [OpenIDConnect](https://jalcocert.github.io/JAlcocerT/encryption-101/#oidc-vs-oauth) / SAML

![alt text](/blog_img/web/Firebase/auth/fb-auth2-socialsignin.png)


![alt text](/blog_img/web/Firebase/auth/fb-auth3-providersready.png)


![alt text](/blog_img/web/Firebase/auth/fb-auth4-nextjs-socialsignin.png)

![alt text](/blog_img/web/Firebase/auth/fb-auth5-accepting-app-mermissions.png)

### Whats stored inside Firebase?

You can bring info to your app about whos logged in:

![alt text](/blog_img/web/Firebase/auth/pulled-email-from-fb.png)

And see in the firebase web UI the people registered:

![alt text](/blog_img/web/Firebase/auth/firebase-users-authenticated.png)

You could make the **firebase users data pull programatically** as well: https://github.com/JAlcocerT/Just-Journal-via-SSG/blob/main/z-firebase-pull-info.md

> You need a private key generate  as per the md instructions and place it into the `.env`

![alt text](/blog_img/web/Firebase/auth/programatic-access1.png)

![alt text](/blog_img/web/Firebase/auth/programatic-access2.png)

Youll download a json like ~ `project-firebase-adminsdk-abbcdef-123456.json`


```sh
node scripts/list-firebase-users.js
```

{{< callout type="info" >}}
Remember you are using a [free tier](#free-tier-limitations) with limitations
{{< /callout >}}

---

## Conclusions

Making Firebase auth work was literally ~45 minutes.

First time setup I mean, if you know are doing, count ~5min.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Just-Journal-via-SSG" title="Just Journal via SSG - Added Firebase Auth capabilities" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for a NextJS app with Reactmd UI editor for posts. Google social login." >}}
{{< /cards >}}

> See [how firebase auth technology compares](https://github.com/JAlcocerT/Just-Journal-via-SSG/blob/main/z-pros-cons.md) with the recently seen httpcookie and localstorage.


{{< callout type="warning" >}}
Learnt with FastAPI + PyStonks. The Firebase Auth setup will work on `localhost` out of the box. Make sure to configure **custom domains** properly
{{< /callout >}}

![Firebase custom domains](/blog_img/entrepre/public-build/pystonks/firebase/fb-custom-domain6.png)

### Free Tier Limitations

The primary limitation of Firebase Authentication's free tier is the **50,000 monthly active users (MAUs)** cap.

> As of today, same amount as Logto as per https://logto.io/pricing

You can also query user information programmatically using the **Firebase Admin SDK** on a trusted server environment.

The free tier for Firebase Authentication, known as the **Spark plan**, is very generous and suitable for most startups, hobby projects, and MVPs.

  * **Monthly Active Users (MAUs)**: The most significant limitation is the **50,000 MAU limit**. A "monthly active user" is a unique user who signs in or signs up during a given month. If a user signs in multiple times in a month, they still only count as one MAU.
  * **Phone Authentication**: Phone number authentication is **not free**. Each SMS sent for verification is billed separately on a pay-as-you-go basis, even on the Spark plan. The cost per SMS varies by country.
  * **Email Sending Quotas**: There are daily limits on the number of emails you can send for password resets (150/day), email verification (1,000/day), and email link sign-in (5/day).
  * **Account Creation Rate Limits**: To prevent abuse, there are rate limits on how many new accounts can be created from a single IP address (e.g., 100 accounts per hour).
  * **No Service Level Agreement (SLA)**: The free tier does not come with a service level agreement, meaning there are no uptime guarantees.

If you exceed any of these limits, you'll need to upgrade to the **Blaze plan**, which is a pay-as-you-go model.



### Programmatic Access to User Information

Yes, you can absolutely query and manage user information programmatically, but you must do so from a **trusted server environment** using the **Firebase Admin SDK**. This is a critical security distinction:

  * **Client-side (Mobile/Web):** Your client-side code (e.g., a web browser or mobile app) can only access the information of the **currently signed-in user**. This is a security feature to prevent one user from seeing another user's private data. You would use the client-side SDK's `user` object to get properties like `user.uid`, `user.email`, and `user.displayName`.
  * **Server-side (Admin SDK):** To access a list of all users or query specific users by UID or email, you must use the Admin SDK. The Admin SDK gives you powerful, unrestricted access to your entire user base. It's meant for back-end operations like creating new users, retrieving user data, or disabling accounts. This is a common task for serverless functions (like **Cloud Functions for Firebase**) or a custom back-end server.




---

## FAQ

### Firebase pros and cons

Firebase Authentication is a managed, secure backend service from Google that provides user authentication for your apps. It offers a wide range of sign-in methods, including email/password, phone numbers, and popular social identity providers like Google, Facebook, and Twitter.

It's a very **proper and safe way to do email verification serverless**. Since it's a managed service, Google handles the security best practices, such as password hashing, email verification flows, and protection against common attacks like brute force attempts and credential stuffing. This significantly reduces the security burden on you as a developer, which is especially beneficial in a serverless architecture where you want to minimize custom server-side code.

#### Firebase Authentication vs. Self-Managed Solutions (SQLite)

Building your own authentication system with a database like **SQLite** gives you complete control but also puts a significant security burden on you.

**Pros of Firebase Auth:**
* **Ease of Use:** Firebase provides ready-to-use SDKs and a UI library (**FirebaseUI**) that makes integration very fast and simple, often with just a few lines of code.
* **Security:** Google's team manages all the security aspects. You don't have to worry about implementing password hashing algorithms, protecting against common vulnerabilities, or managing email verification tokens.
* **Scalability:** As a managed service, it scales automatically to handle millions of users without any server management on your part.
* **Multi-Provider Support:** It easily supports various sign-in methods, including social logins, which are complex to implement from scratch.

**Cons of Firebase Auth:**
* **Vendor Lock-in:** You're tied to the Google ecosystem. Migrating to another platform later can be challenging.
* **Lack of Control:** You have limited control over the underlying database and authentication logic. You can't customize the password hashing algorithm or change how the email verification links are handled beyond what the SDKs offer.
* **Cost at Scale:** While it has a generous free tier, costs can become unpredictable and expensive as your user base grows, especially if you use features like phone authentication.

#### Firebase Authentication vs. PocketBase

**PocketBase** is an open-source, self-hosted backend that combines a SQLite database with a built-in authentication system and an admin dashboard, all in a single binary.

**Pros of Firebase Auth:**
* **Managed Service:** You don't have to worry about hosting, maintenance, or security updates. It's a true "set-it-and-forget-it" solution for authentication.
* **Battle-tested Infrastructure:** Firebase runs on Google's infrastructure, which is known for its reliability and security at a massive scale.
* **Broader Ecosystem:** Firebase is part of a larger suite of services (database, cloud functions, hosting, etc.) that are tightly integrated, making it a powerful platform for building a full application.

**Cons of Firebase Auth:**
* **Not Self-hosted:** PocketBase's primary advantage is that it's self-hosted. You own your data and are not locked into a specific cloud provider.
* **Pricing:** PocketBase's only cost is your hosting provider, which is often more predictable and cheaper for smaller-to-medium-sized projects.
* **Customization:** PocketBase's open-source nature allows for much deeper customization of the database and authentication logic than Firebase.

#### Firebase Authentication vs. Logto

**Logto** is a modern, open-source identity and access management solution. 

It's designed to be a more complete, enterprise-ready authentication platform.

**Pros of Firebase Auth:**
* **Simplicity and Speed:** For basic use cases, Firebase is incredibly fast to set up and get running, making it a great choice for MVPs and small-to-medium apps.
* **Integration with Google Services:** If you're already using other Google Cloud or Firebase services, the tight integration is a major plus.
* **Ease of Maintenance:** As a completely managed service, there's virtually no maintenance required from your side.

**Cons of Firebase Auth:**
* **Limited Enterprise Features:** Logto offers more advanced features out-of-the-box, such as Role-Based Access Control (RBAC), multi-factor authentication (MFA) with various methods, and organization management, which Firebase often lacks or handles less elegantly.
* **Less Flexible Pricing:** Logto's self-hosted option provides more cost control. Its cloud offering is more tailored for enterprise use cases with clearer pricing models than Firebase's pay-as-you-go model, which can be difficult to predict.
* **Open Source:** Logto's open-source nature means you can inspect the code, host it anywhere, and contribute to its development, avoiding vendor lock-in. 