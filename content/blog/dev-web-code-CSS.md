---
title: "CSS like a Pro with Tailwind, DaisyUI..."
date: 2024-08-12T23:20:21+01:00
draft: false
tags: ["Dev","DaisyUI","TailWind","Chakra","MUI"]
summary: "CSS Frameworks I find amazing to make nice UI/X for Websites"
---

In case you dont know yet, **CSS** is part of the [front-end of websites](https://roadmap.sh/frontend).

And you can make cool web stuff, easily.

You just need some time to get CSS right:

1. [Tailwind](#tailwind)
- [DaisyUI](#daisyui)
- [Flowbite](#flowbite)

2. Bootstrap


{{< callout type="info" >}}
https://github.com/awesome-css-group/awesome-css 
{{< /callout >}}

## Tailwind

You can observed that many themes are proud to announce that they use Tailwind (CSS).

And after a while tinkering with websites I can now understand why.

Its an awsome library with components, that it is also used to build more libraries on top of it.

* *https://tailwindui.com/components*
  * Example: https://v1.tailwindcss.com/components/cards


I really like the **TW Image gallery**
* TW-Elements - https://tw-elements.com/docs/standard/components/gallery/


* TailWind CSS! ->> `/css/style.css`

### TW-Elements

* https://github.com/mdbootstrap/TW-Elements/ - MIT Licensed
  * https://tw-elements.com/docs/standard/components/gallery/
  * https://tw-elements.com/docs/standard/components/carousel/
  * https://tw-elements.com/docs/standard/components/testimonials/
  * https://tw-elements.com/docs/standard/components/carousel/#docsTabsOverview


> MIT | 𝙃𝙪𝙜𝙚 collection of Tailwind MIT licensed (free) components, sections and templates 😎

### Libraries Built on Top of Tailwind CSS

1. **[Flowbite](https://github.com/themesberg/flowbite)**: Offers interactive components such as modals, dropdowns, and tooltips that can be customized using Tailwind CSS classes.
2. **[DaisyUI](https://github.com/saadeghi/daisyui)**: A popular component library for Tailwind CSS, providing a range of accessible and customizable UI elements like buttons, alerts, and forms.
3. **[Headless UI](https://github.com/tailwindlabs/headlessui)**: Developed by the Tailwind team, Headless UI offers unstyled, accessible components that focus on behavior, leaving the styling to Tailwind.
4. **[Tailwind UI](https://tailwindui.com/)**: A premium collection of fully responsive, pre-built components made by the creators of Tailwind CSS.
5. **[Kitwind](https://github.com/whizkydee/kitwind)**: A component library that provides pre-built UI elements for Tailwind CSS.

### DaisyUI

**Component based CSS** built on top of TailwindCSS utilities.

* https://daisyui.com/components/diff/
  * https://daisyui.com/components/card/
  * https://daisyui.com/components/carousel/#item2

When you **add Daisy UI** to your npm based project like so...

```sh
npm install daisyui
```

For Astro, dpnt forget to add DaisyUI to the **plugins section** in the `tailwind.config.cjs` file:

```cjs
module.exports = {
  content: [
    './src/**/*.{astro,html,js,jsx,svelte,ts,tsx,vue}',
  ],
  theme: {
    extend: {},
  },
  plugins: [require('daisyui')], #add this
};
```

Automatically you can use DaisyUI CSS components by including this simple snippets into your `.mdx`:

* https://daisyui.com/components/toggle/

```html
<input type="checkbox" class="toggle toggle-success" checked="checked" />
```

Daisy UI makes a great abstraction, simplifying a lot of underlying CSS stuff.

These are some of **my favourite DaisyUI components**:

1. **Timeline** - https://daisyui.com/components/timeline/

> See the docs for each of them, because there are slight variations on how to call the components that change their functionality.

Example: class `class="timeline timeline-snap-icon max-md:timeline-compact timeline-vertical` is different than `class="timeline timeline-vertical`

2. Photo **Carousel** with DaisyUI - https://daisyui.com/components/carousel/
* I like the class `carousel carousel-end rounded-box`
* `carousel w-full` also does the trick for me

3. **Modals** - To open content when something is clicked - https://daisyui.com/components/modal/
  * Other components can be places inside that model, like a subscription one

4. Collapse and Accordion
* https://daisyui.com/components/collapse/
* https://daisyui.com/components/accordion/

5. stats shadow and card body are also great
* https://daisyui.com/components/card/
* https://daisyui.com/components/stat/


> https://htmlcolorcodes.com




### Flowbite


To **install flowbite** in your project:

```sh
npm install flowbite
```

And add it to the plugin section like below, at the `tailwind.config.cjs` file:

```js
//.....
	plugins: [
		require('@tailwindcss/typography'),
		require('daisyui'),
		require('flowbite/plugin'), //this one has to be added
	],
```

These are some interesting resources and **components for flowbite** I found interesting:

* https://flowbite.com/docs/getting-started/introduction/
* https://flowbite.com/#components
* https://flowbite.com/blocks/
  * https://flowbite.com/blocks/marketing/login/

{{< details title="Using FlowBite CSS 📌" closed="true" >}}

* https://flowbite.com/blocks/marketing/login/
  * Show the code and **copy the html** and the `tailwind.config.js`
  * Thanks to [**Coding for Entrepreneurs** YT video](https://www.youtube.com/watch?v=J5n1qZNNxfo) and [code](https://github.com/codingforentrepreneurs/kwesforms-landing)


```html
<section class="bg-gray-50 dark:bg-gray-900">
  <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
      <a href="#" class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
          <img class="w-8 h-8 mr-2" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/logo.svg" alt="logo">
          Flowbite    
      </a>
      <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
          <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
              <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                  Sign in to your account
              </h1>
              <form class="space-y-4 md:space-y-6" action="#">
                  <div>
                      <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                      <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="name@company.com" required="">
                  </div>
                  <div>
                      <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                      <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">
                  </div>
                  <div class="flex items-center justify-between">
                      <div class="flex items-start">
                          <div class="flex items-center h-5">
                            <input id="remember" aria-describedby="remember" type="checkbox" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800" required="">
                          </div>
                          <div class="ml-3 text-sm">
                            <label for="remember" class="text-gray-500 dark:text-gray-300">Remember me</label>
                          </div>
                      </div>
                      <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Forgot password?</a>
                  </div>
                  <button type="submit" class="w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Sign in</button>
                  <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                      Don’t have an account yet? <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign up</a>
                  </p>
              </form>
          </div>
      </div>
  </div>
</section>
```

{{< /details >}}

## Competitors to Tailwind CSS

1. **[Bootstrap](https://github.com/twbs/bootstrap)**: One of the most popular CSS frameworks, known for its pre-built components and grid system. Bootstrap differs from Tailwind’s utility-first approach by offering more predefined styles and components.
2. **[Bulma](https://github.com/jgthms/bulma)**: A modern CSS framework that provides a flexible grid system, focusing on simplicity and ease of use.
3. **[Foundation](https://github.com/foundation/foundation-sites)**: A responsive front-end framework providing a variety of pre-built components and layouts.
4. **[Materialize](https://github.com/Dogfalo/materialize)**: Based on Google’s Material Design, Materialize offers pre-styled components with a focus on consistency and aesthetics.
5. **[Chakra UI](https://github.com/chakra-ui/chakra-ui)**: A component library for React that provides customizable, accessible, and modular components, which can be compared to Tailwind when used with libraries like Headless UI.

These libraries and competitors offer different strengths depending on the type of project you are working on, with Tailwind CSS being more flexible and customizable due to its utility-first nature.

---

## More CSS Resources

* https://ui.shadxn.com/docs/registries/shadxn

{{< details title="Infinite Scroll for Astro with CSS 📌" closed="true" >}}

Infinite scroll, Just with CSS! 

As per: https://blog.logto.io/css-only-infinite-scroll

and thanks to [logto blog post](https://blog.logto.io/css-only-infinite-scroll)

```js
---
// Frontmatter script area (JavaScript goes here if needed, but for this example, it's not required)
---

<style>
  .carousel {
    margin: 0 auto;
    padding: 20px 0;
    max-width: 700px;
    overflow: hidden;
    display: flex;
  }

  .carousel > * {
    flex: 0 0 100%;
  }

  .group {
    display: flex;
    gap: 20px;
    padding-right: 20px;
    will-change: transform;
    animation: scrolling 10s linear infinite;
  }

  .card {
    width: 100%;
    color: white;
    border-radius: 24px;
    box-shadow: rgba(0, 0, 0, 10%) 5px 5px 20px 0;
    padding: 20px;
    font-size: xx-large;
    justify-content: center;
    align-items: center;
    min-height: 200px;
  }

  .card:nth-child(1) {
    background: #7958ff;
  }

  .card:nth-child(2) {
    background: #5d34f2;
  }

  .card:nth-child(3) {
    background: #4300da;
  }

  @keyframes scrolling {
    0% {
      transform: translateX(0);
    }
    100% {
      transform: translateX(-100%);
    }
  }

  .carousel:hover .group {
    animation-play-state: paused;
  }
</style>

<div class="carousel">
  <div class="group">
    <div class="card">A</div>
    <div class="card">B</div>
    <div class="card">C</div>
  </div>
  <div aria-hidden="true" class="group">
    <div class="card">A</div>
    <div class="card">B</div>
    <div class="card">C</div>
  </div>
</div>
```

{{< /details >}}

### Material UI - MUI

A Comprehensive **React component library** that implements Google's Material Design.

They claim that it is **Free forever**.

* https://mui.com/material-ui/
* https://mui.com/material-ui/react-image-list/

{{< details title="MUI vs Tailwind CSS 📌" closed="true" >}}

**Material UI** (now called **MUI**) is different from **Tailwind CSS** in many ways, though both are popular in modern web development. Here's a comparison:

1. **Philosophy**:
- **Tailwind CSS**: A **utility-first** CSS framework. It provides low-level utility classes (like `flex`, `mt-4`, or `text-center`) that allow developers to build custom designs directly in their HTML without writing CSS. It's highly flexible and doesn't enforce a design system.
- **MUI**: A **component-based** library built for **React** applications, following **Material Design** guidelines by Google. It provides pre-styled, higher-level components like buttons, cards, and modals with consistent styling. It aims to give developers a consistent design system right out of the box.

2. **Customization**:
- **Tailwind CSS**: Highly customizable via utility classes, making it easy to tailor every element's appearance. There's no predefined design system, allowing complete control over the look and feel of an app.
- **MUI**: Customizable through theming and style overrides, but its design is inherently tied to Google's Material Design system. Customization is possible, but you're working within the bounds of Material Design unless you make significant changes.

3. **Usage**:
- **Tailwind CSS**: Suitable for any front-end framework or plain HTML/CSS projects, making it very flexible. It doesn't assume any specific design style, so it requires more work upfront to define the UI.
- **MUI**: Primarily built for **React** applications, with pre-built React components that can speed up development, especially for those who like Material Design.

4. **Component Library**:
- **Tailwind CSS**: Does not come with pre-built components. However, libraries like **Flowbite** or **DaisyUI** can be added to provide components based on Tailwind's utilities.
- **MUI**: Provides a rich set of pre-built, fully accessible components that adhere to Material Design guidelines, making it a good choice if you want a coherent UI out of the box.

5. **Design System**:
- **Tailwind CSS**: No enforced design system. You create your own design language.
- **MUI**: Based on **Material Design**, which is a widely recognized design system from Google. This ensures consistency, but also limits creativity unless heavily customized.

- **MUI** is better suited if you want a pre-defined, consistent UI system (Material Design) and are working with React.
- **Tailwind CSS** is ideal if you prefer flexibility and control over your design and don't mind building components from scratch or using third-party libraries.

### Links:
- [Material UI GitHub](https://github.com/mui/material-ui)
- [Tailwind CSS GitHub](https://github.com/tailwindlabs/tailwindcss)

{{< /details >}}

### Others



https://github.com/dbohdan/classless-css
https://simplecss.org/

https://flowbite.com/blocks/
https://daisyui.com/

Top 5 Most Popular Free Open-Source CSS Frameworks

In the world of web development, CSS frameworks are essential tools. They help developers build responsive, consistent, and efficient user interfaces without starting from scratch. Below, we explore the top 5 free open-source CSS frameworks that have gained popularity due to their robust features, ease of use, and vibrant communities.


1. Bootstrap

Bootstrap is arguably the most popular CSS framework. Developed by Twitter, it features a responsive grid system, extensive prebuilt components, and powerful JavaScript plugins. Its large community offers extensive documentation, themes, and third-party resources. Bootstrap's flexibility makes it a go-to choice for both beginners and seasoned developers looking to create responsive websites quickly.

* https://github.com/twbs/bootstrap
    * https://github.com/twbs/bootstrap?tab=MIT-1-ov-file#readme

2. Tailwind CSS

Tailwind CSS takes a different approach by offering a utility-first CSS framework that allows you to control layout directly through CSS classes without writing custom CSS. This leads to faster development times and more customizable interfaces. Tailwind is favored for its high customization potential and for promoting a cleaner markup without the excess of unused CSS, thanks to its purge feature.

* https://tailwindui.com/components/preview
* https://tailwindui.com/documentation
* https://github.com/tailwindlabs/tailwindcss
    * https://github.com/tailwindlabs/tailwindcss?tab=MIT-1-ov-file#readme


3. Foundation by ZURB

Foundation is another heavyweight in the CSS framework arena, known for being an advanced responsive front-end framework. It's designed to be both robust and flexible, providing a grid system, HTML and form templates, custom buttons, and other components that adapt smoothly to any device. Developers appreciate Foundation for its accessibility features and professional-grade tools that can handle complex web applications.

4. Bulma

Bulma is a modern CSS framework based on Flexbox, which makes building responsive and mobile-first websites straightforward. It's admired for its readable syntax and solely CSS components (no JavaScript dependencies). Bulma is perfect for developers who want to incorporate a framework that stays out of the way and focuses on speed and simplicity.

5. Semantic UI

Semantic UI sets itself apart with a focus on human-friendly HTML. It offers a semantic style of coding that aims to make the code more readable and easier to update. It provides a wide range of pre-designed elements like buttons, loaders, and collections that can be customized extensively using less complicated and more intuitive classes. Semantic UI's integration with third-party libraries also makes it highly flexible.

---

## Conclusions


The CSS tools and frameworks mentioned can be organized based on their core architectural approach, particularly whether they are **Utility-First** or **Component-Based**.

1. Utility-First Frameworks (The Foundation)

These frameworks provide a large set of single-purpose, low-level classes (utilities) that you compose directly in your HTML to build custom designs.

  * **Tailwind CSS**
      * *Description:* The primary example of a utility-first framework. Highly customizable, promotes clean markup, and relies on configuration to remove unused CSS (purging).
      * *Related:* **Tachyons** (Another example of a Functional/Utility CSS framework).

2. Component Libraries Built **On Top of Tailwind CSS**

These libraries leverage Tailwind's utility classes to provide pre-styled, high-level components (like buttons, carousels, modals).

They act as an abstraction layer, simplifying development by reducing the need to manually compose utilities.

  * **DaisyUI**:A popular, component-based CSS library built directly on top of Tailwind CSS utilities, offering accessible and customizable UI elements.
  * **Flowbite**: Offers interactive components (modals, dropdowns) and blocks that utilize Tailwind CSS classes.
  * **TW-Elements**: A large collection of MIT-licensed (free) components, sections, and templates built using Tailwind CSS.
  * **Tailwind UI**: A premium collection of fully responsive, pre-built components made by the creators of Tailwind CSS.
  * **Headless UI**: Developed by the Tailwind team; offers **unstyled, accessible components** that focus on behavior, leaving the styling entirely to Tailwind CSS utilities.
  * **Kitwind**: A component library providing pre-built UI elements for Tailwind CSS.

3. Traditional (Component-First) and Other Frameworks (The Competitors)

These frameworks typically offer a predefined look, pre-built components, and a robust grid system.

They differ from Tailwind's utility-first approach by being more prescriptive.

  * **Bootstrap**
      * *Description:* Arguably the most popular, known for its extensive pre-built components, grid system, and JavaScript plugins.
  * **Bulma**
      * *Description:* A modern, purely CSS framework based on Flexbox, known for its simplicity and lack of JavaScript dependencies.
  * **Foundation by ZURB**
      * *Description:* An advanced, robust, and responsive front-end framework often used for complex applications, known for its accessibility focus.
  * **Materialize**
      * *Description:* Based on Google’s **Material Design**, offering pre-styled components focused on aesthetics and consistency.
  * **Semantic UI**
      * *Description:* Focuses on human-friendly, intuitive HTML and semantic class names.

4. Specialization and React Libraries

These frameworks address specific niches or are primarily designed for use within a specific UI library (like React).

  * **PicoCSS**
      * *Description:* A **classless** framework focusing on minimalism and simplicity; styles are applied directly to plain HTML elements.
  * **Material UI (MUI)**
      * *Description:* A comprehensive **React component library** that implements Google’s Material Design.
  * **[Chakra UI](https://github.com/chakra-ui/chakra-ui)**
      * *Description:* A customizable, accessible, and modular **component library for React**.
  * **Others (Classless CSS)**
      * `simplecss.org/`
      * `github.com/dbohdan/classless-css`
  * **Others (Shadcn UI)**
      * `ui.shadxn.com/docs/registries/shadxn`

**Not all of them are pure CSS frameworks.** 

Some are indeed flavors of **React component libraries**, while others are specifically designed to complement React or other JavaScript frameworks.

Pure CSS vs. Framework-Specific Libraries

| Category | Libraries/Frameworks | Core Technology | Notes |
| :--- | :--- | :--- | :--- |
| **Pure CSS Frameworks** | **Tailwind CSS**, **Bootstrap**, **Bulma**, **Foundation**, **PicoCSS**, **Semantic UI** | CSS | You can use these in any project (plain HTML, Astro, React, Vue, etc.) by importing the CSS file. |
| **Tailwind Component Libraries** | **DaisyUI**, **Flowbite**, **TW-Elements**, **Headless UI**, **Tailwind UI** | CSS (Built on Tailwind) | These are primarily CSS/HTML component sets that require **Tailwind CSS** to function. Headless UI often includes accompanying React/Vue hooks for behavior. |
| **React Component Libraries** | **Material UI (MUI)**, **Chakra UI** | JavaScript (React) + CSS-in-JS/Styled Components | These are tightly integrated with **React**. You install them via NPM and use them as `<Component />` tags in your JSX. |


### Pure CSS Frameworks (e.g., Bootstrap, Tailwind)

These frameworks provide a set of styles and utility classes that are applied directly to your HTML markup, regardless of the JavaScript framework you are using.

* **Example (Tailwind):** You write `<div class="bg-blue-500 p-4"></div>`. This works in plain HTML, an Astro file, a Vue component, or a React component.
* **Astro Compatibility:** This is why frameworks like Bootstrap, Bulma, and Tailwind are easily compatible with Astro—Astro is UI-agnostic and simply renders the final HTML that includes these CSS classes.

### React Component Libraries (e.g., MUI, Chakra UI)

These are fundamentally different. They are **JavaScript libraries** specifically built for the React ecosystem.

* **Integration:** You don't just import a CSS file; you import actual JavaScript components. They manage their styling internally, often using advanced techniques like CSS-in-JS or Emotion.
* **Example (MUI):** You write `<Button variant="contained">Click Me</Button>`. This is a React component that handles its own styling, state, and accessibility properties. It **only works** within a React application.

### Headless/Hybrid Libraries (e.g., Headless UI)

These are interesting hybrids, especially prevalent in the Tailwind ecosystem.

* **Focus:** They focus only on the **behavior** and **accessibility** of components (e.g., making a dropdown open/close correctly and be navigable by keyboard) but provide **no styling** (hence "headless").
* **Usage:** They provide React hooks or components that you then fully style using your preferred CSS solution, which is almost always **Tailwind CSS**. This combines the accessible logic of a dedicated component with the total styling flexibility of utility classes.

---

## FAQ

### Which of these CSS frameworks can I use with Astro?

> Astro is UI-agnostic, meaning you can Bring Your Own UI Framework (BYOF). React, Preact, Solid, Svelte, Vue, and Lit are all officially supported in Astro. You can even mix and match different frameworks on the same page, making future migrations easier and preventing project lock-in to a single framework.

Astro, the all-in-one web framework, supports using various CSS frameworks out of the box. Among the CSS frameworks listed:

    Bootstrap: Astro can integrate Bootstrap through npm packages or by using the CDN link in your project.
    Tailwind CSS: Tailwind is especially popular in the Astro community due to its utility-first approach, and there are official plugins available for easy integration.
    Foundation: Like Bootstrap, Foundation can be added to your Astro project either via npm or CDN.
    Bulma: You can use Bulma with Astro by installing it from npm or linking to its CDN in your project files.
    Semantic UI: This can also be integrated into Astro projects similarly through npm installation or CDN links.

For detailed instructions on integrating these frameworks, refer to the Astro documentation and the respective framework’s installation guides.

Absolutely, PicoCSS is one of the CSS frameworks you can use with Astro, along with many others. Astro is quite flexible when it comes to integrating various CSS frameworks, whether they are traditional, utility-first, or even component-specific frameworks. Here’s a look at PicoCSS and a few other CSS frameworks you might consider for your Astro projects:

### PicoCSS

PicoCSS is known for its minimalistic approach, focusing on simplicity and elegance. It is a classless framework, meaning it styles standard HTML elements directly without the need for additional classes, making it exceptionally straightforward to use, especially for simpler, content-heavy sites.

**Key Features of PicoCSS:**
- **Classless**: Styles are applied directly to plain HTML, making it quick and easy to get a beautifully styled site without wrestling with complex class hierarchies.
- **Dark mode support**: Automatically supports dark mode based on the user's system preferences.
- **Form-styling**: Offers good-looking form elements out of the box, which is often a challenge with other classless frameworks.

### Other CSS Frameworks Compatible with Astro

Here are some additional CSS frameworks you can use with Astro, each offering different advantages depending on your project needs:

1. **Tailwind CSS**
   - **Utility-first**: Provides low-level utility classes that you can compose to build custom designs directly in your markup.
   - **Highly customizable**: Easily tailor the framework to fit your design needs through configuration files.
   - **Performance**: Tailwind removes unused CSS automatically with PurgeCSS integrated during the build process, ensuring your production builds are optimized.

2. **Bootstrap**
   - **Feature-rich**: Comes packed with ready-to-use components that are responsive and customizable.
   - **Large community and ecosystem**: Extensive documentation and community support make it a reliable choice for many developers.

3. **Bulma**
   - **Modern and flexible**: Based on Flexbox, Bulma is purely CSS (no JavaScript) and is known for its easy-to-understand syntax.
   - **Responsive**: Like Bootstrap, it includes a responsive grid system and UI components that adjust to different screen sizes.

4. **Tachyons**
   - **Functional CSS**: Similar to Tailwind, it offers single-purpose classes that aim to reduce the frequency of using custom CSS by providing many utility classes.
   - **Fast load times**: It promotes the creation of fast-loading, highly readable code.

### Integrating CSS Frameworks in Astro

To integrate a CSS framework in Astro, you typically import the framework's CSS file in your Astro component or in the global `src/styles/global.css` file if you want the styles available throughout your entire application. For instance:

```astro
---
// Import a CSS framework directly in an Astro component
import 'path_to_framework/dist/css/framework.css';
---
```

This setup allows you to leverage the power of Astro's component architecture while styling your application with any CSS framework you choose, matching your project's aesthetic and functional requirements. Whether you prefer a utility-first approach with Tailwind CSS, a traditional approach with Bootstrap, or a minimalistic, classless approach with PicoCSS, Astro's flexible project structure supports them all effectively.

### Can I use these frameworks for commercial projects?

Yes, all the CSS frameworks listed—Bootstrap, Tailwind CSS, Foundation, Bulma, and Semantic UI—are open-source and free to use for both personal and commercial projects. They are released under licenses that permit such use, but it's always a good idea to review the license details to ensure compliance with any specific requirements they might have.
Are these frameworks suitable for beginners?

    Bootstrap and Bulma are particularly beginner-friendly due to their comprehensive documentation and large communities. They provide ready-to-use components that help newcomers get up to speed quickly.
    Tailwind CSS, while having a steeper learning curve due to its utility-first approach, is highly documented and supported by a vibrant community, making it accessible once the initial concepts are grasped.
    Foundation and Semantic UI offer more advanced features, which might be a bit challenging for absolute beginners but are still manageable with some web development background.

How do I choose the right framework for my project?

Choosing the right framework depends on several factors:

    Project requirements: Consider what you need from the framework. For example, if you require a mobile-first approach with a lot of customization, Tailwind CSS might be ideal.
    Developer familiarity and preference: If you are familiar with a particular framework, or prefer its syntax and structure, that could steer your choice.
    Community and support: A larger community often means more plugins, extensions, and troubleshooting help.
    Performance needs: Some frameworks are more lightweight than others, which might be important for your project’s performance.

What is the best way to learn these frameworks?

The best way to learn these frameworks is through:

    Official Documentation: Each framework has extensive documentation that includes tutorials, guides, and API references.
    Online Courses: Platforms like Udemy, Coursera, and freeCodeCamp offer courses on these frameworks.
    Community Resources: Explore forums, GitHub repositories, and Stack Overflow for community support and real-world examples.
    Build Projects: Practical application by building small projects or integrating the framework into existing projects can be very effective for learning.

---

## FAQ

Check that a website is performing properly with:

* https://pagespeed.web.dev/
* https://web-check.xyz/
