---
title: "Creating an e-Commerce"
date: 2026-12-23
draft: true
tags: ["SaaS","Drupal"]
description: 'Creating an eCommerce. Drupal vs DIY'
url: 'ecommerce'
---

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

If you want a recommendation or details on any specific platform, just ask!

[1](https://www.reddit.com/r/selfhosted/comments/v37lm3/best_selfhosted_platform_for_small_ecommerce_store/)
[2](https://uideck.com/blog/self-hosted-ecommerce-solutions)
[3](https://kinsta.com/blog/open-source-ecommerce/)
[4](https://sylius.com)
[5](https://underhost.com/blog/the-best-self-hosted-e-commerce-platforms-of-2025/)
[6](https://www.reddit.com/r/selfhosted/comments/1lyosh6/looking_for_selfhosted_ecommerce_platform/)
[7](https://contabo.com/blog/best-e-commerce-platforms-for-your-business/)
[8](https://www.voxfor.com/12-best-free-open-source-ecommerce-solutions-to-launch-your-business-online-in-2025/)
[9](https://www.shopify.com/blog/open-source-ecommerce)
[10](https://bitbag.io/blog/ecommerce-platforms-open-source)
[11](https://www.tigren.com/blog/self-hosted-hosted-ecommerce-platforms/)
[12](https://www.youtube.com/watch?v=BQtMDI-Wv4w)
[13](https://github.com/awesome-selfhosted/awesome-selfhosted)
[14](https://golocad.com/blog/e-commerce-frameworks/)
[15](https://vendure.io)

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

* More competitors
  * Taplink
  * bento.me
  * https://getallmylinks.com/
  * https://subscribepage.io/listy#



<!-- 
* Weddings...
* bodas.net

http://divephiphiisland.com/ -->

<!-- * Proposed: bogusiabachata.pro -->
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

* ecommerce - https://outficik.pl/

---

To try Astro+Ghost headlessCMS as described 
https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/#gatsby

-->
---

### Competitors

See cool sites: `makemydream.pl` can also be done with wordpress.

How I know it is a WP?

See: `https://makemydream.pl/wp-login`

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

* More competitors
  * Taplink
  * bento.me *A comercial bento link website, owned by linktree*
  * https://getallmylinks.com/
  * https://subscribepage.io/listy#


<!-- * Proposed: bogusiabachata.pro -->
<!-- 
https://issyinformatica.es/ -->

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

* ecommerce - https://outficik.pl/

---

To try Astro+Ghost headlessCMS as described 
https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/#gatsby

-->


<!-- 
* Weddings...
* bodas.net

http://divephiphiisland.com/ -->

<!-- * Proposed: bogusiabachata.pro -->
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

* ecommerce - https://outficik.pl/

---

To try Astro+Ghost headlessCMS as described 
https://jalcocert.github.io/JAlcocerT/blog/dev-in-docker/#gatsby

-->
---

### Competitors

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

* More competitors
  * Taplink
  * bento.me
  * https://getallmylinks.com/
  * https://subscribepage.io/listy#