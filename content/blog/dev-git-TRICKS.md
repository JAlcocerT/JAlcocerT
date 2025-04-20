---
title: "Git & Development Tricks: Github, Gitlab and more"
date: 2025-02-20T23:20:21+01:00
draft: false
tags: ["Dev"]
url: 'git-recap'
description: 'Git and useful extensions while developing.'
---

When I started to use Git, I could actually start see my progress and build upon my previous effort.

This is a recap of the best GIT related tricks I have so far.



{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/github-gists/" title="Github Gists Tricks" icon="book-open" >}}
{{< /cards >}}

### Github

1. Use vscode on the cloud with: https://github.com/codespaces/
2. GISTS are a great way to share code: https://jalcocert.github.io/JAlcocerT/github-gists/

```sh
sudo apt install git #you need GIT first
#git remote -v
```

![alt text](/blog_img/dev/github-auth.png)


You will also need:

```sh
git config --global user.name "JAlcocerT"
git config --global user.email "youremail@example.com"
```

#### Creating Releases

And given a project, you can **get the latest Github release** as per:

<!-- https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8 -->
{{< gist steinwaywhw a4cd19cda655b8249d908261a62687f8>}}


#### Github Actions

Using **github CI/CD** can be very helpful:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/github-actions-use-cases/" title="GHA 101 Post" image="/blog_img/dev/re-actions-container-repo.png" subtitle="How to get the most out of Github Actions" >}}
{{< /cards >}}


Github Actions **MultiArch Images**:

1. With QEMU: as explained here
2. ARM86 native builds with GHA

> Since this year, 2025, we can also build ARM64 images natively with GHActions!

#### Github Pages

https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/

### Gitlab

Not everything is Github.

There are very cool projects on [Gitlab](https://jalcocert.github.io/JAlcocerT/how-to-use-gitlab/) as well.

You can start by adding their extension to sync your repos:

```sh
code --install-extension gitlab.gitlab-workflow
```

![alt text](/blog_img/dev/gitlab-extension.png)


> Definitely use the extension `GitLab Workflow VS Code Extension`. Authenticate with OAuth.


```sh
#sudo snap install gitlab-cli
sudo snap install glab

glab auth login #you will need https://gitlab.com/-/user_settings/personal_access_tokens?page=1
glab mr list
#glab mr diff 25
```

## VSCode

You can install it with flatpak:

```sh
flatpak install flathub com.visualstudio.code #https://flathub.org/apps/com.visualstudio.code
flatpak list --app
#flatpak list --columns=all

#flatpak uninstall com.visualstudio.code
```

Or with snap (which I would recommend):

```sh
sudo snap install code --classic
```

There are some cool **extensions** to help you create.


* Name: **Dev Containers**
    * Id: ms-vscode-remote.remote-containers
    * [VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

![alt text](/blog_img/dev/remote-dev.png)

Remember that there are many cool extensions: https://marketplace.visualstudio.com/VSCode

And that they can be installed programatically:

```sh
codium --install-extension gitlab.gitlab-workflow
#code --install-extension gitlab.gitlab-workflow
```


### Remote Development

I was discovering some vscode triks [here](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/).

The most important steps?

**SSH Dev**

We need this extension: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack

```sh
ext install ms-vscode-remote.vscode-remote-extensionpack #do this one inside VSCode with CTRL+SHIFT+P
#code --install-extension ms-vscode-remote.vscode-remote-extensionpack #or this one from the terminal
```

Then, do `CTRL SHIFT P` and write: `connect to host`

![alt text](/blog_img/dev/remote-dev.png)

> [This video](https://www.youtube.com/watch?v=cOopQQIL8JU) summarizes it very well

When you are done, you will get the possibility to connect confortably:

![alt text](/blog_img/dev/dev-via-ssh.png)

**Container Dev**

```sh
ext install ms-vscode-remote.remote-containers #do this one inside VSCode with CTRL+SHIFT+P
#code --install-extension ms-vscode-remote.remote-containers #or this one from the terminal
```


```sh
sudo usermod -aG docker jalcocert
groups jalcocert

#sudo groupadd docker
#sudo usermod -aG docker $USER
```

> This can be very useful to do Jekyll web dev as seen [here](https://www.youtube.com/watch?v=X7guekGZM20)

Generally, to develop inside a container: you will need one


{{< callout type="info" >}}
For a Python Dev Container, you can get one with **this docker-compose**.
{{< /callout >}}

{{< youtube "yUyxJr2xboI" >}}

**More VSCode extensions**

```sh
#docker #https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
ext install ms-azuretools.vscode-docker

#MDX #https://open-vsx.org/vscode/item?itemName=unifiedjs.vscode-mdx
ext install unifiedjs.vscode-mdx

#github actions https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions
ext install GitHub.vscode-github-actions #
#code --install-extension GitHub.vscode-github-actions

#slidev
ext install antfu.slidev
#code --install-extension antfu.slidev #or this one from the terminal

#python
ext install ms-python.python #https://marketplace.visualstudio.com/items?itemName=ms-python.python

#https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
ext install eamodio.gitlens
#code --install-extension eamodio.gitlens #or this one from the terminal

#yaml https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml


#gemini assistant https://marketplace.visualstudio.com/items?itemName=Google.geminicodeassist

#jupyter https://marketplace.visualstudio.com/items/?itemName=ms-toolsai.jupyter
```

---

## Learnt with This one

Thanks to [these devs tricks](https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/), I could put [this landing theme](https://github.com/majesticooss/mizar) with **KeyStatic** into selfhosting with my Pi.

1. [Installed Node](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/)

```sh
# Verify installation
node -v   # Should show Node.js version - 20.18.1
npm -v    # Should show npm version - 10.8.2
```

2. Clone the repo and run it:

```sh
npm run dev --host #as i was using the Opi
npm run build
#npm install -g serve #serve with npm
#serve -s dist #http://localhost:3000
npx serve -s dist #http://localhost:3000
```

### Outro

Lately, a colleague mentioned to me about: https://lovable.dev/

> Lovable is an **AI software engineer**, which enables anyone to build for the web. Simply chat to instantly build websites and web apps, with no technical knowledge needed.

It requires a signup, yet they provide a free tier.

Definitely have to take a look to suck tools and also to the open/local ones.


Use **VSCodium via container**:

```yml
#https://docs.linuxserver.io/images/docker-vscodium/#lossless-mode
#---
#version: "2.1"
services:
  vscodium:
    image: lscr.io/linuxserver/vscodium:latest
    container_name: vscodium
    cap_add:
      - IPC_LOCK
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/Docker/vscodium/config:/config
    ports:
      - 3070:3000
      - 3071:3001
    shm_size: "1gb"
    restart: unless-stopped

##localhost:3070
```

#### Weekly Planning

> A proactive approach to planning, information sharing, and continuous learning:

================= WK1234 Y25 | Sprint 123ab =================

**Sprint Goal:** [Clearly state the overarching goal of the sprint]

**Key Objectives for This Week:**

* **Grooming:**
    * Status: [e.g., On Track, Needs Attention]
    * Deliverables: [e.g., Backlog prioritized, X user stories refined]
* **Requirements:**
    * Status: [e.g., In Progress, Blocked ⚠️]
    * Deliverables: [e.g., Y requirements documented, User journey map updated]
* **Tasks:** ✅
    * **Boards:**
        * DE - [Link] - Status: [e.g., X/Y tasks completed]
        * DA - [Link] - Status: [e.g., P/Q tasks in progress]
    * **Individual Task Areas (SMD, Created, Validated, Documented):**
        * [Consider listing a few key tasks under each with status if helpful]

**Projects:** [Briefly mention key projects and their current focus this week]

**Learnings & Insights:**

* **This Week's Key Learnings:**
    * [Bulleted list as before]

**Meetings & Decisions:**

* **Daily DnA:** [Keep the structure as is, but consider adding key decisions or action items briefly]
* **MTG abc:**
    * Summary:
    * **Key Decisions:** [New section]
    * **Action Items (Owner - Due Date):** [New section, extracted from Conclusions/NextSteps]
    * Raw Notes:

**Tools & Resources:** [Keep as is]

**Processes & Environment:** [Keep as is]

**Key Contacts:** [Keep as is]

**Technical Reference:** [Keep as is]