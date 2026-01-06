---
title: "Interesting FMCG Concepts"
date: 2020-12-30
draft: false
tags: ["Analytics","D&A","Career","SAP HANA","ERP vs CRM","Consumer Intelligence"]
description: 'Interesting Logistic and Supply Chain. From Planning to Delivery.'
url: 'fmcg-concepts-101'
---

**TL;DR** 

Several years after taking a course (MOOC) of SCM from the KAIST, its time to put together some practical post about logistics.

**Intro**

Why is your logistic manager so obssesed with that Fill Rate to be as close to 100% as human possible?

It's all about [lean](https://jalcocert.github.io/JAlcocerT/lean/) customer center pull approach and the very low margins and volume required for this kind of business to work.

+++ [SAP](#what-about-sap)
+++ [About Consumer Intelligence](#consumer-intelligence)

## FMCG

FMCG stands for **Fast-Moving Consumer Goods**. 

These are products that have a high turnover rate and are sold quickly at a relatively low cost.

Examples include food and beverages, toiletries, and cleaning supplies.

Logistics for FMCG is a specialized field that focuses on getting these products from the manufacturer to the consumer as efficiently as possible.

> Nielsen is a global leader in market research, providing data and insights into consumer behavior.

>> *The Science of whats next*

Their primary clients are the very companies that make and sell FMCG products.

Based on the nature of Nielsen's business they can provide time-series databases: *The Users were likely FMCG brand managers, marketing managers, and sales leaders, as well as their internal data/BI teams.*

Here's why:

* **Time-Series Data:** This type of data is a sequence of data points indexed in time. For FMCG, this is absolutely crucial.

It's how you track **sales trends over time**, compare weekly performance, analyze the impact of a promotion, or see how a new product launch is progressing.

The data would show things like:

* Weekly sales volume of a specific brand of cereal in different retail stores.
* Daily unit sales of a new P&G shampoo in a particular region.
* Price changes and their effect on sales over time.

* **Nielsen's Business Model:** Nielsen's core product is this kind of data. 

They collect point-of-sale data from retailers and turn it into actionable insights for their clients. 

A brand like Ferrero wants to know how their Kinder Bueno sales are doing versus a competitor's product, day by day or week by week.

This is exactly what a time-series database is built for.

* **The Clients and their Roles:**

* **Ferrero & Procter & Gamble:** These are classic FMCG companies. The people using the data would be their **brand managers** and **category managers**. Their job is to manage the performance of a specific product line or a whole category (e.g., detergents for P&G). They need to know if their new marketing campaign is working or if they are losing market share to a competitor. The dashboards and reports this candidate created at Nielsen were the tools these managers used to make decisions.
* **Puleva:** A major Spanish food and dairy company. Same principle as above—they'd use the data to track sales of their milk, yogurts, and other products against their competitors in the Spanish market.
* **IQVIA:** This is a key detail. IQVIA is a leading provider of data and analytics for the **life sciences and healthcare** industry. This suggests that Nielsen was providing them with data related to health-related FMCG products (e.g., vitamins, over-the-counter medications). The users at IQVIA would be data scientists or business analysts who use the Nielsen data as a component of their larger market analysis and forecasting models.


When you **developed the databases** and **provided the recommendations** you become person who understood the raw, complex data and translated it into a user-friendly format (dashboards, KPIs) that the business users from FMCT clients could understand and act upon.

> This is a classic example of a Business Analyst role: bridging the technical and business sides.


---


## Conclusions

FMCG and [its concepts](#fmcg-concepts) can be applied across different industries - like [*life science* > pharma](#whats-the-difference-between-life-sciences-and-pharma).

### About Consumer Intelligence

Consumer Intelligence is the practice of using data and analytics to **understand and predict consumer behavior** and preferences. 

It can be used to inform marketing and sales strategies, product development, and other business decisions.

Consumer intelligence analytics is the practice of collecting, analyzing, and interpreting consumer data to generate actionable insights about customers’ behaviors, motivations, preferences, and needs.

Businesses use these insights to improve customer experience, personalize marketing efforts, target the right audiences, and inform strategic decisions by understanding customers beyond basic demographics.

**Key Concepts**

- Consumer intelligence leverages data from transactions, online activity, surveys, market research, social media, and more to create deep customer profiles and predict behaviors.[5][2]
- The analytics process typically involves quantitative methods (like statistical analysis) and qualitative inputs (such as reviews or survey responses) to deliver a holistic view.[7][5]
- The ultimate goal is to guide decisions that improve product offerings, customer interactions, and business outcomes by accurately anticipating customer desires and market trends.[3][8]

Areas of Application

- Marketing campaign optimization and audience segmentation for targeted communication.[2][7]
- Customer relationship management and identification of upsell/cross-sell opportunities.[4]
- Churn prediction and enhancement of customer loyalty through improved service experiences.[9]
- Product development informed by real-time insights into what motivates consumer choices.[8]

Example Data Sources

- Purchase history and website analytics
- Social media activity and sentiment analysis
- Feedback from focus groups, surveys, and case studies
- Demographic and behavioral data[6][2]

Consumer intelligence analytics helps businesses deepen customer relationships, increase conversion rates, and maintain competitiveness in dynamic markets by using data-driven knowledge to anticipate and meet evolving consumer needs.[8][2]

Consumer intelligence analytics is closely related to marketing and FMCG (Fast-Moving Consumer Goods) sectors.

In marketing, it is used to understand customer preferences, behaviors, and trends to tailor campaigns, personalize messaging, and improve targeting accuracy.

This helps marketers maximize the effectiveness of their efforts and boost customer engagement and sales.

In the FMCG industry, where products are purchased frequently and competition is intense, consumer intelligence analytics plays a crucial role in tracking consumer buying patterns, predicting demand, optimizing product assortments, and enhancing customer loyalty.

Businesses in FMCG leverage these insights to make data-driven decisions about product development, pricing, distribution, and promotional strategies to stay competitive and meet customer expectations effectively.

Overall, consumer intelligence analytics provides vital support for marketing strategies and operational decisions in FMCG by delivering a detailed understanding of consumer behavior and market dynamics.

---

## FAQ

### FMCG Concepts

* **High Volume, Low Margin**: The business model for FMCG is based on **selling a large quantity of products at a low profit per unit**. This makes efficiency in the supply chain crucial for profitability.
* **Short Shelf Life**: Many FMCG products, especially fresh food and beverages, are perishable and have a limited time before they expire. This necessitates a fast, agile supply chain to prevent waste and loss.
* **High Consumer Demand**: These products are a part of people's daily lives, leading to a constant and high demand. This requires companies to maintain a consistent supply to avoid stockouts, which can harm brand reputation.
* **Brand Loyalty and Promotion**: While the products themselves are often low-involvement purchases, brand loyalty is important. Companies frequently use marketing and promotions to encourage repeat purchases and build consumer trust.

---

### Logistics Concepts

* **Supply Chain Management (SCM)**: This is the overarching concept that includes everything from sourcing raw materials to delivering the final product to the customer. Logistics is a component of SCM.
* **Inventory Management**: This involves planning and controlling the stock of goods to meet customer demand without holding excessive inventory. A key metric is **inventory turnover**, which measures how quickly inventory is sold. FMCG companies aim for a high turnover rate.
* **Warehousing and Storage**: This includes all activities related to storing goods before they're distributed. For FMCG, this requires efficient systems to manage high volumes and ensure products with a short shelf life are moved quickly.
* **Transportation**: The movement of goods from one point to another. In FMCG, this can involve various modes of transport (road, rail, sea, air) to move products from factories to distribution centers and then to retail stores.
* **Last-Mile Delivery**: This is the final leg of the delivery process, from a distribution hub to the end customer. For FMCG, especially with the rise of e-commerce and grocery delivery, this is a critical and often challenging part of the supply chain. 
* **Real-Time Tracking and Visibility**: Modern logistics relies on technology to provide real-time information on a product's location and status. This helps companies proactively manage potential delays and ensures accurate delivery times.
* **Delivery In Full, On Time (DIFOT)**: A key performance indicator (KPI) that measures the percentage of deliveries that are made with the correct products and quantities, at the scheduled time. Maintaining a high DIFOT is crucial for customer satisfaction and strong relationships with retailers.
* **Reverse Logistics**: The process of handling returned goods, including returns from customers and unsold or expired products from retailers. This is a significant aspect of FMCG due to the high volume of products and their short shelf lives.

### DRP vs MRP

That's a great question, as it gets to the heart of how a company's planning functions connect with its actual physical operations.

**Material Requirements Planning (MRP)** and **Distribution Requirements Planning (DRP)** are the two primary planning systems that connect the "what" and "how much" of an FMCG company with the "when" and "where" of its logistics.

They are two sides of the same coin, with MRP focused on the manufacturing side and DRP focused on the distribution side.

Here's how they relate:

1. Material Requirements Planning (MRP)

MRP is a system used for **production planning and inventory control** for a company's manufacturing activities. It answers three fundamental questions for a manufacturer:

* **What materials do we need?**
* **How many of each do we need?**
* **When do we need them?**

For an FMCG company, MRP takes the **Master Production Schedule (MPS)**, which is the high-level plan for what finished goods to produce, and "explodes" it to determine the exact raw materials, components, and sub-assemblies required.

**Example in FMCG:**

Imagine a company that makes bottled lemonade. 

The Master Production Schedule (MPS) says, "Produce 10,000 cases of bottled lemonade next week." The MRP system then looks at the **Bill of Materials (BOM)** for one case of lemonade (e.g., 24 empty bottles, 24 bottle caps, a specific amount of lemon concentrate, sugar, water, etc.). 

It calculates that to produce 10,000 cases, the company needs 240,000 bottles, 240,000 caps, and so on.

MRP then checks current inventory levels and automatically generates purchase or production orders for any materials that are in short supply, ensuring they arrive just in time for the manufacturing process to begin.

2. Distribution Requirements Planning (DRP)

DRP is a planning system used for **managing the distribution of finished goods**. 

It takes the sales forecast and planned orders for finished products and determines where and when to send them to meet customer demand.

DRP works backward from the point of sale.

DRP answers the questions:

* **What finished products do we need?**
* **How many of them do we need?**
* **Where do we need them (at which distribution center or warehouse)?**
* **When do we need them to arrive?**

DRP considers factors like current stock levels at each distribution center, lead times for transportation, and demand forecasts for each location to create a replenishment schedule.

**Example in FMCG:**

Continuing with the lemonade example, the DRP system analyzes the sales forecasts for various regions. 

It sees that the Northeast U.S. distribution center has a high forecasted demand for lemonade next week due to a heatwave, while the Northwest is experiencing lower demand.

The DRP system will then calculate the optimal quantity of lemonade cases to ship from the manufacturing plant to each distribution center.

It will also generate transfer orders to move cases between different warehouses if a particular location is facing a stockout.

**How They Intersect and Relate**

MRP and DRP are often two integrated modules within a larger **Enterprise Resource Planning (ERP)** system. 

They work together in a powerful "push-pull" relationship:

1.  **Demand Signal:** The entire process starts with the demand for the finished product. This demand forecast is the input for the DRP system.
2.  **DRP "Pulls"**: The DRP system "pulls" a plan from the supply chain, figuring out the specific finished goods requirements for each distribution center. This creates a master plan for distribution.
3.  **MRP "Pushes"**: The DRP's plan for what finished goods are needed becomes the input for the MRP system's Master Production Schedule (MPS). The MRP system then "pushes" the production schedule to the factory floor, ensuring all the necessary raw materials and components are ready to produce the finished goods that the DRP says are needed.

**In essence, DRP and MRP create a closed loop:**

* **DRP** determines **what to distribute** to meet market demand.
* **MRP** determines **what to produce** to satisfy the distribution plan.

This integrated approach is crucial for FMCG because it directly addresses the industry's core challenges:

* **Efficiency and Cost Reduction**: By aligning production with distribution needs, the system minimizes overproduction (reducing waste and storage costs) and underproduction (avoiding stockouts and lost sales).
* **Speed and Agility**: The systems provide a framework for rapid response. If the DRP system detects a sudden surge in demand in a specific region, it can quickly signal the MRP system to adjust the production schedule to meet the new requirement.
* **Inventory Optimization**: Together, MRP and DRP help maintain lean inventory levels across the entire supply chain, from raw materials to finished goods, without compromising customer service.

### Whats Horeca

**HORECA** is an acronym that stands for **HOtels, REstaurants, and CAtering/Cafés**. It refers to the entire hospitality and food service industry.

It encompasses a wide range of businesses that provide food, beverages, and accommodation to consumers, including:

* **Hotels:** From budget motels to luxury resorts.
* **Restaurants:** Everything from fast-food outlets to fine dining establishments.
* **Cafés:** Including coffee shops, bars, and pubs.
* **Catering Services:** Businesses that provide food and beverage services for events, parties, and weddings.

**Is it some type of FMCG sales?**

Yes, HORECA is a significant **sales channel for Fast-Moving Consumer Goods (FMCG)**.

FMCG companies produce everyday essentials that are sold quickly and at relatively low prices (e.g., food, beverages, toiletries, cleaning supplies).

The HORECA sector relies heavily on FMCG products for its operations.

Here's how HORECA relates to FMCG sales:

* **Hotels** use FMCGs like toiletries for guest rooms, mini-bar snacks and beverages, breakfast cereals, coffee, etc.
* **Restaurants** purchase a wide array of FMCG products, including cooking essentials (spices, oils, sauces), packaged convenience foods, and various beverages.
* **Cafés** rely on FMCG brands for coffee beans, tea leaves, dairy products, baked goods, and other snacks.
* **Catering services** also need a steady supply of FMCG goods, from bottled water to ingredients for meals.

Therefore, while HORECA itself is an industry (hospitality and food service), it acts as a crucial business-to-business (B2B) channel for FMCG manufacturers and distributors. 

FMCG companies often tailor their products and sales strategies to meet the specific needs of the HORECA sector, which differs significantly from traditional retail channels.

---

### What's the difference between life sciences and pharma?

**Life sciences** is a broad, overarching field that encompasses all companies and organizations whose work is centered on living organisms and their environments. It's about fundamental research and applied science.

**Pharmaceuticals** is a specific subset of the life sciences industry that focuses on the **discovery, development, and commercialization of drugs and medications** for therapeutic purposes. 

Think of it this way: all pharmaceutical companies are part of the life sciences industry, but not all life sciences companies are pharmaceutical companies. Other parts of the life sciences sector include:

* **Biotechnology**: Uses living organisms or their products to develop new technologies (e.g., producing insulin with genetically modified bacteria).
* **Medical Devices**: Companies that make medical instruments, implants, and diagnostic tools.
* **Nutraceuticals**: Focuses on food and supplements that offer health benefits.

---

### Is it possible that FMCG demand planning teams were also using such time series data to feed their modeling?

Demand Planning is all about modelling, or *trying to* model the future.

* **Demand Planning is a Core FMCG Function**: As we've discussed, demand planning is the process of forecasting future consumer demand to align the supply chain. Accurate forecasting is critical for an FMCG company's profitability and efficiency.

* **External Data Feeds**: Internal data (e.g., historical sales, marketing promotions) is a good starting point for demand planning. However, to get a truly accurate picture of the market, companies need **external data** on competitor performance, market share, and overall category trends. This is exactly the kind of data that Nielsen provides through its time-series databases.

* **Integrating with DRP and MRP**: The demand planning team would take the Nielsen data, which shows how their products and competitors' products are selling, and use it to refine their demand models. This refined forecast would then be the key input for their **Distribution Requirements Planning (DRP)** system, which tells them what finished goods need to be moved to which warehouses. That DRP plan, in turn, feeds the **Material Requirements Planning (MRP)** system to schedule production.

* **The Power of Real-Time Insights**: A time-series database allows P&G or Ferrero to see the immediate impact of a new product launch, a competitor's price change, or a seasonal shift in consumer behavior. This real-time visibility allows them to quickly adjust their demand forecasts, helping them optimize inventory and avoid costly stockouts or oversupply.


### Procurement vs Logistics

Procurement and logistics are two distinct but interconnected parts of the broader supply chain management process.

#### Procurement

**Procurement** is the strategic process of **acquiring goods and services** for a business. It's not just about buying something; it's a comprehensive, proactive process that ensures a company gets the best possible value for its money. 

It's the "sourcing" part of the supply chain.

Key activities in procurement include:

* **Identifying business needs:** Determining what goods or services are required.
* **Sourcing suppliers:** Researching, evaluating, and selecting potential vendors.
* **Negotiating contracts:** Agreeing on pricing, terms, and delivery schedules.
* **Issuing purchase orders:** Formalizing the transaction.
* **Supplier relationship management:** Building and maintaining long-term relationships with vendors to ensure quality and reliability.

---

#### **Logistics**

**Logistics** is the process of **managing the flow and storage of goods** from the point of origin to the point of consumption. It's the "movement" part of the supply chain. 

While procurement is about getting the items, logistics is about getting them to the right place, at the right time, in the right condition.

Key activities in logistics include:

* **Transportation management:** Planning and executing the movement of goods (e.g., choosing carriers, optimizing routes).
* **Warehousing and storage:** Managing inventory and using warehouse space efficiently.
* **Inventory control:** Keeping track of stock levels to prevent shortages or overstocking.
* **Order fulfillment:** Processing customer orders and coordinating delivery.
* **Reverse logistics:** Managing the return of products.

---

**Comparison: Procurement vs. Logistics**

| Aspect | **Procurement** | **Logistics** |
| :--- | :--- | :--- |
| **Primary Focus** | Acquiring and sourcing goods and services. | The movement and storage of goods. |
| **Core Question** | "What do we need to buy, and from whom?" | "How do we get the goods where they need to go?" |
| **Scope** | Strategic and long-term; focuses on supplier relationships and contracts. | Operational and day-to-day; focuses on physical flow and efficiency. |
| **Objective** | To get the best **value** (cost, quality, reliability) from suppliers. | To ensure timely and cost-effective **delivery** of goods. |
| **Relationship** | Logistics depends on procurement to secure the necessary items. | Procurement relies on logistics for the physical transportation and delivery of the items it has purchased. |

In short, procurement is the "brain" that decides what to buy and from whom, while logistics is the "muscle" that moves the goods. They are distinct functions that must work in tandem for a supply chain to be successful.

### What about SAP?

SAP is not a database itself; it's an enterprise resource planning (ERP) software suite that uses databases to store its data.

Think of SAP as the application you use, and the database as the filing cabinet where that application stores its information.

SAP has its own specific relational database management system called **SAP HANA**, but it can also be configured to work with other databases, like **Oracle**, **Microsoft SQL Server**, or **IBM Db2**.

#### SAP, SQL, and Databases

SAP and SQL are related in that the **SAP application interacts with the underlying database using SQL** (Structured Query Language). 

SQL is the standard language used to manage and manipulate data in relational databases. 

When you perform an action in an SAP application, such as creating a sales order, the application translates that action into a series of SQL statements (like `INSERT` or `UPDATE`) that are then sent to the database to store or retrieve the data.

* **SAP:** The application layer (the software you use to manage business processes).
* **Database:** The storage layer (where the data is physically kept).
* **SQL:** The language that allows the two layers to communicate.

> So, while SAP is not a type of SQL, it uses SQL to talk to the database it relies on.

#### Python and SAP Interaction

Yes, you can use **Python to interact with SAP**. 

The methods you'd use depend on what exactly you're trying to do.

* **Direct Database Access:** If you want to access the data directly from the underlying database (e.g., SAP HANA, Oracle), you can use Python libraries designed for that specific database. For example, you would use a library like `hdbcli` for SAP HANA or `cx_Oracle` for Oracle.

This approach is best for tasks like data analysis or creating custom reports.

* **SAP APIs:** The more robust and official way to interact with SAP is through its Application Programming Interfaces (APIs). SAP offers various APIs (e.g., **OData services**, **SOAP web services**) that allow you to connect and perform operations on the SAP system in a controlled manner. Python can be used to call these APIs using libraries like `requests`. This is the recommended method for integrating with SAP for business processes, as it respects the system's business logic and security.

* **SAP RFC/BAPI:** For older or more specific integrations, you can use the **SAP Remote Function Call (RFC)** protocol. Python has libraries like `PyRFC` that allow you to call **Business Application Programming Interfaces (BAPIs)** or custom function modules directly from your Python script.


### ERP vs CRM

The two terms are often used in the same conversation, but they serve very different purposes. 

The simplest way to understand the difference is to think about it in terms of **front office vs. back office**.

* **CRM (Customer Relationship Management)** is a **front-office** system.
* **ERP (Enterprise Resource Planning)** is a **back-office** system.

Let's break that down.

#### CRM: The Front Office

A CRM system is all about managing your company's interactions with its customers and potential customers. 

Its primary goal is to improve customer relationships, drive sales, and enhance customer satisfaction.

**Key functions of a CRM system include:**

* **Sales Management:** Tracking leads, managing the sales pipeline, and automating sales tasks.
* **Marketing Automation:** Creating and managing marketing campaigns, sending out emails, and analyzing campaign effectiveness.
* **Customer Service:** Managing customer support tickets, handling service requests, and providing a single view of a customer's history to support agents.
* **Contact Management:** Storing and organizing all customer and prospect information, including contact details, interaction history, and communication preferences.

Think of CRM as the software your sales, marketing, and customer service teams use to interact with the outside world.

#### ERP: The Back Office

An ERP system, on the other hand, is designed to manage and integrate all of the core business processes of an organization. 

Its goal is to **streamline operations**, reduce costs, and improve efficiency by providing a "single source of truth" for the entire business.

**Key functions of an ERP system include:**

* **Finance & Accounting:** Managing the general ledger, accounts payable and receivable, budgeting, and financial reporting.
* **Supply Chain Management:** Handling inventory, procurement (purchasing), and logistics.
* **Manufacturing:** Managing production planning, scheduling, and quality control.
* **Human Resources (HR):** Managing payroll, employee data, and recruitment.

Think of ERP as the software that runs the entire internal engine of your company, connecting different departments like a nervous system.

**A Simple Analogy**

Imagine a company that manufactures and sells widgets.

* A sales rep uses the **CRM** to track a lead, follow up with them, and log their communications. Once the customer decides to buy, the sales rep creates a sales order in the CRM.
* The **ERP** takes over from there. It sees the new sales order and checks inventory to see if there are enough widgets in stock. If not, it automatically creates a work order for the manufacturing department. 

It then tracks the raw materials used, schedules the production, and manages the billing and shipping process.

Finally, it records the revenue and updates the company's financial records.

While the CRM focused on the customer relationship and the sale, the ERP managed all the complex internal processes required to fulfill that order and keep the business running smoothly.

**Integration**

In modern business, CRM and ERP systems are often **integrated**. This allows data to flow seamlessly between the front and back offices.

For example, when a sales order is created in the CRM, the ERP can automatically pull that data to begin the fulfillment process without any manual data entry. 

This integration provides a complete, 360-degree view of both the customer and the entire business.