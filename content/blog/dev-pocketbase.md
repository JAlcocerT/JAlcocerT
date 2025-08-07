---
title: "PocketBase for BackEnd"
date: 2025-08-05
draft: false
tags: ["PocketBase","Redux","OSS Auth"]
description: 'Things your learn outside the confort zone. BackEnd Storage for a WebApp'
url: 'pocketbase-redux'
---

This is way far from my confort zone, yet here we go.

## PocketBase

* https://pocketbase.io/
    * https://pocketbase.io/docs/
    * https://github.com/pocketbase/pocketbase

> MIT | Open Source realtime backend in 1 file 

Realtime database
Authentication
File storage
Admin dashboard

While PocketBase **includes** a database, it's more accurate to call it a **backend-as-a-service (BaaS)** or a "realtime backend" rather than just a database. 

PocketBase is a single, self-contained Go application that bundles several key components into one executable file:

* **An embedded SQLite database:** This is the core storage engine. So yes, it does contain a database.
* **A RESTful API:** This provides an interface to interact with the data in the database.
* **An authentication system:** It handles user sign-up, login, and authorization.
* **A web-based admin UI:** This allows you to manage your collections, data, and users without writing any code.
* **Real-time subscriptions:** It enables your frontend to listen for live data changes.

Because it provides all of these features out-of-the-box, it's designed to be a full backend for applications, allowing you to build a project without having to set up a separate database server, API, and authentication system.

### PB 101

* https://github.com/pocketbase/pocketbase/discussions/3279 -  Self host with Docker and Docker Compose #3279 

```sh
git clone https://github.com/JAlcocerT/Docker/
cd ./Dev/BaaS/PB
docker compose -f PB_docker-compose.yml up -d
```

![alt text](/blog_img/dev/PB/selfh-pb.png)

> You can use PB admin UI via the default: http://localhost:8080/_/

> > And log in as per your `.env` credentials if you provided any, or just created an account

You might need to create **collections in pocketbase**

And you can do so via the UI:

![alt text](/blog_img/dev/PB/pocketbase-collection-ui.png)

### Programatic PB Interaction

But you can also do them via scripts.

```sh
cd ./Dev/BaaS/PB
python3 create_user_settings.py
```

Validate within the UI that they are as you wanted it to be: `http://localhost:8080/_/#/collections`


## Redux


---

## Conclusions

