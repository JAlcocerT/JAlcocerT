---
title: "What is Typescript? Is it > JavaScript ?"
date: 2025-08-14
draft: false
tags: ["SSG","Web","Yarnness x Knitting","Makefile"]
description: 'TS and how easy is for everyone to get an Astro SSG blog.'
url: 'whats-typescript'
---

**TL;DR:**

It was about time to recap with it can be done with [TypeScrypt](#ts) (and what not)

+++ Update on [knitting blog](#a-blog-for-all) *for a future entrepreneursheep*

**Intro**

Quite a few years back, a colleague mentioned that we should learn about TS and just create some paid [PowerBI panels](https://jalcocert.github.io/JAlcocerT/about-powerbi/) that we could sell.

We did not.

But between all the websites Ive been exploring with, its time to put together [what it is TS](#ts) and how it superseeds [JS](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/).

## TS

If you know [JS](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/), going to TS *should be relatively* simple.

You can get to know the Docs of any **npm package** that uses typescript: <https://tsdocs.dev/>

### TS x PB

You could even use **TypeScript with Pocketbase**.

> And avoid writing Python code at all

A TypeScript class is *not* limited to being the UI client.

TypeScript is a superset of JavaScript.

Since JavaScript can run on both the front-end (in a browser) and the back-end (using a runtime like Node.js)...

... TypeScript can be used in both places as well!

{{% details title="About TS Classes and PB... 🚀" closed="true" %}}

However, the key distinction in the original comparison was about the **location and nature of the logic**, not the language itself.

* When I said **"TypeScript class connected to PocketBase"**, I was assuming a common and simple use case: a class within a **client-side application** (like a React or Angular app) that directly uses the PocketBase SDK to interact with the database. In this scenario, the TypeScript code is the "UI client" because it's running in the user's browser, handling the user interface and making direct calls to the PocketBase server.

* The **"Flask + PocketBase"** setup, on the other hand, describes a separate **backend server**. This server is not running in the user's browser; it's a completely different application. The UI client (which could be written in TypeScript, or any other language) makes requests to the Flask server, and the Flask server then handles the complex logic before communicating with PocketBase.

**Where TypeScript can be a backend**

You can absolutely use TypeScript to build a backend server, just like you would with Flask or any other backend framework.

For example, you could use a framework like **NestJS** or **Express.js** with TypeScript to create a powerful backend API.

In that case, the architecture would look like this:

**TypeScript UI Client** ---(API calls)---> **TypeScript Backend Server** ---(database calls)---> **PocketBase**

In this architecture, the "TypeScript Backend Server" would be the equivalent of the "Flask" part in the original comparison. 

It would have the same ability to handle complex logic, middleware, and custom API endpoints.

So, to clarify:

* A **TypeScript class** in a simple client-side application is the "client."
* A **TypeScript class** (or an entire application) can also be a backend server, which would allow it to handle complex logic in the same way Flask does.

The original comparison was designed to highlight the difference between a direct client-to-database connection and a more robust client-to-backend-to-database architecture, regardless of the language used for the client or backend.

{{% /details %}}



---

## Conclusions

Thats about typescript.

At least for now.

Now: Do you need to be a WebDev to get a cool blog and write publically on the internet?

Not really.

Just get up to date from time to time.

Good recap of whats going on at JS: https://stateofjs.com/en-US

### A blog for All

See how quickly you can get a cool (and OSS'ed) Astro Theme going:

Knitting blogging theme: 

```sh
git clone https://github.com/hasinhayder/storyteller-astro
cd storyteller-astro
npm install
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

> **MIT** | An elegant and minimal blogging/coding/programming theme for Astro

You can ask now coding agents (Cursor, Windsurf, Copilot...) to guide you.

But basically you can do `CTRL+F` to find which files drive which content.

A good starting point is always `./src/content` where you will see some kind of `/blog` or `/article` folder with the markdowns that drive the content of your blog.

> Just edit one and start writing your thing, is that simple!

> > Normally the themes bring some instruction on [how to edit them](https://github.com/hasinhayder/storyteller-astro?tab=readme-ov-file#-content-creation)

When you are confortable with this, *if you want to share it publically*, you have one more step.

Deploy your new blog statically to your preferred solution:

{{< cards cols="2" >}}
  {{< card link="https://fossengineer.com/alternatives-for-hosting-static-websites/" title="Static Hosting Alternatives ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-astro/" title="Astro SSG Static Hosting | Docker Config 🐋 ↗" >}}
{{< /cards >}}


You can also create a quick `make` command that will build and push your changes (manually) to CF, Firebase or any of those.

See the example [here](#faq).


If you are **using Windows**, install npde/npm fast: *thanks to [chocolatey](https://jalcocert.github.io/JAlcocerT/how-to-use-chocolatey-windows/)*

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

> Later on, if you get a domain with Cloudflare, you can also use them for *free tier* static hosting.

{{< youtube "uyXdHC95cU0" >}}

<!-- https://youtu.be/uyXdHC95cU0 -->

> > Yes, FREEEE hosting

You might also need some [git tricks](https://jalcocert.github.io/JAlcocerT/git-recap/):

```sh
choco install gh
gh auth login
```

---

## FAQ

Example **Makefile** for astro: https://github.com/JAlcocerT/Home-Lab/blob/main/ssg-astro/Makefile

As someone told me: *nobody cares about your readme, just make so that your apps can start with one command*

```makefile
# Default make goal
.DEFAULT_GOAL := help

.PHONY: install
install: ## Install Node.js dependencies
    npm install

.PHONY: dev
dev: ## Start development server on http://localhost:4321
    npm run dev -- --host 0.0.0.0 --port 4321

.PHONY: build
build: ## Build the Astro site for production
    npm run build

.PHONY: preview
preview: ## Preview the production build locally
    npm run preview

.PHONY: clean
clean: ## Clean build artifacts and node_modules
    rm -rf dist node_modules

.PHONY: help
help: ## Show this help
    @powershell -Command "Get-Content Makefile | Select-String '^[a-zA-Z0-9_.-]+:.*?##' | ForEach-Object { $$line = $$_.Line; if ($$line -match '^([a-zA-Z0-9_.-]+):.*?##\s*(.+)') { Write-Host ('{0,-20} {1}' -f $$matches[1], $$matches[2]) -ForegroundColor Cyan } }"
```

### Why I Learnt some JS

**React and Alpine.js** are indeed frameworks, but they serve different purposes compared to the CSS frameworks discussed in the blog post.

They are primarily used for building user interfaces and managing application behavior, focusing more on JavaScript-based functionality rather than styling. 


**Astro:**

* https://github.com/Tailus-UI/astro-theme
* https://github.com/shaunchander/astro-pwa-starter
* https://astro.build/themes/details/starlight/
* https://astro.build/themes/details/stardoc/
* https://github.com/christian-luntok/astro-nutritrack
* https://github.com/Johnkat-Mj/agency-landing-page-Astrojs


**Some astro themes uses markdoc - a markdown superset** 


NextJS

* https://vercel.com/templates
* Taxonomy - https://github.com/shadcn-ui/taxonomy

Why SSGs?

READY TO ENTER THE MATRIX?

Which [Static Site Generator](https://jamstack.org/generators/) to use?

Zola

* https://www.getzola.org/documentation/getting-started/overview/

Gridsome

* https://github.com/gridsome/gridsome
* https://github.com/gridsome/gridsome?tab=MIT-1-ov-file#readme

⚡️ The Jamstack framework for Vue.js


* <https://theme-hope.vuejs.press/>

Hexo

* <https://hexo.io/>
* <https://hexo.io/themes/>
* <https://jamstack.org/generators/hexo/>
* <https://github.com/hexojs/awesome-hexo>

* <https://sharvaridesai.github.io/hexo-theme-edinburgh-demo/>

### JS Frameworks for SSG's

#### VUEjs

* https://github.com/vuejs/core?tab=MIT-1-ov-file#readme

> The Progressive JavaScript Framework

Vue.js (pronounced /vjuː/, like view) is an open-source JavaScript framework for building user interfaces (UIs) and single-page applications (SPAs).

Vue.js is a progressive framework, meaning it can be used incrementally to add interactivity to existing HTML pages or to build complex SPAs from scratch.

It is also component-based, meaning that UIs are built by composing reusable pieces called components. This makes it easy to create maintainable and scalable applications.

Vue.js is reactive, meaning that it automatically updates the UI when the underlying data changes. 


#### React JS

* https://github.com/facebook/react?tab=MIT-1-ov-file#readme

> The library for web and native user interfaces.

Component-Based Architecture: Both React and Vue.js are component-based, allowing you to build complex UIs by composing reusable components. This promotes code maintainability and scalability.


Declarative Style: They use a declarative approach where you describe what the UI should look like, and the libraries handle the updates when the data changes. This makes the code easier to read and reason about.

Virtual DOM: Both React and Vue.js utilize a virtual DOM, which is an in-memory representation of the real DOM. This allows them to efficiently update the actual DOM, optimizing performance.

Large Communities: Both have large and active communities, providing extensive resources, libraries, and support.

##### NextJS

Next.js: A React framework built for server-side rendering and static site generation.

It simplifies complex functionalities like routing, data fetching, and code-splitting, making it a popular choice for building modern and performant web applications with React.


#### Svelte

*https://github.com/sveltejs/svelte?tab=MIT-1-ov-file#readme

Svelte: A relatively new framework gaining traction due to its innovative approach.

Svelte compiles components into highly optimized vanilla JavaScript code, resulting in smaller bundle sizes and potentially faster performance compared to frameworks relying on a virtual DOM.

> Write breathtakingly concise components using languages you already know — HTML, CSS and JavaScript. Oh, and your application bundles will be tiny as well.

Svelte is a relatively new but rapidly growing JavaScript framework for building user interfaces. It offers a unique approach that sets it apart from other popular frameworks like React or Vue.js. Here's a breakdown of Svelte's key characteristics:


Unlike React and Vue.js, which rely on a virtual DOM for updates, Svelte takes a different approach. 

It compiles your Svelte components into highly optimized vanilla JavaScript code during the build process.

This compiled code directly updates the DOM, eliminating the need for a virtual DOM layer and potentially resulting in smaller bundle sizes and faster performance.


### React

* {{< newtab url="https://.github.io//" text="The  Official Site" >}}
* {{< newtab url="https://github.com//" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com//?tab=AGPL-3.0-1-ov-file#readme" text="aGPL 3.0" >}} ❤️

https://fullpage.caferati.me/page-two
https://github.com/rcaferati/react-awesome-slider

**React is a JavaScript** library developed by Facebook for building user interfaces. It is one of the most popular tools for developing web and mobile applications. React's main focus is on creating components—reusable, encapsulated elements that manage their own state. This approach makes it easier to develop complex applications with data that changes over time.

Key features of React include:
- **Component-Based Architecture**: This allows developers to build encapsulated components that manage their state, then compose them to make complex user interfaces.
- **Virtual DOM**: React abstracts away the actual rendering to the browser's DOM and instead operates on a virtual DOM. This abstraction allows React to optimize updates to the real DOM, which improves performance.
- **JSX**: React uses JSX, a syntax extension that allows HTML to be written within JavaScript code, making the code easier to understand and debug.

React is widely used for its efficiency, flexibility, and broad community support. It's suitable for developing large-scale applications, particularly single-page applications where components need to react smoothly to data changes.

### Alpine.js

Alpine.js is a relatively new framework that offers you the reactive and declarative nature of bigger frameworks like React or Vue but with much less overhead. 

It is designed for adding simple interactive behavior to your HTML, making it a great choice for sprucing up otherwise mostly static web pages.

Key features of Alpine.js include:

- **Lightweight**: It has a small footprint, making it ideal for projects where you want interactivity without the overhead of more massive frameworks.
- **Declarative**: You can manipulate DOM elements declaratively using directives similar to Angular or Vue, making your HTML more readable and maintainable.
- **No Virtual DOM**: Unlike React, Alpine.js works directly with the real DOM, making it simpler and more straightforward, though possibly less optimized for highly dynamic content.

Alpine.js is particularly well-suited for adding simple interactive features to websites, like dropdowns, modals, and tabs without needing to refactor into a fully component-based architecture like you might with React or Vue.

In summary, while React and Alpine.js are not CSS frameworks, they play a crucial role in web development for managing behaviors and interactions in applications, complementing the stylistic functions that CSS frameworks handle.


React and Alpine.js are two prominent libraries used in web development, but there are several other tools in the ecosystem that offer similar functionalities, focusing on building interactive and efficient user interfaces.

Let's discuss three such libraries, including Svelte, and clarify the role of TypeScript in this context.

### 1. Svelte

**Svelte is a modern JavaScript framework** that shifts much of the work typically done at runtime (like in React and Vue) to compile time. 

Instead of using a virtual DOM, Svelte writes code that surgically updates the DOM when the state of your app changes. 

This approach results in faster initial loads, smoother updates, and generally more efficient applications.

**Key Features of Svelte:**
- **No Virtual DOM**: Direct manipulation of the DOM to avoid the performance cost of the virtual DOM diffing algorithm.
- **Reactivity**: Offers built-in reactivity without requiring additional libraries or tools.
- **Compile-time Framework**: Svelte compiles your components into efficient imperative code that directly updates the DOM.

Svelte is gaining popularity for its innovative approach and is considered ideal for developing highly performant web applications with less boilerplate code than frameworks that rely on a virtual DOM.

### 2. Vue.js

Vue.js is often compared to React for its component-based architecture and its use of a reactive and composable view layer. Vue is highly adaptable and integrates easily with other libraries or existing projects.

It is also capable of powering sophisticated Single-Page Applications when used in combination with modern tooling and supporting libraries.

**Key Features of Vue.js:**
- **Reactivity**: Implements a data-driven approach to manage state and render updates to the DOM.
- **Component-Based Architecture**: Like React, Vue focuses on building reusable components.
- **CLI & Accompanying Libraries**: Offers a robust CLI and additional libraries for routing and state management similar to React’s ecosystem.

Vue.js is preferred by developers who want a gentle learning curve and a highly declarative approach to building user interfaces.

### 3. Angular

Angular, maintained by Google, is a platform and framework for building client-side applications. 
It uses TypeScript by default and offers a comprehensive solution with a wide range of tools for developing everything from a simple webpage to complex enterprise applications.

**Key Features of Angular:**
- **TypeScript-based**: Angular is built with TypeScript, providing robust typing and object-oriented features.
- **Comprehensive Framework**: Includes built-in solutions for routing, forms management, client-server communication, and more.
- **Modular Development Structure**: Encourages code organization through modules, components, services, and more.

Angular is a good choice for enterprises and developers who favor an all-inclusive platform that provides everything needed to build large-scale applications.

### TypeScript

TypeScript is not a competitor to React, Alpine.js, or Svelte. Instead, it's a superset of JavaScript that adds static types to the language. 

TypeScript is designed to help developers write more robust code and can be used with any JavaScript library or framework, including React, Vue, Angular, and Svelte.

It is particularly popular in environments where code reliability and scalability are critical, such as large-scale applications.

In summary, Svelte, Vue.js, and Angular are some of the main competitors to React, each offering unique advantages for different use cases in web development. 

TypeScript, while not a framework, enhances these technologies by providing type safety and scalability in developing complex applications.

---

Yes, Svelte, Vue.js, Angular, and React are all JavaScript frameworks or libraries.

They're used primarily for building interactive web applications by manipulating the DOM and managing the application's state.

Here's how they relate to Astro, and a clarification on Hugo:

**JavaScript Frameworks Compatible with Astro**

Astro is a modern web framework designed to deliver fast, optimized websites with a component-based architecture.

It allows you to use multiple frameworks within the same project, so you can choose the best tool for each part of your application.

Here’s how Astro works with some of the JavaScript frameworks:

- **React**: Astro supports React out of the box. You can use React components directly within Astro files.
- **Svelte**: Astro also supports Svelte components, allowing you to integrate them seamlessly within your projects.
- **Vue.js**: Like React and Svelte, Vue.js is fully supported in Astro, enabling you to use Vue components.
- **Preact**: Astro supports Preact as a lighter alternative to React.
- **Solid.js**: Astro includes support for Solid.js, which is another reactive JavaScript library similar to React but more performant in certain scenarios.

Astro's architecture is built to leverage the strengths of these frameworks where necessary, while still allowing for static optimizations. You can integrate and use these frameworks in parts of your application that require dynamic client-side interactions.

**Hugo and JavaScript**

Hugo, on the other hand, is a static site generator and not a JavaScript framework.

It is primarily used to build static websites quickly by processing your content files (like Markdown) and templates into HTML. 

Here’s how it generally uses JavaScript and CSS:

- **JavaScript**: Hugo does not inherently use or require JavaScript. However, you can certainly add JavaScript to your Hugo sites to enhance functionality or add client-side interactivity. This integration is manual, meaning you add JavaScript files to your static assets or link to external scripts in your templates.

- **CSS**: Hugo manages styles using traditional CSS or preprocessors like SCSS, which you can integrate into your build process. Hugo itself doesn’t dictate how you should use CSS; rather, it provides the means to incorporate whatever styling methodology or framework you prefer.

In summary, while Astro is designed to integrate with various JavaScript frameworks effectively, allowing a mix-and-match approach to building components, Hugo is much simpler. 

It focuses on generating static sites and leaves the choice of adding JavaScript or CSS frameworks up to the developer. 

This approach makes Hugo extremely fast and efficient for generating websites where extensive client-side interaction is not required.

One of the standout features of Astro is its ability to use **more than one JavaScript framework within the same project**. 

This capability allows you to leverage the specific strengths of each framework where they are most effective, providing a highly flexible and powerful approach to building websites.

**How Astro Supports Multiple JavaScript Frameworks**

Astro is designed to be framework-agnostic, meaning you can incorporate components from different frameworks seamlessly. Here’s how it works:

1. **Component Isolation**: Each component in Astro can be written using a different framework. For instance, you can have React components, Vue components, and Svelte components all in one project. Astro handles these components independently, using the appropriate renderer for each type.

2. **Framework Renderers**: Astro uses what are called "renderers" to manage the integration of different frameworks. You need to install a renderer for each framework you want to use. For example, to use React and Svelte, you would install `@astrojs/react` and `@astrojs/svelte` respectively.

3. **Isolated Client-Side Hydration**: Astro builds your site as static HTML by default, which helps with loading performance and SEO. However, when you need interactivity, Astro can "hydrate" specific components on the client side. This means that you can have a mostly static site but enable certain parts to be dynamic and interactive using whichever JavaScript framework you prefer for those parts.

4. **Selective Hydration**: This feature allows you to control which components are hydrated and when. You can specify that a component should hydrate only on user interaction, such as a click or a scroll, which further optimizes performance.

Practical Use Case

For example, you might decide to use:
- **React** for complex state management parts of your application because of its robust ecosystem and advanced state management libraries like Redux or Context API.
- **Vue** for sections that benefit from its easy-to-understand templating system and straightforward syntax.
- **Svelte** for parts of the interface that demand maximum performance and minimal overhead, given its compile-time approach to building user interfaces.

This approach allows developers to pick the most suitable tool for each part of their project without committing to one single framework for the entire application.


Astro’s capability to integrate multiple JavaScript frameworks not only makes it versatile but also highly effective for building modern web applications that are optimized for performance and scalability. 

This flexibility is especially useful for teams with expertise in different frameworks or for projects that require specific features from multiple technology stacks.

### I Really Know nothing about Web Development - Frameworks?

#### CSS

The Framework/Libraries	Description	Relation to CSS:

* Bootstrap	A popular CSS framework for building responsive and visually appealing web applications. It provides a set of pre-designed components, styles, and a grid system to streamline web development.	Bootstrap uses CSS extensively to style its components and layout. Developers can customize Bootstrap's appearance by overriding its default CSS rules or by writing their custom CSS.

* Tailwind CSS	A utility-first CSS framework that allows developers to build web interfaces by composing classes directly in HTML. Tailwind CSS provides a large set of pre-defined utility classes, making it easy to style and layout elements.	Tailwind CSS relies heavily on CSS classes, which are generated based on the utility classes defined in the framework. Developers use these classes directly in HTML to style elements and create layouts without writing custom CSS.

* Emotion	A JavaScript library for writing CSS styles with JavaScript. It allows developers to define and manage styles in a more programmatic way using JavaScript or TypeScript. Emotion can be used with 

* React, Vue, or standalone.	Emotion enables developers to write CSS styles as JavaScript objects or template literals. These styles can be dynamically generated and scoped to specific components, making it easier to manage styles in a component-based architecture. Emotion ultimately generates CSS at runtime.
