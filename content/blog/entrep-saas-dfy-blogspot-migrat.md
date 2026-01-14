---
title: "From Blogspot to a Cool Website"
date: 2026-01-16
description: "How is your current site performing? Migrating Blogspot and wordpress to a Modern and Responsive Website"
draft: false
tags: ["Free Web Audits","Lead Magnet","Roadmap26","BiP"]
---


**Tl;DR**

The **Lead Magnet**: get a FREE web audit *leveraging the discoveries done [here](https://jalcocert.github.io/JAlcocerT/do-your-instagram/#web-audits)*

**Intro**

I have been following couple of sites on blogspot.

* https://valdigijon.blogspot.com/
* https://elescritoriodetesla.blogspot.com/

Could they have a responsive (and nice looking site), without loosing its old content?

## Preparing for BlogSpot Migration

Does it even have a sitemap?

```sh
#curl -s https://example.com/sitemap.xml -o /dev/null -w "%{http_code}\n"
curl -s https://valdigijon.blogspot.com/sitemap.xml -o /dev/null -w "%{http_code}\n" #200 means its there!

#optional - check robots.txt
curl -s https://valdigijon.blogspot.com/robots.txt | grep -i sitemap
```

> Search for any references to a sitemap URL within the `robots.txt` file. If found, you can use that URL to check for the sitemap instead

{{< details title="Why a Sitemap and the robots.txt are important 📌" closed="true" >}}

A sitemap is crucial for improving a website’s discoverability and SEO (Search Engine Optimization). Here’s why a sitemap matters and what happens if there's no `robots.txt`:

### Why a Sitemap Matters

1. **Improves Search Engine Indexing:**
   A sitemap provides search engines like Google and Bing with a structured list of URLs on your site. It helps search engines discover and crawl all pages, especially those that might not be easily accessible through internal links.

2. **Better Crawling of Dynamic or Large Websites:**
   For large websites or those with dynamically generated content, a sitemap ensures that all important pages are indexed, even if they aren’t directly linked or deeply buried.

3. **Prioritization and Metadata:**
   Sitemaps can include metadata about each URL, such as the last modification date, update frequency, and page priority. This helps search engines determine how often to crawl the site and which pages are more important.

4. **Ensures Coverage of Non-standard Pages:**
   Pages that are difficult to discover via normal crawling (due to missing internal links or complex site structures) are more likely to be indexed when included in a sitemap.

5. **Helps with Internationalization and Media Content:**
   Sitemaps can include references to different language versions of a site or media like images and videos, ensuring that all variations are indexed and searchable.

### **What If You Don’t See a `robots.txt` File?**

1. **Crawling Isn't Blocked, But It’s Less Controlled:**
   If a `robots.txt` file is missing, search engines will still crawl the site, but you won’t have explicit control over which pages or sections should be excluded. The `robots.txt` file is typically used to block crawlers from indexing certain pages, like admin panels or duplicate content.

2. **No Sitemap Declaration:**
   Some websites include the sitemap location within the `robots.txt` file, which helps search engines find it. If the `robots.txt` file isn’t present, search engines will still try to find the sitemap at the default location (`/sitemap.xml`). However, if it's stored elsewhere and there's no declaration, it may be harder for search engines to discover it.

3. **Default Crawling Behavior:**
   Without `robots.txt`, search engines will follow their default crawling behavior, which might include crawling unnecessary or unoptimized pages (such as login pages, search results, etc.). This can lead to inefficient crawling and negatively affect how well the site is indexed.

A sitemap enhances your website’s discoverability and SEO performance by ensuring that search engines can index all important content. Even if there's no `robots.txt`, search engines will crawl the site, but without the benefit of directives for exclusion or a clear sitemap location, which could lead to inefficiencies.

{{< /details >}}

## Scrapping BlogSpot for Migrating its content

{{< callout type="info" >}}
  A post of what I learnt about [Scrapping Tools](https://github.com/JAlcocerT/Scrap_Tools)
{{< /callout >}}



---

## Conclusions



Want to do something similar?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Reach out via my Consulting Service Tier and Calendar" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="The power to DIY - via ebooks" image="/blog_img/web/1ton-webook.png" subtitle="Distilled knowledge via web/ooks that enable you to create" >}}
{{< /cards >}}



### Programmatic Free Audits for Websites

Give me your contact details and I will move the world.

Or in this case: verify your email and select which if these audits you want to perform against your site for free (by default some will be selected).

Ive seen some good examples: https://www.beedigital.es/analisis-seo-gratuito/



Btw, the **pages speed insights**, can be done via **API**: *see [this .md](https://github.com/JAlcocerT/morita-web/blob/main/z-pagespeedinsight-101.md)*

![Checking Google Pages Speed Insights Via API](/blog_img/web/morita-flask/pagespeedinsightapi.png)

Must have also Lighthouse-CI:

Could it also be a check on exposed API endpoints?

At least to have CORS and Rate limiting (?)

Whatever this is...I made it work into a secondary mission.

A side side side project.

I mean...the photo gallery v2 things i was tinkering during xmas *now winter holidays*

It incorporated a programmatic 101 web audit.

do-your-instagram
POST!!!!!!!!!! and repossss

### Options for Anyone to get a Website

DIY/DWY/DFY:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="SelfHosted Landing Repo" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/web/1ton-webook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}
