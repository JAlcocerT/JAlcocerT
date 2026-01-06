---
title: "BI Analytics"
date: 2025-10-06T10:20:21+01:00
draft: false
description: 'BI use cases and tools'
url: 'BI'
---

Within your [D&A Career](https://jalcocert.github.io/JAlcocerT/career/), you will find several **BI** Tools.

In the end, its all about: *the goal, not...the tools*

| Step | Phase | Activity |
|------|-------|----------|
| **1** | Discovery | Understand client needs, goals, challenges, and expectations |
| **2** | Data | Gather and analyze relevant data, perform cleaning and exploration |
| **3** | Hypothesis | Develop initial hypotheses based on client needs and data |
| **4** | Method | Select appropriate analytical methods and tools |
| **5** | Analysis | Perform the analysis, document process and results |
| **6** | Insights | Identify key patterns, trends, and findings |
| **7** | Design | Organize insights into a coherent narrative |
| **8** | Iterate | Share with client, gather feedback, refine |
| **9** | Present | Deliver the final data story with clear visuals |
| **10** | Follow-up | Measure success, determine next steps |


Every KPI should follow the SMART framework:

| Criterion | Description | Example |
|-----------|-------------|---------|
| **S**pecific | Clear and well-defined goals | "Develop a KPI dashboard for sales" vs "improve analysis" |
| **M**easurable | Quantifiable metrics or observable outcomes | Track user engagement increase, time saved |
| **A**chievable | Realistic given resources, skills, and time | Challenging but within reach |
| **R**elevant | Aligned with business objectives | Direct impact on key business areas |
| **T**ime-bound | Specific deadline or timeframe | "Complete by Q2" creates urgency |

You will be building KPI across Categories:

| Category | Focus | Examples |
|----------|-------|----------|
| **Financial** | Revenue, profitability | Revenue growth, profit margin, ROI |
| **Customer** | Satisfaction, retention | NPS, churn rate, customer lifetime value |
| **Operational** | Efficiency, quality | Processing time, error rate, throughput |
| **Growth** | Expansion, reach | Market share, new customers, lead conversion |


Most popular within enterprises are: *all of these are paid products*

1. [PowerBI](https://jalcocert.github.io/JAlcocerT/about-powerbi/)
2. [Looker](https://jalcocert.github.io/JAlcocerT/understanding-google-cloud-platform/#what-it-is-looker-modelling-language) 
3. Tableau

Sometimes, the [OSS BI Tools](https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker/) will come into the picture:

4. Grafana
5. Others, like Metabase, Redash, Superset... 

<!-- 
{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/setup-bi-tools-docker" title="Superset Example" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Streamlit PyGWalker Rendered Map with locations..." >}}
{{< /cards >}} -->

Normally, these tools go plugged in the **final stage of the data pipelines**: *aka gold*

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

For a PoC on BI Tools, just go for Streamlit: *data centered plus its speed of iterations around a good data model is unmatched*

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker" title="Streamlit PoC Post" image="/blog_img/apps/streamlit/st_pygwalker_map.png" subtitle="Streamlit PyGWalker Rendered Map with locations..." >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-stocks-webapp/#the-charts" title="Marketing Docs" image="/blog_img/dev/pystocks/pystocks-vibed1.png" subtitle="Funnels with Streamlit" >}}
{{< /cards >}}

{{< callout type="info" >}}
Putting together a project like [Streamlit_PoC](https://github.com/JAlcocerT/Streamlit_PoC/tree/main/Utils) allows you to consolidate the Rendering Plotly, MermaidJS, QR, ChartJS, ApexCharts, PyGWalker with OSM geolocation data...in one place
{{< /callout >}}


<!-- 
![Normalized Value Change of PyStocks Streamlit Version](/blog_img/dev/pystocks/pystocks-vibed1.png) -->

To build a BI Tools even more custom: *with certain UI look and feel, you can **try Flask***

<!-- ![Flask WebApp for the x300](/blog_img/iot/flask/flask-x300-cpu.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-apps-with-flask/" title="Flask and Real Time Data" image="/blog_img/iot/flask/flask-x300-cpu.png" subtitle="Flask WebApp + WebSockets Real Time Temperature Connection working with the x300" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-financial-data-with-yfinance/#compared-with-real-estate" title="Custom Plots for Reporting" image="/blog_img/data-experiments/MCD_dividends_pct_12m.png" subtitle="Sample YFinance based reporting" >}}
{{< /cards >}}

Or [for stonks](https://jalcocert.github.io/JAlcocerT/py-stonks/#from-data-in-motion-to-pystonks):

![Flask web app DataInMotion Twitter](/blog_img/dev/pystocks/libreportfolio-plots-datainmotion.png)

To create interactivity, we have the well known plotly, but also **ApexCharts and ChartJS**.

<!-- ![NodeJS Web App + ApexChartJS](/blog_img/DA/apexchartjs-nodejs.png) -->

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/node-js/chart-generator" title="Sample NodeJS x ApexChartJS Generator" image="/blog_img/DA/apexchartjs-nodejs.png" subtitle="Using NodeJS to generate ApexCharts" >}}
{{< /cards >}}

![Astro real estate CSR ChartJS](/blog_img/biz/RE/vibecoded-calc-chartjs.png)

Both can be combined and create some [cool graphs within SSGs](https://jalcocert.github.io/JAlcocerT/buying-car-data-analytics/#the-costs-of-a-car), like in HUGO components and also provide interactivity via CSR.

You can potentially make embedable BI components that work on websites or just get the **full power of web apps** when designing these.

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/" title="Webs 101 | Docs ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/dev/fe-vs-be/" title="FE vs BE for WebApps| Docs ↗" >}}
{{< /cards >}}

You could also use these skills when **building funnels** during your [entrepreneurial journey](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/):

> PS Reflex has very cool funnels: https://reflex.dev/docs/library/graphing/charts/funnelchart/

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers/" title="Offers | Docs ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/marketing/" title="Marketing | Docs ↗" icon="book-open" >}}
{{< /cards >}}

<!-- 
![alt text](/blog_img/apps/reflex/reflex-stocks-sample.png) -->

<!-- 
![Streamlit Funnel Chart Plotly](/blog_img/apps/streamlit/streamlit-plotly-funnel.png) 
-->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/marketing/#funnels" title="Marketing Docs" image="/blog_img/apps/streamlit/streamlit-plotly-funnel.png" subtitle="Funnels with Streamlit" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/#reflex-sample-apps" title="Marketing Docs" image="/blog_img/apps/reflex/reflex-stocks-sample.png" subtitle="Funnels with Streamlit" >}}
{{< /cards >}}

You can also create a quick [mermaidJS sankey of on boarding flows](https://mermaid.live/edit#pako:eNptksFuwjAMhl-l8mlIEUrSNqW5DbggbRIS2mXqJSOmVKMJCum2DvHuS4so07pTYvv__VmJz7C1GkFCYU7KvGNbmCdldGXKaK1KJJuqNNHLkWQp_VN5fAuRNaijh40PiYhNCO9UhbmZ-nNliKD0nhz5-ISwX76gX9U16kp5jNaN2-7VCUmc0nt97uznKQxy4w3xEg-qDZ0HG-vIQ3mEjgf0P8iFNR_ofKeeNy26yXWIEWOsC1QgULpKg_SuQQI1ulp1IZwLE0UF-D3WWIAMV4071Rx8Eb7gEmxHZV6trW9OZ5tyD3KnDgEFzVGHGZeVKp26S9BodAvbGA8y7TuAPMMXSDYT0zxhPE5FEieU8xmBFiSnfEpzNuOcJ3mWCn4h8N0z6VRkucjSlOWJEAmljEB4F2_d83VN-m25_ABw1bbl).


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/node-js/apexchart-generator" title="ApexCharts Node Sample ↗" icon="github" >}}
    {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/chartbrew" title="ChartBrew | Docker Config 🐋 ↗" >}}
{{< /cards >}}

* Shiny in Python
  * <https://shiny.rstudio.com/py/gallery/>
  * <https://shiny.rstudio.com/py/gallery/>

<!-- 
```mermaid
sankey
Landing Page,Sign Up,750
Landing Page,Abandoned (Stage 1),250

Sign Up,Sign In,600
Sign Up,Abandoned (Stage 2),150

Sign In,Immediate Purchase,350
Sign In,Browsing,250

Browsing,Delayed Purchase,100
Browsing,Abandoned (Stage 3),150

Immediate Purchase,Converted (Buyer),350
Delayed Purchase,Converted (Buyer),100
``` -->