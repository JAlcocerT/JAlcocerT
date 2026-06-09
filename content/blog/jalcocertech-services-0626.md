---
title: "[JAlcocerTech] Services Recap"
date: 2026-06-06T11:20:21+01:00
draft: false
tags: ["RoadMap26","Herdr x Codex CLI x Hermes","Cold email outreach x Leads","APIFY"]
description: 'JAlcocerTech Leads and Services mid 2026. Beyond Zettlekasten.'
url: 'jalcocertech-services-snapshot'
---


**Tl;DR**

The last piece to combince me that this is enough.



**Intro**

After the post-wedding thoughts, it was time to make this clear.

Specially that im leveraging outreach


## The services

https://github.com/JAlcocerT/jalcocertech/tree/main-site-cloudflare-hub


The flow, from the ones who prefer to trade time for knowledge:

```mermaid
flowchart LR
    %% --- Styles ---
    classDef free fill:#E8F5E9,stroke:#2E7D32,stroke-width:2px,color:#1B5E20;
    classDef low fill:#FFF9C4,stroke:#FBC02D,stroke-width:2px,color:#FBC02D;
    classDef mid fill:#FFE0B2,stroke:#F57C00,stroke-width:2px,color:#F57C00;
    classDef high fill:#FFCDD2,stroke:#C62828,stroke-width:2px,color:#C62828;
    classDef bridge fill:#E3F2FD,stroke:#1565C0,stroke-width:3px,color:#0D47A1;

    %% --- Nodes ---
    L0("Free Content<br/>( DIY = $0)"):::free
    L1("Web Audits 🛡️<br/>(Reveals Problem )"):::free
    L11("Tech Blog/Youtube"):::free
    L12("ebooks"):::free
    L13("mbsd framework OSS"):::free
    L14("OSS guides"):::free

    L3("Done With You<br/>(Trade $$ for knowledge)"):::mid
    L4("Done For You<br/>(Trade $$$ for outcomes)"):::high
    L44("GenBI<br/>Shopify PoC"):::bridge
    L45("Real Estate<br/>Funnel Bot"):::bridge
    L46("Energy Solutions<br/>HVAC insulation"):::bridge
    L47("IoT Solutions<br/>Crops"):::bridge
    L48("Weddings<br/>Photo QR"):::bridge

    %% --- Connections ---
    L0 --> L1
    L1 --> L3
    L12 -->|JAlcocerTech| L3
    L13 -->|MultiBodySystemsDynamicscom| L3
    L14 -->|FOSS Engineer| L3
    L0 --> L11
    L0 --> L12
    L0 --> L13
    L0 --> L14
    L3 --> L4
    L4 -->|Productized Service| L44
    L4 -->|Productized Service| L45
    L4 -->|Productized Service| L46
    L4 -->|Productized Service| L47
    L4 -->|Productized Service| L48
```

You bet that I needed to put something together [to find clients](#my-outreach-setup) for all those products.


### The free ones

Ive consolidating the `diy.jalcocertech` into the `ebook` one.

Particularly at: https://ebooks.jalcocertech.com/books/web-diy/

Bringing the images I had in there:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/obfuscate" title="DIY JAlcocerTech x Obfuscation | Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/1ton-ebooks" title="ebboks JAlcocerTech | Github ↗" icon="github" >}}
{{< /cards >}}


#### JAlcocerTech Ebooks 


{{< cards >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

While creating some more images via OpenAI to improve explainability:



Ive also improved the main `www.jalcocertech`

• Done on branch main-site-cloudflare-hub.


#### FOSSEngineer x HomeLab 

There has been several improvements in the foss workflow:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/" title="HomeLab | Docker Configs 🐋 ↗" >}}
{{< /cards >}}

#### This blog

I added [agent skills to this public repository](https://github.com/JAlcocerT/JAlcocerT/tree/main/.agents/skills) to help me improve my writting: `zettel-blog-notes` and `blog-post-editor`

```sh

```

It incorporates the **concept of zettelkasten**: one post, one topic.

> A word that i got to know thanks to the files.md project `https://app.files.md/`

> > Now I have `http://localhost:1314/notes/` and skills for this :)


#### JAlcocerTech WebAudits


Ive done few web audits, to people I just met - With email report

Santi, this one goes for you to.

I mean, the new skill that i got:

```sh
make docker-build
make docker-prod-up
```

![alt text](/blog_img/entrepre/webify/webaudits.png)

`https://cabesota.com/`

![alt text](/blog_img/entrepre/webaudit.png)

The proof that you can make money with a shitty landing: `https://genkinfy.com/#faq`

```md
make audit-full-fast URL=https://genkinfy.com/
SKIP_LINKS=false LINK_CHECK_METHOD=${LINK_CHECK_METHOD:-lychee-docker} ./audit-master.sh "https://genkinfy.com/"
╔════════════════════════════════════════════════════════════╗
║                Master Audit - Full Site Analysis           ║
╚════════════════════════════════════════════════════════════╝

Target: https://genkinfy.com/
Orchestration:
 - Lighthouse: ACTIVE
 - Link Check: ACTIVE
 - SEO Crawl:  ACTIVE
 - Security:   ACTIVE

Launching audit phases in parallel...
 → Lighthouse PID=419907
 → LinkCheck PID=419908
 → SEO PID=419909
 → Security PID=419910
 → Latency PID=419911
All phases finished in 32s

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                FINAL AUDIT RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Performance:              31/100
SEO (Technical):          95/100
Link Integrity:           70/100
Security Headers:         0/100
──────────────────────────────────────────────────────────
OVERALL SITE GRADE:       45/100 ⭐

Master report saved to: ./master-reports/master-20260604-192953.json
```

```sh
LINK_CHECK_TIMEOUT_SECONDS=0 make audit-full URL=https://fossengineer.com
LINK_CHECK_TIMEOUT_SECONDS=0 ./linkcheck-audit.sh https://fossengineer.com docker
```

For **social previews**, use:

  - https://www.opengraph.xyz/url/https%3A%2F%2Febooks.jalcocertech.com
  - `https://cards-dev.twitter.com/validator` (after deploy)


This can be a good addition going forward:

* https://github.com/firecrawl/fireplexity

> Open Source Perplexity like AI search engine with real-time citations, streaming responses, and live data powered by Firecrawl

AI search engine with web, news, and images. You will need firecrawl and groq Apis.

##### Codex CLI WebAudit to Report

The new web audit is deployed normally at:

But hey, if all the goodies are happening within a internal CLI and there is a `.json` that consolidates it all...

cant that be passed to a one time codex prompt with a skill that generates a nice one pager branded report?

* https://platform.openai.com/usage

{{< cards >}}
  {{< card link="https://github.com/clidey/whodb" title="WhoDB Github ↗" icon="github" >}}
{{< /cards >}}


### Productized Services

From the consulting landing, which has received improvements: Committed on `landing-improvements branch`


#### GenBI - Shopify QnA

Initially this is coming from:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
 {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

Now, I have:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
 {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

```sh

```

### The BEST - DFY

The top of the list.

My attention caring about your problems: 

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Tier of Service for the ones that cant wait to get value" >}}
{{< /cards >}}

With some tools:

* https://why-postmortem-checks.pages.dev 
* https://pm-pdm-checks.pages.dev

#### Engineering services

Couldnt resist to cold email to the founder of diode as it resonates with me

Stay tuned

Because this resonated a lot with

#### IoT, Crops and Energy

You name it.



it all started here:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/RPi" title="RPi Github with scripts ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}

And continued:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/iot-rpi-dht" title="PoC ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/PoC/iot-rpi-mlx" title="PoC ↗" icon="github" >}}
{{< /cards >}}

```sh
npx wrangler pages project list
```

* https://go-solar.pages.dev/
* https://aerothermics-landing.pages.dev
* https://solar-trajectory.pages.dev  

The final boss consolidates it all:

```sh
cd ./poc/aerothermics
make dev

cd ./poc/go-solar
make ship
```

https://github.com/JAlcocerT/poc/blob/main/aerothermics/dev-plan.md

Yep, heavily inspired by my latest trip planner: `trip-planner-9lt.pages.dev`

https://jalcocert.github.io/JAlcocerT/thermodynamics/

![alt text](/blog_img/apps/aerotermia.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed a Flask WebApp with https and NGINX to Hertzner" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main" title="Data Chat Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

![alt text](/blog_img/entrepre/aerotermia.png)

![alt text](/blog_img/entrepre/aerotermia-landing.png)

![alt text](/blog_img/entrepre/gosolar.png)


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/iot-rpi-mlxdht-insulation" title="PoC ↗" icon="github" >}}
{{< /cards >}}

```sh
make mqtt-listen MQTT_HOST=192.168.1.2 MQTT_TOPIC='pico/#'
#  make arduino-compile
# make serial-fix PORT=/dev/ttyACM0
# make flash # make flash PORT=/dev/ttyACM0
make mqtt-listen MQTT_HOST=192.168.1.2 MQTT_TOPIC='esp32/#'
```

```sh
make sqlite-start MQTT_HOST=192.168.1.2
make dev-clean
```

![alt text](/blog_img/iot/mqtt-sqlite-dht.png)

It ended up working on my x300 at `http://192.168.1.2:3025/`: 

```sh
MQTT_HOST=192.168.1.2 make docker-up
make docker-sqlite-last10
```

![alt text](/blog_img/iot/mqtt-sqlite.png)

> The deepsleep mode of the esp32 has been great so far for this project!

This is coming soon:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/poc/genbi-energy-solutions" title="Energy Solutions↗" icon="github" >}}
{{< /cards >}}



#### Multi Body Systems Dynamics dot com

I took all the goodies from the github and forgejo repos: *2D/3D*

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/PoC/" title="PoC ↗" icon="github" >}}
{{< /cards >}}


> I couldnt avoid to email again to Gabe Morris :)

---

## Conclusions

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="The power to DIY - via ebooks" image="/blog_img/web/1ton-webook.png" subtitle="Distilled knowledge via web/ooks that enable you to create" >}}
{{< /cards >}}

### My OutReach Setup

Coming from the [email outbound setup 101 post section](https://jalcocert.github.io/JAlcocerT/poc-107/#the-only-way-im-shipping-now)



`http://192.168.1.2:3034/explore/repos`

`http://192.168.1.2:3034/jalcocert/leads-slubnechwile/src/commit/c2605d3ded7244d008b17c6ecc310ff36f50ca86/zzz-hormozi-actionplan-leadarchitect.md`

`julita@getleadarchitect.com` for `https://leadarchitect.org/`

{{< details title="Email outbound checks - Setup recap 📌" closed="true" >}}


1. Get a domain
2. Get a workspace `https://workspace.google.com/`

* `https://admin.google.com/` - from here you can manage the mail user image!

Dont forget to add the DNS and check with `https://mxtoolbox.com/`


`http://192.168.1.2:3034/hermesagent/email-outbound-check`

```sh
# source venv/bin/activate
# pip install -r requirements.txt
python email_check.py julita@getleadarchitect.com
python email_check.py any@other-domain.com --json
```

{{< /details >}}


{{< details title="Email outbound x SmartLead 📌" closed="true" >}}


`https://app.smartlead.ai/sign-up`

`https://app.smartlead.ai/app/email-campaigns-v2`

https://app.smartlead.ai/app/email-accounts/emails -> `https://www.youtube.com/watch?v=jUOF5FaFbZs`

will appear at `https://admin.google.com/u/0/ac/owl/list?tab=configuredApps`

look via the given `.apps.googleusercontent.com`


![alt text](/blog_img/entrepre/gmail-smartlead.png)

https://app.smartlead.ai/app/email-accounts/emails
https://app.smartlead.ai/app/email-account/19740710/warmup?email=julita.j@getleadarchitect.com
![alt text](/blog_img/entrepre/gmail-warmup.png)

{{< /details >}}


{{< details title="Made it also for getslubnechwile 📌" closed="true" >}}



{{< /details >}}

### Inbound marketing x Branded Videos

In theory, artifacts like ebooks, this blog, fossengineer... should give you inbound traffic.

But

The openAI image gpt 2 is so great that there is really no excuse not to get this right.

Doing 3 min videos (with xyz words aka xyz tokens) and 30 second shorts...

Its just one skill away:

```sh

```

---

## FAQ

### Whats your current agentic setup?

Im using right now herdr *> tmux* to better orchestrate agents sessions and dont go crazy with deliveries waiting for my input.

```sh
herdr #go out with ctrl + b then q
```

Ive tried `https://chat.z.ai/`, Kimi, GLM, Qwen 3.6 Plus and deepseek v4 which are well positioned at `https://arena.ai/leaderboard/agent` via `https://opencode.ai/go`

```sh
choco install opencode
```

![testing opencode with deepseek v4](/blog_img/dev/opencode-deepsekv4.png)

> `https://opencode.ai/workspace/wrk_01KTF9F2H7HR7DDPCB6CY0RDD6/go`


### Open Physics

Across the physics series, I have been building tinkering with this OSS stack:

Geometry / CAD / Rendering

- CadQuery - Python-first parametric CAD; your preferred agentic CAD bridge.
- OpenSCAD - simple code-based CSG CAD, good for lightweight STL-style parts.
- FreeCAD - GUI CAD, FEM workbench, STEP/IGES workflows.
- Blender - mesh-based rendering, animation, visual realism, Python scripting.
- Build123d - mentioned as a more Pythonic CadQuery-like alternative.
- Three.js - WebGL visualization / web rendering.
- Matter.js - 2D physics engine for web demos.

MBSD / Mechanics / Symbolic Math

- SymPy - deriving equations symbolically.
- NumPy / SciPy - numerical math, transforms, FFT, simulation support.
- Your own MBSD Python framework - JAlcocerT/mbsd.
- Your own related repos: Slider-Crank, mechanism, Bike_dynamic_simulator, Py_Double_Pendulum, ThreeBodies.

FEM / Structural / Multiphysics
From content/blog/eng-fem.md:167:

- FreeCAD FEM
- CalculiX
- Elmer FEM
- Code_Aster
- Salome-Meca
- FEniCS / FEniCSx
- Firedrake
- SfePy
- CALFEM for Python
- Akantu
- Gmsh
- Netgen
- PyVista
- ParaView

CFD / Fluids
From content/blog/eng-fluid-mechanics.md:330:

- OpenFOAM
- FreeCAD CfdOF
- Elmer FEM
- pySPH
- ParaView
- OpenModelica

Thermal / Thermodynamics
From content/blog/eng-heat-transfer.md:594:

- Modelica
- OpenModelica
- OMPython
- PyMarl
- HeatraPy
- PySpice was also mentioned in the broader thermal/electronics tooling context.

Electronics / Electromagnetism / IoT From content/blog/eng-electronics.md:390:

- KiCad
- Atopile
- PySpice
- OpenModelica
- Schemdraw
- Velxio
- Arduino IDE
- ESPHome
- EMQX
- MQTT
- Prometheus
- Grafana
- TimescaleDB
- Elasticsearch / Logstash as downstream telemetry/data options.

Content / Visualization

- Remotion - videos as code for physics/engineering explanations.
- Matplotlib - plots, GIFs, validation visuals.
- D3.js - mentioned as promising for data/visualization.

If I had to reduce your physics OSS stack to the “core pipeline,” it is:

SymPy / NumPy / SciPy
→ MBSD Python framework
→ CadQuery / OpenSCAD / FreeCAD
→ Gmsh / CalculiX / Elmer / OpenFOAM
→ PyVista / ParaView / Blender / Three.js / Remotion
→ MQTT / EMQX / Grafana for real-world sensor feedback

The strongest recurring pattern in your posts is: physics as code → geometry as code → simulation as code → visualization as code → sensors to ground the model.