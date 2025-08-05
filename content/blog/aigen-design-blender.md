---
title: "Designing with Blender and LLMs"
date: 2025-12-15T23:20:21+01:00
draft: false
tags: ["Docker","Gen-AI","Animations"]
description: 'Generative AI applied to Blender'
url: 'how-to-use-blender-with-AI'
---



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

https://www.youtube.com/watch?v=cyt0O7saU4Q&list=PLFtLHTf5bnym_wk4DcYIMq1DkjqB7kDb-

{{< youtube "cyt0O7saU4Q" >}}


https://docs.blender.org/api/current/
https://docs.blender.org/api/current/info_overview.html



https://docs.blender.org/manual/en/dev/advanced/blender_directory_layout.html#blender-directory-layout

https://pypi.org/project/bpy/

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

A TypeScript library for creating animated videos using the Canvas API.

> MIT| Visualize Your Ideas With Code 

{{< details title="More about Motion Canvas 📌" closed="true" >}}

Library & Editor: Motion Canvas offers two main parts:

1. Library (written in TypeScript): This library allows you to write animation code using generators, providing a structured approach for creating animations.
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

