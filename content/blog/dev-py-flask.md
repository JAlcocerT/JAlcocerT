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

{{< chart 90 200 >}}
{
  type: 'pie',
  data: {
    labels: [
      'Water',
      'Oil',
      'NaOH'
    ],
    datasets: [{
      label: 'My First Dataset',
      data: [6, 6, 1],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)'
      ],
      hoverOffset: 4
    }]
  },
  options: {
    maintainAspectRatio: false
  }
}
{{< /chart >}}

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

We are going to get to this

![alt text](/blog_img/iot/flask/flask-x300-cpu.png)

> [x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/)


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

See the data from the x300:

```sh
python3 data.py
```

Save it into a DB:

```sh
python3 ./Sensors/x300/sensor_loger.py
```

See whats loaded:

```sh
sudo apt install sqlite3
sqlite3 --version

sqlite3 ./sensor_data.db

#SELECT name FROM sqlite_master WHERE type='table';
#.tables
#.schema sensor_data

SELECT * FROM sensor_data;
SELECT * FROM sensor_data ORDER BY timestamp DESC LIMIT 5;
#.quit #when you are done!
```


### Pi4

As seen [here](https://forums.raspberrypi.com/viewtopic.php?t=309480), we can read Pi temps:

```sh
echo "The CPU is at $(vcgencmd measure_temp) degrees."
```

Or via script:

```sh
#vcgencmd measure_temp
python3 ./Sensors/RPi4/pi_loger.py
```

### BME280

This is the original feature from KarolPWr original version!

## Real Time Data with Flask



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