---
title: "How to do practically everything with Python"
date: 2025-09-15T23:20:21+01:00
draft: false
tags: ["Dev","Animations","QR","WebApps"]
url: 'python-recap'
summary: 'Python and its 288 use cases'
---

This year I have been surprised by Python language (one more time).

And using uv as package manager has been a revelation:

If we are ready...what are those cool use cases?

## Photo

* https://www.geeksforgeeks.org/python-pillow-creating-a-watermark/

## Video

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-apps-with-python" title="Streamlit 101 ↗" >}}
{{< /cards >}}

For editing video, i prefer to use directly FFMPEG.

TO create videos with Python, for now, I have tried [data driven animations](#animations), which can be exported to .mp4

## WebApps

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-apps-with-python" title="Streamlit 101 ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-apps-with-python" title="Streamlit 101 ↗" >}}
{{< /cards >}}

Flask

## Plots

For WebApps, I try to go with Plotly, to get interactivity out of the box.

You can also bring to your Python Apps: ChartJS, ApexCharts...as seen [here](https://github.com/JAlcocerT/Streamlit_PoC)

* https://handhikayp.medium.com/real-time-data-visualizations-using-python-library-plotly-12e0e5b48240

### QR Generation

To generate [**QR's with logo** thanks to Python](https://github.com/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb) 


And your QR generator can be embedded into WebApps, as seen [here](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/QR_Gen.py)

> It can be done as well with Inkscape, or [with QR-Code-Generator](https://github.com/nayuki/QR-Code-generator) or with [emn178](https://emn178.github.io/online-tools/qr-code/generator/)

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)

I got to learn this during [this wedding post](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt)!


### Infographics

* https://towardsdatascience.com/from-default-python-line-chart-to-journal-quality-infographics-80e3949eacc3

* https://aiglobaltech.blogspot.com/2024/12/from-default-python-line-chart-to.html

### Animations

I got very much surprised couple of years ago with [the mechanism project](https://github.com/gabemorris12/mechanism).

Which I finally got the change to write about on [this post](https://jalcocert.github.io/JAlcocerT/gabemorris12-mechanism-project-setup/).

The project has a great application of Python animations.

That I could not resist to tinker with:

* https://github.com/JAlcocerT/mechanism
* https://github.com/JAlcocerT/Streamlit_PoC/tree/main/Animations - Just matplotlib animations for various use cases


![Sample animation Gif](/blog_img/dev/503.gif)


## OOP

Object oriented programming!

I was trying for long to avoid such concept.

But not any more.

---

## COnclusions