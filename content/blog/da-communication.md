---
title: "In touch with our colleagues"
date: 2025-08-28T19:20:21+01:00
draft: false
tags: ["DA","Career","Slack vs Discord","MatterMost","Element"]
description: 'Communication tools with slack...or with OSS?'
url: 'communication-management'
---

This year I heard from a good friend that their mid size company does not use teams.

I understand that.

But there are other options, paid ones, like slack:

```sh
sudo snap install slack --classic
```

That are feature rich.


## OSS Communication Solutions

* **Self-hosted Server:** You can download the server software and run it on your own infrastructure, whether it's a server in your data center, a private cloud, or even a virtual machine. This is a significant advantage for organizations that need to meet specific security, privacy, or compliance requirements (e.g., GDPR, HIPAA) or simply want to own their data and not rely on a third-party vendor.

* **Native Desktop and Mobile Applications:** These platforms provide dedicated desktop apps for Windows, macOS, and Linux, as well as mobile apps for Android and iOS. These native apps connect to your self-hosted server, providing a seamless user experience with features like native notifications, offline access, and a better interface than a web browser.

It's important to note that while the server and client apps are open-source, the **self-hosting part requires some technical expertise** to set up and maintain.

This is in contrast to proprietary services like Slack, where the vendor handles all the infrastructure and maintenance, but you lose control over your data.

Each solution has its own approach to this model:

* **Rocket.Chat** offers a self-hosted option that is completely free and open-source, and also has a paid cloud-hosted service for those who prefer not to manage the infrastructure themselves.

```sh
sudo snap install rocketchat-desktop
```

> It reminds me also to Revolt: https://github.com/revoltchat/revolt.chat?tab=readme-ov-file

> > They built a cool side with astro btw :)

* **Mattermost** also provides a self-hosted option, and their open-source licensing model focuses on providing the core communication features for free, with paid features (like advanced security and compliance tools) available for enterprise users.
    * https://github.com/mattermost/mattermost/tree/master
    * https://mattermost.com/pricing/

```sh
sudo snap install mattermost-desktop
```

* **Zulip** emphasizes that their self-hosted version is "100% open-source software," meaning you get all the features available in their cloud product without paying extra for things like SAML authentication or advanced permissions.

This makes it a very attractive option for those who want to self-host a powerful and fully-featured solution for free.

```sh
sudo snap install zulip
```

You can also try **Element**

```sh
sudo snap install element-desktop
```

## Integrations

As integrating project management tools is a major use case for these platforms.

 Here's a breakdown of how each solution handles Kanban boards and ticketing:

### **Mattermost**
Mattermost stands out in this area because it has **Kanban boards as a native, built-in feature**. They are not just an integration but are a core part of the Mattermost product, often referred to as "Mattermost Boards."

* **Kanban Boards:** You can create and manage Kanban boards directly within your Mattermost workspace, alongside your channels. This means you can track tasks, assign them to team members, set priorities, and see the progress of a project without ever leaving the platform.
* **Ticketing System:** While it doesn't have a full-fledged, built-in ticketing system like a dedicated help desk, it integrates very tightly with external tools like **Jira**. You can use slash commands (`/jira create`) and message actions to create and link tickets from a conversation in Mattermost, keeping your team's communication and project tracking in sync.

Because Mattermost's boards are a native feature, they are a strong choice if you want an all-in-one solution for team chat and project management without relying on external plugins or integrations.

### **Rocket.Chat**
Rocket.Chat's approach is more focused on being a highly extensible platform. It doesn't have native Kanban boards or a ticketing system built-in, but it has a robust **marketplace and integration framework** that allows you to add this functionality.

* **Kanban Boards:** You can use integrations with popular Kanban tools like **Trello** or **Kanban Tool**. The integrations allow you to receive notifications in a Rocket.Chat channel when a card is moved, created, or updated in your Kanban board. Some integrations even allow you to create new cards directly from a chat message.
* **Ticketing System:** Rocket.Chat can be used as a front end for a ticketing system, allowing you to manage customer service conversations from within the platform. It can integrate with dedicated ticketing software, allowing your support team to handle tickets without switching context.

This model is ideal if your team is already using a specific project management or ticketing tool and you want a chat platform that can connect to it seamlessly.

### **Element (Matrix)**
Element, being a client for the Matrix protocol, is primarily focused on decentralized, real-time communication. Like Rocket.Chat, it relies on integrations to provide more complex features like Kanban boards and ticketing.

* **Kanban Boards & Ticketing:** There aren't native Kanban or ticketing features in the Element client. However, because Matrix is an open and federated protocol, you can build or find integrations that connect to external services like Trello, Jira, or other project management tools. This requires more technical setup and depends on the availability of integrations built by the community or third parties.

### **Zulip**
Zulip is known for its unique topic-based messaging, which helps organize conversations. While it's great for project-related discussions, it does not have built-in Kanban boards or a ticketing system.

* **Kanban Boards & Ticketing:** Zulip focuses on its core strength—organized messaging. For project management and ticketing, it is designed to **integrate with external tools**. You would use a third-party service like Jira, Trello, or a dedicated ticketing system and then use Zulip's API or built-in integrations to get notifications in a stream or create tickets from a message.

**Summary:**

| Platform | Native Kanban Boards | Native Ticketing | Primary Approach |
| :--- | :--- | :--- | :--- |
| **Mattermost** | **Yes** | No (but with strong integrations) | **All-in-one platform** with built-in PM tools. |
| **Rocket.Chat** | No (via integrations) | No (via integrations) | **Integration platform** that connects to external tools. |
| **Element** | No (via integrations) | No (via integrations) | **Decentralized chat platform** that relies on external integrations. |
| **Zulip** | No (via integrations) | No (via integrations) | **Organized messaging** that integrates with external PM tools. |

If having a native Kanban board is a primary requirement and you want a single, cohesive open-source solution, **Mattermost** is the most direct answer to your question. For the others, the solution is to integrate with a dedicated, separate tool.