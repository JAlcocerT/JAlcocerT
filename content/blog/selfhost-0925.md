---
title: "SelfHosting Updates - Summer 2025"
date: 2025-08-30T01:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Selfhosting Updates: Leds and API with the Pi'
url: 'selfhosted-apps-aug-2025'
---



## Pi and IoT

### LEDs

* https://github.com/awawa-dev/HyperHDR

https://github.com/appleimperio/docker-hyperhdr


> MIT |  Highly optimized open source ambient lighting implementation based on modern digital video and audio stream analysis for Windows, macOS and Linux (x86 and Raspberry Pi / ARM). 

### HA

https://www.home-assistant.io/docs/automation/

### APIs

https://www.postman.com/downloads/

Ah, you meant **Postman**, not Podman! My apologies for the confusion. Let's talk about Postman.

**Yes, Postman (the API platform) has a free tier, which is open source in the sense that it's freely available for anyone to download and use for their API development and testing needs.**

However, **Postman as a whole is not entirely open source under a standard open-source license like Apache, MIT, or GPL.**

Here's a breakdown:

* **Postman Free Tier:** This is the most commonly used version and offers a wide range of features for individuals and small teams. It's free to download and use.
* **Postman Core Functionality:** The core functionality for sending requests, inspecting responses, creating collections, and basic testing is available in the free tier.
* **Postman Cloud and Collaboration Features:** Postman also offers paid plans that unlock more advanced collaboration features, larger team sizes, advanced monitoring, and more. These paid features are proprietary.
* **Newman (Command-Line Collection Runner):** Newman, Postman's command-line Collection Runner, **is open source** and available under the Apache 2.0 license. This allows you to run and test your Postman Collections from the command line and integrate them into CI/CD pipelines.

**Why would you need Postman?**

Postman is an incredibly popular and powerful tool for API development, testing, and documentation. Here's why you might need it:

**1. API Testing:**
    * **Ease of Use:** Provides a user-friendly graphical interface to send HTTP requests (GET, POST, PUT, DELETE, etc.) without needing to write code.
    * **Request Building:** Easily construct requests with headers, request bodies (JSON, XML, form-data, etc.), and parameters.
    * **Response Inspection:** View and analyze API responses, including status codes, headers, and the response body (formatted for readability).
    * **Assertions and Testing:** Write tests and assertions to automatically verify the correctness of API responses.
    * **Environment Management:** Create and manage different environments (e.g., development, staging, production) with their own sets of variables.

**2. API Development:**
    * **Prototyping:** Quickly prototype and explore APIs you are building.
    * **Debugging:** Helps in debugging API issues by allowing you to inspect requests and responses.
    * **Collaboration:** Share collections and environments with team members for collaborative API development.

**3. API Documentation:**
    * **Collection Documentation:** Postman allows you to document your APIs directly within collections, making it easier for others (or your future self) to understand how to use them.
    * **Publishing Documentation:** You can publish interactive API documentation from your Postman Collections.

**4. API Exploration:**
    * **Learning New APIs:** Easily explore and understand third-party APIs without needing to write code.

**5. Workflow Automation:**
    * **Collection Runner:** Automate the execution of API tests within collections.
    * **Newman Integration:** Integrate API tests into your development and deployment pipelines.

**In summary:**

Postman's free tier provides a robust set of tools for interacting with APIs and is widely used by developers for testing, development, and exploration. While the entire platform isn't open source, key components like Newman are. You would need Postman if you work with APIs and want a user-friendly and efficient way to interact with them, test them, and understand how they work. Its collaborative features (especially in paid tiers) are also valuable for team-based API development.


Yes, there are several **totally and fully open-source alternatives to Postman**. These tools offer similar functionality for API testing and development but are released under open-source licenses, giving you more freedom and control.

Here are some popular and actively maintained fully open-source alternatives to Postman:

* **Insomnia (Kong/insomnia on GitHub):** This is a very popular and feature-rich open-source API client that supports REST, GraphQL, WebSockets, Server-Sent Events (SSE), and gRPC. It offers a clean and intuitive interface, collections, environments, code generation, and a plugin ecosystem. It has a free tier with unlimited private projects and collaboration for one project, but the core is open source.

* **Hoppscotch (hoppscotch/hoppscotch on GitHub):** Formerly known as Postwoman, Hoppscotch is a fast, lightweight, and beautifully designed open-source API development ecosystem. **It's available as a web application and a desktop app, supporting REST, GraphQL, WebSockets, and Server-Sent Events**. It emphasizes ease of use and real-time collaboration through workspaces (though the collaboration features might have some non-fully-open-source aspects in their cloud offering).

https://github.com/hoppscotch/hoppscotch

> MIT | Open source API development ecosystem - https://hoppscotch.io (open-source alternative to Postman, Insomnia)

https://www.youtube.com/watch?v=l2DWcWb9HlM

```sh
docker run -d --name hoppscotch -p 3000:3000 --restart=unless-stopped hoppscotch/hoppscotch:latest
```

```sh
wget https://github.com/hoppscotch/releases/releases/latest/download/Hoppscotch_linux_x64.deb
sudo apt install ./Hoppscotch_linux_x64.deb #https://hoppscotch.com/download
```

* **Bruno (usebruno/bruno on GitHub):** Bruno is a relatively new but promising open-source API client that aims to be a direct alternative to Postman. It focuses on a local-first approach, storing your collections directly in a file system (using a simple markup language called Bru) and emphasizing privacy. It supports REST and GraphQL and has a clean, developer-centric interface. It also plans to integrate with Git for collaboration.

* **HTTPie (httpie/httpie on GitHub):** This is a command-line HTTP client that is known for its user-friendly syntax. While it's a CLI tool and doesn't have a GUI like Postman, it's excellent for quick API testing and automation within scripts. It's fully open source and widely used. There's also a desktop app in development.

* **Restfox (flawiddsouza/Restfox on GitHub):** Restfox is a lightweight and fast open-source REST API client available as a desktop application for Windows, macOS, and Linux. It offers a clean interface, collections, history, and basic authentication.

* **Firecamp (firecamp-dev/firecamp on GitHub):** Firecamp is an open-source API development platform with a focus on a developer-centric UI. It supports various protocols like REST, GraphQL, and WebSockets and aims to streamline the API development workflow.

* **Yaade (apidoc7/yaade on GitHub):** Yaade is an open-source, self-hosted, collaborative API development environment. It aims to provide a complete platform for designing, developing, and testing APIs.

**Key Advantages of Fully Open-Source Alternatives:**

* **Transparency:** You can inspect the source code to understand how the tool works and ensure there are no hidden agendas or security vulnerabilities.
* **Community-Driven Development:** The tools often benefit from contributions and feedback from a large community of developers.
* **Customization and Extensibility:** Open-source licenses typically allow you to modify and extend the tool to fit your specific needs.
* **No Vendor Lock-in:** You are not tied to a specific company or their proprietary platform.
* **Often Free of Charge (as in freedom and price):** While some open-source projects might offer paid support or enterprise features, the core functionality is usually free to use.

When choosing an alternative, consider your specific needs, such as the protocols you work with, the importance of collaboration features, whether you prefer a GUI or CLI, and your comfort level with community-supported software. All the options listed above are viable and actively developed, offering strong alternatives to Postman's free tier without the proprietary aspects of the full Postman platform.