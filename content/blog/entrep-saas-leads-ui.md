---
title: "How about getting leads for your SaaS?"
date: 2026-01-25T09:20:21+01:00
draft: false
tags: ["BiP x GTM","APIFY x ESP Sales Pipeline","RoadMap26"]
description: 'Forget about B2C, sell to B2B as they have the budget for whatever product helps.'
url: 'how-to-do-email-marketing'
---


**Tl;DR**

Oil, aka `CL=F` is a commodity

Your client's money is a commodity.

Your [client is a commodity](https://youtu.be/O_tmZgs4LHU).

~~Your tinder date, is most likely a commodity~~

Your product is NOT.

**Intro**

For custom ~~products~~ services: *Im starting to let clients do their own quote*.

Shoot an unresonably low number and I already know that you are not making enough money with my solutions.

So why should we loose time?

Should we spend time discussing about building something that wont have impact? that will be used 3 times?

Im just sorry for those who underestimate other's opportunity costs.

Specially for the ones that have been pushing their assets/brands for some time already.

For the rest: **How about we find people who can potentially benefit of what you have created?**


## A UI Wrapper Around APIFY

Making UI wrapper around things is so easy this year.

We've seen that around the langchain qna to dbs.

And now, time for [more APIFY](https://jalcocert.github.io/JAlcocerT/apify/):

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Scrap_Tools" title="Scrap Tools ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/leads-slubnechwile" title="Leads SlubneChwile x APIFY ↗" icon="github" >}}
{{< /cards >}}


{{< details title="Vibe Coding | Setup  📌" closed="true" >}}

Go to whatever LLM you are using and ask: `do you think that these requirements are clear enough?`

```md
Create a sth sth sth like... a Landing Page based on NextJS with a cool and modern UI

Include a `dockerfile` and `docker-compose.yml` that will control the title, description, open-graph image, favicon location and other global website variables via environment variables.

Add also a docker-compose.portainer.yml to use assuming that the image has been built already.

Create also a makefile with the following commands:

* `make help` - Show available commands
* `make install` - Prepare the dependencies for local development
* `make dev` - Run development server
* `make container` - Build and Run in Docker container

Create the `z-development-plan.md` with independent and testable phases that can be completed sequentially.

When it is completed, create a `z-walkthrough.md` with the steps to deploy the application and what each part of the tech stack does on a high level to bring the features to life.

Consider adding a Terms of Service / **terms and conditions and privacy policy** to the website, which will be governed by two separated markdown files.

Add also a faq section, that instead of been controlled via a json, lets have it controlled as per the frontmatter and content of separated markdown files inside the folder `faq`. The logic should read them in order as per their file name and show them in the right component of the UI.

> When these change, consider sending an email to your existing clients!

Consider adding **Umami web analytics capabilities** to the WebApp when using the container, by adding the possibility to feed the PUBLIC_UMAMI_SCRIPT_URL and PUBLIC_UMAMI_WEBSITE_ID to be used via <script defer src="" data-website-id=""></script>

If you are using Python, design proper functions with docstrings, so that the codebase is understandable, scalable and self-documenting.
```

Then go to [AntiGravity IDE](#antigravity-ide) and ask if the `brd.md` refined already with Gemini is clear enough.

If it is clear define the `z-development-plan.md` and proceed with the development phases.

As you will need to iterate across features, do it like a pro with change-requests / CRQ.

```sh
#sudo apt install gh
gh auth login
#gh repo create make-xyz --private --source=. --remote=origin --push
    
git init && git add . && git commit -m "Initial commit: simple landing website" && gh repo create make-xyz --private --source=. --remote=origin --push
###du -sh .
#docker stop $(docker ps -a -q) #stop all
#docker system df

#make help
#docker builder prune	
#sudo journalctl --vacuum-size=500M
sudo apt-get clean
sudo apt-get autoremove
```

**Technical Stack and Design Requirements**

To develop a **modern, secure, and scalable web platform** for hosting and streaming a single-user podcast.

The platform must offer a seamless, content-driven user interface and a flexible content management system supporting both web uploads and direct file system access.

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | | |
| **Styling/UI Library** | | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)/Database** | | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | | |

And if you need more:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Deployment** | | |
| **Content Management** | | |
| **Analytics** | | |
| **Interactivity** | | |
| **External Integrations** | | |

{{< /details >}}

> The BRD, tech stack, clarifications, dev phases and walkthough. With sales and psyc plugged in.

### Use APIFY to the Max

Every business needs clients.

Building something that does precisely that: has potential demand.

Plus you can use the product...to...sell the product.

And if you are here, there are [people that has been around this idea already](https://forocoches.com/foro/showthread.php?t=10574345).

Also [here](https://forocoches.com/foro/showthread.php?p=507148447#post507148447), around a google map scrapper `https://app.quickscrape.net/google-maps-scraper/`

### Store your B2B leads

Somewhere.



### Choose your mailing ESP

People are using these: 

* `https://loops.so/`
* `https://www.zoho.com/mail/`



---

## Conclusions

Hopefully by now you have **your sales pipeline** full of people that are [NOT afraid of 70$/y **proton** subscriptions](https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#outro).

Like this one: https://pr.tn/ref/RHJ7YZE8

Your clients are NOT solving you anything.

Your products/services are solving their problems.

Like these `https://protonapps.com/` are there to help you.

Not there yet? 

Too complex reasoning?

Here is a solution to your problem: *When there is no risk **for sure** there is no opportunity*

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/web/1ton-webook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

With that you get up to speed quickly with how to use your wishes to build:

![Vibe Coding - Simpsons Halloween S2](/blog_img/dev/vibe-coding.png)

And how to do so, so that you build something that somebody wants: *not what you think they want*

![Vibe Coding - Wrong Product Output](/blog_img/dev/Simpson_Producto_La_escopeta_maquilladora.gif)

---

## FAQ

