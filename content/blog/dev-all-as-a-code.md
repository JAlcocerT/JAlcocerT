---
title: "Everything is Code"
date: 2025-10-25T08:20:21+01:00
draft: false
tags: ["Matplotlib vs Manim vs RemotionJS","SlidevJS vs ReflexJS","Pandoc vs Latex vs Typst"]
url: 'things-as-a-code'
description: 'Creating everything is a code. Animations, ppts, reports/inphographics , ebooks and obfuscation...'
---

**Tl;DR**

Do stuff: ebooks and obfuscation, reports, ppts, animations, videos, webpages, etc.


**Intro**

> BC we have to use those OpenAI Prompt packs: https://academy.openai.com/public/tags/prompt-packs-6849a0f98c613939acef841c


[Presentations](#ppts-as-a-code): Reveal.js vs [Slidev](https://github.com/slidevjs/slidev)

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

For me there is no better tool than SliDevJS for creating presentations as code:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/slidev" title="My SliDevJS Fork" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Presentations as a Code pushed to Github Pages" >}}
{{< /cards >}}

But there are few other:

1. RevealJS

You can place this one inside HUGO SSG if you want, like: https://github.com/joshed-io/reveal-hugo

2. My favourite: **SliDevJS**: It brings a live editor at `localhost:3030/presenter`

https://jalcocert.github.io/JAlcocerT/make-slidev/

You can create a [Micro SaaS around Slidev](https://jalcocert.github.io/JAlcocerT/ai-driven-presentations/)

Like: https://github.com/JAlcocerT/slidev-editor with Firebase and Logto auth working as per [this post](https://jalcocert.github.io/JAlcocerT/firebase-auth-101/) :)

![Building in public a slideb editor plus tech talk](/blog_img/entrepre/public-build/slidev-editor/nextjs-slidev-editorlanding.png)



[![Star History Chart](https://api.star-history.com/svg?repos=marp-team/marpit,slidevjs/slidev,remarkjs/remark&,type=Date)](https://star-history.com/#marp-team/marpit&slidevjs/slidev&remarkjs/remark&Date)

https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/

![SliDev Real Estate](/blog_img/biz/RE/slidev-re.png)


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

3. Make it look cool with mermaidJS / Katex / [**ChartJS** VUE components](https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth/slidev/slidev-101-umami-example/components)

4. This thing can even do animations based on https://motion.vueuse.org/
5. Katex, for those PHD users
6. MermaidJS
7. Export to `pdf`/`pptx` or `png`. *They are all pngs btw, so be mindful if non tech people will have to edit*

> Cool PPTs other created: https://raw.githubusercontent.com/BaizeAI/talks/refs/heads/main/packages/2025-06-11-kubecon-hk/slides.md

> > You can combine SliDev + OBS + [FastApi Audio Recorder S2T-TTS](https://jalcocert.github.io/JAlcocerT/audio-recap/#conclusions) for youtube video creation workflow

![FastAPI x Astro x ChartJS pulling data from sqlite](/blog_img/GenAI/audio/fastapi-chartjssqlite.png)

8. RSS...of youtube `CTRL+U`: `https://www.youtube.com/@UnfoldingData/shorts` -> `https://www.youtube.com/feeds/videos.xml?channel_id=UCogC2-5ZqMrLIWtm00RP7Ow` with [this kind of Vue component](https://github.com/JAlcocerT/slidev-editor/blob/logtojseauth/slidev/slidev-101-umami-example/components/LatestYouTubeVideo.vue)

```sh
<LatestYouTubeVideo channelId="UCPPMA8ZEusAe5dVH6PbjZFA" width="400" height="225" />
```

9. Live data via APIs with **custom components**. Like these 2 components, [with open-meteo or yfinance based](https://github.com/JAlcocerT/slidev-editor/tree/logtojseauth/slidev/slidev-ba-tech-talk-exadel/components). 

![Slidev live data component from yfinance](/blog_img/entrepre/public-build/slidev-editor/slidev-component-yfinance.png)

{{< callout type="info" >}}
You can even get away and create one to **pull google sheet data**, so it reflects tables changes in real time
{{< /callout >}}

10. Live stuff: `http://localhost:3030/presenter` and live annonations

> Similarlo to https://github.com/DmytroVasin/DrawPen or with excalidraw


![SliDev Editor inside its UI](/blog_img/entrepre/public-build/slidev-editor/nextjs-slidev-editorlanding.png)

#### Diagrams are also code!

1. With Python, we have: https://diagrams.mingrammer.com/docs/getting-started/examples

2. MermaidJS *you can also use it inside HUGO/Astro/MermaidJS...*

**Had a look to couple of tools for diagrams**

2. https://github.com/stan-smith/FossFLOW

>  Make beautiful isometric infrastructure diagrams 

3. https://markmap.js.org/ and https://github.com/markmap/markmap

It renders text to diagram and can reference files: https://gist.githubusercontent.com/raw/af76a4c245b302206b16aec503dbe07b/markmap.md

> MIT | Build mindmaps with plain text 

4. https://github.com/terrastruct/d2

>  D2 is a modern diagram scripting language that turns text to diagrams. 


### eBooks as a Code

Initially, I thought that [ebooks could be just done via Rmd](https://github.com/JAlcocerT/ebooks)

Then I understood [here, that pandoc](https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/) is what make the thing work.

And found a [cool SSG Theme to **host your ebook's pdfs** statically](https://github.com/JAlcocerT/sell-your-ebook).

```sh
# Just Astro production
make quick-prod  
```

And it looks as good as: `https://landing-page-book-astro-tailwind.vercel.app/`

Then, I created to just **dump my notes** into future ebooks: https://github.com/JAlcocerT/ebook-ideas

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/ebook-ideas" title="NEW ebook ideas Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code to ship ebooks" >}}
  {{< card link="https://github.com/JAlcocerT/sell-your-ebook" title="sell-your-ebook Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code to ship ebooks" >}}
{{< /cards >}}


{{< callout type="info" >}}
When you create an ebook, use [Foliate](https://github.com/johnfactotum/foliate) to read `epub` on your desktop
{{< /callout >}}

```sh
sudo snap install foliate
```

> Okular or calibre will also do the trick

```sh
convert selfhosting.png ../sell-your-ebook.pdf
```

{{< callout type="info" >}}
EPUB are essentially websites! Thats why they play with with `html`
{{< /callout >}}

You know, just in case you want to create your pdf libre or your epub libre org!

Or to write a e-book for your friend (Anna's archive).

> Others, like [WhyCryptoCurrencies](https://github.com/treeman/why_cryptocurrencies), use [Pollen](https://docs.racket-lang.org/pollen/index.html) instead

Or...because you can now have deep research agents everywhere:

* https://parallel.ai/pricing - AIs are the web's new user  - The highest accuracy web search for your AI
* Perplexity...
* ...

Some people had problems when trying to convert their Words to epub with amazon tools.

So they others to do it form them and be able to publish to Amazon: `https://kdp.amazon.com/en_US/`

But you dont have to do so if you write on a epub friendly format from the get go.


But before going deep and create an ebook, why not creating a **pdf article for your website**?

Like...something for https://www.jalcocertech.com/support/whitepapers/


{{< callout type="info" >}}
From withing th ebook-ideas repo, consider that for [epub use html+calibre](https://github.com/JAlcocerT/ebook-ideas/tree/master/x-html-to-epub) for [pdf use ebook use RMD](https://github.com/JAlcocerT/ebook-ideas/tree/master/x-rmd)
{{< /callout >}}

```sh
git clone https://github.com/JAlcocerT/ebook-ideas.git
x-html-to-epub/build.sh
```

#### Ebooks PDF or Web Version

As seen during the show or [**obfuscate** section of this post](https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/#show-and-obfuscate) - We can do really cool ebooks and share them as pdf but also place them into a web version.

You write *(markdown)* once, you choose how to publish.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/obfuscate" title="NEW Obfuscate Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Python + Obfuscate + Ebook WebPage" >}}
  {{< card link="https://github.com/JAlcocerT/waiting-to-landing" title="Waiting to Landing Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="You are not alone if this reminds you to the possibilites of Waiting to Landing..." >}}
{{< /cards >}}

Also similar concept to the [Landing Page for the ebook](https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/#a-landing-page-for-your-ebook).

Just that here we have the website and the ebook content driven on the same repository structure.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="The setup uses PocketBase to capture emails and allow you to read the e-book as a webpage or download the pdf | Docker Config 🐋 ↗" >}}
{{< /cards >}}


{{< details title="Ebook Obfuscator x PB | 101 Setup  📌" closed="true" >}}

![Using the users collection so that users can see/download the ebook](/blog_img/dev/PB/pb-ebooks.png)

But as learnt here https://github.com/JAlcocerT/Docker/blob/main/Dev/BaaS/PB/create_collection.py

We can create and use a separated collection for the subscriptors.

Now with https://github.com/JAlcocerT/obfuscate/blob/main/create_collection.py

```sh
eval 'cd /home/jalcocert/Desktop/obfuscate && ADMIN_EMAIL="yourpbadminmail@whatever.com" ADMIN_PASSWORD="yourpbadminpwd" python3 create_collection.py'
```

![Creating programatically a pb collection](/blog_img/dev/PB/pb-ebooks-sub-coll.png)

To create the collection we need to be a PB admin (obviously).

But anyone is free to hit the endpoint and add a email to the collection.

> This might be dangerous, plus emails are not verified with PB.

> > This comes down to the email/SMTP complexity that I have to investigate soon enough

This has to be quick and easy: 

```sh
#git clone
#sudo lsof -i :8001 | grep LISTEN | awk '{print $2}' | xargs sudo kill -9

# External PocketBase (default)
make up-external
```

It was also interesting to play with the fastapi routes.

Because the making it look cool is just one prompt of Claude Haiku 4.5

![Book publisher default UI](/blog_img/dev/fastapi/ebook-obfuscate.png)

![Book publisher with FastAPI and Obfuscator looking cool](/blog_img/dev/fastapi/ebook-obfuscate-ui.png)

We want the root path `/` to show the ebook instead of the API info. 

Se we update the root endpoint to redirect to the book

✅ **Root path now shows the ebook**
- `http://localhost:8001/` → Redirects to `/api/book`
- `http://localhost:8001/api/book` → Also works
- Perfect for subdomain hosting!

```bash
# Your subdomain
https://book.yourdomain.com/
# Shows the ebook directly!

# Also works
https://book.yourdomain.com/api/book
```

This could make that within one subdomain, you host several ebooks at different routes!

And maybe...the one who pays from the main page get access to a boundle with ALL the ebooks.

Feel free to combine that setup with a email [marketing tools](https://jalcocert.github.io/JAlcocerT/where-to-deploy/#goodies-for-marketers) or with [Stripe](https://jalcocert.github.io/JAlcocerT/stripe-for-saas/) for one time payments to get the pdf.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/listmonk" title="Tools like ListMonk are Selfostable and allow for transactional emails with attachment! | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mautic" title="Mautic | Docker Config 🐋 ↗" >}}
{{< /cards >}}

You can also use them for lazy DIY users to jump into a DWY model:

![Cal.com stripe integration for booking a meeting](/blog_img/email/cal-email-stripe.png)

{{< /details >}}


#### Reports as a code

As seen while exploring yfinance on this repo and [post](https://jalcocert.github.io/JAlcocerT/stonks/#eda-on-yfinance).

You can make a one prompt vibe coded report

![Stonks EDA Summary Report](/blog_img/entrepre/public-build/pystonks/eda-stonks.png)

>  *via `yfinance-104.ipynb`*

https://github.com/JAlcocerT/py-stonks/blob/main/z-eda-yfinance/yfinance-104.ipynb

I mean...a real report.

Not just a cool matplotlib graph or a pdf that you vibe coded with a tech solution for jira x pbi.

And then I got to know about [Carbone](https://github.com/carboneio/carbone), which I tinkered with on the [wedding v2 post](https://jalcocert.github.io/JAlcocerT/building-in-public-wedding-photo-galleries/)

>  Fast and simple report generator, from JSON to pdf, xslx, docx, odt... 

{{< tweet user="TheRonnieVShow" id="1980403286349111480" >}}

<!-- https://x.com/TheRonnieVShow/status/1980403286349111480 -->



{{< callout type="info" >}}
We have [Pandoc](https://github.com/jgm/pandoc) to convert between tons of formats docx, epub, pdf, md, jsom, latex...
{{< /callout >}}

#### Infographics as a code

This can also be done with Python, but it will look more like a **report or with matplotlib**.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/#with-dividend-reinvestment" title="Animating yfinance" image="/blog_img/data-experiments/MCD_dividends_pct_12m.png" subtitle="YFinance for Python, cool plots and animations | Post" >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion/blob/main/tests/plot_total_return_from_yfinance.py" title="Data In Motion Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Matplotlib Animations with yfinance - Example Total Returns" >}}
{{< /cards >}}

```sh
#git clone https://github.com/JAlcocerT/DataInMotion.git
#cd DataInMotion && branch libreportfolio
uv run tests/run_consolidated_reports.py CAT 2005-01-01 --subdir --brand "@LibrePortfolio" --rolling-days 365\
| uv run OpenAI-Twitter/generate_tweets_from_report.py --ticker CAT --language es

uv run tests/plot_historical_yield.py CAT --start 2005-01-01 --brand "@LibrePortfolio" --monthly

uv run tests/plot_historical_yield_percentiles.py CAT --start 2005-01-01 --brand "@LibrePortfolio" --low 10 --high 90 --warmup-days 400

uv run tests/plot_historical_gweiss.py CAT --start 2005-01-01 --brand "@LibrePortfolio" --warmup-days 400
```

But for *not just yfinance* based, I created:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/UnfoldingData" title="UnfoldingData Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of UnfoldingData plots and animations for Youtube Channel" >}}
{{< /cards >}}

#### Resume as a Code

Just in case that you need some help with: https://fmhy.net/misc#resume-portfolio

{{< callout type="info" >}}
Whatever you choose, just make sure that its version controlled and parsable by HR
{{< /callout >}}

We make some CV before with [Overleaf and Latex, here](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#cv-as-a-code).

Those should be enough for you to get a [crypto](https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/) D&A 6 figures [job in CH.](https://swissdevjobs.ch/jobs/Rockstar-Recruiting-AG-DeFi-Analyst)

More options for **creating your CV**?

1. https://github.com/BingyanStudio/LapisCV

> MIT |  📄 Easily create your resume with Markdown on VSCode / Typora / Obsidian 

2. https://github.com/srbhr/Resume-Matcher

>  Apache v2 | Improve your resumes with Resume Matcher. Get insights, keyword suggestions and tune your resumes to job descriptions.

3. More than a way to create a CV, a way to impress if you are on linkedin: https://github.com/Nutlope/self.so

>  LinkedIn -> personal site generator 

4. https://github.com/rendercv/rendercv with [great docs](https://docs.rendercv.com/)

> MIT |  Version-control CVs/resumes as source code 

5. YAML Resume https://github.com/yamlresume/yamlresume

> MIT |  Resumes as code in YAML, brought to you with ❤️ by PPResume. 

Control a yaml like: https://github.com/yamlresume/yamlresume/blob/main/packages/cli/resources/resume.yml

Get a PDF to apply to the offer you want before some AI agent take it.

Render content using LaTeX templates. I liked: https://yamlresume.dev/docs/layout/templates/moderncv-classic

Generate PDFs via XeTeX or Tectonic compilation engines

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/job-trends" title="Job Trends Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Scrapping job boards" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex" title="CV-lAItex" image="/blog_img/apps/gh-jalcocert.svg" subtitle="CV as a Code, via Latex or YAMLResume." >}}
{{< /cards >}}

6. https://github.com/aadya940/autoresume

> Apache v2 |  An Open Source Resume Builder and LaTeX Code Editor with AI Capabilities. 

> > Kind of a LandThatJob?!

People do all sort of creative stuff around PDF: https://github.com/domdomegg/pdf-scanner or https://github.com/lookscanned/lookscanned.io

>  🖨 Makes PDFs look like they were scanned 

#### You can do what with PDF?

Not only you can extract PDF info to txt or create PDFs in many ways, like with R language.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kreuzberg" title="Extract PDF info via Kreuzberg | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```sh
# curl -X POST -F "file=@Ebook-cover-SSGs" http://192.168.1.2:8027/extract
# curl -X POST -F "file=@Ebook-cover-SSGs.pdf" http://192.168.1.2:8027/extract > sample-pdf-to-text.txt
```

With R, you are 5 artifacts away of **creating your first ebook**:

```sh
#cd Z_ebooks #within this repo you have few quick examples!
Rscript ./Z_ebooks/render.R \
  --input ./Z_ebooks/web-ebook.md \
  --output ./Z_ebooks/web-ebook.pdf \
  --cover ./Z_ebooks/web-ebook-jalcocertech.png
```

1. https://github.com/pdfme/pdfme

> MIT |  Open-source PDF generation library built with TypeScript and React. Features a WYSIWYG template designer, PDF viewer, and powerful generation capabilities. Create custom PDFs effortlessly in both browser and Node.js environments. 

Fast PDF Generator 	Easy PDF Template Design 	Simple JSON Template

Works on Node and in the browser. Use templates to generate PDFs—complex operations are not required. 

Anyone can easily create templates using the designer.

emplates are JSON data that is easy to understand and work with.

With very interesting templates: https://pdfme.com/templates and even template designer playground https://pdfme.com/template-design

2. Posters, ebooks, letter, reports...https://github.com/Kozea/WeasyPrint


 WeasyPrint is a smart solution helping web developers to create PDF documents. It’s free and open source software that can be easily plugged to your applications and websites and turns simple HTML pages into gorgeous: 

See the examples and their source code: https://weasyprint.org/

> BSD3 -  The awesome document factory 

3. https://github.com/plutoprint/plutoprint


PlutoPrint is a lightweight and easy-to-use Python library for generating high-quality PDFs and images directly from HTML or XML content. It is based on PlutoBook’s robust rendering engine and provides a simple API to convert your HTML into crisp PDF documents or vibrant image files. This makes it ideal for reports, invoices, or visual snapshots.

> MIT |  A Python Library for Generating PDFs and Images from HTML, powered by PlutoBook 

```sh
pip install plutoprint
```


## Video as a Code

[Video editing Thanks to **FFMPEG** and the CLI](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#video-editing), of course!

You could also use GUI tools:

![Applying KDENLIVE LUT](/blog_img/outro/kdenlive-lut.png)

But really, just to know the format of the videos of one folder and joining the similar ones together you dont need that:

```sh
bash -lc 'header_printed=0; \
find . -maxdepth 1 -type f \( -iregex ".*\.\(mp4\|mov\|mkv\|avi\|mpg\|mpeg\|wmv\|m4v\|3gp\)$" \) -print0 \
| sort -z \
| while IFS= read -r -d "" f; do \
  base=${f#./}; \
  if [ $header_printed -eq 0 ]; then \
    printf "%-12s %-8s %s\n" "Resolution" "FPS" "File"; \
    printf "%-12s %-8s %s\n" "----------" "----" "----"; \
    header_printed=1; \
  fi; \
  if command -v ffprobe >/dev/null 2>&1; then \
    res=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height,avg_frame_rate -of default=nw=1:nk=1 "$f" 2>/dev/null); \
    width=$(echo "$res" | sed -n "1p"); \
    height=$(echo "$res" | sed -n "2p"); \
    afr=$(echo "$res" | sed -n "3p"); \
    fps=$(awk -v r="$afr" "BEGIN{split(r,a,\"/\"); if(length(a)==2&&a[2]>0) printf \"%.2f\", a[1]/a[2]; else print r}"); \
    printf "%-12s %-8s %s\n" "${width}x${height}" "${fps}" "$base"; \
  elif command -v mediainfo >/dev/null 2>&1; then \
    info=$(mediainfo --Inform="Video;%Width%x%Height%|%FrameRate%" "$f" 2>/dev/null); \
    printf "%-12s %-8s %s\n" "${info%%|*}" "${info#*|}" "$base"; \
  else \
    printf "%-12s %-8s %s\n" "(install ffprobe or mediainfo)" "-" "$base"; \
  fi; \
done'

# Resolution   FPS      File
# ----------   ----     ----
# 3840x2160    50.00    DJI_20251003204711_0010_D.MP4
# 3840x2160    50.00    DJI_20251003204913_0011_D.MP4
# 3840x2160    50.00    DJI_20251003204946_0012_D.MP4
# 3840x2160    50.00    video.mp4
```


You can always add music to your videos: https://www.youtube.com/audiolibrary?feature=blog

```sh
ffmpeg -y -i initial_silenced_video.mp4 -stream_loop -1 -i afilador_101.mp3 \
  -c:v copy -c:a aac -shortest -map 0:v:0 -map 1:a:0 \
  ./resulting-video-with-audio.mp4
```

{{< youtube "YanaJiC_cYk" >}}

### Animations as a Code

Some time back I was [people doing mechanism animations](https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/):

![Matplotlib GIF Animation of a mechanism](/blog_img/mechanics/fourbarlinkage.gif)

Inspired by:
<!-- https://www.youtube.com/watch?v=usY-oBifcM4 -->

{{< youtube "usY-oBifcM4" >}}

As we saw in summer, we can do [cool animations as a code](https://jalcocert.github.io/JAlcocerT/animations-as-a-code/)

Believe it or not, we can do so via **Matplotlib animations**:

```sh
git clone https://github.com/JAlcocerT/DataInMotion
#git branch -a
git fetch --all --prune && (git switch libreportfolio || git switch --track origin/libreportfolio) && git pull

uv run animate_sequential_compare_price_evolution_flex_custom.py GLD BTC-USD 2025-01-01 10 short

ffmpeg -y -i gld-btc.mp4 -stream_loop -1 -i afilador_101.mp3 \
  -c:v copy -c:a aac -shortest -map 0:v:0 -map 1:a:0 \
  ./gld-btc-audio.mp4
```

Do animation logic once, ship it everywhere:

{{< tweet user="LibrePortfolio" id="1940181314587828581" >}}

<!-- https://x.com/LibrePortfolio/status/1940181314587828581 -->

> With the proper data model, you can save the Google Sheets read with `=GOOGLEFINANCE("CURRENCY:USDEUR"; "price"; FECHA(AÑO(HOY()); 1; 1); HOY(); "DAILY")`

> > Or `=GoogleFinance("CURRENCY:BTCUSD"; "price"; HOY()-30; HOY())` 

Not to mention the possibility to vibe code very quickly this [kind of aggregates within st](https://github.com/JAlcocerT/DataInMotion/blob/libreportfolio/streamlit_portfolio_aggregate.py).

See how quickly you can iterate through your ideas: *from a streamlit quick poc*

```sh
uv run streamlit run streamlit_portfolio_aggregate.py
#uv run streamlit run streamlit_ath_viewer.py #from WK42Y25
#uv run streamlit run LibrePortfolio-Plots.py #a better version of streamlit_ath_viewer and streamlit_script_plots
```

![Streamlit price and dividends of a portfolio aggregated](/blog_img/dev/streamlit-stocks-aggregates.png)

```sh
#from the same libreportfolio branch
uv run LibrePortfolio-PlotsFlask.py

docker compose build --no-cache
#sudo docker compose up -d
#sudo docker compose down #test of the image over
```

Then just make the built webapp container public with portainer+cloudflare with `libreportfolio-flask:8501` to `https://graficas.libreportfolio.fyi/`

Record and Share: *because [people share even gsheets](https://x.com/vecinoinversor_/status/1674359289886957568)*

![Custom matplotlib x fastAPI x Graficas LibrePortfolio](/blog_img/AIBI/fastapi-custom-matplotlib.png)

```sh
ffmpeg -y -i untitled.mp4 -stream_loop -1 -i ImmortaYT.mp3 \
  -c:v copy -c:a aac -shortest -map 0:v:0 -map 1:a:0 \
  ./graficas-libreportfolio.mp4
```

{{< tweet user="LibrePortfolio" id="1980278163155333315" >}}
<!-- 
https://x.com/LibrePortfolio/status/1980278163155333315 -->

You know, we can do [animation as a code as seen **with matplotlib**](https://jalcocert.github.io/JAlcocerT/animations-as-a-code/).

{{< youtube "I46bPuSdrqk" >}}

And you should probably place your codes into a [repo like DataInMotion](https://github.com/JAlcocerT/DataInMotion) if you go that route.


{{< youtube "I46bPuSdrqk" >}}

What if you have *couple of brands* and want to **recycle your animations**?


You can even create a **quick** streamlit, then flask **web apps around animations** to let other create with your tools:

```sh
uv run streamlit run LibrePortfolio-Plots.py 
uv run LibrePortfolio-PlotsFlask.py
docker compose build --no-cache
```

Make it visible on social media.

Because lets be honest: website traffik is broken with AI.

{{< tweet user="LibrePortfolio" id="1940181314587828581" >}}



Then, Last night the yt algorithm hit me with this:

<!-- 
https://youtu.be/dtjb2OhEQcU?si=sXeXvjrF50WfU_P4
 -->


{{< youtube "dtjb2OhEQcU" >}}

And this:

<!-- https://www.youtube.com/watch?v=O6TjkLwUAtg -->

{{< youtube "O6TjkLwUAtg" >}}


<!-- https://github.com/JAlcocerT/Py_Double_Pendulum -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/chaos-theory-and-the-double-pendulum-with-python/" title="Double Pendulum Repo" image="https://raw.githubusercontent.com/JAlcocerT/Py_Double_Pendulum/main/Z_Outro/DoublePendulum.gif" subtitle="Python Double Pendulum" >}}
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

#### Motion Canvas

Motion Canvas, Remotion, and Manim are all tools for creating **programmatic animations and videos**, but they cater to different use cases and technologies.

Motion Canvas is a modern TypeScript-based tool focused on vector animations with real-time preview and strong web integration.

It is praised for allowing CSS features and live timing control in animations but is still relatively new with fewer complex examples and features compared to others.

It targets users who prefer coding animations with web tech and want interactive previews while creating.

#### Remotion 

Remotion stands out as a React-based tool for creating programmatic videos.

It enables creating MP4 videos using React components, making it excellent for developers familiar with React who want to automate and scale video production. 

Remotion is well-regarded for strong documentation, ease of use, and a focus on collaborative and dynamic video creation, including applications like product videos and in-browser editing.

Manim, on the other hand, is a Python library specialized in math and educational animations. It offers fine-grained control for precise formula animation and algorithm visualization.

It requires more programming expertise and manual effort but is powerful for STEM use cases.

Recent research advances also use AI to automate some Manim coding, improving accessibility.

Manim excels in complex mathematical and algorithmic animations rather than general vector or video creation.


### Animations x SSG

This year I also was playing around with Astro components.

And withing the **datanova theme**, I found out that they are doing a really cool animation (which is a SVG!)

```sh
npm install
#npm run dev
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

As seen while a changed [my main landing page](https://jalcocert.github.io/JAlcocerT/keystaticcms-astrodb/):

![DataNova Theme](/blog_img/web/astro/astro-datanova-animated-graph.png)


### Video Geolocation with FFMPEG

This kind of geo/gpx concepts I got them covered at: https://github.com/JAlcocerT/Py_RouteTracker

With a GoPro and its metadata, it's all about:

```sh
exiftool GX011032.MP4
exiftool -ee GX011032.MP4
```

> Make sure to record with **GPS ON** to bring that lovely Geo data.

---

## Conclusions

No excuses - **just create**.

### Webs are also code

The fact that [some of them abstract the code](https://jalcocert.github.io/JAlcocerT/no-code-websites/) for us, does not mean that there is no code behind:

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
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/Commento" title="Commento for Websites | Docker Config 🐋 ↗" >}}
{{< /cards >}}

#### QR can be generated as Code

o generate [**QR's with logo** thanks to Python](https://github.com/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb) 


And your QR generator can be embedded into WebApps, as seen [here](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/QR_Gen.py)

> It can be done as well with Inkscape, or [with QR-Code-Generator](https://github.com/nayuki/QR-Code-generator) or with [emn178](https://emn178.github.io/online-tools/qr-code/generator/)

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)

> I got to learn about QRs during [this wedding post](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt)!


#### Flyers are PDFs

That kind of ad is generally called a **flyer** or a **poster**, especially when it is affixed to an object like a lamppost or utility pole in a public space.

In a more specific context, because it's attached outdoors to a pole, it might be referred to as:

* **Street Poster** or **Street Art/Ad**
* **Pole Poster** or **Pole Flyer**
* **Wild Posting** (a term for placing posters/flyers in unauthorized public spots, often to build buzz)

If you're asking about the advertising *style* or *strategy*, it uses:

* **Guerilla Marketing** or **Ambient Marketing** (using non-traditional public spaces for advertising).
* **Local Advertising** (targeting a specific geographic area).



### Writing Posts with Codex

As seen during summer on [this post](https://jalcocert.github.io/JAlcocerT/tech-for-podcast/#conclusions).

How about using **Codex CLI** to write SSG posts?

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/codex-cli" title="Codex CLI | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```bash
git clone https://github.com/JAlcocerT/Home-Lab
cd codex-cli

docker compose -f docker-compose.codex.yml up -d --build

# To stop the container (using either method):
# docker compose -f docker-compose.codex.yml down  # Using compose
# docker stop codex-container && docker rm codex-container  # Using container name
docker exec -it codex-container bash
codex #And ask anything you want!
```

3. Access the container:

```bash
docker exec -it codex-container bash
```

Just in case that you dont want to do the [n8n + CMS API](https://jalcocert.github.io/JAlcocerT/automating-ghost-and-wordpress/).

Example: given the repository `https://github.com/Snouzy/workout-cool?tab=readme-ov-file#deployment--self-hosting`


#### Agentic CLI is cool

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/goose" title="Goose | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gemini-cli" title="Gemini CLI | Docker Config 🐋 ↗" >}}
{{< /cards >}}

We can setup goose: https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli/#goose

And bring MCP support for Gemini: https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli/#gemini-cli-x-git-mcp

![Gemini MCP Working](/blog_img/GenAI/geminiCLI/gemini-mcp.png)

![Goose CLI UI](/blog_img/GenAI/goose-1.png)


* https://console.anthropic.com/workbench/
* https://console.groq.com/keys
* https://platform.openai.com/api-keys


#### Writing Technical Posts with Perplexity and IDEs

Or just **Cursor/Windsurf** agents + Perplexity Context?

* https://windsurf.com/profile
  * https://windsurf.com/billing/payment-success?plan_tier=pro