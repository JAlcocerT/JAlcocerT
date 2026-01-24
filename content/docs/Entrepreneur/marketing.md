---
title: Marketing
type: docs
prev: /docs/android/
next: docs/
draft: false
---




## Leads from PDFs

Create the PDF as a code with your contact details -> print -> paste across the city.

### QR Creation

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/JAlcocerT/blob/main/Z_TestingLanguages/Z_Python/QR_generation.ipynb)


## Emails

What a surprise, you need to master [emails and their SMTP](https://jalcocert.github.io/JAlcocerT/emails-101/).

if you are [building a sales pipeline](https://jalcocert.github.io/JAlcocerT/apify/) and doing cold email, you will need to [verify emails](https://jalcocert.github.io/JAlcocerT/email-verification-pocketbase/#conclusions).


### Newsletters

The power of emails.

#### MailerLite

https://jalcocert.github.io/JAlcocerT/mailerlite-for-saas/#mailerlite-api


{{< details title="Setup MailerLite with your Custom Domain 📌" closed="true" >}}

You will need to authenticate that you own the email and also the domain (with DNS).

Go to your [mailerlite dashboard UI](https://dashboard.mailerlite.com)

I am using Cloudflare for that domain, and the DNS were updated automatically via UI.

There are some **CName and txt records** and they will be **DNS only**, not proxied.

![MailerLite Custom Domain Setup](/blog_img/web/SaaS/mailerlite-domainsetup.png)

**Create a new form** and you will get the JS to place before the `</head>` of your web.

```js
<!-- MailerLite Universal -->
<script>
    (function(w,d,e,u,f,l,n){w[f]=w[f]||function(){(w[f].q=w[f].q||[])
    .push(arguments);},l=d.createElement(e),l.async=1,l.src=u,
    n=d.getElementsByTagName(e)[0],n.parentNode.insertBefore(l,n);})
    (window,document,'script','https://assets.mailerlite.com/js/universal.js','ml');
    ml('account', 'some_acount_id');
</script>
<!-- End MailerLite Universal -->
```

> You can also get **MailerLite working with a button**, so that it opens as pop up:

```html
<a class="ml-onclick-form" href="javascript:void(0)" onclick="ml('show', 'some_id_here', true)">Click here to show form</a>

and use it with your components, for example
<form id="simple-newsletter-form" class="input-container" method="post" action="javascript:void(0);" onsubmit="ml('show', 'some_id_here', true); return false;">
    <input type="submit" value="Ready to Know?" class="ml-onclick-form" style="appearance: button; -webkit-appearance: button; cursor: pointer;">
</form>
```

{{< /details >}}

#### RSS

Some websites bring a **RSS feed**, so that you can subscribe with tools like FreshRSS:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/fresh-rss" title="FreshRSS | Docker Config 🐋 ↗" >}}
{{< /cards >}}


```sh
# Test RSS feed locally
curl -s http://localhost:4321/rss.xml | head -10
# Count episodes
curl -s http://localhost:4321/rss.xml | grep -c "<item>"
# Get episode titles
curl -s http://localhost:4321/rss.xml | grep -o "<title>.*</title>"

# Check headers
curl -I http://localhost:4321/rss.xml
# Test on production (once deployed)
curl -s https://podcast.jalcocertech.com/rss.xml | head -10
```

<!-- https://www.youtube.com/watch?v=mDMGtMOx-Fk -->

{{< youtube "mDMGtMOx-Fk" >}}

Youtube is one of the sites providing **RSS feeds for the channels**:

So we can pull the last video of a channel like: *just take the ChannelID*

{{< cards cols="1" >}}
  {{< card link="https://youtube.com/@JAlcocerTech" title="My YT Tech Channel ↗" >}}
{{< /cards >}}

<!-- 
https://studio.youtube.com/channel/UCPPMA8ZEusAe5dVH6PbjZFA/videos/ -->

```sh
curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCPPMA8ZEusAe5dVH6PbjZFA"
#curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCPPMA8ZEusAe5dVH6PbjZFA" | grep -oP '(?<=<title>).*?(?=</title>)' | head -5
```




## Calendar

Among [all the things that can be embedded](https://jalcocert.github.io/JAlcocerT/embed-that/) into a website, we have not only bots, but also cool calendars.


{{< details title="Cal dot com Embeded and API - Use cases 📌" closed="true" >}}

1. Bring cool calendar widgets to your [landing pages](https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#vibe-coding-an-astro-ssr-landing-page):

![alt text](/blog_img/entrepre/tiersofservice/dwi/cal-embed.png)

https://jalcocert.github.io/JAlcocerT/creating-landing-pages-astro/#the-result


![Booking tours with Cal](/blog_img/web/success10-ourika/ourika-cal.png)


{{< /details >}}

* https://cal.com/help/event-types/hideorganizersemail#hide-organizers-email
* https://cal.com/help/event-types/limit-future-bookings

{{< cards >}}
  {{< card link="https://cal.com/jalcocertech/consulting" title="Tech Consulting" image="/blog_img/email/cal-email-stripe.png" subtitle="Let's discuss your tech needs" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/selling-with-a-landing-website/#vibe-coding-an-astro-ssr-landing-page" title="DWY - Landing Page" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting and Tiers of Service - Funnel" >}}
{{< /cards >}}

* https://cal.com/jalcocertech
* https://app.cal.com/apps



### Integrate Stripe

You can enable so that before someone booking your time, they have to pay first:

<!-- ![Calcom Email x Stripe ](/blog_img/email/cal-email-stripe.png) -->

This increase friction - so you need to find the sweet spot.

> No friction will never be the perfect one for converting leads.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#stripe" title="Using Stripe withing a Flask" image="/blog_img/entrepre/stripe/stripe-apps.png" subtitle="Stripe 101 withing a SaaS PoC" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/understading-crypto-with-ai/" title="Cyrpto Too?" image="/blog_img/entrepre/stripe/stripe-apps.png" subtitle="Cal potentially accepts crypto payments too :O - Check your local regulations first!" >}}
{{< /cards >}}

<!-- 
![Stripe Apps Connection](/blog_img/entrepre/stripe/stripe-apps.png) 
-->

To integrate stripe properly, but not only technically, you need to have a look to [offers](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#offers) and their [pricing](https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#pricing):

* https://docs.stripe.com/products-prices/pricing-models



## In Touch with Clients

**Messaging Automation** for All - Omni-channel marketing automation & transactional messaging. 

Embeddable, self-hostable, & infinitely flexible.

Dittofeed: Free Open Source Automated Communication Platform

* https://github.com/dittofeed/dittofeed
  * https://docs.dittofeed.com/introduction
  
> MIT |  Open-source customer engagement. Automate transactional and marketing messages across email, SMS, mobile push, WhatsApp, Slack, and more 📨 


<!-- https://www.youtube.com/watch?v=ycs53MFoW4E -->

{{< youtube "ycs53MFoW4E" >}}

You can always [embed things](https://jalcocert.github.io/JAlcocerT/embed-that/) into your marketing websites:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/embed-that/#chatwoot" title="OSS Live Chat - Chatwoot" image="/blog_img/entrepre/chatwoot_livechat.png" subtitle="Tinkering with ChatWoot" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/embed-that/#whatsap-bouble" title="Embedded WA / Cal Bouble" image="/blog_img/web/astro-whatsapp-bouble.png" subtitle="Creating an Astro WA Bouble" >}}  
{{< /cards >}}


## Ads

<!-- ![Good old printed lead with QR in an European park](/blog_img/biz/leads/good-old-ad.png) -->

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/real-estate-landing/#making-website-services-known" title="Marketing  Example for Services" image="/blog_img/biz/leads/good-old-ad.png" subtitle="Guerrilla Marketing via PDFs!" >}}
{{< /cards >}}

0. Social Media: *for those creating content / bip to grow an audience*

Social media ~~is where you think [you have a blog](https://jalcocert.github.io/JAlcocerT/create-your-website/)~~ are big ad platforms:


![PostIZ working with https](/blog_img/selfh/postiz/postiz-https-ui.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/photo-video-tinkering/#how-to-setup-postiz" title="PostIZ | 101 Post ↗" image="/blog_img/selfh/postiz/postiz-https-ui.png" subtitle="Setup Postiz while tinkering with photo and video" >}}
  {{< card link="https://www.jalcocertech.com" title="JAlcocerTech Custom Solutions" image="/blog_img/web/astro/astro-datanova-animated-graph.png" subtitle="This is DFY only" >}}
{{< /cards >}}

1. GAds

It's all about: `https://ads.google.com/`

Google ads plays well with GA4.

You could also use Umami + PostHog to track your ads.

2. FaceBook Ads

In theory, cheaper, but with less intent that gads.

So you will potentially need more reps.

## Leads

It was not obvious to me to understand what a lead is:

* https://github.com/JAlcocerT/leads-slubnechwile

The first time a marketer told me [about APIFY](https://jalcocert.github.io/JAlcocerT/apify/), was quite obvious that this was not impossible.

Take into consideration that experts advice is to:

1. Ads are better for mass conversion of lower ticket items
2. Cold emails ~ Leads are better for higher ticket items

### Funnels

Once you get leads, you want to make sure you convert them into customers.

With a funnel, you can visualize the process of converting leads into customers.

