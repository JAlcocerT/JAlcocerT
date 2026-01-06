---
title: "Matlab or Octave?"
date: 2023-11-22T19:20:21+01:00
draft: false
tags: ["Engineering","Simulations"]
description: "Matlab, the m language and simulations."
url: matlab-vs-octave
---


**TL;DR**

It's all about the m language (not the M one from PowerBI).

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Bike_dynamic_simulator" title="Bicycle Dynamic Simulator Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Matlab powered real time simulation - Source Code on Github" >}}
{{< /cards >}}

**Intro**

if you are an engineer, you have [many OSS tools available](https://jalcocert.github.io/Linux/docs/debian/foss_engineering/#other-foss-tools-for-engineers).



### MATLAB

**MATLAB** is a proprietary programming language and numeric computing environment from MathWorks. 

The name "MATLAB" is a portmanteau of "matrix laboratory," which reflects its core strength: a powerful focus on matrix and array manipulation. 

It's a high-level language used extensively in science and engineering for tasks like data analysis, algorithm development, and modeling and simulation.

MATLAB includes a rich set of built-in mathematical functions, a robust graphics system for data visualization, and a large number of specialized **toolboxes** for various applications, such as signal processing and control systems.

### GNU Octave

**GNU Octave** is a free and open-source alternative to MATLAB. 

```sh
sudo apt install octave
#sudo apt install flatpak
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#flatpak run org.octave.Octave
```

It was developed to be largely compatible with the MATLAB language and is a popular choice for those who need a similar environment without the cost of a MATLAB license.

While it provides most of the core functionality of MATLAB, including matrix operations, plotting, and numerical computation, it generally lacks the polished user interface and extensive, professionally supported toolboxes that MATLAB offers. 

Its community-driven nature means that new features and bug fixes are developed by its users.


### Comparison: MATLAB vs. Octave

| Feature | MATLAB | GNU Octave |
| :--- | :--- | :--- |
| **Cost** | Proprietary and requires a license (expensive). | Free and open-source. |
| **Toolboxes** | Offers a wide range of commercially supported, specialized toolboxes. | Has a more limited set of community-contributed packages. |
| **Performance** | Generally faster and more optimized for large-scale computations. | Can be slower, especially for certain tasks, but is constantly improving. |
| **Interface** | Features a more user-friendly, polished graphical user interface (GUI). | The GUI is more basic, though it has improved in recent versions. |
| **Community & Support** | Backed by a commercial company (MathWorks) with dedicated customer support. | Supported by an active user community through forums and online resources. |
| **Compatibility** | Octave is designed to be compatible with MATLAB's language, so many scripts can run on both. However, scripts using advanced features or specific toolboxes from MATLAB may not work in Octave. | Scripts written for Octave are generally not 100% compatible with MATLAB without some modification. |



### The M Language

The **M-language** is the core programming language used in both MATLAB and Octave. 

It's a high-level, **interpreted language** that is a multi-paradigm language. 

This means it supports different programming styles like procedural, functional, and object-oriented programming.

The "M" in M-language doesn't just refer to the programming language itself but also to the file extension, ".m", used for MATLAB and Octave script files.

#### Is It a Full Programming Language Like Python?

Yes, the M-language is a **full programming language**. Like Python, it includes features necessary for building a wide range of applications, such as:

* **Control flow statements:** `if-else`, `for` loops, `while` loops.
* **Functions:** The ability to define and call functions.
* **Data structures:** Support for various data types, including matrices, cell arrays, and structs.
* **Object-oriented programming (OOP):** The ability to create classes and objects.
* **Input/Output:** Functions for reading from and writing to files.

While it is a full language, its primary strength lies in **numerical computation and technical computing**, which is where it truly excels and differs from a general-purpose language like Python. 

Python, on the other hand, is a general-purpose language with a vast ecosystem of libraries for everything from web development to data science, making it more versatile for a broader range of applications.


### Can you do simulations?

Yes, both MATLAB and Octave are **excellent for simulations**. 

This is one of their main applications in science and engineering. 

They are widely used to model and simulate physical systems and complex algorithms.

A key reason for this is their built-in support for:

* **Numerical solvers:** They have functions for solving differential equations, which are fundamental to modeling dynamic systems.
* **Matrix and vector operations:** These are essential for the mathematical calculations involved in most simulations.
* **Data visualization:** You can easily plot and visualize simulation results in 2D and 3D, which is crucial for analyzing and understanding the system's behavior.

MATLAB has a companion product called **Simulink**, which is a graphical, block-diagram environment specifically for multi-domain simulation and Model-Based Design. 

While Octave doesn't have an equivalent to Simulink, it can still perform a wide range of simulations using its core language features and available packages.

---

## FAQ


There are a few things you can do with MATLAB that are either **not possible or significantly more difficult and less streamlined with Python**, primarily due to MATLAB's unique design and commercial ecosystem.

1. **Integrated, High-Quality Toolboxes:** MATLAB's greatest strength is its collection of professionally developed, rigorously tested, and fully integrated toolboxes. These are not just libraries; they are specialized, high-performance environments for specific engineering and scientific tasks. For instance, the **Simulink** platform for Model-Based Design and system simulation is a feature without a direct, commercially supported equivalent in Python.

While Python has libraries like NumPy, SciPy, and Matplotlib that offer similar functionality, they are separate projects and can sometimes have compatibility issues. MATLAB's toolboxes for signal processing, control systems, and robotics are designed to work together seamlessly out-of-the-box.

2. **A Fully Integrated Development Environment (IDE):** MATLAB's IDE is specifically designed for technical computing. It includes features like a robust variable explorer, a profiler for performance analysis, and interactive plotting tools that allow you to explore data and create visualizations with ease. While Python IDEs like Spyder or Jupyter notebooks offer similar features, the MATLAB environment is a more cohesive, all-in-one experience where every tool is optimized for the language's core use case.

3. **Commercial Support and Documentation:** As a proprietary product, MATLAB comes with dedicated, professional support from MathWorks. If you encounter a bug or need help with a complex problem, you can contact their support team. Additionally, its documentation is comprehensive, consistent, and easy to navigate. The Python community, while vast, relies on decentralized forums like Stack Overflow for support, and documentation quality can vary widely between different open-source libraries.