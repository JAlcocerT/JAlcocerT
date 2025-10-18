---
title: "AI|BI Tools and PoCs with PyGWalker"
date: 2025-05-22T00:20:21+01:00
draft: false
tags: ["Dev","D&A","Career","Streamlit PoCs","uv","Business Intelligence Prototype"]
description: 'BI/AI combo and more D&A Tools. Streamlit Quick PoC Dashboards with PyGWalker and data stories!'
url: 'ai-bi-tools'
---


**Tl;DR**

As a BIA, you might have to skip waiting for data engineering team to put together some pipeline.

You can build your visualizations into Grafana/[GCP Looker](https://jalcocert.github.io/JAlcocerT/understanding-google-cloud-platform/)/[PowerBI](https://jalcocert.github.io/JAlcocerT/about-powerbi/)/ whatever.

But if you know what to do with python...

+++ Created a quick data [**PoC with streamlit** and PyGWalker](#pygwalker).

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="NEW Streamlit PoC repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

**Intro**

It not just about *old school* [**BI** Tools](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/), or the well known propietary ones like [Looker](https://jalcocert.github.io/JAlcocerT/understanding-google-cloud-platform/) or [PBi](https://github.com/JAlcocerT/PBi)

Today, we will have a look to:

* **ChartDB**: A database diagrams editor that lets you visualize and design your database with a single query.
* **Quix (wix-incubator)**: A powerful, open-source platform for data exploration and analysis.
* **Querybook**: Pinterest's open-source big data ad-hoc query and visualization tool.
* **Quix Streams**: A Python library designed for building real-time data streaming applications.

And Also, to one custom AI/BI work that Ive been doing: Generating charts as a code via OpenAI Calls and [render them directly into Streamlit](#conclusions).

Together with...[PyGWalker](#pygwalker)

## BI Tools

### ChartBrew

* https://github.com/chartbrew/chartbrew
  * https://docs.chartbrew.com/deployment/run-on-docker#run-on-docker
  * https://raw.githubusercontent.com/chartbrew/chartbrew/refs/heads/master/docker-compose.yml

>  Open-source web platform used to create live reporting dashboards from APIs, MongoDB, Firestore, MySQL, PostgreSQL, and more 📈📊 

Which resonates with my recent [post on **BI Tools**](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/)

### ChartDB

I thought everything was done with [LangChain querying DBs with LLMs](https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/) in DAG mode.

Then I found this:

* https://github.com/chartdb/chartdb

> agpl 3 | **Database diagrams editor** that allows you to visualize and design your DB with a single query.

[![shields.io Stars](https://img.shields.io/github/stars/chartdb/chartdb)](https://github.com/chartdb/chartdb/stargazers)

### DB2Rest

DB2Rest is blazing fast.

It has NO Object Relational Mapping (ORM) overhead, uses Single round-trip to databases, no code generation or compilation, and supports Database Query Caching and Batching.

* https://github.com/9tigerio/db2rest
  * https://db2rest.com/docs/run-db2rest-on-docker

```sh
#docker pull kdhrubo/db2rest:v1.6.4 #or docker pull kdhrubo/db2rest:latest
```

> Apache v2 | Instant no code **DATA API platform**. Connect any database, run anywhere. Power your GENAI application [function/tools calls](https://jalcocert.github.io/JAlcocerT/how-to-use-openai-function-calling/) in seconds.


---

## Conclusions

These are pretty interesting tools to consider in the analytics space.

As you can see, ChartDB has exploded recently in terms of popularity:

[![Star History Chart](https://api.star-history.com/svg?repos=chartdb/chartdb,wix-incubator/quix,pinterest/querybook,quixio/quix-streams&type=Date)](https://star-history.com/chartdb/chartdb&wix-incubator/quix&pinterest/querybook&quixio/quix-streams&Date)

But how about the promised **AI/BI** part?

[Lets have a look](#pygwalker) to a cool combo.

### PyGWalker

What am I talking about: **Streamlit x pygwalker**

Give the users a webapp that they can play with tables / graph that does not require huge development!

If you want to use actively AI to develop the dashboarding, consider **LLM x Streamlit:**

As can also render [mermaidJS](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/OpenAI_mermaid_v2c.py) and [plotly graphs](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/OpenAI_plotly_v1b.py) with your [aissistant, via streamlit webapp](https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main)

You can also bring:

* [QR Code](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/QR_Gen.py) Generation
* [Plotly render](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/Utils/st_Plotly.py) inside Streamlit
* You can even [modify DNS via this script](https://github.com/JAlcocerT/Streamlit_PoC/blob/main/flask_dnsupdater.py)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit_PoC" title="NEW Streamlit PoC repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github. Streamlit Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data..." >}}
{{< /cards >}}

Remember about maps:

* https://docs.streamlit.io/develop/api-reference/charts/st.map
* https://github.com/Leaflet/Leaflet

To run it, I will be [using **uv** as a venv](https://jalcocert.github.io/JAlcocerT/useful-python-stuff/#uv):

```sh
uv --version
#uv init #then pyproject.toml is created

#uv add streamlit plotly openai dotenv qrcode Pillow #creates the .venv
#uv add pygwalker==0.4.9 folium streamlit_folium
#uv add openpyxl

uv sync #creates/updates the uv.lock for repricability

uv run streamlit run main.py
#uv run streamlit run main.py  --env=./
```

Thats pretty much it (way faster than via pip install!)

![Streamlit PyGWalker Rendered Map with locations](/blog_img/apps/streamlit/st_pygwalker_map.png)

Its also great to **export your configured PyGWalker dashboard** design into a compact `JSON`:

```json
vis_spec = r"""{"config":[{"config":{"defaultAggregated":true,"geoms":["poi"],"coordSystem":"geographic","limit":-1,"timezoneDisplayOffset":0},"encodings":{"dimensions":[{"fid":"OLT","name":"OLT","basename":"OLT","semanticType":"nominal","analyticType":"dimension","offset":0},{"fid":"Latitude","name":"Latitude","basename":"Latitude","semanticType":"quantitative","analyticType":"dimension","offset":0},{"fid":"Longitude","name":"Longitude","basename":"Longitude","semanticType":"quantitative","analyticType":"dimension","offset":0},{"fid":"Geohash","name":"Geohash","basename":"Geohash","semanticType":"nominal","analyticType":"dimension","offset":0},{"fid":"SyntheticMapped","name":"SyntheticMapped","basename":"SyntheticMapped","semanticType":"nominal","analyticType":"dimension","offset":0},{"fid":"gw_mea_key_fid","name":"Measure names","analyticType":"dimension","semanticType":"nominal"}],"measures":[{"fid":"SyntheticLocationsforOLT","name":"SyntheticLocationsforOLT","basename":"SyntheticLocationsforOLT","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0},{"fid":"Viewers","name":"Viewers","basename":"Viewers","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0},{"fid":"Viewers_1","name":"Viewers_1","basename":"Viewers_1","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0},{"fid":"Viewers_14","name":"Viewers_14","basename":"Viewers_14","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0},{"fid":"KPI_1","name":"KPI_1","basename":"KPI_1","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0},{"fid":"KPI_14","name":"KPI_14","basename":"KPI_14","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0},{"analyticType":"measure","fid":"gw_SkCP","name":"KPI_Color","semanticType":"quantitative","computed":true,"aggName":"sum","expression":{"op":"expr","as":"gw_SkCP","params":[{"type":"sql","value":"case when KPI_14 > 0.07 then 1 else 0 end"}]}},{"fid":"gw_count_fid","name":"Row count","analyticType":"measure","semanticType":"quantitative","aggName":"sum","computed":true,"expression":{"op":"one","params":[],"as":"gw_count_fid"}},{"fid":"gw_mea_val_fid","name":"Measure values","analyticType":"measure","semanticType":"quantitative","aggName":"sum"}],"rows":[],"columns":[],"color":[{"analyticType":"measure","fid":"gw_SkCP","name":"KPI_Color","semanticType":"quantitative","computed":true,"aggName":"sum","expression":{"op":"expr","as":"gw_SkCP","params":[{"type":"sql","value":"case when KPI_14 > 0.07 then 1 else 0 end"}]}}],"opacity":[],"size":[],"shape":[],"radius":[],"theta":[],"longitude":[{"fid":"Longitude","name":"Longitude","basename":"Longitude","semanticType":"quantitative","analyticType":"dimension","offset":0}],"latitude":[{"fid":"Latitude","name":"Latitude","basename":"Latitude","semanticType":"quantitative","analyticType":"dimension","offset":0}],"geoId":[],"details":[{"fid":"KPI_1","name":"KPI_1","basename":"KPI_1","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0},{"fid":"KPI_14","name":"KPI_14","basename":"KPI_14","analyticType":"measure","semanticType":"quantitative","aggName":"sum","offset":0}],"filters":[],"text":[]},"layout":{"showActions":false,"showTableSummary":false,"stack":"stack","interactiveScale":false,"zeroScale":true,"size":{"mode":"auto","width":800,"height":600},"format":{},"geoKey":"name","resolve":{"x":false,"y":false,"color":false,"opacity":false,"shape":false,"size":false},"scaleIncludeUnmatchedChoropleth":false,"showAllGeoshapeInChoropleth":false,"colorPalette":"darkGreen","useSvg":false,"scale":{"opacity":{},"size":{}}},"visId":"gw_-1jR","name":"Chart 1"}],"chart_map":{},"workflow_list":[{"workflow":[{"type":"transform","transform":[{"key":"gw_SkCP","expression":{"op":"expr","as":"gw_SkCP","params":[{"type":"sql","value":"(CASE  WHEN (\"KPI_14\" > (0.07)) THEN (1) ELSE (0) END )"}]}}]},{"type":"view","query":[{"op":"aggregate","groupBy":["Longitude","Latitude"],"measures":[{"field":"gw_SkCP","agg":"sum","asFieldKey":"gw_SkCP_sum"},{"field":"KPI_1","agg":"sum","asFieldKey":"KPI_1_sum"},{"field":"KPI_14","agg":"sum","asFieldKey":"KPI_14_sum"}]}]}]}],"version":"0.4.9"}"""
```

Remember that you can also use [Plotly/ChartJS/ApexCharts inside streamlit](https://github.com/JAlcocerT/Streamlit_PoC/tree/main/Utils):

![Streamlit Funnel Chart Plotly](/blog_img/apps/streamlit/streamlit-plotly-funnel.png)