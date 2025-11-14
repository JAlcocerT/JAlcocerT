---
title: "A Blog you can actually Edit via NextJS"
date: 2025-09-13T01:20:21+01:00
draft: false
tags: ["Web","TOAST UI Markdown editor","WYSIWYG","ICP","Astro Theme Typography","Github OAUTH"]
description: 'Using ToastUI and Github Auth via NextJS to make a custom astro posts editor.'
url: 'nextjs-toast-ui-editor'
---


**Tl;DR**

Some people sya that data is the new oil.

Others, that [ideas are the new oil](https://nav.al/ideas)

Whatever that might be, I see too much in the social media apps that only the latest thing, is the valuable one.

We are neglecting quality and deep content.

Like the one you can create with a (markdown powered) website that you can [edit](#tech).

> I vibecoded a [NextJS webapp that integrates with github for auth](https://github.com/JAlcocerT/astro-theme-typography) and brings a ToastUI editor.

**Intro**

From the [KB post](https://jalcocert.github.io/JAlcocerT/knowledge-management/) I got the concept of WYSIWYG.

And Ive seen that I can create my own proper post editor, thanks to tools like [Toast UI](#toast-ui-wysiwyg-md-editor) 

Also, there are many things that [CSR can do](https://jalcocert.github.io/JAlcocerT/csr-and-js/).


## Tech

After discovering what is possible with https://it-tools.tech/html-wysiwyg-editor

And: https://github.com/markdown-it/markdown-it

Isnt it anything similar for **md editions in browser**?

Come on...even we can render [(serverless) invoices](https://github.com/JAlcocerT/serverless-invoices) via browser.

Before moving forward, I need to apply these concepts to some theme.

Ive chosen: https://github.com/moeyua/astro-theme-typography

> MIT | Rediscover the beauty of typography.

Due to its text centered approach and ,posts only' philosophy.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/astro-theme-typography" title="NEW - Astro Typography Theme" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Conteinerized and posts editable via UI with Github Social Signin- Source Code on Github" >}}
{{< /cards >}}

```sh
git clone https://github.com/JAlcocerT/astro-theme-typography
#npm install
#npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

As you can imagine, we have few options to edit .md: https://github.com/JAlcocerT/astro-theme-typography/blob/main/md-edition-choices.md

### Monaco Editor

On the previous audio with ai post, I required a quick `.md` validator for the OpenAI transcriptions.

And when I asked cursor...he mentioned Monaco.

Ive seen that word somewhere else than in Formula1.

Particularly: https://sli.dev/custom/config-monaco

{{< callout type="info" >}}
The monaco editor can *potentially* run code in browser!
{{< /callout >}}

### TOAST UI WYSIWYG MD Editor

The TOAST UI Editor is a well-regarded and **mature open-source Markdown editor** that stands out for its unique blend of a powerful WYSIWYG experience with a Markdown-first approach. 


{{< details title="Breakdown of ToastUI key features and benefits 📌" closed="true" >}}

* **Hybrid Editing Modes:** This is its most significant feature. You get the best of both worlds: a user-friendly WYSIWYG mode for non-technical users and a pure Markdown mode for developers or those who prefer writing in plain text. The ability to seamlessly switch between the two is a major selling point.
* **Markdown Standard Compliance:** It adheres to the CommonMark and GitHub Flavored Markdown (GFM) specifications, which is a big plus. This ensures that the Markdown you write and the HTML it generates will be compatible with many other tools and platforms.
* **Live Preview and Scroll Sync:** The split-screen view with live preview is a standard feature for good Markdown editors, but TOAST UI's synchronous scrolling is a great quality-of-life improvement. It keeps your place in both the source and the preview, which makes for a much smoother editing experience.
* **Extensible and Modular:** The editor is designed with a plugin architecture, allowing you to add extra functionality like charts, tables, or custom syntax highlighting. This makes it highly customizable to fit specific project needs.
* **Robust and Well-Maintained:** It has a significant number of GitHub stars and is actively maintained. This indicates a strong community and a reliable codebase, which is crucial for a core component like a text editor.
* **Clean Output:** The editor is known for producing clean and semantic HTML, which is important for SEO and overall web performance.

{{< /details >}}


**Potential Considerations:**

* **Learning Curve:** While the WYSIWYG mode is intuitive, some of the more advanced features and a full understanding of the dual-mode functionality might require a bit of a learning curve for some users.

* **Customization Efforts:** While it's highly customizable, some specific, deep customizations might require significant development effort, as noted by projects that have evaluated it and considered alternatives.

#### Could ToastUI work as CSR with an Astro theme?

The **TOAST UI Editor** is a perfect candidate for a Client-Side Rendered (CSR) component within an Astro theme.

Here's why:

* **JavaScript-Based:** The TOAST UI Editor is a JavaScript library, which means it runs in the browser. Astro's default behavior is to produce static HTML and JavaScript that runs on the client.
* **Astro's Islands Architecture:** Astro's "Islands" architecture is designed for this exact use case. You can have a static, server-rendered page layout with a single, isolated interactive component—the editor—that is hydrated with JavaScript on the client. This is the ideal way to integrate a heavy, interactive library like an editor without sacrificing Astro's core benefits of fast initial load times and great SEO.
* **How to Implement:**
    1.  **Install the library:** You would install the TOAST UI Editor package via npm: `npm install @toast-ui/editor`.
    2.  **Create an Astro Component:** You'd create an Astro component that will be responsible for rendering the editor.
    3.  **Client-Side Hydration:** To ensure the editor only loads on the client, you would use a client-side hydration directive like `client:only`. This tells Astro to skip rendering this component on the server and to only load and render it on the client once the page is interactive. This is the key to making it work seamlessly with an Astro theme without bogging down your site's initial load.
    4.  **Import and Initialize:** Inside your Astro component, you would import the necessary JavaScript and CSS files for the editor and then initialize a new editor instance, pointing it to a container `div` in your component's template.

In summary, the TOAST UI Editor is a powerful and flexible tool.

Its dual-mode approach is highly effective for a wide range of users, and it integrates very well with a modern framework like Astro, especially when implemented as a client-side rendered component.

### FastAPI vs NextJS as Astro Editor

Time to choose whats the BE is going to be [FastAPI vs NextJS as per this md](https://github.com/JAlcocerT/astro-theme-typography/blob/main/fastapi-vs-nextjs.md)

🎯 **My Recommendation:**

For your use case (Astro theme with Git-based content management), I'd lean toward **Next.js** because:

1. **Simpler deployment** - One service instead of two
2. **Easier maintenance** - Single codebase to manage
3. **Faster development** - No CORS setup, unified development experience

> If you're more comfortable with Python OR need maximum flexibility, **[FastAPI](https://jalcocert.github.io/JAlcocerT/fast-api/) is equally valid** and will deliver the same great user experience with Toast UI Editor.

### Git and Builds

Even cloudflare mention this long ago: https://blog.cloudflare.com/cloudflare-pages-headless-cms-partnerships/

**Both FastAPI and Next.js approaches are Git provider agnostic** - they only require:
- REST API access to Git repositories
- OAuth authentication support
- File creation/update capabilities
- Webhook support for triggering rebuilds


I was thinking github vs gitea (and prepared instructions on how to get the keys for each).

I went for the github one, so I created a new Github App to get the required credentials:

* https://github.com/settings/applications/new

![NextJS Login to admin via Github Social Signin](/blog_img/web/nextjs-admin/nextjs-github-admin.png)

And it worked!: 

![Github Social Signin for the NextJS Web App that edits Astro blog posts with ToastUI](/blog_img/web/nextjs-admin/nextjs-admin.png)

You will get an email from gh

![Github App social signin](/blog_img/web/nextjs-admin/gh-oauth.png)

Some more vibe coding:

![NextJS Admin Panel for Astro SSG Posts](/blog_img/web/nextjs-admin/nextjs-admin-2.png)

![alt text](/blog_img/web/nextjs-admin/nextjs-admin-3-posts.png)


---

## Conclusions

Despite getting all posts loaded and the github signin ready with NextJS

I got some troubles passing the save part.

![NextJS Admin Panel for Astro Themes with markdown editor](/blog_img/web/nextjs-admin/nextjs-admin-4-notsaving.png)


Probably due to wrong vibe coding from my side.

Anyways, Here is how the process looked like:

<!-- https://youtu.be/leRwGjnuxfk -->
{{< youtube "leRwGjnuxfk" >}}


I got few ideas.

> And the ToasT UI md editor is just great!!

---

## FAQ

**Ideal Customer Profile (ICP)**

In business, particularly in marketing and sales, an ICP is a description of the type of company or customer that would get the most value from your product or service and, in return, provide the most value to your business.

* **Why it's important:** An ICP helps businesses focus their efforts on the most promising leads, which leads to more efficient sales and marketing, higher customer satisfaction, and better long-term retention.

* **What it includes:** An ICP typically outlines characteristics like company size, industry, location, technological stack, and the specific challenges they face. It's often used in conjunction with a **buyer persona**, which focuses on the individual within the company who makes purchasing decisions.

