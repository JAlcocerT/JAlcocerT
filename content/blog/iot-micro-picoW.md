---
title: "Raspberry Pi Pico W"
date: 2025-08-15T13:20:21+01:00
draft: false
tags: ["Self-Hosting","IoT","Embedded Systems"]
description: 'Using the Pico W [Microcontrollers]'
url: 'pico-w'
---

**TL;DR**

**Intro**

Two years ago I was tinkering with microcontrollers.

But still I have not put together all my learnings in a *proper way*.

Actually... in any way :)

So lets get the [PicoW](#raspberry-pi-pico-w) part sorted out.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/categories/iot-data-analytics/" title="RPi Related Blog" image="https://jalcocert.github.io/RPi/img/RPi4-DHT22.png" subtitle="Jekyll Blog with posts about IoT" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW" title="RPi (PicoW Scripts) Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="PicoW Scripts Python Scripts to tinker!" >}}
{{< /cards >}}


We will see:

1. How to [connect the PicoW](#piw-101)
2. Using the [IDE](#ide-for-picow)

## Raspberry Pi Pico W

Ideas for Readme's - https://github.com/STJRush/handycode/tree/master/Raspi%20Pico

* The chip: RP2040 and you can get the pinout and schematics as per https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html#pico-1-family
* The schema: <https://docs.micropython.org/en/latest/rp2/quickref.html>

> The W version (brings wifi), see the [official docs](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html#raspberry-pi-pico-w-and-pico-wh)


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW" title="PicoW Micropython Scripts 🐍 ↗" >}}
{{< /cards >}}


### PiW 101

You can get familiar via this post with the picoW: https://picockpit.com/raspberry-pi/everything-about-the-raspberry-pi-pico/

We are going to see **few working examples**:

1. Playing with the [Led](#using-the-built-in-led)
2. Connect the [PicoW to Wifi](#connecting-the-pico-to-wifi)
3. Reading the [internal temp sensor](#reading-internal-temp-sensor)
4. Reading an external temp sensor - [MLX90614](#pico-w-with-mlx90614) 
5. [MQTT and the PicoW](#pico-and-mqtt)

But basically, you will want to connect it to your laptop:

```sh
ls /dev/tty*

sudo apt-get update
sudo apt-get install screen

screen /dev/ttyACM0
```

Confirm that the device is plugged:

```sh
ls -l /dev/ttyACM0
```

Connect to the PicoW:

```sh
ls -l /dev/serial/by-id; ls -l /dev/ttyACM* 2>/dev/null

newgrp dialout
mpremote connect /dev/ttyACM0 repl
```

You can connect to your **PiW console logs**:

```sh
sudo apt install picocom
picocom -b 115200 /dev/ttyACM0
# picocom v3.1

# port is        : /dev/ttyACM0
# flowcontrol    : none
# baudrate is    : 115200
# parity is      : none
# databits are   : 8
# stopbits are   : 1
# escape is      : C-a
# local echo is  : no
# noinit is      : no
# noreset is     : no
# hangup is      : no
# nolock is      : no
# send_cmd is    : sz -vv
# receive_cmd is : rz -vv -E
# imap is        : 
# omap is        : 
# emap is        : crcrlf,delbs,
# logfile is     : none
# initstring     : none
# exit_after is  : not set
# exit is        : no
```


Then just:

```sh
picocom -b 115200 /dev/ttyACM0
```

If you press `ctrl+c` twice, you will access te python terminl inside the picow

```sh
MicroPython v1.20.0 on 2023-04-26; Raspberry Pi Pico W with RP2040
Type "help()" for more information.
>>>  #the program will stop executing in loop while u are here
```

#### IDE for PicoW

This repository: https://github.com/ajgquional/rpi-picow-micropython

Is great to get your started!

You can try with Thony or ArduinoIDE (I prefer the latter)

```sh
#sudo apt-get install -y thonny
flatpak install flathub cc.arduino.IDE2
```

When installin arduinoIDE:

![alt text](/blog_img/iot/picoW/arduinoIDE-install.png)

You will see a message like: The "Arduino Mbed OS RP2040 Boards [v 4.4.1]" core has to be installed for the currently selected "Raspberry Pi Pico" board.

Do you want to install it now?

![alt text](/blog_img/iot/picoW/arduinoIDE-install2.png)

> I said yes!

<!-- https://www.youtube.com/watch?v=RQRQvjIBbUo -->

{{< youtube "RQRQvjIBbUo" >}}

You will also have to:

* Go to preferences -> settings and add the json as per: https://github.com/earlephilhower/arduino-pico?tab=readme-ov-file#installation
* Then go to Tools -> Board -> Boards Manager and look on the left for pi pico/Rp2040


![alt text](/blog_img/iot/picoW/arduinoIDE-install3.png)


![alt text](/blog_img/iot/picoW/arduinoIDE-install4.png)

Then the PicoW will be visible at arduinoIDE:

![alt text](/blog_img/iot/picoW/arduinoIDE-install5-picow.png)


For **Thonny** installation:

![alt text](/blog_img/iot/picoW/thonny-install.png)

> On Windows it was quite simple and the portable Thonny worked

You will need to do `sudo usermod -aG dialout $USER` so that Thonny wont have permissions

![Thonny Permission Error](/blog_img/iot/picoW/thonny-connection-picow-error.png)

> > You will have to restart ubuntu so that `id -nG | grep dialout` will provide output and Thonny's error will be gone!

You could also check the serial access to the PicoW via:

```sh
screen /dev/ttyACM0 115200 #this will show the prints of your picoW scripts
```

Go to Thonny -> View -> Select Files: Then, go to the bottom right and select your PicoW

![alt text](/blog_img/iot/picoW/thonny-windows.png)

Now you will be able to see your old scripts *if any* inside your picoW:

![alt text](/blog_img/iot/picoW/thonny-windows2.png)

Also, VSCode + extensions can work for your IoT projects:

```sh
flatpak install flathub com.visualstudio.code
#ext install ms-vscode.vscode-serial-monitor
code --install-extension ms-vscode.vscode-serial-monitor
```

![VSCode Serial Monitor Extension](/blog_img/iot/picoW/vscode-serialmonitor.png)

{{< callout type="info" >}}
Thonny+W11 was the best combo for me
{{< /callout >}}

### PicoW and MicroPython

The PicoW supports few [languages](#faq).

But if you are confortable with Python, just stick to this one: **MicroPython**

![alt text](/blog_img/iot/picoW/micropython-101.png)

Thanks to [core-electronics](https://core-electronics.com.au/guides/raspberry-pi-pico-w-connect-to-the-internet/)

I was using Windows11 to make this one time setup:

1. Hold the `BOOTSEL` button on the Pico W
2. Connect the Pico W to your computer via the USB cable
3. Release the BOOTSEL button -> you will see a new device in the PC.
4. Download this and move it to the Pico folder: <https://github.com/micropython/micropython/releases>


<!-- https://www.youtube.com/watch?v=YpM2snyu12k -->

{{< youtube "YpM2snyu12k" >}}


* Mip: <https://github.com/micropython/micropython-lib>
    * Installing from fork: https://micropython.org/download/rp2-pico-w/rp2-pico-w-latest.uf2

```py    
import mip
mip.install(PACKAGE_NAME, index="https://USERNAME.github.io/micropython-lib/mip/BRANCH_NAME")
```

> Unplug usb and plug

To install libraries, i have observed that recently **upip has been depricated in favour of mip**

You can see whats the micropython code running inside your picoW by:

```sh
#stop anything reading
#screen -ls
kill -9 9096
mpremote connect /dev/ttyACM0 fs ls
```


#### Using the Built in Led

The **led is the pin 25** as per the PicoW schema.

1. Run -> Configure Interpreter -> Interpreter -> MicroPython (Raspberry Pi Pico)

2. View -> files

> The Pico will look for a **main.py** to execute in loop

3. View -> plotter

Press `CTRL+D` for soft reboot and load the new program!

{{< youtube "_ouzuI_ZPLs" >}}
<!-- 
<https://www.youtube.com/watch?v=_ouzuI_ZPLs> -->

#### Reading internal temp sensor

Required library: https://pypi.org/project/machine/

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/InternalSensor" title="PicoW + Wifi Connection 🐍 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/InternalTempSensor" title="PicoW + Wifi Connection 🐍 ↗" >}}  
{{< /cards >}}

{{< youtube "PYOaO1yW0rY" >}}

#### Connecting the Pico to Wifi

Thanks to the video:

<!-- <https://www.youtube.com/watch?v=GiT3MzRzG48> -->

{{< youtube "GiT3MzRzG48" >}}


> Name the file different than `main.py` to avoid the automatic execution.

You can connect your picoW to Wifi and blik the led while attempting to do so with [this script](https://github.com/JAlcocerT/RPi/blob/main/Z_MicroControllers/RPiPicoW/ConnectToWIFI/boot.py).

Even reading html webcontent, with [this other script](https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/ConnectWifi_ReadWeb).

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/ConnectToWIFI" title="PicoW + Wifi Connection 🐍 ↗" >}}
{{< /cards >}}

#### Pico W with MLX90614

Connect the sensor properly as per:

GND is pin38
3v3 out is pin 36

11 (GP8) is I2C0 SDA
12 (GP9) is I2C0 SCL

<https://www.youtube.com/watch?v=FsdSkhdfOqY&t=24s> 

And they are giving their own library: <https://github.com/embeddedclub/micropython>

We need to install: <https://github.com/mcauser/micropython-mlx90614>

> It is not available in mip, the new package manager

So cloned the repo and copied into `/lib/mlx/mlx90614.py`

> I did not compiled the `.py` file of the repo into `.mpy` 

In this way, we can import with 

```py
from mlx.mlx90614 import MLX90614 #(we import the class)
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/RPiPicoW/MLX90614" title="PicoW + MLX906014 🐍 ↗" >}}
{{< /cards >}}



## PicoW and MQTT

The Message Queue Telemetry Transport!

I was writing on the [Pi Blog a post about MQTT](https://jalcocert.github.io/RPi/posts/rpi-mqtt/).

But its the time to play with MQTT and the PicoW.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/emqx" title="EMQX Docker Config 🐋 ↗" >}}
{{< /cards >}}

The MQTT Architecture operates on a **client-server** model, and the core of MQTT communication revolves around two main components:

* **MQTT Broker (Server):** This is the central hub of the system. It's a server that receives all messages from clients, filters them by topic, and then distributes them to other clients who have subscribed to those specific topics. 

> A Pi 4 or an ASRock DeskMini X300 acting as a homelab, running an MQTT server like [EMQX](https://github.com/JAlcocerT/Home-Lab/tree/main/emqx), fills this role. 

* **MQTT Client:** These are the devices that connect to the broker to either **publish** messages (send data) or **subscribe** to topics (receive data). Your Raspberry Pi Pico W, configured to read sensor data and send it to the broker, is the perfect example of an MQTT client.

 It will publish its sensor readings to a specific topic on the server. Other devices, which are also clients, can then subscribe to that same topic to receive the data.

This separation of roles is what makes MQTT so efficient and scalable for IoT applications. 

> The clients don't need to know anything about each other; they only need to know how to connect to the central broker. 

{{% details title="The RPI and mqttx/mosquitto 🌍" closed="true" %}}

If you want to bring the *bigger* Pi4 to the MQTT game:

<https://mqttx.app/>
<https://github.com/emqx/MQTTX>

```sh
sudo apt install -y mosquitto
sudo apt install -y mosquitto-clients

#sudo apt install python3-pip
sudo pip3 install paho-mqtt

sudo systemctl status mosquitto.service
```

> In the absence of a direct configuration entry for the port, the port used by Mosquitto could be the default port (1883 for MQTT or 8883 for MQTT over TLS/SSL).

You can check which one is in used with: 

```sh
netstat -tuln
```

<https://www.youtube.com/watch?v=GQOqvvei5Do> #also hivemq

{{% /details %}}

Without hivemq, just using this GREAT VIDEO: explaining the `umqtt.simple` library!

<!-- https://www.youtube.com/watch?v=THUGLRGuOU8 -->

{{< youtube "THUGLRGuOU8" >}}

> **To be used mqttx and emqx**

* https://www.donskytech.com/umqtt-simple-micropython-tutorial/

### PicoW to EMQX Server

Having your EMQX ready and accessing its UI at `192.168.1.11:18083`

![alt text](/blog_img/iot/picoW/emqx-login.png)

> Login via admin/public and you will be prompted to change the pass


{{% details title="Create a topic via EMQX so that the PicoW will push data 🌍" closed="true" %}}

Yes, you can temporarily allow anonymous clients to publish to a topic. However, this is **not recommended for a production environment** as it creates a significant security vulnerability. Anyone who can reach your server can then publish data to that topic.

This is primarily useful for initial testing and quick development to confirm that your Pico W's code and network configuration are correct.

Here's how to do it in EMQX:

1. Enable Anonymous Authentication
By default, EMQX allows anonymous access. However, if you've previously configured a password-based authentication, you may have disabled it. You can check this in the EMQX dashboard.

1.  Navigate to **Access Control -> Authentication**.
2.  If you see an "anonymous" entry, ensure it is enabled.
3.  If it's not present or disabled, you may need to add or enable it, but in most default setups, it's already there.

 2. Configure Anonymous Authorization
This is the most critical step. You need to create an Access Control List (ACL) rule that explicitly allows unauthenticated (anonymous) users to publish to your desired topic.

1.  Navigate to **Access Control -> Authorization**.
2.  Add a new rule.
3.  Set the **Type** to `All Users`.
4.  Enter the **Topic Filter** (e.g., `house/living_room/sensor_data`).
5.  Set the **Action** to `Publish`.
6.  Set the **Permission** to `Allow`.
7.  Save the rule.

This rule will apply to any client that connects without a username and password. Now, your Pico W can connect to the broker using its IP address and port without needing to provide any credentials.

**Again, please remember to set up proper authentication and authorization with specific users and passwords before you deploy your project for real-world use.**

You don't need to manually create a topic in EMQX.

Topics are created automatically the first time a client **publishes** a message to them. You just need to specify the topic name in your Pico W's code.

How it Works

The MQTT broker operates on a publish-subscribe model. When a client (your Pico W) sends a message, it includes a topic in the message header. The broker, upon receiving the message, checks if that topic already exists. If it doesn't, the broker creates it and then routes the message to any clients that are subscribed to that topic.

What You Need to Do

1.  **Define the Topic Name:** In your Pico W's code, simply decide on a logical and hierarchical topic name. Good examples are:
    * `sensor/livingroom/temperature`
    * `device/picow_01/status`
    * `home/kitchen/light`
2.  **Publish to the Topic:** When your Pico W's code publishes its first message, it will automatically create that topic on the EMQX broker.
3.  **Subscribe to the Topic:** Any other client (e.g., another Pico W, a dashboard on your computer, or a smartphone app) that wants to receive that data will need to subscribe to the exact same topic name.

This dynamic topic creation is a key feature of MQTT that makes it flexible and easy to use.

{{% /details %}}


{{% details title="Testing EMQX from W11" closed="true" %}}

```sh
choco install mosquitto
```


{{% /details %}}

**REQUIRED:**

```py
#connect to wifi
import network   # handles connecting to WiFi
import urequests # handles making and servicing network requests

# Connect to network
wlan = network.WLAN(network.STA_IF)
wlan.active(True)

# Fill in your network name (ssid) and password here:
ssid = 'HUAWEI P30'
password = 'mokradupa68'
wlan.connect(ssid, password)

#install libraries for mqtt

##with upip
#upip.install("micropython-umqtt-robust")
#upip.install("micropython-umqtt-simple")

##with mip
#https://github.com/micropython/micropython-lib 
#https://github.com/micropython/micropython-lib/tree/master/micropython/umqtt.robust
mip.install("umqtt.robust")

#https://github.com/micropython/micropython-lib/tree/master/micropython/umqtt.simple
mip.install("umqtt.simple")
```

then the code <https://github.com/donskytech/micropython-raspberry-pi-pico/tree/main/umqtt.simple>





main.py


```py
import time
import ubinascii
from umqtt.simple import MQTTClient
import machine
import random

# Default  MQTT_BROKER to connect to
MQTT_BROKER = "192.168.3.200"
CLIENT_ID = ubinascii.hexlify(machine.unique_id())
SUBSCRIBE_TOPIC = b"led"
PUBLISH_TOPIC = b"temperature"

# Setup built in PICO LED as Output
led = machine.Pin("LED",machine.Pin.OUT)

# Publish MQTT messages after every set timeout
last_publish = time.time()
publish_interval = 5

# Received messages from subscriptions will be delivered to this callback
def sub_cb(topic, msg):
    print((topic, msg))
    if msg.decode() == "ON":
        led.value(1)
    else:
        led.value(0)


def reset():
    print("Resetting...")
    time.sleep(5)
    machine.reset()
    
# Generate dummy random temperature readings    
def get_temperature_reading():
    return random.randint(20, 50)


def get_chip_temperature_reading(): #added this function to read the Pico's Temp Sensor
    sensor_temp = machine.ADC(4)
    conversion_factor = 3.3 / (65535) #pico's datasheet
    #while True:
    reading = sensor_temp.read_u16() * conversion_factor
    temperature = 27 - (reading - 0.706)/0.001721
        #print(temperature)
    return(temperature)
   
def main():
    print(f"Begin connection with MQTT Broker :: {MQTT_BROKER}")
    mqttClient = MQTTClient(CLIENT_ID, MQTT_BROKER, keepalive=60)
    mqttClient.set_callback(sub_cb)
    mqttClient.connect()
    mqttClient.subscribe(SUBSCRIBE_TOPIC)
    print(f"Connected to MQTT  Broker :: {MQTT_BROKER}, and waiting for callback function to be called!")
    while True:
            # Non-blocking wait for message
            mqttClient.check_msg()
            global last_publish
            if (time.time() - last_publish) >= publish_interval:
                #temp = get_temperature_reading()
                temp=get_chip_temperature_reading()
                mqttClient.publish(PUBLISH_TOPIC, str(temp).encode())
                last_publish = time.time()
            time.sleep(1)


if __name__ == "__main__":
    while True:
        try:
            main()
        except OSError as e:
            print("Error: " + str(e))
            reset()

```


---

## Conclusions

I took longer than expected to write this post.

And almost forgot all the things I learnt about the PicoW, just bc I did not document it while learning.

Things of 2023.


**Interesting Resources**


1. Pico to Pico Wifi communication

<https://www.youtube.com/watch?v=ACAmVg6MakI>

2. Pico W web server:

See <https://www.youtube.com/watch?v=ufK_knxWn08> and also <https://www.youtube.com/watch?v=AK8UYh7pMGM>

Pico w web server via C, instead of Micropython - https://www.youtube.com/watch?v=C_O0MXGBHsw

3.  MQTT to NodeRed: NodeRed will subscribe to the MQTT topic.

* https://www.youtube.com/watch?v=_DO2wHI6JWQ&t=21s>
* https://learnembeddedsystems.co.uk/easy-raspberry-pi-iot-server>

* https://www.youtube.com/watch?v=ybCMXqsQyDw&t=19s


---

## FAQ

**Supported Languages** 

Yes, the Raspberry Pi Pico W supports all of the languages and the OS you listed.

***

### Languages

* **C/C++:** This is the primary language supported by the Raspberry Pi Pico, with an official SDK (Software Development Kit) provided by the Raspberry Pi Foundation. It offers the fastest performance and the most direct control over the hardware.
* **MicroPython:** A lean and efficient implementation of the Python 3 programming language optimized for microcontrollers. It's an excellent choice for beginners and for rapid prototyping because of its simpler syntax and a large number of available libraries.
* **TinyGo:** This is an implementation of the Go programming language that is designed for microcontrollers. The Raspberry Pi Pico W is officially supported by the TinyGo project, making it a viable option for those who prefer the Go ecosystem.
* **CircuitPython:** A fork of MicroPython created by Adafruit, it is also well-supported on the Raspberry Pi Pico W. It focuses on ease of use for beginners and has a large collection of hardware-specific libraries.

* **FreeRTOS:** While not a full-fledged operating system in the traditional sense, **FreeRTOS** is a **Real-Time Operating System (RTOS)** kernel. It is supported on the Raspberry Pi Pico W, allowing you to run multiple tasks concurrently and manage resources in a time-sensitive manner, which is crucial for complex embedded applications. 

<!-- https://www.youtube.com/watch?v=5pUY7xVE2gU -->

{{< youtube "5pUY7xVE2gU" >}}


> Even with RUST?

* https://www.alexdwilson.dev/how-to-program-raspberry-pi-pico-with-rust
* https://www.youtube.com/watch?v=jZT8APrzvc4

If you liked the [MQTT section](#pico-and-mqtt), you could also play with **HiveMQ**

{{< youtube "jw9zTjKqoUA" >}}


**Checking micropython files inside PicoW via RShell**

```sh
python3 -m pip install --user rshell
ls -l /dev/serial/by-id/
#fuser -v /dev/ttyACM0 || true
#kill 48470 || kill -9 48470
#fuser -v /dev/ttyACM0 || true
#rshell -p /dev/serial/by-id/usb-MicroPython_Board_in_FS_mode_e66141040370772c-if00 -b 115200
rshell -p /dev/serial/by-id/usb-MicroPython_Board_in_FS_mode_e66141040370772c-if00 --buffer-size 512 -b 115200
```

### How can you see what code is currently inside the microcontroller (Pico W)?


{{% details title="If you used ArduinoIDE..." closed="true" %}}

Short Answer:

**You *cannot* directly view or retrieve the code that’s already been uploaded to a microcontroller like the Pico W from the Arduino IDE.** 

Once code is uploaded, it's compiled into machine code and stored in flash memory — not easily readable or reversible.

---

**Why?**

When you upload a sketch to the Pico W through Arduino IDE:

* The human-readable code (`.ino`) is **compiled** into a binary format (`.uf2`, `.bin`, or similar).
* This binary is uploaded to the Pico W.
* The microcontroller runs that compiled code, but **it does not retain the original `.ino` sketch** or any comments.

So, unless you have the original source code saved locally, there’s no official or easy way to recover it from the Pico.

✅ If you just want to know *whether* there is a sketch on it:

You can check that the board is running something:

* **Open the Serial Monitor** in Arduino IDE (Ctrl+Shift+M or use the magnifying glass icon).
* Set the correct **baud rate** (commonly 9600 or 115200).
* Press the **reset button** on the Pico W and see if anything is printed.

This only helps if the uploaded sketch sends serial output (like using `Serial.println()`).

🔄 If you want to start fresh:

You can always re-upload your own code. The old code will be overwritten.


Bonus: Using File System (for MicroPython users)

If you were using **MicroPython** instead of Arduino IDE, and your Pico W was running MicroPython firmware, you could:

* Access the file system using **Thonny** or **rshell**.
* Download the `main.py` or other files from the device.

But since you're using Arduino IDE, that's not applicable here.

**In Summary:**

| Goal                                                | Can You Do It?                 |
| --------------------------------------------------- | ------------------------------ |
| View the original Arduino sketch code inside Pico W | ❌ Not possible                 |
| Check if the Pico W is running code                 | ✅ Via Serial Monitor           |
| Retrieve readable code                              | ❌ Unless you have the original |
| Overwrite with new code                             | ✅ Always possible              |


{{% /details %}}

If you used a **MicroPython** script, not Arduino....

{{% details title="What if the Pico W was running **MicroPython**" closed="true" %}}


This `boot.py` script would have been uploaded to the internal file system of the board.

Let’s break this down and help you check **whether this code is still there** and how to retrieve or edit it.

---

✅ Step-by-Step: Check if Your Script is Still on the Pico W

1. **Install & Open Thonny**

Thonny is the recommended editor for MicroPython on the Pico W.

* Download: [https://thonny.org/](https://thonny.org/)
* Open Thonny and:

  * Go to **Tools > Options > Interpreter**
  * Select:

    * **MicroPython (Raspberry Pi Pico)**
    * The correct **port** (it often auto-detects)

> ⚠️ If Thonny says it can't find the Pico, try holding the **BOOTSEL** button while plugging in the board, then reflash the MicroPython firmware.

---

💾 2. **Browse the File System**

Once connected:

* On the left side of Thonny, you should see:

  * **Files on this computer**
  * **Files on Raspberry Pi Pico**

If your script (`boot.py`) is still there, you’ll see it listed.
Double-click to open and view it.

3. **What If You Flashed Arduino Code?**

If you uploaded an Arduino sketch to the Pico W, the MicroPython firmware would have been **overwritten**. That means:

* The script is **gone**.
* The Pico no longer runs MicroPython, so Thonny won’t detect it as a MicroPython device.

To get back to MicroPython:

* **Re-flash the MicroPython firmware:** *This is MicroPython dragnDrop install!*

  1. Unplug the Pico W.
  2. Hold the **BOOTSEL** button and plug it in.
  3. It appears as a USB drive.
  4. Download the `.uf2` MicroPython firmware from [here](https://micropython.org/download/rp2-pico-w/).
  5. Drag and drop the `.uf2` file onto the Pico's USB drive.
  6. It will reboot into MicroPython.

Now, you can reconnect using Thonny and upload scripts like `boot.py` again.

🔐 Bonus Tip: Hide Credentials in Production

Your current script hardcodes the Wi-Fi credentials — that’s fine for testing, but for more security:

* Store them in a separate `secrets.py` file.
* Or use environment variables if working with more complex setups.

{{% /details %}}

> For me, the easiest was with Thonny + Windows11.