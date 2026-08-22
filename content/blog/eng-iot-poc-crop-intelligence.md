---
title: "Crops Intelligence in the AI era"
date: 2026-08-20
draft: false
tags: ["MQTT x EMQx","ESP32 x IRLZ44N x 1N4007","Tomatoes x Watering","Arduino-CLI"]
description: 'Learning after planting in spring. Ready to scale.'
url: 'iot-crop-intelligence'
math: true
---

**TL;DR**

I just wanted to [plant tomatoes](https://jalcocert.github.io/JAlcocerT/plants-101/#1-tomato-seeds-pomidor) to stay away from the computer.

Then this happened...

**Intro**

* Why Im writting this post: *bc its time to put together all the noise, from [DC adapters](https://youtube.com/shorts/HwavCMkah0o), [the BoM](https://youtube.com/shorts/mKVvW_jl3UI) with [electronics](https://youtube.com/shorts/oxZVchAZV0U), the [bluetti](https://youtube.com/shorts/1nK0-MDh7LY), the microcontroller...*
* What Ive learnt with it: *How to use a breadboard. How a mosfet, a diode, a capacitor play together. Validate with a multimeter. Use mqtt to control an esp32 to make a BLDC pump (and not only) work, with firmware updated via arduino-cli...*

With this *chaotic* selflearning project, Ive made:

1. An [electromagnetism recap to avoid frying my esp32](https://jalcocert.github.io/JAlcocerT/electromagnetism-101/#how-to-avoid-frying-an-esp32-due-to-kickback)

2. Some simulations around PySpice: here and here

3. 


```sh
sqlite3 /home/jalcocert/poc/iot-rpi-dht-insulation/ingester/data/readings.sqlite "SELECT date(received_at) AS day, COUNT(*) AS rows, AVG(value) AS avg_value FROM readings WHERE metric = 'temperature' GROUP BY day ORDER BY day;"
```

## The setup


A 15W solar panel setup is great: 

<!-- 
https://youtu.be/oPznvdWmcTQ -->

{{< youtube "oPznvdWmcTQ" >}}


Just that sometimes, there is not enough juice from the sun flowing for the ESP32's

And you'll want to measure temp and humidity during the night as well

But without the 250$ of [a bluetti](https://jalcocert.github.io/JAlcocerT/understanding-batteries/#tomatoes-x-bluetti)


### The Power Circuit

Testing with a manual switch is the best way to verify a **power circuit** before adding microcontrollers and software.

```sh
git clone https://github.com/JAlcocerT/electronics-101
cd electronics-101/watering-plants/power-circuit-1
```

> I ended up making a [`components.json` to get clarity](https://github.com/JAlcocerT/electronics-101/blob/master/watering-plants/power-circuit-1/components.json) of the protoboard setup

What Can Be Skipped

* **The LED & its resistor:** 100% optional. It is only a visual power indicator.
* **The 1 k$\Omega$ series gate resistor:** You can skip it for this manual switch test. You can wire the switch directly between **+12V** and the **Gate (Pin 1)**.

*(The IRLZ44N gate can handle up to $\pm 16\text{ V}$, so direct +12V is within its safe limit).*

The Two Components You Must NEVER Skip

1. **The 10 k$\Omega$ Pull-Down Resistor (Gate to GND):** Required to pull the gate to 0V when the switch opens so the pump stops cleanly.
2. **The Flyback Diode (1N4007 / 1N5819 across the pump):** Required to suppress the inductive voltage kick and protect the MOSFET from burning out.

Minimal Direct Circuit

```
+12V (Bluetti +) ──┬──> [Pump +] 
                   │      │
                   │   [Diode: Cathode (Stripe) to +12V, Anode to Drain]
                   │      │
                   ├──> [Switch] ──┬──> Gate (Pin 1)
                                   │
                                [10 kΩ Resistor]
                                   │
GND (Bluetti -) ───┬───────────────┴──> Source (Pin 3)
                   │
                   └──> [Pump -] ───> Drain (Pin 2)

```

To make the MOSFET turn fully ON and shut completely OFF, you need two resistors: a **pull-down resistor** (to keep it off when the switch is open) and a **switch to +12V** (or +5V).


```
          +12V Power Rail
           │
           ├───[+] Water Pump ──┐
           │                    │  (Flyback Diode)
           │                  [▲ 1N4007 / 1N5819]  <-- Cathode (Silver stripe) to +12V!
           │                    │
           │   ┌──[Switch]──────┴─────────┐
           │   │                          │
           └───┤                          │
               │                          │
             (1 kΩ)                       │
               │                          │
               ├─── Gate (Pin 1)          │
               │                          │
            (10 kΩ)       IRLZ44N         │
               │       Drain (Pin 2) ─────┘
               │                          
               └─── Source (Pin 3) ───────┐
                                          ▼
                                      GND (12V -)
```

Steps

1. **Pump & Diode:**
* Pump **(+) wire** $\rightarrow$ **+12V Supply**
* Pump **(–) wire** $\rightarrow$ **IRLZ44N Drain (Pin 2)**
* **Flyback Diode:** Across the pump leads. Place the **Silver Stripe (Cathode)** to **+12V** and the **Plain Black side (Anode)** to the **Drain (Pin 2)**.

2. **MOSFET Source:**
* **IRLZ44N Source (Pin 3)** $\rightarrow$ **GND (Power Supply –)**

3. **Gate Resistors & Switch:**
* Connect a **10 k$\Omega$ resistor** directly between **Gate (Pin 1)** and **Source / GND (Pin 3)**. *(This prevents the gate from "floating" and accidentally running the motor when the switch is open).*
* Connect a **1 k$\Omega$ resistor** in series with your manual push button / toggle switch.
* Connect one end of that switch chain to **+12V** (or a 5V rail) and the other end to **Gate (Pin 1)**.

How to Test It

* **Switch Open (OFF):** The 10 k$\Omega$ resistor pulls the Gate to 0V $\rightarrow$ Motor remains completely silent.
* **Switch Closed (ON):** The Gate receives positive voltage $\rightarrow$ The MOSFET turns fully ON $\rightarrow$ The pump runs.


{{< details title="Breadboard connections... 📌" closed="true" >}}

Here is the exact pin-by-pin layout using your breadboard's grid coordinates (Rows 20 to 22, columns A to J, and the outer + / - power rails):

Step-by-Step Component Grid Placement
ComponentLeg / WireBreadboard HoleConnection Purpose12V Plug (Bluetti)Red Wire (+12V)+ Rail (any red hole)Powers the positive railBlue Wire (GND)- Rail (any blue hole)Powers the ground railIRLZ44N MOSFET (text facing left)Pin 1 (Gate)Row 20, Hole EControl gate terminalPin 2 (Drain)Row 21, Hole ESwitched negative pump outputPin 3 (Source)Row 22, Hole ECurrent return terminalGround Jumper WireLeg 1Row 22, Hole AConnects Source to ground railLeg 2- Rail (blue hole)Completes MOSFET ground circuit10 k$\Omega$ ResistorLeg 1Row 20, Hole BConnects to GateLeg 2Row 22, Hole BConnects to Source/GNDWater Pump (AW500S)Red Wire (+)+ Rail (red hole)Constant +12V power to pumpBlack Wire (–)Row 21, Hole AControlled by MOSFET Drain1N4007 DiodeCathode (Silver Stripe)+ Rail (red hole)Reverse bias power clampAnode (Plain Black end)Row 21, Hole BConnected to Drain / Pump (–)Manual SwitchTerminal 1+ Rail (red hole)12V trigger sourceTerminal 2Row 20, Hole ADelivers 12V to Gate to turn ON
Final Check Before Powering Up
Row 20 (Gate): Contains only MOSFET Pin 1 (E20), one side of the 10k resistor (B20), and one wire from the Switch (A20).

Row 21 (Drain): Contains only MOSFET Pin 2 (E21), Pump Black wire (A21), and Diode Anode (B21).

Row 22 (Source): Contains only MOSFET Pin 3 (E22), one side of the 10k resistor (B22), and the Jumper to GND rail (A22).

Diode Orientation: Double-check that the silver band is firmly plugged into the + Rail, not Row 21.

You can verify the MOSFET connections before turning on the power using a few quick multimeter checks.

1. Physical Pin Orientation Check

Hold the **IRLZ44N** upright so you are looking directly at the **printed text on the front plastic face** (the metal tab with the mounting hole is facing away from you):

```
       ┌──────────────┐
       │   IRLZ44N    │  <-- Front text facing you
       │              │  <-- Metal heatsink tab on the back
       └──┬────┬────┬─┘
          │    │    │
          1    2    3
        Gate Drain Source

```

* **Pin 1 (Left - Gate):** Must be in **Row 20** (connects to switch & 10 k$\Omega$ resistor).
* **Pin 2 (Middle - Drain):** Must be in **Row 21** (connects to pump negative & diode anode).
* **Pin 3 (Right - Source):** Must be in **Row 22** (connects to ground & 10 k$\Omega$ resistor).

For the vast majority of standard N-channel Power MOSFETs in a TO-220 package (like your IRLZ44N, as well as IRFZ44N, IRF540N, IRLB8721, IRF3205, STP16NF06L, etc.), yes, the industry standard pinout is almost always:$$\textbf{Pin 1 = Gate (G)} \quad\mid\quad \textbf{Pin 2 = Drain (D)} \quad\mid\quad \textbf{Pin 3 = Source (S)}$$(With text facing you, leads pointing down, and the metal tab internally tied to Pin 2 / Drain).

2. Cold Resistance / Continuity Checks (Power Disconnected)

Keep the Bluetti disconnected and use your multimeter in **Resistance ($\Omega$)** or **Continuity mode**:

* **Drain to Tab Check:**
* Probe the **metal tab on the back of the MOSFET** and **Row 21 (Drain / Pin 2)**.
* **Result:** Should read $\approx 0\ \Omega$ (solid beep). The metal tab and the center pin are internally connected.


* **Source to Ground Rail Check:**
* Probe **Row 22 (Source / Pin 3)** and the **`-` Rail (Blue GND)**.
* **Result:** Should read $\approx 0\ \Omega$ (solid beep). This confirms the MOSFET has a complete return path to ground.


* **Gate to Source Pull-Down Check:**
* Probe **Row 20 (Gate / Pin 1)** and **Row 22 (Source / Pin 3)**.
* **Result:** Should read **$\approx 10\text{ k}\Omega$**. This confirms your pull-down resistor is correctly seated and pulling the gate to ground.


* **Gate to Drain Isolation Check:**
* Probe **Row 20 (Gate / Pin 1)** and **Row 21 (Drain / Pin 2)**.
* **Result:** Should show **`OL` (infinite resistance / open circuit)**. If you see $0\ \Omega$, the pins are accidentally bridged on the breadboard.


3. Switch Continuity Check (Power Still Disconnected)

* Measure resistance between the **`+` Rail (Red)** and **Row 20 (Gate / Pin 1)**:
* **Switch OPEN (OFF):** Should show **`OL` (open circuit)**.
* **Switch CLOSED (ON):** Should show **$\approx 0\ \Omega$** (or near zero).



If all these checks pass, your MOSFET is wired with the correct pinout, isolated from shorts, and ready for power.

Seeing it switch cleanly on the first try means your node wiring, polarities, and gate pull-down are all dialed in.

Here are **3 quick live multimeter tests** to confirm your circuit is operating under textbook electrical conditions:

Set your multimeter dial to **DC Voltage (V$\overline{\ldots}$)**. Keep the **Black probe** grounded on the **`-` Rail (Blue GND)** for all three tests, and touch the **Red probe** to the target rows:


1. Gate Voltage Test ($V_{GS}$) — *Checks the Control Signal*

* **Where to probe:** Red probe on **Row 20 (Gate)**.
* **Switch OFF:** Should read **$0.0\text{ V}$**. (Confirms the 10 k$\Omega$ resistor pulls the gate all the way down to prevent phantom running).
* **Switch ON:** Should read **$\approx 12.0\text{ V} - 13.5\text{ V}$**. (Confirms the MOSFET gets full gate overdrive to turn on with minimal resistance).

2. Drain-to-Source Voltage Test ($V_{DS}$) — *Checks MOSFET Efficiency*

* **Where to probe:** Red probe on **Row 21 (Drain)**.
* **Switch OFF:** Should read **$\approx 12.0\text{ V} - 13.5\text{ V}$**. (The pump isn't conducting, so the drain is pulled up to +12V through the motor coils).
* **Switch ON:** Should drop to **almost $0\text{ V}$ (typically $0.02\text{ V} - 0.1\text{ V}$)**.
* *Why this matters:* The closer to $0\text{ V}$ it is while the pump runs, the more completely the MOSFET is saturated, meaning virtually zero wasted power/heat in the transistor.


3. Pump Terminal Voltage — *Checks Available Motor Power*

* **Where to probe:** Red probe on the **`+` Rail (Red)**, Black probe on **Row 21 (Drain)**.
* **Switch OFF:** Reads **$0.0\text{ V}$**.
* **Switch ON:** Reads the full **$\approx 12.0\text{ V} - 13.5\text{ V}$** delivered directly across the pump terminals.

Put the minus (Black probe) in any hole along the - Rail (the Blue Ground rail) or directly in Row 22 (Source / Pin 3).Both spots are your 0V Ground reference.What to Look For:Switch OFF: The multimeter should read $0.0\text{ V}$.Switch ON: The multimeter should read $\approx 12.0\text{ V} - 13.5\text{ V}$ (your full Bluetti supply voltage).

Having the gate read 0.0 V when OFF and the full 12 V when ON confirms your control circuit and pull-down resistor are working under ideal conditions.

Now check the Drain (Pin 2 / Row 21) while keeping your Black probe on the - Rail (Ground):Switch OFF: Touch Red probe to Row 21 (Drain).

Expected: Reads full supply voltage ($\approx 12.0\text{ V} - 13.5\text{ V}$).

Switch ON: Touch Red probe to Row 21 (Drain) while the pump is spinning.

Expected: Drops to nearly zero ($0.02\text{ V} - 0.1\text{ V}$).

That drop to near $0\text{ V}$ confirms the MOSFET is fully saturated and acting like a solid closed switch with virtually zero power loss or heat.

---

Bonus: Clamp Meter Current Test (If you have a current clamp)

If your meter has a DC clamp head, clamp it around **only the Pump Red wire** (or only the Black wire, never both together) while running:

* **Dry running:** Expect around **$0.7\text{ A} - 0.9\text{ A}$** ($\approx 8 - 11\text{ W}$).

{{< /details >}}



<!-- https://youtube.com/shorts/vOa2auALcY0 -->

I got [this simulated here ](https://github.com/JAlcocerT/electronics-101/tree/master/watering-plants/power-circuit-1)before plugging DC on in the bluetti. 

{{< youtube "vOa2auALcY0" >}}

> Yep, I used TooN instead of json to make it with the 5k yt chars limit

Placing that $470\,\mu\text{F}$ capacitor across your power rails addresses two transient issues:

* **Voltage Sags / Dips:** When the motor starts up, it demands a sudden burst of current (inrush). The capacitor acts like a local reservoir, instantly dumping charge to prevent the 12V rail voltage from dipping and causing the Bluetti port or ESP32 to brown out.

* **Transient Voltage Spikes / Ringing:** When the motor switches off, wire inductance can bounce electrical energy back into the power lines. The capacitor helps smooth out those fluctuations alongside your flyback diode.


| Component | Main Job |
| --- | --- |
| **$470\,\mu\text{F}$ Capacitor** | Buffers the power supply against sudden voltage drops and line ripple during motor start/run. |
| **1N4007 Diode** | Clamps the massive high-voltage reverse spike (inductive kickback) when the motor shuts off. |
| **$10\text{ k}\Omega$ Resistor** | Pulls the gate to 0V to prevent floating/false triggers. |
| **$220\,\Omega$ Resistor** | Limits gate inrush current to protect the ESP32 GPIO pin. |
| **IRLZ44N MOSFET** | Performs the actual solid-state low-side switching. |

With the capacitor, diode, pull-down, and gate resistor in place, the circuit has all the standard protection stages needed for reliable, long-term switching.

And you bet it pushes water: *at 20/22w, while promised 19w @12v, notice that when pumping air drops to ~10w*

<!-- 
https://youtube.com/shorts/kDPNhy8Ep7o
 -->

{{< youtube "kDPNhy8Ep7o" >}}


### The Control Circuit

With this configuration: the manual switch moves from “driving the MOSFET gate with 12 V” to “enabling the pump’s +12 V feed.”

The ESP32 drives the MOSFET gate separately at 3.3 V through a gate resistor. 

ESP32 GND, MOSFET source, and 12 V supply negative must share ground.

The only additional components you need is : *the esp32 and a 220 ohm resistor to limit current*

And some rewiring ofc, bc now the Mosfet gate will be dictating if the pump moves or not

- ESP32
  - 100 Ω to 220 Ω gate resistor between ESP32 GPIO and MOSFET gate
  - Keep the existing 10 kΩ gate pulldown from gate to source/GND
  - Keep the existing flyback diode
  - Keep the existing pump/MOSFET wiring
  - Move the manual switch so it enables the pump’s +12 V feed, not the MOSFET gate

Connections:

ESP32 GPIO -> 220 Ω -> MOSFET gate
MOSFET gate -> 10 kΩ -> MOSFET source/GND
ESP32 GND -> same GND as MOSFET source and 12 V supply negative

Do not connect 12 V to any ESP32 pin.

The caution: your IRLZ44N was excellent with 12 V on the gate. With ESP32, the gate only gets 3.3 V.

It may work for a 1.6 A pump, but check the MOSFET temperature after a short pulse.

If it gets warm/hot, use a proper 3.3 V logic-level MOSFET or add a small gate-driver/level-shift stage.

Because a MOSFET is not just “on/off”; the gate voltage controls how strongly on it is.

For an N-channel MOSFET:

higher Vgs -> lower Rds(on) -> less heat
lower Vgs  -> higher Rds(on) -> more heat

The pump current flows through the MOSFET drain-source path. 

The MOSFET behaves like a small resistor when on. Heat is:

Pheat = I^2 * Rds(on)

Your pump is about:

19 W / 12 V ≈ 1.6 A

Example:

If Rds(on) = 0.03 Ω:
P = 1.6^2 * 0.03 ≈ 0.08 W   cool

If Rds(on) = 0.30 Ω:
P = 1.6^2 * 0.30 ≈ 0.77 W   noticeably warm/hot

With 12 V on the gate, the IRLZ44N is driven very hard on, so Rds(on) is low. 

With 3.3 V, it may only be partially enhanced, so Rds(on) can be much higher.

Also, Vgs(th) is misleading.

If a datasheet says threshold is 1-2 V, that only means the MOSFET barely starts conducting a tiny current.

It does not mean it can handle a pump efficiently at that gate voltage.

So for ESP32 control, the best part is a MOSFET whose datasheet explicitly specifies low Rds(on) at Vgs = 2.5 V or 3.3 V.

#### The ESP Logic

I placed [here some initial esp32 smoke test](https://github.com/JAlcocerT/electronics-101/tree/master/watering-plants/power-circuit-2) to make sure that [the components](https://github.com/JAlcocerT/electronics-101/blob/master/watering-plants/power-circuit-2/components.toon) wont be fried for neither setup 1 w/o esp and with it.

It was key to use [these arduino-cli learnings](https://jalcocert.github.io/JAlcocerT/data-driven-insulation-evaluation/#iot-walls-sun-and-heat-transfer) to deploy the code to the ESP32

```sh
#cd ./poc/iot-rpi-dht
#arduino-cli board list #make serial-list
#cd /home/jalcocert/Desktop/poc/iot-rpi-dht/scripts-arduino-setup
./upload-deepsleep.sh /dev/ttyACM0
```

```sh
cd /home/jalcocert/Desktop/poc/iot-rpi-dht

make arduino-install-cli
make arduino-setup
make arduino-board-list
make flash PORT=/dev/ttyUSB0

make flash-picow

ESP32 firmware files are under:

iot-rpi-dht/scripts-microcontrollers/firmware-esp32/

Pico W firmware files are under:

iot-rpi-dht/scripts-microcontrollers/firmware-picow/
```

```sh
cd ./poc/iot-esp-water

make board-list
make compile
make upload PORT=/dev/ttyACM0
make monitor PORT=/dev/ttyACM0
```

<!-- 
https://youtube.com/shorts/Jyd-0OEG5RQ 
-->

{{< youtube "Jyd-0OEG5RQ" >}}

You now have a fully functional, safe, and protected **dual-control circuit**:

* **Hardware Safety:** The physical toggle switch acts as a true master cut-off on the 12V high side.
* **Firmware Control:** The ESP32 safely triggers the low-side IRLZ44N MOSFET at 3.3V via GPIO 23.
* **Circuit Protection:** The flyback diode handles inductive voltage spikes, the bulk capacitor prevents rail sagging, and the pull-down/gate resistors protect the microcontroller and gate.

Final Check (Optional Sanity Check)

If you have your multimeter handy, perform one quick 2-second pulse reading across the MOSFET:

* **Red probe:** Row 21 (Drain)
* **Black probe:** Blue Rail (GND)

If that reading is **$< 0.15\text{ V}$** while the pump spins, your MOSFET is running ice-cold and **fully saturated**.

> Then, the final esp code version is here.

You can also try to build around [HA and MQTT like i did here](https://jalcocerT.github.io/JAlcocerT/pico-w/#ha-x-mqtt) or nodered

* https://github.com/JAlcocerT/Home-Lab/tree/main/home-assistant and node red

#### Controlling the ESP32 from the homelab

WebSockets are excellent for low-latency bidirectional communication, you can also evaluate other protocols standard in homelabs:

| Protocol | Latency / Overhead | Best Use Case | Popular Homelab Tools |
| --- | --- | --- | --- |
| **WebSockets** | Very Low / Persistent | Real-time streams, custom dashboards, direct low-latency control | Node.js (`ws`), Python (`websockets`), custom UIs |
| **MQTT** | Extremely Low / Lightweight | Decoupled pub/sub, fleet of IoT sensors, event-driven setups | **Mosquitto**, **Home Assistant**, Node-RED |
| **HTTP REST** | Medium / Request-Reply | Infrequent commands, basic webhooks | Express, Flask, Home Assistant Webhooks |
| **ESPHome API** | Native Native-TCP | Zero-code firmware, direct Home Assistant integration | **Home Assistant** + ESPHome dashboard |


WebSockets is the most direct and lowest-latency option, but for overall reliability in a homelab environment, **MQTT is generally considered the industry standard.**

While WebSockets works well, it leaves the burden of connection recovery, message delivery guarantees, and state management entirely on your custom code.

Why MQTT is Considered More "Reliable" for IoT

| Feature | WebSockets | MQTT (e.g., Mosquitto Broker) |
| --- | --- | --- |
| **Delivery Guarantees** | None built-in (you must write custom ACKs/retry logic). | Built-in **QoS levels** (QoS 0, 1, or 2) ensuring message delivery even over flaky Wi-Fi. |
| **Connection Drops** | You must manually handle reconnection loops and queue unsent messages. | The broker handles automatic reconnection, keep-alives, and packet buffering. |
| **Last Will & Testament (LWT)** | No native concept; server has to detect missing pings manually. | **Native feature:** If the ESP32 crashes or loses power, the broker automatically alerts the homelab (`status: offline`). |
| **Retained Messages** | If the ESP32 restarts, it doesn't know its last target state unless it asks for it. | **Retained topics:** The moment the ESP32 reconnects, it immediately receives its last commanded state without the homelab resending. |
| **Coupling** | **Point-to-Point:** Server and ESP32 must know about each other's connection lifecycle. | **Decoupled (Pub/Sub):** The homelab and ESP32 only talk to a lightweight broker (like Mosquitto). |

Where WebSockets Wins Over MQTT

* **Lower latency & streaming:** If you are streaming audio, high-frequency IMU sensor data (50–100Hz), or fast video frames, WebSockets has less protocol overhead for continuous raw streams.
* **Direct browser interaction:** You can connect directly to a browser UI without running a broker or bridge in the middle.
* **No middleware:** You don't need to spin up an extra Docker container for an MQTT broker if you already have a backend API.

The Verdict for Your Homelab

* **Use WebSockets if:** You are building a custom, highly responsive dashboard/stream (e.g., high-frequency telemetry, live canvas drawing, low-latency robot control) where occasional lost packets during a Wi-Fi blip don't break the system.
* **Use MQTT if:** You want a reliable **set-and-forget** home automation setup (toggling relays, controlling lights, periodic sensor reads) where messages must not be dropped and devices need to recover gracefully from reboots.
* **Use ESPHome (Native API) if:** Your homelab runs **Home Assistant**—it handles firmware, encryption, state syncing, and reconnection out of the box with zero custom C++ needed.


That bidirectional workflow—publishing sensor readings while subscribing to command topics—is the core design pattern of **MQTT in IoT**.

1. How Two-Way MQTT Works

An MQTT client can simultaneously **Publish** and **Subscribe** over the same broker connection:

```text
               ┌───────────────────────────────┐
               │    Homelab MQTT Broker        │
               │      (e.g., Mosquitto)        │
               └───────▲───────────────┬───────┘
                       │               │
       Publish Sensor  │               │ Subscribe Commands
       (e.g., moisture)│               │ (e.g., "PUMP_ON")
                       │               │
               ┌───────┴───────────────▼───────┐
               │             ESP32             │
               │   • Soil Moisture Sensor      │
               │   • Relay / Pump              │
               └───────────────────────────────┘

```

1. **ESP32 $\rightarrow$ Homelab:** ESP32 reads the sensor (e.g., soil moisture, water level) every few seconds and publishes data to `garden/sensor/moisture`.
2. **Homelab Automation:** Your homelab (Home Assistant, Node-RED, or a Python automation script) monitors that topic. When the value drops below a threshold, it runs logic (like checking weather forecasts, time-of-day limits) and decides whether to water.
3. **Homelab $\rightarrow$ ESP32:** Homelab publishes `{"action": "ON", "duration": 10}` to `garden/pump/set`.
4. **Action:** The ESP32 receives the message in its `callback()` function and pulls the relay pin `HIGH` to fire the pump.

> I went ahead with some test and see [how an ESP32 LED replies to MQTT commands](https://github.com/JAlcocerT/poc/tree/main/iot-esp-water/esp32-cpp-mqtt-blinks) from my homelab

```sh
printf '%s' 'your-password' > /tmp/iot-water-wifi-pass

make mqtt-blinks-upload \
  PORT=/dev/ttyACM0 \
  WIFI_SSID='Piszymsiu' \
  WIFI_PASSWORD_FILE=/tmp/iot-water-wifi-pass

#make mqtt-blinks-compile WIFI_SSID='test' WIFI_PASSWORD='test'
# make mqtt-blinks-upload \
#     PORT=/dev/ttyACM0 \
#     WIFI_SSID='test' \
#     WIFI_PASSWORD='test'
```

Once ready, you can send commands via MQTT and see how the ESP replies:

```sh
make mqtt-blinks-pub MQTT_TEST_CMD=blink
make mqtt-blinks-pub MQTT_TEST_CMD=on
make mqtt-blinks-pub MQTT_TEST_CMD=off
make mqtt-blinks-listen
```

{{< youtube "io585eybww0" >}}

<!-- 
https://youtube.com/shorts/io585eybww0 
-->


### The sensors you need

You can make of these sensors good companions:

1. DHT22 - For air temp & humidity
2. - Soil humidity
3. MLX - If you want surface, like leaves temp
4. DB if you want water temp


#### More BoM

4. Battery 18650 - *I got Samsung 35E (INR18650-35E)*
5. ESP32
6. Solar panel
7. [TP4056](https://jalcocert.github.io/JAlcocerT/data-driven-insulation-evaluation/#home-solar-test-x-tp4056) x DW01A

* **TP4056** = Stops it from going above $4.2\text{V}$ (Overcharge Protection).
* **DW01A Circuit** = Stops it from dropping below ~$2.4\text{V}$ (Over-discharge Protection).

> The `AZDelivery board` has **both**, the Samsung 35E battery is 100% safe in both directions!

The TP with the ~3400mha battery + esp32 deepsleep will take you without power connection to a [lifetime of ~9 days as per my experiment](https://jalcocert.github.io/JAlcocerT/understanding-batteries/#esp32-x-18650)

The 12V BLDC *centrifugal* pump: 

{{< youtube "mKVvW_jl3UI" >}}

<!-- 
https://youtube.com/shorts/mKVvW_jl3UI 
-->

Came together with some fuses: 

And rectifier diodes:

#### More stuff


{{< details title="AI Asisted Web Search... 📌" closed="true" >}}

{{< /details >}}



{{< details title="Pull down resistor... 📌" closed="true" >}}

A **pull-down resistor** is a resistor placed between a signal line (or pin) and **Ground (0V)** to ensure that the line stays at a definite, stable **LOW (0V)** state when no other active voltage source is connected to it.

The Problem It Solves: The "Floating" Pin

Digital inputs and MOSFET gates are extremely sensitive and have very high electrical resistance (impedance).

* If you connect a switch between **+12V** and the MOSFET **Gate**:
* **When the switch is ON:** The Gate receives a solid +12V (HIGH).
* **When the switch is OFF:** The Gate is not connected to 0V; it is connected to **nothing** (open circuit).

In this disconnected state, the pin acts like a tiny antenna. 

It picks up stray electromagnetic noise, radio waves, or static electricity from your hands.

This is called a **floating state**, which causes the MOSFET to randomly turn on and off, jitter, or overheat.

How the Pull-Down Resistor Works

By connecting a **10 k$\Omega$ resistor** between the **Gate** and **Ground (0V)**:

* **Switch OFF (Default State):**
* The resistor gently "pulls" any residual charge down into Ground.
* The Gate voltage drops cleanly to **0V**, ensuring the pump stays **completely and reliably OFF**.


* **Switch ON (Active State):**
* +12V connects directly to the Gate.
* Because $10\text{ k}\Omega$ has relatively high resistance, only a tiny, harmless trickle of current flows through it to Ground ($I = \frac{12\text{V}}{10{,}000\,\Omega} = 1.2\text{ mA}$), while the Gate remains at full voltage to keep the MOSFET **completely ON**.

Think of a pull-down resistor like a **return spring on a door**:

* When you push the door open (switch ON), it opens easily.
* As soon as you let go (switch OFF), the spring automatically pulls the door shut to its safe default position so it doesn't flap in the wind.

The rating **0.25W 5%** means **0.25 Watt (1/4 W)** power rating with **5% tolerance** (gold band).


**1. If it is 10 k$\Omega$ (10,000 ohms) — Ideal:**

* Current drawn when switch is closed:

$$I = \frac{12\text{ V}}{10{,}000\ \Omega} = 0.0012\text{ A}\ (1.2\text{ mA})$$


* Power dissipated across the resistor:

$$P = V \times I = 12\text{ V} \times 0.0012\text{ A} = 0.0144\text{ W}\ (14.4\text{ mW})$$


* **Verdict:** $14.4\text{ mW}$ is far below the $250\text{ mW}$ (0.25W) limit. It will stay completely cool and is the exact right choice.


Look at the colored stripes on the resistor body:

* **10 k$\Omega$ (Safe to use):** **Brown – Black – Orange – Gold** (or 5-band: *Brown – Black – Black – Red – Gold*)


{{< /details >}}



{{< details title="GY-273 Magnetometer... 📌" closed="true" >}}

Using the GY-273 sensor with the Raspberry Pi Pico.

**The GY-273 is a magnetometer sensor** that measures the strength and direction of magnetic fields.

It can be used to create a digital compass or to detect the presence of magnetic objects.

**Connections**

The GY-273 is compatible with the **Raspberry Pi Pico's I2C bus**.

To connect the GY-273 to the Pico, you will need to use a four-wire cable. The following table shows the connections:

| **GY-273** | **Raspberry Pi Pico** |
|------------|-----------------------|
| VCC        | 3.3V                  |
| GND        | GND                   |
| SCL        | SCL                   |
| SDA        | SDA                   |

**Overview**

The GY-273 is a digital compass module based on the QMC5883L chip.

It is a **triple-axis magnetometer** that can measure the Earth's magnetic field in three dimensions. 

The GY-273 has a measuring range of ±1.3 to 8 gauss and a resolution of 0.01 gauss.

It is powered by a 3 to 5V supply and communicates using the I2C protocol.

The GY-273 is commonly used in robotics, drones, and other applications that require accurate orientation sensing.

It can also be used in navigation systems, such as GPS receivers.

**Features**

- **Triple-axis magnetometer:** Measures the Earth's magnetic field in three dimensions.
- **Measuring range of ±1.3 to 8 gauss:** Can measure weak to strong magnetic fields.
- **Resolution of 0.01 gauss:** Accurately measures small changes in the magnetic field.
- **Powered by a 3 to 5V supply:** Widely compatible with different power sources.
- **Communicates using the I2C protocol:** Easy to interface with microcontrollers.

If you are looking for a precise and versatile magnetometer sensor, the GY-273 is a good option to consider.

**Applications**

- **Robotics:** Used to determine the orientation of robots, such as self-driving cars and drones.
- **Navigation:** Used in GPS receivers and other navigation systems to determine the position of an object.
- **Avionics:** Used in aircraft to determine the attitude of the aircraft.
- **Marine:** Used in ships and boats to determine the heading of the vessel.
- **Surveying:** Used to measure the magnetic field of the Earth.
- **Geology:** Used to study the magnetic properties of rocks and minerals.


{{< /details >}}

For a basic bench test, the circuit can function without one, but for a reliable, permanent setup, adding capacitors is strongly recommended.

When a DC motor turns on, it draws an instant inrush current (3–5× its running current) and generates high-frequency brush noise. 

This causes voltage dips and electrical spikes that can randomly reset or crash the ESP32.

Where Capacitors Help Most

* **1. Bulk Decoupling Capacitor on the 12V Rail (Highly Recommended)**
* **Value:** $100\,\mu\text{F}\text{ to }470\,\mu\text{F}$ electrolytic (rated for $\ge 25\text{V}$).
* **Placement:** Across the breadboard power rails: positive leg to the **`+12V` Rail**, negative leg (marked with a stripe) to the **`-` (GND) Rail**.
* **Purpose:** Acts as a tiny local energy reserve. When the pump kicks on, it supplies the instant inrush current so the 12V rail voltage doesn't sag.


* **2. Motor Noise Suppression Capacitor (Optional / Best Practice)**
* **Value:** $0.1\,\mu\text{F}$ ($100\text{nF}$) ceramic capacitor (labeled `104`).
* **Placement:** Directly across the pump's `+` and `-` terminals (or between the `+` Rail and Row 21).
* **Purpose:** Absorbs high-frequency EMI/RF sparks created by the motor's internal carbon brushes.

Where You Should NOT Put a Capacitor

* **Do not put a capacitor on the MOSFET Gate (Row 20 to GND).**
* Adding capacitance directly on the gate slows down the switching speed. This forces the MOSFET to spend more time transitioning through its resistive "linear region," causing unnecessary heat.

| Capacitor | Value | Where It Goes | Is It Essential? |
| --- | --- | --- | --- |
| **Bulk Electrolytic** | $100\,\mu\text{F} - 470\,\mu\text{F}$ ($25\text{V}+$) | `+12V` Rail to `GND` Rail | **Recommended** (prevents voltage dips) |
| **Ceramic Snubber** | $0.1\,\mu\text{F}$ (`104`) | Directly across pump `+` and `–` | **Optional** (cleans electrical noise) |
| **Gate Filter** | — | Gate pin to GND | **Do NOT use** |


{{< details title="XL6009E1 DC to DC boost... 📌" closed="true" >}}


Voltage booster converter XL6009E1

Input voltage 3V - 32V
Output voltage 4V - 36V
Current 2A (maximum 4A with heat sink)
frequency 400 KHz
Size 43mm * 21mm * 14mm
Efficiency max 94%


An **XL6009E1** is a monolithic high-performance **DC-to-DC step-up (boost) converter IC** (commonly sold as a pre-assembled adjustable module with a blue potentiometer). 

Its primary function is to take a lower direct-current (DC) voltage and convert it into a higher DC voltage.

Key Specifications

| Parameter | Specification | Notes |
| --- | --- | --- |
| **Input Voltage ($V_{IN}$)** | **3.0 V – 32 V** | Best operating performance starts above 5 V |
| **Output Voltage ($V_{OUT}$)** | **5.0 V – 35 V** | Continuously adjustable via feedback potentiometer |
| **Switching Current Limit** | **4 A** | Peak current through the internal N-MOS switch |
| **Switching Frequency** | **400 kHz** | High frequency allows compact inductor/capacitor size |
| **Max Efficiency** | Up to **94%** | Dependent on the input-to-output voltage ratio and load |
| **Package** | **TO-263-5L** | 5-pin surface-mount package |

How It Works

* **Internal MOSFET Switch:** The XL6009 contains an internal N-channel power MOSFET switching at 400 kHz.
* **Energy Transfer Cycle:**
1. When the switch closes, current flows through an external inductor, storing energy in its magnetic field.
2. When the switch opens, the inductor's magnetic field collapses, forcing current through a Schottky diode into the output capacitor.
3. The inductor’s voltage adds on top of the input voltage, delivering a **higher voltage** at the output.

XL6009 vs. LM2577

The XL6009 was designed as an upgrade to the classic **LM2577** boost regulator:

* **Higher Switching Frequency:** 400 kHz vs. LM2577’s 52 kHz (requires smaller inductors and provides lower output ripple).
* **Higher Peak Current:** 4 A switch rating vs. 3 A on the LM2577.

Practical Considerations

* **Output Must Exceed Input:** Because it is a pure step-up (boost) circuit, $V_{OUT}$ will always remain equal to or greater than $V_{IN}$ minus the diode forward drop—it cannot step voltage down.
* **Continuous vs. Peak Current:** While the internal switch is rated for 4 A peak, sustained continuous load output should generally be kept below **1.5 A – 2.0 A** without active cooling or an additional heatsink.

{{< /details >}}


{{< details title="TRIAC vs MOSFET 📌" closed="true" >}}

They serve a similar purpose—acting as solid-state electronic switches—but they operate on fundamentally different principles and target completely different types of circuits.

A **MOSFET** is primarily a **DC switch**, while a **TRIAC** is specifically an **AC switch**.


| Feature | TRIAC (e.g., BTA41-600B) | Power MOSFET |
| --- | --- | --- |
| **Current Type** | **AC** (Bidirectional) | Primarily **DC** (Unidirectional) |
| **Control Signal** | **Current-driven** (needs a current pulse into the Gate) | **Voltage-driven** (needs gate voltage; draws virtually no steady current) |
| **Turn-Off Behavior** | **Latching:** Once triggered ON, it **stays ON** until AC current naturally crosses zero | **Instant Control:** Turns OFF as soon as Gate voltage is removed |
| **Switching Speed** | **Slow** (optimized for 50/60 Hz mains frequency) | **Fast** (tens to hundreds of kHz, suitable for PWM) |
| **Typical Role** | Mains AC dimmers, AC motor speed, electric heaters | DC-DC converters, motor drivers (H-bridges), high-speed power supplies |

Key Operational Contrast

* **How a MOSFET works:** Think of it like a faucet valve with a spring handle. Apply voltage to the gate, and current flows. Let go of the gate voltage, and it immediately snaps shut.

* **How a TRIAC works:** Think of it like triggering a mousetrap. A brief pulse of current to the gate snaps it open, and it **cannot be turned off from the gate**. It only closes when the external AC power wave passes through zero volts (zero-crossing), which happens twice per AC cycle.

Triac BTA41-600B 40A 600V
Triak BTA41-600B in TO247 housing
Voltage VD-S: 600V
Current ID: 40A
Gate Current: 50mA
Producer: Signetics Thompson


{{< /details >}}



{{< details title="XL6009E1...DC2DC boost 📌" closed="true" >}}

An **XL6009E1** is a monolithic high-performance **DC-to-DC step-up (boost) converter IC** (commonly sold as a pre-assembled adjustable module with a blue potentiometer). 

Its primary function is to take a lower direct-current (DC) voltage and convert it into a higher DC voltage.

Key Specifications

| Parameter | Specification | Notes |
| --- | --- | --- |
| **Input Voltage ($V_{IN}$)** | **3.0 V – 32 V** | Best operating performance starts above 5 V |
| **Output Voltage ($V_{OUT}$)** | **5.0 V – 35 V** | Continuously adjustable via feedback potentiometer |
| **Switching Current Limit** | **4 A** | Peak current through the internal N-MOS switch |
| **Switching Frequency** | **400 kHz** | High frequency allows compact inductor/capacitor size |
| **Max Efficiency** | Up to **94%** | Dependent on the input-to-output voltage ratio and load |
| **Package** | **TO-263-5L** | 5-pin surface-mount package |

How It Works

* **Internal MOSFET Switch:** The XL6009 contains an internal N-channel power MOSFET switching at 400 kHz.
* **Energy Transfer Cycle:**
1. When the switch closes, current flows through an external inductor, storing energy in its magnetic field.
2. When the switch opens, the inductor's magnetic field collapses, forcing current through a Schottky diode into the output capacitor.
3. The inductor’s voltage adds on top of the input voltage, delivering a **higher voltage** at the output.

XL6009 vs. LM2577

The XL6009 was designed as an upgrade to the classic **LM2577** boost regulator:

* **Higher Switching Frequency:** 400 kHz vs. LM2577’s 52 kHz (requires smaller inductors and provides lower output ripple).
* **Higher Peak Current:** 4 A switch rating vs. 3 A on the LM2577.

Practical Considerations

* **Output Must Exceed Input:** Because it is a pure step-up (boost) circuit, $V_{OUT}$ will always remain equal to or greater than $V_{IN}$ minus the diode forward drop—it cannot step voltage down.
* **Continuous vs. Peak Current:** While the internal switch is rated for 4 A peak, sustained continuous load output should generally be kept below **1.5 A – 2.0 A** without active cooling or an additional heatsink.


{{< /details >}}



{{< details title="IRLZ44N MOSFET... 📌" closed="true" >}}

The **IRLZ44N** is an **N-channel Logic-Level Power MOSFET**.

Name: Transistor

Symbol: IRLZ44N

Direction of conduction: N-MOSFET

Transistor type: unipolar

Drain Current: 41A

Power: 83W

Drain voltage-source: 55V

Resistance in conductive state: 22mOhm

Housing: TO220

Assembly: THT through-hole

Semiconductor properties: HEXFET

Producer: INFINEON

Certificates: RoHS

It is designed as a fast-acting electronic DC switch that can be driven directly by the low-voltage GPIO pins of microcontrollers like Arduino, ESP32, and Raspberry Pi.

What Makes It Special: "Logic-Level"

Standard MOSFETs (like the popular **IRF**Z44N) require 10V at the Gate to turn fully ON. 

If you try to control an IRFZ44N with a 3.3V or 5V microcontroller pin, it only partially opens, gets very hot, and limits current.

The **"L"** in **IRLZ44N** stands for **Logic-Level**:

* **Fully Saturates at Low Voltage:** It reaches very low resistance with only **4V to 5V** on the gate (and performs reasonably well down to **3.3V** for light loads).
* **Direct Control:** No dedicated MOSFET gate driver or intermediate transistor is needed between the microcontroller pin and the gate.

Key Specifications

| Parameter | Value | Description |
| --- | --- | --- |
| **$V_{DSS}$** | **55 V** | Maximum Drain-to-Source voltage |
| **$I_D$** | **47 A** | Maximum continuous Drain current (at 25°C case temp) |
| **$R_{DS(on)}$** | **$0.022\ \Omega$ (22 m$\Omega$)** | On-resistance at $V_{GS} = 5.0\text{ V}$ |
| **$R_{DS(on)}$** | **$0.028\ \Omega$ (28 m$\Omega$)** | On-resistance at $V_{GS} = 4.0\text{ V}$ |
| **$V_{GS(th)}$** | **1.0 V – 2.0 V** | Gate threshold voltage (where it *begins* conducting) |
| **Package** | **TO-220** | Standard through-hole package with mounting tab |

Pinout (TO-220, Facing Front Text)

1. **Pin 1 (Left):** **Gate (G)** — Connected to microcontroller GPIO (usually through a small resistor like $220\ \Omega$, with a $10\text{ k}\Omega$ pulldown to ground).
2. **Pin 2 (Center):** **Drain (D)** — Connected to the negative side of the DC load (also connected to the metal tab).
3. **Pin 3 (Right):** **Source (S)** — Connected directly to Ground (GND).

---

Common Applications

* **High-Speed PWM Dimming:** Controlling high-power 12V/24V LED strips without flickering.
* **DC Motor Speed Control:** Pulse-width modulation (PWM) speed switching for DC motors and pumps (with a flyback diode across the motor).
* **Solenoid & Valve Switching:** Driving 12V/24V automotive or pneumatic coils.
* **Power Distribution Switches:** Efficient solid-state power cutoff for battery-powered projects.

{{< /details >}}

> Needed to do an additional [experiment here to make sure the mosfet wont overheat](https://github.com/JAlcocerT/electronics-101/blob/master/watering-plants/power-circuit-2/multimeter-test.md)...


1. First test power-circuit-1 manually

This proves the high-current path is good before adding ESP32 complexity.

Measure:

Vgs OFF
Vgs ON
Vds while pump runs
Bluetti power
MOSFET temperature

In this setup you expect:

Vgs ON ≈ 12 V
Vds very low
MOSFET cool

If this fails, the issue is wiring, MOSFET orientation, diode placement, pump path, or power path. Fix that before adding ESP32.

2. Then test power-circuit-2 with ESP32

This checks the new question: is 3.3 V gate drive enough?

In this setup you expect:

Vgs ON ≈ 3.3 V
Vds still low
MOSFET still cool

The comparison is the whole point:

manual 12 V gate: Vds = ?
ESP32 3.3 V gate: Vds = ?

If Vds is low in both, your MOSFET is fine with ESP32. If Vds is low at 12 V but high at 3.3 V, the MOSFET needs stronger gate drive or replacement.

I cannot generate images directly with an image model in this text-based mode, but I can provide detailed visual descriptions or a structured diagram showing the transfer and output curves for an N-channel logic-level MOSFET like the IRLZ44N.

---

### MOSFET Output Characteristics ($I_D\text{ vs. }V_{DS}$)

```text
 Drain Current (Id)
    ▲
    │                                              Vgs = 10.0V - 12.0V
    │                                            .───────────────────────────
    │                                           /   Deep Ohmic (Rds ≈ 0.024 Ω)
    │                                          /    Vds drop: ~0.04V
    │                                         /
    │                                        /     Vgs = 5.0V
    │                                       /    .───────────────────────────
    │                                      /    /
 1.6A ┼───────────────────────────────────/────/──── Vgs = 3.3V (ESP32)
(Pump)│                                  /    /   .──────────────────────────
    │                                 /    /   /
 0.8A ┼───────────────────────────────/────/───/────
(Dry) │                              /    /   /
    │                             /    /   /       Vgs = 2.0V - 2.5V (Knee)
    │                            /    /   /      .───────────────────────────
    │                           /    /   /      /   Pinch-off / Linear Mode
    │                          /    /   /      /    Vds drop: ~3.0V - 4.0V
    │                         /    /   /      /     Heavy heat dissipation!
    │                        /    /   /      /
  0 ┼───────────────────────┴────┴───┴──────┴────────────────────────────────►
    0                    0.05V  0.10V 0.15V 0.5V        3.0V             Vds
                         ▲
                         │
             TRIODE / OHMIC REGION                 ACTIVE / SATURATION REGION
       (Channel Wide Open - Low Loss)          (Channel Pinched - High Loss/Heat)

```
Breakdown of the Graph Elements

1. **The X-Axis ($V_{DS}$ — Drain-to-Source Voltage Drop):**
* Represents the voltage "stuck" across the MOSFET switch rather than reaching the load.
* **Target:** As close to $0.0\text{ V}$ as possible.


2. **The Y-Axis ($I_D$ — Drain Current):**
* Represents the motor's operating current ($0.8\text{ A}$ free-running / dry, up to $\approx 1.6\text{ A}$ pumping water under full load).


3. **The Family of Curves ($V_{GS}$ Lines):**
* **$12.0\text{ V}$ Line:** The curve has a very steep initial slope ($\frac{1}{R_{DS(on)}}$). At $1.6\text{ A}$, the voltage drop across the transistor ($V_{DS}$) is only about **$0.04\text{ V}$**.
* **$3.3\text{ V}$ Line (ESP32):** The slope is slightly shallower, but for an IRLZ44N at $1.6\text{ A}$, it still easily intersects within the steep Ohmic region, dropping only around **$0.07\text{ V} - 0.12\text{ V}$**.
* **$2.0\text{ V}$ Line (Underdriven):** The curve flattens out early at a low current ceiling. At $1.6\text{ A}$, the operating point shifts far to the right into the saturation region, causing a large $V_{DS}$ drop of **$3\text{ V} - 4\text{ V}$** and dissipating heavy heat.

**Safe Operating Area (SOA) Check for $1.6\text{ A}$ Load**

* **At $V_{GS} = 12\text{ V}$:** $P_{\text{heat}} = 0.04\text{ V} \times 1.6\text{ A} \approx 0.064\text{ W}$ (Virtually cold)
* **At $V_{GS} = 3.3\text{ V}$:** $P_{\text{heat}} = 0.10\text{ V} \times 1.6\text{ A} \approx 0.16\text{ W}$ (Slightly warm, well within safe limits without a heatsink)
* **At $V_{GS} = 2.0\text{ V}$:** $P_{\text{heat}} = 3.5\text{ V} \times 1.6\text{ A} \approx 5.6\text{ W}$ (Overheats rapidly without cooling)

{{< details title="The 1N4007 diode to prevent kickback... 📌" closed="true" >}}

The **1N4007** is a standard silicon **rectifier diode** that acts as a one-way electrical valve, **allowing current to flow in only one direction** (from Anode to Cathode) while blocking reverse flow.

In microcontroller and motor circuits, its primary role is as a **flyback (snubber/freewheeling) diode** to protect transistors from destructive inductive voltage spikes.

Key Specifications

| Parameter | Value | Description |
| --- | --- | --- |
| **$V_{RRM}$ (Peak Reverse Voltage)** | **1000 V** | Maximum reverse voltage it can safely block without breakdown |
| **$I_{F(AV)}$ (Forward Current)** | **1.0 A** | Maximum continuous forward DC current |
| **$I_{FSM}$ (Peak Surge Current)** | **30 A** | Non-repetitive forward surge (8.3 ms half sine wave) |
| **$V_F$ (Forward Voltage Drop)** | **~0.7 V – 1.0 V** | Typical voltage dropped across the diode when conducting |
| **Package** | **DO-41** | Standard axial-lead cylinder |
| **Polarity Indicator** | **Silver band** | Marks the **Cathode (–)** lead |

The 1N400x Series Comparison

The 1N4001 through 1N4007 family share the exact same 1 A current rating; they differ only in maximum reverse breakdown voltage ($V_{RRM}$):

* **1N4001:** 50 V
* **1N4004:** 400 V
* **1N4007:** **1000 V** (the most versatile, making it the universal choice for both low-voltage DC protection and AC mains rectification)

Core Applications

* **Flyback / Snubber Diode (Motor & Solenoid Protection):** When an inductive load (like a water pump, relay coil, or DC motor) turns off, its collapsing magnetic field generates a massive reverse voltage spike ($V = -L \cdot \frac{di}{dt}$) that can reach several hundred volts. Placed in reverse-parallel across the motor terminals, the 1N4007 clamps this voltage and dissipates the stored magnetic energy safely.

* **Reverse Polarity Protection:** Wired in series with a power input to prevent reverse battery connection from damaging sensitive electronics.

* **Mains AC Rectification:** Used in half-wave or full-wave bridge rectifiers (converting 50/60 Hz AC into pulsed DC).

Wiring Orientation for Flyback Protection

* **Cathode (Silver Band end):** Connects to **DC Positive (+12V / Power Rail)**.
* **Anode (Plain Black end):** Connects to the **MOSFET Drain / Motor Negative terminal**.

*(During normal operation the diode does not conduct. When the MOSFET cuts power, the reverse inductive kick forward-biases the diode, recirculating the current harmlessly back into the pump coil until it dissipates).*


**1N400x Series (Standard Silicon Diodes — 1 A, ~0.7 V–1.0 V Drop, Slow Switching, General Rectification & DC Flyback)**

* **1N4001:** Standard 1 A silicon diode rated for up to **50 V** reverse voltage.
* **1N4002:** Standard 1 A silicon diode rated for up to **100 V** reverse voltage.
* **1N4003:** Standard 1 A silicon diode rated for up to **200 V** reverse voltage.
* **1N4004:** Standard 1 A silicon diode rated for up to **400 V** reverse voltage.
* **1N4005:** Standard 1 A silicon diode rated for up to **600 V** reverse voltage.
* **1N4006:** Standard 1 A silicon diode rated for up to **800 V** reverse voltage.
* **1N4007:** Standard 1 A silicon diode rated for up to **1000 V** reverse voltage (the universal standard for high-voltage and mains AC applications).

**1N581x Series (Schottky Barrier Diodes — 1 A, Ultra-Low ~0.3 V–0.45 V Drop, High-Speed Switching, Ideal for High-Frequency DC-DC Converters & High-Efficiency Low-Voltage Circuits)**

* **1N5817:** Ultra-fast 1 A Schottky diode with the lowest forward drop (~0.45 V max at 1 A) and a **20 V** reverse voltage limit.
* **1N5818:** Ultra-fast 1 A Schottky diode balancing a low forward drop (~0.55 V max at 1 A) with a **30 V** reverse voltage limit.
* **1N5819:** Ultra-fast 1 A Schottky diode with a low forward drop (~0.60 V max at 1 A) and a **40 V** reverse voltage limit (the most widely used Schottky for 5 V–24 V DC-DC boost/buck converters and high-speed PWM snubbers).

These are **faster to switch**, but they **block far less reverse voltage** than standard silicon diodes.

Schottky diodes differ from standard 1N400x diodes in three fundamental ways:

* **Zero Reverse Recovery Time ($t_{rr} \approx 0\text{ ns}$):** Standard silicon diodes (1N400x) take several microseconds to stop conducting when polarity reverses because they must clear stored minority charge carriers. Schottky diodes use a metal-semiconductor junction (majority carriers only), making them turn off virtually instantaneously. This makes them essential for high-speed PWM motor control and DC-DC converters switching at hundreds of kilohertz (like the XL6009).
* **Lower Forward Voltage Drop ($V_F \approx 0.3\text{ V} - 0.45\text{ V}$):** They waste less than half the power of a silicon diode (~0.7 V – 1.0 V drop) when forward-biased, which means less heat and higher efficiency in battery-powered setups.
* **Lower Reverse Voltage Rating ($V_R$):** The trade-off is voltage blocking capability. A Schottky like the 1N5819 will break down and short at just **40 V**, whereas a standard 1N4007 easily withstands **1000 V**.

That behavior is completely normal.

A water pump motor does mechanical work by moving the mass of the fluid. 

When running dry (without water), the impeller only spins against the light resistance of air.

Without the heavy fluid load, the motor draws significantly less current—in your case, **~10 W (~0.83 A at 12 V)**.

Once you submerge the pump or prime it with water and it starts pushing liquid against gravity and tubing friction (head pressure), it will load up to its rated **19 W (~1.58 A at 12 V)**.

What this means for your circuit design:

* **Operating Current ($I = \frac{P}{V}$):**
* **Dry / No-load:** $\frac{10\text{ W}}{12\text{ V}} \approx \mathbf{0.83\text{ A}}$
* **Full pumping load:** $\frac{19\text{ W}}{12\text{ V}} \approx \mathbf{1.58\text{ A}}$
* **Stall / Inrush Current:** When the motor starts up or if the impeller jams, current can spike to **$3\text{ A} - 5\text{ A}$** for a fraction of a second.

Component checks for your components:

1. **Flyback Diode (1N4007 vs 1N5819):**

* Both are rated for **1 A continuous**, but they can easily handle short pulse surges (**30 A** peak for 1N4007, **25 A** for 1N5819).
* Since the flyback diode only conducts for brief microsecond bursts when the MOSFET turns off, a single **1N4007** (for simple On/Off) or **1N5819** (for PWM speed control) is perfectly safe.

2. **IRLZ44N MOSFET:**
* Rated for **47 A** with an on-resistance of only $0.022\ \Omega$.
* Power dissipation at full load: $P = I^2 \cdot R = (1.58\text{ A})^2 \times 0.022\ \Omega \approx \mathbf{0.055\text{ W}}$ (55 mW).
* It will stay completely cold and **does not need a heatsink**.

3. **Pump Longevity:**
* Avoid running the pump dry for extended periods during testing; many submersible pumps rely on the water flow for lubrication and internal cooling.

{{< /details >}}


{{< details title="AI Asisted Web Search... 📌" closed="true" >}}

{{< /details >}}

---

## Conclusions

This project is the proof of concept showing the basic and foundational building blocks of electronics and embedded systems: **MCU logic (ESP32)**, **power switching (Logic-Level N-MOSFET)**, and **transient load protection (flyback diode, decoupling capacitor, pull-down/gate resistors)**.

{{< callout type="info" >}}
With all the final goodies here
{{< /callout >}}


Too much to digest?

Go ask chatgpt

Or...get real results with a higher time ROI:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Bring AI to your workflow" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}


### Other similar projects


Tier 1: Natural Extensions of Your Current Setup

* **Automated Soil-Moisture Plant Watering System**
* **Concept:** Add a capacitive soil moisture sensor to read analog values. When the soil drops below a calibrated threshold, run the 12V pump for 3 seconds.
* **New Skill:** Analog reading (`analogRead()`), calibration curves, and conditional logic.


* **Variable Speed Fan / Motor Controller (PWM)**
* **Concept:** Use the ESP32’s hardware PWM (`ledcWrite`) to smoothly control the speed of a 12V fan or pump instead of basic ON/OFF switching.
* **New Skill:** Pulse Width Modulation, understanding switching frequency effects on inductive loads.


* **12V Dimmable LED Strip Controller**
* **Concept:** Replace the pump with a 12V analog LED strip (single color or 3 MOSFETs for RGB).
* **New Skill:** Smooth fading effects, driving purely resistive high-current loads without back-EMF.


Tier 2: IoT & Remote Control

* **Home Assistant / ESPHome Smart Valve**
* **Concept:** Flash ESPHome onto the ESP32 and integrate your 12V pump or a 12V solenoid valve directly into Home Assistant via Wi-Fi.
* **New Skill:** No-code IoT firmware, MQTT/API communication, remote scheduling.


* **Wi-Fi / Web Dashboard Water Doser**
* **Concept:** Host a lightweight web server directly on the ESP32 (`WebServer.h`) to display system status and trigger watering bursts from your phone's browser.
* **New Skill:** Asynchronous web servers, handling HTTP POST requests.


Tier 3: Adding High-Power Actuators

* **12V Solenoid Door Lock / Pet Feeder**
* **Concept:** Use the exact same MOSFET circuit to drive a high-force 12V pull-type solenoid or linear actuator for automated locking or feeding mechanisms.
* **New Skill:** Fast-acting inductive actuation.


* **Bidirectional Motor Control (H-Bridge)**
* **Concept:** Expand from a single MOSFET (unidirectional) to an H-Bridge driver (like the L298N or DRV8833) to drive a DC motor forward and reverse for motorized blinds or robotics.
* **New Skill:** Directional switching logic and high-side/low-side driver pairs.


| Project | Hardware Added | Key Concept Learned | Difficulty |
| --- | --- | --- | --- |
| **Plant Watering** | Capacitive Moisture Sensor | Analog inputs & calibration | Beginner |
| **PWM Speed Control** | None (same circuit) | Hardware PWM / duty cycles | Beginner |
| **IoT Web Doser** | None (same circuit) | Wi-Fi / Web server on ESP32 | Intermediate |
| **12V Solenoid Lock** | 12V Push-Pull Solenoid | High-force pulse actuation | Beginner |
| **Motorized Blinds** | H-Bridge module + Geared Motor | Bidirectional current control | Intermediate |

#### PC Fans



**PC fans are ideal for testing PWM.**

In fact, they give you [two different ways](https://github.com/JAlcocerT/poc/tree/main/iot-esp32-motors) to run the test depending on which fan you choose.

{{< callout type="info" >}}
To avoid having more posts, I made [the setups directly here](https://github.com/JAlcocerT/poc/tree/main/iot-esp32-motors)
{{< /callout >}}

| Fan Type | Wire Colors (Typical) | Pin Functions |
| --- | --- | --- |
| **3-Pin Fan** | Black, Red, Yellow | 1: GND, 2: +12V, 3: Tachometer (RPM speed sensor) |
| **4-Pin Fan** | Black, Yellow, Green, Blue | 1: GND, 2: +12V, 3: Tachometer, 4: Native PWM Control |

Option A: Using the 3-Pin Fan (Uses Your Exact Existing MOSFET Circuit)

A 3-pin fan is controlled by **chopping the ground line via your MOSFET**, exactly like your water pump:

* **Wiring:**
* **Fan Red (+12V):** Connects to breadboard **`+` Rail (Red)**.
* **Fan Black (GND):** Connects to **Row 21 (MOSFET Drain)**.
* **Fan Yellow (Tach):** Leave disconnected for now.
* *Keep your 1N4007 flyback diode in place across `+` and Row 21.*

* **How it works:** The ESP32 sends a PWM signal to the MOSFET gate, pulsing power to the fan motor to change its speed.

Option B: Using the 4-Pin Fan (Direct ESP32 Control — No MOSFET Needed)

4-pin fans have an internal MOSFET and driver chip built right into the fan hub:

* **Wiring:**
* **Fan Yellow/Red (+12V):** Directly to **+12V Rail**.
* **Fan Black (GND):** Directly to **`-` (GND) Rail**.
* **Fan Blue (PWM Pin):** Directly to **ESP32 GPIO 23** (via a $220\,\Omega$ resistor for protection).
* **Fan Green (Tach):** Leave disconnected.

* **How it works:** The fan receives constant 12V power, and the ESP32 speaks directly to the fan’s internal logic using a standard $25\text{ kHz}$ PWM signal.


* If your goal is to **learn how your IRLZ44N MOSFET behaves with PWM**, use the **3-pin fan** (or just the $+12\text{V}$ and $\text{GND}$ wires of the 4-pin fan connected to Row 21).
* If your goal is the **quietest and most standard PC fan control**, use the **4-pin fan's blue wire**.

---

## FAQ


### Tomato Evolution

After ~10 weeks:

{{< youtube sCrMm5sLG-w >}}

<!-- 
https://youtube.com/shorts/sCrMm5sLG-w 
-->

The melisa and mieta pieprzowa didnt make it though.

And some time later, the mieta polej and mint also died  *most likely Spider Mites (przędziorki)*

3 months later:

{{< youtube "_YBjNO8urfE" >}}

Tomatoes continued, and after week ~13:

{{< youtube sCrMm5sLG-w >}}

I got a couple of harvests:

{{< youtube "sCrMm5sLG-w" >}}

Probably a 3rd one is coming:

{{< youtube "-0UkzDSMusI" >}}


{{< callout type="info" >}}
[The yield](https://youtube.com/shorts/cDfu-i_XnIE) so far ~1kg tomatoes out of xyz plants and xyz kg of soil and ~ L of water
{{< /callout >}}

You can buy that kg for xyz $ in the market, so for next season there is definitely room for improvements!

#### A Watering System for next seson

Some [people](https://indystry.cc/diy-solar-powered-garden-watering-system/) have [nice watering systems](https://www.youtube.com/watch?v=s-xkdfNeIVw).

{{< youtube "s-xkdfNeIVw" >}}

<!-- 
https://www.youtube.com/watch?v=s-xkdfNeIVw 
-->


Tomatoe one timer?

1. Get them as much sun as possible
2. Get them water in the early morning
3. Get them space for the roots: *~20L for 1 plant worked well for me*

### Tomatoes Prep for Next Year

What would I do different next year?




### Interesting yt channels

1. https://www.youtube.com/@FarmCraft101/videos
2. https://www.youtube.com/@kirstendirksen/videos


### Geo Matters

Ive recaped recently how cool is [geo analytics](https://jalcocert.github.io/JAlcocerT/geo-data-analytics/):

```sh
cd ./poc/building-geo-osm-blender
make osm2world-obj
```

How does it relate for this crop intelligence project?

Well, how about **simulating in advance**: sun hours, orientations, expected energy, rainny days...?

```sh
sudo apt update
sudo apt install openjdk-17-jre unzip wget                                                                                                                                                    
  mkdir -p ~/tools/osm2world                                                                    
  cd ~/tools/osm2world                                                                                                                                                                       
wget https://osm2world.org/download/files/latest/OSM2World-latest-bin.zip
  unzip OSM2World-latest-bin.zip
                                                                           
#Then from this repo:
make osm2world-obj OSM2WORLD=~/tools/osm2world/osm2world   
```


#### Pump BLDC with 2 wires but not 3 like an FPV

If your brushless DC (BLDC) pump has only **2 wires** (typically positive and ground) instead of 3, the Electronic Speed Controller (ESC) or commutation drive circuitry is integrated directly inside the pump housing.

Key Differences: 2-Wire BLDC Pump vs. 3-Wire FPV Motor

| Feature | 2-Wire BLDC Pump | 3-Wire FPV Drone Motor |
| --- | --- | --- |
| **Driver Location** | **Internal** (built into the pump's sealed base) | **External** (separate 4-in-1 or individual ESC) |
| **Input Power** | Pure **DC Voltage** (e.g., 12V or 24V) | **3-Phase AC/Pulsed DC** generated by the external ESC |
| **Commutation** | Handled internally by a small microcontroller or Hall-effect driver IC | Commutated externally via Back-EMF sensing (sensorless BLDC) |
| **Control** | Fixed speed upon power connection (or variable by varying DC voltage) | Variable high-speed throttle control via digital protocols (DShot, PWM) |
| **Target Application** | Continuous, single-direction liquid flow | Dynamic, high-torque directional and rotational speed changes |

How the 2-Wire BLDC Pump Operates Internally

A brushless motor cannot run directly on continuous DC power without electronic phase switching. 

Inside the sealed enclosure of your 19W pump:

* **Integrated PCB:** A miniature circuit board receives the incoming DC power.
* **Driver IC / Hall Sensor:** A micro-driver detects the rotor’s magnetic position and electronically switches the internal stator coils (Phases U, V, W) in sequence.
* **Hermetic Sealing:** The electronics and stator windings are potted in epoxy resin to isolate them from moisture, allowing the wet rotor/impeller to spin maintenance-free.

Powering It Safely

* **Connect Direct to DC:** Connect the wires directly to a rated DC power supply (e.g., 12V DC matching the pump's label).
* **Observe Polarity:** Unlike a raw 3-phase motor (where swapping two wires simply reverses spin direction), connecting a 2-wire BLDC pump in reverse polarity can destroy the internal drive circuit unless it features built-in reverse-polarity protection.


### Offer Configuration

This project has been **just for pleasure**.

* Whats Working:
* Whats not:
* Whats next:

So all below is not applicable.

*For now :)*

---

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/bip/" title="BiP | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers/" title="Offers | Docs ↗" icon="book-open" >}}
{{< /cards >}}



{{% details title="The **launch strategy**: *aka, focus strategy* 🚀" closed="true" %}}

| Element | Decision |
| :--- | :--- |
| **One Avatar** | |
| **One Product** | |
| **One Channel** | |

The **Tier of Service**: DIY (1b - *leverages on actual tech stack Ive put together - PaaS x (WP/Ghost or SSG+CMS)*)

The **Tech Stack**:

| Requirement | Specification | Clarification / Decision |
| :--- | :--- | :--- |
| **Frontend Framework** | Astro | |
| **Styling/UI Library** | Sassify MIT like theme | |
| **[Backend](https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/)** | | |
| **Database** | FireStore | |
| **[Authentication](https://jalcocert.github.io/JAlcocerT/docs/dev/authentication/)** | Firebase Auth | |
| **E-mail/ESP** | MailTrap | |
| **Analytics** | Posthog | |
| **Hosting** | Container | |

{{% /details %}}
