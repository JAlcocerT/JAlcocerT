---
title: "Whats a BRD?"
date: 2025-04-16T00:20:21+01:00
draft: false
tags: ["Career", "D&A", "Analytics","GenAI"]
description: 'The business requirement document and the FRD for the GenAI / vibecoded times. Better questions for LLMs.'
url: 'brd-vs-frd-for-data-analytics'
---

The BRD, *not the BRP if you read this from NL...* :)

There might be few reasons you want to read this:

1. To give AI proper instructions to build stuff for you:

Lately I was tinkering with [vibe coding tools](https://jalcocert.github.io/JAlcocerT/vide-coding/).

We can now do cool and functional apps by providing a **cool initial prompt**.

How to make sure that the LLM will have the proper context to have from the very beginning the best possible app or its best first iteration?


{{< cards cols="2" >}}
  {{< card link="https://roadmap.sh/data-analyst" title="Data Analytics RoadMap" >}}
  {{< card link="https://roadmap.sh/software-architect" title="Software Architect RoadMap" >}}
{{< /cards >}}

{{< details title="BRD vs FRD 📌" closed="true" >}}


* **Core Definition and Purpose:**
    * "A business requirements document (BRD) is a formal document that outlines the business needs and objectives of a project. It serves as a critical blueprint for project success, clearly defining business objectives, project scope, and stakeholder expectations." - **Accurate.** This perfectly captures the essence of a BRD.
    * "The BRD is used to gather all business requirements necessary to build a new application or replace a legacy business application." - **Accurate.** This is a primary use case.
    * "It provides a solid understanding of requirements across all the project stakeholders and lays a foundation stone for project successful execution." - **Accurate.** Clarity and shared understanding are key benefits.

* **BRD vs. FRD Distinction:**

    * "The BRD focuses on business objectives and needs, while the Functional Requirements Document (FRD) focuses on system functionalities and technical details." - **Accurate.** This is a fundamental and crucial distinction.
    * "The BRD is intended for business stakeholders, executives, and end-users, whereas the FRD is intended for developers, IT teams, and technical stakeholders." - **Accurate.** This highlights the different audiences and levels of detail.
    * "The BRD includes high-level business requirements, while the FRD includes detailed functional and technical specifications." - **Accurate.** Reinforces the previous points.

* **Key Components and Living Document:**

    * "A BRD typically includes seven key components, which serve to provide clarity and context for stakeholders. These components help stakeholders gain clarity on the requirements for project success. The BRD outlines project objectives, what's expected throughout the project lifecycle, and what's required to accomplish the project." - **Accurate.** While the "seven key components" is a common guideline, the overall statement about providing clarity and outlining objectives is correct.
    * "It is important to note that the BRD is a living document and should be regularly reviewed to ensure it remains relevant throughout the project lifecycle." - **Accurate and extremely important.** Projects evolve, and the BRD must too.

* **Best Practices for Creation:**
    * "The BRD is designed to take the reader from a high-level understanding of the business processes down to the detailed business requirements." - **Accurate.** It bridges the gap between strategic goals and tangible needs.
    * "It is important to engage stakeholders from the beginning to gather their input and validate expectations." - **Accurate.** Stakeholder engagement is critical for a useful BRD.
    * "Avoiding technical jargon where possible ensures the document is accessible to both technical and non-technical readers." - **Accurate and excellent advice.**
    * "Diagrams, flowcharts, and tables can help illustrate complex business requirements effectively." - **Accurate.** Visual aids are very helpful.

* **Relationship with Other Analysis and Prioritization:**
    * "The BRD is often used in conjunction with other elements of business analysis, such as a SWOT analysis or a cost-benefit analysis." - **Accurate.** BRDs don't exist in a vacuum; they integrate with broader analysis.
    * "It is also important to prioritize requirements based on business impact and feasibility." - **Accurate.** Not all requirements are equally important or achievable.
    * "The BRD should be concise, providing the most information in the least amount of words." - **Accurate.** While it needs detail, conciseness aids readability and usability.

**In conclusion:** This is a well-written and highly accurate summary of what a Business Requirements Document is, its purpose, its distinctions from other documents, and best practices for its creation and use. Anyone looking for an overview of BRDs would find this description very helpful.

{{< /details >}}


2. To make sure you build whats required

> If you are part of AIOps / [AI|BI](https://jalcocert.github.io/JAlcocerT/ai-bi-tools/) or whatever [domain specific](https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/) projects, how to make sure that stakeholders expectations are captured and have everyone happy during the delivery? 


## The BRD

Let's try explaining a BRD in a slightly different way, focusing on its role as a **project's "constitution" or "foundational agreement"**.

### Explaining a BRD in Another Way: The Project's "Constitution"

Imagine a project isn't just about building something, but about setting up a mini-country. The **Business Requirements Document (BRD)** is like that country's **constitution**.

* **It defines the "Why":** Just as a constitution states the core values and reasons for a country's existence, the BRD explains *why* this project is happening. What problem are we solving? What opportunity are we seizing? What are the ultimate business goals?
* **It sets the "What":** A constitution outlines the fundamental rights and responsibilities of its citizens and government. Similarly, the BRD clearly defines *what* the business needs from this project to achieve its "why." It specifies the high-level capabilities, features, and functions that are essential from a business perspective.
* **It establishes the "Who" and their "Expectations":** A constitution identifies the people it governs and their expected roles. The BRD clarifies *who* the key stakeholders are (users, business owners, etc.) and *what* their expectations are for the project's outcome. It ensures everyone is on the same page about the desired results.
* **It's the "Source of Truth" for Business:** Just as people refer to a constitution to understand the foundational laws, the BRD serves as the primary reference point for all business-related aspects of the project. If there's a disagreement about what the business truly needs, the BRD provides the answer.
* **It's a "Living Document":** No constitution is written once and forgotten. It's amended, interpreted, and sometimes even rewritten as societies evolve. Similarly, a BRD isn't static. As the project progresses and business understanding refines, the BRD is reviewed and updated to ensure it always reflects the current, agreed-upon business needs.
* **It's for the "Policy Makers":** While developers might be the "engineers" building the infrastructure, the BRD is primarily for the "policy makers" – the business leaders, stakeholders, and end-users – to ensure the project aligns with strategic objectives.

In essence, the BRD ensures that everyone involved in the project, especially those on the business side, agrees on the fundamental purpose and essential outcomes before diving into the technical specifics of *how* to build it. It prevents building the right thing the wrong way, or worse, building the wrong thing entirely.

---

### Questions a BRD Has to Reply To:

Think of the BRD as an exhaustive interview of the business, where it provides answers to critical questions that drive the project. Here are the main questions a BRD must answer:

1.  **What is the Problem or Opportunity?**
    * What specific business pain point are we trying to alleviate?
    * What market opportunity are we aiming to capitalize on?
    * Why is this project necessary now?

2.  **What are the Business Objectives?**
    * What measurable goals will this project achieve for the business? (e.g., "Increase customer retention by 15%", "Reduce operational costs by 10%", "Enter a new market segment")
    * How will success be defined and measured from a business perspective?

3.  **What is the Scope of the Project (from a Business Perspective)?**
    * What business functions or processes are *included* in this project?
    * What business functions or processes are *excluded* from this project?
    * What are the high-level features or capabilities the business needs? (e.g., "Ability for customers to track orders online," "Automated invoice generation")

4.  **Who are the Stakeholders and What are Their Needs/Expectations?**
    * Who are the primary users of the system or beneficiaries of the project? (e.g., customers, sales team, finance department)
    * What are their core business requirements and expectations from the solution?
    * What are their high-level use cases or scenarios?

5.  **What are the Key Business Processes Involved/Affected?**
    * How does the business currently operate in the area being addressed?
    * How will these business processes change or improve with the new solution?
    * Are there any workflows or data flows that need to be understood?

6.  **What are the High-Level Requirements (Business-Centric)?**
    * What must the solution *do* to meet the business objectives? (These are often expressed as "The system must enable X," or "Users must be able to Y.")
    * Are there any non-functional business requirements like regulatory compliance, security needs, or specific performance expectations from a business standpoint?

7.  **What are the Assumptions and Constraints?**
    * What assumptions are being made about resources, technology, timelines, or market conditions that could impact the project's success?
    * What are the known limitations or constraints that the project must operate within (e.g., budget, existing systems, regulatory frameworks)?

8.  **What are the Key Deliverables and Success Metrics?**
    * What tangible outputs are expected from the project from a business perspective?
    * How will the business measure the success of the project once it's implemented?

By answering these questions comprehensively and clearly, the BRD provides a solid foundation for all subsequent project phases, ensuring that everyone is aligned on the business's ultimate goals and needs.

## The FRD

You're right to ask about the Functional Requirements Document (FRD) next, as it's the natural follow-up to the BRD in the project lifecycle. If the BRD is the "What" and the "Why" from a business perspective, the FRD is the "How" from a system perspective.

### Explaining a Functional Requirements Document (FRD) in Another Way: The System's "Instruction Manual"

If the Business Requirements Document (BRD) is like the **constitution of a project's "country,"** then the **Functional Requirements Document (FRD)** is the **detailed instruction manual for its operating systems and machinery.**

Imagine our project "country" from the BRD. Now, the FRD isn't about *why* the country exists or *what* its citizens generally need. Instead, it's about:

* **The "Buttons and Levers":** It describes every specific button, lever, switch, and function within the system. If the BRD says "Citizens need to be able to vote," the FRD explains exactly *how* that voting system works: "A user logs in, clicks 'Vote Now,' selects a candidate from a dropdown list, clicks 'Confirm Selection,' and receives a confirmation message."
* **The "Rules of Operation":** It outlines the precise rules and logic for how the system behaves under different conditions. "If a user enters an invalid password three times, their account will be locked for 15 minutes."
* **The "Blueprint for Engineers":** This document is specifically crafted for the people who will *build* the system – the developers, engineers, and IT specialists. It gives them the exact specifications they need to design, code, and test the software. They don't need to understand the broad business strategy from this document; they need to know *what to build*.
* **The "Test Script Baseline":** Because it details every function, the FRD also becomes the primary document for Quality Assurance (QA) testers. They use it to create test cases, verifying that the system performs exactly as specified in the FRD.
* **The "Granular Detail":** While the BRD speaks in broad strokes ("Automate invoice generation"), the FRD drills down: "The system shall generate PDF invoices, including client name, address, itemized list, quantity, unit price, subtotal, tax (at 7%), and grand total. Invoices shall be numbered sequentially..."

In short, the FRD translates the high-level business needs articulated in the BRD into concrete, verifiable, and detailed system functionalities. It answers the question: "Given what the business needs, how will the *system* behave to deliver that?"

---

### Questions a FRD Has to Reply To:

The FRD dives into the technical specifics of *how* the system will function to meet the business requirements. It answers questions that are critical for developers, designers, and testers.

1.  **What exactly will the system *do*?**
    * What are the specific features and functionalities that the system will provide?
    * What are the detailed steps for each user interaction or system process? (e.g., "User clicks X button, System displays Y screen, User enters Z data.")

2.  **How will the system respond to specific inputs?**
    * What are the exact inputs (user actions, data) the system will accept?
    * What is the precise output or response for each input? (e.g., "If User enters text, System validates for alphanumeric characters only. If invalid, error message 'Invalid characters' is displayed.")

3.  **What are the detailed business rules the system must enforce?**
    * What calculations, validations, or logic must the system apply? (e.g., "Discount of 10% is applied to orders over $500," "Minimum password length is 8 characters, including one uppercase, one number, and one special character.")

4.  **How will data be handled within the system?**
    * What specific data inputs will the system process?
    * What data will the system store, and what are its attributes? (e.g., "User ID will be a unique integer, Email will be a string, max 255 chars.")
    * How will data be manipulated, retrieved, and presented?

5.  **How will the system interact with other systems?**
    * What are the detailed integration points with existing or external systems?
    * What specific data will be exchanged, and in what format? (e.g., "System will send order details via API call to fulfillment system in JSON format.")

6.  **What are the specific non-functional requirements (from a system perspective)?**
    * **Performance:** How fast must the system respond? (e.g., "Page load time under 2 seconds for 90% of requests.")
    * **Security:** What specific security measures must be implemented? (e.g., "All user data must be encrypted at rest and in transit," "Role-based access control must be enforced.")
    * **Usability:** What are the detailed UI/UX requirements? (e.g., "Navigation menu must be visible on all pages," "Error messages must be clear and actionable.")
    * **Reliability:** What is the required uptime or error tolerance? (e.g., "System uptime must be 99.9%.")
    * **Scalability:** How many concurrent users or transactions must the system support?
    * **Maintainability:** Are there specific technical standards or architectures to follow?

7.  **What are the error handling and recovery procedures?**
    * What happens when an error occurs? (e.g., "System logs error and displays user-friendly message," "Administrator is notified via email.")
    * How does the system recover from failures?

By meticulously answering these questions, the FRD provides the precise specifications needed for development, ensuring that the final system aligns perfectly with the detailed expectations of the project team and, ultimately, fulfills the higher-level business needs outlined in the BRD.

## The BRD and FRD with the SDLC

The Business Requirements Document (BRD) and Functional Requirements Document (FRD) are foundational artifacts within the **Software Development Life Cycle (SDLC)**. The SDLC is a structured process that software development teams use to plan, design, develop, test, and deploy software. It provides a roadmap for the entire project, from conception to maintenance.

Here's how the BRD and FRD relate to the typical phases of the SDLC:

### 1. Requirements Gathering and Analysis Phase

This is typically the **first and most crucial phase** of the SDLC, where the BRD and FRD play their most significant roles.

* **BRD's Role:** This phase *starts* with the business problem or opportunity. The **BRD is the primary output of the initial requirements gathering and analysis activities.** Business analysts work closely with stakeholders to understand the "what" and "why" from a business perspective. They document:
    * The overarching business goals.
    * The project vision and scope (at a high level).
    * The problems to be solved or opportunities to be seized.
    * The high-level business requirements.
    * Stakeholder expectations.
    * Key business processes.

    The BRD ensures that everyone, especially business stakeholders, agrees on the project's purpose and the value it aims to deliver. It acts as the anchor for the entire project.

* **FRD's Role:** Once the high-level business needs are understood and documented in the BRD, the team moves to define *how* the system will address these needs. The **FRD is often created in the later part of the Requirements Analysis phase or the early part of the Design phase.** It elaborates on the BRD's high-level business requirements by translating them into detailed system functionalities. This involves:
    * Breaking down high-level business requirements into specific, actionable functional requirements.
    * Defining system behavior, inputs, outputs, and rules.
    * Specifying non-functional requirements (performance, security, usability, etc.) from a technical perspective.
    * Often incorporating use cases, user stories, process flows, and wireframes to illustrate functionality.

    The FRD acts as the bridge between the business needs and the technical design, ensuring that developers have a clear blueprint for what to build.

### 2. Design Phase

Once the requirements (both business and functional) are clearly defined, the project moves into the design phase.

* **BRD/FRD's Role:** The **FRD is the direct input to the Design phase.** System architects and designers use the detailed functional requirements outlined in the FRD to:
    * Develop the system architecture.
    * Design the database structure.
    * Create detailed user interface designs.
    * Plan integrations with other systems.

    While the BRD provides the overall context and business goals, the FRD gives the granular detail needed for technical design. Any design decision made here must trace back to a functional requirement in the FRD, which in turn traces back to a business requirement in the BRD.

### 3. Development/Implementation Phase

This is where the actual coding happens.

* **FRD's Role:** The **FRD serves as the primary specification document for developers.** They refer to it to understand exactly what functionalities to code, how the system should behave, and what rules to implement. A well-written FRD minimizes assumptions and reduces rework during development.

### 4. Testing Phase

Once development is complete, the software is rigorously tested.

* **FRD's Role:** The **FRD is crucial for Quality Assurance (QA) teams.** Test cases are directly derived from the functional requirements. Testers verify that each function specified in the FRD works correctly and meets its defined criteria.
* **BRD's Role:** While the FRD guides functional testing, the **BRD is referenced during User Acceptance Testing (UAT).** UAT is where business stakeholders verify that the built solution actually addresses their original business needs and objectives. They check if the "what" (from the BRD) has been successfully delivered by the "how" (from the FRD).

### 5. Deployment and Maintenance Phases

* **BRD/FRD's Role:** While not actively *created* or *updated* in these phases as much, both documents serve as important reference materials.
    * For **deployment**, they provide context for operational teams on the system's purpose and functionality.
    * For **maintenance and future enhancements**, they serve as historical records of the system's initial requirements and design. If new features are requested or bugs need fixing, these documents help understand the original intent and impact of changes.

### Interdependence and Evolution

It's important to remember that the BRD and FRD are not created in isolation. They are **interdependent and often iterative**, especially in agile methodologies:

* The **BRD comes first**, setting the high-level vision.
* The **FRD elaborates on the BRD**, translating business needs into system specifics.
* Changes in the BRD (due to evolving business needs) will necessitate changes in the FRD.
* Conversely, technical feasibility identified during FRD creation or design might lead to adjustments in the BRD.

In essence, the BRD and FRD are critical communication tools that guide a project through the SDLC, ensuring that the final software product effectively addresses the initial business problem.

## Conclusions

