---
title: "SMTP and email stuff"
date: 2026-12-31
draft: true
tags: ["HomeLab","Mailgun","Amazon SES","growchief"]
description: 'Email is hard. '
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