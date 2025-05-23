---
title: "SelfHosting AI Apps - My 2025 Favs"
date: 2025-11-30T23:20:21+01:00
draft: false
tags: ["Dev"]
description: '.'
url: 'selfhosting-ai-apps-2025'
---

https://pytorch.org/get-started/locally/

https://theresanaiforthat.com/most-saved/

* **Others:** [LibreChat](https://www.youtube.com/watch?v=0BRnK5BGZHU), Autogen + AutogenStudio https://microsoft.github.io/autogen/blog/2023/12/01/AutoGenStudio/ or [Quivir](https://github.com/StanGirard/quivr) with great [docs](https://docs.quivr.app/home/intro) or [LocalGPT](https://github.com/PromtEngineer/localGPT).
  * Bindings:
    * https://github.com/abetlen/llama-cpp-python
* https://github.com/khoj-ai/khoj



The goal of **this post** is:

1. To review some of the [AI projects](#ai-apps) that are helpful on my workflow
2. To learn how to use [Caddy](#how-to-setup-caddy) as [NGINX](#how-to-install-nginx)/[Traefik](#how-to-install-traefik) alternative to get HTTPs certificates


<!-- https://www.youtube.com/watch?v=XH9XgiVM_z4 -->
{{< youtube "XH9XgiVM_z4" >}}

{{< details title="DNS challenge | PorkBun 📌" closed="true" >}}



{{< /details >}}

### Voice to Text

* [Piper](https://github.com/rhasspy/piper) - Also works [Text to Voice](https://www.youtube.com/watch?v=SzRF50UwzYk)
  * [Voices at HF](https://huggingface.co/rhasspy/piper-voices/tree/main)

See https://github.com/mumble-voip/mumble

>  Mumble is an open-source, low-latency, high quality voice chat software. 

---

{{% details title="How to Secure my Services?" closed="true" %}}

* [NGINX](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/)
* [Cloudflare](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/)
  * It allows
* Authelia / Zitadel / Authentik

{{% /details %}}

### How to Back Up my Server?

Duplicati to other location (HD / Mega, One drive, s3...)

You can also try with [Python Venvs or Conda](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/):

```sh
python -m venv your-env #(create a virtual environment)
source your-env/bin/activate #(or on Windows your-env\Scripts\activate) (activatea the venv)
#deactivate
```

```sh
conda create -n yourcondaenvironment python=3.11
conda activate yourcondaenvironment
conda deactivate
```