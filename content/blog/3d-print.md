---
title: "[Learning] 3D Printing and FEA"
date: 2026-09-15
draft: false
tags: ["Tinkering IRL","Blender","Dron Stand","FreeCad x Calculix Beso"]
description: 'Toys? or Additive manufacturing at home?'
url: '3d-printing-101'
---

**Tl;DR**

You just need `.STL` to bring designs to the real world

**Intro**

* WHY Im writting this post: *bc [this power staging](https://jalcocert.github.io/JAlcocerT/iot-sensors-101/#kicad-x-power-stage-pcb-design) makes a mess and i want to put some order to the table* 
* WHAT [Ive learnt](#conclusions) with it: *Ive ended up sending for [manufacturing STLs for the first time](#my-first-3dprint) a [fpv dron stand](https://github.com/JAlcocerT/poc/tree/main/blender/dron-standing)*


## Design Hello World

Its not the time to talk about design for manufacturing (yet).

### Design Files 101

Its all about `.STL`, `.Blend` and `FCstd` [files](#blend-x-stl-x-fcstd)

And about getting these installed:

```sh
#choco install openscad
```

Blender can do what?

```sh
choco install blender --version=4.2.2 -y
#  choco info blender 
#brew install --cask blender #this got me the latest 5.1
```


{{% details title="Houdini vs Blender 🚀" closed="true" %}}

Houdini and Blender are competitors in the general 3D digital content creation (DCC) market, but they target different core audiences and strengths.

Rather than being direct head-to-head rivals for every task, they are often used together in professional pipelines.

| Feature | Houdini (by SideFX) | Blender (Open Source) |
| --- | --- | --- |
| **Core Architecture** | **Procedural & Node-Based:** Every action is built into a data node network. Non-destructive by nature. | **Hybrid/Traditional:** Tool-based with parametric modifiers, sculpting, and a growing procedural node ecosystem (*Geometry Nodes*). |
| **Primary Strength** | **VFX & Complex Simulations:** Unmatched for dynamics like destruction, fire, smoke, water, crowds, and complex particle systems. | **All-in-One Generalist Workflow:** Fast polygonal modeling, digital sculpting, UV unwrapping, 2D/3D animation, and quick rendering. |
| **Learning Curve** | **Very Steep:** Requires understanding data flow, mathematical concepts, and often VEX/Python scripting. | **Accessible:** More intuitive user interface for artists and hobbyists getting started with 3D. |
| **Target Industry** | Film/TV VFX studios, AAA game development pipelines, and high-end technical direction. | Indie studios, solo developers, concept artists, freelancers, and small-to-mid production teams. |
| **Cost** | Commercial software (ranging from free learning/apprentice versions to thousands per year for full licenses). | 100% Free & Open-Source (GPL). |

* **Where Blender Wins:** Hard-surface modeling, sculpting, rapid asset creation, character animation, and self-contained solo production. Blender allows artists to build and render a scene from scratch much faster for standard 3D tasks.
* **Where Houdini Wins:** Large-scale simulations and automated environment generation. If a film scene requires thousands of crumbling building pieces interacting with realistic smoke and fire, Houdini handles that complexity without breaking.
* **Overlap (The Competition):** Blender's **Geometry Nodes** feature brings node-based procedural workflows into Blender, positioning it as a lightweight alternative to Houdini's procedural modeling and motion graphics setup. However, Houdini remains far ahead for advanced physics and heavy visual effects.

In professional pipelines, studio artists frequently **combine both**: modeling base assets in Blender (or Maya) and passing them into Houdini to perform heavy FX and dynamic simulations.

{{% /details %}}

What about Freecad?
```sh
freecad
```


---

## Conclusions

Wherever you see `price = cost + margin`, you are looking to a commodity



### Where to get Models

1. thingyverse
2. makerworld

### Where to get them printed

I recently got to know that pcbway can estimate the cost and send you plastic and even metal 3dprints :O



---

## FAQ

### My First 3dPrint

Thanks to `https://aetherfpv.com/pages/gravity-drone-stand` I got [a STL](https://github.com/JAlcocerT/poc/tree/main/blender/dron-standing) with a fantastic design that brings a dron stand

1.  via `https://drukex.pl/en/pricing/#wycena-form` I got my first quote

```sh
cd ./poc/blender/dron-standing #https://github.com/JAlcocerT/3Design
make inspect-print-ready-quote
make inspect-quote-8
```

> The estimated price for FDM 3D printing starts from *just PLN 0.9 per gram* of the finished print. For larger quantities of identical parts, the cost may drop to approximately PLN 0.7 per gram.

The editable scene and reproducible generator are also
included:

- Blender scene (reference/
  original_assembly_mechanism_15s.blend)

- Animation script (animate_original_assembly.py)

```sh
make animate-original-assembly
make open-original-animation
make animate-original-assembly-detail-180
make open-original-animation-detail-180
```

<!-- https://youtu.be/ON7J_xA55Io -->

{{< youtube "ON7J_xA55Io" >}}


2. I also tried an ordered from: `https://drukarex.pl/`

>  Materiał PETG, warstwa 0,20 mm, 4 ścianki, wypełnienie 30%

3. Also got to know that there is an agregator `https://craftcloud3d.com/` which can also print in metals like aluminum or titanium (they also have cnc machining and molding - crazy that this can be some kind of manufacturing as a service!)

> And [it worked](https://youtube.com/shorts/KN0YrPE9GO8)

<!-- https://youtube.com/shorts/fugTKhjW-FQ -->

{{< youtube "fugTKhjW-FQ" >}}

yup

{{< youtube "VgRgUhA66Kk" >}}

<!-- https://youtube.com/shorts/VgRgUhA66Kk -->

#### Improvements

So for v102, we would replace: *four-finger snap-fit collar → two-jaw snap-fit collar*

> Yep, i snapped one!

it is not a rack-and-pinion.

The best name is a `rack-and-pawl` ratchet—more broadly, a discrete ratcheting linkage. 

The toothed long rod is the rack; the arm/slider engagement acts as the locking pawl/detent.

There is no rotating circular gear (a pinion) driving the rack.

> That part was strong enough thought

And i made [a second order](https://github.com/JAlcocerT/poc/blob/main/blender/order2.md)

{{< youtube "c8OFllACr2w" >}}

<!-- https://youtube.com/shorts/c8OFllACr2w -->


### FEM x Calculix x Beso

Skipping my oss mbsd framework this time, just curious to see how stress flow through the 3d print I got:

* https://jalcocert.github.io/JAlcocerT/fem/
* https://fossengineer.com/beso-topology-optimization-calculix/


* https://github.com/JAlcocerT/poc/blob/main/blender/dron-standing-fea/z-learnings.md

![alt text](/blog_img/data-experiments/component-stress-overview.png)

+-----------------------------------------------------------------------------------------+
|                                    INPUT GEOMETRY                                       |
|                                    Watertight STLs                                      |
+-----------------------------------------------------------------------------------------+
                                            │
                                            ▼
+-----------------------------------------------------------------------------------------+
| 1. GEOMETRY PROCESSING             FreeCAD 1.1.1 (Snap)                                 |
|                                    Converts STL skins to faceted BRep solids            |
+-----------------------------------------------------------------------------------------+
                                            │
                                            ▼
+-----------------------------------------------------------------------------------------+
| 2. MESHING & OPTIMIZATION          Gmsh 4.15.2 (Python venv)                            |
|                                    Linear tetrahedrons + Netgen volume optimization     |
+-----------------------------------------------------------------------------------------+
                                            │
                                            ▼
+-----------------------------------------------------------------------------------------+
| 3. SOLVER                          CalculiX 2.21 + SPOOLES (Unpacked in tools/)          |
|                                    Linear static analysis using C3D4 elements           |
+-----------------------------------------------------------------------------------------+
                                            │
                                            ▼
+-----------------------------------------------------------------------------------------+
| 4. POST-PROCESSING                 MeshIO 5.3.5 & NumPy 2.5.3                           |
|                                    Extract FRD fields; write summary.json & VTU exports |
+-----------------------------------------------------------------------------------------+
                                            │
                                            ▼
+-----------------------------------------------------------------------------------------+
| 5. VISUALIZATION                   Blender 5.1.2 & Pillow                               |
|                                    Surface stress heatmaps in assembly context          |
+-----------------------------------------------------------------------------------------+

  Run it with:

```sh
cd /home/jalcocert/Desktop/poc/blender/dron-standing-fea
./run-fea.sh cases/frame-screen.json
./run-fea.sh cases/frame-screen-fine.json
```

Built and tested a fully local FEA pipeline:

  - Verified all eight printable STLs are watertight.
  - Installed project-local Gmsh and CalculiX—no system/admin installation needed.
  - Used FreeCAD to reconstruct the STL as a faceted BRep.
  - Created automatic tetrahedral meshes with quality reporting.
  - Applied a placeholder 19.62 N load—equivalent to 2 kg—to the isolated stand frame.
  - Solved coarse and fine meshes and exported viewable VTU results.

  Results:

  - Coarse: 3.08 mm displacement, 27.65 MPa peak stress.
  - Fine: 5.96 mm displacement, 41.35 MPa peak stress.

  Because the values changed substantially, the model is not converged. The software workflow works, but this particular test is only a pipeline demonstration—not validation of the complete assembled stand.

### Blend x STL x FCstd

An **STL file** (short for *Stereolithography* or *Standard Tessellation Language*) is a standard 3D file format that represents the surface geometry of a 3D object using a collection of connected **triangles** (a polygon mesh).

It contains no color, texture, material properties, scale units, or construction history—only the 3D coordinates ($X, Y, Z$) of triangle vertices and surface normal vectors defining inside versus outside. 

Because of its simplicity, it is the universal standard for 3D printing slicers and CAM software.

Think of an STL as a **flattened, printed PDF**, while a FreeCAD file is a **parametric blueprint with dimensions**, and a Blender file is a **complete film/art studio project**.

| Feature | STL (`.stl`) | FreeCAD (`.FCStd`) | Blender (`.blend`) |
| --- | --- | --- | --- |
| **Data Type** | Raw triangular surface mesh | Parametric solid geometry (B-Rep / NURBS) | Polygonal mesh, curves, modifiers, rigs |
| **Curved Surfaces** | Approximated using flat facets | Mathematically exact curves & arcs | Quads/triangles + dynamic subdivision |
| **Editability** | Very difficult; destructive vertex manipulation | Fully parametric; change sketch numbers anytime | Flexible; sculpt, push/pull vertices, edit modifiers |
| **History / Tree** | None | Full feature tree (extrusions, fillets, sketches) | Non-destructive modifier stack, scene tree |
| **Materials & Color** | None (standard STL has zero color data) | Basic CAD appearance / physical material properties | Full PBR shaders, UV maps, textures, lighting |
| **Animation / Rigging** | None | None (focuses on technical assembly/movement constraints) | Full keyframes, bones/armatures, physics simulations |
| **Primary Purpose** | Manufacturing & 3D printing export | Mechanical engineering, parts design, precision drafting | 3D animation, gaming assets, sculpting, CGI rendering |

1. How a Cylinder is Handled

* **FreeCAD:** Stores a cylinder as a circle definition with a precise mathematical radius $r$ extruded to a height $h$. If you measure it, it has a perfectly continuous curve.
* **Blender:** Typically models it as an $N$-sided polygon cylinder (e.g., 32 sides) with top and bottom caps. You can smooth the shading visually or subdivide it dynamically.
* **STL:** Converts the cylinder into hundreds of tiny flat triangles. Curved surfaces lose their mathematical precision and become a mosaic of flat planes.

2. The Workflow Relationship

You rarely design *in* an STL. Instead, you work in FreeCAD or Blender, and export to STL as the final step:

```
[FreeCAD]  (Precision mechanical design) ──┐
                                          ├──> Export as .STL ──> [Slicer] ──> [3D Printer]
[Blender]  (Organic sculpting / art)     ──┘

```

* If you need to edit an STL later, opening it back up in FreeCAD or Blender turns the model into a "dumb" triangle mesh—the original sketches, dimensions, and modifiers are permanently lost.

**OpenSCAD** is fundamentally different in *how* you create models: it is a **programmer’s solid 3D CAD modeler**.

Instead of an interactive visual workspace where you click, draw sketches, or drag vertices with a mouse, OpenSCAD has no interactive modeling viewport. 

You write pure code in a script file (`.scad`), compile it, and the software renders the resulting 3D geometry using **Constructive Solid Geometry (CSG)**.

* **STL (`.stl`):** The printed PDF.
* **Blender (`.blend`):** Photoshop / Maya (artistic manipulation, polygons, sculpting, animation).
* **FreeCAD (`.FCStd`):** AutoCAD / SolidWorks (visual GUI, 2D constraint sketches, feature tree).
* **OpenSCAD (`.scad`):** The raw source code (C++/Python style code that compiles into a 3D object).

| Feature | OpenSCAD (`.scad`) | FreeCAD (`.FCStd`) | Blender (`.blend`) | STL (`.stl`) |
| --- | --- | --- | --- | --- |
| **Interface** | Text editor + compiled preview | Full visual CAD GUI (sketches, toolbars) | Full 3D DCC GUI (viewports, nodes, brushes) | Plain data file (no editor GUI) |
| **Design Method** | Code scripts (functions, loops, CSG operations) | Parametric sketches, constraints, visual operations | Direct polygonal modeling, sculpting, modifiers | Pre-computed triangle mesh |
| **Parametric Control** | Native variables (`wall_thickness = 3;`) | Spreadsheet workbench / sketch constraint formulas | Driver expressions / Geometry Nodes | None |
| **Version Control (Git)** | Perfect — plain human-readable text | Difficult — binary/zipped XML archive | Difficult — proprietary binary archive | Poor — massive list of coordinates |
| **Target Audience** | Programmers, algorithmic designers, procedural parts | Mechanical engineers, precision machinists | 3D artists, animators, game asset creators | 3D printers, slicers, CAM mills |


### 3d Print x Power Stage

https://github.com/JAlcocerT/poc/tree/main/iot-esp-water/esp32-cpp-mqtt-pump/power-stage-104