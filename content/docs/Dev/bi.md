---
title: "BI Analytics"
date: 2025-10-06T10:20:21+01:00
draft: false
description: 'BI use cases and tools'
url: 'BI'
---

Within your D&A Career, you will find [several **OSS BI** Tools](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/):

Most popular within enterprises are: *all of these are paid products*

1. [PowerBI](https://jalcocert.github.io/JAlcocerT/about-powerbi/)
2. [Looker](https://jalcocert.github.io/JAlcocerT/understanding-google-cloud-platform/#what-it-is-looker-modelling-language) 
3. Tableau

<!-- 
{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker" title="Superset Example" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Streamlit PyGWalker Rendered Map with locations..." >}}
{{< /cards >}} -->

Normally, these tools go plugged in the final stage of the data pipelines:

```mermaid
flowchart LR
    %% --- Styles ---
    classDef bronze fill:#EFEBE9,stroke:#8D6E63,stroke-width:2px,color:#3E2723;
    classDef silver fill:#ECEFF1,stroke:#78909C,stroke-width:2px,color:#263238;
    classDef gold fill:#FFFDE7,stroke:#FBC02D,stroke-width:2px,color:#F57F17;
    classDef ai fill:#F3E5F5,stroke:#8E24AA,stroke-width:2px,stroke-dasharray: 5 5,color:#4A148C;
    classDef source fill:#fff,stroke:#333,stroke-width:1px;

    %% --- Sources ---
    subgraph Sources [Data Sources]
        direction TB
        Logs[Logs / IoT]:::source
        DB[Databases]:::source
        APIs[External APIs]:::source
    end

    %% --- The Lakehouse (Medallion) ---
    subgraph Lakehouse [The Data Lakehouse]
        direction LR
        
        %% BRONZE: Raw
        Bronze[("BRONZE<br/>(Raw Ingestion)<br/>As-is Dump")]:::bronze
        
        %% SILVER: Cleaned
        Silver[("SILVER<br/>(Refined)<br/>Cleaned & Enriched")]:::silver
        
        %% GOLD: Aggregated
        Gold[("GOLD<br/>(Curated)<br/>Business Aggregates")]:::gold
    end

    %% --- AI Integration ---
    subgraph AI_Lab [AI & Machine Learning]
        direction TB
        Training(Model Training):::ai
        Inference(AI Agents / RAG):::ai
        Predictions(Predictions / Tags):::ai
    end

    %% --- Consumers ---
    BI[BI Dashboards<br/>& Reports]:::source

    %% --- The Flow ---
    Sources --> Bronze
    Bronze -- "ETL / Cleaning" --> Silver
    Silver -- "Aggregation" --> Gold
    Gold --> BI

    %% --- Where AI Plugs In ---
    
    %% 1. Training happens on Silver (Granular but clean)
    Silver -.->|"Feeds Data"| Training
    
    %% 2. Inference (Agents) read Gold (Context) or Silver (Features)
    Gold -.->|"Context for RAG"| Inference
    
    %% 3. The Feedback Loop: Predictions go back into the Lake
    Training --> Predictions
    Inference --> Predictions
    Predictions -.->|"Enrichment"| Silver
    Predictions -.->|"New Insights"| Gold
```

Depending on your work environment, you could do fully [custom BI](#custom-bi-tools) proposals.

### Custom BI Tools

For a PoC on BI Tools, go for Streamlit:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker" title="Streamlit PoC Post" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Streamlit PyGWalker Rendered Map with locations..." >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-stocks-webapp/#the-charts" title="Marketing Docs" image="/blog_img/dev/pystocks/pystocks-vibed1.png" subtitle="Funnels with Streamlit" >}}
{{< /cards >}}

{{< callout type="info" >}}
Putting together a project like [Streamlit_PoC](https://github.com/JAlcocerT/Streamlit_PoC) allows you to consolidate the Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data...in one place
{{< /callout >}}


<!-- 
![Normalized Value Change of PyStocks Streamlit Version](/blog_img/dev/pystocks/pystocks-vibed1.png) -->

To build a BI Tools even more custom: *with certain UI look and feel, you can **try Flask***

<!-- ![Flask WebApp for the x300](/blog_img/iot/flask/flask-x300-cpu.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-apps-with-flask/" title="Flask and Real Time Data" image="/blog_img/iot/flask/flask-x300-cpu.png" subtitle="Flask WebApp + WebSockets Real Time Temperature Connection working with the x300" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/#compared-with-real-estate" title="Custom Plots for Reporting" image="/blog_img/data-experiments/MCD_dividends_pct_12m.png" subtitle="Sample YFinance based reporting" >}}
{{< /cards >}}

To create interactivity, we have the well known plotly, but also **ApexCharts and ChartJS**.

<!-- ![NodeJS Web App + ApexChartJS](/blog_img/DA/apexchartjs-nodejs.png) -->

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/node-js/chart-generator" title="Sample NodeJS x ApexChartJS Generator" image="/blog_img/DA/apexchartjs-nodejs.png" subtitle="Using NodeJS to generate ApexCharts" >}}
{{< /cards >}}

Both can be combined and create some [cool graphs within SSGs](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/#the-costs-of-a-car), like in HUGO components and also provide interactivity via CSR.

You can potentially make embedable BI components that work on websites or just get the **full power of web apps** when designing these.

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE for WebApps| Docs ↗" >}}
{{< /cards >}}

You could also use these skills when **building funnels** during your [entrepreneurial journey](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/):

<!-- 
![Streamlit Funnel Chart Plotly](/blog_img/apps/streamlit/streamlit-plotly-funnel.png) 
-->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/marketing/#funnels" title="Marketing Docs" image="/blog_img/apps/streamlit/streamlit-plotly-funnel.png" subtitle="Funnels with Streamlit" >}}
{{< /cards >}}