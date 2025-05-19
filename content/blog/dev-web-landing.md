---
title: "Creating a Landing Website with Astro!"
date: 2024-02-14
draft: false
tags: ["dev"]
description: 'Creating Landing Web Pages with Astro SSG - Ourika'
url: 'creating-landing-pages-astro'
---

Astro Themes for inspiration on **Landing Pages**:

1. AstroZinc - https://astrozinc.exylons.com/

2. Luna Landing - https://github.com/JimmyCamus/luna-landing

* **Configurable** with a JSON!
* **MIT** | Template of a business landing page to be configured by json file `/src/data/landing.json`

{{< details title="Proposed for Ourika 📌" closed="true" >}}

* The fav icons works as configured with `"./public/favicon.svg"`

Which I could change *from png to svg* thanks to [adobe](https://www.adobe.com/express/feature/image/convert/png-to-svg) and provided `guideventure-logo.svg`

* The theme brings an **OG Image**, which equals to the first image of the landing.
* PagesSpeed: 100/100/100/100

> Compared with the competitor (WP) ~ping 30 vs ping ~300

<!-- 
https://pagespeed.web.dev/analysis/https-thingstodoinourika-com/guzs0y62la?form_factor=mobile
https://thingstodoinourika.com/ 
-->

* With [Cal.com](https://refer.cal.com/jalcocertech)


I needed to make few tweaks for the images to work (when they are at `public`)

```sh
sudo apt install webp

for file in *.jpg; do
  cwebp "$file" -o "${file%.jpg}.webp"
done
```

```sh
sudo apt install graphicsmagick-imagemagick-compat
convert tour1.webp -rotate 180 tour1_rotated.webp
```
{{< /details >}}


It could be deployed quickly with CF Wrangler CLI:

![Cloudflare Wrangler CLI](/blog_img/web/Cloudflare/CF_WranglerCLI.png)

Creating such view:

![Ourika Landing Page](/blog_img/web/success10-ourika/landing-ourika.png)

{{< callout type="info" >}}
From [Travel](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/), to show your work, to helping others :)
{{< /callout >}}


**Other alternatives** explored were:

3. Minimal Studio
4. Sendit
5. [Energy Template](https://github.com/vbartalis/energy-template)


{{< details title="For Taxies as well | Astro Demo 📌" closed="true" >}}

* https://taxiourika.pages.dev/
* https://github.com/JAlcocerT/taxi-web

{{< /details >}}


---

## Conclusion

That was a one time setup, but one directional.

Im also exploring how these kind of themes do it so that it incorporates a KeystaticCMS:

**Update**

5. Mizar - https://github.com/majesticooss/mizar

* ✅ Localization
* ✅ Blog
* ✅ CMS for editing blog post (thanks to **Keystatic CMS**)
* ✅ PWA (thanks to vite-pwa)


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