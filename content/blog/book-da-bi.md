---
title: "Business Intelligence in Data Analytics"
date: 2021-08-15T23:20:21+01:00
draft: false
tags: ["Career","User Journey","WireFlow"]
description: 'Summarizing what we have learnt about BI. User journeys, SMART and prototypes.'
#summary: 'Consolidating the MUST know for your career as a Business Intelligence Analyst.'
url: 'business-intelligence-data-analytics'
---

*Consolidating the MUST know for your career as a Business Intelligence Analyst*

## Designing an Analytical Flow

To **propose and design a data story** based on client needs, these will be the steps for success:

1.  **Understand client needs and objectives:** Begin by discussing the client's goals, challenges, and expectations. Identify the key questions they want to answer or the insights they are seeking. Make sure you have a clear understanding of the business context and industry to make your analysis relevant and actionable.
2.  **Gather and analyze data:** Obtain relevant data from the client or other sources that can help address the client's needs. Perform data cleaning, preprocessing, and exploration to understand the structure, relationships, and patterns within the data. Identify key variables and metrics that will drive your analysis.
3.  **Develop initial hypotheses:** Based on your understanding of the client's needs and the data, formulate initial hypotheses or questions to guide your analysis. These should be focused on the client's objectives and should help you determine the most relevant analytical approaches to use.
4.  **Select analytical methods and tools:** Choose appropriate analytical methods and tools to address your hypotheses and answer the client's questions. This could include descriptive statistics, data visualization, predictive modeling, clustering, or other techniques depending on the problem and data.
5.  **Perform the analysis:** Conduct the analysis using your chosen methods and tools, carefully documenting your process and results. Be prepared to iterate and refine your analysis as needed based on new insights, data limitations, or feedback from the client.
6.  **Identify key insights and patterns:** Summarize the findings from your analysis, highlighting the most important insights, trends, and patterns that address the client's needs. Ensure that these findings are relevant, actionable, and supported by the data.
7.  **Design the data story:** Organize your insights and findings into a coherent narrative or analytical flow. This should guide the audience through the data, addressing the client's questions, and presenting the insights in a clear and logical manner. Use appropriate visualizations and clear language to communicate the findings effectively.
8.  **Iterate and refine the story:** Share your initial data story with the client and gather feedback. Be prepared to iterate and refine your story based on their input, making sure it aligns with their objectives and effectively communicates the insights.
9.  **Present and communicate the data story:** Present the final data story to the client, using clear visuals, concise language, and a compelling narrative to engage the audience and communicate the insights. Be prepared to answer questions, provide additional context, or offer recommendations based on your analysis.
10. **Measure success and follow up:** After presenting the data story, work with the client to measure the success of the project and determine any follow-up actions or next steps. This could include monitoring the impact of the insights on the client's business, refining the analysis based on new data, or exploring additional questions and opportunities.

## Key Performance Indicators

As a Business Intelligence Analyst, you will be trying to optimize the performance of different businesses.

* For this purpose, understanding and creating KPI's will be an important part of your work:

1.  **Step 1 – Identify your organization’s strategic objectives**
2.  **Step 2 – Define the criteria for success**
3.  **Step 3 - Develop key performance questions**
4.  **Step 4 - Collect supporting data**
5.  **Step 5 - Determine what to measure and how frequently you should measure**
6.  **Step 6 - Develop the KPIs.** 

As we will be aiming to certain goal in each of the KPI's, be sure to follow the **S.M.A.R.T** criteria.

* **Specific:** Your goals should be clear and well-defined. Instead of setting a vague objective like "improve data analysis," make it specific by stating "develop a new data visualization dashboard to track key performance indicators."
* **Measurable:** Establish criteria to measure your progress and determine when you have achieved your goal. This can involve quantifiable metrics or observable outcomes. For example, you could measure the success of your data visualization dashboard by tracking the increase in user engagement or the time saved in generating reports.
* **Achievable:** Ensure that your goals are realistic and attainable. Consider the resources, skills, and time available to you. It's essential to set challenging goals, but they should still be within reach. For instance, if you have limited programming experience, setting a goal to build a complex AI algorithm from scratch may be unrealistic.
* **Relevant:** Your goals should align with your overall objectives and be relevant to your role as a business intelligence professional. They should contribute to the growth and success of your organization. Prioritize goals that have a direct impact on key business areas, such as improving data accuracy, optimizing decision-making processes, or enhancing data security.
* **Time-bound:** Set a specific timeframe or deadline for achieving your goals. This helps create a sense of urgency and provides a clear target.

## UI and Visualizations in Analytics 

You will need to form the ability of making the data tell the business users a story.

Your job will be to find the patterns and [present the insights in a way that the stakeholders can understand](https://fossengineer.com/better-visualizations-data-analytics/) it and take actions/decide next steps upon it.


### Let's Prototype

UI [prototyping](https://fossengineer.com/better-visualizations-data-analytics/#the-importance-of-prototypes) is an essential part of any project, allowing designers to visualize and test user interfaces before development.

* We have a couple of options for [UI Prototypes](https://fossengineer.com/better-visualizations-data-analytics/#static-vs-dynamic-ui-prototypes):
    * Static prototyping involves creating static representations of screens or wireframes, providing a visual guide to the layout and structure of the user interface.
    * Dynamic prototyping goes a step further by adding interactivity and user flows, allowing stakeholders to experience the interface's behavior and functionality in a more realistic manner. 

Both static and dynamic prototyping help refine designs, gather feedback, and ensure the final user interface meets the project's requirements and user expectations.

### User Journey Map

A user journey map (also known as a **customer journey map**) is a diagram that visually illustrates the user flow through your site, starting with initial contact and ending with the desired outcome. 

It is **a visual representation of how a user interacts** with your product or service, and is used to identify areas of friction and user pain points in the customer experience. 

A user journey map shows the different steps a user takes to complete a task, including the emotions, motivations, and behaviors that occur along the way.

It also shows the various touchpoints and channels a user might use to interact with your business, such as website, mobile app, email, and physical stores.

By understanding the user journey, organizations can better optimize their customer experience and create more successful interactions.

{{< callout type="info" >}}
UI prototyping on projects: **static and dynamic prototyping**
{{< /callout >}}

> While working at D&A, you might be Working w/end users and PO on **prototypes**!

#### Tools for User Journeys

You're on the right track! Both Mermaid and other FOSS tools can be excellent choices for drawing user journey diagrams.

Here's a breakdown:

**Mermaid.js**

* **Pros:**
    * **Text-based syntax:** This is a huge advantage for FOSS as it allows you to define your diagram using simple, human-readable text. This makes it easy to version control your diagrams (e.g., with Git), collaborate, and even generate them programmatically.
    * **User Journey Diagram type:** Mermaid specifically supports a "user journey" diagram type, allowing you to define sections, tasks, scores (for positive/negative experiences), and actors. This is a perfect fit for your need.
    * **Integration:** Mermaid can be easily integrated into various platforms, including Markdown renderers (like GitHub, GitLab, many documentation tools), web applications, and even IDEs.
    * **Open Source:** It's a fantastic FOSS project with active development.

* **Cons:**
    * **Learning curve:** While the syntax is simple, there's still a brief learning curve to get comfortable with it.
    * **Visual complexity:** For extremely complex or highly customized visual diagrams, a dedicated drawing tool might offer more flexibility (though Mermaid is quite capable).

**Other FOSS Apps for Drawing Diagrams (including user journeys):**

While not specifically tailored *only* for user journeys, these FOSS tools are versatile enough to create them:

1.  **draw.io (diagrams.net):**
    * **Pros:** Highly popular, web-based (also desktop app), intuitive drag-and-drop interface, extensive library of shapes and templates, supports various diagram types including flowcharts which can be adapted for user journeys. It's truly FOSS.
    * **Cons:** Less structured for user journey specifics compared to Mermaid's dedicated syntax, so you'd be building it more manually.

2.  **[Wireflow](https://wireflow.co/):**
    * **Pros:** Simple, [free](https://app.wireflow.co/), and [MIT open-sourced](https://github.com/vanila-io/wireflow)  for building user flows, wireflows, and task flows. Good for quick, basic representations.
    * **Cons:** Less feature-rich than draw.io or more specialized tools.

3.  **Miro (Free tier available):**
    * **Pros:** While not fully FOSS, Miro offers a very generous free tier and is an excellent online collaborative whiteboard. It has templates for customer journey mapping and is highly visual and interactive.
    * **Cons:** Not fully open-source.

4.  **Appsmith (Open-source platform to build custom apps):**
    * **Pros:** Appsmith is an open-source low-code platform that allows you to *build* custom tools, including a customer journey mapping software. This gives you ultimate control and customization if you have the technical skills to set it up.
    * **Cons:** Requires more setup and development than simply using an existing diagramming tool.

5.  **Dittofeed:**
    * **Pros:** An open-source customer engagement platform that specifically focuses on "Customer Engagement Journeys." This might be more geared towards automated journeys within a marketing/CRM context rather than a simple diagramming tool, but it's worth exploring if your needs extend to execution.
    * **Cons:** Might be overkill if you just need to draw a static diagram.

6. **Excalidraw**: Simple, effective and in your browser!


[![Star History Chart](https://api.star-history.com/svg?repos=vanila-io/wireflow,excalidraw/excalidraw&,type=Date)](https://star-history.com/vanila-io/wireflow&excalidraw/excalidraw&Date)

**Recommendation:**

* **For highly structured, easily version-controlled, and programmatically generatable user journey diagrams, especially if you're comfortable with a text-based approach, **Mermaid.js** is an excellent FOSS choice.**
* **For a more visual, drag-and-drop experience, or if you need to create a wider variety of diagrams beyond just user journeys, **draw.io (diagrams.net)** is a superb FOSS option.**


---

## FAQ

### Software for BI's

* PowerBI
* Tableau
* Looker
* Microstrategy
* Grafana, Redash, Metabase,...

> You can check the updated trends at [Gartner](https://www.gartner.com/reviews/market/analytics-business-intelligence-platforms/ "Gartner BI Tools {rel='nofollow'}") 