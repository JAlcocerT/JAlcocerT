---
title: "Firebase Auth"
date: 2025-09-13T10:20:21+01:00
draft: false
tags: ["Journal","SaaS Essentials","Social signin/up","Gmail Login"]
url: 'firebase-auth-101'
description: 'Firebase Auth as your WebApp login method. A Serverless Authenticator'
---


**Intro**

Because LogTo email verifications works.

But if you want the gmail social signup/in, you need the paid tier (??? TBC WIP)

Today we are going to use:

* https://firebase.google.com/
    * https://firebase.google.com/


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