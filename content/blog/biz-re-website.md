---
title: "Real Estate Project Updates"
date: 2025-02-26T10:20:21+01:00
draft: false
tags: ["Dev"]
description: 'RE Gen AI App, RE Calculator and a RE Website (with Astro). Combo.'
url: 'real-estate-website'
math: true
---

<!-- 
https://github.com/JAlcocerT/cybernetik-realestate-moises 
https://dm-realestate.web.app/
-->

For the current web UI status:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/astro-web-setup/" title="Real Estate Project 1st Iteration ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/ScrewFastMoiRealEstate" title="The Source Code, using Screw Fast MIT Theme ↗" icon="book-open" >}}
{{< /cards >}}

Improvements:

1. [DaisyUI CSS](https://jalcocert.github.io/JAlcocerT/blog/dev-web-code-css/#daisyui) for Carousels, FAQ,...


{{< details title="Adding DaisyUI to Astro Themes | Cybernetic 📌" closed="true" >}}


As always, I got amazed with other themes, like:

* https://github.com/codexcodethemes/cybernetic-free
  * https://cybernetic-free-version.netlify.app/

```sh
git clone https://github.com/codexcodethemes/cybernetic-free
npm install 
npm audit fix

npm run dev #localhost:4321
#rm -rf .git
```

Apparently, at `/src/static/images/index.tsx` you can choose the **Hero images**.

Create the `tailwind.config.js` and **add**:

```js
/** @type {import('tailwindcss').Config} */
    module.exports = {
      content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],
      theme: {
        extend: {},
      },
      plugins: [require("daisyui")],
    };
```

Install **firebase CLI** as [static deployment](https://fossengineer.com/alternatives-for-hosting-static-websites/):

```sh
npm install -g firebase-tools

firebase login
firebase init
#firebase deploy

#firebase hosting:channel:list
#firebase hosting:channel:delete <channelId>
```

> It will be under `someprojectname.web.app` and you can revoke permissions at https://github.com/settings/connections/applications/89cf50f02ac6aaed3484

**And 2 `.yml` files** with a [GHA Workflow for the Firebase deployment](https://github.com/JAlcocerT/cybernetik-realestate-moises/tree/main/.github/workflows) are already configured

To add the **OpenGraph Image** so that it will be visible when sharing:

{{< /details >}}

The slider implementation is really cool:

![RE Web - Option 2](/blog_img/web/WebSnapshots/web_re.png)


For the real estate **calculator** app part...

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/" title="RE Calculator with Reflex ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/" title="Post to understand how French Amortization works ↗" icon="book-open" >}}
{{< /cards >}}

I almost forgot...the **GenAI Real estate Chat part**!


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/" title="Chat with Properties with Reflex ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LLamaIndex/With_Mem0" title="Source Code using OpenAI+ Anthropic with LlamaIndex and Mem0 ↗" icon="book-open" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/" title="Chat with Properties with Reflex ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LLamaIndex/With_Mem0" title="Source Code using OpenAI+ Anthropic with LlamaIndex and Mem0 ↗" icon="book-open" >}}
{{< /cards >}}





## Real Estate Web UI Enhancements


{{% details title="Themes Considered: ScrewFast, Nebulix, AstroFront...  🚀" closed="true" %}}

1. https://github.com/mearashadowfax/ScrewFast

> MIT | Open-source Astro website template with sleek, customizable TailwindCSS components.

2. https://github.com/unfolding-io/nebulix

> Nebulix, a Fast & Green Theme Based on Astro + Static CMS + Snipcart


```sh
git clone https://github.com/unfolding-io/nebulix
#.env
```

With very interesting components at `/src/content/project/crafting-the-perfect-cosmic-mojito.mdx`

```sh
#/src/content/project

#mogrify -format jpg *.avif #the images have to be jpeg or jpg to be zoomable
```

> http://localhost:4321/work/crafting-the-perfect-cosmic-mojito/



3. https://github.com/themefisher/astrofront-astro

> MIT | AstroJS-Powered Shopify Storefront Boilerplate with TailwindCSS and Nanostores. With **Shopify ecommerce integration.**

```sh
git clone https://github.com/themefisher/astrofront-astro

npm install
#npm audit fix
npm run dev #you will need shopify credentials for the .env
```

4. https://github.com/oxygenna-themes/foxi-astro-theme Which has an interesting /blog section with tags

> MIT | Foxi is an Astro theme crafted with Tailwind CSS, designed for blazing-fast performance and seamless user experience. Perfect for creating modern, responsive SaaS websites with minimal effort.

You can see the blogs at `/src/pages/blog` folder, after:

```sh
git clone https://github.com/oxygenna-themes/foxi-astro-theme

npm install & npm audit fix
npm run dev #localhost:4321
#npx astro add mdx #npm install @astrojs/mdx

#npm install vue @panzoom/panzoom @vueuse/core @nanostores/vue @vueuse/components @vueuse/integrations vue3-toastify body-scroll-lock vue3-popper
```

```js
// astro.config.mjs
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';

export default defineConfig({
  integrations: [mdx()],
});
```

Remember that you need to migrate also the content collection for `/src/pages/blog` and to update `/src/content/config.ts` to define what are the fields expected on the new collection (for example we can call it properties instead of blog).

```sh
npm install -D tailwindcss@latest @tailwindcss/vite@latest daisyui@latest
```

{{% /details %}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/blog/dev-web-code-css/" title="CSS 101 ↗" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/" title="JS 101 ↗" icon="book-open" >}}
{{< /cards >}}

## Real Estate Ad-ons

### Real Estate Calculator Web App

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/#for-the-real-estate-project" title="See the post about the first iteration of the tool" icon="book-open" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/#for-the-real-estate-project" title="See the post about the first iteration of the tool" icon="book-open" >}}
{{< /cards >}}

### Automated Photo Adquisition Tool

As this agency is having collaborations with couple of well known agents in the area, it was required to create a tool to **automate the photo adquisition** from their sites.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/#for-the-real-estate-project" title="See the post about the first iteration of the tool" icon="book-open" >}}
{{< /cards >}}

The client is responsible to ask for permissions first to his collaborators before using it, as it involves using **BS4 for scrapping**.


{{< details title="Migration Photo WebApp | Deployed with Cloudflared 📌" closed="true" >}}

Deployed at: <https://realestate_tool.jalcocertech.com/>

```sh
docker build -t realestate_tool_v4 . #1m16s at x13 and 3m12s at pi4gb
#docker exec -it realestate_tool_v4 /bin/bash
```

```yml
services:
  realestate_photo_tool:
    image: realestate_tool_v4
    container_name: realestate_tool_v4
    ports:
      - "8506:8501"
    working_dir: /app
    restart: always
    networks:
      - cloudflaretunnel_tunnel
    command: streamlit run OpenAI_MigrateWebInfo_v4st.py
    #command: tail -f /dev/null

networks:
   cloudflaretunnel_tunnel:
     external: true
```

{{< /details >}}


By using the `streamlit-authenticator` library, only my client can access it:

![Streamlit User Auth](/blog_img/biz/RE/re-tool-userauth.png)


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/#for-the-real-estate-project" title="Real Estate Scrapping Photos - Post ↗" image="/blog_img/biz/RE/RE-Scrap-Tools.png" subtitle="First iteration of the tool" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/WebMigrAItion/OpenAI_MigrateWebInfo_v3st.py" title="Web Photo MigrAItion Source" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Using bs4 and streamlit to download Photos as zip" >}}
{{< /cards >}}


## Conclusions

This is kind of a **four in one project**:

1. Responsive **Web** UI
2. **Real Estate Calculator** to engage users and potential clients
3. **Gen AI App** to provide recommendations based on the available houses
4. **Scrapping Tool** to get Photos automatically



5. Bonus: Newsletter (with mailerlite) + GDPR Compliant Web Analytics: [Litlyx](https://dashboard.litlyx.com/) + Forms/Questionaires:[Formbricks](https://jalcocert.github.io/JAlcocerT/blog/dev-forms)

**Result**: <https://dm-real-estate.com/> or https://moises-era.pages.dev (vs) https://dm-realestate.web.app/

{{< callout type="info" >}}
And with an interesting tool to get the photo properties adquisition automated
{{< /callout >}}

> Still, would you keep your [Wordpress](https://fossengineer.com/selfhosting-wordpress-docker/), [Ghost](https://fossengineer.com/selfhosting-ghost-docker/), Wix?

---

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-chat-with-your-data" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/langchain-chat-with-database/" title="Chat with Data" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Using LangChain Chains" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}



---

## Outro

### Other Sites ive worked on

{{< details title="Deployed with Cloudflare Pages or Firebase Mostly 📌" closed="true" >}}

There are few [static deployments **options**](https://fossengineer.com/alternatives-for-hosting-static-websites/):

```sh
npm install -g firebase-tools

firebase login
firebase init
#firebase deploy

#firebase hosting:channel:list
#firebase hosting:channel:delete <channelId>
```

You just need to follow [these commands](https://developers.cloudflare.com/workers/wrangler/commands/):

```sh
npx wrangler pages project create #this will install the wrangler CLI package
#npx wrangler pages project list # See the projects you already have
#npx wrangler pages deployment list 

#npm run build #build the file manually

#https://developers.cloudflare.com/pages/configuration/build-configuration/#framework-presets
npx wrangler pages deploy dist # normally will be dist, but whatever <BUILD_OUTPUT_DIRECTORY>

##npx wrangler pages project delete your_project_name
```

{{< /details >}}


{{< cards >}}
  {{< card link="https://cozyknittingclub.com/" title="Content Creator Blog" image="/blog_img/web/WebsSnapshots/Web_CKC.png" subtitle="For an instagramer who loves knitting" >}}
  {{< card link="https://morita-web.pages.dev//" title="Health Care Site" image="/blog_img/web/WebsSnapshots/Web_Nevin.png" subtitle="Because the brain is as important as the body" >}}
    {{< card link="https://dm-real-estate.com/" title="Real Estate Official Site" image="/blog_img/web/WebsSnapshots/Web_realestate.png" subtitle="A Real Estate Business Site for Spain" >}}
    {{< card link="https://jmodels.net/" title="Scale Modelling Blog" image="/blog_img/web/WebsSnapshots/Web-jmodels.png" subtitle="Fantastic Blog with ~1K Posts about Modelling" >}}
    {{< card link="https://ira-english.pages.dev/" title="Personal Business Landing" image="/blog_img/web/WebsSnapshots/Web_EnglishIra.png" subtitle="Landing Page for a well Known English Teacher" >}}
    {{< card link="https://jalcocert.github.io/Portfolio/" title="All your Links" image="/blog_img/web/WebsSnapshots/Web_PortfolioLinks.png" subtitle="Sleek collection of important Links" >}} 
    {{< card link="https://iodoctor.iotechcrafts.com/" title="Doctor Consultation" image="/blog_img/web/WebsSnapshots/Web_IoDoctor.png" subtitle="Landing for Scheduling Doctor Appointments" >}}          
  {{< card link="https://cyclingthere.com" title="My Travel Adventures" image="/blog_img/web/WebsSnapshots/Web_CyclingThere.png" subtitle="I can write and also create interesting photo galleries about my travel experiences" >}}
    
{{< /cards >}}

**Photo centered blogs:**

{{< cards >}}

  {{< card link="https://cozyknittingclub.com/" title="Content Creator Blog" image="/blog_img/web/WebsSnapshots/Web_CKC.png" subtitle="For an instagramer who loves knitting" >}}
    {{< card link="http://entreagujaypunto.com/" title="Punto Photo Gallery" image="/blog_img/web/web-entreagujaypunto.png" subtitle="A Photo centered Web for Punto" >}}
    {{< card link="https://enjoylittlethings.org/" title="Travel Adict Photo Gallery" image="/blog_img/web/WebsSnapshots/Web_PhotoGalleryAGA.png" subtitle="Because Photo & Travel lovers need something more than instagram" >}}    
    {{< card link="https://while.cyclingthere.com" image="/blog_img/web/whilecycling.png" title="Photo Gallery Blog" subtitle="Made with HUGO and Photo centered" >}}
{{< /cards >}

**Business Sites:**

{{< cards >}}
  {{< card link="https://iotechcrafts.web.app/" title="Business Website" image="/blog_img/web/WebsSnapshots/Web_IoTechCrafts.png" subtitle="A Website for Agency - AI & IoT Consulting Services">}}   
  {{< card link="https://iotiotechcrafts.web.app/" title="IoT SaaS Site" image="/blog_img/web/WebsSnapshots/web_iotiotech.png" subtitle="One Pager with FAQ and Pricing" >}}  
  {{< card link="https://iodoctor-iotechcrafts.web.app/" title="Web for Doctor Consultation" image="/blog_img/web/WebsSnapshots/web_iodoctors.png" subtitle="With Astro mdx blog and docs sections" >}}  
  {{< card link="https://ioracing-iotechcrafts.web.app/" title="IoT SaaS Site" image="/blog_img/web/WebsSnapshots/web_ioracing.png" subtitle="One Pager with FAQ, Pricing and MultiLang" >}}            
{{< /cards >}}

### Just Get Wordpress

No time for tinkering with web dev stuff?

Just get a wordpress going.

{{< details title="Wordpress Docker Compose for VPS 📌" closed="true" >}}

```yml
services:
  wordpress:
    image: wordpress:php7.4-apache
    container_name: wordpress
    ports:
      - 8085:80
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: root
      WORDPRESS_DB_NAME: wordpress
    restart: always
    networks:
      - wp

  mysql:
    image: mysql:8.0.13
    container_name: wordpressdb
    command: --default-authentication-plugin=mysql_native_password
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - mysql-data:/var/lib/mysql # Use the named volume
    restart: always
    networks:
      - wp

networks:
  wp:

volumes:
  mysql-data: # Define the named volume
```

{{< /details >}}

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