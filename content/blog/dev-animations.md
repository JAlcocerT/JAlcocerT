---
title: "Creating Animated Data Stories | Data in Motion"
date: 2025-07-04T18:20:21+01:00
draft: false
description: 'From Embedded Analytics into SSGs Websites to Data Driven Animations.'
tags: ["Animations","Python","Matplotlib Animations","Youtube Shorts","Social Media"]
url: animations-as-a-code
---

Not long ago I was tinkering with [AI/BI Tools](https://jalcocert.github.io/JAlcocerT/ai-bi-tools/): ChartBrew, ChartDB, DB2Rest and [Streamlit x PyGWalker](#conclusions)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker" title="AI BI Tools Post" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Writting about Streamlit PoC with PyGWalker" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="Streamlit PoC" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

From there, I could not resist to **create this project**:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/keystaticcms-astrodb/#animations" title="Tinkering with Animations | Post" image="https://img.youtube.com/vi/YuvHXyFeRV4/hqdefault.jpg" subtitle="Posting to Twitter or Youtube those animations 101." >}}
  {{< card link="https://github.com/JAlcocerT/DataInMotion" title="Data In Motion Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Generating mp4 animations with Matplotlib and Python..." >}}
{{< /cards >}}

<!-- ![Rick Astley - Never Gonna Give You Up](https://img.youtube.com/vi/YuvHXyFeRV4/hqdefault.jpg) -->

Sometime ago, I was exploring some [options to create video as a code](https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/#video-as-a-code)

I tried something on [**RemotionJS** on this repo](https://github.com/JAlcocerT/VideoEditingRemotion)

As always, there is a fireship cool video on [Remotion](https://github.com/remotion-dev/remotion):

But...it was not enough for me to get started with someting cool.

Maybe now this can be a thing, since we have [MCP](https://jalcocert.github.io/JAlcocerT/ai-understanding-mcp-framework/) + Windsurf or GeminiCLI [Configured with Git-MCP](https://jalcocert.github.io/JAlcocerT/ai-tools-for-cli/#gemini-cli-x-mcp)

* https://github.com/idosal/git-mcp
    * https://gitmcp.io/remotion-dev/remotion
    * https://gitmcp.io/remotion-dev/remotion/chat

```json
{
  "mcpServers": {
    "gitmcp": {
      "serverUrl": "https://gitmcp.io/remotion-dev/remotion"
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

I created [this repo for putting *real life* videos together](https://github.com/JAlcocerT/YT-Video-Edition), as covered on [these posts](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/)

## Animations with Python

[Python](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/) is a versatile programming language that can be used for a wide range of tasks, including creating animations. 

### Matplotlib Styled Charts

Before animating: be aware that you can create **styled plots with matplotlib**.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/" title="Matplotlib x YFinance" image="/blog_img/data-experiments/sample-matplotlib-timeseries.png" subtitle="Using Matplotlib to generat TimeSeries Styles Snapshots" >}}
{{< /cards >}}

They wont be interactive, but they can look pretty cool!

{{< details title="Vibe Coding Proper Styled Matplotlib Charts 📌" closed="true" >}}

If you are using Windsurf or similar tools, make sure to ask them to bring:

1. Brand Colors
2. Adding *watermark* / url or not
3. Proper modules for: pull data, store data, transform data + style plots (you can have one for price, another for dividend oriented...)
4. Output format size (resolution)

{{< /details >}}

You can create a script with modes, in such a way that given few parameters, it will generate for you whatever domain specific chart you need.

But now...

Is it even possible to create a full `.mp4` with code?

### Matplotlib Animations

Apparently, it is: *and not necesarily with plotly, as I tought*

And again, people are doing fantastic stuff with matplotlib:

* <https://jakevdp.github.io/blog/2012/08/18/matplotlib-animation-tutorial/>
* <https://jckantor.github.io/CBE30338/A.03-Animation-in-Jupyter-Notebooks.html>

Even very interesting [video use cases](#cool-data-driven-videos) with them!


From Data to Streamlit to Animation to Video, is a topic that I tinkered [during the AIssistant, here](https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/Z_Tests/ST_AutomaticYTVideo).

Now, the concept I want to do is very simple:

1. Generate Code & Data driven animations
2. Use Python to pull the data (and save the data for the records)
3. Use matplotlib for the final `.mp4` animations
4. Have as parameter the time of the animation and its output resolution

Something very similar, but [with mechanisms](https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/#conclusions), can be done as well!

{{< youtube "2xMOxiRz6F4" >}}

<!-- https://youtube.com/shorts/2xMOxiRz6F4?feature=share -->

But same as it can be done for mechanism, it can be done for time series data, like this SP500 returns which is powered by [this script](https://github.com/JAlcocerT/DataInMotion/blob/main/tests/animate_total_return_from_csv.py)

{{< youtube "I46bPuSdrqk" >}}
<!-- https://youtu.be/I46bPuSdrqk -->

Then, your imagination is the limit, as you can do scripts to compare few stocks returns and placing some [OpenAI APi TTS audio](https://github.com/JAlcocerT/DataInMotion/tree/main/OpenAI-Audio) that describes them:

1. Create your AI-audio and matplotlib generated video (of 10s duration):

```sh
uv run ./OpenAI-Audio/openai-tts.py --env=./.env
ffmpeg -f s16le -ar 24000 -ac 1 -i audio_reply.pcm audio_reply.mp3 #transform it to mp3

uv run animate_sequential_compare_price_evolution_flex_custom.py MC.PA RMS.PA 2010-01-01 10 short
#ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 animated_yt_short.mp4
```

> Creating a "full circle" or cyclical narrative can be incredibly impactful for youtube shorts (1080x1920)

https://www.youtube.com/watch?v=XrQliJX-e8A
https://www.youtube.com/watch?v=GrVIJ6Xb_I0

The trick is to reference the beginning in the end, but with the added context or impact of what was just revealed in the middle.

2. Combine them and **give 5 seconds** time for the video to be paused and audio to keep going:

```sh
ffmpeg -y -i luxury-ytshort.mp4 -i audio_reply.mp3   -filter_complex "[0:v]tpad=stop_mode=clone:stop_duration=5[v_extended]"   -map "[v_extended]" -map 1:a:0   -c:v libx264 -preset fast -crf 23 -c:a aac   ./luxury-ytshort_extended_frozen_audio_added.mp4
```

<!-- https://youtube.com/shorts/FQVSITWjxJE -->
{{< youtube "FQVSITWjxJE" >}}


{{< callout type="info" >}}
You can bring those, even snapshots or gif to [other social media](#social-media-automation) platforms
{{< /callout >}}



## Animations x SSG

This year I also was playing around with Astro components.

And withing the datanova theme, I found out that they are doing a really cool animation (which is a SVG!)

```sh
npm install
#npm run dev
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

---

## Conclusions

You can organize your repository in a way that from one source code, you have different kind of outputs:

```sh
git branch libreportfolio 285484eafeae5c79436cef73678df8ae5153bc52
git checkout libreportfolio
```

Or say:

```sh
git branch unfoldingdata 285484eafeae5c79436cef73678df8ae5153bc52
git checkout unfoldingdata
git branch -a
```

### Embedded Analytics

### Ipyvizzu

Probably oriented more if you are [building PoCs](https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#data-stories-with-a-notebook-and-ipyvizzu) at work.

* https://github.com/vizzuhq/ipyvizzu-story

> **Apache v2** | Build, present and share **animated data stories** in Jupyter Notebook and similar environments. 

* https://ipyvizzu-story.vizzuhq.com/latest/
* https://ipyvizzu.vizzuhq.com/latest/installation/
* https://pypi.org/project/ipyvizzu-story/


---

## FAQ

### Social Media Automation

If you are able to create mp4 animations, you can also create images or animated `.gif` from them.

With those, you can go to different social media platforms and share the content you have just created.


{{< tweet user="LibrePortfolio" id="1940801205577699713" >}}


**Social Media Management Apps**

- [Shoutify](https://github.com/TechSquidTV/Shoutify)

Social Media can be simplified:

![Forocoches3kbmw](/blog_img/memes/ezoeazin.jpg)


1. Postiz-App - https://github.com/gitroomhq/postiz-app
    * https://docs.postiz.com/introduction
    
> 📨 The ultimate **social media scheduling tool**, with a bunch of AI 🤖 and Apache 2.0!

I got working PostIZ recently, together with Traefik, both as containers and locally accesible: https://postiz.jalcocertech.com/launches

* https://docs.postiz.com/reverse-proxies/traefik
* You could also install it as part of [Coolify](https://jalcocert.github.io/JAlcocerT/deploying-software-with-paas-to-servers/#coolify) or similar PaaS, like [Dokploy](https://jalcocert.github.io/JAlcocerT/selfhosted-paas): https://coolify.io/docs/services/postiz

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Postiz" title="PostIZ Container | Docker Configs 🐋✅ ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security/Proxy/Traefik" title="Traefik Container | Docker Configs 🐋✅ ↗" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#how-to-setup-postiz" title="PostIZ Setup | Post" image="/blog_img/selfh/links/postiz-channels.png" subtitle="Writting about Streamlit PoC with PyGWalker" >}}
{{< /cards >}}

Do the setup for the platforms you need: https://docs.postiz.com/providers/youtube

{{< callout type="info" >}}
[PostIZ also has MCP](https://postiz.jalcocertech.com/settings): Connect your MCP client to Postiz to schedule your posts faster!
{{< /callout >}}

You will get something like:

```txt
https://postiz.jalcocertech.com/api/mcp/some_id_here/sse
```

2. [Zapier](https://zapier.com/app/home)

* Canva seems to have it too

* [IFTTT](https://ifttt.com/plans)

* **N8N** AI Automation - https://n8n.io/workflows/2950-ai-powered-social-media-content-generator-and-publisher/

[N8N with ollama video](https://www.youtube.com/watch?v=VDuA5xbkEjo)

* Active Pieces - https://github.com/activepieces/activepieces

> Your friendliest open source AI automation tool ✨ Workflow automation tool 200+ integration / Enterprise automation tool / Zapier Alternative

### Cool Data Driven Videos

{{< youtube "pcQIF8kHbp1flsBb" >}}
<!-- https://youtu.be/5yAbVkIMl_M?si=pcQIF8kHbp1flsBb -->

Fractal stuff:

{{< youtube "QU1nxIYNIRbOFe9j" >}}

<!-- https://youtube.com/shorts/ugBTczoyFRo?si=QU1nxIYNIRbOFe9j -->


Data is beautiful, indeed:
<!-- https://www.youtube.com/watch?v=29qnXTw0qr0 -->

{{< youtube "29qnXTw0qr0" >}}

How could I not mention the awsome 3B1B channel and its OSS animation engine, that I recommended [here](https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/#cool-stuff-for-researchers)

* https://github.com/3b1b/manim
* https://github.com/3b1b/videos?tab=readme-ov-file#workflow
* https://github.com/ManimCommunity/manim/

> Math Animation engine for explanatory math videos. The ones [3Blue1Brown Channel created](https://www.youtube.com/watch?v=rbu7Zu5X1zI)!

{{< youtube "rbu7Zu5X1zI" >}}