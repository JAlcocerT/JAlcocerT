---
title: "Jira 101"
date: 2025-09-08T00:20:21+01:00
draft: false
description: 'Jira DataModel with AI'
url: 'jira-data-model-with-ai'
tags: ["D&A","Azure DevOps ADO","Pandoc","PDF ipynb md","ER Diagram"]
---


To work with Jira, you need to understand their datamodel: https://developer.atlassian.com/server/jira/platform/database-schema/

Just in case you need to build a [PBi](https://jalcocert.github.io/JAlcocerT/about-powerbi/) x Jira related dashboard.

> Instead of a https://eazybi.com/products/eazybi-reports-and-charts-for-jira


https://marketplace.cursorapi.com/items/?itemName=MermaidChart.vscode-mermaid-chart

`CTRL Shift P` ->> Mermaid Preview Diagram


On the jira data model pdf, you will find jiradb.table_name, like `jiradb.issuetype`

**Intro**

I got a interesting task and could not avoid to think about how to do it with:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/#chat-with-your-database-using-langchain" title="LangChain chat with DB | Post" image="/blog_img/GenAI/langchain-chinook-sample.png" subtitle="How to create SQL queries automatically as per DB schema info" >}}
  {{< card link="https://github.com/JAlcocerT/jira-datamodel/tree/main" title="NEW Jira & Data Model Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github - Playing with PDF - ER Diagram PDF - Pandoc..." >}}
{{< /cards >}}


<!-- 
![MySQL CLI Install](/blog_img/GenAI/langchain-chinook-sample.png) -->




---

## FAQ

### PDF to md/json

Several open source tools can help convert complex PDFs, such as database schemas, into machine-readable formats like JSON, XML, or structured diagrams. Some notable open source options are:

- **Tabula**: A popular tool for extracting tables from PDFs into CSV, JSON, or Excel formats. It’s especially useful for schema diagrams presented as tables.[1]


[1](https://tabula.technology)


- **PDF-Extract-Kit**: A toolkit that uses layout and text analysis to extract structured data, including tables, from PDFs. It supports conversion to JSON, which can be processed further.[2]
- **PyMuPDF (fitz)**: A Python library to extract text, images, and layout information from PDFs, which can be combined with other tools to create structured data.
- **Camelot**: Similar to Tabula, designed to extract tables from PDFs into pandas DataFrames, then exported as JSON or CSV.[1]

https://camelot-py.readthedocs.io/en/master/

**OpenDataLab**

https://opendatalab.github.io/MinerU/demo/
https://github.com/opendatalab/MinerU

[2](https://github.com/opendatalab/PDF-Extract-Kit)


https://github.com/tabulapdf/tabula?tab=readme-ov-file

## Tech Tech Tech

## Md to PDF

There are several open source tools available to create PDFs from Markdown, including Python libraries that allow direct programmatic conversion.

Popular Open Source Tools for Markdown to PDF

| Tool/Library         | Description                                               | Python Support              |
|----------------------|-----------------------------------------------------------|----------------------------|
| **Pandoc**           | A powerful universal document converter supporting Markdown to PDF with styling | Can be called via subprocess from Python |
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

![alt text](/blog_img/AIBI/jira/pandoc.png)

{{< callout type="warning" >}}
Pandoc generating pdf from md is just amazing
{{< /callout >}}

Summary

- **Pandoc** is the most versatile and widely used.
- **WeasyPrint** offers pure Python capability for Markdown-to-HTML-to-PDF.
- For heavy customization or automation, combining Markdown libraries with PDF generation libs like ReportLab or browser-based rendering (Pyppeteer) works well.

Would specific example scripts or installation instructions be helpful?

## ipynb to PDF

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

Summary
- The most straightforward open source Python approach is **`jupyter nbconvert --to pdf`**, but it requires LaTeX.
- For LaTeX-free workflows, **notebook-as-pdf** is convenient.
- Online converters like **Ploomber Convert** offer fast, no-setup conversions.

If help is needed with installation or usage scripts, it can be provided.

[1](https://stackoverflow.com/questions/15998491/how-to-convert-ipython-notebooks-to-pdf-and-html)
[2](https://www.vertopal.com/en/convert/ipynb-to-pdf)
[3](https://convert.ploomber.io)
[4](https://www.reddit.com/r/IPython/comments/1eo5ipp/how_to_convert_ipynb_to_pdf_inside_jupyter/)
[5](https://theonlineconverter.com/convert-ipynb-to-pdf)
[6](https://www.youtube.com/watch?v=V5nl6vKM46U)
[7](https://nbconvert.readthedocs.io/en/latest/usage.html)
[8](https://www.kaggle.com/general/411755)
[9](https://www.reddit.com/r/IPython/comments/wk93py/ploomber_convert_a_free_online_tool_to_convert/)

### Jira ER

The attached files include a comprehensive database schema PDF generated by SchemaCrawler, along with numerous database tables and structures related to Jira. 

### Open Source Tools for Converting PDFs to Data Models

The diagram in your PDF is most likely a **"Database Schema Diagram"** or **"ER (Entity-Relationship) Diagram"**. This type of diagram visually maps out database tables, their relationships, keys, and constraints to represent how the data is structured in the system.

**In summary:**
- You can use open source tools like **Tabula**, **Camelot**, or **PDF-Extract-Kit** to convert the schema PDF into structured data for LLMs.
- The diagram is best classified as a **"Database Schema"** or **"ER Diagram"**.


### About ADO


* https://learn.microsoft.com/en-us/azure/devops/report/extend-analytics/data-model-analytics-service?view=azure-devops

* https://learn.microsoft.com/en-us/azure/devops/?view=azure-devops
Yes, Azure DevOps can be considered a **ticket management competitor** to Jira, as both platforms offer similar functionalities centered around work item tracking, project management, and team collaboration.

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

Summary
Azure DevOps and Jira both serve as comprehensive tools for managing software development projects and tickets, making them competitors in the ticket and work item tracking space, though Azure DevOps spans a wider scope as an end-to-end DevOps solution.


---

## FAQ



### How to create a Jira Data Model analyzer

{{< details title="My Initial requirements for the SliDevJSEditor for Cursor 📌" closed="true" >}}



{{< /details >}}

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