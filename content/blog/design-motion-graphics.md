---
title: "Design (thinking) around AI"
date: 2026-04-19T06:20:21+01:00
draft: false
tags: ["Remotion vs Hyperframe","JAlcocerTech Branding","nanobanana"]
description: 'Claude Design is here for your animations and brand'
url: 'about-motion-graphics'
math: true
---

**Tl;DR**


**Intro**

RemotionJs and its first application around mechanism videos, electronic videos, oss tech video review even [MVP promo videos](https://jalcocert.github.io/JAlcocerT/quick-weddings-poc/#ads-x-remotion-promo-video) has been great

Now that everything possible to be codable as web can be a video...

## Ways to Motion Graphic

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/3DDesign" title="HomeLab | Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/VideoEditingRemotion" title="Shopofy AI COO | Landing x App | Github ↗" icon="github" >}}
{{< /cards >}}

### Blender

[Experimenting with blender](https://jalcocert.github.io/JAlcocerT/using-blender-with-ai/) has been great.

```sh

```

Ive also been using blender together with mechanisms [here](https://jalcocert.github.io/JAlcocerT/about-constrained-mechanism/#2d-kinematics-x-blender)

if you are curious, running this in a mac M2 is way faster


### Web Technologies


Because the web technologies can do it

### RemotionJS

```sh
#npx skills add remotion-dev/skills
```

### ThreeJS and BabbylonJS

if you wondered how lando website was possible

Or how Ive been tinkering with a custom mbsd animator for the augmented reality part (AR)

ThreeJS is the answer:



### HyperFrame

We have a new library in town: https://github.com/heygen-com/hyperframes

> Apache v2 | Write HTML. Render video. Built for agents.

```sh
npx skills add heygen-com/hyperframes
```

---

## Conclusions

### About Design Thinking 

Design thinking isn't a single step in the requirements process; it is the "discovery engine" that fuels the quality of your documentation. 

While these documents are often seen as a linear progression, design thinking ensures that what you are documenting actually solves a human problem.

Here is how design thinking integrates into the lifecycle of a **Business Requirements Document (BRD)**, **Product Requirements Document (PRD)**, and **Functional Requirements Document (FRD)**.

1. The BRD (The "Why")

**Role of Design Thinking: Empathize & Define**

The BRD focuses on high-level business goals. Design thinking plays a critical role here by ensuring the business goal aligns with a genuine user need.

* **Stakeholder Empathy:** Using empathy maps to understand the pain points of the business owners and the end users.
* **Problem Reframing:** Instead of a BRD saying "We need a loyalty app," design thinking helps the BRD say "We need to reduce customer churn by increasing emotional engagement."
* **Outcome:** A BRD grounded in a validated "Problem Statement" rather than just a list of features the board wants.

2. The PRD (The "What")

**Role of Design Thinking: Ideate & Prototype**

The PRD bridges the gap between business needs and the technical solution.

This is where design thinking is most visible.

* **Ideation:** Facilitating workshops (like "Crazy 8s") to explore various ways to solve the problems defined in the BRD.
* **User Stories & Personas:** Crafting requirements based on specific user archetypes developed during the research phase.
* **Low-Fidelity Prototyping:** Before a single line of requirement is finalized, paper prototypes or wireframes are tested to see if the "What" actually works for the user.
* **Outcome:** Requirements that are prioritized based on **Desirability** (User), **Viability** (Business), and **Feasibility** (Tech).


3. The FRD (The "How")

**Role of Design Thinking: Test & Iterate**

The FRD is highly technical, detailing how the system must behave to satisfy the PRD. While it feels "colder" and more functional, design thinking acts as the guardrail.

* **Usability Testing:** If a functional requirement describes a complex multi-step checkout, design thinking asks: "Is this cognitively too heavy for the user?" 
* **Edge Case Discovery:** By "Testing" the logic through the lens of a user journey, you identify functional gaps—like what happens when a user loses internet mid-transaction.
* **Outcome:** A technical specification that doesn't just work perfectly under the hood, but maintains a seamless "Human-Computer Interaction" (HCI).



| Document | Primary Focus | Design Thinking Phase | Key Activity |
| :--- | :--- | :--- | :--- |
| **BRD** | Business Goals | **Empathize** | User interviews & Market research |
| **PRD** | Product Features | **Define & Ideate** | Persona building & Wireframing |
| **FRD** | System Behavior | **Prototype & Test** | Usability validation & Logic flows |

> **The Big Picture:** Without design thinking, a BRD/PRD/FRD chain produces a product that is **technically functional but useless**.

> > Design thinking ensures that the "Golden Thread" of user value remains intact from the first business meeting to the final technical spec.


Both **Lean Startup** and **Systems Thinking** act as different "operating systems" for your documentation. While Design Thinking focuses on **human needs**, Lean Startup focuses on **market viability**, and Systems Thinking focuses on **structural logic**.

Here is where they plug into the BRD, PRD, and FRD framework:


1. Lean Startup (The "Build-Measure-Learn" Loop)

Lean Startup thrives in environments with high uncertainty. It shifts the documentation from "predicting the future" to "testing a hypothesis."

* **In the BRD (Pivot or Persevere):** The BRD becomes a collection of **hypotheses** rather than fixed requirements. Instead of "The business needs X," it’s "We believe that by doing X, we will achieve Y (Metric), and we will know we are right when we see Z (Data)."
* **In the PRD (The MVP):** Lean Startup aggressively prunes the PRD. It forces the team to identify the **Minimum Viable Product**. Any feature that doesn't directly test the core hypothesis is moved to a "Backlog" or discarded to save speed.
* **In the FRD (Instrumentation):** The FRD must include "Analytics Requirements." You aren't just documenting how a button works; you are documenting how that button's usage is **tracked and measured** to feed the "Learn" part of the loop.



2. Systems Thinking (The "Big Picture" View)

Systems thinking is used when a product is part of a massive, interconnected ecosystem (like a city's power grid, a global supply chain, or a complex ERP).

* **In the BRD (Interdependencies):** Systems thinking identifies **Feedback Loops**. A business goal to "Increase Sales" might have a reinforcing loop that accidentally "Overwhelms Customer Support." The BRD uses systems mapping to ensure the business goal doesn't break another part of the company.
* **In the PRD (Contextual Impact):** The PRD looks beyond the user's screen. It defines requirements for how this product interacts with third-party APIs, legacy databases, and environmental factors. It ensures the "What" doesn't cause a "Butterfly Effect" of errors elsewhere.
* **In the FRD (Structural Logic):** This is where **Causal Loop Diagrams** or **Stock and Flow Diagrams** live. The FRD defines the system's "State"—how data flows through the pipes, where it pools (stocks), and what triggers the release of information.


| Framework | Best fit in... | Key Question it answers |
| :--- | :--- | :--- |
| **Design Thinking** | **PRD** (mostly) | Is this the right solution for the *human*? |
| **Lean Startup** | **BRD & PRD** | Is there a *market* for this, and how can we prove it fast? |
| **Systems Thinking** | **BRD & FRD** | How does this change affect the *entire ecosystem*? |

**How to combine them**

In a modern product team, you rarely use just one. You might use **Systems Thinking** to map out the complexity of a new healthcare platform (BRD), **Design Thinking** to figure out how a doctor will actually use the tablet (PRD), and **Lean Startup** to decide which single feature to build first to see if patients even want to log in (MVP).

Does your current project feel more like a "human" problem (Design), a "market" mystery (Lean), or a "complex machine" (Systems)?




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


#### Motion Canvas

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