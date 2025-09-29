---
title: "Leads and marketing automation"
date: 2025-09-22T06:20:21+01:00
draft: false
tags: ["CRM","Scrapping","Lead Enrichment","Firecrawl","leads-slubnechwile"]
url: 'software-for-marketing-agencies'
description: 'Get clients, engage, sell. With facebook pages.'
---

**Tl;DR**

Today it seems all about [lead enrichment](https://www.firecrawl.dev/blog/fire-enrich)

> https://github.com/JAlcocerT/leads-slubnechwile for this [fb page](https://www.facebook.com/profile.php?id=61581167945505&sk=about)


* https://github.com/punkpeye/awesome-mcp-servers?tab=readme-ov-file#marketing

* https://github.com/gomarble-ai/facebook-ads-mcp-server

* https://github.com/goabstract/Marketing-for-Engineers

**Intro**

I started the day with a core believe: *wordpress sites are meh*

After this sync with couple of marketers - That changed. See this landing done with elementor: https://genkinfy.com/



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

Firecrawl is an open-source, high-performance web crawler and scraper designed for developers and data professionals. 

It's built to handle modern web technologies, including JavaScript-rendered content, while being respectful of website terms of service.

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


## Conclusions

It seems all you need to do to start a marketing agency is a proposal.

Like ~1k/month for [Leads](#how-to-get-and-enrich-leads) + [CRM](#marketing-around-oss) + [ChatBot](#chatbots-for-marketing) *with an ad campaing proposal*.

---

## FAQ

1. ICP (Ideal Customer Profile)

An Ideal Customer Profile (ICP) is a detailed, hypothetical description of the perfect customer or company that would gain the most value from a product or service. It includes demographics, behaviors, needs, and pain points, helping businesses target marketing and sales efforts towards prospects most likely to convert and be satisfied.

2. Value Proposition

A Value Proposition is a clear statement that explains how a product or service solves a customer's problem or improves their situation. It highlights specific benefits and why customers should choose that product over alternatives, effectively communicating the unique value delivered to the customer.

3. Customer Avatar

A Customer Avatar (or buyer persona) is a semi-fictional representation of an individual ideal customer based on detailed data regarding demographics, behaviors, motivations, and challenges. It helps companies tailor marketing messages and product development to better resonate on a personal level with their target audience.

> The ICP focuses on the ideal company or customer segment, the value proposition communicates why the product matters, and the customer avatar embodies the individual persona within the ICP that marketers and sales teams aim to reach.

### A Sample Marketer workflow

How can a lead adquisition workflow look like?

[app.apollo.io](https://www.apollo.io/sign-up) 1000 contactos 50 usd, pero con apify console.apify te conectas con su `apollo scrapper` free tier.

> in that way we have 1k leads for 1.5 usd from apify only.

See the app `millionverifier` tp... verify emails

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
smartlead tiene una zona de CRM, pero gohighlevel (GHL) tb se puede usar como CRM (ademas golighlevel puede create landings and forms).
smarlead tb categoriza la repsuesta y pueden cambiar los leads a interested x ej y tb hay ewbhooks... q conectan con make
smartlead tb sp conectar a slack

heyreach puede ser una opcion si no tienes el email y el flow de smartlead no funcionaria

tb se puede conectar make a tu crm, como para poner contactos categorizados como interesados segun el webhook

> lead gen Jay, nick saraev (184 skool x 2600 members), kristian besser 1700 personas en slack de 92k pagando 4k
manthan patel https://www.agentpass.ai/


### Tools

### GHL

* https://marketplace.gohighlevel.com/docs/ghl/contacts/create-contact

### How to get and enrich leads

#### FireCrawl Fire-Enrich

Open source advantage: Fire Enrich is open source on GitHub.

There is a hosted version: https://www.firecrawl.dev/app

You can inspect the code, modify agents for specific use cases, and contribute improvements.

* https://github.com/firecrawl/fire-enrich

> MIT |  🔥 AI-powered **data enrichment tool** that transforms emails into rich datasets with company profiles, funding data, tech stacks, and more using Firecrawl and multi-agent AI 

No limits when self-hosted: The public demo limits you to 15 rows and 5 columns to manage costs. When you run Fire Enrich locally, these restrictions disappear.

Here is a cost comparison table for the tools Clay, Apollo, and Fire Enrich based on their starting prices and approaches:

| Tool       | Starting Price       | Approach                                     |
|------------|---------------------|----------------------------------------------|
| Clay       | $149/month          | Multi-source aggregator, requires separate subscriptions  |
| Apollo     | $59/user/month      | Built-in database, limited customization        |
| Fire Enrich| Free (self-hosted)  | Real-time research, only pay API costs          |

This summary reflects that Clay uses a credit-based system with multiple data sources and can get costly with usage; Apollo is priced per user with a proprietary database, simpler but less flexible; Fire Enrich is self-hosted and free but you pay for external API usage as needed.[1][4][10]

[1](https://blog.revpartners.io/en/revops-articles/clay-vs-apollo-sales-platform)
[2](https://smartreachai.com/clay-vs-apollo-2025-sales-intelligence-comparison/)
[3](https://supademo.com/blog/data-enrichment-tools/)


When self-hosting, you only pay for OpenAI API usage (typically $0.01-0.05 per enrichment).

#### ApiFy can do that

Just go here and get those 5$ monthly to test: https://console.apify.com/

* https://n8n.io/integrations/apify/


### More APIs

* https://serpapi.com/pricing

Can this...Scrap google maps...?

APIfy can :)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/leads-slubnechwile" title="APIfy + Firecrawl... | A repo to get leads for slubnechwile ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serpbear" title="N8N | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### Marketing around OSS

Building a marketing agency?

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main" title="SelfHostable Marketing Software | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Have a look to...

- GoHighLevel (GHL) is an all-in-one, **hosted CRM platform** focusing on marketing automation, funnel building, and agency solutions, providing strong out-of-the-box marketing tools and automation.

- Popular open-source CRM alternatives include **SuiteCRM, Odoo, and EspoCRM**. These offer more traditional CRM functions with flexibility and full self-hosting capability, requiring more technical setup and integration for marketing automation compared to GoHighLevel.

> With Odoo you can even have your drag-n-drop website created in the same suite

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mautic" title="Mautic | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/odoo" title="Odoo | Docker Config 🐋 ↗" >}}
{{< /cards >}}

- Marketing automation in open-source tools can be achieved through integration with platforms like **Mautic**, but usually with more configuration effort.

{{% details title="What is Mautic? 🚀" closed="true" %}}

Mautic is an open-source **marketing automation platform** that helps businesses create, manage, and optimize their marketing campaigns with data-driven decision-making.

Key features of Mautic:

- **Email Marketing:** Create, personalize, and A/B test email campaigns using a drag-and-drop builder.
- **Lead Management:** Capture and nurture leads from forms and landing pages, segment contacts, and score leads based on behavior.
- Multi-Channel Marketing: Automate campaigns across email, SMS, social media, and web push notifications.
- Campaign Automation: Design complex marketing workflows triggered by user actions, time-based events, or conditions using a visual campaign builder.
- **Landing Pages and Forms:** Build customizable landing pages and forms to generate leads and gather customer information.
- **Behavioral Tracking:** Track customer interactions across websites, emails, and landing pages for better targeting and personalization.
- Analytics and Reporting: Monitor campaign performance, ROI, user engagement, and email metrics.
- **Integrations:** Connect with CRM systems, CMS platforms, social media, and other marketing tools through extensive APIs.
- Data Privacy and Compliance: Ensure marketing efforts comply with GDPR and other privacy regulations.
- Open-source Flexibility: Fully customizable platform with no vendor lock-in, allowing users to host it themselves and modify it to fit specific needs.

Mautic enables businesses, agencies, and enterprises to automate their marketing processes, improve customer engagement, and drive conversions effectively while maintaining full control of their marketing data.

{{% /details %}}



{{% details title="Mautic and...Odoo? 🚀" closed="true" %}}


Yes, Mautic is commonly integrated with CRM systems like Odoo and Clay to synchronize marketing and sales data.

**Mautic and Odoo Integration:**

- There are dedicated connectors and modules (e.g., Odoo Mautic Connector) that sync contacts, companies, campaigns, and email templates between the two platforms.
- Integration supports bidirectional data flow, so updates in Mautic reflect in Odoo and vice versa.
- Automated cron jobs handle real-time or scheduled synchronization, eliminating manual data entry.
- Workflows can be customized to trigger actions like creating leads in Odoo when forms are submitted in Mautic.
- Data mapping and filtering options allow precise control over synced data.
- Integration is often done through APIs or third-party automation tools like Zapier or n8n.
- This setup helps marketing and sales teams collaborate better by unifying lead management and campaign execution.

Mautic and Clay:
- While less common than Odoo, integration with tools like Clay can be achieved via APIs or automation platforms to synchronize contacts and enrich CRM data.
  
In summary, integrating Mautic with CRMs like Odoo or Clay is a standard practice to streamline marketing and sales pipelines and improve lead nurturing and customer engagement.[1][2][5][7][8][9]

[1](https://apps.odoo.com/apps/modules/11.0/pragtech_mautic_connector)
[2](https://zapier.com/apps/mautic/integrations/odoo)
[3](https://apps.odoo.com/apps/modules/18.0/mautic_odoo_connector)
[4](https://n8n.io/integrations/mautic/and/odoo/)

{{% /details %}}


{{< youtube "SfxfLP9MxGY" >}}

<!-- https://www.youtube.com/watch?v=SfxfLP9MxGY -->

> We can do Campaign Forms, Newsletter submissions, Landing Pages, Prepare custom email skeletons 


- Overall, GoHighLevel offers an all-in-one marketing-centric CRM for agencies and businesses needing ready-made automation, while open-source CRM and HRM solutions provide customization, ownership, and self-hosting but at the cost of more setup and technical complexity.

Here is a comparison table of popular self-hosted open-source CRMs, including their pros and cons:

| CRM         | Pros                                             | Cons                                              |
|-------------|--------------------------------------------------|---------------------------------------------------|
| SuiteCRM    | Fully open-source and highly customizable; rich CRM features; strong community support | Less built-in marketing automation; requires technical setup; interface may feel outdated |
| Odoo CRM    | Modular with broad business apps; flexible deployment; strong integration options | CRM features less advanced alone; can get complex with many modules; technical skills needed |
| EspoCRM     | Lightweight and easy to customize; user-friendly interface; good for small to mid business | Limited advanced marketing automation; fewer integrations out-of-the-box |
| Mautic (with CRM) | Open-source marketing automation; integrates well with self-hosted CRMs; powerful campaign tools | Requires integration setup; learning curve; CRM functions limited, more marketing focused |


#### Chatbots for Marketing

And for **custom chatbots** to drive conversion rates: https://jalcocert.github.io/JAlcocerT/no-code-ai-tools/#faq

An ordered list from easiest to most complex when it comes to self-hosting the mentioned chatbot and automation platforms, based on typical setup processes, available documentation, and required technical expertise:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/botpress" title="Botpress | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/typebot" title="TypeBot | Docker Config 🐋 ↗" >}}
{{< /cards >}}

1. **Typbot**  
   Typbot is designed specifically for ease-of-use, with clear self-hosting documentation, Docker containers, and minimal configuration needed. Even non-developers can set it up fairly quickly.

> See https://docs.typebot.io/self-hosting/deploy/docker and https://github.com/settings/developers for OAuth setup

> > Typebot wont start without proper `encryption_secret` nor some [auth configured](https://docs.typebot.io/self-hosting/configuration#github-auth)

`https://test.jalcocertech.com/`
`https://test.jalcocertech.com/api/auth/callback/github`


And then you get your clientID and client secret for the config. 

You just got your GH Oauth configured! Just same of what we did with [TinyAuth](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#tinyauth).

You could also... https://elest.io/open-source/typebot

2. **Botpress**  
   Botpress provides official Docker images, one-click deployments, and good documentation, making it beginner-friendly for most users familiar with Docker or similar tools.[4]

<!-- https://www.youtube.com/watch?v=RsbfJh5aiP0 -->

{{< youtube "RsbfJh5aiP0" >}}


> Guess hows easily integrated with n8n: https://botpress.com/integrations/n8n and also with your [WP CMS](https://botpress.com/docs/webchat/integrations/wordpress)



{{% details title="TypeBot vs BotPress. Use cases and OpenAI 🚀" closed="true" %}}

Botpress and Typbot are both popular self-hostable chatbot platforms, but their typical use cases differ based on their design and capabilities.

Typical Use Cases for Botpress

- **Customer Support Automation**: Botpress is often used to build complex, AI-driven support bots capable of handling FAQs, routing tickets, and providing contextual responses.[1]
- **Enterprise Virtual Assistants**: Companies deploy Botpress for internal helpdesk automation, HR inquiries, and knowledge base interactions.
- **Conversational AI and NLP Bots**: Its strong natural language processing (NLP) support allows for intent-based, dynamic conversations beyond simple scripted flows.[1]
- **Omnichannel Bots**: Botpress supports deploying chatbots across multiple channels (web, social media, messaging apps) with consistent experiences.
- **Custom Business Process Automation**: Businesses use Botpress to automate repetitive workflows, handle booking and leads, or integrate with CRMs and databases for smart automation.
- **Education and Training Bots**: Used for onboarding, employee training, and interactive educational assistance.

Typical Use Cases for Typbot

- **Lead Generation Forms**: Typbot is frequently used to create interactive conversational forms that significantly improve conversion rates on landing pages and websites.[2][3][4]
- **Surveys and Feedback Collection**: Its no-code platform lets marketing or operations teams deploy engaging survey flows for customer feedback and sentiment analysis.
- **Appointment Booking and Registration**: Businesses embed Typbot to handle scheduling, collecting user info, and automating basic transactional workflows.
- **Product Recommendations and Guided Shopping**: E-commerce shops use Typbot’s conversational style for quizzes and to guide customers to the right products.[2]
- **Internal Data Collection**: Organizations use Typbot for HR surveys, onboarding forms, and routine employee check-ins without coding.
- **Website Chatbots**: Typbot is often the first choice for quickly setting up website bots to greet visitors and qualify leads.

Key Differences

- **Botpress** excels in intelligent, programmable bots for support, workflow automation, and advanced conversational needs, with more complex setup and NLP features.[1]
- **Typbot** is ideal for marketing and sales teams needing simple, engaging forms or basic chatbots that can be embedded anywhere, and is noted for its ease of use and rapid deployment.[3][2]

Both platforms have overlapping uses but generally target different complexity levels and user skill sets.

Yes, both Botpress and Typbot support integrating the OpenAI API for advanced AI responses and can be configured to use custom knowledge sources.

Botpress
- Botpress natively supports integration with OpenAI (GPT-3, GPT-4, and similar) via official modules or custom API calls, allowing your bot to generate AI-driven answers and handle natural language conversations.[1]
- You can also connect Botpress to custom knowledge bases (internal databases, documents, or external APIs), enabling the bot to fetch or search specific information as part of its dialogue.[1]
- Botpress has flexible dialog flows and supports "knowledge search" use cases, so AI can be augmented with context from your own resources (e.g., FAQ docs, product databases).

Typbot
- Typbot supports OpenAI API integration for powering chat or conversational forms, allowing the use of GPT-style language models in conversations.[2][3]
- Typbot can be configured to use custom prompts and can interact with custom knowledge sources through API hooks, webhooks, or auxiliary backend logic as part of its form submissions or scripted flows.[3]
- Its community and self-hosting documentation includes guides on adding integrations for both OpenAI and custom data lookups.

Summary Table

| Platform  | OpenAI Integration | Custom Knowledge Source Support     |
|-----------|--------------------|-------------------------------------|
| Botpress  | Yes (native module and custom API) | Yes, via scripts and APIs             |
| Typbot    | Yes (prompt/API integration)       | Yes, via webhook/API calls, custom flows |

Both are designed to be extensible, so plugging in OpenAI for responses and drawing from your organization's knowledge is a documented and popular use case.Both Botpress and Typbot can be integrated with the OpenAI API in the background, enabling AI-powered responses in your chatbot conversations. You can easily configure them to pass user input to OpenAI and return generated replies.[2][3][1]

For custom knowledge, Botpress lets you fetch information from internal databases, APIs, or files, and use it within chat flows — ideal for proprietary company FAQs, product data, or other business specifics. Typbot can also use custom knowledge by connecting with webhooks or other backend systems that handle custom prompts or knowledge retrieval.[3][1]

So yes, you can use both platforms with OpenAI for natural language generation and connect to custom knowledge sources for more contextual, business-specific chatbot experiences.[1][2][3]


{{% /details %}}

3. Tock
   Tock offers deployment guides and Docker support, and is generally straightforward for basic use, though advanced configuration can add complexity.[5]

4. OpenDialog  
   OpenDialog comes with Docker and cloud-native deployment examples, but its enterprise features and modular setup mean slightly higher complexity than Typbot or Botpress.[5]

5. Claudia Bot Builder / BotMan  
   Both are developer-oriented and require familiarity with Node.js (Claudia) or PHP (BotMan). Setup is manageable for developers but less friendly for non-technical users.[5]

6. **n8n**  
   n8n has excellent documentation and quick-start Docker support, but designing a full-featured chatbot requires connecting multiple services manually and custom workflow logic, making setup nontrivial for non-developers.[6][7]

7. Rasa
   Rasa is the most flexible and powerful for custom conversational AI, but demands Python coding, environment setup, and additional services for deployment (e.g., Nginx, caching, analytics). Best suited for those with developer and DevOps knowledge.[5]


This order emphasizes user-friendliness, default self-hosting support, and the level of technical expertise generally required.[3][7][1][6][5]

[1](https://docs.typebot.io/self-hosting/get-started)
[2](https://github.com/davidbrandpro/typebot.io-Vercel)
[3](https://github.com/sergor5/typebot-selfhost)
[4](https://botpress.com/blog/open-source-chatbots)
[5](https://www.chatbase.co/blog/open-source-chatbot-platforms)
[6](https://www.voiceflow.com/blog/n8n-ai-chatbot-integration)
[7](https://blog.n8n.io/how-to-make-ai-chatbot/)