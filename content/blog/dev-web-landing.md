---
title: "Creating a Landing Website!"
date: 2024-02-14
draft: false
tags: ["dev"]
description: 'Creating Landing Web Pages with Astro SSG'
url: 'creating-landing-pages-astro'
---

Astro Themes for inspiration on **Landing Pages**:

1. AstroZinc - https://astrozinc.exylons.com/

2. Luna Landing - https://github.com/JimmyCamus/luna-landing

* **Configurable** with a JSON!
* **MIT** | Template of a business landing page to be configured by json file 

{{< details title="Proposed for Ourika 📌" closed="true" >}}

* PagesSpeed: 100/100/100/100

> Compared with the competitor (WP) ~ping 30 vs ping ~300

<!-- 
https://pagespeed.web.dev/analysis/https-thingstodoinourika-com/guzs0y62la?form_factor=mobile
https://thingstodoinourika.com/ 
-->

* With [Cal.com](https://refer.cal.com/jalcocertech)

{{< /details >}}



3. Minimal Studio

4. Sendit

---

**Update**

5. Mizar - https://github.com/majesticooss/mizar

✅ Localization
✅ Blog
✅ CMS for editing blog post (thanks to **Keystatic CMS**)
✅ PWA (thanks to vite-pwa)


{{< details title="Im well aware that a Bachata-Cerdo uses it 📌" closed="true" >}}



{{< /details >}}

6. https://github.com/majesticooss/mintaka

Currently this theme only works with the **premium version of GSAP**, the steps to use the standard version will be available in the future.

---

## FAQ

**What it is KeyStaticCMS?**

A tool that makes Markdown, JSON and YAML content in your codebase editable by humans.

Live edit content *on GitHub or your local file system*, without disrupting your existing code and workflows.

* https://keystatic.com/

> MIT | Content Management for your Codebase - https://github.com/Thinkmill/keystatic

**Using KeyStatic CMS** with Mizar Astro Theme

Once you install and run the dev server:

```sh
npm install
#rm -rf .git
npm run dev
```

You will see the regular `localhost:4321` to explore the theme

But also: `http://127.0.0.1:4321/keystatic/` is available.

```sh
npm run build
npx serve -s dist #http://localhost:3000
```