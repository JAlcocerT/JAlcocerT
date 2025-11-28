---
title: "AI Driven e-books (as a code) with Pandoc"
date: 2025-08-31
draft: false
tags: ["Entrepreneuring","sell-your-ebook","R","knitt","ebook 101 landing","Flask CMS JSON"]
description: 'Building in public a simple web platform to create/sell ebooks pdf/epub. Compared to amazon KDP.'
url: 'ai-driven-ebooks'
---

**TL;DR** 

It all started with [Enchiridion](https://github.com/bdsqqq/psykip)

Now here I am, writing 100+ posts of my journey this year.

You know that I love [R language](https://jalcocert.github.io/JAlcocerT/r-language-101/) and its [knitt package](https://jalcocert.github.io/JAlcocerT/r-knitt-package-guide/)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/WebifAI/blob/main/Z_Utils/logto_utils.py" title="WebifAI Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Flask Web App with Stripe, Umami, FormBricks and Logto as Utils" >}}
  {{< card link="https://github.com/JAlcocerT/ebooks" title="NEW eBooks Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Creating ebooks as a code with Rmd / knit / bookdown" >}}
{{< /cards >}}

Would it be possible to [make ebooks as a code](#creating-an-ebook)?

It seems it is, as Pandoc is the one doing the job behind R (and it can also do so with ipynb and Py)

**Intro**

I got inspired recently by the concept of: `https://readmake.com/`

Some people are selling this kind of things on social media: `https://altagency.com/guide/`

People with PRO tech knowledge, like: `https://kerkour.com/books`

> Others, just publish freely, like https://github.com/treeman/why_cryptocurrencies, which builds with [Pollen](https://docs.racket-lang.org/pollen/) and touches the [crypto](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) ecosystem

Together with the *build in public*, which it seems to be a thing.

How about **selling an ebook** be all about: having an stripe account and proper content that people want to read?

## A landing page for your eBook

The inspiration started when I found about: https://github.com/candidosales/landing-page-book-astro-tailwind

Because creating a PDF to launch your ebook is not a secret as [I tinkered here](https://github.com/JAlcocerT/ebooks)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/sell-your-ebook" title="NEW Sell your eBook" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Astro SSG Theme (x) Stripe (x) N8N" >}}
{{< /cards >}}

{{< callout type="info" >}}
The original theme Iis forked from [candidosales](https://github.com/candidosales/landing-page-book-astro-tailwind), where I brought [makefile](https://github.com/JAlcocerT/sell-your-ebook/blob/main/Makefile) and dockercompose for easier deployment + easier configuration via json.
{{< /callout >}}

```sh
#https://github.com/candidosales/landing-page-book-astro-tailwind
#https://github.com/zenorocha/14habits.com
git clone https://github.com/JAlcocerT/sell-your-ebook
#npm install
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
#npm run build
#npm install -g serve #serve with npm
#serve -s dist #http://localhost:3000
```

> The original theme (also MIT) is awsome and brings a lot of content costomization via `config.json`

> > The theme is oriented towards one book selling, but you could adapt it so that it becomes, for example, your knitting patterns shop `https://morecaknit.com/`, and wow, that'd be a shopify competitor!


![Ping comparison from selfhosted astro x300 vs local ping vs shopify vs cloudflare pages](/blog_img/entrepre/product/ebook-shopify-ping.png)
You know what to tell, its just that... **time matters**.

So why not accelerating the **time to ship ebooks** by understanding how to have their skeleton code driven?

And *maybe* get LLM help for charts creation, data driven parts etc.


### Using Sell Your Ebook

You will need containers and a server to deploy this.


The idea to make it as simple as possible is that the docker compose environment variables send information to the `config.json` of the astro ssg theme that we have been tinkering above.

The result?

You now just need to tweak one place and enjoy the theme, with your [stripe payment link included](#stripe-payment-links).


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/sell-your-ebook" title="NEW eBooks landingpage Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Creating ebooks landing page with stripe product link" >}}
{{< /cards >}}

```sh
git clone https://github.com/JAlcocerT/sell-your-ebook
#cd sell-your-ebook
#make quick-dev #to spin dev server inside container and see :4321 still
#docker compose up astro-prod -d
make quick-prod #to bring the real statically generated prod version to 8090
```

You might just need to adjust the port mapped to the server: `http://192.168.1.11:8099/`

But for CF tunnels its just: `astro-prod:4321`, configure it via Zero Trust after you connect to the cf network: `https://one.dash.cloudflare.com/`

```sh
#docker network ls | grep cloudflared_tunnel
docker network connect cloudflared_tunnel astro-prod #connect

#verify
#docker inspect astro-prod --format '{{json .NetworkSettings.Networks}}' | jq
```

![eBook Astro and Cloudflare Tunnels](/blog_img/entrepre/product/ebook-astro-cftunnel.png)

Aaaand this is it: https://ebook.jalcocertech.com/

![Ebook Landing + Umami Web Analytics](/blog_img/entrepre/product/ebook-umami.png)

{{< callout type="info" >}}
You can [make epubs](#converting-to-epub) and pdf from png/html/md files, [all programatically](https://github.com/JAlcocerT/sell-your-ebook?tab=readme-ov-file#quick-epub-creation)!
{{< /callout >}}


I could not resist to create a *quick FlaskCMS* to edit the config.json...

```sh
#uv init
#......
make quick-config 
```

...this was literally one prompt with Cursor.

A flask CMS JSON editor: *works together with the landing-page-book-astro-tailwind Astro theme*

![Flask CMS Editor for Ebook Landing JSON](/blog_img/entrepre/product/ebook-flask.png)

So you can go back to your server and do:

```sh
#git stash push -m "backup before force pull"
#git pull origin main
# If you need your changes back: git stash pop
# If you don't need them: git stash drop
make quick-prod
docker network connect cloudflared_tunnel astro-prod #connect
```

At this point, you have your ebook published via cf network, to sth like: `ebook.jalcocertech.com`

---

## eBooks


**Making ebooks** is possible with **[pandoc](#faq) or MKDoc**

> Pandoc can write a PDF/epub from .Rmd or `ipynb`, that will be for a future post.

See this [script](https://github.com/JAlcocerT/sell-your-ebook/blob/main/create_ebooks.sh)


* https://github.com/Wandmalfarbe/pandoc-latex-template

> Maybe someone will do something with financial ,miss-conceptions'?

But hey, some people use latex, so if its possible to make a code driven [CV in overleaf with Latex](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#creating-a-responsive-cv)...

Why not ebooks?

And how about creating the **ebook [with R](https://jalcocert.github.io/JAlcocerT/r-language-101/)**?

If we can create markdown driven websites (thanks to SSGs), even presentations...

> We dont need [crazy components, nor shortcodes](https://github.com/JAlcocerT/just-ssg)

Just text, images, graphs...How are we not going to create **ebooks powered with R**?

Lets just Setup R and see how:

```sh
# Core R environment
sudo apt install -y r-base r-base-dev

# LaTeX and PDF generation
sudo apt install -y texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra

# Pandoc and citation processing
sudo apt install -y pandoc pandoc-citeproc

# Development libraries for R packages
sudo apt install -y libcurl4-openssl-dev libssl-dev libxml2-dev libudunits2-dev
```

We can try knitting a bit, but we have also: https://bookdown.org/yihui/rmarkdown/

| Feature | R Markdown + knitr | bookdown |
|---------|-------------------|----------|
| **Scope** | Single document | Multi-chapter book |
| **Structure** | One file | Multiple files + configuration |
| **Cross-references** | Limited | Full support |
| **Table of contents** | Basic | Advanced with navigation |
| **Figure numbering** | Per document | Across entire book |
| **Bibliography** | Basic | Advanced with citations |
| **Output formats** | PDF, HTML, Word | PDF, HTML, EPUB |
| **Complexity** | Simple | More complex setup |
| **Use case** | Reports, papers | Books, manuals, documentation |

### Creating an Ebook

I mean, an AI Assisted e-book.

After chating a while with cursor, we got this kind of workflow working.

[See mermaid](https://mermaid.live/edit#pako:eNp1VGtv2jAU_SuW93HAEl5Lo6lSefUFhQJ7aAZNJrmhVpM4Spy1FPjvc2xoTbv4g5Obc8617_VxttjjPmAXr1OaPKB5ZxEjOS7IFI1o-ujzpxgNWAjZt1X65bw2jfwlqlbPUYc8xkykqB-vWQxLreooqEtelZ_RFI1zkeRCy6VaM7uK2SMTGvvcQ5OUe5BlPD3APQX3t1qLBjyNqNhrTM_9grG7mo-GOzQgxRN1OH9Uy6zkS7G8666ZKIKlqZn0Bjt0SYZ0Dr_e0RM_-POB35987-zQFSme_1sDknxlqvR8qSq4JjJlSAU8nzbqWqE3ZMBiGiK5I5Uzo1ESQhWKZDUpPEk4UJJb8hNWqJPypwyOzbpSyJD0qylQ__WznrN8pU92gafHNrN4vcAaLsaIrNdJyEVdbeIHy3IashcqGI-z5RvtjvhJuEkVqUcFlf6IWZKHimjwxtoZiteV3kL9Z_Dyd6QJkSeqTaITci-PIBbGFg9siP2SetQJltR0TxLZjGgVQk02Xy0xE5vwLW0xpiRR9qt6TEAi8-g9M_Gh9hmRWUL2FxRjvkkgAyFKN6nvwcgM7sxgbAYT0zD3ZjA1g9lJF2QtgC5QwMLQ_QR20ArARG4OiOdA2zszkdsDEgRBAywTGZYioyPSgFbQMpG7UmRcikxKkftjPU7QAsdEpqXI7ATBFfkfYz52RZpDBUcgXVaEeFtoFlg8QAQL7MpXX9qvcMxeaqQNfnMeHWUpz9cP2A1omMkoT3x5gXuMSt-9UeSJQ9rleSyw27AslQO7W_yM3ap9ZtWspmVbzXrDaTUbdgVvis-WU2vXbafdtqy63Ww29xX8opa1a3Wr8fWsUW9K2LHblrP_B9cUsMg)

We can go the simple knitt way or the bookdown with proper chapters etc:

```sh
#cd example-pdf-knit
#Rscript -e "rmarkdown::render('simple-example.Rmd', 'pdf_document')"

cd example-pdf-bookdown
# Generate PDF
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
# Generate HTML  
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
# Generate EPUB
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"
```

**R Markdown Ebook Workflow Summary:**

1. **Write Chapters** as `.Rmd` files (R Markdown with embedded R code)
2. **Knit Process** converts `.Rmd` → `.md` (Markdown + executed R output)
3. **Pandoc Processing** converts `.md` → LaTeX → PDF
4. **Final Output** is a professional PDF ebook in the `docs/` folder

**Key Technologies:**
- **R Markdown** (.Rmd) - Write content with embedded R code
- **knitr** - Execute R code and generate output
- **bookdown** - Organize multiple chapters into a book
- **Pandoc** - Convert between document formats
- **LaTeX** - Professional typesetting for PDF output
- **ggplot2/dplyr** - Data analysis and visualization

**Simple Flow:** `R Markdown (.Rmd)` → `knitr` → `Markdown (.md)` → `Pandoc` → `LaTeX` → `PDF`

💡 **When to Use Each**

Use **R Markdown + knitr** when:
- ✅ Writing a **single report** or paper
- ✅ Creating a **presentation** or slides
- ✅ Making a **simple analysis** document
- ✅ Need **quick output** without complex structure
- ✅ Working on a **one-off project**

Use **bookdown** when:
- ✅ Writing a **multi-chapter book**
- ✅ Creating **documentation** or manuals
- ✅ Need **cross-references** between sections
- ✅ Want **professional book formatting**
- ✅ Planning to **publish** the work
- ✅ Need **multiple output formats** (PDF, HTML, EPUB)

---

## Conclusions

This is it **for now** all I got to tinker with ebooks.

<!-- https://youtu.be/XEFpzEIEDFc -->

{{< youtube "XEFpzEIEDFc" >}}

We've got a Astro statically deployable landing page to share ebooks!

> Think of this as the first step to selfpublishing

> > See also amazon KDP to reach a lot of potential readers `https://kdp.amazon.com/en_US/` with a lean approach, *aka print on demand* 

And a draft on ways to create them with RKnit/Pandoc.

But im happy I could link this to my last year thought with the [assistant agent for open ai driven ebooks](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/OpenAI_ebook.py).


<!-- https://youtu.be/XEFpzEIEDFc -->

### ebooks on github

Some people do this kind of cool thing: https://github.com/understanding-astro/understanding-astro-book

You can see the chapters and all source code on the repo.

Just need to place your mail to get it rendered: https://www.ohansemmanuel.com/books/understanding-astro

> They Place the content and `.md` in public :)

Same as https://github.com/treeman/why_cryptocurrencies does!

### How people send eBooks

1. Via Stripe: `https://shop.acquisition.com/products/100m-money-models?utm_campaign=13261424-%24100M%20Money%20Models&utm_source=hs_email&utm_medium=email&utm_content=376228484&_hsmi=376228484`

2. I guess via **stripe + SSR and [obfuscation](#show-and-obfuscate) technique** that gets clear if your email is in the proper Stripe driven table of users who bought: `https://readmake.com/`

* https://it-tools.tech/string-obfuscator
* Stripe Payment Links: https://dashboard.stripe.com/payment-links + some automation like n8n to send the pdf/epub to the buying email
* For the [obfuscation](#show-and-obfuscate), I imagine that there can be some BE check to the provided email and if you ever bought it, you can read the updated de-obfuscated version online anytime

3. You can also sell ebooks via amazon or ko-fi.

---

## FAQ


{{< details title="Pandoc and (ipynb or RMD)... 📌" closed="true" >}}

In fact, they all use **Pandoc** as the core conversion engine.

How the Systems Interrelate

* **R Markdown & `knitr`:** In the R ecosystem, you write a document with a mix of text and R code chunks in an `.Rmd` file. When you "knit" the document, the `knitr` package first processes the file. It executes the R code chunks, collects the output (text, tables, plots), and creates a new, pure Markdown file that includes the results.
    
* **Pandoc:** This is where the magic happens. The Markdown file generated by `knitr` is then passed to Pandoc. Pandoc is a standalone, command-line tool that can convert documents between a vast number of formats. It takes the Markdown file and converts it to the final output format, whether that's HTML, PDF, Word, or another type.

* **Jupyter Notebooks:** The workflow for Jupyter Notebooks is very similar, though it's often more integrated. The Jupyter `nbconvert` tool handles the initial processing of the `.ipynb` file. It executes the code cells (if they haven't been already) and prepares the content, including code and outputs, for conversion. `nbconvert` then uses **Pandoc** to perform the final conversion from the prepared intermediate format to the desired output format, such as PDF or EPUB.

{{< /details >}}


Essentially, both systems use a two-step process: 

First, an engine (`knitr` for R Markdown, `nbconvert` for Jupyter) processes the code and generates an intermediate Markdown-like file

Second, **Pandoc** takes that intermediate file and converts it to the final document format.

The primary difference is the front-end tool and the language-specific processing, but Pandoc is the shared, underlying engine that makes the final document conversion possible.


### More Books Stuff

* https://bookstash.io/ - Top books recommended by famous folk, in 3m or less.

> Epub to AudioBook with Python: https://github.com/C-Loftus/QuickPiperAudiobook


### Converting to epub

* https://github.com/dakoller/markdown-epub-converter

>  A simple Docker-based REST API that **converts Markdown to EPUB** format using Pandoc. Send markdown content via JSON, **get an `EPUB` file back.**

* Or just use: https://omnitools.app/pdf/pdf-to-epub

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/omnitools" title="Omnitools | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Show and Obfuscate

After been able at `./Z_ebooks/` to create pdf ebooks from markdown, how about obfuscating the ebook to show it online?

```sh
Rscript Z_ebooks/render.R \
  --input Z_ebooks/web-ebook.md \
  --output Z_ebooks/web-ebook.pdf \
  --cover Z_ebooks/web-ebook-jalcocertech.png
```

If you are aware about few git tricks, lets just get started:

```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Starting ebook md pdf and obfuscated web sample"

#sudo apt install gh
gh auth login
gh repo create sell-your-ebook --private --source=. --remote=origin --push
    
#git init && git add . && git commit -m "Initial commit: Starting ebook md pdf and obfuscated web sample" && gh repo create ebook-obfuscate --private --source=. --remote=origin --push
```