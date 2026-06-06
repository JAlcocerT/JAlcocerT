---
name: zettel-blog-notes
description: Extract Zettelkasten-style atomic notes from Markdown blog posts, especially Hugo content trees such as content/blog/*.md into content/notes/*.md. Use when the user asks to zettelkasten, zettel, atomize, distill, extract durable notes from blog posts, project logs, digital-garden entries, or technical notes; also use when maintaining a notes section with one reusable idea per note while skipping drafts, stubs, placeholders, and low-signal fluff.
---

# Zettel Blog Notes

## Goal

Turn long blog posts or project logs into short durable notes. Preserve the blog as the narrative/source layer. Create notes as the reusable idea layer.

Use this distinction:

- Blog post: "I built, tested, compared, or learned X."
- Zettel note: "X matters because Y."

## Workflow

1. Inventory candidate posts.
   - Prefer `content/blog/*.md` for Hugo sites.
   - Read frontmatter: `title`, `date`, `draft`, `description`/`summary`, `tags`, `url`.
   - Skip `draft: true` unless the user explicitly wants drafts.
   - Skip empty, tiny, placeholder, or low-signal files. As a rough default, skip posts under 500 body words unless a clear durable idea exists.

2. Detect whether a note is worth extracting.
   - Keep a post if it contains a reusable principle, decision rule, model, tradeoff, pattern, or operational lesson.
   - Skip posts that are only link dumps, TODO fragments, personal placeholders, or thin outlines.
   - Avoid duplicate notes if an existing `content/notes/*.md` already captures the same durable idea.

3. Extract one atomic idea by default.
   - Write one note per source post unless the user asks for deeper extraction or the post clearly contains multiple independent durable ideas.
   - Prefer a thesis title over a topic title.
   - Good: `Backups are recovery design, not storage`.
   - Weak: `Backup tools`.

4. Date the note from the source post.
   - The note `date` should match the related/inspiring post date, not today's extraction date.
   - For map notes covering a cluster, use the latest source date in that cluster unless the user asks otherwise.

5. Link back to source posts.
   - Use Hugo `relref` for source posts that are included in normal builds:
     `- [Source title]({{< relref "/blog/source-file.md" >}})`
   - If the source is future-dated or excluded from production builds, use its intended URL from frontmatter instead:
     `- [Source title](/source-url/)`
   - Do this because `relref` can fail for draft/future pages in normal Hugo builds.

6. Validate.
   - Run `hugo --minify --noBuildLock` when working in a Hugo repo.
   - Fix broken `relref`s, malformed frontmatter, or Markdown issues before finalizing.
   - If a dev server is already running, `--noBuildLock` avoids lock contention.

## Note Format

Use this shape:

```md
---
title: "Durable thesis title"
date: YYYY-MM-DD
tags: ["tag-one", "tag-two"]
description: "One sentence explaining the reusable idea."
---

Short statement of the idea.

One or two short paragraphs explaining why it matters, the tradeoff, or the decision rule.

Related:

- [Source post title]({{< relref "/blog/source-post.md" >}})
- [Optional related note]({{< relref "/notes/related-note.md" >}})
```

Keep notes short. A good default is 80-180 words after frontmatter. Do not paste long excerpts from the source post.

## Style Rules

- Write in the user's voice when possible: practical, direct, technical, and outcome-oriented.
- Prefer durable claims over summaries.
- Prefer concepts that can be reused in future posts.
- Do not over-academize. Use `content/notes/` unless the repo already has a different note section.
- Use ASCII unless the existing file clearly uses non-ASCII.
- Do not modify source blog posts unless explicitly asked.
- Do not fabricate source content. If a post is too thin, skip it and mention it was skipped.

## Coverage Reporting

When doing a broad pass, report:

- Number of posts inventoried.
- Number of substantial notes created.
- Number skipped and why: drafts, short placeholders, already covered, or low-signal.
- Build command and result.

For this user's Hugo blog, preserve the existing pattern:

- Notes live in `content/notes/`.
- The section landing page is `content/notes/_index.md`.
- The notes list layout is `layouts/notes/list.html`.
- Source post dates should drive note dates.
