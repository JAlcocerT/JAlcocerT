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

Despite not been able to code in Go, I really admire few projects already that use Go.

HUGO was the first for me.

And now is time to Pocketbase, also written in Go:

* https://pocketbase.io/
    * https://pocketbase.io/docs/
    * https://github.com/pocketbase/pocketbase

> MIT | Open Source realtime backend in 1 file 

PB Features:

1. Realtime database
2. Authentication
3. File storage
4. Admin dashboard

While PocketBase **includes** a database, it's more accurate to call it a **backend-as-a-service (BaaS)** or a "realtime backend" rather than *just a database*. 

PocketBase is a single, self-contained Go application that bundles several key components into one executable file:

* **An embedded SQLite database:** This is the core storage engine. So yes, it does contain a database.
* **A RESTful API:** This provides an interface to interact with the data in the database.
* **An authentication system:** It handles user sign-up, login, and authorization.
* **A web-based admin UI:** This allows you to manage your collections, data, and users without writing any code.
* **Real-time subscriptions:** It enables your frontend to listen for live data changes.

Because it provides all of these features out-of-the-box, it's designed to be a full backend for applications, allowing you to build a project without having to set up a separate database server, API, and authentication system.

### PB 101

Spin Pocketbase into your PC building a Go container with the project:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/Dev/BaaS/PB" title="Pocketbase Docker Config 🐋 ↗" >}}
{{< /cards >}}


* https://github.com/pocketbase/pocketbase/discussions/3279 -  Self host with Docker and Docker Compose #3279 

```sh
git clone https://github.com/JAlcocerT/Docker/
cd ./Dev/BaaS/PB
docker compose -f PB_docker-compose.yml up -d
```

![SelfHosting PocketBase](/blog_img/dev/PB/selfh-pb.png)

> You can use PB admin UI via the default: http://localhost:8080/_/

> > And log in as per your `.env` credentials if you provided any, or just created an account

You might need to create **collections in pocketbase**

Overview of Core Data Entities as per https://deepwiki.com/pocketbase/pocketbase/2.2-data-model

The PocketBase data model is built on three primary entities:

1. Collections - Schema definitions that describe the structure of data (similar to tables in traditional databases)
2. Records - Individual data entries stored within collections (similar to rows in a table)
3. Fields - The attributes or properties that define the structure of records (similar to columns)


And you can do so via the UI:

![alt text](/blog_img/dev/PB/pocketbase-collection-ui.png)

You can also try with the demo: https://pocketbase.io/demo/

### Programatic PB Interaction

But you can also do them via scripts.

* https://deepwiki.com/pocketbase/pocketbase/9.2-collection-schema-management

I have made **few samples python scripts** next to the docker configs: https://github.com/JAlcocerT/Docker/tree/main/Dev/BaaS/PB

```sh
cd ./Dev/BaaS/PB
python3 create_user_settings.py
```

> Once executed, Validate within the UI that they are as you wanted it to be: `http://localhost:8080/_/#/collections`

You can also **export the existing collections** into json:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Dev/BaaS/PB/create_user_settings.py" title="Pocketbase x Py, Collection Creator ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Dev/BaaS/PB/export_collections.py" title="Pocketbase x Py, Collections Export ↗" >}}
{{< /cards >}}


To make the code a little bit cleaner, we can have the **collection creator** to get the collection details **from a JSON with the details**, instead of hardcode them.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Dev/BaaS/PB/create_json_collection.py" title="Pocketbase x Py, Collection JSON Creator ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Dev/BaaS/PB/collection_details.json" title="Pocketbase JSON Collection Sample ↗" >}}
{{< /cards >}}

```sh
python3 create_json_collection.py user_settings
make create-specific COLLECTIONS="posts user_settings" #if some exist, it will skip it
```

And I also brought a way to list and delete collections:

```sh
make list-collections
make delete-collection COLLECTIONS="user_settings"
```

We can also export existing collections from the UI, or programatically: See [this md](https://github.com/JAlcocerT/Docker/blob/main/Dev/BaaS/PB/SCRIPT_USAGE.md#collection-export)


{{% details title="Full format vs Portable for Recreation... 🚀" closed="true" %}}

There are two different formats:

📊 Format Comparison:
🔴 Full Format (what you just exported):
Raw PocketBase API format - exactly as stored in PocketBase
Contains IDs, timestamps, metadata
Relations use collectionId (like "_pb_users_auth_")
Not directly usable for recreation

🟢 Template Format (for 
create_json_collection.py
):
Clean, portable format - designed for recreation
No IDs or timestamps
Relations use collectionName (like "users")
Directly compatible with your JSON creation system

{{% /details %}}

> All that should get you started to **interact with PB via Python Scripts 🐍**



### PocketBase x Flask

If you are vibecoding, you can get a quick sample [Flask](https://jalcocert.github.io/JAlcocerT/web-apps-with-flask/) Web App connected to Pocketbase as its BE.

Then, it can signup/in users and create posts:

```sh
#https://github.com/JAlcocerT/Docker/tree/main/Dev/BaaS/PB
cd ./Dev/BaaS/PB
uv run flask_pocketbase_app.py 
```

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/blob/main/Dev/BaaS/PB/flask_pocketbase_app.py" title="Pocketbase x Flask WebAp ↗" >}}
{{< /cards >}}

![Flask connected to local PocketBase](/blog_img/dev/PB/flask-pocketbase.png)

It creates a `posts` collection with these fields:

* title (text, required)
* content (editor, required)
* author (text, required)
* published (boolean, default: false)
* tags (select, optional)
* featured_image (file, optional)

![PB collection of the sample Flask WebApp](/blog_img/dev/PB/pb-posts-collection.png)

If you create a post via adding a new record into the posts collection, it will be reflected in the Flask UI.

> It was all one prompt and Claude Sonnet 4 magic...

This can be a quick and local alternative to bring user authentication.

But, even if you ask for the email, it wont be validated.

Unlike [LogTo](https://jalcocert.github.io/JAlcocerT/testing-tinyauth/#logto-authentication) was doing for us properly and out-of-thebox:

![LogTo custom domain auth](/blog_img/dev/PB/logto-custom-domain-auth.png)

For **LogTo References**, see these posts:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/testing-tinyauth" title="Traefik + TinyAuth vs Logto | Three Bodies Post ↗" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/using-stripe-with-flask/#conclusions" title="Logto x Stripe | Webify Post ↗" >}}

{{< /cards >}}

And these sample webapps with their code:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/WebifAI/blob/main/Z_Utils/logto_utils.py" title="WebifAI Repo" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Flask Web App with Stripe, Umami, FormBricks and Logto as Utils" >}}
  {{< card link="https://github.com/JAlcocerT/ThreeBodies/tree/main/LogTo" title="Three Bodies Web App Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Flask Web App to test Traefik x TinyAuth and compare it with LogTo" >}}
{{< /cards >}}



### PocketBase x Stripe

People are building in public: https://www.reddit.com/r/pocketbase/comments/1cfnt5f/i_built_a_pocketbase_stripe_extension_and_open/

* https://github.com/mrwyndham/pocketbase-stripe
    * And seeling on top of it - https://www.fastpocket.dev/
* https://github.com/mrwyndham/pocketbase-mcp

>  MCP server for building PocketBase apps really quickly - Need a front end quick consider FastPocket 

### PB x Collections JS

I was wondering how to get specific pb collections initialize from the first moment.

I tried to do some py script that setup the collections I need.

But it seems that there is another way: via `./pb_migrations/*.json` files

* https://pocketbase.io/docs/js-migrations/
* https://deepwiki.com/pocketbase/pocketbase/7-migrations-system

```sh
#docker volume ls
docker volume prune -f
docker volume ls -f dangling=true
docker system df -v

#sudo docker prune
#docker system prune -a
#docker system prune -a --volumes
```

Adding a timestamp string to get trazability:

```sh
touch devops/pocketbase/pb_migrations/$(date +%s)_created_my_collection.js
```

## Redux


---

## Conclusions

I got to know along the way about: https://deepwiki.com/pocketbase/pocketbase
