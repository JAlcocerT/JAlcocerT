---
title: "Okta Alternatives? SSO Tools"
date: 2026-04-01T23:20:21+01:00
draft: false
tags: ["Dashboards","Supabase Auth vs PB","Authelia vs Authentik","PocketID"]
description: 'A look to F/OSS Single Sign On Tools'
url: 'open-source-sso-tools'
---

**TL;DR**

* https://www.awesome-homelab.com/item/pocket-id
  * https://pocket-id.org/


**Intro**

Some time back, when working at a popular ecommerce, they were using Okta everywhere.

I was wondering why they were not using OSS alternatives for business SSO.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/home-lab" title="HomeLab Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Reviewing Selfhosted SSO Tools for business" >}}
{{< /cards >}}

So lets cover some pros and cons and selfhost whatever is possible.

1. [Authelia](#authelia)
2. [LogTo](#logto) ✅ 
3. [Authentik](#authentik)
4. [Hanko](#hanko)
5. [Vouch Proxy](#vouch)
6. [Keycloak](#keycloack)
7. [zitadel](#zitadel) - Identity infrastructure, simplified for you
8. KeyAuth - Discontinued
9. TinyAuth ✅  - Working [here](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/)
10. FireBase Auth ✅
11. Pocketbase Auth ✅
12. Supabase Authentication


We also have https://auth0.com/ by Okta


## Why Single Sign On - SSO


### What about Clerk?

Clerk is a good alternative to Supabase Auth.

* https://clerk.com/docs which brings an interesting [Py SDK](https://github.com/clerk/clerk-sdk-python/blob/main/README.md)


{{< details title="Auth Alternatives for webapps...📌" closed="true" >}}


* https://www.reddit.com/r/Supabase/comments/1dvabn6/what_is_the_best_solution_to_use_supabase_auth/
* https://www.reddit.com/r/nextjs/comments/1bvda9r/officially_hate_supabase_auth/?rdt=40537
* https://www.reddit.com/r/Supabase/comments/xaxecr/authentication_with_supabase_is_easy_almost/

{{< /details >}}

### Hanko

* https://www.hanko.io/
  * https://docs.hanko.io/introduction
  * https://github.com/teamhanko/hanko?tab=License-1-ov-file#readme mixed, GNUPL

> Authentication and user management system optimized for passkeys

https://docs.hanko.io/api-reference/public/webauthn/initialize-webauthn-login


> 🧑‍🚀 The better identity infrastructure for developers and the open-source alternative to Auth0.

## Vouch

https://github.com/vouch/vouch-proxy
https://github.com/vouch/vouch-proxy?tab=MIT-1-ov-file#readme

> an SSO and OAuth / OIDC login solution for Nginx using the auth_request module 

VP can be used to replace application user management entirely - https://github.com/vouch/vouch-proxy?tab=readme-ov-file#what-vouch-proxy-does

It works with Gitea / NextCloud / HA / Google / GH ...

## Authelia


https://www.authelia.com/
https://github.com/authelia/authelia
https://github.com/authelia/authelia?tab=Apache-2.0-1-ov-file#readme

> The Single Sign-On Multi-Factor portal for web apps

```yml
version: '3.3'
    
services:
  authelia:
    image: authelia/authelia
    container_name: authelia
    volumes:
      - ~/Docker/Authelia:/config 
    ports:
      - 9091:9091
    environment:
      - TZ=Europe/Paris
```

## Authentik

Authentik bring many [integrations](https://integrations.goauthentik.io/) supporting OAUTH and OpenID Connect aka OIDC as per [their docs](https://docs.goauthentik.io/users-sources/sources/protocols/oauth).

* {{< newtab url="https://goauthentik.io/" text="The  Official Site" >}}
* {{< newtab url="https://github.com/goauthentik/authentik" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/goauthentik/authentik?tab=License-1-ov-file#readme" text="Mixed License: CC, MIT, ..." >}} 

> The authentication glue you need.

* https://docs.goauthentik.io/docs

Authentik is an IdP (Identity Provider) and SSO (single sign on) that is built with security at the forefront of every piece of code, every feature, with an emphasis on flexibility and versatility.

> See how JimsGarage have done it: https://github.com/JamesTurland/JimsGarage/tree/main/Authentik


Single Sign On With OAuth2.0 - Authentik Is AWESOME!

https://www.youtube.com/watch?v=enwFWELCYJo&t=438s
https://www.youtube.com/watch?v=KlDJ4K45M_o

```sh
wget https://goauthentik.io/docker-compose.yml
echo "PG_PASS=$(openssl rand -base64 36)" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 36)" >> .env
echo "COMPOSE_PORT_HTTP=8020" >> .env
# not needed echo "COMPOSE_PORT_HTTPS=443" >> .env
```

#https://www.youtube.com/watch?v=broUAWrIWDI&t=141s


https://artifacthub.io/packages/helm/goauthentik/authentik


`localhost:9000/if/flow/initial-setup/`

> you can use it with next-auth.js.org

## Vault

https://github.com/hashicorp/vault

> A tool for secrets management, encryption as a service, and privileged access management


### Keycloack



https://www.keycloak.org/getting-started/getting-started-docker

```sh
docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:25.0.2 start-dev
```

> admin/admin

### Zitadel

### Cerbos


docker run --rm --name cerbos -d -v $(pwd)/cerbos-quickstart/policies:/policies -p 3592:3592 -p 3593:3593  ghcr.io/cerbos/cerbos:0.34.0


https://docs.cerbos.dev/cerbos/latest/installation/binary

> 

### Fief

https://www.fief.dev/

* SelfHostable

> Authenticate your users in minutes

### SuperTokens

* SelfHostable

https://github.com/supertokens/supertokens-core

https://github.com/supertokens/supertokens-core/releases

> Open source alternative to Auth0 / Firebase Auth / AWS Cognito

### Zitadel

it can provided passkeys, MFA, **use your brand and also onboard new users with ease**.

Secure authentication management for your application. Customize as you grow, with easy APIs and programmable workflows. Focus on growing, your login is in good hands.


https://zitadel.com/
https://github.com/zitadel/zitadel
https://github.com/zitadel/zitadel?tab=Apache-2.0-1-ov-file#readme

> Identity infrastructure, simplified

* https://zitadel.com/docs/self-hosting/deploy/overview

### Ory Hydra

https://github.com/ory/hydra

https://github.com/ory/hydra?tab=readme-ov-file#run-the-docker-compose-quickstarts

> OpenID Certified™ OpenID Connect and OAuth Provider written in Go - cloud native, security-first, open source API security for your infrastructure. SDKs for any language. Works with Hardware Security Modules. Compatible with MITREid.

---

## Conclusions

As **Free Alternatives for Okta** I would go for


### LogTo

* https://logto.io/
  * https://github.com/logto-io/logto
  * https://github.com/logto-io/logto?tab=MPL-2.0-1-ov-file#readme

---

## FAQ


**Interesting Posts**

1. https://darko.io/posts/but-auth-is-hard

Authentication?

This one will require your focus: https://darko.io/posts/but-auth-is-hard

As per my [recent post](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/), you have few options, like:

1. [TinaAuth](#tinyauth)
2. [LogTo](#logto)

But dont worry, its a solved problem.

The article, titled **"BuT, aUtH iS HaRd,"** argues against the prevalent industry narrative that building authentication (Auth) is inherently difficult.

The author contends that **Auth is not hard, but rather "boring, red-tapey, and a solved problem."**

**Auth Basics Are Simple**

The author recalls that "rolling your own" basic email/password authentication in the past (e.g., with PHP/MD5) was a straightforward process of hashing, salting, storing credentials, and setting a cookie.

To demonstrate this, the author provides a **150-line Proof-of-Concept (PoC)** using Express and Passport, showing that basic features like email/password login and adding a social provider (GitHub OAuth2) are **dull and repetitive, but not complex** to implement at a toy level.

Complexity Lies in the Extras

The real challenge with authentication isn't the core login logic, but the surrounding features, which the author calls **"death by a thousand cuts."**

These include:

* **Security and Maintenance:** Staying up-to-date with security standards, standards bodies (RfCs), and potential breaches.
* **User Experience (UX):** Implementing 2FA/MFA, password resets, and user management features.
* **Integration:** Handling the complexity of connecting to hundreds of different OAuth providers, each with specific requirements, and managing account merges.

When to Roll Your Own vs. Use a Service

The author's core **takeaway is that Auth is a commodity** and reinventing the wheel is usually a waste of time. 

They offer clear guidance on when developers should build their own solution:

| Project Type | Recommendation | Rationale |
| :--- | :--- | :--- |
| **Toy Project / Indie / Educational** | **Roll Your Own** | It's a great way to learn the basics. |
| **Startups, Scaleups, and Above** | **Do NOT Roll Your Own** | Time is better spent building the actual product; Auth is a solved, boring problem. |

Open-Source Alternatives

The article concludes by promoting the robust **self-hosted and FOSS (Free and Open Source Software) landscape** for authentication, offering various choices for developers who prefer to own their stack:

* **Auth Libraries:** Passport.js, Lucia, Auth.js.
* **Auth Servers:** Keycloak, SuperTokens, FusionAuth, Authelia.
* **Storage + Auth Platforms:** Supabase, Pocketbase.

The final message is to **educate, not gatekeep**, and to recognize that while Auth is essential, its implementation is a **"red tape"** task best handled by existing solutions rather than rebuilt from scratch.


* **Others:** [LibreChat](https://www.youtube.com/watch?v=0BRnK5BGZHU), Autogen + AutogenStudio https://microsoft.github.io/autogen/blog/2023/12/01/AutoGenStudio/ or [Quivir](https://github.com/StanGirard/quivr) with great [docs](https://docs.quivr.app/home/intro) or [LocalGPT](https://github.com/PromtEngineer/localGPT).
  * Bindings:
    * https://github.com/abetlen/llama-cpp-python
* https://github.com/khoj-ai/khoj




{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/pocketbase/" title="Pocketbase | POST ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/pocketbase" title="PocketBase | Docker Config 🐋 ↗" >}}
{{< /cards >}}

### Authentication with SupaBase

https://supabase.com/docs/guides/auth/auth-helpers/nextjs

### Linux as OS

I kept using Zorin, particularly the current version 18: *so you are not forzed to through away good enough hardware*

* `https://zorin.com/os/archive/`

> You can expect to get it working with 2GB of RAM

```sh
sudo apt update && sudo apt install trash-cli
trash-empty
#rm -rf ~/.local/share/Trash/*
#docker system df
#sudo docker stats
```

So even my old ~400$ laptop from 2010 could handle this

{{< youtube "t8LpwHygDfg" >}}

<!-- 
https://www.youtube.com/watch?v=t8LpwHygDfg -->