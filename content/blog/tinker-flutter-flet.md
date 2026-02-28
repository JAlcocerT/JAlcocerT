---
title: "Flutter Apps and Flet"
date: 2026-11-29
draft: false
tags: ["Android","Ente Photos","wger","Desktop Apps","Flutter x Python Flet","FlutterFlow"]
description: 'Flutter Apps. Created with Python via Flet.'
url: 'flutter-flet-python'
---

Affine and Appflowy are having web and desktop apps.

not sure if those are done with flutter, but they are cool

https://youtu.be/bhPHwVsrTo0

**Tl;DR**

Couple years ago I tried to do some Flet Apps with chatGPT, but the LLM knowledge was not there.

At least not to compensate for my lack of mobile app development (0).

How about now?

Is it there enought to create a desktop app to control the **DJI Tello dron**?

GPS BASED		
ublox m8n		
HGLRC M100 Mini	How to Install and Setup a GPS on your FPV Drone (4K) - YouTube	HGLRC M100 Mini GPS module - a small, cheap and accurate GPS module for all your FPV builds - YouTube
F9P?		
Lora GPS?		

https://www.youtube.com/watch?v=dQeNONerxEU
https://www.youtube.com/watch?v=ibNzG1tMblE

**Intro**

Flutter is used in many places.

Actually even some smartTV apps from your favourite telecom provider might have been built with it.

<!-- * Flutter
        * Counter knitting
        * Timer para ejercicios
        https://app.uizard.io/p/1ad5e459/preview -->

* https://flet.dev/

> Build **multi-platform apps in Python** powered by Flutter

Because some time ago (pre vibe-coding age) I tried flutter.

And it was not that easy.

* https://flet.dev/

> Build **multi-platform apps in Python** powered by Flutter

Some flutter apps?

https://flathub.org/en/apps/de.wger.flutter Which I discovered thanks to https://apps.umbrel.com/app/wger

![alt text](/blog_img/selfh/PaaS/wger.png)

See https://play.google.com/store/apps/details?id=de.wger.flutter

You can connect to your wger server

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ente/" title="Ente | Docker Config 🐋 ↗" >}}
{{< /cards >}}


Because some time ago (pre vibe-coding age) I tried flutter.

And it was not that easy.


## FlutterFlow

* https://app.flutterflow.io/project

## The Python Flet Project

* {{< newtab url="https://flet.dev/" text="The  Site" >}}
* {{< newtab url="https://github.com/flet-dev/flet" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/flet-dev/flet?tab=Apache-2.0-1-ov-file#readme" text="Apache 2.0" >}} ❤️

To write **Flutter from Python**, you can use the Flet framework. Flet is a Python library that allows you to build Flutter apps without having to write any Dart code.

To use Flet, you first need to install it using pip:

```sh
pip install flet #https://pypi.org/project/flet/
```

```py
app = flet.App()
```

Once you have created the flet.App object, you can start adding widgets to it. To do this, you use the flet.App.add() method. For example, to add a button to your app, you would use the following code:


Yes, **Flet can generate static pages**.

In fact, this is one of its main strengths.

Flet uses a technology called Pyodide to compile your Python code into [WebAssembly](https://jalcocert.github.io/JAlcocerT/wasm/), which is a binary format that can be executed in any web browser. This means that you can deploy your Flet app to any **static web hosting service**, such as **Firebase, GH Pages or CF Pages**.

To generate a static page from your Flet app, simply run the following command:

```sh
flet publish
```

This will create a directory called build that contains all of the static files for your app. You can then deploy these files to any static web hosting service.

Here are some of the benefits of generating static pages with Flet:

* Performance: Static pages are much faster than dynamic pages because they do not need to be rendered on the server. This makes Flet apps a good choice for websites that need to be able to handle a lot of traffic.
* Security: Static pages are also more secure than dynamic pages because they are not vulnerable to server-side attacks.
* Portability: Static pages can be deployed to any web server, including cheap and shared hosting plans. This makes Flet apps a good choice for websites that need to be able to scale to handle a lot of traffic.


Overall, Flet is a great choice for developers who are looking for a fast, efficient, and secure way to generate static pages.

## Flet as Static Site

https://flet.dev/docs/guides/python/publishing-static-website/

## Flet Samples

* https://github.com/ndonkoHenri/Flet-Samples

### Flet Features

* https://flet.dev/docs/guides/python/authentication/ !!!!!!!!!!!


* https://flet.dev/docs/guides/python/pub-sub/

https://flet.dev/docs/guides/python/packaging-app-for-distribution/
https://flet.dev/docs/guides/python/packaging-desktop-app/


#### Flet as a PWA

https://flet.dev/docs/guides/python/deploying-web-app/progressive-web-apps

---

## FAQ

### Flutter OSS Examples

1. 
2. 
3. 

### Desktop Alternatives in Python

Targeting desktop apps instead of web:

| Framework | Description | Ideal For |
|------------|--------------|-----------|
| Tkinter | Built-in, simple GUI | Beginners |
| PyQt / PySide | Complex, cross-platform | Professional apps |
| Kivy | Touch apps across devices | Mobile + desktop |
| wxPython | Native-look GUIs | OS-integrated apps |
| Flet | Flutter-like experience for desktop & web | Unified apps |




### Desktop Apps Analytics

* https://github.com/aptabase/aptabase

>  ✨ Open Source, Privacy-First and Simple Analytics for Mobile, Desktop and Web Apps 



### Other F/OSS Libraries to create WebApps with Python

Some alternatives to FLET:

1. DASH
    * Dash by Plotly is a Python framework for building analytical web applications. Dash apps are inherently server-side, with the frontend dynamically generated by Python code. Under the hood, Dash uses Flask as its default server
        * Flask SocketIO allows bi-directional communication server-client

2. Streamlit
    * https://docs.streamlit.io/library/advanced-features/configuration#telemetry

3. Shiny with python
    * https://shiny.posit.co/py/gallery/
    * https://shinylive.io/py/app/#orbit-simulation

4. Taipy
    * https://github.com/avaiga/taipy
    * https://pypi.org/project/taipy/

> Apache v2 | Turns Data and AI algorithms into production-ready web applications in no time. 

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/demo-realtime-pollution" title="Taipy Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

```sh
#https://github.com/Avaiga/demo-realtime-pollution
git clone https://github.com/JAlcocerT/demo-realtime-pollution #which i cloned
```

> Great example:  Taipy Demo of a Realtime Dashboard of Air Pollution around a Factory 

### What it is Gradio?

 Build Machine Learning Applications Easily with Gradio in Python 
<https://www.youtube.com/watch?v=3DGLznJorT8>

https://github.com/NeuralNine/drawing-classifier

https://busterbenson.com/

* Gradio
    * https://www.gradio.app/guides/quickstart
    * https://pypi.org/project/gradio/
* Chainlit - Conversational AI in minutes
    * https://docs.chainlit.io/get-started/overview
    * https://pypi.org/project/chainlit/
* Reflex (ex-Pynecone) - https://reflex.dev/
    * Can also create static sites: https://reflex.dev/docs/hosting/self-hosting/#exporting-a-static-build
* Panel - https://github.com/holoviz/panel
* Pynecone - ANOTHER ONE IN MY PRIVATE AT LENOVO!!!!!!!

* NiceGUI - Desktop Apps with Python https://github.com/zauberzeug/nicegui
    https://www.bitdoze.com/nicegui-pages/
    https://www.bitdoze.com/nicegui-get-started/

    * Under the hood, NiceGUI uses JustPy, which in turn is built on top of Starlette (an asynchronous ASGI framework) and other web technologies.
    *  library to write simple graphical user interfaces in Python we discovered JustPy. Although we liked the approach, it is too "low-level HTML" for our daily usage. But it inspired us to use **Vue and Quasar** for the frontend.
    * https://nicegui.io/#examples
    * **Allows WebSockets**


    REST API (HTTP):
        RESTful APIs are widely used for communication between clients and servers over HTTP.
        They are well-suited for request-response interactions and are easy to understand and implement.
        However, they may not be the best choice for real-time communication as they are based on the request-response model, which can introduce latency and overhead for real-time updates.
        REST APIs are suitable for scenarios where real-time updates are not critical or where the frequency of updates is low.

    WebSockets:
        WebSockets provide full-duplex communication channels over a single TCP connection, enabling real-time, bidirectional communication between clients and servers.
        They offer low-latency, high-performance communication and are well-suited for applications requiring real-time updates, such as chat applications, live dashboards, and multiplayer games.
        WebSockets can be more complex to implement compared to REST APIs, but they offer significant benefits for real-time applications.

        > Real time apps!

        ---> https://www.youtube.com/watch?v=CzcfeL7ymbU

    MicroServices - https://www.youtube.com/watch?v=lL_j7ilk7rc


We have built on top of FastAPI, which itself is based on the ASGI framework Starlette and the ASGI webserver Uvicorn because of their great performance and ease of use.
* JustPY
    * JustPy is an object-oriented, component based, high-level Python Web Framework that requires no front-end programming. With a few lines of only Python code, you can create interactive websites without any JavaScript programming. JustPy can also be used to create graphic user interfaces for Python programs.

#### Python for Web Assembly

WebAssembly (often abbreviated as Wasm) is a binary instruction format for a stack-based virtual machine.

It's designed as a portable compilation target for high-level languages like C, C++, Rust, and now, even Python, enabling deployment on the web for client and server applications. In simpler terms, 

> WebAssembly allows you to run code written in languages other than JavaScript on the web at near-native speed.

* PyScript

### F/OSS Libraries to create Apps with Python

* TKinter
    * https://www.youtube.com/watch?v=NlAB0X-RStM
    * https://www.youtube.com/watch?v=Miydkti_QVE
    
* DearPyGUI
* https://github.com/rawpython/remi

* PyQT - python desktop apps ->> https://www.youtube.com/watch?v=DjutoyfCl2c
    * https://pypi.org/project/PyQt5/

* Kivy - https://pypi.org/project/Kivy/

* https://wxpython.org/

> in go - https://github.com/gomatcha/matcha

* Python Reflex - for WebApps

### Run Python in HTML

* PyScript - Thanks to Pyodide, WASM and Moderm WEb Tech

#### What it is Pyodide?

Pyodide is a Python distribution for the browser and Node.js based on WebAssembly.

Pyodide is a port of CPython to WebAssembly/Emscripten.

Pyodide makes it possible to install and run Python packages in the browser with micropip.

Any pure Python package with a wheel available on PyPI is supported. Many packages with C extensions have also been ported for use with Pyodide. 

https://pyodide.org/en/stable/index.html

---

APP BUILDING

Dart & flutter (google)

https://blog.back4app.com/flutter-vs-dart/

### Sample Flutter Apps

If you are into [stonks](http://localhost:1313/py-stonks/#other-foss-apps-for-finance-management) and related apps:

* https://github.com/jameskokoska/Cashew?tab=readme-ov-file

* This application is available on the App Store, Google Play, GitHub and as a Web App (PWA).
* Cashew is a full-fledged, feature-rich application designed to empower users in managing their finances effectively. Built using Flutter - with Drift's SQL package, and Firebase - this app offers a seamless and intuitive user experience across various devices. Development started in September 2021.


### About desktop apps


<!-- 

### How to Create Desktop AI Apps with Python

* Pyodide -> Streamlit -> .exe


Pyodide is a project that brings the power of Python to web browsers and Node.js environments. Here's a breakdown of its key aspects:

What it is:

Python in the Browser: Pyodide is a port of CPython (the reference implementation of Python) to WebAssembly (WASM). This allows you to run Python code directly within web browsers without the need for server-side execution.
Node.js Compatibility: Pyodide also integrates with Node.js, enabling you to use Python alongside JavaScript in Node.js applications. -->

<!-- 
### How to convert books to audiobooks

https://github.com/FujiwaraChoki/libgen-reader
https://github.com/FujiwaraChoki/libgen-reader?tab=MIT-1-ov-file#readme

> Turn Books into Audiobooks with Library Genesis.
https://www.youtube.com/watch?v=A3MubNJX-00
 -->


<!-- 
### GenAI Architectures

* zero shot -- it provides information that the LLM has inside alrady
* RAG -- additional model has been plugged into the prompt
* Reason and Act (ReAct - Reflexion Pattern) - https://www.promptingguide.ai/techniques/react
* COALA - Conversational Language Agents 
 -->


---

# Flutter

Flutter - https://app.flutterflow.io/share/travel-app-bhdo3n

## DART
<https://www.youtube.com/watch?v=Ej_Pcr4uC2Q>

## Flutter
<https://www.youtube.com/watch?v=pTJJsmejUOQ&t=5276s&pp=ygUUZmx1dHRlciBmcmVlY29kZWNhbXA%3D>


* Download flutter SDK and locate it
* View -> Command palette -> run flutter doctor

* Install flutter extension

avdmanager is missing from the Android SDK

main.dart -> run -> run without debugging


<https://medevel.com/19-os-flutter-projects-samples/>


## Flutter Web and Firebase

In May this year, google announced that [their platform firebase](), will support among others flutter web as well.




## DART
<https://www.youtube.com/watch?v=Ej_Pcr4uC2Q>


## Flutter
<https://www.youtube.com/watch?v=pTJJsmejUOQ&t=5276s&pp=ygUUZmx1dHRlciBmcmVlY29kZWNhbXA%3D>




* Download flutter SDK and locate it
* View -> Command palette -> run flutter doctor


* Install flutter extension


avdmanager is missing from the Android SDK


main.dart -> run -> run without debugging




<https://medevel.com/19-os-flutter-projects-samples/>


## FAQ


### My Fav Android Apps

* Syncthing *see also Localsend*
* Nextcloud
* SatStat
* Sensor Server
* PhyPhox
* Immich
* F-Droid
* CAPod
* *RacheChrono*
* *Tello FPV*

[Audio recorder](https://play.google.com/store/apps/details?id=com.dimowner.audiorecorder&hl=en_US), [ultrasonic](https://play.google.com/store/apps/details?id=org.moire.ultrasonic&pli=1), [readdrops](https://play.google.com/store/search?q=readdrops&c=apps&hl=en_US), fluffy chat, organic maps, nophonespam

2fas auth, bitwarden, signal, rvnc viewer, element, tailscale, mullvad vpn

<!-- 
<https://itsfoss.com/open-source-android-apps/>

Use android from linux with: waydroid

Tablet like screen: https://github.com/H-M-H/Weylus

https://xdaforums.com/t/app-1-6-1-tap-tap-double-tap-on-back-of-device-gesture-from-android-12-port.4140573/

* F-DROID: <https://www.youtube.com/watch?v=MnNm-o0yfZw>

1) Go to https://f-droid.org/en/
2) download fdroid apk
2) Allow install from unknow source (just one time)

* Obtanium - https://f-droid.org/packages/dev.imranr.obtainium.fdroid/
    * Install Android Apps directly from Source
* Add the repo - https://apt.izzysoft.de/fdroid/

https://f-droid.org/en/packages/org.breezyweather/

    * <https://f-droid.org/packages/com.github.mobile/>
    * <https://f-droid.org/en/packages/nodomain.freeyourgadget.gadgetbridge>
    * screentime
* Organic Maps: <https://www.opensourcealternative.to/project/Organic-Maps>
    * <https://f-droid.org/en/packages/app.organicmaps/>
* Photos
    * Piwigo NG
    * Photonix

BTC MAP Android

https://f-droid.org/en/packages/org.btcmap/
https://f-droid.org/en/packages/eu.darken.capod/

* FluffyChat
* Element

* Zettel Notes
* Xournal++
* Butterfly

* Bitwarden
* vaultwarden
* Aegis
    * <https://www.opensourcealternative.to/project/Aegis> -->