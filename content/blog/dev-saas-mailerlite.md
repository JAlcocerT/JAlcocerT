---
title: "Lead Magnets around MailerLite API"
date: 2025-09-20T16:20:21+01:00
draft: false
tags: ["Micro SaaS Essentials","MailerLite goodies","n8n","Subscribe2Podcast","Waiting2Landing"]
description: 'BiP user flows around Landing + newsletter layers. With Interesting bcms and pages-cms'
url: 'mailerlite-for-saas'
---


**Tl;DR**

Get a view is trivial with millions of brains dumb scrolling.

Getting a like is easy.

You will get followers.

Would you be able to influence someone?

Do they like you enough to have a 1:1 information exchange?

Or they just see your content in between ads?

**Intro**

Apparently, there are many digital creators.

Its strange that people look at you asking if by having blog you meant instagram.


* https://developers.mailerlite.com/docs/#mailerlite-api
* https://accounts.mailerlite.com/login

* Before, I was doing stuff with mailerlite API at:
    * https://jalcocert.github.io/JAlcocerT/blog/dev-forms/#mailerlite
    * https://gitlab.com/fossengineer1/cv-check/-/blob/main/Z_Tests/MailerLite/test_mailerlite_v1.py?ref_type=heads
    * https://gitlab.com/fossengineer1/cv-check/-/blob/main/Z_CVCheck_pdfmineropenAI_v3.py?ref_type=heads


Some people use mailchimp, or

But i just felt confortable enought with Mailerlite.


## MailerLite API

This is what you need: https://dashboard.mailerlite.com/integrations

![alt text](/blog_img/entrepre/mailerlite/mailerlite-ui-api-integ.png)

### MailerLite Integrations

### MailerLite x n8n


## A Theme to Test this

* https://github.com/bcms/starters

> MIT |  👩‍💻 Build beautiful, accessible, high-performance websites with [BCMS](https://github.com/bcms/cms) 

> >  ⭐️ BCMS is a Headless CMS for developers & their clients. Works nicely with Gatsby, Next.js & Nuxt. This is an open-source version for **self-hosting**. 

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/bcms" title="BCMS WIP| Docker Config 🐋 ↗" >}}
{{< /cards >}}

* https://thebcms.com/astro-cms

https://www.youtube.com/watch?v=y2du9vQwZUw
Using Headless CMS & Nuxt.js to Develop Fast Static Websites | Momcilo Popov | Front End developer



{{< callout type="info" >}}
This is a very cool setup for a ~~webifyer kind of idea, as [Pages CMS](https://github.com/pages-cms/pages-cms)

{{< /callout >}}


### Podcast

Particularly: https://podcast-starter.thebcms.com/, this https://github.com/bcms/starters/tree/master/astro/podcast

A podcast post again?

https://jalcocert.github.io/JAlcocerT/tech-for-podcast/#podcast-website
![alt text](/blog_img/entrepre/mailerlite/astropod-podcast.png)


Yes, again.

But this time there will be some part available for anyone.

And some part available for subscribed users.

{{< callout type="info" >}}
I could have just continued and plug this to the waiting2landing or into a [Photo Gallery](#photo-gallery)
{{< /callout >}}


```sh
git clone https://github.com/bcms/starters
sudo rm -r .git
```

### Photo Gallery

Just in case that you were tired of the [**fantastic** Hugo Photo Gallery](https://github.com/nicokaiser/hugo-theme-gallery).

I bring you few more:

Yes, there are several GitHub repositories with photo gallery themes built for both Astro and Hugo frameworks.

Astro photo gallery themes:
- [jomaendle/astro-photo-gallery](https://github.com/jomaendle/astro-photo-gallery): A simple photo gallery using the Astro framework.
- [erfianugrah/revista-3](https://github.com/erfianugrah/revista-3): A photography portfolio theme with a masonry layout, image optimization, and lightbox, built on Astro.
- Astro official theme listings also include photography portfolio templates with responsive designs and gallery features.

Hugo photo gallery themes:
- [nicokaiser/hugo-theme-gallery](https://github.com/nicokaiser/hugo-theme-gallery): A simple, opinionated photo gallery theme for Hugo.
- [thkukuk/hugo-photoswipe5-gallery](https://github.com/thkukuk/hugo-photoswipe5-gallery): A gallery theme with PhotoSwipe lightbox and configurable thumbnails.
- [bep/gallerydeluxe](https://github.com/bep/gallerydeluxe): A fast and effective Hugo module for photo galleries, great for large image collections.
- [nux-li/hugo-foto-theme](https://github.com/nux-li/hugo-foto-theme): A Hugo theme focused on creating photo galleries for photographers.

These projects provide responsive layouts, lightbox/carousel support, and various customization options suitable for photography portfolios or general image galleries.

[1](https://github.com/jomaendle/astro-photo-gallery)
[2](https://github.com/erfianugrah/revista-3)
[3](https://github.com/thkukuk/hugo-photoswipe5-gallery)
[4](https://github.com/nicokaiser/hugo-theme-gallery)
[5](https://github.com/bep/gallerydeluxe)

[6](https://github.com/nux-li/hugo-foto-theme) - Very nice Hugo theme for creating photo galleries based on images' [metadata](https://github.com/nux-li/hugo-foto-theme?tab=readme-ov-file#prerequisites). See https://matze.rocks/images/


[7](https://github.com/topics/astro-themes)
[8](https://astro.build/themes/2/)
[9](https://github.com/chrismwilliams/astro-theme-cactus)
[10](https://dave.gv.ca/posts/hugo-photo-gallery/)
[11](https://astro.build/themes/3?search=Portfolio)
[12](https://github.com/trending/astro)
[13](https://github.com/mfg92/hugo-shortcode-gallery)
[14](https://astro.build/themes/)

[15](https://github.com/pysunday/DesignPhotographyPortfolio) - This one is a great start for a *,instagram clone'* and is multilang

[16](https://astro.build/themes/details/photography-portfolio-template/)
[20](https://github.com/Sped0n/bridget)

### Just JAlcocerT Newsletter



---

## Conclusions

That's it.

Consider this a new ssg + mailerlite 101.

### What People have Build

A simple WP + subscription

* https://www.genteinvencible.com/

![Subscribe Web Example](/blog_img/entrepre/stripe-mailerlite/example-subs.png)