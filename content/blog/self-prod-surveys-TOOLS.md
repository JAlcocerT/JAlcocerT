---
title: "Free Surveys"
date: 2025-10-25T23:20:21+01:00
draft: true
tags: ["Docker","Self-Hosting"]
description: ''
summary: '.'    
url: 'selfhosting-retro-games'
---

1. [Frombricks](#formbricks)
2. [HeyForm](#heyform)
3. [OhMyForm](#ohmyform)

<https://medevel.com/open-source-survey-tools-2/>

### Formbricks

https://github.com/formbricks/formbricks

### heyform

* https://github.com/heyform/heyform
  * https://github.com/heyform/heyform?tab=AGPL-3.0-1-ov-file#readme
  * https://heyform.net/
  * https://hub.docker.com/r/heyform/community-edition/tags

> HeyForm is an open-source form builder that allows anyone to create engaging conversational forms for surveys, questionnaires, quizzes, and polls. No coding skills required.

{{< dropdown title="How to setup HeyForm ⏬" closed="true" >}}

https://docs.heyform.net/open-source/self-hosting#_1-install-docker-and-docker-compose

{{< /dropdown >}}

### ohmyform

* https://github.com/ohmyform/ohmyform
  * https://hub.docker.com/r/ohmyform/ohmyform

  * https://ohmyform.com/docs/install/ 
  https://ohmyform.com/


---

## FAQ

### F/OSS to Interact with Audience

* https://github.com/ClaperCo/Claper
https://claper.co/


### F/OSS Customer FeedBack Tool

Let users request feature and create a RoadMap accordingly

#### Astuto

https://astuto.io/
https://github.com/astuto/astuto
https://github.com/astuto/astuto?tab=AGPL-3.0-1-ov-file#readme

https://docs.astuto.io/

>  A free, open source, self-hosted customer feedback tool 🦊 

Example - https://feedback.astuto.io/

```yml
version: '3.4'
services:
  db:
    image: postgres:14.5
    environment:
      POSTGRES_USER: yourpostgresusername
      POSTGRES_PASSWORD: yourpostgrespassword
    volumes:
      - dbdata:/var/lib/postgresql/data
  web:
    image: riggraz/astuto:latest #https://hub.docker.com/r/riggraz/astuto
    environment:
      POSTGRES_USER: yourpostgresusername
      POSTGRES_PASSWORD: yourpostgrespassword
      BASE_URL: http://yourwebsite.com
      SECRET_KEY_BASE: yoursecretkeybase
    ports:
      - "3000:3000"
    depends_on:
      - db
    
volumes:
  dbdata:
```

* By default, use it al `localhost:3000` with `admin@example.com` and `password`