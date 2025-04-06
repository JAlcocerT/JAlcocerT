---
title: "A Website for a Phd: Pylinac and QaTrack+"
date: 2025-02-23T13:20:21+01:00
draft: false
tags: ["dev"]
description: 'Helping to improve scientific knowledge. Improving the day to day of a radiotherapy researcher. Containers with WSL.'
url: 'web-for-phd-researcher'
---

It all started when a friend discovered some parts to improve withing this library.

An image analysis library for **medical physics**

* https://github.com/jrkerns/pylinac

> MIT | An image analysis library for medical physics

And also...

* https://github.com/qatrackplus/qatrackplus

> QATrack+ is an open source program for managing the quality control program of radiotherapy and diagnostic imaging clinics.


---

Then I proposed to start documenting his learning process.

## HUGO HEXTRA with Github Pages

I suggested to start by cloning this very same repository.

As the HUGO Hextra theme is just ready to roll.

```sh
git clone
```

You will need to accept to run github actions workflows in the forked repository and activate Github Pages:

![GHA WF Activation](/blog_img/dev/gha-workflows-activation.png)

> That's it, you are already publishing a blog/docs into Github Pages!

* https://imfing.github.io/hextra/docs/guide/shortcodes/tabs/

To run it locally, it was required to:

0. Git was already installed!
1. Download Go: from `go.dev`
2. Download HUGO from [github releases: 0.117](https://discourse.gohugo.io/t/hugo-0-117-0-released/45644) as its the ones that works on Github Actions
3. Get in love with [Hextra Hugo Theme](https://github.com/imfing/hextra)
4. Discover [diagrams with mermaid.js](https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/) (with preview at https://mermaid.live/ ) and get in love with [Katex](https://imfing.github.io/hextra/docs/guide/latex/#supported-functions)!


Commands to know:

```sh
hugo server #.\hugo server if you are on windows
hugo #to render, if you want, aka to build it locally
```

But...changes were pushed to the repo, and nothing happened.

And its all about that when you are forking a repo with **Github Actions workflows**, you need to enable them (understandable, security reasons):

![KeyStatic CMS with LandingPad Theme](/blog_img/dev/gha-workflows-fork-repo.png)

After you have accepted that (one time), all will flow.

And...here it is **the result**: https://jlleongarcia.github.io/jlleongarcia/

> Thanks to: HUGO + Hextra + Github Actions and Pages!

## Conclusions

I hope that this is the beginning of a new journey for jlleongarcia.

A journey where the rest of the world can benefit from his amazing effort and discoveries in the radiophysics area of expertise.

No wonder, he already knows that Im there to help with any Python that could make the world a better place!

{{< callout type="info" >}}
JLL was involved in the crearion of [RStocks](https://jalcocert.github.io/JAlcocerT/R-Stocks/)
{{< /callout >}}

### Next Steps

1. Learn to use **containers**
2. Setup **wsl** within Windows

Right-click on "Windows PowerShell" and select "Run as administrator."

```sh
wsl --install #this install linux
```

Windows will ask you to **restart**.

Then, you can creeate a user and pass for Linux. 

Thats really it!

Log in again to wsl via CMD:

```sh
wsl
```

Right now, you will see that you are using Linux:

```sh
sudo apt update #this is ubuntu already!
sudo apt upgrade -y

#sudo snap install htop
#htop #see how much resources is taking

#to access it at another moment, just write:
#wsl
```

{{< callout type="info" >}}
This is a great moment to [get started with SelfHosting](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/)
{{< /callout >}}

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/why-i-love-containers/" title="Reasons to love containers" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/github-actions-use-cases/" title="Containers are even better combined CICD - Github Actions Post" icon="book-open" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/" title="SelfHosting with Docker Containers 101" >}}
  {{< card link="https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/Selfhosting_101.sh" title="SelfHosting Script" >}}
{{< /cards >}}

{{< callout type="info" >}}
Once containers are installed, **you can bundle your apps** or use the ones that other have created!
{{< /callout >}}

3. To understand better Python Web Frameworks, specially **Django**, as its the one that QaTrack uses


{{< details title="Django's Core Philosophy and Strengths 📌" closed="true" >}}

* **"Batteries Included":**
    * This phrase perfectly captures Django's philosophy. It means that Django provides a comprehensive set of tools and libraries out of the box. You don't have to hunt for third-party packages for common tasks.
* **Convention Over Configuration:**
    * Django promotes a set of conventions for how web applications should be structured. This reduces the amount of configuration you need to do, allowing you to focus on writing code.
* **ORM (Object-Relational Mapper):**
    * Django's ORM is a powerful tool that allows you to interact with databases using Python code. You define your data models in Python, and Django handles the database interactions for you. This makes database operations much easier and more secure.

**Detailed Breakdown of Django's Features:**

* **DRY (Don't Repeat Yourself):**
    * This is a fundamental principle of good software development. Django enforces DRY by encouraging you to reuse code whenever possible. For example, you can define your data models once and reuse them throughout your application. Django's template system also promotes code reuse.
* **Fast:**
    * Django is designed for speed. Its efficient architecture and built-in caching mechanisms allow it to handle a large number of requests quickly.
* **Components:**
    * Django provides a wide range of built-in components, including:
        * **Authentication and Authorization:** Handles user logins, permissions, and security.
        * **URL Routing:** Maps URLs to Python functions (views).
        * **Template System:** Allows you to create dynamic HTML pages.
        * **Form Handling:** Simplifies the process of creating and processing forms.
        * **Admin Interface:** Provides a ready-to-use interface for managing your application's data.
* **Security:**
    * Django has built-in security features that help protect your application from common vulnerabilities, such as:
        * **SQL Injection Protection:** Django's ORM automatically escapes user input, preventing SQL injection attacks.
        * **Cross-Site Scripting (XSS) Protection:** Django's template system automatically escapes HTML, preventing XSS attacks.
        * **Cross-Site Request Forgery (CSRF) Protection:** Django provides built-in CSRF protection.
* **Scalability:**
    * Django is designed to be scalable. Its architecture allows you to easily scale your application to handle increasing traffic and data.
    * Django can work well with load balancers, and database scaling solutions.
* **Community:**
    * Django has a large and active community. This means that you can easily find help and resources when you need them.

**Use Cases:**

* E-commerce websites
* Content management systems (CMS)
* Social networking platforms
* Data analysis and visualization applications
* API development


{{< /details >}}


**In essence:**

Django is a powerful and versatile framework that's well-suited for building complex web applications. 

Its "batteries-included" approach, security features, and scalability make it a popular choice for developers of all skill levels.

5. Write, Write, write! **Markdown is all you need** and Practice makes perfection!

{{< callout type="info" >}}
See https://github.com/joemccann/dillinger as The last **Markdown editor**, ever.
{{< /callout >}}

---

## Cool stuff for Researchers

1. If you are building on top of existing libraries...

* https://github.com/mvantellingen/localshop

> MIT | **local pypi server** (custom packages and auto-mirroring of pypi)

2. https://github.com/vinta/awesome-python

> A great source to get Python ideas (good for the Python unknown unknowns!)