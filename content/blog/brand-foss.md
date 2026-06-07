---
title: "[Web Audits] Improving a Blog"
date: 2026-06-04T23:20:21+01:00
draft: false
tags: ["FOSS","RoadMap26","Codex x HUGO","Broken Links + Sitemap","JAlcocerTech Leads"]
description: 'Some SEO x Agent Engine Optimization (AEO). With Image generation and commento.'
url: 'a-better-fossengineer'
---

**Tl;DR**

Yes, its me.

```sh
git clone git@gitlab.com:fossengineer1/fossengineerpapermod.git
```

And it was time to stop those ads.

1. `https://diy.jalcocertech.com`
2. `https://webaudit.jalcocertech.com/` - to which im adding all the learnings of these improvements here
3. `https://ebooks.jalcocertech.com/`

```sh
#https://github.com/JAlcocerT/poc_webs_magnet
make audit URL=https://ebooks.jalcocertech.com/ #https://example.com
#This runs the CLI suite through ./audit-master.sh with the default fast behavior, where link checks are skipped.
```

Then, 
```sh
#Also added:
make audit-full URL=https://ebooks.jalcocertech.com/ #https://example.com
make audit-full URL=https://fossengineer.com
make audit-full URL=https://spanishflowacademy.com/
make audit-full URL=https://notenoughcylinders.com/

make audit-full-fast URL=https://jmodels.net/
# Or manually: LINK_CHECK_METHOD=lychee-docker make audit-full URL=https://jmodels.net/

make audit-full URL=https://beyondajourney.lol/
LINK_CHECK_TIMEOUT_SECONDS=0 make audit-full URL=https://clinicadentalrociomontero.com
```

```sh
make audit-links-deep URL=https://clinicadentalrociomontero.com #https://fossengineer.com
```
This runs: `LINK_CHECK_TIMEOUT_SECONDS=0 ./linkcheck-audit.sh "https://fossengineer.com" docker`

3. Added lead generator

make lead-from-report TIMESTAMP=20260604-192953 DOMAIN=genkinfy.com

It creates a first-draft manual lead from matching report artifacts.

4. Fixed Lighthouse summary bug

Mobile-only runs now show desktop as skipped, not 0/100.

Validation passed:

bash -n lighthouse-audit.sh audit-master.sh linkcheck-audit.sh
node --check scripts/lead-from-report.mjs
npm run build
LH_FORM_FACTOR=mobile ./lighthouse-audit.sh https://example.com


* https://github.com/openai/skills
* https://www.skills.sh/coreyhaines31/marketingskills/seo-audit

`seo-audit`

```sh
npx skills add https://github.com/coreyhaines31/marketingskills --skill seo-audit
```


An excuse forme to try the free web audit engine: `https://webaudit.jalcocertech.com/`


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

Using the `foss-post` skill goes fine for me

Which im improving each time at `./agents` to also spin up containers and test the real setup

Then, that docker compose goes to `home-lab` which is the place that feeds the post.

The kind of thing i use now to test websites for people i Just met: `https://spanishflowacademy.com/`

If [these audits show a problem](https://jalcocert.github.io/JAlcocerT/diy-webs-via-paas/) you might need:

To generate nice images with the latest openAI T2I:

```sh
# set -a
# . ./.env
# set +a

uv run --with openai --with pillow \
    "${CODEX_HOME:-$HOME/.codex}/skills/.system/imagegen/scripts/image_gen.py" \
    generate-batch \
    --input tmp/imagegen/playwright-symphony-komodo-cover-prompts.jsonl \
    --out-dir output/imagegen/covers \
    --concurrency 3
```

This model is so good, that I could not avoid using it to improve my digital assets for `consulting.jalcocertech.com`


### Videos

https://jalcocert.github.io/JAlcocerT/oss-automatic-docs-and-tech-video/#about-foss---repo-to-video

Whats stoppin me from shipping JAlcocerTech videos of around 3 min, done with hyperframe, commented with some TTS and screen recorded via...playwright?

A new skill?

```sh

```

### Comments

Im very happy with the Commento setup:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/Commento" title="Commento for Websites | Config 🐋 ↗" >}}
{{< /cards >}}

---


## Conclusions

I was getting making this much complex than it is.

The direction is not to go UI

Agents live in the CLI and you better do the same (or pay the price of the abstraction) 

So all that Web CMS stuff: *Strapi, directus...*?

This was [how i Tinkered](https://youtu.be/UFxlU9gMp_A) last year actually.

But I said no more to custom CMS integrations.

Actually: Not doing more (DFY) websites for others :')

Again: CLI power :)

You can still get my feedback / time to unstuck if you are blocked while building one:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com/" title="Consulting | DWY ↗" icon="book-open" >}}
{{< /cards >}}

### Better JAlcocerTech Web Audits

Ive been using codex CLI to combine the learnings around fossengineer SEO improvements and add it to

```sh
git clone /poc_webs_magnet
cd ./poc_webs_magnet
```


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="PocketBase | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/poc_webs_magnet/" title="PoC Web Magets ↗" icon="github" >}}
{{< /cards >}}


#### Applying webaudits to this blog

Im keeping the CLI cool way for myself :)

Ive also used this chance to add a reference to the main page to some cool static pages ive been doing:

```sh
#check cloudflare statically deployed projects
cd ./poc #they are all here
```

* https://pm-pdm-checks.pages.dev with some questions for your PM/PdMs
* postmortems as I [built here](https://github.com/JAlcocerT/poc/tree/main/libg/why-postmortem)
* the static trip
* the solar checks, the rotating earth...
* the no bs finances, even a btc good looking graph


#### To fossengineer

#### To the latest eayp

Because this setup is cool:

```sh

```

---

## FAQ

### Detecting Broken Links

We can do so via linkchecker, also via Lychee: https://github.com/lycheeverse/lychee

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

When I tried the full sitemap-based external scan, lychee started checking outbound links from every deployed page.

That surfaced rate-limit/backoff warnings from hosts linked in the blog, including `github.com` and `whois.jalcocertech.com`. The `whois.jalcocertech.com` link comes from older blog content, not from GitHub Pages hosting itself.

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

Sitemap URL: `https://jalcocert.github.io/JAlcocerT/sitemap.xml`

RSS feed for latest blog posts: `https://jalcocert.github.io/JAlcocerT/blog/index.xml`

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

Have done so: `https://github.com/JAlcocerT/JAlcocerT/actions/runs/26818896547`

I mean, have a sitemap and rss feed ready for agents:

Sitemap URL: `https://jalcocert.github.io/JAlcocerT/sitemap.xml`

RSS feed for latest blog posts: `https://jalcocert.github.io/JAlcocerT/blog/index.xml`

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

This file does not secure anything. 

It is just a crawler hint.

The useful part here is the sitemap line, because it gives search engines and polite crawlers the canonical map of the site.

For AI agents, the trendy file is `llms.txt`.

The emerging convention is to publish a Markdown file at the site root:

```txt
https://jalcocert.github.io/JAlcocerT/llms.txt
```

So I added:

```txt
static/llms.txt
```

Think of it as a curated, LLM-friendly site index: what this site is about, which pages matter, and where agents should start. 

Some projects also publish `llms-full.txt`, which contains a larger Markdown dump of key content for agents that want more context in one request.

I would treat `llms.txt` as a low-cost experiment, not as guaranteed SEO magic. 

It can help agents and AI coding tools understand a site faster, but classic signals still matter: sitemap, RSS, clean HTML, canonical URLs, metadata, and pages that answer specific questions.

### Interesting Web UI/X Videos

1. https://www.youtube.com/@bycrawford like https://www.youtube.com/watch?v=f2mGqlLLqok
