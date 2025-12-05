---
title: "Git & Development Tricks: Github, Gitlab and more"
date: 2025-02-20T23:20:21+01:00
draft: false
tags: ["Dev","Git 101","branch"]
url: 'git-recap'
description: 'Git tricks and useful extensions while developing.'
---

When I started to use Git, I could actually start see my progress and build upon my previous effort.

This is a recap of the best **GIT related tricks** I have so far.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/github-gists/" title="Github Gists Tricks" icon="book-open" >}}
{{< /cards >}}

### Github

1. Use vscode on the cloud with: https://github.com/codespaces/

![github codespaces](/blog_img/dev/gh-codespaces.png)

2. GISTS are a great way to share code: https://jalcocert.github.io/JAlcocerT/github-gists/

```sh
sudo apt install git #you need GIT first
#git remote -v
```

![Github Auth](/blog_img/dev/github-auth.png)


You will also need:

```sh
git config --global user.name "JAlcocerT"
git config --global user.email "youremail@example.com"
```

See **active branch** and latest commits:

```sh
git branch -a
#git branch

#git log
git log --oneline -n 10
git log --graph --oneline --decorate --all
#git log -n 10 --pretty=format:"%h %ad %s" --date=short

git log --follow -- <file_path> #see which commits are affecting a particular file

#create a new branch from main
git checkout -b <new-branch-name> main
```

To **create a branch from main** reliably, always try:

```sh
git checkout main && git pull origin main
git checkout -b business-feature
#git branch #check that you are in the right one
```

> There are many git patterns / branching strategies, an interesting one is [this one](https://learn.microsoft.com/en-us/azure/devops/repos/git/git-branching-guidance?view=azure-devops#keep-your-branch-strategy-simple) keeping main as the only reality

This can be useful in combination with LLMs, like github copilot, to bring them context!

**You can also try...**

```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: YFinance stock analysis project"

#sudo apt install gh
gh auth login
gh repo create py-some-project --private --source=. --remote=origin --push
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

* https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/

### Gitlab

Not everything is Github.

There are very cool projects on [Gitlab](https://jalcocert.github.io/JAlcocerT/how-to-use-gitlab/) as well.

You can start by adding the **Gitlab extension** to sync your repos:

```sh
code --install-extension gitlab.gitlab-workflow
```

![Gitlab VS Code](/blog_img/dev/gitlab-extension.png)


> Definitely use the extension `GitLab Workflow VS Code Extension`.

> > Authenticate with OAuth.


```sh
#sudo snap install gitlab-cli
sudo snap install glab

glab auth login #you will need https://gitlab.com/-/user_settings/personal_access_tokens?page=1
glab mr list
#glab mr diff 25
```

## VSCode

You can install vscode in Ubuntu with flatpak:

```sh
flatpak install flathub com.visualstudio.code #https://flathub.org/apps/com.visualstudio.code
flatpak list --app
#flatpak list --columns=all

#flatpak uninstall com.visualstudio.code
```

Or with snap, which I would **recommend**:

```sh
sudo snap install code --classic
```

There are some cool **extensions** to help you create.


* Name: **Dev Containers**
    * Id: ms-vscode-remote.remote-containers
    * [VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

![VSCode Remote Container](/blog_img/dev/vscode-remotecontainer.png)

![VSCode SSH Dev](/blog_img/dev/remote-dev.png)

Remember that there are many cool extensions: https://marketplace.visualstudio.com/VSCode

And that they can be installed programatically:

```sh
codium --install-extension gitlab.gitlab-workflow
#code --install-extension gitlab.gitlab-workflow
```

{{< callout type="info" >}}
You can use **CI/CD** with Gitlab https://docs.gitlab.com/ci/ via `.gitlab-ci.yml`
{{< /callout >}}


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

![VSCode Remote Dev](/blog_img/dev/remote-dev.png)

> [This video](https://www.youtube.com/watch?v=cOopQQIL8JU) summarizes it very well

When you are done, you will get the possibility to connect confortably:

![VSCode SSH Development](/blog_img/dev/dev-via-ssh.png)

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

Generally, to develop inside a container...*you will need one*.

{{< callout type="info" >}}
For a Python Dev Container, you can get one with **this kind of [docker-compose](https://github.com/JAlcocerT/Docker/tree/main/Dev/Python_apps)**.
{{< /callout >}}

{{< youtube "yUyxJr2xboI" >}}

> You can use [vscodium inside docker](https://docs.linuxserver.io/images/docker-vscodium/#docker-cli-click-here-for-more-info)

**More VSCode extensions**

```sh
#code --install-extension gitlab.gitlab-workflow

#https://marketplace.visualstudio.com/items?itemName=unifiedjs.vscode-mdx
ext install unifiedjs.vscode-mdx

#https://marketplace.visualstudio.com/items?itemName=eliostruyf.vscode-front-matter
ext install eliostruyf.vscode-front-matter
#code --install-extension eliostruyf.vscode-front-matter

#docker #https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
ext install ms-azuretools.vscode-docker
#https://marketplace.windsurf.com/extension/ms-azuretools/vscode-docker

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


#makefile #https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools
ext install ms-vscode.makefile-tools
```


Diagrams/Wireframes...

* https://github.com/mydraft-cc/ui

> Open source wireframing tool written in typescript, react and redux.



```sh
#gemini assistant https://marketplace.visualstudio.com/items?itemName=Google.geminicodeassist

#jupyter https://marketplace.visualstudio.com/items/?itemName=ms-toolsai.jupyter

#excalidraw https://marketplace.visualstudio.com/items?itemName=pomdtr.excalidraw-editor
ext install pomdtr.excalidraw-editor

#formatter #https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
ext install esbenp.prettier-vscode
```

---


### Outro

Lately, a colleague mentioned to me about: `https://lovable.dev/`

> Lovable is an **AI software engineer**, which enables anyone to build for the web.

Simply chat to instantly build websites and web apps, with no technical knowledge needed.

It seems this is called vibe coding!

It requires a signup, yet, they provide a free tier.

Definitely have to take a look to suck tools and also to the open/local ones.

Use **VSCodium via container**:


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Dev" title="VSCOdium with Docker 🐋 ↗" >}}
{{< /cards >}}


#### Weekly Planning

> A proactive approach to planning, information sharing, and continuous learning:

================= WK1234 Y25 | Sprint 123ab =================

**Sprint Goal:** [Clearly state the overarching goal of the sprint]

{{< details title="Key Objectives for This Week 📌" closed="true" >}}

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

{{< /details >}}

### FAQ

#### MonoRepos and more

**What is a Mono repo?**

At its core, a monorepo is a single repository that contains code for *many* different projects, libraries, and applications.

Instead of having separate repositories for each part of your codebase, everything lives together in one big happy family.

Think of it like organizing all your important documents into one well-structured filing cabinet instead of scattering them across multiple folders and drawers.

**What are the Alternatives?**

The primary alternative to a monorepo is a **multirepo** (also sometimes called a polyrepo).

In a multirepo setup, each project, library, or application has its own distinct repository.

> This has been the more traditional approach for a long time.

**Pros and Cons:**

Let's weigh the advantages and disadvantages of each approach:

**Monorepo:**

**Pros:**

* **Simplified Dependencies:** Managing dependencies across projects becomes much easier. You can often have a single version of a library used by multiple projects, reducing inconsistencies and potential conflicts.
* **Code Sharing and Reuse:** It's simpler to share code and components between different parts of your organization. Changes to shared libraries are immediately available to all dependent projects.
* **Atomic Commits:** You can make changes that span multiple projects in a single commit, ensuring consistency across related code modifications.
* **Easier Refactoring:** Large-scale refactoring across multiple projects is more straightforward since all the code is in one place.
* **Centralized Build and Deployment:** You can often set up a unified build and deployment pipeline for all projects in the monorepo.
* **Improved Visibility:** It's easier to see how different parts of the system interact and understand the overall codebase.
* **Streamlined Onboarding:** New team members have a single place to clone the entire codebase, making it easier to get started (though the size can be a factor).

**Cons:**

* **Size and Scalability:** As the monorepo grows, it can become very large, potentially impacting clone times, build times, and IDE performance.
* **Build Complexity:** While centralization can be a pro, configuring and optimizing the build process for a diverse set of projects can become complex.
* **Permissions and Access Control:** Managing permissions and ensuring that teams only have access to the relevant parts of the codebase can be challenging.
* **Tooling Maturity:** While tooling for monorepos has improved significantly, it might not be as mature or widely adopted as tooling for multirepos in some areas.
* **Impact of Changes:** A breaking change in a shared library can potentially affect many different projects within the monorepo.
* **Perceived Complexity:** Some developers might find the sheer size and scope of a monorepo intimidating initially.

**Multirepo:**

**Pros:**

* **Clear Boundaries and Ownership:** Each project has its own repository, making ownership and responsibilities clear.
* **Smaller and Faster Clones:** Individual repositories are typically smaller, leading to faster clone times and less disk space usage.
* **Independent Builds and Deployments:** Projects can often be built and deployed independently, reducing the risk of one project's issues affecting others.
* **Technology Diversity:** Teams can choose the best technologies and tools for their specific project without impacting others.
* **Mature Tooling:** The tooling and workflows around multirepos are generally well-established and widely understood.
* **Improved Isolation:** Changes in one repository are less likely to have unintended consequences on other projects.

**Cons:**

* **Dependency Management:** Managing dependencies across multiple repositories can be complex, often leading to version inconsistencies and integration challenges.
* **Code Sharing Challenges:** Sharing code between repositories can be cumbersome, often requiring the creation and maintenance of separate libraries or packages.
* **Coordination Overhead:** Making changes that span multiple projects requires more coordination and can be more prone to errors.
* **Refactoring Difficulties:** Large-scale refactoring across multiple repositories is significantly more challenging.
* **Inconsistent Development Experience:** Teams working on different repositories might have different build processes, testing strategies, and deployment workflows.
* **Reduced Visibility:** It can be harder to get a holistic view of the entire system and how different parts interact.

**Which one is right for you?**

The choice between a monorepo and a multirepo depends heavily on the specific needs and context of your organization and projects.

* **Monorepos** often work well for organizations with many interconnected projects, a strong emphasis on code sharing, and the resources to invest in robust tooling and infrastructure. Companies like Google, Facebook, and Twitter are well-known users of monorepos.
* **Multirepos** might be a better fit for organizations with highly independent teams and projects, a need for strict isolation, or when working with a diverse range of technologies with limited overlap.