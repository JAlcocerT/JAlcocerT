---
title: "From ReadMe to MakeSliDev"
date: 2025-08-07
draft: false
tags: ["MakeReadme","SliDev","Entrep"]
description: 'Its all about markdown - From ReadMe generator to SliDev presentations for all'
url: 'make-slidev'
---

I was *bikeshedding* and found out this grear project:

* https://github.com/ShaanCoding/makeread.me

> MPL2 | An Awesome ReadME Generator To Jumpstart Your Projects!

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

![alt text](/blog_img/entrepre/public-build/makeslidev/makereadme-live-edit.png)

It can edit markdown and see the result live!

* https://makeread.me/generator/pottekkat-awesome-readme



## From Readme to SliDev


### MakeSlidev

* https://github.com/JAlcocerT/makeslidev


```sh
git clone
make setup
make dev
```

> See the UI at: `http://localhost:3000/`

> > And the swagger api: http://localhost:8080/