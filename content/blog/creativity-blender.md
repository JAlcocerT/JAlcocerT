---
title: "Using Blender"
date: 2026-03-20T08:00:21+01:00
draft: false
tags: ["Gen-AI","Python","Design Patterns","OpenSCAD"]
description: 'Creating is easier than ever (?)'
url: 'using-blender-with-ai'
---


**Tl;DR**

Blender vs FreeCAD vs OpenSCAD

<!-- https://youtu.be/r7H60u0kHRA?si= -->

{{< youtube "r7H60u0kHRA" >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/coolresources/engineering/" title="Engineering | Docs ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/mbsd" title="MBSD | Repo" icon="github" >}}
{{< /cards >}}


**Intro**

Last year, I saw a very cool video about **design patterns**.

<!-- https://www.youtube.com/watch?v=8UAsN9wvePE -->

{{< youtube "8UAsN9wvePE" >}}


And there is something about designs that have always captivate me.

Whats does make something so good, that it lasts the beats of time?

How can we create someting that is valued by people?

Even from totally different generations:

![Porsche design](/blog_img/outro/porsche.png)

I belive you would agree that the 911 design is one of those.

But...I want to create stuff.

Real stuff.



## Using Blender

Blender is an absolute powerhouse for "design-as-code," but it is a **mesh-based** tool, which makes it fundamentally different from the **CAD-based** tools like CadQuery or OpenSCAD.

Here is the breakdown of how Blender fits into an "agentic" workflow:

1. Can Blender be driven by Python?

**Yes, deeply.** Blender is essentially a Python application with a C++ kernel. 

Almost every button you click in the UI triggers a Python command behind the scenes.


* **The `bpy` Module:** This is the main API. An agent can create objects, move vertices, apply textures, and set up lighting entirely through code.

* **The "Info" Panel Trick:** If you want to see what code an agent needs to write, you can open the "Info" editor in Blender. It logs the Python equivalent of every manual action you take, making it a great "cheat sheet" for training agents.

* **Agent Advantage:** Blender allows agents to do things CAD tools can't easily do, like **procedural textures, physics simulations, and high-end rendering.**

2. Blender vs. CAD (The "Topology" Problem)

While an agent *can* design a mechanical part in Blender using Python, there is a catch:

* **CAD (CadQuery/OpenSCAD):** Uses mathematical solids (BREP/CSG). If an agent tells a CAD tool to "drill a hole," the hole is a perfect circle.

* **Blender:** Uses a "mesh" (vertices and faces). If an agent tells Blender to "drill a hole," it has to cut into a grid of triangles or quads. This often creates "messy" geometry that is hard for an agent to fix if things go wrong.

> **The Verdict:** If your agent is designing **mechanical/precision parts**, use **CadQuery**. If your agent is designing **visual assets, characters, or environments**, use **Blender**.

---

3. Using CAD Outputs in Blender (The "Hybrid" Workflow)

The most sophisticated AI agent setups actually use **both**. 

You let the agent design the "skeleton" in a CAD tool and then "beautify" it in Blender.

| Workflow Step | Tool Used | Why? |
| :--- | :--- | :--- |
| **1. Precision Modeling** | CadQuery / OpenSCAD | Agent writes code to define exact dimensions and holes. |
| **2. Export** | **STL** or **STEP** | Standard formats that bridge the two worlds. |
| **3. Import to Blender** | `bpy.ops.import_mesh.stl` | The agent uses Python to bring the CAD file into a Blender scene. |
| **4. Rendering & FX** | Blender (Python) | The agent applies materials, adds "wear and tear," and renders a photo-realistic image. |

4. Recent Innovations (2026 Context)

* **Blender MCP (Model Context Protocol):** There are now "MCP Servers" for Blender. These allow an AI agent to "live" inside Blender, seeing the viewport and executing code in real-time rather than just generating a script and hoping it works.

* **Geometry Nodes:** This is Blender's version of "visual coding." Agents are becoming very good at generating "Geo Nodes" trees, which are parametric and much more "CAD-like" than traditional mesh editing.


### Installing Blender

I was consolidating [here](https://jalcocert.github.io/Linux/docs/debian/foss_engineering/#blender) some OSS Tools for engineering and how ti install them with Ubuntu.

Among them, Blender, we just need:

```sh
#choco install blender --version=4.2.2 -y                              
#5.1.0  >4.0.0

#https://www.blender.org/download/release/Blender4.3/blender-4.3.1-linux-x64.tar.xz/

sudo snap install blender --classic #it might be lower, like 4.3.1
#sudo snap install blender --channel=4.3/stable --classic
```

You can always download your desired blender versions from: <https://www.blender.org/download/>

### Blender as a Code

I know i might sound lazy.

BUT

Drag and drop on an interface...is something that id like to have automated for me.

And I heard about **Blender with Python Scripting**.

{{< youtube "mJU7owctel4" >}}

Thanks to <https://github.com/CGArtPython/blender_plus_python/tree/main>


Not only heard, but actually...just did sth [with it and a slider crank here](https://jalcocert.github.io/JAlcocerT/cad-design-mbsd/):

```sh
snap info blender
#choco install blender --version=4.2.2 -y                                      

git clone https://github.com/JAlcocerT/3Design
cd z-cadquery
make all
#make render   # renders all 180 PNGs
#make video    # assembles them into render/output.mp4 via ffmpeg
```


Telling blender what to run on its internal engine can be a thing:

```sh
blender -b --python my_script.py
```

To install **Blender 4.2.2** (or the latest patch in the 4.2 LTS series) using the portable "Tarball" method, follow these exact steps in your terminal. 

This approach is perfect for your HUD project because it keeps Blender's Python isolated and fully customizable.

1. Create the Directory

First, let's create a clean home for this specific version so it doesn't get mixed up with other apps.

```bash
mkdir -p ~/Applications/Blender4.2
cd ~/Applications/Blender4.2
```

2. Download Blender 4.2.2
We'll use `wget` to pull the specific Linux 64-bit archive directly from the official Blender foundation servers.

```bash
wget https://download.blender.org/release/Blender4.2/blender-4.2.2-linux-x64.tar.xz
```

3. Extract the Archive
Now we unpack it. We'll use the `--strip-components=1` flag so that the files go directly into your `Blender4.2` folder instead of creating *another* sub-folder inside it.

```bash
tar -xvf blender-4.2.2-linux-x64.tar.xz --strip-components=1
```

4. Clean Up (Optional)

```bash
rm blender-4.2.2-linux-x64.tar.xz
```

5. Launch and Verify


```bash
./blender
```

To check which **Python version** this specific Blender is using (important for your script imports), run this:

```bash
./4.2/python/bin/python3.11 --version
```


### Blender with AI

Image generations models are really interesting.

[On this post](https://jalcocert.github.io/JAlcocerT/stable-difussion-free-generation/) I have reviewed recently the latest tools to use them.

With controlnet and flux

* https://www.reddit.com/r/comfyui/comments/1ekv3tx/poseable_humans_with_flux_blender_playbook/

But i want control on the generation.

That it can be achieved via:

```sh
claude

```

If you still got a live, its over: https://code.claude.com/docs/en/remote-control#interactive-session

```sh
claude --remote-control "My Project"
```

#### ControlNet vs

With Control net, we can provide more than a text prompt to get the desired results from the T2I models.

I mean, we can provide images as prompts!

{{< youtube "o7N6Fbtg84E" >}}

Can we do such animations with blender?

https://youtu.be/58C8dWL36GM

{{< youtube "58C8dWL36GM" >}}


* <https://docs.linuxserver.io/images/docker-cura/>
* FREE CAD

{{< cards >}}
  {{< card link="#conclusions" title="MultiChat UI" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="How the final multichat UI looks like" >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="3D Design Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of scripts for Blender, OpenSCAD and more" >}}
{{< /cards >}}

### The Blender Project

While primarily known as a 3D modeling and rendering software, Blender also includes robust animation capabilities.

It's one of the most comprehensive open-source animation suites available, offering features for 3D animation, rigging, modeling, simulation, rendering, and more.

* {{< newtab url="https://www.blender.org/" text="The Blender Official Site" >}}
* {{< newtab url="https://github.com/blender/blender" text="The Uptime Blender Code at Github" >}}
    * License: {{< newtab url="https://github.com/blender/blender?tab=License-1-ov-file#readme" text="GNU GPL" >}} ✅ 


<!-- https://www.youtube.com/watch?v=r7H60u0kHRA -->
{{< youtube "r7H60u0kHRA" >}}

* https://gitmcp.io/blender/blender/chat

```json
{
  "mcpServers": {
    "gitmcp": {
      "serverUrl": "https://gitmcp.io/blender/blender"
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

## Blender API - With Python

* https://www.youtube.com/watch?v=cyt0O7saU4Q&list=PLFtLHTf5bnym_wk4DcYIMq1DkjqB7kDb-

{{< youtube "cyt0O7saU4Q" >}}


* https://docs.blender.org/api/current/
* https://docs.blender.org/api/current/info_overview.html



* https://docs.blender.org/manual/en/dev/advanced/blender_directory_layout.html#blender-directory-layout
* https://pypi.org/project/bpy/

### Examples

{{< dropdown title="Create a sphere: 👇" closed="true" >}}


```py
#import bpy
#bpy.data.objects["Cube"].data.vertices[0].co.x += 1.0

import bpy

# Add a UV Sphere
bpy.ops.mesh.primitive_uv_sphere_add(radius=10, location=(0, 0, 0), segments=32, ring_count=16)

# Select the newly created sphere
sphere = bpy.context.object

# Optionally, you can give the sphere a material
# Create a new material
material = bpy.data.materials.new(name="Sphere Material")

# Assign a color to the material (e.g., red in RGBA format)
material.diffuse_color = (1, 0, 0, 1)  # (R, G, B, A)

# Assign the material to the sphere
sphere.data.materials.append(material)

```

{{< /dropdown >}}

### BLENDER RIGID BODY SCRIPTING



## Render with Stable Diffusion

## Blender for Video Editing

<!-- https://www.youtube.com/watch?v=9tWEsqIgeDY -->
{{< youtube "9tWEsqIgeDY" >}}

You can even use it to bring custom [LUT](https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#color-grading) to videos, apparently!

---

## FAQ


### How to Install Stable Difussion

* https://aman.ai/primers/ai/diffusion-models/

> Great explanation on how these model work

### F/OSS Animations Suites

1. Synfig Studio: Synfig Studio is a 2D vector-based animation software. It's designed for creating high-quality 2D animations with a focus on flexibility and scalability. Synfig Studio supports a wide range of features, including vector tweening, bone rigging, and bitmap artwork integration.

2. OpenToonz: OpenToonz is a professional 2D animation software used by studios such as Studio Ghibli. It offers a comprehensive set of features for traditional frame-by-frame animation, including raster and vector drawing tools, compositing, and animation effects.


{{< dropdown title="More Open Source Animation Suites 👇" closed="true" >}}

3. Krita: While primarily known as a digital painting software, Krita also includes animation features. It supports frame-by-frame animation and offers a range of tools for creating and editing animations, including onion skinning, timeline-based editing, and brush-based animation.

4. Pencil2D: Pencil2D is a simple and intuitive 2D animation software suitable for beginners and hobbyists. It offers basic drawing and animation tools for creating traditional frame-by-frame animations.

5. TupiTube: TupiTube is a 2D animation software designed for children and beginners. It provides a simple and user-friendly interface for creating basic animations using vector-based drawing tools.

{{< /dropdown >}}


6. Recently Motion Canvas was released as Open Source as well, with MIT license ❤️ - https://github.com/motion-canvas/motion-canvas

Motion Canvas is a tool that bridges the gap between code and animation, specifically targeted at creating animated videos.

* Create Animations with Code: https://github.com/motion-canvas/motion-canvas
  * https://github.com/motion-canvas/motion-canvas?tab=MIT-1-ov-file#readme

A TS library for creating animated videos using the Canvas API.

> MIT| Visualize Your Ideas With Code 

{{< details title="More about Motion Canvas 📌" closed="true" >}}

Library & Editor: Motion Canvas offers two main parts:

1. Library (written in TS): This library allows you to write animation code using generators, providing a structured approach for creating animations.
2. Web-based Editor: This editor provides a real-time preview of your animations as you write the code.

Animation with Canvas API: Motion Canvas leverages the Canvas API, a built-in functionality of web browsers that allows for dynamic manipulation of graphics. 

This gives you control over various visual elements of your animation.

Benefits:

Combined Power of Code and UI:  Motion Canvas offers the benefits of both writing code for precise control and a visual editor for intuitive adjustments, making it suitable for users with different comfort levels. -->

 
To use Motion Canvas, you'll need a few things:

Node.js and npm: Motion Canvas relies on Node.js, a JavaScript runtime environment, and npm (Node Package Manager) for managing dependencies. You can download and install them together from the official Node.js website: https://nodejs.org/en

Code editor: You'll need a code editor of your choice to write and edit your Motion Canvas code. Popular options include Visual Studio Code, Atom, or Sublime Text.

(Optional) ffmpeg: While not strictly necessary for basic functionality, ffmpeg is a powerful tool for video encoding and manipulation. Motion Canvas can leverage ffmpeg for exporting your animations as videos. You can find installation instructions for ffmpeg based on your operating system through a web search. 

{{< /details >}}

### Python x OpenSCAD

* https://github.com/SolidCode/SolidPython

## CAD for Agents

For developing AI agents that design "as-code," the best open-source CAD program is **CadQuery**, with **OpenSCAD** being a strong runner-up depending on the complexity of your geometry.

While many traditional CAD tools (like FreeCAD) have Python APIs, they are often "wrappers" around a visual interface. 

For an agent to "think" in code, you want a library where the code *is* the model.

---

1. Top Recommendation: CadQuery https://github.com/cadquery/cadquery

CadQuery is a Python-based library that treats CAD like a standard software engineering task.

It is currently the "gold standard" for programmatic design because it uses a **BREP (Boundary Representation)** kernel (OpenCASCADE), the same high-end engine used by professional tools like SolidWorks.

* **Why it's best for Agents:**
    * **Standard Python:** Agents can use standard Python libraries (math, NumPy, etc.) and IDE features like linting and debugging.
    * **"Fluent" API:** It uses a chainable syntax (e.g., `.box(10,10,10).faces(">Z").hole(2)`) which is highly readable and easy for LLMs to generate accurately.
    * **Design Intent:** You can select parts of a model by their features (e.g., "the top face" or "all edges longer than 5mm") rather than hard-coding coordinates.
    * **STEP Support:** Unlike simpler tools, it exports to STEP files, which are required for professional manufacturing and CNC.

2. Best for Simple Geometry: OpenSCAD
OpenSCAD is the "original" code-based CAD. It uses a custom functional language and a **CSG (Constructive Solid Geometry)** approach.

* **Pros:** It is extremely lightweight and has a massive library of community-made parts (like "BOSL2"). It is very stable and difficult to "break" with bad code.
* **Cons:** It is famously bad at fillets (rounded edges) and chamfers. It also doesn't support STEP export natively (it mostly exports STL), making it less "professional" for engineering.
* **Agent Fit:** Use this if your agent is doing simple 3D printing tasks or grid-based modular designs.

---

Comparison at a Glance

| Feature | **CadQuery** | **OpenSCAD** | **FreeCAD (Python)** |
| :--- | :--- | :--- | :--- |
| **Language** | Python (Standard) | Custom (OpenSCAD) | Python (API Wrapper) |
| **Kernel** | OpenCASCADE (Professional) | CGAL (Basic) | OpenCASCADE |
| **Philosophy** | Selection & Feature based | Adding/Subtracting Shapes | Visual-first, Scriptable |
| **Best For** | Complex engineering/Agents | Hobbyist 3D printing | Manual design + Automation |
| **Export Formats** | STEP, STL, GLTF, DXF | STL, OFF, DXF | All standard formats |

---

3. The "Deep Learning" Alternative: Build123d https://github.com/gumyr/build123d

If you want the absolute latest tech, check out **Build123d**. It is a successor/alternative to CadQuery that is designed to be even more "Pythonic" and solves some of the internal complexities of CadQuery. It is gaining a lot of traction in the "CAD as Code" developer community.

Summary for your Agent

If you want your agent to produce **manufacturable, professional-grade parts**, build your agent's toolset around **CadQuery**. If you want the agent to quickly "sketch" **simple 3D printable objects**, **OpenSCAD** is easier to implement and has more training data available in LLMs.

I saw recently this video:

https://www.youtube.com/watch?v=8n7LfHpgn2M


And could not resist to try that with the 2D mechanism that I have ready in Python.


---

## Conclusions


The level of some people creating animations:

https://www.youtube.com/watch?v=_nR1-J676ao



{{< callout type="info" >}}
With Python **MoviePy**, as covered on [this post](https://jalcocert.github.io/JAlcocerT/my-youtube-ai-workflow/#quick-vlogs-as-a-code)
{{< /callout >}}


### Using Blender with AI for Home Design

Can Blender be some kind of **homestyler, but F/OSS**?

---

## FAQ

Other Design Resources

* Great video comparing [western vs eastern design](https://www.youtube.com/watch?v=8UAsN9wvePE&t=645s)


* https://blendermarket.com/

* https://www.blender.org/
  * https://github.com/blender/blender

* https://github.com/gd3kr/BlenderGPT
* Blender Add-ons 
* https://github.com/agmmnn/awesome-blender
* https://awesome-blender.netlify.app/

* https://github.com/benrugg/AI-Render

### Blender Ad-ons

BlendAI: A versatile suite of AI tools, including image-to-3D, text-to-3D, and more.   

BlendAI Library Pro: Another powerful collection of AI tools, offering features like image-to-3D, text-to-HDRI, and text-to-PBR.   

Autodepth AI: Creates depth maps from images, crucial for many AI-powered 3D workflows.   

3D AI Studio: A comprehensive suite of AI tools for 3D artists, covering a wide range of tasks.   


### Benchmarks with Blender

* https://opendata.blender.org/


### More Design as a Code

* https://wiki.freecad.org/Python_scripting_tutorial
