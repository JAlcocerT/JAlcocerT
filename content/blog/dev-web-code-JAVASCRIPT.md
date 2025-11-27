---
title: "JS to make Cooler Webs"
date: 2025-01-12T23:20:21+01:00
draft: false
tags: ["Dev","React","Web","Skulpt","Javascript Frameworks"]
description: "Javascript 101 I find amazing to make nice UI/X for Websites"
url: 'javascript-for-static-websites'
---

**Intro**

Ive learnt all of this **about JS** thanks to tinkering with the [Astro](https://jalcocert.github.io/JAlcocerT/create-your-website/#what-ive-learnt-about-astro) and [NextJS](https://fossengineer.com/nextjs-ssg/) web frameworks.

As im not a web dev, Im collecting here all the high level info that might be helpful to get a **mindmap about javascript**.

## JS 101

JavaScript can run on both the front-end (in a browser) and the back-end (using a runtime like Node.js).

{{< callout type="info" >}}
See more at https://github.com/sorrycc/awesome-javascript
{{< /callout >}}

For me, javascript is a mean to make cooler websites: *normally im using these SGGs*

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-astro-as-website/" title="Astro 101" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/" title="HUGO 101" >}}
{{< /cards >}}

But be aware that JS can do front end as well as backend tasks.

> And you will find many tools wrapped into JS SDK (also in Python).


**Frontend (FE) Frameworks** 

* React: A library for building user interfaces with a component-based architecture, popular for its declarative approach to UI development.

* Angular: A comprehensive, opinionated framework for building large-scale, enterprise-level single-page applications.

* Vue.js: A progressive framework known for its simplicity and ease of use, suitable for everything from simple UIs to complex SPAs.

> Example of VueJS SPA: https://github.com/JAlcocerT/serverless-invoices 

> > Also SliDev, PPT as a Code!

* Svelte: A compiler that transforms your code into small, highly efficient bundles, eliminating the need for a virtual DOM at runtime.

**Backend (BE) Frameworks**

* Node.js: A JavaScript runtime environment that allows developers to execute JavaScript code outside of a web browser, making it the foundation for most backend JS frameworks.

* Express.js: A minimalist and flexible Node.js web application framework that provides a robust set of features for building web and mobile applications.

* NestJS: A progressive Node.js framework for building efficient, reliable, and scalable server-side applications with a structured, modular design.

* Next.js: A React framework for building full-stack web applications with features like server-side rendering, static site generation, and API routes.


### JS Dependency Management

Same that we do `pip install pandas` in Python.

We need to do within Javascript packages to work.

1. NPM

2. BUM

{{% details title="Put simply 🌍" closed="true" %}}

{{% /details %}}


3. https://github.com/denoland/deno

> A modern runtime for JavaScript and TypeScript.

> > And now we can **run js on jupyter `.ipynb`**!


<!-- 
https://www.youtube.com/watch?v=pcC4Dr6Wj2Q -->

{{< youtube "pcC4Dr6Wj2Q" >}}

### Managing Packages for SSGs

For SSGs that are using Node (like Astro), you can get to know the Docs of any **npm package** that uses typescript: <https://tsdocs.dev/>

> NPM Packages? Yes, and you can manage them with


{{< dropdown title="PNPM | Example with astrozinc theme ⏬" closed="true" >}}

Some themes will work only with this package manager...

* https://github.com/exylons/astrozinc

```sh
git clone https://github.com/exylons/astrozinc
cd .astrozinc

npm install -g pnpm

# Install dependencies
pnpm install

# Start the dev server
pnpm dev

pnpm build 
```

{{< /dropdown >}}

* Yarn - another package manager

## React

Im not talking about AI and LLMs now (ReACT).

React and Vue.js are two popular tools used to build modern websites and web applications. Both help developers create interactive user interfaces, but each has its own style and approach.

React is a JavaScript library for building user interfaces by breaking them down into small reusable pieces called “components”.

Imagine building a website out of “blocks” that can update themselves when your data changes, so only the parts of the website that need to change will reload—making things smooth and efficient. 
 
React was created by Facebook and is widely used for apps where the user interface changes frequently.

- **Key idea**: Build interactive website pieces (“components”) that update automatically when your data changes.[5][2]
- **Benefit**: Fast, dynamic interfaces without reloading the whole page.[6][7]



## VueJS

Vue.js is another JavaScript framework for building interactive websites, known for being easy to learn and integrate. 

* https://dev.to/truex/top-10-vue-js-libraries-3gj0

Vue pieces together parts of a website with reusable “components” too, and it emphasizes simplicity and flexibility for developers. 

When you change your data, Vue updates the right parts of your site automatically.[2]

- **Key idea**: Build user interfaces with reusable “blocks” that update when data changes.
- **Benefit**: Simple, fast, and flexible—with clean structure for building apps big or small.

Both React and Vue.js let developers create apps where users can interact with the page, and only the necessary parts change, rather than reloading the whole website.

This makes them excellent for building modern, responsive web pages.

## PhotoSwipe


* https://github.com/dimsemenov/PhotoSwipe
  * https://photoswipe.com/

JavaScript **image gallery** and lightbox


> JavaScript image gallery for mobile and desktop, modular, **framework independent**


{{< details title="What it is ? 📌" closed="true" >}}

{{< /details >}}

## Interesting Functionalities with JS

alpineJS

```sh
npm list alpinejs
```

### World Map

I saw this one for the first time at [this Astro Theme, here](https://github.com/JAlcocerT/web3/blob/main/src/components/Globe.tsx).

### Search

Not talking about google/whoogle, but to have search built in into your website:

1. FuseJS - as HUGO PaperMod or Astro celestial docs (this one works even when in dev run)
2. pageFind - as astro starlight


### Image Galleries

* Photoswipe - https://github.com/dimsemenov/PhotoSwipe
  * https://www.launchfa.st/blog/photoswipe-astro
  * https://photoswipe.com/getting-started

```sh
npm install photoswipe react react-dom
```

---

## FAQ

### More JS Related Ideas


#### Skulpt

Skulpt is an entirely **in-browser implementation of Python**.

* <https://skulpt.org/>
    * <https://github.com/skulpt/skulpt>
    * https://skulpt.org/using.html

> Skulpt is a **JavaScript implementation of the Python** programming language.

It allows you to write Python code and execute it directly in a web browser without needing a Python interpreter installed on the client's machine.

Skulpt achieves this by transpiling Python code into equivalent JavaScript code, which can then be executed by the browser's JavaScript engine.

{{< details title="Some things you can do with Skulpt 📌" closed="true" >}}


1. **Interactive Python Console**: You can embed a Python console directly into your web application, allowing users to enter Python code and see the results immediately. This can be useful for educational purposes or for providing a sandbox environment for experimenting with Python code.

2. **Web-Based Python IDE**: You can build a web-based Integrated Development Environment (IDE) for Python development using Skulpt. This would include features like syntax highlighting, code completion, and live code execution.

3. **Educational Resources**: Skulpt can be used to create interactive tutorials, quizzes, and coding exercises for learning Python. Students can write and run Python code directly in the browser, making the learning process more interactive and engaging.

4. **Web Applications**: You can build web applications entirely in Python using Skulpt for the client-side logic. While this approach may not be suitable for performance-critical applications, it can be useful for prototyping, small-scale projects, or applications where Python is the preferred language.

5. **Data Visualization**: You can use libraries like matplotlib and numpy, which have been ported to Skulpt, to create interactive data visualizations directly in the browser using Python code.

It's important to note that while Skulpt allows you to write and execute Python code in the browser, there are limitations compared to running Python code on a traditional Python interpreter.

Skulpt may not support all Python features or libraries, and performance may be slower due to the overhead of transpilation and execution in the browser environment. 

However, for many use cases, Skulpt can be a convenient and effective tool for **bringing Python to the web**.


Yes, you can create a **fully static astro site with Plotly graphs using Skulpt for Python code** execution in the browser. 

Here's how you can approach it:

1. **Static HTML/CSS/JavaScript files**: Create static HTML, CSS, and JavaScript files for your astro site. These files will define the structure, layout, and interactivity of your site.

2. **Include Skulpt and Plotly.js**: Include the Skulpt library and Plotly.js library in your HTML files. You can either download these libraries and include them locally or use CDN links to include them in your web page.

3. **JavaScript for Skulpt integration**: Write JavaScript code to integrate Skulpt into your web page. This code will capture user input, pass it to Skulpt for execution, and display the results back to the user.

4. **Python code for Plotly**: Write Python code using Skulpt to generate the data and configure the Plotly graphs. This Python code will be executed in the browser using Skulpt, and the resulting Plotly graphs will be rendered in the HTML page.

5. **Static hosting**: Host your static astro site on a web server or a static hosting platform. This can be done using services like GitHub Pages, Netlify, or Vercel, which allow you to deploy static websites easily.

By following these steps, you can create a fully static astro site with Plotly graphs, where the Python code for generating the graphs is executed in the browser using Skulpt. 

Users can interact with the site without the need for a backend server, making it lightweight and easy to deploy.

{{< /details >}}

Yes, "Skulpt" relates to client-side rendering in the context of running Python code. 

**Skulpt is a client-side Python implementation** that executes Python code directly in the web browser using JavaScript.

This means the Python code is interpreted and rendered on the client side (in the user's browser) rather than on a server.

Client-side rendering (CSR) refers to the process where the rendering of web content or code execution happens in the browser instead of on the server. 

Skulpt fits this model because it interprets and executes Python code entirely on the client side without requiring server interaction for running the code.

So in this context:

- Skulpt uses client-side rendering to run Python in the browser.
- CSR means client-side rendering, which is a web development technique where the browser handles content rendering.

Therefore, your mention of CSR as client-side rendering is correct, and Skulpt is an example of a tool that uses client-side rendering for Python code execution in browsers.

This distinguishes it from server-side rendering, where code executes on a server and sends pre-rendered content to the client.