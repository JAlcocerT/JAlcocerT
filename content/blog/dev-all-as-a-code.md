---
title: "Everything is Code"
date: 2025-10-29T08:20:21+01:00
draft: false
tags: ["Matplotlib vs Manim vs RemotionJS vs Animotion","SlidevJS vs ReflexJS","Pandoc vs Latex vs Typst"]
url: 'things-as-a-code'
description: 'Creating everything is a code. Animations, ppts, reports/inphographics , ebooks...'
---


**Intro**

> BC we have to use those OpenAI Prompt packs: https://academy.openai.com/public/tags/prompt-packs-6849a0f98c613939acef841c

> > 

Motion Canvas is great for interactive, visually rich web animations. 

Remotion is best for React developers needing video automation and scaling.

Manim is the tool for deep mathematical visualization with powerful programmatic control.


[Presentations](#ppts-as-a-code): Reveal.js vs Slidev

- Reveal.js is a popular HTML presentation framework that supports Markdown and is flexible but often requires writing HTML for layout and animations. It is widely used but less concise for slide content.[1]
- Slidev is built on Vue.js and Vite, providing an extended Markdown format for creating slides. It is more concise than Reveal.js, supports Vue components for interactive slides, has instant hot-reloading, built-in theming, and recording features. Slidev is very developer-friendly and web-based, allowing extensive customization.[2][1]
- In summary, Slidev is often preferred for modern developer presentations due to ease of use, interactivity, and faster iteration, while Reveal.js remains a flexible, established choice.

Reports: Pandoc vs Typst vs LaTex

- Pandoc is a versatile converter tool supporting Markdown, LaTeX, HTML, DOCX, and many other formats. It is great for converting documents and combining Markdown with raw LaTeX for complex formatting. It requires some setup but is widely used and flexible.[3][4]
- Typst is a relatively new open-source typesetting system designed as a LaTeX alternative, known for a clean syntax inspired by Rust and Python, faster compilation, and easier document styling. It offers good readability of error messages and web collaboration features. It is intuitive for simple to moderately complex documents but less mature than LaTeX.[5][6][3]
- LaTeX is the traditional, powerful typesetting system with extensive features for academic and complex document layouts. It has a steeper learning curve and verbose syntax but the richest ecosystem and long-term support.[3][5]
- Overall, Pandoc is excellent for format conversion and combining Markdown with LaTeX, Typst offers a modern alternative with easier syntax, and LaTeX is ideal for advanced, professionally typeset documents.


| Use Case        | Tool         | Key Strengths                               | Notes                      |
|-----------------|--------------|---------------------------------------------|----------------------------|
| Presentations   | Reveal.js    | Flexible, established, supports Markdown    | Requires HTML for layouts  |
|                 | Slidev       | Markdown-based, interactive, fast HMR       | Developer and Vue friendly |
| Reports        | Pandoc       | Format conversion, markdown + LaTeX support | Setup needed               |
|                 | Typst        | Clean, easy modern syntax, fast compile      | Newer, evolving            |
|                 | LaTeX        | Powerful, rich ecosystem for academia        | Steep learning curve       |

This selection depends on priorities: Slidev for modern web presentations, Reveal.js for flexible HTML slides; Pandoc for format conversions, Typst for newer simpler typesetting, and LaTeX for complex document mastery.




### PPTs as a Code


1. RevealJS

You can place this one inside HUGO SSG if you want, like: https://github.com/joshed-io/reveal-hugo

My favourite: **SliDevJS**

https://jalcocert.github.io/JAlcocerT/make-slidev/

You can create a [Micro SaaS around Slidev](https://jalcocert.github.io/JAlcocerT/ai-driven-presentations/)

Like: https://github.com/JAlcocerT/slidev-editor with Firebase and Logto auth working as per [this post](https://jalcocert.github.io/JAlcocerT/firebase-auth-101/) :)



#### SliDev and Tech Talks

As I feel quite confortable with SliDev, ill be capturing the upcoming interesting tech talk I conduct.

The [latest tech talk](https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth/slidev/slidev-ba-tech-talk), I have place [here](https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth/slidev)

And also any slidev ptt done for youtube tech videos if applies, will be inside [Home-Lab/SlidevJS](https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-slidevjs).


```sh
npm init slidev #yarn create slidev
```

**Features I enjoy**: Themes can provide styles, layouts, components, or even configurations for tools.


0. Switching between themes by just **one edit** in your frontmatter
1. Embed Twitter, youtube... thanks to [VUE components](https://sli.dev/builtin/components#youtube), like the demo `./components/Counter.vue`

```yml
#<Tweet id="1866822826696773747" scale="0.5" />
#<Youtube id="fxVNTffZC2U" width="300" height="200" />
```

2. Bring up to date data from API calls. Like `https://open-meteo.com`
3. Make it look cool with mermaidJS / Katex / ChartJS
4. This thing can even do animations based on https://motion.vueuse.org/
5. Katex, for those PHD users
6. MermaidJS
7. Export to pdf/pptx or png. *They are all pngs btw, so be mindful if non tech people will have to edit*

> Cool PPTs other created: https://raw.githubusercontent.com/BaizeAI/talks/refs/heads/main/packages/2025-06-11-kubecon-hk/slides.md


### eBooks as a Code

Initially, I thought that [ebooks could be just done via Rmd](https://github.com/JAlcocerT/ebooks)

Then I understood [here, that pandoc](https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/) is what make the thing work.

And found a [cool SSG Theme to host your ebook pdfs statically](https://github.com/JAlcocerT/sell-your-ebook).

Then, I created to just dump my notes into ebooks: https://github.com/JAlcocerT/ebook-ideas

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/ebook-ideas" title="ebook ideas Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code to ship ebooks" >}}
{{< /cards >}}


You know, just in case you want to create your pdf libre or your epub libre org!

Or to write a e-book for your friend (Anna's archive).

> Others, like [WhyCryptoCurrencies](https://github.com/treeman/why_cryptocurrencies), use [Pollen](https://docs.racket-lang.org/pollen/index.html) instead

Or...because you can now have deep research agents everywhere:

* https://parallel.ai/pricing
* Perplexity...
* ...

<!-- 
referencia a persuasion escrito en jan 2022

y aqui cositas de neuromarketing

the buying brain....
`brainfluence`

 -->




#### Reports as a code

#### Infographics as a code



#### Resume as a Code

Just in case that you need some help with: https://fmhy.net/misc#resume-portfolio




## Animations as a Code


You know, we can do [animation as a code as seen with matplotlib](https://jalcocert.github.io/JAlcocerT/animations-as-a-code/).

{{< youtube "I46bPuSdrqk" >}}

And you should probably place your codes into a [repo like this one](https://github.com/JAlcocerT/DataInMotion) if you go that route.



What if you have couple of brands and want to recycle your animations?


Then, Last night the yt algorithm hit me with this:

<!-- 
https://youtu.be/dtjb2OhEQcU?si=sXeXvjrF50WfU_P4
 -->


{{< youtube "dtjb2OhEQcU" >}}

And this

<!-- https://www.youtube.com/watch?v=O6TjkLwUAtg -->

{{< youtube "O6TjkLwUAtg" >}}


<!-- https://github.com/JAlcocerT/Py_Double_Pendulum -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/chaos-theory-and-the-double-pendulum-with-python/" title="MultiChat UI" image="https://raw.githubusercontent.com/JAlcocerT/Py_Double_Pendulum/main/Z_Outro/DoublePendulum.gif" subtitle="How the final multichat UI looks like" >}}
  {{< card link="https://github.com/JAlcocerT/Py_Double_Pendulum" title="Double Pendulum Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code a chaos theory in motion webapp" >}}
{{< /cards >}}

And then...I saw this: https://github.com/bufferhead-code/this-video-is-written-in-code



<!-- https://www.youtube.com/watch?v=wGkazw8x1Dg -->

{{< youtube "wGkazw8x1Dg" >}}


```sh
git clone https://github.com/bufferhead-code/this-video-is-written-in-code
```


So...wait, didnt we already...?

Matplotlib can be used for creating basic 2D animations and exporting them as videos or GIFs, mainly for data visualizations and scientific plots.

It supports animation classes that update frames over time, but it is limited in terms of creative, sophisticated motion graphics or professional video production and interactivity.

In contrast, tools like Motion Canvas, Remotion, or Manim provide much richer features for video animations with more control, flexibility, and higher production value. 

They are specialized for creating engaging presentations, explainer videos, or educational animations beyond simple graph animations.

Blender is a professional 3D modeling and animation software, and yes, it supports scripting—usually with Python—to automate scene creation, object manipulation, lighting, and camera control. This scripting allows creating complex 3D scenes and animations programmatically.

Blender scripting is powerful for 3D animations, simulations, and rendering, which is quite different and much more advanced compared to 2D animation libraries like Matplotlib.

- Matplotlib: Best for simple 2D scientific animations, basic video export.
- Motion Canvas/Remotion/Manim: Better suited for rich 2D animated videos and educational content.
- Blender: Professional 3D animation software with Python scripting for complex 3D scenes and animations.

> So, for video animations where creative flexibility and professional output matter, tools like Motion Canvas or Remotion are superior to Matplotlib. 

> > For 3D scenes and animations via coding, Blender scripting is the go-to solution.


Motion Canvas, Remotion, and Manim are all tools for creating **programmatic animations and videos**, but they cater to different use cases and technologies.

Motion Canvas is a modern TypeScript-based tool focused on vector animations with real-time preview and strong web integration.

It is praised for allowing CSS features and live timing control in animations but is still relatively new with fewer complex examples and features compared to others.

It targets users who prefer coding animations with web tech and want interactive previews while creating.

Remotion stands out as a React-based tool for creating programmatic videos. It enables creating MP4 videos using React components, making it excellent for developers familiar with React who want to automate and scale video production. 

Remotion is well-regarded for strong documentation, ease of use, and a focus on collaborative and dynamic video creation, including applications like product videos and in-browser editing.

Manim, on the other hand, is a Python library specialized in math and educational animations. It offers fine-grained control for precise formula animation and algorithm visualization. It requires more programming expertise and manual effort but is powerful for STEM use cases. Recent research advances also use AI to automate some Manim coding, improving accessibility. Manim excels in complex mathematical and algorithmic animations rather than general vector or video creation.[7][8][9]


| Feature/Aspect          | Motion Canvas                       | Remotion                          | Manim                              |
|------------------------|-----------------------------------|----------------------------------|-----------------------------------|
| Programming Language   | TypeScript (Web, JS)               | React (JavaScript)                | Python                            |
| Main Use Case          | Vector animations & presentations | Programmatic video creation      | Math & educational animations     |
| Preview/Interactivity  | Real-time visual preview           | React-driven dynamic rendering   | No live preview, manual rendering |
| Complexity & Control   | Moderate, web tech based           | High for UI/UX videos            | High for math/algorithm detail    |
| Target Users           | Web developers, educators          | React developers, marketers      | Educators, researchers, math pros |
| Learning Curve         | Moderate                         | Moderate                        | Steep (programming + math)        |
| Community & Docs       | Growing, good docs                 | Strong community & documentation | Mature community, rich resources  |


### Animations x SSG

This year I also was playing around with Astro components.

And withing the datanova theme, I found out that they are doing a really cool animation (which is a SVG!)

```sh
npm install
#npm run dev
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```





---

## Conclusions


https://github.com/slidevjs/slidev


### Webs are also code

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ghost" title="Ghost with Docker 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wordpress" title="WP with Docker 🐋 ↗" >}}
{{< /cards >}}

If you are looking for a tool to **get general knowledge about a website**, you can use the **web-check project**

* https://github.com/Lissy93/web-check
  * Use it at https://web-check.xyz/
  * It provides also links to other very interesting tools to explore a domain/website

>  🕵️‍♂️ MIT | All-in-one OSINT tool for analysing any website 

And you can use these projects together with https://github.com/datopian/markdowndb - **MIT** Licensed

* https://markdowndb.com/ - A rich API to your markdown files in seconds.


> Turn markdown files into structured, queryable data with JS. Build markdown-powered docs, blogs, and sites quickly and reliably.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/Commento" title="Commento | Docker Config 🐋 ↗" >}}
{{< /cards >}}
