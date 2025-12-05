---
title: "Power Laws: What?"
date: 2025-12-19T23:20:21+01:00
draft: false
tags: ["Python x STEM","Math","Outro","Statistical Distributions"]
description: "Explaining series and the relation with the power law"
url: 'powerlaw-and-series-with-python'
math: true
---




**Tl;DR**

Just a quick mental model on [Series](#understanding-series) with Python.

+++ Reflecting on [Pareto](#power-law--pareto) and [D&A](#power-law--data-analytics)


**Intro**

I saw this [fantastic video from Veritasium](https://youtu.be/HBluLfX2F_k?si=9UgTHcs4rrU-2WoG) about Power Laws.

<!-- https://youtu.be/HBluLfX2F_k?si=9UgTHcs4rrU-2WoG -->

{{< youtube "HBluLfX2F_k" >}}



<!-- 
In mathematics, a power law is a functional relationship between two quantities [1], where a relative change in one quantity results in a proportional relative change in the other quantity [2][3], independent of the initial size of those quantities. 

In other words, small changes in one variable result in large changes in another variable, and vice versa. This type of relationship is often observed in nature, such as in the size distribution of cities or the frequency of words in a language. 

The power law is also known as a scaling law or a Pareto distribution. 

-->

Some examples of power laws and how they affect our lives:

* The distribution of wealth: The distribution of wealth in many countries follows a power law, where a small fraction of the population holds a large fraction of the wealth. This means that the gap between rich and poor is much wider than would be expected in a random distribution, and can have significant social and economic consequences.

* The frequency of words in natural language: In any language, a few words are used very frequently, while the majority of words are used much less frequently. This follows a power law distribution, where a small number of words (such as "the", "and", "of", etc.) make up a large fraction of all words used, while the rest of the words are used much less frequently.

* The size distribution of cities: In many countries, the size distribution of cities follows a power law, where a few large cities have much larger populations than the majority of smaller cities. This can have significant implications for urban planning, transportation, and economic development.

* The frequency of occurrence of diseases: The frequency of occurrence of many diseases follows a power law, where a few rare diseases account for a large fraction of all cases. This can have implications for public health policies and the allocation of resources for disease prevention and treatment.

By understanding the underlying mechanisms that give rise to power laws, we can gain insights into the complex systems that govern our world and make more informed decisions about how to shape them.

## Understanding Series

Before we move on, let me get a little bit technical here.

There are many  types of series that appear in mathematics, science, and engineering, each with their own unique properties and applications.

Some examples that you will be familiar with after such studies include: **Fourier** series, **Taylor** series, and series expansions for special functions like the gamma function and Bessel functions.

These series are used in a variety of contexts, from physics and engineering to finance and economics. 

You have to remember that they are **an important tool for understanding and modeling complex systems**. 

Basically these ones deserve its own post.

### Non-Geometric Series

* The series 1, 3, 6, 10, 15, ... is an **arithmetic series** where each term is the sum of the previous terms and the first term is 1.
* The series 1, 1/2, 1/3, 1/4, 1/5, ... is the **harmonic series**, which diverges (i.e. does not have a finite sum).
* The series 1, -1/2, 1/3, -1/4, 1/5, ... is the **alternating harmonic series**, which converges to ln(2).

### Geometric series

The series 1, 2, 4, 8, 16, ... is a geometric series with a common ratio of 2.
The series 3, 6, 12, 24, 48, ... is a geometric series with a common ratio of 2.
The series 1/2, 1/4, 1/8, 1/16, ... is a geometric series with a common ratio of 1/2.

A geometric series is a sequence of numbers in which each term after the first is obtained by multiplying the previous term by a fixed number called the common ratio (r). The formula for a geometric series is:

S = a + ar + ar^2 + ar^3 + ... = a(1 - r^n)/(1 - r)

where S is the sum of the series, a is the first term, n is the number of terms, and r is the common ratio.

For example, the series 2 + 4 + 8 + 16 + 32 is a geometric series with a first term of 2 and a common ratio of 2. The sum of this series can be calculated as:

S = 2(1 - 2^5)/(1 - 2) = 2(-31)/(-1) = 62

So the sum of the series is 62.

Geometric series are commonly used in mathematics, physics, and engineering to model exponential growth or decay, such as the growth of a population or the decay of a radioactive substance.

### Fibonacci

A Fibonacci sequence is an example of a geometric series with a common ratio of the golden ratio, which is approximately 1.618.

Here's some sample Python code to plot a geometric series:

```py
import numpy as np
import matplotlib.pyplot as plt

# Define the common ratio and the number of terms
r = 0.5
n = 10

# Define the first term and calculate the series
a = 1
series = [a * (r ** i) for i in range(n)]

# Plot the series
plt.plot(series, '-o')
plt.title("Geometric series with r = {}".format(r))
plt.xlabel("Term number")
plt.ylabel("Value")
plt.show()
```

In this example, we set the common ratio r to 0.5 and the number of terms n to 10. We then calculate the geometric series using a list comprehension and plot the values using Matplotlib.

You can easily modify this code to plot other geometric series with different values of the common ratio and number of terms.

## The Power Law & Geometric series

A power law is a functional relationship between two quantities, where one quantity varies as a power of another quantity. In other words, a power law is a mathematical formula of the form y = ax^k, where k is a constant that determines the degree of the power law. 

Power laws are commonly found in many natural and social phenomena, such as the distribution of wealth, the frequency of words in natural language, and the size distribution of earthquakes.

Power laws can be related to geometric series through the concept of infinite sums. 

In particular, if a power law has a value of k between -1 and 0, then the infinite sum of its terms converges to a finite value, and can be expressed as a geometric series.

For example, the series 1 + 1/2 + 1/4 + 1/8 + ... is a geometric series with a common ratio of 1/2, and can be shown to converge to a finite value of 2.

The relationship between power laws and geometric series arises because **both describe the behavior of a quantity that changes exponentially over time.**

* In the case of a geometric series, the quantity changes by a fixed factor with each term, whereas in the case of a power law, the quantity changes by a variable factor that depends on the exponent k. 

Thus, **power laws can be thought of as a generalization of geometric series**, where the growth factor is not constant but varies with the exponent.


### Power Law & Pareto

Sometime ago I wrote a post about [The Pareto Principle](https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/).

### Power Law & Data Analytics

For a data analyst, understanding power laws and Pareto analysis can be extremely valuable for their career. 

By recognizing the presence of power laws in their data, they can better understand the underlying patterns and relationships that drive the behavior of the system they are analyzing. 

Similarly, by applying Pareto analysis techniques, they can identify the most important factors that contribute to a given outcome, and prioritize their efforts accordingly.

This can lead to more effective decision-making and resource allocation, and ultimately better outcomes for their organization.

To make the most of these techniques, a data analyst should have:

* A solid understanding of statistics and data analysis techniques
* Tools for data visualization and analysis
* Comfortable working with large datasets
* Be able to communicate their findings effectively to non-technical stakeholders.


---

## Other Things Ive done recently



#### F/OSS CMS

Directus: Directus is an open-source headless CMS that offers real-time data synchronization and versioning.

It provides a database-agnostic API and a user-friendly admin interface. And it can also handdle authentication

* https://github.com/directus/directus

> Headless Data Platform

Cockpit: Cockpit is a lightweight, self-hosted, and open-source CMS. It's designed for developers and offers an API-first approach with flexible content types and fields.

* Strapi: As mentioned earlier, Strapi is a popular open-source headless CMS that allows you to create, manage, and expose content via RESTful APIs or GraphQL.

ButterCMS: ButterCMS provides a headless content management system with a RESTful API. It's designed for developers and integrates easily with various tech stacks.

Tipe: Tipe is an open-source headless CMS with a focus on simplicity and developer-friendliness. It offers a visual editor for content and GraphQL API support.

### How to Deploy Strapi - Headless CMS


<!-- https://jamstack.org/headless-cms/

https://github.com/mooxl/astroad/tree/main
 -->

Headless CMS based on nodejs

<https://www.youtube.com/watch?v=HsojvBVk6JQ>

<https://www.youtube.com/watch?v=kJ4c9U5JStU>


Consume the API from any client (React, Vue, Angular), mobile apps or even IoT devices, using REST or
GraphQL.
### Strapi CMS

How to setup StrapiCMS?

If you are looking from CMS, you can have a look to [this post](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites), where I [setup KeystaticCMS](https://jalcocert.github.io/JAlcocerT/cms-for-static-websites/#keystatic-cms)

* <https://www.opensourcealternative.to/project/Strapi>
    * <https://docs.strapi.io/dev-docs/installation/docker>


Astro JS x Strapi

https://www.youtube.com/watch?v=WI-_gVBoBBg
https://github.com/PaulBratslavsky/pauls-strapi-crashcourse
https://github.com/JAlcocerT/pauls-strapi-crashcourse


https://github.com/strapi/LaunchPad -> https://launch-pad-roan.vercel.app/en

> Official Strapi Demo application



![Strapi UI](/blog_img/web/cms/strapi-admin-ui.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/strapi" title="Strapi | Docker Config 🐋 ↗" >}}
{{< /cards >}}


https://www.youtube.com/watch?v=Ud9obEHadLI

* https://elest.io/open-source/strapi

* https://strapi.io/blog/how-to-self-host-your-headless-cms-using-docker-compose

* https://hub.docker.com/r/strapi/strapi/tags

* https://docs.strapi.io/cms/installation/docker
* https://docs.strapi.io/cms/quick-start
* https://strapi.io/blog/how-to-self-host-your-headless-cms-using-docker-compose


<!-- ### How to use turbostrapi

STRAPI + NEXTJS MONOREPO STARTER

* https://github.com/sawden/turbostrapi/blob/master/apps/backend/README.md
* https://github.com/sawden/turbostrapi?ref=statichunt.com
https://github.com/sawden/turbostrapi?ref=statichunt.com
https://turbo.build/repo/docs/installing

```sh
yarn install
``` -->

<!-- Build a Blog with Next.js and a Headless CMS (Strapi)
https://www.youtube.com/watch?v=NNWX2flw5mg -->


<!-- 
NEXTJS + Strapi
https://www.youtube.com/watch?v=SlhZvwl9qtI&list=PL7Q0DQYATmvjXSuHfB8CY_n_oUeqZzauZ&index=9 -->

<!-- ### Other F/OSS SSG's

This addition suggests other Static Site Generators (SSGs) that readers might find interesting based on their enjoyment of the Next.js post. Let me know if you need any further adjustments!

    HUGO: Lightning-fast speed.
    Astro: Built-in support for server-side rendering (SSR).
    Jekyll: Simplicity and ease of use, particularly for blogging.
    Gatsby: Rich ecosystem of plugins and a vibrant community.

If you have enjoyed the Next.js post, you might be interested to explore other SSGs like HUGO, Astro, Jekyll, and Gatsby. -->


<!-- - **Gatsby**: Gatsby is a popular static site generator within the **React** ecosystem, leveraging React for building static sites and offering a rich plugin ecosystem.
  - **Pros**:
    - Ability to pull data from various sources, including CMSs and APIs.
    - React-based, enabling component-based development and rich interactivity.
    - Extensive plugin ecosystem for adding functionality and integrating with third-party services.
  - **Cons**:
    - Longer build times for large projects due to complex data fetching and processing.
    - Steeper learning curve for developers unfamiliar with React.
    - Requires a Node.js environment for development and building.

- **Next.js**: Next.js is primarily known as a **React** framework for SSR and CSR, but it also offers SSG capabilities, providing flexibility for different project needs.
  - **Pros**:
    - Versatility to choose between SSR, CSR, or SSG based on project requirements.
    - Seamless integration with React for building dynamic user interfaces.
    - Hybrid capabilities for blending static and dynamic content in a single application.
  - **Cons**:
    - Complex configuration compared to simpler static site generators.
    - Requires familiarity with React and Node.js for effective usage.
    - Limited built-in features compared to dedicated static site generators like Hugo. -->

<!-- 

https://developers.cloudflare.com/pages/framework-guides/nextjs/

<https://jamstack.org/generators/next/>

<https://nextjs.org/>


<https://vercel.com/templates/next.js>

<https://jamstackthemes.dev/theme/nextjs-notion-starter-kit/>
<https://transitivebullsh.it/nextjs-notion-starter-kit>

<https://transitivebullsh.it/>

## With streamlit

https://ui.shadcn.com/themes
https://github.com/ObservedObserver/streamlit-shadcn-ui


## Themes

<https://vercel.com/templates>

### My Favourite Themes

* https://nextra.site/
* https://github.com/shadcn-ui/taxonomy

* SaaS
    * https://github.com/nextacular/nextacular


### nextjs-notion-starter-kit

https://jamstackthemes.dev/theme/nextjs-notion-starter-kit/


Fork / clone this repo
Change a few values in site.config.ts
npm install
3. `npm install` or npm install --legacy-peer-deps
npm run deploy to deploy to vercel 💪
npm run build
npm run start



---

## FAQ

    SSG (Static Site Generation):
    Static Site Generation involves generating HTML pages at build time, typically using a site generator or build tool. The generated HTML pages contain all the necessary content and assets, and they are served to clients as-is without the need for server-side processing. This approach offers benefits such as fast loading times, security, and scalability. Popular static site generators include Gatsby, Next.js (with static site generation), Jekyll, and Hugo.

    SSR (Server-Side Rendering):
    Server-Side Rendering involves generating HTML pages dynamically on the server in response to each client request. With SSR, the server processes the request, renders the page with the necessary data, and sends the fully rendered HTML to the client's browser. SSR is commonly used in web applications built with frameworks like Next.js, Nuxt.js, and Angular Universal. SSR can offer benefits such as improved SEO, faster initial page loads, and better support for dynamic content.

    ISR (Incremental Static Regeneration):
    Incremental Static Regeneration is a hybrid approach that combines the benefits of static site generation and dynamic content updates. With ISR, pages are initially generated statically at build time, but they can also be updated dynamically in the background. When a user requests a page that has been updated since the last build, the server regenerates the page with fresh data and serves the updated version. ISR is a feature available in frameworks like Next.js, enabling developers to pre-render dynamic content while still benefiting from static site performance.

In summary, SSG generates HTML pages at build time, SSR generates HTML pages dynamically on the server in response to requests, and ISR combines static site generation with dynamic content updates for improved performance and flexibility. Each approach has its strengths and use cases, and the choice depends on the specific requirements of the project. -->

<!-- 

https://www.youtube.com/watch?v=Sklc_fQBmcs


Next.js in 100 Seconds // Plus Full Beginner's Tutorial
Overview

Welcome to our report on the video "Next.js in 100 Seconds // Plus Full Beginner's Tutorial" by Fireship. In this report, we'll delve into the world of Next.js, a React-based framework for building fast and scalable web applications. If you're new to Next.js or looking to improve your skills, this report is a must-read.
What is Next.js?

Next.js is a popular framework for building server-rendered, statically generated, and performance-optimized React applications. It allows developers to create fast, scalable, and SEO-friendly web apps with zero configuration. In traditional React apps, content is rendered on the client-side, which can lead to slow page loads and poor SEO. Next.js solves this problem by rendering content on the server, providing a better user experience and search engine optimization.
Features of Next.js

Next.js provides several features that make it an ideal choice for building modern web applications. Some of these features include:

    Server-side rendering: Next.js allows you to render content on the server, providing a faster and more SEO-friendly experience.
    Static site generation: Next.js can pre-render pages at build time, making it ideal for blogs and applications with infrequently changing data.
    Incremental static regeneration: Next.js can also regenerate pages dynamically, allowing for flexibility in data updating.
    API routes: Next.js provides a way to create server-only API routes, which can be useful for tasks that require server-side processing.

Building a Next.js App

To get started with Next.js, you can create a new project using the npx create-next-app command. This will set up a basic Next.js project with a pages directory, where you can define your application's routes.

In the pages directory, you can create separate files for each route, which will export a default React component. Next.js will then use these components to render the application.
Data Fetching in Next.js

Next.js provides several strategies for fetching data, including:

    getStaticProps: This function allows you to fetch data at build time and pre-render pages.
    getServerSideProps: This function allows you to fetch data on each request and render pages dynamically.

Conclusion

In conclusion, Next.js is a powerful framework for building fast, scalable, and SEO-friendly web applications. With its features, such as server-side rendering, static site generation, and data fetching strategies, Next.js provides a robust set of tools for building modern web applications.
Takeaways

    Next.js is a React-based framework for building fast and scalable web applications.
    Next.js provides server-side rendering, static site generation, and incremental static regeneration.
    Next.js has built-in support for API routes and data fetching strategies.

Report generated on: May 5, 2024, 11:05:57 AM -->
