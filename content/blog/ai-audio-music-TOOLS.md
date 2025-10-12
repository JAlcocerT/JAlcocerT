---
title: "How to create music with AI Tools"
date: 2025-11-10T23:20:21+01:00
draft: false
tags: ["Docker","Gen-AI"]
description: 'Tryign to Make music with AI'
url: 'music-with-ai-tools'
---


<!-- 
```
conda create -n textgen python=3.10.9
conda activate textgen
install pytorch: pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117
git clone https://github.com/oobabooga/text-generation-webui
cd text-generation-webui
pip install -r requirements.txt
python server.py
# download model
# refresh model list
# load model
# switch to chat mode
```


## FAQ


### What it is Gradio?

 Build Machine Learning Applications Easily with Gradio in Python 
<https://www.youtube.com/watch?v=3DGLznJorT8>

https://github.com/NeuralNine/drawing-classifier

https://busterbenson.com/


<!-- ## FAQ

### What is oobabooga?

https://gist.github.com/mberman84/45545e48040ef6aafb6a1cb3442edb83



<!-- #### More about RAGs

https://www.youtube.com/watch?v=_cDRrSAKSnY
https://mer.vin/2024/01/rag-with-chromadb-llama-index-ollama-csv/


https://www.youtube.com/watch?v=71e6xfxrIRs - Understanding Gaussian Processes | Part 1 - What are Gaussian Processes? -->



<!-- #### How to Select the Right Model?

https://www.choosellm.com/ -->

<!-- 
https://docs.privategpt.dev/recipes/choice-of-llm/list-of-ll-ms -->

<!-- 
https://www.youtube.com/watch?v=lBsv-ssPJpo -->

{{< youtube "lBsv-ssPJpo" >}}


{{< youtube "OM2FyFxzeRM" >}}

<!-- 
https://www.youtube.com/watch?v=OM2FyFxzeRM -->


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/local-ai-audio" title="Local AI Audio 101 ↗ " >}}
{{< /cards >}}


## Open Source AI Tools for Music Creation



This AI Makes you a PRO Singer !

<!--
https://www.youtube.com/watch?v=Sj8hXeMcoUg
-->

{{< youtube "Sj8hXeMcoUg" >}}


Takes a song, separates voice and beat, then inputs your voice to it (not foss)

<https://huggingface.co/spaces/facebook/MusicGen>
<https://gist.github.com/mberman84/45545e48040ef6aafb6a1cb3442edb83>


<https://gist.github.com/mberman84/afd800f8d4a8764a22571c1a82187bad>

<https://github.com/facebookresearch/audiocraft>

audiocraft
How To Install Audiocraft Locally - Meta's FREE And Open AI Music Gen

https://gist.github.com/mberman84/afd800f8d4a8764a22571c1a82187bad


arm64: apt install ffmpeg
conda install -c pytorch -c conda-forge pytorch


https://www.gyan.dev/ffmpeg/builds/
choco install ffmpeg
ffmpeg –version



* {{< newtab url="/" text="The Site" >}}
* {{< newtab url="" text="The Source Code at Github" >}}
    * License: {{< newtab url="" text="MIT" >}} ❤️

### Beats with AI

### Lyrics with AI

You can try simply LLMs!

---

## Conclusions




---

## FAQ



### Interesting Music Related Projects

{{< details title="GraphMuse - Python 📌" closed="true" >}}

* https://github.com/manoskary/graphmuse

**GraphMuse** is a Python library designed for **symbolic music graph processing**, addressing the growing need for efficient and effective analysis of musical scores through graph-based methods.

- **Problem Solved**: Traditional music processing lacks efficient tools for analyzing complex musical scores, which often include various elements beyond just notes. 

- **Functionality**:
  - Converts musical scores into graphs where:
    - Each note is a vertex.
    - Temporal relationships between notes define edges.
  - Supports deep graph models for music analysis.
  - Built on **PyTorch** and **PyTorch Geometric**, offering strong flexibility and performance.

- **Graph Structure**:
  - Edges are categorized into:
    - Onset edges (notes starting simultaneously).
    - Consecutive edges (notes starting after others).
    - During edges (notes overlapping with others).
    - Silent edges (connecting notes separated by silence).

- **Key Features**:
  - Efficient graph creation (up to 300x faster).
  - Built-in utilities for preprocessing musical scores.
  - Sampling methods for handling variable graph sizes during training.

- **Use Case**:
  - Demonstrates pitch spelling tasks using annotated datasets.

- **Future Plans**:
  - Improve installation processes.
  - Expand model and data loader support.
  - Foster community contributions.

GraphMuse is a promising tool for anyone interested in symbolic music analysis, combining music theory with advanced graph neural networks.

In conclusion, GraphMuse simplifies symbolic music processing through advanced graph techniques, fostering innovation and analysis.

**Similar Projects**: MusGViz for music visualization and other graph neural network frameworks in music processing.

{{< /details >}}