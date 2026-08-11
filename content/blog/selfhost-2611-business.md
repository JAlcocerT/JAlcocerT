---
title: "Selfhosting Business Tools vs Coasean Ceiling"
date: 2026-09-01T23:20:21+01:00
draft: false
tags: ["Self-Hosting","Notes","Marketing","No Code","Link Shortener x Web Analytics"]
description: 'Are certifications still worth it? A look to CCAR-F'
url: 'selfhosting-business'
---

**TL;DR**

Avoid silos and the [Coasean Ceiling](#about-the-coasean-ceiling).

* https://github.com/uvdesk/community-skeleton

**Intro**

Tools to avoid silos in your business.

Im not going to talk [about communication tools](#communicating-with-colleagues) for business.

Neither invoices/billing:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/invoice-ninja" title="Invoice Ninja | Docker Config for HomeLab 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serverless-invoices" title="Serverless Invoices | Docker Config for HomeLab 🐋 ↗" >}}
{{< /cards >}}

But more on:





## Notes

Obsidian or Notion?

Why not just Affine, Joplin or...**LogSeq**?

![alt text](/blog_img/selfh/nocode/affine-local.png)


LogSeq been working nicely for me: *and the markdown support, local first, no db is amazing to sync with a github repository*

```sh
#https://github.com/JAlcocerT/my-logseq-notes
#cd scripts
python3 verify_connection.py
python3 backfill_meeting.py 01K...abcdef12446579
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/joplin" title="Joplin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/logseq" title="LogSeq | Docker Config 🐋 ↗" >}}
{{< /cards >}}

* https://github.com/OlaProeis/ironPad

Miro?

Nah, just excalidraw or MermaidJS for diagrams.


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/appflowy" title="AppFlowy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/selfh/nocode/apflowy-signup.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nocodb" title="NocoDB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/baserow" title="BaseRow | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/selfh/nocode/nocodb-table.png)

### SpreadSheets

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/grist" title="Grist | Docker Config 🐋 ↗" >}}
{{< /cards >}}

0. https://github.com/glideapps/glide-data-grid


### Wikis


* https://github.com/docmost/docmost

> Docmost is an open-source collaborative wiki and documentation software. It is an open-source alternative to Confluence and Notion.


## No Code


Smartsheet is similar to Airtable and NocoDB as a flexible, spreadsheet-database hybrid for no-code work management, data organization, and team collaboration. 

All three blend spreadsheets with relational databases, supporting views (grids, Kanban, calendars), automations, forms, and integrations.

Airtable and NocoDB emphasize database-like apps with bases/tables; Smartsheet leans toward project/portfolio management with Gantt/dependencies. 

| Tool       | Type                  | Hosting/Price                  | Key Strengths  [productive](https://productive.io/blog/airtable-alternatives/) |
|------------|-----------------------|--------------------------------|---------------------------------------|
| **Smartsheet** | Cloud (paid tiers)   | Starts ~$7/user/mo            | PM features, enterprise security |
| **Airtable**  | Cloud (free tier)    | Free limited, ~$20/user/mo    | Polished UI, templates, apps |
| **NocoDB**    | Open-source/self-host| Free, enterprise paid         | SQL backend, unlimited scalability |


So, smartsheet, AirTable..or...?

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nocodb" title="NocoDB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/baserow" title="BaseRow | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Baseraw is just one service to get it selfhosted:

![alt text](/blog_img/selfh/nocode/baserow-lead-template.png)

People use tools like baserow as an overpowered spreadsheet or custom CRM.

You can also try with:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/twenty" title="Twenty CRM | Docker Config 🐋 ↗" >}}
{{< /cards >}}


## Marketing

If you are doing ads and getting users to register into your app

Or have made a sales pipeline

Or...are just looking for high value prospects in a lead db like `https://www.storecensus.com/pricing` for your killer idea.

You will need these tools.

And im not just thinking about a Lean (GHA driven) **DRIP** automatic emails.

But these selfhosting ones.

* https://github.com/melosso/beacon

> A lightweight consent management platform. Handle email consent states independently from any ERP, CRM or platform.

## E-Commerce

Because Im not going to even mention about plain websites.

There is a full [post here](https://jalcocert.github.io/JAlcocerT/how-about-selfhosting-an-ecommerce/).


But basically,you can try:

![Drupal Ecommerce Setup](/blog_img/biz/ecommerce/drupal.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/drupal" title="Drupal | Docker Config 🐋 ↗" >}}
{{< /cards >}}

<!-- 
* Weddings...
* bodas.net

http://divephiphiisland.com/ -->

<!-- 
ecommerce
https://polkabikes.pl/ -->

<!-- More ppl to help - future CLIENTS

* you dont need to pay for wordpress themes, its already there and it works
  * https://generatepress.com/pricing/

* Pablo Couto - https://www.buildingfuturecapital.com/

https://web-check.xyz/check/https%3A%2F%2Fwww.buildingfuturecapital.com%2F

Registry Expiry Date - 26 April 2025

* Sofia - zofienkagram
  * https://wnba.pl/ - another wordpress (good looking)
  * monika ciolkowska - monikacio
    * https://monikaciolkowska.portfoliobox.net/
    * Using the low tier without domain of https://www.portfoliobox.net/pricing (46$/y)
      * Interesting section with a table comparing services and faq (go below)

* Gym Trainer - https://trenujswiadomie.pl/kokpit/

-->



## Tech Businesses

You will probably need monitoring:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}

These are very cool all in one to selfhost:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/it-tools" title="IT-Tools | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/omnitools" title="Omni-Tools Docker Config 🐋 ↗" >}}
{{< /cards >}}

Remote desktops?

Not a problem via `https://clients.amazonworkspaces.com/linux-install`

Or via `mstsc` to connect to windows RDP

I also tried azure desktops and those Citrix ones.

But...you can also have the linux way: *with webtops and with dockur*

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/" title="IT-Tools | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/" title="Omni-Tools Docker Config 🐋 ↗" >}}
{{< /cards >}}

### D&A Tech

Sqlite is pretty much everywhere: *from pi-hole v6 to pocketbase*

```sh
#choco install dbeaver
flatpak install flathub io.dbeaver.DBeaverCommunity
```

---

## Conclusions

I'd keep it simple with: *nocodb, affine are great, but require more services running, do you need that many features?*

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/baserow" title="Baserow | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/logseq" title="LogSeq | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Business Cards?

Just try:

* https://github.com/kyaustad/cardyo

>  A simple URL based **digital business card creation** and sharing system 

You can clean up the mess with: *see `OSS Business` in my home-lab repo for more ideas.

```sh
lazydocker
docker system df
#docker stop $(docker ps -a -q) #stop all
#docker system prune -a
```

And for questions:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}


{{< callout type="warning" >}}
Believe it or not, costs dont dictate prices. Prices (what people is willing to pay) dictate which costs can you afford to provide them what they want
{{< /callout >}}

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


Not doing business yet, but selling your time in the job market?


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex" title="home-lab | Repo ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/Job-Trends" title="home-lab | Repo ↗" icon="github" >}}
{{< /cards >}}

* https://github.com/Manan-Santoki/Backslash

> Self-hostable, open-source LaTeX editor with live PDF preview and a full REST API.

Consider overleaf or these:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/open-resume" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/yamlresume" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}


These are the commands I used to figure out the candidates and sizes.

  Overall reclaimable space

  docker system df
  docker system df -v

  docker system df gives the category totals and reclaimable space.
  docker system df -v gives the detailed per-image, per-volume, and per-container breakdown.

  What docker image prune -a would erase

  docker image ls --format '{{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}'

  This lists all images with their sizes. I treated images with CONTAINERS = 0 in the docker system df -v output as prune candidates for docker image prune -a.

  If you want just the unused-image IDs from the system df view, this is the practical filter:

  docker system df -v

  Then inspect the Images space usage table and select rows where CONTAINERS is 0.

  What docker volume prune would erase

  docker volume ls -qf dangling=true

  This lists dangling volumes, which are the ones docker volume prune would remove.

  For their sizes, I used:

  docker system df -v

  and read the Local Volumes space usage section.

  What docker builder prune would erase

  docker buildx du --verbose

  This lists build-cache records with ID, Size, Description, Reclaimable, and other metadata.

  To count how many cache records were reclaimable:

  docker buildx du --verbose | grep '^ID:' | wc -l

```sh
docker builder prune
#docker volume prune
#docker image prune -a
```


---

## FAQ

### Communicating with colleagues

Do you really need M365 with teams?

```sh
sudo snap install slack --classic #sudo snap remove slack
#sudo snap install discord
#flatpak install flathub org.telegram.desktop
#flatpak install flathub im.riot.Riot #element
#flatpak install flathub org.signal.Signal
```

Or just via bluetooth: https://github.com/permissionlesstech/bitchat

> Back to sending texts in a classroom like in 2007? :)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/matrix" title="Matrix | Docker Config for HomeLab 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serverless-invoices" title="Serverless Invoices | Docker Config for HomeLab 🐋 ↗" >}}
{{< /cards >}}

### About The Coasean Ceiling


### Certifications and CVs

Earlier this year I had to do some AI prep here.

I registered to `Claude Certified Architect –Foundations`

`Claude Certified Architect - Foundations (CCAR-F) Certification.`

* https://anthropic-partners.skilljar.com/ai-fluency-framework-foundations
* https://anthropic-partners.skilljar.com/claude-with-the-anthropic-api/287745

```sh
cd C:\Users\j--e-\Desktop\claude-architect
python -m http.server 8080
#then open http://localhost:8080.
```


📌 **Course Overview: AI Fluency: Framework & Foundations**

This course focuses on **human-AI collaboration**, aiming to build lasting skills for interacting with AI systems effectively, efficiently, ethically, and safely rather than relying on temporary tips or tricks.

While exercises default to **Claude** (claude.ai), the underlying framework and principles apply across any major large language model.

🧠 **The Core AI Fluency Framework: The "4Ds"**

The course centers around four core competencies for working with AI:

1. **Delegation:** Deciding what tasks to assign to AI, planning projects, and determining how to structure the workload.
2. **Description:** Effectively communicating context, constraints, and instructions to the model (prompting techniques).
3. **Discernment:** Evaluating, judging, and refining AI output through the *Description-Discernment loop*.
4. **Diligence:** Ensuring ethical, safe, and responsible evaluation and dissemination of AI-assisted work.

🔄 **3 Modes of AI Engagement**

The course outlines three distinct ways humans collaborate with AI systems:

* 🤖 **Automation:** Setting the AI to complete specific, routine tasks based on explicit instructions.
* 🤝 **Augmentation:** Working alongside the AI as a creative thinking, problem-solving, and task execution partner.
* ⚙️ **Agency:** Configuring AI to work independently on your behalf by establishing domain knowledge and behavior patterns rather than guiding single steps.

Ask Claude to challenge you with some poorly written prompts for you to improve.
Apply your Description thinking to improve each one, considering:
Clear product description (what exactly you want)
Process guidance (how you want Claude to approach it)
Performance specifications (how you want Claude to behave during your collaboration)
Have a chat about the before/after versions with Claude and ask for feedback on how your improved descriptions would help it provide better responses.
After about 5 minutes, switch roles and provide bad prompts for Claude to fix. Notice what information Claude tends to add and how it organizes this information.

Spot on.

That is the exact core thesis of the **AI Fluency Framework**: treat AI like a smart, highly capable colleague rather than a Google search bar or a vending machine.

If you give a human colleague a vague one-liner with no context, no clear goal, and no process expectations, you’ll get generic, off-target work back. The same exact rule applies to AI ("Garbage In, Garbage Out"):

* **Delegation:** Just like with a teammate, you decide who handles what based on strengths—you don't dump everything on them blindly.
* **Description:** You give clear specs on the **Product** (what to deliver), **Process** (how to tackle it), and **Performance** (the tone/role to adopt).
* **Discernment & Diligence:** You review their work critically, give feedback to refine it, and check facts before hitting send—because even brilliant colleagues make mistakes.

The better the brief, the better the output.


Here is the structured breakdown of the **Effective Prompting Techniques** lesson from the **AI Fluency: Framework & Foundations** course:

---

## ⚡ **Lesson Overview: Effective Prompting Techniques**

* **Core Focus:** Deepening the **Description** competency by learning practical prompt engineering—designing clear, structured instructions that combine everyday human communication skills with AI-specific considerations.
* **Key Concept:** Prompting is inherently **iterative and collaborative**. You should expect to refine your approach based on the model's responses rather than relying on a single one-shot attempt.

---

## 🛠️ **The 6 Foundational Prompting Techniques**

1. **Give Context:** Provide relevant background details, explain **why** you need the task completed, and specify the broader project goals.
2. **Show Examples (Few-Shot Prompting):** Supply sample outputs or templates to demonstrate the exact tone, style, or structure you expect.
3. **Specify Constraints:** Set clear parameters for word count, format (e.g., bullet points, JSON, Markdown tables), excluded terms, or structure.
4. **Break Complex Tasks into Steps:** Divide multi-part requests into explicit sequential instructions to prevent missed requirements.
5. **Ask the AI to Think First:** Encourage the model to display its step-by-step reasoning or internal logic before rendering the final answer.
6. **Define the AI's Role or Tone:** Assign a specific persona, audience level, or stance (e.g., *"Act as a critical editor..."* or *"Explain to a non-technical manager..."*).

---

## 💡 **Key Takeaways & Strategies**

* **The "Secret Weapon":** Ask the AI to evaluate and improve your prompt before generating the final output (e.g., *"What additional context or instructions do you need from me to complete this task successfully?"*).
* **Troubleshooting:** When an output misses the mark, identify which of the 6 techniques was missing (e.g., unclear constraints or lack of step-by-step breakdown) and adjust iteratively.

---

Here is the summary of the **A Closer Look at Discernment** lesson from the **AI Fluency: Framework & Foundations** course:

---

## 🔍 **Lesson Overview: A Closer Look at Discernment**

* **Core Focus:** Discernment is the third competency in the "4D" AI Fluency Framework. It represents the flip side of **Description**—while Description helps you communicate your intentions, Discernment is your ability to thoughtfully evaluate what the AI produces, how it processes information, and how it behaves.
* **Key Principle:** Domain knowledge enhances your ability to critically assess AI outputs. Even advanced AI systems require active human oversight, judgment, and critical evaluation.

---

## 🧩 **The 3 Types of Discernment**

1. **Product Discernment:** Evaluating the quality, accuracy, coherence, relevance, and appropriateness of the actual outputs generated.
2. **Process Discernment:** Assessing the AI's internal reasoning or methodology—checking for logical errors, missing context, or flawed analytical steps.
3. **Performance Discernment:** Evaluating the AI's collaboration style and demeanor—checking if its communication style, responsiveness, and use of terminology meet your needs.

---

## 🛠️ **Hands-On Exercise: Expert Discernment**

* **Goal:** Practice applying all three types of Discernment by evaluating AI-generated explanations in an area where you hold personal expertise.
* **Steps:**
1. Ask the AI to generate **three distinct explanations or analyses** regarding a specific topic within your expertise (e.g., photography, cooking, history).
2. Apply **Product Discernment** (spot factual errors and check accuracy), **Process Discernment** (evaluate logic and conceptual connections), and **Performance Discernment** (assess tone and responsiveness).
3. Provide explicit feedback on the strongest and weakest versions, then work with the model to refine a superior final draft.
4. Reflect on how your domain knowledge allowed you to spot issues that a non-expert might miss.



---

## 🔜 **What’s Next in the Course?**

In the next lesson, **The Description-Discernment Loop**, you will combine your communication (**Description**) and evaluation (**Discernment**) skills into a continuous feedback loop applied directly to your ongoing course project.


```py
from dotenv import load_dotenv
load_dotenv()

from anthropic import Anthropic

client = Anthropic()
model = "claude-sonnet-4-0"


message = client.messages.create(
    model=model,
    max_tokens=1000,
    messages=[
        {
            "role": "user",
            "content": "What is quantum computing? Answer in one sentence"
        }
    ]
)

message.content[0].text
```

This means if you want to have a multi-turn conversation where Claude remembers context from earlier messages, you need to handle the conversation state yourself.


How Multi-Turn Conversations Work
To maintain conversation context, you need to do two things:

Manually maintain a list of all messages in your code
Send the complete message history with every request

```py
def add_user_message(messages, text):
    user_message = {"role": "user", "content": text}
    messages.append(user_message)

def add_assistant_message(messages, text):
    assistant_message = {"role": "assistant", "content": text}
    messages.append(assistant_message)

def chat(messages):
    message = client.messages.create(
        model=model,
        max_tokens=1000,
        messages=messages,
    )
    return message.content[0].text
```

```py
system_prompt = """
You are a patient math tutor.
Do not directly answer a student's questions.
Guide them to a solution step by step.
"""

client.messages.create(
    model=model,
    messages=messages,
    max_tokens=1000,
    system=system_prompt
)
```

Temperature is a decimal value between 0 and 1 that directly influences these selection probabilities. It's like adjusting the "creativity dial" on Claude's responses.

```py
def chat(messages, system=None, temperature=1.0):
    params = {
        "model": model,
        "max_tokens": 1000,
        "messages": messages,
        "temperature": temperature
    }
    
    if system:
        params["system"] = system
    
    message = client.messages.create(**params)
    return message.content[0].tex
  ```

  The ContentBlockDelta events contain the actual generated text that you'll want to display to users.



messages = []
add_user_message(messages, "Write a 1 sentence description of a fake database")

stream = client.messages.create(
    model=model,
    max_tokens=1000,
    messages=messages,
    stream=True
)

for event in stream:
    print(event)

    Rather than manually parsing events, you can use the SDK's simplified streaming interface that extracts just the text content:

with client.messages.stream(
    model=model,
    max_tokens=1000,
    messages=messages
) as stream:
    for text in stream.text_stream:
        print(text, end="")
This approach automatically filters out everything except the actual text content, which is usually what you need for displaying responses to users.

with client.messages.stream(
    model=model,
    max_tokens=1000,
    messages=messages
) as stream:
    for text in stream.text_stream:
        # Send each chunk to your client
        pass
    
    # Get the complete message for database storage
    final_message = stream.get_final_message()


```py
messages = []

add_user_message(messages, "Generate a very short event bridge rule as json")
add_assistant_message(messages, "```json")

text = chat(messages, stop_sequences=["```"])
```

You want to send a request to Claude's API. What's the minimum information you must include?

API key, model name, messages, and max tokens

Prompt Engineering vs Prompt Evaluation
Prompt engineering is your toolkit for crafting effective prompts. It includes techniques like:

Multishot prompting
Structuring with XML tags
Many other best practices
These techniques help Claude understand exactly what you're asking for and how you want it to respond.

Prompt evaluation takes a different approach. Instead of focusing on how to write prompts, it's about measuring their effectiveness through automated testing. You can:

Test against expected answers
Compare different versions of the same prompt
Review outputs for errors

The first line of your prompt serves as the anchor for the model's entire response. Leading with a clear task statement and an action verb establishes the objective immediately, reducing tangential or unfocused output.

---

### Core Formula for Effective First Lines

An effective opening line combines three structural elements:

$$\text{First Line Structure} = \text{\textbf{Direct Action Verb}} + \text{\textbf{Clear Core Task}} + \text{\textbf{Output Constraint/Spec}}$$

```
  "Write"          "three paragraphs"          "about how solar panels work."
 ─────────        ────────────────────        ───────────────────────────────
Action Verb        Output Spec/Constraint               Core Task

```

---

### Key Principles & Examples

#### 1. Lead with Direct Action Verbs

Start your request with imperative verbs rather than conversational preambles or indirect questions.

| Conversational / Indirect | Clear & Direct Opening |
| --- | --- |
| *"I was wondering if you could help me put together a meal plan..."* | **"Generate** a one-day meal plan for an athlete based on their physical parameters." |
| *"Could you explain how geothermal energy works in different places?"* | **"Identify** three countries that use geothermal energy and **list** generation statistics for each." |
| *"I need some text written about solar panel technology..."* | **"Write** three paragraphs explaining how solar panel photovoltaic cells convert light to electricity." |

#### 2. Instruction Over Exploration

Phrasing requests as explicit instructions rather than exploratory questions forces the model to focus on the core deliverable rather than framing the topic conversationally.

* **Indirect / Conversational Question:** *"What are some ways an athlete can eat better if they want to build muscle?"*
* **Direct Instruction:** *"Design a high-protein one-day meal plan tailored to an athlete seeking muscle gain."*

---

### Impact on the Meal Plan Evaluation Baseline

In the course's athlete meal plan exercise, applying this technique demonstrates how altering only the first line shifts performance:

```
Baseline Prompt (Score: ~2.3 / 10)
---------------------------------
What should this person eat?
- Height: 180cm
...

Iteration 1: Clear & Direct Opening (Score: ~3.9 / 10)
------------------------------------------------------
Generate a compact, concise 1-day meal plan for an athlete that meets their dietary requirements.
- Height: 180cm
...

```

By substituting the vague question *"What should this person eat?"* with the direct command *"Generate a compact, concise 1-day meal plan for an athlete..."*, the benchmark evaluation score typically jumps from **2.3 to ~3.9 out of 10** without changing any other part of the prompt.

When building AI applications with Claude, you'll often need to give it access to real-time information or the ability to perform actions. This is where tool functions come in - they're Python functions that Claude can call when it needs additional data to help users.

> I made already some webapps to have tools calls, like this trip planner with weather around Google ADK PoC

Go home
Certifications  CPN Learning Path CPN Connect On Demand Library All Courses Home		Jesus Alcocer Tagua's Avatar
My Profile
Sign Out
Building with the Claude API
Course Overview
Introduction
 Welcome to the course
Anthropic overview
 Overview of Claude models
Accessing Claude with the API
 Accessing the API
 Getting an API key
 Making a request
 Multi-Turn conversations
 Chat exercise
 System prompts
 System prompts exercise
 Temperature
 Course satisfaction survey
 Response streaming
 Structured data
 Structured data exercise
 Quiz on accessing Claude with the API
Prompt evaluation
 Prompt evaluation
 A typical eval workflow
 Generating test datasets
 Running the eval
 Model based grading
 Code based grading
 Exercise on prompt evals
 Quiz on prompt evaluation
Prompt engineering techniques
 Prompt engineering
 Being clear and direct
 Being specific
 Structure with XML tags
 Providing examples
 Exercise on prompting
 Quiz on prompt engineering techniques
Tool use with Claude
 Introducing tool use
 Project overview
 Tool functions
 Tool schemas
 Handling message blocks
 Sending tool results
 Multi-turn conversations with tools
 Implementing multiple turns
 Using multiple tools
 Fine grained tool calling
 The text edit tool
 The web search tool
 Quiz on tool use with Claude
RAG and Agentic Search
 Introducing Retrieval Augmented Generation
 Text chunking strategies
 Text embeddings
 The full RAG flow
 Implementing the RAG flow
 BM25 lexical search
 A Multi-Index RAG pipeline
Features of Claude
 Extended thinking
 Image support
 PDF support
 Citations
 Prompt caching
 Rules of prompt caching
 Prompt caching in action
 Code execution and the Files API
 Quiz on features of Claude
Model Context Protocol
 Introducing MCP
 MCP clients
 Project setup
 Defining tools with MCP
 The server inspector
 Implementing a client
 Defining resources
 Accessing resources
 Defining prompts
 Prompts in the client
 MCP review
 Quiz on Model Context Protocol
Anthropic apps - Claude Code and computer use
 Anthropic apps
 Claude Code setup
 Claude Code in action
 Enhancements with MCP servers
Agents and workflows
 Agents and workflows
 Parallelization workflows
 Chaining workflows
 Routing workflows
 Agents and tools
 Environment inspection
 Workflows vs agents
 Quiz on Agents and Workflows
Final assessment
 Final Assessment
Wrapping up!
 Course Wrap Up
Tool schemas

Open in Claude

After writing your tool function, the next step is creating a JSON schema that tells Claude what arguments your function expects and how to use it. This schema acts as documentation that Claude reads to understand when and how to call your tools.

Understanding JSON Schema
JSON Schema isn't specific to AI or tool calling - it's a widely-used data validation specification that's been around for years. The AI community adopted it because it's a convenient way to describe function parameters and validate data.


The complete tool specification has three main parts:

name - A clear, descriptive name for your tool (like "get_weather")
description - What the tool does, when to use it, and what it returns
input_schema - The actual JSON schema describing the function's arguments
Writing Effective Descriptions
Your tool description is crucial for helping Claude understand when to use your function. Best practices include:

Aim for 3-4 sentences explaining what the tool does
Describe when Claude should use it
Explain what kind of data it returns
Provide detailed descriptions for each argument

The Easy Way to Generate Schemas
Instead of writing JSON schemas from scratch, you can use Claude itself to generate them. Here's the process:

Copy your tool function code
Go to Claude and ask it to write a JSON schema for tool calling
Include the Anthropic documentation on tool use as context
Let Claude generate a properly formatted schema following best practices
The prompt should be something like: "Write a valid JSON schema spec for the purposes of tool calling for this function. Follow the best practices listed in the attached documentation."


Implementing the Schema in Code
Once Claude generates your schema, copy it into your code file. Here's a good naming pattern to follow:

def get_current_datetime(date_format="%Y-%m-%d %H:%M:%S"):
    if not date_format:
        raise ValueError("date_format cannot be empty")
    return datetime.now().strftime(date_format)

get_current_datetime_schema = {
    "name": "get_current_datetime",
    "description": "Returns the current date and time formatted according to the specified format",
    "input_schema": {
        "type": "object",
        "properties": {
            "date_format": {
                "type": "string",
                "description": "A string specifying the format of the returned datetime. Uses Python's strftime format codes.",
                "default": "%Y-%m-%d %H:%M:%S"
            }
        },
        "required": []
    }
}
Use the pattern of function_name followed by function_name_schema to keep your schemas organized and easy to match with their corresponding functions.

Adding Type Safety
For better type checking, import and use the ToolParam type from the Anthropic library:

from anthropic.types import ToolParam

get_current_datetime_schema = ToolParam({
    "name": "get_current_datetime",
    "description": "Returns the current date and time formatted according to the specified format",
    # ... rest of schema
})
While not strictly necessary for functionality, this prevents type errors when you use the schema with Claude's API and makes your code more robust.

 The difference between **Google ADK (Agent Development Kit)** and the **Native Claude SDK** comes down to **framework abstraction vs. direct API control**.

---

### Key Comparison

https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview

| Feature | **Google ADK** (Agent Development Kit) | **Native Claude SDK** (`anthropic` package) |
| --- | --- | --- |
| **Category** | High-Level Agent Orchestration Framework | Low-Level Model API Driver |
| **Primary Focus** | Multi-agent collaboration, delegation, state management, and workflows. | Direct interaction with Claude models (messages, tool calls, caching). |
| **State Management** | **Built-in:** Manages state, artifacts, memory, and multi-turn context automatically. | **Stateless:** You manually manage and append to the `messages = []` history array. |
| **Multi-Agent Support** | **Native:** Built for teams of agents (`LlmAgent`, transfers, hierarchical delegation). | **Custom:** You must write custom Python logic to coordinate multiple agent loops. |
| **Supported Models** | Model-agnostic (designed for Gemini, supports Vertex AI, LiteLLM, etc.). | Exclusive to Anthropic's Claude models (Haiku, Sonnet, Opus). |
| **Developer Control** | Abstracted behind framework structures, CLI, and Web UI tools. | **100% Direct:** Zero extra layers, full visibility over every message block and token count. |
| **Dependencies** | Higher framework footprint, specific project layouts, and conventions. | Lightweight single package (`pip install anthropic`). |

---

### Core Differences Explained

#### 1. Abstraction Level

* **Native Claude SDK:** Acts as the direct driver for Anthropic's API. You send messages, receive `tool_use` requests, execute local functions, and send back `tool_result` blocks using standard Python dictionaries and lists.
* **Google ADK:** An orchestration framework (similar to LangChain or CrewAI) that sits *on top* of LLMs. You define `LlmAgent` objects with specific names, instructions, and tools, and ADK handles the background loop, prompt formatting, and context assembly.

#### 2. Multi-Agent Systems

* **Native Claude SDK:** Doesn't know what an "agent" is—it only knows conversation turns and tools. If you want one agent to hand off a task to another, you must write the Python conditional routing code yourself.
* **Google ADK:** Built specifically for multi-agent systems. Agents can automatically transfer tasks to sub-agents based on agent descriptions using built-in protocol handoffs (`Agent Protocol`).

#### 3. Execution & Memory Management

* **Native Claude SDK:** Unopinionated and stateless. You explicitly construct the request payload on every turn.
* **Google ADK:** Includes built-in state tools (like "Artifacts" for memory tracking) and pre-defined workflow controllers (`Sequential`, `Parallel`, `Loop`) to dictate execution pipelines without writing custom loops.

---

### When to Use Which?

#### Choose the **Native Claude SDK** when:

* You are building single-agent applications or targeted backend microservices.
* You want **maximum speed, minimal dependencies, and total control** over exact prompt formatting, tool loops, and latency.
* You are leveraging Claude-specific features like **Prompt Caching**, **Extended Thinking**, or raw pre-filled messages.
* You prefer standard, transparent Python code over learning framework-specific classes.

#### Choose **Google ADK** when:

* You are building complex **multi-agent architectures** where 3+ specialized bots need to delegate tasks and collaborate.
* You are deploying onto Google Cloud/Vertex AI infrastructure or working within a multi-model enterprise setup.
* You want out-of-the-box UI/CLI debugging tools, built-in graph-based workflows, and cross-agent delegation protocols.


Yes, exactly! Those are the **core guidelines** for constructing effective tool schemas for Claude.

To summarize, these guidelines break down into four operational areas:

---

### Core Guidelines for Tool Schemas

```
                       ┌──────────────────────────────┐
                       │     Tool Schema Structure    │
                       └──────────────┬───────────────┘
                                      │
        ┌─────────────────────────────┼─────────────────────────────┐
        ▼                             ▼                             ▼
┌──────────────┐              ┌──────────────┐              ┌──────────────┐
│  1. "name"   │              │2. "description"│            │3."input_schema"│
│  Function ID │              │ 3-4 Sentences │             │ JSON Spec    │
└──────────────┘              └──────────────┘              └──────────────┘

```

#### 1. The 3 Essential Keys

Every tool schema dictionary must include these three top-level fields:

* **`name`:** A clear, descriptive identifier using snake_case (e.g., `"get_current_datetime"` or `"fetch_weather"`).
* **`description`:** The most critical field for Claude. Aim for **3 to 4 detailed sentences** explaining:
1. What the function does
2. When Claude should call it
3. What format/data it returns


* **`input_schema`:** A standard JSON Schema object (`"type": "object"`) specifying parameter names, data types, descriptions, and required fields.

#### 2. Descriptive Parameter Specifications

Inside `input_schema.properties`, every single parameter must have a clear `description`. Explain formatting rules, default values, or expected units (e.g., *"Uses Python's strftime format codes"* or *"Temperature unit in Celsius"*).

#### 3. Standard Naming & Implementation Pattern

Match the Python function name to its schema variable name using the `[function_name]_schema` convention:

```python
from anthropic.types import ToolParam

# Python Execution Function
def get_current_datetime(date_format="%Y-%m-%d %H:%M:%S"):
    if not date_format:
        raise ValueError("date_format cannot be empty")
    return datetime.now().strftime(date_format)

# Matching Tool Schema (using ToolParam for type safety)
get_current_datetime_schema = ToolParam({
    "name": "get_current_datetime",
    "description": (
        "Returns the current date and time formatted according to the specified strftime format. "
        "Use this tool whenever a user asks for the current date, time, or relative time calculations. "
        "Returns a formatted datetime string."
    ),
    "input_schema": {
        "type": "object",
        "properties": {
            "date_format": {
                "type": "string",
                "description": "A string specifying the format of the returned datetime using Python's strftime format codes.",
                "default": "%Y-%m-%d %H:%M:%S"
            }
        },
        "required": []
    }
})

```

#### 4. Schema Generation Trick

Instead of writing verbose JSON schemas manually, pass your Python function signature to Claude (via Claude.ai or an API call) and prompt:

> *"Write a valid JSON schema spec for tool calling for this function. Follow best practices in the attached documentation."*

---

### What's Next in the Course?

With your tool function written and your schema defined, the next lesson moves to **Handling Message Blocks**—understanding how Claude responds when it wants to call a tool, how content blocks change, and how to update conversation history.

Making Tool-Enabled API Calls
To enable Claude to use tools, you need to include a tools parameter in your API call. Here's how to structure the request:

messages = []
messages.append({
    "role": "user",
    "content": "What is the exact time, formatted as HH:MM:SS?"
})

response = client.messages.create(
    model=model,
    max_tokens=1000,
    messages=messages,
    tools=[get_current_datetime_schema],
)
The tools parameter takes a list of JSON schemas that describe the available functions Claude can call.

When integrating tools with Claude, you must update your conversation history helper functions (`add_user_message` and `add_assistant_message`).

Standard chat applications usually assume every message is a simple text string: `{"role": "user", "content": "Hello"}`. However, once tool calling is enabled, **message content changes from plain text strings to arrays of content blocks**.

---

### Why the Content Structure Changes

When tools are enabled, responses from Claude and inputs from the user become multi-block arrays containing different content types:

```
                  ┌──────────────────────────────────────────────┐
                  │    Claude Assistant Response (Multi-Block)   │
                  ├──────────────────────────────────────────────┤
                  │ 1. Text Block: "I will check the date..."   │
                  │ 2. Tool Use Block: get_current_datetime()    │
                  └──────────────────────┬───────────────────────┘
                                         │
                                         ▼
                  ┌──────────────────────────────────────────────┐
                  │     User Tool Result Input (Multi-Block)     │
                  ├──────────────────────────────────────────────┤
                  │ 1. Tool Result Block: "2026-08-02 19:12:00" │
                  └──────────────────────────────────────────────┘

```

#### 1. Assistant Responses (`response.content`)

When Claude decides to call a tool, its response content contains a list of objects—often combining a **text block** (explaining what it's doing) and a **tool_use block** (requesting function execution):

```python
# response.content emitted by the Anthropic SDK
[
    TextBlock(type="text", text="I'll check the current time for you."),
    ToolUseBlock(
        type="tool_use", 
        id="toolu_01A...", 
        name="get_current_datetime", 
        input={"date_format": "%H:%M"}
    )
]

```

#### 2. User Tool Results

When returning the result of a local Python function back to Claude, the user message must supply a **tool_result block** that links back to the original `tool_use_id`:

```python
[
    {
        "type": "tool_result",
        "tool_use_id": "toolu_01A...",
        "content": "19:12"
    }
]

```

---

### Upgrading Your Python Helper Functions

If your initial helper functions only accepted strings, passing `response.content` (a list of block objects) directly into them will cause formatting errors.

Here is how to update `add_user_message` and `add_assistant_message` in Python to seamlessly handle both simple strings and complex multi-block content lists:

```python
def add_user_message(messages: list, content) -> None:
    """Appends a user message to history. 
    Content can be a simple string OR a list of tool_result blocks.
    """
    if isinstance(content, str):
        messages.append({"role": "user", "content": content})
    else:
        # Handles list of tool_result dictionaries
        messages.append({"role": "user", "content": content})


def add_assistant_message(messages: list, response_content) -> None:
    """Appends an assistant message to history. 
    Accepts either a simple string or the full response.content block list.
    """
    if isinstance(response_content, str):
        messages.append({"role": "assistant", "content": response_content})
    else:
        # Crucial for tools: appends the full list of TextBlock and ToolUseBlock objects
        messages.append({"role": "assistant", "content": response_content})

```

---

### Complete Execution Pattern in Code

Notice how the updated helper functions simplify maintaining the full conversation history:

```python
messages = []

# 1. Add initial user query (simple string)
add_user_message(messages, "What time is it right now?")

# 2. Call API with tool schemas
response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=1000,
    messages=messages,
    tools=tools
)

# 3. Append Claude's multi-block response (contains text + tool_use blocks)
add_assistant_message(messages, response.content)

# 4. Check if a tool was requested
if response.stop_reason == "tool_use":
    tool_results = []
    
    for block in response.content:
        if block.type == "tool_use":
            # Execute local Python tool function
            result = get_current_datetime(**block.input)
            
            # Construct tool_result block
            tool_results.append({
                "type": "tool_result",
                "tool_use_id": block.id,
                "content": str(result)
            })
            
    # 5. Append user tool results (multi-block list) to history
    add_user_message(messages, tool_results)
    
    # 6. Re-query API to get final text answer
    final_response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1000,
        messages=messages,
        tools=tools
    )

```

---

### Key Takeaway

By allowing `add_user_message` and `add_assistant_message` to accept both **strings** and **lists**, your helper functions automatically preserve the exact block structures required by the API without needing separate history tracking functions for tool calls.

The key difference is that **"Sending tool results"** covers a **single tool interaction** (one request and one response), whereas **"Multi-turn conversations with tools"** introduces an **automated loop (`while True`)** to handle sequential tool dependencies (tool chaining).

---

### Core Comparison: Single-Turn vs. Multi-Turn Tool Flow

| Concept | **Sending Tool Results** (Previous Lesson) | **Multi-Turn Conversations with Tools** (This Lesson) |
| --- | --- | --- |
| **Operational Goal** | Learn how to unpack arguments, execute a local function, and format a single `tool_result` block. | Learn how to automate dynamic tool chaining where Claude calls multiple tools in sequence. |
| **Execution Horizon** | **1 Step:** User Query $\rightarrow$ `tool_use` $\rightarrow$ `tool_result` $\rightarrow$ Final Text. | **$N$ Steps:** User Query $\rightarrow$ `tool_use` #1 $\rightarrow$ `tool_result` #1 $\rightarrow$ `tool_use` #2 $\rightarrow$ `tool_result` #2 $\rightarrow \dots \rightarrow$ Final Text. |
| **Code Architecture** | Imperative, linear code script. | Automated **`while True` loop** that runs until `stop_reason != "tool_use"`. |
| **Prerequisite Refactoring** | Basic helper functions that pass raw strings. | Updated helpers (`add_user_message`, `chat`, `text_from_message`) that support full `Message` objects and multi-block lists. |

---

### Why Multi-Turn Tool Chaining Requires a Loop

In real-world applications, you cannot predict how many tools Claude will need to answer a prompt.

For example, when a user asks **"What day is 103 days from today?"**, Claude must execute a multi-tool chain:

```
┌──────────────────────────────────────────────────────────────┐
│ USER: "What day is 103 days from today?"                    │
└──────────────────────────────┬───────────────────────────────┘
                               │
                               ▼
┌──────────────────────────────────────────────────────────────┐
│ TURN 1: Claude calls tool #1 (get_current_datetime)           │
│         Server executes Python function & returns "2026-08-02"│
└──────────────────────────────┬───────────────────────────────┘
                               │
                               ▼
┌──────────────────────────────────────────────────────────────┐
│ TURN 2: Claude reads "2026-08-02" & calls tool #2            │
│         (add_duration_to_datetime with days=103)             │
│         Server executes Python function & returns "2026-11-13"│
└──────────────────────────────┬───────────────────────────────┘
                               │
                               ▼
┌──────────────────────────────────────────────────────────────┐
│ FINAL TURN: Claude has all required context.                 │
│             stop_reason is "end_turn" (Not "tool_use")       │
│             Claude returns final text: "November 13, 2026"   │
└──────────────────────────────────────────────────────────────┘

```

---

### The Automated Loop Architecture (`run_conversation`)

To handle an arbitrary number of tool execution turns automatically, the code wraps the execution in a continuous `while True` loop:

```python
from anthropic.types import Message

def run_conversation(messages: list, tools: list) -> list:
    """Automates multi-turn tool chaining until Claude produces a final text answer."""
    while True:
        # 1. Call API with complete history and tool schemas
        message = chat(messages, tools=tools)

        # 2. Append Claude's assistant turn (Message object) to history
        add_assistant_message(messages, message)

        # 3. Exit condition: Claude is finished using tools
        if message.stop_reason != "tool_use":
            break

        # 4. Execute all requested tools in the current turn
        tool_result_blocks = run_tools(message)

        # 5. Append tool results to history as a new user message
        add_user_message(messages, tool_result_blocks)

    return messages

```

---

### Essential Code Refactoring Summary

To support this multi-turn execution loop, four helper functions must be updated to accept full API objects rather than raw strings:

1. **`add_user_message(messages, content)`:** Accepts simple strings, `Message` objects, or lists of `tool_result` blocks.
2. **`add_assistant_message(messages, message)`:** Appends full `Message.content` block lists so historical `tool_use` IDs are preserved.
3. **`chat(messages, tools=...)`:** Accepts the `tools` list parameter and returns the complete `Message` object (not just string text).
4. **`text_from_message(message)`:** Utility function to extract and join all `TextBlock` elements from a multi-block `Message` object for rendering to the end-user.

This lesson demonstrates how **scalable** the tool-handling architecture becomes once your conversation loop is established. Adding $N$ new tools requires **zero changes** to your core execution loop—you simply follow a four-step registration pattern.

---

### The 4-Step Pattern for Adding New Tools

```
┌──────────────────────────────────────┐
│ 1. Write Python Function             │
│    def set_reminder(...):            │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│ 2. Define JSON Schema                │
│    set_reminder_schema = ToolParam(..)│
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│ 3. Add to API Tools Array            │
│    tools=[..., set_reminder_schema]  │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│ 4. Map in Router Dispatcher          │
│    elif name == "set_reminder": ...  │
└──────────────────────────────────────┘

```

---

### Code Implementation

#### 1. Pass All Schemas to the API Call

Update your `tools` list parameter so Claude knows about all available capabilities:

```python
tools = [
    get_current_datetime_schema,
    add_duration_to_datetime_schema,
    set_reminder_schema
]

```

#### 2. Update the `run_tool` Router Dispatcher

Map incoming tool names directly to their corresponding local Python implementations using `elif` branches or a dictionary map:

```python
def run_tool(tool_name: str, tool_input: dict):
    if tool_name == "get_current_datetime":
        return get_current_datetime(**tool_input)
    elif tool_name == "add_duration_to_datetime":
        return add_duration_to_datetime(**tool_input)
    elif tool_name == "set_reminder":
        return set_reminder(**tool_input)
    else:
        raise ValueError(f"Unknown tool name: {tool_name}")

```

---

### Multi-Tool Execution in Action

When a user submits a complex query like:

> *"Set a reminder for my doctor's appointment. It is 177 days after Jan 1st, 2050."*

Claude automatically breaks down the problem and executes the tools in sequence across turns:

1. **Turn 1 (Calculate Date):** Claude calls `add_duration_to_datetime(start_date="2050-01-01", days=177)`.
2. **Turn 1 Result:** Server returns `"2050-06-27"`.
3. **Turn 2 (Set Reminder):** Claude reads the return value and calls `set_reminder(title="Doctor's Appointment", date="2050-06-27")`.
4. **Turn 2 Result:** Server returns `"Reminder successfully set"`.
5. **Final Turn:** Claude responds with natural language confirming the appointment is set for June 27, 2050.

---

### Key Takeaway

Because the `while True` loop handles message building and execution dynamically, **scaling your bot's capabilities from 1 tool to 50 tools** only requires registering the new schema in the `tools` array and mapping its function call in `run_tool`.

Adding new capabilities to your AI assistant takes 4 simple steps:

1. **Write the Python function** (e.g., `set_reminder()`).
2. **Define its JSON schema** (`set_reminder_schema`).
3. **Pass the schema** into the API's `tools` list alongside your existing tools.
4. **Add an `elif` branch** to your central `run_tool()` router function.

Because your `while True` loop and message handlers are already modular, Claude will automatically determine which tools to call, in what order, and how many turns it needs to answer complex multi-step user prompts.

Fine-grained tool calling removes server-side JSON validation during API streaming, delivering partial argument chunks instantly as Claude generates them rather than waiting to buffer and validate complete top-level key-value pairs.

```
DEFAULT TOOL STREAMING (Buffered & Validated)
┌───────────────────────┐    Waits for full top-level key    ┌───────────────────────┐
│  Claude generates...  ├───────────────────────────────────►│  App receives burst   │
│  "abstract": "..."    │   (Buffered until valid JSON)     │  of validated chunks  │
└───────────────────────┘                                    └───────────────────────┘

FINE-GRAINED TOOL STREAMING (Unbuffered & Raw)
┌───────────────────────┐      No API buffering delay        ┌───────────────────────┐
│  Claude generates...  ├───────────────────────────────────►│  App receives immediate│
│  "abstract": "..."    │    (Requires local try-catch)     │  real-time token stream│
└───────────────────────┘                                    └───────────────────────┘

```

---

### Key Comparison

| Feature | Default Tool Streaming | Fine-Grained Tool Streaming (`fine_grained=True`) |
| --- | --- | --- |
| **API Buffering** | **Yes:** Buffers tokens until a complete top-level JSON key-value pair is generated. | **No:** Emits tokens immediately as Claude generates them. |
| **Server-Side Validation** | **Yes:** Ensures JSON key-value structures comply with your schema before sending. | **Disabled:** Transmits raw JSON streams instantly without server validation checks. |
| **User Experience** | Slight latency pauses followed by burst updates of completed fields. | Traditional real-time typing effect for tool inputs. |
| **Code Requirement** | Safe to parse `json.loads(snapshot)` reliably. | **Must handle exceptions** (`json.JSONDecodeError`) for incomplete or malformed JSON snapshots. |

---

### How to Implement Fine-Grained Tool Streaming

#### 1. Enable `fine_grained=True` in the API Request

Pass the parameter when initiating your stream:

```python
with client.messages.stream(
    model="claude-3-5-sonnet-20241022",
    max_tokens=1000,
    messages=messages,
    tools=tools,
    fine_grained=True  # Disables API-side JSON validation buffering
) as stream:
    for event in stream:
        if event.type == "input_json":
            # event.partial_json -> Latest raw token chunk
            # event.snapshot     -> Accumulated string build-up
            process_streaming_args(event.snapshot)

```

#### 2. Robust Local JSON Parsing

Because server-side validation is disabled, incomplete snapshots (e.g., `{"word_count": ` before the number is completed) will throw parsing errors. Wrap local parsing in a `try-except` block:

```python
import json

def process_streaming_args(snapshot_str: str):
    try:
        # Attempt to parse the live snapshot
        parsed_args = json.loads(snapshot_str)
        # Update UI or start early local processing
        update_ui_preview(parsed_args)
    except json.JSONDecodeError:
        # Expected during active streaming when tokens arrive mid-key or mid-value
        pass

```

---

### When to Use

* **Use Default Tool Streaming** for standard backends where robust data integrity matters and slight field-level buffering does not impact UX.
* **Use Fine-Grained Tool Streaming** for live UI progress indicators, character-by-character form auto-filling, or starting low-latency tasks before an argument payload finishes rendering.

* https://platform.claude.com/docs/en/agents-and-tools/tool-use/text-editor-tool

The **Text Editor Tool** is Anthropic's pre-defined tool for file system operations (viewing, replacing text, creating files, inserting lines, and undoing edits).

Unlike custom tools where you write both the schema and execution logic, Anthropic provides the standard schema via a tiny model-version stub (`"type": "text_editor_20250124"`), but **you must write the backend Python function** that executes the actual local file edits on your server.

---

### Key Breakdown

```
┌────────────────────────────────────────────────────────┐
│ ANTHROPIC API (Built-in Schema)                        │
│ Passes stub: {"type": "text_editor_20250124", ...}     │
│ Claude understands commands: view, create, str_replace │
└───────────────────────────┬────────────────────────────┘
                            │ Emits tool_use block
                            ▼
┌────────────────────────────────────────────────────────┐
│ YOUR BACKEND SERVER (Required Implementation)          │
│ You write local Python code to execute commands on     │
│ the actual file system (os, open(), read, write).      │
└────────────────────────────────────────────────────────┘

```

#### 1. How the Schema Works

Instead of writing a complex JSON schema manually, pass a small stub based on the model version, which Claude automatically expands internally:

```python
def get_text_edit_schema(model: str):
    if model.startswith("claude-3-7-sonnet"):
        return {"type": "text_editor_20250124", "name": "str_replace_editor"}
    elif model.startswith("claude-3-5-sonnet"):
        return {"type": "text_editor_20241022", "name": "str_replace_editor"}

```

#### 2. Your Responsibility

While Claude generates standard editing commands (`command: "str_replace"`, `path: "./main.py"`, `old_str: "..."`, `new_str: "..."`), **you must implement the local Python file-handling logic** inside your tool router to apply those changes to disk and return a `tool_result`.

#### 3. Why Use It

It enables Claude to act as an automated coding assistant or file manager inside your custom backend, CLI, or microservice without relying on an external IDE.

The **Web Search Tool** is a server-side, built-in tool that allows Claude to search the live web for current facts, research, and authoritative domain data without requiring you to write any search execution code.

Unlike custom tools, **Anthropic handles the entire execution and scraping pipeline**. You simply pass the schema stub, and Claude performs the queries internally and returns typed result/citation blocks.

---

### Key Capabilities & Mechanics

```
┌────────────────────────────────────────────────────────┐
│ YOUR CLIENT APP                                        │
│ Passes schema stub:                                    │
│ {"type": "web_search_20250305", "max_uses": 5}         │
└───────────────────────────┬────────────────────────────┘
                            │ API Call
                            ▼
┌────────────────────────────────────────────────────────┐
│ ANTHROPIC API & CLAUDE                                 │
│ 1. Recognizes need for live info                       │
│ 2. Executes web queries automatically on Anthropic side│
│ 3. Returns rich blocks: Text, ServerToolUse,           │
│    WebSearchToolResult, & Citations                    │
└────────────────────────────────────────────────────────┘

```

#### 1. Schema Configuration

You pass a pre-defined schema dictionary into the API `tools` array with execution constraints:

```python
web_search_schema = {
    "type": "web_search_20250305",
    "name": "web_search",
    "max_uses": 5,  # Caps max search iterations per turn
    "allowed_domains": ["nih.gov", "arxiv.org"]  # Optional: Restrict to trusted domains
}

```

#### 2. Fully Automated Execution

Unlike custom tools where `stop_reason == "tool_use"` forces your server to run local Python code, the web search tool executes **entirely on Anthropic's servers**. You receive structured output blocks directly:

* **`ServerToolUseBlock`:** Shows the search query string generated by Claude.
* **`WebSearchToolResultBlock` / `WebSearchResultBlock`:** Contains the URLs, titles, and snippets retrieved.
* **`Citation` blocks:** Links Claude's assertions directly to quoted source text and source URLs for UI rendering.

---

### Comparison: Web Search vs. Custom Tools vs. Text Edit

| Feature | Custom Tools (e.g., `set_reminder`) | Built-in Text Edit Tool | Built-in Web Search Tool |
| --- | --- | --- | --- |
| **Schema Definition** | Written manually by developer | Pass model-specific stub | Pass `web_search_20250305` stub |
| **Execution Code** | **Developer writes Python code** | **Developer writes Python code** | **Handled automatically by Anthropic** |
| **Org Console Toggle** | Not required | Not required | **Required in Anthropic console** |
| **Domain Whitelisting** | N/A | Local file path boundaries | `allowed_domains` array |

---

### Summary TL;DR

Enable it in the Anthropic Console, include the `web_search_20250305` schema in your API call, and Claude automatically searches the live web, extracts evidence, and returns cited answers without you writing a single line of web scraping code.

Claude includes a built-in web search tool that lets it search the internet for current or specialized information to answer user questions. Unlike other tools where you need to provide the implementation, Claude handles the entire search process automatically - you just need to provide a simple schema to enable it.

```json
web_search_schema = {
    "type": "web_search_20250305",
    "name": "web_search",
    "max_uses": 5,
    "allowed_domains": ["nih.gov"]
}
```

How can you tell if Claude wants to make another tool call in a conversation?
Look at the stop_reason field for `tool_use`


## Executive Summary: Extended Thinking with Claude

**Extended thinking** is Anthropic’s advanced reasoning capability for Claude models. It grants the model a dedicated "scratchpad" (thinking tokens) to process, plan, and analyze complex problems before generating its final output.

---

## Core Characteristics & Concepts

* **Response Output:** Returns two distinct blocks in the API response:
1. `thinking`: The internal step-by-step reasoning process.
2. `text`: The final output provided to the user.


* **Security Signature:** Extended thinking blocks carry a cryptographic signature token to verify that the reasoning output has not been altered or manipulated by third parties before being passed back into conversational context.
* **Redacted Thinking:** Occurs when internal safety mechanisms flag a portion of the thought process. Anthropic replaces the readable reasoning with an encrypted token so full conversation context remains intact across multi-turn interactions.

---

## API Configuration & Constraints

To implement extended thinking in the API, pass a `thinking` object in your request parameters:

```json
{
  "model": "claude-3-7-sonnet-20250219",
  "max_tokens": 4096,
  "thinking": {
    "type": "enabled",
    "budget_tokens": 2024
  }
}

```

### Parameter Rules

* **Budget Requirements:** The minimum `budget_tokens` threshold is **1,024 tokens**.
* **Token Limit Rule:** `max_tokens` must strictly exceed the `budget_tokens` value.
* **Feature Incompatibilities:** Extended thinking cannot be combined with **message pre-filling** or custom **`temperature`** settings.

---

## Strategic Trade-offs & Usage Guidance

| Advantage | Trade-off |
| --- | --- |
| **Higher Accuracy:** Superior performance on complex math, coding, and multi-step logic. | **Increased Latency:** Time-to-first-token and total generation time are longer. |
| **Process Transparency:** Visibility into how the model structured its resolution. | **Token Cost:** Thinking tokens consume API budget alongside output tokens. |

### Decision Rule

Run **prompt evaluation benchmarks** on standard prompting first. Enable extended thinking only when prompt engineering and structural optimizations fail to meet target accuracy metrics.

* https://platform.claude.com/docs/en/build-with-claude/extended-thinking#feature-compatibility


## Executive Summary: Image Support in Claude

Claude’s vision capabilities allow models to ingest, analyze, and reason over visual input alongside standard text prompts. Rather than relying on simple, surface-level classification, structured prompting methodologies enable Claude to execute tasks like spatial reasoning, multi-image comparisons, object counting, and domain-specific visual audits.

---

## Technical Specifications & Limits

To incorporate images into API requests, pass structured `image` content blocks inside the message array alongside standard `text` blocks.

```json
{
  "role": "user",
  "content": [
    {
      "type": "image",
      "source": {
        "type": "base64",
        "media_type": "image/png",
        "data": "iVBORw0KGgoAAAANSUhEUgAA..."
      }
    },
    {
      "type": "text",
      "text": "Analyze the attached image and list key details."
    }
  ]
}

```

### Key Technical Parameters

| Feature | Constraint / Specification |
| --- | --- |
| **Max Images per Request** | Up to **100 images** across all messages in a conversation turn. |
| **File Size Limit** | Maximum **5 MB** per image. |
| **Single Image Dimension Limit** | Maximum **8000px × 8000px**. |
| **Multi-Image Dimension Limit** | Maximum **2000px × 2000px** per image when sending multiple files. |
| **Input Formats** | Base64-encoded strings or accessible image URLs. |
| **Token Cost Calculation** | Estimated via the formula: $\text{Tokens} = \frac{\text{Width (px)} \times \text{Height (px)}}{750}$ |

---

## Best Practices for Image Prompt Engineering

Standard text prompt engineering principles apply directly to multimodal tasks. Naive queries like *"How many items are in this image?"* frequently lead to inaccuracies. To optimize performance on complex visual tasks:

* **Step-by-Step Methodologies:** Require the model to execute a systematic inspection (e.g., counting row-by-row or quadrant-by-quadrant) before giving a final answer.
* **Few-Shot Examples:** Supply sample image/answer pairs in the message history as reference points for scale, output style, and criteria.
* **Structured Assessment Rubrics:** For specialized applications (such as insurance risk analysis or defect inspection), provide clear criteria for categorizing visual evidence into explicit numerical or qualitative ratings.

## Executive Summary: Image Support in Claude

Claude’s vision capabilities allow models to ingest, analyze, and reason over visual input alongside standard text prompts. Rather than relying on simple, surface-level classification, structured prompting methodologies enable Claude to execute tasks like spatial reasoning, multi-image comparisons, object counting, and domain-specific visual audits.

---

## Technical Specifications & Limits

To incorporate images into API requests, pass structured `image` content blocks inside the message array alongside standard `text` blocks.

```json
{
  "role": "user",
  "content": [
    {
      "type": "image",
      "source": {
        "type": "base64",
        "media_type": "image/png",
        "data": "iVBORw0KGgoAAAANSUhEUgAA..."
      }
    },
    {
      "type": "text",
      "text": "Analyze the attached image and list key details."
    }
  ]
}

```

### Key Technical Parameters

| Feature | Constraint / Specification |
| --- | --- |
| **Max Images per Request** | Up to **100 images** across all messages in a conversation turn. |
| **File Size Limit** | Maximum **5 MB** per image. |
| **Single Image Dimension Limit** | Maximum **8000px × 8000px**. |
| **Multi-Image Dimension Limit** | Maximum **2000px × 2000px** per image when sending multiple files. |
| **Input Formats** | Base64-encoded strings or accessible image URLs. |
| **Token Cost Calculation** | Estimated via the formula: $\text{Tokens} = \frac{\text{Width (px)} \times \text{Height (px)}}{750}$ |

---

## Best Practices for Image Prompt Engineering

Standard text prompt engineering principles apply directly to multimodal tasks. Naive queries like *"How many items are in this image?"* frequently lead to inaccuracies. To optimize performance on complex visual tasks:

* **Step-by-Step Methodologies:** Require the model to execute a systematic inspection (e.g., counting row-by-row or quadrant-by-quadrant) before giving a final answer.
* **Few-Shot Examples:** Supply sample image/answer pairs in the message history as reference points for scale, output style, and criteria.
* **Structured Assessment Rubrics:** For specialized applications (such as insurance risk analysis or defect inspection), provide clear criteria for categorizing visual evidence into explicit numerical or qualitative ratings.


## Executive Summary: PDF Support in Claude

Claude natively ingests and analyzes PDF files as structured document content blocks. Beyond extracting standard raw text, Claude parses embedded visual charts, complex tabular data, figures, and spatial formatting across multi-page documents without requiring separate OCR pipelines.

---

## Technical Implementation & API Structure

To send a PDF to Claude via the API, encode the binary file using standard Base64 and pass a `document` content block in your `user` message array.

```json
{
  "role": "user",
  "content": [
    {
      "type": "document",
      "source": {
        "type": "base64",
        "media_type": "application/pdf",
        "data": "JVBERi0xLjQN..."
      }
    },
    {
      "type": "text",
      "text": "Summarize the key findings in this document."
    }
  ]
}

```

### Key Differences: PDF vs. Image Blocks

| Parameter | Image Block | PDF (Document) Block |
| --- | --- | --- |
| **Block Type (`type`)** | `"image"` | `"document"` |
| **Media Type (`media_type`)** | `"image/png"`, `"image/jpeg"`, etc. | `"application/pdf"` |
| **Source Type** | `base64` or URL | `base64` |

---

## Extraction Capabilities

* **Unstructured Text:** Full-text reading across complex multi-page layouts.
* **Embedded Visuals:** Parsing diagram labels, graphs, and inline figures alongside body text.
* **Tabular Data:** Extracting relational data from complex or borderless tables directly into structured formats.
* **Document Hierarchy:** Interpreting headings, callout boxes, footnotes, and overall page structure.

## Executive Summary: Citations in Claude

The **Citations** feature allows Claude to provide exact, verifiable references to source materials supplied in a prompt. By explicitly citing passage locations and verbatim source text, Claude transforms from a generative black box into a transparent research assistant, eliminating guesswork regarding whether a response stems from internal training data or supplied context documents.

---

## Technical Implementation & Enabling Citations

To enable citations, pass document content as a structured `document` block and include two essential configuration properties: `title` and `"citations": {"enabled": true}`.

### Request Payload Example (PDF Document)

```json
{
  "role": "user",
  "content": [
    {
      "type": "document",
      "source": {
        "type": "base64",
        "media_type": "application/pdf",
        "data": "<BASE64_ENCODED_PDF>"
      },
      "title": "earth_atmosphere.pdf",
      "citations": { "enabled": true }
    },
    {
      "type": "text",
      "text": "How did Earth's primary atmosphere form?"
    }
  ]
}

```

### Citation Configuration for Plain Text Documents

Citations are not restricted to PDFs. Plain text files can also be cited by passing `"type": "text"` and `"media_type": "text/plain"` within the `source` object:

```json
{
  "type": "document",
  "source": {
    "type": "text",
    "media_type": "text/plain",
    "data": "Primary text content goes here..."
  },
  "title": "earth_article_v1",
  "citations": { "enabled": true }
}

```

---

## Response Schema & Citation Properties

When enabled, Claude's response contains structured citation objects embedded within or attached to text content blocks.

| Field Name | Description | Output Type / Format |
| --- | --- | --- |
| `cited_text` | The exact excerpt from the source document supporting the statement. | String |
| `document_title` | The custom `title` provided in the input message. | String |
| `document_index` | The zero-based array position of the cited document. | Integer |
| `start_page_number` / `end_page_number` | Page range location (applicable to PDF documents). | Integer |
| Character Indices | Character start and end offsets (applicable to plain text sources). | Integer |

---

## Strategic Use Cases

* **Fact-Checking & Auditing:** Applications requiring direct human verification of source material (e.g., legal review, compliance, medical research).
* **Multi-Document Retrieval (RAG):** Disambiguating which specific document provided a given fact when querying across heterogeneous knowledge bases.
* **Interactive UI Annotations:** Building rich frontends with interactive inline footers, tooltips, or side-by-side split panels that highlight source passages as users hover over citations.

## Executive Summary: Prompt Caching in Claude

**Prompt Caching** allows Claude to store and reuse the preprocessed state (Key-Value/KV cache) of static context across multiple API requests. By skipping redundant tokenization, embedding generation, and attention matrix calculations for unchanged content, prompt caching reduces API latency by up to **85%** and input token costs by up to **90%**.

---

## Technical Mechanics & Implementation

To use prompt caching, insert a `cache_control` parameter into a content block or message turn. Anthropic uses this marker as a **cache breakpoint**.

```json
{
  "role": "user",
  "content": [
    {
      "type": "text",
      "text": "<LARGE_STABLE_DOCUMENT_OR_SYSTEM_INSTRUCTIONS>",
      "cache_control": { "type": "ephemeral" }
    },
    {
      "type": "text",
      "text": "Summarize key findings from section 2."
    }
  ]
}

```

### Prefix-Matching Rules

1. **Positional Dependencies:** Caching matches strict token prefixes starting from the beginning of the prompt. Place stable/static content (system instructions, tool definitions, reference materials) **before** dynamic content (user queries).
2. **Invalidation:** Changing even a single character within the cached prefix invalidates the cache from that breakpoint forward.
3. **Breakpoints Limit:** You can define up to **4 cache breakpoints** within a single request payload.

---

## Pricing & Cache Lifecycle

| Cache Operation | Price Relative to Standard Input | Behavior / Lifetime |
| --- | --- | --- |
| **Cache Write** | ~1.25x Base Price | Charged once when initial context is processed and cached. |
| **Cache Read** | ~0.10x Base Price (90% discount) | Charged for subsequent requests hitting the cached prefix. |
| **Cache Lifetime (TTL)** | Default ~5 minutes (Extended 1-hour available) | Timer resets on every cache hit; inactive contexts automatically expire. |

---

## Ideal Use Cases

* **Multi-Turn Agent Loops:** Caching conversation history and tool definitions reduces recurring input costs per tool iteration.
* **Document QA / RAG:** Repeatedly querying or analyzing long PDFs, manuals, or codebases.
* **System Instruction Sets:** Maintaining large system prompts or strict formatting guidelines across multiple distinct sessions.

## Executive Summary: Rules of Prompt Caching

Prompt Caching in Claude optimizes computational performance by storing preprocessed states (tokens, embeddings, attention calculations) of repeated context. Caching is **opt-in** via explicit cache control markers (**cache breakpoints**). To achieve cache hits, request content up to the breakpoint must match previous requests verbatim.

---

## Technical Specifications & Thresholds

| Rule Parameter | Specification |
| --- | --- |
| **Minimum Token Threshold** | Content prior to the breakpoint must be **$\ge$ 1,024 tokens** (combined total across system prompts, tools, and message history). |
| **Max Breakpoints per Request** | Maximum **4 cache breakpoints** per API payload. |
| **Cache Lifetime (TTL)** | Ephemeral cache entries persist for **5 minutes** to **1 hour** (refreshed automatically on every cache hit). |
| **Invalidation Sensitivity** | Strict prefix matching: modifying a single character (e.g., adding "please") invalidates the cache from that point forward. |

---

## Implementation & Cache Breakpoints

To set a cache breakpoint, expand standard message strings into full JSON block schemas with `cache_control`.

### JSON Block Schema Syntax

```json
{
  "role": "user",
  "content": [
    {
      "type": "text",
      "text": "<STATIC_DOCUMENT_OR_LONG_PROMPT_CONTEXT>",
      "cache_control": { "type": "ephemeral" }
    },
    {
      "type": "text",
      "text": "What are the primary conclusions in section 3?"
    }
  ]
}

```

---

## Canonical Processing Order & Supported Blocks

Claude processes request elements in a fixed internal sequence. Placing breakpoints higher up this hierarchy ensures downstream stability:

$$\text{Tool Definitions} \longrightarrow \text{System Prompts} \longrightarrow \text{Messages Array (User / Assistant / Tool Results)}$$

### Supported Cacheable Content Types

* **System Prompts:** Large instructions, rubrics, or global persona definitions.
* **Tool Specifications:** Complex schemas and multi-tool definition lists.
* **Multimodal Assets:** Base64 image and PDF document content blocks.
* **Conversation History:** Intermediate message turns or historical tool result blocks.

---

## Strategic Cache Placement Rules

1. **Place Breakpoints on Static Content:** Store stable items (tools and system prompts) in the cache before dynamic inputs (user queries).
2. **Span Across Turns:** A breakpoint in a later message turn automatically captures and caches all prior system prompts, tool schemas, and earlier message history up to that point.
3. **Multi-Breakpoint Cascading:** Use up to 4 breakpoints to isolate static reference tools (Breakpoint 1) from multi-turn conversation checkpoints (Breakpoints 2–4).

## Executive Summary: Code Execution & the Files API in Claude

Combining the **Files API** with the server-side **Code Execution tool** allows Claude to process, manipulate, and analyze complex datasets (such as CSVs, PDFs, and images) within an isolated computational sandbox. Rather than performing static text reasoning alone, Claude dynamically writes and executes Python code to carry out statistical analysis, data transformations, and custom file outputs (such as Matplotlib charts or transformed documents).

---

## The Files API: Decoupled Uploads

The Files API decouples file payload transport from main chat request messages. Instead of encoding heavy binary strings (Base64) into every message turn, files are uploaded beforehand to receive a unique file handle.

### Operational Advantages

* **Reusability:** Reference a single file ID across multiple API turns or separate conversation threads.
* **Payload Efficiency:** Reduces JSON payload sizes and avoids re-sending raw byte data in context.
* **Sandbox Mounting:** Serves as the primary data ingress/egress mechanism for the sandboxed code execution environment.

---

## Server-Side Code Execution Environment

Code execution is hosted and managed directly by Anthropic as a built-in server tool (`code_execution_20250522`), requiring no local sandbox setup by the developer.

```json
{
  "tools": [
    {
      "type": "code_execution_20250522",
      "name": "code_execution"
    }
  ]
}

```

### Sandbox Characteristics & Constraints

| Metric / Dimension | Environment Rule / Behavior |
| --- | --- |
| **Runtime Environment** | Isolated ephemeral Docker container running Python. |
| **Network Access** | **No network access** (isolated sandbox; cannot fetch external URLs or APIs). |
| **Execution Loop** | Multi-turn capability: Claude can write code, observe errors/outputs, adjust script logic, and re-execute within a single response turn. |
| **Data Ingress** | Via `container_upload` message content blocks referencing Files API `file_id` handles. |
| **Data Egress** | Output files (charts, plots, modified datasets) are saved to the container and exposed via `file_id` blocks. |

---

## Full End-to-End Workflow

```
[Local File (e.g. streaming.csv)] 
       │
       ▼ (1. Files API Upload)
[File ID: file_abc123]
       │
       ▼ (2. Send Message + Container Upload Block + Code Execution Tool)
[Claude Writes Python Code] ──► [Executes in Isolated Container] ──► [Captures Standard Output/Plot]
                                                                               │
                                                                               ▼
[User Downloads Generated Artifacts] ◄─────────────────────────────── [Return Output File ID]

```

### 1. File Upload & Message Assembly

```python
# Step 1: Upload input file to the Files API
file_metadata = client.files.create(
    file=open("streaming.csv", "rb"),
    purpose="answers"
)

# Step 2: Attach file_id via container_upload block
messages = [
    {
        "role": "user",
        "content": [
            {
                "type": "text",
                "text": "Analyze churn drivers and produce a summary chart."
            },
            {
                "type": "container_upload",
                "file_id": file_metadata.id
            }
        ]
    }
]

# Step 3: Trigger chat completion with code execution enabled
response = client.messages.create(
    model="claude-3-7-sonnet-20250219",
    max_tokens=2048,
    tools=[{"type": "code_execution_20250522", "name": "code_execution"}],
    messages=messages
)

```

---

## Response Structure & Downloading Generated Output

When Claude uses the execution sandbox, its response includes structured execution blocks:

* **Text Blocks:** Explanations and analytical summaries.
* **Server Tool Use Blocks:** The actual Python script created by Claude.
* **Code Execution Tool Result Blocks:** `stdout`, `stderr`, or return values.
* **Output File Blocks:** Content blocks of type `code_execution_output` containing `file_id` references for generated artifacts (e.g., PNG plots, CSV exports).

### Retrieval Example

```python
for block in response.content:
    if block.type == "code_execution_output":
        generated_file_id = block.file_id
        # Download generated file content via the Files API
        file_content = client.files.content(generated_file_id)
        with open("churn_analysis.png", "wb") as f:
            f.write(file_content.read())

```

---

## Beyond Data Analysis: Additional Capabilities

* **Image & Graphics Processing:** Resizing, cropping, filtering, or extracting metadata from visual assets using Python libraries.
* **Document Parsing & Conversion:** Reading raw text, generating PDF reports, or transforming structured files (JSON/XML/CSV).
* **Mathematical & Algorithmic Modeling:** Performing linear regressions, simulations, or complex statistical modeling.

## Executive Summary: Introducing Model Context Protocol (MCP)

The **Model Context Protocol (MCP)** is an open standard communication layer designed to connect AI applications (clients) to external data sources, tools, and prompt templates (servers). Rather than requiring developers to write, maintain, and execute custom API wrappers, schemas, and integration logic within their application codebase, MCP offloads these integrations to modular, reusable MCP servers.

---

## Architectural Shift: Traditional Tool Use vs. MCP

In standard tool calling, your application server bears the operational overhead of schema definition, API client maintenance, and tool execution handling:

```
[ Traditional Tool Calling ]
Client Application Server
 ├── Defines Tool Schemas (JSON)
 ├── Manages API Authentication
 ├── Executes HTTP Requests
 └── Parses & Handles Tool Results

```

With MCP, the integration logic is encapsulated inside dedicated MCP servers:

```
[ Model Context Protocol (MCP) ]
Client App Server ◄── (MCP Protocol) ──► Specialized MCP Server (e.g., GitHub, AWS, Postgres)
                                                ├── Standardized Tool Schemas
                                                ├── Native Tool Execution Logic
                                                └── Resource & Prompt Exposure

```

---

## Core Comparison: Direct Integration vs. MCP

| Architecture Dimension | Traditional Custom Tool Integration | Model Context Protocol (MCP) Architecture |
| --- | --- | --- |
| **Tool Schema Ownership** | Authored, maintained, and updated by the developer in application code. | Provided automatically by the MCP server. |
| **Execution Responsibility** | Handled manually on your backend server via custom function handlers. | Executed directly by the MCP server. |
| **Code Maintenance** | High; requires updates whenever third-party APIs modify their endpoints/schemas. | Low; updates to the MCP server automatically propagate schema/tool changes. |
| **Interoperability** | Tool implementations are tightly coupled to a single application code base. | Reusable across any application that speaks the standard MCP protocol. |

---

## The Three Core Capabilities of MCP Servers

MCP servers expose three distinct primitives to clients:

1. **Tools:** Pre-defined executable functions (e.g., creating a GitHub pull request, querying a database) that Claude can invoke.
2. **Resources:** Read-only data sources (e.g., file contents, database tables, system logs) that can be attached to Claude's context window.
3. **Prompts:** Pre-configured prompt templates and workflows exposed directly by the server.

---

## Key Misconceptions Clarified

* **"Is MCP a replacement for Tool Use?"**
No. MCP works **alongside** tool calling. Claude still uses tool calling under the hood to invoke functions; MCP simply standardizes *how* those tool definitions and execution handlers are provided to the model.
* **"Who builds MCP servers?"**
MCP servers can be created by third-party developers, open-source contributors, or service providers themselves (e.g., official servers provided by databases, cloud providers, or SaaS platforms).

Here is a comparison of **Model Context Protocol (MCP)**, **Standard Tool Use**, **LangChain**, and **Google Agent Development Kit (ADK)** across their core architectures, abstraction levels, and primary use cases.

| Dimension | Standard Tool Use (Function Calling) | Model Context Protocol (MCP) | LangChain | Agent Development Kit (ADK) |
| --- | --- | --- | --- | --- |
| **Primary Focus** | Native model parameter execution for structured function calls. | Standardized client-server protocol for connecting AI models to tools & data. | High-level framework for building LLM applications, chains, and multi-agent systems. | Enterprise framework for building, orchestrating, and deploying production AI agents. |
| **Abstraction Level** | **Low-level API** (Primitive request/response feature built into model APIs). | **Protocol Standard** (Transport layer specification: JSON-RPC over StdIO/SSE). | **High-level Framework** (Python/JS libraries & abstractions). | **High-level Framework** (Modular SDK for agent lifecycle & deployment). |
| **Tool Definition & Hosting** | You manually write tool schemas (JSON) and execute functions in your application backend. | MCP Servers host tool schemas, resource definitions, and execution handlers off-application. | Managed via Python/JS `@tool` decorators or pre-built community integrations. | Defined as modular tools/actions managed within agent runtime environments. |
| **Data & Context Access** | Limited to whatever text/JSON you manually pass in user/system messages. | Provides native **Resources** (read-only context streams) and **Prompts** in addition to Tools. | Relies on custom document loaders, vector stores, and RAG chains. | Integrated with enterprise data pipelines, memory stores, and context state management. |
| **Interoperability** | Model-specific (Schemas structured according to provider spec: Anthropic, OpenAI, Gemini). | **Universal Client-Server Standard** (Decouples tool providers from LLM applications). | Tied to the LangChain ecosystem (LangGraph, LangSmith). | Built for multi-agent orchestration within Google Cloud/Enterprise ecosystems. |
| **Maintenance Burden** | **High** (You update code whenever external API endpoints or schemas change). | **Low** (Maintained by MCP server authors; updates happen server-side). | **Medium** (Relies on community package updates and framework migrations). | **Low/Enterprise** (Supported with managed infrastructure and versioning). |
| **Best Used For** | Quick, simple single-app function calls (e.g., custom math functions, direct local API calls). | Reusable integrations across tools/data (e.g., sharing 1 GitHub/Postgres server across multiple apps). | Complex LLM workflows, custom chain logic, and rapid prototyping in Python/Node. | Production enterprise agents, complex multi-agent delegation, and cloud-native deployments. |

---

### Architectural Summary & Relationships

* **Tool Use** is the *primitive model mechanism*: the model returns a structured JSON output requesting a function execution.
* **MCP** is an *open protocol standard*: it replaces custom API glue code by letting any client connect to standardized, reusable MCP tool and resource servers.
* **LangChain** is an *application layer framework*: it helps structure your prompt logic, memory, vector stores, and orchestration (and can consume both native tools and MCP servers).
* **Agent Development Kit (ADK)** is an *agent orchestration platform/SDK*: it structures end-to-end agent workflows, multi-agent delegation, and enterprise deployment.