---
title: "Astro Web with Cloudflare Pages and CI/CD"
date: 2024-09-24
draft: false
tags: ["Web","Dev"]
description: 'Setup CI/CD for Astro website with Cloudflare Pages'
summary: 'Astro Websites Automatic deployment with Cloudflare Pages and CICD'
url: 'astro-web-cloudflare-pages'
---

We can upload the manually generated static astro content to [Cloudflare Pages via CLI as explained here](https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/#faq).

But how about just pushing the changes to a **Github Repository and let the CI/CD** magic happen?

> Let's do it with the [hugo theme gallery ssg as example](https://github.com/IoTechCrafts/hugo-theme-gallery-ssg) and following the [Cloudflare Devs YT Video](https://www.youtube.com/watch?v=O4jV8Zz2w9I)


{{% steps %}}

### Astro Site to Github Repository

This is the first step.

### Setup Cloudflare to with with Github

Go to Cloudflare UI. Worker & Pages -> Overview. Create -> Pages -> Connect Git.

You will Need a Github Account Authentication

### Setup Cloudflare Workers and Pages


{{% /steps %}}



{{< details title="Detailed Process - Cloudflare and Github 📌" closed="true" >}}

![Wordpress Google Page Speed Desktop](/blog_img/web/Cloudflare/Cloudflare-GithubPages.png)


![Wordpress Google Page Speed Desktop](/blog_img/web/Cloudflare/Cloudflare-Github-Connection.png)


![Wordpress Google Page Speed Desktop](/blog_img/web/Cloudflare/Cloudflare-Github-Connection-Authorize.png)


![Wordpress Google Page Speed Desktop](/blog_img/web/Cloudflare/Cloudflare-Github-Connection-Deploy.png)


![Wordpress Google Page Speed Desktop](/blog_img/web/Cloudflare/Cloudflare-GithubPages-HUGO.png)


> It does similarly as the [GH Action Workflow to Send HUGO to GH Pages](https://github.com/JAlcocerT/JAlcocerT/blob/main/.github/workflows/pages.yaml)

{{< /details >}}




{{< details title="Detailed Process - Adding Cloudflare custom Domain 📌" closed="true" >}}

I chose `jalcocertblog` as the name of the project.

It will be available under the same name in the [Cloudflare CLI wrangler](/understanding-astro-ssg-components/#faq)

Lets add a domain we have at Cloudflare:

![Deployed CF Pages](/blog_img/web/Cloudflare/Cloudflare-Deployed-GHProject.png)

![Custom Domain CF Pages](/blog_img/web/Cloudflare/Cloudflare-Deployed-GHProject-customdomain.png)

![DNS CF Pages](/blog_img/web/Cloudflare/Cloudflare-Deployed-GHProject-customDNS.png)



{{< /details >}}


**As Simple as that.**

Now whenever I push changes to this repository, they will be available at:

* Github Pages with free domain: <https://jalcocert.github.io/JAlcocerT/>
* Cloudflare with my own subdomain: <https://blog.jalcocertech.xyz/> (also the [free one](https://jalcocertblog.pages.dev/))

You can see what has been going on with your **deployments in the Cloudflare UI** at: Workers and Pages -> name of your project, for me `jalcocertblog`.

![CF Pages deployments](/blog_img/web/Cloudflare/Cloudflare-Deployed-GHProject-deployments.png)

For Github, you would go to the [actions tab of the repo](https://github.com/JAlcocerT/JAlcocerT/actions)

{{< callout type="warning" >}}
  Github Pages will allow for 25mb+ individual files, but not Cloudflare.
{{< /callout >}}


### Cloudflare Pages vs other Free Deployment Methods


**Cloudflare wins** in the ping time:

```sh
ping jalcocert.github.io/JAlcocerT #~30ms
ping jalcocertblog.pages.dev #~10ms
ping jalcocertech.web.app #~30ms
```

And also the http request:

```sh
curl -o /dev/null -s -w "Time: %{time_total}s\n" https://jalcocert.github.io/JAlcocerT #~0.28s
curl -o /dev/null -s -w "Time: %{time_total}s\n" https://jalcocertblog.pages.dev #~0.15s
curl -o /dev/null -s -w "Time: %{time_total}s\n" https://jalcocertech.web.app/ #~0.3s
```