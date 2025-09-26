---
title: "SMTP and email stuff"
date: 2025-09-27
draft: true
tags: ["HomeLab","MailTrap","Mailgun","Amazon SES","GrowChief"]
description: 'Email is hard. Social Media OutReach, is not.'
url: 'emails-101'
---

**TL;DR**

https://mxroute.com/

SMTP stuff is messy, a collection of thoughts that helped me understand tech email concepts better

**Intro**

So far I got proper *and high level* custom email integration via:

1. [ProtonMail](#proton-mail) - https://pr.tn/ref/RHJ7YZE8BN8G

You can bring your domains: https://account.proton.me/u/0/mail/identity-addresses

2. [Mailerlite](https://jalcocert.github.io/JAlcocerT/blog/dev-forms/#mailerlite): at the time of writing, they allow one custom domain free

https://dashboard.mailerlite.com/dashboard


3. Via LogTo: also to redirect to your custom domain for auth login, they will send an email with the code to enter your webapp

But for something more custom...I have been lacking how actually email/SMTP work.

* https://github.com/4w4k3/KnockMail

Same as [auth is hard](https://jalcocert.github.io/JAlcocerT/linktree-web-alternative/#conclusions), until [its not](https://jalcocert.github.io/JAlcocerT/social-signin-101/).

I want the same to happen with SMTP/emails.


> But it did not work for me out of the box...

**Introduction**

KnockMail is a tool designed to verify the existence of email addresses. 

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

Similar projects include Hunter.io and NeverBounce, which offer email validation services.

---

MailTrap

* https://mailtrap.io/signin
  * https://mailtrap.io/pricing/?tab=email-api


<!-- https://www.youtube.com/watch?v=sJQUuN7R8sA&themeRefresh=1 -->

{{< youtube "sJQUuN7R8sA" >}}


SelfHosted Email

   * Mail:
       * iRedMail
       * Mailcow
       * Mailserver
       * Mailu (rspamd)
       * Poste
       * Postfix

* MailInaBox - https://www.maketecheasier.com/create-email-server-linux-with-mail-in-a-box/

{{< callout type="warning" >}}
This is advanced
{{< /callout >}}

Self-hosted [Stalwart mail server](https://gist.github.com/chripede/99b7eaa1101ee05cc64a59b46e4d299f?ref=selfh.st)

[SMTP2Go](https://www.reddit.com/r/selfhosted/comments/1hr7bi5/smtp2go_free_plan_spam_score/)

## MailTrap

* https://mailtrap.io/signin


* https://github.com/simple-login/app

>  The SimpleLogin back-end and web app 

## SMTP

## Email APIs

How to do email stuff...with code

Mailtrap competitors primarily include other email testing and delivery platforms that offer similar capabilities for email sandboxing, deliverability testing, spam checking, and transactional email sending. Some well-known Mailtrap competitors are:

- Mailgun: Offers advanced email sending APIs, email validation, and analytics for deliverability and engagement.
- SendGrid (by Twilio): Provides scalable email sending, marketing campaign features, and email analytics.
- Postmark: Focuses on transactional email delivery with high deliverability rates.
- Litmus: Known for email previewing across many email clients and spam testing.
- MailerLite: Combined email marketing and delivery platform popular with small businesses.
- Email Sandbox: A testing-focused platform providing sandboxing for email templates and deliverability testing.
- GMass: Primarily a Gmail-based email marketing and campaign testing tool.

These alternatives vary in focus—from developer-centric testing, marketing automation features, transactional email delivery, or email validation services. Some are more suited for broad marketing campaigns while others emphasize developer tools for testing and debugging emails during development cycles. Mailtrap’s niche is developer-friendly email sandboxing and testing, while others may offer more end-user marketing or validation features.[1][5][6][7]

[1](https://mailtrap.io/blog/mailgun-alternatives/)
[2](https://mailtrap.io/blog/mailinator-alternatives/)
[3](https://www.mailersend.com/compare/mailtrap-alternative)
[4](https://www.reddit.com/r/homelab/comments/9n7di5/any_good_mailtrapio_selfhosted_alternatives/)
[5](https://www.mailwizz.com/blog/mailtrap-alternatives/)
[6](https://www.g2.com/products/mailtrap/competitors/alternatives)
[7](https://www.courier.com/guides/email-testing-tools)
[8](https://maileroo.com/blog/mailtrap-alternatives/)
[9](https://flodesk.com/tips/mailtrap-alternatives)
[10](https://mailtrap.io/blog/email-testing-tools/)

Amazon SES is a highly scalable and cost-effective email sending service, especially well-suited for businesses already using AWS infrastructure. It offers robust deliverability, pay-as-you-go pricing, and detailed monitoring tools, but it requires technical expertise for setup and management. Its API and SMTP interfaces provide flexibility but might present a learning curve for less technical users.[1][2][3]

Regarding ease of configuration among the competitors:

| Service      | Ease of Configuration                                    | Notes                                             |
|--------------|----------------------------------------------------------|---------------------------------------------------|
| Mailtrap     | Very user-friendly, specifically designed for developers | Easy SMTP/API setup, great for email testing      |
| SendGrid     | Moderate, with good documentation and UI                 | Provides marketing features, can be more complex  |
| Postmark     | Simple and focused on transactional email                | Straightforward setup, less marketing complexity  |
| Mailgun      | Moderate to advanced, developer-centered                  | Powerful API but requires technical knowledge     |
| Amazon SES   | More technical, requires AWS knowledge                    | Powerful but steeper learning curve                |
| MailHog      | Very easy, open-source, self-hosted                        | Great for local dev/testing, less for production  |

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

[1](https://blog.campaignhq.co/top-pros-and-cons-of-amazon-ses/)
[2](https://www.capterra.com/p/179662/Amazon-SES/reviews/)
[3](https://sendlayer.com/blog/best-transactional-email-services/)
[4](https://alternativeto.net/software/mailtrap-io/?license=opensource)
[5](https://www.courier.com/guides/email-testing-tools)
[6](https://www.emaildeliverabilityreport.com/en/deliverability/amazon-ses/2025/)
[7](https://fluentsmtp.com/articles/amazon-ses-vs-sendgrid/)
[8](https://www.g2.com/products/amazon-simple-email-service-amazon-ses/reviews)
[9](https://www.trustradius.com/products/amazon-simple-email-service/reviews)
[10](https://www.getresponse.com/blog/best-smtp-providers)
[11](https://aws.amazon.com/blogs/messaging-and-targeting/navigate-bulk-sender-requirements-with-amazon-ses/)
[12](https://www.emailtooltester.com/en/email-marketing-services/)
[13](https://www.reddit.com/r/homelab/comments/9n7di5/any_good_mailtrapio_selfhosted_alternatives/)
[14](https://www.emaildeliverabilityreport.com/en/deliverability/amazon-ses/2025/08/)
[15](https://postmarkapp.com/blog/the-best-smtp-email-services-comparison-sheet)
[16](https://freestuff.dev/alternative/mailtrap)
[17](https://www.softwareadvice.com/email-marketing/amazon-ses-profile/)
[18](https://www.courier.com/blog/top-6-email-service-providers-for-transactional-notifications-in-2025)
[19](https://mailtrap.io/blog/mailgun-alternatives/)
[20](https://www.bigmailer.io/amazon-ses-alternatives/)

### Amazon SES

Amazon simple email service

### MailGun


### Resend

People use that one for some contact forms, as seen on [this post section](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/#managing-packages-for-ssgs), together with [HUGO Themes like this](https://github.com/HugoRCD/canvas?tab=readme-ov-file#setup-the-contact-form).

* https://resend.com/signup

---

## Conclusions

**Sendgrid** just block me few minutes after creating my account.

That was interesting.

All these SMTP setups will help you with your social media, if you are into it.

If you just wanted a quick way to chat...there are many [Interesting Chats](https://jalcocert.github.io/JAlcocerT/homelab-security/#privacy-apps) to use :)


### Proton Mail

![DNS Config for ProtonMail](/blog_img/email/dns-protonmail.png)


![GMAIL custom domain for google](/blog_img/email/dns-gmail.png)


### MailTrap x PB

Yes, Mailtrap can be used to send one-time codes or magic links for user verification purposes such as account creation or subscription confirmation. Since Mailtrap provides SMTP email sending capabilities, you can configure PocketBase or any backend service to use Mailtrap's SMTP settings to send transactional emails including verification codes or magic links.

This allows you to deliver emails securely and reliably during development and testing phases without sending real emails to users. Once your system is ready for production, you can switch from Mailtrap to a real SMTP provider if desired. But for sending verification emails with OTPs or magic links in development or even production (if you choose), Mailtrap fully supports this use case.[1][2]

[1](https://pocketbase.io/docs/js-sending-emails/)
[2](https://help.mailtrap.io/article/165-supabase-and-mailtrap-integration)


### MailTrap x Marketing and Automation

Mailtrap can be integrated with Mautic, Odoo, and n8n, primarily via its SMTP and API services.

- For Mautic, Mailtrap can be set up as an SMTP server for sending emails, including transactional and marketing emails. Mautic supports SMTP configurations, allowing the use of Mailtrap's SMTP credentials to route emails through Mailtrap. Community discussions also highlight SMTP as the common integration method since direct API support is not typical in native Mautic setups.[1][2][3]

- For Odoo, Mailtrap can be used similarly by configuring Mailtrap as the SMTP server within Odoo's email settings. While Odoo heavily relies on SMTP for outgoing mail, workflows can be enhanced using third-party tools like Pipedream or n8n to connect Odoo and Mailtrap APIs for more complex automation.[4][5]

- For n8n, Mailtrap has a direct integration node available that allows sending emails, managing contacts, and automating workflows with Mailtrap's API. This integration is straightforward via the n8n UI or by installing the Mailtrap node manually from the community nodes, making it effective for task automation involving emails.[6][7][8]

In summary, Mailtrap supports seamless SMTP integration for Mautic and Odoo, and has a native API integration for workflow automation with n8n, enabling flexible email handling across these platforms.

[1](https://netcorecloud.com/tutorials/mautic-email-settings/)
[2](https://www.reddit.com/r/Emailmarketing/comments/1lt0j0h/how_to_connect_mailgun_api_to_mautic/)
[3](https://emaillabs.io/en/emaillabs-mautic-integration/)
[4](https://www.reddit.com/r/Odoo/comments/1337pso/odoo_mail_service_integration_options_self_vs/)
[5](https://pipedream.com/apps/odoo/integrations/mailtrap)
[6](https://help.mailtrap.io/article/168-mailtrap-and-n8n-integration)
[7](https://mailtrap.io/integrate-with/n8n/)
[8](https://n8n.io/integrations/mailtrap/)
[9](https://mautic.org/features/integrations-and-api/)
[10](https://forum.mautic.org/t/if-mautic-can-send-email-why-integrate-with-email-senders-like-mailchimp-or-amazon-sendgrid/3771)
[11](https://help.mailtrap.io/article/122-mailtrap-email-sending-smtp-integration)
[12](https://help.mailtrap.io/article/179-send-email-with-v0)
[13](https://docs.mautic.org/en/4.x/channels/emails.html)
[14](https://www.youtube.com/watch?v=K-12CLwjRsQ)
[15](https://www.youtube.com/watch?v=FR5RXGkvO0s)
[16](https://community.n8n.io/t/looking-for-help-with-developing-n8n-node/99464)
[17](https://elasticemail.com/integrations/mautic)
[18](https://mailtrap.io)
[19](https://help.mailtrap.io/category/172-integrations)
[20](https://emaillabs.io/en/cloud-smtp-for-mautic/)


### PostIZ vs GrowChief

GrowChief and Postiz are both open-source tools aimed at social media management, but they serve somewhat different purposes and feature sets:

https://github.com/growchief/growchief

> apg3.0 |  The Ultimate all-in social media automation (outreach) tool 🤖 

- GrowChief is primarily a social media outreach automation tool focused on automating actions like sending connection requests, follow-ups, liking, and profile visits on platforms like X (formerly Twitter) and LinkedIn. It emphasizes human-like automation with stealth technology and proxies, making it well-suited for lead generation, engagement, and outreach workflows. It supports API triggers and teams, targeting agencies, startups, and solopreneurs who want to automate social interactions.

- Postiz, on the other hand, is an all-in-one social media scheduling and management platform with a strong focus on content creation, scheduling, team collaboration, and analytics. It features AI-powered content and image generation (Canva-like design tools), multi-channel social publishing, campaign planning, and automation for posting and engagement. Postiz is designed as a command center for managing multiple social media channels and teams, ideal for agencies managing multiple clients or businesses with broad social media presence.

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

[1](https://postiz.com/blog/open-source-social-media-scheduler)
[2](https://www.reddit.com/r/selfhosted/comments/1mzssij/growchief_social_media_automation_tool/)
[3](https://www.growchief.com)
[4](https://www.linkedin.com/posts/nevo-david_happy-to-announce-my-new-open-source-project-activity-7365780977085841409-htYe)
[5](https://www.libhunt.com/compare-growchief-vs-postiz-n8n)
[6](https://openalternative.co/postiz)
[7](https://www.g2.com/products/postiz/features)
[8](https://www.blog.brightcoding.dev/2025/09/07/growchief-the-open-source-api-tool-that-is-quietly-redefining-social-media-outreach-at-scale/)
[9](https://blog.elest.io/postiz-free-open-source-social-media-scheduler/)
[10](https://postiz.com)
[11](https://www.growchief.com/blog/best-times-to-post-social-media)
[12](https://github.com/gitroomhq/postiz-app)
[13](https://postiz.com/blog/social-media-mcp)
[14](https://www.reddit.com/r/selfhosted/comments/1f4x806/postiz_opensource_social_media_scheduling_tool/)
[15](https://www.youtube.com/watch?v=IpBF0mS4iTU)
[16](https://www.youtube.com/watch?v=UE33Cb0D5b8)
[17](https://postiz.com/blog/top-10-socialbee-alternatives-which-tools-have-better-features)
[18](https://dev.to/nevodavid/i-built-an-open-source-social-media-scheduling-and-it-blew-up-415e)

### Selfhosting Email?

* https://github.com/haileyydev/maildrop

> Maildrop is a self hostable and easy to use disposable email service that allows you to receive emails on a random email address on your domain.