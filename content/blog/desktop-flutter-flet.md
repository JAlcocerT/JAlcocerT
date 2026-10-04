---
title: "Flutter Apps for Desktop?"
date: 2026-10-03
draft: false
tags: ["Android","DART vs Kotlin","GoPro Telemetry","DJI Tello","Obtanium"]
description: 'Flutter Apps? Python via Flet? Or just PWAs?'
url: 'from-python-to-flutter'
---


**Tl;DR**

Its possible now.

**Intro**

* WHY Im writting this post: *bc after making [this rust desktop app](https://jalcocert.github.io/JAlcocerT/desktop-apps-with-rust/) I wanted to have another look to flutter*
* What [Ive learnt](#conclusions) with it: *Ive ended up using obtanium for my first native android app with kotlin. Was not expecting to [recap SHA256 signatures](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/11-signing-vs-bitcoin-web-desktop.md?ref_type=heads) nor [publish about it](https://gitlab.com/fossengineer1/dron/-/tree/feature/android-native/kotlin-android-release-learnings/posts?ref_type=heads) neither [about](https://gitlab.com/fossengineer1/dron/-/tree/feature/android-native/rust-desktop-learnings/posts?ref_type=heads the rust desktop)*

Web applications use a different delivery model. Normally the browser does not
retain an independently installed executable package and later compare a new
bundle against its old author's signature. It requests the current resources
from an origin each time.
Trust is concentrated in the origin:
https://example.com
        ↓
DNS + hosting/deployment account + TLS certificate/private key
HTTPS/TLS authenticates the server/domain and protects resources in transit.
The browser's same-origin policy then separates content belonging to different
origins.

herefore web applications are not really “published without keys.” The keys
and credentials are located elsewhere:

Domain registrar credentials
DNS-provider credentials
Hosting/cloud deployment credentials
CI/CD credentials
TLS private key or a managed certificate service
Source repository credentials

Compromising those systems lets an attacker change what the trusted web origin
serves. Every visitor can then receive the malicious code immediately, without
installing an APK.
Modern hosting often hides TLS key management behind services such as managed
certificates, making the cryptography less visible to the developer. The trust
requirement still exists.


Affine and Appflowy are having web and desktop apps.

not sure if those are done with flutter, but they are cool

{{< youtube "bhPHwVsrTo0" >}}

<!-- https://youtu.be/bhPHwVsrTo0 -->



Flutter is used in many places.

Actually even some smartTV apps from your favourite telecom provider might have been built with it.


At an ecommerce they were using Swift for the code base of iOS


## Flet

Couple years ago I tried to do some Flet Apps with chatGPT, but the LLM knowledge was not there.

At least not to compensate for my lack of mobile app development (0).

How about now?

Is it there enought to create a desktop app to control the **DJI Tello dron**?

Well, the thing is that...

thing have changed

And models are so good that I was able not only to build a nice python cli wrapper to control the tello here:

```sh
git clone
uv run main.py
```

Oh...and in fact more than Python:

```sh
git clone dron-tello-flutter
cd dron-tello-flutter

flutter run -d linux
```

But also, 

GPS BASED		

ublox m8n		

HGLRC M100 Mini	How to Install and Setup a GPS on your FPV Drone (4K) - YouTube	HGLRC M100 Mini GPS module - a small, cheap and accurate GPS module for all your FPV builds - YouTube

F9P?		

Lora GPS?		

<!-- https://www.youtube.com/watch?v=dQeNONerxEU
https://www.youtube.com/watch?v=ibNzG1tMblE -->

{{< youtube "dQeNONerxEU" >}}


{{< youtube "ibNzG1tMblE" >}}


**Intro**


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

See `https://play.google.com/store/apps/details?id=de.wger.flutter`

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

Once you have created the flet.App object, you can start adding widgets to it. 

To do this, you use the flet.App.add() method. For example, to add a button to your app, you would use the following code:


Yes, **Flet can generate static pages**.

In fact, this is one of its main strengths.

Flet uses a technology called Pyodide to compile your Python code into [WebAssembly](https://jalcocert.github.io/JAlcocerT/wasm/), which is a binary format that can be executed in any web browser. This means that you can deploy your Flet app to any **static web hosting service**, such as **Firebase, GH Pages or CF Pages**.

To generate a static page from your Flet app, simply run the following command:

```sh
flet publish
```

This will create a directory called build that contains all of the static files for your app. You can then deploy these files to any static web hosting service.

Flet as Static Site: https://flet.dev/docs/guides/python/publishing-static-website/

Flet Samples: https://github.com/ndonkoHenri/Flet-Samples

### Flet Features

* https://flet.dev/docs/guides/python/authentication/ !!!!!!!!!!!


* https://flet.dev/docs/guides/python/pub-sub/

https://flet.dev/docs/guides/python/packaging-app-for-distribution/
https://flet.dev/docs/guides/python/packaging-desktop-app/


Flet as a PWA: https://flet.dev/docs/guides/python/deploying-web-app/progressive-web-apps

## Tinkering with Flutter


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/dron" title="DJI Tello x Py" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Python SDK and uv for the tello" >}}
  {{< card link="https://github.com/JAlcocerT/3Design" title="NEW - GoPro HUD" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Blender, CadQuery..." >}}
{{< /cards >}}

### Flutter x DJI Tello

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/dron" title="DJI Tello x Py" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Python SDK and uv for the tello" >}}
  {{< card link="https://github.com/JAlcocerT/dron-tello-flutter" title="Flutter Tello Flutter" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Blender, CadQuery..." >}}
{{< /cards >}}

I got a tello some time ago

This year decided to use uv as pkg manager to control it better...

```sh
#git clone https://github.com/JAlcocerT/dron && cd ./dron && uv run main.py
#ssh -T git@gitlab.com
git clone git@gitlab.com:fossengineer1/dron.git
```
<!-- https://youtube.com/shorts/XNG57Co1lXA -->

{{< youtube "XNG57Co1lXA" >}}

And shortly after I caught myself around flutter: *This was not quite there yet thought*

```sh
git clone https://github.com/JAlcocerT/dron-tello-flutter
cd dron-tello-flutter
#ping 192.168.10.1
flutter run -d linux
```

### Flutter x GoPro HUD

I was trying GoPros overlay for long

```sh
#git clone https://github.com/JAlcocerT/Py_RouteTracker
```

Later, I tried this approach:

```sh
#git clone https://github.com/JAlcocerT/optimum-path
#cd optimum-path/overlay
```

Even with go:

```sh
#git clone https://github.com/JAlcocerT/go-karting
```

Just that the Go desktop app worked nicely for me at Ubuntu

But somehow my friend could not run it on W11

I did not debug much tbh

But just wondering if flutter would make this easier

---


## Conclusions

Who cares that [Pyston](https://github.com/pyston/pyston) is no longer maintained when we have Rust and Go

"Ente Photos","wger","FlutterFlow"

Ended up creating [this kotlin native app](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/01-scope-and-architecture.md?ref_type=heads) from the rust desktop one.

Some [local test](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/03-local-build-and-test.md?ref_type=heads) at the PC were done, but to fully test it I used it and [validated](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/08-obtanium-validation.md?ref_type=heads) in my Pixel 9 Pro via obtanium.

You will need to **create [some secrets](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/04-signing-and-secrets.md?ref_type=heads)**: *you better [back them up](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/05-backups-keys-and-recovery.md?ref_type=heads)*

 In this case:

- .p12 = private key + public certificate. Secret.
- .pem created with keytool -exportcert = public certificate only. Not secret.

The .pem contains:

- Public key
- Name/organization/city/country fields
- Validity dates
- Certificate fingerprint

  Check its first line:

```sh
head -1 tello-native-release-certificate.pem
```

  For your exported certificate it should say:

  -----BEGIN CERTIFICATE-----

  A PEM can theoretically hold a private key, but then it would say BEGIN PRIVATE KEY or BEGIN
  ENCRYPTED PRIVATE KEY. Your exported .pem does not.

  Also, that old .pem belongs to the abandoned C=41710 certificate and is not needed. The production
  private key is the validated .p12 backup.

 Yes. To preserve the ability to sign updates, the irreplaceable pair is:

  1. tello-native-release-2026-10-03.p12
  2. Its password

  The analogy:

   Android signing                            Bitcoin
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   .p12 containing the private signing key    Encrypted wallet file
  ─────────────────────────────────────────  ──────────────────────────────────────────
   .p12 password                              Wallet decryption password
  ─────────────────────────────────────────  ──────────────────────────────────────────
   Public certificate/fingerprint             Public address
  ─────────────────────────────────────────  ──────────────────────────────────────────
   Signing an APK update                      Signing a transaction
  ─────────────────────────────────────────  ──────────────────────────────────────────
   Android verifies the signature             Bitcoin network verifies the transaction

  The difference from 12 seed words:

  - Bitcoin seed words can regenerate the wallet’s private keys from nothing.
  - Your .p12 password cannot regenerate the .p12.
  - Lose the .p12, and the password alone is useless.
  - Lose the password, and the encrypted .p12 is generally useless.
  - Anyone obtaining both can publish APKs that appear to be authentic updates.

  So your .p12 is closer to an encrypted Bitcoin wallet file—not the 12 words themselves.

  Also record these non-secret details for convenience:

  Alias: tello-native
  Package ID: tech.jalcocer.tello
  Certificate fingerprint: F0:AD:A1:BE:...:89:8E

  The .pem and fingerprint are public and cannot sign anything.

{{< callout type="info" >}}
Captured all the [learnings here](https://gitlab.com/fossengineer1/dron/-/tree/feature/android-native/kotlin-android-release-learnings?ref_type=heads)
{{< /callout >}}

 The two irreplaceable items are:

  - tello-native-release-2026-10-03.p12
  - Its password (used as both keystore and key password)

  Confirm the file SHA-256 is: `b430d9d58a11cd3740476b69bdd5b0f373820dd7c12fca8c2ebb9b3758b6a543`

  Also record:

```md
  Alias: tello-native
  Package ID: tech.jalcocer.tello
```

Keep at least two encrypted copies in separate locations. You do not need to back up GitHub Secrets
or Base64 data—they can be recreated from the .p12 and password. 

Yes, SHA-256 hashes can be public. They cannot reconstruct the key or password.

  Safe to publish:

  - File checksum
  - Certificate fingerprint
  - Alias
  - Package ID

  Never publish:

  - .p12 file
  - Base64 representation
  - Keystore/key password

The certificate fingerprint is already publicly visible inside every signed APK.



### DJI Tello Android in Kotlin


> https://github.com/JAlcocerT/tello-kotlin/releases/tag/android-v0.1.1

> https://gitlab.com/fossengineer1/dron/-/commits/feature/android-native


{{< callout type="info" >}}
To **make another release** follow [these notes](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/10-release-runbook.md?ref_type=heads)
{{< /callout >}}

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


### About Desktop Apps

Does making desktop apps with Python makes sense?

Like this TKInter test that I made [here for karting](https://jalcocert.github.io/JAlcocerT/gopro-telemetry-desktop-python/).

Or for some one who hasnt done one: could RUST be the way?

<!-- https://youtu.be/WhjEL817Onw?si=uBhfxuuQhwRA0Ufe -->

{{< youtube "WhjEL817Onw" >}}


Or just go all in for flutter?


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

---

## FAQ


### My Fav Android Apps

* Nextcloud
* SatStat
* Sensor Server
* PhyPhox
* Immich
* F-Droid
* CAPod
* *RacheChrono*
* ~~Official Tello FPV~~ My Rust desktop version of the Tello
* Syncthing *see also [Localsend](https://github.com/localsend/localsend)*

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pairdrop" title="PairDrop | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![Pairdrop UI](/blog_img/selfh/media/pairdrop-ui.png)


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
* Aegis    * <https://www.opensourcealternative.to/project/Aegis> -->

### Using Obtanium

> https://github.com/ImranR98/Obtainium/releases

```sh
#apt install openjdk-17-jre-headless 
keytool -genkeypair \
  -keystore tello-native-release.p12 \
  -storetype PKCS12 \
  -alias tello-native \
  -keyalg RSA \
  -keysize 4096 \
  -validity 10000

# Generating 4,096 bit RSA key pair and self-signed certificate (SHA384withRSA) with a validity of 10,000 days
# 	for: CN=JAlcocerT, OU=JAlcocerTech, O=JAlcocerTech, L=Seville, ST=Spain, C=41710
```


Owner: CN=JAlcocerT, OU=JAlcocerTech, O=JAlcocerTech, L=Seville, ST=Spain, C=41710

```sh
/secure/off-repo/path/tello-native# keytool -exportcert -rfc \
  -keystore tello-native-release.p12 \
  -alias tello-native \
  -file tello-native-release-certificate.pem

##Enter keystore password:  
#Certificate stored in file <tello-native-release-certificate.pem>
```

Then created the public repo:
```sh
#sudo apt install gh
gh auth login
gh repo create tello-kotlin --public --source=. --remote=origin --push
```

The standalone app is now live at `JAlcocerT/tello-kotlin`. Completed:

- Native Android project copied into its own repository
- Release workflow adjusted for the new root layout
- Unit tests and debug APK build passed
- Obtainium guide and learnings updated
- Commits pushed through 4f3cf52

Before creating a release, regenerate the key because C=41710 should be the country code C=ES. 

Also, the current key is root-owned and readable by other users.

Run as your normal user:

```sh
mkdir -p /home/jalcocert/.local/share/tello-signing
chmod 700 /home/jalcocert/.local/share/tello-signing
cd /home/jalcocert/.local/share/tello-signing

keytool -genkeypair \
  -keystore tello-native-release.p12 \
  -storetype PKCS12 \
  -alias tello-native \
  -keyalg RSA \
  -keysize 4096 \
  -validity 10000 \
  -dname "CN=JAlcocerT, OU=JAlcocerTech, O=JAlcocerTech, L=Seville, ST=Seville, C=ES"

chmod 600 tello-native-release.p12
```

Then verify the fingerprint, back up the new key twice, and configure the four GitHub secrets.

Do not create `android-v0.1.0` until that is finished.
  
The updated steps are in `/home/jalcocert/Desktop/tello-kotlin/z-obtanium-guide.md`.

That is the correct final signing key:

- Identity: C=ES
- Alias: tello-native
- RSA: 4096-bit
- Valid until: February 2054
- SHA-256:`F0:AD:A1:BE:30:83:D3:E3:7A:5C:3E:92:22:D5:97:88:54:E3:C3:C6:7A:91:A5:32:3E:42:C3:88:13:37:89:8E`

Save that fingerprint in your password manager. 

Do not export a `.pem` nor regenerate the key.

Then continue through Steps 3–5 to upload [the four GitHub secrets](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/04-signing-and-secrets.md?ref_type=heads) and use [Github actions for release](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/06-github-actions-release.md?ref_type=heads)

```sh
ANDROID_KEYSTORE_BASE64
ANDROID_KEYSTORE_PASSWORD
ANDROID_KEY_ALIAS
ANDROID_KEY_PASSWORD
```

```sh
cd ~/Desktop/tello-kotlin

base64 -w 0 "$HOME/.local/share/tello-signing/tello-native-release.p12" \
  | gh secret set ANDROID_KEYSTORE_BASE64

read -rsp "Keystore password: " TELLO_PASSWORD
echo
printf '%s' "$TELLO_PASSWORD" | gh secret set ANDROID_KEYSTORE_PASSWORD
printf '%s' 'tello-native' | gh secret set ANDROID_KEY_ALIAS
printf '%s' "$TELLO_PASSWORD" | gh secret set ANDROID_KEY_PASSWORD
unset TELLO_PASSWORD

#gh secret list
```

### Kotlin

[Kotlin needs java](https://gitlab.com/fossengineer1/dron/-/blob/feature/android-native/kotlin-android-release-learnings/07-challenges-and-fixes.md?ref_type=heads#5-confusion-about-why-kotlin-needed-java)

Kotlin/Gradle Android builds run on the JVM.

JDK 17 is a build toolchain dependency. It does not change the native Kotlin
application architecture. The Java setup step passed in both CI runs.

  Instead, securely save:

  - GitHub account access
  - 2FA recovery codes
  - .p12 signing file
  - .p12 password

  If a GitHub token is lost, it can be recreated. If the .p12 is lost, the existing Android app cannot
  be updated normally.

you can restart as repository owner—but repository ownership cannot override Android’s signature
  check. I’ll verify the current Android signing guidance so I can distinguish “publish a replacement”
  from “update the already-installed app” precisely.

• Searching the web

• Searched the web for https://developer.android.com/studio/publish/app-signing

───────────────────────────────────────────────────────────────────────────────────────────────────────

• Yes—you can start over, but it would not be a seamless update.

  With a new key:

  - Same package ID: Android rejects installation over the existing app. Users must uninstall the old
    app first, then install the replacement.

  - New package ID: Android treats it as a completely separate app; it can coexist with the old one.

  Owning the GitHub repository lets you publish anything, but it cannot override Android’s signature
  verification. Google confirms that without managed Play App Signing, losing the app-signing key means
  losing the ability to update that existing app. Android signing documentation

  For this controller, restarting would be manageable because little app state is stored—but every user
  would need a manual reinstall and possibly reconfigure Obtainium.