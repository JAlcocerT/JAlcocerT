---
title: "Creating with Open Spreadsheets"
date: 2026-02-07T08:20:21+01:00
draft: false
description: 'From excel to Grist. And some no code with nocoDB and BaseRow.'
tags: ["Grist","Table Automation","Forms","OpenLTables vs GoRules"]
---

**Tl:DR**

Spreadsheets for all.

**Intro**

From excel to grist.

Because even if you are on D&A, you wont be able to scape excels and those `.csv`, `.xlsx` at some point.

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

![Grist UI](/articles/grist.png)

<!-- https://www.youtube.com/watch?v=xnNn1TkS7Pc -->

{{< youtube "xnNn1TkS7Pc" >}}

{{< callout type="warning" >}}
A grist document is **both**, a db and a spreadsheet. Contains all the data and the views. Pages contains views of the spreadsheet data.
{{< /callout >}}

* https://support.getgrist.com/widget-form/

## Grist Stack

The data in Grist is stored in **SQLite** databases, which is a key part of its design for portability.


### Data Storage 💾

Grist's approach to data storage is unique and what makes it so portable.

* **Document-based SQLite**: Each Grist document (`.grist` file) is a **self-contained SQLite database**. This means all your tables, records, formulas, and even the layout of your document are stored within a single file. This is why you can easily move, back up, and share Grist documents.
* **Central SQLite database**: In addition to the individual document files, Grist also uses a central SQLite database to manage user accounts, team sites, and other metadata.
* **Persistence**: When you use Docker, your data is stored in the volume you specify. Inside that volume, Grist creates and manages these `.grist` and `.sqlite` files, ensuring your data is safe even if the container is stopped or removed.

### Technology Stack 💻

The Grist platform is built with a modern, full-stack architecture.

* **Backend**: The backend is primarily a **Node.js** application. It also incorporates some **Python** for core logic, especially for handling formulas, which can leverage the full Python syntax and standard library.
* **Frontend**: The user interface is built using **TypeScript** and **JavaScript** with the **Vue.js** framework. This allows for a reactive, spreadsheet-like experience that feels fast and responsive.
* **Other Key Technologies**:
    * **Docker**: Grist is heavily reliant on Docker for its self-hosting and deployment, as it simplifies the setup process by packaging the entire application and its dependencies.
    * **REST API**: It has a powerful REST API that allows for external applications (like your waiting list) to interact with and modify data.

### Grist API

Grist has a robust **REST API**, and you can definitely use it as a backend for a *waiting list*. 

This is one of the key use cases for its "headless" mode, where Grist acts as the data management system for a custom front-end application.

### Using Grist as a Backend

To use Grist for a waiting list, you would follow these steps:

1.  **Create a Document and Table**: In Grist, create a new document. Inside that document, create a table with the columns you need for your waiting list, such as "Email," "Name," and "Timestamp."
2.  **Generate an API Key**: Go to your Profile Settings in Grist to create an API key. This key is used to authenticate your application's API calls and has the same permissions as your user account, so keep it secure.
3.  **Use the API to Add Records**: On your website's front end (or via a server-side script), you would make a `POST` request to Grist's API endpoint. This endpoint allows you to programmatically add new records (rows) to a specific table.
4.  **The API Endpoint**: The endpoint for adding records looks something like this:
    `POST https://<your-grist-url>/api/docs/<docId>/tables/<tableId>/records`
    You would include the user's email and name in the JSON body of the request.

Grist's API is fully documented and includes endpoints for not only adding records but also reading, updating, and deleting them.

You can use it to build a full-featured waiting list management system, including adding a dashboard within Grist to see sign-ups in real-time.


## Alternatives

These are the 2 most popular:

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/nocodb" title="NocoDB | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/baserow" title="BaseRow | Docker Config 🐋 ↗" >}}
{{< /cards >}}


### AirTable

Imagine a **spreadsheet on steroids** that's also secretly a **lightweight database**. 

That's a pretty good way to think about Airtable.

**Airtable is a cloud-based collaborative platform that combines the simplicity of a spreadsheet with the power of a database.**


* **Spreadsheet-like Interface:** It looks and feels familiar to anyone who has used a spreadsheet program like Google Sheets or Microsoft Excel. You have rows, columns, and cells where you can enter data.
* **Database Functionality:** Unlike a simple spreadsheet, Airtable allows you to define **column types** beyond just text and numbers. You can have:

* **Relational Capabilities:** The ability to link tables together and create relationships between different sets of data is what makes Airtable more than just a spreadsheet. This allows you to organize complex information in a structured way, similar to a relational database.

**Think of it this way:**

If a spreadsheet is like a flat note-book page, Airtable is like a binder with multiple interconnected pages. 

Each page (table) can hold different types of information, and you can create links between the pages to see how everything relates.

In short, **Airtable is a user-friendly platform that offers the intuitive interface of a spreadsheet with the structured power and relational capabilities of a database, making it a versatile tool for organizing and collaborating on all kinds of information.**


Some open source alternatives to Airtable are: 


### NocoDB


* NocoDB: a low-code collaborative web-based platform that can replace Airtable.

* https://www.nocodb.com/
* https://nocodb.com/docs/self-hosting/installation/docker-compose
* https://mariushosting.com/how-to-install-nocodb-on-your-synology-nas/
* https://www.nocobase.com/en/blog/the-top-12-open-source-no-code-tools-with-the-most-github-stars
* https://github.com/nocodb/nocodb

* https://noted.lol/nocodb-contact-form-gmail-smtp/

* Baserow: a low-code/no-code data platform that lets you create your own online database without any technical experience.
* Mathesar: an open-source data platform that supports PostgreSQL and provides a user-friendly interface for data manipulation.
* Metabase: an open-source business intelligence tool that connects to any database and lets you create charts and dashboards.
* Grist: an open-source spreadsheet-like tool that allows you to work with data in a structured and flexible way.

![alt text](/blog_img/selfh/nocode/nocodb-signup.png)

You can import excel, json or databases to nocodb tables: *locally will be at localhost:8080*

![alt text](/blog_img/selfh/nocode/nocodb-table.png)

* `http://localhost:8080/dashboard/#/nc/integrations`
* And use scripts as well: https://nocodb.com/docs/scripts


Then, query programatically if required: *also allows for webhooks to get notified when sth happens*

```sh
curl --request GET \
	--url 'http://localhost:8080/api/v2/tables/abcdef13456/records?offset=0&limit=25&where=&viewId=vw1by9186ibupwxq' \
	--header 'xc-token: CREATE_YOUR_API_TOKEN_FROM http://localhost:8080/dashboard/#/account/tokens'
```

### BaseRow

And again, if you feel like its enough code...

**Airtable alternatives:** https://github.com/bram2w/baserow

* Baserow: https://baserow.io/user-docs

Its way lighter than nocoDB, needing only one service on your docker stack.

![BaseRow](/blog_img/apps/baserow.png)

And you also have the API access: `http://localhost:82/api-docs/database/134`

![alt text](/blog_img/selfh/nocode/baserow-signup.png)

![alt text](/blog_img/selfh/nocode/baserow-lead-template.png)

---

## Conclusions

If you just need a way to collaborate with your colleagues you can try: NextCloud

> See also 

0. https://github.com/glideapps/glide-data-grid

1. https://github.com/harishdeivanayagam/rowfill

>  Open-source spreadsheets platform for deep research and document processing 

2. Appflowy


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/appflowy" title="AppFlowy | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![alt text](/blog_img/selfh/nocode/apflowy-signup.png)

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


### OpenLTables vs GoRules

<!-- https://www.youtube.com/watch?v=kPDSsdS9LAY -->

{{< youtube "kPDSsdS9LAY" >}}


GoRules is an **open-source business rules engine** designed to help organizations define, deploy, and manage complex decision logic with ease. 

It allows users to create business rules through an intuitive interface, making decision automation accessible even for non-developers.

What GoRules can do for you: https://docs.gorules.io/docs/user-manual

- **Faster Decision Implementation:** Quickly define and update business rules without heavy coding, speeding time to market.
- **Cost Efficiency:** Reduce the dependency on developers for rule changes, lowering operational costs.
- **Operational Excellence:** Automate and streamline decision-making processes to minimize errors and improve productivity.
- **Flexibility & Integration:** Written in Rust with native bindings for Node.js, Python, and Go, it can be embedded in applications or run standalone.
- **Enterprise Features:** Support for self-hosting (including Docker/Kubernetes), single sign-on (SSO), audit logging, and scalable architecture.
- **Visual Rule Editor:** Lets business teams clearly define conditions and outcomes visually, helping bridge communication with developers.
- **Complex Logic Handling:** Supports decision trees, condition branching (switch nodes), function and expression nodes for sophisticated rule modeling.

In essence, [GoRules](https://gorules.io) helps businesses automate complex decisions efficiently and securely at scale, reducing development bottlenecks and enabling faster adaptation to changing business requirements.
