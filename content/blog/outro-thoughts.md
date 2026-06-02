---
title: "Ive been in a wedding.."
date: 2026-05-31T09:20:21+01:00
draft: false
tags: ["Thoughts Orchestration","Herdr vs tmux","Git","Semantics","DSL"]
summary: 'And it has been quite difficult to explain what I do now for living.'
url: 'what-do-i-do'
---


**TL;DR**

**Intro**

There was no QR app around here, so the grandma smiles were lost.

It was quite interesting to see people I havent seen for like 10y

One of them, even has a home-lab too!

```sh
#claude --dangerously-skip-permissions -p "promptwhateverrrr" #yolo
```


codex --dangerously-bypass-approvals-and-sandbox

Alias:

codex --yolo

For non-interactive runs:

codex exec --dangerously-bypass-approvals-and-sandbox "your task"

This skips approval prompts and sandboxing, and the docs say to use it only inside an externally hardened or isolated environment. (developers.openai.com
(https://developers.openai.com/codex/cli/reference/))

A less extreme option is:

codex -s danger-full-access -a never

where -s danger-full-access changes the sandbox policy and -a never disables approval pauses. The docs also recommend preferring --add-dir or workspace-write when possible in
stead of forcing full access. (developers.openai.com (https://developers.openai.com/codex/cli/reference/))

Yes. Codex CLI has web search.

Use it like:

codex --search

or for non-interactive mode:

codex exec --search "Find the current docs for X and update this repo accordingly"

What it does: --search enables live web search for that run. The docs say it sets web_search = "live" instead of the default "cached" mode. (developers.openai.com
(https://developers.openai.com/codex/cli/reference)) In practice, the model gets a web-search tool and decides when to call it based on your prompt. You can nudge it directly: “search the web”, “verify current docs”, “find the latest release notes”, etc.

You can also configure search behavior. The config reference shows tools.web_search can be a boolean or an object with context_size, allowed_domains, and approximate location.
(developers.openai.com (https://developers.openai.com/codex/config-reference)) Example intent:

  Use it like:

  codex --search

  or for non-interactive mode:

  codex exec --search "Find the current docs for X and update this repo accordingly"

  What it does: --search enables live web search for that run. The docs say it sets web_search = "live" instead of the default "cached" mode. (developers.openai.com
  (https://developers.openai.com/codex/cli/reference)) In practice, the model gets a web-search tool and decides when to call it based on your prompt. You can nudge it directly:
  “search the web”, “verify current docs”, “find the latest release notes”, etc.
  tools.web_search = true

  or constrained:

  allowed_domains = ["developers.openai.com", "github.com"]


Public web results identify Jesús/Jesus Alcocer Tagua as a software/data engineer and data analytics specialist, originally from Spain and based in Poland. Exadel lists him as
  a speaker for a 2025 RAG meetup and describes him as having 6+ years of experience building data products, with a mechanical engineering background. (events.exadel.com
  (https://events.exadel.com/event/rag-powered-real-estate))

  He appears connected to Exadel: a LinkedIn post by Exadel People refers to him as a Data Science Engineer at Exadel presenting on schema-aware AI. (linkedin.com
  (https://www.linkedin.com/posts/exadel-people_sql-to-insight-pipeline-with-ai-activity-7432721791468367872-E83B))

  There are also public business registry/directory records for JAlcocerTech - Jesus Alcocer Tagua, a Poland-based sole proprietorship in software/programming and IT consulting,
  started in 2024. (owg.pl (https://www.owg.pl/ceidg/jalcocertech_jesus_alcocer_tagua_9%2C74%2C525268%2C5252685135?utm_source=openai))

  Older academic traces point to a 2014 University of Seville mechanical/industrial engineering thesis authored by Jesús Alcocer Tagua on computational modeling of bicycle tire-
  ground interaction. (biblus.us.es (https://biblus.us.es/bibing/proyectos/abreproy/90128/fichero/Memoria%2BTFG.pdf))

  So, in short: he seems to be a Spanish-born, Poland-based software/data engineer with a mechanical engineering background, working in data/AI and running a small software/IT
  business.



## Conclusions

I didnt mentiont about my bike trips across Europe, nor my adventure with fixing this old Civic.

Some knew about my chemistry experiments, but not about me growing tomatoes nor doing soap with recycled oil.