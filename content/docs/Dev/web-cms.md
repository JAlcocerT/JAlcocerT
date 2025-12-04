---
title: "CMS 101 for Webs"
draft: false
type: docs
prev: /docs/android/
next: docs/
url: 'web-cms-101'
---

Most likely than not, you heard about these [*,no code required'* CMS's](#websites-without-coding):

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ghost" title="Ghost with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wordpress" title="WP with Docker 🐋 ↗" >}}
{{< /cards >}}

The thing about frontmatter, is that you will still to enjoy writing in markdown.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cms-for-static-websites/#frontmatter-cms" title="Testing FrontmatterCMS" image="/blog_img/web/frontmatter/frontmatter-project.png" subtitle="Learn the concepts and tools to SelfHost confortable" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/knowledge-management/#what-it-is-wysiwyg" title="Flat Files KB" image="/blog_img/selfh/kb/silverbullet.png" subtitle="Tools like SilverBullet or LogSeq are flat file centered" >}}
{{< /cards >}}

If you end up liking .md, you will be able to use it for your website and skip those database setups (and maintainance)

From there, you can either build your own editor on top of astro/hugo themes:

![NextJS Reactmd editing astro sphere theme](/blog_img/web/nextjs-admin/journal-nextjs-admin-reactmd.png)

Or use any of these [CMS combined with SSGs](#cool-cms)

As last alternative, you can go check [these no code CMS's](#websites-without-coding)

## Cool CMS

<!-- ![alt text](/blog_img/selfh/kb/silverbullet.png) -->



<!-- ![Frontmatter working with HUGO SSG](/blog_img/web/frontmatter/frontmatter-project.png) -->


**All Git-based CMS are a subset of file-based CMS.**

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/directus" title="DirectusCMS | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/strapi" title="StrapiCMS | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Strapi 

Headless StrapiCMS Example


![Strapi UI](/blog_img/web/cms/strapi-admin-ui.png)


### Directus

Headless DirectusCMS Example

* https://astro.build/themes/details/directus-cms-template/
* https://github.com/directus-labs/starters/tree/main/cms/astro


### TinaCMS

* https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/

---

## Websites without Coding

Im sure that you are wondering what [about wordpress or ghost](https://jalcocert.github.io/JAlcocerT/no-code-websites/).

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/link-artists/" title="Links for Artists" image="https://raw.githubusercontent.com/JAlcocerT/artistree/main/public/new-preview.png" subtitle="Resources for artists to have referenced for their fans" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/#selfhosted-solutions-for-linkinbio" title="LinkStack vs LittleLink" image="/blog_img/web/web-linkstack.png" subtitle="Two Selfhosted Link Alternatives" >}}
{{< /cards >}}

I will be adding here more drag and drop, no code content management systems.

Particularly ones that are OSS and that you can use freely within your HomeLab/VPS.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/" title="Selfhosting | Docs ↗" icon="book-open" >}}
{{< /cards >}}

{{% details title="SelfHostable Websites with UI 🚀" closed="true" %}}

1. [Wordpress](https://fossengineer.com/selfhosting-wordpress-docker/) or [Ghost](https://fossengineer.com/selfhosting-ghost-docker/)

2. [Instant Land](https://instant-land.cybrarist.com/installation/portainer.html)

> GPL3.o | Create, Copy, Modify landing pages for all your needs 

3. [Writefreely](https://github.com/writefreely/writefreely) (but does not provide a docker container for a quick spin)

> aGPL3 | A clean, Markdown-based publishing platform made for writers. Write together and build a community. Does NOT provide a clear container for SelfHost.

4. **Other ways to get a personal blog**
  * [btw](https://github.com/btw-so/btw)
  * [Grav](https://fossengineer.com/selfhosting-grav-docker/)

{{% /details %}}

{{% details title="SelfHostable Minimalist CMSs 🚀" closed="true" %}}

* https://github.com/DeepanshKhurana/ode

> MIT |  A minimal, open-source, writing platform for writers who care about the craft 

{{% /details %}}
