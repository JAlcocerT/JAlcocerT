---
title: "Career"
draft: false
description: 'Career tools and recap. From self-learning to D&A '
url: 'career'
---

There are many unknown unknowns in a career.

As someone said, we can just trace the dots backwards.

For the ones that would like to share their experience, creating and publishing an ebook is quite simple.

### Organizational Tools

You might need to do proper [note taking for your KB](https://jalcocert.github.io/JAlcocerT/knowledge-management/).

Stay in touch and [communicate](https://jalcocert.github.io/JAlcocerT/communication-management/) with your colleagues.

For [PMs](https://jalcocert.github.io/JAlcocerT/selfhosting-pm-tools-docker/) in need of a who does what, there are several tools for them.

> And Im not just talking about [Jira/ADO](https://jalcocert.github.io/JAlcocerT/jira-data-model-with-ai/).

For the *db alergic* ones, see:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/silverbullet" title="silverbullet | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/tasks-md" title="Tasks-md kanban board| Docker Config 🐋 ↗" >}}
{{< /cards >}}


### CV Tools

I have been using a lot of CV templates.

From word, to pptx and later I explored canva, which resulting pdf had some [parsing issues](https://fossengineer.com/open-source-curriculum/#checking-how-readable-is-a-cv-template) for some organizations.

Then, I switched gears to **cv as a code approach**: with [OSS CV builders](https://fossengineer.com/open-source-curriculum/) and with [Latex via overleaf](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#cv-as-a-code)

1. [YAMLResume](#yaml-resume)
2. Reactive Resume
3. Open Resume, which I forked [here](https://github.com/JAlcocerT/open-resume) with CI/CD powered Container

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/reactive-resume" title="Reactive Resume | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/open-resume" title="Open-Resume| Docker Config 🐋 ↗" >}}
{{< /cards >}}

4. Cool Latex CV Templates for Overleaf

And as some point I saw clear the setup: scrap offer + customize the cv code with LLMs as per your experience context, *aka [historieta](https://jalcocert.github.io/JAlcocerT/when-to-apply-for-a-job/#historieta)*:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/job-trends" title="Job Trends Repo" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="Scrapping job boards" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex" title="CV-lAItex" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Latex CV with Open AI LLM" >}}
{{< /cards >}}

5. YAML Resume

Control a yaml like: https://github.com/yamlresume/yamlresume/blob/main/packages/cli/resources/resume.yml

Get a PDF to apply to the offer you want before some AI agent take it.

Render content using LaTeX templates. I liked: https://yamlresume.dev/docs/layout/templates/moderncv-classic

Generate PDFs via XeTeX or Tectonic compilation engines

* https://github.com/yamlresume/yamlresume

> MIT |  Resumes as code in YAML, brought to you with ❤️ by PPResume. 