---
title: "SMTP and email stuff"
date: 2025-10-17
draft: false
tags: ["HomeLab","Mailgun","Amazon SES","growchief"]
description: 'Email is hard. '
url: 'emails-101'
---

**TL;DR**

SMTP stuff is messy, a collection of thoughts that helped me understand tech email concepts better

**Intro**

So far I got proper *and high level* custom email integration via:

1. ProtonMail
2. Mailerlite: they allow one custom domain free
3. Via LogTo: also to redirect to your custom domain for auth login etc

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

## MailTrap

* https://mailtrap.io/signin


* https://github.com/simple-login/app

>  The SimpleLogin back-end and web app 

## SMTP

## Email APIs

How to do email stuff...with code

### Amazon SES

### MailGun


### Resend

People use that one for some contact forms, as seen on [this post section](https://jalcocert.github.io/JAlcocerT/javascript-for-static-websites/#managing-packages-for-ssgs), together with [HUGO Themes like this](https://github.com/HugoRCD/canvas?tab=readme-ov-file#setup-the-contact-form).

* https://resend.com/signup

---

## Conclusions

**Sendgrid** just block me few minutes after creating my account.

That was interesting.

All these SMTP setups will help you with your social media, if you are into it.

Apps like PostIZ, n8n or growthchief:

* https://github.com/growchief/growchief

>  The Ultimate all-in social media automation (outreach) tool 🤖 



* The people should own the town square - Mastodon Blog https://blog.joinmastodon.org/2025/01/the-people-should-own-the-town-square/?ref=selfh.st

If you just wanted a quick way to chat...

If you need, there are many [Interesting Chats](https://jalcocert.github.io/JAlcocerT/homelab-security/#privacy-apps) to use :)
