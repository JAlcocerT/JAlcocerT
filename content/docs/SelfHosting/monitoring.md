---
title: Monitoring for HomeLab
type: docs
prev: /docs/privacy/
next: docs/arch/
draft: false
---


If you are just looking from the [devops tools angle](https://jalcocert.github.io/JAlcocerT/dev-ops-for-non-devops/) or just need to see how your [ebook service](https://jalcocert.github.io/JAlcocerT/kindle-clippings-knowledge-base/) uptime is behaving - you will need some Monitoring.

If you are building, dont be scare of the http **status codes**: https://it-tools.tech/http-status-codes

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE | Docs ↗" >}}
{{< /cards >}}

And see these [tools for **internet monitoring**](https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#internet-monitoring-tools)

You can also make a avg internet speed test when [downloading OSS OS via P2P](https://jalcocert.github.io/JAlcocerT/how-to-torrent-with-a-raspberry/) or when uploading your videos to youtube.

You might see these kind of status pages around: https://status.perplexity.com/, see https://instatus.com/pricing

Or even advanced ones like:

Not only [AWS](https://health.aws.amazon.com/health/status) will have outages.

But also [cloudflare](https://www.cloudflarestatus.com/)...and [Github](https://www.githubstatus.com/)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-06-2025/#portmaster-and-https" title="PortMaster" image="/blog_img/selfh/https/portmaster-nc-https.png" subtitle="PortMaster vs HTTPs" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/homelab-security/#conclusions" title="Stacer" image="/blog_img/selfh/stacer-ui.png" subtitle="Using Stacer in a HomeLab" >}}
{{< /cards >}}

<!-- ![Portmaster](/blog_img/selfh/https/portmaster-nc-https.png) -->

<!-- ![alt text](/blog_img/selfh/stacer-ui.png) -->

You can try with a **NetData** or a [custom Grafana dashboard](https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#netdata-and-grafana) for monitoring:


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/netdata" title="Net-Data Monitoring | Docker Config 🐋 ↗" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#netdata-and-grafana" title="Netdata Monitoring" image="/blog_img/selfh/HomeLab/netdata.png" subtitle="OpenSpeedTest and a TPLink" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/travel-router-gl-mt3000-review/" title="Testing a Travel Router" image="/blog_img/hardware/TPLink4G-SpeedTestTraker.png" subtitle="SpeedTest Tracker on a GL MT3000" >}}
{{< /cards >}}

<!-- 
![Netdata Updated UI](/blog_img/selfh/HomeLab/netdata.png) -->

Or just **with Beszel**:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/beszel" title="Beszel | Docker Config 🐋 ↗" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/" title="Beszel Setup" image="/blog_img/Monitoring/beszel-addmonitor.png" subtitle="Monitoring with Beszel" >}}
{{< /cards >}}


Also, with **Uptime Kuma**, you can get quickly an uptime pages for your services:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
{{< /cards >}}

```sh
git clone https://github.com/JAlcocerT/Home-Lab
#git pull
cd Home-Lab/uptime-kuma
#sudo docker compose up -d
#docker ps -a --filter "name=uptimekuma"
uv run scripts/bulk_add_monitors.py #tweak the json and the .env to add your monitors
```

See details for the script [here](https://jalcocert.github.io/JAlcocerT/shopify-business-data-analytics)

Uptime Kuma status pages example: `https://status.tromsite.com/status`

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dev-ops-for-non-devops/#monitoring" title="DevOps for Non DevOps x UpTime Kuma" image="/blog_img/selfh/HomeLab/uptimekuma-statuspages.png" subtitle="UpTime Kuma can monitor ping and http requests" >}}
{{< /cards >}}

<!-- 
![Status Pages](/blog_img/selfh/HomeLab/uptimekuma-statuspages.png) -->

See also how **Peekaping**

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selfhosted-apps-oct-2025/#monitoring-for-homelab" title="Testing PeekaPing Status Pages" image="/blog_img/Monitoring/peekaping-status-pages-monitoring.png" subtitle="Monitoring services and embedding their status" >}}
{{< /cards >}}


<!-- ![Peekaping Status Pages Login to UI](/blog_img/Monitoring/peekaping.png) -->

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/peekaping" title="Peekaping - Status Pages | Docker Config 🐋 ↗" >}}
{{< /cards >}}


```html
<p>
    <img src="https://your-peekaping-instance.com/api/v1/badge/api-monitor/status" alt="API Status" />
</p>
```

As I have it running locally: `http://192.168.1.2:8383/monitors` these are rendered via `hugo server`

Which can be embeded into your posts and websites via its API, like:

```
![My Local Service Status](http://192.168.1.2:8383/api/v1/badge/1e12dabc-e962-4cd7-b808-ee08c994ec53/status)
```

Another option, is **Kener**

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}


Rather than a way to admire how people have created **static status pages**: https://open-slum.pages.dev/ nor [get...things](https://annas-archive.org/) online.

> Uptime monitor / status pages in cloudflare pages


Or **[Tianji](https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#tianji)**, which does more than just web analytics:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/tianji" title="Tianji | Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/kindle-clippings-knowledge-base/" title="Using Kener Monitoring" image="/blog_img/selfh/HomeLab/statuspages/kener-setup.png" subtitle="Testing Kener Status Pages" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-setup-beszel-monitoring/#tianji" title="Using Tianji" image="/blog_img/Monitoring/tianji-server-monit.png" subtitle="Testing Tianji Server Monitoring and WebAnalytics on a VPS" >}}
{{< /cards >}}

<!-- 
![Kener Status Pages](/)
![Kener UI](/blog_img/selfh/HomeLab/statuspages/kener-manager-ui.png) 
![Tianji Server Monitoring](/) 
-->


## Internet Monitoring

Whether you [have a homelab](https://jalcocert.github.io/JAlcocerT/docs/selfhosting/) or you are just tired of you ISP, you might need these.

* https://www.speedtest.pl/
* See also `speed.cloudflare.com`

{{% details title="Testing Internet Connectivity" closed="true" %}}

```sh
ip addr show
hostname -I

#sudo apt-get install net-tools
#ifconfig

ping -c 4 192.168.3.1 #gateway
ping 9.9.9.9 #quad9
```

```sh
sudo apt-get install dnsutils -y #dns resolution
nslookup github.com 
dig google.com
```

```sh
curl -sS https://ipinfo.io/json #the command to use
curl -sS http://ip-api.com/json/ #provides info about country, ISP, ...
curl -6 ifconfig.me #ipv6 info 
```

{{% /details %}}

{{< cards cols="3" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/open-speed-test" title="OST | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/speedtest-tracker" title="Speedtest Tracker | Docker Config 🐋 ↗" >}}
{{< /cards >}}


1. Open Speed Test: *OST*

We can use [OpenSpeedTest](https://jalcocert.github.io/RPi/posts/self-internet-monit/#openspeedtest) together with Container and Portainer to deploy the docker compose.

Just go to **OST UI** dashboard at: `localhost:6040`

![OpenSpeedTest](/blog_img/hardware/TPLink4G-OpenSpeedTest.png)

2. SpeedTest CLI:

```sh
sudo apt-get install speedtest-cli
speedtest-cli #speedtest-cli --simple
#npm install -g fast-cli
```

![Speed Test CLI connected via 4g](/blog_img/hardware/speedtest-cli-4g.png)

3. Speed Test Tracker:

I mentioned about **[SpeedTest-Tracker](https://github.com/alexjustesen/speedtest-tracker)**, which we can use to **test our internet connectivity**:

```sh
echo -n 'base64:'; openssl rand -base64 32; #generte API key
```

Now the **container image** is provided by lscr instead of GHCR:


> Go to the UI at: `http://192.168.1.101:8089/` with [default creds](https://docs.speedtest-tracker.dev/security/authentication) `admin@example.com` and `password`

![SpeedtestTracker](/blog_img/hardware/TPLink4G-SpeedTestTraker.png)