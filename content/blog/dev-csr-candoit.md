---
title: "Client Side Rendering can do that"
date: 2025-09-04T06:20:21+01:00
draft: false
tags: ["Dev","CSR","Web","MRR","Static French Amortization Calculator"]
description: 'Client Side Rendering can do that'
url: 'csr-and-js'
---


**TL;DR**

Playing around with what [Client Side Rendering](#whats-csr) can do.

+++ A quick [MRR calculator](#mrr-calculator)

+++ A quick [Real Estate component](#french-amortization) that you dont have to host via streamlit.

**Intro**

CSR can do that.

From that SPA that surprise you and generate your pdf invoices with VUE.

To that CSR + API Setup

Or the CSR + WebSockets


## CSR Examples


{{< cards cols="2" >}}
  {{< card link="https://gitlab.com/fossengineer1/libreportfolio/-/blob/main/src/components/calculators/FIREAdvancedCalculator.astro?ref_type=heads" title="FireCalculator | Astro Component ↗" >}}
  {{< card link="" title=" ↗" >}}
{{< /cards >}}

### MRR Calculator

A simple MRR Calculator inside an astro component, [like this](https://gitlab.com/fossengineer1/libreportfolio/-/blob/main/src/components/calculators/MRRCalculator.astro?ref_type=heads).

It can also do more complex stuff, like [this FIRE calculators](https://gitlab.com/fossengineer1/libreportfolio/-/blob/main/src/components/calculators/FIREAdvancedCalculator.astro?ref_type=heads) with kind of loops.

### French Amortization

I covered the guts of what French amortization is [here](https://jalcocert.github.io/JAlcocerT/python-real-estate-mortage-calculator/#french-amortization-101).

And before, I was using Python back-end logic to provide the results via a Streamlit webapp.

But hey, for this kind of things you dont need to consume server resources!

It can be done on the client side with another astro component, that executes JS logic on the client side.

---

## Conclusions

The combination of CSR, Cloudflare Workers, PocketBase, and `HttpOnly` cookies is a powerful and valid approach, especially for building highly interactive single-page applications.

> However, it's just one piece of a broader puzzle.

The choice of rendering strategy (CSR vs. SSR vs. others) depends on your application's specific needs, particularly concerning **SEO**, **initial load time**, and **user interactivity**.

The authentication method needs to be tailored to the rendering strategy you choose.

**Web Rendering Strategies and Authentication Approaches**

| Rendering Strategy | Description & Use Case | Authentication Flow | Pros & Cons |
| :--- | :--- | :--- | :--- |
| **Client-Side Rendering (CSR)** | The browser loads a minimal HTML file and then uses JavaScript to fetch data and build the entire page. \<br\> **Best for:** Dashboards, authenticated portals, social media feeds, and highly interactive applications where SEO is less critical. | **Cookie-based (as discussed):** The user logs in, the server sets an `HttpOnly` cookie. On subsequent API calls, the browser automatically sends the cookie. The backend validates the cookie. \<br\> **Token-based (less secure):** The server returns a JWT token, which is stored in browser storage (e.g., `localStorage`). JavaScript attaches this token to every request. | **Pros:** Excellent for rich, application-like user experiences. Fast subsequent page loads. Reduces server load. \<br\> **Cons:** Poor SEO without dynamic rendering. Slower initial load time. Requires explicit CSRF protection. Token-based methods are vulnerable to XSS. |
| **Server-Side Rendering (SSR)** | The server generates the full HTML for each page on every request and sends it to the browser. The browser displays it immediately. \<br\> **Best for:** E-commerce sites, news websites, blogs, and any public-facing site where SEO and fast initial load are crucial. | The user logs in, the server sets an `HttpOnly` cookie. On subsequent page requests, the server-side code (e.g., in a Next.js `getServerSideProps` function) reads the cookie, authenticates the user, fetches user-specific data, and then renders the HTML with that data included. | **Pros:** Excellent SEO. Very fast Time to First Byte (TTFB). Secure authentication with `HttpOnly` cookies. \<br\> **Cons:** Increased server load, especially under high traffic. Less "app-like" experience as every navigation requires a full page refresh (though this can be mitigated with hybrid approaches). |
| **Static Site Generation (SSG)** | The entire website is pre-rendered into static HTML, CSS, and JS files at build time. There is no server-side rendering on-demand. \<br\> **Best for:** Blogs, documentation sites, portfolios, and marketing pages where content changes infrequently. | **Hybrid (CSR + SSG):** The authentication happens on the client-side *after* the static page has loaded. A blank "shell" is served statically, and then client-side JavaScript fetches user data via an API (using a cookie or token) and populates the page. | **Pros:** Extremely fast and secure. Can be served from a CDN, which is highly scalable and cost-effective. \<br\> **Cons:** Not suitable for dynamic, real-time content. Authentication and user-specific content require a hybrid approach, which re-introduces some of the CSR drawbacks (e.g., slower initial personalized content load). |
| **Hybrid Rendering** | A modern approach that combines SSR, CSR, and SSG on a per-page or per-component basis. \<br\> **Best for:** Complex applications with both public-facing marketing pages (SSG), dynamic public pages (SSR), and private authenticated dashboards (CSR). Frameworks like Next.js and Remix excel at this. | Authentication can be handled in a few ways: \<br\> 1. **SSR for authenticated pages:** A logged-in user's profile page is SSR'd on every visit, ensuring fresh, personalized data. \<br\> 2. **CSR for interactive components:** A dashboard page might be SSR'd with a basic layout, but the interactive charts and graphs within it are rendered with client-side JavaScript after the initial load. | **Pros:** Best of all worlds. Optimal performance, SEO, and user experience. Highly flexible. \<br\> **Cons:** Increased complexity and learning curve. Requires careful thought about which rendering strategy is best for each part of the application. |

### Quick Auth Stack with CSR

All of those CSR approaches (SPA, Jamstack, and CSR + WS) can handle proper authentication via HTTP cookies using a Cloudflare Worker and PocketBase as a backend. 

The key is how you configure the flow and secure the cookies.

**How It Works: The Authentication Flow**

The general principle for all these setups is that the client-side JavaScript never directly touches the sensitive authentication token.

Instead, the browser automatically manages the cookie for you, which is the primary benefit of using `HttpOnly` cookies.

1.  **User logs in**: The user sends their credentials (username/password) from the front-end application to your PocketBase backend via a standard HTTP POST request.
2.  **PocketBase authenticates**: PocketBase verifies the credentials and, upon success, generates a session token. Crucially, it sets this token in an `HttpOnly` cookie in the response header.
3.  **Cloudflare Worker's Role**: The Cloudflare Worker acts as a reverse proxy or middleware. It can inspect the incoming request headers, including the cookie. It can then either allow the request to proceed to PocketBase or deny it if the cookie is invalid or missing. This provides a crucial layer of security and access control at the edge.
4.  **Subsequent requests**: On all subsequent authenticated requests from the browser to your API, the browser automatically includes the `HttpOnly` cookie. The Cloudflare Worker intercepts this, validates the cookie, and then forwards the request to the PocketBase backend if the user is authorized. The client-side JavaScript doesn't have access to the cookie, preventing XSS attacks from stealing the token.

**Specifics for Each Category**

* **SPA**: This is a classic and highly secure setup. The SPA's JavaScript code makes all API calls, and the browser handles attaching the `HttpOnly` cookie to those requests automatically. Your Cloudflare Worker and PocketBase backend work together seamlessly to validate the user session with each API call.

* **CSR + API (Jamstack)**: This is the same principle as the SPA. A Jamstack site is essentially an SPA that is pre-rendered for performance. The authentication flow begins on the client-side when the user logs in, and all subsequent API calls for dynamic content (e.g., user-specific data) are authenticated via the `HttpOnly` cookie, just like in a regular SPA.

* **CSR + WS**: WebSocket authentication is slightly different but still works with HTTP cookies. A WebSocket connection begins with an initial HTTP handshake. During this handshake, the browser automatically sends the `HttpOnly` cookies for the domain. Your Cloudflare Worker can check the cookie in the HTTP handshake request before allowing the WebSocket connection to be established. Once the connection is open, the session is established and secure. 
    * This is a common and robust pattern for real-time applications.

**Key Security Benefits**

Using this setup provides several significant security advantages:

* **Protection against XSS (Cross-Site Scripting)**: Because the cookie is set to `HttpOnly`, it cannot be accessed by client-side JavaScript. This prevents an attacker who has injected malicious script into your page from stealing a user's session cookie.
* **Centralized Authorization**: By handling authentication and authorization logic in the Cloudflare Worker, you centralize a critical security layer. This means you don't have to implement the same authentication logic in every front-end component, making your system more maintainable and less prone to errors.
* **Statelessness**: The PocketBase backend and Cloudflare Worker can be configured to be largely stateless, as the necessary session data is contained within the signed token in the cookie. This makes your system highly scalable. 


{{< details title="Using Ollama with RAGs 📌" closed="true" >}}

This is generally considered a good and secure method for web authentication. 

It's a robust pattern that leverages several security best practices. 

However, it's not a silver bullet and needs to be implemented correctly to be truly secure.

**How It Protects Against Common Attacks**

The proposed architecture helps mitigate several of the most common web vulnerabilities:

* **Cross-Site Scripting (XSS)**: By setting the `HttpOnly` flag on the cookie, you prevent client-side JavaScript from accessing it. This is a critical defense against XSS. Even if an attacker manages to inject malicious script into your page, they cannot steal the user's session cookie and hijack their account. This is the primary reason why storing tokens in local storage is considered less secure.
* **Cross-Site Request Forgery (CSRF)**: The `HttpOnly` cookie alone doesn't prevent CSRF. CSRF works by tricking a logged-in user's browser into sending an authenticated request to your site without their knowledge. The browser will automatically attach the `HttpOnly` cookie to this malicious request, making it appear legitimate. To counter this, you must implement a separate CSRF defense. The most common method is the **Synchronizer Token Pattern**. This involves a randomly generated token that is sent to the client (e.g., in a hidden form field or a request header) and is validated by the server (your Cloudflare Worker) on every state-changing request (like POST, PUT, DELETE). 
* **Man-in-the-Middle (MITM) Attacks**: By using HTTPS (which is the default for Cloudflare Workers), you ensure the cookie is always transmitted over an encrypted connection. This prevents attackers from intercepting and stealing the cookie as it travels between the user's browser and your backend. The **`Secure`** cookie flag, which forces this behavior, is another critical component.

Key Considerations for a Secure Implementation

To make this architecture as secure as possible, you must ensure all components are configured correctly:

1.  **Use `HttpOnly` and `Secure` Flags**: Your PocketBase backend must be configured to set both of these flags on the authentication cookie. Without them, the entire system is vulnerable.
2.  **Implement CSRF Protection**: While the `HttpOnly` cookie protects against XSS, you must add an explicit CSRF defense. You can use a double-submit cookie pattern or a synchronizer token pattern, with the validation logic running in your Cloudflare Worker.
3.  **Validate All Requests at the Edge**: The Cloudflare Worker's role is not just to proxy requests. It should be the first line of defense, validating the incoming cookie and enforcing rate limits, CORS policies, and other security measures before a request ever reaches your PocketBase backend.
4.  **Properly Configure Your Backend**: Ensure your PocketBase instance is configured to only accept requests from your Cloudflare Worker and not directly from the public internet. This prevents attackers from bypassing your edge security layer.


{{< /details >}}


---


## FAQ

### Whats CSR?

Client-Side Rendering (CSR) with JavaScript is a powerful approach for building modern, highly interactive web applications. 

It allows the user's browser to handle the bulk of the rendering, leading to a dynamic user experience that feels more like a desktop application than a traditional website.

### Key Advantages of CSR

The primary benefit of using JavaScript for CSR is the ability to create **Single-Page Applications (SPAs)**.

In a SPA, the entire application loads once, and subsequent interactions, like navigating to a new page or filtering content, happen without a full page refresh.

This is achieved by dynamically updating the HTML content (the DOM) using JavaScript, which provides a fast and seamless user experience. 

This approach is highly beneficial for applications where content changes frequently and in response to user input. Key achievements with CSR include:

* **Real-Time Interactions**: Since rendering happens on the client, you can create applications that respond instantly to user actions, such as form validation, instant search filters, and dynamic charts. Think of a dashboard that updates live data without reloading the entire page.

* **Reduced Server Load**: The server's role is minimized to providing the initial HTML shell, JavaScript, and CSS files, as well as serving data through APIs. The client-side application then handles all subsequent rendering and logic. This can significantly reduce server costs and improve scalability for applications with high traffic.

* **Rich User Interfaces**: JavaScript frameworks and libraries like React, Vue, and Angular are built for CSR. They make it easy to develop complex, component-based UIs with features like drag-and-drop functionality, complex animations, and advanced data visualizations using libraries like **D3.js**.

* **Offline Functionality**: By using **Progressive Web Apps (PWAs)** and service workers, you can leverage CSR to create web applications that can work offline. The application's core files and even some data can be cached in the browser, allowing users to access and interact with the app even without an internet connection.


### Advanced Applications and Techniques

**Beyond standard SPAs**, CSR can be used for more innovative and complex applications.

### Data Visualization and Interactive Dashboards

CSR is perfect for data-heavy applications. A finance dashboard, for example, can fetch new stock prices via an API and instantly update a chart without refreshing the page.

This is far more efficient and interactive than having the server render a new page for every data point change.

### Collaborative and Real-Time Editors

Applications like Google Docs or Figma use CSR to enable real-time collaboration.

With technologies like **WebSockets**, multiple users' changes can be sent to the server and instantly broadcast to all other clients. 

The JavaScript on each client then updates the UI in real-time, allowing users to see each other's cursor movements and edits as they happen.

### Gaming and Entertainment

Web-based games, especially those built with frameworks like Phaser or libraries like Three.js for 3D graphics, are heavily reliant on CSR.

The entire game logic, from physics and animations to user input, is handled by JavaScript in the browser, providing a high-performance and interactive experience.