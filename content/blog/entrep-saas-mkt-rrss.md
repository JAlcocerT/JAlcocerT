---
title: "Mastering Social Media x InfoGraphics"
date: 2026-02-01T11:20:21+01:00
draft: false
tags: ["Twitter X vs Threads","Youtube","Latex vs Typst","Side-Quest26","YFinance"]
description: 'Quality and automated content creation to build a community. Compared to just ads.'
url: 'creating-curated-and-automated-content'
---


**Tl;DR**

Can you create quality content and build a community with social media (Twitter/Threads)?

+++ High quality [infographics](#about-infographics)

**Intro**

What's the actual value of a follower?

Hard to calculate, but not impossible.

Can we say that 1 out of 1000 followers is a potential customer?

Then...the hard question comes.

How hard is to get those 1000 followers via organic content creation compared to just paying for their eye balls while they are dumb scrolling? 

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cool-ebooks/#infographics" title="Infographics | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/" title="Entrepreneur | Docs ↗" icon="book-open" >}}
{{< /cards >}}

A brand helps offset some part of the CAC.

So for the [artists](https://jalcocert.github.io/JAlcocerT/link-artists/) around: the first C stands for *customer*

Question: Do you have a product, so tht you can effectively opt to have customers? :)

## Programmatic Social Media

This is a not a completely new topic for me.


* https://jalcocert.github.io/JAlcocerT/interesting-apis/#twitter

![alt text](/blog_img/social-media/x-developer-portal-appinfo.png)


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/LibrePortfolio-X" title="LibrePortfolio Twitter/X ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="DataInMotion ↗" icon="github" >}}
{{< /cards >}}

```sh
git clone https://github.com/JAlcocerT/DataInMotion.git
cd DataInMotion && branch libreportfolio
#uv run tests/plot_historical_yield.py CAT --start 2005-01-01 --brand "@LibrePortfolio" --monthly
uv run tests/plot_historical_gweiss.py CAT --start 2005-01-01 --brand "@LibrePortfolio" --warmup-days 400
```


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/UnfoldingData" title="UnfoldingData Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of UnfoldingData plots and animations for Youtube Channel" >}}
{{< /cards >}}




## About Infographics

You can also try with:

* Reportlab as seen on [this video](https://www.youtube.com/watch?v=0SQb__Zrg5Y) https://pypi.org/project/reportlab/
* Typst

* https://towardsdatascience.com/from-default-python-line-chart-to-journal-quality-infographics-80e3949eacc3

* https://aiglobaltech.blogspot.com/2024/12/from-default-python-line-chart-to.html


### How to create Infographics?

When comparing LaTeX, KaTeX, Typst, and R Markdown (Rmd) for infographics, you are essentially choosing between **unparalleled precision** (LaTeX), **web-native speed** (KaTeX), **modern programming ergonomics** (Typst), and **data-driven automation** (Rmd).

For infographics, the most critical factor is usually **layout flexibility**—how easily you can place text, icons, and charts at specific coordinates.

### Comparison Table: Tools for Infographics

| Feature | **LaTeX** | **KaTeX** | **Typst** | **R Markdown (Rmd)** |
| --- | --- | --- | --- | --- |
| **Best For** | Print-perfect, complex vector diagrams. | Mathematical snippets on websites. | Rapid, modern PDF design and layout. | Dynamic, data-heavy charts/reports. |
| **Graphic Library** | **TikZ** (extremely powerful). | None (math-only). | **CeTZ** (TikZ-inspired). | **ggplot2**, **gridExtra**, **patchwork**. |
| **Layout Control** | High (but very verbose). | Low (line-based). | High (modern & intuitive). | Moderate (grid-based). |
| **Learning Curve** | Very Steep. | Easy (if you know TeX). | Moderate. | Moderate (requires R/Python). |
| **Live Preview** | Slow (requires full compile). | Instant. | Instant. | Slow (Knit process). |

---


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




### 1. LaTeX (The "Professional Heavyweight")

LaTeX is used for infographics primarily through **TikZ**, a language for creating vector graphics. It allows you to define every pixel, coordinate, and node programmatically.

* **Pros:** Professional-grade typography; infinite customizability; "Golden Standard" for scientific accuracy.
* **Cons:** Extremely slow compilation; "TikZ" can feel like learning a second language.
* **Infographic Use Case:** High-resolution posters for conferences where precision is non-negotiable.

### 2. KaTeX (The "Web Specialist")

KaTeX is not a document generator; it is a **math-rendering engine** for the web.

* **Pros:** The fastest math renderer available; renders to HTML/CSS (not images), making it SEO-friendly and accessible.
* **Cons:** It cannot create an entire infographic. It only handles the *math* within a web-based infographic (like a dashboard).
* **Infographic Use Case:** Embedding interactive formulas into a web-based explainer.

### 3. Typst (The "Modern Contender")

Typst is the newcomer designed to replace LaTeX. It uses a scripting language that feels like Python or JavaScript.

* **Pros:** **Instant live preview** is a game-changer for design; simpler syntax; its graphics library (**CeTZ**) is rapidly maturing.
* **Cons:** Younger ecosystem; fewer "pre-built" infographic templates compared to LaTeX.
* **Infographic Use Case:** Modern PDF brochures or visually rich resumes where you want "near-LaTeX" quality without the pain.

### ## 4. R Markdown / Quarto (The "Data Scientist’s Choice")

Rmd (now often superseded by Quarto) is built for **reproducibility**.

* **Pros:** If your infographic depends on a database or live data, Rmd automates the chart generation using `ggplot2`.
* **Cons:** Fine-tuning the position of "artistic" elements (like a custom icon next to a specific text block) is harder than in Typst or TikZ.
* **Infographic Use Case:** A weekly "Company Performance" infographic that pulls data from a spreadsheet and builds charts automatically.

---

Summary Recommendation

* **Choose LaTeX (TikZ)** if you need to create a complex, one-off vector masterpiece for print.
* **Choose Typst** if you want the best "developer experience" and need to iterate on a visual layout quickly with live feedback.
* **Choose R Markdown** if the infographic is 80% charts and 20% text, and you want it to update automatically when the data changes.

Would you like me to provide a basic **Typst** or **TikZ** code snippet to get you started on a layout?

[Typst vs LaTeX (2025) – Which Typesetting Tool Is Right For You?](https://www.youtube.com/watch?v=RL-8MNeHFdI)
This video provides a modern comparison of the performance and usability differences between LaTeX and Typst as of 2025.

---

## Conclusions

You are paying for the attention anyways:

* With your time to build the tools to create quality content (I assume you dont do it manually any more)
* With your money to just pay whatever platform for the ads


Social media be like: *100k views 1000 likes 100subs (1/1000 algo free)*

{{< cards >}}
  {{< card link="https://www.youtube.com/@BeyondAJourney" title="BaJ" image="/blog_img/data-experiments/yt-1y.png" subtitle="YT Channel Powered to play with videos" >}}
{{< /cards >}}

![100k views in a year](/blog_img/data-experiments/yt-1y.png)

---

## FAQ