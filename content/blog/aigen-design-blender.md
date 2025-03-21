---
title: "Designing with Blender and LLMs"
date: 2025-04-15T23:20:21+01:00
draft: true
# cover:
#    image: "/img/GenAI/LLMs_Locally_LLamas.png" # image path/url 
#    Width: 360
#    Height: 200
#    sizes: 360
#    alt: "From Fiction to Function: A Hands-On Guide to Open Source LLM Models.." # alt text
#    caption: "From Fiction to Function: A Hands-On Guide to Open Source LLM Models." # display caption
tags: ["Docker","Gen-AI"]
description: 'The Future of Generative Text AI: A DIY Guide to Exploring Generative Models Locally'
summary: 'Explore the capabilities of Generative text AI models beyond the buzz. Dive deep into Open Source LLMs, and learn how to interact with these digital artists locally, using your CPU without extra cost.'
url: 'how-to-use-blender-with-AI'
---

### The Blender Project

While primarily known as a 3D modeling and rendering software, Blender also includes robust animation capabilities.

It's one of the most comprehensive open-source animation suites available, offering features for 3D animation, rigging, modeling, simulation, rendering, and more.

* {{< newtab url="https://www.blender.org/" text="The Blender Official Site" >}}
* {{< newtab url="https://github.com/blender/blender" text="The Uptime Blender Code at Github" >}}
    * License: {{< newtab url="https://github.com/blender/blender?tab=License-1-ov-file#readme" text="GNU GPL" >}} ✅ 


## Blender API - With Python

https://www.youtube.com/watch?v=cyt0O7saU4Q&list=PLFtLHTf5bnym_wk4DcYIMq1DkjqB7kDb-

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

> Visualize Your Ideas With Code

