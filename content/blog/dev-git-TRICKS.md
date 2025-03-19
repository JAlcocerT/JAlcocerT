---
title: "Git & Development Tricks: Github, Gitlab and more"
date: 2025-02-20T23:20:21+01:00
draft: false
tags: ["Dev"]
url: 'git-recap'
description: 'Git and useful extensions while developing.'
---

* Name: **Dev Containers**
    * Id: ms-vscode-remote.remote-containers
    * [VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)


Remember that there are many cool extensions: https://marketplace.visualstudio.com/VSCode

And that they can be installed programatically:

```sh
codium --install-extension gitlab.gitlab-workflow
#code --install-extension gitlab.gitlab-workflow
```

You will also need:

```sh
git config --global user.name "JAlcocerT"
git config --global user.email "youremail@example.com"
```

### Github

1. Use vscode on the cloud with: https://github.com/codespaces/
2. GISTS are a great way to share code: https://jalcocert.github.io/JAlcocerT/github-gists/

```sh

```

![alt text](/blog_img/dev/github-auth.png)

#### Creating Releases

And given a project, you can **get the latest Github release** as per:

<!-- https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8 -->
{{< gist steinwaywhw a4cd19cda655b8249d908261a62687f8>}}


#### Github Actions

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/github-actions-use-cases/" title="GHA 101 Post" image="/blog_img/apps/gh-jalcocert.svg" subtitle="How to get the most out of Github Actions" >}}
{{< /cards >}}

Github Actions **MultiArch Images**:

1. With QEMU: as explained here
2. ARM86 native builds with GHA

> Since this year, 2025, we can also build ARM64 images natively with GHActions!

#### Github Pages

https://jalcocert.github.io/JAlcocerT/how-to-use-github-pages/

### Gitlab

Not everything is Github.

There are very cool projects on Gitlab as well.

```sh
code --install-extension gitlab.gitlab-workflow
```

![alt text](/blog_img/dev/gitlab-extension.png)

https://jalcocert.github.io/JAlcocerT/how-to-use-gitlab/

> Definitely use the extension `GitLab Workflow VS Code Extension` and authenticate with OAuth.

## VSCode

There are some cool extensions to help you create.

### Remote Development

https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/

```sh
ext install ms-vscode-remote.remote-containers
#code --install-extension ms-vscode-remote.remote-containers
```

### SSH Dev

### Container Dev


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