---
title: "Lead Magnets around MailerLite API"
date: 2025-09-21T16:20:21+01:00
draft: false
tags: ["Micro SaaS Essentials","MailerLite goodies","Subscribe2Podcast","Waiting2Landing"]
description: 'BiP user flows around Landing Pages + newsletter layers. With Interesting bcms and pages-cms'
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

Apparently, there are many *digital creators*.

Its strange that people look at you asking if by having blog you meant instagram.


* https://developers.mailerlite.com/docs/#mailerlite-api
* https://accounts.mailerlite.com/login

* Before, I was doing stuff with mailerlite API at:
    * https://jalcocert.github.io/JAlcocerT/blog/dev-forms/#mailerlite
    * https://gitlab.com/fossengineer1/cv-check/-/blob/main/Z_Tests/MailerLite/test_mailerlite_v1.py?ref_type=heads
    * https://gitlab.com/fossengineer1/cv-check/-/blob/main/Z_CVCheck_pdfmineropenAI_v3.py?ref_type=heads


Some people use mailchimp, or

But i just felt confortable enought with Mailerlite: https://www.mailerlite.com/pricing


{{< details title="Setup MailerLite for your Websites with Custom Domain 📌" closed="true" >}}

You will need to authenticate that you own the email and also the domain (with DNS).

Go to your [mailerlite dashboard UI](https://dashboard.mailerlite.com)

I am using Cloudflare for that domain, and the DNS were updated automatically via UI.

There are some **CName and txt records** and they will be **DNS only**, not proxied.

![MailerLite Custom Domain Setup](/blog_img/web/SaaS/mailerlite-domainsetup.png)

**Create a new form** and you will get the JS to place before the `</head>` of your web.

```js
<!-- MailerLite Universal -->
<script>
    (function(w,d,e,u,f,l,n){w[f]=w[f]||function(){(w[f].q=w[f].q||[])
    .push(arguments);},l=d.createElement(e),l.async=1,l.src=u,
    n=d.getElementsByTagName(e)[0],n.parentNode.insertBefore(l,n);})
    (window,document,'script','https://assets.mailerlite.com/js/universal.js','ml');
    ml('account', 'some_acount_id');
</script>
<!-- End MailerLite Universal -->
```

> You can also get **MailerLite working with a button**, so that it opens as pop up:

```html
<a class="ml-onclick-form" href="javascript:void(0)" onclick="ml('show', 'some_id_here', true)">Click here to show form</a>

and use it with your components, for example
<form id="simple-newsletter-form" class="input-container" method="post" action="javascript:void(0);" onsubmit="ml('show', 'some_id_here', true); return false;">
    <input type="submit" value="Ready to Know?" class="ml-onclick-form" style="appearance: button; -webkit-appearance: button; cursor: pointer;">
</form>
```

{{< /details >}}

> Plus they have a cool CSR pricing page!


## MailerLite API

This is what you need: https://dashboard.mailerlite.com/integrations

![Mailerlite API integration](/blog_img/entrepre/mailerlite/mailerlite-ui-api-integ.png)

### MailerLite Integrations

As long as you know how to work with Webhooks...you have it all: 

* https://www.mailerlite.com/integrations/mailercheck

### MailerLite x n8n

See how Ive done it: https://jalcocert.github.io/JAlcocerT/n8n-with-ai/#n8n-x-mailerlite

![Configuring mailerlite webhooks for n8n](/blog_img/GenAI/n8n/mailerlite/1-webhook-events.png)


## A Theme to Test this

* https://github.com/bcms/starters

> MIT |  👩‍💻 Build beautiful, accessible, high-performance websites with [BCMS](https://github.com/bcms/cms) 

> >  ⭐️ BCMS is a **Headless CMS** for developers & their clients. Works nicely with Gatsby, Next.js & Nuxt. This is an open-source version for **self-hosting**. 

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/bcms" title="BCMS WIP| Docker Config 🐋 ↗" >}}
{{< /cards >}}

* https://thebcms.com/astro-cms

<!-- https://www.youtube.com/watch?v=y2du9vQwZUw -->


Using Headless CMS & Nuxt.js to Develop Fast Static Websites | Momcilo Popov | Front End developer

{{< youtube "y2du9vQwZUw" >}}




{{< callout type="info" >}}
This is a very cool setup for a ~webifyer kind of idea, as [Pages CMS](https://github.com/pages-cms/pages-cms)
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

I tried that with few [samples last year](http://localhost:1313/websites-themes-2024/):

{{< cards >}}
  {{< card link="https://cyclingthere.pages.dev" title="My Travel Adventures" image="/blog_img/web/WebsSnapshots/Web_CyclingThere.png" subtitle="I can write and also create interesting photo galleries about my travel experiences" >}}
  {{< card link="https://whilecyclingthere.web.app/" image="/blog_img/web/whilecycling.png" title="Photo Gallery Blog" subtitle="Made with HUGO and Photo centered" >}}
{{< /cards >}}

I bring you few more:

There are several GitHub repositories with photo gallery themes built for both Astro and Hugo frameworks.

Astro photo gallery themes:

- [jomaendle/astro-photo-gallery](https://github.com/jomaendle/astro-photo-gallery): A simple photo gallery using the Astro framework.
- [erfianugrah/revista-3](https://github.com/erfianugrah/revista-3): A photography portfolio theme with a masonry layout, image optimization, and lightbox, built on Astro.
- Astro official theme listings also include photography portfolio templates with responsive designs and gallery features.

Hugo photo gallery themes:
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

[15](https://github.com/pysunday/DesignPhotographyPortfolio) - This one is a great start for a *,instagram clone'* and is multilang

[16](https://astro.build/themes/details/photography-portfolio-template/)
[20](https://github.com/Sped0n/bridget)

---

## Conclusions

That's it.

Consider this as a new ssg + mailerlite 101.

But I will have to try BCMS and PagesCMS at another occasion.

For the future, probably I have to build some kind of *Just JAlcocerT Newsletter* with RSS support ofc.

### What People have Build

A simple WP + (paywalled) subscription

* https://www.genteinvencible.com/

![Subscribe Web Example](/blog_img/entrepre/stripe-mailerlite/example-subs.png)