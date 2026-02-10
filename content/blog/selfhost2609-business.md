---
title: "Selfhosting Business Tools vs Coasean Ceiling "
date: 2026-09-01T23:20:21+01:00
draft: false
tags: ["Self-Hosting","Notes","Marketing","No Code","Link Shortener x Web Analytics"]
description: 'Computer'
url: 'selfhosting-business'
---

**TL;DR**

Avoid silos and the Coasean Ceiling.

**Intro**

Tools to avoid silos in your business.

Im not going to talk [about communication tools](#communicating-with-colleagues) for business.

Neither invoices/billing:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/invoice-ninja" title="Invoice Ninja | Docker Config for HomeLab 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serverless-invoices" title="Serverless Invoices | Docker Config for HomeLab 🐋 ↗" >}}
{{< /cards >}}

But more on:



## Notes

Obsidian or Notion?

Why not just Affine, Joplin or...**LogSeq**?

![alt text](/blog_img/selfh/nocode/affine-local.png)


LogSeq been working nicely for me: *and the markdown support, local first, no db is amazing to sync with a github repository*

```sh
#https://github.com/JAlcocerT/my-logseq-notes
#cd scripts
python3 verify_connection.py
python3 backfill_meeting.py 01K...abcdef12446579
```

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/joplin" title="Joplin | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/logseq" title="LogSeq | Docker Config 🐋 ↗" >}}
{{< /cards >}}

* https://github.com/OlaProeis/ironPad

Miro?

Nah, just excalidraw or MermaidJS for diagrams.


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/appflowy" title="AppFlowy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/selfh/nocode/apflowy-signup.png)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nocodb" title="NocoDB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/baserow" title="BaseRow | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/selfh/nocode/nocodb-table.png)

### SpreadSheets

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/grist" title="Grist | Docker Config 🐋 ↗" >}}
{{< /cards >}}

0. https://github.com/glideapps/glide-data-grid


### Wikis


* https://github.com/docmost/docmost

> Docmost is an open-source collaborative wiki and documentation software. It is an open-source alternative to Confluence and Notion.


## No Code

AirTable..or...?

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nocodb" title="NocoDB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/baserow" title="BaseRow | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/selfh/nocode/baserow-lead-template.png)

People use tools like baserow as an overpowered spreadsheet or custom CRM.

You can also try with:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/twenty" title="Twenty CRM | Docker Config 🐋 ↗" >}}
{{< /cards >}}


## Marketing

If you are doing ads and getting users to register into your app

Or have made a sales pipeline

Or...are just looking for high value prospects in a lead db like `https://www.storecensus.com/pricing` for your killer idea.

You will need these tools.

And im not just thinking about a Lean (GHA driven) **DRIP** automatic emails.

But these selfhosting ones.

* https://github.com/melosso/beacon

> A lightweight consent management platform. Handle email consent states independently from any ERP, CRM or platform.

## E-Commerce

Because Im not going to even mention about plain websites.

There is a full [post here](https://jalcocert.github.io/JAlcocerT/how-about-selfhosting-an-ecommerce/).


But basically,you can try:

![Drupal Ecommerce Setup](/blog_img/biz/ecommerce/drupal.png)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/drupal" title="Drupal | Docker Config 🐋 ↗" >}}
{{< /cards >}}

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

* Sofia - zofienkagram
  * https://wnba.pl/ - another wordpress (good looking)
  * monika ciolkowska - monikacio
    * https://monikaciolkowska.portfoliobox.net/
    * Using the low tier without domain of https://www.portfoliobox.net/pricing (46$/y)
      * Interesting section with a table comparing services and faq (go below)

* Gym Trainer - https://trenujswiadomie.pl/kokpit/


-->



## Tech Businesses

You will probably need monitoring:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/uptime-kuma" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/kener" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}

These are very cool all in one to selfhost:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/it-tools" title="IT-Tools | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/omnitools" title="Omni-Tools Docker Config 🐋 ↗" >}}
{{< /cards >}}

### D&A Tech

Sqlite is pretty much everywhere: *from pi-hole v6 to pocketbase*
```sh
choco install dbeaver
```


---

## Conclusions

I'd keep it simple with: *nocodb, affine are great, but require more services running, do you need that many features?*

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/baserow" title="Baserow | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/logseq" title="LogSeq | Docker Config 🐋 ↗" >}}
{{< /cards >}}

Business Cards?

Just try:

* https://github.com/kyaustad/cardyo

>  A simple URL based **digital business card creation** and sharing system 

You can clean up the mess with: *see `OSS Business` in my home-lab repo for more ideas.

```sh
lazydocker
docker system df
#docker stop $(docker ps -a -q) #stop all
#docker system prune -a
```

And for questions:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/shipping/dna-1ton-ebook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}


Not doing business yet, but selling your time in the job market?


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/cv-laitex" title="home-lab | Repo ↗" icon="github" >}}
  {{< card link="https://github.com/JAlcocerT/Job-Trends" title="home-lab | Repo ↗" icon="github" >}}
{{< /cards >}}

Consider overleaf or these:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/open-resume" title="Uptime Kuma | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/yamlresume" title="Kener | Docker Config 🐋 ↗" >}}
{{< /cards >}}




---

## FAQ

### Communicating with colleagues

Do you really need M365 with teams?

```sh
#sudo snap install slack --classic #sudo snap remove slack
#sudo snap install discord
#flatpak install flathub org.telegram.desktop
#flatpak install flathub im.riot.Riot #element
#flatpak install flathub org.signal.Signal
```

* https://github.com/permissionlesstech/bitchat

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/matrix" title="Matrix | Docker Config for HomeLab 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/serverless-invoices" title="Serverless Invoices | Docker Config for HomeLab 🐋 ↗" >}}
{{< /cards >}}