---
title: "R Stocks: Interactive Stock Analysis with R Shiny"
date: 2022-11-27T23:20:21+01:00
draft: false
tags: ["R","Dashboards","R-Stocks"]
cover:
    image: "https://socialify.git.ci/JAlcocerT/R_Stocks/image?description=1&descriptionEditable=Shiny%20Dashboard%20that%20displays%20free%20available%20financial%20information.%20%0A%0A&font=Inter&name=1&owner=1&pattern=Solid&theme=Auto" # image path/url 
    alt: "R Stocks" # alt text
    caption: "Building an interactive R Shiny dashboard that displays financial information." # display caption under cover
editPost:
    URL: "https://github.com/JAlcocerT/R_Stocks"
    Text: "Suggest Changes" # edit text
    appendFilePath: false # to append file path to Edit link
description: "R Stocks - R Shiny Interactive Dashboard (Web App) that displays free available financial information."
url: 'R-Stocks'
isPinned: false
---

An interactive R Shiny App that revolutionizes the way public financial information is displayed.

Built on top of well-known R packages for financial analysis: yfR, QuantMod, PriceR and Quandl

## R Stocks

After some time of using R and loving it, I was wondering if there was any [open source project](#the-app-r-stocks) combining some of my favourite packages to easily get **financial data and have it displayed interactively** in Shiny Dashboard.

Since I found nothing on Github, I decided to start it myself - *This is how the [R Stocks project](#the-app-r-stocks) started*.


{{< callout type="info" >}}
R/Stocks [Source Code](https://github.com/JAlcocerT/R_Stocks). Deploy with [GHCR image](https://github.com/JAlcocerT/R_Stocks/pkgs/container/r-stocks) or [build a **container DIY** version](https://github.com/JAlcocerT/R_Stocks/tree/main/Z_Deploy_Me)
{{< /callout >}}

With such a project, you not only get the chance to create something cool but also to learn and discover great tools.

* Libraries that are used to fetch the main financial data: 
    * YfR - [My guide on yfR](/JAlcocert/r-yfR-package-guide/)
    * Quantmod - [My guide on quantmod](/JAlcocert/r-Quantmod-package-guide/)
    * PriceR - [My guide on priceR](/JAlcocert/r-priceR-package-guide/)
    * Quandl - [My guide on quandl](/JAlcocert/r-quandl-package-guide/)


And of course I am also using **Plotly and Shiny** for the visualization and interactive dashboard building.

## The App: R Stocks

* More about R_Stocks:
    * R Stocks **Project Details**:
        * R_Stocks{{< newtab url="https://github.com/JAlcocerT/R_Stocks" text=" Source Code at Github" >}}
        * License: {{< newtab url="https://github.com/JAlcocerT/R_Stocks?tab=GPL-3.0-1-ov-file#readme" text="GPL-3.0" >}} 📜
    * **Disclaimer:** ☝️ 
        * This is just **a Shiny Dashboard** sample that displays freely available financial information.
        * It's important understand that the dashboard is **NOT created to provide financial advice** ❗.

- 📊 **Interactive Data Visualization:**
  - I chose Shiny Dashboard for its ability to create interactive and dynamic visualizations of data, enhancing user the insights.

- 🚀 **Deployment:**
  - Shiny Dashboard provides an easy deployment process, whether [hosting on a server](##how-can-i-self-host-r-stocks) or sharing as a standalone application, ensuring accessibility for users.

{{< dropdown title="And few other Reasons that made me user R Shiny👇" closed="true" >}}

- 🔄 **Real-time Updates:**
  - Shiny Dashboard enables real-time updates of the dashboard as new data becomes available, crucial for monitoring live data feeds.

- 🎨 **Customization:**
  - Shiny Dashboard offers extensive customization options, allowing me to tailor the interface to meet specific user needs with custom styling and interactive elements. 
  - Yes, I was playing a little bit with CSS 🙈

- 🔗 **Integration with R:**
  - Shiny Dashboard seamlessly integrates with [R Language](), leveraging the language's power for data manipulation, analysis, and visualization within the dashboard environment.


{{< /dropdown >}}

The R Stock App has right now **six tabs**:
* [Selected Stocks](#interactive-stocks-analysis-with-r) Performance Overview
* [Dividends Overview](#interactive-dividend-analysis-with-r)
* A look to some [global indexes](#interactive-indexes-analysis-with-r)
* How about [commodities](#interactive-commodities-analysis-with-r)?
* What has been FIAT currencies doing?
* Oh, yep, some inflation coming


### Interactive Stocks Analysis with R 

In the first tab, you will have available general information of the selected tickers:

The first panel is just using the **yfR** library to get the data on **historical value trends** displayed:

{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - StocksPriceEvolution.JPG">}}

The panels below, are using **QuanDL**, so remember to have your API_key available:

{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - GrossMarginEvolution.JPG">}}


{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - DEBTASSETSEvolution.JPG">}}


{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - EVEBITDAEvolution.JPG">}}


{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - DEBTASSETSEvolution.JPG">}}


{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - EBITDAMarginEvolution.JPG">}}


### Interactive Dividend Analysis with R

In the second tab of the dashboards, you can find information related to the historical dividends per selected ticker.

This panels have been possible thanks to **QuantMod**, where we can get access to **historical dividend data** and then create the following:

{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks -DividendEvolution.JPG">}}


{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks -DividendGrowthDistribution.JPG">}}


{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - HistoricalYieldEvolution.JPG">}}

{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - HistoricalYieldDistribution.JPG">}}

Also, thanks to **QuanDL**, we can have access to some interesting ratios concerning dividends:

{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - PayoutRatioEvolution.JPG">}}


### Interactive Indexes Analysis with R

Once again, thanks to **yfR** we can query general market indexes, like SP500, DJ, Nikkei and check on how were the markets behaving globally at a given moment:

{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - IndexPriceEvolution.JPG">}}

### Interactive Commodities Analysis with R

Another interesting source of information can be created when comparing the price of commodities with the one of any of the indexes.

Thanks to **yfR** and this view, we can see the evolution in the  relation of any pair index/commodity. 

{{< gist jalcocert 879fecd6ae9bccaa0175d1c180a032cd "RStocks - Index2ComEvolution.JPG">}}

## Conclusions for RStocks

This is been an interesting ride: EDA, Flexdashboards, Shiny, Containers...

But with a lot of learnings and food for thought.

{{< details title="Ive also added a FlexDashboard to the Repo! 👇📌" closed="true" >}}

This code snippet is an R Markdown document designed to create an interactive dashboard using the `flexdashboard` package. Let's break down what you need to use this app:

**1. R and RStudio:**

* **R:** This is the programming language that will execute the code. You'll need to have R installed on your computer. You can download it from the official CRAN website (Comprehensive R Archive Network).
* **RStudio:** This is an integrated development environment (IDE) for R. It makes writing and running R code much easier. While not strictly required, it's highly recommended. You can download RStudio Desktop from the RStudio website.

**2. R Packages:**

The code uses several R packages. You'll need to install these packages if you don't already have them. You can install them using the `install.packages()` function in the R console:

```R
install.packages(c("flexdashboard", "ggplot2", "readr", "dplyr", "tidyr", "rmarkdown"))
install.packages("plotly")
```

* **flexdashboard:** This package is used to create interactive dashboards.
* **ggplot2:** This package is used for creating data visualizations (graphs).
* **readr:** This package is used for reading data files (specifically CSV files in this case).
* **dplyr:** This package is used for data manipulation (filtering, transforming, etc.).
* **tidyr:** This package is used for data cleaning and tidying.
* **rmarkdown:** This package is used for creating dynamic documents (like this dashboard).

**3. Data File (data_sp500.csv):**

* The code reads data from a CSV file named `data_sp500.csv`. This file should contain historical data for the S&P 500 index, with at least two columns:
    * `Date`: The date of the data point.
    * `SP500`: The value of the S&P 500 index on that date.
* This file must be located in a subdirectory named `data` within the same directory as your R Markdown file. So the file path will be `./data/data_sp500.csv`
* The date column must be formatted as YYYY-MM-DD.

**4. How to Use the App:**

1.  **Save the Code:** Save the code as an `.Rmd` file (e.g., `R_Flexdashboards_Cycles.Rmd`).
2.  **Place Data File:** Create a folder named "data" in the same directory as the .Rmd file, and place the data_sp500.csv inside the data folder.
3.  **Open in RStudio:** Open the `.Rmd` file in RStudio.
4.  **Run the Code:**
    * You can run individual code chunks by clicking the "Run" button within each chunk.
    * To create the entire dashboard, click the "Knit" button at the top of the RStudio window. This will generate an HTML file containing the interactive dashboard.
5.  **View the Dashboard:** Open the generated HTML file in your web browser.

**Key Points:**

* The code performs data analysis on the S&P 500 data, classifying periods as "Boom" or "Burst" based on consecutive decreases in the index.
* It then generates visualizations (line graph, histograms) to show the trends and characteristics of these economic cycles.
* The setwd() command is commented out. If you have issues with the file path, you can uncomment that line, and change the directory within the parenthesis to the absolute path of the directory that contains your .Rmd file, and your data folder.
* The render commands are also commented out. These are commands that can be run from the R console to create the html output. The knit button in R studio is the easiest way to create the html output.


{{< /details >}}

> See the RStocks FlexDashboard in action: https://jalcocert.github.io/R_Stocks/


---

## FAQ


### How Can I try the R Stocks Shiny App?

**Ready to Try?**: If you've read this far, you're probably eager to give the app a try.

Try the R Stocks Shiny App (baremetal):

1. Install R Language
2. Install the required Packages:

```sh
RUN R -e 'install.packages(c("shiny", "plotly", "viridis","dplyr", "tidyr","lubridate","shinythemes","shinyWidgets","DT","bslib","priceR","quantmod"))'

RUN R -e 'install.packages("yfR", dependencies = TRUE)' #this one will work when you install its deps
```
**Docker Image**: The Docker image I'm using is available on DockerHub: [fossengineer/r_stocks](https://hub.docker.com/repository/docker/fossengineer/r_stocks)

> I've recommend to do it using the latest Docker image.

**What if the site can't be reached?**

1. **Temporary Unavailability**: If the site can't be reached, it might be because my Raspberry Pi isn't powered on at the moment or I've decided to free up resources for other projects.
2. But don't worry, you can also [self-host R_Stocks](#how-can-i-self-host-r-stocks) on your own system.


### How can I self-host R-Stocks?

See the `Z_Deploy_me` [folder of the repository](https://github.com/JAlcocerT/R_Stocks/tree/main/Z_Deploy_Me).

{{< dropdown title="Option 1 - With Containers👇" closed="true" >}}

```yml
version: '3.8'
services:
  r_stocks_shiny:
    image: fossengineer/r_stocks
    container_name: r_stocks
    ports:
      - 3838:3838
    restart: unless-stopped 
```

{{< /dropdown >}}

* **Self-hosting Effort**: Host your own free and open-source version of this R Shiny App at home using Docker and Cloudflare tunnels.
  * **Option 1**: 
      * **Pros**: Full control over the deployment process & can customize it to fit your needs perfectly.
      * **Cons**: Requires some technical expertise to set up and maintain the environment.
  * **Option 2**: You can use the Docker image I've already built:
      * **Pros**: Quick and easy to get started, no need to build the image yourself ✅
      * **Cons**: Less flexibility compared to self-hosting from source, may not be tailored to your specific requirements.


### How to deploy R Stocks with Docker and a GUI?

You can [install **Portainer with Docker**](https://jalcocert.github.io/JAlcocerT/why-i-love-containers/#container-tech-is-cool) and use the configuration above to self-host your own instance of **RStocks** with a GUI to manage the container.
