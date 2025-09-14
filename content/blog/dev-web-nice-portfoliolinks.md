---
title: "All your web links for Social Media combined"
date: 2024-09-29T10:20:21+01:00
draft: false
tags: ["Dev","Web","Portfolio","HUGO Lynx","LinkStack","FOSS Linktree"]
description: 'Social Media Links with a cool website. Show your work with Hugo and Lynx. Compared with LinkStack.'
url: 'portfolio-website-for-social-media'
---


**Intro**

A look to the HUGO Theme: https://github.com/jpanther/lynx

And why [showing your work](#a-better-way-to-show-your-work) matters.

+++ How I have deployed to [Github Pages](#hugo-lynx-with-githubpages)


## A Better way to Show your Work

We all have **awsome stuff done**, but on our phone.

Let's give others the chance to benefit from our ideas/project/services.

**Make it available for them.**

{{< callout type="info" >}}
You can do similarly in a VPS Server, like this one we used for Flask
{{< /callout >}}

{{< callout type="info" >}}
I [developed it within my OrangePi with SSH](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/) and also had to stop portainer so that TinaCMS could run `sudo docker stop portainer`
{{< /callout >}}


<!-- 
https://www.udemy.com/instructor/marketplace-insights/?q=Generative%20AI&lang=es

https://www.udemy.com/courses/search/?src=ukw&q=local+llm -->

### Web Demo Results

See: https://jalcocert.github.io/Portfolio

[!HUGO Lynx](/blog_img/web/WebsSnapshots/Web_PortfolioLinks.png)

#### HUGO LYNX with GithubPages

{{< details title="Proposing a Quick HUGO Theme 📌" closed="true" >}}

[JPanther Contributions](https://github.com/jpanther) are amazing.

And the **Lynx Theme** is not an exception.

```sh
git clone https://github.com/jpanther/lynx #MIT Licensed, Thanks again, James!
cd ./lynx

git clone https://github.com/JAlcocerT/Portfolio
cd ./Portfolio
```


Get **GO & HUGO Ready** as per [this related post](https://jalcocert.github.io/JAlcocerT/blog/using-hugo-as-website/).

```sh
#sudo apt install ufw
#sudo ufw allow 1313

hugo server #http://192.168.0.117:1313/
#hugo server --bind 0.0.0.0 --baseURL http://192.168.0.117
#hugo server --bind 192.168.0.117 --baseURL http://192.168.0.117 #it will bind it to a random port
hugo server --bind 0.0.0.0 --baseURL http://192.168.0.117 --port 1313 #
```

Now you can dev HUGO as I did, on a [server with VSCode and SSH](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/) at: `http://192.168.0.117:1313`
<!-- 
Use the sample site:

```sh
rm -r ./assets && rm -r ./content && rm -r ./layouts && cp -r ./exampleSite/assets . && cp -r ./exampleSite/content . && cp -r ./exampleSite/layouts .
``` -->

```sh
git add .
git commit -m "Updating Links"

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

git branch
git checkout main

#git push origin master
git push origin main
```

{{< /details >}}


It can be built when published to **Github Pages** with this **sample Workflow**: [Dev Hugo -> Push Changes -> CICD Magic](https://github.com/JAlcocerT/Portfolio/blob/main/.github/workflows/hugo.yml)

In **less than ~1min**, your site will be refreshed at **Github Pages**.

> Thanks to Github Pages + Github Actions CI/CD!

Other Interesting **HUGO Themes**: BlowFish, BeautifulHugo, ...

#### Astro LTree with TinaCMS

Withing Astro, we also have similar *links collector* static themes, like the previous HUGO Lynx.

{{< details title="It all started testing this Astro Theme with TinaCMS📌" closed="true" >}}

Have a look to this video for a first [Astro + TinaCMS test](https://www.youtube.com/watch?v=5Opvp6z1uSc&t=2s)

* Includes 2 users, 2 roles, and community support. [Free TinaCMS](https://tina.io/pricing/)
* More about [Tina CMS](#faq)

```sh
git clone https://github.com/DBozhinovski/astro-theme-ltree
cd ./astro-theme-ltree

npm install
npm run dev --host #as i was using the Opi
```

And to serve the built files just do: 

```sh
npm run build
npm install -g serve #serve with npm

serve -s dist #http://localhost:3000
```

> Everything worked, so i created this [repo for the project](https://github.com/JAlcocerT/yarness-web)

{{< /details >}}


## Selhostable Link Tools

It requires a server, but it gets the job done and it brigns multi-user, authentication out of the box:

1. [LinkStack](https://linkstack.org/docker/) - Selfhostable with [this docker config](https://github.com/JAlcocerT/Docker/blob/main/Web/CMS/LinkStack_docker-compose.yml)

>  A simple to set up [docker variant of LinkStack](https://github.com/linkstackorg/linkstack-docker). 

> > LinkStack is a highly customizable link sharing platform with an intuitive, easy to use user interface. 

---

## FAQ

Exploring TinaCMS with this theme.


{{< details title="TinaCMS Setup with Astro📌" closed="true" >}}

As per this [YT Video](https://www.youtube.com/watch?v=5Opvp6z1uSc&t=2s)

```sh
npm create astro@latest
```

Use any folder and project name.

And lets go with the blog template. 

```sh
npm run dev #a default astro blog is ready at localhost:4321
```

{{< /details >}}

> You can use **Tina together with a Github Repository**


### Web Analytics - A Comparison

And when you got a website...you will want to know how much people is visiting it.


{{< callout type="info" >}}
I have collected some [Selfhostable WebAn Tools config files **here**](https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics)
{{< /callout >}}

Be prepared to find out some [Pareto](https://jalcocert.github.io/JAlcocerT/pareto-principle-for-data-analytics/) in action.

See this split of views for the F/OSS Umami Web Analytics:

![Umami Web Analytics and Pareto](/blog_img/outro/pareto-weban.png)

You also have the closed sourced ones, like:

**Microsoft Dynamics 365** enhances marketing efforts by offering the capability to send emails directly from within the context of the records you are working on. 

This feature integrates seamlessly with its robust marketing automation capabilities.

- **Adobe Campaign**: This tool specializes in marketing automation, focusing on campaign management, email marketing, personalization, and orchestrating customer journeys across various channels. It assists in designing, executing, and measuring targeted marketing campaigns effectively.

- **Google Analytics**: A web analytics tool that tracks website traffic, user behavior, and conversions. It provides insights into how users interact with your website and identifies potential areas for improvement.

- **Adobe Analytics**: Known for its advanced capabilities in website analytics and customer journey intelligence. Adobe Analytics offers detailed insights into customer behaviors and preferences, going beyond basic traffic data to help understand deeper customer dynamics.


{{< callout type="info" >}}
There are many acronyms: sf - secure forms / aa - adobe analytics / adf - azure data factory / ac - adobe campaign
{{< /callout >}}



Together, these tools provide comprehensive solutions for refining marketing strategies, enhancing user engagement, and ultimately driving business growth through informed decision-making.

**They also eat cookies**

![Cookies Meme](/blog_img/web/COOKIES.jpg)