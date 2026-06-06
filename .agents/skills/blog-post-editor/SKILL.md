---
name: blog-post-editor
description: Improve Markdown/Hugo blog posts before publishing or before extracting Zettelkasten notes. Use when the user asks to improve, polish, edit, structure, clarify, prepare, or review a regular blog post while preserving a personal lab-notebook/digital-garden style; especially use before the zettel-blog-notes skill when the user wants durable takeaways extracted later.
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

## Preferred Post Shape

Use this structure when the post is messy or under-shaped. Adapt it when the existing post already has a good structure.

```md
**TL;DR**

One sharp sentence: what changed, what was learned, or what the post proves.

**Context**

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

## References / Related

Links to repos, previous posts, notes, tools.
```

## Editing Workflow

1. Inspect frontmatter and body.
   - Keep `title`, `date`, `draft`, `tags`, `description`/`summary`, `url`, `math` unless a change is necessary.
   - If changing title or description, keep URL stable unless the user asks otherwise.

2. Identify the post promise.
   - Ask: "What should the reader understand or be able to do after this?"
   - If unclear, add or rewrite the TL;DR and context.

3. Separate capture from synthesis.
   - Keep raw notes, but move long logs, command dumps, and generated output into `{{< details >}}` blocks when they interrupt the reading flow.
   - Add a short explanation before and after raw blocks.

4. Improve reader orientation.
   - Add transition sentences where the post jumps topics.
   - Rename vague headings like `## a`, `## New`, or `## FAQ` when a more specific heading is obvious.
   - Keep `FAQ` for genuine appendices, tool comparisons, or side notes.

5. Add durable sections.
   - Add `## What I Learned` when the post has experiments or comparisons.
   - Add `## What I Would Do Differently` when there were tradeoffs or rough edges.
   - Add `## Durable Takeaways` at the end. These bullets should be thesis-like and ready to become zettels.

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

- `{{< details title="..." closed="true" >}} ... {{< /details >}}` for long logs or optional setup.
- `{{< cards >}}` / `{{< card >}}` for prominent related resources already common in this repo.
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
