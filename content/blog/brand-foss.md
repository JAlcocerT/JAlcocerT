---
title: "Improving a Blog"
date: 2026-06-01T23:20:21+01:00
draft: false
tags: ["FOSS","RoadMap26","Codex x HUGO","JAlcocerTech WebAudits","Broken Links + Sitemap","PocketBase x Leads"]
description: 'Some SEO x Agent Engine Optimization (AEO). With Image generation.'
url: 'a-better-fossengineer'
---


The kind of thing i use now to test websites for people i Just met: `https://spanishflowacademy.com/`

If [these audits show a problem](https://jalcocert.github.io/JAlcocerT/diy-webs-via-paas/) you might need:

 set -a
  . ./.env
  set +a

  uv run --with openai --with pillow \
    "${CODEX_HOME:-$HOME/.codex}/skills/.system/imagegen/scripts/image_gen.py" \
    generate-batch \
    --input tmp/imagegen/playwright-symphony-komodo-cover-prompts.jsonl \
    --out-dir output/imagegen/covers \
    --concurrency 3

https://github.com/lycheeverse/lychee
**Tl;DR**

It was time to stop those ads.

And to use:


1. https://diy.jalcocertech.com
2. https://webaudit.jalcocertech.com/
3. https://ebooks.jalcocertech.com/



https://github.com/openai/skills
An excuse to try the free web audit engine
https://developers.openai.com/codex/pricing


**Intro**

I made a review on the OSS 'portfolio'.

https://developers.openai.com/showcase
https://developers.openai.com/blog/designing-delightful-frontends-with-gpt-5-4


Could foss/ still be HUGO and look as sleek?


{{< callout type="warning" >}}
Id keep JAMstack to avoid Mythos and similar coming inside my homelab :)
{{< /callout >}}

```sh
dig fossengineer.com any
#ping fossengineer.com
```
Not [with codex cli](https://github.com/JAlcocerT/docs-testing/tree/master) this time, but directly with IDE:

```sh
git init && git add . && git commit -m "Initial commit: better ai docs" && gh repo create fossengineer-hugo --private --source=. --remote=origin --push
```

{{< cards >}}
  {{< card link="https://gitlab.com/fossengineer/fossengineer" title="foss | Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/fossengineer-hugo" title="foss reloaded x HomeLab integration | Github ↗" icon="github" >}}
{{< /cards >}}

HUGO Vibe Coded Re-build

To offer this via fossengineer, I can try: *these are next steps*

1. As is (later removing adsense)
2. The local KB offer
3. The webpage offer
4. Finally remodel the webpage to avoid the shape of a blog, as is more a news/docs one - vibe coding ofc.

With that remota data (yaml) fetching from the home-lab repo.



### Posts

### Videos

https://jalcocert.github.io/JAlcocerT/oss-automatic-docs-and-tech-video/#about-foss---repo-to-video

---


## Conclusions

 Web CMS stuff: *Strapi directus...*?

This was [how i Tinkered](https://youtu.be/UFxlU9gMp_A) last year actually.

But I said no more to custom CMS integrations.

Actually: Not doing more (DFY) websites for others.

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com/" title="Consulting | DWY ↗" icon="book-open" >}}
{{< /cards >}}

---

## FAQ

### Detecting Broken Links

{{% details title="How to use Lychee for broken link detection 🚀" closed="true" %}}

I like [Lychee](https://github.com/lycheeverse/lychee) for static sites because it checks links from Markdown, HTML, and already deployed websites.

For a quick check of the live GitHub Pages entry page:

```sh
lychee --verbose --no-progress https://jalcocert.github.io/JAlcocerT
```

My first run against the deployed entry page found:

```txt
471 Total
464 Unique
469 OK
2 Errors
1 Redirect
```

The two broken links were missing favicon assets:

```txt
https://jalcocert.github.io/JAlcocerT/favicon.svg
https://jalcocert.github.io/JAlcocerT/favicon-dark.svg
```

I fixed those by publishing the existing `JAT.svg` logo as `static/favicon.svg` and `static/favicon-dark.svg`, which Hugo serves from the site root.

When I tried the full sitemap-based external scan, lychee started checking outbound links from every deployed page. That surfaced rate-limit/backoff warnings from hosts linked in the blog, including `github.com` and `whois.jalcocertech.com`. The `whois.jalcocertech.com` link comes from older blog content, not from GitHub Pages hosting itself.

For the full deployed Hugo site, use the sitemap as the input list:

```sh
curl -sS https://jalcocert.github.io/JAlcocerT/sitemap.xml \
  | rg -o '<loc>[^<]+' \
  | sed 's#<loc>##' \
  > /tmp/jalcocert-urls.txt

GITHUB_TOKEN=your_token_here \
lychee --cache --no-progress --max-concurrency 16 --max-retries 0 --files-from /tmp/jalcocert-urls.txt
```

The token helps when the site has many GitHub links. If a third-party host keeps rate-limiting automated checks, add it to `.lycheeignore` or use `--exclude`.

For a Hugo workflow, first build the site and then scan the generated HTML:

```sh
hugo
lychee --root-dir public "public/**/*.html"
```

If some URLs are expected to fail, redirect, throttle bots, or require auth, keep them out of the noise with a `.lycheeignore` file:

```txt
# .lycheeignore
https://example.com/private-area
https://www.linkedin.com/.*
```

And for GitHub Actions, I placed the workflow at `.github/workflows/links.yml`:

```yaml
name: Links

on:
  push:
    branches: ["main"]
  workflow_dispatch:
  schedule:
    - cron: "21 4 * * 1"

permissions:
  contents: read

jobs:
  lychee:
    runs-on: ubuntu-latest
    env:
      SITE_URL: https://jalcocert.github.io/JAlcocerT
    steps:
      - uses: actions/checkout@v4

      - name: Build sitemap URL list
        run: |
          curl -fsSL "${SITE_URL}/sitemap.xml" \
            | grep -o '<loc>[^<]*' \
            | sed 's#<loc>##' \
            > jalcocert-urls.txt

      - uses: lycheeverse/lychee-action@v2
        continue-on-error: true
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          args: --cache --no-progress --max-concurrency 16 --max-retries 0 --files-from jalcocert-urls.txt
```

{{% /details %}}


### Scanning SiteMaps

Sitemap URL:

  https://jalcocert.github.io/JAlcocerT/sitemap.xml

  RSS feed for latest blog posts:

  https://jalcocert.github.io/JAlcocerT/blog/index.xml

  Curl latest 10 posts:

```sh
sudo snap install ripgrep --classic

curl -sS https://jalcocert.github.io/JAlcocerT/blog/index.xml \
  | rg -o '<item><title>[^<]+</title><link>[^<]+</link><pubDate>[^<]+</pubDate>' \
  | sed -E 's#<item><title>([^<]+)</title><link>([^<]+)</link><pubDate>([^<]+)</pubDate>#- \1 | \3 | \2#' \
  | head -n 10
```
  Current top result from that command is:

  - Vacations with Python + ADK | Tue, 02 Jun 2026 09:20:21 +0100 | https://JAlcocerT.github.io/JAlcocerT/py-vacations/

  To curl all URLs from the sitemap:

```sh
  curl -sS https://jalcocert.github.io/JAlcocerT/sitemap.xml \
    | rg -o '<loc>[^<]+' \
    | sed 's#<loc>##'
  ```


### Robots and Agents


https://github.com/JAlcocerT/JAlcocerT/actions/runs/26818896547

Sitemap URL:

  https://jalcocert.github.io/JAlcocerT/sitemap.xml

  RSS feed for latest blog posts:

  https://jalcocert.github.io/JAlcocerT/blog/index.xml

  Curl latest 10 posts:

```sh
sudo snap install ripgrep --classic

curl -sS https://jalcocert.github.io/JAlcocerT/blog/index.xml \
  | rg -o '<item><title>[^<]+</title><link>[^<]+</link><pubDate>[^<]+</pubDate>' \
  | sed -E 's#<item><title>([^<]+)</title><link>([^<]+)</link><pubDate>([^<]+)</pubDate>#- \1 | \3 | \2#' \
  | head -n 10
```
  Current top result from that command is:

  - Vacations with Python + ADK | Tue, 02 Jun 2026 09:20:21 +0100 | https://JAlcocerT.github.io/JAlcocerT/py-vacations/

  To curl all URLs from the sitemap:

```sh
  curl -sS https://jalcocert.github.io/JAlcocerT/sitemap.xml \
    | rg -o '<loc>[^<]+' \
    | sed 's#<loc>##'
```

For crawlers, I added a simple `robots.txt`:

```txt
User-agent: *
Allow: /

Sitemap: https://jalcocert.github.io/JAlcocerT/sitemap.xml
```

In Hugo, this lives at:

```txt
static/robots.txt
```

And after deployment it should be available at:

```txt
https://jalcocert.github.io/JAlcocerT/robots.txt
```

This file does not secure anything. It is just a crawler hint. The useful part here is the sitemap line, because it gives search engines and polite crawlers the canonical map of the site.

For AI agents, the trendy file is `llms.txt`. The emerging convention is to publish a Markdown file at the site root:

```txt
https://jalcocert.github.io/JAlcocerT/llms.txt
```

So I added:

```txt
static/llms.txt
```

Think of it as a curated, LLM-friendly site index: what this site is about, which pages matter, and where agents should start. Some projects also publish `llms-full.txt`, which contains a larger Markdown dump of key content for agents that want more context in one request.

I would treat `llms.txt` as a low-cost experiment, not as guaranteed SEO magic. It can help agents and AI coding tools understand a site faster, but classic signals still matter: sitemap, RSS, clean HTML, canonical URLs, metadata, and pages that answer specific questions.
