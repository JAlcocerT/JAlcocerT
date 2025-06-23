---
title: "Just shipping"
date: 2025-06-04T01:20:21+01:00
draft: false
tags: ["Entrepreneuring","Cloud VPS","QR","Authentication","Web","Business KPIs","ads","Funnel"]
description: 'Wedding stuff. Aka 200, you mean 4k?'
url: 'wedding-photo-galleries'
---

Its been a while since I was helping on [this wedding](https://jalcocert.github.io/JAlcocerT/software-for-weddings/)

All was about some software setup on VPS:

* [Hetzner](https://www.hetzner.com/cloud/)
* [Digital Ocean](https://www.digitalocean.com/pricing) 
* Any of the VPS covered [here](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#faq)


## The Offer

So...its very simple:

* People get married
* They like photos
* A lot of photos are *lost* in guests phones

The kind of idea that when you ask and people say that they'd buy it (with other's money, for sure)

And here we are with the solution for that pain.

This one is tested *in production* as seen [here](https://jalcocert.github.io/JAlcocerT/software-for-weddings)


Whats required?

1. https://filebrowser.org/configuration/custom-branding
2. A Landing [Page](#the-landing-page)

A little AI help on [neuromarketing](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/OpenAI_Neuromkt.py)

### QR Generator

This can be done in several ways

1. With Streamlit https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/QR_GenerAItor
2. With Python or several containers / tools as seen during the [initial wedding delivery](https://jalcocert.github.io/JAlcocerT/software-for-weddings/#what-i-learnt)
3. In theory, also with javascript on the client side...

And thanks to vibe coding, you can get very quick this kind of Flask App:

![Flask QR Generator](/blog_img/apps/flask/flask-qr.png)

### The Landing Page

Pictures 360, from every angle

Capture the special moments


{{< details title="With a Domain in Place 📌" closed="true" >}}


* https://www.namecheap.com/domains/
* Cloudflare domains
* Google Domains / SquareSpace
* GoDaddy...


{{< /details >}}


How people are doing this kind of stuff?

* https://www.gymlaunch.com/

Using tools like [webflow](https://webflow.com/pricing)...

https://web-check.xyz/check/https%3A%2F%2Fwww.gymlaunch.com%2F

It always great to find new astro themes:

* https://github.com/iann-mathaiya/nikola-tesla
* Saasify
* 

First things first: a catchy name

* GaleriaSlubna
* SlubneChwile

* https://fossengineer.com/alternatives-for-hosting-static-websites/

```sh
npx wrangler pages project create slubnechwile #this will install the wrangler CLI package
#galeriaslubna

#https://developers.cloudflare.com/pages/configuration/build-configuration/#framework-presets
npx wrangler pages deploy dist # normally will be dist/public, but whatever <BUILD_OUTPUT_DIRECTORY>
#https://slubnechwile.pages.dev/
```

#### Formbricks

Formbricks works perfectly with Astro being static:

![Formbricks and Astro](/blog_img/entrepre/wedding/formbrics-astro.png)

And also with n8n to make no code stuff with our leads.

### The Product

Create the svg and following the [custom branding](https://filebrowser.org/configuration/custom-branding)

```sh
convert "Desktop/JAlcocerTech xyz logo2.png" -threshold 50% -negate -transparent white -trim +repage temp.pnm && potrace temp.pnm -s -o "Desktop/JAlcocerTech-logo.svg" && rm temp.pnm
```

And dont forget to add in the UI settings the [custom location](https://github.com/filebrowser/filebrowser/tree/master/frontend/public/img/icons) `./branding`

### The VPS


#### Digital ocean 

https://cloud.digitalocean.com/droplets/new?i=af28ae&region=ams3&size=s-1vcpu-1gb

https://cloud.digitalocean.com/account/api/tokens
https://cloud.digitalocean.com/images/backups?i=af28ae&preserveScrollPosition=true


![Digital Ocean VPS and Extra Space](/blog_img/entrepre/wedding/DO-VPS.png)

> With current information, id say that Digital Ocean would be the go to for now

#### Hetzner

I was also very happy with Hetzner performance and pricing thought:

* https://console.hetzner.cloud
    * https://www.hetzner.com/storage/object-storage/

## The Leads

Or in other words: *How to Get Strangers To Want To Buy Your Stuff* As i learnt [here](https://www.acquisition.com/training/leads16)

As a friend recommended me [last year](https://jalcocert.github.io/JAlcocerT/this-year-was-crazy/): it's all about leads and offers

### The Lead Magnet

How about some [wedding theme](https://github.com/Boston343/horizon)?

### Interest Groups

* https://www.facebook.com/groups/549014068636656

### The Ads

The other side of the coin.

Same as you can paid cents when placing google adsense on your page...

There are people paying (surprise, *much more*) to place those ads.

Thats the business model of google, facebook and pretty much all social media platform out there.

#### FB and IG

Decide in which platform you might have better chances.

Or just try whatever.

Imo, for this kind of project a facebook or ig would be a good starting point.

For these to work you will need:

1. A facebook account with a FB Page
2. A Payment method ($$$)

{{< details title="How meta ads work 📌" closed="true" >}}

Facebook (now Meta) Ads work by allowing businesses and individuals to create and display advertisements to a highly specific and targeted audience across Meta's platforms, including Facebook, Instagram, Messenger, and Audience Network.

**How Facebook Ads Work**

The process generally follows these steps:

1.  **Define Your Objective:** Before anything else, you decide what you want to achieve with your ads. Facebook offers various campaign objectives, such as:
    * **Awareness:** Reach the maximum number of people to increase brand recognition.
    * **Traffic:** Drive people to your website, app, or other destination.
    * **Engagement:** Get more likes, comments, shares, event responses, or video views.
    * **Leads:** Collect contact information from potential customers.
    * **App Promotion:** Get people to install or use your app.
    * **Sales/Conversions:** Drive purchases or other valuable actions on your website.

2.  **Choose Your Audience (Targeting):** This is one of Facebook Ads' strongest features. You can define your audience based on:
    * **Demographics:** Location (country, city, zip code), age, gender, language, education level, relationship status, job title, etc.
    * **Interests:** Hobbies, pages they like, groups they join, topics they show interest in (e.g., "fitness," "travel," "cooking").
    * **Behaviors:** Purchase behavior, device usage, travel preferences, digital activities.
    * **Connections:** People connected to your Page, app, or event.
    * **Custom Audiences:** Uploading customer lists (emails, phone numbers) or targeting people who have interacted with your website (via Facebook Pixel), app, or Facebook/Instagram content. This is great for retargeting.
    * **Lookalike Audiences:** Once you have a Custom Audience, Facebook can find new people who are similar to your existing customers or website visitors.

3.  **Select Ad Placements:** You choose where your ads will appear. Options include:
    * Facebook Feeds (mobile and desktop)
    * Instagram Feeds and Stories
    * Messenger (Inbox, Stories)
    * Facebook Marketplace
    * Facebook Audience Network (third-party apps and websites)

4.  **Set Your Budget and Schedule:**
    * **Budget Type:**
        * **Daily Budget:** An average amount you're willing to spend per day.
        * **Lifetime Budget:** The total amount you're willing to spend over the entire duration of the campaign.
    * **Schedule:** You can set a start and end date for your campaign or run it continuously.

5.  **Choose a Bidding Strategy:** Facebook operates on an auction system. You tell Facebook how you want to bid for ad space:
    * **Lowest Cost (Automatic Bidding):** Facebook bids on your behalf to get you the most results for your budget. This is the default and often recommended for beginners.
    * **Bid Cap:** You set a maximum bid per action (e.g., per click).
    * **Cost Per Result Goal (Target Cost):** You tell Facebook your desired average cost per result, and it tries to stay close to that.
    * **Value Optimization/ROAS Goal:** For conversion campaigns, you can tell Facebook to optimize for higher-value purchases or a specific return on ad spend.

6.  **Create Your Ad Creative:** This is the actual ad content your audience will see. It includes:
    * **Format:** Single image, video, carousel (multiple images/videos), collection, Instant Experience.
    * **Text:** Primary text, headline, description.
    * **Call to Action (CTA):** A button (e.g., "Shop Now," "Learn More," "Sign Up").
    * **Destination:** The URL or app link users go to after clicking.

7.  **Publish, Monitor, and Optimize:** Once your ad is live, you'll use Meta Ads Manager to track its performance (impressions, clicks, conversions, cost per result). Based on the data, you can then make adjustments to your targeting, creative, budget, or bidding to improve results.

How Payment Works

Facebook's payment system for ads is generally automated and designed to be flexible.

1.  **Payment Methods:** Meta supports various payment methods, which can vary slightly by region but commonly include:
    * Credit and Debit Cards (Visa, Mastercard, American Express, Discover)
    * PayPal
    * Online Banking / Direct Debit (in some regions)
    * Local Payment Methods (specific to certain countries, e.g., Boleto in Brazil)
    * Facebook Ad Credits (promotional coupons)

2.  **Billing Thresholds (Postpaid Accounts):**
    * When you start, Facebook typically sets a small initial **billing threshold** (e.g., $25 USD).
    * As your ads run, you accrue costs. When your ad spend reaches this threshold, Facebook automatically charges your chosen payment method for that amount.
    * As you make successful payments, Facebook may **automatically raise your billing threshold** (e.g., to $50, then $100, etc.), allowing you to accumulate more charges before being billed. This builds trust with your account.
    * You can often **manually adjust your billing threshold** in your Ads Manager settings, but only up to a certain point determined by Facebook based on your payment history. Lowering it takes effect immediately; raising it might require successful payments at lower thresholds first.

3.  **Monthly Billing Date:**
    * Regardless of billing thresholds, Facebook also has a **monthly billing date** (e.g., the 1st of every month).
    * On this date, Facebook will charge your payment method for any remaining outstanding balance that hasn't yet hit a billing threshold.
    * This means you could be charged multiple times within a month (each time you hit a threshold) and then a final time on your monthly billing date for any leftover amount.

4.  **Prepaid vs. Postpaid:**
    * Most ad accounts operate on a **postpaid** model, where you run ads and then pay for the costs incurred (based on thresholds and billing dates).
    * In some regions or for specific accounts, a **prepaid** model might be available, where you add funds to your account balance first, and then ads run against that balance until it's depleted.

5.  **Ad Costs:**
    * You typically pay for **impressions (CPM - Cost Per Mille, or 1,000 impressions)** or **clicks (CPC - Cost Per Click)**, or for specific actions like conversions (CPA - Cost Per Action), depending on your campaign objective and bidding strategy.
    * The actual cost per impression, click, or action varies widely based on factors like:
        * **Audience:** Highly competitive or niche audiences can be more expensive.
        * **Placement:** Some placements (e.g., Instagram Stories) can be more expensive than others.
        * **Ad Quality & Relevance:** Facebook rewards high-quality, relevant ads with lower costs.
        * **Competition:** How many other advertisers are targeting the same audience at the same time.
        * **Seasonality:** Costs can increase during peak shopping seasons (e.g., Black Friday, holidays).
        * **Bidding Strategy:** Manual bidding can give you more control but requires more expertise.


{{< /details >}}

In summary, Facebook Ads provide a powerful, self-service platform for reaching specific audiences with flexible budgeting and a clear, automated payment system that typically charges you as your ad spend accrues or on a monthly basis.


#### Google Ads

{{< details title="Google Ads 101 📌" closed="true" >}}

Google Ads (formerly Google AdWords) is a powerful online advertising platform developed by Google, where advertisers bid to display brief advertisements, service offerings, product listings, or videos to web users.

It's how businesses get found on Google Search, YouTube, Gmail, and millions of other websites and apps.

Here's what you typically need to get started and participate in Google Ads:

1. A Google Account

* You'll need a standard Google account (like the one you use for Gmail, Google Drive, etc.). This acts as your login credential for Google Ads.
* If you don't have one, you can create a free Google account easily.

2. A Business/Website/Product/Service to Advertise

* Google Ads is for promoting something. You need a clear offering you want to advertise.
* **A Website (Highly Recommended):** While not strictly mandatory for *all* campaign types (e.g., call-only ads), having a good quality website is essential for most campaigns (especially Search and Display) as it's where you'll direct traffic. Your website should be user-friendly, load quickly, and clearly communicate your value proposition.

3. A Clear Advertising Objective

Just like with Facebook Ads, you need to know what you want to achieve. Google Ads offers various campaign objectives that guide your setup:
* **Sales:** Drive online sales, in-app sales, phone calls, or in-store sales.
* **Leads:** Get leads and other conversions by encouraging customers to take action.
* **Website traffic:** Get people to visit your website.
* **Product and brand consideration:** Encourage people to explore your products or services.
* **Brand awareness and reach:** Reach a broad audience and build brand recognition.
* **App promotion:** Get more app installs and engagements.
* **Local store visits and promotions:** Drive customers to physical stores.
* **Create a campaign without a goal's guidance:** For experienced advertisers who want full control.

4. An Understanding of How Google Ads Works (Basics)

Google Ads operates on an auction system, but it's not just about the highest bid.

* **Keywords:** For Search ads, you bid on keywords – the words or phrases people type into Google.
* **Ad Quality & Relevance:** Google prioritizes showing ads that are highly relevant and useful to the user's search query, and that lead to a good landing page experience. This is measured by **Quality Score**. A higher Quality Score can lead to lower costs and better ad positions.
* **Ad Rank:** Determines where your ad appears on the search results page. It's based on your bid, Quality Score, the context of the search, and expected impact of your ad extensions.
* **Cost-Per-Click (CPC):** You typically pay only when someone clicks on your ad.

5. Payment Information

You'll need to set up a billing method to pay for your ads.
* **Payment Methods:** Common methods include credit/debit cards (Visa, Mastercard, American Express), bank transfers, and direct debits. Available options can vary by country and currency.
* **Payment Settings:**
    * **Automatic payments:** You're automatically charged after your ads run, either when you reach a preset amount (your billing threshold) or 30 days after your last automatic charge, whichever comes first. This is the most common method.
    * **Manual payments:** You make a payment to Google Ads *before* your ads run. Your ads will then run until that payment is used up.
    * **Monthly invoicing:** Available for large businesses that meet certain eligibility requirements, allowing them to accrue costs and receive a monthly invoice.

6. (Optional but Recommended) Google Business Profile & Google Analytics

* **Google Business Profile:** If you have a physical location, setting up and verifying a Google Business Profile (formerly Google My Business) is crucial. It helps your business appear in Google Maps, local search results, and can be linked to your Google Ads account for Local campaigns.
* **Google Analytics:** Linking your Google Analytics account to Google Ads allows you to get much deeper insights into user behavior on your website after they click your ads, helping you optimize your campaigns.

How to Get Started:

1.  **Go to the Google Ads Website:** Open your web browser and go to `ads.google.com`.
2.  **Click "Start Now" or "Sign In":** If you have a Google account, sign in. If not, you'll be prompted to create one.
3.  **Account Setup Process:** Google will guide you through an initial setup process.
    * They might ask for your business name and website.
    * They'll prompt you to choose an initial advertising goal.
    * They'll suggest campaign types (e.g., Search, Display, Video, Shopping, Performance Max).
    * You'll set your budget.
    * You'll create your first ad (or a basic version of it).
    * Finally, you'll enter your payment details.

**Important Note:** Google often tries to guide new users through a "Smart campaign" setup, which is simplified. While it's a quick way to get started, for more control and advanced features, you'll eventually want to explore creating "Expert mode" campaigns directly in the Google Ads interface.

Participating in Google Ads requires a commitment to learning and ongoing optimization, but the basic requirements are straightforward to meet.

{{< /details >}}


## Financials

Recently I was reading about [Pricing strategies](https://jalcocert.github.io/JAlcocerT/real-estate-website/#pricing-strategy) and Menger's view.

If everything works...

You should get:

- A very Clear view of your CAC
- Very clear picture of your LTV: assuming that people will just buy once makes things easy
    - If there is some word of mouth and virality, better for you, just dont count on it
- Your infra costs are very well defined, a sper your selected [VPS](#the-vps)
- Some of the eyes that saw your ad and product, would hopefully buy your [pricing strategy](https://jalcocert.github.io/JAlcocerT/real-estate-website/#pricing-strategy)

Do the math and get:

- Some revenue: EBITDA (?)
- Net profit after all the expenses and so on
- NRR (Net revenue retention)

Create your funnel: