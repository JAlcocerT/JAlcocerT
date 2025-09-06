---
title: "Open Spreadsheets"
date: 2025-11-07T08:20:21+01:00
draft: false
tags: ["Grist","Web","Automation"]
description: '.'
url: 'automation-with-grist'
---

From excel to grist.

Because even if you are on D&A, you wont be able to scape excels and xlsx at some point.

There are tools like [OpenLTablets](https://jalcocert.github.io/JAlcocerT/understanding-openl-tablets/)

* https://github.com/gristlabs/grist-core
    * https://github.com/gristlabs/grist-electron
    * https://hub.docker.com/r/gristlabs/grist#

> Apache v2 | Grist is the evolution of spreadsheets.

```sh
#docker pull gristlabs/grist
#docker run -p 8484:8484 -it gristlabs/grist
docker run -p 8484:8484 -v /path/to/your/grist-data:/persist -it gristlabs/grist
```

Or simply: https://www.getgrist.com/product/self-hosted/


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/grist" title="Grist | Docker Config 🐋 ↗" >}}
{{< /cards >}}


```sh
#cd grist
export GRIST_SESSION_SECRET=$(openssl rand -base64 32)
docker compose up -d #Grist will be at 
```

![Grist UI](/blog_img/selfh/HomeLab/grist.png)


{{< callout type="warning" >}}
A grist document is both, a db and a spreadsheet. Contains all the data and the views. Pages contains views of the spreadsheet data.
{{< /callout >}}



https://support.getgrist.com/widget-form/

## Grist Stack

The data in Grist is stored in **SQLite** databases, which is a key part of its design for portability. The overall technology stack is a mix of JavaScript, TypeScript, and Python.

---

### Data Storage 💾

Grist's approach to data storage is unique and what makes it so portable.

* **Document-based SQLite**: Each Grist document (`.grist` file) is a **self-contained SQLite database**. This means all your tables, records, formulas, and even the layout of your document are stored within a single file. This is why you can easily move, back up, and share Grist documents.
* **Central SQLite database**: In addition to the individual document files, Grist also uses a central SQLite database to manage user accounts, team sites, and other metadata.
* **Persistence**: When you use Docker, your data is stored in the volume you specify. Inside that volume, Grist creates and manages these `.grist` and `.sqlite` files, ensuring your data is safe even if the container is stopped or removed.

---

### Technology Stack 💻

The Grist platform is built with a modern, full-stack architecture.

* **Backend**: The backend is primarily a **Node.js** application. It also incorporates some **Python** for core logic, especially for handling formulas, which can leverage the full Python syntax and standard library.
* **Frontend**: The user interface is built using **TypeScript** and **JavaScript** with the **Vue.js** framework. This allows for a reactive, spreadsheet-like experience that feels fast and responsive.
* **Other Key Technologies**:
    * **Docker**: Grist is heavily reliant on Docker for its self-hosting and deployment, as it simplifies the setup process by packaging the entire application and its dependencies.
    * **REST API**: It has a powerful REST API that allows for external applications (like your waiting list) to interact with and modify data.

### Grist API

Yes, Grist has a robust **REST API**, and you can definitely use it as a backend for a waiting list. This is one of the key use cases for its "headless" mode, where Grist acts as the data management system for a custom front-end application.

### Using Grist as a Backend

To use Grist for a waiting list, you would follow these steps:

1.  **Create a Document and Table**: In Grist, create a new document. Inside that document, create a table with the columns you need for your waiting list, such as "Email," "Name," and "Timestamp."
2.  **Generate an API Key**: Go to your Profile Settings in Grist to create an API key. This key is used to authenticate your application's API calls and has the same permissions as your user account, so keep it secure.
3.  **Use the API to Add Records**: On your website's front end (or via a server-side script), you would make a `POST` request to Grist's API endpoint. This endpoint allows you to programmatically add new records (rows) to a specific table.
4.  **The API Endpoint**: The endpoint for adding records looks something like this:
    `POST https://<your-grist-url>/api/docs/<docId>/tables/<tableId>/records`
    You would include the user's email and name in the JSON body of the request.

Grist's API is fully documented and includes endpoints for not only adding records but also reading, updating, and deleting them. You can use it to build a full-featured waiting list management system, including adding a dashboard within Grist to see sign-ups in real-time.


---

## FAQ

### Tweaking Grist

As a self-hosted open-source product, Grist offers extensive customization options for branding, but it's not a simple one-click solution.

Yes, you can customize Grist's branding, but it typically requires some technical work by providing your own custom CSS or by changing specific environment variables.

**How it Works**

The official Grist documentation and community forums confirm that you can modify the branding of a self-hosted instance.

* **Custom CSS**: The most powerful way to customize the look is by providing your own `custom.css` file. By setting an environment variable (`APP_STATIC_INCLUDE_CUSTOM_CSS=true`), Grist will load your custom stylesheet, allowing you to override its default colors, fonts, and even hide or replace elements.
* **Changing the Logo**: You can replace the Grist logo and the favicon (the icon in the browser tab) by mounting your own logo file to a specific path within the Docker container. For example, a custom `favicon.png` can be mounted to `/grist/static/icons/favicon.png`. This can be done using a volume mount in your Docker command or `docker-compose.yml` file.
* **No "White-Labeling" out of the Box**: While you can change the look and feel, Grist doesn't offer a simple "white-label" toggle that removes all mentions of Grist's name or logo in the interface. You would have to use custom CSS and asset replacement to achieve this yourself.

In short, with a self-hosted Grist installation, you have a high degree of control over the branding, but it's a manual process that requires knowledge of Docker and CSS.

