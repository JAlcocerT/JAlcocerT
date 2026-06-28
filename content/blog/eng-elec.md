---
title: "Enough Electronics for a Dron or Canbus"
date: 2026-06-26
draft: false
tags: ["Electronics","Diode","PySpice","KiCad-CLI","RadioMaster Pocket","CANable x SMT"]
description: 'The electronics you can learn for free x Building a custom FPV Drone.'
url: 'electr-diode'
math: true
---

**TL;DR**

Someone is already doing this!

**Intro**

I saw a podcast on the beach and 

https://github.com/diodeinc/pcb

### Dron electronics

### Canbus electronics

Tried this with an [outlander](https://en.wikipedia.org/wiki/Mitsubishi_Outlander)

I mean passive canbus sniffing

With the **Jhoinrch RH02 USB adapter** and the **XMSJSIY OBD2 pigtail cable** currently in your cart, you have a perfect, fully complete hardware package to hack your fleet of cars.

Just a final quick layout checklist for when your package arrives on Tuesday:

1. Connecting the 3 wires

The terminal block order on the **Jhoinrch RH02** is clearly marked right next to the green ports:

* **CAN_H** ➔ Connect to the wire from **OBD Pin 6**
* **CAN_L** ➔ Connect to the wire from **OBD Pin 14**
* **GND** ➔ Connect to the wire from **OBD Pin 4 or 5**

2. The 120Ω Switch (R120)

You will notice a tiny physical switch labeled **R120** on the black plastic body.

* **Set it to OFF.** Since you are plugging directly into a fully functioning car network, the vehicle already has its own terminating resistors built into the computers. Adding another one can interfere with the signals.

3. Safely tuck away the rest

Make sure to insulate those remaining 13 loose wires from the pigtail cable with electrical tape—especially the **12V power line (Pin 16)**.

Once that's done, pop the OBD2 connector into your vehicle, plug the USB port into your Linux laptop, fire up `candump can0`, and enjoy mapping out your dashboard metrics!

1. It is 100% Plug-and-Play on Linux
Reviewer artin kiany specifically notes:

"Excellent USB-to-CAN FD adapter. Plug-and-play on Linux and works reliably for CAN communication. It comes pre-flashed with candlelight firmware and you can easily update it."

This is the best part for you. Since it already has the native candlelight firmware installed, you don't need to flash anything or mess around with Windows COM ports. You just plug it into your laptop, use the standard Linux network commands (ip link), and can-utils will talk to it natively.

2. High Stability for Older and Newer Cars
Reviewers alex and Mr.Schmidt point out that it uses an external clock crystal (HSE) for high temporal stability and seamlessly supports standard CAN 1.0 and 2.0 up to 1 Mbps, alongside CAN-FD up to 5 Mbps. This means it will downscale perfectly to read the 500 kbps signals on your Laguna, Outlander, Mondeo, or Golf 7 without dropping a single frame.

```sh
codex
#ip link
#can-utils
```

https://github.com/Elmue/CANable-2.5-firmware-Slcan-and-Candlelight

* https://github.com/candle-usb/candleLight_fw

---

## Conclusions

https://jalcocert.github.io/JAlcocerT/electromagnetism-101/#what-actually-happens-in-the-valve


![alt text](/blog_img/electronic/forgejo-electronics-mirror.png)


---

## FAQ

This \(\sigma(z) = \frac{1}{1 + e^{-z}}\) is an inline expression.

then

$$F(\omega) = \int_{-\infty}^{\infty} f(t)\, e^{-j \omega t} \, dt$$

more

$$
\begin{aligned}
  \nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
  \nabla \cdot \mathbf{B} &= 0 \\
  \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
  \nabla \times \mathbf{B} &= \mu_0 \left( \mathbf{J} + \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t} \right)
\end{aligned}
$$

$$
\begin{aligned}
  2x + 3 &= 7 \\
  2x &= 4 \\
  x &= 2
\end{aligned}
$$


The logistic function:
$$\sigma(z) = \frac{1}{1 + e^{-z}}$$

The Fourier Transform:
$$F(\omega) = \int_{-\infty}^{\infty} f(t)\, e^{-j \omega t} \, dt$$


### IoT MQTT

https://jalcocert.github.io/JAlcocerT/data-driven-insulation-evaluation/#iot-walls-sun-and-heat-transfer


So:

  - connected client from 192.168.1.15 = yes
  - active Pico message traffic right now = not observed in the brief trace

  If you want, I can keep a live trace running for longer or check the exact topic the Pico should be publishing to.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

› can you share with me the commands you run on the container to confirmed all that?


• Yes. These are the commands I ran from the host to confirm it:

  docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'
  docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'

  docker inspect -f 'Status={{.State.Status}} Health={{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}} RestartCount={{.RestartCount}} StartedAt={{.State.StartedAt}}' emqx
  docker logs --tail 40 emqx
  docker logs --since 1h emqx | tail -n 50
  docker inspect -f 'LogPath={{.LogPath}}' emqx

  docker exec emqx sh -lc 'ls -1 /opt/emqx/bin 2>/dev/null && echo --- && /opt/emqx/bin/emqx_ctl status 2>/dev/null || true'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl help | sed -n "1,240p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl broker stats 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics list 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl retainer info 2>&1 | sed -n "1,120p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl retainer topics 1 1000 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients list 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl subscriptions list 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients show e66141040370772c 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients show mqttjs_d61ad246 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics show pico/temperature/dht22 2>&1 | sed -n "1,200p"'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics show pico/humidity/dht22 2>&1 | sed -n "1,200p"'

  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace start topic pico/temperature/dht22 /tmp/pico-temp.trace info json 2>&1 | sed -n "1,120p"'
  sleep 5; docker exec emqx sh -lc 'wc -c /tmp/pico-temp.trace 2>/dev/null; echo ---; sed -n "1,120p" /tmp/pico-temp.trace 2>/dev/null'

  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace stop topic pico/temperature/dht22 >/dev/null 2>&1; /opt/emqx/bin/emqx_ctl trace start topic pico/# /tmp/pico-all.trace info json 2>&1 | sed -n
  "1,120p"'
  sleep 5; docker exec emqx sh -lc 'wc -c /tmp/pico-all.trace 2>/dev/null; echo ---; sed -n "1,120p" /tmp/pico-all.trace 2>/dev/null'

  A couple of the key ones:

  - emqx_ctl clients list to see connected clients
  - emqx_ctl topics list to see active topics in broker state
  - emqx_ctl trace start topic ... to watch live publishes


docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl clients list'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl topics list'
  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace start topic pico/# /tmp/pico.trace info json'

  To check whether messages arrived after starting the trace:

  sleep 5
  docker exec emqx sh -lc 'wc -c /tmp/pico.trace; echo ---; sed -n "1,120p" /tmp/pico.trace'

  To stop the trace:

  docker exec emqx sh -lc '/opt/emqx/bin/emqx_ctl trace stop topic pico/#'

  If you want a single command for live monitoring, I can give you a one-liner that loops and shows new trace output as it lands.

  The usual way is to open a long-lived subscriber and keep it connected.

  If you have mosquitto_sub installed:

  mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/#' -v

  That will stay open and print every message on any pico/... topic.

  Useful variants:

  - All topics:

    mosquitto_sub -h 127.0.0.1 -p 1883 -t '#' -v

  - Only one sensor topic:

    mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/temperature/dht22' -v

  - Show connection/debug details:

    mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/#' -v -d

  If you need TLS on EMQX:

  mosquitto_sub -h 127.0.0.1 -p 8883 --cafile ca.crt -t 'pico/#' -v

  If mosquitto_sub is not installed, I can give you the equivalent using a container or another MQTT client.


  I found it here:

  - poc/iot-rpi-dht-insulation/ingester/data/readings.sqlite

  What I verified:

  - It has a readings table.
  - It currently contains 40 rows.
  - The newest rows are from 2026-06-07, including:
      - pico/temperature/dht22
      - pico/humidity/dht22
      - pico/temperature/internal
      - esp32/temperature/dht11
      - esp32/humidity/dht11

```sh
mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/temperature/dht22' -v
mosquitto_sub -h 127.0.0.1 -p 1883 -t 'pico/humidity/dht22' -v
```

### Tomatoes

After [2-2.5 months of been planted](https://youtube.com/shorts/sCrMm5sLG-w), the [tomatoes](https://jalcocert.github.io/JAlcocerT/plants-101/#1-tomato-seeds-pomidor) started to take some other color than green.

At 3 months, they went from [yellow shades to orange](https://youtube.com/shorts/_YBjNO8urfE):

{{< youtube "_YBjNO8urfE" >}}

### DC Boost vs Ram Pump

If you [like analogies](https://jalcocert.github.io/JAlcocerT/fluids/#the-analogy), here you have a practical one between fluids and electronics.

A DC boost does the oppositee of [a buck converter](https://jalcocert.github.io/JAlcocerT/electromagnetism-for-ac-dc-motors/#ac-vs-dc-power-transmission), it tries to rise DC voltage

A ram pump



### STM32G431 vs ESP32

The **Jhoinrch RH-02 Plus** you are buying uses an **STM32G431** microcontroller chip (an ARM Cortex-M4 core).

While it is tempting to look at a powerhouse like the **ESP32** (with its built-in dual-core processor, Wi-Fi, and Bluetooth) and think it would be better, the STM32 is chosen for a USB-to-CAN adapter for three massive reasons: **native hardware CAN integration, ultra-low latency, and reliable USB clocking.**

1. The Native CAN-FD Controller

To talk to a car, a microcontroller needs a dedicated internal hardware peripheral called a CAN Controller to manage the bit-timing, frame styling, and error-checking.

* **The STM32G431:** It has a built-in **FDCAN** controller right on the silicon. This hardware module natively understands both classic CAN 2.0 and the newer CAN-FD (up to 5 Mbps) standard. It handles the blistering pace of thousands of car messages per second at the hardware level without stressing the main CPU core.
* **The ESP32:** The classic ESP32 only has a built-in controller for **classic CAN 2.0** (historically called the Twin Turbo CAN controller or SJA1000 clone). It **does not support CAN-FD** natively. While newer variants like the ESP32-H2 or ESP32-C6 include basic CAN functionality, their implementations are not as robust or high-performance as STM32's dedicated automotive-grade silicon.

2. High-Speed Native USB Support (The Critical Flaw of ESP32)

Your adapter communicates with your laptop via USB. 

The way a chip handles USB completely changes its latency.

* **The STM32G431:** It features a **Native USB 2.0 Full-Speed device peripheral**. The USB lines from your laptop plug directly into the pins of the STM32 chip. It handles the data transfer instantly, creating a pure, direct pipeline to the Linux kernel.

* **The ESP32:** The classic, most common ESP32 chip **has no native USB hardware**. If you see a micro-USB or USB-C port on an ESP32 board, it’s actually a completely separate, cheap USB-to-UART bridge chip (like the CH340 or CP2102) welded onto the side.

* **The problem:** The ESP32 has to talk to the bridge chip via serial (UART), and then the bridge chip talks to your laptop. This creates a massive data bottleneck and adds latency, causing the system to drop packets when your car's CAN bus gets heavily saturated.

3. Timing Precision & FreeRTOS vs. Bare Metal

Car networks require microscopic timing precision. If a microcontroller delays a message by even a millisecond because it's doing something else, it can cause sync issues.

* **The STM32G431:** It runs "bare-metal" or on ultra-light schedulers (like FreeRTOS). It uses a highly stable external crystal oscillator (HSE) as a heartbeat. When a CAN frame hits the chip, a dedicated hardware interrupt fires, processing the packet with absolute deterministic speed.

* **The ESP32:** Because it has to manage complex wireless stacks (Wi-Fi and Bluetooth), it runs a heavy operating system background layer. The wireless radios frequently cause internal interrupts that steal processing time. If the chip pauses for a fraction of a millisecond to maintain a Bluetooth link or search for a Wi-Fi network, it will miss incoming CAN frames.

| Feature | STM32G431 (Your USB Adapter) | ESP32 (Wireless Dongles) |
| --- | --- | --- |
| **Primary Focus** | Extreme speed, wired precision, CAN-FD | Wireless connectivity, IoT, smart home |
| **USB Link** | **Native Direct USB** (Zero Bottleneck) | Serial-bridge translation (Slow) |
| **CAN-FD Support** | Yes (Up to 5+ Mbps) | No (Classic CAN 2.0 only) |
| **Latency** | Microseconds | Milliseconds |

**The Takeaway:** If you were building a standalone device to sit under the dash and text your phone when the car alarm goes off, the ESP32 wins hands down because of its wireless radios.

But because your goal is to **sniff a raw firehose of high-speed data directly into a Linux terminal over a wire**, the native USB and dedicated hardware CAN controller inside the STM32 chip make it vastly superior. You bought the mathematically correct chip for this specific job!

### STM vs PicoW

Here is how the **STM32G431** inside your USB adapter stacks up against the **RP2040** chip inside the Raspberry Pi Pico W:

1. The Core Architecture (The Similarities)

Both chips are built by licensing processor blueprints from **ARM**.

* **Raspberry Pi Pico W (RP2040):** Uses two **ARM Cortex-M0+** cores running at $133\text{ MHz}$. The Cortex-M0+ is ARM's ultra-efficient, entry-level, low-power design.

* **Your USB Adapter (STM32G431):** Uses a single **ARM Cortex-M4** core running at **$170\text{ MHz}$**.

Even though the Pico has two cores, the single core in your STM32 is vastly more powerful.

The Cortex-M4 architecture includes dedicated hardware for complex math processing (Floating Point Unit / FPU) and Digital Signal Processing (DSP). 

It can crunch complex data calculations significantly faster than the Pico's M0+ cores.

2. The Internal Network Hardware

This is where the chips split paths based on what they were designed to do:

* **The STM32G431 is an Automotive/Industrial Specialist:** STMicroelectronics designed the "G4" line specifically for digital power applications, motor control, and automotive networking. 

Because of this, it has an advanced **FDCAN hardware peripheral** baked right into the silicon. It doesn't need to use CPU processing power to monitor the CAN lines; the silicon handles it natively.

* **The RP2040 is a General-Purpose Swiss Army Knife:** The Raspberry Pi Foundation designed the RP2040 to be an amazing, flexible chip for general electronics hobbists. However, it **does not have a CAN controller chip built into it.** 

If you wanted to use a Pico to talk to a car, you would have to buy an external chip module (like an MCP2515) and wire it up, or write highly complex software to fake a CAN controller using the Pico's unique Programmable I/O (PIO) blocks.

| Feature | RP2040 (Raspberry Pi Pico W) | STM32G431 (Your USB Adapter) |
| --- | --- | --- |
| **ARM Core Type** | Cortex-M0+ (Dual Core) | Cortex-M4 (Single Core + Math FPU) |
| **Clock Speed** | $133\text{ MHz}$ | **$170\text{ MHz}$** |
| **Native CAN Bus** | ❌ No | ** |
| **Native USB** | Yes | Yes |
| **Wireless (Wi-Fi/BT)** | Yes (via external CYW43439 chip) | ❌ No |

You can think of the Pico W as the ultimate tool for wireless tinkering, smart-home automation, and connecting sensors to the internet.

But for your car project, where you need a chip that can sit directly on an industrial automotive network, withstand massive data bursts without flinching, and route them instantly to a native USB stream, the heavy-duty Cortex-M4 inside the STM32 is exactly the upgrade you want.

Yes, we were! Let's bring it back to those **1S All-In-One (AIO) flight controllers** for your indoor Whoop drone build.

To help visualize how the electronic brains of your drone connect compared to your solar project, here is the complete breakdown of the 1S AIO system.

### How the 1S AIO Simplifies Your Build

An AIO board replaces a massive stack of separate components.

On a single tiny circuit board (like the **BetaFPV F4 1S** or **HappyModel SuperX**), you have everything built right into the fiberglass:

1. **The Brain (STM32 MCU):** Runs Betaflight to keep the drone stable.
2. **The Gyro/Accelerometer:** Measures the drone's angles in the air.
3. **The 4 ESCs (Speed Controllers):** Drive the high-speed brushless motors.
4. **The Receiver (ESP32 ELRS):** Listens to your RadioMaster Pocket.
5. **The VTX (Video Transmitter):** Blasts the 5.8GHz camera feed into the room.

Easiest Way to Wire It (No-Solder Motor Plugs)

Because you want to avoid advanced micro-soldering, choosing the **BetaFPV** or **HappyModel** boards is a lifesaver. 

Here is exactly what you connect when building it:

* **The 4 Motors:** They have tiny white plastic plugs on the ends of their wires. You literally just click them into the 4 pre-soldered sockets on the corners of the AIO board. **(Zero soldering)**

* **The Battery Lead:** The board comes with a pre-soldered power cable (usually a BT2.0 or PH2.0 connector) dangling off it. You just plug your 1S LiPo battery straight into it. **(Zero soldering)**

* **The Caddx Ant Camera:** This is the *only* part you solder. The camera has 3 wires: **Power (+)**, **Ground (-)**, and **Video (Yellow)**. You solder these 3 wires to the clearly marked pads on the AIO board.

Once those 3 camera wires are soldered and the motors are plugged in, you screw the board onto your plastic indoor Whoop frame, snap the canopy on top, and plug it into your Linux PC to configure Betaflight!


* **The Reality:** PH2.0 is an old toy-drone connector style that has high electrical resistance. It causes "voltage sag," meaning your drone thinks the battery is dead even when it isn't.
* **The Modern Way:** Modern 1S flight controllers (like the BetaFPV or HappyModel ones we talked about) come with a **BT2.0 connector** pre-soldered right out of the box. You buy BT2.0 batteries (like the Tattu or BetaFPV Lava listed there) and plug them directly in. Buying adapters just adds dead weight and ruins your flight performance.

* **The Caddx Ant Camera:** Keep this. It remains the absolute king of budget analog cameras.
* **The Whoopstor V3 Charger:** This is the **best 1S battery charger on the market**. It safely charges six 1S batteries at once via USB-C, and more importantly, it has a "Storage" button. When you are done flying, it brings the batteries to a safe storage voltage so they don't degrade or puff up over time.
* **The Tattu or BetaFPV Lava Batteries:** Excellent choices, but make sure you buy the ones with **BT2.0 plugs** natively on them.
