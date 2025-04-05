---
title: "Web Apps with Flask and cool ChartJS"
date: 2025-04-05T05:20:21+01:00
draft: false
tags: ["Dev","Python"]
description: 'Flas webapps, IoT Sensors, ChartJS and Websockets.'
url: 'web-apps-with-flask'
---


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed with NGINX" >}}
  {{< card link="https://github.com/JAlcocerT/flask_sensor_display" title="Flask Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}




{{< callout type="info" >}}
The initial app is using Flask in a really cool way with ChartJS, like [ChartJS HUGO](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/#charts-in-hugo)!
{{< /callout >}}



## Sensors Data


{{< dropdown title="Ready with Python?" closed="true" >}}

```sh
sudo apt update
sudo apt install build-essential software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

sudo apt install python3.11 -y
```

```sh
sudo apt install python3-pip
sudo apt install python3.10-venv
#apt install python3.12-venv
#sudo apt install python3.12-dev
```

```sh
#python -m venv solvingerror_venv #create the venv
python3 -m venv solvingerror_venv #create the venv

#solvingerror_venv\Scripts\activate #activate venv (windows)
source solvingerror_venv/bin/activate #(linux)
```
{{< /dropdown >}}



```sh

#git clone https://github.com/KarolPWr/flask_sensor_display.git
#git checkout tags/v1.0.0
pip3 install -r requirements.txt
```


See the temperature of a **[Raspberry Pi](https://jalcocert.github.io/RPi/archives/) CPU**:

```sh
vcgencmd measure_temp
```

With a script:

```sh
python3 ./Sensors/RPi4/pi_loger.py
```

And for the [x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/) with ubuntu:


```sh
sudo apt update
sudo apt install lm-sensors

sudo sensors-detect
```

```sh
sudo modprobe nct6775
sensors
#sensors > sensor_output.txt
```

If we run some [benchmarks](https://jalcocert.github.io/JAlcocerT/benchmarking-computers/), you can see how these CPU Temps, fan speeds...change:

```sh
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run #4 cores
#See the variables quickly
sensors | grep "Tctl"
sensors | grep -E "Tctl|fan2|PPT"
```

### x300

![alt text](/blog_img/iot/flask/flask-x300-cpu.png)


### Pi4

### BME280

---

## Conclusions

Starting from the awsome project: https://github.com/KarolPWr/flask_sensor_display

<!-- https://www.youtube.com/watch?v=fxbwHl-3WN0 -->

{{< youtube "fxbwHl-3WN0" >}}


I have made couple of tweaks to it [here](https://github.com/JAlcocerT/flask_sensor_display):

1. Added [Github Actions support](https://jalcocert.github.io/JAlcocerT/git-recap/#github-actions) with multiarch container
2. Select which sensor you want to pull from via `.env` or `docker-compose.yml`
3. Added x300 and Pi4 Sensor support

### Deploying

![alt text](/blog_img/iot/flask/flask-container-portainer.png)


---

## FAQ