---
title: "From Repo Docs to Promo Video"
date: 2026-04-06
draft: false
tags: ["AI Docs","RemotionJS Video","F/OSS"]
description: 'Automatic repository 2 Docsand...Videos.'
url: 'oss-automatic-docs-and-tech-video'
---



**Tl;DR**

Last year [here](https://jalcocert.github.io/JAlcocerT/tech-for-podcast/)... I was working for some kind of project [to do automatic docs](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#vibe-coded-project-docs)


**Intro**

But models have improved a lot

Specially: [Claude...](https://www.anthropic.com/news/claude-opus-4-6)

```sh
#Copy your public key:
cat ~/.ssh/id_ed25519.pub
#Copy the full output.
#Add the key in GitLab:
#Go to GitLab -> Preferences / Edit profile -> SSH Keys -> paste the key -> Add key.
#ssh -T git@gitlab.com
git clone git@gitlab.com:fossengineer1/fossengineerpapermod.git
```

This started [long ago](https://github.com/JAlcocerT/FOSSEngineer_old)

## Extracting Repo Info

Previously I was using interesting workflows with scripts.

Like I have at folders like `Z_codex_posts` or `Z_OpenAI_POSTS`.

But...

agents are beyond that at this point

### From Repo to Post

Lets go with an example?

```sh
git clone https://github.com/elduty/velomate
claude
```

Ive already built an skill for this: `foss-post`

Because thats really all there is: https://skills.sh/

> Skills are reusable capabilities for AI agents. Install them with a single command to enhance your agents with **access to procedural knowledge**.


```sh
#npx skills add https://github.com/github/awesome-copilot --skill documentation-writer
/foss-post /home/jalcocert/Desktop/TBT/velomate --depth medium
```

![Meme - Fantastic](/blog_img/memes/trol-trol.gif)


> You can also see other that [people created](https://skills.sh/github/awesome-copilot/documentation-writer)




### From Repo to Video


How about...creating/combining another skills, so that we do video?


Yea, remotion again:

```sh

```


## About FOSS - Repo to Video

What if for every cool repo not only a nice post could be generated:

```sh
#git clone https://github.com/davidmonterocrespo24/velxio ./Desktop/TBT
claude #/skills #use the foss-post against the cloned repo
cp /home/jalcocert/Desktop/TBT/velxio-post.md
      /home/jalcocert/Desktop/fossengineerpapermod/content/posts
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/velxio/" title="Velxio | Docker Config 🐋 ↗" >}}
{{< /cards >}}

But also a nice RemotionJS video about it?

* https://www.remotion.dev/docs/ai/claude-code
* Source: https://github.com/remotion-dev/skills.git

If you do the: *make sure to do it on a folder w/o git, or it wont prompt you for the add skills part and avoid creating a totally blank folder!*

```sh
npx create-video@latest #y / blank
cd ./my-remotion-video
npm install
npm run dev #now it works!

mv /home/jalcocert/Desktop/video-test-remotion /home/jalcocert/Desktop/fossengineerpapermod/z-remotion-oss/video-test-remotion
  
#/home/jalcocert/Desktop/VideoEditingRemotion/remotion-cc/.claude/skills/remotion-best-practices
```

```sh
cd ./z-remotion-oss/video-test-remotion
npm run dev
```

```md
 ok so inside that video-test-remotion, can we make a video that describes
  what velxio does, using the UI/X of its components or any png that they
  have at the repository? the video should be appealing for selfhosting
  enthusiast
```

```sh
npx remotion render VelxioShowcase selfhosting-velxio.mp4
```

<!-- 
https://youtu.be/H5Q6fQyPptE 
-->

{{< youtube "H5Q6fQyPptE" >}}


> All powered by ,just' Haiku 4.5



---

## Conclusions

This is the kind of post that makes me realize this year ill be doing 99 posts...instead of the much less planned.

Talking about f/oss I tested mac OS with Zed and CodeEdit

Interestingly, there is a fork of zed called GRAM that [has been quite interesting](#what-ive-tried-recently).


### Other High Signal Videos

Ive been tinkering around these too:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="DataInMotion | Repo" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditingRemotion" title="Remotion tests | Repo" icon="github" >}}
{{< /cards >}}

Has this signal make F1 re-think their strategy and make v8's come back?

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-scripts-and-animated-data/" title="A Summary of Animations" image="/blog_img/karting/long_g_trace_L4.png" subtitle="Post with animated F1, Real Estate, yfinance..." >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/f1-data-animated/" title="F1 Animated Data" image="/blog_img/karting/long_g_trace_L4.png" subtitle="Creating animations around F1 Data | Post" >}}
{{< /cards >}}

### Marketing Videos for your Services

If all previous is true...

Why not......

```sh
#https://github.com/vercel-labs/just-bash
#npm i -g @openai/codex 
/jalcocertech-services #sales pitch
```

Coming soon, together with `https://stitch.withgoogle.com/`

---


## FAQ

CLIs ive used recently?

```sh
#docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" | (read -r; printf "%s\n" "$REPLY"; sort -hk 3 -r)
lazydocker
#docker ps --filter "status=running"
#docker ps -a --filter "name=entre"
#docker stats home-assistant
docker system df

glances #htop btop
#sudo snap install ghostty --classic
#tmux #ghostty
```

```sh
sudo apt-get clean
sudo apt-get autoremove
journalctl --disk-usage #sudo du -sh /var/log
#sudo journalctl --vacuum-time=2d
```

Lack of disk space?

```sh
sudo apt update && sudo apt install ncdu
#sudo ncdu -x /
#sudo ncdu -x .
```

![NCDU tool to check disk space](/blog_img/selfh/HomeLab/ncdu-nextcloud.png)

```sh
#whois ebooks.jalcocertech.com| grep -i -E "(creation|created|registered)"
nslookup ebooks.jalcocertech.com
dig ebooks.jalcocertech.com
#sudo docker stop 1tonebooksprod grafana-server
#docker rm -f $(docker ps -aq --filter "name=entre")
```

### What ive tried recently

What else am I running [since last month](https://jalcocert.github.io/JAlcocerT/private-dns-with-docker/#faq)?

```sh
#git clone https://github.com/JAlcocerT/Home-Lab/
#cd ./Home-Lab/z-homelab-setup/evolution 

#docker ps --filter "status=running"
sudo docker compose -f 2604_docker-compose.yml up -d uptime....pihole nextcloud ncdb.......
```

More with the [mac M2](https://jalcocert.github.io/JAlcocerT/cad-design-mbsd/#rendering-on-a-mac-m2) and...

```sh
#sudo snap install ghostty --classic
ghostty
#codeedit
#zed #gram #https://codeberg.org/GramEditor/gram
#glances
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/Termix" title="Termix with Docker 🐋 ↗" >}}
{{< /cards >}}


Which reminds me somehow to tmux *the one I used [here with blender](https://jalcocert.github.io/JAlcocerT/about-constrained-mechanism/) and my x300*


```sh
#brew install ffmpeg #you didnt know you need FFMPEG, but you DO NEED IT
brew install gh
#gh auth login
#gh auth status
git clone https://github.com/JAlcocerT/3Design
cd ./3Design/mbsd-to-render/four-bar

make check #make help
#make scene-ui #this starts blender UI
time make all #makes all the steps, including the render programatically!
#make render #or do this one for just the render of the scene-ui was OK

#tmux new-session -d -s cad "make all" #if you will be leaving this for the night
#tmux attach-session -t cad #to see hows going
```

Wait....56 seconds to render?

On battery power?!

My 5600G was taking like...10 min?!

that was for 1080p, so i went ahead and made it **harder**:

```sh
cd four-bar-mac
make clean-all
make install UV_PYTHON=3.12
.venv/bin.python --version

#make scene-ui
time make render all
```

Say thx to pairdrop, see the difference

<!-- https://youtu.be/r0eg5onWbn0 -->

{{< youtube "r0eg5onWbn0" >}}

Oh the time for **4K with final presets**?

This was 26min at the M2 and I did not dare to try it with my x13 nor the x300.
