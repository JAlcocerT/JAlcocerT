---
title: A Camera for the Raspberry Pi
date: 2024-07-19T23:20:21+01:00
draft: false
tags: ["Tinkering"]
summary: SimpleCV and OpenCV + Scrypted & HA...but first, lets make the camera work
url: 'raspberry-pi-camera-setup'
---


## Raspberry Pi + Camera

### Hardware


* Arducam OV5647 (5MP, 1080p) - 
<!-- 
https://www.youtube.com/watch?v=UxsiBxcXbYc -->

* Pi Zero Wifi Security Camera - https://www.youtube.com/watch?v=ll5d342QaCY with MotionEyeOS
  * https://randomnerdtutorials.com/install-motioneyeos-on-raspberry-pi-surveillance-camera-system/


### Taking Pictures and Streaming Video

Enable the camera:

```sh
sudo raspi-config #Interface Options -> I1 Enable (legacy) camera Support #bullseye 6.1kernel
#you will be prompt to reboot
```

Take a picture simply with: <!-- https://www.youtube.com/watch?v=yhM1NhD-kGs -->

```sh
raspistill -o pico.jpg
#scp yourraspbiuser@192.168.3.130:/home/reisipi/pico.jpg . #copy it to windows CMD
```

#### Save Pictures Every 60s

```sh
mkdir -p ~/growth
nano capture_images.sh
./capture_images.sh
```
{{< callout type="info" >}}
* Get the sample script at my [RPi Repo](https://github.com/JAlcocerT/RPi/tree/main/Z_RPi_Cam)!
* See/Download the images while being created [with Filebrowser](https://github.com/JAlcocerT/Docker/blob/main/Z_Dockge/stacks/syncthingfilebrowser/compose.yaml)
{{< /callout >}}

* And now video streaming with:

{{< card link="https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/" title="Card with tag" icon="warning" tag= "Setup Docker" >}}

```sh
git clone https://github.com/meinside/rpi-mjpg-streamer #https://github.com/JAlcocerT/rpi-mjpg-streamer
cd rpi-mjpg-streamer
```

{{< callout type="info" >}}
I [forked it](https://github.com/JAlcocerT/rpi-mjpg-streamer), just in case :)
{{< /callout >}}

Build the image:

```sh
sudo docker build -t streamer:latest \
		--build-arg PORT=9999 \
		--build-arg RESOLUTION=400x300 \
		--build-arg FPS=24 \
		--build-arg ANGLE=0 \
		--build-arg FLIPPED=false \
		--build-arg MIRRORED=false \
		--build-arg USERNAME=user \
		--build-arg PASSWORD=some-password \
		.
```

Deploy the image:

```sh
docker run -p 9999:9999 --device /dev/video0 -it streamer:latest
```

{{< details title="streamer Docker Compose 📌" closed="true" >}}

```yml
version: '3'
services:
  streamer:
    image: streamer:latest
    container_name: streamer
    ports:
      - "9999:9999"
    devices:
      - "/dev/video0:/dev/video0"
    stdin_open: true
    tty: true
```

{{< /details >}}

And we will have the interface ready at the specified port: `localhost:9999` and user/password as per your specifications while building the image.

> Working **up to GNU v11** (not available in bookworm!)

---

## More Software - Camera and CV

### Pi NVR

An NVR stands for Network Video Recorder. It's a specialized computer system designed to record and store video footage captured by IP (Internet Protocol) cameras.

* https://github.com/geerlingguy/pi-nvr

> Raspberry Pi NVR for home CCTV recording.

### TensorFlow Lite

* A)
<!-- Tensorflow Lite with Object Detection on Raspberry Pi!
https://www.youtube.com/watch?v=kX6zWqMP9U4 -->

```sh
git clone https://github.com/tensorflow/examples --depth 1 #https://github.com/JAlcocerT/tf-examples
cd examples
```

Create a Py venv:

```sh
python3 -m pip install virtualenv

# Successfully installed distlib-0.3.8 filelock-3.15.4 platformdirs-4.2.2 virtualenv-20.26.3

python3 -m venv tf
source tf/bin/activate
cd ./lite/examples/object_detection/raspberry_pi
sh setup.sh
```

Or a Conda one if you prefer:

```sh
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh

chmod +x Miniconda3-latest-Linux-armv7l.sh
./Miniconda3-latest-Linux-armv7l.sh
source ~/.bashrc
#conda --version

conda create --name myenv python=3.7.3
conda activate myenv
python --version
```
Once all dependencies are installed in the chose isolated environment:

```sh
python3 detect.py --model efficientdet_lite0.tflite
```

* B) Raspberry Pi Object Detection Tutorial

<!--  https://www.youtube.com/watch?v=NPXBRX7N3ec -->

### OpenCV

<!-- https://www.youtube.com/watch?v=iOTWZI4RHA8&list=PLPK2l9Knytg7O_okVr-prI1KbZ8GJeMKz

https://core-electronics.com.au/guides/object-identify-raspberry-pi/

Object Identification & Animal Recognition With Raspberry Pi + OpenCV + Python
 -->

### PyTorch


### Yolo (ultralytics)

With Yolo Models - https://github.com/ultralytics/yolov5

```py

```


<!-- 
https://www.youtube.com/watch?v=pIUFXGxR_-Q -->

### MotionEyeOS

A Video Surveillance OS For Single-board Computers 

* https://github.com/motioneye-project/motioneyeos
	* https://github.com/motioneye-project/motioneye/wiki/Install-In-Docker#image-from-docker-hub

```sh
docker run --name="motioneye" \
    -p 8765:8765 \
    --hostname="motioneye" \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/motioneye:/etc/motioneye \
    -v /var/lib/motioneye:/var/lib/motioneye \
    --restart="always" \
    --detach=true \
	ccrisan/motioneye:master-armhf
    #ccrisan/motioneye:master-amd64 #https://hub.docker.com/r/ccrisan/motioneye
```

Now, you will access MotionEye at `localhost:8765` with default user: `admin` and blank (no password).

> motionEyeOS is a Linux distribution that turns a single-board computer into a video surveillance system. 

### Frigate

* https://docs.frigate.video/

A complete and local NVR designed for Home Assistant with AI object detection. Uses OpenCV and Tensorflow to perform realtime object detection locally for IP cameras.

> NVR with realtime local object detection for IP cameras

### Other Options for CV with RPi

* https://github.com/silvanmelchior/RPi_Cam_Web_Interface



<https://www.youtube.com/watch?v=tT5gHNDBHXo>




---

## FAQ
HA Desktop - https://flathub.org/apps/com.cassidyjames.butler


### AI


## Best Performing LLMs for a RPi

* For code: https://ollama.com/library/deepseek-coder
    * https://ollama.com/library/phind-codellama
* Daily: https://ollama.com/library/gemma
https://ollama.com/library/orca-mini
https://ollama.com/library/tinyllama


### How to use Ollama with a Raspberry Pi

You can [SelfHost Ollama with Docker](https://fossengineer.com/selfhosting-llms-ollama/) and choose a small enough model that it will fit in the RAM.

Build multimodal AI applications with cloud-native stack:
* <https://github.com/jina-ai/jina>
  * <https://docs.jina.ai/cloud-nativeness/opentelemetry/>

* https://github.com/antimatter15/alpaca.cpp

### BI Tools for EDA

* <https://www.opensourcealternative.to/project/LightDashs>
* <https://www.opensourcealternative.to/project/Metabase>

### More

How to Install Raspberri Pi camera and Troubleshoot errors | Upgrade Bios Firmware on Raspberry Pi
https://www.youtube.com/watch?v=Z8cs1cRrc5A



<https://www.youtube.com/watch?v=tT5gHNDBHXo>




* Node-RED with Raspberry Pi Camera (Take Photos) - https://randomnerdtutorials.com/node-red-with-raspberry-pi-camera-take-photos/

* Video Streaming with Raspberry Pi Camera - https://randomnerdtutorials.com/video-streaming-with-raspberry-pi-camera/

* Pi Zero W + Camera + MotionEyeOS (https://github.com/motioneye-project/motioneyeos) -  How To Make A Raspberry Pi Zero WiFi Security Camera, Also Accessible Over The Internet - https://www.youtube.com/watch?v=ll5d342QaCY
	* https://github.com/motioneye-project/motioneyeos/wiki/Supported-Devices