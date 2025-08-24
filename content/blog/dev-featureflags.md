---
title: "Fature Flags for your SaaS"
date: 2025-08-29
draft: false
tags: ["Dev"]
description: 'FF with Go for your WebApps.'
url: 'feature-flags'
---

**TL;DR** I got to know about [Go Feature Flag](#go-feature-flag), a better way to activate functions to Flask Web Apps than via *container + env vars*?

**Intro**

Feature flags, also known as feature toggles, are a software development technique that allows you to turn specific features of an application on or off without deploying new code.

They are essentially **conditional statements** in your codebase that control which features are visible or active for users.

***

### Are They Recommended?

Yes, feature flags are highly recommended for modern software development.

 They provide significant benefits:

* **Decoupling Deployment from Release:** This is a core benefit. You can deploy a new feature to production and then release it to users later by simply flipping a flag. This reduces risk and allows for more frequent deployments.
* **A/B Testing:** You can use flags to show different versions of a feature to different user segments to gather data and determine which performs better.
* **Kill Switch:** If a new feature causes a critical bug or performance issue, you can immediately disable it with a flag without having to roll back the entire application.
* **Targeted Rollouts:** You can gradually roll out a feature to a small percentage of users (e.g., 1%, then 10%, then 100%) to monitor its stability and gather feedback before a full release.
* **Personalization:** Feature flags can be used to personalize the user experience by enabling or disabling features based on a user's plan, location, or other attributes.
* **Trunk-Based Development:** They are essential for a **trunk-based development** workflow, where all developers merge their code into the main branch frequently. Flags allow unfinished or experimental features to be merged without affecting the live application.

***

### Can They Be Passed by Environment Variables?

Yes, feature flags can be passed by **environment variables**, but this is typically only suitable for a very simple setup. 

* **Simple Use Cases:** For features that are either entirely on or off for the entire application, an environment variable (e.g., `ENABLE_BETA_FEATURE=true`) can work. This is common for enabling a new API endpoint or a backend service.
* **Limitations:** This method becomes impractical and unmanageable for more complex scenarios. It doesn't allow for:
    * **Per-user or per-group targeting**
    * **Gradual rollouts**
    * **Remote management** without a full application restart or redeployment
    * **A/B testing**

For these reasons, most professional setups use a dedicated **feature flag management system** or service. These services provide a central dashboard to manage flags, target users, and analyze data without code changes or restarts. 

While feature flags are a powerful tool, they are not a silver bullet and come with their own set of drawbacks if not managed carefully. The main cons of feature flags include:

### 1. Increased Code Complexity and Technical Debt
* **Conditional Logic:** Each feature flag adds conditional logic (e.g., `if (featureEnabled)` statements) to the codebase. As the number of flags grows, the code can become littered with these checks, making it harder to read, understand, and maintain.
* **Code Bloat:** Long-lived or forgotten flags lead to "dead code" that remains in the application, increasing its size and complexity unnecessarily. This technical debt makes it harder for new developers to understand the system and for existing developers to make changes.
* **Combinatorial Explosion:** When multiple flags interact, the number of possible code paths and states can explode exponentially. This makes it difficult to reason about the system's behavior and can introduce subtle bugs that only appear in specific, hard-to-reproduce flag combinations.

### 2. Testing and Debugging Challenges
* **Complexity:** Testing an application with feature flags is far more complex than testing one without them. You can no longer just test a single code path. You must test every possible combination of flags to ensure the application behaves as expected. This can significantly increase the time and effort required for QA.
* **Reproducing Bugs:** When a bug is reported, it can be very difficult to reproduce if you don't know the exact combination of flags that was active for the user at the time. This can lead to frustrating and time-consuming debugging sessions.
* **Stale Flags:** A bug can be caused by a flag that was meant to be temporary but was left in the codebase for too long. Over time, the code behind the flag may no longer work as intended with the rest of the application, leading to regressions when it is accidentally enabled.

### 3. Management and Coordination Overhead
* **Lack of Discipline:** Without a clear process for cleaning up flags, they can accumulate over time and become unmanageable. This requires a strong team culture and discipline to regularly review and remove obsolete flags.
* **Knowledge Silos:** If a team doesn't have a central way to track and manage flags, different developers may be unaware of what flags exist, what they control, or how they might interfere with each other's work.
* **Misuse:** Feature flags can be misused as a permanent solution for customer-specific configurations or for personalizing the user experience, rather than as a temporary tool for release management. This can lead to a long-term, unmaintainable mess.

### 4. Performance Overhead
* **Runtime Checks:** In high-traffic or performance-critical systems, the constant checking of flag states can introduce a small amount of overhead. While this is often negligible, it can become a concern if you have many flags or if the flag evaluation logic is complex.

In conclusion, the cons of feature flags are primarily related to **complexity and technical debt**. They are powerful tools, but they require a strong management process and team discipline to avoid turning a temporary solution into a long-term problem.


Yes, there are several open-source software (OSS) solutions that help with feature flags. These tools typically provide a server component for managing flags and client-side SDKs to integrate with your application.

Some of the most popular open-source options include:

Unleash is one of the most widely used open-source feature flag platforms. It's built with a strong focus on core feature flagging capabilities and is designed to be highly scalable. It provides a web UI to manage flags, define activation strategies (like gradual rollouts or targeting specific users), and has official SDKs for many popular languages.

Flagsmith is an open-source platform for managing feature flags and remote configuration. It offers a self-hosted option, allowing you to have full control over your data. Flagsmith supports granular user targeting, A/B testing, and provides SDKs for web, mobile, and server-side applications.

GrowthBook is an open-source platform that combines feature flags with A/B testing and product analytics. Its unique "warehouse-native" approach means it connects directly to your data warehouse, allowing you to use your existing data for experimentation without moving it to a third-party service. This makes it a great choice for teams who want to make data-driven decisions.

Flipt is a self-hosted, open-source feature flag solution built in Go. It's designed to be simple, fast, and easy to run in your own infrastructure. Flipt is a good option if you need a lightweight, no-frills tool for managing flags with a clean API.

OpenFeature is a different kind of project. It's a **vendor-agnostic specification** and SDK that provides a standard API for feature flagging.

Think of it as an abstraction layer.

It doesn't provide a backend for managing flags itself; instead, you can use it with a compatible provider (which can be a commercial service or a self-hosted open-source solution like the ones mentioned above). 

The main benefit is that it allows you to switch your feature flag provider without changing the core logic in your application's code. 


## Conclusions

---

Yes, the Go-Feature-Flag project is a well-known open-source solution for feature flag management, and it stands out for a few key reasons:

### Go-Feature-Flag

* https://github.com/thomaspoignant/go-feature-flag
* https://gofeatureflag.org/

* **Self-Hosted and Lightweight:** Go-Feature-Flag is designed to be simple and easy to deploy. Instead of requiring a complex database or separate backend, it can retrieve its configuration from a simple file stored in a variety of locations, including a Kubernetes ConfigMap, GitHub, GitLab, or an S3 bucket.
* **Built on Go:** As the name suggests, the core of the project is written in Go, which makes it a high-performance, lightweight, and single-binary solution.
* **OpenFeature-Native:** A major strength is its commitment to the OpenFeature standard. It's one of the few feature flag solutions fully built on this vendor-agnostic API. This means that by using Go-Feature-Flag, you're not locked into a proprietary system; you can easily switch providers in the future without a major code refactor.
* **Relay Proxy:** To support languages other than Go, the project provides a "Relay Proxy." This is a lightweight service that exposes an API for other languages to use, making it a language-agnostic solution.
* **Advanced Capabilities:** Despite its simplicity, it supports advanced features like progressive rollouts, A/B testing, and complex targeting rules based on user attributes. It also allows you to export evaluation data to a variety of destinations for analysis.

In essence, Go-Feature-Flag is a great choice for teams that want a simple, high-performance, and self-hosted feature flag solution that avoids vendor lock-in by embracing open standards.