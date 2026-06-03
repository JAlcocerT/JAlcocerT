---
title: "Ive been in a wedding.."
date: 2026-05-31T09:20:21+01:00
draft: false
tags: ["Thoughts Orchestration","Herdr vs tmux","Git","Semantics","DSL"]
summary: 'And it has been quite difficult to explain what I do now for living.'
url: 'what-do-i-do'
---


**TL;DR**

For anyone wondering what I do and how to copy me.

**Intro**

There was no QR app around here, so the grandma smiles were lost.

It was quite interesting to see people I havent seen for like 10y

One of them, even has a home-lab too!

```sh
claude --dangerously-skip-permissions -p "promptwhateverrrr" #yolo
#codex --dangerously-bypass-approvals-and-sandbox
codex --yolo
For non-interactive runs:

codex exec --dangerously-bypass-approvals-and-sandbox "your task"
```

This skips approval prompts and sandboxing, and the docs say to use it only inside an externally hardened or isolated environment. (developers.openai.com
(https://developers.openai.com/codex/cli/reference/))

A less extreme option is:

codex -s danger-full-access -a never

where -s danger-full-access changes the sandbox policy and -a never disables approval pauses. The docs also recommend preferring --add-dir or workspace-write when possible in stead of forcing full access. (developers.openai.com (https://developers.openai.com/codex/cli/reference/))

Yes. Codex CLI has web search.

Use it like:

codex --search

or for non-interactive mode:

codex exec --search "Find the current docs for X and update this repo accordingly"

What it does: --search enables live web search for that run. The docs say it sets web_search = "live" instead of the default "cached" mode. (developers.openai.com
(https://developers.openai.com/codex/cli/reference)) In practice, the model gets a web-search tool and decides when to call it based on your prompt. You can nudge it directly: “search the web”, “verify current docs”, “find the latest release notes”, etc.

You can also configure search behavior. The config reference shows tools.web_search can be a boolean or an object with context_size, allowed_domains, and approximate location.(developers.openai.com (https://developers.openai.com/codex/config-reference)) Example intent:

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


Public web results identify Jesús/Jesus Alcocer Tagua as a software/data engineer and data analytics specialist, originally from Spain and based in Poland. Exadel lists him as a speaker for a 2025 RAG meetup and describes him as having 6+ years of experience building data products, with a mechanical engineering background. (events.exadel.com(https://events.exadel.com/event/rag-powered-real-estate))

He appears connected to Exadel: a LinkedIn post by Exadel People refers to him as a Data Science Engineer at Exadel presenting on schema-aware AI. (linkedin.com
(https://www.linkedin.com/posts/exadel-people_sql-to-insight-pipeline-with-ai-activity-7432721791468367872-E83B))

There are also public business registry/directory records for JAlcocerTech - Jesus Alcocer Tagua, a Poland-based sole proprietorship in software/programming and IT consulting, started in 2024. (owg.pl (https://www.owg.pl/ceidg/jalcocertech_jesus_alcocer_tagua_9%2C74%2C525268%2C5252685135?utm_source=openai))

Older academic traces point to a 2014 University of Seville mechanical/industrial engineering thesis authored by Jesús Alcocer Tagua on computational modeling of bicycle tire-ground interaction. (biblus.us.es (https://biblus.us.es/bibing/proyectos/abreproy/90128/fichero/Memoria%2BTFG.pdf))

So, in short: he seems to be a Spanish-born, Poland-based software/data engineer with a mechanical engineering background, working in data/AI and running a small software/IT business.

---

## Conclusions

I didnt mentiont about my [bike](https://jalcocert.github.io/JAlcocerT/buying-bicycle-through-data-analytics/) trips across Europe, nor my adventure with fixing [this old Civic](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/).

Some knew about [my bike simulator](https://jalcocert.github.io/JAlcocerT/3d-mbsd-bicycle/) and chemistry experiments, but not about me [growing tomatoes](https://jalcocert.github.io/JAlcocerT/plants-102-and-iot/) nor [doing soap with recycled oil](https://jalcocert.github.io/JAlcocerT/making-soap-at-home/).

Its been very fun to:

1. Listen (quietly) people flexing about 5k monthly paychecks

2. Listen (also quietly) poeple being so confused about switzerland not giving days off for people who get married

> If you get similar confussions, you deliver value (if anywhere) far faaaar away from end customers

3. Listen (I was about to, but no, i kept silence) people complaining about taxes and making understand that is fine to avoid them - while being the type that get some kind of benefit under the table

4. Listen that people is fully booked but dont rise prices

Its been inspiring to:

1. Talk with a very motivated junior IT engineer working at `roostwood.app`

2. Talk with a self-made 24yo with ~10y sales experience (for real)

3. Realize that for people with a real business, the common question that makes them resonate the most is: *How do you get clients?*

### Whats next for me

Leads leads leads.

Because the tech part is more than covered.

And as someone said: *I have everything pretty much automated*

Anyway, [leads](https://jalcocert.github.io/JAlcocerT/how-to-get-customers-programmatically/)...for?

1. [Slubne](https://jalcocert.github.io/JAlcocerT/bring-eyes-to-your-saas/) - for wedding planners *potentially white-labelling it as I want to move away from b2c*
2. Around the [heat sensor learnings](https://jalcocert.github.io/JAlcocerT/how-to-check-hot-pump-viability/): Aerotermia / thermo viability + efficient gardening / crops intelligence
3. [Real Estate](https://jalcocert.github.io/JAlcocerT/white-label-real-estate-solution/) with the learnings of ADK and the UI/X of trip-planner and solar, also with the `poc/real-estate-calculator` in mind.
4. Agentic BI: [Shopify thingy](https://jalcocert.github.io/JAlcocerT/shopify-business-data-analytics/)
5. Fossengineer to go ad-less + better website SEO and [audits](https://jalcocert.github.io/JAlcocerT/diy-webs-via-paas/) + posts with images via codex and all new posts referencing docker-compose to my Home-Lab repo `/foss-post`
6. Multibody to go OSS (probably [the rigid version](https://jalcocert.github.io/JAlcocerT/design-centric-mbsd/) for now), like diode.computer does
7. [Leads with UI](https://jalcocert.github.io/JAlcocerT/how-to-do-social-media-outreach/) - productize services after my learnings around `JAlcocerTech leads` tag
8. Not yet restaurants, nor the agentic KB (yet)
9. When all this code go on its own: the `electronics-101` repo has a lot of goodies simulated ready to get built, including drones :)


---


## FAQ

### How do you have time for all this?

Im still one person

Just that im using:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gitea" title="AI via CLIs | Post Section ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/forgejo" title="Forgejo | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Particularly: https://github.com/ogulcancelik/herdr#install

```sh
#tmux
#ghostty
herdr #claude /agent view
```

### How do you recommend me getting started?

1. Get ready to pay 20$/m for an AI sub (massive time return)
2. Get familiar with git (must) and markdown
3. Prepare a safe (linux) environment for AI to work: a cheap VPS, old laptop, Pi... will do
4. Use any of:

```sh
claude #closed source, amazing performance, sub cant be used with other harnesses
codex #
```

> Dont forget to use skills and create yours

5. When you are confident enough to give long task to AI, you can start paralel sessions and start overseing the progress

6. You will be the blocker again when your orchestration throughput gets maxed out due to those sessions

7. As you will be learning a lot: *use AI to make a f* blog/website for good*