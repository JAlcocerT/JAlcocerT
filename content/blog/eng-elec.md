---
title: "Enough Electronics for a Dron or Canbus"
date: 2026-06-26
draft: false
tags: ["Electronics","Diode","PySpice","KiCad-CLI","RadioMaster Pocket x EdgeTX","CANable x SMT"]
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

I mean passive canbus sniffing!

With the **Jhoinrch RH02 USB adapter** and the **XMSJSIY OBD2 pigtail cable** currently in your cart, you have a perfect, fully complete hardware package to hack your fleet of cars.

Just a final quick layout checklist for when your package arrives on Tuesday:

1. Connecting the 3 wires

The terminal block order on the **Jhoinrch RH02** is clearly marked right next to the green ports:

* **CAN_H** ➔ Connect to the wire from **OBD Pin 6** - Green
* **CAN_L** ➔ Connect to the wire from **OBD Pin 14** - Brown
* **GND** ➔ Connect to the wire from **OBD Pin 4 or 5** - Yellow

{{< callout type="info" >}}
Used a multimeter to test continuity and map the colors
{{< /callout >}}

When looking at your car connection you'll see:

```md
WIDER TOP SIDE
         _______________________________
        \  1   2   3  (4) (5) (6)  7   8  /
         \ 9  10  11  12  13 (14) 15 (16)/
          -------------------------------
                NARROWER BOTTOM
```

Withing the obd they are reversed, see the details next to your obd pins to do this properly:

{{< youtube "aooXkGFk5xI" >}}

<!-- https://youtube.com/shorts/aooXkGFk5xI -->

```sh
sudo dmesg | tail -n 20
```

Which provided:

```md
usb 1-1: Product: CANable2 b158aa7 github.com/normaldotcom/canable2.git
cdc_acm 1-1:1.0: ttyACM0: USB ACM device
```

According to these lines: Your adapter uses CANable 2 open-source firmware and is initializing as a virtual serial modem interface under ttyACM0. This means it is running in slcan (serial CAN) mode.

This log output is perfect! It tells us exactly what firmware your Jhoinrch adapter is running under the hood.

According to these lines:

```text
usb 1-1: Product: CANable2 b158aa7 github.com/normaldotcom/canable2.git
cdc_acm 1-1:1.0: ttyACM0: USB ACM device
```

Your adapter uses **CANable 2** open-source firmware and is initializing as a virtual serial modem interface under **`ttyACM0`**. This means it is running in **slcan (serial CAN)** mode.

Let's initialize the network adapter link on your laptop right now so the software interface is completely ready for the car.

Step 1: Bind the Serial Device to a Linux Network Interface

We will use the `slcand` (Serial CAN Daemon) utility from `can-utils` to attach the serial port `ttyACM0` to a network socket called `can0`, setting the speed to **500k** ($500\text{ kbps}$), which is the standard speed for most modern car diagnostic buses.

Run this command in your terminal:

```bash
sudo apt update && sudo apt install can-utils -y
sudo slcand -o -c -s6 /dev/ttyACM0 can0
```

*(Note: The `-s6` flag specifies the 500,000 bits/sec speed).*

Step 2: Bring the Network Interface Up

Now, tell Linux to activate the newly created network adapter interface:

```bash
sudo ifconfig can0 up
```

Step 3: Verify It's Ready

To double-check that the interface is alive and configured properly, run:

```bash
ifconfig can0
```

You should see `can0` listed in your terminal as an active network interface!

Since the device is not connected to a vehicle network yet, if you try to run a sniffing command like `candump can0`, the screen will stay blank because there are no electronic data frames passing through the wires yet.


```text
can0: flags=193<UP,RUNNING,NOARP>  mtu 16
```

The `UP` and `RUNNING` flags mean your Linux system has successfully accepted the custom Jhoinrch hardware interface as a native network card. 

Test locally before going to the car (Optional couch test)

If you want to absolutely prove the software layers can talk to the stick right now without leaving your seat, open up a **second, separate terminal window** and run this command to start listening:

```bash
candump can0
```

Then go back to your **first terminal window** and fire a fake packet into the void:

```bash
cansend can0 123#DEADBEEF
```

Because there is no car network connected to absorb or respond to the signal, your `candump` might stay quiet or the device might throw a silent internal transmit error.

But if you see *anything* pop up, your link is golden. (If nothing shows, don't worry—CAN buses physically require at least two alive nodes on the circuit to acknowledge a packet).


> Pack up the laptop, grab your custom cable, and head out to the vehicle—you are ready to connect to the OBD2 port!

Seeing that `123  [4]  DE AD BE EF` pop up in your other terminal is a beautiful sight! It means your loopback/tx validation is working perfectly on your laptop. You have officially built a fully functioning CAN node.

And you are exactly right about the car—depending on the model and year, you will see anywhere from **500 to well over 2,000 messages per second** screaming across the screen. It looks like a matrix waterfall and is impossible to read with the human eye.

Fortunately, the `can-utils` suite has a built-in tool specifically designed for recording this chaos so you can analyze it later on your couch.

---

How to Record 10 Seconds of Data

Instead of `candump`, you will use a tool called **`cangen`** or **`candump` with logging flags**. The best tool for this job is `candump` combined with a timeout command.

To record exactly 10 seconds of raw car data and save it to a file, run this command in your terminal:

```bash
timeout 10s candump -l can0

```

What this command does:

* **`timeout 10s`**: Automatically stops the process and cuts the recording off after exactly 10 seconds.
* **`-l` (Log flag)**: Tells candump *not* to print the text to the screen, but instead write it directly into a highly optimized log file.

When the 10 seconds are up, the command will exit, and you will find a new file in your current folder named something like:
📁 **`candump-2026-07-01_180449.log`**

How to "Play Back" the Recording on Your Couch

This is where the real hacking magic happens. Once you have that log file saved, you can unplug from the car, go back inside, and replay those 10 seconds through your laptop as if you were still plugged into the live vehicle!

To replay your log file, use **`canplayer`**:

```bash
canplayer -I candump-2026-07-01_180449.log

```

*(Just replace the filename with your exact log file name).*

If you have `candump can0` running in another window while you run `canplayer`, you will see all 10,000+ messages stream past your screen at the exact same speed and timing they happened inside the car. This lets you isolate packet IDs, search for button presses, and reverse-engineer the data safely at your desk.

when youll be done:

```sh
sudo ip link set can0 down
sudo killall slcand
```


2. The 120Ω Switch (R120)

You will notice a tiny physical switch labeled **R120** on the black plastic body.

* **Set it to OFF.** Since you are plugging directly into a fully functioning car network, the vehicle already has its own terminating resistors built into the computers. Adding another one can interfere with the signals.

3. Safely tuck away the rest

Make sure to insulate those remaining 13 loose wires from the pigtail cable with electrical tape—especially the **12V power line (Pin 16)**.

Once that's done, pop the OBD2 connector into your vehicle, plug the USB port into your Linux laptop, fire up `candump can0`, and enjoy mapping out your dashboard metrics!

1. It is 100% Plug-and-Play on Linux

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


https://github.com/JAlcocerT/hermesagent/tree/tinker/hermesagent/electronics-101

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


#### Tomatoes x Solar

Want a  a micro-scale proof of concept for energy independence right on your balcony?

* https://www.reddit.com/r/esp32/comments/xsv2zz/bluetti_db_bridge_a_esp32_based_bluetooth_and/
* https://github.com/SSMCD/bluetti2mqtt

#### Solar x Travel

If you need sth more than software and a glm for workations.

> You can repurpose this later on for your homelab / garden!

### DC Boost vs Ram Pump

If you [like analogies](https://jalcocert.github.io/JAlcocerT/fluids/#the-analogy), here you have a practical one between fluids and electronics.

A DC boost does the oppositee of [a buck converter](https://jalcocert.github.io/JAlcocerT/electromagnetism-for-ac-dc-motors/#ac-vs-dc-power-transmission), it tries to rise DC voltage

A ram pump

#### Buck Converter

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

### Pocket and EdgeTX

* https://github.com/edgetx/edgetx

> EdgeTX is the cutting edge **open source firmware for your R/C radio**

{{< youtube "AKUXxsIrtek" >}}

<!-- 
https://youtube.com/shorts/AKUXxsIrtek -->


### About J1962

The official name for the OBD-II port is the **J1962 connector**. 

It was standardized back in 1966 so that environmental regulators could check any vehicle's emissions system using a single tool.

Because it had to support dozens of car brands over the decades, the 16 pins are divided into three categories: **The Standard Modern Pins** (what you are using), **The Legacy/Old Protocols** (from before 2008), and **Manufacturer Discretionary Pins** (wildcards).

1. The Power & Ground Core (Your Essentials)

These pins are mandatory on *every single car* to keep the diagnostic tools alive and safe.

* **Pin 4 — Chassis Ground:** Connects straight to the bare metal frame of the car. It safely dumps heavy electrical noise from things like wipers and headlights.
* **Pin 5 — Signal Ground:** A clean, isolated electrical reference line running straight to the main vehicle computer (ECU). **This is what you connected your Yellow wire to.**
* **Pin 16 — Battery Power (`+12V`):** Tied directly to the vehicle’s battery. It has constant power even if the engine is completely off and the keys are out.

2. The Modern CAN Bus Network (Your Target)

Since 2008, all cars sold are legally required to use this specific pair of wires for emission tracking. This is the exact high-speed digital highway you are hacking into right now.

* **Pin 6 — CAN High (`CAN_H`):** The positive data stream line running at $500\text{ kbps}$. **This is your Green wire.**
* **Pin 14 — CAN Low (`CAN_L`):** The negative data stream line. It runs in an inverted loop to cancel out external electromagnetic interference. **This is your Brown wire.**


3. The Manufacturer Wildcards (Discretionary)

The regulatory bodies left these pins entirely unassigned. Car manufacturers can use them for whatever proprietary internal factory tasks they want.

* **Pins 1, 3, 8, 9, 11, 12, 13:** These are often empty, but if a wire is attached, it’s a dealer secret. For example, BMW often uses Pin 8 as a secondary K-Line for body electronics/infotainment, Ford uses Pin 3 for a secondary Medium-Speed CAN network, and some modern cars map these out to a hidden Ethernet line for fast flashing.

4. Legacy Diagnostic Protocols (The History)

Before CAN bus became the absolute king in 2008, different car companies used completely different physical languages to communicate. If you look inside older cars, you'll find pins wired up here instead of pins 6 and 14:

* **Pin 2 & Pin 10 (`SAE J1850`):** Used mostly by older Ford (PWM method) and General Motors/Chrysler (VPW method) vehicles.
* **Pin 7 & Pin 15 (`ISO 9141-2 / K-Line`):** The old standard used by European and Asian imports up until the mid-2000s. Pin 7 (K-Line) handled bidirectional commands, while Pin 15 (L-Line) acted like an alarm clock to wake up the car's computer before testing began.

| Pin | Standard Assignment | What it Does in Modern Cars |
| --- | --- | --- |
| **1** | Manufacturer Discretionary | Often used for OEM specific ignition or brand features. |
| **2** | SAE J1850 Bus+ | Old Ford/GM data communication stream. |
| **3** | Manufacturer Discretionary | Often a secondary body-control network. |
| **4** | **Chassis Ground** | Safety ground connected to the car frame. |
| **5** | **Signal Ground** | Clean electronic logic ground (**Your Yellow Wire**). |
| **6** | **ISO 15765-4 CAN High** | Main High-Speed vehicle communication network (**Your Green Wire**). |
| **7** | ISO 9141-2 K-Line | Older diagnostic communications line. |
| **8** | Manufacturer Discretionary | Often used to trigger programming modes or multimedia lines. |
| **9** | Manufacturer Discretionary | Frequently used for Tachometer/Engine RPM tracking signals. |
| **10** | SAE J1850 Bus- | Old Ford network return line. |
| **11** | Manufacturer Discretionary | Custom OEM slot. |
| **12** | Manufacturer Discretionary | Custom OEM slot. |
| **13** | Manufacturer Discretionary | Custom OEM slot. |
| **14** | **ISO 15765-4 CAN Low** | Main High-Speed vehicle network return line (**Your Brown Wire**). |
| **15** | ISO 9141-2 L-Line | Old vehicle computer wake-up trigger line. |
| **16** | **Battery Power (+12V)** | Unswitched 12V juice directly from the battery (Always Live). |

Your custom interface maps exactly to pins **5**, **6**, and **14**, which isolates the vehicle's high-speed brain network while safely disregarding all the unneeded noise! Ready to make your trip to the vehicle cabin?