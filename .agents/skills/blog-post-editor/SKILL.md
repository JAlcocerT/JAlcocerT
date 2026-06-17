---
name: blog-post-editor
description: Improve Markdown/Hugo blog posts before publishing or before extracting Zettelkasten notes. Use when the user asks to improve, polish, edit, structure, clarify, prepare, or review a regular blog post while preserving a personal lab-notebook/digital-garden style; enforce useful reader structure such as TL;DR, intro, conclusion, FAQ, and Hugo shortcodes for optional details; especially use before the zettel-blog-notes skill when the user wants durable takeaways extracted later.
---

# Blog Post Editor

## Goal

Improve a post without sanding away the author's working style. Preserve the useful lab-notebook energy: commands, links, screenshots, experiments, side quests, and personal reasoning. Add enough structure that a reader can follow the journey and future notes can be extracted cleanly.

Use before `zettel-blog-notes` when both apply:

1. Edit the regular post with this skill.
2. Extract atomic notes with `zettel-blog-notes`.

## Editorial Principles

- Preserve voice. Keep direct, practical, technical phrasing.
- Preserve evidence. Do not delete useful commands, links, screenshots, or traces unless clearly irrelevant.
- Add synthesis. The main improvement is usually context, transitions, conclusions, and durable takeaways.
- Do not invent results. If the post does not support a claim, mark it as a question or TODO.
- Do not over-polish into corporate content. This blog should still feel like learning/building in public.

## Required Reader Structure

Every edited post should have these reader-facing parts unless the user explicitly asks for a fragment, index page, changelog, or other non-article format:

- `**TL;DR**` near the top, immediately after frontmatter and any lead image/cards.
- An intro section or opening paragraphs before the first deep technical section.
- A conclusion near the end that closes the loop on what changed, what worked, and what remains open.
- `## FAQ` for common questions, side notes, terminology, tool comparisons, or practical caveats.

Do not create empty boilerplate. If the source post lacks enough material for a section, write a short honest placeholder such as `TODO: add conclusion after testing X`, or make the section concise.

## Preferred Post Shape

Use this structure when the post is messy or under-shaped. Adapt headings to the topic, but preserve the required reader structure above.

```md
**TL;DR**

One sharp sentence: what changed, what was learned, or what the post proves.

## Intro

Why this mattered now. What project, constraint, or question triggered it.

## The Problem

What was unclear, broken, expensive, slow, risky, or worth testing.

## The Build / Test / Exploration

Commands, tools, screenshots, links, code, experiments.

## What I Learned

3-5 durable lessons.

## What I Would Do Differently

Tradeoffs, mistakes, next iteration.

## Durable Takeaways

- Reusable idea 1.
- Reusable idea 2.
- Reusable idea 3.

## Conclusion

What the experiment/post resolves, what decision it supports, and the next practical step.

## FAQ

Short answers to likely reader questions, definitions, caveats, and tool comparisons.

## References / Related

Links to repos, previous posts, notes, tools.
```

## Editing Workflow

1. Inspect frontmatter and body.
   - Keep `title`, `date`, `draft`, `tags`, `description`/`summary`, `url`, `math` unless a change is necessary.
   - If changing title or description, keep URL stable unless the user asks otherwise.

2. Identify the post promise.
   - Ask: "What should the reader understand or be able to do after this?"
   - If unclear, add or rewrite the TL;DR and intro.

3. Separate capture from synthesis.
   - Keep raw notes, but move long logs, command dumps, generated output, pasted assistant transcripts, large JSON/YAML blocks, install traces, and optional tangents into `{{< details >}}` blocks when they interrupt the reading flow.
   - Add a short explanation before and after raw blocks.
   - Keep the main path readable: summary first, details second.

4. Improve reader orientation.
   - Add transition sentences where the post jumps topics.
   - Rename vague headings like `## a`, `## New`, or `## FAQ` when a more specific heading is obvious.
   - Keep `FAQ` focused on genuine reader questions, appendices, tool comparisons, definitions, or caveats.

5. Add durable sections.
   - Add `## What I Learned` when the post has experiments or comparisons.
   - Add `## What I Would Do Differently` when there were tradeoffs or rough edges.
   - Add `## Durable Takeaways` at the end. These bullets should be thesis-like and ready to become zettels.
   - Add or improve `## Conclusion` and `## FAQ` before the final references/related section.

6. Link the knowledge graph.
   - Add `## Related Notes` only when notes already exist.
   - Use plain note URLs for stable site links:
     `- [Backups are recovery design, not storage](/notes/backups-are-recovery-design-not-storage/)`
   - Add `## Related Posts` or keep existing cards for narrative/source links.

7. Validate.
   - Run `hugo --minify --noBuildLock` after edits.
   - Fix shortcode, frontmatter, link, or Markdown errors.

## Hugo Shortcode Guidance

Use existing site conventions:

- `{{< details title="Sample additional info 📌" closed="true" >}} ... {{< /details >}}` for long logs, optional setup, command output, raw configs, local-only notes, troubleshooting branches, long external quotes, or background details that are useful but not needed on first read.
- Prefer specific titles such as `TR471 raw JSON result 📌`, `Optional Wireshark setup 📌`, `LAN scan notes 📌`, or `Verbose install log 📌`.
- Put one or two sentences before each details block explaining why it exists and what the reader should look for.
- Do not hide the article's main conclusion, core commands, or key evidence inside details blocks. Collapse supporting material, not the thesis.
- `{{< cards >}}` / `{{< card >}}` for prominent related resources already common in this repo: source repos, deployed demos, previous posts, tools, or project references that benefit from a title, image, and subtitle.
- Prefer cards when there are 2-4 related resources worth scanning visually. Keep plain bullet links for long reference lists or low-priority links.
- Use the local card pattern:

```md
{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Project_AIs" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/flask_sensor_display" title="Flask Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}
```

- Keep card titles short and concrete. Use subtitles for the practical value: source code, deployment notes, demo, benchmark, guide, or related experiment.
- Confirm referenced local images exist when adding new `image="..."` paths.
- Keep raw local/private URLs only if the post already uses them intentionally; otherwise prefer public repo or site links.

## What Not To Do

- Do not turn posts into landing pages unless the post already is one.
- Do not remove personality, jokes, or side notes unless they obscure the main point.
- Do not convert every command into prose.
- Do not add zettel files while using this skill unless the user explicitly asks for the zettel pass too.
- Do not edit unrelated posts during a single-post polish task.

## Final Report

When done, report:

- Which post files changed.
- The main structural improvements.
- Whether `Durable Takeaways` were added or improved.
- Build command and result.
