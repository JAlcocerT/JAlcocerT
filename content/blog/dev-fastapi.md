---
title: "FastAPI"
date: 2025-08-13
draft: false
tags: ["Dev","Python","FE vs BE"]
description: 'FastAPI and concepts for your Python BackEnd'
url: 'fast-api'
---


**TL;DR**

Ive been working with [PB](https://jalcocert.github.io/JAlcocerT/pocketbase/), [DBs](https://jalcocert.github.io/JAlcocerT/databases-101/) lately, within a [FastAPI](#fastapi) Python BE and wanted to write about few new concepts

**Intro**


> Stay if you also want to see how to [install the Py version you want](#proper-py-and-uv).


## FastAPI

FastAPI is a modern, high-performance web framework for building **APIs (Application Programming Interfaces)** with Python.

It's designed to be fast, easy to use, and to automatically generate API documentation.

{{% details title="interactive API documentation out of the box..." closed="true" %}}

It automatically generates two different documentation UIs based on the OpenAPI standard.

* **Swagger UI**: Accessible at `/docs`, this is a fully interactive interface where you can see all your API endpoints, their expected parameters, and their response models. You can also make live requests directly from the browser to test your endpoints. 

> This is what you see at `http://localhost:3900/docs` in your example. 


* **ReDoc**: Accessible at `/redoc`, this is a more compact and elegant documentation UI that is better for viewing the API reference. It is designed to be read like a single-page document.

This automatic documentation is a core feature of FastAPI and is enabled by default. 

It's a key advantage because it eliminates the need for manual documentation, ensuring your API docs are always up-to-date with your code.

{{% /details %}}


{{% details title="Whats that cool SWAGger UI..." closed="true" %}}

A Swagger UI is an interactive, web-based documentation interface for an API. It automatically generates a visual representation of your API, allowing developers to interact with and understand the endpoints without needing to write any code. 

Why it Matters

The Swagger UI is a crucial tool for modern API development because it directly addresses several common challenges:

* **Discoverability**: It makes an API's functionality immediately discoverable. Developers can browse a complete list of endpoints, their methods (GET, POST, PUT, DELETE), and the paths they use, all in one place.
* **Ease of Use**: It turns API documentation into a live, interactive tool. Users can try out the API directly from the UI by filling out forms for parameters and request bodies, then executing the request to see the response. This dramatically simplifies the process of learning and testing an API.
* **Consistency**: When a framework like **FastAPI** generates a Swagger UI, it does so directly from the code. This ensures that the documentation is always up-to-date with the latest version of the API, eliminating the risk of outdated or inaccurate docs.
* **Collaboration**: It serves as a single source of truth for the API's contract. Both frontend and backend developers can use it to agree on data models and endpoints, which improves collaboration and reduces miscommunication.

{{% /details %}}


{{% details title="How FASTAPI Relates to Redux, Dexie, and Local Storage... 🚀" closed="true" %}}

FastAPI, [Redux, and Dexie/local storage](https://jalcocert.github.io/JAlcocerT/pocketbase/#local-vs-session-storage) all deal with data.

But they operate at completely different levels of the application stack.

* **FastAPI is the backend.** 💻 It's the server-side technology that runs on a remote machine.

Its job is to handle requests from clients (like a web browser), interact with a database (like PostgreSQL, MySQL, etc.), and send back responses. 

It doesn't run in the user's browser!

* **Redux, Dexie, and local storage are frontend technologies.** 🌐 They all run directly in the user's browser and manage data on the client side.

* **FastAPI provides the data, and the others manage it.** A typical workflow would look like this:
    1.  A user visits a web page.
    2.  The frontend (built with a framework like React) makes a request to the **FastAPI** backend to get some data.
    3.  FastAPI receives the request, queries its database, and sends the data back to the frontend.
    4.  The frontend receives the data. It might then:
        * Store the data in **Redux** to manage the application's current state and update the UI.
        * Store a persistent copy of the data in a **Dexie** database to allow the user to view it offline.
        * Store a small piece of user-specific data, like a user ID or a preference, in **local storage**.

In short, FastAPI is the **server** that provides the data, while Redux, Dexie, and local storage are different ways the **client** (the user's browser) can store and manage that data.

They are not competing technologies but are often used together in a modern web application.

{{% /details %}}



## Concepts


### What is an API Endpoint?

An **API endpoint** is a specific URL where a client application can access a web service.

Think of it as a **digital address** where your application sends requests to get or modify data.

For example, the following command uses an endpoint to check the service's status:

```sh
curl -X GET "http://localhost:3900/healthcheck" -H "accept: application/json"
```

The endpoint's **anatomy** can be broken down into three main components:

  * **HTTP Method**: The action to be performed (e.g., `GET`, `POST`, `PUT`, `DELETE`).
  * **Base URL**: The server's address (e.g., `http://localhost:3900`).
  * **Path**: The specific resource's location (e.g., `/api/settings`).

A complete endpoint request combines these parts, for example: `GET http://localhost:3900/api/settings`.

Endpoints and the Real World 🏠

You can think of endpoints like addresses in a city.

Each address serves a different purpose, and the **HTTP method** tells the server what to do at that address.

  * `GET /api/settings`: "Go get the user's settings."
  * `PUT /api/settings`: "Go update the user's settings."
  * `GET /api/settings/health`: "Go check if the service is working."

This structure, where a unique combination of method and URL defines an action, makes it easy to understand and interact with a web service.

**HTTP Methods Explained**

| Method | Purpose | Example |
| :--- | :--- | :--- |
| **GET** | Retrieve data | Get user settings |
| **PUT** | Update/replace data | Update user settings |
| **POST** | Create new data | Create new user |
| **DELETE** | Remove data | Delete user account |

{{% details title="More http methods... 🚀" closed="true" %}}

There are other HTTP methods beyond the common four (GET, POST, PUT, DELETE).

While the four you mentioned are the most frequently used for building RESTful APIs, the HTTP/1.1 standard defines a number of others.

Here are some of the other HTTP methods and their purposes:

* **HEAD**: This method is similar to a `GET` request, but the server only sends back the **headers** and not the actual message body. This is useful for checking if a resource exists or verifying its size or modification date without downloading the entire content.

* **OPTIONS**: This method is used to describe the communication options for the target resource. A client can use it to find out what other methods (like `GET`, `POST`, etc.) are supported by a specific URL. It's often used by browsers for preflight requests in Cross-Origin Resource Sharing (CORS). 

* **PATCH**: This method is used to apply **partial modifications** to a resource. Unlike `PUT`, which typically replaces the entire resource with new data, `PATCH` only sends the changes. This can be more efficient, especially for large resources where only a small part needs to be updated.

* **CONNECT**: This method is used to establish a tunnel to the server identified by the target resource. It's often used by clients to communicate with a proxy server that can then forward the request to the final destination.

* **TRACE**: This method is used for diagnostics. It performs a message loop-back test, where the server reflects the received request back to the client. This is helpful for debugging and seeing how requests are being modified by intermediate proxies.

{{% /details %}}

> These methods are essential because they define the type of operation you want to perform on the resource specified by the endpoint's path.

You need an **API (Application Programming Interface)** in a web app to allow the frontend (what the user sees in their browser) to communicate with the backend (the server where the business logic and database live). 🖥️

An **endpoint** is a specific URL where a server or API can be accessed by a client. 

> It's essentially the address for a web service's functionality!

#### Front-End (FE) Engineer's Perspective

From a front-end perspective, an endpoint is the target of an **API call**. It's the URL the application uses to send and receive data from the back-end.

The front-end engineer doesn't typically worry about how the endpoint is implemented, but rather how to interact with it.

For example, an FE engineer building a social media app might interact with these endpoints:

* `GET /api/users/profile/123`: To retrieve user data for a profile page.
* `POST /api/posts`: To create a new post.
* `DELETE /api/posts/456`: To delete a specific post.

The front-end engineer's focus is on correctly forming the request (e.g., including the right headers, body, or query parameters) and then handling the response from the endpoint, whether it's successful data or an error.

#### Back-End (BE) Engineer's Perspective

For a back-end engineer, an endpoint is the **entry point** into the server-side code that performs a specific action.

The BE engineer is responsible for designing, building, and maintaining the logic that runs when an endpoint is hit.

For example, a BE engineer would create the code that handles a request to `POST /api/posts`. This code would:

1.  **Receive** the request from the client.
2.  **Validate** the data sent in the request (e.g., check if the post content is not empty).
3.  **Process** the data (e.g., save the new post to a database).
4.  **Send back** a response to the client (e.g., a success message with the new post's ID).

The back-end engineer's focus is on the robustness and security of the endpoint, ensuring it performs its function correctly and efficiently while protecting against vulnerabilities.

### Py Frameworks for APIs

**FastAPI**, **Flask**, and **Django** are all popular Python frameworks used to create API endpoints. 

You'll often see them used for building web services and applications.

| Framework | Philosophy | Best for... | Pros | Cons |
| :--- | :--- | :--- | :--- | :--- |
| **Flask** | **Micro-framework** 🤏 | Small, simple APIs and web apps, rapid prototyping, and learning. | Lightweight, highly flexible, easy to learn and get started with, and a vast ecosystem of extensions. | Requires manual setup for many features (e.g., database, validation, etc.), and it's synchronous by default which can be a bottleneck for I/O-bound tasks. |
| **FastAPI** | **Modern API-focused** 🚀 | High-performance APIs, microservices, and applications that require modern features like asynchronous operations and automatic documentation. | Extremely fast, built-in data validation and serialization (thanks to Pydantic), automatic interactive API documentation (OpenAPI/Swagger), and native support for asynchronous programming. | Newer framework with a smaller community than Flask or Django, and the asynchronous programming model can have a steeper learning curve for beginners. |
| **Django** | **"Batteries-included"** 🔋 | Large, complex web applications, especially those that need a full-featured backend with a database, admin panel, and user authentication out-of-the-box. | Comes with everything you need: a powerful ORM (Object-Relational Mapper), a built-in admin interface, and robust security features. | It's a large, opinionated framework with a steeper learning curve for small projects. It can be overkill if all you need is a simple API. |

* **Choose Flask** if you want maximum control and flexibility. It's perfect for when you have a very specific vision and don't want the framework to dictate how you build things. It's a great choice for beginners due to its simplicity.
* **Choose FastAPI** if performance and developer experience are your top priorities. Its automatic data validation and documentation save a lot of time and reduce bugs, making it ideal for building robust, high-performance APIs.
* **Choose Django** if you're building a large-scale, full-stack application and want a mature, well-supported framework that handles most of the boilerplate code for you. It's the go-to for many established, data-driven web projects. 


That's a great question, and it gets to the heart of what makes FastAPI so fast and modern. The key is that not all API stuff is synchronous; in fact, a lot of it is perfect for asynchronous processing.

**Why Asynchronous APIs?**

The traditional synchronous model for a web server is like a single-lane road. The server handles one request at a time. When it hits a slow operation, like waiting for a database query to complete or fetching data from another API (an I/O-bound task), it sits there and waits. No other requests can be processed.

An **asynchronous** model, on the other hand, is like a highway with many lanes. When the server hits a waiting period (an I/O-bound task), it doesn't wait. It parks that request and starts working on another one. When the slow operation for the first request is finished, the server comes back to it and completes the task. This is much more efficient, especially for APIs that have many concurrent users and perform many of these I/O-bound operations. 

---

**How FastAPI Achieves Asynchronicity**

FastAPI uses Python's built-in `asyncio` library to enable this. It's built on top of ASGI (Asynchronous Server Gateway Interface), which is a modern standard for Python web servers.

Here's how it works:

1.  **`async def`**: You define your endpoint functions using `async def`. This tells FastAPI that the function is an asynchronous coroutine.
2.  **`await`**: Inside your `async` function, you use the `await` keyword for any operation that needs to wait, such as calling a database or a third-party API. The `await` keyword tells the server, "I'm going to wait here, so go handle other requests in the meantime."
3.  **Automatic Handling**: FastAPI handles all the low-level details for you. It runs your asynchronous code in an event loop, allowing it to manage thousands of concurrent connections with minimal overhead. It can also run traditional, synchronous code in a separate thread pool so that you don't have to rewrite everything.

This approach makes FastAPI incredibly efficient and perfect for high-performance applications that need to handle a lot of concurrent requests without getting bogged down by slow I/O operations.

### Why an API is Necessary

A web app is typically split into two parts:

1.  **Frontend**: The client-side code (HTML, CSS, JavaScript) that runs in the user's browser. It's responsible for the user interface, handling user input, and displaying data.

2.  **Backend**: The server-side code that runs on a remote server. It's responsible for managing the database, performing complex calculations, handling security, and other crucial tasks.

The frontend cannot directly access the backend's database or run its code.

The **API acts as a middleman**, a set of rules and protocols that defines how the frontend can request data from and send data to the backend.

Without an API, the frontend would be static and unable to interact with any dynamic data or services.

For example, when you post a comment on a social media site, the frontend uses an API to send your comment to the backend, which then saves it to a database.

---

### REST Endpoints and Other Types

Yes, a common type of API call is to a **REST endpoint**.

**REST (Representational State Transfer)** is a widely used architectural style for building APIs. A REST endpoint is a specific URL that the frontend can call to perform an action. These endpoints are designed to be intuitive and stateless. For example, a REST API for a blog might have the following endpoints:

* `GET /posts`: Retrieves a list of all blog posts.
* `POST /posts`: Creates a new blog post.
* `GET /posts/123`: Retrieves the post with the ID `123`.
* `PUT /posts/123`: Updates the post with the ID `123`.
* `DELETE /posts/123`: Deletes the post with the ID `123`.

#### Other EndPoints

This is not the only type of API, though.

Other common types include:

* **SOAP (Simple Object Access Protocol)**: An older, more rigid protocol that relies on XML and is often used in enterprise environments. It's more complex than REST and generally requires more bandwidth.

* **GraphQL**: A newer query language for your API. With GraphQL, the client can request exactly the data it needs from a single endpoint, avoiding over-fetching or under-fetching data. This is in contrast to REST, where you often have to make multiple calls or get more data than you need from a single endpoint.

> If you ever heard about Ghost...

Ghost is an open-source publishing platform that provides a robust REST API for its core functionality.

However, it also offers a GraphQL layer specifically for working with frontend frameworks like Gatsby (surprise, another SSG!)

This allows developers to build static sites or dynamic frontends using Ghost as a "headless CMS" and get exactly the data they need with GraphQL queries.

{{< callout type="warning" >}}
Dont confuse endpoints with message brokers!
{{< /callout >}}

Kafka and RabbitMQ are **message brokers** or **message queue systems**.

Their purpose is to act as a middleman for communication between different parts of an application, often called microservices.

Instead of a direct request-response cycle, they use a publish-subscribe (or producer-consumer) model.

* A **producer** sends a message to the broker.
* The broker stores the message.
* A **consumer** subscribes to a specific topic or queue and receives the message.

The key difference is that this is **asynchronous communication**:

* The producer doesn't wait for a response from the consumer - *It sends the message and moves on.*
*  This is great for tasks that don't need an immediate response, like processing background jobs or handling a stream of real-time events.

{{< callout type="info" >}}
**A REST API**, by contrast, is a **synchronous request-response model** where the client waits for the server to reply.
{{< /callout >}}
  
With a synchronous method like a REST API built with FastAPI, a click on the frontend initiates a **request-response cycle**. 

Here's how it works:

1.  **Frontend Action**: The user clicks a button or performs an action in the browser. This triggers a JavaScript function.

2.  **Request Sent**: The JavaScript function sends an HTTP request (e.g., `GET`, `POST`) to a specific **API endpoint** on your FastAPI backend. The frontend is now "waiting" for a response.

3.  **Backend Processing**: FastAPI receives the request, processes it (e.g., retrieves data from a database, performs a calculation), and prepares a response.

4.  **Response Sent**: FastAPI sends the response back to the frontend.

5.  **Frontend Receives & Renders**: The JavaScript code on the frontend receives the response, extracts the data (usually in JSON format), and uses that data to update the UI. The user sees the result of their click.

This entire process is **synchronous** from the frontend's perspective in the sense that the code flow for that particular request waits for the response before proceeding to update the UI. 

The user's browser, however, is not blocked. 

Most modern JavaScript environments handle these network requests asynchronously so the user can continue to interact with other parts of the page.

---

## Conclusions

### Proper Py and uv

Make your Python have the version you want to: *in my case, I wanted 3.12.11*

```sh
sudo apt update
sudo apt install -y build-essential wget \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
  libffi-dev liblzma-dev

wget https://www.python.org/ftp/python/3.12.11/Python-3.12.11.tgz
tar -xzf Python-3.12.11.tgz
cd Python-3.12.11
./configure --enable-optimizations
make -j"$(nproc)"
sudo make altinstall   # installs as /usr/local/bin/python3.12
python3.12 --version
python3.12 -m pip install --upgrade pip setuptools wheel
```

If you are using uv, do:

```sh
#uv lock --python 3.12.11
```

If you had another one, **change the default python** to the new installed:

```sh
# verify current PATH order (expect /usr/local/bin before /usr/bin)
echo "$PATH"
which -a python3

# create symlink (adjust source if you installed under /opt)
sudo ln -s /usr/local/bin/python3.12 /usr/local/bin/python3

# verify it takes precedence
which -a python3
python3 --version   # should show 3.12.11
```