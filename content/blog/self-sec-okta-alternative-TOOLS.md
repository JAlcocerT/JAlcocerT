---
title: "Okta Alternatives? A look to F/OSS Single Sign On Tools"
date: 2025-11-22T23:20:21+01:00
draft: false
tags: ["Dashboards","Supabase vs PB","Authelia vs Authentik","KeyCloak","PocketID"]
description: 'SelfHosting and SSO Tools'
url: 'open-source-sso-tools'
---

**TL;DR**

https://www.awesome-homelab.com/item/pocket-id
https://pocket-id.org/


**Intro**

* https://auth0.com/ by Okta ❎

1. [Authelia](#authelia)
2. [LogTo](#logto)
3. [Authentik](#authentik)
4. [Hanko](#hanko)
5. [Vouch Proxy](#vouch)
6. [Keycloak](#keycloack)
7. [zitadel](#zitadel) - Identity infrastructure, simplified for you
8. KeyAuth - Discontinued

## Why Single Sign On - SSO


### What about Clerk?

Clerk is a good alternative to Supabase Auth.

 https://clerk.com/docs which brings an interesting [Py SDK](https://github.com/clerk/clerk-sdk-python/blob/main/README.md)


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

## Cerbos


docker run --rm --name cerbos -d -v $(pwd)/cerbos-quickstart/policies:/policies -p 3592:3592 -p 3593:3593  ghcr.io/cerbos/cerbos:0.34.0


https://docs.cerbos.dev/cerbos/latest/installation/binary

> 

## Fief

https://www.fief.dev/

* SelfHostable

> Authenticate your users in minutes

## SuperTokens

* SelfHostable

https://github.com/supertokens/supertokens-core

https://github.com/supertokens/supertokens-core/releases

> Open source alternative to Auth0 / Firebase Auth / AWS Cognito

## Zitadel

it can provided passkeys, MFA, **use your brand and also onboard new users with ease**.

Secure authentication management for your application. Customize as you grow, with easy APIs and programmable workflows. Focus on growing, your login is in good hands.


https://zitadel.com/
https://github.com/zitadel/zitadel
https://github.com/zitadel/zitadel?tab=Apache-2.0-1-ov-file#readme

> Identity infrastructure, simplified

* https://zitadel.com/docs/self-hosting/deploy/overview

## Ory Hydra

https://github.com/ory/hydra

https://github.com/ory/hydra?tab=readme-ov-file#run-the-docker-compose-quickstarts

> OpenID Certified™ OpenID Connect and OAuth Provider written in Go - cloud native, security-first, open source API security for your infrastructure. SDKs for any language. Works with Hardware Security Modules. Compatible with MITREid.

---

## Conclusions

### LogTo

* https://logto.io/
  * https://github.com/logto-io/logto
  * https://github.com/logto-io/logto?tab=MPL-2.0-1-ov-file#readme

---

## FAQ

### Free Alternatives for Okta


### Authentication with SupaBase

https://supabase.com/docs/guides/auth/auth-helpers/nextjs