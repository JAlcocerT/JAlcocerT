---
title: "From Wordpress to a Cool Website"
date: 2024-09-23T10:20:21+01:00
draft: false
tags: ["dev"]
summary: 'Migrating Wordpress to Cool Websites. Faster, Cleaner, Better SEO and DIY Design.'
url: 'wordpress-migration-to-ssg'
---

I was talking with my father about websites the other day and...

I realized how much **more we can do with SSG's than with wordpress**.

It all started [trying to add **Web Analytics**](https://fossengineer.com/selfhosting-umami-with-docker/) to the site.

{{< callout type="info" >}}
You can still SelfHost your own WordPress with a VPS
{{< /callout >}}

{{< details title="How to know if a website uses GAnalytics 📌" closed="true" >}}

```sh
wget -qO- https://airgrup.com/ | grep -Eo 'UA-[0-9]+-[0-9]+|G-[A-Z0-9]+'
wget -qO- https://casaensol.pl/ | grep -Eo 'UA-[0-9]+-[0-9]+|G-[A-Z0-9]+' #you see it in the output
```

{{< /details >}}



We wanted to add **Umami Analytics** - The same im using for this site (which is GDPR compliant out of the box and non invasive for the readers).

> It turned out that you need a business suscription to add Plugins (WPCode could have solve it).

We tried to add the Umami script on the wordpress Theme, but the option was also not available.


<!-- 

No need to be a web dev expert, but some tricks with css and components are good to have
https://jalcocert.github.io/JAlcocerT/blog/dev-css/
https://jalcocert.github.io/JAlcocerT/understanding-astro-ssg-components/
 -->

## Why there are better options?

* This is how google sees the templates (the higher rating, the better):

![Wordpress Google Page Speed Desktop](/blog_img/web/jmodels-google-pagespeed-desktop.png)

and for mobile (a responsive site is even more important here):

![Wordpress Google Page Speed Mobile](/blog_img/web/jmodels-google-pagespeed-mobile.png)

* The ping doesnt look so bad actually, but...

![Pinging Wordpress vs SSG](/blog_img/web/ping_comparison.png)

...the http request has a huge gap. And its not this particular website's fault.

We can [use Uptime Kuma](https://fossengineer.com/selfhosting-uptime-Kuma-docker/) to check the **http request response** time for both, Wordpress and Wix official websites:

![Http request Wix](/blog_img/web/uptimekuma-wix.png)

![Http request WP](/blog_img/web/uptimekuma-wp.png)

Observe how for both platforms they provide a ~500ms speed and http requests (these are the ones that we care about as users).

> When you use SSG's, you can expect to have it around ~100ms instead, **x5 faster**

* If you are concerned about the environment, speed also means less processing required, hence **less emissions**!

![Wordpress Carbon vs SSG](/blog_img/web/carbon-comparison.png)

{{< hextra/feature-grid >}}
 
{{< hextra/feature-card
  title="Google Speed Test"
  subtitle="Test the speed and performance with PageSpeed Insights."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://pagespeed.web.dev/"
>}}

{{< hextra/feature-card
  title="Website Carbon"
  subtitle="Website’s carbon footprint and environmental impact."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(142,53,74,0.15),hsla(0,0%,50%,0));"
  link="https://www.websitecarbon.com/"
>}}

{{< hextra/feature-card
  title="Web-Check"
  subtitle="Performance and uptime using Web-Check's analytics tool."
  style="background: radial-gradient(ellipse at 50% 80%,rgba(221,210,59,0.15),hsla(0,0%,100%,0));"
  link="https://web-check.xyz/"
>}}

{{< /hextra/feature-grid >}}

Also, you can do cool thinks like:

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-umami-with-docker/" title="GDPR Compliance Web Analytics with Umami" >}}
{{< /cards >}}
{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/dev-forms/" title="Build your audience with Newsletter & Forms" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-use-mermaid-diagrams/" title="Incorporate Diagrams easily in your posts" >}}
{{< /cards >}}

### SSG Alternatives to Wordpress

* https://github.com/CaiJimmy/hugo-theme-stack
  * Supports https://photoswipe.com/ out of the box!
  * https://github.com/CaiJimmy/hugo-theme-stack-starter

> That one reminded my to the Jekyll Chirpy Theme, but it **uses HUGO**

* https://github.com/Darthagnon/hugo-easy-gallery



<!-- 
https://alto.ghost.io/
https://massively.ghost.io/
  https://github.com/TryGhost/Massively -->

#### SEO Tools for Wordpress

I dont use WP myself, but...


{{< details title="Wordpres | SEO Stuff from a marketer 📌" closed="true" >}}


On-Page SEO Tools:

- **Rank Math**  
  An SEO plugin for WordPress to help optimize your website’s on-page SEO.
  
- **SEO Meta in One Click (Chrome Extension)**  
  Quickly analyze meta tags and H1 headings for SEO optimization.

- **SEO Minion (Chrome Extension)**  
  Provides various SEO insights including "People Also Asked" (PAA) data.

- **Anchor Text**  
  Use relevant anchor text to link to other pages on your site to improve internal linking.

**Image Optimization**

- **Kraken.io**  
  A tool to compress images like .jpg files for faster page load times.

Authority & Analytics
- **Moz Bar (Chrome Extension)**  
  Helps check **Page Authority (PA)** and **Domain Authority (DA)**. Compete with websites that have DA 25-30 when starting a new site.

- **Keyword Surfer (Chrome Extension)**  
  Provides search volume data directly in Google search results.

- **Keywords Everywhere (Chrome Extension)**  
  Displays search volume, CPC, and competition data.

Advanced Google Search

- Use `site:yourwebsite.com` in Google to see indexed pages.
- Ensure external links open in a new tab and are marked as "no follow" where necessary.

Featured Images & Copyright
- Search for images using **Creative Commons** licenses to ensure proper rights usage.

Free SEO Tools & Resources

1. **Google Search Console**  
   Track your site’s search performance and monitor SEO issues.

2. **Ubersuggest**  
   Free keyword and competitive analysis tool with limited daily usage.

3. **AnswerThePublic**  
   Get popular search queries and keywords in your niche.

4. **Screaming Frog**  
   Free version allows crawling of up to 500 URLs for technical SEO audits.

5. **Google PageSpeed Insights**  
   Analyze your website's speed and get suggestions for improvement.

Other Notes:
- Proxy-related resources like **cerveza.gratis** or **disfruta badajoz**.
- Check out [this app](https://joseo20-gpt.streamlit.app/) for more insights.

{{< /details >}}



### The Challenges

Writing posts on md a IDE...that can cause some friction.

I proposed to have a look to:

* https://vscode.dev/
  * Alternatively Github Codespaces or Gitlab Web IDE can do
  * You can also provide [VSCode as a container](https://github.com/JAlcocerT/Docker/blob/main/Dev/vscode-server_Docker-compose.yml)
* letsMarkdown

{{< details title="A quick look on how to use markdown 📌" closed="true" >}}

```sh
docker run --rm -dp 3030:3030 cveinnt/letsMarkdown #https://github.com/Cveinnt/LetsMarkdown.com
```

{{< /details >}}

You can also setup [vscode as a container](https://github.com/JAlcocerT/Docker/blob/main/Dev/vscode-server_Docker-compose.yml)

{{< details title="Setup HUGO on VSCode container 📌" closed="true" >}}

* https://github.com/gohugoio/hugo/releases

```sh
sudo apt update -y
sudo apt install wget

#install go
wget https://go.dev/dl/go1.22.5.linux-arm64.tar.gz
sudo tar -C /usr/local -xzf go1.22.5.linux-arm64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.bashrc
go version

#install hugo: example v0.108
# wget https://github.com/gohugoio/hugo/releases/tag/v0.108.0/hugo_extended_0.108.0_linux-amd64.deb -O hugo_latest.deb
# wget https://github.com/gohugoio/hugo/releases/download/v0.117.0/hugo_extended_0.117.0_linux-arm64.deb -O hugo_latestarm.deb

sudo dpkg -i hugo_latest.deb
hugo version 
#sudo dpkg -r hugo
```

{{< /details >}}

## How to Migrate WordPress

{{< details title="Check that the SiteMap of a WP 📌" closed="true" >}}

```sh
#curl -s https://example.com/sitemap.xml -o /dev/null -w "%{http_code}\n"
curl -s https://jmodels.net/sitemap.xml -o /dev/null -w "%{http_code}\n" #hugo paper mod has it

#optional - check robots.txt
curl -s https://jmodels.net/robots.txt | grep -i sitemap #look for sitemap direction
curl -s https://jmodels.net/robots.txt | head -n 10 #see the first 10 lines
```

{{< /details >}}

### Scrapping Wordpress Content

Let's get started with the **wordpress migration**.

* [Sample FireCrawl Scrap](https://gitlab.com/fossengineer1/py_vacations/-/blob/main/Z_Scrap_firecrawl/firecrawl_test2.py?ref_type=heads)

{{< dropdown title="Broken links? How to Use LinkChecker with Docker ⏬" closed="true" >}}

* Use LinkChecker with the [GHCR Container Image](https://github.com/linkchecker/linkchecker/pkgs/container/linkchecker)

```sh
# docker run --rm -it -u $(id -u):$(id -g) ghcr.io/linkchecker/linkchecker:latest --verbose https://www.example.com

podman run --rm -it ghcr.io/linkchecker/linkchecker:latest --verbose https://jmodels.net/ > linkchecker_jmodels.txt
```

To run linkchecker with docker-compose:

```yml
services:
  linkchecker:
    container_name: linkcheck
    image: ghcr.io/linkchecker/linkchecker:latest
    command: tail -f /dev/null  # Keep container alive
    stdin_open: true            # Interactive mode
    tty: true                   # Allocate a pseudo-TTY
    # user: "${UID}:${GID}"       # Run as current user
    # environment:
    #   - UID=${UID}
    #   - GID=${GID}
    volumes:
      - ./output:/output        # Bind mount a local directory for output
    restart: "no"               # Do not restart after stopping
```

And just:

```sh
#UID=$(id -u) GID=$(id -g) docker-compose up -d
docker exec -it linkcheck /bin/sh
linkchecker --verbose https://jmodels.net/ > /output/linkchecker_jmodels.txt
```


{{< /dropdown >}}

{{< callout type="info" >}}
  A post of what I learnt about [Scrapping Tools](https://github.com/JAlcocerT/Scrap_Tools), documented in this post the latest tech for scrap
{{< /callout >}}

<!-- 
## AgencySwarm

Web Browsing like human. With GPT4.

https://www.youtube.com/watch?v=Yidy_ePo7pE

* https://github.com/VRSEN/agency-swarm - FOSS, but using GPT4
* Embedding customs GPT - https://www.oai-widget.com/


### a browsing agent, fully in Py and GPT4 under the hood

* Selenium
* Scroll...

### gpt4 web scraping with (vision API) - Needs js and py + close system

https://www.youtube.com/watch?v=VeQR17k7fiU
https://www.youtube.com/watch?v=PMLg6Rr8fcU

* https://github.com/unconv/gpt4v-browsing -->

<!-- 
Puppeteer what?

- **Puppeteer** is a **Node.js library** developed by Google, used for **automating and interacting with web pages** using a headless Chrome or Chromium browser.
- **Key functionalities** include:
  - **Headless Browsing**: Operates Chrome or Chromium without a graphical user interface, ideal for background automation tasks.
  - **Web Scraping**: Enables data extraction from websites through navigation and interaction with page elements.
  - **Automated Testing**: Useful for testing web applications by simulating user actions like clicks and form submissions.
  - **Screenshots and PDF Generation**: Captures screenshots and generates PDFs from web content, beneficial for reports or documentation.
  - **Performance Monitoring**: Measures web page performance metrics such as load times and resource usage.
  - **Accessibility Testing**: Incorporates tools to ensure web pages are accessible to users with disabilities.
- **Popularity**: Favored for web scraping and automated testing due to its ease of use and Chrome integration.
- **Getting Started**: Install via npm or yarn, then write scripts to automate browser interactions and perform tasks on web pages. -->

### Creating the markdown posts with AI

They have to **keep the original content**, but split it in English/SPanish in different files

## Theme Proposal - HUGO

We saw a few interesting ones:
* https://github.com/manuelernestog/astropod
* Astro verse, [ex VisVRS](https://verse-astro.vercel.app/)

The [fuwari static blog made with Astro](https://github.com/saicaca/fuwari)...


{{< callout type="info" >}}
Testing it with Github and CloudFlare: <https://jmodels-web.pages.dev/>
{{< /callout >}}

---

## FAQ

{{< details title="Free SSG Deployment 📌" closed="true" >}}

* With [Firebase Hosting](https://fossengineer.com/hosting-with-firebase/)

```sh
firebase init #configure files for firebase hosting / public directory is normal public for HUGO and dist for Astro/nodes
firebase deploy #you will get something like -> https://jalcocertech.web.app/
```

> Yes, **free web.app subdomain**!

* With [Cloudflare Pages](https://fossengineer.com/hosting-with-cloudflare-pages/)

> Here you get a **pages.dev subdomain**, also for free

* You can also try **Github Pages**

{{< /details >}}

### Is my website performing well?

{{< cards cols="3" >}}
  {{< card link="https://pagespeed.web.dev/" title="PageSpeed Insights" >}}
  {{< card link="https://search.google.com/search-console/" title="Google Search Console" >}}
  {{< card link="https://trends.google.es/trends/" title="Google Trends" >}}  
{{< /cards >}}
{{< cards cols="1" >}}
  {{< card link="https://www.websitecarbon.com/" title="Website Carbon Benchmark" >}}
{{< /cards >}}
{{< cards cols="2" >}}
  {{< card link="https://github.com/Lissy93/web-check" title="Web Check - GitHub" >}}
  {{< card link="https://web-check.xyz/" title="Web Check Tool" >}}
{{< /cards >}}

* https://github.com/Lissy93/web-check
    * https://web-check.xyz/

* You will need **proper favicons**
    * https://mariushosting.com/how-to-install-favicon-downloader-on-your-synology-nas/
    * https://github.com/seadfeng/favicon-downloader


{{< details title="Do I have broken links? 📌" closed="true" >}}

```sh
#podman run --rm -it ghcr.io/linkchecker/linkchecker:latest --verbose https://fossengineer.com > linkchecker_output.txt

docker run --rm -it -u $(id -u):$(id -g) ghcr.io/linkchecker/linkchecker:latest --verbose https://www.example.com
```

* Option 2: with the [python Package](https://pypi.org/project/LinkChecker/)

```sh
pip3 install linkchecker #Check links in web documents or full websites
```

You will get a report with what’s link working and what not when it comes to Links in your Site.

{{< /details >}}

### How to have email with your Domain

First Step...

{{< details title=" Get a Domain! 📌" closed="true" >}}

- [Cloudflare Domains](https://www.cloudflare.com/products/registrar/)
- [Porkbun](https://porkbun.com/)
- [Squarespace Domains](https://www.squarespace.com/domains)
- [GoDaddy](https://www.godaddy.com/domains)
- [Namecheap](https://www.namecheap.com/domains/)

> Lately im using Cloudflare and Porkbun

{{< /details >}}

{{< details title="2- Email with your domain with Google and Cloudflare 📌" closed="true" >}}

1. Add your Domain to Cloudflare
2. Go to Cloudflare UI and select a domain -> Email -> Email Routing
3. Add a routing rule (this will fwd emails with your custom domain to a particilar mail - it works one way for now)
4. To send emails from custom domains **using gmail servers** - go to the Gmail UI -> Settings -> See all Settings - we will add it at `account and import section` -> Send email as - Add a new email address
5. We need an Gmail App password - Go to Google Account and search for `app password`, just create one
6. Add the new email address and hit next -> Then change the SMTP Server (from cloudflare to `smtp.gmail.com`, port 587), add the password you have created and as username is your original gmail address. Leave TLS ticked and hit add.

> **Kudos** to [CodingEntrepreneur's video](https://www.youtube.com/watch?v=NmXWA08ly_s) for showing the process to send emails with our domain (using smtp.gmail.com)

{{< /details >}}

> With porkbun works similarly, just replace `fwd1.porkbun.com` to `smtp.gmail.com` when adding it as per the guide above.

---

### Interesting web related stuff I got to know recently

* Static Websites with python: **Check Nikola**, the SSG written in python
* [Coding For Entrepreneur Github](https://github.com/codingforentrepreneurs?tab=repositories)!

* **Other ways to get a personal blog**
  * [btw](https://github.com/btw-so/btw)
  * [Ghost](https://fossengineer.com/selfhosting-ghost-docker/)
  * [Wordpress](https://fossengineer.com/selfhosting-wordpress-docker/)
  * [Grav](https://fossengineer.com/selfhosting-grav-docker/)