---
title: "An e-Commerce around OSS"
#date: 2026-02-03
date: 2026-01-21
draft: false
tags: ["Shopify x SaaS","Drupal","User Clustering","RoadMap26","BlackFriday","OLTP vs OLAP"]
description: 'Creating an eCommerce. Drupal vs DFY custom solutions'
url: 'how-about-selfhosting-an-ecommerce'
---

**Tl;DR**

You need [consumer intelligence](https://jalcocert.github.io/JAlcocerT/fmcg-concepts-101/#about-consumer-intelligence) to create a 2026 proof e-commerce.

And [ERP, a CRM](https://jalcocert.github.io/JAlcocerT/fmcg-concepts-101/#erp-vs-crm)?

* https://github.com/riteshk-007/nextjs-store

>  Full E commerce Website using Next js 

**Intro**

If you have worked for a popular ecommerce in D&A, chances are that you were focusing on clustering users.

PBi had a panel that could do the trick...to some extent.

But doing sth custom is much cooler.

[Some people dare to create their own ecommerce](https://forocoches.com/foro/showthread.php?t=9707807) dont die trying.


{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab" title="Data-Chat | Github ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/poc_shopify" title="Shopofy AI COO | Landing x App | Github ↗" icon="github" >}}
{{< /cards >}}


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/n8n" title="N8N | Docker Config 🐋 ↗" >}}
{{< /cards >}}



Ive consolidated a list of ecommerce Ive encountered here.

1.  `petiteknit.com` and `morecaknit.com` which are around [knitting](https://jalcocert.github.io/JAlcocerT/knitting-pattern-calculator/)

2. `https://juan.pl/en/`

3. `https://outficik.pl/`

4. `https://polkabikes.pl/` This one was without SSL a full weekend



You can always check more examples `https://awweso.me/e-commerce/`


Existen múltiples alternativas open source y autoalojadas a Shopify y WordPress con WooCommerce en 2025, cada una con distintos enfoques según la escala del negocio, el nivel técnico y la arquitectura deseada (monolítica o headless).

### Principales alternativas open source a Shopify

1. **Medusa.js**  
   Basada en Node.js, con arquitectura *headless*, Medusa permite crear tiendas con React, Vue o Next.js manteniendo el backend separado. Ofrece API REST y GraphQL, soporte para plugins y control total de datos y diseño.[1]

2. **Bagisto**  
   Construida sobre Laravel y Vue.js, ofrece multicanal, multi-almacén, API GraphQL y una interfaz moderna. Es ideal para proyectos personalizables y escalables a nivel empresarial.

3. **Saleor**  
   Framework de eCommerce *headless* basado en GraphQL y Django (Python). Es utilizado para tiendas modernas con integraciones JAMstack y gran rendimiento.[1]

4. **Spree Commerce**  
   Plataforma Ruby on Rails pensada para desarrolladores. Es estable, modular y permite integraciones B2B o B2C sin coste de licencia.[3]

5. **PrestaShop**  
   Solución PHP madura con una comunidad muy activa y muchos módulos. Se instala fácilmente en cualquier hosting y ofrece gestión de catálogos, marketing y SEO.[4][2]

### Alternativas autoalojadas a WooCommerce

1. **Magento Open Source (Adobe Commerce)**  
   Potente y personalizable, escrita en PHP. Ideal para empresas con desarrolladores internos o agencias. Ofrece multi-tienda, gestión avanzada de pedidos e integración ERP.[5][6]

2. **OpenCart**  
   Opción ligera y sencilla para usuarios sin experiencia técnica. Ofrece buena base de extensiones, interfaz fácil y soporte multitienda.[7]

3. **nopCommerce**  
   Basada en .NET, soporta B2B, B2C y marketplaces. Muy flexible y con API REST nativa. Adecuada para quienes usan infraestructura Microsoft.[6]

4. **Odoo eCommerce**  
   Forma parte del ecosistema ERP Odoo. Permite administrar inventarios, facturación y ventas desde un mismo entorno, con interfaz moderna y modular.[2]

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/erpnext" title="ERPNext Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/odoo" title="Odoo HomeLab | Docker Config 🐋 ↗" >}}
{{< /cards >}}

5. **Drupal Commerce**  
   Extiende el CMS Drupal para manejar eCommerce. Ideal si se requiere un sistema de contenido robusto junto con funcionalidades de tienda.[8]

Comparativa general

| Plataforma | Lenguaje base | Arquitectura | Ideal para | Observaciones |
|-------------|----------------|----------------|----------------|----------------|
| Medusa.js [1] | Node.js | Headless | Desarrolladores modernos | Integración con React, Next.js |
| Bagisto [2] | PHP (Laravel) | Modular/Headless | Pymes y empresas | Multi-almacén, multilingüe |
| Saleor [1] | Python (Django) | Headless | Tiendas JAMstack | API GraphQL avanzada |
| Magento Open Source [5] | PHP | Monolítica | Grandes comercios | Comunidad amplia, alto consumo de recursos |
| PrestaShop [2] | PHP | Tradicional | Pymes | Fácil instalación, buen SEO |
| nopCommerce [6] | C# (.NET) | Modular | Negocios Microsoft | Soporta multi-tienda y B2B |
| OpenCart [7] | PHP | Tradicional | Pequeñas tiendas | Sencilla y ligera |

En resumen, **Medusa.js**, **Bagisto** y **Saleor** representan la nueva generación de plataformas headless modernas, mientras que **Magento**, **PrestaShop** y **nopCommerce** siguen siendo las opciones más sólidas para quienes buscan ecosistemas maduros y autogestionados.


#### Medusa 

* https://github.com/medusajs/medusa
  * https://medusajs.com/plugins/
  * https://docs.medusajs.com/starters/nextjs-medusa-starter  

> MIT |  The world's most flexible commerce platform. 


#### Thelia

* https://thelia.net

#### Evershop

* https://github.com/evershopcommerce/evershop

>  🛍️ NodeJS E-commerce Platform 

#### Others

* https://github.com/shurco/litecart/

> MIT |  🛒 litecart - shopping cart in 1 file with card and cryptocurrency payment support 

* https://github.com/saleor/saleor

Saleor Core: the high performance, composable, headless commerce API. 

* <https://github.com/JAlcocerT/Docker/blob/main/Web/posthog_docker-compose.md>


Gumroad is an e-commerce platform that enables creators to sell products directly to consumers. 

* https://github.com/antiwork/gumroad

>  Sell stuff and see what sticks 
 

There are several notable open source self-hostable e-commerce platforms available:

- **WooCommerce** (for WordPress): Very popular, flexible, and customizable plugin that turns WordPress sites into e-commerce stores. It powers millions of websites and has extensive themes and extensions, ideal if you want WordPress integration.[3][9]

- **PrestaShop**: A widely used PHP-based platform built on Symfony. It is user-friendly and feature-rich, with strong multi-language and multi-currency support. Good for small to medium businesses and popular especially in Europe.[2][8][10]

- **OpenCart**: Lightweight and powerful open-source PHP platform with a large marketplace for extensions and multi-store management but with limited SEO features.[2][3]

- **MedusaJS**: API-first, headless e-commerce Node.js platform great for modern, scalable storefronts. Free core system with customizable architecture.[5][6][2]

- **Bagisto**: A Laravel-based e-commerce platform designed for developers looking for flexibility, a good alternative to WooCommerce.[2]

- **Evershop**: Node.js based, lightweight, efficient e-commerce system suited to small and medium businesses, with React frontend and GraphQL.[2]

- **Magento Open Source (Adobe Commerce)**: Powerful, highly customizable PHP platform suited to enterprise-level sites but requires advanced skills.[9][3]

- **Spree Commerce**: Headless e-commerce platform with multi-vendor marketplace and B2B/B2C support, open source with SaaS option.[3]

- **Sylius**: Developer-friendly open-source headless e-commerce framework focusing on B2B and B2C.[4]

- **CubeCart**: Template-driven, responsive store platform that is simpler than some others but less extensible.[3]

These platforms vary in technology stack (PHP, Node.js, Python/Django, .NET) and complexity, from user-friendly to developer-centric, allowing you to pick one that fits your technical expertise and business needs.[8][15][9][3][2]

Yes, exactly. 

With Medusa as your backend, you can use Astro static site generator to build your frontend storefront.

Astro can pull product data dynamically from Medusa’s REST or GraphQL APIs.

Here’s how it works:

- You manage your products, inventory, and orders in Medusa’s admin UI.
- Your Astro front end fetches product data from Medusa’s API at build time or on-demand.
- Astro renders static pages with the product info while allowing dynamic client-side interactions like cart updates or checkout using Medusa’s API.
- This JAMstack pattern offers great performance, SEO, and developer flexibility, decoupling the frontend and backend.

So, you create and update products in Medusa, and your Astro static site reflects those products by calling Medusa’s API.[1][2][3]

[1](https://medusajs.com/product-module/)
[2](https://kvytechnology.com/blog/software/product-management-with-medusa-js/)
[3](https://statichunt.com/jamstack-ecommerce)

Hosting an eCommerce

* https://libreselfhosted.com/project/aimeos/

* https://github.com/aimeos
  * https://github.com/aimeos/aimeos

> MIT | Ultra-fast, Cloud-native, **API-first PHP e-commerce framework** for building custom online shops, scalable marketplaces and complex B2B apps 

https://www.shoper.pl/premium like https://sklepmakunki.pl/ which theme comes from https://netplace.com.pl/ see https://netplace.com.pl/portfolio/magicznypokoik-pl/

**Intro**

As I have been learning how to do CSR related auth...

How about bringing something more than a website: **an ecommerce**

Creating a custom ecommerce from scratch is a lot of work, so you can also use a [OSS Selfhosted ecommerce](#selfhosted-ecommerce).

## Astro as Ecommerce

1. https://github.com/unfolding-io/nebulix

> CC | Nebulix, a Fast & Green Theme Based on Astro + [Static CMS](https://www.staticcms.org/docs/backends-overview) + Snipcart

2. https://github.com/CrystallizeAPI/dounut-astro

3. https://github.com/lloydjatkinson/astro-snipcart

> MIT | Allows for the creation of E-Commerce sites using the Astro framework and [Snipcart](https://snipcart.com/pricing). Start your e-commerce business in minutes!

4. https://github.com/michael-andreuzza/microstore

https://microstoretheme.netlify.app/#_

5. https://github.com/jazsouf/astro-shopify-sanity



### Streamlit as eCommerce

You would need proper file connection and some decent auth:

* https://github.com/streamlit/files-connection
* https://github.com/bleumink/streamlit-keycloak

## Selfhosted Ecommerce

### Drupal

![Drupal Ecommerce Setup](/blog_img/biz/ecommerce/drupal.png)


---

### Competitors

* `zezam.io`
* `https://sklepmakunki.pl/`


<!-- * https://outficik.pl/
* https://outficik.pl/wp-login.php?redirect_to=https%3A%2F%2Foutficik.pl%2Fwp-admin%2F&reauth=1
https://www.instagram.com/outficik.secondhand/ -->



* **Menu websites at ~500 eur/year**
  * `http://cartalia.org/`
    * `http://ukelele.cartalia.org/`
  * `https://www.upmenu.com/pricing/`
* `https://www.covermanager.com/en`
* `https://www.mojstolik.pl/dla-restauracji`

* Hosting Costs:
  * `https://banahosting.com/web-hosting` ~5eur/month
  * `https://webtolearn.pl/cennik` ~20eur/month

* Customer management systems
  * `https://wakems.com/index.php`
  * `https://clubspeed.com/pricing/`

* Custom websites
  * `https://zeon.studio/estimate-project`
  * `https://hormigasenlanube.com/`
  * `https://lyk-website.pl/brief/`





<!-- 
* Weddings...
* bodas.net

http://divephiphiisland.com/ -->

<!-- 
ecommerce
https://polkabikes.pl/ -->

<!-- More ppl to help - future CLIENTS

* you dont need to pay for wordpress themes, its already there and it works
  * https://generatepress.com/pricing/

* Pablo Couto - https://www.buildingfuturecapital.com/

https://web-check.xyz/check/https%3A%2F%2Fwww.buildingfuturecapital.com%2F

Registry Expiry Date - 26 April 2025

* Sofia - zofienkagram
  * https://wnba.pl/ - another wordpress (good looking)
  * monika ciolkowska - monikacio
    * https://monikaciolkowska.portfoliobox.net/
    * Using the low tier without domain of https://www.portfoliobox.net/pricing (46$/y)
      * Interesting section with a table comparing services and faq (go below)

* Gym Trainer - https://trenujswiadomie.pl/kokpit/


-->
---

### Competitors

See cool sites: `makemydream.pl` can also be done with wordpress.

How I know it is a WP?

See: `https://makemydream.pl/wp-login`

* Hosting Costs:
  * https://banahosting.com/web-hosting ~5eur/month
  * https://webtolearn.pl/cennik ~20eur/month

* Customer management systems
  * https://wakems.com/index.php
  * https://clubspeed.com/pricing/

* Custom websites
  * `https://zeon.studio/estimate-project`
  * `https://hormigasenlanube.com/`
  * `https://lyk-website.pl/brief/`

* https://jalcocert.github.io/JAlcocerT/real-estate-landing/#making-website-services-known

![Good old printed lead with QR in an European park](/blog_img/biz/leads/good-old-ad.png)

---

## Conclusions

![Blackfriday sample x20 price](/blog_img/memes/blackfriday-sample.png)


But you can get **ecommerce analytics** done for you: *lets say its all about [plugging AI powered data analytics](https://jalcocert.github.io/JAlcocerT/plug-and-play-data-analytics/) to it*

Same that was done with the Commento db can be done to ecommerce dbs!

```mermaid
flowchart LR
    %% --- Styles ---
    classDef landing fill:#E3F2FD,stroke:#1976D2,stroke-width:3px,color:#0D47A1;
    classDef steps fill:#F3E5F5,stroke:#7B1FA2,stroke-width:2px,color:#4A148C;
    classDef slider fill:#FFF3E0,stroke:#F57C00,stroke-width:2px,color:#E65100;
    classDef free fill:#E8F5E9,stroke:#388E3C,stroke-width:3px,color:#1B5E20;
    classDef consult fill:#FFECB3,stroke:#FFA000,stroke-width:3px,color:#FF6F00;
    classDef dfy fill:#FFCDD2,stroke:#D32F2F,stroke-width:3px,color:#B71C1C;

    %% --- Nodes ---
    START("🏠 Landing Page<br/>(Hero + Value Prop)"):::landing
    STEPS("📋 Read Process<br/>(3-Step Guide)"):::steps
    SLIDER("🎚️ Interactive Slider<br/>(Assess Time Value)"):::slider
    
    FREE("📚 FREE Path<br/>(DIY Guides)"):::free
    CAL("📅 Consulting<br/>(Book Session)"):::consult
    DFY("💎 Done For You<br/>(Premium Service)"):::dfy

    %% --- Flow ---
    START --> STEPS
    STEPS --> SLIDER
    
    SLIDER -->|"0%<br/>I'm Learning"| FREE
    SLIDER -->|"1-74%<br/>A lot!"| CAL
    SLIDER -->|"75-100%<br/>Lambo Money"| DFY
    
    %% --- Outcomes ---
    FREE -.->|"Explore FAQ"| END1["📖 Self-Learn"]
    CAL -.->|"Book Time"| END2["🤝 Get Guidance"]
    DFY -.->|
    "Check Resources"| END3["⚡ Fast Track"]
```


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}

<!-- ![Data Analytics - webook](/blog_img/shipping/dna-1ton-ebook.png) -->

---

### Getting Here


Tried Wordpress and Ghost.

But those...are not quite ecommerce.

Didnt care and wrote via SSG.

Created some custom CMS  / custom WebApps for people who were not willing to pay and failed *hard*.

Tested Strapi and DirectusCMS

<!-- https://youtu.be/bREja-vW6fA -->

{{< youtube "bREja-vW6fA" >}}
