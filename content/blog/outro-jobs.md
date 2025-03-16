---
title: "About Jobs. And LLM Engineers."
date: 2025-02-10
draft: false
tags: ["Dev"]
description: 'Is it a good moment to change jobs? A curriculum for LLM/ML Engineer?. Time to recap Scraps firecrawl API and Latex.'
url: 'when-to-apply-for-a-job'
---

New year, new **opportunities**.

> Or so some say.

## Data for Job Market

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/" title="Scrapping the Web" image="/videos/job_offers.png" subtitle="Post where I tinkered with scrapping tools." >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools" title="Scrapping Tools" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for using BS4, AI Scraps..." >}}
{{< /cards >}}


### Using BS4 and CRON

It was all very simple, very clear...

```sh
git clone https://gitlab.com/fossengineer1/cv-check
cd Scrap_Pracuj
```


{{< cards >}}
  {{< card link="https://gitlab.com/fossengineer1/cv-check" title="CV-Check" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Testing CVs with AI/LLMs" >}}
{{< /cards >}}

```sh
#git clone https://github.com/JAlcocerT/Scrap_Tools
```

**Exploring SQLite**

After you have been **running the script for a few days**...

```sh
python3 -m venv scrap_remote_offers_venv
source scrap_remote_offers_venv/bin/activate

#./run_pracuj.sh
#/home/reisipi/dirty_repositories/cv-check/Scrap_Pracuj/run_pracuj.sh

#just with python would do the same
python3 pracuj_v3.py
```

You would **see in the DB** that...

```sh
sudo apt install sqlite3
sqlite3 --version
```

{{< details title="See SQLiteDB Job History 📌" closed="true" >}}

We will have records:

```sh
sqlite3 ./job_offers_v3.db
#sqlite3 /home/reisipi/dirty_repositories/cv-check/Scrap_Pracuj/job_offers_v3.db

#SELECT * FROM your_table_name ORDER BY your_primary_key_column DESC LIMIT 5;

#SELECT name FROM sqlite_master WHERE type='table';
#.tables

SELECT * FROM job_offers;
SELECT * FROM job_offers ORDER BY timestamp DESC LIMIT 5;

#.quit
```
{{< /details >}}

...now there are... **no offers?!**


![BS4 not working](/blog_img/apps/job-history/bs4-job-not-working.png)


{{< callout type="warning" >}}
It seems that there was a **change on the web structure...**
{{< /callout >}}


### Fixing BS4 Driven Data

Going back to the url and inspecting it...

I could see that the `<span class="...` where the information was passed, had changed.

```py
offers_element = soup.find('span', class_='listing_j1fjdh9e') #just tweaking this
```

But making it work again for the remote data, was not that easy.


{{< details title="Only with bs4 📌" closed="true" >}}


It was all about using **the filtered link**:

```py
remote_selector = ("span", "class", "listing_j1p29tao")  # Or whatever the correct one is!
remote_offers = get_job_offer_count(remote_url, remote_selector)
```

> up to v4 and v6 again, its just with **BS4**.

{{< /details >}}

> So I switched gears

### Improving Reliability

Hello again, **FireCrawl**

{{< cards cols="1" >}}
  {{< card link="https://www.firecrawl.dev" title="FireCrawl API ↗ " >}}
  {{< card link="https://docs.firecrawl.dev/features/scrape#extracting-without-schema-new" title="API Docs ↗" >}}
{{< /cards >}}

Im using the latest feature, extract: https://docs.firecrawl.dev/features/extract

So now the v5 works with bs4 and firecrawl.

```py
# Load environment variables
load_dotenv()

# Initialize FirecrawlApp (do this *outside* the function)
app = FirecrawlApp(api_key=os.getenv("FIRECRAWL_API_KEY"))

class ExtractSchema(BaseModel):
    praca_zdalna: int

def get_zdalna_count(url):
    """Extracts 'praca zdalna' count using Firecrawl."""
    try:
        data = app.extract([url], {
            'prompt': 'Extract the number of praca zdalna offered on this website.',
            'schema': ExtractSchema.model_json_schema(),
        })

        try:
            praca_zdalna_count = data['data']['praca_zdalna']
            #print(praca_zdalna_count)  # Output: 2602

        except (KeyError, TypeError):  # Combine the exceptions for brevity
            print("Error: 'data' or 'praca_zdalna' key not found, or data is not a dictionary.")
            praca_zdalna_count = 0  # Or handle the error as you see fit.  Returning 0 is a common approach.
        return praca_zdalna_count

    except Exception as e:
        print(f"An error occurred: {e}")
        return 0  # Return 0 to indicate failure
```

### BS4 + FireCrawl + Telegram

What if...bs4 is the default and firecrawl just saves us provisionally?


### Server and CRON

**Cron Job** for the server.


{{< callout type="info" >}}
You might need **SSH Keys setup** 
{{< /callout >}}


```sh
#https://gitlab.com/-/user_settings/ssh_keys
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
cat ~/.ssh/id_rsa.pub

ssh -T git@gitlab.com
```

```sh
#export SSH_PRIVATE_KEY=~/.ssh/your_private_key
git clone git@gitlab.com:fossengineer1/cv-check.git
```

```sh
cd cv-check/Scrap_Pracuj
nano run_pracuj_v3.sh
pwd

chmod +x /home/reisipi/cv-check/Scrap_Pracuj/run_pracuj_v3.sh
./run_pracuj_v3.sh
```

```sh
#python -m venv scrap_remote_offers_venv
python3 -m venv scrap_remote_offers_venv

#Unix
source scrap_remote_offers_venv/bin/activate
#Windows
#.\scrap_remote_offers_venv\Scripts\activate
```

```sh
#pip install -U kaleido requests bs4
pip install -r requirements.txt
python3 pracuj_v6.py
```

Now, CRON will execute the script **every day**:

```sh
crontab -e
#0 0 * * * /path/to/your/run_pracuj.sh >> /path/to/your/logfile.log 2>&1
0 23 * * * /home/reisipi/cv-check/Scrap_Pracuj/run_pracuj_v3.sh
```

See that **the CRON job is there**:

```sh
crontab -l
#python3 pracuj_v3.py >> /home/reisipi/dirty_repositories/cv-check/Scrap_Pracuj/script_output.log 2>&1
```

---

Check [whats in there](https://jalcocert.github.io/JAlcocerT/scrap-and-chat-with-the-web/#old-school-scrapping)

```sh
#sudo apt install sqlite3
#sqlite3 --version
sqlite3 ./job_offers_v3.db

SELECT * FROM job_offers;
SELECT * FROM job_offers ORDER BY timestamp DESC LIMIT 5;
#.quit
```

**Have a plot.....and see hows the market**

```sh
cd Scrap_Pracuj
source scrap_remote_offers_venv/bin/activate
python3 query_pracuj_sqlite_v3c.py
```

```sh
# Execute the Python script
python3 pracuj_v6.py
#python pracuj_v6.py
python3 query_pracuj_sqlite_v3c.py
```


{{< callout type="info" >}}
Its all about **[Scrapping Tools](https://github.com/JAlcocerT/Scrap_Tools)** 💻 and [Curriculum Check](https://gitlab.com/fossengineer1/cv-check)
{{< /callout >}}



![Job Market Trend](/blog_img/data-experiments/job-market.png)

## Conclusions

There you have few ways to make scrapping.

Or how to make it better.

For more ideas, check also:

* https://github.com/dgtlmoon/changedetection.io

> Apache v2 | The best and simplest free open source web page change detection, website watcher, restock monitor and notification service. Restock Monitor, change detection. Designed for simplicity - Simply monitor which websites had a text change for free. Free Open source web page change detection, Website defacement monitoring, Price change notification



---

## FAQ

* https://github.com/microsoft/prompty
    * https://prompty.ai/
    * https://github.com/microsoft/prompty?tab=MIT-1-ov-file#readme

> Prompty makes it easy to create, manage, debug, and **evaluate LLM prompts** for your AI applications. Prompty is an asset class and format for LLM prompts designed to enhance observability, understandability, and portability for developers.


<!-- 
## What it is a LLM Engineer?



### We require

experience in projects related to natural language processing, machine learning or related fields
higher education
Proven experience working with LLM models such as GPT-3, GPT-4 or similar
proficiency in programming languages: Python and SQL
experience in LLMops - knowledge of the LangChain framework
excellent analytical skills, problem-solving skills and a passion for using technology to solve problems


### Additionally (as an advantage):
experience with machine learning frameworks such as TensorFlow, PyTorch or Hugging Face Transformers
knowledge of vector databases and their applications
good knowledge of natural language processing techniques: sentiment analysis, text classification and language generation -->

### New Jobs Out There

#### What is an LLM Engineer?

An LLM Engineer is a specialized software engineer who focuses on **building, deploying, and maintaining applications powered by Large Language Models** (LLMs).

They bridge the gap between cutting-edge AI research and practical, real-world applications.  Think of them as the architects and builders of the next generation of intelligent software.

Here's a breakdown of the key aspects of an LLM Engineer's role, based on your requirements:


{{< details title="Core Responsibilities 📌" closed="true" >}}




* **LLM Model Expertise:**  LLM Engineers possess a deep understanding of LLMs like GPT-3, GPT-4, and similar models. This includes knowledge of their architecture, strengths, weaknesses, and how to fine-tune and prompt them effectively.  They are not just users of LLMs, but understand the underlying mechanics.
* **Natural Language Processing (NLP) Proficiency:**  They have a strong foundation in NLP concepts and techniques.  This includes text preprocessing, feature engineering, sentiment analysis, text classification, language generation, and more.  They know how to prepare and manipulate text data for optimal LLM performance.
* **Programming Skills:**  Proficiency in Python is essential for working with LLMs and related libraries.  SQL skills are also crucial for data management and interaction with databases, which are often used to store and retrieve information used by LLMs.
* **LLMops:**  LLM Engineers are familiar with the principles of LLM Operations (LLMops).  This includes using frameworks like LangChain to streamline the development lifecycle, manage prompts, chain LLM calls, and integrate with other systems.  They understand how to deploy, monitor, and scale LLM applications.
* **Problem Solving and Analytical Skills:**  They are adept at analyzing complex problems, designing solutions using LLMs, and evaluating the performance of their applications. They can identify bottlenecks, debug issues, and optimize for efficiency and accuracy.
* **Project Experience:**  Practical experience in NLP or machine learning projects is a must.  They should have a portfolio of work that demonstrates their skills and understanding of the field.
* **Higher Education:** A strong educational background in computer science, machine learning, or a related field is typically required to grasp the complex concepts involved in LLM engineering.


{{< /details >}}



{{< details title="Desirable Skills (Advantages)  📌" closed="true" >}}

* **Machine Learning Frameworks:** Experience with TensorFlow, PyTorch, or Hugging Face Transformers is a significant advantage.  These frameworks are often used for fine-tuning LLMs or building related machine learning components.
* **Vector Databases:** Knowledge of vector databases (e.g., Pinecone, Weaviate) is highly valuable.  These databases are designed to store and efficiently retrieve vector embeddings, which are crucial for many LLM applications, like semantic search and retrieval augmented generation (RAG).
* **Advanced NLP Techniques:**  A deeper understanding of advanced NLP techniques, such as named entity recognition, text summarization, and machine translation, allows LLM Engineers to build more sophisticated applications.

{{< /details >}}

In essence, an LLM Engineer is a **specialized software engineer who combines expertise in LLMs, NLP, programming, and DevOps to create innovative and intelligent applications.**  

They are at the forefront of the AI revolution, building the next generation of software that can understand and generate human language.

#### What it is a ML Engineer?

**ML Engineer?**

A Machine Learning (ML) Engineer is a software developer who specializes in building, deploying, and maintaining machine learning systems. They **bridge the gap between data science and software engineering**, taking models developed by data scientists and turning them into scalable, production-ready applications.




{{< details title="Key responsibilities of an ML Engineer 📌" closed="true" >}}


* **Model Deployment:** Implementing and deploying machine learning models into production environments.
* **MLOps:** Building and maintaining infrastructure for machine learning pipelines (data ingestion, model training, deployment, monitoring).
* **Scalability and Performance:** Optimizing models and infrastructure for performance and scalability.
* **Data Engineering:** Working with data pipelines to ensure data quality and availability.
* **Software Development:** Writing production-level code for ML applications.
* **Monitoring and Maintenance:** Monitoring model performance and maintaining ML systems.
* **Collaboration:** Working closely with data scientists, software engineers, and other stakeholders.

**Analyzing the Requirements:**

**Strengths:**

* **Comprehensive Skill Set:** The requirements cover a broad range of essential ML engineering skills, including Python, SQL, ML algorithms, GenAI, and cloud technologies.
* **Emphasis on GenAI:** The focus on GenAI, especially prompt engineering and language modeling, reflects the growing importance of these technologies.
* **Production Focus:** The requirement for experience owning a feature from concept to production highlights the emphasis on building production-ready systems.
* **Cloud Proficiency:** The "Nice to Have" section emphasizes AWS skills, which are highly valuable in modern ML engineering.
* **Clear Communication:** The emphasis on written and verbal communication is crucial for a remote and asynchronous work environment.
* **Good mixture of data science, and data engineering skills.**

**Potential Challenges/Considerations:**

* **High Expectations:** The "Advanced knowledge" and "Expertise" requirements suggest a senior-level role.
* **Broad Tech Stack:** The range of technologies (TensorFlow, PyTorch, AWS services) might require a significant learning curve.
* **GenAI Specialization:** The strong focus on GenAI might limit the scope of work to specific types of projects.
* **Healthcare/Insurance Background:** While a "Nice to Have," a background in these industries might be preferred, potentially narrowing the candidate pool.
* **Asyncronous work environment:** Asyncronous work environments require very strong communication skills.

{{< /details >}}

### Creating a Responsive CV

I had some situations when I was using some cool curriculum design, yet the companies receiving it
where applying some parsing and their AI systems getting confused.

1. Then, a friend told me about **Overleaf**

> Overleaf is a collaborative **cloud-based LaTeX editor** used for writing, editing and publishing scientific documents. It partners with a wide range of scientific publishers to provide official journal LaTeX templates, and direct submission links. 

* https://www.overleaf.com/latex/templates/tagged/cv
    * https://www.overleaf.com/latex/templates?q=cv
* Combined with...themes! As seen at [reddit](https://www.reddit.com/r/cscareerquestionsCAD/comments/uufe0n/using_latex_resume_template_helped_me_a_lot/?rdt=39598) there are [many at github](https://github.com/topics/latex-resume-template)
    * https://github.com/jankapunkt/latexcv, like the [classic one](https://github.com/jankapunkt/latexcv/tree/master/classic)
    * https://github.com/jakegut/resume

> MIT | 👔 A collection of cv and resume templates written in LaTeX. Leave an issue if your language is not supported!


You can combine both worlds, take a theme, and edit it with overleaf:

* https://latexcv.pro/
* https://www.overleaf.com/latex/templates/jan-kusters-classic-cv/tvghvdsffwgs


**Alternatively**, do it locally

```sh
sudo apt install texlive-full
git clone https://github.com/jakegut/resume/
pdflatex <filename>.tex #to compile to PDF
```



{{< details title="Latex? Why not md? 📌" closed="true" >}}

**LaTeX:**

* **Purpose:**
    * LaTeX is a typesetting system, meaning it's designed for producing high-quality, professional-looking documents. It excels at **documentcomplex layouts**, mathematical formulas, and scientific documents.
    * It's widely used in academia, especially in fields like mathematics, physics, and computer science.
* **Key Features:**
    * Precise control over document formatting.
    * Excellent for typesetting complex mathematical equations.
    * Strong support for citations, bibliographies, and cross-referencing.
    * Produces high-quality PDF outputs.
* **Complexity:**
    * LaTeX has a steeper learning curve than Markdown. Its syntax can be more complex and require more detailed commands.

**Markdown:**

* **Purpose:**
    * Markdown is a lightweight markup language designed for **easy-to-read and easy-to-write** text formatting.
    * It's often used for web content, documentation, and simple text formatting.
* **Key Features:**
    * Simple and intuitive syntax.
    * Easy to learn and use.
    * Widely supported across various platforms and applications.
    * Often used for creating web content (e.g., README files, blog posts).
* **Complexity:**
    * Markdown is very easy to learn. Its syntax is designed to be minimal and human-readable.

**Key Differences:**

* **Focus:**
    * LaTeX: Focuses on precise document layout and typesetting.
    * Markdown: Focuses on simple text formatting and readability.
* **Complexity:**
    * LaTeX: More complex, with a steeper learning curve.
    * Markdown: Simpler, easier to learn.
* **Use Cases:**
    * LaTeX: Best for complex documents, scientific papers, and books.
    * Markdown: Best for web content, simple documents, and note-taking.
* **Mathematical equations:**
    * LaTex is the best for complex mathematical equations.
    * Markdown can display mathematical equations, but it usualy does this by embedding LaTex code.

In essence, if you need to create a highly formatted document with complex mathematical equations, LaTeX is the better choice. If you need to create simple, easy-to-read text documents or web content, Markdown is the more practical option.


{{< /details >}}

{{< cards >}}
  {{< card link="#conclusions" title="MultiChat UI" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="How the final multichat UI looks like" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex" title="CV-lAItex" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Latex CV with Open AI LLM" >}}
{{< /cards >}}



2. I was also exploring how to create a [CV with AI](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#cv-with-ai), based on [**open source CV as a Code**](https://fossengineer.com/open-source-curriculum)