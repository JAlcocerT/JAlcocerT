---
title: "OpenL Tablets 101"
date: 2024-09-03T23:20:21+01:00
draft: false
tags: ["Docker","xml","BRMS","BRE"]
description: 'How to get started with OpenL Tablets. Business rules, for excel users.'
url: 'understanding-openl-tablets'
---


**Intro**

**[OpenL Tablets](https://www.openl-tablets.org/)** is a powerful business rule management system (BRMS) that leverages Excel spreadsheets for defining and managing business rules.


**Imagine a set of rules that an insurance company uses to decide whether to insure someone and how much to charge them.** 

These rules might be things like, "If someone is under 25, they have to pay a higher premium," or "If someone has a history of accidents, they can't get insurance."

**OpenL Tablets** is a tool that helps insurance companies organize and manage these rules. It's like a digital rulebook that's easy to understand and update. 

**Why would an insurance company use it?**
* **Clarity and Consistency:** It ensures that everyone in the company is following the same rules, preventing mistakes and inconsistencies.
* **Flexibility:** If the rules need to change, they can be updated quickly and easily.
* **Efficiency:** It can automate many tasks, saving time and money. 

In simpler terms, OpenL Tablets helps insurance companies make decisions about who to insure and how much to charge them in a clear, consistent, and efficient way.


{{< details title="OpenL Tablets vs XML 📌" closed="true" >}}

OpenL Tablets (often just "OpenL") is a **Business Rule Management System (BRMS)** and a **Business Rules Engine (BRE)**. 

Its core idea is to allow business users to define and manage complex business logic in a way that is familiar to them: using **tables, often in Excel documents**.

Let's break that down:

* **Business Rules Management System (BRMS):** This is a software system that helps organizations define, deploy, execute, monitor, and maintain their business rules. It aims to bridge the gap between business analysts (who define the rules) and developers (who implement them).
* **Business Rules Engine (BRE):** This is the component of a BRMS that actually executes the business rules. When your application needs to make a decision based on business logic, it sends data to the rule engine, and the engine processes it according to the defined rules and returns a result.

**The "Tablets" in OpenL Tablets refers to its unique approach:**

Instead of writing rules in traditional programming code or complex XML directly, OpenL Tablets allows you to define rules in various table formats within documents, most commonly Microsoft Excel spreadsheets. 

These tables can be:

* **Decision Tables:** Used for defining a set of conditions and corresponding actions.
* **Decision Trees:** Visual representation of decision logic.
* **Spreadsheet-like Calculators:** For defining calculations and formulas.
* **Other table types:** OpenL supports various structures to capture different kinds of business logic.

The goal is to empower business users to directly "author" and maintain these rules, reducing the need for constant developer intervention for every business logic change.

**Is it generating XML business rules?**

Yes, in a way, **OpenL Tablets uses XML behind the scenes for its project configuration and to represent its internal structure, but it's not primarily about *generating XML for end-user business rules* in the same way you might write an XML schema for data.**

Here's the nuance:

1.  **Internal XML for Project Definition:** OpenL Tablets projects often have a "rules project descriptor," which is an **XML file**. This XML file defines the project configuration, lists the Excel files containing the actual rules, and sets up dependencies between different rule modules. This XML helps OpenL Tablets understand how to load and compile the rules defined in your Excel tables.
2.  **Not Direct XML Authoring for Business Rules:** The business user doesn't typically write raw XML to define their decision tables or business logic. They use the intuitive table formats in Excel or the OpenL WebStudio.
3.  **Transformation to Executable Code:** When you "deploy" OpenL Tablets rules, the engine processes these tables (from Excel and the internal XML descriptors) and transforms them into executable code (often Java bytecode). This allows the rules to be run efficiently within applications, or exposed as services (like RESTful APIs).

So, while XML plays a crucial role in OpenL Tablets' internal structure and configuration, the strength of OpenL Tablets lies in its ability to abstract away that complexity, allowing business users to work with more human-readable, table-based rule definitions. 

The system then handles the "technical" representation and execution, which might involve XML and other compiled formats internally.

{{< /details >}}

To effectively use this tool, it's essential to grasp the following:

* https://github.com/openl-tablets/openl-tablets - Easy Business Rules

{{< details title="OpenL Tablets Core Concepts 📌" closed="true" >}}


- **Rule Tables:**
  - **Decision Tables:** The most common type, used for expressing rules with multiple conditions and actions.
  - **Decision Trees:** Visual representation of decision-making processes, often used for more complex rules.
  - **Spreadsheet-like Calculators:** For straightforward calculations and data manipulation.

- **Rule Structure:**
  - **Conditions:** The criteria that must be met for a rule to fire.
  - **Actions:** The steps taken when a rule is triggered.
  - **Return Values:** The output or result generated by a rule.

- **Rule Execution:**
  - **Rule Engine:** The component responsible for interpreting and executing rules based on input data.
  - **Rule Evaluation:** The process of determining whether a rule's conditions are met.
  - **Rule Firing:** The execution of a rule's actions when its conditions are satisfied.

- **Rule Management:**
  - **Rule Repository:** A centralized location for storing and managing rules.
  - **Rule Versioning:** Tracking changes to rules over time.
  - **Rule Deployment:** The process of making rules available for use in applications.

- **Integration:**
  - **API Integration:** Connecting OpenL Tablets to other systems or applications through APIs.
  - **Data Integration:** Importing and exporting data between OpenL Tablets and external sources.

- **Excel-based Development:**
  - **Excel Templates:** Pre-defined structures for creating rule tables.
  - **Excel Functions:** Using Excel functions within rule expressions.
  - **Excel Formatting:** Applying formatting to rule tables for better readability.

- **Business Rule Governance:**
  - **Rule Validation:** Ensuring the accuracy and consistency of rules.
  - **Rule Testing:** Verifying that rules function as intended.
  - **Rule Documentation:** Providing clear explanations and documentation for rules.



{{< /details >}}



* SpreadSheet Tables
* **Simple LookUp**
* **LookUp Table**
* **Smart Decision Tables**

{{< details title="You can run OpenL Tablets Demo example with Docker 📌" closed="true" >}}

* https://hub.docker.com/r/openltablets/demo

```yml
#version: '3.8'  # Using version 3.8, but you can use other versions as appropriate

services:
  openltablets-demo:
    image: openltablets/demo  # Specify the Docker image to use
    container_name: openltablets-demo  # Optional: Specify a custom container name
    ports:
      - "9088:8080"  # Map port 9080 on the host to port 8080 on the container
    restart: unless-stopped  # Optional: Ensures the container restarts unless explicitly stopped
```

> After a while, it will be accesible: `http://localhost:9088/webservice/` `http://localhost:9088/`

{{< /details >}}


{{< details title="Run OpenL Tablets with Docker 📌" closed="true" >}}

* Because you dont want to download java 11, then go to openl tablets and to the current version demo 5.27.7...

* Let's do it with Docker instead - https://hub.docker.com/u/openltablets/

* And the WebStudio - https://hub.docker.com/r/openltablets/webstudio

```yml
#version: '3.8'  # Using version 3.8, but you can use other versions as appropriate

services:
  openl-webstudio:
    image: openltablets/webstudio  # Specify the Docker image to use
    container_name: openl-webstudio  # Optional: Specify a custom container name
    ports:
      - "9086:8080"  # Map port 9080 on the host to port 8080 on the container
    restart: unless-stopped  # Optional: Ensures the container restarts unless explicitly stopped
```
{{< /details >}}

![OpenL Setup](/blog_img/apps/openl-setup.png)


---

## Resources that Helped

* https://notebooklm.google.com/ together with the docs PDF

* https://openl-tablets.org/documentation/getting-started
* https://openldocs.readthedocs.io/en/latest/documentation/guides/reference_guide/#creating-tables-for-openl-tablets