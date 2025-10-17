---
title: "How to create awsome Presentations with [AI] SlidevJS"
date: 2025-01-02
draft: false
tags: ["Gen-AI","PPTx","Windsurf","LLMs","Claper"]
description: 'AI Driven Presentations - PPT as code with SliDev, MarpJS, RemarkJS. Diagrams and ULM.'
url: 'creating-presentations-with-ai'
---

**Intro**

It all started with the [**AIssistant** post](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#slides-creation-agent).

But the **AI powered PPT creator** deserves a separate post.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#slides-creation-agent" title="AIssistant Post" image="/blog_img/apps/ai-assistant.png" subtitle="Tinkering with Streamlit to create a multi AI assistant" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/PPT_Service" title="AI Driven PPTs" image="/blog_img/apps/gh-jalcocert.svg" subtitle="AIssistant to create Presentations powered by LLMs" >}}
{{< /cards >}}

> Lets use AI/LLMs to create PPTs!


## Understanding PPT as a Code Frameworks

[![Star History Chart](https://api.star-history.com/svg?repos=marp-team/marpit,slidevjs/slidev,remarkjs/remark&,type=Date)](https://star-history.com/#marp-team/marpit&slidevjs/slidev&remarkjs/remark&Date)

### SliDev

Presentations as a Code?

No problem with SliDev:

* https://github.com/slidevjs/slidev/releases

[SliDev is an awsome project](https://fossengineer.com/how-to-use-slidev/) to generate PPT as code - **leveraging VueJS framework**.

> I love the SliDev project so much, that [I forked it](https://github.com/JAlcocerT/slidev).

{{< callout type="info" >}}
**SliDev** can be deployed as static sites to [**GH Pages** with GH Actions CI/CD](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/.github/workflows/SliDev_CICD.yml)
{{< /callout >}}

> See the result: https://jalcocert.github.io/Streamlit-MultiChat/1

[Setup a SliDev Project](https://fossengineer.com/how-to-use-slidev/#the-slidev-project), like any other SSG:

1. Get Node and NPM:

```sh
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs

#choco install nodejs-lts -y
node --version
```

2. Initialize the SliDev project

```sh
npm init slidev #yarn create slidev
#npm run dev #if you want to restart where you left it
```

Install SliDev CLI executable globally:

```sh
npm install -g @slidev/cli #npm install --save-dev @slidev/cli
npm i -D playwright-chromium
#npm install
```

3. SliDev has [several Themes available](https://www.npmjs.com/search?q=keywords%3Aslidev-theme): like https://www.npmjs.com/package/@slidev/theme-seriph

4. Modify the `slides.md` - Make changes to your ppt via markdown

5. See it live: `localhost:3030`

See also the `localhost:3030/presenter` mode

![SliDEV presenter mode](/blog_img/biz/RE/slidev-re-presenter.png)

6. Generate the export **pdf**:

```sh
#npm i -D playwright-chromium
slidev export #requires playwright to be installed
```

> The ppt outpot export goes to `slides-export.pdf`


{{< callout type="warning" >}}
When exporting to `.pdf`, some features *(like UML)* wont be generated.
{{< /callout >}}

```sh
npm run export #defaults as pdf!
#npm run export:pdf

slidev export --format png #npx slidev export --format png
slidev export --format pptx #this will properly render mermaid diagrams and code snippts
```

> The pptx will be at `./slides-export.pptx` and features like UML/MermaidJs will be available

![alt text](/blog_img/biz/RE/slidev-export.png)

7. Or generate the PDF via the UI at: `localhost:3030/export`

![SliDev Real Estate](/blog_img/biz/RE/slidev-re.png)

8. Build it ready to be hosted *as static page*:

```sh
#npm run build #they go to ./dist

slidev build
slidev build --base /talks/my-cool-talk/ #deploy under sub-route

#slidev build --base /data-chat/ #useful for github pages
```

![Building SliDevJS](/blog_img/biz/RE/slidev-build.png)

You can also expose the built static assets:

```sh
#cd ./dist
npx serve #serve the staticaly generated ppt
```


> It can create a [PPT assistant](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#slides-creation-agent) as seen on [this post](https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/)



{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/slidev" title="My SliDevJS Fork" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Presentations as a Code pushed to Github Pages" >}}
{{< /cards >}}

**Features I love from SliDev**: https://sli.dev/features/

1. https://sli.dev/features/mermaid.html

2. Import Slides as if they were components - https://sli.dev/features/importing-slides.html

3. Custom [Icons](https://sli.dev/features/icons.html)

```sh
#npm install @iconify-json/[the-collection-you-want]
npm install @iconify-json/uim #https://icon-sets.iconify.design/uim/?icon-filter=rocket&keyword=uim

#<uim-rocket class="text-3xl text-orange-400 animate-ping" /> #uim:rocket #@iconify-json/uim
```

```sh
npm install @iconify-json/logos #https://github.com/gilbarbara/logos
#<logos-vue />

#<logos-claude />
#<logos-openai />
```

* https://icon-sets.iconify.design/vscode-icons/
* https://icon-sets.iconify.design/devicon/page-15.html

> Thanks to https://iconify.design/

4. Google Fonts - https://fonts.google.com/

> I like [Roboto](https://fonts.google.com/specimen/Roboto) for the text


5. SliDev Themes! Not only the default ones, but the [community ones](https://sli.dev/resources/theme-gallery#community-themes) as well

4. Downloadable PDF - https://sli.dev/features/build-with-pdf

### Marp

You can also create **PPTs from markdown** with [Marp](https://github.com/marp-team/marpit)

Marp is a presentation software that simplifies the creation of visually appealing slideshows and presentations for college students.

It allows you to write your presentation content using Markdown, a plain text formatting syntax, and then effortlessly convert it into professionally designed slides.


* https://github.com/marp-team/marpit



Marp is especially helpful for students who want to focus on their content without the complexities of traditional presentation software, making it an excellent tool for academic presentations and reports.

[Two other options](https://fossengineer.com/create-ppt-with-code/#marp) to create PPTs as a Code.

### RemarkJS

With [RemarkJS](https://fossengineer.com/create-ppt-with-code/#remark)

There are some astro Themes which are implementing RemarkJS:


---

## Conclusions

You can also use the VSCode extension: https://marketplace.visualstudio.com/items?itemName=antfu.slidev

```sh
ext install antfu.slidev
#code --install-extension antfu.slidev #or this one from the terminal
```

There you go: Few powerpoint as a code f/oss alternatives.

Which will also play [nice with LLMS](#ai-powered-slidev)

Need additionally **mockup tools**?

{{< details title="There is a good range of Mock-up Tools... 📌" closed="true" >}}

There are several open-source and self-hostable mockup and wireframing tools available.

Here are some of the most popular and feature-rich options:

**Mockup and Prototyping Tools:**

* **Penpot:**  This is a very strong contender and a direct competitor to Figma.  It's completely open source (using SVG as its native format), web-based, and designed for collaborative work.  It's definitely worth checking out.  Self-hosting is well-documented.

See their docs:

* https://github.com/penpot/penpot/blob/develop/docker/images/docker-compose.yaml
* https://snapcraft.io/penpot-desktop

```sh
sudo snap install penpot-desktop
```

* **Pencil:** While not strictly a web-based, self-hostable application in the same way as Penpot, Pencil is a free and open-source GUI prototyping tool for desktop.  It's very capable, though the collaborative features are less advanced.  You *could* potentially self-host the files generated by Pencil and use some kind of version control system to share and collaborate.

**Wireframing Tools (Often Included in the Above):**

Many of the mockup and prototyping tools above also handle wireframing very well.  Penpot, for example, has excellent vector drawing capabilities suitable for wireframes.  Here are a few more focused on wireframing:

* **Excalidraw:** This is a virtual whiteboard tool that's great for sketching and quick wireframing.  It's open source and can be self-hosted.  It's not as feature-rich as Penpot for full mockups, but its simplicity makes it excellent for rapid wireframing.  There's also Excalidraw+ which offers more collaboration features.
* **Wireframe.cc (Open Source Version):** The core of Wireframe.cc is open source, and though the full service is not, you could potentially self-host the core functionality if you're technically inclined.  It's a very simple and clean wireframing tool.

**Other Options (Less Common or More Specialized):**

* **Draw.io (Diagrams.net):** While not specifically a mockup or wireframing tool, Draw.io is a very powerful open-source diagramming tool that can be adapted for wireframing.  It's self-hostable and has a wide range of features.
* **Apache OpenOffice Draw/LibreOffice Draw:** These are desktop-based drawing programs that, like Pencil, can be used for wireframing.  You would need to manage collaboration separately.

**Key Considerations When Choosing:**

* **Collaboration:** How important is real-time collaboration? Penpot is excellent in this regard.
* **Features:** Do you need advanced prototyping features, or are simple wireframes sufficient?
* **Ease of Use:** How easy is the tool to learn and use? Excalidraw is very user-friendly for quick wireframing.
* **Self-Hosting Complexity:** How easy is it to set up and maintain the self-hosted version?
* **Community and Support:** Is there an active community and good documentation?

**Recommendation:**

For a modern, open-source, and self-hostable alternative to Figma, **Penpot** is the most promising option.  It's actively developed and has a strong focus on collaboration.

If your needs are simpler and you're primarily focused on rapid wireframing, **Excalidraw** is a great choice.

I'd recommend trying out Penpot and Excalidraw to see which one best fits your workflow.  Both are excellent tools.


{{< /details >}}



{{< cards >}}
  {{< card link="https://fossengineer.com/selfhosting-excalidraw/" title="Setup Excalidraw" image="https://socialify.git.ci/excalidraw/excalidraw/image?description=1&font=Inter&language=1&name=1&stargazers=1&theme=Auto" subtitle="With Docker" >}}
  {{< card link="https://github.com/excalidraw/excalidraw" title="Excalidraw" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Virtual whiteboard for sketching hand-drawn like diagrams" >}}
{{< /cards >}}

If you need some **UML Tool**, have a look to: **[plantUML](https://github.com/plantuml/plantuml)**

* https://plantuml.com/mindmap-diagram

> Like MermaidJS, it can also be used inside SliDev PPTs!


{{< details title="More about PlantUML... 📌" closed="true" >}}

PlantUML is a very useful tool, especially for those working in software development and related fields.

* **Diagrams from Text:**
    * PlantUML allows you to create various types of diagrams from plain text descriptions. This means you don't have to rely on graphical drawing tools. Instead, you write simple text code, and PlantUML generates the diagrams for you.
* **Variety of Diagrams:**
    * It supports a wide range of diagram types, including:
        * UML diagrams (like class diagrams, sequence diagrams, use case diagrams)
        * Non-UML diagrams (like flowcharts, mind maps, and more)
* **Open Source:**
    * Yes, PlantUML is indeed open-source. This is a significant advantage, as it means it's freely available for anyone to use, modify, and distribute.
* **Key Benefits:**
    * **Text-based:** This makes it easy to integrate with version control systems (like Git), allowing for collaborative diagram creation.
    * **Efficiency:** It streamlines the process of creating and updating diagrams.
    * **Versatility:** Its support for numerous diagram types makes it a flexible tool for various needs.


{{< /details >}}

In essence, PlantUML simplifies the creation of diagrams by using a text-based approach, and being open source, it is a very valuable tool.

### SliDev Containerized

You can build your [Slidev presentation](https://github.com/JAlcocerT/Docker/blob/main/Web/SSGs/Sli_dev_Docker-compose.yml) inside a container: https://github.com/JAlcocerT/slidev/blob/main/README.md

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ssg-slidevjs" title="SliDev | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/dev/slidev-presenter-container.png)

And the regular view, `/presenter` `/overview` modes will work the same!

### AI Powered SliDev

There are a couple of options...

#### With OpenAI Calls

First **SliDev with AI scheleton**, pretty much an [OpenAI API call](https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/PPT_Service).

And its not only about text, you can also prompt images that fits what you want to communicate.

{{< details title="OpenAI API + SliDev - Cool AI Created PPT as a Code 📌" closed="true" >}}

See these Python scripts for reference:

1. https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/refs/heads/main/Z_Tests/OpenAI/openai_slidev.py
2. https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/OpenAI

```py
#https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/refs/heads/main/Z_Tests/OpenAI/openai_slidev.py
#python3 pyopen.py > output.mdx

import os
from dotenv import load_dotenv
from openai import OpenAI  # pip install openai==1.30.5

# Load environment variables from the .env file
load_dotenv()

# Get the OpenAI API key from the environment variables
api_key = os.getenv("OPENAI_API_KEY")

# Initialize the OpenAI client
client = OpenAI(
    api_key=api_key,
)

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "system",
            "content": """You are an expert developer in SliDev - the framework to create PPTs
                        """,
        },
        {"role": "user", "content": "Who are you and what can you do?"}

    ],
    model="gpt-4o-mini",
    temperature=0.3,
)

# print(chat_completion)
# Extract and print the content of the completed message
completed_message = chat_completion.choices[0].message.content
print(completed_message)
```


But thats too hard to maintain, **how about this?**

```py
#python3 pyopen.py > output.mdx

import os
from dotenv import load_dotenv
from openai import OpenAI  # pip install openai==1.30.5

# Load environment variables from the .env file
load_dotenv()

# Get the OpenAI API key from the environment variables
api_key = os.getenv("OPENAI_API_KEY")

# Initialize the OpenAI client
client = OpenAI(
    api_key=api_key,
)

mtg_must_have= """
* Purpose - Every meeting should have an objective—the reason why you're having the meeting. Before you schedule a meeting be sure you know what it is that you want out of the meeting.
* Agenda - An agenda outlines the plan for the meeting and lets participants know what to expect. It allows them to be prepared so they can actively participate and bring their expertise to the table.  
* preparation - Before the meeting all participants should take some time to review the agenda and prepare any questions they may have. 
"""

system_reminder = """
Never start your answers with "As an AI language model" when responding to questions.

No disclaimer is needed in any situation.

Write using simple language so a grandma could understand.

Use a conversational tone, be informal and approachable. Write like how people in real life would talk. A bit of slang is okay but don't overdo it.

If you don’t know the answer, just say you don’t know.

Your answers should be on point, succinct and useful. Each response should be written with maximum usefulness in mind rather than being polite.

If something seems out of reach, don’t ask the user to do it; instead, try to work through all your available options first.

When solving problems, take a breath and tackle them step by step.

My career depends on you giving me a good answer

Speak only what needs to be said. Keep the responses brief and to the point, avoid extra words and overly long explanations.
"""

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "system",
            "content": f"""You are an expert meeting assistant. Very aware of the following:
                              {mtg_must_have} 
                            Remember also, that: {system_reminder}
                        """,
        },
        {"role": "user", "content": "Who are you and what can you do?"}

    ],
    model="gpt-4o-mini",
    temperature=0.3,
)

# Extract and print the content of the completed message
completed_message = chat_completion.choices[0].message.content
print(completed_message)
```

> With this approach you can have the prompts saved at `./Z_AIgents/Prompts/prompts_mdsummarizer.md`

{{< /details >}}

#### With Agentic IDEs like Windsurf

> **EDIT**: Coming from the future - With Windsurf IDE or codex, why not getting ppts as per your codebase?


---

## FAQ

### Cool Resources to Design PPTs

* https://english-at-home.com/business/vocabulary-and-phrases-for-making-presentations/
* https://www.amazon.com/How-Design-Worthy-Presentation-Slides-ebook/dp/B00FX3IMZY

### Cool Diagrams as a Code

* [MermaidJS](https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/)
* [Python Diagrams](https://fossengineer.com/free-diagram-tools/#free-diagrams-as-a-code)

> See how to make [AI powered Diagrams](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#diagrams-with-ai)

### SelfHosting Cool PPT Software

Any of these will be a replacement for powerpoint / mentimeter/ slido.

You can upload the ppt/pdf created with the mentioned PPT as a code frameworks.

1. https://github.com/ClaperCo/Claper

> aGPL v3.0 | The ultimate tool to interact with your audience

* https://docs.claper.co/self-hosting/quick-start.html
* https://github.com/ClaperCo/Claper/blob/main/docker-compose.yml

Claper turns your presentations into an interactive, engaging and exciting experience.

```sh
https://github.com/JAlcocerT/Claper #I forked it!
cd Claper
#openssl rand -base64 48 #create one secret
#copy the .env and adjust it
docker compose up -d
```

![Claper UI](/blog_img/selfh/CLAPER.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/claper" title="Claper with Docker 🐋 ↗" >}}
{{< /cards >}}


{{< callout type="info" >}}
Claper is a perfect example of how to deploy an app with **https thanks to [Traefik](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/https/#traefik)**!
{{< /callout >}}

### PPT with Astro

* https://github.com/jsulpis/slides-template
    * https://jsulpis.github.io/slides-template/#/

>  Minimalist template for creating slides with Reveal.js and Astro 

**RevealJS?**

> The HTML Presentation Framework 


* https://revealjs.com/?demo#/30
* https://revealjs.com/markdown/

* https://revealjs.com/themes/
    * https://revealjs.com/jump-to-slide/ - **G**
    * https://revealjs.com/overview/ **Esc**

```sh
git clone https://github.com/hakimel/reveal.js.git
cd reveal.js && npm install

npm start #localhost:8000
#npm start -- --port=8001
```

```sh
npm run build
```

```sh
npx http-server dist/
```

> You have a HUGO theme wrapping this: https://github.com/joshed-io/reveal-hugo

> > MIT | 📽️ Create rich HTML-based presentations with Hugo and Reveal.js 

**Or you could try with Marp**

* <https://github.com/marp-team/marp>
* <https://github.com/marp-team/marp-cli/releases>

* BUILT ON TOP OF NODEJS.

* https://rnd195.github.io/marp-community-themes/

Starting

```sh
#marp-team.marp-vscode
npm install -g @marp-team/marp-cli
marp sample.md --pdf
#marp static_sites_presentation.md --html
#marp static_sites_presentation.md --pptx
```

```sh
#marp sample-with-css.md --pdf
marp sample-with-css.md --html
```

Another css with: https://github.com/rnd195/my-marp-themes

* gradient

```sh
wget https://raw.githubusercontent.com/rnd195/marp-community-themes/live/themes/gradient.css
marp sample-other-css.md --html
```