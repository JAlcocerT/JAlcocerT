---
title: "From ReadMe to MakeSliDev v0.1"
date: 2025-08-06
draft: false
tags: ["MakeReadme","SliDev","Entrep"]
description: 'Its all about markdown - From ReadMe generator to SliDev presentations for all'
url: 'make-slidev'
---

I was *bikeshedding* and found out this grear project:

* https://github.com/ShaanCoding/makeread.me

> MPL2 | An Awesome ReadME Generator To Jumpstart Your Projects!

*Blame* again to the people building in public: https://www.reddit.com/r/github/comments/1itqlh4/i_got_tired_of_writing_readmes_so_i_built_an/

For the ones who [mind their time](https://jalcocert.github.io/JAlcocerT/time-management-data-analytics/), Shaan is also the dev behind this OSS Pomodoro Timer: https://github.com/ShaanCoding/Pomodoro-Timer

{{% details title="About MPL 2.0 🚀" closed="true" %}}

It's not just about keeping the initial license; it's about a specific type of copyleft that applies at the file level.

The main restriction is: **If you modify an existing file that is under the MPL 2.0 license, or create a new file that contains MPL 2.0-licensed code, that modified or new file must also be licensed under the MPL 2.0 when you distribute it.**

Here's why that's a more accurate way to look at it:

* **File-level copyleft:** The MPL 2.0's copyleft "stops" at the file boundary. This is the key difference from a strong copyleft license like the GPL, which would require the entire "larger work" to be under the GPL. With the MPL, you can have a project with some files under the MPL and other, completely new files under a different, even proprietary, license.

* **Distribution trigger:** The obligations only kick in when you **distribute** the code. If you modify the code and only use it internally within your organization, you are not required to share those changes.

* **Other obligations:** While the file-level copyleft is the primary restriction, you also have other, less onerous obligations. These include:
    * Keeping the original copyright and license notices.
    * Informing recipients that the code is under the MPL 2.0.
    * Making the source code for the MPL-licensed parts available to anyone you distribute the binary to.

So, your summary is conceptually correct in that the core idea is to maintain the license on the specific part of the code it applies to.

However, the details of how that "keeping" works—at the file level and upon distribution—are what truly define the MPL 2.0's unique balance.

{{% /details %}}


Isnt it great?

![MakeReadMe UI](/blog_img/entrepre/public-build/makeslidev/makereadme-live-edit.png)

It can edit markdown and see the result live!

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


* https://github.com/JAlcocerT/makeslidev

The original features you have them in `main`
```sh
git clone https://github.com/JAlcocerT/makeslidev
make setup
make dev
```

There you go, the original makeread.me project running locally:

*I changed the img to `https://cyclingthere.pages.dev/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp`*

![alt text](/blog_img/entrepre/public-build/makeslidev/makereadme-local-liveedit.png)

> See the UI at: `http://localhost:3000/`

> > And the swagger api: http://localhost:8080/

But the juice starts at the branch `makeslidev`:

```sh
git branch -a
```

---

## Conclusions

Ill come back to SliDev + *CMS* on a future post.

Expect a v0.2 coming with a simpler way of editing a SliDev PPT!

### Alternatives

I got to know along the way about these live markdown editors, that *in theory* can be plugged into a flask web app.

So as per the learnings of:

* https://jalcocert.github.io/JAlcocerT/cool-hugo-themes/
* https://jalcocert.github.io/JAlcocerT/making-flask-cms-for-ssg/

> This can be done muuuch simpler