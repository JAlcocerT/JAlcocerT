---
title: "BI Tools for the AI era"
date: 2025-03-10T00:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Setting up Data Analytics Visualization (BI) tools with containers.'
url: 'setup-bi-tools-docker'
---



## Business Intelligence and IoT (BIA & IoT)

- [Superset](https://superset.apache.org/)
  - [Superset UI](https://apache-superset.github.io/superset-ui/?path=/story/legacy-chart-plugins-legacy-plugin-chart-map-box--basic)
  - [Superset GitHub](https://github.com/apache/superset)
- [Metabase](https://www.metabase.com/)
  - [Metabase Docker Hub](https://hub.docker.com/r/metabase/metabase)
  - [Static Embedding in Metabase](https://www.metabase.com/embedding-demo)
- [Redash](https://redash.io/)

How about real time data analytics?

Real-Time Analytics with ClickHouse
- [ClickHouse Use Cases](https://clickhouse.com/use-cases/real-time-analytics)
- **Superset**: An open-source data exploration and visualization platform that supports ClickHouse as a data source.
- **Metabase**: An open-source business intelligence tool with ClickHouse integration.
- **Tableau, Looker, Power BI**: Commercial BI tools that may have connectors or integrations with ClickHouse.


#### SuperSet

* https://jalcocert.github.io/RPi/posts/rpi-gps-superset/

> Superset works perfectly with Trino SQL!

#### MetaBase


* <https://www.opensourcealternative.to/project/LightDashs>
* <https://www.opensourcealternative.to/project/Metabase>

#### Redash


### Redash

[Redash is an open-source]() data visualization and dashboarding tool that is commonly used in the field of data analytics and business intelligence. It helps organizations and individuals query, visualize, and share data from various data sources to gain insights and make data-driven decisions.


https://github.com/JAlcocerT/Docker/tree/main/IoT/Redash


<!-- https://www.youtube.com/watch?v=_0_Qk0Oleeo -->

{{< youtube "_0_Qk0Oleeo" >}}


{{% details title="More About Redash" closed="true" %}}

1. Data Connection: Redash allows users to connect to a wide range of data sources, including relational databases (e.g., PostgreSQL, MySQL), NoSQL databases (e.g., MongoDB), data warehouses (e.g., Amazon Redshift, Google BigQuery), REST APIs, and more. This versatility enables data analysts to work with data from multiple sources in a unified platform.

2. Querying: Users can create SQL queries and run them within Redash to extract and transform data. The tool provides a user-friendly query builder interface, making it accessible to users with varying levels of SQL expertise.

3. Visualization: Redash offers a variety of visualization options, including charts, graphs, and pivot tables, to help users explore and understand their data. It supports popular charting libraries like Chart.js, Plotly, and more, allowing for customizable and interactive visualizations.

4. Dashboards: Users can combine multiple visualizations and queries into interactive dashboards. These dashboards can be customized and shared with others, making it easy to communicate insights and monitor key performance indicators (KPIs).

5. Collaboration: Redash supports collaboration among team members by allowing them to share queries, dashboards, and insights. This promotes knowledge sharing and facilitates data-driven decision-making within organizations.

6. Scheduled Reports: Redash enables users to schedule and automate the generation of reports and dashboards, which can be sent via email or other channels. This feature is useful for regularly distributing updated data and insights to stakeholders.

7. Embedding: Redash provides options for embedding visualizations and dashboards into other applications or websites, allowing for seamless integration of data analytics capabilities into existing workflows.

8. Data Governance: Redash provides role-based access control and data source integration, helping organizations maintain data security and governance standards.

Redash is a versatile data analytics tool that simplifies the process of querying, visualizing, and sharing data from various sources.

{{% /details %}}

> You can use this [Docker-Compose to SelfHost Redash](https://github.com/JAlcocerT/Docker/tree/main/IoT/Redash).

Get Redash running locally with [docker-compose](https://github.com/JAlcocerT/Docker/tree/main/IoT/Redash)

{{< callout type="info" >}}
IoT Project example [with Redash]()
{{< /callout >}}



<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-redash"></script> -->
<!-- 
{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-redash" >}} -->

<!-- ```sh
git clone https://github.com/getredash/setup
cd setup
rm -rf .git


chmod +x ./setup.sh
./setup.sh
``` -->



#### Grafana

For the IoT Fans out there: Grafana, Kibana and Chronogaph


There are many Grafana stacks, like LGTM: **L**oki, **G**rafana, **T**empo and Pro**m**etheus


{{< youtube "1X3dV3D5EJg" >}}
<!--
 https://www.youtube.com/watch?v=1X3dV3D5EJg
 -->

{{< details title="What can I do with LGTM? 📌" closed="true" >}}

Ever wondered how programmers build software? If builders built houses the way programmers build software, the first woodpecker to come along would destroy civilization.

In this video, Fireship, a popular YouTube creator, takes us on a journey to instrument, collect, and visualize telemetry data from our server using open telemetry and the **LGTM stack**.


The **LGTM stack** consists of five technologies: 
- **Open Telemetry**: An industry-standard framework that collects telemetry data from software.
- **Grafana**: The frontend UI for visualizing data.
- **Prometheus**: A time-series database for storing metrics.
- **Tempo**: A database for storing traces.
- **Loki**: A database for storing logs.

Setting Up the LGTM Stack

To get started:
1. **Server Setup**: Fireship recommends using Hostinger, which offers a variety of hosting services, including a Linux virtual private server (VPS) suitable for this project.
2. **Deploying LGTM Backend**: The LGTM backend can be deployed using a Docker image provided by Graphon.
3. **Server Access**: After setting up your server on Hostinger, you can access the management dashboard and connect via SSH.

Running Grafana

1. **Verify Docker**: Use a Docker command to confirm the Docker daemon is running.
2. **Run Docker Image**: Pull the Docker image for OTel LGTM from the cloud, which may take a minute.
3. **Access Grafana**: Open the browser and navigate to the IP address on port 3000 to log into Grafana as admin.

Connecting to a Data Source

Grafana alone is not useful unless connected to a data source. Fireship demonstrates how to connect **Loki**, **Prometheus**, and **Tempo**, and then populate them with data using a sample application built with **Dino**, a framework with built-in telemetry support.

Analyzing Data with Grafana

With the LGTM stack up and running:
- Use Grafana to explore logs, metrics, and traces.
- Use **Prometheus' query language** to analyze and dive deeper into your data to identify errors and anomalies.

Takeaways

- The **LGTM stack** provides a holistic approach to software observability, enabling you to instrument, collect, and visualize telemetry data from your server.
- With the right tools, you can identify errors and anomalies in your application, allowing for data-driven decisions to improve your software.
- **Security** is crucial when deploying a telemetry backend. Services like Hostinger offer built-in protections against harmful traffic and threats.


{{< /details >}}



#### Kibana

#### Chronograph

Works together with InfluxDB!

Chronograf allows you to quickly see the data that you have stored in InfluxDB so you can build robust queries and alerts. 

It is simple to use and includes templates and libraries to allow you to rapidly build dashboards with real-time visualizations of your data.


#### Node-Red

### Custom BI Tools

**For the Devs out there**

#### Python DASH

#### Python STREAMLIT
    
* https://ploomber.io/blog/streamlit_exe/


##### Streamlit + AI

{{< youtube id="MgLlEMteQqg" autoplay="false" >}}

* https://github.com/dataprofessor/builder

##### Dynamic Maps with Streamlit

* Streamlit **+ LeafMap**:

https://github.com/opengeos/streamlit-map-template
https://github.com/opengeos/streamlit-geospatial -->> https://huggingface.co/spaces/giswqs/Streamlit

* What it is based on? https://github.com/opengeos/leafmap
    * https://pypi.org/project/leafmap/

> A Python package for interactive mapping and geospatial analysis with minimal coding in a Jupyter environment

{{< youtube id="hn2WqRX75DI" autoplay="false" >}}

With a Very Interesting Marker cluster Page and a Page to upload your Vector Data (.geojson) and be able to visualize it.

* Streamlit **+ Folium**

{{< youtube id="OsGq4LJHOUI" autoplay="false" >}}

* Streamlit **Reacting to clicks on a Leaflet Map** - Also with Folium

https://github.com/clint-kristopher-morris/Tutorials/tree/main/streamlit-part-1

{{< youtube id="gWV1gbeB-IM" autoplay="false" >}}

#### Python Shiny

#### FlexDashboards with R


---




### Metabase


Get Metabase running locally with [docker-compose](https://github.com/JAlcocerT/Docker/tree/main/IoT/Metabase)


<!-- 

{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-metabase" >}} -->
<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-metabase"></script> -->


<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-metabase.js"></script>

{{< callout type="info" >}}
IoT Project example with Metabase: <https://jalcocert.github.io/RPi/posts/rpi-iot-dht1122-mongo/#metabase>
{{< /callout >}}

> IoT Projec tith [Metabase](https://jalcocert.github.io/RPi/posts/rpi-iot-dht1122-mongo/)


* https://github.com/JAlcocerT/Docker/tree/main/IoT/Metabase


{{< callout type="info" >}}
IoT Project with [Metabase+MongoDB+DHT Sensor](https://jalcocert.github.io/RPi/posts/rpi-iot-dht1122-mongo/)
{{< /callout >}}


### SelfHost These Tools with Docker

<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0.js"></script>




Compare with Apache Superset - https://superset.apache.org/

You can use serverless version of it at - https://preset.io/

https://github.com/jmlcas/metabase

```yml
version: '3'
services:
  metabase:
    image: metabase/metabase
    container_name: metabase
    ports:
      - "3000:3000"
    volumes:
      - metabase-data:/metabase-data
    restart: always

volumes:
  metabase-data:
```

## Metabase Embedded Analytics

https://www.metabase.com/product/embedded-analytics

node.js
ruby
python...

### Static Embedding

### FlexDashboards

#### Metabase with MariaDB

https://www.metabase.com/data_sources/mariadb
https://www.metabase.com/docs/latest/databases/connections/mariadb

* https://hub.docker.com/r/metabase/metabase/
* https://github.com/metabase/metabase

```yml
services:
  metabase:
    image: metabase/metabase
    container_name: metabase
    ports:
      - "3000:3000"
    volumes:
      - metabase_data:/metabase-data
    restart: always
    depends_on:
      - mariadb
    environment:
      MB_DB_TYPE: mysql
      MB_DB_DBNAME: chinook
      MB_DB_USER: myuser
      MB_DB_PASS: mypassword
      MB_DB_HOST: mariadb-db

  mariadb:
    image: mariadb:10.5
    container_name: mariadb-db
    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_DATABASE=chinook
      - MYSQL_USER=myuser
      - MYSQL_PASSWORD=mypassword
    volumes:
      - mariadb_data:/var/lib/mysql
    ports:
      - "3399:3306"
      
volumes:
  metabase_data:
  mariadb_data:
```

### Superset

https://github.com/JAlcocerT/Docker/tree/main/IoT/Superset

### Apache Superset

Get Superset running locally with [docker-compose](https://github.com/JAlcocerT/Docker/tree/main/IoT/Superset).

<!-- > IoT Project example [with Superset](). -->

<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-superset"></script> -->


<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-superset"></script>

{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-superset" >}} -->

<!-- ```sh
git clone https://github.com/apache/superset.git
cd Superset
rm -rf .git


docker compose up -d

git checkout 3.0.0
TAG=3.0.0 docker compose -f docker-compose-non-dev.yml pull
TAG=3.0.0 docker compose -f docker-compose-non-dev.yml up
``` -->

<!-- {{< callout type="info" >}}
IoT Project example with Superset: <>
{{< /callout >}} -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-gps-superset/#apache-superset-setup" title="Superset Setup" image="/blog_img/iot/Rpi4_4gb_size.jpg" subtitle="IoT Pi Project with Superset" >}}
{{< /cards >}}

<!-- 
![SBC Raspberry Pi 4](/blog_img/iot/Rpi4_4gb_size.jpg) 
-->




---



<!-- https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0 -->

{{< gist JAlcocerT 953cab1052af58f4241f28dbc0a314a0>}}
<!-- {{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - PayoutRatioEvolution.JPG" >}} -->


### Analytics Tools
- [KNIME](https://www.knime.com/)
- [Superset](https://www.opensourcealternative.to/project/Superset)
- [Metabase](https://www.metabase.com/)
- [Redash](https://github.com/getredash/redash)
- [Chartbrew](https://github.com/chartbrew/chartbrew)
- [Lightdash](https://github.com/lightdash/lightdash)
- [MongoDB tutorial: Building Metabase Dashboards](https://www.youtube.com/watch?v=utMxX014na4)

### Additional Databases and Tools
- **MongoDB**
- **Elasticsearch (ES)**
- **InfluxDB**
- **Graphite**
- **OPENFoam**



### Other F/OSS BI Tools

#### Kibana

#### Grafana
