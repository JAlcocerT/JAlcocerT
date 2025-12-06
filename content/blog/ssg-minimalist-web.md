---
title: "How to Save the Internet"
date: 2025-11-21T23:20:21+01:00
draft: false
tags: ["Web ebook","Dev","Better Docs & Blog with Astro","Google Code Wiki"]
description: 'Open Source Minimalist Websites. Checking Lighthouse CI to optimize the web.'
url: 'open-source-minimalist-websites'
---

**Tl;DR**

About The minimalist web vs the independent web! 🌐✨

I get very happy when finding out about blog posts on reddit or on self.st newsletter that are **purely human driven**.

> We can still feel that with themes like Paper mod

**Intro**

Do we need that much bloat?

Probably not.

What we probably need is a **Minimalist Webs** where different opinions can coexist.

I really enjoy finding blogs around that are not just a copy paste from the previous one.

Specially if they bring a phogo gallery like [this one](https://brianli.com/photos/)

But some people take it one level higher and do webs veeery minimalistic.

<!-- echo chambers -->

* https://lukesmith.xyz/articles/modern-freedom-means-being-a-slave-to-impulses/
* https://lukesmith.xyz/articles/monero-and-other-privacy-coins/
* https://lukesmith.xyz/articles/politics-matters-most-to-slaves/

* https://danluu.com/


<!-- 
https://ericmurphy.xyz/blog/minimalist-web/
https://ericmurphy.xyz/blog/discoverability/ -->

* https://512kb.club/
* https://erikjohannes.no/ - THis one has a great photo section!


<!-- 
https://www.youtube.com/watch?v=1iOVatAR-bU 
-->

{{< youtube "1iOVatAR-bU" >}}

---

## Conclusions

It curious to see how 'old designs' like: https://1999.37signals.com/

Are very easy to read, kind of a book!

Despite not been as minimalistic as the sites above:

```sh
du -sh . # Output: 1.5G! This is far from minimalistic already
```

I really enjoy hugo/astro and static site hosting to publish.

There is not a single time that Ive opened: https://astro.build/themes/1/?search=&price%5B%5D=free and havent found sth interesting.

Whatever you build, make sure to **validate the outcome**:

```sh
#sudo apt-get install dnsutils -y #dns resolution
nslookup github.com 
dig google.com

curl -s -o /dev/null -w "dns_lookup: %{time_namelookup}s connect: %{time_connect}s appconnect: %{time_appconnect}s pretransfer: %{time_pretransfer}s starttransfer: %{time_starttransfer}s ---------- total: %{time_total}s http_code: %{http_code}" https://blog.jalcocertech.com
```

{{< hextra/feature-grid >}}
 
{{< hextra/feature-card
  title="Google Speed Test"
  subtitle="Test the speed and performance with PageSpeed Insights."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://pagespeed.web.dev/"
>}}

{{< hextra/feature-card
  title="Website Carbon"
  subtitle="Website’s carbon footprint and environmental impact."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(142,53,74,0.15),hsla(0,0%,50%,0));"
  link="https://www.websitecarbon.com/"
>}}

{{< hextra/feature-card
  title="Web-Check"
  subtitle="Performance and uptime using Web-Check's analytics tool."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://web-check.xyz/"
>}}

{{< /hextra/feature-grid >}}


### Better Docs

I was considering Astro starlight for a documentation theme with i18n support here.

And doubting if sth like [HUGO congo](https://github.com/jpanther/Congo) would be the way forward.

But then I found this: https://github.com/themefisher/dockit-astro


```sh
git clone https://github.com/JAlcocerT/dockit-astro
#make install && make dev
```

![Dockit - A better Astro Starlight for FossEngineer](/blog_img/web/fosseng/dockit-astro.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tech-for-podcast/#docs-website" title="Starlight Docs - Post ↗" image="/blog_img/web/fosseng/starlight-docs-sample.png" subtitle="Astro Starlight | Docs Post" >}}
  {{< card link="https://github.com/JAlcocerT/dockit-astro" title="Dockit Astro Docs" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Astro Starlight...but tweaked" >}}
{{< /cards >}}


> This is simple great for F/OSS 

Time for a: Whats working, whats not and whats next?

Well, Google also released https://codewiki.google/ which can potentially get outdated my manual/windsurf/codex way of writing technical docs.

Time well tell.

For now it ,just' works on certain popular repos: https://codewiki.google/github.com/google-gemini/gemini-cli

But what Im sure is that the brand needs an upgrade from blog like to doc+blog like.

Anyways, wherever that might go, I have learnt a lot with it.

And I can see that some people have created couple of brands around them:

* https://flaviocopes.com/count-visits-static-site/
  * https://thevalleyofcode.com/ - THis is basically a doc like website...that reads like a web ebook. Cool idea!
* Even [courses](https://flaviocopes.com/courses/)/ebooks with distilled knowledge: https://flaviocopes.com/access/


### Better Blogs

Im already looking for 2026.

And in there i will keep tinkering on this medium.

But the curated already digested content will go to `blog.jalcocertech.com`

{{< details title="Astro Themes Selection | Blog 101 with PPTs 📌" closed="true" >}}

```sh
#https://github.com/oxygenna-themes/foxi-astro-theme/
git clone https://github.com/monakit/monakit
npm install
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

> This theme uses revealJS for the ppts, a candidate for an upcoming `blog.jalcocertech.com`

You can add pretty quick an [n8n embedded chatbot](https://jalcocert.github.io/JAlcocerT/pro-agency-automation/#landing-chatbot-with-kb-knowledge) to these kind of sites.

{{< /details >}}

1. https://github.com/ricocc/ricoui-portfolio

2. Monakit, which I tinkered superficially [here](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-sept-2025/#lately-i) - I liked the ppt integration out of the box

3. https://github.com/nuxt-ui-templates/portfolio/tree/main which is a cool NUXT Theme similar to [Canvas](https://github.com/HugoRCD/canvas)

>  Nuxt Portfolio Template made with Nuxt UI and [Nuxt Content](https://github.com/JAlcocerT/Home-Lab/tree/main/nuxt-content). 

4. https://github.com/konstantinmuenster/gatsby-theme-portfolio-minimal Now that I have covered gatsby?

5. This NextJS Theme also got my attention: https://github.com/edgarlr/magazine?ref=statichunt.com

> MIT |  Next.js Digital Magazine Starter Kit 

> > Kind of a similar feel to the awsome Astro News!

![Blogging via Astro News](/blog_img/web/beyond-journey-web.png)

6. https://github.com/bakate/astro-theme-starter

>  A modern and clean Astro theme for personal portfolios and bilingual (French/English) blogs. Built with TypeScript, Tailwind CSS, and MDX, focusing on performance and best practices. Ideal for developers and content creators 

7. https://github.com/8366888C/Ryze

> MIT |  A reader-friendly blog starter with accessibility, SEO and responsiveness out of the box. 

> > This one gave me a presentL the concept of [Lighthouse CI](https://github.com/GoogleChrome/lighthouse-ci)

8. If you liked [fuwari](https://github.com/JAlcocerT/j-models), you'd love this: https://github.com/Spr-Aachen/Twilight

>  **MIT** | A git based CMS integrated static blog template 

> > Uses [DecapCMS](https://github.com/decaporg/decap-cms) and I **forked** it https://github.com/JAlcocerT/Twilight

---

## FAQ

**Minimalist Astro Blogs**

* https://github.com/FjellOverflow/nordlys

### Minimalist HUGO 

* https://www.vanwerkhoven.org/blog/2021/setting-up-hugo/
* https://www.vanwerkhoven.org/blog/2019/speeding-up-an-nginx-webserver/
* https://www.vanwerkhoven.org/blog/2021/responsive_images_in_hugo_theme/

* https://github.com/janraasch/hugo-bearblog
* https://github.com/janraasch/hugo-bearblog


* https://github.com/theNewDynamic/awesome-hugo?tab=readme-ov-file

### Making Webs with AI

Probably not the best way to do very small websites unless you know what you are doing:

* https://github.com/rapidpages/rapidpages

> MIT | Generate React and Tailwind components using AI 


### Using lighthouse programatically

Going to Google Lighthouse is one thing.

But having it 