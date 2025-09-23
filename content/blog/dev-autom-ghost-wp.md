---
title: "Using APIs to write content."
date: 2025-09-06T08:20:21+01:00
draft: false
tags: ["Ghost","Web","Wordpress API","Gatsby GraphQL vs REST API","Codex CLI","n8n x wp"]
description: 'Programatic posts creation with the most popular CMSs. Via CLI or N8N workflows.'
url: 'automating-ghost-and-wordpress'
---

**TL;DR**

As lately im like *a kid with APIs*, have setup [WP](#wordpress-setup) and [Ghost](#ghost-setup), just to tinker with them.

{{< callout type="warning" >}}
Ghost and WP both provide a [RESTAPI](#rest-vs-graphql-vs-gatsby). 
{{< /callout >}}


**Intro**

Just because you can...dont become a BOT.

For real, even if you know how to use [Codex CLI + HUGO](#codex-cli--hugo) to generate project docs for OSS projects.

For today's post: with Ghost and Wordpress ready to go into your homelab/server, we are ready to play.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ghost" title="Ghost with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wordpress" title="WP with Docker 🐋 ↗" >}}
{{< /cards >}}

They provide a cool UI.

And you can deploy them quickly with PaaS as well:

https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/
https://jalcocert.github.io/JAlcocerT/selfhosted-server-paas/
https://jalcocert.github.io/JAlcocerT/selfhosted-paas/

But come on, do you really want to spend time with drag and drop still?

Even configuring your [**n8n** to write into wordpress](#n8n-x-wordpress) for you is possible.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="n8n with Docker 🐋 ↗" >}}
{{< /cards >}}


[![Star History Chart](https://api.star-history.com/svg?repos=n8n-io/n8n,deepset-ai/haystack&,type=Date)](https://star-history.com/n8n-io/n8n&deepset-ai/haystack&Date)


Because [n8n](https://github.com/n8n-io/n8n) has been taking over lately...

## Programatic Posts

Because if LLMs can generate nice markdown, or help you do web research... why should you build all that post skeleton?

### Programatic WP

Its all about [REST APIs](#rest-vs-graphql-vs-gatsby).

WordPress includes a powerful REST API by default, allowing you to interact with your site's content programmatically.

-   **Base URL**: `$WP_HOME/wp-json/wp/v2/`
-   **Authentication**: For read-only public content, no auth is needed. 
    * For creating/updating content, you need to use **Application Passwords** [like so](#setting-up-application-passwords-for-wp).

1. **List latest 5 posts (public)**

```bash
source .env
curl "$WP_HOME/wp-json/wp/v2/posts?per_page=5"
```

2. **Get a post by its slug**

```bash
# Replace 'hello-world' with your post's slug
curl "$WP_HOME/wp-json/wp/v2/posts?slug=hello-world"
```

3. Create a post: this requires [wp app pwd](#setting-up-application-passwords-for-wp)

```sh
curl -u 'jalcocert:bzkh]FTp3}T]#Mj' -X POST "$WP_HOME/wp-json/wp/v2/posts" \
    -H 'Content-Type: application/json' \
    -d '{
    "title": "Hello from REST API",
    "content": "This post was created programmatically.",
    "status": "draft"
    }'
```

#### Setting Up Application Passwords for WP

**Important**: Application Passwords are different from your WordPress login credentials. They are special passwords created specifically for API access.

1.  Log in to your WordPress Admin dashboard (`$WP_HOME/wp-admin`)
2.  Go to **Users** → **Profile**
3.  Scroll down to the "Application Passwords" section (near the bottom of the page)
4.  In the "New Application Password Name" field, enter a descriptive name (e.g., `api-client`)
5.  Click "Add New Application Password"
6.  **Critical**: Copy the generated password immediately - it will only be shown once!
7.  Store this password securely

### Authentication Details

- **Username**: Your WordPress username (not your email address)
- **Password**: The generated application password (not your WordPress login password)
- **User Role**: Ensure your user has sufficient permissions (Administrator role recommended)

### Programatic Ghost

See https://github.com/JAlcocerT/Home-Lab/blob/main/ghost/API.md after you have done your [Ghost setup](https://github.com/JAlcocerT/Home-Lab/blob/main/ghost/API.md)


---

## Conclusions

If you like to do programatic stuff but prefer that agents do the job for you, see: https://github.com/mcp-wp/mcp-server

---

## FAQ

### Ghost Setup

They recently released v6: 

* https://github.com/TryGhost/Ghost/releases/tag/v6.0.0
* https://hub.docker.com/layers/library/ghost/6/images/sha256-9b517233be94c4e3d7e56ea267a65b920d9fcf049e1d20d500e222b3b5b1be53

> **MIT** |  Independent technology for modern publishing, memberships, subscriptions and newsletters. 

{{< cards cols="1" >}}
  {{< card link="https://github.com/TryGhost/Ghost?ref=fossengineer.com" title="Ghost | Source Code ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ghost" title="Ghost | Docker Config 🐋 ↗" >}}
{{< /cards >}}


```sh
#cd ghost
echo -e "MYSQL_DATABASE=ghost\nMYSQL_USER=ghostuser\nMYSQL_PASSWORD=$(openssl rand -base64 32)\nMYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)" > .env
docker compose up -d #Grist will be at 8018
```

> `http://192.168.1.8:8018/` and `http://192.168.1.8:8018/ghost/`

1) Sign in to your Ghost Admin: `http://192.168.1.8:8018/ghost` (or `http://localhost:8018/ghost`).
2) Go to: Settings → Integrations → Add custom integration.
3) You'll get:
   - Content API Key
   - Admin API Key (format: `<key_id>:<secret>`)

The content API is ready only:
```sh
source .env
curl "$GHOST_URL/ghost/api/content/posts/?key=$GHOST_CONTENT_API_KEY&limit=1"
```


But you can use the Admin API via Ghost JS SDK:

```sh
#npm i dotenv
#npm i @tryghost/admin-api
node admin-test.js
```

And to create posts programatically via a markdown:

```sh
cd ghost
#npm i gray-matter marked

node scripts/create-post.js
node scripts/create-post.js samples/sample-post-publish.md
# HTML length: 1034
# Uploaded feature image -> http://192.168.1.8:8018/content/images/2025/09/JAlcocerTechlogo-2.png
# Created post: {
#   id: '68bbfbd437865200016ec434',
#   slug: 'hello-from-markdown-6',
#   status: 'published',
#   url: 'http://192.168.1.8:8018/hello-from-markdown-6/'
# }
curl "$GHOST_URL/ghost/api/content/posts/slug/hello-from-markdown-6/?key=$GHOST_CONTENT_API_KEY&formats=html&include=tags,authors"
```


### Wordpress Setup

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wordpress" title="Wordpress | Docker Config 🐋 ↗" >}}
{{< /cards >}}


```sh
#cd wordpress


echo -e "MYSQL_DATABASE=wordpress\nMYSQL_USER=wpuser\nMYSQL_PASSWORD=$(openssl rand -base64 32)\nMYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)\nWP_HOME=http://192.168.1.8:8082\nWP_SITEURL=http://192.168.1.8:8082" > .env

docker compose up -d #WP will be at 8082 
```

> `http://192.168.1.8:8082/wp-admin/`


### Rest vs GraphQL vs Gatsby

How Ghost and WordPress function as headless CMS options when used with Gatsby, focusing on their API architectures and how Gatsby interacts with each.

Gatsby acts as a **static site generator with a modern twist**. 

1. **Build-Time Data Layer**:
   - At build time, Gatsby fetches data from various sources (like Ghost or WordPress)
   - It creates an in-memory GraphQL data layer that represents all your content
   - This happens once during the build process

2. **Runtime Behavior**:
   - The generated site is static HTML/CSS/JS
   - No GraphQL server runs in production
   - All GraphQL queries are executed at build time
   - The result is baked into the final static files

3. **Hybrid Approach**:
   - For dynamic content, you can use:
     - Client-side data fetching (e.g., fetch())
     - Serverless functions
     - Incremental Static Regeneration (ISR)
     - Deferred Static Generation (DSG)

Ghost

- **Native API Type**: REST
- **Key Features**:
  - **Content API**: Read-only REST API for fetching published content
  - **Admin API**: Read-write REST API for content management
  - **Authentication**: API keys (Content API) and JWT (Admin API)
  - **No Native GraphQL**: Uses REST endpoints exclusively

WordPress
- **Native API Type**: REST
- **Key Features**:
  - **REST API**: Built into core, supports CRUD operations
  - **Authentication**: Application Passwords, OAuth, or JWT (via plugins)
  - **GraphQL**: Available via plugins (e.g., WPGraphQL)


 How Gatsby could Work with These CMSs

1. **Build-Time Data Fetching**:
   - Gatsby's source plugins fetch data during build time
   - For both Ghost and WordPress, this happens via their REST APIs
   - Data is transformed and added to Gatsby's internal data layer

2. **Ghost with Gatsby**:
   - Uses `gatsby-source-ghost` plugin
   - Fetches content from Ghost's Content API
   - Makes data available via Gatsby's GraphQL layer
   - Example query:
     ```graphql
     query {
       allGhostPost {
         edges {
           node {
             title
             slug
             excerpt
             published_at
           }
         }
       }
     }
     ```

3. **WordPress with Gatsby**:
   - Uses `gatsby-source-wordpress` plugin
   - Can use either REST API or WPGraphQL
   - Transforms data into Gatsby's GraphQL schema
   - Example query:
     ```graphql
     query {
       allWpPost {
         edges {
           node {
             title
             slug
             excerpt
             date
           }
         }
       }
     }
     ```

REST API vs GraphQL: Key Differences

| Feature                | REST API                      | GraphQL                      |
|------------------------|-------------------------------|------------------------------|
| **Data Fetching**      | Multiple endpoints           | Single endpoint              |
| **Response Structure** | Fixed by server              | Client-defined               |
| **Over-fetching**      | Common (get more than needed) | Rare (request only what you need) |
| **Under-fetching**     | Common (need multiple calls)  | Rare (get all in one query)  |
| **Versioning**         | Required (v1/, v2/)          | Not needed (evolve schema)   |
| **Caching**            | Built into HTTP              | Requires custom solution     |
| **Learning Curve**     | Lower                        | Steeper                      |
| **Tooling**           | Standard HTTP tools          | Specialized clients          |
| **Real-time**          | Requires WebSockets          | Built-in subscriptions       |
| **Error Handling**     | HTTP status codes            | 200 OK with errors in body   |

CMS-Specific Differences

| Feature                | Ghost                          | WordPress                     |
|------------------------|--------------------------------|-------------------------------|
| Native API Type        | REST (Content + Admin)         | REST (Core)                   |
| GraphQL Support        | No (REST only)                | Yes (via WPGraphQL plugin)    |
| Authentication         | API Keys + JWT                | Various (App Passwords, OAuth)|
| Content Structure      | Simpler, more opinionated     | Highly flexible, customizable |
| Media Handling         | Built-in image optimization   | Requires additional plugins   |
| Real-time Updates      | Webhooks available            | Webhooks available            |


Choose Ghost if:
- You prefer a simpler, more focused content structure
- Built-in image optimization is important
- You're comfortable with REST APIs
- You want a more streamlined authoring experience

Choose WordPress if:
- You need maximum flexibility in content modeling
- You prefer working with GraphQL
- You have existing WordPress content
- You need extensive plugin ecosystem

> Both Ghost and WordPress can serve as effective headless CMS options for Gatsby. 

> > Ghost offers a more streamlined experience with its focused feature set, while WordPress provides greater flexibility and an extensive plugin ecosystem.

### Codex CLI + HUGO

If Codex can generate documentation for [QA Track](https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/)... https://youtu.be/e_l6HJISIrs

It can definitely generate markdown posts summaries about it or any other project.

### n8n x Wordpress