---
title: "R Shiny Apps in a Docker Container"
date: 2022-11-27T23:19:21+01:00
draft: false
tags: ["R","Dashboards","Docker","R-Stocks"]
cover:
    image: "https://socialify.git.ci/JAlcocerT/R_Stocks/image?description=1&descriptionEditable=Learning%20how%20to%20deploy%20Shiny%20apps.&language=1&name=1&owner=1&theme=Auto" # image path/url 
    alt: "R Shiny Apps" # alt text
    caption: "Building Docker Container for Shiny Apps." 
description: 'Building Shiny Docker Containers - It works in my computer (and in yours too!)'
summary: 'Exploring the integration of Docker and R Shiny, focusing on reproducibility in software development. Creating a Shiny Docker image for the R Stocks project to simplify deployment and sharing of our interactive data applications.'    
url: 'building-r-shiny-apps-container-image-with-docker'       
---

# R Shiny Containerized

One of the technologies that I am happy to have found out in the previous years has been [Docker](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/).

> In a nutshell, it avoid the *it works in my computer* moment that we have all experienced.

By harnessing Docker's containerization capabilities, we can encapsulate our [R Shiny applications](https://fossengineer.com/tags/shiny/) and their dependencies, ensuring consistency and easy portability across various environments. 

But I was wondering how to create [my own containerized R Shiny App](https://fossengineer.com/tags/r-stocks/) and the **R-Stocks** projec presented me the perfect opportunity.

## Building R Shiny Apps in Docker

* Docker plays a pivotal role in enabling **reproducible work** by providing a consistent and isolated environment for software development and deployment.
   * Dependency Management: Docker allows you to define and package all the dependencies required for your project within a container. By encapsulating the necessary libraries, frameworks, and tools, you ensure that the exact same environment is replicated across different systems, eliminating compatibility issues and **ensuring consistent behavior**.
   * Portability: Docker containers are highly portable, enabling you to run the same software stack on different machines, operating systems, or cloud platforms. This **eliminates platform-specific discrepancies** and ensures that your work can be replicated regardless of the underlying infrastructure.
   * Collaboration: With Docker, you can easily share your project as a self-contained container. This simplifies collaboration by allowing others to quickly spin up the same environment, work on the project, and **reproduce your results without the need for complex setup or configuration**.

### Pre-Requisites

* Have [Docker installed](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/#how-to-install-docker)
* Have clear which functions/packages your code depends on
   * Make sure that the FROM image that you are using contains a R version that supports all the necessary packages. 
   * For example [yfR](https://cloud.r-project.org/web/packages/yfR/index.html "yFr Repository {rel='nofollow'}"). as of today needs R with at least version 4.
* Better if you also know the specific versions of the packages that make your code work

### R Shiny Apps for X86

Let's start from something simpler, a regular X86 computer. And for this architecture flavour, I could easily find few ways to create our R Shiny App Docker images:

* Starting [from R-Base](https://fossengineer.com/building-r-shiny-apps-container-image-with-docker/#from-r-base)
* Starting [from rocker Shiny Image](https://fossengineer.com/building-r-shiny-apps-container-image-with-docker/#r-shiny-app-in-docker---with-rockershiny-image)
* Starting [from rocker Tideverse Image](https://fossengineer.com/building-r-shiny-apps-container-image-with-docker/#r-shiny-app-in-docker---with-rockertideverse-image)

We will use the build command, together with any of the following Dockerfiles:

```sh
docker build --no-cache --progress=plain -t r_stocks
#DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain -t r_stocks:V1-amd64 --build-arg ARCH=arm64 .
```

#### From R-Base

```Dockerfile
FROM r-base:latest
LABEL maintainer "JAlcocerT <jalcocert@fossengineer.com>"
RUN apt-get update && apt-get install -y --no-install-recommends \
   sudo \
   libcurl4-gnutls-dev \
   libcairo2-dev \
   libxt-dev \
   libssl-dev \
   libssh2-1-dev \
   && rm -rf /var/lib/apt/lists/*


# Install remotes package
RUN R -e 'install.packages("remotes")'


RUN R -e 'install.packages(c("shiny", "plotly", "dplyr","viridis", "tidyr","lubridate","shinythemes","shinyWidgets","DT","bslib","priceR","quantmod"))'
RUN R -e 'install.packages("yfR", dependencies = TRUE)'

# Install specific versions of Shiny and Plotly, along with their dependencies
# RUN R -e 'remotes::install_version("shiny", version = "1.6.0", dependencies = TRUE)'
# RUN R -e 'remotes::install_version("plotly", version = "4.9.3", dependencies = TRUE)'

# Copy app.R to the container
COPY app.R /srv/shiny-server/app.R


# Expose the required port
EXPOSE 3838

# Set the CMD to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/app.R', host = '0.0.0.0', port = 3838)"]
```


#### R Shiny App in Docker - with rocker/Shiny Image

```Dockerfile
FROM rocker/shiny:3.6.1
LABEL maintainer "JAlcocerT <jalcocert@fossengineer.com>"

WORKDIR /srv/shiny-serverRUN apt-get update \
   && apt-get install -y libsasl2-dev libssl-devRUN echo \
 'options(repos=list(CRAN="https://cloud.r-project.org/"))' > \
 ".Rprofile"

RUN R -e 'install.packages(c("shiny", "plotly", "dplyr","viridis", "tidyr","lubridate","shinythemes","shinyWidgets","DT","bslib","priceR","quantmod"))'


RUN R -e 'install.packages("yfR", dependencies = TRUE)'

ADD https://raw.githubusercontent.com/rocker-org/shiny/master/shiny-server.sh /usr/bin/

COPY ./ ./
EXPOSE 3838
RUN chmod a+w .
RUN chmod +x /usr/bin/shiny-server.sh
CMD /usr/bin/shiny-server.sh
```

#### R Shiny App in Docker - with rocker/Tideverse Image


<!-- Dockerfile: 470 segundos -->

Instead of using rocker/shiny:3.6.1, you can use [rocker/tidyverse:3.6.1](https://hub.docker.com/r/rocker/tidyverse) and install the shiny package separately.

This will make your app available on port 3838 without the need for Shiny Server!

```Dockerfile
FROM rocker/tidyverse:4
LABEL maintainer "JAlcocerT <jalcocert@fossengineer.com>"

RUN R -e 'install.packages(c("shiny", "plotly","viridis", "dplyr", "tidyr","lubridate","shinythemes","shinyWidgets","DT","bslib","priceR","quantmod"))'


RUN R -e 'install.packages("yfR", dependencies = TRUE)'


COPY app.R /app.R


EXPOSE 3838


CMD R -e 'shiny::runApp("app.R", port = 3838, host = "0.0.0.0")'
```

#### Running & Pushing the Docker Image

Once the build completes, you can run it with:

```sh
docker run --name r_stocksshiny -p 3838:3838 --restart unless-stopped -d r_stocks
```

And push it to DockerHub with (use your username):

```sh
docker tag r_stocks docker.io/fossengineer/r_stocks:v1-amd64
#docker login
docker push fossengineer/r_stocks:v1-amd64
```

### R Shiny Apps for ARM86

Any of the **tidyverse docker images is available for ARM** at this moment. This is a good chance to learn how to install our packages, but starting from an R Base image with ARM.

I have found [this one](https://hub.docker.com/r/arm64v8/r-base/) to be working for ARM86. And had to take use of [webtops](https://fossengineer.com/selfhosting-webtops-docker/) to discover that it was the **libxml2-dev** the one missing to allow the installation of the [yfR package](https://fossengineer.com/r-yfR-package-guide/).


   <!-- libxml2-dev \ -->

```Dockerfile
FROM r-base:latest
LABEL maintainer "JAlcocerT <jalcocert@fossengineer.com>"
RUN apt-get update && apt-get install -y --no-install-recommends \
   sudo \
   libcurl4-gnutls-dev \
   libcairo2-dev \
   libxt-dev \
   libssl-dev \
   libssh2-1-dev \
   libxml2-dev \
   && rm -rf /var/lib/apt/lists/*

# Install remotes package
RUN R -e 'install.packages("remotes")'

RUN R -e 'install.packages(c("shiny", "plotly","viridis" ,"dplyr", "tidyr","lubridate","shinythemes","shinyWidgets","DT","bslib","priceR","quantmod"))'
RUN R -e 'install.packages("yfR", dependencies = TRUE)'

# Install specific versions of Shiny and Plotly, along with their dependencies
# RUN R -e 'remotes::install_version("shiny", version = "1.6.0", dependencies = TRUE)'
# RUN R -e 'remotes::install_version("plotly", version = "4.9.3", dependencies = TRUE)'

# Copy app.R to the container
COPY app.R /srv/shiny-server/app.R

# Expose the required port
EXPOSE 3838

# Set the CMD to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/app.R', host = '0.0.0.0', port = 3838)"]
```

To build it, we can use:

```sh
#DOCKER_BUILDKIT=0 docker build -t my-image .
#DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain -t r_stocks_arm64 .
DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain -t r_stocks:V1-arm64 .
```



<!-- 
## ARM32

The case is even more challenging.

<https://www.algorist.co.uk/post/how-to-run-r-using-docker-on-raspberry-pi/>

You need to start with the image: **FROM arm32v7/ubuntu**

I had to try it bare metal first


```sh
apt install r-base -y
```

You can see that the version installed is 4.0.4 and install the packages with:


```sh
R #quit with q()
install.packages("yfR", dependencies = TRUE)
install.packages("plotly", dependencies = TRUE)
```

Then install r-base and all the other dependencies like so:

```Dockerfile
FROM ubuntu:latest
ENV TZ=Europe/Madrid

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
   sudo \
   libcurl4-gnutls-dev \
   libcairo2-dev \
   libxt-dev \
   libssl-dev \
   libssh2-1-dev \
   libxml2-dev \
   tzdata \
   && apt-get install -y r-base r-base-dev \
   && rm -rf /var/lib/apt/lists/*

# Install remotes package
#RUN R -e 'install.packages("remotes")'

# Install required R packages
RUN R -e 'install.packages(c("shiny", "plotly", "viridis", "dplyr", "tidyr", "lubridate", "shinythemes", "shinyWidgets", "DT", "bslib", "priceR", "quantmod"))'
RUN R -e 'install.packages("yfR", dependencies = TRUE)'

# Uncomment these lines if you want to install specific versions of Shiny and Plotly
# RUN R -e 'remotes::install_version("shiny", version = "1.6.0", dependencies = TRUE)'
# RUN R -e 'remotes::install_version("plotly", version = "4.9.3", dependencies = TRUE)'

# Copy app.R to the container
COPY app.R /srv/shiny-server/app.R

# Expose the required port
EXPOSE 3838

# Set the CMD to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/app.R', host = '0.0.0.0', port = 3838)"]

```



### Building it


This will help you debug, I was having headaches with a library(yfR) not found because of R version incompatibility, but i was loosing this information as the build process continued.

```sh
#DOCKER_BUILDKIT=0 docker build -t my-image .
DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain -t r_stocks_arm32 .

```

I have noticed that Docker does not use all the CPU cores by default, for that you can use:

```
blaaaaa
```

aaa -->