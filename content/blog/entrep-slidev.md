---
title: "From ReadMe to MakeSliDev v0.1"
date: 2025-08-06
draft: false
tags: ["MakeReadme","SliDevJS","Entrep","Awesome Readme"]
description: 'Its all about markdown - Ideas to go From ReadMe generator to SliDev presentations for all'
url: 'make-slidev'
---

**TL;DR** 

I found out a great **web app that edits markdown** in live time and wanted to combine it with SliDev for PPT Generation.

**Intro**

I was *bikeshedding* and found out this great project:

* https://github.com/ShaanCoding/makeread.me

> MPL2 | An Awesome ReadME Generator To Jumpstart Your Projects!

*Blame* again to the people building in public: https://www.reddit.com/r/github/comments/1itqlh4/i_got_tired_of_writing_readmes_so_i_built_an/

For the ones who [mind their time](https://jalcocert.github.io/JAlcocerT/time-management-data-analytics/),

Shaan is also the dev behind this OSS Pomodoro Timer: https://github.com/ShaanCoding/Pomodoro-Timer

Isnt it great?

![MakeReadMe UI](/blog_img/entrepre/public-build/makeslidev/makereadme-live-edit.png)

It can **edit markdown** and see the result live!

No CMS, nor headless CMS.

Ive been looking for such a thing for long time:

* https://makeread.me/generator/pottekkat-awesome-readme


## From Readme to SliDev

It's all about taking makereadme features.

And combining them with SliDev: https://sli.dev/resources/theme-gallery

> I mean, letting [windsurf](https://jalcocert.github.io/JAlcocerT/vide-coding/#windsurf) do so

Because the ppt templates should not be our focus anymore.

But the content quality!

### MakeSlidev

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/makeslidev" title="NEW MakeSliDev - Source Code" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for a SliDev Editor " >}}
{{< /cards >}}

* https://github.com/JAlcocerT/makeslidev

The original features you have them in `main`:

```sh
git clone https://github.com/JAlcocerT/makeslidev
make setup
make dev
```

There you go, the original makeread.me project running locally:

*I changed the img to `https://cyclingthere.pages.dev/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp`*

![local markdown live edits](/blog_img/entrepre/public-build/makeslidev/makereadme-local-liveedit.png)

> See the UI at: `http://localhost:3000/`

> > And the swagger API: http://localhost:8080/

But the juice starts at the branch `makeslidev`:

```sh
git branch -a
```

---

## Conclusions

Similar to AI project docs generation...

I could not resist but to try these IDE's (Windsurf etc) and their context awareness to generate SliDev PPTs.

And it worked.

So in a way a codex + md editor + slidev should be possible .


> Ill come back to SliDev + *CMS* on a future post.

Expect a v0.2 coming with a simpler way of editing a SliDev PPT!



### Alternatives

I got to know along the way about these live markdown editors, that *in theory* can be plugged into a flask web app.

So as per the learnings of:

* https://jalcocert.github.io/JAlcocerT/cool-hugo-themes/
* https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/

> This can be done muuuch simpler