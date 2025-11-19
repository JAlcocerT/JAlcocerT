---
title: "Gatsby SSG x Ghost"
date: 2025-11-17T23:20:21+01:00
draft: false
tags: ["Web"]
description: 'Using gatsby to create a static site from ghost'
url: 'gatsby-ghost-integration'
---


* PageSpeedDev
* How is your site doing? https://search.google.com/

https://one.one.one.one/

https://www.websitecarbon.com/badge/ !!!

###

https://trends.google.com/trends/

####

https://itsfoss.com/open-source-static-site-generators/

<https://statichunt.com/>

https://github.com/myles/awesome-static-generators

https://github.com/uxreview/awesome-ux

https://medusajs.com/plugins/
https://github.com/medusajs/medusa

https://github.com/docsifyjs/docsify
https://docsify.js.org/#/pwa


## Astro

* https://github.com/Tailus-UI/astro-theme

https://github.com/shaunchander/astro-pwa-starter
https://astro.build/themes/details/starlight/
https://astro.build/themes/details/stardoc/
https://github.com/christian-luntok/astro-nutritrack

https://github.com/Johnkat-Mj/agency-landing-page-Astrojs


**Some astro themes uses markdoc - a markdown superset** 

---





## HUGO

* Future FOSS/jalcocert?
    https://github.com/jpanther/Congo

## NextJS

https://vercel.com/templates

* Taxonomy - https://github.com/shadcn-ui/taxonomy

guide-r-flexdashboards-in-github-pages
r-knitt-package-guide

## Why SSGs?

<!-- 
BLUE / RED PILL IMAGE

READY TO ENTER THE MATRIX? -->

## What is a SSG?

* HUGO
* Jekyll
* Gatsby
* Nextjs
* Astro

* Hexo
* Vuepress
* Nuxt
* ...


## Which Static Site Generator to use?

* <https://jamstack.org/generators/>

Certainly! Here's a comparison of VuePress, Next.js, Hugo, and Gatsby in a table format:

| Feature             | VuePress                    | Next.js                       | Hugo                        | Gatsby                    |
|---------------------|-----------------------------|--------------------------------|-----------------------------|---------------------------|
| **Framework**       | Vue.js-based                | React-based                   | Go-based                    | React-based               |
| **Use Case**        | Documentation, Blogs        | Universal Web Apps, Websites  | Static Websites, Blogs     | Static Websites, Blogs   |
| **Learning Curve**  | Low                         | Moderate                      | Low                         | Moderate                  |
| **Content Source**  | Markdown                    | Custom, Markdown, API, etc.   | Markdown                    | Markdown, CMS, API, etc. |
| **Theming**         | Supported                   | Supported                      | Theming system               | Theming system            |
| **Routing**         | Built-in                    | Customizable                  | Automatic                    | Automatic                  |
| **Data Fetching**   | Limited API support         | Customizable (Server-Side)    | Limited API support         | GraphQL, API, CMS, etc.   |
| **Performance**     | Fast                        | Depends on Implementation     | Fast                         | Depends on Implementation |
| **Community**       | Growing                     | Large                          | Active                       | Active                    |
| **Plugins/Extensions** | Limited                 | Extensible                    | Extensible                   | Extensible                |
| **SEO**             | Good                        | Good                           | Good                         | Good                      |
| **Development Pace**| Active                      | Active                         | Active                       | Active                    |




Certainly, here's a comparison of Hexo, Astro, and Jekyll in a table format:

| Feature              | Hexo                       | Astro                       | Jekyll                   |
|----------------------|----------------------------|-----------------------------|--------------------------|
| **Language**         | JavaScript (Node.js)       | JavaScript (Node.js)        | Ruby                     |
| **Use Case**         | Blogs, Static Websites     | Static Websites, Web Apps   | Blogs, Static Websites   |
| **Learning Curve**   | Low                        | Moderate                    | Low                      |
| **Content Source**   | Markdown                   | Custom, Markdown, GraphQL  | Markdown, YAML Front Matter |
| **Theming**          | Supported                  | Theming system              | Theming system            |
| **Routing**          | Customizable               | Customizable                | Limited custom routing   |
| **Data Fetching**    | Plugins, API               | Customizable                | Limited API support      |
| **Performance**      | Good                       | Good                        | Good                     |
| **Community**        | Active                     | Growing                     | Active                   |
| **Plugins/Extensions**| Extensible                | Extensible                  | Extensible               |
| **SEO**              | Good                       | Good                        | Good                     |
| **Development Pace** | Active                     | Active                      | Stable                    |

Each of these static site generators has its strengths and is suitable for different use cases and preferences. The choice among them depends on your specific project requirements, familiarity with the underlying technologies, and the ecosystem you prefer to work with.

## Adding Comments to a SSG



## Adding Search to SSG's

## Review of SSGs!

https://romanzolotarev.com/ssg.html
https://www.youtube.com/watch?v=N_ttw2Dihn8

## zola

https://www.getzola.org/documentation/getting-started/overview/

## hexo

<https://hexo.io/>
<https://hexo.io/themes/>
<https://jamstack.org/generators/hexo/>
<https://github.com/hexojs/awesome-hexo>

<https://sharvaridesai.github.io/hexo-theme-edinburgh-demo/>


---

### Interesting Nuxt Themes

* https://github.com/apdev95/bento-portfolio-nuxt
* https://github.com/samkanje/usenuxt-free
    * Includes F/OSS Auth with - https://github.com/lucia-auth/lucia
* https://github.com/Flosciante/nuxt-image-gallery
* https://github.com/HugoRCD/canvas

### Nuxt Content (CMS)

Write pages in markdown - use Vue components and enjoy

https://github.com/nuxt/content
https://github.com/nuxt/content/blob/main/LICENSE

https://content.nuxt.com/

https://www.npmjs.com/package/@nuxt/content

> The **file-based CMS** for your Nuxt application, powered by Markdown and Vue components.

* Why?
    * A Markdown syntax made for Vue components (MDC)
    * Also handles CSV, YAML and JSON(5)
    * Deploy everywhere - Nuxt Content **supports Static Generation**, also Node.js hosting and even Workers environments.


> There is a static blog generator built on top of Nuxt.js and Nuxt-content providing everything you need to start writing your blog hassle-free AND for free -  https://github.com/bloggrify/bloggrify

{{< dropdown title="How to use Nuxt Content CMS with Docker ⏬" closed="true" >}}

```yml
# Use the official Node.js image as the base
FROM node:latest 
#20.15.0 # https://hub.docker.com/_/node/tags

# Install Git and nano
RUN apt-get update && \
    apt-get install -y git nano

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Install additional packages using npm
RUN npm install -g npm@latest
RUN npm install -g pnpm
#RUN npm install -g yarn

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
#COPY package*.json ./

# Install project dependencies using npm
#RUN npm install

# Copy the rest of the project files to the working directory
#COPY . .

# Expose the desired port (replace 3000 with your app's port if different)
EXPOSE 3000

# Specify the command to run your application
#CMD ["npm", "start"]
# Keep the container running and wait for a command
CMD ["tail", "-f", "/dev/null"]


#docker build -t node_ssg .
#podman build -t node_ssg .

#docker run -d --name=node_ssg -p 3000:3000 node_ssg 
#podman run -d --name=node_ssg -p 3005:3000 node_ssg 

#docker exec -it node_ssg /bin/bash
#podman exec -it node_ssg /bin/bash


#echo "Node: $(node --version) | npm: $(npm --version) | Yarn: $(yarn --version) | Bun: $(bun --version)"
#podman exec -it loving_babbage /bin/bash -c "echo NPM: \$(npm --version)"
```


And then:

```sh
npx nuxi@latest init content-app -t content
cd content
npm run dev #pnpm run dev #yarn dev
```
`localhost:3000`

{{< /dropdown >}}






## 11ty

https://github.com/ttntm/11ty-landing-page

<https://www.11ty.dev/>
<https://www.11ty.dev/docs/templates/>
<https://jamstackthemes.dev/ssg/eleventy/>


---

## VUEPRESS


https://jamstack.org/generators/vuepress/

<https://vuepress.vuejs.org/>

<https://jamstackthemes.dev/theme/vuepress-theme-casper/>
<https://github.com/alexander-heimbuch/vuepress-theme-casper>

####

https://github.com/gridsome/gridsome
https://github.com/gridsome/gridsome?tab=MIT-1-ov-file#readme
⚡️ The Jamstack framework for Vue.js



## Cusdis

https://nielscautaerts.xyz/setting-up-cusdis-on-your-server-behind-nginx-to-host-your-own-comments.html


## Awsome Info

* <https://github.com/vuepress/awesome-vuepress>

### Themes

<https://theme-hope.vuejs.press/>




## Gatsby SSG

👉 <https://www.youtube.com/watch?v=RaTpreA0v7Q>


* [The   Site](https://.build/ "GH {rel='nofollow'}")
* [The  Source Code at Github](https://github.com// "GH {rel='nofollow'}")
    * License: [MIT](https://github.com//?tab=License-1-ov-file#readme) ❤️

> **React based** framework (open source JS, Meta). <https://github.com/gatsbyjs/gatsby>

Load Data From Anywhere. Gatsby pulls in data from any data source, whether it’s Markdown files, a headless CMS like Contentful or WordPress, or a REST or GraphQL API. Use source plugins to load your data, then develop using Gatsby’s uniform GraphQL interface.

Go Beyond Static Websites. Get all the benefits of static websites with none of the limitations. Gatsby sites are fully functional React apps, so you can create high-quality, dynamic web apps, from blogs to e-commerce sites to user dashboards.

* You need nodejs installed: <https://github.com/nodesource/distributions#installation-instructions>
* then look: <https://github.com/gatsbyjs/gatsby>


## About Gatsby plugins

Gatsby plugins are a fundamental part of the Gatsby ecosystem and play a crucial role in extending the functionality of your Gatsby site. They allow you to add various features, optimize performance, and integrate with external services. Here are some of the things you can do with Gatsby plugins:

{{< dropdown title="More about Gatsby Plugins 👇" closed="true" >}}


1. **Content Sourcing**: Gatsby plugins can help you source content from various data sources, such as Markdown files, JSON, APIs, databases, or even content management systems (CMS) like WordPress, Drupal, or Contentful. Popular content-sourcing plugins include `gatsby-source-filesystem` and `gatsby-source-contentful`.

2. **Data Transformation**: You can use plugins to transform and manipulate data before it's used to generate pages. For example, you can use `gatsby-transformer-remark` to process Markdown files and convert them into HTML.

3. **Styling and CSS**: Gatsby plugins can be used to handle CSS and styling. `gatsby-plugin-sass`, `gatsby-plugin-styled-components`, and others help you manage styles in your Gatsby project.

4. **Image Optimization**: To optimize images for performance, you can use plugins like `gatsby-plugin-sharp` and `gatsby-transformer-sharp`. These plugins generate multiple image sizes and formats for your site, ensuring that the right image is served based on the user's device and screen size.

5. **SEO and Metadata**: Plugins like `gatsby-plugin-react-helmet` allow you to set up metadata and SEO tags (such as title, description, and Open Graph tags) for each page.

6. **Pagination**: If you have a blog or any content that requires pagination, there are plugins like `gatsby-plugin-pagination` that can help you set up pagination for your content.

7. **Forms**: To handle forms on your site, you can use plugins like `gatsby-plugin-netlify-cms` or `gatsby-plugin-formik`.

8. **Authentication and User Management**: Plugins like `gatsby-plugin-firebase` or `gatsby-plugin-auth0` can be used to integrate authentication and user management into your Gatsby site.

9. **Search Functionality**: Implementing search functionality can be done using plugins like `gatsby-plugin-elasticlunr-search` or `gatsby-plugin-lunr`.

<https://www.emgoto.com/gatsby-search/>

10. **Analytics and Tracking**: If you want to track user interactions and gather analytics data, plugins like `gatsby-plugin-google-analytics` or `gatsby-plugin-segment` can be helpful.

11. **Performance Optimization**: Gatsby is known for its performance, and you can further optimize it with plugins like `gatsby-plugin-offline` for offline support and `gatsby-plugin-preact` to reduce bundle size.

12. **Localization and Internationalization**: To make your site multilingual, you can use plugins like `gatsby-plugin-i18n` or `gatsby-plugin-react-i18next`.

13. **E-commerce Integration**: If you're building an e-commerce site, plugins like `gatsby-plugin-shopify` or `gatsby-source-stripe` can help you integrate with e-commerce platforms.

14. **Serverless Functions**: Gatsby supports serverless functions through plugins like `gatsby-plugin-functions`. You can create serverless API endpoints for dynamic functionality.

15. **Social Sharing**: To enable social sharing features, you can use plugins like `gatsby-plugin-social-sharing`.

16. **Customization**: You can also create your own Gatsby plugins to add custom functionality tailored to your specific needs.

{{< /dropdown >}}


Gatsby's extensive plugin ecosystem makes it a powerful tool for building modern, performant websites and web applications. You can easily find and install plugins from the Gatsby plugin library or create your own to extend your site's capabilities.

You can **find Gatsby plugins** in the official Gatsby plugin library. Here's how you can access it:

1. **Gatsby Plugin Library Website**: You can visit the official Gatsby plugin library website at [https://www.gatsbyjs.com/plugins/](https://www.gatsbyjs.com/plugins/). This website provides a searchable and categorized list of plugins that you can use in your Gatsby projects.

* <https://www.gatsbyjs.com/plugins/gatsby-source-custom-api/>

* https://www.gatsbyjs.com/plugins/gatsby-source-wordpress/

* https://www.gatsbyjs.com/plugins/gatsby-source-stripe/

* <https://www.gatsbyjs.com/plugins/@ccalamos/gatsby-source-googlemaps-static/?=google>

2. **Gatsby GitHub Repository**: Another way to discover Gatsby plugins is by visiting the Gatsby GitHub repository, specifically the "plugins" section. The repository is located at [https://github.com/gatsbyjs/gatsby](https://github.com/gatsbyjs/gatsby), and you can find plugins in the "plugins" directory.

Please note that the availability and organization of plugins may have changed since my last update in September 2021. I recommend visiting the official Gatsby documentation or community resources for the most up-to-date information on Gatsby plugins.


https://www.gatsbyjs.com/docs/how-to/images-and-media/using-gatsby-plugin-image/
https://ghost.org/docs/jamstack/gatsby/?ref=gatsby.ghost.io#use-cases

## Understanding Gatsby

```sh
npm install
gatsby develop
```

## Deploying Gatsby 

* Github Pages
* Firebase
* Cloudflare Pages

### Deploying with Docker

## Bachateameet - sources

https://www.bachatavilnius.lt/en/?action=createcache

## Themes

{{< dropdown title="Photo Centered" closed="true" >}}
* {{< newtab url="https://github.com/baobabKoodaa/gatsby-starter-photo-book" text="HUGO PaperMod" >}}
  * MIT ❤️
* https://github.com/baobabKoodaa/gatsby-starter-infinite-scroll
  * MIT ❤️
* {{< newtab url="https://github.com/flotiq/flotiq-gatsby-portfolio-2" text="HUGO PaperMod" >}}
  * Requires Flotiq CMS
  * Also available for NextJS

{{< /dropdown >}}

{{< dropdown title="Image Centered Blog" closed="true" >}}
* {{< newtab url="https://github.com/stackrole/gatsby-starter-foundation" text="HUGO PaperMod" >}}
  * MIT ❤️



{{< /dropdown >}}

<!-- 
https://github.com/yinkakun/gatsby-starter-glass
https://github.com/Uvacoder/rocketdocs-starter?ref=statichunt.com -->

* <https://www.gatsbyjs.com/starters/>

* <ttps://github.com/search?q=gatsby+theme&type=repositories>

* https://github.com/TryGhost/gatsby-starter-ghost


* Install nodejs: <https://github.com/nodesource/distributions#installation-instructions>

{{< dropdown title="Some of my fav Gatsby Themes 👇" closed="true" >}}

* <https://gatsbytemplates.io/?ref=%22github%22>
* <https://github.com/vse-volod/gatsby-theme-massively/tree/master>
* <https://github.com/ImedAdel/gatsby-london>
  * <https://gatsby-london.netlify.app/>
* <https://github.com/stackrole/gatsby-starter-foundation>




Gatsby 💗 ghost -

https://jamstackthemes.dev/theme/gatsby-starter-ghost/
https://gatsby.ghost.org/
https://gatsby-casper.netlify.app/
https://foundation.stackrole.com/
https://github.com/stackrole/gatsby-starter-foundation
https://jamstackthemes.dev/theme/gatsby-casper/
https://github.com/scttcper/gatsby-casper

https://github.com/yinkakun/gatsby-starter-glass

https://github.com/chrisnmorrison/revista-gatsby-blog-magazine
https://github.com/app-generator/gatsbyjs-starter-tailwindplay

https://github.com/app-generator/gatsbyjs-starter-tailwindplay

{{< /dropdown >}}


* **`http://localhost:8000/`**
* **`http://localhost:8000/___graphql`**

* <https://www.gatsbyjs.com/docs/how-to/querying-data/running-queries-with-graphiql/>

### Starter Ghost

```sh
node -v
npm -v

npm install -g gatsby-cli

gatsby --version

##rm -rf .git && git init

gatsby new my-blog https://github.com/TryGhost/gatsby-starter-ghost
#gatsby new portfolio-minimal https://github.com/konstantinmuenster/gatsby-starter-portfolio-minimal-theme

cd my-blog

gatsby develop
gatsby develop -p 8001
gatsby build
```

This will start a development server, and you can view your blog at http://localhost:8000.


```dockerfile

# Use an official Node runtime as the parent image
FROM node:18.17

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Gatsby CLI globally and install dependencies
RUN npm install -g gatsby-cli && npm install

# Copy the rest of the application to the container
COPY . .

# Make port 8000 available outside the container
EXPOSE 8000
EXPOSE 8001

# Run gatsby develop command when the container launches
CMD ["gatsby", "develop", "-H", "0.0.0.0"]
```

```sh
#sudo docker run -p 8000:8000 node:18.17
#sudo docker run -it -p 8000:8000 node:18.17 /bin/bash
#npm install -g gatsby-cli

#gatsby-dev
#docker build -t gatsby-dev -f Dockerfile .
```

```yml
version: '3.8'

services:
  gatsby-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: gatsby-dev:latest
    ports:
      - "8000:8000"
    volumes:
      - .:/usr/src/app
      - /usr/src/app/node_modules
    environment:
      - NODE_ENV=development

  gatsby-prod:
    build:
      context: .
      dockerfile: Dockerfile.prod
    image: gatsby-prod:latest
    ports:
      - "80:80"
    environment:
      - NODE_ENV=production

```


```yml
version: '3.8'

services:
  gatsby-dev:
    image: gatsby-dev:latest
    ports:
      - "8000:8000"
    volumes:
      - app_data:/usr/src/app
      - node_modules:/usr/src/app/node_modules
    environment:
      - NODE_ENV=development
    command: tail -f /dev/null #keep it running      

#   gatsby-prod:
#     image: gatsby-prod:latest
#     ports:
#       - "80:80"
#     environment:
#       - NODE_ENV=production

volumes:
  node_modules:
  app_data:


```

## Portoflio Minimal

<https://github.com/konstantinmuenster/gatsby-theme-portfolio-minimal/tree/main>

#https://github.com/konstantinmuenster/gatsby-theme-portfolio-minimal/tree/main/gatsby-theme-portfolio-minimal#readme

```sh
##rm -rf .git && git init

gatsby new portfolio-minimal https://github.com/konstantinmuenster/gatsby-starter-portfolio-minimal-theme
npm install
gatsby develop
gatsby develop -p 8001
gatsby build
```

```sh
gatsby build

npm install -g firebase-tools

firebase login

firebase init

firebase deploy
```



## COnclusions


**Other Sites that Ive worked**


* IOTECH - https://github.com/themefisher/bigspring-light-astro
    * https://iotechcrafts.com/blog/
* IORACING - https://github.com/zankhq/astros
    * https://ioracing-iotechcrafts.web.app/
        * EX - https://astro.build/themes/details/launchui/
        * https://iotechcrafts-ioracing.web.app/
* IODOCTOR - https://github.com/mickasmt/astro-nomy

* IOT - https://github.com/matt765/Tailcast
    * https://iot.iotechcrafts.com/


### Responsive Images

<https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images>


### How to monitor my Website Status?

<https://fossengineer.com/selfhosting-uptime-Kuma-docker/>

### what it is a CDN?

**There are F/OSS CDNs** if you need one.

https://trafficcontrol.apache.org/

https://github.com/apache/trafficcontrol
https://github.com/apache/trafficcontrol?tab=Apache-2.0-1-ov-file#readme

>  Apache Traffic Control is an Open Source implementation of a Content Delivery Network 

> Apache Traffic Control allows you to build a large scale content delivery network using open source. Built around Apache Traffic Server as the caching software, Traffic Control implements all the core functions of a modern CDN.

##### CDNjs

* https://cdnjs.com/
* https://github.com/cdnjs/cdnjs
* https://github.com/cdnjs/cdnjs?tab=MIT-1-ov-file#readme

>  🤖 CDN assets - The #1 free and open source CDN built to make life easier for developers. 

>  cdnjs is a free and open-source CDN service trusted by over 12.5% of all websites, serving over 200 billion requests each month, powered by Cloudflare. 

They have a F/OSS Static Website where we can find the packages to use via CDNjs - https://github.com/cdnjs/static-website

##### JSDelivr

* https://www.jsdelivr.com/
  * https://github.com/jsdelivr/jsdelivr
  * https://github.com/jsdelivr/jsdelivr?tab=MIT-1-ov-file#readme

>  A free, fast, and reliable Open Source CDN for npm, GitHub, Javascript, and ESM 

---

## FAQ

* https://brianli.com/2021/06/how-to-find-broken-links-with-python/
* https://brianli.com/2021/02/python-automation-is-awesome/

## web server

https://awesome-devops.xyz/list/#web-servers

## Stock Photos

https://www.youtube.com/watch?v=iQf1AyvfNfk

Adobe Stock Free Collection
https://stock.adobe.com/free
StockSnap
https://stocksnap.io/
Pexels
https://www.pexels.com/
Shopify Burst
https://www.shopify.com/stock-photos
Freerange
https://freerangestock.com/
Unsplash
https://unsplash.com/
Kaboompics
https://kaboompics.com/
Stockvault
https://www.stockvault.net/
Wikimedia Commons
https://commons.wikimedia.org/wiki/Ma...
Pixabay
https://pixabay.com/



## How to see if a web was changed

https://docs.linuxserver.io/images/docker-changedetection.io/#user-group-identifiers Apache v2 ✅