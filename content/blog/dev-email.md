---
title: "SMTP and e-mail stuff"
date: 2025-11-22
draft: false
tags: ["EMPs","Mailgun API","Amazon SES vs MailTrap","PostIZ vs GrowChief","MailerSend vs ListMonk"]
description: 'Email is hard. Social Media OutReach, is not.'
url: 'emails-101'
---



**TL;DR**

You probably need leads.

And have no F*** idea how SMTP actually works.

What you know is that cold email can get you Cash Flow.

Specially when combined with a [proper *APIFY based* sales pipeline](https://jalcocert.github.io/JAlcocerT/apify/#a-sales-pipeline) and automation tools [for marketers](https://jalcocert.github.io/JAlcocerT/software-for-marketing-agencies/).

https://mxroute.com/

SMTP stuff is messy, a collection of thoughts that helped me understand tech email concepts better

Unfortunately, [This](https://github.com/umuterturk/email-verifier) does not work anymore: https://github.com/umuterturk/email-verifier

**Intro**

I was happy enough with Google and Stripe integrated into cal.com

![Cal x Stripe](/blog_img/email/cal-email-stripe.png)

So far I got proper *and high level* custom email integration via:

1. [ProtonMail](#proton-mail) - https://pr.tn/ref/RHJ7YZE8BN8G

You can bring your domains to ProtonMail and send emails from them: https://account.proton.me/u/0/mail/identity-addresses

2. [Mailerlite](https://jalcocert.github.io/JAlcocerT/blog/dev-forms/#mailerlite): at the time of writing, they allow one custom domain free.


3. Via LogTo: also to redirect to your custom domain for auth login, they will send an email with the code to enter your webapp


4. And ok, thanks to Google Firebase we get out of the box email validation...


But for something more custom...I have been lacking how actually email/SMTP work.

<!-- https://youtu.be/Ksk42UzpO-I?si=9DqwYecMhxw4E-DK -->

{{< youtube "Ksk42UzpO-I" >}}

Before we get started, you might keep this close to you: https://temp-mail.org/

* https://github.com/4w4k3/KnockMail

Same as [auth is hard](https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/#conclusions), until [its not](https://jalcocert.github.io/JAlcocerT/social-signin-101/).

I want the same to happen with SMTP/emails.


> But it did not work for me out of the box...

## Email for me so far

I got to send (and receive) emails via one of my domains via gmail.

At least when it was google domains, when it migrated to squarespaces the setup stoped working.

Too goo tobe true I guess.




### KnockMail 

Does an email you logged into your new waiting/[ebook list with Pocketbase](https://jalcocert.github.io/JAlcocerT/things-as-a-code/#ebooks-pdf-or-web-version) even exists?

KnockMail is a tool designed to **verify the existence of email addresses**. 

But the project has...8 years w/o an update.

* https://www.youtube.com/watch?v=0XnbAdDcDoE

It addresses the problem of email validation, helping users confirm whether an email address is active or not. 

This can be essential for businesses and developers to maintain clean email lists and improve communication efficiency.

**Key Features**

- **Creator**: Developed by Alisson Moretto (4w4k3).
  
- **Installation and Running**:
  - Clone the repository:  
    `git clone https://github.com/4w4k3/KnockMail.git`
  - Navigate to the directory:  
    `cd KnockMail`
  - Install required packages:  
    `pip install -r requeriments.txt`
  - Run the application:  
    `python knock.py` (or `python2.7 knock.py` for Python 2.7).

- **Compatibility**: 
  - Tested on various Linux distributions: 
    - Kali Linux (SANA & ROLLING)
    - Ubuntu 14.04-16.04 LTS
    - Debian 8.5
    - Linux Mint 18.1

- **License**: Licensed under the BSD-3-Clause.

- **Contributions**: Open for feature suggestions and improvements.

**Conclusion**

KnockMail is a useful tool for email verification, enhancing communication reliability. 


<!-- https://www.youtube.com/watch?v=sJQUuN7R8sA&themeRefresh=1 -->

{{< youtube "sJQUuN7R8sA" >}}



* MailInaBox - https://www.maketecheasier.com/create-email-server-linux-with-mail-in-a-box/

{{< callout type="warning" >}}
This is advanced
{{< /callout >}}

Self-hosted [Stalwart mail server](https://gist.github.com/chripede/99b7eaa1101ee05cc64a59b46e4d299f?ref=selfh.st)

[SMTP2Go](https://www.reddit.com/r/selfhosted/comments/1hr7bi5/smtp2go_free_plan_spam_score/)


* https://github.com/simple-login/app

>  The SimpleLogin back-end and web app 

## SMTP

## Email APIs

How to do email stuff...with code

Mailtrap competitors primarily include other email testing and delivery platforms that offer similar capabilities for email sandboxing, deliverability testing, spam checking, and transactional email sending. Some well-known Mailtrap competitors are:

- [Mailgun](https://www.mailgun.com/pricing/): Offers advanced email sending APIs, email validation, and analytics for deliverability and engagement.
- [SendGrid](https://sendgrid.com/en-us/pricing?tab=1_1) (by Twilio!): Provides scalable email sending, marketing campaign features, and email analytics.
- Postmark: Focuses on transactional email delivery with high deliverability rates.
- Litmus: Known for email previewing across many email clients and spam testing.
- [MailerLite](#mailerlite): Combined email marketing and delivery platform popular with small businesses.
  - Use it via: https://dashboard.mailerlite.com/dashboard as an alternative to mailchimp
  - [Mailersend](https://www.mailersend.com/) - transactional email alternative that competes with SendGrid and MailGun
- Email Sandbox: A testing-focused platform providing sandboxing for email templates and deliverability testing.
- GMass: Primarily a Gmail-based email marketing and campaign testing tool.

These alternatives vary in focus—from developer-centric testing, marketing automation features, transactional email delivery, or email validation services. 

Some are more suited for broad marketing campaigns while others emphasize developer tools for testing and debugging emails during development cycles.

Mailtrap’s niche is developer-friendly email sandboxing and testing, while others may offer more end-user marketing or validation features.

Regarding ease of configuration among the competitors:

| Service      | Ease of Configuration                                    | Notes                                             |
|--------------|----------------------------------------------------------|---------------------------------------------------|
| Mailtrap     | Very user-friendly, specifically designed for developers | Easy SMTP/API setup, great for email testing      |
| SendGrid     | Moderate, with good documentation and UI                 | Provides marketing features, can be more complex  |
| Postmark     | Simple and focused on transactional email                | Straightforward setup, less marketing complexity  |
| Mailgun      | Moderate to advanced, developer-centered                  | Powerful API but requires technical knowledge     |
| Amazon SES   | More technical, requires AWS knowledge                    | Powerful but steeper learning curve                |
| MailHog      | Very easy, open-source, self-hosted                        | Great for local dev/testing, less for production  |


**Sendgrid** just block me few minutes after creating my account.

Without even sending or trying any single feature.

That was interesting :)


For open-source or closer to open-source alternatives to Mailtrap, these stand out:

- MailHog: A lightweight, open-source email testing tool with a web interface, great for catching and viewing emails in dev environments.
- MailDev: Similar to MailHog, built with Node.js, easy to run locally for testing.
- Papercut and MailCatcher: Other open-source SMTP servers and email testing tools, mostly used for development and testing phases.

These open-source tools are typically easier to self-host and modify than proprietary solutions like Mailtrap but usually lack advanced monitoring or deliverability analytics.[4][5]

In summary:
- Amazon SES excels in scalability and cost for high-volume senders but requires technical setup.
- Mailtrap is among the easiest to configure for developers focusing on testing.
- MailHog and similar tools are the best open-source options for local email testing environments.

This should help balance ease of use, open-source preference, and scalability needs based on the specific use case.


### Amazon SES

Amazon simple email service!

Amazon SES is a highly scalable and cost-effective email sending service, especially well-suited for businesses already using AWS infrastructure. 

It offers robust deliverability, pay-as-you-go pricing, and detailed monitoring tools, but it requires technical expertise for setup and management. 

Its API and SMTP interfaces provide flexibility but might present a learning curve for less technical users.


### MailGun

I tested the free plan as per [this](https://signup.mailgun.com/new/signup?plan_name=dev_free&currency=USD)

Once logged in, you will go to: https://app.mailgun.com/dashboard?tab=send

![Setup mailgun free tier](/blog_img/selfh/marketing/mailgun-free-tier.png)

It can also help us to validate emails!


<!-- https://www.youtube.com/watch?v=LnVRGV-9NOY -->

{{< youtube "LnVRGV-9NOY" >}}

And also to send emails with your custom domain to whatever validated email we have.

https://documentation.mailgun.com/docs/mailgun/user-manual/sending-messages/send-smtp
https://www.mailgun.com/blog/email/which-smtp-port-understanding-ports-25-465-587/

### Mailjet

https://www.mailjet.com/pricing/

https://app.mailjet.com/integrations

### Resend

People use that one for some contact forms, as seen on [this post section](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/#managing-packages-for-ssgs), together with [SSG Themes like this](https://github.com/HugoRCD/canvas?tab=readme-ov-file#setup-the-contact-form).

* https://resend.com/signup
  * https://github.com/HugoRCD/canvas

  
## Email for Marketing

I was writting about marketing some time back.

In the meantime, saw: https://github.com/aaPanel/BillionMail

> agpl v3.0 |  BillionMail gives you open-source MailServer, NewsLetter, Email Marketing — fully self-hosted, dev-friendly, and free from monthly fees.  

We also have the good olds, like **ListMonk**

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/listmonk" title="Tools like ListMonk are Selfostable and allow for transactional emails with attachment! | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mautic" title="Mautic SelfHosted Email Newsletter | Docker Config 🐋 ↗" >}}
{{< /cards >}}

---

## Conclusions



All these SMTP setups will help you with your social media, if you are into it.

If you just wanted a quick way to chat...there are many [Interesting Chats](https://jalcocert.github.io/JAlcocerT/homelab-security/#privacy-apps) to use :)


### Proton Mail

You can use ProtonMail together with your domain.

But this wont work from transactional nor marketing emails.

![DNS Config for ProtonMail](/blog_img/email/dns-protonmail.png)

For Google this trick used to work for the same:

![GMAIL custom domain for google](/blog_img/email/dns-gmail.png)


### PocketBase x MailTrap

[Mailtrap](https://mailtrap.io/signin) can be used to send one-time codes or magic links for user verification purposes such as account creation or subscription confirmation. 

Since Mailtrap provides SMTP email sending capabilities, you can configure PocketBase or any backend service to use Mailtrap's SMTP settings to send transactional emails including verification codes or magic links.

This allows you to deliver emails securely and reliably during development and testing phases without sending real emails to users.

Once your system is ready for production, you can switch from Mailtrap to a real SMTP provider if desired. 

But for sending verification emails with OTPs or magic links in development or even production (if you choose), Mailtrap fully supports this use case.


#### MailTrap x Marketing and Automation

Mailtrap can be integrated with Mautic, Odoo, and n8n, primarily via its SMTP and API services.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/mautic" title="Mautic | Docker Configs 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/odoo" title="Odoo | Docker Config 🐋 ↗" >}}
{{< /cards >}}

- For Mautic, Mailtrap can be set up as an SMTP server for sending emails, including transactional and marketing emails. Mautic supports SMTP configurations, allowing the use of Mailtrap's SMTP credentials to route emails through Mailtrap. Community discussions also highlight SMTP as the common integration method since direct API support is not typical in native Mautic setups.[1][2][3]

- For Odoo, Mailtrap can be used similarly by configuring Mailtrap as the SMTP server within Odoo's email settings. While Odoo heavily relies on SMTP for outgoing mail, workflows can be enhanced using third-party tools like Pipedream or n8n to connect Odoo and Mailtrap APIs for more complex automation.[4][5]

- For n8n, Mailtrap has a direct integration node available that allows sending emails, managing contacts, and automating workflows with Mailtrap's API. This integration is straightforward via the n8n UI or by installing the Mailtrap node manually from the community nodes, making it effective for task automation involving emails.[6][7][8]

In summary, Mailtrap supports seamless SMTP integration for Mautic and Odoo, and has a native API integration for workflow automation with n8n, enabling flexible email handling across these platforms.

![Mautic UI](/blog_img/selfh/HomeLab/mautic/mautic-ui.png)


### PB x ListMonk

If you have been *capturing leads*, say from [some simple waiting list](https://jalcocert.github.io/JAlcocerT/real-estate-landing/#the-stack) / newsletter or ebook preview...

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/simple-waiting-list" title="NEW repository - Simple Waiting List" image="/blog_img/apps/gh-jalcocert.svg" subtitle="NextJS + CapJS = Working Waiting list to CSV with no external APIs" >}}
{{< /cards >}}

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/listmonk" title="Tools like ListMonk are Selfostable and allow for transactional emails with attachment! | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="PocketBase | Docker Config 🐋 ↗" >}}
{{< /cards >}}


![Listmonk CSV Import](/blog_img/selfh/marketing/listmonk-csv.png)

You can export them and import them into ListMonk.

CSV just works!


### PostIZ vs GrowChief

GrowChief and Postiz are both open-source tools aimed at social media management, but they serve somewhat different purposes and feature sets:

* https://github.com/growchief/growchief

> apg3.0 |  The Ultimate all-in social media automation (outreach) tool 🤖 

- GrowChief is primarily a social media outreach automation tool focused on automating actions like sending connection requests, follow-ups, liking, and profile visits on platforms like X (formerly Twitter) and LinkedIn.

It emphasizes human-like automation with stealth technology and proxies, making it well-suited for lead generation, engagement, and outreach workflows. It supports API triggers and teams, targeting agencies, startups, and solopreneurs who want to automate social interactions.

- Postiz, on the other hand, is an all-in-one social media scheduling and management platform with a strong focus on content creation, scheduling, team collaboration, and analytics. 

In summary:

| Feature            | GrowChief                                         | Postiz                                                  |
|--------------------|--------------------------------------------------|---------------------------------------------------------|
| Primary Focus      | Social media outreach automation (connect, follow, message) | Comprehensive social media scheduling, content creation, and management |
| Supported Actions  | Connection requests, follow-ups, likes, visits  | Scheduling posts, content creation, analytics, team collaboration |
| Platforms          | X (Twitter), LinkedIn                            | Facebook, Instagram, TikTok, LinkedIn, YouTube, Reddit, more |
| AI Capabilities    | Limited (workflow-based automation)             | AI content & image generation, AI assistant             |
| Audience           | Agencies, startups, solopreneurs for outreach   | Agencies, businesses, marketing teams for scheduling/content management |
| Open Source        | Yes                                              | Yes                                                     |

So, while they are similar as open-source social media tools, GrowChief focuses on outreach and engagement automation, whereas Postiz offers a broader social media management and scheduling experience with strong AI-driven content creation features.[1][2][3][4]


### Selfhosting Email?

The first question should be whether we should or not.

But providing you want, there are few options:


Probably not recommended for 99.999% of us.

* https://github.com/haileyydev/maildrop

> Maildrop is a self hostable and easy to use disposable email service that allows you to receive emails on a random email address on your domain.

* Modoboa 

* https://github.com/docker-mailserver/docker-mailserver - MIT
  * https://docker-mailserver.github.io/docker-mailserver/latest/


> Production-ready fullstack but simple mail server (SMTP, IMAP, LDAP, Antispam, Antivirus, etc.) running inside a container.

#### The Poste Project

I was using Cloudflare email routing, just to Create custom email addresses to use whenever you do not want to share your primary email address.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/poste" title="Poste | Docker Config 🐋 ↗" >}}
{{< /cards >}}

A combination of `MX` and `TXT` records need to be added to your DNS for Email Routing to be able to receive and route emails appropriately. Domain must be enabled for all subdomains to work.

But then found about **Posteio**.

> Needed to disable email routing on that domain (to configure properly DNS)

Multiple Domains, anti-spam...

So no more MX domain from my domain to CF mail servers `route1.mx.cloudflare.net`

We will need NGINX to get https:

* https://hub.docker.com/r/analogic/poste.io/?ref=fossengineer.com
* https://poste.io/doc/

Thanks to

* https://www.youtube.com/watch?v=3jfABU68jzw&t=673s -  Poste.io with Docker compose
* https://www.youtube.com/watch?v=t29v_M0mvlo - Setup DNS (SPF, DKIM y DMARC en Poste io)