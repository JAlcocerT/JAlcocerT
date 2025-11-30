---
title: Benchmarks for HomeLab
type: docs
prev: /docs/privacy/
next: docs/arch/
draft: false
---



{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/where-to-deploy/" title="Where to Deploy" image="/blog_img/selfh/hetzner-sharedcpu.png" subtitle="A VPS Recap on Hetzner, DO to ship PoCs and more" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/benchmarking-computers/" title="About Benchmarking POST" image="/blog_img/hardware/ram-test.png" subtitle="CPU vs RAM vs Disk vs Internet" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/" title="SBC vs MiniPC Comparison" image="/blog_img/hardware/bmax-b4.jpg" subtitle="OrangePI 5 vs BMAX B4 performance comparison" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/firebat-ak2-plus-minipc-review/#firebat-ak2-benchmarks/" title="FireBat AK2 Benchmarks" image="/blog_img/mini_pc/firebat-mounted.jpg" subtitle="Under 1L MiniPC Benchmark" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/" title="X300 Review" image="/blog_img/mini_pc/bmax_asrockx300.jpg" subtitle="Building a SFF Home Server with the Asrock x300" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/laptop-lenovo-thinkpad-x13-benchmark/" title="Testing the Thinkpad X13" image="/blog_img/hardware/Lenovo-x13-micron-ssd.png" subtitle="~1kg x13 laptop review" >}}
{{< /cards >}}


[Power consumtion](https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/#power-consumption-and-temps) matters.

Even if you got your solar panel setup:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/microcontrollers-setup-101/#solar-power--microcontrollers/" title="Solar Panel x MicroControllers" image="/blog_img/outro/solar-panel.jpg" subtitle="Comparing a ESP32 vs a Pico W" >}}
{{< /cards >}}

As per my [energy experiments](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/#consumption): expect idles of ~15W for a x300 / ~10W for a BMAX or a laptop / ~5W for a Pi

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tapo-p110-review" title="Tapo Smart Plug Post" image="/blog_img/hardware/energy/x300-linux-w11-energy.jpg" subtitle="Measuring x300 Linux 15w vs W11 25w consumption via the P110" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/laptop-lenovo-thinkpad-x13-benchmark/" title="Testing the Thinkpad X13" image="/blog_img/mini_pc/firebat-mounted.jpg" subtitle="~1kg x13 laptop review - SSD Speed Section" >}}
{{< /cards >}}

The OS you choose will matter to the energy consumption, specially if there is AI/agentic stuff going on that you dont really need.