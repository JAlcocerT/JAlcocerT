---
title: "Jira 101 vs Azure DevOps"
date: 2025-09-08T00:20:21+01:00
draft: false
description: 'Jira DataModel with AI. Pandoc is great, more if you are not alergic to Latex.'
url: 'jira-data-model-with-ai'
tags: ["D&A","Azure DevOps ADO","Pandoc","PDF ipynb md","ER Diagram Mermaid","LandThatJob"]
---

**TL;DR**

As tech lead, you will need to analyze requirements/proposal to clients.

+++ Create the technical solution document in pdf and probably create some [ppt with slidev](#conclusions).

**Intro**

To work with Jira, you need to understand their datamodel: https://developer.atlassian.com/server/jira/platform/database-schema/

![alt text](/blog_img/AIBI/jira/jira-datamodel.png)

Just in case you need to build a [PBi](https://jalcocert.github.io/JAlcocerT/about-powerbi/) x Jira related dashboard.

> Instead of a https://eazybi.com/products/eazybi-reports-and-charts-for-jira

> > https://techcommunity.microsoft.com/blog/educatordeveloperblog/building-a-gantt-chart-using-power-bi/3605928

On the jira data model pdf, you will find jiradb.table_name, like `jiradb.issuetype`

I got a interesting task and could not avoid to think about how to do it with:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/#chat-with-your-database-using-langchain" title="LangChain chat with DB | Post" image="/blog_img/GenAI/langchain-chinook-sample.png" subtitle="How to create SQL queries automatically as per DB schema info" >}}
  {{< card link="https://github.com/JAlcocerT/jira-datamodel/tree/main" title="NEW Jira & Data Model Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github - Playing with PDF - ER Diagram PDF - Pandoc..." >}}
{{< /cards >}}


{{< callout type="info" >}}
I could not avoid thinking about the recent [ebook pdf/epub creation post](https://jalcocert.github.io/JAlcocerT/ai-driven-ebooks/)
{{< /callout >}}

So how about taking the requirements from PdM, understand Jira schema and propose some architectural solution?


<!-- 
![MySQL CLI Install](/blog_img/GenAI/langchain-chinook-sample.png) -->

**How the process looked**



**What I learnt**

For me, **Pandoc** is a tool that is here to stay.


1. Convert that .md into a pdf:

```sh
git clone https://github.com/JAlcocerT/jira-datamodel
cd jira-datamodel

#thank you, next
sed 's/✅/[OK]/g; s/❌/[X]/g; s/��/[CHART]/g' reply-overview-final.md > input-clean.md
pandoc input-clean.md -o requirements-jiraado-estimation8.pdf --pdf-engine=xelatex --toc
```

2. If you are not conviced yet, use Pandoc to create a pdf from md and have a cool theme

Like https://github.com/enhuiz/eisvogel

>  A pandoc LaTeX template to convert markdown files to PDF or LaTeX. 

3. You can potentially use Pandoc with CSS to generate your pdfs:

```sh
sudo apt-get install wkhtmltopdf
pandoc 1-3-summary-embedded.md -o styled-summary.pdf --pdf-engine=wkhtmltopdf
```


{{< callout type="info" >}}
MD + Pandoc *+Latex optinally* = MAGIC
{{< /callout >}}

And this can (and will) not only simplify your reports.

But it can be use for that cool LandThatJob.

because you havent forgot on the Overleaf CV generation, right?

> CV as a code, like with [overleaf](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#creating-a-responsive-cv) + [your story](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#historieta) + AI magic with a given offer link, aka scrap & process = you getting the job you want

---

## Conclusions

Whatever you have analyzed and created a md->pdf report with it...

You can make a quick PPT by tweaking the .md to the slidev way (with corporate background as well). 

Just see [this one](https://github.com/JAlcocerT/slidev-editor/blob/logtojseauth/slidev/slidev-sample-powerbi/slides.md) from [slidev-editor](https://github.com/JAlcocerT/slidev-editor).

```sh
#npm i -D playwright-chromium
npx slidev export --format pptx #ppt from md thanks to SliDevJS

npm init slidev #yarn create slidev
npm run dev
#npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
#rm -rf .git
npm run build
#cd ./dist
#npx serve

#npx playwright install
#npx slidev export --format pptx --output my-presentation.pptx
#npx slidev export --format pptx --range 1-5,8,10-12
```

Or to pdf: *which might not work*

```sh
#npx playwright install
npx slidev export --format pdf
npx slidev export --format pdf --range 1-5,8,10-12
```

> Remember about `http://localhost:3030/overview/` or `/exporter` where you will get the `.pdf` perfectly

![Slidev Exporter UI](/blog_img/data-experiments/slidev-exporter.png)

The discussion about **REST APIs** is a critical part of how these systems handle data and integrate with the outside world.

| Feature | Jira REST API | Azure DevOps (ADO) REST API |
| :--- | :--- | :--- |
| **Primary Query Language** | **$\text{Jira Query Language (JQL)}$** | **$\text{Work Item Query Language (Wiql)}$** |
| **Query Strength** | Extremely powerful for **searching/filtering work items** (Issues) based on fields, links, projects, and version data. | Excellent for **structured hierarchy queries** (parent/child, tree-based links) and complex team-based filters. |
| **API Architecture** | **Issue-centric.** The core API revolves around Issues and their fields. Other APIs are specific (e.g., Agile, GreenHopper, Software, Service Management). | **Service-centric (Modular).** Divided into separate, distinct REST APIs for each service: $\text{Boards}$, $\text{Repos}$, $\text{Pipelines}$, $\text{Test}$, $\text{Artifacts}$. |
| **Custom Fields Access** | Highly flexible. Custom fields are easily accessible and modifiable using **standard field ID** notation in the Issue API (e.g., `customfield_10001`). | Highly structured. Custom fields are accessed via a **field reference name** (e.g., `Custom.TargetReleaseName`) within the Work Item API. |
| **Updating Work Items** | Uses standard **JSON payloads** to update fields. Complex custom logic often requires Jira Automation or a Marketplace app/hook. | Uses the **JSON Patch standard** for updates, which defines specific operations ($\text{add}$, $\text{replace}$, $\text{remove}$) for precise changes. |
| **Extensibility Focus** | API is used primarily for **Data Exchange** and integrating with third-party, specialized tools (CI/CD, CRM, etc.). | API is used for **Full Automation** of the DevOps lifecycle (creating builds, deploying releases, managing repos, as well as managing work). |
\

* **Jira** favors a **query-first, data-flexible** approach. JQL is an incredibly human-readable and powerful language for pulling specific work items. The core API is focused on the issue as the unit of work.
* **Azure DevOps** favors a **structured, command-and-control** approach. Wiql is very strong for hierarchical queries, and the API is organized across the entire toolchain, allowing for deep automation of every part of the DevOps process (build, release, testing, and work).


---

## FAQ

The main difference between Pandoc and LaTeX is their purpose and function:

- **LaTeX** is a high-quality typesetting system primarily **used for creating well-formatted documents**, especially those with complex mathematical formulas, scientific papers, and academic publications.

It involves writing documents in a markup language focused on presentation, layout, and formatting control. LaTeX is a document preparation system rather than a conversion tool.

- **Pandoc** is a universal document converter. It converts text documents **between many markup formats** like: **Markdown, LaTeX, HTML, Word, and PDF**. Pandoc is often used to write content in a simpler markup (e.g., Markdown) and then convert it into well-structured formats including LaTeX for further processing or PDF generation. 

Pandoc can also convert LaTeX to other formats.

In summary:

- LaTeX is a typesetting system and markup language for creating documents with precise formatting. 
- Pandoc is a tool that converts documents from one markup format to another, including to and from LaTeX, enabling flexible workflows.

Thus, LaTeX is used for authoring and typesetting documents directly, while Pandoc acts as a bridge or converter supporting multiple document formats, including LaTeX, as one of its output options.[4][6][7]


### PDF to md/json

Several open source tools can help convert complex PDFs, such as database schemas, into machine-readable formats like JSON, XML, or structured diagrams. Some notable open source options are:

To read PDFs you can try Okular:*but the `ctrl+F` worked better for me with Zen or firefox*

```sh
#sudo apt install okular
```

* https://github.com/jzillmann/pdf-to-markdown

> MIT A PDF to Markdown converter



- **Tabula**: A popular tool for extracting tables from PDFs into CSV, JSON, or Excel formats. It’s especially useful for schema diagrams presented as tables.[1]


[1](https://tabula.technology)


- **PDF-Extract-Kit**: A toolkit that uses layout and text analysis to extract structured data, including tables, from PDFs. It supports conversion to JSON, which can be processed further.[2]
- **PyMuPDF (fitz)**: A Python library to extract text, images, and layout information from PDFs, which can be combined with other tools to create structured data.
- **Camelot**: Similar to Tabula, designed to extract tables from PDFs into pandas DataFrames, then exported as JSON or CSV.[1]

* https://camelot-py.readthedocs.io/en/master/

**OpenDataLab**

* https://opendatalab.github.io/MinerU/demo/
* https://github.com/opendatalab/MinerU

[2](https://github.com/opendatalab/PDF-Extract-Kit)


* https://github.com/tabulapdf/tabula?tab=readme-ov-file

### Md to PDF

There are several open source tools available to create PDFs from Markdown, including Python libraries that allow direct programmatic conversion.

Popular Open Source Tools for Markdown to PDF

| Tool/Library         | Description                                               | Python Support              |
|----------------------|-----------------------------------------------------------|----------------------------|
| **Pandoc**    ⭐     | A powerful universal document converter supporting Markdown to PDF with styling | Can be called via subprocess from Python |
| **Markdown-PDF**      | A Node.js tool to convert Markdown to PDF directly        | No direct Python binding but can be called from Python |
| **WeasyPrint**        | A Python library converting HTML/CSS to PDF, works with Markdown via HTML conversion | Yes, via Markdown to HTML + WeasyPrint |
| **md-to-pdf**         | Node.js-based with CSS support for styling                | No direct Python support   |
| **Python-Markdown + ReportLab** | Use Python-Markdown to convert MD to HTML, then ReportLab for PDF | Yes, requires some custom code |
| **Pyppeteer/Puppeteer**| Headless Chrome browser automation to render Markdown HTML to PDF | Yes, via Python bindings (pyppeteer) |

Recommended Python Workflow

1. Convert Markdown to HTML using **Python-Markdown** or **markdown2** library.
2. Use **WeasyPrint** to convert generated HTML to PDF with CSS styling.
3. Alternatively, use **Pandoc** command-line via Python subprocess for direct conversion.

Examples

- **Using WeasyPrint:**

* https://github.com/CourtBouillon/weasyprint-samples


```sh
pip3 install markdown weasyprint
python3 test.py
```

![alt text](/blog_img/AIBI/jira/weasyprint.png)

```python
import markdown
from weasyprint import HTML

md_text = """
# Title
This is **Markdown** content.
"""

html = markdown.markdown(md_text)
HTML(string=html).write_pdf("output.pdf")
```

- **Using Pandoc via Python subprocess:**

```python
import subprocess

subprocess.run(['pandoc', 'input.md', '-o', 'output.pdf'])
```

![Pandoc](/blog_img/AIBI/jira/pandoc.png)

{{< callout type="warning" >}}
Pandoc generating pdf from md is just amazing
{{< /callout >}}

And it can also be run via CLI:

```sh
#python3 test-pandoc.py

# Replace emojis with text equivalents
sed 's/✅/[OK]/g; s/❌/[X]/g; s/��/[CHART]/g' jira-pdm-req2tech.md > input-clean.md
pandoc input-clean.md -o jira-estimation.pdf --pdf-engine=xelatex --toc
```

Summary

- **Pandoc** is the most versatile and widely used.
- **WeasyPrint** offers pure Python capability for Markdown-to-HTML-to-PDF.
- For heavy customization or automation, combining Markdown libraries with PDF generation libs like ReportLab or browser-based rendering (Pyppeteer) works well.

Would specific example scripts or installation instructions be helpful?

### ipynb to PDF

To create a PDF from the content of a Jupyter Notebook (`.ipynb`), you can use several open source tools, many integrated with Python:

Common Methods and Tools

- **Jupyter nbconvert** (built-in):
  - Command-line tool or Python API to convert `.ipynb` to PDF directly.
  - Usually uses LaTeX as an intermediate, so having a LaTeX environment installed (e.g., TeX Live, MiKTeX) is recommended.
  - Command example:

```bash
pip install notebook-as-pdf
jupyter nbconvert --to pdf your_notebook.ipynb
```
- Can also convert to HTML first, then to PDF.

- **notebook-as-pdf**:
  - A Python package plugin for Jupyter to export notebooks as PDFs using headless Chrome, bypassing the LaTeX requirement.
  - Installation:
    ```
    pip install notebook-as-pdf
    ```
  - Usage inside notebook or command line.

- **Ploomber Convert**:
  - Free online converter tool to upload `.ipynb` and get PDF output preserving code, markdown, and outputs.
  - Useful if you prefer a no-installation route.

- **Manual Workflow**:
  1. Export notebook to HTML inside Jupyter or with:
     ```
     jupyter nbconvert --to html your_notebook.ipynb
     ```
  2. Convert HTML to PDF with tools like `wkhtmltopdf` or `WeasyPrint`.

Summary:

- The most straightforward open source Python approach is **`jupyter nbconvert --to pdf`**, but it requires LaTeX.
- For LaTeX-free workflows, **notebook-as-pdf** is convenient.
- Online converters like **Ploomber Convert** offer fast, no-setup conversions.


### Jira ER

The attached files include a comprehensive database schema PDF generated by SchemaCrawler, along with numerous database tables and structures related to Jira. 

* https://developer.atlassian.com/server/jira/platform/database-schema/

### Open Source Tools for Converting PDFs to Data Models

The diagram in your PDF is most likely a **"Database Schema Diagram"** or **"ER (Entity-Relationship) Diagram"**. This type of diagram visually maps out database tables, their relationships, keys, and constraints to represent how the data is structured in the system.

**In summary:**
- You can use open source tools like **Tabula**, **Camelot**, or **PDF-Extract-Kit** to convert the schema PDF into structured data for LLMs.
- The diagram is best classified as a **"Database Schema"** or **"ER Diagram"**.


### About ADO

Azure DevOps can be considered a **ticket management competitor** to Jira, as both platforms offer similar functionalities centered around work item tracking, project management, and team collaboration.

Similar Functionalities

- Both provide **issue/ticket tracking** to manage tasks, bugs, features, and user stories.
- Support for **agile project management** methodologies such as Scrum and Kanban, including sprint planning, boards, and backlogs.
- **Workflow customization** and status tracking for ticket lifecycles.
- Integration with **version control systems** (Azure DevOps with Git, TFVC; Jira with Bitbucket, Git, others).
- **Reporting and analytics** tools for project progress and team productivity.
- Collaboration features like comments, attachments, notifications, and user roles.

 Key Differences
- Azure DevOps is a broader **DevOps platform** integrating not only ticketing but also CI/CD pipelines, artifact management, and test management, tightly integrated by Microsoft.
- Jira is primarily focused on **issue and project tracking**, with a rich marketplace of add-ons to extend capabilities.


* https://learn.microsoft.com/en-us/azure/devops/?view=azure-devops
* https://learn.microsoft.com/en-us/azure/devops/report/extend-analytics/data-model-analytics-service?view=azure-devops

Azure DevOps and Jira both serve as comprehensive tools for managing software development projects and tickets, making them competitors in the ticket and work item tracking space, though Azure DevOps spans a wider scope as an end-to-end DevOps solution.


---

## FAQ



### How to create a Jira Data Model analyzer


I got this after the first iteration:


```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Starting jira-datamodel"

#sudo apt install gh
gh auth login
gh repo create jira-datamodel --private --source=. --remote=origin --push

#git init && git add . && git commit -m "Initial commit: Starting astro editor via NextJS and ToastUI" && gh repo create astro-editor --private --source=. --remote=origin --push
```