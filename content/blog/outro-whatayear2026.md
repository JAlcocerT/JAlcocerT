---
title: "What a Year...2026"
date: 2026-12-23
draft: false
tags: ["Year-Review","FY26","D&A Tech Stack"]
description: 'Looking back to the learnings of the year 2026.'
url: 'tech-recap-2026'
---


Offers

1. Create individual pages on jalcocertech.com with stripe plugged, share on social media / ads and do draft:true when old, but history will be kept on code .mdx


### Curated Posts / Video

D&A Recap + OLTP Post (ERPs) and OLAP Post

0. Creating D&A Reports with AI

> Want a website? DIY your own with this free ebook when subscribed / DWY with consulting / contact for a DFY.

> > That's how ive done the ebook

1. Embeded Chatbots for a business website - Real Estate example.

2. I did not know that **creating an ebook** was that simple

https://www.amazon.es/sendtokindle

> Create ebooks be like: upload .md + upload image done via canva = download pdf/epub thanks to pandoc

> > Similar to ~tiiny.host

2. About Posthog: Post an ebook page post on IG, then web session will be recorded and a yt video can be made out of that


3. How to create a **waiting list** to test your ideas - Share on ig too.

4. Status Pages for services: Kener / UptimeKuma. SLA matters

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}

5. Web Analytics: GDPR compliant

6. Client adquisition data pipeline.

To be tested with *,artists,designers and wannabe's'* from social media.

If someone [has a linktree free](https://jalcocert.github.io/JAlcocerT/websites-themes-2024/#scaling-ideas), is a potential candidate.

7. Boiler plate for vibe coders: WebApps with proper auth flows with NextJS, like this the Slidev+LogTo setup

8. Proper CI/CD for streamlit. Hospital D&A: https://github.com/jlleongarcia/X-ray-imaging-analysis/commit/2a2eb68132834b39ce8ff3e9e77e8d7d87e801b5

> Latest features shipped properly: https://github.com/JAlcocerT/X-ray-imaging-analysis + youtube video

9. Authentication Post

https://jalcocert.github.io/JAlcocerT/social-signin-101/#conclusions
https://jalcocert.github.io/JAlcocerT/social-signin-101/


10. Embeded Analytics con Graphic Walker

https://github.com/Kanaries/graphic-walker

> Apache v2 |  An open source alternative to Tableau. **Embeddable visual analytic**

![MySQL CLI Install](/blog_img/GenAI/langchain-chinook-sample.png) 

11. geolocation

https://racechrono.com/

Improve your lap times with RaceChrono


12. Tinker with php and wordpress?

If you start fresh on a VPS and have Docker and WordPress set up, bringing your WordPress theme into that environment involves a few steps:

### Step 1: Prepare Your Docker WordPress Setup
Ensure your WordPress Docker container is running and accessible. Usually, you’ll have WordPress files mounted on a volume inside the container, often at `/var/www/html/wp-content/themes/`.

### Step 2: Copy Your Theme to the VPS
You can bring the theme files over to the VPS using:

- **SCP or SFTP**: Upload your theme folder (which contains `style.css`, `functions.php`, and all necessary theme files) into the WordPress themes directory on the VPS.  
  Example SCP command:
  ```bash
  scp -r /local/path/to/my-theme username@vps_ip:/path-to-docker-volume/wp-content/themes/
  ```

- **Git Clone**: If your theme is in a Git repository (e.g., GitHub), you can clone it directly inside the themes folder if you have access on the VPS:  
  ```bash
  cd /path-to-docker-volume/wp-content/themes/
  git clone https://github.com/your_username/your-wordpress-theme.git
  ```

- **Docker Volume Mounting (for Development)**: When developing locally or on VPS, you can mount your local theme folder as a Docker volume in the container for live edits without copying each time.

### Step 3: Activate the Theme in WordPress
Once your theme files are in the themes directory:
1. Log in to your WordPress admin at `http://your-vps-ip/wp-admin`.
2. Navigate to **Appearance → Themes**.
3. Find your uploaded theme and click **Activate**.

### Step 4: Optional—Upload Theme ZIP via Admin
As an alternative, through the WordPress Admin UI:
- Go to **Appearance → Themes → Add New → Upload Theme**.
- Upload a zip archive of your theme; WordPress will install and activate it.

### Summary
| Method | Description | When to Use |
|--------|-------------|-------------|
| SCP/SFTP Copy | Manually copy theme files | Direct file control, VPS access |
| Git Clone | Clone theme repo directly | Theme under Git version control |
| Docker Volume Mount | Mount theme folder as volume | Development/live sync |
| WordPress UI Upload | Upload via admin dashboard | Simple manual install |

This workflow lets you manage your themes conveniently on a fresh Docker WordPress VPS environment.

Yes, there are many open-source WordPress themes freely available on GitHub. In fact, thousands of developers and organizations—including Automattic (the company behind WordPress.com)—host and maintain GPL-licensed WordPress themes there. These can be used, studied, modified, or forked for your own projects.

### Examples of Popular Open-Source WordPress Themes on GitHub
Some of the most widely used and high-quality open-source WordPress themes include:

- **[Roots / Sage](https://github.com/roots/sage)** — a Laravel Blade-based WordPress starter theme with Tailwind CSS and full block editor support; a favorite among professional developers (over 13k stars).[1]
- **Automattic / themes** — a collection of official free themes built by the WordPress.com team, released under GPL-2.0.[2]
- **WordPress / community-themes** — a repository of block-based themes demonstrating WordPress’s new Full Site Editing (FSE) capabilities, developed collaboratively by the community.[3]
- **digitoimistodude / air-light** — a lightweight (<20 kB) starter theme optimized for developers, using HTML5 and minimal dependencies.[6]
- **them.es** — open-source starter themes built with Bootstrap or Material Design that support full site editing, responsive design, localization, and build automation.[8]
- **solstice23 / Argon** and **mirai-mamori / Sakurairo** — popular modern community-maintained designs supporting internationalization and colorful UI.[1]

You can explore thousands more in the **GitHub “wordpress-theme” topic**, which currently includes over 4,000 public repositories across PHP, CSS, and JavaScript projects.[1]

### Installing Themes from GitHub
You can manually download a theme ZIP file from GitHub and install it through **WordPress → Appearance → Themes → Upload Theme**.  
Alternatively, use tools like **WP Pusher** or **GitHub Updater** to install and automatically update WordPress themes directly from public GitHub repositories.[5][9]

All of these themes respect GPL open-source licensing, meaning you can modify or even resell them under your own distribution as long as you retain the same license.

[1](https://github.com/topics/wordpress-theme)
[2](https://github.com/Automattic/themes)
[3](https://github.com/WordPress/community-themes)
[4](https://github.com/topics/wordpress-starter-theme)
[5](https://www.fastcomet.com/kb/install-wordpress-themes-and-plugins-from-github)
[6](https://github.com/digitoimistodude/air-light)
[7](https://sourceforge.net/directory/wordpress-themes/)
[8](https://them.es)
[9](https://www.wpbeginner.com/pl/beginners-guide/how-to-install-wordpress-plugins-and-themes-from-github/)
[10](https://ltheme.com/wordpress-github-plugin/)

<!-- 
https://youtu.be/tQOxnCz2lwM?si=XTgvyi-qnm3ZKiAl
 -->

{{< youtube "tQOxnCz2lwM" >}}


<!-- 
Observability Platform for LLMs
  https://github.com/traceloop/openllmetry
  https://github.com/langfuse/langfuse
  
  Epam Dial + prometheus + grafana
  Or with LangSmith
Also DataDog - https://docs.datadoghq.com/llm_observability/ -->



<!-- Goals:
  • AI Gen
    LangChain
    LocalModels: with Docker
    From Streamlit to Chainlit / Gradio: https://pypi.org/project/gradio/
    LLMOps: MLFlow, Airflow, VectorDBs… Onboarding Guide - GenAI-X Innovation Team - EPAM Knowledge Base
      mlflow/mlflow: Open source platform for the machine learning lifecycle (github.com)
    GPT4-Turbo
  • V3 of ML trainnings - To include MLFlow
Airflow to start some job? -->


### Serverless

1. https://github.com/neondatabase/neon

> Apache v2 |  Neon: Serverless Postgres. We separated storage and compute to offer autoscaling, code-like database branching, and scale to zero.


### PaaS

#https://www.youtube.com/watch?v=hl8ebudhqZU

To build an e-commerce system around Coolify that can spin up WordPress or Ghost sites for users on demand, you would need several components working together to automate deployment, user management, and payments:

Key Components Required

1. **Coolify as Deployment Backend**  
   Use Coolify’s API or CLI to automate deployment of WordPress or Ghost instances.
   Coolify can deploy Dockerized or containerized apps from templates or Git repos: so the astro ebooks, linktree etc could also be deployed.

2. **E-Commerce Platform / Storefront**  
   - A web frontend where users can browse WordPress or Ghost site templates, choose options, and pay.
   - Could be a custom React/Vue app or integration with existing e-commerce platforms like Shopify, WooCommerce, or headless commerce solutions.
   - Supports payment gateways (Stripe, PayPal, etc.).

3. **User & Site Management System**  
   - Backend that manages user accounts and tracks purchased subscriptions or sites.
   - Upon purchase, triggers creation of new WordPress/Ghost site deployment via Coolify API.
   - Maintains credentials and site URLs for users.

4. **Automation/orchestration Layer**  
   - Service or serverless function listening for new orders.
   - Interacts with Coolify API to spin up new containers with WordPress or Ghost.
   - Configures environment variables (database credentials, admin user info) and DNS routing.

5. **Database & Persistent Storage**  
   - Since WordPress and Ghost require databases, you need persistent database instances (MySQL/MariaDB for WordPress, SQLite/MySQL or PostgreSQL for Ghost) managed either by Coolify or externally.
   - Persistent volumes for user content.

6. **Domain & SSL Management**  
   - Automated DNS provisioning or user prompts to configure domains.
   - Automated SSL certificate provisioning via Let’s Encrypt or similar integrated into Coolify or custom layer.

7. **Scaling & Monitoring**  
   - Infrastructure monitoring with alerts.
   - User limits or scaling policies as site numbers grow.

Integration Example Flow

- User visits e-commerce site → selects WordPress/Ghost plan or template → pays → backend service calls Coolify API → deploys new instance with site setup → user receives site access info.

- Coolify can handle container deployment and app lifecycle.
- You need to build or integrate a payment-enabled storefront and user management system.
- Automate deployment triggers via Coolify’s API.
- Ensure persistent database and storage solutions.
- Automate domain and SSL handling for user convenience.

This architecture turns Coolify into a deployment engine behind a full multi-tenant hosted WordPress/Ghost e-commerce platform. It requires significant development beyond Coolify itself but is fully achievable with Coolify as the core deployment layer.[1][2]

[1](https://coolify.io/docs/)
[2](https://coolify.io/docs/get-started/contribute/service)