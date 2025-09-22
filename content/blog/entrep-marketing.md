---
title: "Leads and marketing automation"
date: 2025-09-22T06:20:21+01:00
draft: false
tags: ["CRM","Scrapping","Lead Enrichment","Firecrawl"]
url: 'software-for-marketing-agencies'
description: 'sell'
---

**Tl;DR**

Today it seems all about [lead enrichment](https://www.firecrawl.dev/blog/fire-enrich)


https://github.com/punkpeye/awesome-mcp-servers?tab=readme-ov-file#marketing

https://github.com/gomarble-ai/facebook-ads-mcp-server

**Intro**

I started the day with a core believe: wordpress sites are meh

After this sync with couple of marketers - That changed. See this landing: https://genkinfy.com/

<!-- https://youtu.be/qQ13MKLfqYQ -->

{{< youtube "qQ13MKLfqYQ" >}}


<!-- 
https://esim.holafly.com/ - landing with a very clear header
slubnechwile.com -->

<!-- ---
title: "Firecrawl: The Ultimate Web Crawling and Scraping Solution"
date: 2025-09-21
draft: false
tags: ["web scraping", "data extraction", "automation", "Firecrawl", "n8n integration"]
description: 'Discover how Firecrawl revolutionizes web crawling and data extraction with its powerful features and seamless n8n integration.'
url: 'firecrawl-web-scraping'
--- -->

**Tl;dr**
Firecrawl is a powerful web crawling and scraping solution that makes data extraction from websites simple and efficient, with excellent integration capabilities with n8n for automation workflows.


{{< details title=" What is Firecrawl? + n8n 📌" closed="true" >}}

Firecrawl is an open-source, high-performance web crawler and scraper designed for developers and data professionals. It's built to handle modern web technologies, including JavaScript-rendered content, while being respectful of website terms of service.

Key Features

- **Modern Web Support**: Handles SPAs and dynamic content with ease
- **Respectful Crawling**: Built-in rate limiting and robots.txt compliance
- **Structured Data Extraction**: Automatic extraction of structured data using AI
- **Distributed Architecture**: Scale your crawling operations horizontally
- **n8n Integration**: Seamlessly connect with your n8n workflows

Why Choose Firecrawl?

1. **Developer Friendly**
   - Simple REST API
   - Comprehensive documentation
   - Multiple language SDKs

2. **Powerful Extraction**
   - CSS and XPath selectors
   - Automatic content type detection
   - Built-in proxy rotation

3. **Scalable**
   - Distributed crawling
   - Queue-based architecture
   - Cloud-native design


Firecrawl works beautifully with n8n for automating web scraping workflows. 

Here's a simple example of how to use Firecrawl with n8n:

1. **HTTP Request Node**: Connect to Firecrawl's API
2. **Data Processing**: Use n8n's powerful nodes to transform the extracted data
3. **Storage**: Save results to your preferred database or file storage
4. **Automation**: Schedule regular crawls or trigger them based on events

Use Cases

- **Market Research**: Track prices and product information
- **Lead Generation**: Extract contact information from business directories
- **Content Aggregation**: Build news or job listing aggregators
- **Competitor Analysis**: Monitor competitor websites for changes


Prerequisites

- Node.js 16+ or Docker
- n8n instance (self-hosted or cloud)
- Firecrawl API key (get one at [firecrawl.dev](https://firecrawl.dev))

Basic Installation

```bash
# Using npm
npm install -g firecrawl

# Or with Docker
docker run -p 8080:8080 firecrawl/firecrawl
```

Example n8n Workflow

1. **Trigger**: Schedule or webhook
2. **Firecrawl Node**: Configure with target URL and selectors
3. **Process Data**: Use n8n's function nodes to transform
4. **Output**: Save to database or send notifications

Advanced Features

- **Custom Middleware**: Add your own processing logic
- **Scheduled Crawls**: Regular data refreshes
- **Error Handling**: Built-in retry and error reporting
- **Authentication**: Support for protected content

Best Practices

1. Always respect `robots.txt`
2. Implement rate limiting
3. Cache responses when possible
4. Handle CAPTCHAs gracefully
5. Monitor your crawls

Resources

- [Official Documentation](https://docs.firecrawl.dev)
- [GitHub Repository](https://github.com/firecrawl/firecrawl)
- [n8n Integration Guide](https://docs.firecrawl.dev/integrations/n8n)


Firecrawl provides a powerful yet simple way to extract web data at scale. When combined with n8n, it becomes an incredibly powerful tool for automating data collection and processing workflows. Whether you're building a price monitoring system, content aggregator, or research tool, Firecrawl has you covered.


{{< /details >}}


{{< cards cols="2" >}}
  {{< card link="https://github.com/firecrawl/firecrawl" title="Firecrawl GitHub ↗" >}}
  {{< card link="https://docs.firecrawl.dev" title="Documentation ↗" >}}
{{< /cards >}}

## Next Steps

1. Sign up for an API key at [Firecrawl](https://firecrawl.dev)
2. Try the [quickstart guide](https://docs.firecrawl.dev/quickstart)
3. Join the [community forum](https://community.firecrawl.dev) for support and ideas



---

## FAQ



app.apollo.io 1000 contactos 50 usd, pero con apify console.apify te conectas con su `apollo scrapper` free tier.

> in that way we have 1k leads for 1.5 usd from apify only.

app millionverifier para verificar emails

wedding planners - google one by one / scrapper de google maps por wedding planners
serper google search api para buscar tb en google
outscraper - para sacar por ej restaurantes tarragona


clay es la mas tocha y muy usada actualmente, there is free tier
no es CRM pero leads q vengan de listas (como la de apollo), de webs, forms....convergen aqui
hay webreseach agent + openai KEY para sacar por ej el domino de la empresa

trykitt es otra tool q se puede conectar a clay via API y te intenta sacar el email basado en nombre y dominio
leadmagic tb puede ayudar para encontrar emails y conviene usar esa al default de clay para evitar quedarte sin creditos
million verifier va aqui (va con http get xq no tiene integ) y te da quality, para saber si email OK
para verificar tb tienes findemails

smartlead/instant lead - para los leads refinados llevartelos a email (se puede plugear con clay y tiene para calentar warm up mails etc)
smartlead tiene una zona de CRM, pero gohighlevel tb se puede usar como CRM (ademas golighlevel puede create landings and forms).
smarlead tb categoriza la repsuesta y pueden cambiar los leads a interested x ej y tb hay ewbhooks... q conectan con make
smartlead tb sp conectar a slack

heyreach puede ser una opcion si no tienes el email y el flow de smartlead no funcionaria

tb se puede conectar make a tu crm, como para poner contactos categorizados como interesados segun el webhook

> lead gen Jay, nick saraev (184 skool x 2600 members), kristian besser 1700 personas en slack de 92k pagando 4k
manthan patel https://www.agentpass.ai/

ICP - ideal customer profile
value proposition
customer avatar

scrap google maps


### Fire-Enrich

Open source advantage: Fire Enrich is open source on GitHub with over 650 stars. You can inspect the code, modify agents for specific use cases, and contribute improvements.

https://github.com/firecrawl/fire-enrich

> MIT |  🔥 AI-powered data enrichment tool that transforms emails into rich datasets with company profiles, funding data, tech stacks, and more using Firecrawl and multi-agent AI 

No limits when self-hosted: The public demo limits you to 15 rows and 5 columns to manage costs. When you run Fire Enrich locally, these restrictions disappear.

Cost comparison:
Tool	Starting Price	Approach
Clay	$149/month	Multi-source aggregator, requires separate subscriptions
Apollo	$59/user/month	Built-in database, limited customization
Fire Enrich	Free (self-hosted)	Real-time research, only pay API costs

When self-hosting, you only pay for OpenAI API usage (typically $0.01-0.05 per enrichment).