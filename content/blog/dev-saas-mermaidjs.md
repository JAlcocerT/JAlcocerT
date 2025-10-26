---
title: "Diagrams and workflows as a Code with Agents"
date: 2025-11-05T12:20:21+01:00
draft: false
tags: ["AI SaaS","Codex CLI","MermaidJS","Grok vs Perplexity","Icons for Architects","Commet"]
description: 'BiP user flows around newsletter layers. From SliDev Editor to Mermaid Editor with live information.'
url: 'ai-driven-diagrams'
---

**Tl;DR**

I Got the [social signin working here, with the slidev-editor](https://jalcocert.github.io/JAlcocerT/social-signin-101/#conclusions).

Now its time to bring the **AI part** to the equation.

> If you are [an architect](#architecture-and-icons), you will like this.


**Intro**

Same as we can do presentations as a code, we can know diagrams as a code.

In fact, the diagrams as a code (Mermaid) can be integrated with our SliDev-Editor Setup.



## Live info for your PPTs

For live info, you can always try [scrapping](https://jalcocert.github.io/JAlcocerT/how-to-browse/#scrapping-recap) or this programmatic search engine search.

But if you have tried already, you will know that there might be some complications depending on [how the websites are created](#how-scraping-relates-to-ssg-csr-and-ssr).

{{< callout type="info" >}}
These APIs are paywalled! 
{{< /callout >}}

> But I got recently 1y trial of Perplexity and its quite cool

> > And if you are windows/mac user, you can try their Commet browser, with cool web summarization

### Grok API

Few weeks ago I was tinkering with [grok API](https://jalcocert.github.io/JAlcocerT/how-to-use-grok-api/), which can be used also via LiteLLM.

* https://x.ai/api
    * https://console.x.ai/
    * https://docs.x.ai/docs/overview
    * https://docs.x.ai/docs/models
    * https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/GrokAPI 🐍


And just this week I got...

### Perplexity API


* https://sourcegraph.com/search

* https://www.perplexity.ai/discover


* https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/PerplexityAPI

* https://jalcocert.github.io/JAlcocerT/live-search-and-research-with-ai/#perplexity 🐍

![alt text](/blog_img/GenAI/ai-search/perplexity-pro-offer.png)


```sh
curl https://api.perplexity.ai/chat/completions \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "sonar-pro",
    "messages": [
      {
        "role": "user", 
        "content": "What are the major AI developments and announcements from today across the tech industry?"
      }
    ]
  }' | jq
```

---

## Conclusions

Does it even make sense to try building an AI Saas?

I would say yes, for the learnings.

For the financial motivations, just be aware of [Pareto](https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/) and that most tries will fail.


---

## FAQ


### How Scraping Relates to SSG, CSR, and SSR

Web scraping and modern web rendering techniques like:

Static Site Generation (SSG), Server-Side Rendering (SSR), and Client-Side Rendering (CSR) are fundamentally linked by how they present content.

The rendering method a website uses directly impacts how easy or difficult it is to scrape.


* **Static Site Generation (SSG)**: 📄 SSG creates and serves a fully-formed, static HTML file for each page at **build time**. The content is pre-rendered and doesn't change until the site is rebuilt.
    * **Scraping:** This is the easiest type of site to scrape. A simple scraper can just send an HTTP request to the page and receive all the content in the initial HTML response. You don't need to worry about executing JavaScript.

* **Server-Side Rendering (SSR)**: ⚙️ SSR generates the complete HTML page on the **server** for each user **request**. The server fetches data, compiles the page, and then sends the finished HTML to the browser.
    * **Scraping:** Scraping an SSR site is also relatively easy. Like with SSG, the content is already present in the initial HTML response. The scraper simply needs to parse the received HTML to extract the data.

* **Client-Side Rendering (CSR)**: 💻 CSR delivers a minimal HTML "shell" to the browser. The actual content is loaded and rendered dynamically on the **client-side** using **JavaScript**. This often involves a JavaScript framework like React or Angular making API calls to fetch data after the page has loaded.
    * **Scraping:** This is the most difficult to scrape. A basic scraper that only fetches the initial HTML will get an empty or incomplete page without the content. To get the data, a scraper must be able to execute JavaScript and mimic a browser's behavior.


#### Challenges of Scraping Dynamic Content

It's much harder to scrape dynamic content, and your intuition is correct—it's because the scraper must act like a real user. 🕵️‍♀️

With dynamic content (like that found on CSR websites), the data you want isn't in the initial HTML. It's loaded later by JavaScript. This means a standard scraper that just makes a simple HTTP request will fail to see the content.

To overcome this, you need to use a **headless browser**. . A headless browser is a web browser without a graphical user interface (like Chrome or Firefox) that can be controlled programmatically. It can:

1.  **Execute JavaScript:** It runs the JavaScript on the page, just like a real browser would, triggering the API calls that load the dynamic content.
2.  **Wait for Content:** It can be programmed to wait until the content you're looking for appears on the page before trying to scrape it.
3.  **Mimic User Behavior:** More advanced anti-bot systems will detect non-human behavior. Headless browsers can be configured to mimic human actions like random delays, scrolling, and mouse movements to avoid being blocked.

So, while it is hard, it's not impossible. The key is to use more sophisticated tools that can render the entire page and interact with it, rather than just downloading and parsing a static HTML file.


### Architecture and Icons

> https://jalcocert.github.io/JAlcocerT/data-analytics-architecture/

https://iconify.design/
https://icon-sets.iconify.design/
https://mermaid.js.org/syntax/architecture.html


### How to build a MermaidJS-Editor

Dont forget about the tab icon and the opengraph!


{{< callout type="info" >}}
Own the context, rule the code
{{< /callout >}}