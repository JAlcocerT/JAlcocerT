---
title: "Creating an e-Commerce"
date: 2026-12-23
draft: true
tags: ["SaaS","Drupal","Clustering"]
description: 'Creating an eCommerce. Drupal vs DIY'
url: 'ecommerce'
---

https://www.shopify.com/news/david-heinemeier-hansson-board

* ecommerce - https://outficik.pl/

https://polkabikes.pl/ 

**Intro**

If you have worked for a popular ecommerce in D&A, chances are that you were focusing on clustering users.

PBi had a panel that could do the trick...to some extent.

But doing sth custom is much cooler.

[Some people dare to create their own ecommerce](https://forocoches.com/foro/showthread.php?t=9707807) dont die trying.

https://awweso.me/e-commerce/



Existen múltiples alternativas open source y autoalojadas a Shopify y WordPress con WooCommerce en 2025, cada una con distintos enfoques según la escala del negocio, el nivel técnico y la arquitectura deseada (monolítica o headless).

### Principales alternativas open source a Shopify

1. **Medusa.js**  
   Basada en Node.js, con arquitectura *headless*, Medusa permite crear tiendas con React, Vue o Next.js manteniendo el backend separado. Ofrece API REST y GraphQL, soporte para plugins y control total de datos y diseño.[1]

2. **Bagisto**  
   Construida sobre Laravel y Vue.js, ofrece multicanal, multi-almacén, API GraphQL y una interfaz moderna. Es ideal para proyectos personalizables y escalables a nivel empresarial.[2]

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



{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/software-for-marketing-agencies/#marketing-around-oss" title="Marketing around OSS - Mautic" image="/blog_img/selfh/HomeLab/mautic/mautic-ui.png" subtitle="Mautic setup for a marketing agency" >}}
{{< /cards >}}


5. **Drupal Commerce**  
   Extiende el CMS Drupal para manejar eCommerce. Ideal si se requiere un sistema de contenido robusto junto con funcionalidades de tienda.[8]

### Comparativa general

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


## Medusa 

https://github.com/medusajs/medusa

> MIT |  The world's most flexible commerce platform. 

https://medusajs.com/plugins/

https://docs.medusajs.com/starters/nextjs-medusa-starter

## Thelia

https://thelia.net

## Evershop

https://github.com/evershopcommerce/evershop

>  🛍️ NodeJS E-commerce Platform 


https://github.com/shurco/litecart/

> MIT |  🛒 litecart - shopping cart in 1 file with card and cryptocurrency payment support 

https://github.com/saleor/saleor

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




Yes, exactly. With Medusa as your backend, you can use Astro static site generator to build your frontend storefront. Astro can pull product data dynamically from Medusa’s REST or GraphQL APIs.

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

* zezam.io
* https://sklepmakunki.pl/


<!-- * https://outficik.pl/
* https://outficik.pl/wp-login.php?redirect_to=https%3A%2F%2Foutficik.pl%2Fwp-admin%2F&reauth=1
https://www.instagram.com/outficik.secondhand/ -->



* **Menu websites at ~500 eur/year**
  * http://cartalia.org/
    * http://ukelele.cartalia.org/
  * https://www.upmenu.com/pricing/
* https://www.covermanager.com/en
* https://www.mojstolik.pl/dla-restauracji

* Hosting Costs:
  * https://banahosting.com/web-hosting ~5eur/month
  * https://webtolearn.pl/cennik ~20eur/month

* Customer management systems
  * https://wakems.com/index.php
  * https://clubspeed.com/pricing/

* Custom websites
  * https://zeon.studio/estimate-project
  * https://hormigasenlanube.com/
  * https://lyk-website.pl/brief/





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

https://quadscadiz.com/

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
  * https://zeon.studio/estimate-project
  * https://hormigasenlanube.com/
  * https://lyk-website.pl/brief/

https://jalcocert.github.io/JAlcocerT/real-estate-landing/#making-website-services-known

![Good old printed lead with QR in an European park](/blog_img/biz/leads/good-old-ad.png)

<!-- 
https://issyinformatica.es/

-->

<!-- More ppl to help - future CLIENTS

* you dont need to pay for wordpress themes, its already there and it works
  * https://generatepress.com/pricing/

* Pablo Couto - https://www.buildingfuturecapital.com/

https://web-check.xyz/check/https%3A%2F%2Fwww.buildingfuturecapital.com%2F


* Sofia - zofienkagram
  * https://wnba.pl/ - another wordpress (good looking)
  * monika ciolkowska - monikacio
    * https://monikaciolkowska.portfoliobox.net/
    * Using the low tier without domain of https://www.portfoliobox.net/pricing (46$/y)
      * Interesting section with a table comparing services and faq (go below)

* Gym Trainer - https://trenujswiadomie.pl/kokpit/

* Gym Trainer - https://trenujswiadomie.pl/kokpit/



-->


<!-- 
* Weddings...
* bodas.net

http://divephiphiisland.com/ 

-->

<!-- More ppl to help - future CLIENTS

* you dont need to pay for wordpress themes, its already there and it works
  * https://generatepress.com/pricing/

* Pablo Couto - https://www.buildingfuturecapital.com/

https://web-check.xyz/check/https%3A%2F%2Fwww.buildingfuturecapital.com%2F


https://quadscadiz.com/

* Sofia - zofienkagram
  * https://wnba.pl/ - another wordpress (good looking)
  * monika ciolkowska - monikacio
    * https://monikaciolkowska.portfoliobox.net/
    * Using the low tier without domain of https://www.portfoliobox.net/pricing (46$/y)
      * Interesting section with a table comparing services and faq (go below)


---

### Competitors

* Hosting Costs:
  * https://banahosting.com/web-hosting ~5eur/month
  * https://webtolearn.pl/cennik ~20eur/month

* Customer management systems - CMS
  * https://wakems.com/index.php
  * https://clubspeed.com/pricing/

* Custom websites
  * https://zeon.studio/estimate-project
  * https://hormigasenlanube.com/
  * https://lyk-website.pl/brief/

