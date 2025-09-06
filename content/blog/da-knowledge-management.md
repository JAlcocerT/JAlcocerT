---
title: "Notes and Knowledge Management"
date: 2025-08-27T19:20:21+01:00
draft: false
tags: ["DA","Career","Joplin","LogSeq","KB","Knowledge Base"]
description: 'Head clean with notion, obsidian...or with OSS note taking tools?'
url: 'knowledge-management'
---


**Intro**

For me this blog is my current way of storing knowledge and a historical track of my tech learning.

But how people do this in a PRO and private way?


1. [LogSeq](https://fossengineer.com/selfhosting-logseq/)
2. Trilium
3. Joplin

With notes it seems that [all comes down to](#the-plain-text-philosophy-vs-database-philosophy): just markdown (vs) more features and locking

```sh
sudo snap install joplin-desktop
```

### Knowledge Management Tools

These are some knowledge management tools, noting their data storage method:

* **SilverBullet:** A web-based "second brain" tool that stores its Markdown notes as **flat files** locally or on a self-hosted server, emphasizing extensibility and linking.
* **Joplin:** A feature-rich, open-source note-taking and to-do app that uses a **database** (SQLite by default, or other databases via sync targets) to store notes, with robust Markdown support and synchronization.
* **Logseq:** An open-source, local-first knowledge base and outliner that stores its content as Markdown or Org-mode **flat files** directly on your filesystem, focusing on bi-directional linking and block-based editing.
* **BookStack:** A user-friendly, self-hosted platform ideal for organizing documentation and wikis, relying on a **database** (MySQL/MariaDB) to manage its structured content.
* **Raneto:** A simple, flat-file Markdown knowledge base built with Node.js, requiring no **database** and storing all content as simple **Markdown files**.

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Business/Notes" title="Note Tools | Docker Configs 🐋 ↗" >}}
    {{< card link="https://fossengineer.com/selfhostable-note-taking-tools/" title="OSS Note taking tools ↗" >}}
{{< /cards >}}


[![Star History Chart](https://api.star-history.com/svg?repos=silverbulletmd/silverbullet,laurent22/joplin,logseq/logseq,BookStackApp/BookStack,gilbitron/Raneto&type=Date)](https://star-history.com/silverbulletmd/silverbullet&laurent22/joplin&logseq/logseq&BookStackApp/BookStack&gilbitron/Raneto&Date)

The core of the "privacy and control" movement in note-taking apps. 

The answer is that there's a spectrum, but many of the popular self-hostable options do not follow the same "plain text files" model as Logseq.

### The "Plain Text" Philosophy vs. "Database" Philosophy

* **Logseq, Obsidian, and others** are built on the "plain text" philosophy. Their primary goal is to ensure that your notes are always a collection of human-readable Markdown files that you can access and read with any text editor, even if the app itself is no longer around. This makes your data highly portable and future-proof.
    * **Pros:** Ultimate data portability, easy backups, works great with file-syncing tools like Syncthing.
    * **Cons:** Not all features (like an embedded database for fast search or complex queries) are as easy to implement and can sometimes lead to performance issues with very large graphs.

> Some people use obsidian + HUGO: https://www.nickgracilla.com/posts/obsidian-is-my-hugo-cms/

* **Joplin, Memos, and others** often use an "app-specific database" philosophy. While the notes themselves are written in Markdown, they are stored in a database (like SQLite, PostgreSQL, etc.) on the device and on the server. The apps then use a synchronization protocol to keep these databases in sync.
    * **Pros:** Can offer very fast and powerful search, more robust conflict resolution, and support for features like multi-user collaboration and sharing.
    * **Cons:** The data is not as easily accessible or human-readable outside of the app. If you were to lose the app, you would have to figure out how to export or convert the database to get your notes back. Your data is not "future-proofed" in the same way as plain Markdown files.

### A Deeper Look at Joplin

Joplin is a perfect example of this.

It's an open-source, self-hostable, and privacy-focused note-taking app that many people love.

> However, its core philosophy on file storage is different from Logseq's.

* **How it works:** Joplin stores your notes, attachments, and metadata in a single SQLite database file on your desktop and mobile devices.

* **The Sync Process:** When you sync, the app does not simply sync a folder of Markdown files. Instead, it pushes the changes from its local database to a remote location (your Nextcloud, WebDAV server, Dropbox, etc.). This sync location contains a special set of files that represent the state of the database, not your individual notes. The other clients then pull these changes and update their local databases.

* **Android App:** Joplin has excellent, native Android and iOS apps. They are built to work with this database-driven sync model, so you don't need a separate app like FolderSync. You just configure the app with your sync target's URL and credentials, and it handles the rest.

* **Self-Hosting:** Joplin offers a self-hostable **Joplin Server** that you can run in a Docker container. This server is a dedicated sync endpoint that makes it very easy for all your Joplin clients to connect and sync with.

>  It's a much more "turnkey" solution for self-hosting than piecing together a file-syncing solution.

### Other Self-Hostable Options

* **Memos:** This is another popular self-hosted app. Like Joplin, it stores all its data in a database (e.g., SQLite, MySQL, or PostgreSQL). The front-end is a web app, and there are unofficial mobile clients, but the core data is in a database, not a flat file system.
* **Trilium Notes:** This is a very powerful and feature-rich app that stores all data in a single SQLite file. This makes it easy to back up but doesn't follow the flat Markdown file model.
* **FlatNotes:** This app is an interesting exception that follows the same philosophy as Logseq. It's a "database-less" web app that uses a flat folder of Markdown files for storage. It's designed for simplicity and portability.

The Verdict

* **If your primary goal is to have human-readable Markdown files that are independent of any specific app, and you prefer a file-system-based workflow, then Logseq (or a similar tool like Obsidian) is a better choice.** The sync solution will be external to the app itself (e.g., Syncthing, Nextcloud).
* **If your priority is a seamless, self-hosted sync experience with native mobile apps, and you're comfortable with your data being stored in a database, then Joplin is an excellent choice.** Its self-hosted server makes the setup straightforward, and the native mobile app "just works" with that server.

## Conclusions

I know what you are looking for: **DATABASELESS KNOWLEDGE BASE**

<https://docs.linuxserver.io/images/docker-raneto/#miscellaneous-options>
<https://docs.linuxserver.io/images/docker-hedgedoc/>
<https://js.wiki/>



---

## FAQ

The Logseq Android app stores its notes as local plain-text Markdown files on your phone. 

This is a core design principle of Logseq, which is to prioritize user privacy and control by keeping your data on your own device.

Regarding syncing with a server, there are a few options, and this is where it gets a bit more involved:

* **Official Logseq Sync:** Logseq offers its own paid sync service. This is the most straightforward way to sync your notes across your desktop and mobile devices. It's designed to handle conflicts and keep your notes up-to-date automatically. You typically set up the first remote graph on the desktop app, and then connect your mobile app to it.

* **Third-Party Sync Services:** Because Logseq uses local Markdown files, you can use third-party file synchronization services to sync your graph folder. Popular choices include:
    * **Syncthing:** This is a free, open-source, peer-to-peer file synchronization tool. It's highly recommended by many Logseq users for its fast and reliable syncing without a central server. You would install Syncthing on all your devices (phone, desktop, etc.) and configure it to sync your Logseq folder.
    * **Cloud storage services:** You can use services like Google Drive, Dropbox, or OneDrive. You would need to use a third-party app on your Android device (like FolderSync or a similar app) to automatically sync your Logseq folder with the cloud storage folder.

* **Self-Hosting a Web App:** Deploying Logseq as a web application on your own server is possible using technologies like Docker. However, it's important to note a few things about this approach:
    * **Local Storage Limitation:** Traditionally, the web app version of Logseq relies on the browser's File System Access API, which means it still stores the files locally on the device you are using the browser on. This makes it difficult to have a single, server-side source of truth for your notes.
    * **Workarounds:** Some users have found workarounds, often involving running Logseq in a Docker container and using a mounted volume to store the notes on the server's file system. This allows for a more centralized setup, but it can be technically complex to set up and manage, and some features like plugins might not be fully supported.

In summary, the Logseq Android app stores your notes locally. 

While you can deploy a self-hosted web app, the easiest and most common ways to sync your notes with a server are either through the official Logseq Sync service or by using a third-party file synchronization tool like Syncthing.


### What it is WYSIWYG

Markdown editor modes refer to how you view and edit a document.

There are two main types: a **raw** editor and a **WYSIWYG** editor.

#### Raw Markdown Editor

In a **raw markdown editor**, you see and directly edit the plain text and its formatting symbols. For example, to make text bold, you have to type `**bold text**`.

The editor doesn't hide the symbols; it displays them as you type. Many developers and writers prefer this mode because it gives them full control over the syntax and is excellent for clean, distraction-free writing.

* **Example:** You type `## My Heading` and see exactly `## My Heading`. The editor might add some syntax highlighting to color the `##`, but the symbols remain visible.


#### WYSIWYG Editor

**WYSIWYG** (an acronym for **W**hat **Y**ou **S**ee **I**s **W**hat **Y**ou **G**et) is a mode where the editor immediately renders the formatted text as you type. It hides the Markdown symbols, so you don't see the raw syntax. For instance, when you type `**bold text**`, the editor will instantly display **bold text** with the two asterisks hidden.  

This style is more intuitive for users who are not familiar with Markdown syntax and resembles a traditional word processor.

* **Example:** You type `## My Heading` and as soon as you finish the line, it turns into a large, bold heading.


### The Best of Both Worlds: Hybrid Editors

Many modern editors offer a **hybrid approach**.

These editors might start as a WYSIWYG editor but reveal the Markdown syntax when you click on or edit a specific line. 

This allows for the speed of a visual editor while still giving you the ability to fine-tune the raw Markdown when needed.



---

## Outro

I was thinking to open to the public my nextcloud app and put TinyAuth on top of it.

In that way I could sync the LogSeq markdown notes between my devices.

But its not that easy when I thought on [how the authentication works](https://jalcocert.github.io/JAlcocerT/front-end-and-auth/#whats-forward-auth) for mobile apps.

### TinyAuth and Nextcloud Android App

This is an excellent question and it's a critical point to understand when self-hosting and trying to integrate with mobile apps.

The short answer is: **Yes, the same problem exists with Authelia, Okta, and most other external identity providers, but the solution is different.**

TinyAuth is a simple "forward auth" proxy. 

It just redirects the user to a basic login page.

More sophisticated identity providers like Authelia and Okta use a standard known as **OpenID Connect (OIDC)**.

**The Problem with "Forward Auth" Proxies**

The issue you had with TinyAuth is fundamental to how "forward auth" works. 

The reverse proxy intercepts every request and says, "Nope, you have to log in first."

Mobile apps don't understand this redirection; they just expect to talk directly to the server's API endpoints. 

Since they can't handle the redirect to the login page, the authentication fails.

**The Solution: Using OpenID Connect (OIDC)**

Instead of using a forward auth proxy, Nextcloud and other modern web applications are designed to integrate directly with external identity providers (IdPs) using protocols like **OpenID Connect (OIDC)** or **SAML**.

Here's how this changes the authentication flow:

1.  **Nextcloud handles the authentication:** You install the Nextcloud "OpenID Connect user back-end" app (or "Social Login" app) from the Nextcloud app store.
2.  **Redirect to the IdP:** When a user clicks "Log in with Authelia" on the Nextcloud web login page, Nextcloud generates an authentication request and redirects the user's browser to the Authelia server.
3.  **Authentication and Redirection:** The user authenticates with Authelia (e.g., enters username/password, completes 2FA). After a successful login, Authelia sends the user back to Nextcloud with a special token.
4.  **Token Exchange:** Nextcloud receives this token, verifies it with Authelia, and then creates a user session for the authenticated user.

This approach works great for web browsers because they are designed to handle redirects.

**What about the Mobile App?**

The Nextcloud Android app cannot perform the full OIDC redirect flow itself. 

It also doesn't know how to talk to Authelia directly.

So, how does it authenticate?

The Nextcloud mobile app is specifically built to use Nextcloud's built-in authentication mechanisms, even when an external IdP is in use. 

There are two primary ways it can do this:

1.  **Nextcloud's "App Passwords":** This is the most common method. You log in to Nextcloud via the browser (authenticating with Authelia first), and then go to your user settings to generate an "app password." This password is a long, randomly generated string that is unique to the device and bypasses the external IdP. The mobile app then uses this app password to authenticate directly against the Nextcloud server.

2.  **OIDC Mobile App Flow (Less Common):** Some identity providers and apps are beginning to support a more modern OIDC flow specifically for native mobile apps. This involves a browser-like view opening within the app, completing the OIDC flow, and then passing the token back to the app. While this is the future, it's not the default or most common approach with Nextcloud right now, and support for it can be hit-or-miss depending on the specific combination of Nextcloud, the mobile app, and the IdP.

So, to summarize:

* **TinyAuth-style "forward auth" breaks mobile apps** because they don't understand the redirection.
* **Nextcloud can work with OIDC providers like Authelia and Okta**, but it does so by managing the authentication flow itself and redirecting the browser.
* **The Nextcloud mobile app typically does not use the OIDC flow.** It relies on either a username/password combination or, more securely, a special **app password** that is generated within Nextcloud after you have authenticated via the web.

Therefore, regardless of whether you use TinyAuth, Authelia, or Okta, the solution for the Nextcloud Android app remains the same: use an **app password**. This is the intended and most reliable way for third-party clients to connect to your Nextcloud instance when external authentication is enabled.