---
title: "PocketBase for BackEnd"
date: 2025-08-05
draft: false
tags: ["PocketBase","OSS Auth","Concurrency"]
description: 'Things your learn outside the confort zone. BackEnd Storage for a WebApp'
url: 'pocketbase-redux'
---

**TL;DR** 

I finally got to try [PB](#pocketbase). 

It can be used as auth for your [Flask Web Apps](#pocketbase-x-flask) and also be connected via JS SDK to FE.

Along the way, I got to know few [new concepts](#concepts), like: Redux, Dexie 

**Intro** *This is way far from my confort zone, yet here we go*

Despite not been able to code in Go, I really admire few projects already that use Go.

HUGO was the first for me.

And now is time to Pocketbase, also written in Go.

1. What it is [PB](#pocketbase?
2. Using PB with Flask - *Some day PB + Stripe*
3. Understanding PB Collections
4. The [PB JS SDK](#pb-sdk)



## PocketBase

PocketBase is a single, **self-contained Go application** that bundles several key components into one executable file:

* **An embedded SQLite database:** This is the core storage engine. So yes, it does contain a database.
* **A RESTful API:** This provides an interface to interact with the data in the database.
* **An authentication system:** It handles user sign-up, login, and authorization.
* **A web-based admin UI:** This allows you to manage your collections, data, and users without writing any code.
* **Real-time subscriptions:** It enables your frontend to listen for live data changes.

Because it provides all of these features out-of-the-box, it's designed to be a full backend for applications, allowing you to build a project without having to set up a separate database server, API, and authentication system.

* https://pocketbase.io/
    * https://pocketbase.io/docs/
    * https://github.com/pocketbase/pocketbase

> **MIT** | Open Source realtime backend in 1 file 

PB Features:

1. Realtime database
2. Authentication
3. File storage
4. Admin dashboard

> While PocketBase **includes** a database, it's more accurate to call it a **backend-as-a-service (BaaS)** or a "realtime backend" rather than *just a database*. 

> > You can also try with the demo: https://pocketbase.io/demo/



### PB 101

In simple terms: PB can be selfhosted, its better for read than for writes and its [data model and collections](#programatic-pb-interaction) are very useful.


**Selfhosting PB**

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

```sh
curl -s http://localhost:8080/api/health || echo "PocketBase not accessible"
#curl -s http://localhost:9000/api/health || echo "PocketBase not accessible"
```

![SelfHosting PocketBase](/blog_img/dev/PB/selfh-pb.png)

> You can use PB admin UI via the default: http://localhost:8080/_/

> > And log in as per your `.env` credentials if you provided any, or just created an account


**What you need to know about PB**

PB uses sqlite as its DB!

1. you have a `pb_data/data.db` that you can inspect with a client:

```sh
 sqlite3 ./data.db
#SQLite version 3.37.2 2022-01-06 13:25:41
#Enter ".help" for usage hints.
sqlite> .tables
# _authOrigins           _params                knowledge_source_tags
# _collections           _superusers            knowledge_sources    
# _externalAuths         agent_types            role_prompts         
# _mfas                  chat_model_info        users                
# _migrations            chat_models          
# _otps                  knowledge_source_info
# sqlite> 
```

* https://kerkour.com/sqlite-for-servers


pb is concurrent for reads (select and with)
nonconcurrent for writes/updates of data!!!

2. `./pb_hooks` and `./pb_migrations` folder are checked first whenever PB gets intialized (its configures any initial collections for example)


### Programatic PB Interaction


Overview of Core Data Entities as per https://deepwiki.com/pocketbase/pocketbase/2.2-data-model

The **PocketBase data model** is built on three primary entities:

1. Collections - Schema definitions that describe the structure of data (similar to tables in traditional databases)
2. Records - Individual data entries stored within collections (similar to rows in a table)
3. Fields - The attributes or properties that define the structure of records (similar to columns)

You might need to create **collections in pocketbase**

And you can do so via the UI:

![PB Collection UI](/blog_img/dev/PB/pocketbase-collection-ui.png)

But you can interact with collections via scripts.

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

> > But dont forget that you can also get collections initialized into PB thanks to `./pb_migrations/*.js` 


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
#docker stop $(docker ps -a -q) #stop all
#docker kill $(docker ps -q)

#make up-local-setup
du -sh ./* | sort -h
```

```sh
#docker volume ls
docker volume prune -f
docker volume ls -f dangling=true
docker system df -v
#docker volume ls -q | grep -v '^portainer_data$'
#docker volume rm $(docker volume ls -q | grep -v '^portainer_data$')

#sudo docker prune
#docker system prune -a
#docker system prune -a --volumes
```

Adding a timestamp string to get trazability:

```sh
touch devops/pocketbase/pb_migrations/$(date +%s)_created_my_collection.js
```

If you **define those collections**with proper syntax, you will get them initialized from the get to when you run the PB container.

Fast API: http://localhost:3900/docs

### PB SDK

* https://github.com/pocketbase/js-sdk
  * https://www.npmjs.com/package/pocketbase

---

## Conclusions

I got to know along the way about: 

1. https://deepwiki.com/pocketbase/pocketbase

Which provides info about many libraries

2. Connect your backend to your client libraries and frameworks https://github.com/get-convex/convex-backend


## Concepts


**Some new concepts**

1. Concurrency = Multiple Things Happening at the Same Time
Concurrency means multiple operations or processes running simultaneously and potentially accessing the same resources.

2. Race Condition = When Concurrency Goes Wrong
A race condition is a specific problem that occurs in concurrent systems when:

Multiple processes access shared data simultaneously
The final result depends on the unpredictable timing of these accesses
This leads to inconsistent or corrupted data

3. Redux, [browser storage technologies](#local-vs-session-storage), [IndexDB](#indexdb), RTK...

### Redux

Redux is a predictable **state management library** for JavaScript applications.

It helps you manage the state of your application in a single, centralized store, making it easier to understand how and when the state changes. 

> While it's most commonly used with React, it can be used with any other UI library. 

Redux is not a local data storage solution like localStorage or sessionStorage. It's a state management library for your application's memory.

{{< details title="About redux... 📌" closed="true" >}}

**Core Principles**

Redux operates on three fundamental principles:

1.  **Single source of truth**: The state of your entire application is stored in a single object tree within a single store. This makes it easier to debug and test your application, as all state is in one place.

2.  **State is read-only**: The only way to change the state is by dispatching an **action**. An action is a plain JavaScript object that describes what happened. For example, `{ type: 'ADD_TODO', text: 'Learn Redux' }`. This ensures that views can't directly modify the state, preventing unpredictable behavior.

3.  **Changes are made with pure functions**: To specify how the state tree is transformed by actions, you write **reducers**. Reducers are pure functions that take the current state and an action as arguments, and return a new state. They must not mutate the original state or perform any side effects like API calls.

---

**How it Works**

The data flow in a Redux application follows a strict, one-way cycle:

1.  **View**: The user interacts with the application's UI, which dispatches an action.
2.  **Action**: An action object is dispatched to the store.
3.  **Reducer**: The store passes the action and the current state to the reducer. The reducer calculates and returns a new state.
4.  **Store**: The store updates its state with the new state from the reducer.
5.  **View**: The store notifies the view of the state change, and the view re-renders itself to reflect the new state.

This unidirectional data flow makes it easy to trace the source of any state change, which is a major benefit for debugging and maintenance. 



{{< /details >}}



{{< details title="What redux does compared to local storage... 📌" closed="true" >}}

No, Redux is **not** a local data storage solution like `localStorage` or `sessionStorage`. It's a **state management library** for your application's memory.

**What Redux Does**

Redux holds your application's state in a single, centralized object called the **store**. 

This store exists only while your application is running in the browser's memory. When you refresh the page or close the tab, the Redux store and all its data are cleared.

---

**What Local Storage Does**

Local storage, on the other hand, is a browser feature that allows you to store key-value pairs of data persistently.

This data is saved on the user's computer and remains even after the browser is closed.

This makes it suitable for things like user preferences, authentication tokens, or cached data that you want to persist between sessions.

---

**Key Differences**

* **Persistence**: Redux data is temporary and lost on page refresh. Local storage data is persistent and remains until explicitly cleared.
* **Purpose**: Redux is for managing the dynamic state of an application (e.g., UI state, fetched data). Local storage is for saving persistent data across browser sessions.
* **Access**: Redux state is managed through a strict, predictable flow of actions and reducers. Local storage data is accessed directly through a simple API (`localStorage.getItem()`, `localStorage.setItem()`).

{{< /details >}}

While you can use Redux and local storage together (e.g., to save your Redux state to local storage to persist it), they serve different purposes.

Redux manages the active state of your application, while local storage provides a way to save data on the user's device for long-term use.


### Local vs Session Storage

If you go to the inspect section of a website and you go the `application` part of it...

Under storage, you will see 2 options: locan and session storage:


![Local vs Session Storage](/blog_img/dev/PB/local-session-storage.png)

> These 2 are **browser storage technologies!**


{{< details title="More about local vs session... 📌" closed="true" >}}

**1. localStorage**

**What it is**: Persistent key-value storage that survives browser restarts
**Storage Limit**: ~5-10MB per origin
**Scope**: Per origin (protocol + domain + port), shared across all tabs

**Pros:**
- ✅ **Persistent** - Data survives browser restart
- ✅ **Simple API** - Easy to use key-value interface
- ✅ **Synchronous** - No async/await needed
- ✅ **Cross-tab sharing** - All tabs see the same data
- ✅ **Wide browser support** - Available everywhere

**Cons:**
- ❌ **Limited storage** - Only 5-10MB
- ❌ **String-only** - Must JSON.stringify/parse objects
- ❌ **Blocking** - Synchronous operations can freeze UI
- ❌ **No transactions** - Race conditions possible
- ❌ **No indexing** - Linear search only

**2. sessionStorage**
**What it is**: Temporary key-value storage that dies when tab closes
**Storage Limit**: ~5-10MB per origin
**Scope**: Per tab/window only

**Pros:**
- ✅ **Tab-isolated** - Each tab has independent storage
- ✅ **Simple API** - Same as localStorage
- ✅ **Automatic cleanup** - Cleared when tab closes
- ✅ **Synchronous** - No async/await needed

**Cons:**
- ❌ **Temporary** - Lost when tab closes
- ❌ **Tab-isolated** - Can't share data between tabs
- ❌ **Limited storage** - Only 5-10MB
- ❌ **String-only** - Must JSON.stringify/parse objects
- ❌ **No transactions** - Race conditions possible


{{< /details >}}

### RTK

RTK Query acts as an **abstraction layer** over browser storage.

### IndexDB

IndexedDB is the standard, low-level database API built into all modern web browsers.

It's designed for **client-side storage** of large amounts of structured data, including files and blobs.

Think of it as a NoSQL database that runs directly in the browser.

However, the native IndexedDB API is notoriously complex, verbose, and difficult to work with.

It's asynchronous and uses a callback-based system, which can lead to a lot of boilerplate code, even for simple operations.


**What it is**: Browser's built-in NoSQL database with transactions
**Storage Limit**: ~50MB+ (varies by browser)
**Scope**: Per origin, shared across tabs

**Pros:**
- ✅ **Large storage** - 50MB+ capacity
- ✅ **Object storage** - Can store complex objects directly
- ✅ **Transactions** - ACID properties for data integrity
- ✅ **Indexing** - Fast queries with indexes
- ✅ **Asynchronous** - Non-blocking operations
- ✅ **Persistent** - Survives browser restart

**Cons:**
- ❌ **Complex API** - Difficult to use directly
- ❌ **Asynchronous** - Requires Promise/callback handling
- ❌ **Browser variations** - Inconsistent implementations
- ❌ **No SQL** - NoSQL query limitations
- ❌ **Debugging difficulty** - Hard to inspect data



#### Dexie

* https://dexie.org/

Dexie.js is a powerful JavaScript library that acts as a **wrapper for IndexedDB**. 

What Dexie.js Does: **Dexie simplifies working with IndexedDB** by providing a much more intuitive, elegant, and developer-friendly API.

> It's like how jQuery simplified DOM manipulation or how a framework simplifies building a web application.

With Dexie, you can:

* **Use a Promise-based API:** This makes asynchronous operations much easier to handle with `async/await`.
* **Define a database schema:** You can easily define your "tables" (called object stores in IndexedDB) and indexes.
* **Perform powerful queries:** Dexie provides a simple, SQL-like syntax for querying your data.
* **Manage transactions:** It simplifies the complex transaction model of IndexedDB.
* **Handle database migrations:** It provides a clear way to update your database schema when your application evolves.
* **Get real-time updates:** Dexie supports "live queries" that can automatically update your UI when the data in the database changes.

**How it Relates to Redux and Local Storage**

Dexie, Redux, and local storage all deal with data, but they serve different and often complementary purposes:

| Feature           | **Redux** | **Local Storage** | **Dexie.js (and IndexedDB)** |
| ----------------- | ---------------------------------------- | ------------------------------------------------- | -------------------------------------------------- |
| **Purpose** | In-memory application state management   | Simple, persistent key-value storage              | Persistent, structured database storage            |
| **Data Flow** | Unidirectional, predictable (actions)    | Direct, synchronous API (get/set)                 | Asynchronous, promise-based (CRUD operations)      |
| **Persistence** | Temporary (lost on page refresh)         | Permanent (persists across sessions)              | Permanent (persists across sessions)               |
| **Data Size** | Best for small-to-medium UI state        | Small (typically a few megabytes)                 | Large (hundreds of megabytes or more)              |
| **Data Structure**| Any JavaScript object                    | Strings only (objects must be serialized)         | Any structured data, including blobs and files     |
| **Querying** | No built-in querying, state is read directly | Only by key                                     | Powerful querying with indexes and filters         |


**The Interplay:**

* **Redux vs. Dexie/Local Storage:** Redux is for "application state" (e.g., whether a modal is open, the currently selected item, the current state of a form). 

Dexie and local storage are for "persistent data" (e.g., user profiles, a list of todos, cached API data). 

The two can work together.

For example, you could fetch data from a server and save it to a Dexie database for offline use, and then load a small, relevant subset of that data into your Redux store to manage the UI state.

* **Dexie vs. Local Storage:** Dexie is a much more powerful and scalable solution than local storage. Use local storage for simple, small pieces of data (like a user's theme preference). 

Use Dexie when you need to store large amounts of structured data, perform complex queries, or build an application that works offline.