---
title: "Selfhosting Business Tools vs Coasean Ceiling"
date: 2026-09-01T23:20:21+01:00
draft: false
tags: ["Self-Hosting","Notes","Marketing","No Code","Link Shortener x Web Analytics"]
description: 'Are certifications still worth it?'
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