---
title: "Web Apps with Python Explained"
date: 2025-03-28T05:20:21+01:00
draft: false
tags: ["Dev","Python"]
description: 'My favourite ways to build web apps with Python.'
url: 'web-apps-with-python'
---

## WebApps

**Understanding Web Programming**

Web programming is the foundation for creating dynamic and interactive websites and web applications.

It goes beyond simply designing a static webpage with HTML and CSS. 

Here's a more detailed look:

* **Core Components:**
    * **Web Content (HTML, CSS, JavaScript):**
        * **HTML (HyperText Markup Language):** Defines the structure and content of a webpage.
        * **CSS (Cascading Style Sheets):** Controls the visual presentation of the webpage (layout, colors, fonts).
        * **JavaScript:** Adds interactivity and dynamic behavior to the client-side of the website (e.g., animations, form validation, AJAX requests).
    * **Client-Side Scripting (JavaScript):**
        * Runs in the user's web browser.
        * Handles user interactions, modifies the webpage's appearance, and communicates with the server.
    * **Server-Side Scripting (Python, PHP, Node.js, etc.):**
        * Runs on the web server.
        * Processes user requests, interacts with databases, generates dynamic content, and manages server-side logic.
    * **Database Technology (MySQL, PostgreSQL, MongoDB, etc.):**
        * Stores and retrieves data for the web application.
        * Essential for applications that require persistent data storage (e.g., user accounts, product catalogs).
    * **Network Security:**
        * Protects the web application from security threats (e.g., SQL injection, cross-site scripting).
        * Involves implementing secure coding practices, authentication, and authorization.
* **The Difference Between Web Programming and General Programming:**
    * **Web Programming:** Focuses on creating applications that are accessed through a web browser. It requires understanding client-server architecture, HTTP protocols, and web technologies.
    * **General Programming:** Encompasses a broader range of programming tasks, including desktop applications, mobile apps, and system software. While web programming is a subset of programming, it has very specific constraints and needs.
    * **Interdisciplinary Knowledge:** Web programming requires a blend of skills, including front-end (client-side), back-end (server-side), and database management.

**Web Programming in Python**

Python is a versatile language that's widely used for web development. Here's how it's used:

1.  **CGI (Common Gateway Interface) Programming:**
    * This is an older method of creating dynamic web content.
    * Python scripts can be executed by a web server to generate HTML output.
    * CGI is less common today due to performance limitations. Every request starts a new process.
    * Example: a very simple script that outputs "Content-type: text/html" and then some html.

2.  **Python Web Frameworks:**
    * Frameworks provide a structured and efficient way to build web applications.
    * **Django:**
        * A high-level framework that follows the "batteries-included" philosophy.
        * Provides built-in features for handling databases, forms, and user authentication.
        * Suitable for complex web applications.
    * **Flask:**
        * A lightweight and flexible microframework.
        * Allows developers to choose the components they need.
        * Ideal for smaller projects and APIs.
    * **Other Frameworks:** There are other frameworks like Pyramid, and FastApi.
    * **Benefits of Frameworks:**
        * Faster development.
        * Code reusability.
        * Improved security.
        * Organized code structure.
    * **Asynchronous Web Frameworks:** FastApi, and others, take advantage of pythons async capabilities.

**In summary:**

Web programming is a complex field that requires a wide range of skills. Python, with its frameworks, simplifies the process of building web applications, making it a popular choice for web developers.

### Client Server

You're touching on some very important concepts in web development!

Let's clarify how client/server architecture and three-tier architecture relate to Server-Side Rendering (SSR) and Static Site Generation (SSG).

**Client/Server and Three-Tier Architecture**

* **Client/Server Architecture:**
    * This is the fundamental model of how the web works. Clients (like web browsers) request resources from servers.
    * The server processes those requests and sends back responses (like HTML, data, or files).
* **Three-Tier Architecture:**
    * This is a common way to organize the logic within a web application, especially on the server side. It helps to separate concerns, making the application more maintainable and scalable.
    * **Presentation Layer:** This is what the user sees (the front-end).
    * **Application Layer:** This handles the business logic (the back-end).
    * **Persistence Layer:** This manages the data (the database).

**How SSR and SSG Fit In**

Now, let's connect these architectures to SSR and SSG:

* **Server-Side Rendering (SSR):**
    * In SSR, the server plays a crucial role in generating the HTML for each page request.
    * When a client requests a page, the server:
        * Receives the request.
        * Fetches any necessary data from the persistence layer.
        * Executes the application layer logic.
        * Renders the complete HTML in the application layer.
        * Sends the fully rendered HTML to the client's browser (presentation layer).
    * SSR heavily relies on the server-side components of the client/server and three-tier architectures.
    * SSR is a process that occurs within the application layer of the 3 tier architecture.
* **Static Site Generation (SSG):**
    * In SSG, the HTML is generated at build time, not at runtime.
    * During the build process:
        * The application layer fetches data from the persistence layer.
        * The HTML for each page is pre-rendered.
        * The resulting static HTML files are stored on the server.
    * When a client requests a page, the server simply sends the pre-rendered HTML file.
    * SSG also utilizes the 3 tier architecture, but the application layer is mostly used during the build process. Once built, the web server is mainly used to serve static files.
    * SSG greatly reduces the workload of the server during runtime.

**Key Relationships**

* Both SSR and SSG operate within the client/server model.
* Both can utilize the three-tier architecture, but they do so in different ways and at different times.
* SSR involves dynamic HTML generation on the server for each request, while SSG involves pre-generating static HTML files at build time.

I hope this helps clarify the connections!

### JamStack?

It's important to understand the core principles of Jamstack to answer this accurately. Here's a breakdown:

**Jamstack Fundamentals:**

* **JavaScript, APIs, and Markup:**
    * Jamstack stands for JavaScript, APIs, and Markup.
    * It emphasizes pre-rendering markup (HTML) as much as possible.
    * Dynamic functionality is handled by JavaScript, and server-side processes are accessed through APIs.
* **Decoupling:**
    * A key aspect of Jamstack is decoupling the front-end from the back-end.
    * This means the front-end is typically static, and any dynamic data comes from external APIs.
* **Pre-rendering:**
    * Jamstack favors pre-rendering static HTML at build time (SSG). This results in extremely fast performance.

**Jamstack and SSR:**

* **Traditionally, Jamstack leans towards SSG:**
    * The core idea of Jamstack is to serve pre-built static files. This aligns with Static Site Generation (SSG).
    * Therefore, in its purest form, Jamstack is not SSR.
* **However, there are overlaps and evolving trends:**
    * Modern Jamstack practices can incorporate elements of SSR.
    * For example, some frameworks allow for hybrid approaches, where certain pages or sections are rendered on the server.
    * This is often done for improved SEO or to handle dynamic content that changes frequently.
    * Serverless functions:
        * Serverless functions allow for on demand server side rendering. This allows for some aspects of SSR to be incorporated into a Jamstack site.
* **Key takeaway:**
    * While the traditional Jamstack architecture emphasizes SSG, it's not strictly exclusive of SSR. Modern implementations may incorporate server-side rendering for specific purposes.

In essence, while Jamstack's core philosophy is centered around pre-built static sites, the landscape is evolving, and hybrid approaches that include elements of SSR are becoming more common.


## Web Apps with Python

Yes, that Python code would work as a basic CGI script, and you're correct, it's essentially Python without a web framework. Here's a breakdown:

**How it Works:**

1.  **Shebang Line (`#!C:\Python34\python.exe`):**
    * This line is crucial. It tells the web server where to find the Python interpreter. In this case, it's pointing to a specific Python 3.4 installation.
    * It's important to ensure that the path in the shebang line accurately reflects the location of your Python executable. If the path is wrong, the server won't be able to run the script.
2.  **`import cgi`:**
    * This line imports the `cgi` module, which provides tools for working with CGI scripts. While this simple example does not use many of the cgi modules functions, it is still good practice to include it.
3.  **`print('Content-type:text/html \n')`:**
    * This is the HTTP header that tells the browser that the response is HTML. The `\n` creates a blank line, which is required to separate the headers from the body of the response.
4.  **HTML Output:**
    * The `print('''...''')` block generates the HTML content of the web page. This includes the `<html>`, `<head>`, `<title>`, and `<body>` tags, as well as the "Hello World" heading.

**Key Points:**

* **CGI Basics:**
    * This code demonstrates the fundamental principles of CGI: receiving a request, executing a script, and returning an HTTP response.
* **No Web Framework:**
    * This is plain Python code. It doesn't use any web frameworks like Django or Flask. This means that you're handling all the HTTP request/response logic and HTML generation manually.
* **Simple Output:**
    * This script produces a very basic HTML page. In a more complex CGI application, you would use the `cgi` module to process form data, interact with databases, and generate dynamic content.
* **Limitations:**
    * CGI can be inefficient for high-traffic websites because a new Python process is started for each request.
    * CGI is also less secure then modern web frameworks.

**In essence:**

Yes, this code will function as a simple CGI script. It's a demonstration of how Python can be used to generate dynamic web content without relying on a web framework.


### Python WebApps Frameworks

You've hit on a crucial aspect of modern web development: frameworks. Let's break down what they are and then discuss the Python frameworks you listed.

**What are Web Frameworks?**

Imagine building a house. You *could* start by making your own bricks, mixing your own cement, and crafting every single nail. But that would take an enormous amount of time and effort. Instead, you'd likely buy pre-made bricks, cement, and nails.

Web frameworks are like those pre-made building materials for web applications. They are collections of pre-written code, libraries, and tools that provide a structure and foundation for building web applications.

**Key Benefits of Using Frameworks:**

* **Faster Development:** Frameworks handle many common tasks (like routing, database interaction, and form processing), allowing developers to focus on the unique features of their application.
* **Code Reusability:** Frameworks promote code reusability, reducing the amount of code you need to write.
* **Improved Security:** Frameworks often include built-in security features to protect against common vulnerabilities.
* **Maintainability:** Frameworks provide a consistent structure, making it easier to maintain and update the application.
* **Scalability:** Many frameworks are designed to handle large volumes of traffic and data.
* **Community Support:** Popular frameworks have large communities of developers who provide support and contribute to the framework's development.

**Python Web Frameworks:**

Here's a breakdown of the Python web frameworks you listed, with my thoughts on each:

* **Django:**
    * **What it is:** A high-level, full-stack framework that follows the "batteries-included" philosophy.
    * **My thoughts:** Django is excellent for large, complex web applications. It's robust, secure, and has a strong community. It's a great choice for projects that require rapid development and a lot of built-in functionality. The ORM (Object Relational Mapper) is very powerful. It can have a steeper learning curve than some of the microframeworks.
* **Flask:**
    * **What it is:** A lightweight, flexible microframework.
    * **My thoughts:** Flask is perfect for smaller projects, APIs, and applications where you want more control over the components you use. It's easy to learn and very extensible. It gives the developer a lot of freedom.
* **Web2py:**
    * **What it is:** A full-stack framework that emphasizes simplicity and ease of use.
    * **My thoughts:** Web2py is known for its built-in database, web-based IDE, and ease of deployment. It's a good choice for beginners and rapid prototyping.
* **TurboGears:**
    * **What it is:** A full-stack framework that aims to combine the best features of other frameworks.
    * **My thoughts:** TurboGears is a powerful framework, but it's less popular than Django and Flask.
* **Pyramid:**
    * **What it is:** A flexible, minimalist framework that allows developers to choose their components.
    * **My thoughts:** Pyramid is a good choice for developers who want a lot of control and flexibility. It's scalable and suitable for both small and large applications.
* **Bottle:**
    * **What it is:** A very small and simple microframework.
    * **My thoughts:** Bottle is ideal for creating small web applications and APIs. It's easy to learn and has minimal dependencies.
* **CherryPy:**
    * **What it is:** A minimalist, object-oriented framework.
    * **My thoughts:** CherryPy is known for its simplicity and ease of use. It's a good choice for developers who want to build web applications using object-oriented principles.

**Choosing a Framework:**

The best framework for you depends on your specific needs and preferences. Consider factors like:

* The size and complexity of your project.
* Your experience level.
* The features you need.
* The level of control you want.

In general, Django is a great choice for large, complex applications, while Flask is ideal for smaller projects and APIs.

[![Star History Chart](https://api.star-history.com/svg?repos=pallets/flask,django/django,tiangolo/fastapi,tornadoweb/tornado,bottlepy/bottle,cherrypy/cherrypy,sanic-org/sanic,Pylons/pyramid,falconry/falcon,hugapi/hug,pgjones/quart,streamlit/streamlit,flet-dev/flet,reflex-dev/reflex&type=Date)](https://star-history.com/#pallets/flask,django/django,tiangolo/fastapi,tornadoweb/tornado,bottlepy/bottle,cherrypy/cherrypy,sanic-org/sanic,Pylons/pyramid,falconry/falcon,hugapi/hug,pgjones/quart,streamlit/streamlit,flet-dev/flet,reflex-dev/reflex)



* **Reflex:** If you need to build a complex, interactive web application with real-time updates and a **rich UI**.
* **Flet:** If you want to create a **cross-platform** application that runs on both desktop and web from a single codebase.
* **Streamlit:** If you're building a **data-driven web app** or dashboard quickly and easily, especially for data science projects.
* **PySimpleGUI:** If you need to create a simple desktop utility or tool with a basic UI.
* **NiceGUI:** If you want to create a simple web UI quickly and easily, with a focus on data visualization and interactivity.

[![Star History Chart](https://api.star-history.com/svg?repos=pallets/flask,django/django,tiangolo/fastapi,tornadoweb/tornado,bottlepy/bottle,cherrypy/cherrypy,sanic-org/sanic,Pylons/pyramid,falconry/falcon,hugapi/hug,pgjones/quart,streamlit/streamlit,flet-dev/flet,reflex-dev/reflex&type=Date)](https://star-history.com/#pallets/flask&django/django&tiangolo/fastapi&tornadoweb/tornado&bottlepy/bottle&cherrypy/cherrypy&sanic-org/sanic&Pylons/pyramid&falconry/falcon&hugapi/hug&pgjones/quart&streamlit/streamlit&flet-dev/flet&reflex-dev/reflex&Date)


{{< details title="More Python Django 📌" closed="true" >}}

You've touched on the core strengths of Django. Let's dive deeper into its features and why they make it a popular choice for web development.

**Django's Core Philosophy and Strengths:**

* **"Batteries Included":**
    * This phrase perfectly captures Django's philosophy. It means that Django provides a comprehensive set of tools and libraries out of the box. You don't have to hunt for third-party packages for common tasks.
* **Convention Over Configuration:**
    * Django promotes a set of conventions for how web applications should be structured. This reduces the amount of configuration you need to do, allowing you to focus on writing code.
* **ORM (Object-Relational Mapper):**
    * Django's ORM is a powerful tool that allows you to interact with databases using Python code. You define your data models in Python, and Django handles the database interactions for you. This makes database operations much easier and more secure.

**Detailed Breakdown of Django's Features:**

* **DRY (Don't Repeat Yourself):**
    * This is a fundamental principle of good software development. Django enforces DRY by encouraging you to reuse code whenever possible. For example, you can define your data models once and reuse them throughout your application. Django's template system also promotes code reuse.
* **Fast:**
    * Django is designed for speed. Its efficient architecture and built-in caching mechanisms allow it to handle a large number of requests quickly.
* **Components:**
    * Django provides a wide range of built-in components, including:
        * **Authentication and Authorization:** Handles user logins, permissions, and security.
        * **URL Routing:** Maps URLs to Python functions (views).
        * **Template System:** Allows you to create dynamic HTML pages.
        * **Form Handling:** Simplifies the process of creating and processing forms.
        * **Admin Interface:** Provides a ready-to-use interface for managing your application's data.
* **Security:**
    * Django has built-in security features that help protect your application from common vulnerabilities, such as:
        * **SQL Injection Protection:** Django's ORM automatically escapes user input, preventing SQL injection attacks.
        * **Cross-Site Scripting (XSS) Protection:** Django's template system automatically escapes HTML, preventing XSS attacks.
        * **Cross-Site Request Forgery (CSRF) Protection:** Django provides built-in CSRF protection.
* **Scalability:**
    * Django is designed to be scalable. Its architecture allows you to easily scale your application to handle increasing traffic and data.
    * Django can work well with load balancers, and database scaling solutions.
* **Community:**
    * Django has a large and active community. This means that you can easily find help and resources when you need them.

**Use Cases:**

* E-commerce websites
* Content management systems (CMS)
* Social networking platforms
* Data analysis and visualization applications
* API development

You're right, understanding Django's architecture is crucial for effective development. Let's delve into it, comparing it to the traditional MVC pattern and highlighting the nuances of Django's MVT.

**MVC (Model-View-Controller) vs. MVT (Model-View-Template)**

* **MVC:**
    * **Model:** Represents the data and business logic.
    * **View:** Displays the data to the user.
    * **Controller:** Handles user input and updates the model and view.
* **MVT:**
    * **Model:** Manages data and interacts with the database.
    * **View:** Contains the business logic and determines what data to display.
    * **Template:** Handles the presentation of data to the user.

**Key Differences and Django's Approach:**

* **The "Controller" Equivalent:**
    * In Django, the "Controller" role is essentially handled by the framework itself, along with the URL dispatcher (urls.py). Django takes care of routing requests to the appropriate view functions.
* **Templates as Presentation:**
    * Django uses "Templates" instead of "Views" for the presentation layer. Templates are HTML files that can contain Django Template Language (DTL) tags for dynamic content.
* **Views as Logic:**
    * Django's "Views" contain the business logic that determines what data to retrieve from the model and how to process it. Views also select which template to render.

**Django's Workflow:**

1.  **Request:**
    * A user's browser sends an HTTP request to the Django server.
2.  **URL Dispatcher:**
    * Django's URL dispatcher (urls.py) examines the request URL and determines which view function should handle the request.
3.  **View Function:**
    * The view function is executed. It performs the necessary business logic, which may include:
        * Interacting with the model to retrieve or modify data.
        * Processing form data.
        * Performing other calculations.
4.  **Model Interaction:**
    * If the view needs to access data, it interacts with the model. The model handles database queries and data manipulation.
5.  **Template Rendering:**
    * The view selects a template and passes data to it.
    * The template engine (DTL) renders the template, combining the template's HTML with the data from the view.
6.  **Response:**
    * Django sends the rendered HTML as an HTTP response back to the user's browser.

**Key Components:**

* **Models (models.py):**
    * Define the structure of your data and provide an interface for interacting with the database.
* **Views (views.py):**
    * Contain the business logic of your application.
* **Templates (.html files):**
    * Handle the presentation of data to the user.
* **URLs (urls.py):**
    * Map URLs to view functions.
* **Settings (settings.py):**
    * Configure your Django application.

**In essence:**

Django's MVT architecture provides a clear separation of concerns, making it easier to develop and maintain web applications. While it differs slightly from traditional MVC, the underlying principles are similar. Django handles the "Controller" aspect, allowing you to focus on developing your models, views, and templates.



{{< /details >}}

{{< callout type="info" >}}
Im very aware that there are cool projects. Like [Pylinak](https://github.com/jrkerns/pylinac), which [this PhD](https://jalcocert.github.io/JAlcocerT/web-for-phd-researcher/) is improving.
{{< /callout >}}


**In essence:**

Django is a powerful and versatile framework that's well-suited for building complex web applications. Its "batteries-included" approach, security features, and scalability make it a popular choice for developers of all skill levels.

{{< details title="More Python Flask 📌" closed="true" >}}

You've hit on the key aspects of Flask. Let's expand on its characteristics and explore why it's a favorite among Python developers.

**Flask: The Microframework with Macro Capabilities**

* **"Microframework" Defined:**
    * The term "micro" doesn't mean Flask is limited in functionality. It means it provides the essential core features for web development without imposing strict conventions or including a lot of built-in components.
    * Flask focuses on providing the tools to build a web application, and lets the developer choose the tools they want to add.
* **Flexibility and Freedom:**
    * Flask's minimal core allows developers to customize their applications to their exact needs.
    * You can choose your own database, ORM, form library, and other components.
* **Extensibility:**
    * Flask's ecosystem is rich with extensions that provide additional functionality.
    * Flask allows the developer to easily add functionality as needed.
* **Ideal Use Cases:**
    * **APIs:** Flask is excellent for building RESTful APIs.
    * **Small to Medium-Sized Web Applications:** It's well-suited for projects where you want control and flexibility.
    * **Prototyping:** Flask's simplicity makes it ideal for quickly prototyping web applications.
    * **Microservices:** Flask is often used in microservice architectures.

**Diving Deeper into Flask's Features:**

* **WSGI Compliance:**
    * WSGI (Web Server Gateway Interface) is a standard interface between Python web applications and web servers. Flask's WSGI compliance ensures that it can work with various web servers (like Gunicorn and uWSGI).
* **Jinja2 Template Engine:**
    * Jinja2 is a powerful and flexible template engine that allows you to create dynamic HTML pages. It offers features like template inheritance, control structures, and filters.
* **Built-in Development Server and Debugger:**
    * Flask's built-in development server and debugger make it easy to test and debug your applications during development.
    * The debugger is very useful, and will give detailed error messages.
* **Integrated Unit Testing Support:**
    * Flask provides tools for writing unit tests, which are essential for ensuring the quality of your code.
* **RESTful Request Dispatching:**
    * Flask's routing system makes it easy to create RESTful APIs. You can define routes for different HTTP methods (GET, POST, PUT, DELETE).
* **Session Management:**
    * Flask provides built-in support for session management, allowing you to store user-specific data between requests.
* **Extensions:**
    * Flask's extensibility is one of its greatest strengths. There are many extensions available for tasks like database integration, form handling, authentication, and more.
* **Cloud Deployments:**
    * Flask applications can be deployed to various cloud platforms, including AWS, Google Cloud, and Heroku.
* **MVT Architecture:**
    * While Flask follows the MVT architectural pattern, it's less strictly enforced than in Django. Developers have more freedom in how they structure their applications.
    * The Model is the section that deals with data, and data management.
    * The View contains the business logic.
    * The Template is the html that is rendered to the user.
* **Routing:**
    * Flask uses decorators to define routes, which map URLs to view functions. This makes it easy to define the structure of your application.

**Key Differences from Django:**

* **Size and Scope:** Flask is a microframework, while Django is a full-stack framework.
* **Convention vs. Configuration:** Django emphasizes convention over configuration, while Flask gives developers more control over configuration.
* **Built-in Features:** Django provides many built-in features, while Flask relies on extensions for additional functionality.


{{< /details >}}

**In summary:**

Flask is a versatile and **powerful microframework** that's ideal for developers who want flexibility, control, and a lightweight approach to web development.

Its extensibility and simplicity make it a popular choice for various web development tasks.



### Streamlit

{{< details title="Why I love Streamlit for Quick UI's 📌" closed="true" >}}

Streamlit uses a combination of front-end technologies to create its user interface, primarily leveraging React.js, a popular JavaScript library for building user interfaces.

- **React.js**: Used for building dynamic and responsive user interfaces.
- **WebSockets**: Maintains a real-time connection between the client and server for instant updates.
- **Tornado**: A Python framework that handles long-lived connections and supports the server's real-time operations.
- **Custom Components**: Allows integration of additional web technologies like JavaScript, enhancing functionality.
- **Bootstrap**: Provides styling and theming capabilities to customize the appearance of applications (CSS Framework).
- **Widgets and Markdown**: Supports a variety of interactive widgets and Markdown for easy UI development.

This setup enables you to **quickly create interactive web apps using Python**, without needing extensive frontend development skills.

{{< /details >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/streamlit-is-cool/" title="Chat with Data" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="Other LangChain use cases" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}



{{< details title="PyGWalker: Turn your pandas dataframe into an interactive UI for visual analysis 📌" closed="true" >}}

* https://kanaries.net/pygwalker
* https://github.com/Kanaries/pygwalker

* https://docs.kanaries.net/pygwalker/use-pygwalker-with-streamlit
* https://github.com/Kanaries/pygwalker-in-streamlit
* https://docs.kanaries.net/pygwalker/use-pygwalker-with-streamlit.en
  * https://github.com/Kanaries/pygwalker?tab=readme-ov-file#tested-environments

> It can be integrated with Streamlit!

{{< /details >}}

> See a sample notebook: https://colab.research.google.com/drive/171QUQeq-uTLgSj1u-P9DQig7Md1kpXQ2

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Streamlit-AIssistant/blob/main/Z_Tests/Crypto/btc_explore.ipynb)


[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/171QUQeq-uTLgSj1u-P9DQig7Md1kpXQ2)

{{< details title="PyGWalker with Streamlit Render | Example 📌" closed="true" >}}

Following the docs: https://docs.kanaries.net/pygwalker/use-pygwalker-with-streamlit

```py
from pygwalker.api.streamlit import StreamlitRenderer


import streamlit as st
import pandas as pd
import pygwalker as pyg
import requests
from io import StringIO

# GitHub raw URL of your CSV file
csv_url = "https://raw.githubusercontent.com/JAlcocerT/R_Stocks/main/Z_Sample_Data/data_sp500.csv"

@st.cache_data
def load_data(url):
    """Loads CSV data from a URL and returns a Pandas DataFrame."""
    try:
        response = requests.get(url)
        response.raise_for_status()
        csv_content = StringIO(response.content.decode('utf-8'))
        df = pd.read_csv(csv_content)
        return df
    except requests.exceptions.RequestException as e:
        st.error(f"Error fetching URL: {e}")
        return None
    except pd.errors.ParserError as e:
        st.error(f"Error parsing CSV: {e}")
        return None
    except Exception as e:
        st.error(f"An unexpected error occurred: {e}")
        return None

# Load the data
df = load_data(csv_url)

if df is not None:
    st.title("S&P 500 Historical Data Exploration")

    # Display the DataFrame
    st.write("### Raw Data")
    st.dataframe(df)

    # Add PyGWalker
    st.write("### Interactive Exploration with PyGWalker")
    pyg_app = StreamlitRenderer(df)
    
    pyg_app.explorer()


    # Add some descriptive text
    st.write("Data source: [Your GitHub Repository](https://github.com/JAlcocerT/R_Stocks/blob/main/Z_Sample_Data/data_sp500.csv)")
else:
    st.write("Data loading failed. Please check the URL or your internet connection.")
```

{{< /details >}}


I really enjoy using **PyGWalker together with Streamlit**!

And there is more...

**Graphic Walker** is a different open-source alternative to Tableau.

It allows data scientists to analyze data and visualize patterns with simple drag-and-drop / natural language query operations.

It is extremely easy to embed in your apps just **as a React component** 🎉!

The original purpose of graphic-walker is **not to be a heavy BI platform**, but a easy to embed, lite, plugin.


* https://github.com/Kanaries/graphic-walker
  * https://docs.kanaries.net/graphic-walker

> Apache v2 | An open source alternative to Tableau. **Embeddable visual analytic**

You can try it here: https://graphic-walker.kanaries.net/ with some csv:

![Graphic Walker UI](/blog_img/dev/graphic-walker.png)


It allows you to import/export an already configured dashboard as `.json`!

![Meme - Fantastic](/blog_img/memes/bertin-osborne-incredible.gif)

```sh
npm i --save @kanaries/graphic-walker
```





1. Cool Streamlit Apps I found: https://github.com/AIAnytime/Document-Buddy-App

> Built using Open Source Stack (Llama 3.2 Model, BGE Embeddings, and Qdrant running locally within a Docker Container)

2. 


### Flask

One of the most popular ways to create **python web apps is with Flask**.

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/" title="Tinkering with Flask" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Flask Apps with VPS and HTTPs" >}}
{{< /cards >}}

<!-- ![Flask Https NginX Setup](/blog_img/apps/flask-nginx-duckdns.png) -->


### Reflex


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/tinkering-with-reflex/" title="Tinkering with Reflex" image="/blog_img/GenAI/dbchat/langchain-AI.jpeg" subtitle="Python Web apps with Reflex" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}


### Flet



{{< details title="More about Flet 📌" closed="true" >}}


{{< /details >}}

## Python DASH

* https://jalcocert.github.io/JAlcocerT/improving-ui-python-dash-apps/

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/trip-planner-with-weather/" title="Python Web apps with DASH" image="/blog_img/apps/TripPlanner/TripPlanner.JPG" subtitle="Python Trip Planner with DASh" >}}
  {{< card link="https://github.com/JAlcocerT/Py_Trip_Planner" title="Data Chat Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code for DB Chat with Langchain" >}}
{{< /cards >}}



## Shiny with R


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/R-Stocks/" title="Tinkering with R Shiny" image="https://raw.githubusercontent.com/JAlcocerT/R_Stocks/main/Z_Sample_Data/FlexDash-BoomBurst.png" subtitle="Python is now Shiny Compatible!" >}}
  {{< card link="https://github.com/JAlcocerT/R-Stocks" title="RStocks Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of the RStock Shiny Web app" >}}
{{< /cards >}}

> You can also see the flexdashboard: https://jalcocert.github.io/JAlcocerT/R-Stocks/


---

## Conclusions

For some PoC, Id stay with streamlit as my go to.


### AI Building Web Apps

1. https://github.com/stackblitz-labs/bolt.diy

> MIT | Prompt, run, edit, and deploy full-stack web applications using any LLM you want! 

### Desktop Apps with Python

When it comes to building desktop applications with Python, there are several frameworks available, each with its own strengths and weaknesses. Here's a breakdown of some of the most popular options:

**Key Python GUI Frameworks:**

* **Tkinter:**
    * This is Python's standard GUI toolkit.
    * It's relatively easy to learn and is included with most Python installations, making it a good choice for beginners.
    * However, its appearance can be somewhat dated.
    * Good for simple applications.


{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/trip-planner-with-weather/" title="Python Web apps with DASH" image="/blog_img/apps/TripPlanner/TripPlanner.JPG" subtitle="Python Trip Planner with DASh" >}}
  {{< card link="https://github.com/JAlcocerT/YT-Video-Edition" title="Youtube Video Edition" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Quick Vlogs with ffmpeg and Tkinter" >}}
{{< /cards >}}

* **PyQt/PySide:**
    * These frameworks provide Python bindings for the Qt library, a powerful cross-platform GUI toolkit.
    * They offer a wide range of widgets and customization options, allowing you to create sophisticated and visually appealing applications.
    * PyQt has licensing considerations, while PySide is LGPL-licensed.
    * Excellent for complex applications.
* **Kivy:**
    * Kivy is designed for creating cross-platform applications with a focus on touch-enabled interfaces.
    * It's suitable for developing applications that can run on desktop and mobile platforms.
    * Good for multi-touch applications.
* **wxPython:**
    * wxPython provides Python bindings for the wxWidgets library, which allows you to create native-looking applications on various platforms.
    * It offers a good balance of features and performance.
    * Good for applications that need to have a native operating system look and feel.
* **Flet:**
    * As mentioned before, Flet is a framework that enables you to build cross platform applications, including desktop applications. It is based on flutter, and allows for very quick UI development.

https://pypi.org/project/PyAutoGUI/

**Key Considerations:**

* **Cross-platform compatibility:** If you need your application to run on multiple operating systems, choose a framework that supports cross-platform development.
* **Complexity:** Consider the complexity of your application and choose a framework that matches your needs. Tkinter is suitable for simple applications, while PyQt/PySide and wxPython are better for more complex ones.
* **Appearance:** If you want your application to have a modern and visually appealing interface, PyQt/PySide or Kivy might be good choices.
* **Licensing:** Be aware of the licensing terms of the framework you choose, especially if you plan to distribute your application commercially.